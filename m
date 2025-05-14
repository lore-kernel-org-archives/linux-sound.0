Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01A272A1D1
	for <linux-sound@vger.kernel.org>; Wed, 14 May 2025 13:30:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.152.168
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747229424; cv=fail; b=NuG7pb3OG2V/x9zgbaBerBO+47lh6UGeBrQqFbIdv+bHzHMzy3gyHL36cGrqijt/mVWtbhzdK33hcK5EMF2lc8rSAx1XWtBBNB6cIAhOrHB21rZx1sB0Ooj6RmLcvmj/2ly5ibriiJMvtmw7vK9wGvMVdjX/EcpI1H+3KfqeQJ8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747229424; c=relaxed/simple;
	bh=4SKFPI+mHbxKfeNY3HUm32RwTE2Tjgx9/qG0IfHPGKs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UFCQ/vE5JcL5VcA7E6/2cdyZUiX/SkqrSSVA47+1PyOZkvqqVI+STfdlZirp2eO9PLB76qNpgwGKE+CIec5EXoCABSiVk/d37ndtqgPbkPEHqWL4hecKsTDVSZxGsA52JufAC7SMkZT37B06/sQT9ZU8sd/pFMzdq2HFEVeULSk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=TA1JAHwz; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=cBvrKbCh; arc=fail smtp.client-ip=67.231.152.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="TA1JAHwz";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="cBvrKbCh"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54E06tQm001039;
	Wed, 14 May 2025 08:30:06 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=PODMain02222019; bh=4vC0d7NAib9GKF1WmP
	g3OOpdet+knG9hmVHfrMP3UUk=; b=TA1JAHwzXfBD1X2I9kpcsuV64u4IYOq0D4
	YZpXnxpEOsQ3vPGxIo4CiaXbMv/S9oY4E3Z4MFC4Zlqui+njP4wUUQ7LLRJ3FsPc
	VL5/DF16CdC1wNBC2G1N/YawV1L8OY1rp8jHk+vclaX8YkNDemvLvlR+HnMqrZ02
	wh7tYXWYZvDV8eh2kas5Hyeje7IKcIHvQxOmzmMadhNI/gTTSsSSr1UZdkugcI9Q
	jGluxj65LcXqAbQKf5KUIwdo/nfd7y93B7csIvCztjK+YNKVK+xXRfsq4CTaTyhZ
	Sm3NHBHrsLeL+JlemCmzG9ILL5fva5JTjEtMz1phNXT0Z33K1NeA==
Received: from nam10-dm6-obe.outbound.protection.outlook.com (mail-dm6nam10lp2040.outbound.protection.outlook.com [104.47.58.40])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 46mbdr95hd-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 14 May 2025 08:30:06 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Lwpj238nGn9siAXg3nIGD3MyL6Yh5zbIWYlZmWvccaMiCi443pXVACgZ+bT5OOprOFKeLLAEws4zx96Caen30LXmRxgJbTyAIlnOFfN4KfPPDMDtYuT3cqJYyP96FcU9DfGxQvnTD58XzQINWdpDljAhebmNaKRVGsQDTUskH7xSS0lwcgnAC3QH2GZzgyZy6tb14yRinTjkbifofw7iFoNz7Q6tosH2GnEpnuaJKt4sX9U4gb2aoAYDh0B0uS3l7/LaHvM8bc8HI1DAa+icl8CixUw8DQGc9qqEZux2m18cjKIxowoQr0pBAGfxULuuTHB0zaKvko9Dcqwq9zmQCw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4vC0d7NAib9GKF1WmPg3OOpdet+knG9hmVHfrMP3UUk=;
 b=jDiyZObzDQ356rMXOa+lJnmRSQ6tCWYSqaHlp+jm/RoCm/T1VAH7viamQHPKIUtQ4NRIqjAXe+0RSej5IK9W1dsbOVzl3w+hIQlSEoTJllalSVoanLh3rRjc5xVmXpc9r6O8IVm4McxuGHMr3BDeyQO4ka14saFDCQ5W62Wq5E3qDCWUwsMVP20fPTG9LyJK55Mc3AUCFaFrEOd3vFM5ifNXpzh6SpIxPC9+cD/geYQvE0CllCph4TV++9yeFiCfrjKSK5F/vOUH6ntloMqOldwlbGQ1Af2DG7Dnk6TIUIHWEJArEmXvZq8+EyYsNqgXFWTMj0h3rlsnVVkHD6X0ZQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4vC0d7NAib9GKF1WmPg3OOpdet+knG9hmVHfrMP3UUk=;
 b=cBvrKbChwr/0tPjaz5CrgZmMUSBICE050R9O6OyiyMFh3ztMYMzdMXlOzNGLLqBg5a0Lwa5V8mZ8IcIPE4bLGyDIV4U7ZjCn2h7AoF03S2EHSAEufCDaUdUqOGwXWywXo3Uima/mLC/oXjIQJu/GyRYo82m9Sw9FY5aUb8uXeR8=
