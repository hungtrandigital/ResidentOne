# System Architecture Decisions Summary

**Date:** 2025-12-12  
**Last Updated:** 2025-12-12  
**Status:** Finalized Decisions

## Purpose

This document summarizes all finalized architecture and technical decisions made during the preparation phase. These decisions form the foundation for detailed architecture design and implementation.

---

## 1. Service Architecture

### 1.1 Service List (8 Services)

1. **User Service**
   - Responsibility: User management, authentication, SSO, central database management
   - Features: Registration, login, profile management, central DB operations, sync to building DBs
   - Database: Central PostgreSQL database

2. **Building Service**
   - Responsibility: Building management, tenant configuration, branding
   - Features: Building CRUD, tenant settings, white-label configuration
   - Database: Building-specific PostgreSQL database

3. **Marketplace Service**
   - Responsibility: Product listings, search, discovery, categorization
   - Features: Product CRUD, search, categories, seller tools
   - Database: Building-specific PostgreSQL database

4. **Communication Service**
   - Responsibility: Notifications, announcements, alerts
   - Features: Push notifications, email notifications, announcements, polling
   - Note: Chat functionality deferred (users use Zalo for now)
   - Database: Building-specific PostgreSQL database

5. **Verification Service**
   - Responsibility: User verification, trust & safety, scam blocking
   - Features: Document verification, verification status, system-wide scam blocking, reputation management
   - Database: Central PostgreSQL database (verification status), Building-specific (building verification data)

6. **Content Service**
   - Responsibility: Media storage, file management
   - Features: Image upload, file storage, CDN (future)
   - Storage: Local storage on VPS (Phase 1), migrate to S3-compatible later

7. **Analytics Service**
   - Responsibility: Aggregate analytics, reporting
   - Features: Aggregate metrics from all services, generate reports, dashboards
   - Database: Building-specific PostgreSQL database (aggregated data)

8. **Zalo Automation Service** (Future)
   - Responsibility: Content automation from Zalo groups
   - Features: Content extraction, user matching, listing creation
   - Status: Future feature, not in Phase 1

### 1.2 Service Communication

- **Primary**: REST API for synchronous communication
- **Secondary**: Redis Streams for asynchronous communication (notifications, analytics events, background jobs)
- **Future**: gRPC optional for high-performance service-to-service calls

### 1.3 Service Boundaries

- **Verification Service**: Separate service (critical for trust & safety, needs independent scaling)
- **Communication Service**: Merged Notification + Messaging (simpler for MVP, chat deferred)
- **Analytics**: Each service tracks own metrics, Analytics Service aggregates and reports

---

## 2. Database Architecture

### 2.1 Database Strategy

**Approach: Database per Building + Central Database**

- **Central Database**: 
  - User identity (phone, email, basic profile)
  - Verification status (verified/unverified, scam status)
  - Platform-wide reputation score
  - List of buildings user is member of
  - Managed by: User Service

- **Building Databases**:
  - Each building has separate PostgreSQL database
  - Contains building-specific data:
    - Building-specific user data (role, unit number, preferences)
    - Listings, messages, transactions
    - Resident data, announcements, polls
    - All building-specific operations

### 2.2 Sync Strategy

- **User Verified in Central** → Sync verification status + scam status to building databases
- **Sync Mechanism**: Real-time or near-real-time
- **User Profile**: Sync basic profile when user joins building, update on changes
- **Scam Blocking**: If user blocked in central → blocked in all building databases

### 2.3 Rationale

- **Easier Maintenance**: Each building database is independent, easier to manage
- **Better Isolation**: Complete data isolation between buildings
- **Scalability**: Can scale individual building databases as needed
- **Data Linking**: Can create separate project for data linking/analysis later

---

## 3. Technology Stack

### 3.1 Backend

- **Framework**: Nest.js
  - Rationale: Good structure for microservices, TypeScript support, module system, maintainability
- **Language**: TypeScript
- **API Style**: RESTful API

### 3.2 Database

- **Primary Database**: PostgreSQL
  - Central database: User accounts, verification
  - Building databases: Building-specific data (one per building)
- **Cache**: Redis
  - Session management
  - Frequently accessed data
  - Message queue (Redis Streams)
