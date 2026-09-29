Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11011011.outbound.protection.outlook.com [40.107.74.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D452B21FF23
	for <linux-sound@vger.kernel.org>; Tue, 29 Sep 2026 04:30:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.74.11
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790656248; cv=fail; b=h7AzedVBZnO/IPGF3S4WnS9pFbnlSd3vsWPu21Qm2wWkZWxoTbQRIvlTpcCZa4XExzmlV7js6zSOlo3NQpnPMnRdvoffMFMcwOMGb6DfVDLNxJzF60b6Ur+6cpNY5Vb0xkL+LLcIo0AGpWtwmLFuxJUCTkkzmsgxqvAShfhA0uI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790656248; c=relaxed/simple;
	bh=J28bavSzoNwuWxPYnywjKU4bE21mUWOY3F0ebdKPL4w=;
	h=Message-ID:To:Cc:From:Subject:Content-Type:Date:MIME-Version; b=oM6Il/VOfIRbss6uyT5a9vrAaVWj2KLZrAVJNx12F76zmwo27hWKpFxhc5tHRY28CU5JxyLtG8lMGWc9QR+q4FVX5+gFfFtpkYLfSHE2rwPdru5OYQr2Z5kRN7UTQWEuxOkC3zilINlK1NBtpWHLgmCCNvTBaZpK/v3ZLBC+Fz0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=kO/nu3yg; arc=fail smtp.client-ip=40.107.74.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="kO/nu3yg"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lmYACD/68n1hAkzf1DSkGwxJpjSITpirT+UI8JuVaIC3Y/xDWmPZUFOYl5B9jpfryOH66P0PdE2tqidMAEa4tH3XiQN4DhEsd1V4cz5E0mcB+mBZcsAm+uVIz6mIcV3JeZg53QocT3/4HZW/S5Gj6CtASVY9iRvsX1kLEt+tUOejlePF21bYj1ISXTTUbbiK5zjVeyHVWaaaRz2VQI0z2Lkg14V/+X9O2muAi6Lwa4gPoi0trhxYzx46uQC+Ip9BhchQWe9mhjGljdy98yOmPJHXCHhCYZG2PbZgyKExamXcIsMG+a/RUeQHI/kgIsMwdlRLu82CjrQld985bvO1KA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=elPHjwZYmpn0QmKjV+z3oaoS3eUvS5hPzIR0tnKfCpE=;
 b=c9sG2QP3ENGRbBXvbRl50VOGq31MuFR0u6HJC7/FJI/nALv+MValBLzdGbKyvKPtIoC5iXCBvCrK3StjzJfQtdcpUx28NonFuPBjBzHukBtJfky6KtfmElBXlDYk+59TojgX1hfbNziheKufHd23kdqJiLSqpytjNz7EtkuFMj6/Vq6iej1CLNS3RwXuspX1cmvndW/5NvR73u7NSJOrYzE8ftoFATuryZAc+vAQvlq5PRmp2/08mXBFfwsZwTpweSYMjzGR9hsRNnSjDpy1mGZtdtGgns6zHEe9XzZBz/sj+jBC0mLBovcjeCr5wR3ct2wDafsmAC/1ddKq7zEZkg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=elPHjwZYmpn0QmKjV+z3oaoS3eUvS5hPzIR0tnKfCpE=;
 b=kO/nu3yg9g9wbK7hpNOnib81DMr6OCKZuRiaF+ZmSFKPHozKtER4PdOOCIxa5dWfM/urL7Vx+HO5Hh8ayiV/Cwp4PqLDXTN9sxBtUFRCTOrc/X/3ON1dgRB4xzByKrO6tylPZEd+UC91SO0NZTwX83FxWaudWm7fSYMREd3P/9k=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYYPR01MB14118.jpnprd01.prod.outlook.com
 (2603:1096:405:214::12) by TYCPR01MB18390.jpnprd01.prod.outlook.com
 (2603:1096:405:3ef::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.24; Tue, 29 Sep
 2026 04:30:42 +0000
Received: from TYYPR01MB14118.jpnprd01.prod.outlook.com
 ([fe80::846f:9035:6a33:1f45]) by TYYPR01MB14118.jpnprd01.prod.outlook.com
 ([fe80::846f:9035:6a33:1f45%6]) with mapi id 15.21.0451.022; Tue, 29 Sep 2026
 04:30:42 +0000
Message-ID: <87se2sel1q.wl-kuninori.morimoto.gx@renesas.com>
To: Jaroslav Kysela <perex@perex.cz>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Takashi Iwai <tiwai@suse.com>
Cc: linux-sound@vger.kernel.org
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH] ASoC: codecs: twl4030: tidyup twl4030_soc_probe()
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 29 Sep 2026 04:30:41 +0000
X-ClientProxiedBy: TYCP286CA0031.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:29d::6) To TYYPR01MB14118.jpnprd01.prod.outlook.com
 (2603:1096:405:214::12)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYYPR01MB14118:EE_|TYCPR01MB18390:EE_
