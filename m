Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11011064.outbound.protection.outlook.com [40.107.74.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9997D18E750
	for <linux-sound@vger.kernel.org>; Wed, 26 Feb 2025 01:33:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.74.64
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740533608; cv=fail; b=DbpD39/cb727YwTc7CnFHvtt6tP6i2h0bFlqYXhu00FohXIokjljpiA8usk6LPt8Is1CIgYBA0qHHBX/e92XHV1Vmk5lgjHyCChVwn+sZ9rdy8/p8sgoykkGaMuP9Ctf64fbjQGR9hfYrlz5E1PpdYydNjqT3X4ywySjNn5fhRo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740533608; c=relaxed/simple;
	bh=z88yPSIrAWSO/K3PzrFkvS6kdfxJpK3RhjxAPK0TRfo=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=AiFYzFg+aqPCHrhky8wv6zhCLm+QVoXCI6rqOeH1e8hipvPlJmR9IFCvmeJ/ggrQ2hEE44AUUTYUNJSjFsj/HFmwjMPeTbogoPT8S3JNpIc6hc3UPEs/kG+yyvvUM1nc2KStg0Bizm7uhSfLMkvtzF71YjCIL3xkSjus0VlIs0s=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=WTUofaPE; arc=fail smtp.client-ip=40.107.74.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="WTUofaPE"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=X0n4HQiOlFJkHLGFe63WmPH7mP93zDVT+3a+h243kjWCNDbpd1TOoZqPfX4H1P69E0QA4aHxUEn9Qg9Kra2WjcTYI962PfWvH9D2+lGXnt6/n9sUQohhdtOtO0lNxfvBPW7kj6vc2Zi3FPKQeLBONdhFM/h4g+7hQS8Q1To+O7+zs9u65GoU2+859I7c31qfJkjSlDTr202rm8386vTx1KmrNj85yFz9Ty4CrpJ94ZgWpWe8dJ/wUhtO1yFC4Qe5d++R/IMlAJWkV6KJyRCp73OmgluXtqDYCvYFnjgA57Q+CYYHd+goNtPwzhdpmeh/Y0+sgCjOdT3mH2zZmCIGKg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GeR4kMbRyIRJmBsFk3PrZTf+mLw7M/V/xWXGDun3/Hg=;
 b=ReX28RZbGL1Ywf1sQrP3a66ulABc2AM4hHOrNfpTGtpLdfZ17Fb7v33C+3bj7qmwDgwNmVaSTyh0CSiBsOGq7iLKDXy+dVk2Nrus/GOk33OAgV2pQeuDiddXDJ2f/tue9tDoDLSDXINpAMoj/MPA9mYcd+xXS/GBjIf3p5+HcwMGu89O1gfDzFA3MUNbeITap1FIVfvIcxrvpNeKpEgeqWYn5vhqdOKD964RH4mFKDX80aTdAT/fCYdP2ukNoca8eCC6V2ahgl3BGs30KGEfbXdKj0uQZtV8z0Lbgwu9Uw91AZA3ejnc5IeVQXojagpdRD+ihVu1QJYcOPWifhxVqw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GeR4kMbRyIRJmBsFk3PrZTf+mLw7M/V/xWXGDun3/Hg=;
 b=WTUofaPE1O9p9IB5YGTeK9Yb6H5Q0Lci04mbIC8TcRUgLY37Ji8wX2S0vK/m3ZKK4VDMjD/FdvJPxO+aWmUpHAuZhYzh4Ki23dpdXXqkbJ275RCeSJL2EN3d8hIm9t2hh8PUR9HMesvwGZNfNa0j6xBQafsLoB5Z0iuKPi9dv78=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by OS3PR01MB8745.jpnprd01.prod.outlook.com
 (2603:1096:604:151::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8466.23; Wed, 26 Feb
 2025 01:33:23 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%5]) with mapi id 15.20.8489.018; Wed, 26 Feb 2025
 01:33:23 +0000
