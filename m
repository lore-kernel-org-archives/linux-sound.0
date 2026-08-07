Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11011031.outbound.protection.outlook.com [40.107.74.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6AD3248F7C
	for <linux-sound@vger.kernel.org>; Fri,  7 Aug 2026 00:56:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.74.31
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786064207; cv=fail; b=n6WbGTtkKwlNK6yjcAn0n7TOizneDI9MgOhEJ0yjVTF8zSVvf7dNa5JmPxpnyIUz0539YHYajCWhBUNR4+Rvz7dU94RdrtzDKMhWTHaS8m5Vi7CSvUyXvKneXGc78w9F9BDLYfvJQNg0PXmLpBjSrTyPG+8KVF9Nw0PDQvHlEqg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786064207; c=relaxed/simple;
	bh=voYSZZkS116oRFLDax2KSjTLbbSHfGdkyPl9KAXui5k=;
	h=Message-ID:From:To:Cc:Subject:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=EnHMctIWMXDBrO+P8H+HSKvrNSjaxLmbHYQx/bgB528/d7az5W4uhEC4S87VfdPZrMm8GSKbW8kFdo2mghgekceBBPuvARpeYpit3iS6fVinC1AI6b924Lpy6PoF+S2YNvuL/E79jlcHP48zk0aOvSxG9PrWom/UjyRuQgximlg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=phSzddEO; arc=fail smtp.client-ip=40.107.74.31
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="phSzddEO"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=F+/uv6fcBzhtVg9jK8z3xSgfjepJuIIyXnK46xNwQTM1TL++WxcoxilZVZp1TcvdwbeXK+2wYQxMUt7kfJGe57QBJnbw1rUm0iAP34HjfeEZ9tcu6kcrDaBzSEd5vbKRYHjS89v+QY3NVT0s0B34my/LOH1fG6d2JjpwoZHoy/qY9gkG+N4lMGDcTe75WPYvtUd2J3pCNjqaPZKOkbngQTucm9/E9FPOqlNzOJUERpU6We0RkrAAgX+0KnxjxC2EsJ3tA9UKJ1eijtOLAFl2c6iItd+LTPeM+UYPJD8ByTx9IXt1+czD+oA6QqdoiLLtMle75jNCAvyPUg3Oyr9Tig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=02+Nk/kkYTG4CAxbqEqAvVS49hOjiT/Wqq9rXirC1jc=;
 b=iD6eD8jRs5ZWf+yPs+tKQ14FCjq0mvzSrGvlWMnyVUpQinZPl0FvTqkGRr9jeKBFFQYZ0de3YLA/v8iD3nOx4nOIVXUTRHdww80k7/5Kpb+EJS6prlLyDwa1CqL7jrScdKkg0VX7bJOLewPq6gO7MSGeKC9IiiQ/I58a0PlwowhNwxtS+L8t3R2+mFAovZe9RlqJwYJsK5s36p/HyRL2i1SIdKZWKOibWKbI6UP1oW5ym0pPwjvJp+DjQ3OHLHOw4Kq9FSbVORjkH4m5tWokmDFDvPhl0s30BqVuYnvP1GDmvN+t1TT0Nc1ttbn43uzRDqBfJ5C3lvli7rwpuNI+Aw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=02+Nk/kkYTG4CAxbqEqAvVS49hOjiT/Wqq9rXirC1jc=;
 b=phSzddEO8bZdL59oyyI/EYcicXvRPuWnIDlwkhtkegUzoXixGXB9Zj08VIDCM3Se9TcQBM9aMkLcDiF5567O8fy2RgmW7k63WDjDfAedZQc2ZLhxTLcAetNiKFAUjxNmaA6EOotkG02acYN/WshLNFtn+sXWUYMZTKF8wgtDMGA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TY3PR01MB11797.jpnprd01.prod.outlook.com (2603:1096:400:373::8)
 by OS7PR01MB14460.jpnprd01.prod.outlook.com (2603:1096:604:38d::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.292.23; Fri, 7 Aug
 2026 00:55:31 +0000
Received: from TY3PR01MB11797.jpnprd01.prod.outlook.com
 ([fe80::1868:c915:c230:a383]) by TY3PR01MB11797.jpnprd01.prod.outlook.com
 ([fe80::1868:c915:c230:a383%4]) with mapi id 15.21.0292.022; Fri, 7 Aug 2026
 00:55:31 +0000
Message-ID: <878q6iu4u5.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: Jaroslav Kysela <perex@perex.cz>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Takashi Iwai <tiwai@suse.com>
Cc: linux-sound@vger.kernel.org
Subject: [PATCH v2 24/44] ASoC: codecs: mc13783: use .auto_selectable_formats
User-Agent: Wanderlust/2.15.9 Emacs/30.2 Mule/6.0
In-Reply-To: <877bm2vjjn.wl-kuninori.morimoto.gx@renesas.com>
References: <877bm2vjjn.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Fri, 7 Aug 2026 00:55:30 +0000
X-ClientProxiedBy: TYCP286CA0234.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:3c7::6) To TY3PR01MB11797.jpnprd01.prod.outlook.com
 (2603:1096:400:373::8)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY3PR01MB11797:EE_|OS7PR01MB14460:EE_
X-MS-Office365-Filtering-Correlation-Id: 73834e2e-329c-45e3-e7be-08def41e9475
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|52116014|366016|1800799024|376014|11063799006|56012099006|10067099003|18002099003|22082099003|38350700014;
X-Microsoft-Antispam-Message-Info:
	e6wrjTq3vHmkrmzx/FQE3lsRuVOIbZq5AJW2C2dKczrQ30+Ya7CD4sz7hVHokOCYMStRYE3Xbws2otwLt802obRWb0U/sJz3L8qeDgABcwMjhxMfl8OVJeCWK8S1rHzA+paBQEOiNKdylwftCHZoXVlCkswqqweJ/BIC4wU+Ycs1dUYTRZl+ynYDd1GQ7IPromdCoe2tj5NghBW5c27a1jB2juykCRD50yuTEFMijWwIGmLPSSoJBS34TzMoU4m+vtNn532XYasPgIDLJGTdGEwDJQjUvG8ksrh/zWX6Kj9IZLW5OtyaeICXv4sAATvHZF8Z1NcYf2Rm3GF82dMo7a/zDLSACHcxjshGxz/q6NTZpuKtp8R22M1O1oLAs9rjFRPNTOPD/JudAtXevh+CXScXL0lMWWTVwrev7SH9Tl9Z2vw8nGIjd48Fo4ScKqvSPB3jH5JwiQMIUXFEs3KFpYtRjlT05XCcw+cvrP2dPawVU2IBe3pF8bmMwL0tnbL6bdYhCMYdCWogg+EeVbK0lYmF93MOo05aQr8Bx6eHx5eWo6l9jfSvCPNgEdAU2Y/Rhp9416kn3UKhtto6AhIogrXYGXAPjgo1trzqC0q2HT+kCpeH4diffHLle7mwOWsp7pQvITkcjrOXB5AK6uKukgdwBBFp2GMNHt3zSwmAdXIHDpwLQS8i1wShyQg1Xfv/lB69mIT3HsARs/GeJNJLqmOy0mqB7rlRkt+3lA/twhY=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11797.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(52116014)(366016)(1800799024)(376014)(11063799006)(56012099006)(10067099003)(18002099003)(22082099003)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?SvRLee1K9xcGVj20yX0pBnHkUIITamiM5PGR3vTENanJ1yAn6TN60+qRJL7P?=
 =?us-ascii?Q?2IqsxzmnzXAzV4dT6HeGDAiREsTt6tFeKJhvtSmwYRll1WGhgRUPl6s/fAUS?=
 =?us-ascii?Q?LiK0JNmon9Zi/gHqbQStCF3yvyUY+oe+ofd0WZ0gzWdwFXCMUWxU9h9r394S?=
 =?us-ascii?Q?XB7DnAHG6gHDPg2tuo63NTJscWYYimI2UPhnD3ZgytoU9TXypSTfQrUaNd0D?=
 =?us-ascii?Q?HiEWMB9atBgfCY40Fk1q+XVT5vzZMu7ftOfXNInHfpx5OYHwhXLVJVftoslS?=
 =?us-ascii?Q?Lao76YHOMnImuh51WccTQLNJ4B6r7X31DNRHPhCyxRW9aofDkgBsGe3DppvW?=
 =?us-ascii?Q?mloGWiS+G0b4sEcb1hiOGHed2NHpdiMi5ZHrayGU3oBBasLYwowPcU3p/jt9?=
 =?us-ascii?Q?piahZrhCIw+HuZrsw+SIZzJK1MDkjjKyx1tCR9JFsUCklLQV2cTOdw2R22Yi?=
 =?us-ascii?Q?rU/OGAAe3CoMl4oOdDjyEsZzCZm/kX/t5tnHX0cuwzcytaSCW6JIIUaOyiSl?=
 =?us-ascii?Q?VHEkLjpbO+sh+gDFJnJpjWEvaiPtr9DVo7x5FDhvQXyDs6+a/FdhgXYQUtCg?=
 =?us-ascii?Q?SkmckFRRxVOJGK2SzonQp153vTCp+2LSf7+l/WETU/L7RcJSmcjYDzBcgFpq?=
 =?us-ascii?Q?9ZBuw4jIHwsnVrf5u59vElzHaGjSgXPOzKRFExgfnOWFRFhOBlESC9HhvdBs?=
 =?us-ascii?Q?k/3cHyum1TGxncqCNYwZmCpww6SQl81NfnWWC/aPqgzR8CahY4RFH43tpfX+?=
 =?us-ascii?Q?vc8N1SFFQwVCb5OxSmkiFKdB3hGD5t1/Edungz85Md9jEsHgKeQ4ATPJZG8f?=
 =?us-ascii?Q?MJ6Ma4gnFqoa2Ks2mhHERPFFWIvBB1N2EXWzKyvB2JFMxGJseqMGjPuOH3gl?=
 =?us-ascii?Q?F2bqEiy59bGmEcznzSg0YFW9QcQXVvOhWC/f7WqyYesIb3D0/rwXRQbfw4Av?=
 =?us-ascii?Q?EFxP14pUPbyozOm8g0FrrLuVF1fOSR5BA4ied0LmKLh+PdPQrDfYDq5Y4EH4?=
 =?us-ascii?Q?FxisKHFsmoHjSYdKJ1ws/bs3vUe2SP5utCAINpoBqFat/MNwpgOIip4xKLAQ?=
 =?us-ascii?Q?S4zjrfxOlXuz7G1aKjjQb0pCAWaGzHAytemdqNWUyGKlei+oP0o/5vYPyK5k?=
 =?us-ascii?Q?oIbK8msxiX7+upJIIo/drqzmK69fJT6PlJwAIyBn7al/P2iYRGNRReK5DbSQ?=
 =?us-ascii?Q?HCrMpHluH7JPR0yaOm5Kxp3PinQW10hThyU336A2nAy07XxDAtCuk2E9Wb1C?=
 =?us-ascii?Q?lh5RyZDcZQhX7ThVGtXdb3mPAXvUxbTcx9e2zAN5QZ8LwqsrRcPclUdBF41e?=
 =?us-ascii?Q?0aZNXnOEPdvFFni20UfhWMqmDo9C8DStYwlL01ci1/tBKxUtP5+9qMzwVD3z?=
 =?us-ascii?Q?5QM/H7QaQ9LCKsxT0wbEOTq4eyoX84CCd8Cwz9hcc8dCeYI3e9E1viODpxfy?=
 =?us-ascii?Q?BXYtAvMMogRwI13R6DP/7YkjoCG+4jGvvQaDmV0e7Ue3OvHj6dt2NDugqXuB?=
 =?us-ascii?Q?qpupn63wUgJFZ01x0vAPihMyjz44pgauJIk9wRlJRNPKISvKi8+j8m8RiCyZ?=
 =?us-ascii?Q?y/j/EwSLiSGK/pAeQ7Jv5mCC3AMB1OscTxppXBCzDHPSvNioTeauju+tmV4H?=
 =?us-ascii?Q?YFBzap+EBHwC54zVraez247Te8QK8RuncXKk5A0RyRvZnuoMXGcIEBj+YEEe?=
 =?us-ascii?Q?Uahb7FNwYpnOh97KDdtdgpAJ4ztaAA4DOMb23xIPdB/dgyv6syVJ7UC9ZbVC?=
 =?us-ascii?Q?TS4ahcIs0nuIH2cmT4aZtoJtxmrJybI=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 73834e2e-329c-45e3-e7be-08def41e9475
X-MS-Exchange-CrossTenant-AuthSource: TY3PR01MB11797.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Aug 2026 00:55:31.1536
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3vQ1nEEYCzvZHd9HLkueEpoe6scddC462eBBp5DsSyxm4GYvTZqZ7JLh97xfwgQPpoc4eiFtuz8yzazkpyp4r3y4UeDmX8OwadpuqiWinkju3DUiwLJNcg1ZJEYhP6wM
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS7PR01MB14460

We can use .auto_selectable_formats. Let's adds it.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/codecs/mc13783.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/sound/soc/codecs/mc13783.c b/sound/soc/codecs/mc13783.c
index 086ac97e83866..a6231a12a9b09 100644
--- a/sound/soc/codecs/mc13783.c
+++ b/sound/soc/codecs/mc13783.c
@@ -637,11 +637,21 @@ static void mc13783_remove(struct snd_soc_component *component)
 #define MC13783_FORMATS (SNDRV_PCM_FMTBIT_S16_LE | SNDRV_PCM_FMTBIT_S20_3LE |\
 	SNDRV_PCM_FMTBIT_S24_LE)
 
