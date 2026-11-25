Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.228.53
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795570990;
	b=IZ8b0XRptffRHgU64X5mVEEVmW5rkeTJgurQH7n4VkGz0O1It+bg0tfmyCVgrNWeDooE
	 jJgrxkRPYKseZZZ6uutgmmghY+vxmE/aQUywhhCS8ICL9+832JdDjWCBXcAswgddCw11v
	 hJJdIqrWWBaKB7sDtbBEDxu1HdahdRDaDnV2pTIXhnNY4ENff4mHNsvS4h4/GqIj30C33
	 SP0hM0DBsT/2XoSnuWZzlV0VSsZwHDN8P53n6m4i6v79yb1J+H0sMHk5BmAaU888G2eb2
	 50579NYeq8M2/MObrasdA9PUCMwiQHr30sWxQUeQL9BFiA7mP1R/3Ar8lEj48IV3Log==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795570990;
	h=DMARC-Filter:DKIM-Signature:Received:Received:Message-ID:From:
	 Subject:User-Agent:To:Cc:In-Reply-To:References:Content-Type:Date:
	 X-ClientProxiedBy:MIME-Version:X-MS-PublicTrafficType:
	 X-MS-TrafficTypeDiagnostic:X-MS-Office365-Filtering-Correlation-Id:
	 X-MS-Exchange-SenderADCheck:X-MS-Exchange-AntiSpam-Relay:
	 X-Microsoft-Antispam:X-Microsoft-Antispam-Message-Info:
	 X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-CrossTenant-Id:X-MS-Exchange-CrossTenant-MailboxType:
	 X-MS-Exchange-CrossTenant-UserPrincipalName:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=LTd+ANGnOXt17Jhl5EPr1x6hi6tS7BDl4kkD3muifZU=;
	b=OPITLR3LI1hZAgdOOmEcrxA66xwa9mEEpKzNTQqplH7HdiMvw3EV9biPat9SSFoKSPy0
	 U45hgw0b7m/HKpObha6FOmraEKnu3v8dVDwUJ3uvbW4cctw/giHHojOplDwyvhN8T8n76
	 BGG43OQSJmNyqXSuHWqo+d6ldiDcTV4Oc174AmR7u2fLAimbib+omLX/5pN14b7+tQ8Do
	 m0JJGyu2dcbQp9VSt4MJ0UIFlndgyrdb3e9vt64UU8eYIwRFD3/nhA9eJ6Ap3Lp6sEkwf
	 I5WvFcXUAUSdSBPhrwYa7k9KngKueFZQ6YzKZHOk+rDkT68gHTZxMASRcTBz83q4cGQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=renesas.com;
	spf=pass smtp.mailfrom=renesas.com;
	dkim=pass header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256 header.s=selector1 header.b=cBGigkfV;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.228.53
Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11010053.outbound.protection.outlook.com [52.101.228.53])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB2C5606A321
	for <linux-sound@vger.kernel.org>; Wed, 25 Nov 2026 01:43:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DB2C5606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256 header.s=selector1 header.b=cBGigkfV
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bDyrdYniAKvW+S6vyAXNUCXq4Dm/WLbdWW9PjXbGDNzMQ2Z4FHNoie4b2oAQ4oGyguhe4K4JqkYYf1QeeGSa3S0+oTE2dSnBg3U0kQGngFaSDvieY+ZRcVkSiwLgt0jnIaR33Xqo37dl5UJ/WUEP6nbzqa/5C3JI7Lg/YHk73vRD/dbnVkgJxoR9vhI+B0AHesJwDrUMC2RLvSzVl5olCRRKa479sf2FgpIa2FodAPEMnvRZNmDisbgtRtK9CDxgwL6LhorF4evZKQJhuAk4BD8yphJoLcK8zVyyhtdfJQcsS6iT0pcWRlWPZXAIchHd9ek0wsbxYECNYmvH+Rb+qQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LTd+ANGnOXt17Jhl5EPr1x6hi6tS7BDl4kkD3muifZU=;
 b=CsJ6XRLhuKzLSzJkP+BpCRH5l/ygol41bYQfwmeX31dt/knPXM8dT0AsG/zdPGcBXWyxfUGxGfyb/zWinlpviCF7GBNtwZ/0EzEm27BqgJ536rrroUNIgKDU8POjsKe3jAKcA9NevjwKqIxvJVRwl31UWOI7hX5NM0QwlXPchnFmmmDNWKpOgQsI6/Cd8oFZ0SFQFBCpIY180ziy9hBa4mrAbTPemB3CRFpKEwL8+N3lKCZDK54Kmz11/IdL2uRC2w/okgqp9dBRXXsshTl/oeNBOnpFeGObEeH2sQCTEUgtN2xHKCEYMct88fe/FSUAwcIzusHNbQ3Ql9K9An6blQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LTd+ANGnOXt17Jhl5EPr1x6hi6tS7BDl4kkD3muifZU=;
 b=cBGigkfVK71Jv6SfW/2jk8BcYUhWVbT2fo3zCG95lGmM3QAnh7Jk0HiGOSzDgjzpA8PMaSjVk1mudButENgfnwZB3aAsDQvuU00RekIwobGeh7uK+TED7tsF6TVpjysPZzo15EPXbQH52vfX8a9mxDRv06BreWcb1XsTN3LTKXI=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from OSOPR01MB749128.jpnprd01.prod.outlook.com
 (2603:1096:604:4ba::14) by TYCPR01MB10476.jpnprd01.prod.outlook.com
 (2603:1096:400:304::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.662.6; Wed, 25 Nov
 2026 01:43:08 +0000
Received: from OSOPR01MB749128.jpnprd01.prod.outlook.com
 ([fe80::6a3b:d29c:c743:5180]) by OSOPR01MB749128.jpnprd01.prod.outlook.com
 ([fe80::6a3b:d29c:c743:5180%3]) with mapi id 15.21.0662.004; Wed, 25 Nov 2026
 01:43:08 +0000
Message-ID: <87v75lelec.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH v3 10/27] ASoC: soc-core: remove snd_soc_unregister_component_by_driver()
User-Agent: Wanderlust/2.15.9 Emacs/30.2 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org, Alvin =?ISO-8859-2?Q?=A9ipraga?=
 <alvin.sipraga@analog.com>
