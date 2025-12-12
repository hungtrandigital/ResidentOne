# Infrastructure Cost Allocation Analysis - Multi-Tenant SaaS

**Date:** 2025-12-12  
**Last Updated:** 2025-12-12  
**Status:** Architecture Decision Analysis

---

## Executive Summary

This document analyzes the infrastructure cost allocation approach for ResidentOne platform using a **dedicated VPS per building** architecture with a minimal **core hub** for shared services.

**Key Architecture:**
- **Core Hub:** Minimal infrastructure (SSO, monitoring, central services) - shared across all buildings
- **Per-Building VPS:** Dedicated VPS per building (ready for full hand-over) - isolated infrastructure
- **Connection:** Only few services connect to core hub (SSO, monitoring)

---

## 1. Architecture Overview

### 1.1 Core Hub (Shared Infrastructure)

**Purpose:** Minimal shared services across all buildings

**Services:**
- **SSO (Single Sign-On):** User authentication, cross-building access
- **Monitoring:** Central monitoring, logging, analytics aggregation
- **Verification Service:** Central user verification, scam blocking
- **User Service:** Central user database (identity, profile)

**Infrastructure:**
- **VPS:** 1 small VPS instance (~$20-30/month)
- **Database:** Central PostgreSQL database (user identity, verification)
- **Monitoring:** Central monitoring stack (Prometheus, Grafana)
- **Total Core Hub Cost:** ~$50/month (VND 1.25M/month)

**Characteristics:**
- Minimal, shared across all buildings
- Scales with number of users (not buildings)
- Low cost, high value

### 1.2 Per-Building VPS (Dedicated Infrastructure)

**Purpose:** Dedicated infrastructure per building, ready for full hand-over

**Services (per building):**
- **Building Service:** Building management, tenant configuration
- **Marketplace Service:** Product listings, search, discovery
- **Communication Service:** Notifications, announcements
- **Content Service:** Media storage, file management
- **Analytics Service:** Building-specific analytics

**Infrastructure (per building):**
- **VPS:** 1 dedicated VPS instance (~$50/month)
- **Database:** Building-specific PostgreSQL database
- **Storage:** Local storage (or S3-compatible)
- **Backup:** Automated daily backups
- **Total Per-Building Cost:** ~$50/month (VND 1.25M/month)

**Characteristics:**
- Dedicated, isolated per building
- Ready for full hand-over (if needed)
- Scales linearly with number of buildings
- Complete data isolation

### 1.3 Connection Architecture

**Connection Pattern:**
- **SSO:** Building VPS → Core Hub (authentication requests)
- **Monitoring:** Building VPS → Core Hub (metrics, logs)
- **Verification:** Building VPS → Core Hub (verification status sync)
- **User Data:** Building VPS → Core Hub (user profile sync)

**Network:**
- **API Calls:** REST API between building VPS and core hub
- **Frequency:** Low (only for SSO, monitoring, verification sync)
- **Bandwidth:** Minimal (mostly authentication tokens, metrics)

---

## 2. Global Best Practices for Multi-Tenant SaaS Cost Allocation

### 2.1 Cost Allocation Models

**Industry Standard Approaches:**

#### Model 1: Shared Infrastructure (Traditional SaaS)
- **Approach:** All tenants share same infrastructure
- **Cost:** Fixed cost, scales with usage
- **Pros:** Lower cost, easier management
- **Cons:** Less isolation, harder to hand-over
- **Examples:** Most SaaS platforms (Slack, Notion, etc.)

#### Model 2: Dedicated Infrastructure Per Tenant (Enterprise SaaS)
- **Approach:** Each tenant has dedicated infrastructure
- **Cost:** Variable cost per tenant
- **Pros:** Complete isolation, ready for hand-over, better security
- **Cons:** Higher cost, more complex management
- **Examples:** Enterprise SaaS (Salesforce Enterprise, AWS Organizations)

#### Model 3: Hybrid (Recommended for ResidentOne)
- **Approach:** Core hub (shared) + Per-tenant infrastructure (dedicated)
- **Cost:** Fixed (core) + Variable (per tenant)
- **Pros:** Balance of cost and isolation, ready for hand-over
- **Cons:** More complex architecture
- **Examples:** Multi-tenant platforms with isolation requirements

### 2.2 Cost Allocation Best Practices

**1. Fixed vs Variable Costs:**
- **Fixed Costs:** Core hub, shared services, platform operations
- **Variable Costs:** Per-tenant infrastructure, per-tenant services
- **Allocation:** Fixed costs amortized across all tenants, variable costs charged per tenant

