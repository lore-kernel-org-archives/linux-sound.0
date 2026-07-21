Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazon11010012.outbound.protection.outlook.com [52.101.229.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 131C25B1EB
	for <linux-sound@vger.kernel.org>; Tue, 21 Jul 2026 01:00:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.229.12
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784595647; cv=fail; b=eu7Sk7c/xVxoVPuQW2uM7sYfLaU8BFsJcZ0j1Ygfd5Hk7IHNZUr4L8oNOsp7nLyxKYfwO+Is9uKiWv5Zgl9UaA93GbSpEaW54p9h0I51YG0+11uOjPeZpadBcfVGm82W49pUtPW5Op+IZvaEHE91Q1S8mjkaLZKuCJuAkoDycFM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784595647; c=relaxed/simple;
	bh=nnpZktCMGw4IiUddE7KJ041NrLayYRgiF0UkdaCLlBU=;
	h=Message-ID:To:Cc:From:Subject:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=I8VMj3bY6o63zHVqV5alwDSlhTkZ0JVWg0S0jKkoJim9XqoAydhi1dMEM+8u6v2KpcdnKtvE6O94th9a3Qfxj9sY/FOYOflIiS5DhFr3pFCyHQtgP8BImYZPZb3QVwH81G/j6fmWp0HV9k6elgo94T+RNdd//Rpq4NasFxnVGac=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=o6V8Otey; arc=fail smtp.client-ip=52.101.229.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="o6V8Otey"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=r7df2XLjLHbB0JxiekwKb2wCUAMWSwy2zhHuyyj9SrTfSuupiE/giPSKsZftec/oza0P/ehihCLurFfhM3dNfy7h+e4D+y1qEXsxV1tjZG7QjCqyrTx7uXP+WP7bUyYpCwSpmmrNdci4yb+Rz+H67jpi2vNCFddaOKvsVKIhj/8rYhqJ9doPwlIJG3BlW23FgfzvLDOp7A/OxchPDZuAZOxaAW1h3mH5IKi8J5jzz26uCnVt8FgJaFjnEJhbCyS6NTkysNMNZsH2atELRa7ESiOwZjHF7gWxFCjX2kZJ/2uPj2zGo49pQ3vDVJBEYI0C/cM+xE4ncCKCNH2cJewaxQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WisnoZkh3C90vR1EH5NgZEPWOHT0YfFYh/Sb/6BaRJA=;
 b=jRY75Pt3lx46ABUofne3LoYchN+Zxc3OFo1DubrOH4Y8KHuI1nKWoqTqan+SQIXFwOngbZ57JpfJ6iTRJFkWcNcQQJCium5OinbHPE+ZxLMqQI/wPH8OG6c+kmr8V/BZu4ldqDOThDO13SXpGmSs/IzEY3KEYjNH0xVyS8OKSF5Q2qrF8aOK87000PIHleqOzY7m0E0CSORVSeIfsHzB2RIHgM0s0p1JybL/kKf7m/HnG83twl+rf2PwNCg2FX576PRkV2ZWHuIDk/S7HpVtRh+DrCs/9C67wkMa6+3YlJsc2qWMR09jvNgONEIjZeM8tiggSgYTJfyD0URu2M/goA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WisnoZkh3C90vR1EH5NgZEPWOHT0YfFYh/Sb/6BaRJA=;
 b=o6V8OteyoDUVAKvEOin/Yrlwnje8yCIKNgmasTz4WGHIwpUWvpOah7gDqkpFXq5tH6XlY5iivGTa4Ez5Gcg+cuFevwsIsdelVXFguWKD+O6edwg5Lnhp3Obc1uXfUHdkhRjZ3DZyKp3tiQlizcKESLjcrxy6j0R98YzWbVhECDM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TY3PR01MB11797.jpnprd01.prod.outlook.com (2603:1096:400:373::8)
 by OSCPR01MB15382.jpnprd01.prod.outlook.com (2603:1096:604:3a6::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.223.18; Tue, 21 Jul
 2026 01:00:43 +0000
Received: from TY3PR01MB11797.jpnprd01.prod.outlook.com
 ([fe80::1868:c915:c230:a383]) by TY3PR01MB11797.jpnprd01.prod.outlook.com
 ([fe80::1868:c915:c230:a383%4]) with mapi id 15.21.0223.017; Tue, 21 Jul 2026
 01:00:43 +0000
Message-ID: <87se5djgw5.wl-kuninori.morimoto.gx@renesas.com>
To: Jaroslav Kysela <perex@perex.cz>, Jihed Chaibi <jihed.chaibi.dev@gmail.com>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Takashi Iwai <tiwai@suse.com>
Cc: Jihed Chaibi <jihed.chaibi.dev@gmail.com>, linux-sound@vger.kernel.org
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH v3 5/5] ASoC: cirrus: use .auto_selectable_formats
In-Reply-To: <87zezljgxy.wl-kuninori.morimoto.gx@renesas.com>
References: <87zezljgxy.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 21 Jul 2026 01:00:42 +0000
X-ClientProxiedBy: TY4P301CA0105.JPNP301.PROD.OUTLOOK.COM
 (2603:1096:405:37b::6) To TY3PR01MB11797.jpnprd01.prod.outlook.com
 (2603:1096:400:373::8)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY3PR01MB11797:EE_|OSCPR01MB15382:EE_
X-MS-Office365-Filtering-Correlation-Id: 7597f1ac-165b-44bb-e77d-08dee6c37d6e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|376014|52116014|1800799024|366016|11063799006|56012099006|10067099003|22082099003|18002099003|38350700014;
X-Microsoft-Antispam-Message-Info:
	aEZENP9fj8TRExFgfTnpN8s5rJqXpzGeDJOjYqyqykuJEc/Rv3iJ0Sm9Aj+iDopHD88+a5o9V9KPPzYXiSbekQx/d7yTcz08G7Owjj1e0lLZKYZZzgQd7lyQOqB/LWYv36cLhnAGMr+mQtq6h2i4wqeDWtM5I+CJFoIeTwxNKZA7/zsdCG771GPDQ+8GJhmowR2lukV3yCa8ejjyJcbvAs0TFKPg+CabnLt+RenmjwGmDg8dHgG81NSkbSoDvhGvsgc2XnNp9qcwCje3TIVdiXVYx3fQbGPfPkP9x5ZmPcNxTiLITuFrBHuPyGAfFqwNTFfXrsOnxpjs5/5G/+RNg6fuOd1lny4CySJim+Am76ShnRUxQTts6Bc/W2StawIzRJkYxZwMYA6jz+mVa6Qwpgf4gbEgIRbPEJaRjtFuKVFbspQfg29rFIC85hQNr9sq3TxXeDeKIyKnEwkxyXH0yWoKmp+5CzBrBQEjYsLX7BcRLOZbqxpt9P2Kpco0cjLlg5d9PXxMhw3xbNAfs8h8dos7D7fRbcP1tO1KLlQxYesjCew1ngs4u8usiMYHQiuv9xf414OWrlOSnrXREErYbLXBQ0vgzKfvSMF7oTyV2RwP51LvsJoA2c9rySzp3fC90H0crz16i4HnT5ag8sIm65/hWnPcd2WL1wP2O43hd4hJCPJZ16RG0B686IYJ481WH1teil7bdSvCE6BKAgz1DQN+yqk3/2sDWpYnYT5X9+0=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11797.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(376014)(52116014)(1800799024)(366016)(11063799006)(56012099006)(10067099003)(22082099003)(18002099003)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?xAtttFO85aH/cxfNoydYYN0K9l5i7Sb+Ha0tvzEYJYN5dP1sJaci6h+jFgrj?=
 =?us-ascii?Q?GLXwKNArihYBrDumE0ZUrs3bfTZT/mbTQVU0kbEJdQjWiAEUuJlcXEBRO6AN?=
 =?us-ascii?Q?DaFguMNnFTKA4zmpanf3IxoJprGmHD/9TrvSSiSCYZdQz+Q0n/+6MuyXXTRA?=
 =?us-ascii?Q?EP7Dy0T/pNjsX8BW2B/qo0A1ZWqyzVriYiE2wIoYmT0yV0+PrlsXVXqr9BnD?=
 =?us-ascii?Q?GbFBFMeMdrSsJiE2s5Vz4XnH39/eUOnKdx7dvVO2tXVBypNkm1v02Pe59QOB?=
 =?us-ascii?Q?n7YM+25a+GilAFMBZvt03dthiqemT/fwW78fl/o1LTF4ex1GW/JR7AOQDeHQ?=
 =?us-ascii?Q?wDUkfMCY76AAiPqhqfJVkIczFMknAPENtHN9VFhtczNiJXkp3nD+7pnGPClu?=
 =?us-ascii?Q?rO9uLMrYqZNuRymCrvSV8fyu6VG6stTiAaJ9rVqut41VXS6T620SKj6PJOzN?=
 =?us-ascii?Q?6/e3vMY8wcNbdZgAIPy24AtXwUcMu5hx7itgL1Zpm5Y1+FesyEH9tGHIJIDM?=
 =?us-ascii?Q?5oYWEh5AREZN+OLzsb0QFqjLqQXCzmnC3Cc4zQSKxEQ6/G8S6ROwK3SAnhsk?=
 =?us-ascii?Q?2kPMe/dSQrO1yaAONcsbLj29DYY9fghNJuRF6by6jEyJaipXjmOiCwhiVoSS?=
 =?us-ascii?Q?BHI1SuAJg+On1vZwaPE7J3cZtxIOB9/JFnvpiYCmU1PmwAwz35dEOU+2CzvW?=
 =?us-ascii?Q?mOhM7Zg0lyDhI3QTRIR2YOmOgUAwGGvnKqweaAQ8FvqkT67HQQcpVYx9dcRr?=
 =?us-ascii?Q?6P+npBD1by5kxvBGZSRRiw8J/NR9zHI0oYkZSHLlF3fwC6vI+k1hjVql4lV8?=
 =?us-ascii?Q?9EnSzrwL5aQEQwyffo9G0slyRC5w5TO1EUa3NKKchihiLdmUAYr7fMOZXw8Y?=
 =?us-ascii?Q?Ysb6MQP3CxDw72f23Fs/EPgX23Z8w22HbG8JHWbsSfWFi4/HCvicBLTnR76p?=
 =?us-ascii?Q?L4WzM65C1dir59ViIjtitFtYthZGS/3naEM2BCu14p+CVlTVT51DdIWy6b17?=
 =?us-ascii?Q?Nhe9y8eGl5NrdCcJCpt+yWfv9IpVR4wn7nFjUOQ8TEZ9L0YxV75s7eC33k1j?=
 =?us-ascii?Q?9Wsbrn+WRNJ5SUOKTuSGy6Q7HPt/I7ZmHfbgA9luIeVeyECHkMLPCzsToYgn?=
 =?us-ascii?Q?/zqBSVD/iamWKFYTcm4TRtc8CBQNT0ZN6tE0AsGVgEOSylxqytyMYvEtGC6B?=
 =?us-ascii?Q?zrNS+NVoPYcyXsJcOKWUoM6NGjUOUJkM/GIqTNMX/J1M9/Nal7k4JWOCNAfM?=
 =?us-ascii?Q?HC2kc3DDbW91jilFFW0mH6HfRWDxiETvGbHCUNntuaqcMPGqhKHbx2qbTVn3?=
 =?us-ascii?Q?ex9nQYmru37kdGc9vPC1LxuoUmmaqdM6Y8KRhV10zbQ6N4daw+mL5g3kKL3m?=
 =?us-ascii?Q?k+GiHpBylrXUNCXAbqTPTalO+l88VJtjM3a2+cc0bO3j2wel0h2tSqbPQAdS?=
 =?us-ascii?Q?qPOupKdfJNN5vKeAtv9SPbN5z8vv901lZNCaxmjpKEdTBrCbzXin7BtvZ8XW?=
 =?us-ascii?Q?BtazM+oFdBnWYMJLgDYTWu9MVIw32QwQaURdOdd6rod54lxBwECZhJPSwRxk?=
 =?us-ascii?Q?dT11gejW2WCrk2WrJ8Ixa9JK71HdkKC7uuMhoCvjQTZiVOLiVIKLut6OgOK5?=
 =?us-ascii?Q?hkSli5az1dg4hwvKqbLaH0kgcwB3J7urvyrINjJi4+DfZGW0NUEScDOGfVho?=
 =?us-ascii?Q?8HMq1J43LXpGNUePBn011qgVtzrSWohBzicpIy2WBYiEa187fV3FzF/o6mky?=
 =?us-ascii?Q?adHz5h9YESBlPEPqV3xe8mSo3B4M2mA=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7597f1ac-165b-44bb-e77d-08dee6c37d6e
X-MS-Exchange-CrossTenant-AuthSource: TY3PR01MB11797.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jul 2026 01:00:43.2601
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UmwG56lle6SXkrUlRJJ+AwxM6EZdrYNH6cAQY8zsXr6oruRyqeGdeniaSUgQkkbJvsIXG6otY26XQ6xy15dLhuh8PG05SDVFC4wrGOT0hJEoSbMbfKRrcDSuTmAX8QPZ
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSCPR01MB15382

We can use .auto_selectable_formats. Let's adds it.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/cirrus/ep93xx-i2s.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/sound/soc/cirrus/ep93xx-i2s.c b/sound/soc/cirrus/ep93xx-i2s.c
index 5dba741594fab..8195ed7c6dd69 100644
--- a/sound/soc/cirrus/ep93xx-i2s.c
+++ b/sound/soc/cirrus/ep93xx-i2s.c
@@ -401,6 +401,15 @@ static int ep93xx_i2s_resume(struct snd_soc_component *component)
 #define ep93xx_i2s_resume	NULL
 #endif
 
+static const u64 ep93xx_selectable_formats =
+	SND_SOC_POSSIBLE_DAIFMT_I2S	|
+	SND_SOC_POSSIBLE_DAIFMT_RIGHT_J	|
+	SND_SOC_POSSIBLE_DAIFMT_LEFT_J	|
+	SND_SOC_POSSIBLE_DAIFMT_NB_NF	|
+	SND_SOC_POSSIBLE_DAIFMT_NB_IF	|
+	SND_SOC_POSSIBLE_DAIFMT_IB_NF	|
+	SND_SOC_POSSIBLE_DAIFMT_IB_IF;
+
 static const struct snd_soc_dai_ops ep93xx_i2s_dai_ops = {
 	.probe		= ep93xx_i2s_dai_probe,
 	.startup	= ep93xx_i2s_startup,
@@ -408,6 +417,8 @@ static const struct snd_soc_dai_ops ep93xx_i2s_dai_ops = {
 	.hw_params	= ep93xx_i2s_hw_params,
 	.set_sysclk	= ep93xx_i2s_set_sysclk,
 	.set_fmt	= ep93xx_i2s_set_dai_fmt,
+	.auto_selectable_formats	= &ep93xx_selectable_formats,
+	.num_auto_selectable_formats	= 1,
 };
 
 #define EP93XX_I2S_FORMATS (SNDRV_PCM_FMTBIT_S32_LE)
-- 
2.53.0

