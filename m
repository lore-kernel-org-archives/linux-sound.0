Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11011024.outbound.protection.outlook.com [40.107.74.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F19BC3F5BDC
	for <linux-sound@vger.kernel.org>; Tue, 21 Jul 2026 01:18:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.74.24
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784596685; cv=fail; b=kHaMZbSjWhcBAYPUbOgZzji/wZpx6g8NOvPNQGA3UfGDjPmGAxOSPRiUgk66i1rsaxsfLim4EwNZucRwkjEFYfIhPUUp3fYJlDfFK5udtPhKo90F8O9rB2QecICwZBBbEVZs5EPe4/edLcbJTXGR8GZbYkaGUGZoLDpMHySGc1s=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784596685; c=relaxed/simple;
	bh=8E2a77xTfj1Hpzcsg6IABJARfaRLCz6BqrmRCUfjGhQ=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=KrJzWOYtSi+PWDFoEaoTgtUUhR4RgK5cBr1oOk97aSrr8TQoblk/9E3VslSRc5cH3o0iw/AOgZu58uTHG4NQJxkGinyGnv8IJpnfK13pvkHTuY9ZwW0kePRAvromnp3kl3APIiYPNfYGiG+SZBDR6mDFSKCqxmKnqSh2+tLyPwk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=J4U/J0KB; arc=fail smtp.client-ip=40.107.74.24
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="J4U/J0KB"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YffFjcVu9rW5K47yVXj1OGfj0gaEmb44U3H+BSa5Z35teohA4B6ai5Mytsjw+4O/WGaHVePWlSqLHNjsBkVZB8tXxWnTFNMscWa1QziVn9NW42CqHV5MeH2fX8LOg2AN5n5VqHtKp+KOSEMQtbLNHpI2cg3M7mNTMNiS9exIJ9CJcrHwlgrhr5dXSrGFciMlLHMnOCDVPA2mwrUQRBWIG4tDcZ+2B0uaMufDdoNrMCnVkllhLfY1J4pOGFe70d7a1+YeuwxitdpuBXatKjO9z/ytB8hAya419JcL0Davgg4+GvBId4OdhDuJm8mhT0BDpD+l/g86DXe+nAAQbcptIw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lG7egpg3RFeIsSSqJPFV7Xi/TkcEIB1hdhtPRL4hFIk=;
 b=vypnEBswyFqqyk5PFoAYKcXvc9zVaj2wMMbu6i7f8kmUOv8xqSkJcYREzhQGonNUsDR5UqgY6NyBjoKx4uuG+dHJgIjGxbjOYYr8+TTkBpP3SSaoQRU46GWl9wttWU7XFWs6eBYOogeIScoztfyHVA+2+gRJ9xRCn2+TavTJ135VXeuINfFyZ7nyeVzb6AfEJpnApWiE2CLUmHqTBoe1vxDB+wErKjbxwCn8P7/XmMkWPDAiz4eZq58fXdx4OPKiw22kUkmX4kadjC/NYSGoxLbYA7FE/xOgbiHGJNpFfAelS+1IAhGdqsZ/xMHz0C24d3jCKzAqvAsTZDDNQOxIsg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lG7egpg3RFeIsSSqJPFV7Xi/TkcEIB1hdhtPRL4hFIk=;
 b=J4U/J0KBNaE6oPPaAeAQfKp0Kv3gX31barp4UvRZP1jWQoM7G8TwS3NBYafrSomgdxCn+l66VRBVTmRQPRXhyk43ATedU5d5TkmT3j/IriD+/els0o0mKz6da7NcG+ZNDsrGFQiuL9+chHclNZHep0zNwx0rQmxRhwK+nKT9rdo=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TY3PR01MB11797.jpnprd01.prod.outlook.com (2603:1096:400:373::8)
 by TYYPR01MB14135.jpnprd01.prod.outlook.com (2603:1096:405:211::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.223.18; Tue, 21 Jul
 2026 01:18:01 +0000
Received: from TY3PR01MB11797.jpnprd01.prod.outlook.com
 ([fe80::1868:c915:c230:a383]) by TY3PR01MB11797.jpnprd01.prod.outlook.com
 ([fe80::1868:c915:c230:a383%4]) with mapi id 15.21.0223.017; Tue, 21 Jul 2026
 01:18:01 +0000
Message-ID: <87cxwhjg3b.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH v4 10/12] ASoC: soc-topology-test: use snd_soc_register_component()
User-Agent: Wanderlust/2.15.9 Emacs/30.2 Mule/6.0
To: Bard Liao <yung-chuan.liao@linux.intel.com>,
	Cezary Rojewski <cezary.rojewski@intel.com>,
	Fabio Estevam <festevam@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Kai Vehmanen <kai.vehmanen@linux.intel.com>,
	Lars-Peter Clausen <lars@metafoo.de>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Nicolin Chen <nicoleotsuka@gmail.com>,
	Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
	Shengjiu Wang <shengjiu.wang@gmail.com>,
	Takashi Iwai <tiwai@suse.com>,
	Xiubo Li <Xiubo.Lee@gmail.com>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <87qzkxjg53.wl-kuninori.morimoto.gx@renesas.com>
References: <87qzkxjg53.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 21 Jul 2026 01:18:00 +0000
X-ClientProxiedBy: TY4P286CA0076.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:405:36d::10) To TY3PR01MB11797.jpnprd01.prod.outlook.com
 (2603:1096:400:373::8)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY3PR01MB11797:EE_|TYYPR01MB14135:EE_
