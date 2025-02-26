Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11011054.outbound.protection.outlook.com [40.107.74.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FCFC192593
	for <linux-sound@vger.kernel.org>; Wed, 26 Feb 2025 01:35:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.74.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740533733; cv=fail; b=jKdibJ+5aV9fXx2z19RbpPB07q0sEdGeZr4RVx0BO26PDXTUveRDdPQxZ68n+X614fUSgdkW+5dGC2zNLyNpigqoQJ0BjlRLeQlpImmHNK7NcAS31QSXEjnAwpE6HJS/gHCyMB2ohwEZWWP6TQ/jDZsIr4/1V3ae/wD3lqiPlfA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740533733; c=relaxed/simple;
	bh=mbZFky9VDbB5aUEzjUVWBNZCgqahS33AbZQbs1/AuSc=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=YTVzkM5yIODbx6ONg8cdJ1uza4UfECev42adK6A1bHJ302i8ETt8iV9TzY4MAP+vTtKRABrZB9xreUuCKFVAZPajNjv0nxr8un133mYpGQXcnpzAnB4MsHEvb+TVUcBZ79G/CKD0IUAkwtiQXAiQRDZF5tj/Tj3ABHvHmMKDRnk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=W7ea1/qn; arc=fail smtp.client-ip=40.107.74.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="W7ea1/qn"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jET3m9CBEP5hWr4L08ZPIhA+aJV0AGgj3iKKNkeoMcxHOYNIqfv/jcBJseJS8OmqXy1gNQucpJ4F5Gsp5/6WKofqlptAHtvnMMI7jgNvVo0Svnxv4BSjBshm6Phpk8lvB2ZRs8Frjk/wXbLfUevbIWitr79TkvlWETKiCybZVea5LYrey8uH6s4MiqZ1UEQv8liajOwOAjvhSqjD2C4qd7V/KsCFD1CDq/DsoQvRQXBTVoA2SJ5t+YtJNziK8P5lM9cqPkE8OP4XyLrOc394F1ILcAtlK/r0/JTVbZoolvCNxXAgOmvBhnz7NIukeyAWs2TqMYzOVcdWoYpuqW8arQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HkuQILPu1+4lMxXFJZMhjs2PE0+j/ICiiuih5RFgTko=;
 b=do31z2bLNYCMrLhsq3r9s5ZYS4bK5P4o2FTFUJ4vp57sSY45MDeNguxRQLUR/omE/zJ/Z0ZBoY3nGbLx47+h0DniHSWPKf253eHTiqnmVz6Lk/nF7ENtMIYNIKSyM+RONDFkMS83H6sQfabu6Id2YLeTYF2sZyxlmZ1ZsU3OX/Rw1jFT0zqptqGIUndsnzPUiF5gQ2GQbRqCjtVc6bz1MfmGsNrPWYbTwddINZszS1hf+DnPj1vGTlbD35Pyxp+9x2HDm6OekY3dYrV1Pxd0SL6m8MzgiSzkFHzF0XO3H1QmjpgEW0aTUgTZa+z88A4+nhwfgmMRidhglEaNsoY3IA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HkuQILPu1+4lMxXFJZMhjs2PE0+j/ICiiuih5RFgTko=;
 b=W7ea1/qngJIfJGqx7yPGC9pG0YeNN1YaModxoyjjLi2hPkndifwOSU3wxW6iycFUY1GNwfLAj13Skz+B79Z90Cupg7+UwhmNV/cbFjW3r2w2alpQnAHhJTQA0SpjpzZ1sakXVBFdoDUnELMcqJwHj93xScKXAlU962xbJyfRP9Y=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TYWPR01MB9660.jpnprd01.prod.outlook.com
 (2603:1096:400:232::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8489.19; Wed, 26 Feb
 2025 01:35:29 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%5]) with mapi id 15.20.8489.018; Wed, 26 Feb 2025
 01:35:29 +0000
