Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazon11011065.outbound.protection.outlook.com [52.101.125.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C92F34B669
	for <linux-sound@vger.kernel.org>; Thu, 17 Sep 2026 03:02:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.125.65
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789614173; cv=fail; b=jcSRN8XtkmzwY+8tX67bjTYwHgXrlMYPDBEJAHYhUwPOcmg+UPfpK1XrWKEDZZvQOIJ+Gq3VQzadngYtS7mF7KYfDdVlNSFtu3/0tBozxOl1tEMA6lbWDg3aPRIibTGsaD8RhOgdggVb1nszQO5hcb26ob9RRxpyj1GQE6IYjVg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789614173; c=relaxed/simple;
	bh=QhlfBceYQhvm5NiQ+Xpd5Vcka06ypmWkIhTopmaTkOQ=;
	h=Message-ID:From:Subject:To:Cc:Content-Type:Date:MIME-Version; b=oHbPsuOM9iFyo9LOLgG2g9kK1hAjnGZgbNrgEi/6AX6vf1ZkrlI4ZccwasCRXqBXlrBN6nqDmlvuJqvZSbdyaHGLnD4W89cy68d6pONVSQMzMAy0ljNSDcvpcMYz0xkxYlicB0XLHqij/XrKncXepxMVryYkYYSsL25ouZ00N8I=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=Y0iPhEL0; arc=fail smtp.client-ip=52.101.125.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="Y0iPhEL0"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=O/XbP7Z6sHNG49H31PrKBcL2WFlB0q0cj39inVrmSywgrhs3Xr0E0DxceuE0jvHSVjo1b6OwxZekj5yB/ga0DaCReRZmX98/Pkm80j0kx50+3X+ASfrcdtp9uvOXkNvrXRPlIlA2uNPQnjz8LJjHFSddv+BADICNHDMvc64nk659Md5cQI+o3+gvV8xY73pBYw2EVkBukZgBU+akQX+GDdPAeIayj/1lTDTVM/+DhPxefe9bxdBSfXp/HsAyu4zObkN9Rjkn5lKZeX/QmSX7wC0hFiqNslQHDcY3piTl2XIc0UDy4tpJ0JTvIpJ/+WtgR4ZbUTM6mAb2SBd5wBT+0w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MujMxf1QHOa1BF2+51CPVQ3DFcVTtPfwyunFEzY2A9E=;
 b=i7zalpmhJH5SghLjn9xLDIgid0VVbgu+NS4oNCkm1pW3QZIW1I05YvfIMTIz5B+I0jjwsLj2dXSYLJmQhKqDERErEEPRBk/p2VLqNhXp6qGpOyiQsGGXSrtgxVW616lBZslkzXPdSJldf0HLfJYt6ALOlZYUW9s194RNCUYB7j8DJvzWhgGNVWsU0J6pLzfS7eKdwRWGSsph6eZiULD+ceuj8I8QdYy+VfU8uKAU2mZbO+4Te44OARrK0d6uuQYHvdoxyS06rdYyEIbMgFkpAmvXzanh0SzQpF3DWn/D0afHufWROuHkqg89Z6Zu5977Wet25MsF6lW+GnTExRK2qA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MujMxf1QHOa1BF2+51CPVQ3DFcVTtPfwyunFEzY2A9E=;
 b=Y0iPhEL00BjFyklrb6UPmmtm/11JIHc1qF3PQYJHHS9Nx2QiVvkw0gfYHCv6UerlZ/Q+TQX16ohYiwKUOr3C7ZmHiD1inGwii17YUwH9IPfU9zSQJgMKpPLeqJPt3xcM/DIEsuCbWBGsOhBfJ8Oc+k5lMVHmveMusn/510y9Fjk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYYPR01MB14118.jpnprd01.prod.outlook.com
 (2603:1096:405:214::12) by TY7PR01MB14309.jpnprd01.prod.outlook.com
 (2603:1096:405:247::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.12; Thu, 17 Sep
 2026 03:02:43 +0000
Received: from TYYPR01MB14118.jpnprd01.prod.outlook.com
 ([fe80::846f:9035:6a33:1f45]) by TYYPR01MB14118.jpnprd01.prod.outlook.com
 ([fe80::846f:9035:6a33:1f45%6]) with mapi id 15.21.0428.011; Thu, 17 Sep 2026
 03:02:42 +0000
Message-ID: <87a4pgzijx.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH] ASoC: ak4619: Add suspend and resume callbacks
User-Agent: Wanderlust/2.15.9 Emacs/30.2 Mule/6.0
To: Mark Brown <broonie@kernel.org>, Khanh Le <khanh.le.xr@renesas.com>
Cc: linux-sound@vger.kernel.org
Content-Type: text/plain; charset=US-ASCII
Date: Thu, 17 Sep 2026 03:02:42 +0000
X-ClientProxiedBy: TYCP286CA0118.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:29c::11) To TYYPR01MB14118.jpnprd01.prod.outlook.com
 (2603:1096:405:214::12)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYYPR01MB14118:EE_|TY7PR01MB14309:EE_
