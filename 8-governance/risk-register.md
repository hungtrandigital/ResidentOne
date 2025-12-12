# Risk Register

This file tracks project risks, their impact, probability, and mitigation plans.

## Risks

### [RISK-001] Low User Adoption - Switching from Facebook/Zalo Groups

**Status:** Open  
**Probability:** Medium  
**Impact:** High  
**Description:** Building residents may be reluctant to switch from familiar Facebook/Zalo groups to a new platform. Network effects are critical - need critical mass within each building for platform to be valuable.  
**Mitigation:** 
- Focus on clear value proposition (better search, unified platform, verification)
- Start with pilot buildings to demonstrate value
- Consider integration with Facebook/Zalo for initial user acquisition
- Build features that Facebook/Zalo groups lack (payment, verification, better search)

### [RISK-002] Regulatory Compliance - Vietnam E-commerce Regulations

**Status:** Open  
**Probability:** Medium  
**Impact:** High  
**Description:** Must comply with Vietnam e-commerce regulations including MoIT registration, licensing, and data protection requirements. Non-compliance could result in legal issues or business shutdown.  
**Mitigation:** 
- Conduct detailed regulatory research
- Engage local legal counsel
- Register business properly with MoIT
- Obtain necessary e-commerce licenses
- Implement data protection measures per Vietnam regulations

### [RISK-003] Payment Integration Complexity

**Status:** Open  
**Probability:** Medium  
**Impact:** Medium  
**Description:** Integration with local Vietnamese payment systems (MoMo, Zalo Pay) may be complex. Payment processing is critical for marketplace success.  
**Mitigation:** 
- Research payment gateway options early
- Partner with established payment providers
- Consider phased approach (start with simple payment methods)
- Ensure secure transaction processing

### [RISK-004] Competition from Facebook/Zalo Improvements

**Status:** Open  
**Probability:** Low  
**Impact:** High  
**Description:** Facebook or Zalo could improve their marketplace features, reducing differentiation of dedicated building marketplace platform.  
**Mitigation:** 
- Focus on building-specific features that Facebook/Zalo won't build
- Emphasize resident verification and trust
- Build strong community engagement features
- Move fast to establish market position

### [RISK-005] Network Effects - Need Critical Mass

**Status:** Open  
**Probability:** Medium  
**Impact:** High  
**Description:** Marketplace value depends on network effects. Need sufficient buyers and sellers within each building for platform to be useful.  
**Mitigation:** 
- Start with high-density buildings with active trading
- Focus on buildings with existing active Facebook/Zalo groups
- Consider building partnerships with property management companies
- Implement features that work even with smaller user base initially

### [RISK-006] Trust and Verification Challenges

**Status:** Open  
**Probability:** Medium  
**Impact:** High  
**Description:** Need to verify users are actual building residents to build trust. **Trust is the key behavior when buyers make decisions.** Fraud prevention is critical for marketplace success. Verification system must protect residents from scams common on Facebook/Zalo groups. **NEW:** System-wide scam blocking - if user scams in one building, must be blocked from all buildings.  
**Mitigation:** 
- Implement robust verification system (building address, unit number) - **This is a critical success factor**
- Support both residents (owners) and renters in verification process
- Partner with building management for verification
- Build review and rating system
- Implement reporting and moderation features
- **System-wide scam blocking** - Platform-level blocking mechanism (not building-specific)
- **Position verification as key differentiator vs. marketplace ecom (Shopee/Lazada) and Facebook/Zalo groups**

### [RISK-007] BQT/BQL Turnover and Platform Instability

**Status:** Open  
**Probability:** High  
**Impact:** High  
**Description:** **BQT (Ban Quản Trị) is elected every 3 years** (some 1-2 years, some continuously). BQT turnover often leads to BQL (Ban Quản Lý) change. When BQT/BQL changes, apps/platforms change too, causing data loss, resident frustration, and platform instability. Takes 2-3 months to update resident information each BQT/BQL change. Current solutions are dependent on BQT/BQL, creating instability.  
**Mitigation:** 
- **Build resident-owned platform** - Platform owned by residents, not BQT/BQL
- **Data continuity system** - Resident data persists through BQT/BQL changes
- **Platform independence** - Platform survives BQT elections and BQL changes
- **Election-proof platform** - Platform survives 3-year BQT election cycle
- **Smooth BQT/BQL transitions** - Tools for easy handover when management changes
- **Resident data ownership** - Residents control their data, not BQT/BQL
- **Long-term platform commitment** - Platform persists regardless of BQT elections or BQL changes
- **Position as key differentiator** - Platform stability vs. BQT/BQL-dependent solutions

### [RISK-008] Inefficient Notification and Polling Systems

**Status:** Open  
**Probability:** High  
**Impact:** Medium  
**Description:** Current notification and polling systems are inefficient, tiring, and annoying. Residents complain about too many notifications or missed important information. Manual polling processes are time-consuming and have low participation.  
**Mitigation:** 
- Build smart notification system with preference management
- Implement efficient polling system with easy participation
- Focus on user experience - notifications should be helpful, not annoying
- Test notification frequency and timing with users
- Provide opt-out options for non-critical notifications

