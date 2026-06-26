Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazon11011030.outbound.protection.outlook.com [52.101.125.30])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 767C13D7A0C
	for <linux-sound@vger.kernel.org>; Fri, 26 Jun 2026 06:28:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.125.30
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782455290; cv=fail; b=ZsL7gabX+QNxLIoarWX+TdxQGs1WQxmNw1a+cqOBmYfSJfQoQnitFPpMjImGtwEN+RGf/TnE/f5p8eoOYkwD9YWixffnbduZ633C4VnX23+0qBz3fDEx8HT+GicPkRBG6f7UF2pwoS6lLTHryvgeuXk3QlQsCYW79yFtpsEqubk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782455290; c=relaxed/simple;
	bh=pgUwAP9LRzLVkG47UGPsz0n5jGhJGijXVRtDor6vt5k=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=s+v7jzzLGVZ7bCB+5uKLLtFBbyDiK82slkvNGZmOuZEI/jod20pbqwfJ5Ttjyf/kLoZspsrPj5EZw+RPRPAH8ht3UNLKjssZMQ/eYqb5l4mcKbJD1puPwF9hieOXcQ+kICH4HRZ5mJD6SUhN4WlUoqGK5Y7HcmYb/h9YqkBy23A=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=JSMTN7yR; arc=fail smtp.client-ip=52.101.125.30
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="JSMTN7yR"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oUQyJdFe7T/+P4vfbg6689Nn6uPD0aYT0R/REYQ9IfWwtv2PzO1Q/jV8q76vYbAUXP9weZ1wwfHabbca5ua4JDd2cj4TtI7+R8Hm6K1tz/GTRJW24FvjK0vDGXjLQigV4vc5BCgNdwTxPYPucQEQz+xDexz2fzixR5NFyk3u39PSbm7bdvC4meLl0umQn/uXL4pjgzq4Lrcn8bG2BVQG69BdMqand1DR3xxBSjspCvbOBNfPJzhIjuYBzrIfgNy/oEr4lW89WHnibix4j54hvKy6lYO3SXYjLL0csh4Sf7yxiVuVb0FqY18+cQQ0/WKvv2jgchPpBI6uF7IWQbFiYA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2DLFNSIF9PRoy3PK5Pa6VfOJT2NVRlbEMzUPmbAly/s=;
 b=GZ8t0ArN8T5YjvgIVNJuSfm8A4IiU37SSElTJxpSRR/Sen27qShYk5/Qxl11yFZ0HU11RteKXSgL9kb3T5yRGC5tlQajLvTp04rD89okd+CxVTLamZF8ttQypMpR468J2zI6Y5Mp/7YFrekip5/RJTIo+xedXHLm4C4Nuw8GfWrJETOtQrIUJOqY8Z5V7JM75T8Jbc0JHSrBIimeemqmx4hIRUlbmeN5jr478L2CqzVs+A29UbR9vzu9M7aBhhbOMAMtQm0mLZXcJIEuZZA0lvQ0AFlORLvm9N8rD6b7zeeFG2kBRzeobYtO1UOw671Z3HLxvCttruyU40+G+E6iOA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2DLFNSIF9PRoy3PK5Pa6VfOJT2NVRlbEMzUPmbAly/s=;
 b=JSMTN7yRHMP+540nyB6EofrMOjWOLQoNr2vDbLC+38UrbeXnej6OiPjmbDWl+eDM9s027DW4vZiKPr878P9ufjP1KCj6Kc80kp6BjlUaOYfWKXw0NqOu+Pc/+ZzqAWPzjJJsxAoCTVy6p9MpowFBK4m9p3s/534FzmAmXevrvkE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TY3PR01MB11797.jpnprd01.prod.outlook.com (2603:1096:400:373::8)
 by OS9PR01MB15751.jpnprd01.prod.outlook.com (2603:1096:604:3bd::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.159.16; Fri, 26 Jun
 2026 06:28:06 +0000
Received: from TY3PR01MB11797.jpnprd01.prod.outlook.com
 ([fe80::1868:c915:c230:a383]) by TY3PR01MB11797.jpnprd01.prod.outlook.com
 ([fe80::1868:c915:c230:a383%5]) with mapi id 15.21.0159.015; Fri, 26 Jun 2026
 06:28:06 +0000
Message-ID: <874iiperyi.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 02/12] ASoC: simple-card: merge extra method into simple_parse_of()
User-Agent: Wanderlust/2.15.9 Emacs/30.2 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <877bnlerz1.wl-kuninori.morimoto.gx@renesas.com>
References: <877bnlerz1.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Fri, 26 Jun 2026 06:28:06 +0000
X-ClientProxiedBy: TYCP286CA0252.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:456::10) To TY3PR01MB11797.jpnprd01.prod.outlook.com
 (2603:1096:400:373::8)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY3PR01MB11797:EE_|OS9PR01MB15751:EE_
