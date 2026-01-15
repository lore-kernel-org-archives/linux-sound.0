Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F79430BB85
	for <linux-sound@vger.kernel.org>; Thu, 15 Jan 2026 09:42:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.152.168
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768470164; cv=fail; b=cUsUyMuPFBIicwAYVSX/ZyQyr1O66mdFJY+VuytsOsK+yq3jSNelgneSJ2Jo23C5CRZV46EzWRYJKXgPTo6aTAbRHE6E3Sc29FCiIXqSUJgjeZ9tAewgtms9n94Y9644LZEK0WGEEW8hwLZ2hJ/yTnAWoFvPzU7W+EECCBME5Bg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768470164; c=relaxed/simple;
	bh=qJI1YjDelPaUgFL0VMTMmue2AEG3Y7bMR1ZPm+NZo/M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GSbyoSAJKXchjn19AOop7mv8FBfpLLN1dATgHo1plYTxnRCOZRKvTiUAYidBolLvwOTzUAaHmT9nfJjuXP9n/zD0nqgbRR9RTUDRR1jnLqN0yMhs9WIbpTHnwnEDnkNt78QZ97203ueh8piqBZXolAjBw/CYX/UQ/tG6jquOyqc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=p6wSz01b; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=t3g9Z6c1; arc=fail smtp.client-ip=67.231.152.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="p6wSz01b";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="t3g9Z6c1"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60F5fBOK1686043;
	Thu, 15 Jan 2026 03:42:21 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=PODMain02222019; bh=e5ODnYd3W2r2m9+wWY
	89MGO55awF4kJ/b8AzuGQ7kAk=; b=p6wSz01bPAeLhZssUORS/yoEIKNNTWG6aM
	/Mnus0LpnSaQ2bfay8Dky4hn7Js/sR6vSIL9LMwxC7QxWtzDwCzszdzutaUMdkf0
	v6iFQbwjwlxkMXCo11zGVoLyOqMcshWinE1Dgz31wVmaaTNhUMYaDQ5cZp9+hYDm
	QyQtxku+Yobdd75HVuE8KSa8cjvwlFKdAZ2Vs5Cb873GuvNuAVsdVYcNfteI0Uy/
	Uy7QT1eHqbZJ9Jt+OV7AVrGoYd/2Jd8RYBlFM2O6H9PLHajeKMCUdDS7wBQqpdhU
	D1bhv2rUCH18ubD89aVaHoyBW7WyadVTX3LEXDGDkLN+F3AqcwNQ==
