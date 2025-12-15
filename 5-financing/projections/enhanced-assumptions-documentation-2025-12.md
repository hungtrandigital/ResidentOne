# Enhanced Assumptions Documentation — ResidentOne Platform

**Date:** 2025-12-13  
**Last Updated:** 2025-12-13  
**Status:** Comprehensive Assumptions Documentation  
**Purpose:** Detailed documentation of all financial projection assumptions with rationale, sources, and validation plans

---

## Executive Summary

This document provides **comprehensive documentation** of all assumptions used in financial projections, including:
- **Assumption Value:** The specific number or percentage used
- **Rationale:** Why this assumption was chosen
- **Source:** Where the assumption comes from (research, benchmarks, estimates)
- **Validation Plan:** How the assumption will be validated with real data
- **Sensitivity:** How sensitive the projections are to this assumption

**Assumption Categories:**
1. Revenue Assumptions
2. Cost Assumptions
3. Growth Assumptions
4. Churn Assumptions
5. Unit Economics Assumptions
6. Market Assumptions
7. Operational Assumptions

---

## 1. Revenue Assumptions

### 1.1 Average Subscription Price

**Assumption Value:**
- **Base:** VND 8M/month per building (average)
- **Range:** VND 5-25M/month (multi-tier pricing)
- **Effective Revenue:** VND 5.6M/building/month (70% paid × VND 8M)

**Rationale:**
- Based on market research of building management software pricing in Vietnam
- Multi-tier pricing model (Free, Basic, Premium, Enterprise)
- Average weighted by expected distribution: 30% Free, 40% Basic (VND 5M), 20% Premium (VND 10M), 10% Enterprise (VND 25M)
- Effective revenue accounts for freemium model (30% free users)

**Source:**
- Market research: Building management software pricing in Vietnam (VND 5-20M/month)
- Competitive analysis: Similar platforms charge VND 5-15M/month
- Pilot building feedback: Willingness to pay VND 5-10M/month
- Internal estimate: Based on value proposition and market positioning

**Validation Plan:**
- **Pilot Buildings (Month 1-6):**
  - Test pricing with 3-5 pilot buildings
  - Track conversion rates at different price points
  - Survey willingness to pay
  - A/B test pricing pages
- **Month 6 Review:**
  - Analyze actual pricing vs. projections
  - Adjust pricing strategy based on conversion data
  - Update projections with validated pricing
- **Ongoing:**
  - Monthly pricing analysis
  - Quarterly pricing optimization
  - Annual pricing strategy review

**Sensitivity:**
- **High Sensitivity:** Pricing has ±20% impact on revenue (±20% revenue change)
- **Break-Even Impact:** ±3 months break-even impact for ±20% pricing change
- **Funding Impact:** ±20% funding needs for ±20% pricing change

**Risk Factors:**
- Market price sensitivity (may reduce conversion)
- Competitive pricing pressure
- Economic downturn (may reduce willingness to pay)

**Mitigation:**
- Test pricing with pilot buildings
- Monitor conversion rates
- Adjust pricing strategy based on data
- Offer flexible pricing tiers

---

### 1.2 Pricing Tier Distribution

**Assumption Value:**
- **Free:** 30% of buildings
- **Basic (VND 5M/month):** 40% of buildings
- **Premium (VND 10M/month):** 20% of buildings
- **Enterprise (VND 25M/month):** 10% of buildings
- **Average:** VND 8M/month per building

**Rationale:**
- Freemium model to reduce friction and increase adoption
- Tiered pricing to capture different customer segments
- Distribution based on typical SaaS freemium conversion (30% free, 70% paid)
- Premium/Enterprise tiers for high-value customers

**Source:**
- Industry benchmarks: SaaS freemium conversion (25-35% free)
- Market research: Building segment preferences (affordable vs. premium)
- Internal estimate: Based on value proposition and market positioning

**Validation Plan:**
- **Pilot Buildings (Month 1-6):**
  - Track tier selection by building segment
  - Monitor conversion from Free to Paid
  - Analyze tier distribution
- **Month 6 Review:**
  - Compare actual vs. projected tier distribution
  - Adjust tier pricing and features based on data
  - Update projections with validated distribution
