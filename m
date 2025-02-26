Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11011031.outbound.protection.outlook.com [40.107.74.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7198E2AD18
	for <linux-sound@vger.kernel.org>; Wed, 26 Feb 2025 01:30:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.74.31
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740533450; cv=fail; b=eRbAYAA9/2c0yN4Ikft7Pm0h0dyTuFPJ0oimUyKtMLpm8/k3OqXWesQp/aNp3lAojmkqLXawZULRZ7xpvD9pqBZxUFFN1fHAOAMJeoGAiOLYCUmYOnxj6xoDZEPOXOG8syyxGql0wCRPZ01yh/nlmtiSykEPk0adx3McGRxYtN8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740533450; c=relaxed/simple;
	bh=rqP7onQ1lC+Zol4tKdmuGlgWgmP0APGKoH4h9PNvewY=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=FESYd+8qH19PNtxmDwz2cVG8mzfj+ZFLi/NMFuUB1ReS2u2djrwyJa+MtFrLXu7KAtcbN90ApWr37mRQuw2JGhwPJquJXQ3aAmI9kY2Gd3vfjQXjOSisj/Wv6fxvsT7yOVGV4/0FfQjoTu42mNn1U4r9T3SpelCGxELg8uGedQM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=daw0v8jP; arc=fail smtp.client-ip=40.107.74.31
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="daw0v8jP"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZrwsaUP8s6I/OTSUSZ41R3rb/cZqQTtFQTqIhy6+hN5w9EHLpCEiddP4dAgx3zbxggSWSr9dsAqWb94ccaG4NOYOfBHd5m2m00rxSb5HKRSuCL3QR2rSHsj/yj7qMbX+YoEHzA7fpNTGSk4ZKOPppAeCXEHBeF2HJ6KVBDF3gwsX97qJFtzI+VjpFybeYRBMAghgySq+430iVHyzYkeCTXQ6/51jBrh40Ez6Ozy6wkCRpX0NcKgLFJ02WhcBXM+ITX7WF4MFGdh1tLCmxAQ7zxMpyLwo4WBZX8N6ge8P2RMtBLfNGGfLtRspS6oXJ0eD3DUnDzBsocqdut375Ospcw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CdaQJmJWQJbjeTL0w82UFxUgCdKLZLZyRsx5o1XwXaw=;
 b=TwVmYC41pSxW5gpv9bRKtcC3G6urC5fQXJ2Q0/lit52ovWp3B/hU1p+eH16bAkA8wEFG2Lzd7+GYNMXW6ClH6awsuTrLX7CWfL9+pC2apWxiqL9/MckeftvRm8whxtDYMX0BBlcao+V1Av3x8ASAraLt2juadBQSBhp7cCiuMSo0YY6CN17I6lAg6W+VUbmMBjZ/9G/+OwbPs7c2sf0NhsAhRiqXn0kBcnZ1GBRiWp812/ryf2Ag/Vh27pLQw0ZPwc35CBg4vX3EzMdhU0g2vSe6GC9OyOdqukaq0mjeDvVKr0kvGal09IkTI5iS4NSjIHbVvIi2g+ZwHQWaGz5V9g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CdaQJmJWQJbjeTL0w82UFxUgCdKLZLZyRsx5o1XwXaw=;
 b=daw0v8jPxN7WvK7u63OUZbNMYffyAMIQaOVKX01RoFUL79dHbMzJUwdqOm7IQtxbTYLEmC5HJ3Qg3zfq8W11wUxBED2EESdrIAv2ezWg/A8AChzzW6i28IojP+DfCgy1fwcsNMjWP7hIMUmq0l9fdhLLwIjErUWUjdKSZ0ONEZw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TY7PR01MB14457.jpnprd01.prod.outlook.com
 (2603:1096:405:240::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8466.19; Wed, 26 Feb
 2025 01:30:44 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%5]) with mapi id 15.20.8489.018; Wed, 26 Feb 2025
 01:30:44 +0000
