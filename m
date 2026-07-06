Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazon11011013.outbound.protection.outlook.com [52.101.125.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7597E37C11F
	for <linux-sound@vger.kernel.org>; Mon,  6 Jul 2026 02:02:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.125.13
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783303377; cv=fail; b=oUJhw25rRGRx1zFAJgeZqxKKZGx+h0d/jlB7T1icMn0kXHtuesiaxDC2zaOSFJC7nlEoRfVYLEx+4d+Hf6IUBNwH3BhzmEc1IO6biSJ/zw0lHT7HOw1EOYNgd/Vdk23FHn4PMMphgROD2AyXlq4QH6N34X+DPkz4bElDZIcb00U=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783303377; c=relaxed/simple;
	bh=s6NxtR+VDOhdGUzAF0bWUBtj8ft4UMZY1wEbJUE+B9I=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=tqJuE+9gbART0ziQj8Wi4Y4h9aMKln9zRebQL82qrk8YOhYjS1SMwm2GYAN8PCiqKiE/5XJYUIMpeIBZfh5/a3a9ffIg2mvx6pEV1u8xXqV+Gkq57G7BG6T98YCIN85pegEtL/h5HbBwB8eJUi4qNj6ic5PWRH7ppwwKGHumT70=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=IwpIKMIL; arc=fail smtp.client-ip=52.101.125.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="IwpIKMIL"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=C9WsM2h2OzisZOmq0HiEQG4IXR4yrLHd4YKf32XkI4BoC7gG9vF6wjbMglV1ATRQ3BU/mnMJJFPfgRba8Xqa4lBLWAtsYeh72lYo7cqtBT6v7xVbZKpYmfE5c76e2lnNUJ1EUobGfxGbxNnVCbXqHin12ON8gutE/l16SP8vSKhvEcmTg11KSSBcCeebdBYYKOm3XisZIgFJS2Rj9pk0S3CB6OawQoyGcxDHqh0XSE0ADU+334qWPRaxFkZiZnWeHzkuSBz9/M8ZuIlrXIXZ3DO7ECxdoetqZuKd+0JjKxs3zVEAXAkPFJl9tRvc7wLftFdpoUKojUTPBjQ57nv9xQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=M5bkcFn2JpgjBrlv1yr4KyH2tgzu6jWMu+T3OkyF4eo=;
 b=qCZyzr4TquHmZCFtdPFBEaks7AnNmjSZLIp9+LAKk3MuvBF8H3wMYTXRTdM/yUrg/WYD1TuByc8hck7B17INMWT6/7UATb6VyENA5qvmwgYqccm2A0veC2uTihJ7x0iCvSGU0L4ffGbux9Y7dzidyDYeyrHUhi1vcSnvea3Iy/TjbdgvPDWZRqWsDOcNHDdQeKrqvGqVHa3rGMZtAvJL+MbQzn933KLoKgu+pq5+yKDxyMDenRBWsrqCQnAF5hwrQMRBgbiPcaYAv4T8SLLQDvCpt637wPK2hUYBO8/aCuBAGxuqt0eweZVPYo07447A9SKlr9m2ISKZ/7KrU3WVmQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=M5bkcFn2JpgjBrlv1yr4KyH2tgzu6jWMu+T3OkyF4eo=;
 b=IwpIKMILR84RsQmmNNxcyji92Vd6usbj4jjC0K/a/Nsx58m8JWZpf+nMUlvT6tPDnj/7yW92akKQdfy/Yh9wuPB+VOoG+8cwZ3KuXcgWgM/KD3KknE2fwXRITogdY57ftBGqFWxXvH++7Sl1P3N4Phsv0db7AAacbzkNddLfIFU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TY3PR01MB11797.jpnprd01.prod.outlook.com (2603:1096:400:373::8)
 by TY4PR01MB14075.jpnprd01.prod.outlook.com (2603:1096:405:20d::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.10; Mon, 6 Jul
 2026 02:02:53 +0000
Received: from TY3PR01MB11797.jpnprd01.prod.outlook.com
 ([fe80::1868:c915:c230:a383]) by TY3PR01MB11797.jpnprd01.prod.outlook.com
 ([fe80::1868:c915:c230:a383%5]) with mapi id 15.21.0181.010; Mon, 6 Jul 2026
 02:02:53 +0000
Message-ID: <87ldboc1tf.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH v3 10/12] ASoC: soc-topology-test: use snd_soc_register_component()
To: Bard Liao <yung-chuan.liao@linux.intel.com>,
	bui duc phuc <phucduc.bui@gmail.com>,
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
In-Reply-To: <87zf04c1w5.wl-kuninori.morimoto.gx@renesas.com>
References: <87zf04c1w5.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Mon, 6 Jul 2026 02:02:52 +0000
X-ClientProxiedBy: TYCP286CA0342.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:38e::8) To TY3PR01MB11797.jpnprd01.prod.outlook.com
 (2603:1096:400:373::8)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY3PR01MB11797:EE_|TY4PR01MB14075:EE_