- **Ongoing:**
  - Monthly tier distribution tracking
  - Quarterly tier optimization
  - Annual tier strategy review

**Sensitivity:**
- **Moderate Sensitivity:** Tier distribution has ±10% impact on effective revenue
- **Break-Even Impact:** ±1-2 months break-even impact for ±10% distribution change
- **Funding Impact:** ±10% funding needs for ±10% distribution change

**Risk Factors:**
- Higher free tier adoption (reduces effective revenue)
- Lower premium/enterprise adoption (reduces average price)
- Competitive pressure (may force lower pricing)

**Mitigation:**
- Optimize freemium value proposition
- Improve premium/enterprise features
- Monitor tier distribution closely
- Adjust tier strategy based on data

---

### 1.3 Conversion Rate (Free to Paid)

**Assumption Value:**
- **Base:** 45% conversion rate (free to paid)
- **Range:** 30-60% (by tier and segment)
- **Effective Revenue:** VND 5.6M/building/month (70% paid × VND 8M)

**Rationale:**
- Based on SaaS freemium conversion benchmarks (30-50%)
- Accounts for building segment differences (affordable vs. premium)
- Conservative estimate to account for market uncertainty
- Will improve over time with better onboarding and value proposition

**Source:**
- Industry benchmarks: SaaS freemium conversion (30-50%)
- Market research: Building management software conversion (40-60%)
- Internal estimate: Conservative estimate for Vietnam market
- Pilot building target: 40-50% conversion

**Validation Plan:**
- **Pilot Buildings (Month 1-6):**
  - Track conversion rate by building segment
  - Monitor conversion funnel (signup → trial → paid)
  - A/B test onboarding and value proposition
  - Survey non-converters for feedback
- **Month 6 Review:**
  - Analyze actual vs. projected conversion rates
  - Identify conversion barriers
  - Optimize conversion strategy
  - Update projections with validated conversion rates
- **Ongoing:**
  - Monthly conversion rate tracking
  - Quarterly conversion optimization
  - Annual conversion strategy review

**Sensitivity:**
- **High Sensitivity:** Conversion rate has ±13% impact on effective revenue for ±20% change
- **Break-Even Impact:** ±2 months break-even impact for ±20% conversion change
- **Funding Impact:** ±13% funding needs for ±20% conversion change

**Risk Factors:**
- Lower conversion than expected (reduces effective revenue)
- Market education needed (may take time to convert)
- Competitive pressure (may reduce conversion)

**Mitigation:**
- Optimize freemium value proposition
- Improve onboarding process
- Test conversion strategies
- Monitor conversion rates closely

---

## 2. Cost Assumptions

### 2.1 Infrastructure Cost per Building

**Assumption Value:**
- **Dedicated VPS:** VND 1.25M/building/month ($50/building/month)
- **Core Hub (Shared):** VND 0.5M/building/month (allocated)
- **Total Infrastructure:** VND 1.75M/building/month

**Rationale:**
- Dedicated VPS per building for data isolation and scalability
- Core hub for SSO and monitoring services (shared across all buildings)
- Cost allocation based on number of buildings
- Scalable infrastructure model (ready for hand-over)

**Source:**
- DigitalOcean pricing: $50/month for dedicated VPS (4GB RAM, 2 vCPU)
- Core hub estimate: $20/month shared infrastructure (allocated per building)
- Infrastructure cost analysis: `3-technical/3.1-system-foundation/infrastructure-cost-allocation-analysis.md`
- Internal estimate: Based on technical architecture

**Validation Plan:**
- **Pilot Buildings (Month 1-6):**
  - Monitor actual infrastructure costs per building
  - Track resource usage (CPU, memory, storage)
  - Optimize infrastructure configuration
- **Month 6 Review:**
  - Compare actual vs. projected infrastructure costs
  - Adjust infrastructure strategy if needed
  - Update projections with validated costs
- **Ongoing:**
  - Monthly infrastructure cost tracking
  - Quarterly infrastructure optimization
  - Annual infrastructure strategy review

