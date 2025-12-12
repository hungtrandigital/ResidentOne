# User Model & Platform Architecture Insights

**Date:** 2025-12-12  
**Last Updated:** 2025-12-12  
**Research Type:** Product Architecture & User Model  
**Status:** Key Product Insights

## Executive Summary

This document captures critical product architecture and user model insights that fundamentally shape the platform design. These insights address user identity, authentication strategy, mobile-first approach, and the resident perspective of the platform as a comprehensive building hub.

**Key Insights:**
1. **User Model:** End users include both residents AND renters (not just property owners)
2. **Single Sign-On (SSO):** Users register once, access any building's app with same account
3. **Mobile-First:** Phone number-based authentication, cross-building access, system-wide scam blocking
4. **Hub Concept:** From resident perspective, platform is comprehensive building hub (marketplace, announcements, surveys, etc.)

---

## 1. User Model: Residents & Renters

### 1.1 User Types

**End Users Include:**
- **Residents (Cư Dân):** Property owners living in the building
- **Renters (Người Thuê):** People renting units in the building

**Key Implication:**
- Platform must support both ownership and rental relationships
- Verification process must accommodate both residents and renters
- User profile must distinguish between owner and renter status
- Both can be buyers, sellers, and participants in building activities

### 1.2 User Relationship to Building

**Resident (Owner):**
- Owns property in building
- Permanent relationship (until property sold)
- Full platform access
- Can verify with property ownership documents

**Renter:**
- Rents property in building
- Temporary relationship (lease-based)
- Full platform access (while renting)
- Can verify with rental agreement/lease documents

**Both Can:**
- Buy and sell on marketplace
- Participate in surveys and polls
- Access service directory
- Receive notifications
- Use all platform features

### 1.3 Verification Requirements

**For Residents (Owners):**
- Property ownership documents
- ID verification
- Proof of residence (utility bills, resident card)

**For Renters:**
- Rental agreement/lease documents
- ID verification
- Proof of residence (utility bills, rental receipt)

**Platform Must:**
- Support both verification types
- Track user type (owner vs. renter)
- Handle lease expiration (renter status)
- Maintain verification status across buildings

---

## 2. Single Sign-On (SSO) Architecture

### 2.1 Core Concept

**User Registration:**
- User registers **once** on the platform (not per building)
- Registration is **system-wide** (not building-specific)
- Account persists across all buildings

**Cross-Building Access:**
- User can access **any building's app** with same account
- No need to re-register when moving or visiting different buildings
- Seamless experience across building communities

**Account Persistence:**
- Account exists independently of building membership
- User can be member of multiple buildings simultaneously
- Building membership can be added/removed without affecting account

### 2.2 Technical Architecture

**Centralized User Management:**
- Single user database (not per building)
- User identity is platform-level (not building-level)
- Building membership is relationship (many-to-many)

**Data Model:**
```
User (Platform Level)
├── Identity (phone, email, profile)
├── Verification Status (system-wide)
├── Building Memberships (many-to-many)
│   ├── Building A (role: resident/renter)
│   ├── Building B (role: resident/renter)
│   └── Building C (role: resident/renter)
└── Platform-Wide Data
    ├── Reputation Score
    ├── Scam Status (blocked/unblocked)
    └── Activity History
```

**Building-Specific Data:**
- Listings (building-specific)
- Transactions (building-specific)
- Participation (building-specific)
- But user identity is shared

### 2.3 Benefits

**For Users:**
- **Convenience:** Register once, access everywhere
- **Consistency:** Same profile, reputation across buildings
- **Mobility:** Easy to move between buildings
- **Trust:** Reputation follows user across buildings

**For Platform:**
- **Network Effects:** User base grows across all buildings
- **Data Quality:** Single source of truth for user identity
- **Scalability:** Efficient user management
- **Trust & Safety:** System-wide scam blocking

**For Buildings:**
- **User Base:** Access to larger user network
- **Trust:** Users with reputation from other buildings
- **Efficiency:** No need to verify users already verified elsewhere

---

## 3. Mobile-First Strategy

### 3.1 Core Philosophy

**Mobile-First Design:**
- Platform designed for mobile devices first
- Web version is secondary (responsive design)
- Native mobile app (iOS/Android) is primary

**Rationale:**
- Building residents primarily use mobile devices
- Mobile is more convenient for daily activities
- Better engagement on mobile
- Push notifications work better on mobile

### 3.2 Authentication: Phone Number-Based

**Registration:**
- User registers with **phone number** (primary identifier)
- Phone number is unique identifier across platform
- OTP (One-Time Password) verification via SMS

**Login:**
- User logs in with phone number + OTP
- No password required (passwordless authentication)
- Fast and convenient