X-MS-Office365-Filtering-Correlation-Id: 274f6f6f-bf7b-4215-8930-08dedb02b07a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|7416014|52116014|23010399003|1800799024|38350700014|921020|11063799006|56012099006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	tadNshkMijGjvxv20yq4kxgRnh92/vQ3gFDdStutLhkBxUwNe3CSXmddDeCZJSoEEmuY2mO/vPrZYZBSFJ4pjwMsXWE2ArPBRKHqQoUBdnBCw8eh+1N/6IkNkXhugJcow+xoHeWUgEoVHQit9/cRsA9+/6u6xuUpIg+7icfCAPKcV5z9jUM0R+pAi3jXF2MjbGQZbuHeGXiz4w1t+ulQ5nQMhU3XsxS66SO64GGqxUcX6Qu+QMT7GCTHKK/Wxx9hrpz5fsFL09tmUmIC193E73VwK1CaM2tvuftMX0cqFzv3EsNDxOYEX1/WEYR3avZY4VMhRS+EROIKf25DJiR/4628rjL2vDFz19c+nL70SWB8zNokvGZSor59xlHshHqvKAKrzHBKZtTn51O4rH3MmXUtm2MIsVf3lFRp+ijsdKWHZ9IfpZjGBMyY11PPx7Cs+6HF5ExpuqdP87TZVbohFGLuwS0pIotdtuYsYrzPDCExaAqhUNVJeGl6OY2paauqLefZuInodfGDoQJTKZYpuCfaqHXjcXljNZtYdQT3WK+YwQDJqZhuEZvFRLHG7Q5xSe/imkHrx1a+2VTVKIJKOsOi+wdF31czi1/98G0gVDzx04BmHvzJh9ka9ociDBbyxxPiSD/e0CpOO6ttHOe8QZV/Lgcmi3LOUWT2IOGeTJAZ0cx5k6jkGmDQDMcPFAJ0Lrqf3o0Uofv9NSzXKQpqcQWsyUtnMrgK9DThfvvXWJihFgZGNmZKjJ/2q2FXzJEB
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11797.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(7416014)(52116014)(23010399003)(1800799024)(38350700014)(921020)(11063799006)(56012099006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?k0XIgWgoHV5W2kMPOIM5aLbcHQqN7Xnvet+4vJnJOltrwNSoWqcr2bgaNUXU?=
 =?us-ascii?Q?iQNqmwv0Ucl+UbnB1DfYlY3QOVsu6m9X2najjPzn78yejEfecMMuYkYjJTDg?=
 =?us-ascii?Q?dJHkI+5OKzz4wIPXlWXslGdXzoqkgk0T0TqzhPgiNnmlKrkJkRC3FaX+re6F?=
 =?us-ascii?Q?w3gFiwpqH6p+THP+b3bWSFX7jhUINnnda3k2307MywRpy2Oxj9mhmZv96KxP?=
 =?us-ascii?Q?clw6DjUONYauSDeMdICU7CG9k0aJZv6za8ziAnyxM67sDoeSNfVHp3aCt9+n?=
 =?us-ascii?Q?bc+73WRmEWr6U3aV5tuu3uZjTprxqUKUhXngRebW3yenNewiT3XdH8cdbga/?=
 =?us-ascii?Q?5Ydc9DnbaikT1/kOrJSQQmCMC4vYGbuCNyCPvn/vKTURNduGnQ+iIR/2bDU/?=
 =?us-ascii?Q?GNjx5aa1jQFcMATkYD8fD1msRYedK71QnOh8TV11DwPCuQvKzx6Uq2sJsBzJ?=
 =?us-ascii?Q?/CsDlDzrfteWK36vXX6+3utDdCDwUrZWQ5MuyxhRllkzPXDEiCQU4atsbeFR?=
 =?us-ascii?Q?4H664NqBoZCy/HJfeCXJ2l5bhU8EyoDgRdMGUGKsSAJR4sh0Cn2wYZ3MebWq?=
 =?us-ascii?Q?fu6VGLef9araucOgj5lJtEV++vW2evRcM/ssXME06PBp1mLRz9/k2cEJokZy?=
 =?us-ascii?Q?vz1z1oeFIIb7CDhI/iNS4q4F5L9oCqQ1hY6o+Tp3Z7egMNMF1qrbCbTbyE1h?=
 =?us-ascii?Q?pzpRX510Pff81DkQ5TyrPk2LRL+vGZPglKKAW+/W02DGk5oiHbgj5viX9IGp?=
 =?us-ascii?Q?s5pkas4zrtEchgCBKATuVM3131iIa/l+2urJrWlyeUZ75OUqMxJCs0kjbyto?=
 =?us-ascii?Q?OvxPsxcHMO0wfcT8fPzLcmD+HzlmWffSxjDlgpywYuRm7tDmkRf2nf9nv7ra?=
 =?us-ascii?Q?HPWarAaXZE5HxK77Oc+IhHKqeOtDkU//Ladhc6HSJ8xV3UIFYnPHf4iFCxqQ?=
 =?us-ascii?Q?AE3zXDY9ZnoQ9KCle0VkyFBmJEy+iojrc4R2XaH5hu0ROikSgDer5mzF1JTd?=
 =?us-ascii?Q?sE1UzB5cJ+macXnfNRw2k6i2VcQepRs/hISiBsG7qw5Zbv+3YFSTz4v4eiIL?=
 =?us-ascii?Q?AfSXJD6S6oiHDssVjW2vPydBzeT5iQY6SJGvadzCttps9yk2m2GsWbebcfIG?=
 =?us-ascii?Q?p4nCNeqOEhQzdi0pmx85SpqAFmmsc+uU4N9s8aarho+2TJHdM96Q7e0An2Bp?=
 =?us-ascii?Q?SKzGvkFoVt7O2yvqAQHwiJInNjC6wSAnilhx4lzgofVzS7MKON7eQ9DekvdT?=
 =?us-ascii?Q?SE57hrVqw0/nNWGRx7dxazN7pA+CPIIDy3satWHRzbKFxBj/YCWbJQ92wrD+?=
 =?us-ascii?Q?HIn1oPCQeQESnBR0XC62uG27YTuyHol82R6b9pZvBG1XCOJXVZ8lKD6e8bV9?=
 =?us-ascii?Q?mIe9mifVCK1ZUvBL95evSiGi4ARsXH6YM7jaQeZr3uv8SR78HPIgH7mNTGTK?=
 =?us-ascii?Q?ZK3Gp/UChX58CYhz5sohEaA7Yz9X0VsYlI8z904VNypMQrORkVVhxIjZql32?=
 =?us-ascii?Q?+9dO/LXNOJ/Yw0pNCwKraDcbFJJLria8AWyhbPXTx9lCOEMfsZpH7qug8JO+?=
 =?us-ascii?Q?iP/DyuXcnH2utlgh45/dQ2d6Vi7hXl4ZF3sOmnIRJ0/eH4z81kjyzzjiNwGd?=
 =?us-ascii?Q?lAzBRPM4Fm43kLaTgYZkG7kLQVUJ2tj/th7jUTZjMLSflrAvXGcObYM11yAA?=
 =?us-ascii?Q?rVzyjp74Z/z/vtBTF0x5mq5VSlmq72XVqehUFFBFa4fNMUulZrGR0lsWbFqf?=
 =?us-ascii?Q?ers3zKX5kdMhVIo2kdEylrxcxuCqDWlKpfgHx0xdhcf/wjWxAgLf?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 274f6f6f-bf7b-4215-8930-08dedb02b07a
X-MS-Exchange-CrossTenant-AuthSource: TY3PR01MB11797.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jul 2026 02:02:53.2543
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5QjqmhZSutMvvPpIzUhLMiFkfVzVWhB9/W6u7uqsftC90J2kwpCqE6Efn8ZZmjXlPlHmDeSmt6+AWApc6C7/YNXgWVkEpzK7pppDULbzguadInn5PUuXV0k1J2cKRj+T
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY4PR01MB14075

It is calling snd_soc_component_initialize() / snd_soc_add_component().
We can now use snd_soc_register_component() instead.

It is using container_of() to get kunit_soc_component from component, but
will not be able to use it when capsuling has done.
We can use snd_soc_component_to_priv() instead.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
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

