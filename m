Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazon11010027.outbound.protection.outlook.com [52.101.229.27])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F58018FDCE
	for <linux-sound@vger.kernel.org>; Wed, 26 Feb 2025 01:34:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.229.27
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740533685; cv=fail; b=ZjIFpI8r76dRZDR9/9GRtOrNJw8Xwmy1C/lxkQmTtsqQTrDLGOEE+WsiV/S6nBCa72yGgw4t77/Av7loVuB+h4Km0MC2WQf68a3unmiyoSYoH/DmTJqPd0PrrcUs04u8rwLHYQIPWQgju6d/f+UXL6CvHqGgJTxMBSfaVzIbxVs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740533685; c=relaxed/simple;
	bh=AdH5sS9dkIBsryOQ9MrAEj9C5AnHHS+ccS+d2JW1wrs=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=myRT+xn47fMgMWtLXZmD/7sEmJJOOF+Z+XPHvLjKj9wBdY2cdAS9kSkobPdliR43iGq0EF4S9EykYGgO/zV0CAkddchzWHGdkefMeYSSSrRDkcLUq3q7LOTeJ/PmoMsqWdPpuDBWIqmv4bKLRJnWH4HVfPgsXLpuISnWnECD42w=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=XMgNqBey; arc=fail smtp.client-ip=52.101.229.27
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="XMgNqBey"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VjpkAP1wTN0Y5VXYs8k0SmM8CTNLq6JX3+AKAVbzeK22jF8E9BLbaNW/XPWYwzNFM/zmkNzQy319b3p8arNiSd9io83KBRXtqJ9px//b7MMxFaymPlHyvSGPYn2qZrzM43wnxDHpmS/X7+BtWU5C8KHGm7Vb3I3qCbY2wWItaWvFS+WdR8BUPHMLsrBv7LXpWQNA2LuejSFYJ+MFMVQ5fJWxeA5060Z7FlhDFVi1DvKbCmFEGtW9KtHiiKfUfWIoxWg9O6wVSqTbIemx3alvqqpcMSRip3reuQFcNqpBvjqhOiK5/k42UgIVrs1snRU3693bjs8+CrwU95/MQsu1ZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hdNPSF725gEaNboYjOTnMxqroh3Y8JPpCZZ+rTQkn5Y=;
 b=Q2/EJoa8ql6a6uIAKjsHa+hT2BWlAp00GkBwNKEVMmk0+ehYhg05tj1wBtLTymSxUI/y4wZ+W3qDKEUOBWxpzJpVUrPAiyFw89dkV9O8eMNu2o671nim2dAwcXFROmwA/ZQyFokEjfnwK8SZvu0LBkYE7PI01BxW1is729xl1iu/ds+26yIUZRAeZJhGh4zqG5YZkKFnef1frv/wcZxdxFIE/ve3zF6fanyAABp04kXxGtbfvIKvSZQWdgyE1KhCoJYAYgJ1sQUmtElZoXfV1szsP8htwKUf8Aq87Brv6m4ubdwkaRqykUVa1PfmsaMgA4CWmZNN5PA+yBcbi2G2JQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hdNPSF725gEaNboYjOTnMxqroh3Y8JPpCZZ+rTQkn5Y=;
 b=XMgNqBeyGh7TYbueqeI0NQ1QZ0vY10adpzk/D2YmCNoJ38T6t7OXNt9o66zCUu5d8jvZWf2rxoWxo95chxyRknkB6213x5B5JzE2xAskP49055x+3KhfDtUCAcQpeHO9xOs+a9CYQPEwUPX+xyY21k78SIMMj8wki4lU0KFsh9o=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by OS3PR01MB8745.jpnprd01.prod.outlook.com
 (2603:1096:604:151::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8466.23; Wed, 26 Feb
 2025 01:34:42 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%5]) with mapi id 15.20.8489.018; Wed, 26 Feb 2025
 01:34:42 +0000