**Cross-Building Access:**
- Same phone number works across all buildings
- User logs in once, can access any building's app
- Seamless experience

**Benefits:**
- **Convenience:** No password to remember
- **Security:** OTP is more secure than passwords
- **Accessibility:** Phone numbers are universal
- **Verification:** Phone number can be verified

### 3.3 System-Wide Scam Blocking

**Core Concept:**
- If user scams in **one building**, they are blocked from **all buildings**
- Scam status is platform-wide (not building-specific)
- Reputation follows user across all buildings

**Blocking Mechanism:**
- **Report System:** Users can report scams
- **Verification:** Platform verifies scam reports
- **Action:** If confirmed, user is blocked system-wide
- **Appeal:** User can appeal (with evidence)

**Benefits:**
- **Trust & Safety:** Protects all buildings from known scammers
- **Deterrent:** Scammers know they'll be blocked everywhere
- **Efficiency:** No need to block per building
- **Network Effects:** Trust builds across all buildings

**Implementation:**
- Scam status stored at platform level (not building level)
- All buildings check scam status before allowing access
- Blocked users cannot:
  - Create listings
  - Send messages
  - Participate in marketplace
  - Access any building's app

### 3.4 Mobile App Features

**Core Features:**
- Phone number registration/login
- Building selection (if member of multiple)
- Marketplace browsing and listing
- Messaging
- Notifications
- Service directory
- Surveys and polls
- Profile management

**Platform Features:**
- Cross-building access
- Reputation display
- Verification status
- Activity history

---

## 4. Hub Concept: Resident Perspective

### 4.1 Platform as Building Hub

**From Resident Perspective:**
The platform is the **comprehensive digital hub** for their building, containing:

1. **Marketplace (Chợ):**
   - Buy and sell products
   - Browse listings
   - Contact sellers
   - Verified sellers

2. **Announcements Board (Bảng Tin):**
   - Building announcements
   - BQL/BQT notifications
   - Community updates
   - Event information

3. **Resident Surveys (Khảo Sát Cư Dân):**
   - Opinion polls
   - Feedback collection
   - Decision-making
   - Resident voice

4. **Service Directory (Danh Bạ Dịch Vụ):**
   - Technician contacts
   - Emergency contacts
   - Utility contacts
   - Service providers

5. **Community Features:**
   - Resident directory
   - Community groups
   - Event calendar
   - Information sharing

6. **Management Tools:**
   - Resident data management
   - Communication tools
   - Polling tools
   - Reporting tools

### 4.2 Hub Components Integration

**Unified Experience:**
- All features in one app
- Seamless navigation
- Consistent design
- Single login

**Value Proposition:**
- **Convenience:** Everything in one place
- **Efficiency:** No need to switch between apps
- **Trust:** Verified community
- **Engagement:** Daily use platform

**User Journey:**
1. Open app (building hub)
2. See announcements (if any)
3. Browse marketplace (if shopping)
4. Check service directory (if needed)
5. Participate in survey (if active)
6. All in one place, one app

### 4.3 Hub Positioning

**Marketing Message:**
- "Your Building Hub" (Trung Tâm Chung Cư Của Bạn)
- "Everything You Need in One Place" (Tất Cả Trong Một Nơi)
- "Your Building's Digital Home" (Ngôi Nhà Số Của Chung Cư)

**Key Differentiators:**
- **Comprehensive:** Not just marketplace, not just management
- **Integrated:** All features work together
- **Resident-Owned:** Not BQT/BQL dependent
- **Trusted:** Verified community

---

## 5. Architecture Implications

### 5.1 Technical Requirements

**User Management:**
- Centralized user database
- Phone number as primary identifier
- OTP-based authentication
- System-wide user status (scam blocking)

**Building Management:**
- Multi-tenant architecture
- Building-specific data isolation
- User-building relationship (many-to-many)
- Building-specific branding (white-label)

**Data Model:**
- Platform-level: User identity, verification, reputation
- Building-level: Listings, transactions, participation
- Relationship: User ↔ Building (many-to-many)

### 5.2 Security & Trust

**Verification:**
- Phone number verification (OTP)
- Document verification (per building)
- System-wide reputation tracking
- Scam blocking (platform-wide)

**Privacy:**
- Building data isolation
- User data privacy
- GDPR compliance
- Vietnam data protection

### 5.3 Scalability

**User Growth:**
- Single user database scales across all buildings
- Network effects: more buildings = more users
- Cross-building engagement

**Building Growth:**
- Multi-tenant architecture supports unlimited buildings
- White-label branding per building
- Building-specific customization

---

## 6. Competitive Advantages

### 6.1 Single Sign-On Advantage