X-MS-Office365-Filtering-Correlation-Id: 741def59-db7c-4656-4e85-08df1de26bbd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|52116014|1800799024|366016|23010399003|18002099003|38350700014|10067099003|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info:
	69+vVnQ7d4FYXeOToh7vxBWMlkBH2o30O+htnNGMb7v+E9uQehh80E1TcZJb81YXEFo6AHflGPYiuBJzJWZeJZyuSnok1DqMhcOobd1CrDsqgj36k44QnhzGCt+dtsFDM2oMqCMEnY95L7fVwNmyykrbvbCu69nd6dr7YT8qqZio7m+X+q71MSvcHWxIPA5WxaSpgSZZVn+IgbP6ep2x6b3NTadL5dyGF21iauTKFwZsdpNv5Aq2C9C+Sal7wVfcfzp/ZK64XWarqIBFFyyWqUFalPKIradCsdLNGNbmGjZFW7pnUsRvWcubT04aRCAjNk5bgkJUC8nayEVNHyx8rec9NF/6xR5jdr5sa5d4PXpYnhze4AD9fSQMT0/KWNIMcxM8KVYBH2QEpxONvqgstTwse68EEr5kmUtCA/9VhhgwGAIdl8NhYAhFVwlkWZ3Pnmta8gHCsQYJsnYVrgA8RLFRQoVfDzfemJleiXknMlJSOM+aStxq4JdSMf5QjCq+KYAuTvMnfCjntXWSRRPmhK+Hw7SQz5CieZA5SZmchcJYypgWg4Nx/8IiHV+YqodMl772bYC2wum0jh58jPHEtPuR3Hg2k7EVnE9UjKe+JkddvPGDZb66IpPSoI1FCgLRVxPWh0u7YrVA68H4hjJPNJC6R0xQryRjZ6jKLlPx+CwPykiLgLHGNlF5TP1v+bOz3O/QGo9ZrEjPDUtc8EFZwTXHZa7jBMhZoYqiU8sfSKM=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYYPR01MB14118.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(1800799024)(366016)(23010399003)(18002099003)(38350700014)(10067099003)(11063799006)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?bjJeXY2MQqaa53veGdv7nHXX7mfheC2erHjm3xEQtxyMSAZASI0Xiniko37s?=
 =?us-ascii?Q?yKWpOPMvG7vUpLiRG33PyTsIrOqVg+REZk+6+kjoZfYNObrf31WSdmd3mdvP?=
 =?us-ascii?Q?v0oZ30G76GJoW+LKRf6lgjJ9OXWJXyM4qv71XqgfepeBXvGwd/t5tkkEl6SZ?=
 =?us-ascii?Q?cRt+XgaHfQMXi6KnR/u03Xegex9A6p81zdfF0AebsYMioUsEayIO7Ft3gy0x?=
 =?us-ascii?Q?NQmOD/1cGUL1kWvXHzx36Rj50Znk6qrDejCVEcO2Qz0L9jr6Rqqdgq9TR10F?=
 =?us-ascii?Q?yFHn3DyvYVRBW6oSvyeulCS0hJdnZ/x1hl+xN4KuBqzRT7cH9Toqh7X1xueY?=
 =?us-ascii?Q?U/TGMhxqeviIhLT1p+IgjDvE8sC+g96GHH2PdbNBHPj/JQg8bA7vCAMaLa0i?=
 =?us-ascii?Q?QR1twycD34kPj3HKOHAYKIe6CnSNbY9Esiywst4ZWTm7n4MfGnjBrH56lQc3?=
 =?us-ascii?Q?53QmWQtFghIHik28tD1tolVL0tFzIR7jt3ZAO2gHLPtX9SvdMi+Mk6NGYLh9?=
 =?us-ascii?Q?y3BrakG3kVTwu1Iib4AOYhWhnTa/93wIzgXQSxyaIesf7R0ga/60GfygNKkJ?=
 =?us-ascii?Q?rfWmEA8gyjIIc4wkWYQh4NmsycUHBy4Xl+mJMYZhpL6tREszPttrPpYgbTto?=
 =?us-ascii?Q?CrmwSyM6XBEwqX0WHugsUnmrhyuC9DcKWRteIwFiz0yWdHQgMpbspLguF+cP?=
 =?us-ascii?Q?+ldR6iU52vmvvbW/4Gu7lsbI6frhzBLVnYotCQTUrMKv9sV8aJejONxZKz6c?=
 =?us-ascii?Q?n9TsNrMbINrp2fe/ap3xxpdGQpUZao0psQrTKigy6hw7jedBJgTAciPXoBD6?=
 =?us-ascii?Q?CmOTAceUrkNH6EUFOoStO8LjYLRaeQaJdMjhMOrcWfgcfQEtouc4fJ9Unwbe?=
 =?us-ascii?Q?XOI33vvAuO3NB47k9NXG2951qPI3PqHh4/ixeZWzAlw0WDrH9i4FJTunHhKD?=
 =?us-ascii?Q?8QOFdYp0aiq8URMRC1im3RFSBL2v0jyR9BH/ZDvnXBcq9XUua01mqT2onTtR?=
 =?us-ascii?Q?afimiriei3xgusSb9As9Z3XVhcjYbRb1awzDtcAt54y9+TbPT1vIhgGWNdxw?=
 =?us-ascii?Q?dBNsk86SamkSIKn+7DUJzcs2Lb8J1IhlF2QPuFz+yUZFKgokDdy45wizSA5D?=
 =?us-ascii?Q?aYMGu2mrfC8TYSHrV3Ze7CIqkYk8fa3lm/M2231sDCflY4bsF9ln7pp+02/b?=
 =?us-ascii?Q?CjWThyxjAaeoEcYH6jQ5uE6S/wUXFxACqHiUzMeMvfHqoCzqf/1OTPUUKs5i?=
 =?us-ascii?Q?cbPiQPNAg0jhqxQ10fH8iNTiB77tUaY0Ueb9Br0nTVqNSTFPn51EwTYwj/5b?=
 =?us-ascii?Q?ycf9AmKPiRnJ9ArWRtBBZQvUbArVpGPU9YlamEsy81PhThgX5LL7/0h8/BhO?=
 =?us-ascii?Q?NY7MWTsPP1e7C21jxI0A/T7VNm9WGMMJOfgQFdsdsYZh70V6hVA7MieroW/G?=
 =?us-ascii?Q?yjt0C634o9XvAwJ9NW4RBdkHfeeBkwAVYajftvEP+rjNpqpQrKEuc4UY2Q6I?=
 =?us-ascii?Q?KKs0Ld2m0IxHGJ3yoXWtOQjiVmMzLsRp8oZTp/E6mpOAeB7J0v9T0IrqfDmD?=
 =?us-ascii?Q?Q+C/djXNb3m9SQxU3gvPFXzKnBqX3DEvo0JKL3PlRIlEYXZ1OeLKZebWBSWV?=
 =?us-ascii?Q?E4SJewbmAxBaqrvRWeKBFu9xeQWkE4NFHT0OiGYndtpIzOOPJyF3+YHt65k6?=
 =?us-ascii?Q?bDK3zqTtRHK/58LFOHBn1FNcR+3P23xS3z9tSZs073ZWc2wOEJj3KZYHj47K?=
 =?us-ascii?Q?VPxx7JfvWnpaPQoVsQYBXXHPwljgVbY=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 741def59-db7c-4656-4e85-08df1de26bbd