Message-ID: <87ikoxcwum.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 073/157] ASoC: codec: wm8711: use inclusive language for SND_SOC_DAIFMT_CBx_CFx
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <87frk1h4sn.wl-kuninori.morimoto.gx@renesas.com>
References: <87frk1h4sn.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Wed, 26 Feb 2025 01:34:41 +0000
X-ClientProxiedBy: TYCP286CA0181.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:382::19) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|OS3PR01MB8745:EE_
X-MS-Office365-Filtering-Correlation-Id: 7cc2cf60-68ca-4fea-aa17-08dd5605be16
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|52116014|1800799024|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?hZ3qF1Jvo9KiEyUeysuLFYdZXbHm23NpJZZIcjwqe9wClWLxAgl8sSQqxGer?=
 =?us-ascii?Q?8vX/GOWyw3rm9LPYWQUEc6DncWhM0cus4NiSUCvkhIzFbPyQYLfBsdJ5b40m?=
 =?us-ascii?Q?zcv81KNi96ioPsKZtXvkj/7Z+cdWC4phd8qa4Jc7lig7b9ETWGrHwgrjTEln?=
 =?us-ascii?Q?qOg3PDxxo2epwnI9fBS9f9OiYDIewbs+QE1CGaJNo+U0LcE58zffQU3+S3DD?=
 =?us-ascii?Q?LJxmCZyv2RvMJO0wcNCs5WfYOn6/2bW6hatWiZTmx5KQW72xS5WYFv+WfAB/?=
 =?us-ascii?Q?DEk/17X+kyQ0Mm6a4O+GOp9f/Yd5ZdVeba4wwrh75hy7+ZzrXqkloMCpx8k8?=
 =?us-ascii?Q?SvX471JKzh9YcYSlB7SwLm9Hl0cqb3is/+pX19kB9cNg01s642hRf7cFL2TB?=
 =?us-ascii?Q?qZIxt5lOwJE46Dy/fSMb6nL8v81IC3XKDpgAh7eoGs1LZq5gHtagRWxHF9JF?=
 =?us-ascii?Q?RjrY3r3dLV333IVdtgO6y83gEhGbz+v/YCuk4+rF4Ql61X8Zlf/hHpXMwWNU?=
 =?us-ascii?Q?pvDWa6IMvnUzDxWsdN/AIiVfzamMmUtjtmNaDfefoNWTYj+62/1xAf7Ap9m2?=
 =?us-ascii?Q?X076P7FHuMMPl9vSeXhfJMellYsC9tD92PKniNlc0bY7JVfR2VE48+NFNnc1?=
 =?us-ascii?Q?ZdcXKoAMHcAquq99qbLV2o5IxJQAj7h6x4Hfxti+jxyHAaHLs9xoh1unZ+ky?=
 =?us-ascii?Q?oJhlyU+DqchX/MzghMb5/HFFX5x1QcosL2+ehvEzue3sVSMnXDozF78XJJNF?=
 =?us-ascii?Q?zZpAjLk+49K4O2OcxH5rRuEVNgp1BodKbFgM7T9IuK/xv/res3Yv2041q5Gc?=
 =?us-ascii?Q?HsuG35nZ1NEAFG5GFOrYmzGYVYiMIEBH/H06Be3U8sc0h3J/c/H3cSxF+uR0?=
 =?us-ascii?Q?mKebLVDWXL7da1tXcjCupnaumpKNMjCe+cjZ1bgiRhYXjJX73iYXb9RMnV7S?=
 =?us-ascii?Q?V4n7qqgx4pbye43cseL0xq/AXteltmHM4/Zl5pRb1W8C9qzm1oSeOrAAUd0v?=
 =?us-ascii?Q?12VCFQQZrBbhOG6S1vGtc3X79b7LPVrVG92KY7qmPtU8k8gXLm5FlBCXZ3t+?=
 =?us-ascii?Q?gCsbxXqxLoAPlQUEmwI+78ZH+D4c+TqJ16UGvfCzaxyltIjzJOn9BqzJcfC+?=
 =?us-ascii?Q?Hx4dDmnC4ZzJLYK0wvHSlb8FvaXceqjoIRG4sl3UD2fkSxAX9nQn2r6a83lT?=
 =?us-ascii?Q?xqbku6aq6GuzbJlt8cevxwH82H+h5aVaJCk3BDSiEqLGgoQiEByPU/xvrW9P?=
 =?us-ascii?Q?3HaFJancDj8tLf2QvcHwmac8HDK7piYApEejRHJFrqLQZGqm8gyTXYyore9v?=
 =?us-ascii?Q?SPSB3iI9fSeqejppBCNfCICV+SYpyVGjxMites0ZrHrA5A06SrXPPaQYxESK?=
 =?us-ascii?Q?WQdQvCzCcw5Tvq+vX2aO3BQRiMuEsyB7LTcSs1fxy0NVsKksbvGekBDV3BQ4?=
 =?us-ascii?Q?TrdPQ4T9PPbnU6f9kDa1Vq+PfgAG8bKR?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(1800799024)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?o75BTb55GiaykZqi6bMwAowgybP6Lt66AHRlxa4Y4V2QSM4z9CbbRcMpnXAU?=
 =?us-ascii?Q?P7T+pkOVaCrxzVyW14XXH4OXcovJIpSqeHpoP6EXCXvD3cMA3veRZNK9pK+E?=
 =?us-ascii?Q?z6+IfCcbgnjVJKpDRyPFyW8ZuM9Jsz0fQMTL3pqut0Sd6IJgcTMXkARxBhqu?=
 =?us-ascii?Q?leLcktheqq6Tq8jonoHo2s5K9Spad+WlC3n/GDP2IRZX9qh7ZlqfZxjDkXpD?=
 =?us-ascii?Q?luZr8zeMnlYimhoJ4PsoiUGPbLNj0IbDEkZZeJgg7xy2qaUVTGuQh6qqvrXG?=
 =?us-ascii?Q?ISOKKybAGWzRCsPVNwp+jHshl4nBbbSllMYikWWZ8pbDHTSBS6I7RfBFqqTT?=
 =?us-ascii?Q?zwaV1TO9lPmFJrzd7nTU8bBINgQmGPPYUHUALrRAw2y5MPAlFN7et0yDJiME?=
 =?us-ascii?Q?Ild6wIQ3DPK9g02pBMI9rnvRdoGUP/g10SO4mI7lmXbl/Eum3OWzzjh33iB8?=
 =?us-ascii?Q?5++yERZU6ZqJ5hg1B5LiwyO4StcGjtV0NFlwexrKc0g41HL6MzJUOGsEYBGA?=
 =?us-ascii?Q?Rre5STlg1tXtBwbtDu32FdjhKHIGKAQ9PcrOHwyYvbVknRjeTke+Q1Nsq2EW?=
 =?us-ascii?Q?hfg+hju41Hq41cDZuuHCrk1yIov/xWjepuLmP3HabbcBDQMzItIe38oMB7cF?=
 =?us-ascii?Q?cp41zJpfWgVAjtitCwGcexJg/X9QBJ6yevC/N4PajxdmpjT7DkXPndPIYaqi?=
 =?us-ascii?Q?0c8hSCc1murjtZLP8GxkVR3jS24BBndrB1tTw16oMpKbHcWC/HMh7yD7BNYY?=
 =?us-ascii?Q?LTdr516lDY3LGdi02C9mw2qYX3KSHsw7woBuBa4Iopl4LwRctJD2PlsttBhD?=
 =?us-ascii?Q?vZ0ZadaW8o5XRZa5r4zfsiDPyMU/P+J3CVv2wctRdrVhFuGm8wu2y0WpeP9e?=
 =?us-ascii?Q?gZb/rzCc0Ox4VIuhO/NMcZBrtBdpX04X4UpqKNfXGA+PUMdDrgUK5NjcA4BA?=
 =?us-ascii?Q?JEuvYgS2zfMU7RF6UGkZ4pKxhBzKz/end3chRzDsfmQ6FmtYCcGPL2sYVuX8?=
 =?us-ascii?Q?Ts6BRIzj87NYhvqkS72N5riyq1xTscZxYwXjRQFCPtygLYMDgN5smD8FlAtY?=
 =?us-ascii?Q?gHrA6/o33Rq441jdOy8oahkoAduz9Ih8WnsA4UOpPExMGVDx4ptIIqeR4Ios?=
 =?us-ascii?Q?FjQZLJC02yAFOdrC/y1gEoIsOL6BSX3lDeOBXVOfG1ZiIFBgBF8CI4ugNX59?=
 =?us-ascii?Q?tDK2AYIPGvvA4HlWOk1akLTB5qs0BSq9pb3I6IwjLTCCwN7Inbn00eXGLYeK?=
 =?us-ascii?Q?2H9hopU0Kl4uCbOZdMq4Xu5LimYLKbh35KmgEL6QHFbG6UjRxOFrNH7Wbw+V?=
 =?us-ascii?Q?7hNyxFVKytptoybYGt5OGT6zlCkGCEUHvBMby9XzV04OYCvLps7LLaCaPepQ?=
 =?us-ascii?Q?aiGoYCJPVsyM6g1ur/N5Hw5H7sazhWzHe05yFlX+nuPGC1xSzkn6oJbhthy6?=
 =?us-ascii?Q?5Ita6GaUPm8uv+5I/Ye5grj9XTbRzT2SGl6gZPGKwtW63mNCSP8Otm7VQWml?=
 =?us-ascii?Q?DDfF+mofrUfn4tzulcqh2yz2NKaASYfL8z8GeFMIEZbOUNsNBMNGh+izJaTe?=
 =?us-ascii?Q?D+TCas8jcqPfdy8FSo2jwUp0andCuXAQ2oRcOZWol23pGG2sTNqIKGjWSfLu?=
 =?us-ascii?Q?iZBizGE7MT/fGNJzegp2drA=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7cc2cf60-68ca-4fea-aa17-08dd5605be16
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Feb 2025 01:34:42.1575
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: G3i5+zToLO7dZ32RDm4jXSgcYQ9pOTU8L3AJh+Sz/bPCc/hxWxRIijbpLOD7ZaaZ403d/CZRH/ZH/psepPvkmYSOcF70yc9Ny3r7Ftd5XkLXXMGCXOGpNUuhpVpaAsGy
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS3PR01MB8745

In SND_SOC_DAIFMT_CBx_CFx, M/S are no longer used. use P/C.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/codecs/wm8711.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/soc/codecs/wm8711.c b/sound/soc/codecs/wm8711.c
index a1c99bbf5aa1..481088987742 100644
--- a/sound/soc/codecs/wm8711.c
+++ b/sound/soc/codecs/wm8711.c
@@ -243,10 +243,10 @@ static int wm8711_set_dai_fmt(struct snd_soc_dai *codec_dai,
 
 	/* set master/slave audio interface */
 	switch (fmt & SND_SOC_DAIFMT_MASTER_MASK) {
-	case SND_SOC_DAIFMT_CBM_CFM:
+	case SND_SOC_DAIFMT_CBP_CFP:
 		iface |= 0x0040;
 		break;
-	case SND_SOC_DAIFMT_CBS_CFS:
+	case SND_SOC_DAIFMT_CBC_CFC:
 		break;
 	default:
 		return -EINVAL;
-- 
2.43.0

