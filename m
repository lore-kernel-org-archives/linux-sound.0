Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazon11010022.outbound.protection.outlook.com [52.101.229.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE3343FCB32
	for <linux-sound@vger.kernel.org>; Tue, 21 Jul 2026 01:37:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.229.22
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784597825; cv=fail; b=mi1tGd5JOktkA7k93SJsTGqit1cia0YJ7boh7axi1Y8kcnUAYmPIM04yYRaUOKmhnr5thYgaq4yDTGQclYtAWDMFjMvNuVvD/B95hS+MjfO/8gAxf2d0sFQfgwNrmxUD6BWJdD4ITH5E3iaAo+yFUrMfv8dbgvlqaaYljk+YJXc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784597825; c=relaxed/simple;
	bh=/Mh6LT7C8RK+UyGHL57W9ADEjdOWyx6swdMrX/FX+f0=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=vCij7Y7NZgXlPYUPAL5nklHInoTYa4IHk09K56gYTVD/GBOkrFoBNQ5t8BKwxyXYsGLifBGlVH7ZPkVGEvPskwdvz88nl/QeJ2a7f88DgtWuYTKTFiwGSdyP7oAJBoBkKP+6tKG6qgnN73D6khUpS64iiELbJqaLuz3+NvuZLYo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=jBE0zFnr; arc=fail smtp.client-ip=52.101.229.22
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="jBE0zFnr"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QyiFQ7Ue+oNZqgph/HEWBk8KGsve9YpKNTHefaiJ+g6kqDzJVsu/HDahmQlPslmlzxRpvpX+bxyFBnb4B749Vc7sOUZrvmxvgiO1k8uAt4xREk26mvMOuwSiWFd3gYwc47+JJoS1pOB06lO+zDN2Xw5Dx1HX9sEWsUQiQcp5Qruye0cueWbPqi/9I5Nl4VmpyiQW4+cSn9pCTp8eD8d32JazEh+HM/aXBj6LOxtpo2fXtFfZyLd9otTX9cjcQfGSdWzeQQzFZ6wYtNzuU7FPYpDZzRtYt1GzML9r6mNT7IvOeeR+vDRCWx06uJsD9NY/4xRvQdk4/PtXUWCGxjzoFQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IXXx92mMW+pDIOpVitvxWQ5g9neOaFU/MHGPHMU4aFg=;
 b=PvnkFmjR/NgojS4je1E46ZFfZOTGFyW+AFV7ajY5Qaj29MgbZUgYSsmh2QTizu9DViYitOa4Rvhvvu7Yb1Ps/QMrUonzKhSBvKKq5qf0ExDdRP70+eWf8BU1y2UO7/Z4Ep5xw/S6NTzvdOcmA760k+8+FUkyPDrOITDDkGEevJoSrmuqiM2F4Lvfcg1YmnFlSsNOxOXltTOKT6F5lG0n5dLNq4+p1K3hPOUNjobM+v2+ZGg7EDxHQDXT8YNmw7pDkU46zpotsXFZu8HjhgMwFCWVbiAbMmJ3uaQrXjXK3lZ3IlEd5zAKiNSIzplwru/vEV5hrfkR1XaJIaOQdHVzpQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IXXx92mMW+pDIOpVitvxWQ5g9neOaFU/MHGPHMU4aFg=;
 b=jBE0zFnrJZybA31FmGJRRdZd0lMlBQ9eE5Bl3JENa/7B0WxILTSYcr2MHE5KP5NjRWOo1IjVYdtDtJjAImHr8uA3D1f4l4mEYkJJBbH2XjNfQtKYxzuVxMH1DJhTFZogyhXQaTJagy2YfAbU0PtA9CZ30t95oalv6E9Zj1amOiE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TY3PR01MB11797.jpnprd01.prod.outlook.com (2603:1096:400:373::8)
 by TYYPR01MB13531.jpnprd01.prod.outlook.com (2603:1096:405:1c4::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.223.15; Tue, 21 Jul
 2026 01:36:59 +0000
Received: from TY3PR01MB11797.jpnprd01.prod.outlook.com
 ([fe80::1868:c915:c230:a383]) by TY3PR01MB11797.jpnprd01.prod.outlook.com
 ([fe80::1868:c915:c230:a383%4]) with mapi id 15.21.0223.017; Tue, 21 Jul 2026
 01:36:59 +0000
Message-ID: <87se5di0n8.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 2/2] ASoC: meson: meson-card: use priv instead of card on each functions
To: Jaroslav Kysela <perex@perex.cz>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Kevin Hilman <khilman@baylibre.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Takashi Iwai <tiwai@suse.com>
Cc: linux-arm-kernel@lists.infradead.org,
	linux-sound@vger.kernel.org
In-Reply-To: <87v7a9i0o8.wl-kuninori.morimoto.gx@renesas.com>
References: <87v7a9i0o8.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 21 Jul 2026 01:36:59 +0000
X-ClientProxiedBy: TY4P286CA0002.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:405:26d::19) To TY3PR01MB11797.jpnprd01.prod.outlook.com
 (2603:1096:400:373::8)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY3PR01MB11797:EE_|TYYPR01MB13531:EE_
