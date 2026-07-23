Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazon11010007.outbound.protection.outlook.com [52.101.229.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 483193CAA55
	for <linux-sound@vger.kernel.org>; Thu, 23 Jul 2026 06:34:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.229.7
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784788497; cv=fail; b=in5Uz03MLpDGAMQyr215Eo6A3gKZt9PUzBNaN2E1FoIzDZMtmyDCQsMqPowAWzswJH9sv51uFop1U3JS5QZ0BKpYGdhukoCoCWRl7AVakQv5V2qMEHm6TYspFkA/HRG4II0/qlyAmTVOC80m+2LgubgvvTETNkY2YAHlYBTuzO0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784788497; c=relaxed/simple;
	bh=R7V/5DU3+E0Zi6tl0fNHwmzE0rbuSTw2RuD7KEnPdkk=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=r/k9LWUF8fLihU2JezZwWeVHCWBrRx32Jg3+uGmXO2evmAiFk+2SAQ6Rkigem1hqufjkp0+MF8wgAq9yYZ5qA7/54SzdYDxfFkDfp/c+tLqCTcNM4/GVjWXdnJVccWe0BggCbR+Lo15aTgQHxD6K76QRI2Z8x0Jdnz4hMX4rIRc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=TSwObGDm; arc=fail smtp.client-ip=52.101.229.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="TSwObGDm"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GYHOC171p0qcnc6sdBRFjA4ozOAO8yvHgkQhhc7SLYJWWgN9ZhNV6+OJEVrcuXCxeYBxCKVOwFokLWbCloy6dG2U41pHHFVhMKIIJUX7u426sUz3ul2qA4cNA0t8AZfJUfuj79BRg2Gi5zzziNc2Q0YGny+TUeMdDwmF/IlZe7D3WZf2G2q0kWdiODGSCc7ZOBSkPiTP+/WdOa7DxQApWBiHh9xxAUMha0j9j8H4N0rrlWNbsI0h5Q0FHmU8pXyItaxokYUjGfYWyR/6yzWZKQLCV/HdwsoVQZ0ei8mQK5VC02uc7A4K4kDLpK5R68mldwyR0AuyE6KCWTG/FwiVHQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zHl3e/U8y+wZ6eLc5IgszrAZR1vzcCO9onL72rn955U=;
 b=Ir5ovH5l9c7cDKatGo0V+8iEFx4unskGWm5BGTWnXKCalqKistHxvmkfJhoEBjkkcblSN+7nxg/4HlId4paLO3nfhVUQXaM+YDujH860iFjCTowDtbzFDLanwKr52BDltdUerFKx1Ppjf7uwOFYO+pzgQOArqbfHrz7xcbm7KKE/Yb/++uFQ1LoKXZSb2JwP5OgGu3VmM5Ddwm9hQxf5bnmP8YmHQKoJWJ+C6zdqzNigtM/ckvFKWMXINXL99JkfLfcl54KwzCkZqEyOiiR52jAMJJMoX0snqKDY7qC5RiWA7kPxhVGTTlC1b0LZOkuMOXocYkmLN1ESD3tprKAUuQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zHl3e/U8y+wZ6eLc5IgszrAZR1vzcCO9onL72rn955U=;
 b=TSwObGDmmOfnx268f0FtOwgliBAr0T83PqSltgaXDSxFx7st85ylWO86OM6dAgSrVlcv+7A5vhM1SYwr3gZNJY3VFErjuhheOXbpbk8fhKlt+IAY1oEu07+DJIn5tDApH7MIYcrQyhQnV6uVgAoP0gstJtmu9BPscqAFWmw4N+s=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TY3PR01MB11797.jpnprd01.prod.outlook.com (2603:1096:400:373::8)
 by OS7PR01MB15042.jpnprd01.prod.outlook.com (2603:1096:604:38c::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.10; Thu, 23 Jul
 2026 06:34:53 +0000
Received: from TY3PR01MB11797.jpnprd01.prod.outlook.com
 ([fe80::1868:c915:c230:a383]) by TY3PR01MB11797.jpnprd01.prod.outlook.com
 ([fe80::1868:c915:c230:a383%4]) with mapi id 15.21.0245.009; Thu, 23 Jul 2026
 06:34:53 +0000
Message-ID: <87jyqmrz76.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH v5 10/12] ASoC: soc-topology-test: use snd_soc_register_component()
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
In-Reply-To: <87y0f2rz8l.wl-kuninori.morimoto.gx@renesas.com>
References: <87y0f2rz8l.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Thu, 23 Jul 2026 06:34:53 +0000
X-ClientProxiedBy: TY4PR01CA0049.jpnprd01.prod.outlook.com
 (2603:1096:405:372::14) To TY3PR01MB11797.jpnprd01.prod.outlook.com
 (2603:1096:400:373::8)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY3PR01MB11797:EE_|OS7PR01MB15042:EE_
X-MS-Office365-Filtering-Correlation-Id: 28ecdc5a-9ec1-41d2-0160-08dee884814c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|23010399003|52116014|376014|7416014|921020|38350700014|11063799006|56012099006|10067099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	oLdLwEm5gAAGmXEI+JIBaDYw/PWiRzL+cbWFEtqDIhZbUvvg18Az2x/wOmJBkUdP8LTgeP1K3DBpsEzmZmJPWYihd8ghWt2mzjMURyqq0cA+9xe7vdZHTsdyR2rpjt8uSMZc55JnzaVbVGo/lLtf2fz/kmKgYc0EGdW0PRUc5AzBMEZodaA49oAV7lW4VlnhaMQNPl1GoViVK5YpzDQcc4I9gik++1mm8tcNmB0zLO5yjgAWrnoip7SUdqnI2mxT9INqVuGFwpUMB4fSC3r/oodP0YhL3qD5y4Vh1L/Qo0rUtW5QdBtvOSWUvaIN/hqkHBWN/3xxsWcbqSDgp+I9RC7ZvJsgKHz0HbnlaweiZ1Utq2i+rFOGs3yHdluk2579cRs0B+n9gKkuK6aW35UUkfPhW45bhKam11YSl4SVICtbPJe0/wc90PQxwMyLhPmpwZLEvbRmB+ZT/Md0nMin3O6EJmvwAcACqea3UwBMNwm++NNKdj+UMTpnK5o3Fvie6C/wbFv9dYtjH/iQKitvUF0WVLZ5ymXURAc/hsmnfeZgZjdkrsihnd2JtY7r4bgEQ9KWWZ+wsk6kFGbVDaM7Irljlo+CgDAbHQ/DX1Yi6iEMywpOWFzi4iob/eD/Eg1fPwMxFXtFo2+q9H06DwKWO+ZSZqWZ/LXTNsRH0L9zRc3XH/1y2FiWCE+LPqZriTSkpk2O+w3A7VWFVn+696Iosq9ElCrgleSPJDKguQjLDSlhEVDQkGq8HqaLl215TCU5
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11797.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(23010399003)(52116014)(376014)(7416014)(921020)(38350700014)(11063799006)(56012099006)(10067099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?RASkpDr953NGAzSMGT3Llwbc/c5x5ANZwfMUvPidkay04zsdk99CqeiCsgtE?=
 =?us-ascii?Q?kKBR25hxC4xTDRFr4P4/z84JcYEyKeBtWGtdEm3DMhtIKZPv05x0TW13dDXH?=
 =?us-ascii?Q?V2nENvo4tArM2ULwvJzLG4gxMfKbwEWQAqaLsrzu9DCiMqo6dluH4hNhnyPq?=
 =?us-ascii?Q?gjzt9ONg2DrM0JcErPDn1+ntaUAKCWyv/V/lxgssre7CVbrRu650MTIlonYB?=
 =?us-ascii?Q?n9sBOb+Y1p5GUmWraooIXAfu8+OhZovUvsOBFs//C8vDQio1N1ck9t0nqZ+H?=
 =?us-ascii?Q?e2NWo/XMpRZQIiagf2iMzQ1oqtYOs1OAttEsHQE3SgqmyH4QEouD0+I03vcf?=
 =?us-ascii?Q?CCOrKum3+hkbbpm67uUgmfNzCxMiWfZvsLUfxqFuUuiC+ux1zp2th5c0zlTP?=
 =?us-ascii?Q?32w+RCwRIyPPUfEniS3eEbKHXiBf8ACgQt/uwi93/InuHv3VxepopYVO7g+q?=
 =?us-ascii?Q?G2zKaOMFoIOMnYe+0A0yKeas29x9lWRSffKgozRUTU0Q5pjqXBGYc3d69d7y?=
 =?us-ascii?Q?D5kj+ZFpp51ffbjLv7RSUqjNidUacYiOvhGEGcyDuxUTGSLkgRh8lyLfK6ZV?=
 =?us-ascii?Q?eBdMZXwF5MctetpXG3LBJE/nFV9jiuckbiscrUQ/dbdi6rLC9MHwhapo3hNs?=
 =?us-ascii?Q?FVlBuI+Qt4m+m+i5OH3U5728gyNQPVtE7Ga24+cmTuJN/mBuJzyXKi4aegaD?=
 =?us-ascii?Q?u6uht1W0d/6ep6Tu8Cfr5L7UFwSeoLL3pXfAPRxX7+kRfBDgpmhbIwh+uhyT?=
 =?us-ascii?Q?gVwVaQjA1bIfm/ENfDPyUzIYRJBJjL76P/TV9+CrgNFApgG7wqPEQ2ZNPof/?=
 =?us-ascii?Q?+KI76h6s7amqP7ZvKhFbKuszce+0LMe1rQqyHTjT/QjU8eLitVmLMUV1m3ed?=
 =?us-ascii?Q?ixK4jAj927w7Lowm206OaP8lKM2pySK4cJvdFCV3vT4e23/Hivbx/rTebqYD?=
 =?us-ascii?Q?Dz0awLbd1kpog5cWTP/EtfJsY9JxsEwg4DYJMymjSYbjZFnjKFaBL/9z0qeb?=
 =?us-ascii?Q?lAgzyU4RyYjOD5UdYD1s3bpDLnPgm0sithMpOM5ZSBrKBy8or4s7q71fKSCG?=
 =?us-ascii?Q?BsKgHVSqGNewGu4v6YVwmWZf9qMc7xt29kxJ39KQWUkflHffU0yHZ0jA2l6d?=
 =?us-ascii?Q?wa4EcC05WnKlORnosEmmcrajA5Wss2cyuJ1ORmEhbUfJtU2xHzYFqRF54G0D?=
 =?us-ascii?Q?LqFrx2USfZdj6l2KD3IgbpGjFTPkc8Nl5k40+eKnkPi0vuVuIIXyh+n7xiTI?=
 =?us-ascii?Q?5ENy1XiTYOnCi4FowoMhGB81ukHPSz3t4X7sonkj9AdNMuK22U0nL4Lvyff2?=
 =?us-ascii?Q?phuJxDpf2uvXSDxDhZLbrRHHQ1WvtjpOuS/udwgg2HbArKC1uNb4/nC4RxOP?=
 =?us-ascii?Q?1bqO0UPAfA7aoMROOvZt1OMx6Vnw5lZlTFA25ZIEKzcQbeHYz0UQlrxXgHKl?=
 =?us-ascii?Q?XcZGvx5rho5jDvXfVWcmcYlfQypt75pJLnyc+L3ZvS4g/tgDymRDP8IvWsxD?=
 =?us-ascii?Q?CnNg8UItJ4vZSyaQjiRbFUaRd2n57DodqBVQA1wqrpa9D/njkNqp8D/4pDUN?=
 =?us-ascii?Q?TLrPeGnuXz+vrE9RrskoAN8L60dNi2v6bKHNLiD9BCJQd2dmHfkDSQI+Q0b0?=
 =?us-ascii?Q?c1eTjEXftlABD0hGxUik8b4D3g0dyjjFGFFtsRdmGC/OY3vbjhw11hI5CbHg?=
 =?us-ascii?Q?EsLTmT8s0uwfejLeovG7o7EefG4B1/E7feY77orrwtYV+WTDVEWm52vM+k3l?=
 =?us-ascii?Q?rGW037yzyueqb91Otaay/8JEa69WXPcOAiOZRnRqkrjUwLiSm6UN?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 28ecdc5a-9ec1-41d2-0160-08dee884814c
X-MS-Exchange-CrossTenant-AuthSource: TY3PR01MB11797.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jul 2026 06:34:53.6782
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ao9tVVpdtnWYMJxN7366z+2zx1AzVlv3YmE+QWLaqiin6tAB3V4uf72ZX5r4Ip/cfgpattU93viDYuVaFshq1MVQxAir780alaYfMSdXxKUORgwj8T+Infiyl6cxZQjA
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS7PR01MB15042

It is calling snd_soc_component_initialize() / snd_soc_add_component().
We can now use snd_soc_register_component() instead.

It is using container_of() to get kunit_soc_component from component, but
will not be able to use it when capsuling has done.
We can use snd_soc_component_to_priv() instead.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Reviewed-by: Cezary Rojewski <cezary.rojewski@intel.com>
---
 sound/soc/soc-topology-test.c | 133 +++++++++++++++++++++-------------
 1 file changed, 81 insertions(+), 52 deletions(-)

diff --git a/sound/soc/soc-topology-test.c b/sound/soc/soc-topology-test.c
index c8f2ec29e9703..346a52d3006a6 100644
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
@@ -249,15 +246,17 @@ static void snd_soc_tplg_test_load_with_null_comp(struct kunit *test)
 	kunit_comp->card.num_links = ARRAY_SIZE(kunit_dai_links);
 	kunit_comp->card.fully_routed = true;
 
+	component = snd_soc_component_alloc(test_dev);
+	KUNIT_ASSERT_NOT_NULL(test, component);
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
@@ -276,6 +275,7 @@ static void snd_soc_tplg_test_load_with_null_comp(struct kunit *test)
 static void snd_soc_tplg_test_load_with_null_ops(struct kunit *test)
 {
 	struct kunit_soc_component *kunit_comp;
+	struct snd_soc_component *component;
 	int ret;
 
 	/* prepare */
@@ -291,15 +291,17 @@ static void snd_soc_tplg_test_load_with_null_ops(struct kunit *test)
 	kunit_comp->card.num_links = ARRAY_SIZE(kunit_dai_links);
 	kunit_comp->card.fully_routed = true;
 
+	component = snd_soc_component_alloc(test_dev);
+	KUNIT_ASSERT_NOT_NULL(test, component);
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
@@ -318,8 +320,7 @@ static void snd_soc_tplg_test_load_with_null_ops(struct kunit *test)
  */
 static int d_probe_null_fw(struct snd_soc_component *component)
 {
-	struct kunit_soc_component *kunit_comp =
-			container_of(component, struct kunit_soc_component, comp);
+	struct kunit_soc_component *kunit_comp = snd_soc_component_to_priv(component);
 	int ret;
 
 	/* instead of passing fw pointer as third argument, pass NULL here */
@@ -338,6 +339,7 @@ static const struct snd_soc_component_driver test_component_null_fw = {
 static void snd_soc_tplg_test_load_with_null_fw(struct kunit *test)
 {
 	struct kunit_soc_component *kunit_comp;
+	struct snd_soc_component *component;
 	int ret;
 
 	/* prepare */
@@ -353,15 +355,17 @@ static void snd_soc_tplg_test_load_with_null_fw(struct kunit *test)
 	kunit_comp->card.num_links = ARRAY_SIZE(kunit_dai_links);
 	kunit_comp->card.fully_routed = true;
 
+	component = snd_soc_component_alloc(test_dev);
+	KUNIT_ASSERT_NOT_NULL(test, component);
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
@@ -375,6 +379,7 @@ static void snd_soc_tplg_test_load_with_null_fw(struct kunit *test)
 static void snd_soc_tplg_test_load_empty_tplg(struct kunit *test)
 {
 	struct kunit_soc_component *kunit_comp;
+	struct snd_soc_component *component;
 	struct tplg_tmpl_001 *data;
 	int size;
 	int ret;
@@ -401,15 +406,17 @@ static void snd_soc_tplg_test_load_empty_tplg(struct kunit *test)
 	kunit_comp->card.num_links = ARRAY_SIZE(kunit_dai_links);
 	kunit_comp->card.fully_routed = true;
 
+	component = snd_soc_component_alloc(test_dev);
+	KUNIT_ASSERT_NOT_NULL(test, component);
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
@@ -425,6 +432,7 @@ static void snd_soc_tplg_test_load_empty_tplg(struct kunit *test)
 static void snd_soc_tplg_test_load_empty_tplg_bad_magic(struct kunit *test)
 {
 	struct kunit_soc_component *kunit_comp;
+	struct snd_soc_component *component;
 	struct tplg_tmpl_001 *data;
 	int size;
 	int ret;
@@ -456,15 +464,17 @@ static void snd_soc_tplg_test_load_empty_tplg_bad_magic(struct kunit *test)
 	kunit_comp->card.num_links = ARRAY_SIZE(kunit_dai_links);
 	kunit_comp->card.fully_routed = true;
 
+	component = snd_soc_component_alloc(test_dev);
+	KUNIT_ASSERT_NOT_NULL(test, component);
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
@@ -480,6 +490,7 @@ static void snd_soc_tplg_test_load_empty_tplg_bad_magic(struct kunit *test)
 static void snd_soc_tplg_test_load_empty_tplg_bad_abi(struct kunit *test)
 {
 	struct kunit_soc_component *kunit_comp;
+	struct snd_soc_component *component;
 	struct tplg_tmpl_001 *data;
 	int size;
 	int ret;
@@ -511,15 +522,17 @@ static void snd_soc_tplg_test_load_empty_tplg_bad_abi(struct kunit *test)
 	kunit_comp->card.num_links = ARRAY_SIZE(kunit_dai_links);
 	kunit_comp->card.fully_routed = true;
 
+	component = snd_soc_component_alloc(test_dev);
+	KUNIT_ASSERT_NOT_NULL(test, component);
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
@@ -535,6 +548,7 @@ static void snd_soc_tplg_test_load_empty_tplg_bad_abi(struct kunit *test)
 static void snd_soc_tplg_test_load_empty_tplg_bad_size(struct kunit *test)
 {
 	struct kunit_soc_component *kunit_comp;
+	struct snd_soc_component *component;
 	struct tplg_tmpl_001 *data;
 	int size;
 	int ret;
@@ -566,15 +580,17 @@ static void snd_soc_tplg_test_load_empty_tplg_bad_size(struct kunit *test)
 	kunit_comp->card.num_links = ARRAY_SIZE(kunit_dai_links);
 	kunit_comp->card.fully_routed = true;
 
+	component = snd_soc_component_alloc(test_dev);
+	KUNIT_ASSERT_NOT_NULL(test, component);
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
@@ -590,6 +606,7 @@ static void snd_soc_tplg_test_load_empty_tplg_bad_size(struct kunit *test)
 static void snd_soc_tplg_test_load_empty_tplg_bad_payload_size(struct kunit *test)
 {
 	struct kunit_soc_component *kunit_comp;
+	struct snd_soc_component *component;
 	struct tplg_tmpl_001 *data;
 	int size;
 	int ret;
@@ -622,15 +639,17 @@ static void snd_soc_tplg_test_load_empty_tplg_bad_payload_size(struct kunit *tes
 	kunit_comp->card.num_links = ARRAY_SIZE(kunit_dai_links);
 	kunit_comp->card.fully_routed = true;
 
+	component = snd_soc_component_alloc(test_dev);
+	KUNIT_ASSERT_NOT_NULL(test, component);
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
@@ -644,6 +663,7 @@ static void snd_soc_tplg_test_load_empty_tplg_bad_payload_size(struct kunit *tes
 static void snd_soc_tplg_test_load_pcm_tplg(struct kunit *test)
 {
 	struct kunit_soc_component *kunit_comp;
+	struct snd_soc_component *component;
 	u8 *data;
 	int size;
 	int ret;
@@ -670,15 +690,17 @@ static void snd_soc_tplg_test_load_pcm_tplg(struct kunit *test)
 	kunit_comp->card.num_links = ARRAY_SIZE(kunit_dai_links);
 	kunit_comp->card.fully_routed = true;
 
+	component = snd_soc_component_alloc(test_dev);
+	KUNIT_ASSERT_NOT_NULL(test, component);
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
@@ -693,6 +715,7 @@ static void snd_soc_tplg_test_load_pcm_tplg(struct kunit *test)
 static void snd_soc_tplg_test_load_pcm_tplg_reload_comp(struct kunit *test)
 {
 	struct kunit_soc_component *kunit_comp;
+	struct snd_soc_component *component;
 	u8 *data;
 	int size;
 	int ret;
@@ -720,16 +743,19 @@ static void snd_soc_tplg_test_load_pcm_tplg_reload_comp(struct kunit *test)
 	kunit_comp->card.num_links = ARRAY_SIZE(kunit_dai_links);
 	kunit_comp->card.fully_routed = true;
 
+	component = snd_soc_component_alloc(test_dev);
+	KUNIT_ASSERT_NOT_NULL(test, component);
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
@@ -745,6 +771,7 @@ static void snd_soc_tplg_test_load_pcm_tplg_reload_comp(struct kunit *test)
 static void snd_soc_tplg_test_load_pcm_tplg_reload_card(struct kunit *test)
 {
 	struct kunit_soc_component *kunit_comp;
+	struct snd_soc_component *component;
 	u8 *data;
 	int size;
 	int ret;
@@ -772,11 +799,13 @@ static void snd_soc_tplg_test_load_pcm_tplg_reload_card(struct kunit *test)
 	kunit_comp->card.num_links = ARRAY_SIZE(kunit_dai_links);
 	kunit_comp->card.fully_routed = true;
 
-	/* run test */
-	ret = snd_soc_component_initialize(&kunit_comp->comp, &test_component, test_dev);
-	KUNIT_EXPECT_EQ(test, 0, ret);
+	component = snd_soc_component_alloc(test_dev);
+	KUNIT_ASSERT_NOT_NULL(test, component);
 
-	ret = snd_soc_add_component(&kunit_comp->comp, NULL, 0);
+	snd_soc_component_set_priv(component, kunit_comp);
+
+	/* run test */
+	ret = snd_soc_register_component(component, &test_component, NULL, 0);
 	KUNIT_EXPECT_EQ(test, 0, ret);
 
 	for (i = 0; i < 100; i++) {
-- 
2.53.0

