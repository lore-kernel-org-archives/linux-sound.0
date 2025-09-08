Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E768C2F5474
	for <linux-sound@vger.kernel.org>; Mon,  8 Sep 2025 14:43:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.152.168
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757342634; cv=fail; b=IUABaUYlKrcWBeWn1zhuKLTcsy0aF5QFxibICBFtF+jYMmF2NCx1KbO5SzLw8u20FAXVfpk1q1CR8doI/EIeobgNZEYVuyTmNEUaWq6mNGOxFG3uVtUmjApurE/2Pl3OZVkfEpZXScTTM9iE5udJ33lFFH9WRtabWyp1Dn+1kZg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757342634; c=relaxed/simple;
	bh=yvS7g2RK96x2l6tj/Zdq0tRVWru9QMikDpsUhH8XQ8s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oLJlDuk8TcCLfZ4bfM+bC3vhUUpaxuG6Ccy6KHxhm5lU3gbjlRr6tuIu5S0SOgvfWawMh3iMOjxavXvQQ803RItDjg36iFYiXdQj6hDCzOB2M9kZQu6ROO1JbkR4m0CRDeSqCxy5/UiPWFZIhWBm0OoNY+j9IzYUablP/qVUgd8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=ieIB7B8c; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=xoDB9ZK7; arc=fail smtp.client-ip=67.231.152.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="ieIB7B8c";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="xoDB9ZK7"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5888UUmf2151922;
	Mon, 8 Sep 2025 09:43:41 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=PODMain02222019; bh=ZOVH1zlcrXUH+LMfco
	mRlX1Fewy/nGByXXoub7UxBu4=; b=ieIB7B8cHPI99+TDXLCMhF8uKsNsZdTkAs
	JIac0VjpEUaMD6dBrschiQa9tHA5Pn7dkmugofsvikfpO9QdsyxFRTKzcRfLARX2
	kK6QX7K5VDLF3L8IMYFErhUU1lu26J3x5MJaQyMXz8IihgfagL0vGBEDTmdiENK5
	sBOk7+kfiHxU4iKqzj+jT+snzmCPftFfAwbAi5uMKfiPre2hIaSNrGi2wl/k1WpZ
	KuK3eBafGWAZfTz7kNanncOvmRNfVbSIDSNR1K1tEoRatsfAWswDrfYMsvnpcDhN
	pZNNdpP+keoKW0Mt0YJaqlctsDjNuSatg1FcMT4ZHfIWGlPyVRGQ==
Received: from nam10-dm6-obe.outbound.protection.outlook.com (mail-dm6nam10on2110.outbound.protection.outlook.com [40.107.93.110])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 491upq8d6v-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 08 Sep 2025 09:43:41 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MM02rlSyn3nap3JIWwJ0GrZ4p3/ig9OcgmkPN99xbEkaZ+kwm/ujFxMIZFlnA+Q9hSaCwJ8Xa5C7UJ4PKyk8ysVh6pFhWUSwLkjfGmrI0XD8D4EsbKNc3n1hCVnmI3sFdtCU63MiIjHnKhbPqhK7DbKP1I+oCD+LkdNIAtKyLnOLvb/FmvNXrUmgvlEStxSZcDQmnikyDY3c8hU03KtaHohVt6t+R7NxvM0CjPcyaUJjXZv8GZS2FQPcDtZDMV7B138bHIA3Hi0wMeO3UClkixqo+VkyI5cuYzzDb8O9gxFn+BooihBdZar6uA6XDoEKDxoNyPzTbCuCN3j/h3Qbmg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZOVH1zlcrXUH+LMfcomRlX1Fewy/nGByXXoub7UxBu4=;
 b=gy4prYuRM1/mVyEbxisBqiTSkFjQK6IZzgr1knm3k1vUIgVM295z3zFvboRl+4AGXZHkEDyIAwWgGAzFPkyL54ba3Pbv/xyWV65tB8uDnwuwXtb0oDA+/JmjUpcvzA2XrPelRyOIJ6XtQjkKjIxefpGcakI3rZQ2JijXKsg2k228POvCmlYkknom1V7LjVJNwUPUOsIr9Iy9BHS/tk6+KGnUVp82Z2xqQSwprCztYinxdK5v6t5Qz7jTw2ICAuE6dPUwyiCQYu/fWD+B9vaN7rdZpwKWYS0khgDYwTMmkTea+vAscLSYiinazTKNI9fhU3ipNHfs1KWmse6GqZorJw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZOVH1zlcrXUH+LMfcomRlX1Fewy/nGByXXoub7UxBu4=;
 b=xoDB9ZK7JtENk1dN+Hyz5hiFYAQpq+mCYrC/EoIV9/oubGiEl/tnjGeCan1nqSBbnGUv5t4u5qiwWSjs5QJMfqJoISzGh/RayWb1WfEdI7GOVoAf/SBWPyf3uHlZPSup+3wrU9W8mk7x71QopjClJ+N8ssw/Ut/c3roYhCI72Z4=
