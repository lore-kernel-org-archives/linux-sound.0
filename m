Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11010050.outbound.protection.outlook.com [52.101.228.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF16D22A4EE
	for <linux-sound@vger.kernel.org>; Fri,  7 Aug 2026 00:54:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.228.50
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786064094; cv=fail; b=ptrEFi9mX5jrtF0txZip4QqbMzTJuRnEmXhz02Xxm+zUcjSLwFAn8mi0OeYgPVEXNJN2r/xt7K9vdTWSME1mkEStMlP5V0WtmkmRAZXoHypD/RUStpWoweb+t3QehNufzZlycB+pNJNd4OqrBPnsHjfrV0TVJrvQU9ZxyfCbEAw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786064094; c=relaxed/simple;
	bh=KBbNtTaU+PuKMWmrLoYMui8KPfJxXFBuWZ/gOEvJiiw=;
	h=Message-ID:From:To:Cc:Subject:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=VURm4DKZaKtXUff0UHfEYPrJTQdG7ilLxQ/iQ4PHm+QBIQDO/4RIWN3Ndb3IQfhoZhhFkp5Xytof6Zq9Ad2PwVXmdXVvV4huPaHrFsyX24H3xSVznj9ib0KsziFcLU3aUrMglt2IrPu0xkaj8Cq7jKRHVRSS570OHlFRJ+1vXN0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=ogutfTxs; arc=fail smtp.client-ip=52.101.228.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="ogutfTxs"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WZk8FAcR5T++VmAITt1fiQbeDbFyiLI8QZQfpxHf6se0rM9LqodvyPivo/ymrfJNeTuajgErznk8eVWJVbUqfsqhDGz1gR/h24hsamsCchmcpKX6Q3KK8kMNFfMEcrAX2ZwluQMjuCz6GSUSThuj5AuU56xP0wNQmaqN5bnYqAM17LS3i9KnHI7I93NSnNOeg6nG5/+WpxzEw5QjscB4KuDoXx0MgN7u3exMG8gtT5gUVjPr6TZ13E56tJ06cOMaU/CPZ1BCHZwwMffVVMPOFMwAhVgIBZ324sgdKZGzsfqSzgvvPexn1lhPf3A/xNIIXmVnOFQWVRqIBsfSfop5rw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qiwMZ5udDGJEIogDEBaBoIBi52F0sCzAwmEC1Tzql9Y=;
 b=bR9hS1HEkheJPPz/im2HU9e5qS+VyVU2B23BOe1FqERteTaNLFSj45ep3QBYuhe4bdtVEBCaJuwFFo3N0Vja1WZuHOP8DmDkKn6HU+hBWAeqzDS731Lga2bDTdbKfxMzHE8Nx9dnj91QXjPF10CSm7k78CtxZidvfBVeYsLszrPV53ImxMLWzNSknQR/Qfx74pBFnV42ZVJmj40vWy2gV4GnrOj9M+8QZsnmZ0DF7dqIWLQE6RfB6O94hkY4POS3zuCHRgAw9UKV5rgDu2ke8FUrvCTTPf8BjFVmqlsv50VB335ptvp1qC3kVrG7vZlu+8vGu+dZ/Ly7C7IBvDBqJw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qiwMZ5udDGJEIogDEBaBoIBi52F0sCzAwmEC1Tzql9Y=;
 b=ogutfTxsUYBB+IT9vkIWa9ReGxdL1lbuWg+C3cNmz0V+LsL7E4n3hGvTfNLZdfd9b7JiO9lBf7GVaFP8TJ4jnMpBjods9Z/gkeM2XXNES+0NNPa+xt6Zw/L2xZADdAZIo99nyWw3R5OVRXjVbrE7HaBquUn+gsC3dmonJxg9Ki8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TY3PR01MB11797.jpnprd01.prod.outlook.com (2603:1096:400:373::8)
 by OS7PR01MB14460.jpnprd01.prod.outlook.com (2603:1096:604:38d::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.292.23; Fri, 7 Aug
 2026 00:54:50 +0000
Received: from TY3PR01MB11797.jpnprd01.prod.outlook.com
 ([fe80::1868:c915:c230:a383]) by TY3PR01MB11797.jpnprd01.prod.outlook.com
 ([fe80::1868:c915:c230:a383%4]) with mapi id 15.21.0292.022; Fri, 7 Aug 2026
 00:54:50 +0000
Message-ID: <87h5l6u4v9.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: Jaroslav Kysela <perex@perex.cz>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Takashi Iwai <tiwai@suse.com>
Cc: linux-sound@vger.kernel.org
Subject: [PATCH v2 18/44] ASoC: codecs: inno_rk3036: use .auto_selectable_formats
User-Agent: Wanderlust/2.15.9 Emacs/30.2 Mule/6.0
In-Reply-To: <877bm2vjjn.wl-kuninori.morimoto.gx@renesas.com>
References: <877bm2vjjn.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Fri, 7 Aug 2026 00:54:50 +0000
X-ClientProxiedBy: TYCP286CA0046.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:2b5::6) To TY3PR01MB11797.jpnprd01.prod.outlook.com
 (2603:1096:400:373::8)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY3PR01MB11797:EE_|OS7PR01MB14460:EE_
X-MS-Office365-Filtering-Correlation-Id: 65a8b6fb-3be1-47b1-ee32-08def41e7c3d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|52116014|366016|1800799024|376014|11063799006|56012099006|10067099003|18002099003|22082099003|38350700014;
X-Microsoft-Antispam-Message-Info:
	U9OVUJx/2HyIjlUbhpBMOo1fzbOPtoxtdWQzgahELMFhfVjk6QDBLO7lP1kkR2Yrqcb5Na8TjYh/z4nK9ushlMkgGI25j0AqGN8Nr1X036AeLRnKpBsYlGCVObIy8w5r+DWhDdyJRS/RZkkUpXz69rdgk7QWn5twcWi34628ZjZyzywQSPhNGDrQ+nAewgdtyGRXkb3OgZaYcABMN6pAzimF49dnmG73C5eaiZHIrJwx5BxQRYTLXNpdRxDX+tf/GupDMnEXq+8Yy7COm5rqiRL82kHA49LPoEc3cZJ1dZ0WaSoB5XjZaK5xjkqnkmjbtnMqHRr0gqqZckz9P+vPyVTshaL04L1WIawMkLBXYcNUANCI+61ZQGCAIHEORiDufcYVGrzSQ1oQEU6UEcXF4BAAtI0uRC0NwKn3PWl5TbS2rQtnUCsL6K+WjuEEBSuJ7vXpVKEqCACLpQ7qjaxg+B5OhlFw8gsuVHqqmwAi1/9d0Jq391tU8+l3rv9InQ0MPwyKreWrBKLosrn3TZIXr688QET4lYUGctA6uag/hwi8XXUKmSXLKlU/H6X7MgHHXEqadxc6eIB1PzJJwiCsQTzczspUsJaEs9F0o65gq5iG+gMrWP08uKT2ZEupclqT4hheh9u92Ka6nZA3vpETWh3PLcRZJ6ic8Xf3ScJN85hHhA4VKu0otuQI/TLfMx7wFcckLAq6aMAHi0pwkyAiN7MyMKL3vjrBDaKnVxqEUaM=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11797.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(52116014)(366016)(1800799024)(376014)(11063799006)(56012099006)(10067099003)(18002099003)(22082099003)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?VDqT8taBuXaNHLYsFnMz591q9S1vqnkzCThgYi4HM7IJr3A1sOKrsaw3IvSd?=
 =?us-ascii?Q?cqe906qIGSmADRcprJs3o+0tv97yGqcQf8ZqZwcpCIowVX7yvyeZsv9zLMW/?=
 =?us-ascii?Q?W7XqR1Bt6zdxI/LuGR67u7OSvvsrjo4wwoo/2xm0giqy78uBnG3gnRsiSvSY?=
 =?us-ascii?Q?6s74gxqNiOXwY2hKfujyBbKbsFmp+1710nPybDD4BHFqoofrCmFsRwXEKnNp?=
 =?us-ascii?Q?BXq07B2ueccYkoqIn17t4agXYvRCbHjVBuRM0ieM9jAzak7Asb04vX0h7+vE?=
 =?us-ascii?Q?32XxlHQCUzAbXXoEvmGui8PPeil2ml3FZkUhft1XuGYJHxRiO8tButBb44fC?=
 =?us-ascii?Q?rGDeeQQ/V80ZM0C+h0JrpCWPvKujJJYRmKrT2pCDlkm0UjLL1BnMzxXFAYiA?=
 =?us-ascii?Q?b8L75h+jhz9ywr9DB6N0xEay1mSOircfTmNMNUTH7dHqlS2XN15ez0FS/0Jj?=
 =?us-ascii?Q?4Zn6IGZIh04f/AYeNcDrqDaDGKECzXjXbwZgrsMs+3ba2Wq1p84IBQ55n9Vj?=
 =?us-ascii?Q?pOCVmhtQI+XiHLbH0PqlrqviANAr3Irz/LnmjddzFueE36/hkdPAs4n9b4T4?=
 =?us-ascii?Q?WKog+WkVBmZwlf5Coo/y1upCi+YdctbXvgXY9RELgZnYZD0Np8SWBC/FVyrG?=
 =?us-ascii?Q?zlNKW3xBjUg/1K72emWNF9fagnAN7oxIbSXNOZL/gpxZjpiGITYUKL1i8Wva?=
 =?us-ascii?Q?G4jCL74sTil5N2HWPwiLxoyv6BLNjxxW+usy6+oCGBtAXXinJgz7Fq68duGM?=
 =?us-ascii?Q?flXBI26WTPWpsOWuqFYVvWwJ/5Cs24Q9+7pR1l8YHhKa/1Nz28rgpoEjLj39?=
 =?us-ascii?Q?Q3Jap5Dthg/6UvVtiVSl50dflpMEGLxY5mHVAmvT65fAm1pYFJjbJX2bZ5JF?=
 =?us-ascii?Q?WBbhEP7vjQara8gor2c/EDFB6y5u74PbmZGw8b56xoglIcLX/fj/9pGLgTFN?=
 =?us-ascii?Q?Rxs3Q2qTB8YYrs6pKcLRnjJtMVrQ2ChrsclOMz6rwRc6cXYszkjpneRQ4rKM?=
 =?us-ascii?Q?jNJn1xtOeOmoF6B3pM9qBJpXKXPEvw7dXdCEICGQ8YgINimSr5+U1RGROIiD?=
 =?us-ascii?Q?h2bVL6TjW8XOue49CEpZAEGje7qWkeG2W70uWsH0x9RHY1OiZVz3RP+1odeg?=
 =?us-ascii?Q?e+ne4UU/9AaXb/AOOPawh/ZcLEwf0JQm3S+Renm6EsXeGhkNLd1PZWw/iJ/H?=
 =?us-ascii?Q?KkARLI3pA4V9UQIjhsQv/90DeTqGaYd+9l0ZiPRNNlvKrypbxcgzhuihjBuu?=
 =?us-ascii?Q?KB2YBh0hm2HaJZ5OYPBuAw9XbwCdKwcLUCSp32IT+08iVi7b+X2CVgc5fhsm?=
 =?us-ascii?Q?jtHEJnzrwOau+KGVvauEIihh8lK9+1tsjBh++47DQdpzMgd38crLT//qgg1Z?=
 =?us-ascii?Q?3PCr+HeDJu5idK9t/ZsEaYOzvm+Ax71zW8vXUXmuDtPTI0/HpRs/HTO7PZKC?=
 =?us-ascii?Q?/eExBAs+fzzB78x1nzVacsmEfurBvaw0854ekwpqr0G310aWSYTUOwmtXLpY?=
 =?us-ascii?Q?VGSvwAUDc7AKwRzH3lZwjPjhi7h/ajID/8STMJd2tsvn6CoOQaZcT0fPFrXW?=
 =?us-ascii?Q?cahNpz2z2db6jTCr1qu2jFo9q6PYhkE/Dmmhlm9NV2pRrYPV0zqB6+CK9lNe?=
 =?us-ascii?Q?gd/CAIwTTIEvMgJoXimaEUErbnDaQqY8ezFhmhawvKN7JkTnBPgrM19TV7MI?=
 =?us-ascii?Q?E/ex0xP06GGPqZ4WyVowM/35XVVwhKbHuDjXZyAFE1Jt9SrdpdBW1BMwDlmq?=
 =?us-ascii?Q?bfjm22DmVEFFsCGepTGlb4xmMg8eqjZw+lz8+OLtCWqd/wRMVKWD?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 65a8b6fb-3be1-47b1-ee32-08def41e7c3d
X-MS-Exchange-CrossTenant-AuthSource: TY3PR01MB11797.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Aug 2026 00:54:50.4813
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JzFXO4brfIKJxQZdK666mfS8eqUS6d7EmYyaXZogB1FuO3HAC2T90FT07M35w47TpMoFcKV0YFMFNEFRo5s4U3SbIJECBnlcQfNN57Pz+B8izug0v3c7xUxgVPxajs2O
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS7PR01MB14460

We can use .auto_selectable_formats. Let's adds it.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/codecs/inno_rk3036.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/sound/soc/codecs/inno_rk3036.c b/sound/soc/codecs/inno_rk3036.c
index fdd19f8e88640..aaf03f2281507 100644
--- a/sound/soc/codecs/inno_rk3036.c
+++ b/sound/soc/codecs/inno_rk3036.c
@@ -309,9 +309,21 @@ static int rk3036_codec_dai_hw_params(struct snd_pcm_substream *substream,
 			   SNDRV_PCM_FMTBIT_S24_LE  | \
 			   SNDRV_PCM_FMTBIT_S32_LE)
 
+static const u64 rk3036_selectable_formats =
+	SND_SOC_POSSIBLE_DAIFMT_I2S	|
+	SND_SOC_POSSIBLE_DAIFMT_RIGHT_J	|
+	SND_SOC_POSSIBLE_DAIFMT_LEFT_J	|
+	SND_SOC_POSSIBLE_DAIFMT_DSP_A	|
+	SND_SOC_POSSIBLE_DAIFMT_NB_NF	|
+	SND_SOC_POSSIBLE_DAIFMT_NB_IF	|
+	SND_SOC_POSSIBLE_DAIFMT_IB_NF	|
+	SND_SOC_POSSIBLE_DAIFMT_IB_IF;
+
 static const struct snd_soc_dai_ops rk3036_codec_dai_ops = {
 	.set_fmt	= rk3036_codec_dai_set_fmt,
 	.hw_params	= rk3036_codec_dai_hw_params,
+	.auto_selectable_formats	= &rk3036_selectable_formats,
+	.num_auto_selectable_formats	= 1,
 };
 
 static struct snd_soc_dai_driver rk3036_codec_dai_driver[] = {
-- 
2.53.0

