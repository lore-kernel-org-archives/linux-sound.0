Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazon11010030.outbound.protection.outlook.com [52.101.229.30])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 511DE2FE060
	for <linux-sound@vger.kernel.org>; Thu,  3 Sep 2026 01:13:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.229.30
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788398038; cv=fail; b=ZPiQ0dsDVUsgvLbXQIPmg9r5XY8LMmliNZrrKG5svGITAIUgb5c6fiXvWAxGBczgP32Zbnd/E4C5JtQPlFyaA0nLKhaU74fvaJYwAf72TkPxiDOSDv9ZxJxJEXTRue4dpKftOk9ZVDjCNTMts42a0CsV2QKNUUuxYZ7QUhRz7Zw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788398038; c=relaxed/simple;
	bh=ZIAlfYyFtTTDkqr8GLLoo10o4+whQHa+imKaVz9fJJU=;
	h=Message-ID:To:Cc:From:Subject:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=pUQPHKQzLatpAJTU31YKDtAQzXf5sPaPqkPGbdhQYmMjLVSRf/WkpJCAJyFb37DnaDKvKCHdDzv4DDVO+M4dfuIo9ngce8rVegnH7a/uSRUzk188DeOh8MzOSv1ww8JnRpKOs44iXqoS670bRherNl4vEKmd0VgPqCgAyqn8I28=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=HBPw1q2d; arc=fail smtp.client-ip=52.101.229.30
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="HBPw1q2d"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TsNpf577PEcVrB9NSV3MT6xQrVDgPTJWbsolX7vuID8g8Rfk4CUuF0q9c+AkULiCPFK+VDI7xKDjyJyrdNFMdsmWTFyJspF9R3zrf0GIeHAoYsq/kPy+0rh2YjbqfK9zh4YLS2ajPuuVD+lPvLVuS5b5rHdoJ0abLgTy5+hFPzuLJOk7yXVwSrX3659aklF7GAf7tmvC5/Dshjh1AASSYPQRUBXs10d6aprb5H1GzEYhf8/NJdtlZqbIX8Q5dQng8z92M63w1yZt7W2vabnWfuQoVuL95LVWpw+Djef06SlUoMOCPnkTSFs0HG0w1gvgzCVWSrk81ohhO6BZh0FO8w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=POAmGmdpU/ibAHzQbsaMKekQoKREDrfYhwg7yGOwfX8=;
 b=EOeXqWCbHAaGjJtfxxYhDWOSvbuHaSCD737CB0nYcazLbvmZRFiOek9UcRdY8BrYHaytOrBKYM2/bEls1hqAJuJld2x3pKsl7IWEl2XwIG72rmEjbOL0pjFlup76D8LK9zPNuNc1J+RG+uLdMsEVGto8jZ5UeTEls3WQig8ooNvEB3ZFOpqgIZZ/PJY6FiaW+PMHDVut55gy2ip/ml5QxtHZZaMI0dxzanuw8L77yJYGbCp0oQHlOvHB7bPr4VL9rRxyJcp2sPbQC6T/uTA7jkRE+iVIY+TLT8X5PQFTBe9d0mVjXYlCEe61eiyZWsY6kKweyySgger3CsWum0O9tg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=POAmGmdpU/ibAHzQbsaMKekQoKREDrfYhwg7yGOwfX8=;
 b=HBPw1q2dqnFQejakVEACwujmpy8dL0IZDSDyxBRsisIwOPDBEWjfcskfXYt0AxAsCfSPtuP99iFQD+uKstjyJqdcIaFm/WxqNzYLLz5ivJVxOHKmwl22AX0AM7DbhQ1YrY4I2qW43ipXd1Mh9rpHiH5h5a1Pi1ziA2iOYOx/t8s=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYRPR01MB16474.jpnprd01.prod.outlook.com
 (2603:1096:405:2ee::10) by TY4PR01MB17164.jpnprd01.prod.outlook.com
 (2603:1096:405:367::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.13; Thu, 3 Sep
 2026 01:13:55 +0000
Received: from TYRPR01MB16474.jpnprd01.prod.outlook.com
 ([fe80::2a39:9988:dbe9:894b]) by TYRPR01MB16474.jpnprd01.prod.outlook.com
 ([fe80::2a39:9988:dbe9:894b%6]) with mapi id 15.21.0360.008; Thu, 3 Sep 2026
 01:13:54 +0000
Message-ID: <87pkyvyw4t.wl-kuninori.morimoto.gx@renesas.com>
To: Binbin Zhou <zhoubinbin@loongson.cn>, Jaroslav Kysela <perex@perex.cz>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Takashi Iwai <tiwai@suse.com>
Cc: linux-sound@vger.kernel.org
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 07/21] ASoC: loongson: use .auto_selectable_formats
In-Reply-To: <87zexzyw5v.wl-kuninori.morimoto.gx@renesas.com>
References: <87zexzyw5v.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Thu, 3 Sep 2026 01:13:54 +0000
X-ClientProxiedBy: TY6P301CA0006.JPNP301.PROD.OUTLOOK.COM
 (2603:1096:405:3be::7) To TYRPR01MB16474.jpnprd01.prod.outlook.com
 (2603:1096:405:2ee::10)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYRPR01MB16474:EE_|TY4PR01MB17164:EE_
