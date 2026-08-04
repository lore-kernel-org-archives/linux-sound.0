Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11011005.outbound.protection.outlook.com [40.107.74.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BB9637F322
	for <linux-sound@vger.kernel.org>; Tue,  4 Aug 2026 00:40:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.74.5
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785804032; cv=fail; b=XyUhLiQu0W1SyVhc2XxbPRFKHuIRM9kijFf4K5ogmAF8AXF6iLrX1zscPhGYXqK2wQ3IZaOVvgQCN0+ILEzWVc3qCDJgznw3Stt1m/N4EOD87MAKJHhAXn5JGX9UhvX7hlGtNW6rpZSbQN/dAE/R8XOdEtZ0ZeGL9aJwU6EjfWo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785804032; c=relaxed/simple;
	bh=tJmFOW0Re7fGFVDrkEsI98wmOUjTqfdJZzNOIxh1KGY=;
	h=Message-ID:To:Cc:From:Subject:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=uKwp+0+eiPfNTjQMArDjzN3916kDg7UGbrB1OaDZG+kW4hE0I98MCOXz4ovGTz/MtUujVmdhZeJUAux4xg+xJAMKFQXs41TJnoeF533hxFK15ulHMacnzsVflNy76IwEYu8fr1GLbd5t2DlDiLFRYyzIZe+JBthI4VYKKi6QEpg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=ngQ3S5KA; arc=fail smtp.client-ip=40.107.74.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="ngQ3S5KA"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZUUkSuPj7o89gWdkYMbaVSBt4DOhFW2kmI3XlMef9u9yan4yyqyc4EcHyupbRbt93wLeTZdABs2XCCSBRvt9W3j+kIgVen4jqaiAsL5DBV0Fvjriqy/eXQhG7T8V9Nsr6a7l1HbenINtSLsG98F3ZfBrKA/qQcN9WynCkiIK2/b4+kK2OMFjmzrLKkqp7JUR2Izo9fKtUXaSfYDj8fAmrKQLsFtuM5eAH70bpck4jmvW8Vv8cSNnyUDy/OUDuxQaqlb3Pf0FxUPUDFrfzeuAq9r8z8zFUhEP41CJM0BIo6HycdR9/eEQ4Zkvpt9ULx4RPfvRW4HTRfuK4CSBSaQ8GQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1UIpaZ8PQIXRPmhNFadCt1aQXSnKEqs3x9yp3ozrd5M=;
 b=FI8U2ji8gPvlD7u9h+AfJyHzmuhAv7X802tXGW9GxRx9fJAZdIj+8rXsl+792Y4pB2Z6F3Ofvd2XeHByElqSwB9+UNqAEMg7nQkhOH7GfD9VV1prl89cqJO1BORTQCXuER4EBINr/vjhHrI2pJYGfBfm6rQz7UkiYK2fdqQANojT/D+8ewWPo4upoJT6h129Q21A95weV+a1AgDL1H4l/1IbYIp69yrCAgJEJ8AWhOytGhN8vO23e1AmOTmf4nAeD87hHYs6Zv3AqP9yRzBzE6kwUJrVnGXggcmIrkBYUAvDx/UbkSGOf/qBhZhFviDf26K0xQ1Mm1+BWT3TZuzeWA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1UIpaZ8PQIXRPmhNFadCt1aQXSnKEqs3x9yp3ozrd5M=;
 b=ngQ3S5KAx6uN3G2DYxYyLNc1G5N02V7UCUoirv5WFp4zOPssNlKyHxpmuejIFwZp7r6mh4IW3b35x/4CljTcnX1rEaokkQLNFnMff6n7rNhLZzD8rlm9dFG0Kf4I0PJ1GhfNNgvDJKnOre3gJ3e+oJT8e9z6ofZhsOtaktQW2jw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TY3PR01MB11797.jpnprd01.prod.outlook.com (2603:1096:400:373::8)
 by OSOPR01MB12264.jpnprd01.prod.outlook.com (2603:1096:604:2d9::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.270.18; Tue, 4 Aug
 2026 00:40:27 +0000
Received: from TY3PR01MB11797.jpnprd01.prod.outlook.com
 ([fe80::1868:c915:c230:a383]) by TY3PR01MB11797.jpnprd01.prod.outlook.com
 ([fe80::1868:c915:c230:a383%4]) with mapi id 15.21.0270.017; Tue, 4 Aug 2026
 00:40:27 +0000
Message-ID: <87bjbiyays.wl-kuninori.morimoto.gx@renesas.com>
To: Jaroslav Kysela <perex@perex.cz>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Takashi Iwai <tiwai@suse.com>
Cc: linux-sound@vger.kernel.org
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 01/44] ASoC: codecs: 88pm860x: use .auto_selectable_formats
In-Reply-To: <87cxvyyazi.wl-kuninori.morimoto.gx@renesas.com>
References: <87cxvyyazi.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 4 Aug 2026 00:40:27 +0000
X-ClientProxiedBy: TY4PR01CA0034.jpnprd01.prod.outlook.com
 (2603:1096:405:2bd::19) To TY3PR01MB11797.jpnprd01.prod.outlook.com
 (2603:1096:400:373::8)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY3PR01MB11797:EE_|OSOPR01MB12264:EE_
X-MS-Office365-Filtering-Correlation-Id: ad1b5b7f-ae5a-421b-9938-08def1c0fab4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|376014|52116014|366016|1800799024|38350700014|11063799006|56012099006|10067099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	FcGUnJb2/vkQnXxP5+mdVyS782amX9DMd/848Qy66ahDR9MzawkLuls9HM2ngqmpeLJX+sAq9nXPIGTE6yBNp40kz3ckOgZ09KW4o5sD+U9mNga4sxzncTcWlbAywV4coCdKyFaMOL4oXpff2B5YT5yaPuOUN0hPi9nBP6UBGZUGW2sfuEQInaetSJvOcS1mRaPhFRfY3bS05gQ03tbv/SAYNBZ5+0zZZ/p7w5LLtQoJoxui6cm8OOk2GEFO8wEFjAmuWhWteXD1vIoSVcldJIGR2IwPUvaWBA2x7kG/9B9HCTOFlPgBlTj0cXPtMzRG0hK44ef/aI60IhqGuRhYyyVSiocA7dRllPYnaKcIeHGAqQdkuzv2euBTTG6x4WWK4XCtXF5Vi0yolmMF2GUSOroFr8q2LvFep6j/yG4EdzFTYYA3sUmtrRasiTlROMX9zHpQP4xDrsvy3Ds37RQvDy5VRgBJKzZR+hJJFZtrR+h2XQLzpKwnIVYZ5gfWm6hvXqkdQUekpmeViZcEdwKktraxwzHec+c1n3XHGvQGsLMRYwFUyCHw5/oadlbfbtH+W9paIKt2GpeeTP8W/j1oCrLcwUFtwImAXWInx9tC8marjGYVcAy+0etwqolbGXmg6SK6cmBrHY1bVNn8PXH85cWu3o9GJI0heMh+K5vug+T4+qr5uIdCa/txvXiBcd3v4uw/BDjeZGQvLlb4GvUMhRO6ihR0tMA2S0W6tdJ8/9M=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11797.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(376014)(52116014)(366016)(1800799024)(38350700014)(11063799006)(56012099006)(10067099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?YElGMzUciZybty66mkMmV7cylXS0cPquNTmJNXqEKRdVRpCO+BxOAJPNVai7?=
 =?us-ascii?Q?8KVOIaT/wR1bl9Ld7Qt25F3UrSTuJCj1SndmEpXaG03/XH2vCaZpaMvtbk0G?=
 =?us-ascii?Q?QxD0Egea4uNFcxtfnU2w+ry248w74baavVZSfAbRTKVAzB85JJq3ish5mNVh?=
 =?us-ascii?Q?iS5t8mJho9BBTx4vkYRexWmE4zOXxS4cM1Eaoo6jdvdR0TxUuk6XDTFO3kZD?=
 =?us-ascii?Q?CMTZdCqQ6O2GrTBQhePd4MTB/qjuoCtPDmJoDncVc6+E6si75mKFLjNEUZMz?=
 =?us-ascii?Q?l75cIUt6Yo0HCpULxnrcDWDloyBdfhN5QMTIjFLak0wdqZ3SGF4td3FgBXmO?=
 =?us-ascii?Q?j1pD9twjk5hFD1O1nXrJonqL5Ppq7XB5oAvhyoXhCMIVjR5lwrSKquTSWa3F?=
 =?us-ascii?Q?dQ2JfsKj/wnBU6XcLxrUgEwnbICt1Wxd+QVTgJe+pSDWjaxf212QgIZERMdU?=
 =?us-ascii?Q?xe3xRIhoUwkcoBezrJYGjehVE+whpbowGiNzbq+aO0UXHh2g4t6xcpRrRDGQ?=
 =?us-ascii?Q?FN0rLS9oE9tY4aFfNNBPUQrepnNpfb6rCiKWSOzmigmhlIqguK5M5FN6SUqN?=
 =?us-ascii?Q?rPXWkYCivR8UuHOV2I0gEUW9V1gyRogXvCJB1fOtG9xGzpH9S2EeSpdhUskH?=
 =?us-ascii?Q?P6za0nryU/R5FI8PzJnDbLnnLsL/XA9KPoUVZw8ZS7dysR5M/E/VMtKGHu39?=
 =?us-ascii?Q?ez+lY9TdDpVND0d9vHnkxrFpLzwLLkfgRiDEEMwteBVyZK8oaDk2YoIE19Uj?=
 =?us-ascii?Q?ItcYdH3Hk4cJp5C7dGNw+pbSx1kW2Ey1qi9KsWEVwwW3A5y3wigPrCNjpy80?=
 =?us-ascii?Q?4hPT6bN+sY7KwVptvM6/KG7CpE3qodjVuNZ2TIXtin1nP+3C4f9xeehEOpfB?=
 =?us-ascii?Q?l9uGFF9hacJMhR7TJqxCT9ee22N55bDyVwf2NDANA8Hh4ePuu0aCU4I1zeZy?=
 =?us-ascii?Q?gQISc5VUr8LzNVuG5eWjXBmL+nsM9bDDqSKBrWTGi9fSvbETRqhs5+UgL2nb?=
 =?us-ascii?Q?8LNA6jRgSoAH8bvY21TmRieYZzNEiI9BepKtgz95Clhj4sNP1xKJ/UIcHpUq?=
 =?us-ascii?Q?qTV9K5y0Z/Ij6YwLXT3lP119NOUHZcyWbafMrm8v0cxnv3czWWb8sTcC+8Xs?=
 =?us-ascii?Q?HcY7NtYpX4bvdg/RIYz7+UeVdZcBzyp+RjUDrvRTWArTInnDgTJOf8DqUJ/f?=
 =?us-ascii?Q?/TROsqNEdFn0PwzfPKAg6rRGT2PAjBmqNzXpxtoa8uNSC4u5epM9ChuNKKx+?=
 =?us-ascii?Q?lgEY2HgoHcR6bsT6v/6oBmh6DfRl5xzfC05V5j4F2lxA7UBd3zcTHFErQNmx?=
 =?us-ascii?Q?BW2o+SMKceLWEdxFeIM8D0ZAWABm2DpUmg/uF9uYwEIhFGI5Ufj3c53R/XsX?=
 =?us-ascii?Q?foa301pDpDoDNaE25p7OgSe4SN6mBD8cLVX/orvV7xU36lcu+67PkZHR5tXh?=
 =?us-ascii?Q?qjy+RGRWGTv5jJSWn5SJd5mV3pXE1XN3+NoIXKp1yvonzowB7+vOJwxUF11R?=
 =?us-ascii?Q?sx4cHjJ5HTvFAu8qznGOvmaP+cySpT6OpCsCTwCqTf/vhB1kX1un3AQCbjd0?=
 =?us-ascii?Q?tyPWy1m59qhnag7NhvROZT7aCPVSZaH5MffyAQi6QJ3033ev4Sv+yrCM4i9d?=
 =?us-ascii?Q?N0S05zHlTuO89pWF30VWX0yXiaB+5nmA83TNQ+50OKU5emx9W+8xKUlH6Obq?=
 =?us-ascii?Q?fpCFFi88X2l5Abd6ZL74HpVPuIlzZpXRngu+0HKYzFNSk2OEE4vh8uwVS6l0?=
 =?us-ascii?Q?our10888jW8VYz67woKTVX0/s968VIOBvkuX07hQs4ryp9O68p+t?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ad1b5b7f-ae5a-421b-9938-08def1c0fab4
X-MS-Exchange-CrossTenant-AuthSource: TY3PR01MB11797.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Aug 2026 00:40:27.7073
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yhKk9bWCHHTHh2+jcI9xZNlNh29lXVYl+oJyTHEFOxLlrowpaKR2hFwt4r1XgDR2+W2Kt+v981DTsBe54o4mYMC8u+poQi2BZhl4hCokaeNawzcBnkmRNeofZJYC++ND
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSOPR01MB12264

We can use .auto_selectable_formats. Let's adds it.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/codecs/88pm860x-codec.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/sound/soc/codecs/88pm860x-codec.c b/sound/soc/codecs/88pm860x-codec.c
index b4f5b24cde456..7596227fbccfc 100644
--- a/sound/soc/codecs/88pm860x-codec.c
+++ b/sound/soc/codecs/88pm860x-codec.c
@@ -1136,11 +1136,15 @@ static int pm860x_set_bias_level(struct snd_soc_component *component,
 	return 0;
 }
 
+static const u64 pm860x_selectable_formats = SND_SOC_POSSIBLE_DAIFMT_I2S;
+
 static const struct snd_soc_dai_ops pm860x_pcm_dai_ops = {
 	.mute_stream	= pm860x_mute_stream,
 	.hw_params	= pm860x_pcm_hw_params,
 	.set_fmt	= pm860x_pcm_set_dai_fmt,
 	.set_sysclk	= pm860x_set_dai_sysclk,
+	.auto_selectable_formats	= &pm860x_selectable_formats,
+	.num_auto_selectable_formats	= 1,
 	.no_capture_mute = 1,
 };
 
@@ -1149,6 +1153,8 @@ static const struct snd_soc_dai_ops pm860x_i2s_dai_ops = {
 	.hw_params	= pm860x_i2s_hw_params,
 	.set_fmt	= pm860x_i2s_set_dai_fmt,
 	.set_sysclk	= pm860x_set_dai_sysclk,
+	.auto_selectable_formats	= &pm860x_selectable_formats,
+	.num_auto_selectable_formats	= 1,
 	.no_capture_mute = 1,
 };
 
-- 
2.53.0

