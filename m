Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BADA119D082
	for <linux-sound@vger.kernel.org>; Fri, 19 Sep 2025 10:42:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.149.25
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758278540; cv=fail; b=Tpn1b7jMi7A23P05JRPEJUvtfI8EAzNA24xneOeabDSwmqFDu7ACMyimBfw+2lPMOcnLv2tOUe8LPkPEe0Wq05gi73VezjQE2+fll1cyrEFNRBtqQI328SFlxZbfGwQehkSu+kNxIYhVIL7uTL+HrEVBNR02UhtCOmd8TcAPW/o=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758278540; c=relaxed/simple;
	bh=stTDwYMBe3u5uJLcn/4c9SDJrMLNOPoTfNeRstyoRGg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AD9tAIy124rN40rcGdUV15BftVIqlt2rHQejTfvWvG8/8LtvMcxiKf6pMkHTNRjqagsabYV5oFaFMNW9bxT1w8NVDsWdmrPoDQzBbAOfF7XKlBIFBgRlrvRTsqHMFYnTtvGiE4fjZGVD0+YpSApnmfiimVULVPBWuJBZ1h+3JOI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=apsTATuC; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=n0AS7gzF; arc=fail smtp.client-ip=67.231.149.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="apsTATuC";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="n0AS7gzF"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 58J5e9gQ1775648;
	Fri, 19 Sep 2025 05:41:33 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=PODMain02222019; bh=+XW6XJIA5flO5JNqAC
	9R7Xe5AsUT8srZB256c919Jro=; b=apsTATuC2HLAQDcqhUXCHIB7IEYWM9z34c
	hWY7ItgDthjoxMiwc3dQJsZXAV/Ld3SQn8EJkmHZqpyn6eFfvOqX9zlk1PZ37oeV
	XMbjupbmIPc492CHEcMigrfMaCDl7hfLV2kUTpc1MWmTstHzKfoqdQr8Z/iZFS9x
	wN5fZLFyQ/xWptQkwbunZjbGvJ3P1hETOvFKS5lC+cMOmU+803FTbXBqI2/1nth9
	UPAwfCiJe24B6U0FMqMLHAznvCwrywiHkEUaaio0gE5FddO3vJzhIPUtYTR5lCZo
	7Iq4/Bqqq08dbbAiy9EjhmziHNxxiyrB6rLbm/ba9ergni3lxUyQ==
Received: from nam12-dm6-obe.outbound.protection.outlook.com (mail-dm6nam12on2114.outbound.protection.outlook.com [40.107.243.114])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 4980h6an3d-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 19 Sep 2025 05:41:33 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=auMNvJNXThCNCY/EAyKMiUOW+14D3idKA7soY9CKik4aUNPTMnv4F/8qCtqv7M7ok9GejVTi83asf14KZI9HUNNqlZLDx+hblxzXTGV+mNa43hS4/aSZ8ZAsd0kSVo1/kotExFFnfT5SItDgBk92EYiENmQNabzsz/P2tskcX4tGNkj8aJjPVCDWSfyP+QGBiTUZRrA3B/SI9L0ICycsf84MLclm/8jN8437zvjEpfWssJRvkZ5SStmn50Q79so9yRecWmquS9XpUySbPTEzJSLj03lwZi5VIfrOW/Mnuv/SFBj4dFeWC+FzugGbZ2m4p+6rr8kCg93CgPaNZiRPBg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+XW6XJIA5flO5JNqAC9R7Xe5AsUT8srZB256c919Jro=;
 b=iQFauBpaXS1m8fmJYgmXQ8P3vdrM9iZeaA7U+Co435xYuUJAV9WewXz046o8iEZRKN9aJbi0szJa1jXYIjsqW33WISf2UR89RSeMpYJQK96SuxEKG9mgdtWbDVRyAp/74n+U8it7A0ZZpT61Hg47Wd/FXbKcnLJrBpzANKII2zL1BlH0YFBm4MwL3JSY+YyplEmGh3aEuLdycvz6NQveAFzwSgF6afUFiVw919LQ317HT831oPOLLl2TPXHLWNU5R/9uTbB0Zn+umFzUeQwIsyOM96SNB1CvBnulWQ//1Vq2m5+83DmQHFfbM6ZRX+Sr1PBsrfie0vM9uBxi5ajMSA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+XW6XJIA5flO5JNqAC9R7Xe5AsUT8srZB256c919Jro=;
 b=n0AS7gzFJlq6O2MXvu5MzzW6+o1TdNyngHx45g3bWK81tD0d22YrvB5JfyCLXimg7e+saF73wx1+GBcq3GEje8TmDfN9K0ZsdIEbjSa/UVcyL1bVlG6t1bme8N9gWzRO0jBPQ5vwuDUJe5OM2G7tQo0mbeX8OdbzbOqZkEixajA=
