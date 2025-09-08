Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBEB42FFDFA
	for <linux-sound@vger.kernel.org>; Mon,  8 Sep 2025 12:56:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.152.168
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757336202; cv=fail; b=sspZnmokDvGI+9imMtRisgbID+XunZ4GKkSiZ/7KmfywRbt7G05puNCA2zjy6ydgOsY2CJXmo5HRYY/q3S8kz/K58FABrVOOBe2OLRSBGCA486oWM9OaCFAgKOEQWTmyxeHM5/y2tED0JhQ48eQg+wSgVLo5OZl6nknv90vGGEU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757336202; c=relaxed/simple;
	bh=uvimsi06/j4U5UBK6/wu1N7MSDBgPZeC11oewvEGQaI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=A/bn3ss7ui3tKYvIl+/qSmgtYfOGldjE5V3aAcawSfUhsBwC0+XxiMitk7WKUa+Pa6hXxlPhrtjapFil5IrGuEULjLXA0D+3cfgcI9Z0HPCM9BSVpN71Aoa+vzbreJqcMwa7eZYueVS5ufIPkxKOweAPkd0gOdLx1uiqu7mhx+k=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=buevMZOB; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=kfq4YXrK; arc=fail smtp.client-ip=67.231.152.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="buevMZOB";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="kfq4YXrK"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5888UUfV2151922;
	Mon, 8 Sep 2025 07:56:24 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=PODMain02222019; bh=8K2ahRwS8TZ0X3PdA3
	TE7egmf250mJUc/VzziPzBOFc=; b=buevMZOBZnllzAVBKrlkxr/vIst8LEZHLo
	+Gplciue/R8wWC4notvyoet9fcEN5dwu4pGztnVS0L6M5XjkNeG00uMuVd5wDZX7
	Q3BtptXsFNVbSq1SXKQcF+2xi4MiUlsqQiGCjiiIl0OFNM/cUO4lhtGPjq1TwYtk
	z7K5R3mJZamS5a5Apd3/XCqMy0jCzAH2sCKy11C96EsGoBIZuHkrxFFNPaXtv1O3
	LflwjlVPItrVWxgrxlEg/FYMSNN4IqRNmyRRz9mLV2c5RL0mp2b/6erNT3P0fvq6
	oUSxC+IGW9vOBy8iV4NC5sAsbfssB8tGTZkIhUysgO5QTcXMA/RQ==
Received: from nam10-dm6-obe.outbound.protection.outlook.com (mail-dm6nam10on2107.outbound.protection.outlook.com [40.107.93.107])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 491upq8899-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 08 Sep 2025 07:56:24 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NSUYkn8AcciH1jqr/Y8tUWBrxKNLE/X03KFMq39QN6dIw2XTLOtF56Ho8wev+RfxipsJaAurFFtbM+QF5O5KY29fBJglCd0S6vSyJ4uA/dnSn1j+7um04Az3aeRKmLpj8swUMvouuMAu32H0GhbPl6hw4l+ZR9S6A11bwymqeGKNUKT1xKjLy5p2hfLPuo6gYnaPH7XpjcR1tXVRMOzvGiFJvUUlQRcIbB5A3mqzdtUc4g+8KYTITJCBa8LPoJW25MxBFrClwtFwRRZNkXSZ/kx5pqR0vWCgAtdXYvnOowVjD3LcJ4CR1CGGUZBEV1tDzhxxcTIqtSyUusrrGmGh5A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8K2ahRwS8TZ0X3PdA3TE7egmf250mJUc/VzziPzBOFc=;
 b=lM7s6iEUbsG3RYOoFLp3iGxwp6V54k2+M/djCNiEMIxcYLdMhI8ttbLYiZ10NDZsCzbzuj6lS6aJyUa/crqfihmJNLK1iwIbQo/rEZn74e6PUmCRtXpWvF9LdnIkSzlq+4YZDomcH9CWD0UFFMgPjg+9Nc0u4vTGPFCSAe+V5rkdtk47/b40ekAMMkTvk7FUdzJ5LSU0FY1eKNs+3b2W2kUq5xKDavB67Hr9TSbVLMyS5eYpNS+WFAWVnfNUpdnfZOXeTLp1p6HKJURdfdkthHzdTSrm+waZv2IB8zErhmv1bmJo8ECbWfvAgwhmiHP0EHJxxKeA0X++c/uFMejkSw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8K2ahRwS8TZ0X3PdA3TE7egmf250mJUc/VzziPzBOFc=;
 b=kfq4YXrKXGIsWGlLy7X44+5INZQ8k4IpmNTk8rM7Pib3fx3fM/v0X1Ij5keCLrc/GelNww9u5aZFwRj47A6coSJMmaAoXAazZSQf/DX0do5xl7shONQ6IRCpbvZAWQZo7BHhajJfrrQGpSUrzaFx0l7dyO/jMZHqiNIV3VX3Eb4=
