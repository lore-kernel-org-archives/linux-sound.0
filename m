Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C3B735771E
	for <linux-sound@vger.kernel.org>; Mon, 12 Jan 2026 13:02:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.152.168
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768222966; cv=fail; b=jx84O2ShJ7T8+fJynZk+1frqIX5lQnXpnnED0TiPGZ7De+x09jIBJg/Ilw7ndnxsu53jrZ8GK8KtF803MT04kgFgiDhpRDU8PEcufgkok8fgCXeruoKuIy5gLOXlZ3RDa0FGY90fILibsw3QPcbT9Kp9LZoo2hia8fhLyGCfECA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768222966; c=relaxed/simple;
	bh=CoSGhFdKght+9KisFII0RtQDjy7opAtp8R/tNaQpdow=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Z93tUWoFDsCKmKpDDl+C61QZ66smBMbemp2wPvGsxWQiiIGPjVFEjLq2CUsAbPD+fcezpySiRi5dqykpNX3euMTi/j8rnFug1o3WGNfrsU0ZCXfYY0ZDYAUFhYtMCvlk+AFrW9rdJarvLLhka+PeSqhEpQp75et3vkKl5w+taew=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=Iwd5vWtJ; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=iVO1aMZ2; arc=fail smtp.client-ip=67.231.152.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="Iwd5vWtJ";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="iVO1aMZ2"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60C518Mx2267328;
	Mon, 12 Jan 2026 07:02:32 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=PODMain02222019; bh=DTXdYmkQmTabd0+ofO
	VhYQ2eCG27m/Rbyq9YNuay9oQ=; b=Iwd5vWtJEabXvZ6AADnM/wg4FTcIpCfZ3J
	18B2PLlDSCks49wj0eHp0wCNtoVrQp1cQSScAR7TUzULFosGCsor8dbWZs8m+rcE
	Y3+AU6ghWajKhe/dsTgV3T+0D6mQDtXgAXjdok+jjY+wXn+sV7CxDrAjkA1DOZ6D
	k4tmiv2A2Ksp4VvbADKrtcrMkOaCe/IPSsPVDcLi4i4wLl36/iNc0vwo6NV1PB6K
	y3wbs9y3MzVmiDDXuZpSE9NNg7B2EHqbUXZuwTtDz5Dpy+QdFS66KWRc3FxK8S64
	2My9XQ2iN5YzFNepthJSOqRrcCrLqk2YATtVywRmLZ3Szs4C7dqw==