X-MS-Office365-Filtering-Correlation-Id: 7fc38a86-6d22-44fa-d847-08dee6c5e7f5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|52116014|366016|23010399003|1800799024|921020|38350700014|22082099003|18002099003|11063799006|56012099006|10067099003;
X-Microsoft-Antispam-Message-Info:
	rcZ2fs455Bxp679L1jB1RqEeyQFe7RRTnlrx2SOZmntWHXFCQ8MWuG8CLH9bj0RAYc18mJFl5s/+5JrVww08B6sc8PV77AbyEwoG5FKC7cJ4fWJaKIloX5yR794TZEV2yvCDNrsk3RLxTFQGRxvR81ZAnrkvZjO51emw22VvgQ1CMyoYbhmZokx7jKVMi0eVQOVeEOa+MhjqaXNgZZrXGvahy3ZY5uRu6LQxqWi9GzblwdCuQFB8FWKMPByxGZRZPuB/Y4B7Vf+tQKv6+Wfo3uT4F6ugdCaCFIyYDppgeRFAut9u3Q/GYhhKs9lNVpQvco0wje8zGpzp9uUaDiigM1ba3JpS2VeQwR11eBV39v/Bc0syCz7KZzwQqu0jXzQHxTu/oSFgdtVZtvwWTIph6CIPLWV5i8u6PsKxTclqPteinz/lvEH8WIrXeBwUk/QBFwAzosFxi4bQdCBQfV/J9n/zZDu/1iGiu7eA34fgXRSEBNO/IKe/iklCwAtQEEQgJDmNtgZl9T0KQ8/Uv9FOsasiReVEe90R4FLepfIMYT1HbIwXqd3MAkqp7sj1Gqj0RPPB0fFnN3zBGVEfyyP31rkm6azikgZOeypBn8sCUX4pLnCU1YsU/aHzy6PaA/tdcNX+a1C0ONR4Xz4QpxnRUGO4bNcKHQJ1aktMouAYNy5zn0+Q/cXJn+Pgx45Gkd7GVNZw3NfOPn+4oepdGDLSdXLUMhFHokd0n3LwakwlZ4CqpFGXxobVHOJUAzx9DT7U
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11797.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(52116014)(366016)(23010399003)(1800799024)(921020)(38350700014)(22082099003)(18002099003)(11063799006)(56012099006)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?Gne3ZBPAs09za+Adjk4Ijums9KrbwKQYuO/HYwf+tXSkL7RfWmn/qbKnihPC?=
 =?us-ascii?Q?+BshKuV5g4ZvTMc4knQ4y7gW77Xvm6F/qqxAkW/4uTf4foJoX7xNeFL31DX8?=
 =?us-ascii?Q?/mKfVUZDhGocRbRSgVufzbvgE2/cWlK4TgoWCqPnA5h+ZtO3VwnZDdunJ/8T?=
 =?us-ascii?Q?XN5qwB4qCABn6bgxwBNOf1fe5ksi7Ni5ynMiFBIGRq2lFiW7GPT9LfcjuijM?=
 =?us-ascii?Q?ytBj59GSODiSucvf38Uoltl7NtZ/+acxhueqiAjs5fD5N5swKhipGc2x50OE?=
 =?us-ascii?Q?WbJQll3RZJUF9yne5VW3sQweVnDNuq464XDD6YdZjJTwsc5M0+yTqgtLVIgy?=
 =?us-ascii?Q?TTTfEApow5VTIUogHJ/dZRIvmCaREjHRu3NSvF5Bav1Nmnx4eTROMxpbE8dP?=
 =?us-ascii?Q?MWY87VzY2PTRhZ2FyPDENSnwW+MrarbpD82dtSr6cAagknSaVOMwRf2oTanI?=
 =?us-ascii?Q?ZmQ3DAq7Ekdhk+klzOei2GkRlDwkogkiSRQR70IgJjYhW6lxjWGP++R6bXS3?=
 =?us-ascii?Q?NDbN27ikEtr4z5RUzA+LUD2lLfwpWOBJVrFaF1xnLoqbrChcJeDj7LO/L65/?=
 =?us-ascii?Q?FL51BpsMznwI8LgqwpbV3VBPDU5IHoyW11krxRzh1u2DIRWfBfpEIbtSJsCZ?=
 =?us-ascii?Q?lPeU+Hm+dfdrkQs8vlmHITQvNIpPKxFBVn2zPdSi6hN2mMK3u3xUY4ruCqxM?=
 =?us-ascii?Q?bjwGrtOdgQGEs4N5heCZRvc7xYqVQLNWDA+XykTiJ4EEbWaqU/v7/mPF15G9?=
 =?us-ascii?Q?K5lS7x4c9Q1m55Ep94Vp5Nl7GfPeMYPoF3LeEhPxYbVK+SifhAmMKPWno9MD?=
 =?us-ascii?Q?xpuDIJvXRUwvUSwH4ugzJ+IPKPY9375iHFUMaFfg8ngBF5iPUgqGPJdHDFPW?=
 =?us-ascii?Q?l3+5aL1TExRXlwtzCwU+KDVbDtYFOdBD3m6ynr9XrV0Vnueag2V4EQfmcPjk?=
 =?us-ascii?Q?w2Wn9FtrFVUrUMVlly7kijHTpls3Ewh0GI4tEc3NMadxZayXQjTsprXi2F/w?=
 =?us-ascii?Q?ligv9XMIV3alNgcyz5TISpqbyQXvWILuyb5BJPUcRuFNAi8Dgqan27lA5ddX?=
 =?us-ascii?Q?4JVvRdtQv8pCPAGD32CWaoGC7j4mcCbt8SkA/o0xPqpHd00gDJeKa9ujB8dk?=
 =?us-ascii?Q?CpmHSCELRhl90w+Hzg8UZzQeu3Tct/HkAG/+lfsi28nWQmToyRusVBuDKea+?=
 =?us-ascii?Q?mFZUVV7B/Wz3YcLm6k2okDze8qTPMAeDitw0r5qS4vF8qfCqaLkP2c6u1VLz?=
 =?us-ascii?Q?ClRA9sTGzv0V+t8WHvpUwzw/SCSHSqeeuFW+ex+VXALKA4w7/rKkJQ0Ittq/?=
 =?us-ascii?Q?SWISJWHOeAw1M1dNYKLr4tAD3VdhgP78FdPpprQgvzQ7XsIdP39XsiBJQRLr?=
 =?us-ascii?Q?Yv14RwsVjycclFEcr0end/RwrDnH2v2fYj8BFdXfn0DXgXRTqGlNuxoWvZ2k?=
 =?us-ascii?Q?kvmZrvPQ5CA/YLPOpWFPgCUY2jwuAo8BnCv2NhlFalmx4f+87xohN5m7CPEq?=
 =?us-ascii?Q?S8Hne80goR2ghT+XU0HqW+cA8Y8e/RACq3eJ7tkR83SN99/IMmqOxcQo07R+?=
 =?us-ascii?Q?i23DZUniUm9eAilYlAclcXiPMB7iyOW6/rPRx/xNurbgrd3GprEjc70LTVOf?=
 =?us-ascii?Q?fu9m8xBFPP9TexogE/kGTWEWkE7trom5z6sfuS3Ir4AJlx7e3qejt7JKdNsp?=
 =?us-ascii?Q?w1Ky0/wt3u57QyjpFW+qb1o78RGVYCvrYdsFk1VtWkRI07x/mMmboU92tYQQ?=
 =?us-ascii?Q?nc1otdmc0DD08JMEZt/3foEWOO4xEJt9Hek/V/nSTP6KmSlnKpZ7?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7fc38a86-6d22-44fa-d847-08dee6c5e7f5