- **Search**: PostgreSQL Full-Text Search
  - Rationale: Simple, no additional service needed, sufficient for MVP
  - Future: Can migrate to Elasticsearch if needed

### 3.3 Infrastructure

- **VPS Provider**: DigitalOcean
  - Rationale: Easy to use, good documentation, pricing clear, Singapore data center (close to Vietnam)
- **Container Orchestration**: Docker Compose (Phase 1)
  - Rationale: Simple, sufficient for MVP, easy to manage on VPS
  - Future: Migrate to Kubernetes when scaling to cloud (Phase 3)
- **API Gateway**: Nginx
  - Rationale: Simple, reliable, reverse proxy and load balancing
- **File Storage**: Local storage on VPS (Phase 1)
  - Rationale: Simple, no additional cost, sufficient for MVP
  - Future: Migrate to S3-compatible (DigitalOcean Spaces) when scaling

### 3.4 Third-Party Integrations

- **SMS Provider**: GAPIT
  - Rationale: Local provider, good pricing, good support in Vietnam
  - Design: Configurable API service (easy to switch providers by changing token and URL)
- **Email Provider**: SendGrid
  - Rationale: Reliable, good free tier, easy integration, good analytics
- **Monitoring**: Prometheus + Grafana
  - Rationale: Free, open-source, sufficient for MVP, can self-host on VPS
- **Backup**: DigitalOcean Spaces
  - Frequency: Daily
  - Retention: 30 days
  - RTO: <24 hours
  - RPO: <24 hours

---

## 4. Security Architecture

### 4.1 Authentication & Authorization

- **Authentication**: JWT tokens with refresh tokens
- **Authorization**: Role-based access control (RBAC)
- **Building-Level Authorization**: Users can only access data of their building(s)

### 4.2 Secrets Management

- **Approach**: Environment variables + Docker secrets (Phase 1)
  - Rationale: Simple, sufficient for MVP
  - Future: Can migrate to Vault or AWS Secrets Manager

### 4.3 Network Security

- **Firewall**: Only expose necessary ports on VPS
- **HTTPS/TLS**: All communications encrypted
- **SSL Certificates**: Let's Encrypt (free, auto-renew)

---

## 5. Performance Targets

### 5.1 API Performance

- **API Response Time**: <200ms p95, <500ms p99
- **Database Query**: <100ms for most queries, <500ms for complex queries
- **Search Response Time**: <3s (as per backlog)

### 5.2 Page Load Performance

- **First Load**: <2s
- **Subsequent Loads**: <1s (with caching)

---

## 6. Scale Projections

### 6.1 Market Context (Vietnam)

**Overall Market:**
- **Total Buildings**: ~3,000 tòa nhà chung cư nationwide (primarily Hà Nội and HCM)
- **Hà Nội**: 643 tòa (2016) → 919 tòa (2019) - growing trend
- **HCM**: Similar concentration to Hà Nội
- **Housing Area**: 26.6 m²/person average, 21.1 m²/person for apartments

**Market Activity:**
- **H1 2024**: 14,400 apartment transactions + 6,200 land transactions = 20,600 total
- **Growth**: 3x increase vs. H1 2023
- **Supply**: 78,600 units expected in H2 2025 (primarily Hà Nội and HCM)
- **Price Trend**: High-end (Grade A+) supply increasing, pushing buyers to adjacent areas

### 6.2 Building Scale

**Average Units per Building:**
- **Range**: 800-1,200 căn hộ/building (based on market research and large-scale projects)
- **Average**: 1,000 căn hộ/building
- **Rationale**: Large-scale projects (Vinhomes, Masteri, etc.) typically have 800-1,200 units per building complex

**User Calculation:**
- **Occupancy Rate**: 85% (estimate)
- **People per Unit**: 2.5 người/căn (based on Vietnamese household size)
- **Calculation**: 1,000 căn hộ × 0.85 occupancy × 2.5 người/căn = **~2,125 potential users/building**

### 6.2 Platform Scale (Year 1)

- **Buildings**: 50-100 buildings
- **Total Users**: ~106,250 - 212,500 users
- **Peak Concurrent Users**: 20-30% of total users
  - 1 building: ~425-637 concurrent users
  - 10 buildings: ~4,250-6,375 concurrent users
  - 50 buildings: ~21,250-31,875 concurrent users