X-MS-Office365-Filtering-Correlation-Id: 97ec7a21-f58d-40fe-b1a2-08df1468242e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|23010399003|366016|1800799024|52116014|38350700014|10067099003|56012099006|11063799006|18002099003|6133799003;
X-Microsoft-Antispam-Message-Info:
	8NEkbX4QIePm7HzLpUlhKsWmQtreS58gVNGetqqqQkrOtbIDG3rZxIOQSXN8edtGMCtIGq4l6JRykHTHxW1/GO+Nw1EvRrbXY65YL0kJMJ+Fo0VlmHmNBIQlztnYJ0QIIE0g34hShzgkYXtm1YJMfIWMPMG/A9d8OBcEWLX/r29YVtcQOYv4t3H10C7KRVa66QMsYoD+UROHX4x/fSsRjok/Qf4eaCzjhuxCVpCDDvMuS+Jlm5UaYWnGxVKKGc+bhGshC8dTMxzsXJk0gSDw+tlw8rzenjV6inVoOkB2RbSmb+hujn0zXaq0TzOH2NakN/m4WI0FKLvgxXq/5nIAY1oJ8QFMQrCAZD6kkGJYgxB4TIflVibuN91ebNKXeBHYwjkALnt0b5Hcw/FFNbAUv6xenvFMKlbRpFJG1H/br+oPRJwP0BpYAA+J1u7olM8/rxKiB/pYrj2NG2orIHgG1hUYfQu3ZAP2A2SpB6VIO3knO60EJANuy7zo/STLVstjJFXLrqezBC6zrGa8tWKkJO8/GBRhw9P38tukwlH7ivbhjZZjnIp6KFXP2tlHp/ZcC3c+cijuJsHPhXmlX8OCEujKJqlZqDTTuBbjGXuYbqRBl2dk+Pgy0Zs3BoelAq5hNX7nRxwjBGjLolQe6GBSWIbeIQcsi7XXUQDr1rV6C5OZCH0mM9A7Ge0qe84P2496cndldpdE5iUZbPZca7un9w3VPYo1dxBjSdpgfhYaRao=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYYPR01MB14118.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(23010399003)(366016)(1800799024)(52116014)(38350700014)(10067099003)(56012099006)(11063799006)(18002099003)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?601u7TTvRdkVhUV1p5fdq+Kqd8MOXIrED7/ozXmgT6QyU2aE81axK9RovHKF?=
 =?us-ascii?Q?D3th4GigojSC/vi6Y9M3FizQ6RznEXG2J0C0E2orDN01OncYhPUb3sq4ExcK?=
 =?us-ascii?Q?2Mnfrk045YQuT8Wfwro15ed0hkn6rMFlZwqTgjRSucImpkvJ4oKncSU5sD8P?=
 =?us-ascii?Q?3LuV9tusPUDfYuDDVWmOG+LdVYr0O8eHtmG55uCdqhFBUVZPrdoMTUCwjFVt?=
 =?us-ascii?Q?dhWKfD+F6SEO+HpOd6SM8Td6Yoeu35sHNjo7+FFcYb+RJdaFpwhW2vS46XBq?=
 =?us-ascii?Q?yVYZgJY152ewimfHQhJkJcGAMs/SAxSe5Uwk3OhHKtDk0J15TEwyj2NRGnTH?=
 =?us-ascii?Q?bCK/7/shZHaeTQszWLBkOPv2XNVRUU82bo802feCeFr49lDi89ZUgAc4HmAd?=
 =?us-ascii?Q?zRZ+1ciEo73k0uLfDTfBIVgxiAHJtWXNUOtW0QrOBc/EpNLhqWGYTLIfWs83?=
 =?us-ascii?Q?4lewKsLukPtG+Nx6q2buOkr1SKozS1fJJHwBCHmVOwzlLCoDxsGqXzLkJxAS?=
 =?us-ascii?Q?pTF0tvhJoX4DwJqbZioMoj0swrmS7GrlN3YGfare1g+nlYt7AEwIM9Z5q073?=
 =?us-ascii?Q?2f2jQgxiLXccADyDJXfYTx9lCqQGfEXDd8MiNj7Y2AvgjaLw1yJWYpWnlzD5?=
 =?us-ascii?Q?35IB2XUOS4wn8H012c9cr/qDxBslU3eEZd6/aO1ELsyWOQR+oz/wdpVdR9l/?=
 =?us-ascii?Q?qFf42sopV9W9UI1bIlm+xdsNvu2XAeNQUylw6wr4krDDNvxeGEY27PifNk3J?=
 =?us-ascii?Q?xWNYfkhbdjUoJEflknYho3k/XIS/E0xVBA+8z0dtr7XFcFHd00cqcVdSB0c6?=
 =?us-ascii?Q?iKd5lz6yfPzy+jQG2udM5hx6GmkSKYLo5WbgoL29xwQNZa5B0fe7Uj6XyScd?=
 =?us-ascii?Q?eiq5NpMYTRyF+iMZ48xZI0srG7fMd9NNjIK+9LAEn9pVF8pajuY9PsWzHHOL?=
 =?us-ascii?Q?/3/D0d21mT40Gk3TfHpoV7Ql1rLggtvfbHEYQ4YmQ9Z0gi6heWO+GMyTfKTE?=
 =?us-ascii?Q?db5xQlIxhqlbrldBNmWQirr+DDl8BRX8kXBqgYX89fZGEBPU90a+93z/suzC?=
 =?us-ascii?Q?h174+lsyVz/CYkzRdshrgZDelMEirl3rrgT5+VhLKMRPx1+MGLwTvpMgo8z3?=
 =?us-ascii?Q?htAaLSSreJCIOeX7lsatJjDwXwaJuRKqob8gcDlJxRGEhKznV2cyAu6UWWOG?=
 =?us-ascii?Q?FkGhWGUgsx0R+bER6esaY/CU8RyH3QhBvvOmHb8XKjlsPqnOP5BKQIywe5BX?=
 =?us-ascii?Q?8Jdyc1FxQ3a3BJuNXiR+fj2xK+2EtIlgvW4GYSXx37H8x4ponTYfRIXQfz58?=
 =?us-ascii?Q?3SAiRp+bdwUkkEegrzQIpMBlj89tmtuxQh0VNItWWYQywi+VfzW0EuH4rxGd?=
 =?us-ascii?Q?JoNSVFl2nDD4HVoBWsms75BpB/tHXy2PCGUjAPti5u8Onr+532Rmp+TRLs32?=
 =?us-ascii?Q?nBiqcvOuYeqUkQVO7uSYeHblrcow5bRU4vgExK5VctYCmC11ULNTs8+AT923?=
 =?us-ascii?Q?I4KdzxbPqs89Gm8kHZO7NLFWCnUSQQKpEXR8iwQEm6HAbETxFoZZN0n8SV5Y?=
 =?us-ascii?Q?p8gAM12g7neqsDkKkIcWMddB0v1F6LTs6VMNrtERcJhf4SlnvRwTFxpAAvz1?=
 =?us-ascii?Q?dL7G01R5jyWM7ZIyYGNq7QyzTOKHj66iGTMuSjgsjTmDwHPmJ5WU2k26qRLu?=
 =?us-ascii?Q?8h1VG4bEotMewLvXCfLynMrT8kcb7mXiG4FlfW0x+hfIZvIYdPFfHXKIfqYo?=
 =?us-ascii?Q?z2lDffzJyzVn6GunSS7NFviqJjFYhHv3amNjQyXDeUPj0MjmxAKo?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 97ec7a21-f58d-40fe-b1a2-08df1468242e