**Sensitivity:**
- **Low Sensitivity:** Infrastructure cost has ±6% impact on total costs for ±20% change
- **Break-Even Impact:** ±1 month break-even impact for ±20% infrastructure cost change
- **Funding Impact:** ±6% funding needs for ±20% infrastructure cost change

**Risk Factors:**
- Higher infrastructure costs than expected
- Scaling issues (may require more resources)
- Infrastructure provider price increases

**Mitigation:**
- Monitor infrastructure costs closely
- Optimize resource usage
- Negotiate volume discounts
- Consider alternative infrastructure providers

---

### 2.2 Operational Cost per Building

**Assumption Value:**
- **BQL Partnership:** VND 1-2M/building/month (revenue share or fixed fee)
- **Moderators:** VND 0.5-1M/building/month (part-time moderators)
- **Support:** VND 0.2-0.5M/building/month (customer support)
- **Total Operational:** VND 1.7-3.5M/building/month (average: VND 2.6M)

**Rationale:**
- BQL partnership for building management integration (revenue share model)
- Moderators for content moderation and community management
- Support for customer service and technical support
- Varies by building size and segment

**Source:**
- Market research: BQL partnership models (revenue share 10-20%)
- Industry benchmarks: Moderator costs (VND 0.5-1M/month per building)
- Internal estimate: Based on operational model
- Pilot building feedback: Will refine with actual data

**Validation Plan:**
- **Pilot Buildings (Month 1-6):**
  - Track actual operational costs per building
  - Monitor BQL partnership costs (revenue share or fixed fee)
  - Measure moderator and support time/costs
- **Month 6 Review:**
  - Compare actual vs. projected operational costs
  - Optimize operational model
  - Update projections with validated costs
- **Ongoing:**
  - Monthly operational cost tracking
  - Quarterly operational optimization
  - Annual operational strategy review

**Sensitivity:**
- **Moderate Sensitivity:** Operational cost has ±11% impact on total costs for ±20% change
- **Break-Even Impact:** ±1-2 months break-even impact for ±20% operational cost change
- **Funding Impact:** ±11% funding needs for ±20% operational cost change

**Risk Factors:**
- Higher BQL partnership costs than expected
- More moderators needed than expected
- Higher support costs than expected

**Mitigation:**
- Negotiate favorable BQL partnership terms
- Optimize moderator efficiency
- Automate support where possible
- Monitor operational costs closely

---

### 2.3 Customer Acquisition Cost (CAC)

**Assumption Value:**
- **Direct Sales:** VND 10M per building (average)
- **Partner Sales:** VND 3M per building
- **Community Ambassador:** VND 1.5M per building
- **Loss Leader:** VND 50M per building (strategic)
- **Weighted Average:** VND 10M per building

**Rationale:**
- Based on industry benchmarks (CAC = 10-20% of LTV for healthy SaaS)
- Multiple channels with different CACs
- Weighted average based on expected channel mix
- Will optimize over time with better channels

**Source:**
- Industry benchmarks: B2B SaaS CAC (10-20% of LTV)
- Market research: Sales and marketing costs in Vietnam
- Internal estimate: Based on sales model and team structure
- Framework-based: `5-financing/projections/framework-based-financial-projections-2025-12.md`

**Validation Plan:**
- **Pilot Buildings (Month 1-6):**
  - Track CAC by channel (direct sales, partners, ambassadors)
  - Monitor sales and marketing costs
  - Measure conversion rates by channel
- **Month 6 Review:**
  - Compare actual vs. projected CAC
  - Identify most efficient channels
  - Optimize CAC by channel
  - Update projections with validated CAC
- **Ongoing:**
  - Monthly CAC tracking by channel
  - Quarterly CAC optimization
  - Annual CAC strategy review

**Sensitivity:**
- **High Sensitivity:** CAC has ±17% impact on total costs for ±20% change
- **Break-Even Impact:** ±2 months break-even impact for ±20% CAC change
- **Funding Impact:** ±17% funding needs for ±20% CAC change

**Risk Factors:**
- Higher CAC than expected (reduces profitability)
- Inefficient sales channels
- Competitive pressure (may increase CAC)