Message-ID: <87zfi9bi8v.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 086/157] ASoC: codec: wm8955: use inclusive language for SND_SOC_DAIFMT_CBx_CFx
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <87frk1h4sn.wl-kuninori.morimoto.gx@renesas.com>
References: <87frk1h4sn.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Wed, 26 Feb 2025 01:35:28 +0000
X-ClientProxiedBy: TYCP286CA0022.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:263::8) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TYWPR01MB9660:EE_
X-MS-Office365-Filtering-Correlation-Id: 2c35feaf-e43a-44b0-f25e-08dd5605da07
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|52116014|376014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?C358H6phCXoZmN28QARUXazttS+L48EfTHl7eKYV/00iviYde+mYAGNheqmO?=
 =?us-ascii?Q?QtIJkdgNEl82aHYsdU/Rwhnd+C+nfjxicglmdmH9clTKek9QqyRIN/v1eVee?=
 =?us-ascii?Q?GCOoShFFA0hUnKP0FqT2gr/1e6r6oS9XpC5GL9rknUjUCDNjCPj5TCrisgpB?=
 =?us-ascii?Q?amMnMaBsE7KhK6w2/2pt+0LunDuaExowJH69xwWheYWfRsHn08cr2148josa?=
 =?us-ascii?Q?3MLF7oqg7tOm8YHOCG14VKPESZdvoYIZhbBem+6PPu2+Gzr11uWNYtvTl4ST?=
 =?us-ascii?Q?rkoDxnxOTUkJXZt8MYr+eDOKERgBypZ/K9qLk6wEweWgNWxkwL2LwvCJOEjJ?=
 =?us-ascii?Q?VZNVrbmVJNzBwf/+i0JxxrmBLUt119UEyXtOMLFRRoSdE4Dh9o60MM88HIwp?=
 =?us-ascii?Q?Mg8D2W41hdikhFcmgOPTNS4xfQj+GmTUtX01UxyEf6WQfSoVS2w3itPucsxS?=
 =?us-ascii?Q?mC7vmc6bwHvLFDtsvF5M4zXdSXD4Aog8fgTBndgDep31EPKnfyOl+mWUhtUv?=
 =?us-ascii?Q?2sZEKKsowseusnUN8/PUkGSNxH5cLe1gOemrHW2zSWgEj/wRaak+dEn8k6ql?=
 =?us-ascii?Q?/WcjKQLCWXU6fi0oFBcnICYlOVLOYqimxRTSSUNAF6rAsO+umH96F4DIpr5j?=
 =?us-ascii?Q?seo5vKYlRKEcV+EbYabeIX0XbDaUHAT98Hj/kSJo9NjN3qbnUXXFuHANqWi0?=
 =?us-ascii?Q?JnpFefC2cv3bDC4axNujL8V0KVuSE0K0yV6tkm2FQRMiAsOMi95bhGPLlE4v?=
 =?us-ascii?Q?+hOCJJkrTrKK0afNgjHJrZGxpt5G3NqcCUIXfolZOULtuZmPOU4AdT+e3n6q?=
 =?us-ascii?Q?CW9lh0cHZieXpmov7pEct5imT+nq2iOTRrzjcqgkl+1ChE3WGrnrX77wlppK?=
 =?us-ascii?Q?0MZuhpya8RZy77/1HknbfD+2yjHXPgymT9lsnnP4v+WEu0nRXrMMROVVGW6s?=
 =?us-ascii?Q?vog07o1Leg0h/Da+8zdmv7CaXiAv7ZJ/Dtx3jK09SxFMA2OeyNzD+V2XijiT?=
 =?us-ascii?Q?70NknGod/d8HT7Mtdw+8dbVJ1VqFFcftb2ym7XK0QkLChgjsw6Z5/+Zextko?=
 =?us-ascii?Q?vS+AfaY9Blu46ahj1uR2plNBoBZV+yw1tRiSNTOHZ8iEYDS50Xlv8mub7/E9?=
 =?us-ascii?Q?bYpdx30HCfLX4PKK+aYe7teX3Zy9rpV5zWItJPK6tyokQ0uKdnKTJjic9vsw?=
 =?us-ascii?Q?a7paCjhfmY+12KRziWwYILVYuspOb0331NboJ5GsBOB6j8nip2e9BtUoqedu?=
 =?us-ascii?Q?qjE70PZAqHxdqRTfTNr0qMgLCev4GQB4FdLf4fbsb76vW1vuHlwE9WFzkpnY?=
 =?us-ascii?Q?dTT0vpUp4GNpBuPugpSgQlOcnKtpMo7HTumID81HnfAzgi1rvi+/hYCaIWN/?=
 =?us-ascii?Q?I2sSJGE677BTjrtNugfxyduqTw5B+p+cQImFCBOTKJNgDgup3775OK+rWQWW?=
 =?us-ascii?Q?SsgmD3eENwFvbPFiEJ4uVFpenmNNmYIT?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(52116014)(376014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?Mcmtmlz5CNlW7duuOzmtWcXjUglVvKmL3U9sfrMdDS4AfkTUX+NbGat/nyKN?=
 =?us-ascii?Q?RF21pMUJOHFy3JlXZhlj+k9n7eE7IhwrJk+JJ3GSxqFELejcHAJC+md/hJQz?=
 =?us-ascii?Q?gLLbJzJ//Dh3sREmH7SIeT6niI3h06yxmrmi2JjyUXtd68yA14gF2x18pDSN?=
 =?us-ascii?Q?2Gg0hSFGnHUtex5cTXMgyCZYSadPUkerTXfEVdMvnZ+oWxG53sKIvrUirkOB?=
 =?us-ascii?Q?+KXf3HW9EYT7HB/y86l3awUcW31IZsNQgBT/4+XAomw+H8LcjBghMfI4tYKF?=
 =?us-ascii?Q?su2e06xiYXoTG+k/hmrKsWn/kLQcCJ11UbZ+vBDd3Ezsfk7SOrZSowTAi1cG?=
 =?us-ascii?Q?fGQNfpTFddce++mCPw+n6a+YP409DjpZEG9VTab9A4qsHn5+sV/fQW7bUZD2?=
 =?us-ascii?Q?DNKy1iRCg4y8v0rDbSd628JmzGESdOH8/YbqtYUCWQ9UrUDFU83//2mzcQP9?=
 =?us-ascii?Q?2jSXlw5YGOtVRu9P7Ugonqon73Sn/xXj4EJK6r8vq1L+DXaGjhfPPf+0a7e+?=
 =?us-ascii?Q?ICNGba3p01syD81pi0YySHuaWUfzW02bH60H9vdIGfBkq089HJwajc3uuBUj?=
 =?us-ascii?Q?vEoAI4xb06oLL5xP27R3MWOVRdt327Rfzn45dy3nt/NDyDhozLGuAXL9DkV+?=
 =?us-ascii?Q?R91qJkWHHqafBNpxv8jVNCUGlt+58XkhLJ7YvC6yn0WZqavKm0TR9zrkQ0E0?=
 =?us-ascii?Q?40aa4AuKE9P2TikThIdYyi/1IEKIB6gK7qs6gRRXNEPT1rnukESY2FMiOWSG?=
 =?us-ascii?Q?a23oUMqrNuAYlcLWNtRKsmmrwMi4w1jJX11jUqU0ElU9N81oNf40afIr55xO?=
 =?us-ascii?Q?iptxeweTIYFcIkncPgPcgawHORGW1ZoeSIimTn16W7oQuCW848d62Pknvrr/?=
 =?us-ascii?Q?YgynpyV4gpwt5ww5X2UXuOw/d308L3R1xHZWhBaOmsBB3V/dlYsvBcsJhyhI?=
 =?us-ascii?Q?tXm/znwwGh8Z8i+wsFzOAWPT9YSa6mRBcMAg2pQ32XjtJfbPkPe6JEu8zGQU?=
 =?us-ascii?Q?jurWAF1JJtRZGpNTKWvJSKvTsPSq8PH8u+QwL5nzP8N1PUXSCWAsH94Q9Ze4?=
 =?us-ascii?Q?7BebcOjWpcUmrIK9FpA6HPIZmEJWhGHOTMymyHaPtOvRIlExwq4KGJorIRiX?=
 =?us-ascii?Q?k3Md2Gd29J/cWuoFuq8KE+zSJSbz47KnaP+QdsONSPoa3Fs4EEAY1FZPB9dR?=
 =?us-ascii?Q?577LKZZUXNCAor1CT7aTHvhcD7ZUQOyrQRTsIerO3rkTAx7EMSwXv9OOwnX0?=
 =?us-ascii?Q?mvT47n5cebO5sVoDk3rZWXK9jDwrR/0rfwwuoXBcc88MHA9UXv/rfmooekK2?=
 =?us-ascii?Q?4RonMKv2npUm0euPOw55Z9mZS31lr+r5in45/njzK90lvnKRNLaR+FedKBpI?=
 =?us-ascii?Q?VACjsAH8hiJCI2F0w6662L5PrEs+OlhM9P/n7TZfP92xodrWXsDbIT2Rk5N6?=
 =?us-ascii?Q?IxKsxLkut1M6TpwtvBZx8W5wLTnM0EG4jXelS/rWVcbaTuoNBAXD0fMi8jtx?=
 =?us-ascii?Q?P8LYYJu4ymEybHFDnUkEBbsjfXSZ/v+ZHLyl8j2gV/9CaI+/m+idE1Swt4L/?=
 =?us-ascii?Q?rppenklqaVPeO/PxXSDZ8s0rramvaaxGZVq28d+0wGcYc1PR+gztqJjRDxpJ?=
 =?us-ascii?Q?LF5brSyUb233bdP8CR8QG8Y=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2c35feaf-e43a-44b0-f25e-08dd5605da07
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Feb 2025 01:35:29.0840
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PORYu0JwfkqU4An+qQWa5OFQeD3DofPZGxAaFMiXax2OEb3deSvMZbvGBEdRZ7gqxFCJ1VIGPNv7AlWRLHs+weAyWbYuRRSUtJOJgfhVwC7MN3zIRNp4bzzLVgFR4YnP
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYWPR01MB9660

In SND_SOC_DAIFMT_CBx_CFx, M/S are no longer used. use P/C.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/codecs/wm8955.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/soc/codecs/wm8955.c b/sound/soc/codecs/wm8955.c
index bae52a8a2e11..bca83410b432 100644
--- a/sound/soc/codecs/wm8955.c
+++ b/sound/soc/codecs/wm8955.c
@@ -671,9 +671,9 @@ static int wm8955_set_fmt(struct snd_soc_dai *dai, unsigned int fmt)
 	u16 aif = 0;
 
 	switch (fmt & SND_SOC_DAIFMT_MASTER_MASK) {
-	case SND_SOC_DAIFMT_CBS_CFS:
+	case SND_SOC_DAIFMT_CBC_CFC:
 		break;
-	case SND_SOC_DAIFMT_CBM_CFM:
+	case SND_SOC_DAIFMT_CBP_CFP:
 		aif |= WM8955_MS;
 		break;
 	default:
-- 
2.43.0