Message-ID: <87y0xtfq64.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 012/157] ASoC: pxa: use inclusive language for SND_SOC_DAIFMT_CBx_CFx
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <87frk1h4sn.wl-kuninori.morimoto.gx@renesas.com>
References: <87frk1h4sn.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Wed, 26 Feb 2025 01:30:44 +0000
X-ClientProxiedBy: TYCP286CA0160.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:383::7) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TY7PR01MB14457:EE_
X-MS-Office365-Filtering-Correlation-Id: 77f495fd-55e9-4f6d-e5d5-08dd56053063
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|52116014|376014|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?c3uv/9G/IN3ddKQnLuCxZHqnPMznOOjOLH1DVp+O5VuOWccgf+qcgoQdSWYJ?=
 =?us-ascii?Q?MohjCcDOkpoIfKTSqo10cH0wzRkYWBN7LpUS9xMwv4WrsmI8H9Z+riqJA60T?=
 =?us-ascii?Q?DOStRajbgo7GODFh964/dhK+o+byc3nuZ22A6JAq2LlIcwgrl1IJXqJYM8cR?=
 =?us-ascii?Q?Xw0YGiMmbSIzq1kf0J86vwp/Hrjv5ggv6MD2On8aCubJF6JvG11bOmNoogRg?=
 =?us-ascii?Q?Xyar4rhYUyI+m/6YogmJgHCqmmWCaVC5m0M9iBm0u4c5blKT21JKY9RRvVLn?=
 =?us-ascii?Q?0DwtMt8dc76FFf/DBucxMobpXB1GFE1XBYvs7j4NIy2TkPXr4dJHAZDDNQGC?=
 =?us-ascii?Q?QsjCvlphTzTEyzjjG1M8047ee6amPao1qu5+Ankww6LuObuOMj+BVBtr6d4e?=
 =?us-ascii?Q?tmvY4JVK/bJSlC0IpZ7hdZT2zttLB9aTGzsh1DgTyen1LXIgB/Ijsij8mjbE?=
 =?us-ascii?Q?AXwzInqEXmITgiAAjJZPiIk1lSNQ0c+WyXYXjnEmiFGJgyIXJFKYscQi3WxV?=
 =?us-ascii?Q?r5j6FhfxeNgtiCm6F7xV8IH6y8hrwwVkvKHV9WjpWxyJ0BamRBzT77i2daap?=
 =?us-ascii?Q?bGygB7X6W9RrtGU6SSuCgOzIpNN74e//way1PCaUM+J0jpzUmtDAgxoBqaf8?=
 =?us-ascii?Q?vgeM2Ymf9lEskV//I2957kb9fXiD9U8SyW2eQ+GOB7J9BaPz0OaOYZ/hs5bi?=
 =?us-ascii?Q?ja/TlO1J8cFflOXfiPZUzIPPqkhrtR0ayor0d29AjgCR75PqOxyl6akQ4ULU?=
 =?us-ascii?Q?Gof/gHz0Mv3FDwjY/8vZ5DJ6hqurQH+2PClp9XTh2EFLxs9s41f7Wr0huuY2?=
 =?us-ascii?Q?D15lywBRBAFrOXrkFBGWWVUV7Iic2K+ff1rF8MSd3Ua65GxmKqhrizZx7WpZ?=
 =?us-ascii?Q?Gg5cyHwEJsk9iFyKhD0sgowCatCz0GlRYFOMF75RWuTAozyZPSeHPkYRBLEY?=
 =?us-ascii?Q?AdqyH6NDk5/N8x498fSVyIyN3vVE8J5gXGsH6/SNK4aQEXXgedVFtsWvMeMu?=
 =?us-ascii?Q?rsDUP62tUKav6S7Azjj4w1U4oQN5nF+zojqglvhl9N3Wh2q/yQIB2Cp0/BkH?=
 =?us-ascii?Q?NnnD14xxF5oycFN/6APA1V2aXsVUUJOG/t7aF9X4cUgYiFk2ifbl188VBoET?=
 =?us-ascii?Q?yj/69v5cWDxZZ0nXG3fOx9exE3jEmuDsQF2/pGxGvm++EP9z8C83cfq7b59n?=
 =?us-ascii?Q?2gaiRnlOv5pt8u7T2tRGfCihGZxYrGPR8nnxINF8uUM1f5f2XWL5pJaH3ezz?=
 =?us-ascii?Q?kpHDvmNmNRrOooxWBwABHcE5WzZrQn2/H9i3sBU97mtGZrAR7GwnByF2zwtY?=
 =?us-ascii?Q?7Hjjpw2pPDHVVzr1HjK5iCAZV1I+0q7QpdJ8YwhSLK6u9YtESHDWRZYbGwJq?=
 =?us-ascii?Q?oPsy83qjXP8qMOBmxGqAL0VcO2HwlwtA5yCGh2e2CO+aVYaAXEWWVEIBdayc?=
 =?us-ascii?Q?/GFFvHEwsUXmOJzw5CPUbuvGX6p/9o1s?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(52116014)(376014)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?c7zn6mOQn/YPBC5s3lLDQPKRMYwww/7KmIi6rmHNBq6ol8GIi9Y+cRPAud2x?=
 =?us-ascii?Q?5AB7Wa409h2IzhctsouUThG+6//EG9qdbZLr4LAeKlq+bwyQqJRhQuqV8QR0?=
 =?us-ascii?Q?CMI/9URRyNWlvuH1nGpG80R30wA2MtYWcovRQGPg44ckHlgNnhzzidLvCtnw?=
 =?us-ascii?Q?h3bhXsqqbT/5Vz8/4ajMmUkof/+DBcElQQsUalRVR62hUrLLyH0RuknSHcKu?=
 =?us-ascii?Q?MemNLGFDHx7PCczM0p7Z8a4nLhV+4IGXYD2hiV0bBzJkbe4ewqAVnNWi71b0?=
 =?us-ascii?Q?0K1Ikgmn2L69higvHWw1bx/8upOiSpnllvoK08X1f54jnQdGpbK7p6PaaJzh?=
 =?us-ascii?Q?cVeGgVfv5/CPYP8pJ6UFhqtK8DG7bFAzDgEbGxWTo2LGZFU9nARZEcJ5A+zd?=
 =?us-ascii?Q?qvO4fGcqpAaacMZXn1BXF98FeeEWquYovclvsBje9XZv0v+9VR+uBSGH4X7K?=
 =?us-ascii?Q?H7jZSO0E4E0XaJK8dewkzr8wUFWZDObZlHQC6vifBmeEjVtsXSexRICQwNMI?=
 =?us-ascii?Q?GB1BSSQOBcdT/P5zU/aUt+lA2GulKF4Ew4MTbGWcGAKFVFE5E88RrgwBYq5u?=
 =?us-ascii?Q?nJJnLrwdwv2o5zES7/0wxxVoUTbzIhTSJuliPRd74rcUAC8wpe3tDiaNSJ+8?=
 =?us-ascii?Q?SNUH++DBtGSZxeli221AboSgrDgh54TyogZgDfYWAWrrFFrJMOaXajLSTbaJ?=
 =?us-ascii?Q?VdkFFGICxFJ+S3VUrOLqu1h0dL9N3Xu6E5nCoIFxYRNfr5iTAjoz4uT8qy66?=
 =?us-ascii?Q?MXDu79aP+b+sd+AbW/qe94MOtgWfyps5elf/Dm9xtVuioa7Xcr7/lqlf/00o?=
 =?us-ascii?Q?BfrmXxSagt5JTcnfMT5Uf7KDxx9dL06Vf+AdkBPj/OPfOUKETQw4j8obbskK?=
 =?us-ascii?Q?TfrFJ4tRsXuiLtgLs4mGVmlp8l4kjshs5XSZS7mg2ysnkgzMOjAMzIfTs67l?=
 =?us-ascii?Q?lE4ePFNHX4+/Sb51FxowfFj3oxpYpu/Yaqe7T8Tb0tSrwDNwtgWQie/EXL1M?=
 =?us-ascii?Q?toBXCnt9fozLvzbPYQywpmzY/82KD2F9LeCFVSwzuz9/U+r4xhpWxqtsPDoj?=
 =?us-ascii?Q?SBwqnUr6WHK4GqK+cXTymPzeyal0Qc5T76Db2sMOsu4hgbzJGLOBhvWVhsI5?=
 =?us-ascii?Q?p51TWJR76/5qHECUAa7ejhzjCSHNlPB0MZNgs7UUkidjqHzyhYqQ80t2XcEI?=
 =?us-ascii?Q?CT4t9lPzkCbjEgGfVng58qYLtx15TbWZ/1ExWOZ5lFKymUH+IHbmCOKfR3zR?=
 =?us-ascii?Q?6c4yVE//9XHxRmqPzURW8bnLDVzoLpjOSi0FRZBT38Aiydv+ycO5V0NefjTd?=
 =?us-ascii?Q?aG4kGL00y7ek30c0Dg5P/xs545HlW+GxNznHrhgw7R0unm67Blbrs3YN+Z91?=
 =?us-ascii?Q?9CmiF4qYnX9Q9qVrwC5Iqe1BaStHcyUjCUjKqh57wYp521ji+InOCQCt36rC?=
 =?us-ascii?Q?vFfMNtbVJLHYT8icehFIz1v0IxI/51Dn+NM3NZ8GMMIqKpo2Y9eua+cyGaUy?=
 =?us-ascii?Q?bAg2a56skEYAXhc5vJqnlc2WeguZcvJde9UtnTMgn7XcJcj25XWmcrbdl2RB?=
 =?us-ascii?Q?LDux6iGehvKbGnwAVB/S9ujGlMafJSSR0aDHtZ87U2s5aXSiIZysXg45aCmi?=
 =?us-ascii?Q?ZELZzEPe42fT0TGnBAB3dOQ=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 77f495fd-55e9-4f6d-e5d5-08dd56053063
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Feb 2025 01:30:44.5052
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: c2rMHTsA0RRPRevuXooMv2tRsZ3F2Lf2y8Rot60DKKERYzNBEZoc5JP6lvxjHDX97oyVsKDhF9Sn/7gaiXL282iwH4Rw5eyVwyZ0RrZihuThVRu/g3aKseH7yi8Soc0d
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY7PR01MB14457

In SND_SOC_DAIFMT_CBx_CFx, M/S are no longer used. use P/C.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/pxa/spitz.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/pxa/spitz.c b/sound/soc/pxa/spitz.c
index 8caa1aa99bdc..6ca0a6bcd34c 100644
--- a/sound/soc/pxa/spitz.c
+++ b/sound/soc/pxa/spitz.c
@@ -260,7 +260,7 @@ static struct snd_soc_dai_link spitz_dai = {
 	.name = "wm8750",
 	.stream_name = "WM8750",
 	.dai_fmt = SND_SOC_DAIFMT_I2S | SND_SOC_DAIFMT_NB_NF |
-		   SND_SOC_DAIFMT_CBS_CFS,
+		   SND_SOC_DAIFMT_CBC_CFC,
 	.ops = &spitz_ops,
 	SND_SOC_DAILINK_REG(wm8750),
 };
-- 
2.43.0