Received: from ph8pr06cu001.outbound.protection.outlook.com (mail-westus3azon11022115.outbound.protection.outlook.com [40.107.209.115])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 4bkm2n5nfh-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 15 Jan 2026 03:42:21 -0600 (CST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wsYtBnx1o44Fv+fCrj0rtAmXTBQ/jUKTypwGBuKXweQjfyFfBPb+1EmOFD3eo4lPXYi+BI3F0ZdHejWJt7IbtTEo9WVqrHtQA+S2Kc+je9XiT5pFNGs9BS66VwSUpQz9I1aqEa+0lcc0er5RiF/Xs8bG8p+KRgU8nB9t9UO3aqL6yC4fybQBztGad1hT8an96PcpYXlw64ef8UlkaYTmWy/QvA06MzBmnyy9JR/qfwomNS7pfFgrGWW+E0OGxtqcEay2ZmmRVpABNBflv52PlJa6x0SZqBCr69s+yW5+lrzCnbbQyv+HVlOEzRza3REqwTISHOXMU3aoASRInI3yrQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=e5ODnYd3W2r2m9+wWY89MGO55awF4kJ/b8AzuGQ7kAk=;
 b=R/iMSBGRvbj+AgG1cHn8ilqHtrsAbJhIDBp/XK7un9a4P0qMZEoWwncSLNy7zg8pLA+Fypq5nPU43BcJHpzKPFSPjLAosh3hKCOYkjy3R0HC7Y6yn/Lp4SWLWQrA04ELTETlNMPAoT89za9lLF7rboci3QEfow7fsvETaEJeQWsNHt79UOsUyqX9uaTrMY5nqZIM2ZTDdtWSh9WSyzQtIftQEvjEP0HHyoBfraxhi5v0PaTrt29oGyC0kBCB9thGwgWoaGIIbrElwNN2cDqHXrIftE86+yzZFUB/cx3YKhHvupfmI6HKsBF2U/md5CGoaMoff3d/XWU+T5xYi1uMIA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=e5ODnYd3W2r2m9+wWY89MGO55awF4kJ/b8AzuGQ7kAk=;
 b=t3g9Z6c1WkXhPpkSuYh/oEhDqKER0gLeZ0OvmkGf/JA5AWhI1+KV60t+5D2VOH8Y6totik+EAJkxo4i1zpdgMfhC10mwJvplGocjqpJp98wDzCHDq+9SS7WacCC65R1xSeBcE9PCXFuzwqoOyg2GUvmI7uK71AJVW3JKgSTL74U=
Received: from BLAPR05CA0044.namprd05.prod.outlook.com (2603:10b6:208:335::27)
 by BL3PR19MB5323.namprd19.prod.outlook.com (2603:10b6:208:346::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.4; Thu, 15 Jan
 2026 09:42:18 +0000
Received: from MN1PEPF0000ECD8.namprd02.prod.outlook.com
 (2603:10b6:208:335:cafe::4) by BLAPR05CA0044.outlook.office365.com
 (2603:10b6:208:335::27) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9542.2 via Frontend Transport; Thu,
 15 Jan 2026 09:42:16 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: Fail (protection.outlook.com: domain of opensource.cirrus.com
 does not designate 84.19.233.75 as permitted sender)
 receiver=protection.outlook.com; client-ip=84.19.233.75;
 helo=edirelay1.ad.cirrus.com;
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 MN1PEPF0000ECD8.mail.protection.outlook.com (10.167.242.137) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9520.1
 via Frontend Transport; Thu, 15 Jan 2026 09:42:17 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 5F16340654E;
	Thu, 15 Jan 2026 09:42:16 +0000 (UTC)
Received: from opensource.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id 43AD1820247;
	Thu, 15 Jan 2026 09:42:16 +0000 (UTC)
Date: Thu, 15 Jan 2026 09:42:15 +0000
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: Cole Leavitt <cole@unwrap.rs>
Cc: linux-sound@vger.kernel.org, sbinding@opensource.cirrus.com,
        broonie@kernel.org, patches@opensource.cirrus.com
Subject: Re: [PATCH] ASoC: cs42l43: Fix headphone volume control overflow at
 100%
Message-ID: <aWi2d6XqgvyGPi6h@opensource.cirrus.com>
References: <20260114213829.15456-1-cole@unwrap.rs>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260114213829.15456-1-cole@unwrap.rs>
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN1PEPF0000ECD8:EE_|BL3PR19MB5323:EE_
X-MS-Office365-Filtering-Correlation-Id: 163c1bdb-e44f-4ea3-fc7c-08de541a5f6e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|376014|36860700013|61400799027|54012099003;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?B0Fisztkj/HpJpIxj4NizlgufZl53pUD+W8rogKjTAL8u0+wsDyQWQubTkCC?=
 =?us-ascii?Q?QXQgaZ37QwHLM0Iv9T84e3uH5OISZVzgfpcIS0Ywnqd8kIsZN0vflcTACYg3?=
 =?us-ascii?Q?tal7AEmrQNcB5oW1G0zePb7XNHJ6ay0IRmocEQiLU0Lkl/ssnTNGIxP7l72S?=
 =?us-ascii?Q?p9c6BQ1F4dESBFLou7yWCz1fA4ySs432rZvNC7imCJ4C0gQt3L6/HlSHgdME?=
 =?us-ascii?Q?6Xs0bRSsl/ZcjnE2H5Er1u/GllOtMKrVDZBFI3pu5oKx2AbJjTRPh/ssQa4U?=
 =?us-ascii?Q?FoGaCGAmkkSaSntVwp7dr9vXC0tN4mr02bKNgX2nD9+TZOh+fNEWGOCEJ1GY?=
 =?us-ascii?Q?k5jCGJYtUuax/LmiQvwZ4SJzxvtmhUNm2Lh1bZP3ZYStpy1YdapGeGfxO+tt?=
 =?us-ascii?Q?tPs7Ck7o/m8LzTOBz30o39dmoocXeAhQ5wyUgbQr3pI/a7KWIspWvN95O4tn?=
 =?us-ascii?Q?40tVwifKazeAk/XgFGS3zVvkvT4/qta577E8zem08X/eKN5boctmrDXkS8Tn?=
 =?us-ascii?Q?O75YaNR99kJ1mswCbM8dKjyC+s1jKlZFxLTw1b2hdGviZd7aLVJZToG/31cp?=
 =?us-ascii?Q?Or6duQr9tdktaHM8A/kuT4IYpd4vca2Ey3Abqzx+Xe8xvAlNJTgWfVweapTS?=
 =?us-ascii?Q?EObymRnuh4sSArP8TJlg0W2TJZiyZUWtSmKpTp5irLGGNwER2iTTuxKn/5a+?=
 =?us-ascii?Q?qapKrcZPiatBox4C36HhnrnpZUtMO4Yfo7HmFroM+Y5sGmW5TMSpckhVMx+0?=
 =?us-ascii?Q?z5BtSp1JztjovFFO5HYZrI/IYa/9QT7XVis+ro9DNakEHgTqP//Uy8cDlKcY?=
 =?us-ascii?Q?3TELb/LO9qQd2IAvwtOZgilW6H9T+mT+fGl5ZZonEtBwJ++GhlYfsqoMhkxV?=
 =?us-ascii?Q?I8CfhBu3eSxc2l10jIEIWb8aQr7bwO/u1AkSBirNUXcY+ZI/Y5HPX6aJNFW/?=
 =?us-ascii?Q?A9xC7lZ1YxCpZOmrO1/SwJTQ8MJSYKYTRE4T2gGaf2UCTOf7QgFQ7cIxcjjk?=
 =?us-ascii?Q?KjJUMqsMPP9709L2pM9kPxW5FG2YjRfQV0gsgn/uSju2EfUgnnkW3eWL5lkb?=
 =?us-ascii?Q?77Aucy2Zh9nzOh6jslpmWkA8ygPu99U6bKCOJfgiCh/QWvHJOztmh08+IA/f?=
 =?us-ascii?Q?ELAVD9/nf0IaPrzuaXRGcSVk/0D21lB1or2esGA634a5rd9rm6G84qDSTLAt?=
 =?us-ascii?Q?mhNhpdwmUI+mHJPhNO9Jlu0JqcHgYg3lKEwhtyAHu2OmLpHKE1dxmNrLY9oG?=
 =?us-ascii?Q?P/n2RPAaNwi5gbj/03+ijkmsad/y98ABQZOxHivvgz3yUsFUgI3X9N/dywO7?=
 =?us-ascii?Q?sXQXnqSSv2bQmex9QteYfl8vqk4zy+qGb79goHH7aS6KwFZepHHneBzj8yF2?=
 =?us-ascii?Q?kzmEAGbK2Lq3jSamdYd358FjVNRxedBAz4UFnpylYw3oCYYFwC/JEvQ+Hrqx?=
 =?us-ascii?Q?MmKDNrRlACL1zTL4QugEazj3QsKwDNGx6DRFW6WaqRMkuCJEJ1DQ7xpxkCuB?=
 =?us-ascii?Q?ixE2g/LhJWYvFlaAk+nrDMzj/lmStElI70hkUaFG29z14bTethisf8/GhWAh?=
 =?us-ascii?Q?BaMy4vIR5iybje0hIi1/JPManMQGr/q3GuFteNFgdK6v8gNqSGADbiiZ5aww?=
 =?us-ascii?Q?fAHWFEN1xEanD0lWFm6VeTjhCInOtEezJSNCupyZWdEOPRmIzACJYIyNreAN?=
 =?us-ascii?Q?FAHaPg=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(376014)(36860700013)(61400799027)(54012099003);DIR:OUT;SFP:1102;
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jan 2026 09:42:17.8118
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 163c1bdb-e44f-4ea3-fc7c-08de541a5f6e
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-MN1PEPF0000ECD8.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR19MB5323
X-Proofpoint-GUID: nkWjJin-SZseWCFOttmqz30pws3MjQWE
X-Authority-Analysis: v=2.4 cv=JZ2xbEKV c=1 sm=1 tr=0 ts=6968b67d cx=c_pps
 a=ckbzw8NX8UamirBUBM1bcg==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=kj9zAlcOel0A:10 a=vUbySO9Y5rIA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=E12ipulMD2Js2cIYb3kA:9 a=CjuIK1q_8ugA:10
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTE1MDA2NyBTYWx0ZWRfX0fVna2U7GrCh
 fUCjJiehaGcZOfHaoZs5BSyKlbFWkT62Thy2i73LjsJAERYqXrk70aQ0zHgM1hBVgNw/UhpEkdC
 +cF+F/aBlxLSXHXi9csK/8u6flcayQV0vmM3rEdf4/QXN2eTQuCmUZcPJg8rFXbsfcS7Tbpew31
 kYTcrG1BDashmjiciFQtgToOTTBr1em5eVhOnHl0EKhe55hLPLVO/TfDhvuH6UzJeuQa8IEgLOM
 tqmlj2gHaKzbwsisPgVSCjCB5gbZIgZeZT/sMjbT2TDCyxUvXjE2XnDhGsPtGWq81zGwa3q7R1Q
 Xgr+8weYNUsyZ3Dl8UG41tqwg38j3pCeMXsZqwtss8vejKd5M0BGwQ3jQLRYNlcV3nGlQYX3yU8
 A/mkV9dKnkNnh8qYNS33uVnJ2gR7GIgsQTKJJaeMOiEXvnlp2wmIrN7yLDyry1EuaPZh3OyHwks
 McOZZuDKgIoT72iCkyA==
X-Proofpoint-ORIG-GUID: nkWjJin-SZseWCFOttmqz30pws3MjQWE
X-Proofpoint-Spam-Reason: safe

On Wed, Jan 14, 2026 at 02:38:29PM -0700, Cole Leavitt wrote:
> The headphone digital volume control is defined with:
>   SOC_DOUBLE_SX_TLV(..., 0x11B, 229, ...)
> 
> Where 0x11B (283) is the minimum register value and 229 is the number of
> steps. This means the maximum register value is 283 + 229 = 512 (0x200).
> 
> However, the register field is only 9 bits wide (mask 0x1FF, max 511).
> When the volume is set to 100%, the computed register value of 512
> overflows and wraps to 0, causing the volume to suddenly drop to minimum.

Is this actually based off real world testing?

Thanks,
Charles