Message-ID: <87eczlebh9.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 051/157] ASoC: codec: rt5616: use inclusive language for SND_SOC_DAIFMT_CBx_CFx
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <87frk1h4sn.wl-kuninori.morimoto.gx@renesas.com>
References: <87frk1h4sn.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Wed, 26 Feb 2025 01:33:23 +0000
X-ClientProxiedBy: TYCP301CA0062.JPNP301.PROD.OUTLOOK.COM
 (2603:1096:405:7d::15) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|OS3PR01MB8745:EE_
X-MS-Office365-Filtering-Correlation-Id: f5d7185b-bfec-4918-80c4-08dd56058f03
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|52116014|1800799024|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?YDtCx0vZrUuYBtMt1RANfz1HiQQHjtM+Trg/g/hmyVsov/NoAGYLopGoQoKd?=
 =?us-ascii?Q?jRQMHL7d6cFpRaP6pDqyip6bf3nMGl8Jpe+xxO7dSm1wzleP2mtiOXw+lg0O?=
 =?us-ascii?Q?Kx7OEvv0OsPRjiZv1jZ7W8ZW6pTBnwdNh825xOQ8zsSvdBHRsqQNcnNTYgcV?=
 =?us-ascii?Q?1LG4og/mfQHlvtO950TjfEZZ2fnEE578Th5ZqY7urBuZ5NspALFitwS8UGDw?=
 =?us-ascii?Q?78QggwyE5/mHSgyjIorHIJMq59z+05pmbIaPzSG0Xjt2GfgY7mVd+D39dxFR?=
 =?us-ascii?Q?LmKCJApmGyqEGYXMRn6xoAhoLbFsTqvWdzIij/bcutdV4MK95ent+9OVRXhv?=
 =?us-ascii?Q?c3V93vPfrzCBK0YC6mD2ZgmgM7W14TGlfaVT0wuRRQIPJYRN9nB1KFxjt7E3?=
 =?us-ascii?Q?6+DsnLY8l2DaSHvsjdLixedP11vYQpD1yLQBIF/mqdTGexe7Q0LkTnxxz4NM?=
 =?us-ascii?Q?pNwNVCGuAG0w0bouH2BkpSKBH0G9t8eq/iZC8V4GiEw0G72/MVLmD22HfyH5?=
 =?us-ascii?Q?CTfCAXWCmoHzt6DpGj74hW6hvfexbaumQSdhZE62h4xa4Ce30d5/c6iZHtqh?=
 =?us-ascii?Q?Ksobu86qi0vSb3hJ6oSfSRtw+LEKBZ5jBeH1C4shF7xo1my8sMjdChLxSr1y?=
 =?us-ascii?Q?Irn+mgS9lje0TmpdhWiHIqUE8rIVoy8HPT52O+4hcCSTXfxRf/oAo/K3FNxN?=
 =?us-ascii?Q?vP8cO/fyxQGCae94OrTm3KaRtERmddwCyEpQZIYcfECiNvgvzpWomt2SbRkE?=
 =?us-ascii?Q?xrUwgbDVROJ+wJq0uQ4pCL2zAzmnERt+5NLuIZ71v9qqrYZdIXxb3RGcRtWM?=
 =?us-ascii?Q?JNkbGnXv4gpPvNTCiQvpRsVhD9mHKCr00EPdrQpX6/18vzx/7zBqxQMUjZk9?=
 =?us-ascii?Q?2EPb6uBteuL0Q3fj68sY5MCxl0XdeP3Gp1H4dQ7PtXP1iJABNwQLTfgkwiC5?=
 =?us-ascii?Q?d5XsDooV4iknBFVTiPUra34jUiGiM864C368IQQwgLkHrd1u1Xbo+E5SWUSy?=
 =?us-ascii?Q?NpoNY4UlB5zo7uPt/vq6TxCcCDqPPi5SBF0It+Tn6aXmN9zOWaAbbbAFzm29?=
 =?us-ascii?Q?AUyGeaVcLBRd6CB9fR6lFMS5qmqoT8mR2pWVBorHTT75YRMroKdRNF1IVcBX?=
 =?us-ascii?Q?XhzPm9v5iEnmHkpAqObK1EboLYASL5R0ABDdN4Cnmw2xWk1Y2ZlkGbbSG4Jw?=
 =?us-ascii?Q?4tPQTZNOhtASmyOopcYtBu6PLDFdhgY2wE3WH1wh1t1tJdnljEQbOjuqYQ9f?=
 =?us-ascii?Q?x1kZjQqrpEOmuuyXEHyXHCV1ekwbheFgDbghttB21+vRG94MG8QMJct2m1f0?=
 =?us-ascii?Q?ViquKLmXFzbYPL6xaPPeEGzV+gp+YiQpZFfJsL+yLUjSjVWK9EEeJlHwW9L+?=
 =?us-ascii?Q?N1ZxlGx48K4maprE7lvAPKv+l676g68LBlaxfJrcp2ioK03Sm7pn6lyyQ7td?=
 =?us-ascii?Q?meC7/weG4Au5mVhydSdCnSI3JiChvU5A?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(1800799024)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?isx3IKtUeOt0yKWBx7ucFNbi5ceM7bTAV+3VU7leLOgLIJ1tefvuK/4QjQAB?=
 =?us-ascii?Q?puObUQ3OQs1yglXoZ1Q8aVHY6r25XQfQMIsh3lZtQN92ml+bz6iYaMo/3nmN?=
 =?us-ascii?Q?gMEROf+O3gGU6rlr7pctaFGEk4oB4h1r0TV85yRcO4xOH9iRInJXJ129H/5M?=
 =?us-ascii?Q?TB42VPHnINn8Rkd9LjyxqUd/UdXtFWpJdqkIFf9hsHLMvHIyw/3qDDkDzPMv?=
 =?us-ascii?Q?aHp+b2a9Pvs+uLxok76OmmL6YpBcrRplOVS25pPNLxxXbbVfG7e1z3SyTvkQ?=
 =?us-ascii?Q?SNkZ+PWBKFNh+KD0d0JkAmV0VcznQzhe+jkA141QPuPtu+VOhi1PgDNkn2WH?=
 =?us-ascii?Q?aKOc9lhspNaNUJH/2RHr7/neV97+KTCmARe8OOYA8/inKwDyXpbJN818x2Bh?=
 =?us-ascii?Q?u5dxmbNEe6dqC6hoe/n1HVC3DGYv7BS2k1JmQDmljvLlzS7FFF9z69lJycNp?=
 =?us-ascii?Q?FSto9xeZtjtg/MeWefsPQ10s4SVAjB1dwbbrK8UHnESwTGhMppk93yS7sxKe?=
 =?us-ascii?Q?LHZrjEX6mFdFeRNeKLI+h60FO2VVCgvgxl74fTOhrbWnfsdSSz1jchzmLDDh?=
 =?us-ascii?Q?4uDi17EE8s1gFVH8sVzZeoJvoQRgGRZDRgnAkAu7eeDsyrTdtiWoWGCGpy82?=
 =?us-ascii?Q?KVUq6dx+dbtk72w2nnu6I/ySQ3mbkPrEjw8FTL3EeVGx8iBfDgrtLDVC3E3j?=
 =?us-ascii?Q?OPHCN6Ez2uJJvOSsJNAb3CYkLLVnpEzkbCg4z/hpQac92oF5NeoIcVyCdyFM?=
 =?us-ascii?Q?xR8YIUNqDwZqMqKquOAp0JrXH1fTA60jDpsqAhz64iUY9CZeS/HfhnbjSjKb?=
 =?us-ascii?Q?JIEb6jqnOFq4BuKAkPLDIkpQ9GhwbwsX+yc/NvRSY0sV7M7mcOMksUSfl2Bj?=
 =?us-ascii?Q?7pNDXz1ytkeTUa95mDqSVfcf36fo+nJvpFCS2jlanzIvkArwRu1wiUnyN/uY?=
 =?us-ascii?Q?5QRzrMXv5qmx1czOI7x5DG0iTAZ20IVktA1VQbE1jlQBrXaiEbAJfTUYb35f?=
 =?us-ascii?Q?4fICq5pHJut+/hQz4tJT3hQHVjp4FMhRPyW+kfmmXwM+vh4/KFEMFihTrRrU?=
 =?us-ascii?Q?iG5xQNn3qyl/fBIT6AcOxUiQumYvvcMBxbGvPtuOK4MvkLVmJQe7pftVh1Hf?=
 =?us-ascii?Q?9IyYdU2tVCRO2v5SJ8ofganXnrtAVZ40HQWIdvpiUi/JRkQW5sBfz7ip6+Zy?=
 =?us-ascii?Q?QxLGaQGjFYIRTIoRTlyiz1CCuqh00ud527ElnZVwBQqEsqS8Q8hcNBTyf434?=
 =?us-ascii?Q?B1Xwq+I+ToPJCvRYtIe1x7xK5XqfKmZPi7sXvdX/HklgxGNgVNynYeainYzc?=
 =?us-ascii?Q?TFuDIYeQT2DpvUrRRChGZQLOoDWvpZE5I3vSiWuiUhCdy89pzh2WZg1Z9uG+?=
 =?us-ascii?Q?Dh7Ah8nOjremyr5gld3x4vC6l16t8Clyyzga/KQq23PTzHuSOM6x97F9hSvW?=
 =?us-ascii?Q?3PkYLvZW7tCctmljIHqOxbgg3CqoedJeN74KBNKExrVKGsjVmumDoYzbvgTe?=
 =?us-ascii?Q?Fzc8gtsXaKo+duj/vs5rH3XE8HTU/s3V+YvPFfwvJ92pPuAkrFEyyN7EYg1S?=
 =?us-ascii?Q?K8l836y6O10hfcShNueok+ETevtUDHMvvUW9XRWCfPCABVUlIm16C6fJ357s?=
 =?us-ascii?Q?pXaAm6tt/EmS5qqRdSgyWWo=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f5d7185b-bfec-4918-80c4-08dd56058f03
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Feb 2025 01:33:23.2123
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 59BZ1IgevLocAKdGw5ZKCOUyLW9p2Bx4ODLK/UfCa278Z6Sy9rJnkaFVGYarX59pWLNbobBllXyd1z0YbCeKB3kfYU3E9dEndJlQ8qIKojziYs0f4BDQCJz5q/dsRqBa
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS3PR01MB8745

In SND_SOC_DAIFMT_CBx_CFx, M/S are no longer used. use P/C.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/codecs/rt5616.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/soc/codecs/rt5616.c b/sound/soc/codecs/rt5616.c
index 34461c462009..1ec486707ff9 100644
--- a/sound/soc/codecs/rt5616.c
+++ b/sound/soc/codecs/rt5616.c
@@ -1015,10 +1015,10 @@ static int rt5616_set_dai_fmt(struct snd_soc_dai *dai, unsigned int fmt)
 	unsigned int reg_val = 0;
 
 	switch (fmt & SND_SOC_DAIFMT_MASTER_MASK) {
-	case SND_SOC_DAIFMT_CBM_CFM:
+	case SND_SOC_DAIFMT_CBP_CFP:
 		rt5616->master[dai->id] = 1;
 		break;
-	case SND_SOC_DAIFMT_CBS_CFS:
+	case SND_SOC_DAIFMT_CBC_CFC:
 		reg_val |= RT5616_I2S_MS_S;
 		rt5616->master[dai->id] = 0;
 		break;
-- 
2.43.0