X-MS-Office365-Filtering-Correlation-Id: 065eff50-8d62-4a98-ea2f-08dee6c88ec4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|7416014|376014|23010399003|366016|1800799024|38350700014|56012099006|11063799006|10067099003|18002099003|22082099003|3023799007;
X-Microsoft-Antispam-Message-Info:
	vvZBjXNid5YtdT0RjQEC5MnJ7LZ+fObKLvJe1CJ2s2LRSn/xH0qFpTCByT3rRlSVKrNnF/Xuzir/2rDhzVn2yIL9EVXBv2VDrFtH/fqL44oelP53lAr9UzcjX/jTdcSF9Lm5h6OPD6M8JxbGikmdvfXXUpD4dCstolMUfR2O6rn69XJwkOsyoVngfVUZCXxEOzX5OJoAGLII6XTO+TgReVGeJdI/23pJyMKJVoF9SaLsD1GNInMG0S1YZsnOiWJ6icEEWKLTbtEO5+8yISlCjWnhZZ5ThsfE5j1IJt1c6W4bqs7AXZAMADeXKKjPeV8NiRVMjvpTrl4AXhtl4tcMzRjyCA/IxY5FYoHQGGzDXW/52+fg7RXnftE+aqT1bvuvR2CzQXPPKbRDHy080DjHXA0JnnIm0qlioEP8e7Cj01V/AF1naFlEjRy738RKFd7cZPu1R8kQpoBw+lMKgcAxmyKKKJfhDR2nABFF+b4DwS/v9lHkAFqTxCBdqHa4zI/vuHiEbX0I1gVAND7Pk4GHG0FiWLPHczS1dkW+y7rCjT6YofHOOUG7bm1hlgTgHeqIggU5uhTPO0EA9nxkQq2u6jMZ1CO9ICavSL6D+TYONZ/Vy9cCEeefYtB92ut8SOO9CbdaMp6a3tpWdvbORhax4hzt1UsexSawyplxCcrMOykrZPMKKg1Spi20u7kPLkrfPwC2FXu6mm0Xic7fhYtymvnCuClvR8ZJEIBzuhJav34=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11797.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(7416014)(376014)(23010399003)(366016)(1800799024)(38350700014)(56012099006)(11063799006)(10067099003)(18002099003)(22082099003)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?zB6MITB6VReGryKZeQp+eA97mCMAkfFYOf/aXy0ol0MOihG5euNSoAAkH4Od?=
 =?us-ascii?Q?H6vDyqp4EWfnUuus2fyDq8jbCthOQqY4qakZbPlOnjult4VRUlNJqD7kTbc5?=
 =?us-ascii?Q?7vAFeX0eAl6AlSNn7PK75gAy9LxVuro9LQbKzOiFdCmF2MxI/zdDc/eDdr+l?=
 =?us-ascii?Q?mPM2O5JKCOY98lEO14R1BHBBA3Z2X3+yJws6Ih0oZcbo4PXMNkXzmsRZG6uz?=
 =?us-ascii?Q?/KopOVD1QOiyBVlw4ZvHEE0RPaBOqQ/b89ckTF/Vrqb2KL7VjP1by/9JT/08?=
 =?us-ascii?Q?PTR1aANuFE82Vx6UiIPwFCrC9l+oHx5CW2MWJdUYhtItdX0KciXpBPwg/1QY?=
 =?us-ascii?Q?nBAEibFXsvSgwCWZ74AiP6pAMJqjPUeGfj+cPQcGmEHno9ojxDOyPJD6q971?=
 =?us-ascii?Q?wxn69/xqQcOtzCQPtyKc/CLdABSEELJq1ayswMJayJZwvr88kk3J2CIM/+dS?=
 =?us-ascii?Q?vTNXaAYAInerw818VJm0G6k6FF3pjFg6fiFGWxd7yUqfx9zb/nltcZdaBC2M?=
 =?us-ascii?Q?xtmh7Vgpn9VYfHGKC1pbGY+BsKj7EUJbQ2dB9t9F+0+ODBpZp6JlrqAHHIuW?=
 =?us-ascii?Q?59I2D+BS2AW/0qDhHFH2ngev18H3hkzD+lcZwzUTPkLClrTqvGQPDjhWn2g6?=
 =?us-ascii?Q?l+jNAFR4Z8ARJW9nC5FyUFMc9hM+uov/ALo4oKWLutpLqDX79TC92bWciBmf?=
 =?us-ascii?Q?328N3VqJvKeIOxExGwx9FFHI9dhQy1oke8ij5QQ0hkTfdsz3R+5SKtfMCEpk?=
 =?us-ascii?Q?OXNqWJbXYPizvsamye6IH1EOWOX8MjZUt6fTSL8zAjpvIsQnjAPnTRHC+a80?=
 =?us-ascii?Q?mehdfSOzwjmEV3DGjFWfGTdUNaR806dV4J9e1ynKVFkzOMbI0uZDneahEQdp?=
 =?us-ascii?Q?E3fDqHfrNm0UCyJFWKPr0gPuKKU8ZM1LCP+lmjN3t0lmNJXs9yF9n2Eo7Lvq?=
 =?us-ascii?Q?eJMpcPP1Np278a+vfuWHtlSB0VhpUw+yT9sqXtQa26n7AvlFvFDrBQiFdMJ2?=
 =?us-ascii?Q?plWlTPdoOIL78o5SPALFtUH2TPpf2HLmnXKH9OTF5+bRCccQCGEFATpHcoVP?=
 =?us-ascii?Q?nb8jIW5raERwWFMXdmjqKU6xC3WuSJ+XwQTGedrBztGAc2WAqK0rUOpCtMQB?=
 =?us-ascii?Q?Kj3xhVRESh4a6+UnoLw6M8ARvNNkH3EDhj2gpa0UolZxqbGbOzv8+gFs/Vqi?=
 =?us-ascii?Q?If4fBY7Rh4eNApTU1eZH6BY0/TevVK9+n0vuHokK1KixAUpmN/E+M7xvX7ga?=
 =?us-ascii?Q?xRg7KhU4M9laWWrpTO66FpY1dLfIBHUyKUwGz4+XXx3zFmmLRpfhXuL7IPwI?=
 =?us-ascii?Q?6WuxSJVfZmEJG5f+PP8vreNEN0ADXC4jdhqHE/kpcI9TKe7Andjk6tU6QfkP?=
 =?us-ascii?Q?z9+2N/GWGZMGiV5Uwa6scP4JfG2e6veorMjlHPZIfeOt1gKMVE7M0w0Vc5SU?=
 =?us-ascii?Q?s5kbsaCeZMFrvt3eTvpn7UCVI6Izehxh2GQ5VmaM4tf8Jm7ehw23M324BpwL?=
 =?us-ascii?Q?7BGxBIHRWz8VqzSyCYTemBAW66gYJLP8NzRz/CS47HZE2oLK4dn560EmEJZA?=
 =?us-ascii?Q?NknVFNZOfu1hOZTfpiBZJ1LLbCwe835gfqKzp6AkEXozEnNrJApwJ0XDpuXM?=
 =?us-ascii?Q?Pnb02xiwwVnKA08SEsEfVh81Pq+NwCFmQVB9HhyvdClHxqtuiayCPM3n48UG?=
 =?us-ascii?Q?yQTucwexNiDa3lpDGe325Mxd4DyxoEJHIBgAx1HlZo+nFsDN/VCyAY/yQQaI?=
 =?us-ascii?Q?97/HGak/CqQRWHaKzVKxt0ewnStDT+QESxFl4Fyv268WuUqRYais?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 065eff50-8d62-4a98-ea2f-08dee6c88ec4