X-MS-Office365-Filtering-Correlation-Id: fe7ceeda-fe1d-47ca-f0cb-08ded34c154d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|376014|52116014|23010399003|38350700014|22082099003|18002099003|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info:
	y3ufP1JZH6DczbZiVzHTRWDA3C+Wq5ei0ZsUnexzlkD8+xWPEG96T353r6deCKxnM1wZzA1nVdZyRxEawIn44vn9sC/4w7b+LEsXNHG4jvJxuu+PnDsr/EQbcr0HaFZKTYnVHU1DNXDiRhuO7snSiEhOfDVL3lRXXfnAL0ToZUlUT+PsboJlVSsZB2v1PeUnrfrTc3OyPwvZbl2hT41gVGo5UTfjxuDqKnJunRLy4jFYf4GK+S+lFGobe1AVPN+SEKf9vopuXqq0aV5pPZLbJk0fJcz0ZLDX3LvWeMPX9bEs56mH8npARABZ5eV4NYoAxXZIRpBHf9l+WlvKCZVNowJC+QEo0yDanJzZTdnALKOAuq9zt8bQNmcbGfRwPDMF4Vtn23CBRb4cntA7wf8TKyW3+ewGgXGXSa0g87X+oeggzzVxL/oJgaO5MsN9gQ/jMFszWfcYlzApWMy5dHRcpHMOf8wY+jSNGrZtulg6aNzvWk2U41s6AGdEnbs8ejbK5wVr/0CQATqJN1ZDE2kwMgvgj7a5Tv7SdUh9+99BFbcrRWNJoHq/G1fMuSgdYu79P3aqA9FDo+/nIbILdofM771Go3I21A6KGcQfF0HzsENQfiiZjjwoPlyzqqEtKoQn99YTpJAABepswcP9IwtTh5vAbrFiEEHki0CyzuoZalhrvtiFoejBTbjzOKgyWiVkQ2lm6oIdqJR5SE60qDm6MIK6xC1K6skJkRAGhY5mhOo=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11797.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(52116014)(23010399003)(38350700014)(22082099003)(18002099003)(56012099006)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?8CuDK/UMs1NOacyVFUDM1/0+eKHDKmIND9MyLOXdAJwxsFVv3l+fckO/3xKm?=
 =?us-ascii?Q?wH01z4Pbdrhs4pzFR2pduZyfJtCZC0eUruJoq+WtZzmrk8L59dyfVd1AB4Ei?=
 =?us-ascii?Q?FLjzmiB+1t7lU+nkNU1qxYnC7QgbWmdhAwGwRLIfiUWoTLZ6OI/dJhirUnVj?=
 =?us-ascii?Q?omDlu5NiduAiAZFPeIWjMTh6ZgCGn5oe29ZSGDFRHu+/06DJDINtzuhRh79v?=
 =?us-ascii?Q?5L+ruLqxUMfE6zqP7btLi5uywStLW3uD24HZzDlb7LYUG7GboSKoRw4y3qJW?=
 =?us-ascii?Q?3yN2vrH6qD1K7DwY2KbWu7H2HkkHxvdjc6R5pO7UZVCPP69f+7hOaj2oL0hj?=
 =?us-ascii?Q?m6HqiUUroZStThS6cijIr623OZYaVMRDC7hhutYeRc05QYrOMAwKrWUKKnCQ?=
 =?us-ascii?Q?IBncYamhsdC6HMXt4KYDwtRbCJ6HLEXsi/twk88m0qXDwLl9DQc9wNBnV2hI?=
 =?us-ascii?Q?2oUYP6+0Mp1FDO/IVU6nZMjRM0d7MOY58Xjo+Ttf736UK6stbJZeutRbpjG/?=
 =?us-ascii?Q?zgcQ0KYgeWKu6fHLI+Ha/joMtBjwyvFozaUTx2a6eQOAo9aLHcR342kv35VO?=
 =?us-ascii?Q?n4/pCr41jnaHdChUo8Gt8yIy+ctTwxLs26eL7bglBUwKWQ9sWm/WHHh0iTt2?=
 =?us-ascii?Q?P2hcjTVUjZa3IXmEvxIAtWt8noSg5uTxbaUAlwRw9MbZ+RLORP5rSHhPw+J9?=
 =?us-ascii?Q?gQuKQQd/B7XvhX3X9gmYdfoMqgRXWWR3Q0e/8XhHHbZ6KYDxbpMVabICxwp6?=
 =?us-ascii?Q?2FXhJSX/yg9mTl0xXbiggGHyH6VAwIYa2s3/Xdc0RfBs6ugnOv2ovjQeVZqp?=
 =?us-ascii?Q?xljKBjHs3UZjPEvS44fdph4Y4jtuyfOEcG0ZICGoiarLvYcuMbonFC42X7fH?=
 =?us-ascii?Q?uTcnK6nLGy9QIvoMx7zpZl4AeuhzyTNk07/1bmT1T4+LqRbjW/i3ARNDMZ6k?=
 =?us-ascii?Q?Gkryn2raw9jc70bA/YWffJDjglkHll4/sadesLblFtHuT74RV7TuBRQgO85K?=
 =?us-ascii?Q?ogVAYIB6PbVSSEd18X6hwEdoEuPV3L8+1zhTKIOnDi+8kpaQTV4imoXdPmf5?=
 =?us-ascii?Q?aWa28oi74w5sx/kN/1tIWDQvpMhIl20oUAjadjvaJbw8IvdzburBK4cspde5?=
 =?us-ascii?Q?MQFTPVu7w92PP4QMwU+W5d9BC9WbtC2QIeGduI48Glht9D42YAVWgeB1BkgW?=
 =?us-ascii?Q?NMxu2sMfPIvfwEbtJAE7O6U3yv+LIZowx5YMXUNebkIAjeo92MUBBB4n8OFm?=
 =?us-ascii?Q?Za/8WJA6ays0annFdXsrrsBq/3DC7mFj6ss2DHk76S6uvHxc6v7ojpA/Klzu?=
 =?us-ascii?Q?KTaMUSOscvoGfj75MtyhDDRZ+s/K/xfAOZvVaBJ00P0VGPoploNS50Kfyt5C?=
 =?us-ascii?Q?u14RBOIvl4iEETJlYEqIGxeV6bw2LQuuT/zdiV9zZ/iZgsUjGt2HpNuRbdI8?=
 =?us-ascii?Q?uylMNNNByYyegx3+/4VHTBGWpvsvS/U+lmUCoBTEBrKb93plYogt2l4cSHL8?=
 =?us-ascii?Q?pvxpfexCTsF38+/+En5IFA466Co76YhXoUtInx0z/qT5hprQF8KSWJLREWom?=
 =?us-ascii?Q?lsuxVhjI7dl5lrS4qoN/G3Cg3oJ1v03hya3YH7IhdYcEXbEd0PxulTDpFVpg?=
 =?us-ascii?Q?SrXNuCDbt41xIFA9tzw2OgZuIjNW5YHkPb6Yd2sw9pQz9TtQMl0xM4QtHALi?=
 =?us-ascii?Q?H1Q0KoGDwTua/y5my68LdmgGgJTEf/zD8WUZPX3ck7t3lF0afF797dt5xI7+?=
 =?us-ascii?Q?Va66eT8JhDoUjvjmukW18t4S/EcXrEFMc6i8OJcGVyShggusUyrq?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fe7ceeda-fe1d-47ca-f0cb-08ded34c154d