Received: from SN7PR04CA0085.namprd04.prod.outlook.com (2603:10b6:806:121::30)
 by DS2PR19MB9649.namprd19.prod.outlook.com (2603:10b6:8:2d3::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9094.22; Mon, 8 Sep
 2025 12:56:20 +0000
Received: from SN1PEPF00036F40.namprd05.prod.outlook.com
 (2603:10b6:806:121:cafe::cc) by SN7PR04CA0085.outlook.office365.com
 (2603:10b6:806:121::30) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9094.22 via Frontend Transport; Mon,
 8 Sep 2025 12:56:05 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: Fail (protection.outlook.com: domain of opensource.cirrus.com
 does not designate 84.19.233.75 as permitted sender)
 receiver=protection.outlook.com; client-ip=84.19.233.75;
 helo=edirelay1.ad.cirrus.com;
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 SN1PEPF00036F40.mail.protection.outlook.com (10.167.248.24) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9115.13
 via Frontend Transport; Mon, 8 Sep 2025 12:56:19 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 22B64406540;
	Mon,  8 Sep 2025 12:56:18 +0000 (UTC)
Received: from opensource.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id 0AE78820247;
	Mon,  8 Sep 2025 12:56:18 +0000 (UTC)
Date: Mon, 8 Sep 2025 13:56:16 +0100
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>
Cc: broonie@kernel.org, rafael@kernel.org, yung-chuan.liao@linux.intel.com,
        peter.ujfalusi@linux.intel.com, shumingf@realtek.com,
        lgirdwood@gmail.com, linux-sound@vger.kernel.org,
        patches@opensource.cirrus.com
Subject: Re: [PATCH 04/15] ASoC: SDCA: Pass device register map from IRQ
 alloc to handlers
Message-ID: <aL7ScExrl3u1TlLs@opensource.cirrus.com>
References: <20250905143123.3038716-1-ckeepax@opensource.cirrus.com>
 <20250905143123.3038716-5-ckeepax@opensource.cirrus.com>
 <2f9bffb7-1f89-477e-b2f2-09974b189d57@linux.dev>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2f9bffb7-1f89-477e-b2f2-09974b189d57@linux.dev>
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF00036F40:EE_|DS2PR19MB9649:EE_
X-MS-Office365-Filtering-Correlation-Id: 2985be10-16c7-4c88-7188-08ddeed71b51
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|61400799027|82310400026|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?INiNqwfx2z93W3RbmcPPuRdEycg16pOzifMlcRh5cFkq4NggOa6lFMBP7cGK?=
 =?us-ascii?Q?FZDKwOTs1T2KCYcZuTG6lb+wXURycYZhs5S/LlCGUOUTxYZUAXEioQTv8gZ1?=
 =?us-ascii?Q?DuV3VVwss2htm4io8Zf/SD6ewq69ifIxtTVAsWbM/ceWqEWLIcuAtPaAQT5h?=
 =?us-ascii?Q?ByHQ+QN/cP5q3O29EytLZgK6rTzZvhk1lo5760j7ZZ16sO1juap9Jt1MpVXa?=
 =?us-ascii?Q?NRUlD1OoXUrWt9NflH+SnTULaLtcpxWqcOTb2UxIKRvmdNJR0ey8dvNodo9L?=
 =?us-ascii?Q?1bcfYPG7wVg3cq1Nn1m52K+EXOAQLDQlIAsEyMwNea01pFKXcZ8qiSbxkbs4?=
 =?us-ascii?Q?bwEK803AJ4vrxMTO61WwuB/LUFvrloRpHluKihlb+rZB1VXnGcwLj5Zxhb3g?=
 =?us-ascii?Q?5LD0fW0n1yDSKoOCwoksw60tslLs4J48oR4MjaqbARPx2rhmMqa+MR3sFhhT?=
 =?us-ascii?Q?WHdD9JVZusB7pPgaAC9qdHpnA5G/JFSCuqPgs1TpJSxoxOvtCmSGlWBDh9Ei?=
 =?us-ascii?Q?Rj9QWyWuENIUZaJpWycFUEfLqFVEo3xtL0bdY023fQkG9R/v9dVfOZPSrgOK?=
 =?us-ascii?Q?CpapVx0oRowqwLEfuAmW3goxSBxT24yEafr/s79JXj0HN7o1goDjV5RPT4WI?=
 =?us-ascii?Q?CaYv6Y13ICI5804TRRG1PfDV9PU5EjrzD7SkEfM0BebcORUgjzuAdAc+bgUY?=
 =?us-ascii?Q?wyykebO09tIelOOHwSyyCRFT0EM2PHxR97u2nPpYZ36rYnKPWLjZqpEYYU7z?=
 =?us-ascii?Q?Vh2ZzIC0f/UH5jMk5jw5b/jl4bWPZKz0EGBvZxSTzFUc0LkKbWjqW8Sfes+q?=
 =?us-ascii?Q?nqLNTo4F5XoDSmhUOKdoWZ0VqU5IqfAbIpIjphfIP1d8U8Fmu1P4wQCTzOvT?=
 =?us-ascii?Q?fm3RLGzSjYll6GlMvtkL2Dar7ZZ+1Qg9ULO+k/5DQKUbYbhls1yYurVsESQ1?=
 =?us-ascii?Q?TYZdJdDNVY1KgeRDLk6KbkpeXLVvQoelrruEDu3zxuHgtQ9CWu64KEzR+mYu?=
 =?us-ascii?Q?FA4RP2wmjFDjWBGqTvVf6OEdIBb/jzqI6tdsGj0k3HJK4fbfsdTkIOlnZqMH?=
 =?us-ascii?Q?rm8Q4WAP+gJWFO0JEWrNj7iCTr4g0HjYZNg/OHz3S2QCi7nenn5arFxjbfyc?=
 =?us-ascii?Q?MIXYYCKFUUEr7jYGbvBG4i2MOxuDbEO7esli47Cdi4V6fcsoRMtvRfwOXdMA?=
 =?us-ascii?Q?ZpkqQEN1X1gyOcXbgdgf206+Z8kZAEbnBfQIks4IRjoXiVPReCq14nZ7wDGA?=
 =?us-ascii?Q?9s8h6a5Axu11YwyLgbp025G7Ql83UUSis2t4O/TZx4zmX0CWE2ccRcA7L6FC?=
 =?us-ascii?Q?RvEWzzXd7ytVJBQm2tbiDcYprAWLs9eTN3Uyzx2lA0FW9cirI8GjfkJ8GFZ2?=
 =?us-ascii?Q?OTzwycwPRa4qBb502T3qNQg29c2eiJXFWpPjZ3qX2cGvWcCJbexgK1L1LQG5?=
 =?us-ascii?Q?pBf1aCpTzRlNxHuoZi5DZPZyFzXomShsBHHg4n/2ncSy4tJth7PU24QhTVym?=
 =?us-ascii?Q?onlUF4bMDvRvrkflbjoiBtPQZr4GI5JT27JI?=
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(61400799027)(82310400026)(376014);DIR:OUT;SFP:1102;
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Sep 2025 12:56:19.7233
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2985be10-16c7-4c88-7188-08ddeed71b51
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-SN1PEPF00036F40.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS2PR19MB9649
X-Authority-Analysis: v=2.4 cv=DMuP4zNb c=1 sm=1 tr=0 ts=68bed278 cx=c_pps
 a=MZF0P0Qrwq9/sBmlUe3NwQ==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19
 a=kj9zAlcOel0A:10 a=yJojWOMRYYMA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=2OTKQoomgfnlX5krLm4A:9 a=CjuIK1q_8ugA:10
X-Proofpoint-GUID: PfQ-0_Hkrxul8boOeUjC3dYFB7pOWFI3
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTA4MDEyOSBTYWx0ZWRfX/KdXzYks1XHa
 LUHF6SW9TTjrsuKN/dtOZaK1wwP0ObVODpgyFuACWaGOTVojJAoxXVLg4/FzO7gViE05Ad6DPgC
 VFmUCAuaO51trj0HWoFt9wMEshvomN7rx2ikIkvxjsMUn1MaVhvBhkZlXYoOhZPPSNDiuLWsXuj
 rUyvnjirL9DeT4DpWNwhIO0i9gdJVq7v5CWmPojVA9ToTzbBRWgKegIQ29ujbnlTIRnUZypv1JF
 WIKtqkRcgaKm9UoCpMEdB1PaUPmFrH6DwwiFcUrFYry2LS2w59HOKFK6Gzzydabw7+ElQmgAi6i
 D9qtyCeDr0JJM5ziUOU3blasUjjmYeKLWJSiRzAjdphS4WjCWqEnk0PJ/oejuo=
X-Proofpoint-ORIG-GUID: PfQ-0_Hkrxul8boOeUjC3dYFB7pOWFI3
X-Proofpoint-Spam-Reason: safe

On Mon, Sep 08, 2025 at 01:49:43PM +0200, Pierre-Louis Bossart wrote:
> On 9/5/25 16:31, Charles Keepax wrote:
> > Store a copy of the device register map in the structure for the IRQ
> > handlers. This will allow the individual IRQ handlers access to the
> > device level register map if required.
> 
> Sorry, not following how you plan on sharing access to regmap between
> parent and child devices.

They all have a pointer to the device level register map, if some
function or the device level is using it the regmap lock will be
held and the others are block.

> 
> 
> > @@ -445,6 +445,9 @@ struct sdca_interrupt_info *sdca_irq_allocate(struct device *dev,
> >  
> >  	info->irq_chip = sdca_irq_chip;
> >  
> > +	for (i = 0; i < ARRAY_SIZE(info->irqs); i++)
> > +		info->irqs[i].device_regmap = regmap;
> > +
> 
> Lost on this one as well. A child device could support multiple
> interrupts, e.g. for buttons and jack, not sure why each interrupt
> needs a separate pointer to the same identical information.

Most IRQs don't need custom handling so the core can handle those
IRQs. In the case of custom IRQs the driver would register some
private data structure that would contain necessary information
for the handler such as regmaps. This array of interrupt
structures is basically that private data. A pointer to this
structure will be passed to the IRQ when it fires and it needs to
contain all the stuff the IRQ handler needs, one of those things
might be the device level register map.

Thanks,
Charles