X-MS-Exchange-CrossTenant-AuthSource: TY3PR01MB11797.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jul 2026 01:36:59.7635
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QH3vx+J3VT+JvwpI1J//P59ohbrIKgQ+sUknQTlzSH5pOTHDq3v91Uq4vrtblfeAPkx2RjKK3JWB1O8tY1+nMISnNWk8g53tARi9jXbD4GjFV91dxS51qAmSWt7qxFII
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYYPR01MB13531

We can get card via priv->card, use priv for function param.
No functional change, but is preparation for Card capsuling.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/meson/axg-card.c         | 63 ++++++++++++++++--------------
 sound/soc/meson/gx-card.c          | 23 +++++------
 sound/soc/meson/meson-card-utils.c | 58 ++++++++++++++-------------
 sound/soc/meson/meson-card.h       | 11 +++---
 4 files changed, 82 insertions(+), 73 deletions(-)

diff --git a/sound/soc/meson/axg-card.c b/sound/soc/meson/axg-card.c
index b4dca80e15e40..3d345dc33cb6f 100644
--- a/sound/soc/meson/axg-card.c
+++ b/sound/soc/meson/axg-card.c
@@ -100,28 +100,28 @@ static int axg_card_tdm_dai_lb_init(struct snd_soc_pcm_runtime *rtd)
 	return 0;
 }
 