X-MS-Exchange-CrossTenant-AuthSource: TY3PR01MB11797.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jun 2026 06:28:06.3025
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mDjNj2zpMLRsQx0+k8mHiFq/MhiF3p8aM928n/mld/qC2AqFNu2Nd2H8al2Zft4NE1wscnym68Kf/TR83w3f4j/JXY/PSPFyVia9fZPUO1FDLXNvsapytsriNIzmBI9a
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS9PR01MB15751

Current simple_probe() calls many code before/after simple_parse_of().
This is because it had supported platform style probe, but is no longer
exist.

We can merge all into simple_parse_of(), same as Audio Graph Card/Cars2.
No functional change.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/generic/simple-card.c | 82 ++++++++++++++++-----------------
 1 file changed, 40 insertions(+), 42 deletions(-)

diff --git a/sound/soc/generic/simple-card.c b/sound/soc/generic/simple-card.c
index 456b7ebeb068f..20e6edd1d7d39 100644
--- a/sound/soc/generic/simple-card.c
+++ b/sound/soc/generic/simple-card.c
@@ -666,10 +666,31 @@ static int simple_soc_probe(struct snd_soc_card *card)
 	return simple_ret(priv, ret);
 }
 
-static int simple_parse_of(struct simple_util_priv *priv, struct link_info *li)
+static int simple_parse_of(struct simple_util_priv *priv)
 {
 	struct snd_soc_card *card = simple_priv_to_card(priv);
-	int ret;
+	struct device *dev = card->dev;
+	int ret = -EINVAL;
+
+	if (!dev)
+		goto end;
+
+	ret = -ENOMEM;
+	struct link_info *li __free(kfree) = kzalloc_obj(*li);
+	if (!li)
+		goto end;
+
+	ret = simple_get_dais_count(priv, li);
+	if (ret < 0)
+		goto end;
+
+	ret = -EINVAL;
+	if (!li->link)
+		goto end;
+
+	ret = simple_util_init_priv(priv, li);
+	if (ret < 0)
+		goto end;
 
 	ret = simple_util_parse_widgets(card, PREFIX);
 	if (ret < 0)
@@ -689,17 +710,30 @@ static int simple_parse_of(struct simple_util_priv *priv, struct link_info *li)
 				   simple_dai_link_of,
 				   simple_dai_link_of_dpcm);
 	if (ret < 0)