### [RISK-009] Operational Model - Who Manages Platform?

**Status:** Open  
**Probability:** Medium  
**Impact:** Medium  
**Description:** Need to determine who manages platform at each building level. Options include: platform company, BQL, community moderators, or hybrid. Each has pros/cons.  
**Mitigation:** 
- Research different operational models
- Test hybrid model (platform company + BQL + community moderators)
- Provide clear roles and responsibilities
- Build automated systems to reduce manual management
- Create training and support materials

### [RISK-010] Dispute Resolution

**Status:** Open  
**Probability:** Medium  
**Impact:** Medium  
**Description:** Need system for resolving disputes between buyers and sellers. Current solutions (Facebook/Zalo) have no formal dispute resolution.  
**Mitigation:** 
- Implement tiered support system (self-service, community, BQL, central support)
- Build reporting and moderation features
- Create clear dispute resolution process
- Partner with building management for local support
- Consider third-party mediation services

### [RISK-011] Funding and Sustainability

**Status:** Open  
**Probability:** Medium  
**Impact:** High  
**Description:** Need sustainable funding model. Options include: building subscriptions, resident subscriptions, transaction fees, advertising. Must balance affordability with sustainability.  
**Mitigation:** 
- Research multiple revenue streams
- Test different pricing models
- Focus on building subscriptions as primary revenue
- Consider freemium model for initial adoption
- Build unit economics model (CAC, LTV, payback period)

### [RISK-012] Technical Complexity - White-Label Multi-Tenant Architecture

**Status:** Open  
**Probability:** Medium  
**Impact:** High  
**Description:** White-label multi-tenant architecture is complex. Need to support multiple buildings with different branding, data isolation, and scalability.  
**Mitigation:** 
- Research multi-tenant architecture patterns
- Start with simpler architecture, scale up
- Use proven technology stack
- Build for scalability from start
- Test with multiple buildings early

### [RISK-013] Single Sign-On (SSO) Complexity

**Status:** Open  
**Probability:** Medium  
**Impact:** Medium  
**Description:** **NEW:** Implementing single sign-on (SSO) where users register once and access any building's app is complex. Need centralized user management, cross-building access, and data isolation.  
**Mitigation:** 
- Research SSO architecture patterns
- Design centralized user database with building relationship (many-to-many)
- Implement strong data isolation between buildings
- Test cross-building access early
- Build user management tools for platform administrators

### [RISK-014] Mobile-First Development Complexity

**Status:** Open  
**Probability:** Medium  
**Impact:** Medium  
**Description:** **NEW:** Mobile-first approach requires native mobile app development (iOS/Android), phone number authentication, and mobile-optimized UX. More complex than web-only platform.  
**Mitigation:** 
- Research mobile app development frameworks (React Native, Flutter)
- Design phone number authentication system (OTP via SMS)
- Partner with SMS provider for reliable OTP delivery
- Test mobile UX early and often
- Consider progressive web app (PWA) as fallback

### [RISK-015] System-Wide Scam Blocking - False Positives

**Status:** Open  
**Probability:** Low  
**Impact:** High  
**Description:** **NEW:** System-wide scam blocking (if user scams in one building, blocked from all buildings) could have false positives. Legitimate users might be incorrectly blocked, causing significant harm.  
**Mitigation:** 
- Implement robust verification process before blocking
- Build appeal mechanism for blocked users
- Require multiple reports before blocking
- Human review for scam reports
- Clear criteria for what constitutes a scam
- Transparent blocking process with user notification

### [RISK-016] Phone Number Privacy and Security

**Status:** Open  
**Probability:** Medium  
**Impact:** Medium  
**Description:** **NEW:** Phone number-based authentication requires collecting and storing phone numbers. Phone numbers are sensitive personal data. Need strong privacy controls and security measures.  
**Mitigation:** 
- Implement strong data protection measures
- Comply with GDPR and Vietnam data protection regulations
- Use encryption for phone number storage
- Implement opt-in consent for phone number usage
- Provide user controls for phone number visibility
- Regular security audits

### [RISK-017] Zalo Content Automation - Terms of Service Violation

**Status:** Open  
**Probability:** Medium  
**Impact:** High  
**Description:** **NEW:** Automating content extraction from Zalo groups may violate Zalo Terms of Service, leading to account bans or legal issues.  
**Mitigation:** 
- Use employee's legitimate access (Phase 1 - employee-assisted automation)
- Get user consent for their own content (Phase 2 - user-initiated migration)
- Use official Zalo OA API if available (Phase 3 - full automation)
- Review Zalo ToS carefully before implementation
- Consult legal counsel
- Start with employee-assisted approach (lowest risk)

### [RISK-018] Content Automation - User Matching Errors

**Status:** Open  
**Probability:** Medium  
**Impact:** Medium  
**Description:** **NEW:** Automated user matching (phone number + Facebook profile) may incorrectly match Zalo posts to platform users, causing content to appear under wrong accounts.  
**Mitigation:** 
- Use multiple matching criteria (phone + Facebook + name)
- Employee review of matches before publishing (Phase 1)
- User can claim/reject listings
- Fuzzy matching with confidence scores
- Manual review for low-confidence matches
- User notification for all matched listings