Received: from BY5PR20CA0030.namprd20.prod.outlook.com (2603:10b6:a03:1f4::43)
 by PH7PR19MB6706.namprd19.prod.outlook.com (2603:10b6:510:1b4::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9137.13; Fri, 19 Sep
 2025 10:41:29 +0000
Received: from SJ5PEPF000001D7.namprd05.prod.outlook.com
 (2603:10b6:a03:1f4:cafe::96) by BY5PR20CA0030.outlook.office365.com
 (2603:10b6:a03:1f4::43) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9137.14 via Frontend Transport; Fri,
 19 Sep 2025 10:41:27 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: Fail (protection.outlook.com: domain of opensource.cirrus.com
 does not designate 84.19.233.75 as permitted sender)
 receiver=protection.outlook.com; client-ip=84.19.233.75;
 helo=edirelay1.ad.cirrus.com;
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 SJ5PEPF000001D7.mail.protection.outlook.com (10.167.242.59) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9137.12
 via Frontend Transport; Fri, 19 Sep 2025 10:41:28 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id D30E7406547;
	Fri, 19 Sep 2025 10:41:26 +0000 (UTC)
Received: from opensource.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id B991E820247;
	Fri, 19 Sep 2025 10:41:26 +0000 (UTC)
Date: Fri, 19 Sep 2025 11:41:25 +0100
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>
Cc: broonie@kernel.org, rafael@kernel.org, yung-chuan.liao@linux.intel.com,
        peter.ujfalusi@linux.intel.com, shumingf@realtek.com,
        lgirdwood@gmail.com, linux-sound@vger.kernel.org,
        patches@opensource.cirrus.com
Subject: Re: [PATCH v2 07/19] ASoC: SDCA: Factor out a helper to find SDCA
 IRQ data
Message-ID: <aM0zVcePZQy/iBLR@opensource.cirrus.com>
References: <20250912103504.2679226-1-ckeepax@opensource.cirrus.com>
 <20250912103504.2679226-8-ckeepax@opensource.cirrus.com>
 <3fdabc7d-b937-435d-b644-152a9635ba18@linux.dev>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3fdabc7d-b937-435d-b644-152a9635ba18@linux.dev>
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PEPF000001D7:EE_|PH7PR19MB6706:EE_
X-MS-Office365-Filtering-Correlation-Id: b99a717b-d05f-4b43-6073-08ddf7691705
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|82310400026|61400799027|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?0epfuIWzLYylmGfJHAEYB2PdlRwLvQpHvBYpk9PXT+UKjIfKzsKgMjEBQBM6?=
 =?us-ascii?Q?o6XGx6wc9NComtLEmMiDBduKXFDMWIPxi/NK2SWpJKLUHqhNQnVoA0F7VIzJ?=
 =?us-ascii?Q?qOUt4LuJh5OPPTw2PQiKgIbSVgfPELl/dD6QssohHynzKNqoR9N5og9tAHFt?=
 =?us-ascii?Q?sW5pnYNIKH2EmlHaiM+lh08tWMVI05Gj0huj1ZMt/BO7vfQ8onUeeL9jFm2i?=
 =?us-ascii?Q?S9+pj7mpzh0iAxvWAIS4IZXNpMEYFFbRkfIQEF2aaNeKgpdxyTHgjV/nYLvz?=
 =?us-ascii?Q?E4GF5Wx1fBzoG7ZWKSRAadYTDx8r4hVd23X3xMSsD7Y/lb2p2qmk3+GhOGYH?=
 =?us-ascii?Q?4aykoFmHUQGM7xFQYzB6shbmsrbaaCF03S2Fq19xrxOBz7CcwT8DDiPvqaNk?=
 =?us-ascii?Q?ej7oosiY/8HqTHoXlJLMe02NuniFrEWQ47pH4XGa6DG/WsbMCJcHGXdNyxs5?=
 =?us-ascii?Q?cf6zNDP5oDTzIcnsOvaR0babUQAdLj4G1rHJASo/BtZpOzGkAlTrLwc2stge?=
 =?us-ascii?Q?Zr93lpl451o3+vFFk0CgkcTSgT4rG3xNYYRKIEuXxq2k5Ib5QZ/AOKLP0Z7+?=
 =?us-ascii?Q?Rvls9HJo6mkMJWWtHZoPGov5TDdFPzawlreEAZ9QfUnpveqSKzd3ZfuRWlwT?=
 =?us-ascii?Q?v9Xf+UsJbBdPG4AQK+jdC+4gRGHF9rmYx9xZfv2BpoykzJiLRvUeFradRf2r?=
 =?us-ascii?Q?msSGFB2Cu/LnzRtlan2azd5QmOLlVsx1wGFMZmp1L/H5HSQexrRasyg7jPi1?=
 =?us-ascii?Q?ddf0IMyFevMgnYHiurMUHW8Fd+v9k7SI5YE3ZtKf6TBT/+a/JvAALg7h25hV?=
 =?us-ascii?Q?3Wl/GfVO8kOSQX0h9g7cdP2FaiEvUUv7grF9IYyEsMfTiDyfr46VU59z8+nI?=
 =?us-ascii?Q?cfsQ4GU77oARPRkYEnrrVruaO8loTqVnD+gsQ5ovmzCk/s5WiFxB0kXnAXqS?=
 =?us-ascii?Q?ZTtmR0yQ2ROB1wRlRhikJBuPxLbSAgk4vkQ61qIcQh3pmqtTbGBE5Ym+fThM?=
 =?us-ascii?Q?fMH09Vmwd/zXd07b4loqupMk/kswj562v10UEpMtIluiH6KK/uObKYhresIC?=
 =?us-ascii?Q?Rs+yxpobZHC7HMx8T9j3wXtODkvrkScOUUqcwTHQr/W1BiLYycWfl93dAlfe?=
 =?us-ascii?Q?a9CycIGIpIBa8etB8q/U8blsYHHrOykrwzwZG432YV1CU6VXJ6k4VPHEOlT/?=
 =?us-ascii?Q?qh9v5QAMv/xRqURDLaA2gDVepbyU4lQAvaLmW2vdiDrC6zNt1G11tj+ykAqh?=
 =?us-ascii?Q?Ab5hgwciL/P4P4mR+HrDesl2cZjpJnmOY8DFmhXB/NirDWHvqwYrdHF5Ktrw?=
 =?us-ascii?Q?uhHmwkC1Va7SJdB6M3DLkI/P+1Fwo+qKLzyXcI2YpFxfcZXHmZUJSi/PFWwl?=
 =?us-ascii?Q?S/9FfaeFKk+wXa8rZCIMZX+eclkgDFVCSWmxDH4ciUuY/zbX4k5eOR+B9rvk?=
 =?us-ascii?Q?qkXrdME7JOKD2shlEvx3znpSfBh3jDwgrPWr9K2yQ+PrQsDZqRbs3oq5eq8h?=
 =?us-ascii?Q?g5BUOO1A/L17pnUSzK8Iia7gTgRt9fZUBbGG?=
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(82310400026)(61400799027)(36860700013);DIR:OUT;SFP:1102;
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Sep 2025 10:41:28.2887
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b99a717b-d05f-4b43-6073-08ddf7691705
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-SJ5PEPF000001D7.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR19MB6706
X-Proofpoint-GUID: SfLTefUBBV_c2vNtcToShhi5hOJu9kSJ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTE5MDA5NyBTYWx0ZWRfX0Wwt61mOZkzV
 K3o3pT85qRAsU/XGdmFXLQWpTb+raePU9qkP0/M2niB5usCqcb10Jd8nzKqkAlmbS3ZWvFrAoJw
 ZVSnQNIwsSc6RIUQ1HZ3KuxBZE88/K08nh2WJbjc82zhxXdldGDwOaJ5yjLu3F7uaMdAswspL43
 ISXot8XDMELz+wxBkNyaGm9+4aYlaztClUIiShje4j+avrnCWHYgWDNf5QcuehSFH0aRdbkGabn
 zYOY+Sd63iChitjY5ZIAxZ43Hbz7KlhTZ1Paq9bJzqSV+K+s47LU8OxhbPPQeahC4qP1K9sij60
 1SatL6Q3ioMF6w0myNF4KV7cvDO1369lA2SJhKiTXPcsX2b3hSS04PnzzVd0AA=
X-Authority-Analysis: v=2.4 cv=M4lNKzws c=1 sm=1 tr=0 ts=68cd335d cx=c_pps
 a=Nld711CjGIsVVLxYEnxbPQ==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19
 a=kj9zAlcOel0A:10 a=yJojWOMRYYMA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=X4DQZ_DfmPUDLRc4nQ0A:9 a=wQE9LJziUECi8jA1:21 a=CjuIK1q_8ugA:10
X-Proofpoint-ORIG-GUID: SfLTefUBBV_c2vNtcToShhi5hOJu9kSJ
X-Proofpoint-Spam-Reason: safe

On Wed, Sep 17, 2025 at 08:49:17PM +0200, Pierre-Louis Bossart wrote:
> 
> > +static struct sdca_interrupt *get_interrupt_data(struct device *dev, int irq,
> > +						 struct sdca_interrupt_info *info)
> > +{
> > +	if (irq == SDCA_NO_INTERRUPT) {
> > +		return NULL;
> > +	} else if (irq < 0 || irq >= SDCA_MAX_INTERRUPTS) {
> > +		dev_err(dev, "bad irq position: %d\n", irq);
> > +		return ERR_PTR(-EINVAL);
> > +	}
> 
> Checking for the range isn't bad but could this be
> improved with the 'mipi-sdca-control-interrupt-position'
> DisCo properties?
> When parsing the DisCo data, we can probably come-up with
> a mask of valid interrupts, no?

I am not sure the check is appropriate here. This is simply
returning a data for a given irq number. Currently the two
users and both are directly requesting the IRQ numbers from
that interrupt-position property you mention, so really here
we are checking that those property values are within the
range of valid IRQs. Checking them against themself isn't
obviously helpful.

Thanks,
Charles