-		goto end;
+		goto err;
 
 	ret = simple_util_parse_card_name(priv, PREFIX);
 	if (ret < 0)
-		goto end;
+		goto err;
 
 	ret = simple_populate_aux(priv);
 	if (ret < 0)
-		goto end;
+		goto err;
 
 	ret = snd_soc_of_parse_aux_devs(card, PREFIX "aux-devs");
+	if (ret < 0)
+		goto err;
+
+	snd_soc_card_set_drvdata(card, priv);
+
+	simple_util_debug_info(priv);
+
+	ret = devm_snd_soc_register_card(dev, card);
+err:
+	if (ret < 0) {
+		simple_util_clean_reference(card);
+		return dev_err_probe(dev, ret, "parse error\n");
+	}
 end:
 	return simple_ret(priv, ret);
 }
@@ -709,7 +743,6 @@ static int simple_probe(struct platform_device *pdev)
 	struct simple_util_priv *priv;
 	struct device *dev = &pdev->dev;
 	struct snd_soc_card *card;
-	int ret;
 
 	/* Allocate the private data and the DAI link array */
 	priv = devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
@@ -722,42 +755,7 @@ static int simple_probe(struct platform_device *pdev)
 	card->probe		= simple_soc_probe;
 	card->driver_name       = "simple-card";
 
-	ret = -ENOMEM;
-	struct link_info *li __free(kfree) = kzalloc_obj(*li);
-	if (!li)
-		goto end;
-
-	ret = simple_get_dais_count(priv, li);
-	if (ret < 0)
-		goto end;
-
-	ret = -EINVAL;
-	if (!li->link)
-		goto end;
-
-	ret = simple_util_init_priv(priv, li);
-	if (ret < 0)
-		goto end;
-
-	ret = simple_parse_of(priv, li);
-	if (ret < 0) {
-		dev_err_probe(dev, ret, "parse error\n");
-		goto err;
-	}
-
-	snd_soc_card_set_drvdata(card, priv);
-
-	simple_util_debug_info(priv);
-
-	ret = devm_snd_soc_register_card(dev, card);
-	if (ret < 0)
-		goto err;
-
-	return 0;
-err:
-	simple_util_clean_reference(card);
-end:
-	return dev_err_probe(dev, ret, "parse error\n");
+	return simple_parse_of(priv);
 }
 
 static const struct of_device_id simple_of_match[] = {
-- 
2.53.0