### [RISK-019] Content Automation - Content Quality Issues

**Status:** Open  
**Probability:** Medium  
**Impact:** Medium  
**Description:** **NEW:** Automated content extraction from Zalo may miss context, extract incorrectly, or fail to categorize properly, leading to poor listing quality.  
**Mitigation:** 
- Employee review before publishing (Phase 1)
- User can edit listings after migration
- AI/ML for better content extraction and categorization
- Human review for edge cases
- Quality checks and validation
- User feedback mechanism

### [RISK-020] Microservices Architecture Complexity

**Status:** Open  
**Probability:** Medium  
**Impact:** Medium  
**Description:** **NEW:** Building microservices architecture from start adds complexity (service communication, deployment, monitoring, distributed systems challenges). May slow down initial development and increase operational overhead.  
**Mitigation:** 
- Start with clear service boundaries and well-defined APIs
- Use proven patterns (API Gateway, service mesh)
- Good documentation and coding standards
- Don't over-engineer - start simple, add complexity as needed
- Use Docker Compose for simple orchestration initially
- Gradual adoption of microservices patterns

### [RISK-021] VPS Infrastructure Management Overhead

**Status:** Open  
**Probability:** Medium  
**Impact:** Medium  
**Description:** **NEW:** Managing VPS infrastructure requires operational expertise (server management, security, backups, monitoring). May require dedicated DevOps resources or significant time investment.  
**Mitigation:** 
- Use Docker Compose for simplicity
- Automate deployments with CI/CD
- Use monitoring tools (Prometheus, Grafana)
- Document all procedures
- Consider managed services for critical components (database, cache) in Phase 2
- Regular security updates and patches
- Automated backup procedures

### [RISK-022] VPS Scalability Limitations

**Status:** Open  
**Probability:** Low-Medium  
**Impact:** High  
**Description:** **NEW:** VPS infrastructure may not scale as easily as cloud platforms. Manual scaling required, may hit limitations during rapid growth.  
**Mitigation:** 
- Design for horizontal scaling from start
- Use load balancing (Nginx)
- Monitor performance and scale proactively
- Plan migration to cloud early (Phase 3)
- Test scaling procedures
- Have cloud migration plan ready

### [RISK-023] Service Communication Overhead

**Status:** Open  
**Probability:** Medium  
**Impact:** Medium  
**Description:** **NEW:** Network calls between microservices add latency and complexity. May impact performance and user experience.  
**Mitigation:** 
- Use caching strategically (Redis)
- Optimize API calls (batch requests where possible)
- Use async communication where appropriate (message queues)
- Monitor and optimize performance
- Design APIs for efficiency
- Consider service colocation for frequently communicating services

### [RISK-024] AI Code Quality & Maintainability

**Status:** Open  
**Probability:** Medium  
**Impact:** High  
**Description:** **NEW:** AI-generated code (using Claude Code/AI Factory) may have quality issues, technical debt, or maintainability concerns. Code may not follow best practices, may have bugs, or may be difficult to maintain long-term.  
**Mitigation:** 
- Technical Lead reviews all AI-generated code thoroughly
- Set clear coding standards and framework rules for AI
- Regular code reviews and refactoring
- Comprehensive testing (unit, integration, E2E)
- Monitor code quality metrics
- Balance speed vs quality

### [RISK-025] AI Tool Dependency

**Status:** Open  
**Probability:** Low  
**Impact:** Medium  
**Description:** **NEW:** Dependency on Claude Code/AI Factory tools creates risk if tools become unavailable, change pricing, or have service disruptions. May slow down development or increase costs unexpectedly.  
**Mitigation:** 
- Use multiple AI tools as backup
- Maintain code ownership and documentation
- Have fallback to manual development if needed
- Monitor tool costs and usage
- Consider tool alternatives
- Don't over-rely on single tool

### [RISK-026] Technical Lead Review Bottleneck

**Status:** Open  
**Probability:** Medium  
**Impact:** Medium  
**Description:** **NEW:** With AI-first approach, Technical Lead may become bottleneck if review workload is too high. AI generates code faster than it can be reviewed, potentially slowing down development or compromising quality.  
**Mitigation:** 
- Set clear review criteria and automation
- Prioritize critical code paths for thorough review
- Use automated tools for code quality checks
- Consider additional reviewer if needed
- Balance review depth vs speed
- Plan for review capacity

### [RISK-027] Faster Development = Faster Issue Discovery

**Status:** Open  
**Probability:** Medium  
**Impact:** Medium  
**Description:** **NEW:** Faster development with AI may lead to faster discovery of issues, requiring more iteration and fixes. May create perception of lower quality or require more support resources.  
**Mitigation:** 
- Comprehensive testing before launch
- Phased rollout to pilot buildings
- Quick iteration and feedback loops
- Monitor issue rates and types
- Learn from issues to improve AI prompts
- Set quality gates before deployment

---

**Last Updated:** 2025-12-12