### 6.3 Activity Projections

- **Listings per Building**: 50-100 active listings (as per backlog)
- **Notifications per Building**: ~2,000/day per building
- **Messages**: Users use Zalo for chat (deferred in platform)

---

## 7. Development Approach

### 7.1 MVP Strategy

- **Focus**: 1-3-10 buildings first for key learnings
- **Validation**: User has MVP experience (1 building, 60 sellers, 200-300 users)
- **Key Learning**: Operations need sufficient time/resources to maintain

### 7.2 Phased Rollout

- **Phase 1**: 1-3 buildings (test & learn)
- **Phase 2**: 10 buildings (validate approach)
- **Phase 3**: 50-100 buildings (scale)

---

## 8. Migration Path

### 8.1 Infrastructure Migration

- **Phase 1**: VPS + Docker Compose
- **Phase 2**: Hybrid (VPS + managed services for critical components)
- **Phase 3**: Full cloud (Kubernetes + managed services)

### 8.2 Service Migration

- Services can be migrated incrementally
- Database per building allows independent migration
- Central database migration requires coordination

---

## 9. Open Questions & Future Decisions

### 9.1 To Be Determined

- **Building Types Priority**: Need market research to determine priority (buildings with apps vs. without apps vs. active FB groups)
- **Community Ambassador KPI Details**: Specific targets for onboarding and launch phases
- **Exact Commission Structure**: One-time vs. recurring commission rates

### 9.2 Future Considerations

- **Chat Functionality**: When to add chat (currently users use Zalo)
- **Payment Integration**: When to add payment (currently offline)
- **Elasticsearch**: When to migrate from PostgreSQL full-text search
- **Kubernetes**: When to migrate from Docker Compose

---

## 10. Next Steps

### 10.1 Immediate Actions

1. Create detailed system architecture design
2. Define domain model with bounded contexts
3. Design API contracts for all services
4. Set up infrastructure on DigitalOcean
5. Create development environment setup

### 10.2 Short-Term Actions

1. Complete detailed requirements for Phase 1 features
2. Design database schemas (central + building)
3. Implement service boundaries and interfaces
4. Set up monitoring and logging
5. Create backup and disaster recovery procedures

---

## 11. Market Research Data (HCM Focus)

### 11.1 Building Statistics

**Overall Market:**
- **Total Buildings Nationwide**: ~3,000 tòa nhà chung cư (primarily Hà Nội and HCM)
- **HCM Concentration**: Similar to Hà Nội (major urban center)
- **Growth Trend**: Hà Nội increased from 643 buildings (2016) to 919 buildings (2019)

**Building Scale:**
- **Average Units per Building**: 800-1,200 căn hộ/building
- **Rationale**: Based on large-scale projects (Vinhomes, Masteri, etc.)
- **Average Used for Calculations**: 1,000 căn hộ/building

### 11.2 User Calculations

**Per Building:**
- **Units**: 1,000 căn hộ (average)
- **Occupancy Rate**: 85% (estimate)
- **People per Unit**: 2.5 người/căn (Vietnamese household average)
- **Potential Users**: 1,000 × 0.85 × 2.5 = **~2,125 users/building**

**Platform Scale (Year 1):**
- **Buildings**: 50-100 buildings
- **Total Potential Users**: ~106,250 - 212,500 users
- **Peak Concurrent**: 20-30% = ~21,250 - 63,750 concurrent users

### 11.3 Market Activity Data

**Transaction Volume:**
- **H1 2024**: 14,400 apartment transactions + 6,200 land transactions = 20,600 total
- **Growth**: 3x increase vs. H1 2023
- **Trend**: Apartment transactions continue to be primary choice

**Supply Projections:**
- **H2 2025**: 78,600 units expected (primarily Hà Nội and HCM)
- **Price Segment**: Primarily Grade A+ (high-end), pushing buyers to adjacent areas
- **Opportunity**: Adjacent areas and mid-range segments

**Housing Statistics:**
- **Average Housing Area**: 26.6 m²/person (national average)
- **Apartment Area**: 21.1 m²/person (lower than standalone houses at 26.8 m²/person)
- **Implication**: Dense living, high community interaction needs

---

**Status:** All Critical Decisions Finalized  
**Next Review:** After detailed architecture design

