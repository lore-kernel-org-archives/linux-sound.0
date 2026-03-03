Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazon11011024.outbound.protection.outlook.com [52.101.125.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88EB729BD82
	for <linux-sound@vger.kernel.org>; Tue,  3 Mar 2026 02:20:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.125.24
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772504438; cv=fail; b=mKb9td1FkaKbLkgCeClF8ipGgi3meDBt0hZQJSdS4Tnz1xBRfZKNYf/reMluxq1CG5OP13xn8U3ivGCwvoDN+VpGNHMeCVOXoe6vkMyAQgHqPVnhbr4dsAnj6Low4eMGHA2FUs8ggFCtPIlo7UfTRglxWLf/3ujgn1To4q+zh8I=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772504438; c=relaxed/simple;
	bh=pFyp7d+xz+UorqESiHhRHtHryzB6jauA7TYOIn3TzzY=;
	h=Message-ID:From:Subject:To:Cc:Content-Type:Date:MIME-Version; b=OkWDaNxT+42AIWYmyyF/EAWLez9j9c9FXjlo9Oz1hP/Eq8cVI2lbI9LoCFVSSnkgjLRfantsWIBNu5R1oPRV/1ZV/O/cE0dSgD2PGm8mP6flTlEjXYy9gqsOM18nVu5//Z4E7eq0JEIzqUTMlR015SMnmV0Qj7fGT6vsJOVjKEo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=fGBZiAi0; arc=fail smtp.client-ip=52.101.125.24
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="fGBZiAi0"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jMd6lFhAVZnT8rtD4imx+QpWxUTS54XXuQk79PoCBhH5W6D7P0HTkrt3xch+8er4g/7pwQ1GT8TaKV/f+6l+psJxjdCINf1kOJzHT8KcZIvEZ9tWHsC9ux42PjrAnUcNo1gkW2/+P43mYhNqFFh4ercqC+DRu5U2f6x420wsKQamk9rJnNEEkFMqzAeFvTwpE2g7xV+CujanKsqEWiPXRv6vJsUztD65siwjMiCWmZ6bhIlyYlajFHcizH7RM88xe40ewxCUFgeUqtldrr0qtudqCnoQEJiYCcLjoBhL0xiyL/G4xqKqrmJqUiG5BYrfR65U5jbBni8t9M5y+rxI2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eEfeFL8OF+fTbCPI5rBI4uSL7aDrd4yj1aE0ghS9ppI=;
 b=beAY2vSaAVNhmcZ+lvmQJk1qEj/Qg0vmcDYFPY+JyrH9DzNyna/R42jK+YEiHvqiJ0Smn9Lf8AVOvk6qdEbZMVvhdcweeKQdEv5xKNc7BXmt9joF3J5zpdjfMloeHOh4pfCa/BEtHrTsMnE98rTLHfrACAxojXk271oU1zLr7k+JRdVRUcF/IwM28Q38IK48O85xeqYKlKQcxhhp1Y69X9KNluNkxvmqzwXhPLOmoR53E0GJLVqlKhTi2EUX1rt/QJsv0n/++77PEFXYeDRMP5lmLCj1f6rZJSDkgd5o8m0y7Pzq7If+0KlZLRLtRyovDbaiiskNTOtjyIRVrVs2nw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eEfeFL8OF+fTbCPI5rBI4uSL7aDrd4yj1aE0ghS9ppI=;
 b=fGBZiAi0LarxBwJrSYblQLcvKQbD+eZV/tQA5d3CQ29uyTmI0zOidyZh5ZpPSakIyGJpZYx4LR7tlM7FF+CHklQ9eSmkWwUn7V8AHVtEoE4cL4DKKbqbpHS9WOVhEtx84KfEoY0E/5GsKRW5AEP2dfuJ1mrwoUxNoVlO/Q2RQUA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYYPR01MB7976.jpnprd01.prod.outlook.com (2603:1096:400:ff::13)
 by TYRPR01MB15837.jpnprd01.prod.outlook.com (2603:1096:405:2d5::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.18; Tue, 3 Mar
 2026 02:20:34 +0000
Received: from TYYPR01MB7976.jpnprd01.prod.outlook.com
 ([fe80::c654:926c:3c54:57a9]) by TYYPR01MB7976.jpnprd01.prod.outlook.com
 ([fe80::c654:926c:3c54:57a9%7]) with mapi id 15.20.9654.020; Tue, 3 Mar 2026
 02:20:34 +0000
Message-ID: <875x7dac26.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH] ASoC: soc-core: Use guard()/scoped_guard() for mutex lock
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 3 Mar 2026 02:20:33 +0000
X-ClientProxiedBy: TYCPR01CA0145.jpnprd01.prod.outlook.com
 (2603:1096:400:2b7::18) To TYYPR01MB7976.jpnprd01.prod.outlook.com
 (2603:1096:400:ff::13)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYYPR01MB7976:EE_|TYRPR01MB15837:EE_
X-MS-Office365-Filtering-Correlation-Id: 1f983478-0379-4bed-4742-08de78cb7341
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|366016|52116014|38350700014;
X-Microsoft-Antispam-Message-Info:
	w/9hUDLUtFDxLCqUole+M9pWeMGTIYOFtlVVV4aFEdLeYhAkLomCu8njKitItuQbXrF0cgoc8wGk+GSP+ke+Sf3rp29WnWaOqGrEG0pLxZF8IldspjEghz2apvEVggweeY9Bpo62hX4gxDJpGywEV0kBqGnXs/xhtEXMwaB/9hlWiYeHdjA7WKh2UN+N4gS07WaH34M0Hy9O+l822k5varfK3dvDI75DsJPm3FbBxh50zMlQpwV2CynYKPYGsdH/Ocm5Uvh6LJrcW38PMsi71bb3pgU5f+43Z6//d9mrHwEsfjpRL2RJJki2QffpMv2uH36n3vzNRTAKODzFI+ki7TsksXMzSxpVH0tE9FZFN1C1KVmum3427hj3WFbD1MWQFoMKyC6qhKlmMdLH2FxHtAm6V5SHUQgRRlvLiviZfRbhnU5vmIWtk8apF5eHy9UCfTveULCkStCz/sc+y6tGo6o+a1YRoWhkhej0fQJyxtmgm0GKS1z0sdmjzjWG9DrRHqiFtpuss9FlzBQSsMU/fehbcvCwY7B2fQ48eg59iN5jcVZB8Wx3ZZUYn215qONpx6DM9ArCpNcjWtm7oIfH3Jlcerka4Pyk824ZRJBX0XR7glOL3xmEov7tYeCpibIojki7mrpvACo5wQ4vdW98cAPnrjSYhAPBc/my77Ktuzp0w8SgT7GkX9IAECb+Y7ozDsAhZb8yipsWyAi6uWNE/R+AgsvTroNVJqb1LWagVJa5IbQPrwDweafq9V20Fyc1qG4oPzW14H6Qk956r1v53UyQyVG/hccPu6LawyGdzeI=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYYPR01MB7976.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?vZb/c3RtIF1qjUtXrUHvlxsWiOTRfwhIHAMAL5YdFKhk+x6FynNtUh5Onwmr?=
 =?us-ascii?Q?/aEMaT1PGWqeW9Au+cJdw9AryhMgaf6Appak07yWiPIl/5AU6DOy9otQs+I+?=
 =?us-ascii?Q?Orwz2FJ6B7ABon3WDWUNFrkhOaFaMl/nLIPeHsz7CvRD494Nn7j1sCltJWS7?=
 =?us-ascii?Q?VxloIuG9t8yXJPXr7js05RYbw23H0BwqYAPR8IGMHbOmH/ULZot8JLNrl5R/?=
 =?us-ascii?Q?0Ai6qEEHfoTw6Am7CQFZho9Het/mpwMP6Bn3JiqqqtW9RprMgyhLZgovLAOa?=
 =?us-ascii?Q?PvCwQgPZGOINv8R5RylmEcV7sKUC2qBq/dSj7Ibdf0en+P/6LsDVSvLsSi3C?=
 =?us-ascii?Q?E7tfoAhzaYXxajJFsuZBi1cUA1cTnKiMlaqDcklC09M2GgkDogBsQ7CY9Hy8?=
 =?us-ascii?Q?XWXICr0i5pFg8Z4lqONuPko9aq5tMxHFyuyxjglM3XPfTJiuuRrXQyxZ4TMJ?=
 =?us-ascii?Q?5Gj6rXUtdKiV7x8/7D5jD73+b3v8EC8GYcNtO2rupfnozvhdVvxtYwYh1N25?=
 =?us-ascii?Q?zPEDxc/nYRNMxCxv4xFygIjVi+fKZ/RxalX/nNLsQtfIuBKl+RERO49qNwvn?=
 =?us-ascii?Q?acB7RXyHDreJW+RmfzZxtCdjeij31HGsXRdMOjY/JgOaHv+PI8+OWdqOJuJA?=
 =?us-ascii?Q?E4fE4NkejHb7U8zXPU5OrP4YusrHyU74YvvOGbFlEpWJ9QTMCmzOKlVAGQIT?=
 =?us-ascii?Q?pSOcs6/S2nwiGNzFLtK6IToBvQo4i8yWaFcKRV/QfuaH/zDkEd/xS6pii52h?=
 =?us-ascii?Q?OGOPpFmqm8nMqTVfgR+57uHW5HZYR9qzoGfwOOiJ26AeCgTif1M0JOLdhFa3?=
 =?us-ascii?Q?11l2ISY4cB/a5xR0C5+AU/9TwzU9qZFlvDjGkfHm+2vcQlso4ccpLrG66Wz5?=
 =?us-ascii?Q?Zk3+lKIsZEb6vqmQBaBBSGqx0ZKgNA11Vo2TdNxPclv+2lcbrHsm4jaEXofI?=
 =?us-ascii?Q?Qx0XFFMs7MIBhfXW9F8eSmlIeCnANHcWQ08/ElmOf5PavQeVwm/jcm8QB0KK?=
 =?us-ascii?Q?UqJxJr1phll46ocJka9oUpoKXwiK8G0fkDey41JR7ccvWZEUbmVZWve+kI6P?=
 =?us-ascii?Q?7aBOYrHRHHvtLMyOQkQvlUpt7Mr/6JW/7/L5uB30Jz8MpyEc3NmyoqbubOQf?=
 =?us-ascii?Q?6BMrpiRIiX/y9jY4ycj3NfBU7iUyU6psFQBRDHaSCGbQLfCnozGvqHXfpFd0?=
 =?us-ascii?Q?KJceallu+0mRkZmKHMcLlnXV8b6oVFoi/XYomS9k0o7dqgbRrsHQLlYkEs8d?=
 =?us-ascii?Q?n4Ti2PUaI9zqnZfvojcFRaIGf0vQyyjFezT1JqH/dL3uYjYl19sJCcEUaPId?=
 =?us-ascii?Q?mwemFj6bvEOHkF+f1tNBgZMq+ML1GhUSx/gHYTWIYnvLv8B/YhMv3FEidefg?=
 =?us-ascii?Q?PqKAgCcZz30v/VLZzAecQlMhwJeUKYAPKk3ADuW0bH9jPBSKIdobOXvReKYc?=
 =?us-ascii?Q?m3KU7wHwAVEl7VvLcwruPEPrHnQNT1/qvFQtSXVtx/5U1s7eNa0V6U+Nsx3q?=
 =?us-ascii?Q?sLnn1WeaTPr7KYU5P/WixgDJqomawR+2mRvPNEVvNvqwSR4CUh9vKQxC0deQ?=
 =?us-ascii?Q?OZWZRXsttDnmPA0AZm8u6q13VxDuH4FrDMg3g1a5NywZqb6Pp5JKR5Gvjfrc?=
 =?us-ascii?Q?rIvLTqgWJ5eDauujYPeZQCvWQ1I8H3OVz62azTQsETuYoVWhnUYAHWLr4Msx?=
 =?us-ascii?Q?G0IBB5pI1FTYWKl8TBXaTPxgbKnuXkFifmTkvrRGEPh3iIlUUZpJ1+c4Yw/T?=
 =?us-ascii?Q?9eVnh4AhYvB/Nqck05qlYWrv8wzYUoPfloqzpxkg74kt6+/xgoSc?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1f983478-0379-4bed-4742-08de78cb7341
X-MS-Exchange-CrossTenant-AuthSource: TYYPR01MB7976.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Mar 2026 02:20:34.1824
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UsGgdxFTzHQK2OSe6S6/3ubPAwrwEC4cz/bsw+YFAo7XqCfYvQBGm9hVxhKdh4k5SxZgnCTBhkNjWIBXnepW+Mn/4H3oqjhQd/mx7lXb0z6cKpjh8kNmVct6kfiq2Jbb
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYRPR01MB15837

Replace the manual mutex lock/unlock pairs with guard()/scoped_guard().

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/soc-core.c | 68 ++++++++++++++++----------------------------
 1 file changed, 24 insertions(+), 44 deletions(-)

diff --git a/sound/soc/soc-core.c b/sound/soc/soc-core.c
index d0fffef65daf5..32e9b0e2a17de 100644
--- a/sound/soc/soc-core.c
+++ b/sound/soc/soc-core.c
@@ -167,15 +167,12 @@ static int dai_list_show(struct seq_file *m, void *v)
 {
 	struct snd_soc_component *component;
 	struct snd_soc_dai *dai;
-
-	mutex_lock(&client_mutex);
+	guard(mutex)(&client_mutex);
 
 	for_each_component(component)
 		for_each_component_dais(component, dai)
 			seq_printf(m, "%s\n", dai->name);
 
-	mutex_unlock(&client_mutex);
-
 	return 0;
 }
 DEFINE_SHOW_ATTRIBUTE(dai_list);
@@ -183,14 +180,11 @@ DEFINE_SHOW_ATTRIBUTE(dai_list);
 static int component_list_show(struct seq_file *m, void *v)
 {
 	struct snd_soc_component *component;
-
-	mutex_lock(&client_mutex);
+	guard(mutex)(&client_mutex);
 
 	for_each_component(component)
 		seq_printf(m, "%s\n", component->name);
 
-	mutex_unlock(&client_mutex);
-
 	return 0;
 }
 DEFINE_SHOW_ATTRIBUTE(component_list);
@@ -394,13 +388,9 @@ EXPORT_SYMBOL_GPL(snd_soc_lookup_component_nolocked);
 struct snd_soc_component *snd_soc_lookup_component(struct device *dev,
 						   const char *driver_name)
 {
-	struct snd_soc_component *component;
-
-	mutex_lock(&client_mutex);
-	component = snd_soc_lookup_component_nolocked(dev, driver_name);
-	mutex_unlock(&client_mutex);
+	guard(mutex)(&client_mutex);
 
-	return component;
+	return snd_soc_lookup_component_nolocked(dev, driver_name);
 }
 EXPORT_SYMBOL_GPL(snd_soc_lookup_component);
 
@@ -937,13 +927,9 @@ EXPORT_SYMBOL_GPL(snd_soc_find_dai);
 struct snd_soc_dai *snd_soc_find_dai_with_mutex(
 	const struct snd_soc_dai_link_component *dlc)
 {
-	struct snd_soc_dai *dai;
-
-	mutex_lock(&client_mutex);
-	dai = snd_soc_find_dai(dlc);
-	mutex_unlock(&client_mutex);
+	guard(mutex)(&client_mutex);
 
-	return dai;
+	return snd_soc_find_dai(dlc);
 }
 EXPORT_SYMBOL_GPL(snd_soc_find_dai_with_mutex);
 
@@ -2577,7 +2563,7 @@ int snd_soc_register_card(struct snd_soc_card *card)
 	mutex_init(&card->dapm_mutex);
 	mutex_init(&card->pcm_mutex);
 
-	mutex_lock(&client_mutex);
+	guard(mutex)(&client_mutex);
 
 	if (card->devres_dev) {
 		ret = devm_snd_soc_bind_card(card->devres_dev, card);
@@ -2589,8 +2575,6 @@ int snd_soc_register_card(struct snd_soc_card *card)
 		ret = snd_soc_bind_card(card);
 	}
 
-	mutex_unlock(&client_mutex);
-
 	return ret;
 }
 EXPORT_SYMBOL_GPL(snd_soc_register_card);