In-Reply-To: <87a4mxg01k.wl-kuninori.morimoto.gx@renesas.com>
References: <87a4mxg01k.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Wed, 25 Nov 2026 01:43:07 +0000
X-ClientProxiedBy: TYCP301CA0036.JPNP301.PROD.OUTLOOK.COM
 (2603:1096:400:380::20) To OSOPR01MB749128.jpnprd01.prod.outlook.com
 (2603:1096:604:4ba::14)
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Post: <mailto:linux-sound@vger.kernel.org>
List-Help: <mailto:linux-sound+help@vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-sound+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OSOPR01MB749128:EE_|TYCPR01MB10476:EE_
X-MS-Office365-Filtering-Correlation-Id: 8449a0cf-5956-4736-ae3b-08df4a9574a7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|52116014|366016|376014|1800799024|10067099003|38350700014|56012099006|11063799006|261022105027099003|261021123027099003|261021121427099003|261026121527099003|261026140227099003|261028144727099003|261102130727099003|261102123227099003|261009223027099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	UxyKwmmYrs/qwErsdkbXKdd16saZNLrEkoo5PlFc7sZRU3qOM42p7EuO1zXpSgpz+gRaeKnSvx1Km+OiI/3DdkH0YzWDZ3Pko0Tmes088k499YIGJ0q9Ss26XmJFiXZ6iCiwwPnt8RQFIQhswtoU+SB4umHld5Tzli9qrHLv2mck5JqgrF3J24GetdQHbau7mr6IRSAUfwhU796172uDXIQueiZytJ/QvwvzrRmVbHzSUc10rkfUorAIsGWL6qOCmoxX9d+n3KXNnFZoCwiM5DLGVHpI1lYRnoS+KeKyyTsiECegOKl8/QaQe2DedMOGmp4ZFHYuVU2fi5aKMevIyhFVX6ChW1IBcldupNga0lBYlLjFuBHjb5YDEsUym0GDbhNXgrQpTTMYxfx45LLZ246hYFezrpULDnDTS7pnvL6cZgfE+Nkpp7+66szGRdvmIUQLsynJdWDeKpubSqG4s64OicRoqFwNPTZn/UNMKuzmS3gfrMe6mO2CEoo+wI1QLc3oPTO787QG57Wnjyg5KdEQ13Tk9crCjdUot69D/ce0X5JD/FXA7zbOjMlRc+viLhOfbbFDKkqWxCWXO4sfFVo/WMXp3OfJ3gerzy20FeJ+8Dz0vXghTVqUrZt1g+f5JaWtdOnuSqx/lUx7qud8KrC5EJcU33L2pkTrhDC9XnAjU3H86rtdQTNehK8MM6WmioFdJEhvA0wKyFntxOOHXH819OiJtb7usYAkEF+GjWY=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OSOPR01MB749128.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(52116014)(366016)(376014)(1800799024)(10067099003)(38350700014)(56012099006)(11063799006)(261022105027099003)(261021123027099003)(261021121427099003)(261026121527099003)(261026140227099003)(261028144727099003)(261102130727099003)(261102123227099003)(261009223027099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?Luc5f20PrexuBItKYcKQMi3e8RF3L8CftfKXC9NcjATGUt/vOnNRbRoGXQgQ?=
 =?us-ascii?Q?VhwtxRnfbU+IWmMlB/SJCCwJQUHHU74LrijXpQi5zIt7AF+7/ZMec4JyppNN?=
 =?us-ascii?Q?J6dTZPr6Kf7qpFD0GdZTS3EQwjY1bYokj60d6pAlGWLBCVlAeiokwlnDamL6?=
 =?us-ascii?Q?6sObhgzfkI8rEtC9GBeTEcuHraCVmqOTRj0wh51BNKtnFezzOtf/EBsuesan?=
 =?us-ascii?Q?GUu/4Ogf9fGmZujdmf3yRVblOdeiBxLsqGI3NBsbm25e+G32hCKyexNjFye7?=
 =?us-ascii?Q?VNHTiEJAlVzHZk7jhMZD+WKF9p+fuyzSJ9103Ej9qqDw98s3CB/Dl25h1TC5?=
 =?us-ascii?Q?D2969wzceJnd64j10se2a1iVWwD0sdv4Wf9/pwYsbYtmDaPKrgVyDpCaED7w?=
 =?us-ascii?Q?R0Y6YgmmU4dsTOfr0p9B2+7CaLIv5X2scsgDKKM1HoXsLP8q8E7BL0XnEOFd?=
 =?us-ascii?Q?m2AzvwynNeq8QSXr8q0gMTc+Nicgf15dpC/FysLWmjfvaVcF/KYOiIhEEyEh?=
 =?us-ascii?Q?kJFMfOtKkrYlsePAYdQzEmbNEXuwDXr5kmHbDpYx3Wli1AgUYenri8S89FjH?=
 =?us-ascii?Q?NegbeaS2qiy382zuXZ6MRVQAIIPgaC9Vg3vSGtibU911dbHNbrFmWzQGYidi?=
 =?us-ascii?Q?lhKDjSEzZmIRatPYxCIrVnHN4d6vVaYqH61Vc/FVCyMbtNi0ijghXMH/8y/1?=
 =?us-ascii?Q?aILHsQnNkY5av3jCmzJ4udCzGDIeTMkDsBQGUCeM0CoJ9vDghxUBck0QrHva?=
 =?us-ascii?Q?gpXhn4uCDSqV+uqH4QtkW30X9WUt6Mzly27H0DJEJpk1o7dHMZbOQezNA2zI?=
 =?us-ascii?Q?kXlz+0n0T8fU43xJo7XgcQNJar2rvEn+Z9scIRWRnNKJ2luRBOmKMjDjcL0X?=
 =?us-ascii?Q?Ao3sN6xotv6DQR9qYhtqKrlkPq7Jj7wGcAo2Qe5RaLfqrkRKGST6rJ89jn80?=
 =?us-ascii?Q?iaJTEsQRJgK4I0Q8wEIU+uozHcKGWSnm3V7m70vVhbLxr+lnwU6M0J831CYN?=
 =?us-ascii?Q?Hh72wFHCHeL9wvE68DhmQ4yomJaTaT0PN7AKA7wRf/cCTt8U7o7qKugJTMV4?=
 =?us-ascii?Q?Kc3RNIjZPODvo5TOhWiF3O+4y4HC4d2bNe9z+WEq3kKJZRIK8Xsp9yBfA0q1?=
 =?us-ascii?Q?Cb3dS4t8aY58hDcPbuC/xIcMruHHLQnU6T8uAaAyzRBrAeuvXThbSQXYlNfu?=
 =?us-ascii?Q?XZGMUltmZ7IRubaHFhlY8Lm2tfKbEPmczzhFi4XwE9VU1vluNlRwS1hSKz5y?=
 =?us-ascii?Q?iqsoXsPwm9kkegcch7XL3jSrfZFQ0mw2bLtbhOFHpyQ3j0LbtDyBYWBa2pOg?=
 =?us-ascii?Q?A/9lKlz026g4zgzfR4kKqEZqfdfM050oEDIwLtb1waxCYZdL/EUmoaQDb4M9?=
 =?us-ascii?Q?OSsgOxvzZqlIZB3VFF8XjVRim90kWC/fHXTI5BLD42UEkLX+EJraBaSeBbz4?=
 =?us-ascii?Q?z32DrQKPfFcOSJF0mR+skP5ButuJ/4itZqo6bQzd58ae7c0W/ZjZuU3rHWU+?=
 =?us-ascii?Q?FiuMG2uhEReZTflY6wVpMADHWyn+Yxx0rsmdgAbXDwtvI+bHWv3Y4E997XwL?=
 =?us-ascii?Q?Ngc1NeRsMW2ZFC3IlhiyD5fEXd0cx95aIE4BMnzBETCfiFlJacQ5AIiOSNA5?=
 =?us-ascii?Q?MEqNq5XOmz3Ksr+dxTcGgEc9EvUzhDbNFUI3S/lNQEev8asic5CsC/77TNWN?=
 =?us-ascii?Q?df3X8D0UwMSdwzYJcPGNhACYZn71/EIymSEtG4AkqMbHR9HIftUxc/2nYOuH?=
 =?us-ascii?Q?gVI0BKOds7O4mSCVOpXMqr1x7h+3IVWWlOkW2+qmNJysGMjMUNxe?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8449a0cf-5956-4736-ae3b-08df4a9574a7
X-MS-Exchange-CrossTenant-AuthSource: OSOPR01MB749128.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Nov 2026 01:43:07.8557
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UKjAGNHv44TzjL0VBoCaNLi2hS6Wo+3ndGSNTr34TaOs8iw/TbBtg/v3K6ul9FlsOZh5NqSJjKjg2en9B6ku6U7CaDNFPOQhg2Teuwgj2Cg95Jcc91f/1R86jutoWu0c
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB10476

No one is using snd_soc_unregister_component_by_driver().
Let's remove it.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 include/sound/soc.h  |  4 +---
 sound/soc/soc-core.c | 15 ++++-----------
 2 files changed, 5 insertions(+), 14 deletions(-)

diff --git a/include/sound/soc.h b/include/sound/soc.h
index 338662645b42f..0f8e46c131c91 100644
--- a/include/sound/soc.h
+++ b/include/sound/soc.h
@@ -454,9 +454,7 @@ int snd_soc_register_component(struct device *dev,
 int devm_snd_soc_register_component(struct device *dev,
 			 const struct snd_soc_component_driver *component_driver,
 			 struct snd_soc_dai_driver *dai_drv, int num_dai);
-#define snd_soc_unregister_component(dev) snd_soc_unregister_component_by_driver(dev, NULL)
-void snd_soc_unregister_component_by_driver(struct device *dev,
-			 const struct snd_soc_component_driver *component_driver);
+void snd_soc_unregister_component(struct device *dev);
 
 int soc_new_pcm(struct snd_soc_pcm_runtime *rtd);
 #ifdef CONFIG_SND_SOC_COMPRESS
diff --git a/sound/soc/soc-core.c b/sound/soc/soc-core.c
index a7313419dc5f9..406ab3620ac1d 100644
--- a/sound/soc/soc-core.c
+++ b/sound/soc/soc-core.c
@@ -1570,24 +1570,17 @@ int snd_soc_register_component(struct device *dev,
 EXPORT_SYMBOL_GPL(snd_soc_register_component);
 
 /**
- * snd_soc_unregister_component_by_driver - Unregister component using a given driver
+ * snd_soc_unregister_component - Unregister component using a given driver
  * from the ASoC core
  *
  * @dev: The device to unregister
- * @component_driver: The component driver to unregister
  */
-void snd_soc_unregister_component_by_driver(struct device *dev,
-					    const struct snd_soc_component_driver *component_driver)
+void snd_soc_unregister_component(struct device *dev)
 {
-	const char *driver_name = NULL;
-
-	if (component_driver)
-		driver_name = component_driver->name;
-
 	guard(mutex)(&client_mutex);
 
 	while (1) {
-		struct snd_soc_component *component = snd_soc_lookup_component_nolocked(dev, driver_name);
+		struct snd_soc_component *component = snd_soc_lookup_component_nolocked(dev, NULL);
 
 		if (!component)
 			break;
@@ -1595,7 +1588,7 @@ void snd_soc_unregister_component_by_driver(struct device *dev,
 		snd_soc_component_unregister_unlocked(component);
 	}
 }
-EXPORT_SYMBOL_GPL(snd_soc_unregister_component_by_driver);
+EXPORT_SYMBOL_GPL(snd_soc_unregister_component);
 
 /* Retrieve a card's name from device tree */
 int snd_soc_of_parse_card_name(struct snd_soc_card *card,
-- 
2.53.0