X-MS-Office365-Filtering-Correlation-Id: 46bc8be9-2d27-46f8-47d1-08df09589f66
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|52116014|376014|23010399003|366016|38350700014|6133799003|56012099006|10067099003|18002099003|22082099003|11063799006;
X-Microsoft-Antispam-Message-Info:
	S93zLRw3fzf+50zd7m+lSaFas1vxJFhtwtYEvtUuLl1+CdbLZX6yqxpgjy173xnypmIkDZOJW9vG3uLLmpqfHM489J4n4DfjNYjF4a+1hRJAoBg0l3GRee+hYtKQlGAySqNsem4J5CW69uhQMJkIvezSvOLO2evYpo2irZMHEf+8AjkHYWR7bvLshq5yBSmIkfGHDC9+nAdJrs+HGsRLlC5QWeNwARuBpBBHyxISd/svB9TTtLKw4i32fknHQZp5KDt91FruW9femThRp5xJL/gwZ7Oh9ax6i12j5ZSOdfYrfsUMgPPglw44VeFFk8HyVLO37ZyF0zPJwJzPXRFFgnR1HX3fV9KSRyC7OHhwfpp+Lq60Z18ILl20Ef5SoSQvHEmFHl+IBMO/hrPjT/qCS6BC9+iILClT9LeZ52lrrslsxsVm36bYBipOGyld9jD2wZXkgfxbGZMzKZbre3E9+N3nQpSF/6hHpNLp4H9x0Sda1olO9sisoMMzuPgx9plyhq0waKCrh4VONM+IHLbLNf2yu0mvzofxIzbGcG1PnxFelOsAT2F0TiHhPqNbHHaIUBnLuhuX8GkvDfuzNTxfEpRvuRIcPKayEs14t4oCd/r7zoFsrjvpEszhmUlhPSZrWIKzhSGoECfGYOWoq3gMZtjMIlE7pQpnMbtdCz9nlOcuNV43hrPn+wRZTOGELXcCvitOxAvzHsdpQOmuArLaLy4mu6lD0Kd6BvArbf0NBec=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYRPR01MB16474.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(52116014)(376014)(23010399003)(366016)(38350700014)(6133799003)(56012099006)(10067099003)(18002099003)(22082099003)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?DQj2xTgjwVL1TMio+qfbBMOVhQILzelsy03OhagfaAC+A+ZPDXavF1nV/Gb0?=
 =?us-ascii?Q?UqtvBBQKvySrlICs1vPjQmk+Xx/nMfoiac8CxDm2gaARPNdfTgNwZSX2gvtc?=
 =?us-ascii?Q?e3NEeqCA1I/BN6fXq5onJRm1uPPo62oNgHnG3xeir4ayjQtVlu3jAbzQnjwc?=
 =?us-ascii?Q?RrulW6uz1PfYLTgIjEVntjAFi8zyR8/wDMPWT0fE7I2Ahf0AV6bVwLGKX7GI?=
 =?us-ascii?Q?Lkxa0siBVEWVGKw9O8xFXK2TCBl79A88EcTlKLuV7l63JCnv5Uciw+C3WMv8?=
 =?us-ascii?Q?QxvTgvgi1tmVSvMBYN97bdbl7bxZ4nfuxyKEI9Ae2KCarpC22Mok0rvQ8Khn?=
 =?us-ascii?Q?xZJKZ2+SzHlkVY70ULwXkxHYjLWxTkutdfWGqZZsDs5Gb3qCyehGX+o+DboY?=
 =?us-ascii?Q?byAbCGQKhR0hLfqNmjDP1huJ3gn6rxxoMZjbTCQQ2cV6km9sMOlnuCOfJ0Gj?=
 =?us-ascii?Q?eJ5v902TLp6JB9SnTzkwN7X79dC2mXKfHCLdBvyA/OHzTqxUzpKFQiks33QG?=
 =?us-ascii?Q?XrYSoBHzboWL/vXhxJo8FOWscxJQd6YxBjZacPcaeRJVYP2tH/tosxad2fsB?=
 =?us-ascii?Q?8oKFbZWaLpV89Mf1JrCvnQL3w83g4ne6rD3vBFDVLnoNVgRML2u3xMTiQcrk?=
 =?us-ascii?Q?9AgPEY54BR8XYQtufIdXu95YCDoWQB2eDY28BDj8wGufT5X3mNR4/17tFaph?=
 =?us-ascii?Q?j6oAGDQ3Y9Pbe9R636pAV1z6cNIq7S8UdLe9pSKx19MhtNa5OBqMV4nVUEUk?=
 =?us-ascii?Q?x39bSPRIwg2JMwor6Nwubiwu59bXqQNVwI8PXTtzlZJL1J6abpcPPQjvLMIq?=
 =?us-ascii?Q?qyv63tht5+N4PAzP38ke8YFR4PEB7TOtZSGwweihHVHM3lg8OMkbVYSClZNN?=
 =?us-ascii?Q?7qHkRnIVhuUgIAXc85ytxevSB1Dmso6gCsERQrZoMPYnZQmcI81IML8SNRSt?=
 =?us-ascii?Q?0lMhagyRyxGnFOUZXGpuWXAfmzAe+GI6+X0/HxzwLr11D56HRySKS/dBpEXt?=
 =?us-ascii?Q?f+weRAZe7DYgf35DFh6zDIG96yqC4cXVpciO2lleHDuBiUZLybIrjg2VLMiG?=
 =?us-ascii?Q?4BkSJtfqY39gMJOi7G1BVrKqe8BmB40ex2xNord03XMFD/mMEYk6B5PkymJq?=
 =?us-ascii?Q?fPy4mOCSVb75gvhMVW5JcAfKJR45WRZ2uIxq/ohi+9K4fb85fOqXeOEWfsxq?=
 =?us-ascii?Q?DRUIrNaUCr0TwQa4V1aRjqt0L3XGeAXi6Pgpi40KnKp6xhp2HSCxUzAlsDIw?=
 =?us-ascii?Q?6QOS841eYUb0dXJkfWb4wLtrGl0aCP5g5PBAtpBrDKCCUKkChzBMe/ku415k?=
 =?us-ascii?Q?aSOf0FsB2cCmRKQIbDiyHLZLnrRsPJaMTUdy9ddEtmwaeMNi8pp1MSb1dmAB?=
 =?us-ascii?Q?dL7gTl+At6Zcszph5SXidZ5chrik8kjBEuislAiLCIoXFgAp4jRu8Eb4ypSY?=
 =?us-ascii?Q?VY4TfZWEZON9j6ZHsvil5El5RCD0VU7TVgh66ovmfHZDKuCNVYPpxQRIZGMY?=
 =?us-ascii?Q?z0NAWiGIdPU7juNF20/bcFwuwylzSYziMmFFN/P0THWO5U7ZdFP0zANSTZJL?=
 =?us-ascii?Q?CC8sswBXcm5xXtnsjM0fdy0Vh+mK0nfOP2pvPaVEh3ssFPGv/5q8l6uo2XI0?=
 =?us-ascii?Q?HW2FephQEsPEUTriBMet8+X6Nk8dgLyRavwxyG+XyKAa3YbxmoAVRo5IN/vE?=
 =?us-ascii?Q?HZhFbabuF1TwBNKXFWN2M8lh7NXfNjQVy8FhaG497F3RV8xcjW7IkPjPmYLf?=
 =?us-ascii?Q?hDDwbTElUz1Ky7ZKJsgWx2guulqRbbc9mPn1c47GLJPbGQ3Z94xF?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 46bc8be9-2d27-46f8-47d1-08df09589f66