Received: from sj2pr03cu001.outbound.protection.outlook.com (mail-westusazon11022123.outbound.protection.outlook.com [52.101.43.123])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 4bkm2n1nud-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 12 Jan 2026 07:02:31 -0600 (CST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=q85m1zIWJwX0brYFGqklxSnxzZpivDR5SrZ9wQaBquWsUKs4jfXyShUfDYLDRRGoQv+sNYgcriHMV8qmHD2jrUJ0jhdsvuy+T8Fi7BBJfoqGgzpegS+WFuH8cPKP/Qy7tD+GwMv4cr75GVm1vWvdQAttc6VBMH/idO0srBqmg7xl2sIkJni5S9IT3Ncc79Xs7LZL17S2FZFDjJOivhzVcH7yMvgkWrUNM48NB+DHvWpcN4pelJ181uW3c9IcGAih1mNSjedE+C2d8Kd3dBn/+ohoZPrzw/9vhMcN9+6TXxE56wOGsCSwWYgbNXeu4/nTmXZX4PdynHjJ2CfCvGdYGA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DTXdYmkQmTabd0+ofOVhYQ2eCG27m/Rbyq9YNuay9oQ=;
 b=f2fDKghiqP/K8UcOJWv/SKMdz73rzK+uYFAYX3EngdDiRv4GW+8HeG+MWOhEXvfi6uBDV+ihQFGaMOBp4xTgedkrq8l+M0mJNXp8lE+LDaEIVNevY+4MecurGI9aEJa2s2ewYTLPdLubkoyWyRzc5M6JiAAK6KfHIv4yapvrVSgpFaGhjdQQsgBVKarGvTa16+PQQdY5ze1T+aDN16dKt2vJpe8MyhSiMIT2b7fuXbeJQh7OMo+BRD6DAp5e11ijuwCUpIPGLI8ImuB8Aq/IwA7jB9HnBhaozJ0oyngfUVDoINOLVAHhBMbXVc7REBvBZoFTKQUreRX11xl2UQYbmA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DTXdYmkQmTabd0+ofOVhYQ2eCG27m/Rbyq9YNuay9oQ=;
 b=iVO1aMZ2NU92akMUHiUJvM+bSCUDdi8momwSAgvZuLbj7Ony7oz8sXoviXC0hJhKWI5dve0WqxGHm1s+S/WFHBPZoAQK6dKyigxrl9+ZizDXVHE4nMBSaqQAaAD+YvbuIIHgCyB5xrVPANmBsTakXw4D30In1vQvy2UII51dAHA=
Received: from CH5PR03CA0023.namprd03.prod.outlook.com (2603:10b6:610:1f1::21)
 by DS3PR19MB9512.namprd19.prod.outlook.com (2603:10b6:8:2df::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.2; Mon, 12 Jan
 2026 13:02:28 +0000
Received: from CH2PEPF0000013F.namprd02.prod.outlook.com
 (2603:10b6:610:1f1:cafe::a1) by CH5PR03CA0023.outlook.office365.com
 (2603:10b6:610:1f1::21) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9499.7 via Frontend Transport; Mon,
 12 Jan 2026 13:02:26 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: Fail (protection.outlook.com: domain of opensource.cirrus.com
 does not designate 84.19.233.75 as permitted sender)
 receiver=protection.outlook.com; client-ip=84.19.233.75;
 helo=edirelay1.ad.cirrus.com;
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 CH2PEPF0000013F.mail.protection.outlook.com (10.167.244.71) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9520.1
 via Frontend Transport; Mon, 12 Jan 2026 13:02:27 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 81D1340654A;
	Mon, 12 Jan 2026 13:02:26 +0000 (UTC)
Received: from opensource.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id 68592820247;
	Mon, 12 Jan 2026 13:02:26 +0000 (UTC)
Date: Mon, 12 Jan 2026 13:02:25 +0000
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: Cole Leavitt <cole@unwrap.rs>
Cc: linux-sound@vger.kernel.org, patches@opensource.cirrus.com,
        rf@opensource.cirrus.com, broonie@kernel.org
Subject: Re: [PATCH 2/2] ASoC: cs42l43: Fix headphone output by properly
 disabling HP clamp
Message-ID: <aWTw4Qwg27zIKEmk@opensource.cirrus.com>
References: <20260112031343.17196-1-cole@unwrap.rs>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260112031343.17196-1-cole@unwrap.rs>
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PEPF0000013F:EE_|DS3PR19MB9512:EE_
X-MS-Office365-Filtering-Correlation-Id: 668224e8-9903-412d-4e3c-08de51dad6ce
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|82310400026|61400799027|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?k9NTPCspKmtCItwEPM01QD+NcJupcC3RsmJK4vouo6eQ68uJkhoYuei4p5v3?=
 =?us-ascii?Q?Ex08FNCCUNygS3QMFt4uwrpwfpJK7eMHveuAhHMg5G4qledWfkxDmNhf+D3Q?=
 =?us-ascii?Q?vb7h9vWIcQ/Rq27SPeofBJmtfXY48kXLoHWrLm5PYrOmQOUmKiZ+5dmWyjoL?=
 =?us-ascii?Q?nhMTz8DXW69j/FSk8CTZx7dVx+otqwdl8HtBQ717PwVpsNvaB/3SDuEpS42w?=
 =?us-ascii?Q?RUbFLQpr3eEDztjC7UHNJtf/Rlj45xRGtY84N3OpkdmFlyUrTUfKfnlYzqZ/?=
 =?us-ascii?Q?o4uDD1evr/if/XH/jMvKmAtm68fNwkrAMANfAmSnf/FB1TyJNhwhpPTiVFM0?=
 =?us-ascii?Q?y9y14/0B+93D2QxWadKVKxGgCrsnYlJ0T0zkdyqYsxkPzX9xzQt1EUdTCxDc?=
 =?us-ascii?Q?hi4D2Xjxx4Z6zQDWCMfs5qsNciSKWCBVV8ROz7wrI/BLwPa1Mw26JY1xG3iF?=
 =?us-ascii?Q?b0CDqw7Tu9uQ690/FhAUzUpJShfPhRl1L7IKp4oKUugPqfKV8M/aErxkCo3X?=
 =?us-ascii?Q?Tq1jm329Y0GFTnH8e+Ql3/A6w8auiJaP+ZfnnvwyJOYPKgczSCwxQ4XzGh2W?=
 =?us-ascii?Q?6TtkZYnT3/f+KOHRVMI3K5XbAFu0ryCW9XmhGiWfRaPVGN5BDZUoSI13GfcJ?=
 =?us-ascii?Q?X2nsNnZbWpvg1v0k1qF3yCfo6D9/iHlRYV+mnKbDWsaHwGwzwku0fn8UY+uV?=
 =?us-ascii?Q?EC69FYCAcz80fvstRIjFLPuGaAIVF7meFA8in3iFtX/ldZ+ZE0gNRbgUffhW?=
 =?us-ascii?Q?4Bz/LiUJ+3LuQIpPNFuIrUk62fv5imcqQj2apqLYYgTX8LXaX1zufIhU8u4U?=
 =?us-ascii?Q?xCd5PZFGIl9nnojSrmKM0MORq0zPhIeick5Vl/g/HGIastb/BJAndQmaKjsY?=
 =?us-ascii?Q?uVsHP9n/5p4S23oFiuCalkx82cT7XL08SVz/6mu3Y1a3nrhpE+9W8l+rVyvo?=
 =?us-ascii?Q?klI124khTQlqZ6JQs+Sz3liYhYDTjboZj+jGxWaZo+be2OCT4Ow/uHYixx0o?=
 =?us-ascii?Q?Q5NKN4WMhtautNX2L5EBL2oL+flRUNMdPxQr15RijG2Oavu8T0kCWfR1OiEX?=
 =?us-ascii?Q?BoeZpPdNPu28/OayuHnpMqJvImTWEGbHNTo8fAqfzzIHkh6fVp8pf0IgOTgg?=
 =?us-ascii?Q?YJU4/24A3czYB0Hh13hPvi1Qo4SUvmPXMWDVCwewR//rbThS/HDPGs7IK+gh?=
 =?us-ascii?Q?zekdqZdfm4FLzQVPDNaKmxEpSFX9YszvpBRmuwqhgpOY9CJoqxR+HCwaf3OU?=
 =?us-ascii?Q?YhF7m3tCx64Ym0aIwYjx0Ku8PsfI1XWXimrQHsNKPTUEqkhWDCmaptY1Db7o?=
 =?us-ascii?Q?dRg51GeSMmezxuDr0ATvm7kBWiXt92Fb4hBq5CHH3Sa/p19U5lU4wnGnTIA8?=
 =?us-ascii?Q?5pcZDujAhWpKxMUNpJ4i2UGLiqVVrNN+sLhvDSq9nvkNbGUKsi8WJiiNxgoB?=
 =?us-ascii?Q?um6eZ6+mruJA3/KOHZ0Z0b1T2GW++r2LB0kRQdbC1ZfhmP89vEinL312Lemp?=
 =?us-ascii?Q?9Mi4A60UQjt04PSvWqI7ne9QXO2g8OJ15tww2jdn5nzxsikDeUYoH6bacugM?=
 =?us-ascii?Q?GpudKZMJ2P9BGO4Pmn8=3D?=
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(82310400026)(61400799027)(376014);DIR:OUT;SFP:1102;
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jan 2026 13:02:27.9398
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 668224e8-9903-412d-4e3c-08de51dad6ce
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-CH2PEPF0000013F.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS3PR19MB9512
X-Proofpoint-GUID: r0x0nKaD2WGcyzyZ-mDwUOWb7t0aN_td
X-Authority-Analysis: v=2.4 cv=JZ2xbEKV c=1 sm=1 tr=0 ts=6964f0e7 cx=c_pps
 a=0vj9JdGoO5ZFtW877mlItg==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=kj9zAlcOel0A:10 a=vUbySO9Y5rIA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=4C3mZrsojl_VqkG7jDEA:9 a=CjuIK1q_8ugA:10
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTEyMDEwNCBTYWx0ZWRfXxjYL9J8D4Tpa
 CjMm0zoqqEarYao7gEP8B/UwbXqZ2kJtcg4tc65Xl7IUqI19jbLGI/bywGg1ISJckhlf+wu1XAm
 YBH96AlaQhsbBG5m1L7Iu41sfP3oR/HCOpwsOltxco9fNuuvVx8ANLAT92+bdlfmyfTbfNRzwg0
 RH4FfjogFDIBIx9JUQ0vw7libD0SLtmVxMIRQAG6HBssS2lLjnbXsHWu+fJ9No3L1nku1eiBqHU
 xGr3CV79PMqiEa6cxAIswzU77ljCFwJthP16ENNdEqxu03SbuBRDP0D33T5RvFBVK7tVLr8qmPk
 JPuj0qXjRnZt3u/pUa0qHyCdYogKHLwnGKDbgrW7DFSPZa9x6Ivb8FI0a4cfy4DVoGNLsJwb4JL
 6wl0Q7QV4b5MAvDa/hbFiAFJQ2R35ophw7QO3dQGkBj4YtK/xkq2mRgQ35TWJKdUaqK0DTeedA0
 RBp1Eoe5KX8xs+K5CxA==
X-Proofpoint-ORIG-GUID: r0x0nKaD2WGcyzyZ-mDwUOWb7t0aN_td
X-Proofpoint-Spam-Reason: safe

On Sun, Jan 11, 2026 at 08:13:43PM -0700, Cole Leavitt wrote:
> The CS42L43 codec requires proper configuration of the headphone amplifier
> clamp circuitry for audio output to work. Two issues were preventing
> headphone audio:
> 
> 1. The STEREO_MIC_CLAMP_CTRL register (0x100c4) requires both bit 0
>    (SMIC_HPAMP_CLAMP_DIS_FRC) AND bit 1 (SMIC_HPAMP_CLAMP_DIS_FRC_VAL)
>    to be set to properly disable the HP amp clamp. The driver was only
>    setting bit 0, which enables force mode but leaves the clamp enabled.

This bit isn't a general clamp it moves the clamp under control
of the stereo mic logic. The normal playback paths should
override these settings when brought up.

> 2. When switching to headphone or line-out mode via the Jack Override
>    control, the HS_CLAMP_DISABLE bit (bit 28) in the HS2 register must
>    be set to disable the headset clamp circuitry.

This clamps pins 3/4 to ground (gnd/mic), not the signal pins, as
such the clamp should be active for both headphone and line-out
cases.

> Without these fixes, the headphone amplifier output is clamped to ground
> and no audio is heard despite correct DAPM routing.

Are you really having no sound without this patch and sound with
this patch? Could you confirm that is the case, making sure
reverting this one change is the difference between your two
tests. Could you also describe a little more about how you get
into the failing state? Is it a simple case of plug in headphones
no sound? cs42l43 is a pretty well tested device it seems unlikely
something is fundamentally wrong with the clamping.

Thanks,
Charles