Received: from BLAPR03CA0087.namprd03.prod.outlook.com (2603:10b6:208:329::32)
 by BL4PR19MB8904.namprd19.prod.outlook.com (2603:10b6:208:5a7::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.29; Wed, 14 May
 2025 13:30:03 +0000
Received: from BN3PEPF0000B36D.namprd21.prod.outlook.com
 (2603:10b6:208:329:cafe::3c) by BLAPR03CA0087.outlook.office365.com
 (2603:10b6:208:329::32) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8722.20 via Frontend Transport; Wed,
 14 May 2025 13:30:03 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: Fail (protection.outlook.com: domain of opensource.cirrus.com
 does not designate 84.19.233.75 as permitted sender)
 receiver=protection.outlook.com; client-ip=84.19.233.75;
 helo=edirelay1.ad.cirrus.com;
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 BN3PEPF0000B36D.mail.protection.outlook.com (10.167.243.164) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8769.1
 via Frontend Transport; Wed, 14 May 2025 13:30:02 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 982D4406545;
	Wed, 14 May 2025 13:30:01 +0000 (UTC)
Received: from opensource.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPS id 773E682026C;
	Wed, 14 May 2025 13:30:01 +0000 (UTC)
Date: Wed, 14 May 2025 14:30:00 +0100
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>
Cc: broonie@kernel.org, lgirdwood@gmail.com, yung-chuan.liao@linux.intel.com,
        peter.ujfalusi@linux.intel.com, linux-sound@vger.kernel.org,
        patches@opensource.cirrus.com
Subject: Re: [PATCH v5 4/6] ASoC: SDCA: Create DAPM widgets and routes from
 DisCo
Message-ID: <aCSa2AuuQrZlEPi7@opensource.cirrus.com>
References: <20250512124240.799509-1-ckeepax@opensource.cirrus.com>
 <20250512124240.799509-5-ckeepax@opensource.cirrus.com>
 <470de11c-82b1-4d1f-aa52-e0849ea261e1@linux.dev>
 <aCIrKasDhXrI9SLq@opensource.cirrus.com>
 <01e25477-5475-457a-8c33-4b6c9fdbdd3e@linux.dev>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <01e25477-5475-457a-8c33-4b6c9fdbdd3e@linux.dev>
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN3PEPF0000B36D:EE_|BL4PR19MB8904:EE_
X-MS-Office365-Filtering-Correlation-Id: c7650681-79f9-47f6-d39e-08dd92eb6e91
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|61400799027|36860700013|82310400026|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?H3WSn3+W7qUD3TA68wyUipsAXbmXZt1+Kwa5FddETKSk6mAC4SO7H15Y0jvb?=
 =?us-ascii?Q?3lPPV/lFNWLuaGV1zbJlXeAZ8faOSo5ysNjG8mkqKMPYNgEGVbg61iVfJTRQ?=
 =?us-ascii?Q?HYP0JRStrPXBFc/BhIfef9Zs4X0PQ3Cc2tRfVEJFfMEVt+T7px0dmZjdgffV?=
 =?us-ascii?Q?MDsp39h5d9oaybAiROqVKkvJIED6B79+zpfmu7mtAJvmQnnP4J/VFT3pqeNe?=
 =?us-ascii?Q?SyFmuY6vOMybCKSb6sBlHa0YNFhlxAy3fEVw7oMO3a5o7mQ1j30NfJx5ASKA?=
 =?us-ascii?Q?BZV7UL/EakGfuJMGwBRCh2tLW772/oSJLOFJDP0a4pGNhpYqOcaXydfPKOIv?=
 =?us-ascii?Q?40t163O5HaVxXNrstXnKjvFBe8jh7Hmle59U1Arw0zw2mAF/eiPUTSij0vh1?=
 =?us-ascii?Q?46VmboCm+S9tibhIF4ZQHbe0OXBcx1OTjb57XCKpcsPJjBfDlUbvNu1jq5Tb?=
 =?us-ascii?Q?MI093Irz4ViPNuy7kpLPJm7mo3kL1vsi1pIFuMbmHOd3nSk/zXTu9Z9qlEJT?=
 =?us-ascii?Q?3VtOHPDdOZoxakIMWPOzJAvXrPxufWkAdHLVvu3WrngApT+si1hOgt/LQdF5?=
 =?us-ascii?Q?Ih4r/vrJwcYy9T1EtLuSxmRF5Pn9FSxEY8qQPRzK7gk+9XSJAvjeJlosmGHM?=
 =?us-ascii?Q?FZzEqIg3AUqnbxQ96dAsIvdS4e1QD2IVti9c5X4fzmFMQrVAON+yXyZp4FRJ?=
 =?us-ascii?Q?2VdBA3BlRh3pWpktp41evyQa4S8TcGmp/8aDFh7qiOXJ2qZjrT9kCRgr/2K5?=
 =?us-ascii?Q?13eMcIOEyuJPEIvpgbHNTC85Nt1sktaHqvGKTUf/oLHEGrNpYXyh61OSiu/Y?=
 =?us-ascii?Q?DFC2+ivU30Kmu098bgCPCrVZcnPIeRWSZYWaFVBzmgf6NkTBbzZwWYF0dkt6?=
 =?us-ascii?Q?z5BREvKxj4ijDsKVaxJsB7GhcKQzQIAuT1pJnAdzp4AuTP+RAQyD9lz3XFrs?=
 =?us-ascii?Q?v8Q4DctRIbKAgQCGb4avDXCII4MErP1R0dvtpC7NheJnLYO8gWkqMKXtM20a?=
 =?us-ascii?Q?fWqeQ9vfCdQLJJaaxVu6RuJAX++h62HPdNcO6EJhAQGIxhntG4OjYsotimmP?=
 =?us-ascii?Q?oGkkm8yuhWswtPCOTLbPRKuVx2lKkStjxbuz2NKdzCzJmQv6nJjEpwUg5H1t?=
 =?us-ascii?Q?GoAEwRthSQJArfRoW2wLkkFiTSQwZenmVoYSuy2Mims5czyS6KvzQsHFlrPC?=
 =?us-ascii?Q?i8q/UV+nJOLFuuP71bA8RFQkspjyENkPLNPRelNthj5ejiQGN/gWApTJmzDr?=
 =?us-ascii?Q?VjpZW8yTzUgLiYTEvbUmtOkvsktGwAyaO9WkMs55zVem+T2cJaVOZiW2LFYk?=
 =?us-ascii?Q?Dj2ZaP1WFCBydpvyi8zggCuVGKsjp3DnDcHbiydR8Aord8hb+wdxrnXtgKCV?=
 =?us-ascii?Q?7bv7TrG8pTAVLlBcs9RcpeJw1UZBPeGlFjBZTBg50nmk1KhAdRJm6lbLUAUv?=
 =?us-ascii?Q?VEkHm/4qgTbhhwomFCygMf45imch3VSXVYvP0zaLZglR3zDI4Lru+J6Dh95z?=
 =?us-ascii?Q?/O2/pM0minEYtBdhpFSk7VtT9EigG3z7uSit?=
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(61400799027)(36860700013)(82310400026)(376014);DIR:OUT;SFP:1102;
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 May 2025 13:30:02.4353
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c7650681-79f9-47f6-d39e-08dd92eb6e91
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN3PEPF0000B36D.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL4PR19MB8904
X-Proofpoint-ORIG-GUID: jv8RRC86RGDy1iRQ9b0YJ7Ox0O6hyXva
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTE0MDExOSBTYWx0ZWRfXxojLMA8VvLzY jnz8D0du/2N0FtEL6j/73yRGwASQLxSw5n9mpqA5VdHWBn6VC568e8rNnuT3nheRlSpB2lrsy9p A56x+5L9UXLnigBFf8yDDvW+2apt0Ij4KAGgO9V5MD8L9ep15mjvUn490Ru2GcAkhiGpf0/tXjU
 mBOKv+ubx7lGy0Q5oaNJkpxh9Lpd2Ue6JRkMkjc7EinN/XLCXec6aI2H6SXxRA2jZyXCyXRCo4x h143ohj52YPMyeaFprdqbfX5utMODqy8oYrQA/eRA6JH9kH29uQQ4WloviC/8s7Nvuicsfzq+/k KMuCYPvTpEsoUvp1A8kH9wMRyLXip89kg6x8JC2mvt5Ep2tJgHq0LNjIqFpo2WROHH9SC+j4XjV
 rbBT2XWyFOZycl2nPJ1LWKaf+oHWG7ZDM40y6Rn9o3yE9RT2ir7QkjdvD2y4O8RdkBVHPUS0
X-Proofpoint-GUID: jv8RRC86RGDy1iRQ9b0YJ7Ox0O6hyXva
X-Authority-Analysis: v=2.4 cv=abNhnQot c=1 sm=1 tr=0 ts=68249ade cx=c_pps a=G+3U1htxrnhIFlrbIuZW0A==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=kj9zAlcOel0A:10 a=dt9VzEwgFbYA:10
 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10 a=yROqFCGEq45UMOAtXTkA:9 a=CjuIK1q_8ugA:10
X-Proofpoint-Spam-Reason: safe

On Wed, May 14, 2025 at 02:15:01PM +0200, Pierre-Louis Bossart wrote:
> > I mean the hard definition here is DAPM routes. But roughly
> > speaking each line on the SDCA function diagram will correspond
> > to a route here, with a few tweaks like the GEs only show a
> > single line going to a red box around a bunch of other entities
> > that will be multiple routes one for each entity in the box.
> 
> This could be described in comments. The SDCA spec shows lines
> of different color for pure data paths and 'control' links. Here
> we are bringing everything back to the same concept of DAPM
> routes, but those extra routes only connect to supply widgets.

Yeah I am happy to add extra comments for this.

> >>> +		values[i + 3] = sdca_range(range, SDCA_SELECTED_MODE_INDEX, i);
> >>
> >> Humm, my memory of GEs is that the hardware reports a 'DETECTED_MODE' and
> >> then software (kernel and/or userspace) can choose a "SELECTED_MODE". here
> >> we only deal with SELECTED_MODE, is this intentional?
> > 
> > This code is creating the ALSA control for the SELECTED_MODE
> > control, the DETECTED_MODE is all handled internally and there is
> > no need to export it.
> 
> Humm, that one doesn't seem right. There could be cases
> where the DETECTED_MODE is inconclusive, or that additional
> vendor-specific steps are needed to decide which SELECTED_MODE
> makes sense. I don't think we should assume everything is
> handled internally, or we have to define what 'internally'
> means. This cannot be generic SDCA stuff, it has to be
> configurable for specific implementations/vendors.

Ok yeah I see, the current code reads the DETECTED_MODE in
the IRQ handler and then updates the selected mode. I guess
currently what is missing is the handling for the JACK_UNKNOWN
case, which could probably require user-space. I think it would
be pretty easy to export the DETECTED_MODE as well I will have a
look.

> >>> +static int entity_pde_event(struct snd_soc_dapm_widget *widget,
> >>> +			    struct snd_kcontrol *kctl, int event)
> >>> +{
> >>> +	struct snd_soc_component *component = widget->dapm->component;
> >>> +	struct sdca_entity *entity = widget->priv;
> >>> +	static const int poll_us = 10000;
> >>
> >> This should be a #define, no?
> >>
> > 
> > I could make it a define if you feel strong but I generally quite
> > like if it just a local delay being using in one place to define
> > it locally, means you don't have to look things up when reading
> > the code.
> 
> I guess my main point was to explain where this 10ms value
> comes from. I am not sure what to make of it, it's either very
> large or very small depending on the initial and desired power
> states. Plus I would expect the sleep times to vary by orders
> of magnitude depending on the type of function managed.

The trouble is there isn't a great way to parse from the DisCo
what a good poll interval would be. I guess we could change to
say 1/100th of the maximum, clipped to a minimum time? My concern
is the maximums can be quite long so something based on them
definitely runs the risk of really under polling and introducing
a lot of lag.

> >> Can you remind me in which cases we have a Selector Unit not
> >> controlled by a GE, and what userspace would do with such kcontrols?
> >>
> > 
> > A selector unit not tidied to a GE is just a DAPM mux, it
> > provides an ALSA control which allows user-space to select which
> > input it wants routed through the selector.
> 
> I meant in which topologies is this used/needed?

Its also nice to support topologies above the set ones in the
spec, but the current in spec users of these would be:

UAJ:
SU136 - Which lets you mux the second jack capture onto the primary
capture path.
SU137 - Which lets you sidetone from the second jack capture.

Admittedly our chips don't currently have those but since I
implemented SU support before GE support we had code for this
anyway.

> >>> +		case SDCA_ENTITY_TYPE_GE:
> >>> +			ret = entity_early_parse_ge(dev, function, entity);
> >>
> >> what does 'early' mean here? is there a 'late_parse_ge', or is this
> >> to say that GEs are parsed first?
> > 
> > Yeah we need to parse them first such that the GE controls
> > are ready when the SUs are parsed since they will link to the
> > control generated by the GE.
> 
> ok, worthy of a comment to make this dependency clearer.

Yeah no problem to add a comment for that.

Thanks,
Charles