**vs. Building-Specific Apps:**
- User registers once (not per building)
- Seamless experience across buildings
- Reputation follows user
- Network effects

**vs. Facebook/Zalo:**
- Verified identity (not anonymous)
- System-wide scam blocking
- Building-specific context
- Integrated features

### 6.2 Mobile-First Advantage

**vs. Web-Only Platforms:**
- Better engagement
- Push notifications
- Convenient access
- Native app experience

**vs. Desktop Platforms:**
- Mobile-first design
- Better for daily use
- More accessible
- Modern UX

### 6.3 Hub Concept Advantage

**vs. Single-Feature Apps:**
- Comprehensive solution
- All features in one place
- Daily engagement
- Higher value

**vs. Fragmented Solutions:**
- Unified experience
- No need to switch apps
- Consistent design
- Integrated features

---

## 7. Implementation Considerations

### 7.1 Phase 1: Foundation

**User Model:**
- Support residents and renters
- Phone number registration
- Basic verification

**SSO:**
- Centralized user database
- Cross-building access (basic)
- Account persistence

**Mobile-First:**
- Mobile app (iOS/Android)
- Phone number authentication
- Basic hub features

### 7.2 Phase 2: Commerce

**Enhanced User Model:**
- Full verification (owners and renters)
- Reputation system
- Activity tracking

**Enhanced SSO:**
- Full cross-building access
- Reputation sharing
- Activity history

**Enhanced Mobile:**
- Full marketplace features
- Messaging
- Notifications

### 7.3 Phase 3: Growth

**Advanced Features:**
- System-wide scam blocking
- Advanced reputation system
- Cross-building analytics
- Network effects optimization

---

## 8. Risks & Mitigation

### 8.1 Risks

**Risk 1: Phone Number Privacy**
- **Issue:** Phone numbers are sensitive data
- **Mitigation:** Strong privacy controls, GDPR compliance, opt-in consent

**Risk 2: Scam Blocking False Positives**
- **Issue:** Legitimate users might be blocked
- **Mitigation:** Appeal process, verification, human review

**Risk 3: Cross-Building Data Leakage**
- **Issue:** Building data might leak to other buildings
- **Mitigation:** Strong data isolation, access controls, encryption

**Risk 4: Mobile App Complexity**
- **Issue:** Mobile app might be complex to develop
- **Mitigation:** Phased rollout, MVP first, iterative development

### 8.2 Mitigation Strategies

**Privacy:**
- Strong data protection
- User consent
- Privacy controls
- Compliance

**Trust & Safety:**
- Verification process
- Appeal mechanism
- Human review
- Transparent policies

**Security:**
- Data isolation
- Access controls
- Encryption
- Security audits

**Development:**
- Phased approach
- MVP first
- Iterative development
- User feedback

---

## 9. Next Steps

### 9.1 Research Needed

1. **Phone Number Authentication:**
   - OTP provider selection
   - SMS delivery reliability
   - Cost analysis
   - Security best practices

2. **Multi-Tenant Architecture:**
   - Database design
   - Data isolation strategies
   - Scalability patterns
   - Security models

3. **Mobile App Development:**
   - Technology stack
   - Development timeline
   - Cost estimation
   - Platform requirements

4. **User Verification:**
   - Document verification process
   - Owner vs. renter verification
   - Cross-building verification
   - Verification cost

### 9.2 Design Decisions Needed

1. **User Profile:**
   - What information to collect?
   - How to display owner vs. renter?
   - How to handle multiple building memberships?

2. **Building Selection:**
   - How user selects building?
   - How to handle multiple buildings?
   - How to switch between buildings?

3. **Scam Blocking:**
   - What constitutes a scam?
   - How to verify scam reports?
   - Appeal process?
   - Blocking duration?

4. **Hub Design:**
   - How to organize hub features?
   - Navigation structure?
   - Feature prioritization?
   - User experience?

---

## 10. Summary

**Key Insights:**
1. **User Model:** Support both residents (owners) and renters
2. **SSO:** Single registration, cross-building access
3. **Mobile-First:** Phone number authentication, native app
4. **Hub Concept:** Comprehensive building hub (marketplace, announcements, surveys, etc.)

**Architecture Implications:**
- Centralized user management
- Multi-tenant building architecture
- Phone number-based authentication
- System-wide trust & safety

**Competitive Advantages:**
- Single sign-on convenience
- Mobile-first experience
- Comprehensive hub
- System-wide trust & safety

**Next Steps:**
- Research phone number authentication
- Design multi-tenant architecture
- Plan mobile app development
- Design user verification process

---

**Status:** Key Product Insights - Ready for Architecture Design  
**Next Review:** After technical architecture design