**2. Cost Transparency:**
- **Per-Tenant Costs:** Clearly defined per-tenant infrastructure costs
- **Shared Costs:** Transparent allocation of shared costs
- **Pricing Model:** Reflect actual cost structure

**3. Scalability:**
- **Fixed Costs:** Should scale sub-linearly (economies of scale)
- **Variable Costs:** Should scale linearly (predictable)
- **Total Costs:** Should scale predictably with growth

**4. Hand-Over Readiness:**
- **Dedicated Infrastructure:** Each tenant has isolated infrastructure
- **Data Isolation:** Complete data separation
- **Operational Independence:** Can be handed over independently

---

## 3. Cost Structure Analysis

### 3.1 Fixed Costs (Core Hub)

**Monthly Fixed Costs:**
- **Core Hub VPS:** VND 1.25M/month (~$50/month)
- **Core Hub Database:** Included in VPS (or separate ~$20/month)
- **Monitoring Stack:** Included in VPS
- **Tools & Software:** VND 4M/month (GitHub, monitoring tools)
- **AI Factory Tools:** VND 1.25M/month (Cursor Standard, Months 4+)
- **Third-party Services:** VND 1.25M/month (SMS, email - shared)
- **Total Fixed Infrastructure:** VND 7.75M/month (Months 1-2), VND 4M/month (Months 4+)

**Characteristics:**
- Fixed regardless of number of buildings
- Scales with number of users (SSO, verification)
- Minimal cost, high value

### 3.2 Variable Costs (Per Building)

**Per-Building Infrastructure Costs:**
- **Dedicated VPS:** VND 1.25M/month (~$50/building/month)
- **Database:** Included in VPS
- **Storage:** Included in VPS (or separate if needed)
- **Backup:** Included in VPS
- **Total Per-Building Infrastructure:** VND 1.25M/month

**Per-Building Operational Costs:**
- **BQL Partnership:** VND 1-2M/month (revenue share or fee)
- **Community Moderators:** VND 200K-500K/month
- **Support Costs:** VND 500K-1M/month
- **Total Per-Building Operational:** VND 1.7-3.5M/month

**Total Per-Building Cost:** VND 2.95-4.75M/month (average: VND 3.85M/month)

**Characteristics:**
- Scales linearly with number of buildings
- Predictable cost per building
- Ready for hand-over

### 3.3 Cost Allocation Formula

**Total Monthly Cost:**
```
Total Cost = Fixed Costs + (Variable Costs × Number of Buildings)

Where:
- Fixed Costs = Core Hub + Tools + Operations (VND 4-7.75M/month)
- Variable Costs = Per-Building Infrastructure + Operational (VND 2.95-4.75M/building/month)
```

**Example Calculations:**

**Year 1 (50 buildings):**
- Fixed: VND 4M/month (Months 4+)
- Variable: 50 buildings × VND 3.85M = VND 192.5M/month
- **Total: VND 196.5M/month**

**Year 2 (100 buildings):**
- Fixed: VND 4M/month
- Variable: 100 buildings × VND 3.85M = VND 385M/month
- **Total: VND 389M/month**

**Year 3 (200 buildings):**
- Fixed: VND 4M/month
- Variable: 200 buildings × VND 3.85M = VND 770M/month
- **Total: VND 774M/month**

---

## 4. Industry Best Practices Comparison

### 4.1 Similar Platforms

**1. Shopify (E-commerce Platform)**
- **Model:** Shared infrastructure with per-store isolation
- **Cost:** Fixed platform + per-store fees
- **Pricing:** $29-299/month per store + transaction fees
- **Infrastructure:** Shared, but data isolation per store

**2. WordPress.com (Multi-Tenant CMS)**
- **Model:** Shared infrastructure, per-site isolation
- **Cost:** Fixed platform + per-site fees
- **Pricing:** Free to $45/month per site
- **Infrastructure:** Shared, but site isolation

**3. AWS Organizations (Enterprise)**
- **Model:** Dedicated infrastructure per organization
- **Cost:** Per-organization infrastructure
- **Pricing:** Pay-per-use per organization
- **Infrastructure:** Dedicated per organization

**4. Heroku (PaaS)**
- **Model:** Shared platform, per-app isolation
- **Cost:** Fixed platform + per-app fees
- **Pricing:** Free to $500+/month per app
- **Infrastructure:** Shared, but app isolation

### 4.2 Best Practices for ResidentOne

**Recommended Approach:**
- **Core Hub:** Minimal shared infrastructure (SSO, monitoring)
- **Per-Building:** Dedicated VPS per building
- **Cost Allocation:** Fixed (core) + Variable (per building)
- **Pricing Model:** Reflect cost structure (base + per-building)