X-MS-Exchange-CrossTenant-AuthSource: TY3PR01MB11797.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jul 2026 01:18:00.9658
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4WF4lFFkhhyZXC9r/fYeNzlZ7F8GTzopXacPR/n9O4D6+2PNcNzUGleOcwV73bAkiDpj2MVMzRZxxiuSwGpHVXrOaXkCASKq+l8V4ppJYm3yLvgpifbOVCdqqqIUE5H4
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYYPR01MB14135

It is calling snd_soc_component_initialize() / snd_soc_add_component().
We can now use snd_soc_register_component() instead.

It is using container_of() to get kunit_soc_component from component, but
will not be able to use it when capsuling has done.
We can use snd_soc_component_to_priv() instead.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Reviewed-by: Cezary Rojewski <cezary.rojewski@intel.com>
---
 sound/soc/soc-topology-test.c | 144 ++++++++++++++++++++++------------
 1 file changed, 92 insertions(+), 52 deletions(-)

diff --git a/sound/soc/soc-topology-test.c b/sound/soc/soc-topology-test.c
index c8f2ec29e9703..8feb3dcf8d557 100644
--- a/sound/soc/soc-topology-test.c
+++ b/sound/soc/soc-topology-test.c
@@ -45,15 +45,13 @@ static void snd_soc_tplg_test_exit(struct kunit *test)
 struct kunit_soc_component {
 	struct kunit *kunit;
 	int expect; /* what result we expect when loading topology */
-	struct snd_soc_component comp;
 	struct snd_soc_card card;
 	struct firmware fw;
 };
 
 static int d_probe(struct snd_soc_component *component)
 {
-	struct kunit_soc_component *kunit_comp =
-			container_of(component, struct kunit_soc_component, comp);
+	struct kunit_soc_component *kunit_comp = snd_soc_component_to_priv(component);
 	int ret;
 
 	ret = snd_soc_tplg_component_load(component, NULL, &kunit_comp->fw);
@@ -65,8 +63,7 @@ static int d_probe(struct snd_soc_component *component)
 
 static void d_remove(struct snd_soc_component *component)
 {
-	struct kunit_soc_component *kunit_comp =
-			container_of(component, struct kunit_soc_component, comp);
+	struct kunit_soc_component *kunit_comp = snd_soc_component_to_priv(component);
 	int ret;
 
 	ret = snd_soc_tplg_component_remove(component);
@@ -214,8 +211,7 @@ static struct tplg_tmpl_002 tplg_tmpl_with_pcm = {
  */
 static int d_probe_null_comp(struct snd_soc_component *component)
 {
-	struct kunit_soc_component *kunit_comp =
-			container_of(component, struct kunit_soc_component, comp);
+	struct kunit_soc_component *kunit_comp = snd_soc_component_to_priv(component);
 	int ret;
 
 	/* instead of passing component pointer as first argument, pass NULL here */
@@ -234,6 +230,7 @@ static const struct snd_soc_component_driver test_component_null_comp = {
 static void snd_soc_tplg_test_load_with_null_comp(struct kunit *test)
 {
 	struct kunit_soc_component *kunit_comp;
+	struct snd_soc_component *component;
 	int ret;
 
 	/* prepare */
@@ -249,15 +246,18 @@ static void snd_soc_tplg_test_load_with_null_comp(struct kunit *test)
 	kunit_comp->card.num_links = ARRAY_SIZE(kunit_dai_links);
 	kunit_comp->card.fully_routed = true;
 
+	component = snd_soc_component_alloc(test_dev);
+	if (!component)
+		KUNIT_FAIL(test, "Failed to alloc component");
+
+	snd_soc_component_set_priv(component, kunit_comp);
+
 	/* run test */
 	ret = snd_soc_register_card(&kunit_comp->card);
 	if (ret != 0 && ret != -EPROBE_DEFER)
 		KUNIT_FAIL(test, "Failed to register card");
 
-	ret = snd_soc_component_initialize(&kunit_comp->comp, &test_component_null_comp, test_dev);
-	KUNIT_EXPECT_EQ(test, 0, ret);
-
-	ret = snd_soc_add_component(&kunit_comp->comp, NULL, 0);
+	ret = snd_soc_register_component(component, &test_component_null_comp, NULL, 0);
 	KUNIT_EXPECT_EQ(test, 0, ret);
 
 	/* cleanup */
@@ -276,6 +276,7 @@ static void snd_soc_tplg_test_load_with_null_comp(struct kunit *test)
 static void snd_soc_tplg_test_load_with_null_ops(struct kunit *test)
 {
 	struct kunit_soc_component *kunit_comp;
+	struct snd_soc_component *component;
 	int ret;
 
 	/* prepare */
@@ -291,15 +292,18 @@ static void snd_soc_tplg_test_load_with_null_ops(struct kunit *test)
 	kunit_comp->card.num_links = ARRAY_SIZE(kunit_dai_links);
 	kunit_comp->card.fully_routed = true;
 
+	component = snd_soc_component_alloc(test_dev);
+	if (!component)
+		KUNIT_FAIL(test, "Failed to alloc component");
+
+	snd_soc_component_set_priv(component, kunit_comp);
+
 	/* run test */
 	ret = snd_soc_register_card(&kunit_comp->card);
 	if (ret != 0 && ret != -EPROBE_DEFER)
 		KUNIT_FAIL(test, "Failed to register card");
 
-	ret = snd_soc_component_initialize(&kunit_comp->comp, &test_component, test_dev);
-	KUNIT_EXPECT_EQ(test, 0, ret);
-
-	ret = snd_soc_add_component(&kunit_comp->comp, NULL, 0);
+	ret = snd_soc_register_component(component, &test_component, NULL, 0);
 	KUNIT_EXPECT_EQ(test, 0, ret);
 
 	/* cleanup */
@@ -318,8 +322,7 @@ static void snd_soc_tplg_test_load_with_null_ops(struct kunit *test)
  */
 static int d_probe_null_fw(struct snd_soc_component *component)
 {
-	struct kunit_soc_component *kunit_comp =
-			container_of(component, struct kunit_soc_component, comp);
+	struct kunit_soc_component *kunit_comp = snd_soc_component_to_priv(component);
 	int ret;
 
 	/* instead of passing fw pointer as third argument, pass NULL here */
@@ -338,6 +341,7 @@ static const struct snd_soc_component_driver test_component_null_fw = {
 static void snd_soc_tplg_test_load_with_null_fw(struct kunit *test)
 {
 	struct kunit_soc_component *kunit_comp;
+	struct snd_soc_component *component;
 	int ret;
 
 	/* prepare */
@@ -353,15 +357,18 @@ static void snd_soc_tplg_test_load_with_null_fw(struct kunit *test)
 	kunit_comp->card.num_links = ARRAY_SIZE(kunit_dai_links);
 	kunit_comp->card.fully_routed = true;
 
+	component = snd_soc_component_alloc(test_dev);
+	if (!component)
+		KUNIT_FAIL(test, "Failed to alloc component");
+
+	snd_soc_component_set_priv(component, kunit_comp);
+
 	/* run test */
 	ret = snd_soc_register_card(&kunit_comp->card);
 	if (ret != 0 && ret != -EPROBE_DEFER)
 		KUNIT_FAIL(test, "Failed to register card");
 
-	ret = snd_soc_component_initialize(&kunit_comp->comp, &test_component_null_fw, test_dev);
-	KUNIT_EXPECT_EQ(test, 0, ret);
-
-	ret = snd_soc_add_component(&kunit_comp->comp, NULL, 0);
+	ret = snd_soc_register_component(component, &test_component_null_fw, NULL, 0);
 	KUNIT_EXPECT_EQ(test, 0, ret);
 
 	/* cleanup */
@@ -375,6 +382,7 @@ static void snd_soc_tplg_test_load_with_null_fw(struct kunit *test)
 static void snd_soc_tplg_test_load_empty_tplg(struct kunit *test)
 {
 	struct kunit_soc_component *kunit_comp;
+	struct snd_soc_component *component;
 	struct tplg_tmpl_001 *data;
 	int size;
 	int ret;
@@ -401,15 +409,18 @@ static void snd_soc_tplg_test_load_empty_tplg(struct kunit *test)
 	kunit_comp->card.num_links = ARRAY_SIZE(kunit_dai_links);
 	kunit_comp->card.fully_routed = true;
 
+	component = snd_soc_component_alloc(test_dev);
+	if (!component)
+		KUNIT_FAIL(test, "Failed to alloc component");
+
+	snd_soc_component_set_priv(component, kunit_comp);
+
 	/* run test */
 	ret = snd_soc_register_card(&kunit_comp->card);
 	if (ret != 0 && ret != -EPROBE_DEFER)
 		KUNIT_FAIL(test, "Failed to register card");
 
-	ret = snd_soc_component_initialize(&kunit_comp->comp, &test_component, test_dev);
-	KUNIT_EXPECT_EQ(test, 0, ret);
-
-	ret = snd_soc_add_component(&kunit_comp->comp, NULL, 0);
+	ret = snd_soc_register_component(component, &test_component, NULL, 0);
 	KUNIT_EXPECT_EQ(test, 0, ret);
 
 	/* cleanup */
@@ -425,6 +436,7 @@ static void snd_soc_tplg_test_load_empty_tplg(struct kunit *test)
 static void snd_soc_tplg_test_load_empty_tplg_bad_magic(struct kunit *test)
 {
 	struct kunit_soc_component *kunit_comp;
+	struct snd_soc_component *component;
 	struct tplg_tmpl_001 *data;
 	int size;
 	int ret;
@@ -456,15 +468,18 @@ static void snd_soc_tplg_test_load_empty_tplg_bad_magic(struct kunit *test)
 	kunit_comp->card.num_links = ARRAY_SIZE(kunit_dai_links);
 	kunit_comp->card.fully_routed = true;
 
+	component = snd_soc_component_alloc(test_dev);
+	if (!component)
+		KUNIT_FAIL(test, "Failed to alloc component");
+
+	snd_soc_component_set_priv(component, kunit_comp);
+
 	/* run test */
 	ret = snd_soc_register_card(&kunit_comp->card);
 	if (ret != 0 && ret != -EPROBE_DEFER)
 		KUNIT_FAIL(test, "Failed to register card");
 
-	ret = snd_soc_component_initialize(&kunit_comp->comp, &test_component, test_dev);
-	KUNIT_EXPECT_EQ(test, 0, ret);
-
-	ret = snd_soc_add_component(&kunit_comp->comp, NULL, 0);
+	ret = snd_soc_register_component(component, &test_component, NULL, 0);
 	KUNIT_EXPECT_EQ(test, 0, ret);
 
 	/* cleanup */
@@ -480,6 +495,7 @@ static void snd_soc_tplg_test_load_empty_tplg_bad_magic(struct kunit *test)
 static void snd_soc_tplg_test_load_empty_tplg_bad_abi(struct kunit *test)
 {
 	struct kunit_soc_component *kunit_comp;
+	struct snd_soc_component *component;
 	struct tplg_tmpl_001 *data;
 	int size;
 	int ret;
@@ -511,15 +527,18 @@ static void snd_soc_tplg_test_load_empty_tplg_bad_abi(struct kunit *test)
 	kunit_comp->card.num_links = ARRAY_SIZE(kunit_dai_links);
 	kunit_comp->card.fully_routed = true;
 
+	component = snd_soc_component_alloc(test_dev);
+	if (!component)
+		KUNIT_FAIL(test, "Failed to alloc component");
+
+	snd_soc_component_set_priv(component, kunit_comp);
+
 	/* run test */
 	ret = snd_soc_register_card(&kunit_comp->card);
 	if (ret != 0 && ret != -EPROBE_DEFER)
 		KUNIT_FAIL(test, "Failed to register card");
 
-	ret = snd_soc_component_initialize(&kunit_comp->comp, &test_component, test_dev);
-	KUNIT_EXPECT_EQ(test, 0, ret);
-
-	ret = snd_soc_add_component(&kunit_comp->comp, NULL, 0);
+	ret = snd_soc_register_component(component, &test_component, NULL, 0);
 	KUNIT_EXPECT_EQ(test, 0, ret);
 
 	/* cleanup */
@@ -535,6 +554,7 @@ static void snd_soc_tplg_test_load_empty_tplg_bad_abi(struct kunit *test)
 static void snd_soc_tplg_test_load_empty_tplg_bad_size(struct kunit *test)
 {
 	struct kunit_soc_component *kunit_comp;
+	struct snd_soc_component *component;
 	struct tplg_tmpl_001 *data;
 	int size;
 	int ret;
@@ -566,15 +586,18 @@ static void snd_soc_tplg_test_load_empty_tplg_bad_size(struct kunit *test)
 	kunit_comp->card.num_links = ARRAY_SIZE(kunit_dai_links);
 	kunit_comp->card.fully_routed = true;
 
+	component = snd_soc_component_alloc(test_dev);
+	if (!component)
+		KUNIT_FAIL(test, "Failed to alloc component");
+
+	snd_soc_component_set_priv(component, kunit_comp);
+
 	/* run test */
 	ret = snd_soc_register_card(&kunit_comp->card);
 	if (ret != 0 && ret != -EPROBE_DEFER)
 		KUNIT_FAIL(test, "Failed to register card");
 
-	ret = snd_soc_component_initialize(&kunit_comp->comp, &test_component, test_dev);
-	KUNIT_EXPECT_EQ(test, 0, ret);
-
-	ret = snd_soc_add_component(&kunit_comp->comp, NULL, 0);
+	ret = snd_soc_register_component(component, &test_component, NULL, 0);
 	KUNIT_EXPECT_EQ(test, 0, ret);
 
 	/* cleanup */
@@ -590,6 +613,7 @@ static void snd_soc_tplg_test_load_empty_tplg_bad_size(struct kunit *test)
 static void snd_soc_tplg_test_load_empty_tplg_bad_payload_size(struct kunit *test)
 {
 	struct kunit_soc_component *kunit_comp;
+	struct snd_soc_component *component;
 	struct tplg_tmpl_001 *data;
 	int size;
 	int ret;
@@ -622,15 +646,18 @@ static void snd_soc_tplg_test_load_empty_tplg_bad_payload_size(struct kunit *tes
 	kunit_comp->card.num_links = ARRAY_SIZE(kunit_dai_links);
 	kunit_comp->card.fully_routed = true;
 
+	component = snd_soc_component_alloc(test_dev);
+	if (!component)
+		KUNIT_FAIL(test, "Failed to alloc component");
+
+	snd_soc_component_set_priv(component, kunit_comp);
+
 	/* run test */
 	ret = snd_soc_register_card(&kunit_comp->card);
 	if (ret != 0 && ret != -EPROBE_DEFER)
 		KUNIT_FAIL(test, "Failed to register card");
 
-	ret = snd_soc_component_initialize(&kunit_comp->comp, &test_component, test_dev);
-	KUNIT_EXPECT_EQ(test, 0, ret);
-
-	ret = snd_soc_add_component(&kunit_comp->comp, NULL, 0);
+	ret = snd_soc_register_component(component, &test_component, NULL, 0);
 	KUNIT_EXPECT_EQ(test, 0, ret);
 
 	/* cleanup */
@@ -644,6 +671,7 @@ static void snd_soc_tplg_test_load_empty_tplg_bad_payload_size(struct kunit *tes
 static void snd_soc_tplg_test_load_pcm_tplg(struct kunit *test)
 {
 	struct kunit_soc_component *kunit_comp;
+	struct snd_soc_component *component;
 	u8 *data;
 	int size;
 	int ret;
@@ -670,15 +698,18 @@ static void snd_soc_tplg_test_load_pcm_tplg(struct kunit *test)
 	kunit_comp->card.num_links = ARRAY_SIZE(kunit_dai_links);
 	kunit_comp->card.fully_routed = true;
 
+	component = snd_soc_component_alloc(test_dev);
+	if (!component)
+		KUNIT_FAIL(test, "Failed to alloc component");
+
+	snd_soc_component_set_priv(component, kunit_comp);
+
 	/* run test */
 	ret = snd_soc_register_card(&kunit_comp->card);
 	if (ret != 0 && ret != -EPROBE_DEFER)
 		KUNIT_FAIL(test, "Failed to register card");
 
-	ret = snd_soc_component_initialize(&kunit_comp->comp, &test_component, test_dev);
-	KUNIT_EXPECT_EQ(test, 0, ret);
-
-	ret = snd_soc_add_component(&kunit_comp->comp, NULL, 0);
+	ret = snd_soc_register_component(component, &test_component, NULL, 0);
 	KUNIT_EXPECT_EQ(test, 0, ret);
 
 	snd_soc_unregister_component(test_dev);
@@ -693,6 +724,7 @@ static void snd_soc_tplg_test_load_pcm_tplg(struct kunit *test)
 static void snd_soc_tplg_test_load_pcm_tplg_reload_comp(struct kunit *test)
 {
 	struct kunit_soc_component *kunit_comp;
+	struct snd_soc_component *component;
 	u8 *data;
 	int size;
 	int ret;
@@ -720,16 +752,20 @@ static void snd_soc_tplg_test_load_pcm_tplg_reload_comp(struct kunit *test)
 	kunit_comp->card.num_links = ARRAY_SIZE(kunit_dai_links);
 	kunit_comp->card.fully_routed = true;
 
+	component = snd_soc_component_alloc(test_dev);
+	if (!component)
+		KUNIT_FAIL(test, "Failed to alloc component");
+
+	snd_soc_component_set_priv(component, kunit_comp);
+
 	/* run test */
 	ret = snd_soc_register_card(&kunit_comp->card);
 	if (ret != 0 && ret != -EPROBE_DEFER)
 		KUNIT_FAIL(test, "Failed to register card");
 
 	for (i = 0; i < 100; i++) {
-		ret = snd_soc_component_initialize(&kunit_comp->comp, &test_component, test_dev);
-		KUNIT_EXPECT_EQ(test, 0, ret);
 
-		ret = snd_soc_add_component(&kunit_comp->comp, NULL, 0);
+		ret = snd_soc_register_component(component, &test_component, NULL, 0);
 		KUNIT_EXPECT_EQ(test, 0, ret);
 
 		snd_soc_unregister_component(test_dev);
@@ -745,6 +781,7 @@ static void snd_soc_tplg_test_load_pcm_tplg_reload_comp(struct kunit *test)
 static void snd_soc_tplg_test_load_pcm_tplg_reload_card(struct kunit *test)
 {
 	struct kunit_soc_component *kunit_comp;
+	struct snd_soc_component *component;
 	u8 *data;
 	int size;
 	int ret;
@@ -772,11 +809,14 @@ static void snd_soc_tplg_test_load_pcm_tplg_reload_card(struct kunit *test)
 	kunit_comp->card.num_links = ARRAY_SIZE(kunit_dai_links);
 	kunit_comp->card.fully_routed = true;
 
-	/* run test */
-	ret = snd_soc_component_initialize(&kunit_comp->comp, &test_component, test_dev);
-	KUNIT_EXPECT_EQ(test, 0, ret);
+	component = snd_soc_component_alloc(test_dev);
+	if (!component)
+		KUNIT_FAIL(test, "Failed to alloc component");
 
-	ret = snd_soc_add_component(&kunit_comp->comp, NULL, 0);
+	snd_soc_component_set_priv(component, kunit_comp);
+
+	/* run test */
+	ret = snd_soc_register_component(component, &test_component, NULL, 0);
 	KUNIT_EXPECT_EQ(test, 0, ret);
 
 	for (i = 0; i < 100; i++) {
-- 
2.53.0