**Mitigation:**
- Focus on lower-CAC channels (partners, ambassadors)
- Optimize sales process
- Monitor CAC by channel closely
- Adjust channel mix based on efficiency

---

## 3. Growth Assumptions

### 3.1 Building Acquisition Rate

**Assumption Value:**
- **Conservative:** 1-3 buildings/month (after Month 6)
- **Realistic:** 3-5 buildings/month (after Month 6)
- **Optimistic:** 5-8 buildings/month (after Month 6)
- **Year 1 Total:** 20-40 buildings (Realistic: 25-35)

**Rationale:**
- Based on realistic ramp-up timeline (6 months pilot, then growth)
- Accounts for sales capacity and market constraints
- Conservative to account for market uncertainty
- Will accelerate with proven model and partnerships

**Source:**
- Market research: Building acquisition timeline (6-12 months sales cycle)
- Internal estimate: Based on sales team capacity and market size
- Pilot building experience: 1 building in 3 months (MVP)
- Framework-based: `5-financing/projections/framework-based-financial-projections-2025-12.md`

**Validation Plan:**
- **Pilot Buildings (Month 1-6):**
  - Track building acquisition rate
  - Monitor sales pipeline and conversion
  - Measure sales cycle length
- **Month 6 Review:**
  - Compare actual vs. projected acquisition rate
  - Identify growth constraints
  - Optimize sales process
  - Update projections with validated growth rate
- **Ongoing:**
  - Monthly building acquisition tracking
  - Quarterly growth optimization
  - Annual growth strategy review

**Sensitivity:**
- **High Sensitivity:** Growth rate has ±7% impact on revenue for ±20% change
- **Break-Even Impact:** ±2 months break-even impact for ±20% growth change
- **Funding Impact:** ±7% funding needs for ±20% growth change

**Risk Factors:**
- Slower growth than expected (delays break-even)
- Sales capacity constraints
- Market education needed (may take time)

**Mitigation:**
- Optimize sales process
- Scale sales team as needed
- Focus on high-quality channels
- Monitor growth rate closely

---

### 3.2 Market Size and Penetration

**Assumption Value:**
- **Total Market:** 6,000-8,000 buildings in HCMC
- **Target Market:** 2,000-3,000 buildings (mid-range and high-end)
- **Year 1 Penetration:** 0.4-0.6% (25-35 buildings)
- **Year 3 Penetration:** 1.3-2.0% (80-120 buildings)

**Rationale:**
- Based on market research (HCMC building count and segmentation)
- Focus on mid-range and high-end segments (better fit for platform)
- Conservative penetration assumptions (early stage)
- Will expand to more segments over time

**Source:**
- Market research: `1-ideas/market-research/reports/comprehensive-market-research-2025-12.md`
- Building segment analysis: `1-ideas/market-research/reports/building-segment-analysis-behavior-differences-2025-12.md`
- HCM market analysis: `1-ideas/market-research/reports/hcm-market-analysis-resident-estimates-2025-12.md`
- Internal estimate: Based on market sizing and segmentation

**Validation Plan:**
- **Pilot Buildings (Month 1-6):**
  - Validate market size with actual building data
  - Test market penetration assumptions
  - Identify target segments
- **Month 6 Review:**
  - Compare actual vs. projected market penetration
  - Refine target segments
  - Update market size estimates
  - Update projections with validated market assumptions
- **Ongoing:**
  - Quarterly market size review
  - Annual market penetration analysis
  - Market expansion planning

**Sensitivity:**
- **Low Sensitivity:** Market size has minimal impact on short-term projections
- **Long-Term Impact:** Market size limits long-term growth potential
- **Funding Impact:** Market size affects total addressable market (TAM) for investors

**Risk Factors:**
- Smaller market than expected
- Lower penetration than expected
- Competitive pressure (reduces market share)

**Mitigation:**
- Validate market size with research
- Focus on high-value segments
- Expand to adjacent markets if needed
- Monitor market penetration closely

---

## 4. Churn Assumptions

### 4.1 Monthly Churn Rate