X-MS-Exchange-CrossTenant-AuthSource: TYYPR01MB14118.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Sep 2026 03:02:42.7963
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jWnfbqVtUcJY/YptU0Kz7/6Jwzur0kKCBzwJNMQE2up4h22KRWK2cTSiwe2hEL5jdWmyiCCK8yBse6bYIFPhzEvHTrlK9O7BvX1Bc021uP143SSPb+Mvn3l0WOtP0tEi
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY7PR01MB14309

From: Khanh Le <khanh.le.xr@renesas.com>

After resuming from S2R, the register cache is out of sync with
the hardware.
Implement suspend and resume callbacks to properly restore
the configuration of the codec on resume.

Signed-off-by: Khanh Le <khanh.le.xr@renesas.com>
Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/codecs/ak4619.c | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/sound/soc/codecs/ak4619.c b/sound/soc/codecs/ak4619.c
index d9c9f6b200284..5252b30669d48 100644
--- a/sound/soc/codecs/ak4619.c
+++ b/sound/soc/codecs/ak4619.c
@@ -799,7 +799,26 @@ static const struct snd_soc_dai_ops ak4619_dai_ops = {
 	.num_auto_selectable_formats	= ARRAY_SIZE(ak4619_dai_formats),
 };
 
+static int ak4619_suspend(struct snd_soc_component *component)
+{
+	struct regmap *regmap = dev_get_regmap(component->dev, NULL);
+
+	regcache_cache_only(regmap, true);
+	regcache_mark_dirty(regmap);
+	return 0;
+}
+
+static int ak4619_resume(struct snd_soc_component *component)
+{
+	struct regmap *regmap = dev_get_regmap(component->dev, NULL);
+
+	regcache_cache_only(regmap, false);
+	return regcache_sync(regmap);
+}
+
 static const struct snd_soc_component_driver soc_component_dev_ak4619 = {
+	.suspend		= ak4619_suspend,
+	.resume			= ak4619_resume,
 	.set_bias_level		= ak4619_set_bias_level,
 	.controls		= ak4619_snd_controls,
 	.num_controls		= ARRAY_SIZE(ak4619_snd_controls),
-- 
2.53.0