Received: from MN2PR03CA0026.namprd03.prod.outlook.com (2603:10b6:208:23a::31)
 by LV8PR19MB8697.namprd19.prod.outlook.com (2603:10b6:408:25f::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9094.19; Mon, 8 Sep
 2025 14:43:38 +0000
Received: from BN3PEPF0000B073.namprd04.prod.outlook.com
 (2603:10b6:208:23a:cafe::d3) by MN2PR03CA0026.outlook.office365.com
 (2603:10b6:208:23a::31) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9094.22 via Frontend Transport; Mon,
 8 Sep 2025 14:43:38 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: Fail (protection.outlook.com: domain of opensource.cirrus.com
 does not designate 84.19.233.75 as permitted sender)
 receiver=protection.outlook.com; client-ip=84.19.233.75;
 helo=edirelay1.ad.cirrus.com;
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 BN3PEPF0000B073.mail.protection.outlook.com (10.167.243.118) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9115.13
 via Frontend Transport; Mon, 8 Sep 2025 14:43:36 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id BE5F0406540;
	Mon,  8 Sep 2025 14:43:35 +0000 (UTC)
Received: from opensource.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id A4A85820247;
	Mon,  8 Sep 2025 14:43:35 +0000 (UTC)
Date: Mon, 8 Sep 2025 15:43:34 +0100
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: "Liao, Bard" <yung-chuan.liao@linux.intel.com>
Cc: broonie@kernel.org, rafael@kernel.org, pierre-louis.bossart@linux.dev,
        peter.ujfalusi@linux.intel.com, shumingf@realtek.com,
        lgirdwood@gmail.com, linux-sound@vger.kernel.org,
        patches@opensource.cirrus.com, bard.liao@intel.com
Subject: Re: [PATCH 07/15] ASoC: SDCA: Rely less on the ASoC component in IRQ
 handling
Message-ID: <aL7rltyvMy/ctrFU@opensource.cirrus.com>
References: <20250905143123.3038716-1-ckeepax@opensource.cirrus.com>
 <20250905143123.3038716-8-ckeepax@opensource.cirrus.com>
 <01bc3a67-6ed7-4bb5-8106-531af7f29d63@linux.intel.com>
 <aL7SmSjHTZ0lDm8l@opensource.cirrus.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aL7SmSjHTZ0lDm8l@opensource.cirrus.com>
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN3PEPF0000B073:EE_|LV8PR19MB8697:EE_
X-MS-Office365-Filtering-Correlation-Id: 63c789c1-4e0c-410f-ac35-08ddeee61807
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|376014|36860700013|61400799027;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?QLbFUiwITuz1/Pb3RHv6WoN4K1y75qJqitjggJmFBN/qpDqPU1IgV6DbNDma?=
 =?us-ascii?Q?AFpEtNbazz959nMeyvqAkotGr9iJR4o8OgiFDShJIVB0Rl34iuw2IaME6slm?=
 =?us-ascii?Q?V9eXauossyfqmsrvn7sF8YW5xRkrKcR+XoTn0etkumJbWR8rKjssUhNG5JIt?=
 =?us-ascii?Q?hCMia47sRBQbQ+333dUt3Z7xTGng+DdR+feLqxwQVkn3IEVGuCLYRploEgPt?=
 =?us-ascii?Q?DgtEX9vJty1rBQxPAqDK/dnmM7aWV/H42NiD6eVkzuXANgeHd7XrD60iQpqn?=
 =?us-ascii?Q?ibypW+0ASy3zlSxg6rq7KhngzhFqUGmTtqfYYNEv9rOUyO3iwSkE6UPYsrPe?=
 =?us-ascii?Q?E9tvVTXneZYgi+L1ieApYDkMwAqRgpgHAEZcqoVO9dmlXK6GKL+I85xDRua8?=
 =?us-ascii?Q?XCdGzad1UwjOpA6wRv7bqLVRJfPmJi3VhrDHPGMK2D7L5sxyTfZz8WHSrucl?=
 =?us-ascii?Q?PIFYaVu6xQ75m2ff3iRZjP8ldPfwMXzUKtaYXCiR+d58+nVkhP+Rsk+bjjob?=
 =?us-ascii?Q?scGG3O3qYxSw7eD83MjHkS4Rm+0tIf7uUh30ZqhbMcm92mMFSVu3d8GteUIs?=
 =?us-ascii?Q?OQzkM5y3oY7fvP76lwhn4bSL4b/yP2ccxQgOgkM9nwHvjF7L67jYwM1Z7Lso?=
 =?us-ascii?Q?t2LoA3RLvKn6QRR+2WPAr+ZU3h08TNEpgF4Chi4MG0CJXOSb9gXFfHAliIXw?=
 =?us-ascii?Q?wuejY7+gglp094JdE4+Fqtu3idpiXHTnnHyveqjUklCBQRfr9XbRgYssM/fp?=
 =?us-ascii?Q?A7x6Aw9qxDkmiQwVKzUUeoIWnA07YUbGGLa+ZMg/fcOyreocx1u2d+YByCNG?=
 =?us-ascii?Q?NiMkTXDmJTk+KE7xRxRosNqK+WFIEWdARWQ5I7FaLC/cmXvYkhqqpbv7GXaX?=
 =?us-ascii?Q?T1kn6Pvb2A32PjELYiS6jv9h53L/6RD1rpMcCCkS3WbrR50HGQqw959NVX/r?=
 =?us-ascii?Q?8Vciyg/4kbHqrPuvXFJXteHvH4423HXtblKXCFq+yyoeSmkLkr6hmQa9XGvi?=
 =?us-ascii?Q?5PZMfJEgnd1P0R7i23+cZS1gb+qyiI21C2m6m5R2TepeW7kUd7EEVl2MnhPz?=
 =?us-ascii?Q?MKySNi9zFMrs7D/B1YqtWNDHMJYSc2u4LxKNYRfdzRKoHPwV4R28++Nyxrfd?=
 =?us-ascii?Q?AvDnDg56XrfyvpbwXyPqyZmK3pY3HUEpb7fuNiK6yGFVQEtdQoumfpkdXczG?=
 =?us-ascii?Q?anlM70F+42gJZ9qRXLnI055nIPoEeRJHozWezzZuNu3KwM/o0rG1Zwhu/ex8?=
 =?us-ascii?Q?nlQtF7Va6nmCu9Nz6HAU4uSiW9PhWZBfuwL1Y6mFBqAZV+gt7z58f9rtuKi1?=
 =?us-ascii?Q?r35IjrBXbNTcWN4Kc8oOmhmcClQm/Vun0u+TowihT3IWQEw9k8AIUmCnOQ4v?=
 =?us-ascii?Q?lnK4DvdR0SkSo7bCrabGFtqgbCysaddeQOP6PGjwWL0qmeXrr12ZF0PjmC3D?=
 =?us-ascii?Q?HmJeaG9T2awuGiD9MobqtDy8WfgMBG8j0mIFc491CADdqAHexfkKizvW9GLM?=
 =?us-ascii?Q?Q0w4IfOFAcnRQP9ZJ8YgXm3OSWo/p9Y1Aesa?=
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(82310400026)(376014)(36860700013)(61400799027);DIR:OUT;SFP:1102;
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Sep 2025 14:43:36.7364
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 63c789c1-4e0c-410f-ac35-08ddeee61807
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-BN3PEPF0000B073.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR19MB8697
X-Authority-Analysis: v=2.4 cv=DMuP4zNb c=1 sm=1 tr=0 ts=68beeb9d cx=c_pps
 a=U9uK1XeW/XbPQ+xGwlJMPA==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19
 a=kj9zAlcOel0A:10 a=yJojWOMRYYMA:10 a=RWc_ulEos4gA:10 a=w1d2syhTAAAA:8
 a=8_Mkb5MupUeyuvKq6LkA:9 a=CjuIK1q_8ugA:10
X-Proofpoint-GUID: 24iJj4rQ3CQjouKQWPjujqII-bhGAFVH
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTA4MDE0NyBTYWx0ZWRfX4qBU+HTzb6+z
 LpB7CTfzTHsxKfu6Dk+yp/K5aJgm1ETTEQYHaAnX1VQ9ijtsggyl0K1oMWcef3bpedhNXfzCsHA
 Y+YHWuktbuSVKZp8KmQyknYfezvFG2Nv9WTGvBytttkqWmf4SGyzLgiklG9980xROkg3pSrK/3d
 yNW41Bkft2T4mdSJAcAZbNnU9XyFZqJVx42SQ33HVoHSfPuO4VTADIJeFGOJQ+d6cNYGNrbBa7R
 u20xQWAXEvpYtXURdnLBhf9WdeXlFAa1FDrPPxb+r1qfURuniKIQwi5ou6jrRiKcviDBRnYT2oj
 w9+JEQdYP1WXqDyKpGldN/sLsCqycEJta0KfkSsnie4xuiq0A84lJCGEwsd+tg=
X-Proofpoint-ORIG-GUID: 24iJj4rQ3CQjouKQWPjujqII-bhGAFVH
X-Proofpoint-Spam-Reason: safe

On Mon, Sep 08, 2025 at 01:56:57PM +0100, Charles Keepax wrote:
> On Mon, Sep 08, 2025 at 06:27:40PM +0800, Liao, Bard wrote:
> > 
> > 
> > On 9/5/2025 10:31 PM, Charles Keepax wrote:
> > > In the future some IRQs (mostly File DownLoad) will need to run before
> > > the soundcard is constructed, as such refactor more of the IRQ handling
> > > to use raw device and regmap pointers rather than accessing things
> > > through the component.
> > > 
> > > Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
> > > ---
> > 
> > > -int sdca_irq_data_populate(struct snd_soc_component *component,
> > > +int sdca_irq_data_populate(struct device *dev, struct regmap *regmap,
> > > +			   struct snd_soc_component *component,
> > >  			   struct sdca_function_data *function,
> > >  			   struct sdca_entity *entity,
> > >  			   struct sdca_control *control,
> > >  			   struct sdca_interrupt *interrupt)
> > >  {
> > > -	struct device *dev = component->dev;
> > 
> > Previously, we assume 'component' will never be null.
> > 
> > >  	const char *name;
> > >  
> > > +	if (!dev && component)
> > 
> > But now we test 'component'. If we don't assume 'component' is not null
> > any more, we could test 'component' at the very beginning of this function.
> 
> Good spot, that was missed when moving from an older version of
> the code. I will get that fixed up.

Apologies I had slightly misinterpretted this, and thought you
meant we were dereferencing component before testing it in
sdca_irq_data_populate, but we arn't.

The intention of this patch is to allow the user to call
scda_irq_data_populate with or without a component. If you call
it with a component and pass NULL for dev/regmap it will use the
component for those. If you pass dev/regmap, it is fine to pass
NULL for component, the current user doesn't do this but the user
added later in the series will.

Thanks,
Charles