X-MS-Exchange-CrossTenant-AuthSource: TYYPR01MB14118.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Sep 2026 04:30:41.9438
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: AbGENJKAsCWeloW7zUdKQAghhuTXY+UVPL5CWp2gtilOsW/TIcFKQHwV1cIVy83P/KbA8JvvduIlxJ5SRjvI53zxi9FbPvzrDPj4+oJ/FtCvsn/EzVO1eLJXiGpAYW3d
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB18390

twl4030_soc_probe() (Z) gets drvdata from Component dev (A), and set it
to Component dev again (B) (= snd_soc_component_set_drvdata() calls
dev_set_drvdata() inside). It is point less.

Let's remove (A)(B) and rename twl4030_init_chip() (C) to
twl4030_soc_probe() (Z).

(Z)	static int twl4030_soc_probe(...)
	{
(A)		struct twl4030_priv *twl4030 = dev_get_drvdata(component->dev);

(B)		snd_soc_component_set_drvdata(component, twl4030);

(C)		return twl4030_init_chip(component);
	}

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/codecs/twl4030.c | 11 +----------
 1 file changed, 1 insertion(+), 10 deletions(-)

diff --git a/sound/soc/codecs/twl4030.c b/sound/soc/codecs/twl4030.c
index 442624cf2a317..7117af5a1a569 100644
--- a/sound/soc/codecs/twl4030.c
+++ b/sound/soc/codecs/twl4030.c
@@ -275,7 +275,7 @@ static int twl4030_get_hw_params(struct device *dev,
 	return 0;
 }
 
-static int twl4030_init_chip(struct snd_soc_component *component)
+static int twl4030_soc_probe(struct snd_soc_component *component)
 {
 	struct twl4030_priv *twl4030 = snd_soc_component_get_drvdata(component);
 	struct twl4030_board_params *board_params = twl4030->board_params;
@@ -2172,15 +2172,6 @@ static struct snd_soc_dai_driver twl4030_dai[] = {
 },
 };
 
-static int twl4030_soc_probe(struct snd_soc_component *component)
-{
-	struct twl4030_priv *twl4030 = dev_get_drvdata(component->dev);
-
-	snd_soc_component_set_drvdata(component, twl4030);
-
-	return twl4030_init_chip(component);
-}
-
 static const struct snd_soc_component_driver soc_component_dev_twl4030 = {
 	.probe			= twl4030_soc_probe,
 	.read			= twl4030_read,
-- 
2.53.0

