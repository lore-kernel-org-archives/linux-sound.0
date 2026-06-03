Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11011069.outbound.protection.outlook.com [40.107.74.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC5CC2E65D
	for <linux-sound@vger.kernel.org>; Wed,  3 Jun 2026 04:45:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.74.69
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780461956; cv=fail; b=Z3szohPU1nVpuvwYRBa5XJ8K9aSSdig3wzY4hz2tGL6YrMy52UsUe+TLgVzkKiE+CmfCMS+Tmsg7v/VNduBAUcEYrVKVW6wooCUud+CHujtvlXLg8qyyusJQvoPArKmnQwYi4Oi0i0+wQy5ExyQ3RVjUOTbDU01hOVW1SLA4wsw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780461956; c=relaxed/simple;
	bh=IJPrfSA+YjvcyxdO1fyHW5w4YfIca1HG4sMV5K91k9k=;
	h=Message-ID:To:From:Subject:Content-Type:Date:MIME-Version; b=Za6Glzwf7XrhfVGdcy3dt2rtQxY/pgIOjy3pDWj6HNTB8UZ+tSQ70BkmMcd6pQaiyFX1T5gze/1uEJd63og4/B8p7dwsXH7na/kV++8efWtPK4B/ka3mllw1lN1+IuCMKVpgCs9W3+MpKB8WEt6jt7YPghvW/yK5cUcz9Hlw+AY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=UWVD/2BA; arc=fail smtp.client-ip=40.107.74.69
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="UWVD/2BA"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XE8MKqlFvlT4g8AoZIyLOnOGCWgac7e0Cu9h1aew1Lrv/SJNW8otfdIaaSj6oYqAJfvwdWG51u3i5qui3gZSbi3PsSPvpPdroJhLk7OIyyhUjeA8six5fq4OkfRonB3lPXZaPhLpbaB02SuzdUfErakYugDe48u/20yNiHurZczoOBJKXnjlo1DMhZd74444NUR8ImOXZfxks7mw9rRqaGRl2wRxvqKESyXoJHBklprmzxlfv284on2f2j7QoT7Bo4MLiGehp6V7kzs3ZBzhbbl7e4/gZU3ftrd2VUQIBTDhA7dyRR858+oZD4sUdVxMLmJHm3EPFlzcDTH0sIY3fg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=d9Z3rqoUnLDgGD0CpfTim4knd7R5BiH/tK2tDbAsfrA=;
 b=i3Gd+P9/RKRN9WR+JYoPv+BECkUwmq3iLMqP0Jx609BVv9nCtCm9PJjIGcpfCy2MNB6l8i0q264N+6dsLPkDCnsQFCJsp0aswGqZpVSI0DqAO10eT2zm2qYeDqLKbe7RnqcN0JMtiobpRnWn+DdYgEYJfQ/fQ6hWk/Yp9+LfV2sBqrhpqiKuUf/LibALvtZnvwpqdHBc8B0ykcvv6SrPp928+VKaQrgksBI5P/Ooz4lzYhStyyveUnJJP4Yh7J1BEM0IEbxUf2vlJOvZ9V0b/QkphXG/KqYveEIJZr1bUTrdPoM602y0kBLUMvBXBtl1qwYhE9+itp8Uk31rPl0ewg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=d9Z3rqoUnLDgGD0CpfTim4knd7R5BiH/tK2tDbAsfrA=;
 b=UWVD/2BA7tos2NqptGvt0S+79Y0mndXDvpyK8mVAwahjB152bl7M4P1lpGnrzJSUiKg18dvJDIFNAvvUd1QrDm+rURP9yUlKK/2jrxXHOaO+urPTPpP2WeBz6PLFrvZ1+QhfuH/RJzLy9cq6b5g374G/9qGiRf69Gz5F3+5ScUs=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TY3PR01MB11797.jpnprd01.prod.outlook.com (2603:1096:400:373::8)
 by TYYPR01MB13283.jpnprd01.prod.outlook.com (2603:1096:405:161::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.7; Wed, 3 Jun 2026
 04:45:52 +0000
Received: from TY3PR01MB11797.jpnprd01.prod.outlook.com
 ([fe80::1868:c915:c230:a383]) by TY3PR01MB11797.jpnprd01.prod.outlook.com
 ([fe80::1868:c915:c230:a383%5]) with mapi id 15.21.0092.006; Wed, 3 Jun 2026
 04:45:52 +0000
Message-ID: <878q8wcjuo.wl-kuninori.morimoto.gx@renesas.com>
To: Jaroslav Kysela <perex@perex.cz>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Takashi Iwai <tiwai@suse.com>, linux-sound@vger.kernel.org
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [RFC][PATCH] ASoC: soc-ops-test: remove component from soc_ops_test_priv
Content-Type: text/plain; charset=US-ASCII
Date: Wed, 3 Jun 2026 04:45:51 +0000
X-ClientProxiedBy: TYCP286CA0166.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:3c6::17) To TY3PR01MB11797.jpnprd01.prod.outlook.com
 (2603:1096:400:373::8)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY3PR01MB11797:EE_|TYYPR01MB13283:EE_
X-MS-Office365-Filtering-Correlation-Id: 5cfe0df2-d6b8-4c25-3a69-08dec12afd89
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|52116014|376014|38350700014|11063799006|56012099006|18002099003;
X-Microsoft-Antispam-Message-Info:
	5Su+LkQ08qA9M+GyOBF2SyFPT+D6/j0U9fEcX+ylEaItQTJacKOmDURZgFZrWtMstCsq3qfe0IjB9ecD+IaeSJNbdXdEVgAYatbPV6weCpAVva1ThondzZHcVGdEIEat6cNM8VfgXG0pyICrv0+mYdMndOYfTVezt0wwDR7yOBRx0A5bwguLysImL8cyF+ssnQunRISdmSvPFu8N+gpeR5QNAG2ZQM8d40NeFXnpEL3HZBZEGDbMJ7g91ngrACK82IP3YJlBf+7B35SeceW33LnGcEoxy1CaO7x5xB1OGOdVbaxAyE67+vGO41H22YAUp5iW9yMeCCm4JGh/+/3fSzeA3a5Hws2MdPZPCASl3qGjsZRlf+PDIPE4FZjz7yPjWh9u6gJVNMd6yNRt7FcAc/FywIKeWDMfYsC6IbsLaeMxu8sR5Bc57XicDk16cUMp/qEQV/fVw4fe7220F3MkW2lONlsaafKOcZOEY9dFWu0SjsLBlbv9RXTKOS0bJ2NT6gHVFqw53hcMOF1oRBZA4WSIpxdV4wyifTA1qeNyXzkANnqyr5bTS4baiHqphmiHs4vaxbKnbKfKlxIFPKkVCp+az5FGbTB1dKbaa6Nhnp4Sq7mV922VEVkIodG5QzKNN4x7QnBE7wjPv5G43q795ujeSrubYXwcUQt5o1ODmcye+HircuT9g0RDBo2oScw00htbDLfKVkT6sT77LCGToApUczfAeHtSn5hqiuCts+HbM04hFunyJxqzKAs+6REr
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11797.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(52116014)(376014)(38350700014)(11063799006)(56012099006)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?i8UqI68x6OPTP827HzNIqlFWQwyrKSkCKMc9TM7eFzuL4F98gGEkAXSI5Ips?=
 =?us-ascii?Q?qbvb3+f5Hvwwuu4GOqBGv6EoSehnLMeusKvC0Gl67iUc/IHtWgBPzZyFWRuR?=
 =?us-ascii?Q?g6zdHMP2WZF7XuqK5sDFfXEhjTumEA5hh+p3X4d1FAbl6ngZXPlyGl6g+kLW?=
 =?us-ascii?Q?bzIstGMXEci3VbrcizfWN656xmkV7Qmk8tYorDp+bazk9Jtz1/1V8B5oWSDa?=
 =?us-ascii?Q?GGp1bzx5ecWefT02HMLAhHImIGbZHIf641h5KmQgza7IxU1RnvuneQynAFC/?=
 =?us-ascii?Q?JJULYlqQ5VorxwJmag0TjShfKekfsSZ4J06WyBDyQLuSSzgOD5jviD1fzlyx?=
 =?us-ascii?Q?nQj9zpMnzzwv6wiBwU42NcfYnggNcreBqZNYfBWydJniH3W3nE5psFJ6hFW0?=
 =?us-ascii?Q?1kGDvJUAIGllTduM/fMfFgfIcLG1CYEodg59Z9gQ5b8JAH1sWGVmYSFBVwRO?=
 =?us-ascii?Q?XBSw8111+U6dWtNrIneRAxCkYR/aBxFOy/260d9ilbxxrr3E52v74ANbnJtj?=
 =?us-ascii?Q?PLVhl6j071a3smyW60sDAdIxpJulFDNM9mMtqgBLbktVfagYVTK/6lGzTlf2?=
 =?us-ascii?Q?5ONfYKaOnyKVqWt52sToDyW5631GrF49R7V8RNkxy0OH0zbWeXNnuzynWQ0H?=
 =?us-ascii?Q?sCjv1HmFWcBC0ykUE/kkob77etIY61olrLtc/JHg26CwcNARhhkIbojfsjLo?=
 =?us-ascii?Q?05ukFQ5iSo2eBKBlkwpqsl8ScAPvUZKT0uQHlLdu1/fxoAUnHXh47XjkVj5c?=
 =?us-ascii?Q?2Dp4O8hTnLofezwmwhKejX7C+F20jUdr4ZtV4fSEhZxPA7p/w9DkwoXvMrWF?=
 =?us-ascii?Q?XTExjLsJx1fbnBHvt9ovlfs2EtjNTCKEMXpXRRTS0Rf3VpoeXpuHLi4cSYwk?=
 =?us-ascii?Q?/IlZA/DaFjxoLtDKw7TmwnwfQir1MOWfmz1eBuUPWmsrsTQtsvmypsRygJ+z?=
 =?us-ascii?Q?j06hzWAIMMwpTiQNBtbxaTpwwNPcvrDn6iIMS7YDsLwQ9psMKGxd7qVDbtTW?=
 =?us-ascii?Q?+dAJ540bkQVMyGNcNB3xmb7XdhCZWlvjwtAi+yte5OTo1BwkMiXNSiUpustg?=
 =?us-ascii?Q?sZJlPCI9wody36sZHh85i9IfznPmTjNfyHcr3YkkyNmCgl7mYokXQmykVwLm?=
 =?us-ascii?Q?ihXz8ja/inziwplHkctMaSNywk0iF3/joaNVy3Re+nB5hLjTFEN67i91GX1T?=
 =?us-ascii?Q?pDEQ3aIvczRi9kG9EkqmC27mKluhzrsF7ZGWSDQn7C5QgKwux7Fgc70Bto4E?=
 =?us-ascii?Q?oYchg40lZQ3wj8bTgNLdCbXwsR5PEWkubFmnNa/hibhdCbY67crIWsIChmkv?=
 =?us-ascii?Q?kfaIACophJgJIS/HXc2Oum87zHSZu4ez6rFYVdWkBzzovl5GHJ55/f8LH6q1?=
 =?us-ascii?Q?0Zj7rj58CdNp8YRhdoC2g1i6SDK99tpmwHHgfBSmPThvIQ8Lk0M3pbBCWjNY?=
 =?us-ascii?Q?qPDAsBBL6/dfE4q+APeBmaChmUTiNCaY0elYTY0NuTez9JwU5LKbPvQQIct/?=
 =?us-ascii?Q?/c3/3HKQpJdnc1VOl7laiBQADpm7Pr78ocX9/4VmiZsiGsjuFlj+ayFbELmJ?=
 =?us-ascii?Q?OnR5JQW5ETEGrztEVfLgFqa9YZpO5xK4nw509lKwmWaWH+n9PxJGy8GQtVqp?=
 =?us-ascii?Q?yp0fZ6CPlmsAMMs56LvqaNDUdskebV7YXconzgx9IxJqucCkonh0p1wT+Wk4?=
 =?us-ascii?Q?4yaE5/M2yEwmRszR0aal3tETKj5eWT7OZHvvpWsEoiel2GAdE810Hu7EJP+J?=
 =?us-ascii?Q?aSKKddTR0z9VaU1k9IFvqNi0qe4ATfEjqyGXkEcRJZYCOxH0fqHe?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5cfe0df2-d6b8-4c25-3a69-08dec12afd89
X-MS-Exchange-CrossTenant-AuthSource: TY3PR01MB11797.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jun 2026 04:45:52.2179
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3yfQamkjCz318Ivtr11EVKVeENFf/G22lhSLUuzDfdzCh6xpMfbRmaCWn2z+Fv6s4Le4MYOVz6fVxWuVgn7OcFUEhzKTQ3biNMUV4xPKVRr3NW+ETnQRyhJ0CNS9OObV
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYYPR01MB13283

No need to have component in soc_ops_test_priv. Remove it.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
In my understanding, component is not needed in soc_ops_test_priv,
but not 100% sure. This needs Acked-by / Tested-by.

 sound/soc/soc-ops-test.c | 21 +++++++++------------
 1 file changed, 9 insertions(+), 12 deletions(-)

diff --git a/sound/soc/soc-ops-test.c b/sound/soc/soc-ops-test.c
index dc83107930e49..6898d3384e794 100644
--- a/sound/soc/soc-ops-test.c
+++ b/sound/soc/soc-ops-test.c
@@ -67,7 +67,8 @@ enum soc_ops_test_control_layout {
 struct soc_ops_test_priv {
 	struct kunit *test;
 
-	struct snd_soc_component component;
+	struct device *dev;
+	struct regmap *regmap;
 };
 
 struct info_test_param {
@@ -402,9 +403,8 @@ static int soc_ops_test_init(struct kunit *test)
 	/* No actual hardware, we just use the cache */
 	regcache_cache_only(regmap, true);
 
-	priv->component.dev = dev;
-	priv->component.regmap = regmap;
-	mutex_init(&priv->component.io_mutex);
+	priv->dev = dev;
+	priv->regmap = regmap;
 
 	test->priv = priv;
 
@@ -415,7 +415,7 @@ static void soc_ops_test_exit(struct kunit *test)
 {
 	struct soc_ops_test_priv *priv = test->priv;
 
-	kunit_device_unregister(test, priv->component.dev);
+	kunit_device_unregister(test, priv->dev);
 }
 
 static void info_test_desc(const struct info_test_param *param, char *desc)
@@ -431,12 +431,10 @@ static void info_test_desc(const struct info_test_param *param, char *desc)
 
 static void soc_ops_test_info(struct kunit *test)
 {
-	struct soc_ops_test_priv *priv = test->priv;
 	const struct info_test_param *param = test->param_value;
 	const struct snd_ctl_elem_info *target = &param->uinfo;
 	struct snd_ctl_elem_info result;
 	struct snd_kcontrol kctl = {
-		.private_data = &priv->component,
 		.private_value = (unsigned long)&param->mc,
 	};
 	int ret;
@@ -478,7 +476,6 @@ static void soc_ops_test_access(struct kunit *test)
 	struct soc_ops_test_priv *priv = test->priv;
 	const struct access_test_param *param = test->param_value;
 	struct snd_kcontrol kctl = {
-		.private_data = &priv->component,
 		.private_value = (unsigned long)&param->mc,
 	};
 	unsigned int val;
@@ -490,9 +487,9 @@ static void soc_ops_test_access(struct kunit *test)
 	if (!result)
 		return;
 
-	ret = regmap_write(priv->component.regmap, 0x0, param->init);
+	ret = regmap_write(priv->regmap, 0x0, param->init);
 	KUNIT_ASSERT_FALSE(test, ret);
-	ret = regmap_write(priv->component.regmap, 0x1, param->init);
+	ret = regmap_write(priv->regmap, 0x1, param->init);
 	KUNIT_ASSERT_FALSE(test, ret);
 
 	result->value.integer.value[0] = param->lctl;
@@ -503,11 +500,11 @@ static void soc_ops_test_access(struct kunit *test)
 	if (ret < 0)
 		goto end;
 
-	ret = regmap_read(priv->component.regmap, 0x0, &val);
+	ret = regmap_read(priv->regmap, 0x0, &val);
 	KUNIT_ASSERT_FALSE(test, ret);
 	KUNIT_EXPECT_EQ(test, val, (param->init & ~param->lmask) | param->lreg);
 
-	ret = regmap_read(priv->component.regmap, 0x1, &val);
+	ret = regmap_read(priv->regmap, 0x1, &val);
 	KUNIT_ASSERT_FALSE(test, ret);
 	KUNIT_EXPECT_EQ(test, val, (param->init & ~param->rmask) | param->rreg);
 
-- 
2.43.0