-static int axg_card_add_tdm_loopback(struct snd_soc_card *card,
+static int axg_card_add_tdm_loopback(struct meson_card *priv,
 				     int *index)
 {
-	struct meson_card *priv = snd_soc_card_get_drvdata(card);
 	struct snd_soc_dai_link *pad;
 	struct snd_soc_dai_link *lb;
 	struct snd_soc_dai_link_component *dlc;
+	struct device *dev = priv->card.dev;
 	int ret;
 
 	/* extend links */
-	ret = meson_card_reallocate_links(card, card->num_links + 1);
+	ret = meson_card_reallocate_links(priv, priv->card.num_links + 1);
 	if (ret)
 		return ret;
 
-	pad = &card->dai_link[*index];
-	lb = &card->dai_link[*index + 1];
+	pad = &priv->card.dai_link[*index];
+	lb = &priv->card.dai_link[*index + 1];
 
-	lb->name = devm_kasprintf(card->dev, GFP_KERNEL, "%s-lb", pad->name);
+	lb->name = devm_kasprintf(dev, GFP_KERNEL, "%s-lb", pad->name);
 	if (!lb->name)
 		return -ENOMEM;
 
-	dlc = devm_kzalloc(card->dev, sizeof(*dlc), GFP_KERNEL);
+	dlc = devm_kzalloc(dev, sizeof(*dlc), GFP_KERNEL);
 	if (!dlc)
 		return -ENOMEM;
 
@@ -153,18 +153,19 @@ static int axg_card_add_tdm_loopback(struct snd_soc_card *card,
 	return 0;
 }
 
-static int axg_card_parse_cpu_tdm_slots(struct snd_soc_card *card,
+static int axg_card_parse_cpu_tdm_slots(struct meson_card *priv,
 					struct snd_soc_dai_link *link,
 					struct device_node *node,
 					struct axg_dai_link_tdm_data *be)
 {
+	struct device *dev = priv->card.dev;
 	char propname[32];
 	u32 tx, rx;
 	int i;
 
-	be->tx_mask = devm_kcalloc(card->dev, AXG_TDM_NUM_LANES,
+	be->tx_mask = devm_kcalloc(dev, AXG_TDM_NUM_LANES,
 				   sizeof(*be->tx_mask), GFP_KERNEL);
-	be->rx_mask = devm_kcalloc(card->dev, AXG_TDM_NUM_LANES,
+	be->rx_mask = devm_kcalloc(dev, AXG_TDM_NUM_LANES,
 				   sizeof(*be->rx_mask), GFP_KERNEL);
 	if (!be->tx_mask || !be->rx_mask)
 		return -ENOMEM;
@@ -191,7 +192,7 @@ static int axg_card_parse_cpu_tdm_slots(struct snd_soc_card *card,
 
 	/* ... but the interface should at least have one direction */
 	if (!tx && !rx) {
-		dev_err(card->dev, "tdm link has no cpu slots\n");
+		dev_err(dev, "tdm link has no cpu slots\n");
 		return -EINVAL;
 	}
 
@@ -207,7 +208,7 @@ static int axg_card_parse_cpu_tdm_slots(struct snd_soc_card *card,
 		 * Error if the slots can't accommodate the largest mask or
 		 * if it is just too big
 		 */
-		dev_err(card->dev, "bad slot number\n");
+		dev_err(dev, "bad slot number\n");
 		return -EINVAL;
 	}
 
@@ -216,14 +217,15 @@ static int axg_card_parse_cpu_tdm_slots(struct snd_soc_card *card,
 	return 0;
 }
 
-static int axg_card_parse_codecs_masks(struct snd_soc_card *card,
+static int axg_card_parse_codecs_masks(struct meson_card *priv,
 				       struct snd_soc_dai_link *link,
 				       struct device_node *node,
 				       struct axg_dai_link_tdm_data *be)
 {
 	struct axg_dai_link_tdm_mask *codec_mask;
+	struct device *dev = priv->card.dev;
 
-	codec_mask = devm_kcalloc(card->dev, link->num_codecs,
+	codec_mask = devm_kcalloc(dev, link->num_codecs,
 				  sizeof(*codec_mask), GFP_KERNEL);
 	if (!codec_mask)
 		return -ENOMEM;
@@ -242,17 +244,17 @@ static int axg_card_parse_codecs_masks(struct snd_soc_card *card,
 	return 0;
 }
 
-static int axg_card_parse_tdm(struct snd_soc_card *card,
+static int axg_card_parse_tdm(struct meson_card *priv,
 			      struct device_node *node,
 			      int *index)
 {
-	struct meson_card *priv = snd_soc_card_get_drvdata(card);
-	struct snd_soc_dai_link *link = &card->dai_link[*index];
+	struct snd_soc_dai_link *link = &priv->card.dai_link[*index];
 	struct axg_dai_link_tdm_data *be;
+	struct device *dev = priv->card.dev;
 	int ret;
 
 	/* Allocate tdm link parameters */
-	be = devm_kzalloc(card->dev, sizeof(*be), GFP_KERNEL);
+	be = devm_kzalloc(dev, sizeof(*be), GFP_KERNEL);
 	if (!be)
 		return -ENOMEM;
 	priv->link_data[*index] = be;
@@ -264,19 +266,19 @@ static int axg_card_parse_tdm(struct snd_soc_card *card,
 
 	of_property_read_u32(node, "mclk-fs", &be->mclk_fs);
 
-	ret = axg_card_parse_cpu_tdm_slots(card, link, node, be);
+	ret = axg_card_parse_cpu_tdm_slots(priv, link, node, be);
 	if (ret) {
-		dev_err(card->dev, "error parsing tdm link slots\n");
+		dev_err(dev, "error parsing tdm link slots\n");
 		return ret;
 	}
 
-	ret = axg_card_parse_codecs_masks(card, link, node, be);
+	ret = axg_card_parse_codecs_masks(priv, link, node, be);
 	if (ret)
 		return ret;
 
 	/* Add loopback if the pad dai has playback */
 	if (!link->capture_only) {
-		ret = axg_card_add_tdm_loopback(card, index);
+		ret = axg_card_add_tdm_loopback(priv, index);
 		if (ret)
 			return ret;
 	}
@@ -305,14 +307,15 @@ static int axg_card_cpu_is_codec(struct device_node *np)
 		of_device_is_compatible(np, DT_PREFIX "g12a-toacodec");
 }
 
-static int axg_card_add_link(struct snd_soc_card *card, struct device_node *np,
+static int axg_card_add_link(struct meson_card *priv, struct device_node *np,
 			     int *index)
 {
-	struct snd_soc_dai_link *dai_link = &card->dai_link[*index];
+	struct snd_soc_dai_link *dai_link = &priv->card.dai_link[*index];
 	struct snd_soc_dai_link_component *cpu;
+	struct device *dev = priv->card.dev;
 	int ret;
 
-	cpu = devm_kzalloc(card->dev, sizeof(*cpu), GFP_KERNEL);
+	cpu = devm_kzalloc(dev, sizeof(*cpu), GFP_KERNEL);
 	if (!cpu)
 		return -ENOMEM;
 
@@ -320,17 +323,17 @@ static int axg_card_add_link(struct snd_soc_card *card, struct device_node *np,
 	dai_link->num_cpus = 1;
 	dai_link->nonatomic = true;
 
-	ret = meson_card_parse_dai(card, np, dai_link->cpus);
+	ret = meson_card_parse_dai(priv, np, dai_link->cpus);
 	if (ret)
 		return ret;
 
 	if (axg_card_cpu_is_playback_fe(dai_link->cpus->of_node))
-		return meson_card_set_fe_link(card, dai_link, np, true);
+		return meson_card_set_fe_link(priv, dai_link, np, true);
 	else if (axg_card_cpu_is_capture_fe(dai_link->cpus->of_node))
-		return meson_card_set_fe_link(card, dai_link, np, false);
+		return meson_card_set_fe_link(priv, dai_link, np, false);
 
 
-	ret = meson_card_set_be_link(card, dai_link, np);
+	ret = meson_card_set_be_link(priv, dai_link, np);
 	if (ret)
 		return ret;
 
@@ -340,7 +343,7 @@ static int axg_card_add_link(struct snd_soc_card *card, struct device_node *np,
 	} else {
 		dai_link->no_pcm = 1;
 		if (axg_card_cpu_is_tdm_iface(dai_link->cpus->of_node))
-			ret = axg_card_parse_tdm(card, np, index);
+			ret = axg_card_parse_tdm(priv, np, index);
 	}
 
 	return ret;
diff --git a/sound/soc/meson/gx-card.c b/sound/soc/meson/gx-card.c
index b408cc2bbc919..c0cbf31f28db5 100644
--- a/sound/soc/meson/gx-card.c
+++ b/sound/soc/meson/gx-card.c
@@ -41,16 +41,16 @@ static const struct snd_soc_ops gx_card_i2s_be_ops = {
 	.hw_params = gx_card_i2s_be_hw_params,
 };
 
-static int gx_card_parse_i2s(struct snd_soc_card *card,
+static int gx_card_parse_i2s(struct meson_card *priv,
 			     struct device_node *node,
 			     int *index)
 {
-	struct meson_card *priv = snd_soc_card_get_drvdata(card);
-	struct snd_soc_dai_link *link = &card->dai_link[*index];
+	struct snd_soc_dai_link *link = &priv->card.dai_link[*index];
 	struct gx_dai_link_i2s_data *be;
+	struct device *dev = priv->card.dev;
 
 	/* Allocate i2s link parameters */
-	be = devm_kzalloc(card->dev, sizeof(*be), GFP_KERNEL);
+	be = devm_kzalloc(dev, sizeof(*be), GFP_KERNEL);
 	if (!be)
 		return -ENOMEM;
 	priv->link_data[*index] = be;
@@ -76,28 +76,29 @@ static int gx_card_cpu_identify(struct snd_soc_dai_link_component *c,
 	return 0;
 }
 
-static int gx_card_add_link(struct snd_soc_card *card, struct device_node *np,
+static int gx_card_add_link(struct meson_card *priv, struct device_node *np,
 			    int *index)
 {
-	struct snd_soc_dai_link *dai_link = &card->dai_link[*index];
+	struct snd_soc_dai_link *dai_link = &priv->card.dai_link[*index];
 	struct snd_soc_dai_link_component *cpu;
+	struct device *dev = priv->card.dev;
 	int ret;
 
-	cpu = devm_kzalloc(card->dev, sizeof(*cpu), GFP_KERNEL);
+	cpu = devm_kzalloc(dev, sizeof(*cpu), GFP_KERNEL);
 	if (!cpu)
 		return -ENOMEM;
 
 	dai_link->cpus = cpu;
 	dai_link->num_cpus = 1;
 
-	ret = meson_card_parse_dai(card, np, dai_link->cpus);
+	ret = meson_card_parse_dai(priv, np, dai_link->cpus);
 	if (ret)
 		return ret;
 
 	if (gx_card_cpu_identify(dai_link->cpus, "FIFO"))
-		return  meson_card_set_fe_link(card, dai_link, np, true);
+		return  meson_card_set_fe_link(priv, dai_link, np, true);
 
-	ret = meson_card_set_be_link(card, dai_link, np);
+	ret = meson_card_set_be_link(priv, dai_link, np);
 	if (ret)
 		return ret;
 
@@ -109,7 +110,7 @@ static int gx_card_add_link(struct snd_soc_card *card, struct device_node *np,
 		dai_link->no_pcm = 1;
 		/* Check if the cpu is the i2s encoder and parse i2s data */
 		if (gx_card_cpu_identify(dai_link->cpus, "I2S Encoder"))
-			ret = gx_card_parse_i2s(card, np, index);
+			ret = gx_card_parse_i2s(priv, np, index);
 	}
 
 	return ret;
diff --git a/sound/soc/meson/meson-card-utils.c b/sound/soc/meson/meson-card-utils.c
index d144ab79b645b..7329711aefa56 100644
--- a/sound/soc/meson/meson-card-utils.c
+++ b/sound/soc/meson/meson-card-utils.c
@@ -39,10 +39,9 @@ int meson_card_i2s_set_sysclk(struct snd_pcm_substream *substream,
 }
 EXPORT_SYMBOL_GPL(meson_card_i2s_set_sysclk);
 
-int meson_card_reallocate_links(struct snd_soc_card *card,
+int meson_card_reallocate_links(struct meson_card *priv,
 				unsigned int num_links)
 {
-	struct meson_card *priv = snd_soc_card_get_drvdata(card);
 	struct snd_soc_dai_link *links;
 	void **ldata;
 
@@ -67,10 +66,11 @@ int meson_card_reallocate_links(struct snd_soc_card *card,
 }
 EXPORT_SYMBOL_GPL(meson_card_reallocate_links);
 
-int meson_card_parse_dai(struct snd_soc_card *card,
+int meson_card_parse_dai(struct meson_card *priv,
 			 struct device_node *node,
 			 struct snd_soc_dai_link_component *dlc)
 {
+	struct device *dev = priv->card.dev;
 	int ret;
 
 	if (!dlc || !node)
@@ -78,18 +78,19 @@ int meson_card_parse_dai(struct snd_soc_card *card,
 
 	ret = snd_soc_of_get_dlc(node, NULL, dlc, 0);
 	if (ret)
-		return dev_err_probe(card->dev, ret, "can't parse dai\n");
+		return dev_err_probe(dev, ret, "can't parse dai\n");
 
 	return ret;
 }
 EXPORT_SYMBOL_GPL(meson_card_parse_dai);
 
-static int meson_card_set_link_name(struct snd_soc_card *card,
+static int meson_card_set_link_name(struct meson_card *priv,
 				    struct snd_soc_dai_link *link,
 				    struct device_node *node,
 				    const char *prefix)
 {
-	char *name = devm_kasprintf(card->dev, GFP_KERNEL, "%s.%s",
+	struct device *dev = priv->card.dev;
+	char *name = devm_kasprintf(dev, GFP_KERNEL, "%s.%s",
 				    prefix, node->full_name);
 	if (!name)
 		return -ENOMEM;
@@ -127,21 +128,22 @@ unsigned int meson_card_parse_daifmt(struct device_node *node,
 }
 EXPORT_SYMBOL_GPL(meson_card_parse_daifmt);
 
-int meson_card_set_be_link(struct snd_soc_card *card,
+int meson_card_set_be_link(struct meson_card *priv,
 			   struct snd_soc_dai_link *link,
 			   struct device_node *node)
 {
 	struct snd_soc_dai_link_component *codec;
+	struct device *dev = priv->card.dev;
 	int ret, num_codecs;
 
 	num_codecs = of_get_child_count(node);
 	if (!num_codecs) {
-		dev_err(card->dev, "be link %s has no codec\n",
+		dev_err(dev, "be link %s has no codec\n",
 			node->full_name);
 		return -EINVAL;
 	}
 
-	codec = devm_kcalloc(card->dev, num_codecs, sizeof(*codec), GFP_KERNEL);
+	codec = devm_kcalloc(dev, num_codecs, sizeof(*codec), GFP_KERNEL);
 	if (!codec)
 		return -ENOMEM;
 
@@ -149,22 +151,22 @@ int meson_card_set_be_link(struct snd_soc_card *card,
 	link->num_codecs = num_codecs;
 
 	for_each_child_of_node_scoped(node, np) {
-		ret = meson_card_parse_dai(card, np, codec);
+		ret = meson_card_parse_dai(priv, np, codec);
 		if (ret)
 			return ret;
 
 		codec++;
 	}
 
-	ret = meson_card_set_link_name(card, link, node, "be");
+	ret = meson_card_set_link_name(priv, link, node, "be");
 	if (ret)
-		dev_err(card->dev, "error setting %pOFn link name\n", node);
+		dev_err(dev, "error setting %pOFn link name\n", node);
 
 	return ret;
 }
 EXPORT_SYMBOL_GPL(meson_card_set_be_link);
 
-int meson_card_set_fe_link(struct snd_soc_card *card,
+int meson_card_set_fe_link(struct meson_card *priv,
 			   struct snd_soc_dai_link *link,
 			   struct device_node *node,
 			   bool is_playback)
@@ -182,29 +184,29 @@ int meson_card_set_fe_link(struct snd_soc_card *card,
 	else
 		link->capture_only = 1;
 
-	return meson_card_set_link_name(card, link, node, "fe");
+	return meson_card_set_link_name(priv, link, node, "fe");
 }
 EXPORT_SYMBOL_GPL(meson_card_set_fe_link);
 
-static int meson_card_add_links(struct snd_soc_card *card)
+static int meson_card_add_links(struct meson_card *priv)
 {
-	struct meson_card *priv = snd_soc_card_get_drvdata(card);
-	struct device_node *node = card->dev->of_node;
+	struct device *dev = priv->card.dev;
+	struct device_node *node = dev->of_node;
 	int num, i, ret;
 
 	num = of_get_child_count(node);
 	if (!num) {
-		dev_err(card->dev, "card has no links\n");
+		dev_err(dev, "card has no links\n");
 		return -EINVAL;
 	}
 
-	ret = meson_card_reallocate_links(card, num);
+	ret = meson_card_reallocate_links(priv, num);
 	if (ret)
 		return ret;
 
 	i = 0;
 	for_each_child_of_node_scoped(node, np) {
-		ret = priv->match_data->add_link(card, np, &i);
+		ret = priv->match_data->add_link(priv, np, &i);
 		if (ret)
 			return ret;
 
@@ -214,17 +216,19 @@ static int meson_card_add_links(struct snd_soc_card *card)
 	return 0;
 }
 
-static int meson_card_parse_of_optional(struct snd_soc_card *card,
+static int meson_card_parse_of_optional(struct meson_card *priv,
 					const char *propname,
 					int (*func)(struct snd_soc_card *c,
 						    const char *p))
 {
+	struct device *dev = priv->card.dev;
+
 	/* If property is not provided, don't fail ... */
-	if (!of_property_present(card->dev->of_node, propname))
+	if (!of_property_present(dev->of_node, propname))
 		return 0;
 
 	/* ... but do fail if it is provided and the parsing fails */
-	return func(card, propname);
+	return func(&priv->card, propname);
 }
 
 static void meson_card_clean_references(struct meson_card *priv)
@@ -282,25 +286,25 @@ int meson_card_probe(struct platform_device *pdev)
 	if (ret < 0)
 		return ret;
 
-	ret = meson_card_parse_of_optional(&priv->card, "audio-routing",
+	ret = meson_card_parse_of_optional(priv, "audio-routing",
 					   snd_soc_of_parse_audio_routing);
 	if (ret) {
 		dev_err(dev, "error while parsing routing\n");
 		return ret;
 	}
 
-	ret = meson_card_parse_of_optional(&priv->card, "audio-widgets",
+	ret = meson_card_parse_of_optional(priv, "audio-widgets",
 					   snd_soc_of_parse_audio_simple_widgets);
 	if (ret) {
 		dev_err(dev, "error while parsing widgets\n");
 		return ret;
 	}
 
-	ret = meson_card_add_links(&priv->card);
+	ret = meson_card_add_links(priv);
 	if (ret)
 		goto out_err;
 
-	ret = meson_card_parse_of_optional(&priv->card, "audio-aux-devs",
+	ret = meson_card_parse_of_optional(priv, "audio-aux-devs",
 					   snd_soc_of_parse_aux_devs);
 	if (ret)
 		goto out_err;
diff --git a/sound/soc/meson/meson-card.h b/sound/soc/meson/meson-card.h
index a0d693e4f4608..ce8d9042793bb 100644
--- a/sound/soc/meson/meson-card.h
+++ b/sound/soc/meson/meson-card.h
@@ -16,8 +16,9 @@ struct snd_pcm_hw_params;
 
 #define DT_PREFIX "amlogic,"
 
+struct meson_card;
 struct meson_card_match_data {
-	int (*add_link)(struct snd_soc_card *card,
+	int (*add_link)(struct meson_card *priv,
 			struct device_node *node,
 			int *index);
 };
@@ -35,15 +36,15 @@ int meson_card_i2s_set_sysclk(struct snd_pcm_substream *substream,
 			      struct snd_pcm_hw_params *params,
 			      unsigned int mclk_fs);
 
-int meson_card_reallocate_links(struct snd_soc_card *card,
+int meson_card_reallocate_links(struct meson_card *priv,
 				unsigned int num_links);
-int meson_card_parse_dai(struct snd_soc_card *card,
+int meson_card_parse_dai(struct meson_card *priv,
 			 struct device_node *node,
 			 struct snd_soc_dai_link_component *dlc);
-int meson_card_set_be_link(struct snd_soc_card *card,
+int meson_card_set_be_link(struct meson_card *priv,
 			   struct snd_soc_dai_link *link,
 			   struct device_node *node);
-int meson_card_set_fe_link(struct snd_soc_card *card,
+int meson_card_set_fe_link(struct meson_card *priv,
 			   struct snd_soc_dai_link *link,
 			   struct device_node *node,
 			   bool is_playback);
-- 
2.53.0