**Assumption Value:**
- **Conservative:** 5% monthly (60% annual) - high churn
- **Realistic:** 3-4% monthly (36-48% annual) - moderate churn
- **Optimistic:** 2-3% monthly (24-36% annual) - low churn
- **Base:** 3.5% monthly (42% annual)

**Rationale:**
- Based on industry benchmarks (B2B SaaS: 5-10% annual, but we're B2B2C with higher churn)
- Accounts for building management turnover and budget constraints
- Conservative to account for market uncertainty
- Will improve over time with better retention

**Source:**
- Industry benchmarks: B2B SaaS churn (5-10% annual), but our model is B2B2C
- Market research: Building management software churn (30-50% annual)
- Internal estimate: Conservative estimate for Vietnam market
- Framework-based: `5-financing/projections/framework-based-financial-projections-2025-12.md`

**Validation Plan:**
- **Pilot Buildings (Month 1-6):**
  - Track churn rate by building segment
  - Monitor churn reasons (budget, management change, dissatisfaction)
  - Measure retention efforts effectiveness
- **Month 6 Review:**
  - Compare actual vs. projected churn rate
  - Identify churn drivers
  - Optimize retention strategy
  - Update projections with validated churn rate
- **Ongoing:**
  - Monthly churn rate tracking
  - Quarterly retention optimization
  - Annual retention strategy review

**Sensitivity:**
- **High Sensitivity:** Churn rate has ±12% impact on LTV for ±20% change
- **Break-Even Impact:** ±3 months break-even impact for ±20% churn change
- **Funding Impact:** ±12% funding needs for ±20% churn change

**Risk Factors:**
- Higher churn than expected (reduces LTV and profitability)
- Building management turnover (may cause churn)
- Budget constraints (may cause churn)

**Mitigation:**
- Improve onboarding process
- Increase retention efforts
- Monitor churn reasons closely
- Optimize retention strategy

---

### 4.2 Average Customer Lifetime

**Assumption Value:**
- **Conservative:** 20 months (5% monthly churn)
- **Realistic:** 28.6 months (3.5% monthly churn)
- **Optimistic:** 40 months (2.5% monthly churn)
- **Base:** 28.6 months

**Rationale:**
- Calculated from churn rate: Lifetime = 1 / Monthly Churn Rate
- Accounts for building management lifecycle
- Conservative to account for market uncertainty
- Will improve with better retention

**Source:**
- Calculated from churn rate assumptions
- Industry benchmarks: B2B SaaS lifetime (20-40 months)
- Framework-based: `5-financing/projections/framework-based-financial-projections-2025-12.md`

**Validation Plan:**
- **Pilot Buildings (Month 1-6):**
  - Track customer lifetime by building segment
  - Monitor retention over time
- **Month 6 Review:**
  - Compare actual vs. projected customer lifetime
  - Update projections with validated lifetime
- **Ongoing:**
  - Monthly customer lifetime tracking
  - Quarterly lifetime analysis
  - Annual lifetime review

**Sensitivity:**
- **High Sensitivity:** Customer lifetime directly impacts LTV
- **Break-Even Impact:** ±3 months break-even impact for ±20% lifetime change
- **Funding Impact:** ±12% funding needs for ±20% lifetime change

**Risk Factors:**
- Shorter lifetime than expected (reduces LTV)
- Higher churn than expected

**Mitigation:**
- Improve retention (reduces churn, increases lifetime)
- Monitor lifetime closely
- Optimize retention strategy

---

## 5. Unit Economics Assumptions

### 5.1 Lifetime Value (LTV)

**Assumption Value:**
- **Conservative:** VND 80M per building (20 months × VND 4M/month contribution margin)
- **Realistic:** VND 100M per building (28.6 months × VND 3.5M/month contribution margin)
- **Optimistic:** VND 120M per building (40 months × VND 3M/month contribution margin)
- **Base:** VND 100M per building

**Rationale:**
- Calculated: LTV = Average Lifetime × Monthly Contribution Margin
- Contribution margin = Revenue - Variable Costs (infrastructure + operational)
- Accounts for churn and pricing
- Conservative to account for market uncertainty

**Source:**
- Calculated from lifetime and contribution margin assumptions
- Industry benchmarks: B2B SaaS LTV (3-5× CAC for healthy)
- Framework-based: `5-financing/projections/framework-based-financial-projections-2025-12.md`

**Validation Plan:**
- **Pilot Buildings (Month 1-6):**
  - Track actual LTV by building segment
  - Monitor contribution margin
  - Measure customer lifetime
- **Month 6 Review:**
  - Compare actual vs. projected LTV
  - Update projections with validated LTV
- **Ongoing:**
  - Monthly LTV tracking
  - Quarterly LTV analysis
  - Annual LTV review

**Sensitivity:**
- **High Sensitivity:** LTV directly impacts profitability and unit economics
- **Break-Even Impact:** ±3 months break-even impact for ±20% LTV change
- **Funding Impact:** ±12% funding needs for ±20% LTV change

**Risk Factors:**
- Lower LTV than expected (reduces profitability)
- Higher churn than expected (reduces lifetime)
- Lower pricing than expected (reduces contribution margin)

**Mitigation:**
- Improve retention (increases lifetime, increases LTV)
- Optimize pricing (increases contribution margin, increases LTV)
- Monitor LTV closely
- Optimize unit economics

---

### 5.2 LTV/CAC Ratio

**Assumption Value:**
- **Direct Sales:** 10× (VND 100M LTV / VND 10M CAC)
- **Partner Sales:** 33× (VND 100M LTV / VND 3M CAC)
- **Community Ambassador:** 67× (VND 100M LTV / VND 1.5M CAC)
- **Weighted Average:** 10× (excellent)

**Rationale:**
- Based on industry benchmarks (3-5× healthy, 5-10× excellent)
- Multiple channels with different ratios
- Weighted average based on expected channel mix
- Excellent unit economics

**Source:**
- Calculated from LTV and CAC assumptions
- Industry benchmarks: B2B SaaS LTV/CAC (3-5× healthy, 5-10× excellent)
- Framework-based: `5-financing/projections/framework-based-financial-projections-2025-12.md`

**Validation Plan:**
- **Pilot Buildings (Month 1-6):**
  - Track LTV/CAC by channel
  - Monitor unit economics
- **Month 6 Review:**
  - Compare actual vs. projected LTV/CAC
  - Optimize channels based on efficiency
  - Update projections with validated LTV/CAC
- **Ongoing:**
  - Monthly LTV/CAC tracking
  - Quarterly unit economics optimization
  - Annual unit economics review

**Sensitivity:**
- **High Sensitivity:** LTV/CAC directly impacts profitability and scalability
- **Break-Even Impact:** Significant impact on break-even timeline
- **Funding Impact:** Significant impact on funding needs

**Risk Factors:**
- Lower LTV/CAC than expected (reduces profitability)
- Higher CAC than expected (reduces ratio)
- Lower LTV than expected (reduces ratio)

**Mitigation:**
- Focus on high LTV/CAC channels (partners, ambassadors)
- Optimize CAC (reduce costs)
- Improve LTV (increase lifetime, pricing)
- Monitor LTV/CAC closely

---

### 5.3 Payback Period

**Assumption Value:**
- **Direct Sales:** 2.4 months (VND 10M CAC / VND 4.15M/month contribution margin)
- **Partner Sales:** 0.7 months (VND 3M CAC / VND 4.15M/month contribution margin)
- **Community Ambassador:** 0.4 months (VND 1.5M CAC / VND 4.15M/month contribution margin)
- **Weighted Average:** 2.4 months (excellent)

**Rationale:**
- Calculated: Payback = CAC / Monthly Contribution Margin
- Based on industry benchmarks (3-6 months excellent, 6-12 months healthy)
- Excellent payback period enables fast scaling
- Multiple channels with different payback periods

**Source:**
- Calculated from CAC and contribution margin assumptions
- Industry benchmarks: B2B SaaS payback (3-6 months excellent, 6-12 months healthy)
- Framework-based: `5-financing/projections/framework-based-financial-projections-2025-12.md`

**Validation Plan:**
- **Pilot Buildings (Month 1-6):**
  - Track payback period by channel
  - Monitor contribution margin
- **Month 6 Review:**
  - Compare actual vs. projected payback period
  - Optimize channels based on payback
  - Update projections with validated payback
- **Ongoing:**
  - Monthly payback tracking
  - Quarterly payback optimization
  - Annual payback review

**Sensitivity:**
- **High Sensitivity:** Payback period directly impacts cash flow and scalability
- **Break-Even Impact:** Significant impact on break-even timeline
- **Funding Impact:** Significant impact on funding needs

**Risk Factors:**
- Longer payback than expected (reduces cash flow)
- Higher CAC than expected (increases payback)
- Lower contribution margin than expected (increases payback)

**Mitigation:**
- Focus on fast payback channels (partners, ambassadors)
- Optimize CAC (reduce costs)
- Improve contribution margin (increase pricing, reduce costs)
- Monitor payback closely

---

## 6. Market Assumptions

### 6.1 Total Addressable Market (TAM)

**Assumption Value:**
- **HCMC Buildings:** 6,000-8,000 buildings
- **Target Segments:** 2,000-3,000 buildings (mid-range and high-end)
- **Serviceable Addressable Market (SAM):** 2,000-3,000 buildings
- **Serviceable Obtainable Market (SOM):** 200-300 buildings (10% penetration in 3-5 years)

**Rationale:**
- Based on market research (HCMC building count and segmentation)
- Focus on mid-range and high-end segments (better fit for platform)
- Conservative penetration assumptions (10% in 3-5 years)
- Will expand to more segments over time

**Source:**
- Market research: `1-ideas/market-research/reports/comprehensive-market-research-2025-12.md`
- HCM market analysis: `1-ideas/market-research/reports/hcm-market-analysis-resident-estimates-2025-12.md`
- Building segment analysis: `1-ideas/market-research/reports/building-segment-analysis-behavior-differences-2025-12.md`
- Internal estimate: Based on market sizing and segmentation

**Validation Plan:**
- **Pilot Buildings (Month 1-6):**
  - Validate market size with actual building data
  - Test market penetration assumptions
- **Month 6 Review:**
  - Compare actual vs. projected market size
  - Refine target segments
  - Update market size estimates
- **Ongoing:**
  - Quarterly market size review
  - Annual market penetration analysis
  - Market expansion planning

**Sensitivity:**
- **Low Sensitivity:** Market size has minimal impact on short-term projections
- **Long-Term Impact:** Market size limits long-term growth potential
- **Funding Impact:** Market size affects TAM for investors

**Risk Factors:**
- Smaller market than expected
- Lower penetration than expected
- Competitive pressure (reduces market share)

**Mitigation:**
- Validate market size with research
- Focus on high-value segments
- Expand to adjacent markets if needed
- Monitor market penetration closely

---

## 7. Operational Assumptions

### 7.1 Team Structure and Costs

**Assumption Value:**
- **Founders/Co-founders:** Equity only (no salary)
- **Technical Lead:** Covered by WEBASEGROUP (no additional cost)
- **Execution Team:** 2 members (VND 15-25M/month each)
- **Onboarding Team:** 1-2 members (when scaling, VND 10-20M/month each)
- **Total Team Costs:** VND 30-50M/month (Year 1)

**Rationale:**
- Founders/co-founders have own companies (WEBASEGROUP, 8Agency)
- Technical Lead covered by WEBASEGROUP
- Minimal team to reduce cash burn
- Scale team as revenue grows

**Source:**
- Team structure analysis: `6-operations/team/team-structure-analysis.md`
- Financing plan: `1-ideas/finance/1.2-initial-financing-plan.md`
- Internal estimate: Based on team structure and market rates

**Validation Plan:**
- **Pilot Buildings (Month 1-6):**
  - Track actual team costs
  - Monitor team productivity
- **Month 6 Review:**
  - Compare actual vs. projected team costs
  - Optimize team structure
  - Update projections with validated costs
- **Ongoing:**
  - Monthly team cost tracking
  - Quarterly team optimization
  - Annual team strategy review

**Sensitivity:**
- **Moderate Sensitivity:** Team costs have ±15% impact on total costs for ±20% change
- **Break-Even Impact:** ±1-2 months break-even impact for ±20% team cost change
- **Funding Impact:** ±15% funding needs for ±20% team cost change

**Risk Factors:**
- Higher team costs than expected
- Need more team members than expected
- Team productivity lower than expected

**Mitigation:**
- Optimize team structure
- Monitor team productivity
- Scale team as revenue grows
- Use existing resources (WEBASEGROUP, 8Agency)

---

### 7.2 Tools and Software Costs

**Assumption Value:**
- **AI Factory Tools:** VND 4M/month maximum (Cursor, Git, etc.)
- **Other Tools:** VND 0-2M/month (as needed)
- **Total Tools:** VND 4-6M/month

**Rationale:**
- AI Factory uses model-agnostic rules-based framework (not dependent on specific LLM)
- Cursor Standard: Under $50/month (including Cursor, Git, etc.)
- Claude may cost $200 for first month, then transition to Cursor Standard
- Minimal tools to reduce cash burn

**Source:**
- Financing plan: `1-ideas/finance/1.2-initial-financing-plan.md`
- AI-first review: `5-financing/reviews/financing-plan-ai-first-review-2025-12.md`
- Internal estimate: Based on tool requirements and pricing

**Validation Plan:**
- **Pilot Buildings (Month 1-6):**
  - Track actual tool costs
  - Monitor tool usage
- **Month 6 Review:**
  - Compare actual vs. projected tool costs
  - Optimize tool usage
  - Update projections with validated costs
- **Ongoing:**
  - Monthly tool cost tracking
  - Quarterly tool optimization
  - Annual tool strategy review

**Sensitivity:**
- **Low Sensitivity:** Tool costs have minimal impact on total costs
- **Break-Even Impact:** Minimal impact on break-even
- **Funding Impact:** Minimal impact on funding needs

**Risk Factors:**
- Higher tool costs than expected
- Need more tools than expected

**Mitigation:**
- Optimize tool usage
- Use free/open-source tools where possible
- Monitor tool costs closely

---

## 8. Assumption Validation Summary

### 8.1 Validation Timeline

**Month 1-6 (Pilot Phase):**
- Track all key assumptions with pilot buildings
- Monitor actual vs. projected metrics
- Identify gaps and risks

**Month 6 Review:**
- Comprehensive review of all assumptions
- Compare actual vs. projected metrics
- Update projections with validated assumptions
- Adjust strategy based on learnings

**Ongoing:**
- Monthly tracking of key metrics
- Quarterly assumption reviews
- Annual comprehensive review

### 8.2 Key Metrics to Validate

**Priority 1 (Critical):**
- CAC (by channel)
- Churn rate
- Conversion rate (free to paid)
- Pricing (average and tier distribution)

**Priority 2 (Important):**
- Growth rate (building acquisition)
- LTV
- Infrastructure costs
- Operational costs

**Priority 3 (Supporting):**
- Market size
- Team costs
- Tool costs

### 8.3 Risk Mitigation

**For High-Sensitivity Assumptions:**
- Test with pilot buildings
- Monitor closely
- Have backup plans
- Adjust quickly based on data

**For Low-Sensitivity Assumptions:**
- Monitor regularly
- Adjust as needed
- Focus on high-sensitivity assumptions first

---

## 9. Conclusion

This enhanced assumptions documentation provides comprehensive details on all financial projection assumptions, including rationale, sources, validation plans, and sensitivity analysis.

**Key Takeaways:**
- ✅ All assumptions documented with rationale and sources
- ✅ Validation plans in place for all assumptions
- ✅ Sensitivity analysis identifies high-risk assumptions
- ✅ Risk mitigation strategies defined
- ⚠️ Need to validate assumptions with pilot buildings (Month 1-6)

**Recommendation:** Use this document to:
1. Track assumption validation progress
2. Update assumptions based on actual data
3. Communicate assumptions to investors
4. Identify and mitigate risks

---

**Status:** Enhanced Assumptions Documentation Complete  
**Next Review:** After pilot building data (Month 6)  
**Update Frequency:** Quarterly or after major changes