X-MS-Exchange-CrossTenant-AuthSource: TYRPR01MB16474.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Sep 2026 01:13:54.8104
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JYQkVuTrjbVQTHdwDRXe6UQi8InK1+G48mGIhLKJqpQHwHn7CK+VJx6lOKOch68PLr2+9XyVu9I5v9eHsU/wOl8vz+SEa5ZaLm8HU5727hWXugHuViu5orvmooihMLxL
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY4PR01MB17164

We can use .auto_selectable_formats. Let's adds it.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/loongson/loongson_i2s.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/sound/soc/loongson/loongson_i2s.c b/sound/soc/loongson/loongson_i2s.c
index cfe102a8b6046..da0d029c028ad 100644
--- a/sound/soc/loongson/loongson_i2s.c
+++ b/sound/soc/loongson/loongson_i2s.c
@@ -220,12 +220,18 @@ static int loongson_i2s_dai_probe(struct snd_soc_dai *cpu_dai)
 	return 0;
 }
 
+static const u64 loongson_i2s_selectable_formats =
+	SND_SOC_POSSIBLE_DAIFMT_I2S	|
+	SND_SOC_POSSIBLE_DAIFMT_RIGHT_J;
+
 static const struct snd_soc_dai_ops loongson_i2s_dai_ops = {
 	.probe		= loongson_i2s_dai_probe,
 	.trigger	= loongson_i2s_trigger,
 	.hw_params	= loongson_i2s_hw_params,
 	.set_sysclk	= loongson_i2s_set_dai_sysclk,
 	.set_fmt	= loongson_i2s_set_fmt,
+	.auto_selectable_formats	= &loongson_i2s_selectable_formats,
+	.num_auto_selectable_formats	= 1,
 };
 
 struct snd_soc_dai_driver loongson_i2s_dai = {
-- 
2.53.0