@@ -2603,10 +2587,11 @@ EXPORT_SYMBOL_GPL(snd_soc_register_card);
  */
 void snd_soc_unregister_card(struct snd_soc_card *card)
 {
-	mutex_lock(&client_mutex);
+	guard(mutex)(&client_mutex);
+
 	snd_soc_unbind_card(card);
 	list_del(&card->list);
-	mutex_unlock(&client_mutex);
+
 	dev_dbg(card->dev, "ASoC: Unregistered card '%s'\n", card->name);
 }
 EXPORT_SYMBOL_GPL(snd_soc_unregister_card);
@@ -2883,8 +2868,7 @@ int snd_soc_add_component(struct snd_soc_component *component,
 	struct snd_soc_card *card, *c;
 	int ret;
 	int i;
-
-	mutex_lock(&client_mutex);
+	guard(mutex)(&client_mutex);
 
 	if (component->driver->endianness) {
 		for (i = 0; i < num_dai; i++) {
@@ -2918,7 +2902,6 @@ int snd_soc_add_component(struct snd_soc_component *component,
 	if (ret < 0)
 		snd_soc_del_component_unlocked(component);
 
-	mutex_unlock(&client_mutex);
 	return ret;
 }
 EXPORT_SYMBOL_GPL(snd_soc_add_component);
@@ -2958,7 +2941,8 @@ void snd_soc_unregister_component_by_driver(struct device *dev,
 	if (component_driver)
 		driver_name = component_driver->name;
 
-	mutex_lock(&client_mutex);
+	guard(mutex)(&client_mutex);
+
 	while (1) {
 		struct snd_soc_component *component = snd_soc_lookup_component_nolocked(dev, driver_name);
 
@@ -2967,7 +2951,6 @@ void snd_soc_unregister_component_by_driver(struct device *dev,
 
 		snd_soc_del_component_unlocked(component);
 	}
-	mutex_unlock(&client_mutex);
 }
 EXPORT_SYMBOL_GPL(snd_soc_unregister_component_by_driver);
 
@@ -3503,7 +3486,6 @@ EXPORT_SYMBOL_GPL(snd_soc_get_stream_cpu);
 
 int snd_soc_get_dai_id(struct device_node *ep)
 {
-	struct snd_soc_component *component;
 	struct snd_soc_dai_link_component dlc = {
 		.of_node = of_graph_get_port_parent(ep),
 	};
@@ -3517,11 +3499,13 @@ int snd_soc_get_dai_id(struct device_node *ep)
 	 * Then, it should have .of_xlate_dai_id
 	 */
 	ret = -ENOTSUPP;
-	mutex_lock(&client_mutex);
-	component = soc_find_component(&dlc);
-	if (component)
-		ret = snd_soc_component_of_xlate_dai_id(component, ep);
-	mutex_unlock(&client_mutex);
+
+	scoped_guard(mutex, &client_mutex) {
+		struct snd_soc_component *component = soc_find_component(&dlc);
+
+		if (component)
+			ret = snd_soc_component_of_xlate_dai_id(component, ep);
+	}
 
 	of_node_put(dlc.of_node);
 
@@ -3533,8 +3517,8 @@ int snd_soc_get_dlc(const struct of_phandle_args *args, struct snd_soc_dai_link_
 {
 	struct snd_soc_component *pos;
 	int ret = -EPROBE_DEFER;
+	guard(mutex)(&client_mutex);
 
-	mutex_lock(&client_mutex);
 	for_each_component(pos) {
 		struct device_node *component_of_node = soc_component_to_node(pos);
 
@@ -3589,7 +3573,6 @@ int snd_soc_get_dlc(const struct of_phandle_args *args, struct snd_soc_dai_link_
 	if (ret == 0)
 		dlc->of_node = args->np;
 
-	mutex_unlock(&client_mutex);
 	return ret;
 }
 EXPORT_SYMBOL_GPL(snd_soc_get_dlc);
@@ -3644,17 +3627,14 @@ struct snd_soc_dai *snd_soc_get_dai_via_args(const struct of_phandle_args *dai_a
 {
 	struct snd_soc_dai *dai;
 	struct snd_soc_component *component;
+	guard(mutex)(&client_mutex);
 
-	mutex_lock(&client_mutex);
 	for_each_component(component) {
 		for_each_component_dais(component, dai)
 			if (snd_soc_is_match_dai_args(dai->driver->dai_args, dai_args))
-				goto found;
+				return dai;
 	}
-	dai = NULL;
-found:
-	mutex_unlock(&client_mutex);
-	return dai;
+	return NULL;
 }
 EXPORT_SYMBOL_GPL(snd_soc_get_dai_via_args);
 
-- 
2.43.0