**Rationale:**
1. **Isolation:** Complete data isolation per building
2. **Hand-Over Ready:** Can hand over building VPS independently
3. **Scalability:** Linear scaling with predictable costs
4. **Transparency:** Clear cost per building
5. **Flexibility:** Can customize per building if needed

---

## 5. Cost Optimization Strategies

### 5.1 Core Hub Optimization

**Strategies:**
- **Minimal Services:** Only essential services in core hub
- **Efficient Architecture:** Lightweight services, optimized queries
- **Caching:** Aggressive caching for SSO, verification
- **Monitoring:** Efficient monitoring (sampling, aggregation)

**Cost Target:** VND 4M/month (Months 4+)

### 5.2 Per-Building Optimization

**Strategies:**
- **Right-Sizing:** Start with minimal VPS, scale as needed
- **Resource Sharing:** Share resources within building VPS
- **Efficient Services:** Optimize services for resource usage
- **Automation:** Automated scaling, backups, monitoring

**Cost Target:** VND 1.25M/month per building (infrastructure)

### 5.3 Scale Optimization

**Strategies:**
- **Bulk Discounts:** Negotiate VPS discounts for volume
- **Reserved Instances:** Reserve VPS instances for better pricing
- **Resource Pooling:** Pool resources across buildings (if possible)
- **Automation:** Automate provisioning, scaling, management

**Cost Target:** Reduce per-building infrastructure cost to VND 1M/month at scale (100+ buildings)

---

## 6. Financial Implications

### 6.1 Cost Structure Impact

**Before (Shared Infrastructure):**
- Fixed: VND 1.25M/month (scales with buildings)
- Variable: VND 1.7-3.5M/building/month (operational only)
- **Total:** Less predictable, harder to hand-over

**After (Dedicated Per-Building):**
- Fixed: VND 4M/month (core hub, fixed)
- Variable: VND 3.85M/building/month (infrastructure + operational)
- **Total:** More predictable, ready for hand-over

### 6.2 Pricing Model Alignment

**Recommended Pricing Structure:**
- **Base Fee:** VND 2-3M/month (covers core hub, shared services)
- **Per-Building Fee:** VND 5-8M/month (covers dedicated VPS + operational)
- **Total:** VND 7-11M/month per building

**Cost Coverage:**
- Infrastructure: VND 1.25M/building
- Operational: VND 1.7-3.5M/building
- **Total Cost:** VND 2.95-4.75M/building
- **Margin:** 50-70% (VND 4-6M/building profit)

### 6.3 Break-Even Analysis

**Break-Even Calculation:**
- Fixed Costs: VND 4M/month (core hub)
- Variable Costs: VND 3.85M/building/month
- Revenue: VND 8M/building/month (average)
- **Break-Even:** VND 4M / (VND 8M - VND 3.85M) = **0.96 buildings** (essentially 1 building)

**With Freemium (30% free):**
- Effective Revenue: VND 5.6M/building/month (70% paid)
- **Break-Even:** VND 4M / (VND 5.6M - VND 3.85M) = **2.3 buildings**

**Key Insight:** With dedicated per-building infrastructure, break-even is very low (1-3 buildings), making it highly profitable at scale.

---

## 7. Recommendations

### 7.1 Infrastructure Architecture

**Recommended:**
- **Core Hub:** Minimal VPS (~$50/month) for SSO, monitoring
- **Per-Building:** Dedicated VPS (~$50/building/month)
- **Connection:** API-based, minimal bandwidth

### 7.2 Cost Allocation

**Recommended:**
- **Fixed Costs:** Core hub, tools, operations (VND 4M/month)
- **Variable Costs:** Per-building infrastructure + operational (VND 3.85M/building/month)
- **Total:** Fixed + (Variable × Buildings)

### 7.3 Pricing Model

**Recommended:**
- **Base Fee:** VND 2-3M/month (covers core hub)
- **Per-Building Fee:** VND 5-8M/month (covers dedicated VPS + operational)
- **Total:** VND 7-11M/month per building

### 7.4 Financial Planning

**Recommended:**
- **Calculate costs per building** (infrastructure + operational)
- **Separate fixed and variable costs** clearly
- **Price based on cost structure** (base + per-building)
- **Plan for scale** (bulk discounts, reserved instances)

---

## 8. Next Steps

1. **Update Financing Plan:** Reflect dedicated per-building infrastructure costs
2. **Update Architecture Docs:** Document core hub + per-building VPS architecture
3. **Create Cost Calculator:** Tool to calculate costs based on number of buildings
4. **Plan Pricing Strategy:** Align pricing with cost structure

---

**Status:** Analysis Complete  
**Next Action:** Update financing plan with dedicated per-building infrastructure cost allocation