+static const u64 mc13783_selectable_formats =
+	SND_SOC_POSSIBLE_DAIFMT_I2S	|
+	SND_SOC_POSSIBLE_DAIFMT_DSP_A	|
+	SND_SOC_POSSIBLE_DAIFMT_NB_NF	|
+	SND_SOC_POSSIBLE_DAIFMT_NB_IF	|
+	SND_SOC_POSSIBLE_DAIFMT_IB_NF	|
+	SND_SOC_POSSIBLE_DAIFMT_IB_IF;
+
 static const struct snd_soc_dai_ops mc13783_ops_dac = {
 	.hw_params	= mc13783_pcm_hw_params_dac,
 	.set_fmt	= mc13783_set_fmt_async,
 	.set_sysclk	= mc13783_set_sysclk_dac,
 	.set_tdm_slot	= mc13783_set_tdm_slot_dac,
+	.auto_selectable_formats	= &mc13783_selectable_formats,
+	.num_auto_selectable_formats	= 1,
 };
 
 static const struct snd_soc_dai_ops mc13783_ops_codec = {
@@ -649,6 +659,8 @@ static const struct snd_soc_dai_ops mc13783_ops_codec = {
 	.set_fmt	= mc13783_set_fmt_async,
 	.set_sysclk	= mc13783_set_sysclk_codec,
 	.set_tdm_slot	= mc13783_set_tdm_slot_codec,
+	.auto_selectable_formats	= &mc13783_selectable_formats,
+	.num_auto_selectable_formats	= 1,
 };
 
 /*
-- 
2.53.0

