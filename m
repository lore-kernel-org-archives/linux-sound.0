Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11011031.outbound.protection.outlook.com [40.107.74.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43739259C82
	for <linux-sound@vger.kernel.org>; Fri,  7 Aug 2026 00:56:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.74.31
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786064208; cv=fail; b=ZXmEl4f1jF5hAi5Kt/3n7ClD1KG9Phf/UPIwctRlVX+Y+TaiP2ittqt69seOMiFbA714ch0UmMCOXfBCU23nUpCI7Naq+S4YnuoXO+BV7TFDLMivqRb8ZEwMZGM2qPWdiF0oFuV8UblHozLAFdtdSUWjBMaybmJ4x4MnhIcCrkA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786064208; c=relaxed/simple;
	bh=m4p3MRrSsMFGgCvj8rGFflyuoXBDHlF5SARUfcLymS4=;
	h=Message-ID:From:To:Cc:Subject:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=m6XInZllP8eiAdvOZEVB/4otdCRc/V9CSlzolt4yCtrfSaOzr+3QpQn4lGYu/aK23/z7apyRRjpZgAMi3oWlLew5jfudNafKky73hYwBBddXgkDIDFpbcAJaLtCNJzz/bgwC5W6ZY5Kzrwc86C7QJKe/Dn6FZYzerL04RpsFzss=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=E1AnhFJ7; arc=fail smtp.client-ip=40.107.74.31
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="E1AnhFJ7"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sOIvULmzxIsNod4TMBxn4kYb146AqirVUxxrqsG6rLES4KCqLgw6s6ngphXlYE4yt8iZ2hN8/nLmBDAWX0kn9YtUM1b5YoaukdZEWSqyowAcou1ImZHQxFl5mAs2bY80RLlgMfk0xylVKL0fQSExdGhYtM5pX06EOaAeqnF5aXgGDFnqRvf9JvUwmzESPTsS3I6NGueIuMZy6IOzIwTXdqroBJ1aYl++CV57nEnNuXd8O3i4VRQMTlhjVe3xraI0FWSUm6DzVXOKUGZ8xkZ7RhSJIHImRbaCMCxzrNGbj0s/fOIun6Rz5fdsLegMqkLXy8Y7m+WDggvS4yCBxUfIVA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1O9L+PcuQ9HhmDXXFkNFZ/MOPiehJZNOKjziGrg4l9I=;
 b=QCjQej8likPHcHigTvTB2nmCT6MP2/bZZIG2cQ07aAY7TXBTRKwkhyx8K5+fNBoWBGGlQNa8rGEsYmw20FlRnQFeHSzfo7M233kg1aZqaUc3hhewW+BcltNZGLsP0mKbQTUVw0M+fpdaw60bEr4Glcn8sAC0aqEiZ7MAPW5XAvRlnobqrkjTveYFwbBaEHqHG+D5exVTRDN/H1LaAesXpeiNGMl/ZEcjjs8BoQCh5InbcZE63TDC8OIg+9lbCGMMp1X52Ak9D7E7DFfl9oD4LjCiOAlI2bMS6YFIZebixNREdPl6GSkOKM7KkIPJe+FLx1P7MD61COpvlCajrHD9yQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1O9L+PcuQ9HhmDXXFkNFZ/MOPiehJZNOKjziGrg4l9I=;
 b=E1AnhFJ7uM2Q5rYZtM6rn1shyWw60AZxA9o9fWbAC15jr82UuQBVrTm6a0rBY83ySAxPa6bng2/sU6+o57Iio9GsxyoyzeiTSxOL+aUN8pY5PO/UmPJjTMxm6ZbJJJpqoIdm338SprrlD+5OaFZ5rTlKvQI5XKHKoYx3ybJ8G7c=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TY3PR01MB11797.jpnprd01.prod.outlook.com (2603:1096:400:373::8)
 by OS7PR01MB14460.jpnprd01.prod.outlook.com (2603:1096:604:38d::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.292.23; Fri, 7 Aug
 2026 00:55:36 +0000
Received: from TY3PR01MB11797.jpnprd01.prod.outlook.com
 ([fe80::1868:c915:c230:a383]) by TY3PR01MB11797.jpnprd01.prod.outlook.com
 ([fe80::1868:c915:c230:a383%4]) with mapi id 15.21.0292.022; Fri, 7 Aug 2026
 00:55:36 +0000
Message-ID: <877bm2u4u0.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: Jaroslav Kysela <perex@perex.cz>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Takashi Iwai <tiwai@suse.com>
Cc: linux-sound@vger.kernel.org
Subject: [PATCH v2 25/44] ASoC: codecs: ml26124: use .auto_selectable_formats
User-Agent: Wanderlust/2.15.9 Emacs/30.2 Mule/6.0
In-Reply-To: <877bm2vjjn.wl-kuninori.morimoto.gx@renesas.com>
References: <877bm2vjjn.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Fri, 7 Aug 2026 00:55:35 +0000
X-ClientProxiedBy: TYCP286CA0361.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:405:79::17) To TY3PR01MB11797.jpnprd01.prod.outlook.com
 (2603:1096:400:373::8)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY3PR01MB11797:EE_|OS7PR01MB14460:EE_
X-MS-Office365-Filtering-Correlation-Id: 7a66f5c7-42be-49ea-ac8e-08def41e9753
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|52116014|366016|1800799024|376014|11063799006|56012099006|10067099003|18002099003|22082099003|38350700014;
X-Microsoft-Antispam-Message-Info:
	+tB0n3JAFOsxH88ddVtGHF9qtg1R0CDKkpgfjjcc/YRAVymGEO0hoIC9s9jG5I9b4pCoOZdL8BZDI1SggsGPCGzJWdHhIyLGjUNcj+i9cz4ViE8ghJ/sEa+i+QfCkPAe2wBKWQq3kXNw106d/ZRT6okwhPDeEE5vgSRhQ8ExlYjDRPm0z46hAqkVERCOiIF+L+Z+lF6wsxbLKOGgzKTDC4GEwvziqNL5dym7pBylMBX1wumKdWfX+0rXC26ndJdTVT8ynsLAPudwL9Jnelhk+vQDGhkWRuoJ1BH0P5WKNv5Tk4gif1cL1N/soaiZrUdNz2DyAeEVAbKE1gnFwlhhZ+3CboufvFCcvV99XGy8NuLKA8fSdGf+FA0LcmsO8Z/0m1lxlw5DWma9QVvVI7VzIYzKJ451aGLJnOZepmd7HuApIISmxlIvRDGJXHtTWxDv07KrCd0/SKQv9JB6by2I7S1gxQmCxMwr18Mol3/jrX1GfvyXVowhfLRoM0Cbh0c/at7QIxBBbt7B6ZziXB43ApHGkQA/UiS605NzOiMYB1D1HpbZpy+sDjLEJkdmNTYlgtk0AqoC/QckjknolecrlfJkb19Od/fll9uYShFALlqFMF1gtuMnlETnyRAPS4KaxprOHCMpLLoWqtgOeLNMaKJEmfX1RJ6usHvAm2kFHP/YRPS8V9NX4mEnZugkkNS6wELW93LvE5GGQl0mDjnMtWzt4tazwUMjlaD9g3zoSgk=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11797.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(52116014)(366016)(1800799024)(376014)(11063799006)(56012099006)(10067099003)(18002099003)(22082099003)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?QEncudvPaHIpFIcRA3eQxpI4yO23ycrjeQK7mxpfwVrwBXXwR3W3MwMsf7E2?=
 =?us-ascii?Q?Hgpv4cE4QHhlp3ijr/P4vaOj4pcfsjFr5BUi1GCqhVM1KCX8UoL2nYNBDIzZ?=
 =?us-ascii?Q?lswKp0Z1sepNCvdycbS2XE+/84tWXSIvJlHFdNtN6LCCbE19mD0bGEUuYqTH?=
 =?us-ascii?Q?0OfwN8eCX3mrbUrUJ/kponLBBtVfvyPgcT8jiiBYEeWtIc1t43braLbihvFi?=
 =?us-ascii?Q?OmmidABOSo0Nf2ENco+wHUEVM+3eKTOpo5wP2f46cZUgJpQB3wuM0n6F10YD?=
 =?us-ascii?Q?5sNzw7N4vn8PlwvfR31uxkN6FejvSTVtlUUu2ghYpQPfovj5VrCK/oJ1V7uB?=
 =?us-ascii?Q?d0SMJCbTJqWvhKEoZsSaWtgBkNRBsH58nzUMlofrVlxt0VMMo/Nu/5bBjfKX?=
 =?us-ascii?Q?oP8GR/++LaKORoZQhePXfqFBE4WNH33l44i6vAxZFZdLor8G0YA18PsIRXOA?=
 =?us-ascii?Q?Z3bub6T2XU0cVoxo1ibgQTtuSIQZ22ndcOBnb3JYGC7+kas7E5TSORXKHkY9?=
 =?us-ascii?Q?h8EftRH7Fwu/RfF7yIcboCygsLTzkhJ0MZF/Njew+/2CWHLG3Ar9jpeEBQx1?=
 =?us-ascii?Q?HDWO9WNnKYdqAVJ4nIsXdJ2aFd9+309ShkZCxXp/mUoaaz8SrQNk14DUhPuk?=
 =?us-ascii?Q?t1+6QFKf10jrD3NMeRWijb8DN/NffWc1bvX8aWbt4jyCdVK98E+HY8HMDuOq?=
 =?us-ascii?Q?YrcyDjakc0xcte1h8zuWrkc8WKS3lWXYWcan3OkaIvt+snqauUMpAuVsEHIr?=
 =?us-ascii?Q?u5ZYSI+yNPzapY7Z61NUqz6tEtXZI+8vD61b493V2B15VL8zvqD1rys2NXbb?=
 =?us-ascii?Q?dZcPttY+7+25eWF70x1xLEuq8iqIiYW9OAu2LYnaewEQyZsku5xCew323wA8?=
 =?us-ascii?Q?vFbj2QygdkflSQRwLl41oNu1te6yqzSUU9IvewjO13yaPXKkigoBgxWTuqU0?=
 =?us-ascii?Q?oViijQfE1/BF3cdWDToKltX9JuDHYbYnfJ0gpjCNyEr5j36lND9IsdGm82I5?=
 =?us-ascii?Q?DhO+RgqHRMF+QTGHdsuxyRI8eVk4V0X+f7CN/ZYHqsYoqKgBQou0yOTVDWP6?=
 =?us-ascii?Q?FPiw8j+91pBAyUiMVjfsRubtB3Tft0XrQt534slszARyl+e+5d0TDPnHNHr/?=
 =?us-ascii?Q?NVTFmoC8ooXpap+1+JY/3g9sfv3c6Svz4pazxNKziJ9q8sNqEbeFwBK5YdCi?=
 =?us-ascii?Q?LbjUWFqTV6V1uhMjOcOCdnUUkKYnSKRowS9ZKNS9iOc3OT5q5fW0+VC3rN8L?=
 =?us-ascii?Q?hCnhRv+pFByXHbANzGj2gVJvOPOnWi1DR3Pj1x6z711zIqtLqxm2NqbkMHQk?=
 =?us-ascii?Q?ezEbR4t5J01KB137bQuagf4HNg4KpEHKGdddsYpB6nYeCLriArafCWALmW2N?=
 =?us-ascii?Q?pZdPXprzUKt6abAnMYEMi9G8aLxpAWYvJegEluuPmNjQHVy09dt/N2xUbLY/?=
 =?us-ascii?Q?KK4yTstyHIyyobd1ePkiOQheXK/hakXU8EkDdQUBM1MDefzHU8zH/lRYsrkj?=
 =?us-ascii?Q?jY8ymsyPF0b7YP8YiUI4mCO1CJlodJAfj6XTaLk9+6kDN3pof0+KMerGpOkv?=
 =?us-ascii?Q?W1od/Zp37NZ4jmOgFqLmsMgWMAQLIgrTPBYXknWYExs8ZhUK+iNQtHXhII2v?=
 =?us-ascii?Q?EZgH5x+XRoK2T2A/k7dBpLpjsIY38oWtFPMWKuBp6ZckYfcgTPkvbLF6Vmsp?=
 =?us-ascii?Q?LFLok9qpyB/HLxaVslt5WK1G54IKkVcRsdUu/7YHDZLbXVgSy5OHMFT1NgI5?=
 =?us-ascii?Q?kkJsPSOglAr2QijNQG/+Maje8LphZfM=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7a66f5c7-42be-49ea-ac8e-08def41e9753
X-MS-Exchange-CrossTenant-AuthSource: TY3PR01MB11797.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Aug 2026 00:55:35.9654
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Nh9Rx9VZ1Zt8unBMVGo6t+/XsZI0GVtTqnGF37XIifR1WE1shE4uyfxbXjIVxjoJ+m+luALa47K3NO/olmR06FRzb6222s1UY+YssxVMVIYnDrh17AykS9xOeNN24s+b
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS7PR01MB14460

We can use .auto_selectable_formats. Let's adds it.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/codecs/ml26124.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/sound/soc/codecs/ml26124.c b/sound/soc/codecs/ml26124.c
index 8a14626d43ffd..ad111d92cffab 100644
--- a/sound/soc/codecs/ml26124.c
+++ b/sound/soc/codecs/ml26124.c
@@ -490,11 +490,17 @@ static int ml26124_set_bias_level(struct snd_soc_component *component,
 	return 0;
 }
 
+static const u64 ml26124_selectable_formats =
+	SND_SOC_POSSIBLE_DAIFMT_I2S	|
+	SND_SOC_POSSIBLE_DAIFMT_NB_NF;
+
 static const struct snd_soc_dai_ops ml26124_dai_ops = {
 	.hw_params	= ml26124_hw_params,
 	.mute_stream	= ml26124_mute,
 	.set_fmt	= ml26124_set_dai_fmt,
 	.set_sysclk	= ml26124_set_dai_sysclk,
+	.auto_selectable_formats	= &ml26124_selectable_formats,
+	.num_auto_selectable_formats	= 1,
 	.no_capture_mute = 1,
 };
 
-- 
2.53.0

