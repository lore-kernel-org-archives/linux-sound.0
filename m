Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazon11010049.outbound.protection.outlook.com [52.101.229.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F40D12C544
	for <linux-sound@vger.kernel.org>; Tue, 11 Nov 2025 00:19:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.229.49
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762820371; cv=fail; b=SW5Jd3FQdfoiXtxMaauNiagajQ6CkdWYKyWql9h2E37SQod7D+iulZ4PWbO9mTEwKLn53uxBZ3pqbqv2gFDbluS3YQVnliP1vPLTlnTzUqWSVhHexX/5F6RGL8PSyulVcbjtqNpbSnZi8L9UXGzcxTzWgtVgfQsKnodtuIQ8zOI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762820371; c=relaxed/simple;
	bh=2JjnQuFyNji1TluMGwoBquZ/mkU9s/Y3QalKQqf7P8g=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=Sfb645stLFOSnEYX1HK4NCVsMIgofVuQGIZ8VAIeIbKZ8aXLgZYfeL7MJh6T3esuTvHGA/Y1UmeSKSQB8Ro9+tiargY5sRfCM9OarVMcWxDXehs5uMi8IVZ+pGxzEt8kGoE/f2PHLERkw5u3qSAGgKGksI4sgl1J9fIrkSA58A4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=gDfdcBQp; arc=fail smtp.client-ip=52.101.229.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="gDfdcBQp"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=asqg2ku2cFIxfLL6kLOqngYuHN4JyBrtEjNG+X9kSTk0EL0h629zj0tWb4Nwy18je6oFLUMgaK2v+Yhq/ZOV38vg006YdHAWkE0UUtjAm3Z3iKXx7rjQ7g1eFfZHnZGy97lfsYKHDlYvuoQHEjZZ5AC9TOhTRKNp89Klmg9TtsQuAxzftsYqNdpKnUEbnaB2j34TJ9b2N6vJlSsL7TS0JcC+IsR7LKT0Z7/K058i29CzhHBlxgykqdFJTl3J+BEZ/R1GpmvhGVWRaW4NZaeXYp90yWDs0U45le96317wTMEcSH4U7dBAopCvmm+Oc7VsmW7Wc8ZlYtKSlH+qu837Wg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tStLWcrix5IWxhxmd4FLa5TI4Q6bJfSiloOpP/e7GvA=;
 b=m+imz3XMLAXsfZL2bUYjHv+C32tOyOro9m7WUFxqVuXRAM5NR22wxKHTXbFCZrdxpcHfHLCpN1TusiL6brnmuY3qK3fs4v6qmGqAw5O2wxlRPbXft99+DM9msYfMP9sh1ToCnb2ctgoTbFtyozuQ8Sp3Nd8SUCEv6yQgLReFVlrsHP+DaetyNQnd6YpAbI6cZ5jUv0/aMsAYJkyYCEZIUX/em5rBB3aEfUUtZMM20BgUhJNdMXOWeeQIgu3Z+LPXyTPM/AdUACGYLliB3Zx6iiZIOU0sQ5Kre1I2rmPfFuzDDDo3hWVFiJZFzO/RzruuWcA5+BaWM/XV4U9kJQ3Qcg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tStLWcrix5IWxhxmd4FLa5TI4Q6bJfSiloOpP/e7GvA=;
 b=gDfdcBQp2Un+9G2i6ayxKK5wenFXeEiitoS/AaBL2T3cwuzwSF9nHby52cEl93HrxnvCckwq0y/9rcHtRBc1QYz2RISQx5ZZijWoxzRcK/j/kR4dyRtvzJrsNnqKcuLBsija4Im7Gsh8t1JosXTsZKZOSKhzh6qbgr/Of03mfwU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by OS7PR01MB14361.jpnprd01.prod.outlook.com
 (2603:1096:604:38b::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.15; Tue, 11 Nov
 2025 00:19:27 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%3]) with mapi id 15.20.9320.013; Tue, 11 Nov 2025
 00:19:26 +0000
Message-ID: <87a50t8lpt.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 026/292] ASoC: codecs: arizona: convert to snd_soc_dapm_xxx()
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <87cy5pa0ea.wl-kuninori.morimoto.gx@renesas.com>
References: <87cy5pa0ea.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 11 Nov 2025 00:19:26 +0000
X-ClientProxiedBy: TY4PR01CA0093.jpnprd01.prod.outlook.com
 (2603:1096:405:37d::12) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|OS7PR01MB14361:EE_
X-MS-Office365-Filtering-Correlation-Id: 37a5ac95-4a51-4c5b-088a-08de20b7f955
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|52116014|376014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?QCnadEZ0RRu5X1Wop28XakeHJGGOrx6QyTH6gWYgzmgC4NcNUHKjp549ftP1?=
 =?us-ascii?Q?vLw1nMpRtAKAMPePdZq2eKpsY86TJD8DhzgzdHBXPNeH2siz7v9pWcW+qi1y?=
 =?us-ascii?Q?trl9Fu3ua510dMFl+DGFn0iWT4BZZuasIEmcFEY8NzcUjb8awUqMJUMeLjmD?=
 =?us-ascii?Q?C5dQMiQw7cmgROBXLOuqiLoGVBMS975Cz+TaMs7QtmpPz3sV6SGwwJSIC2T5?=
 =?us-ascii?Q?F2S96G+IxYuPB5oDOEdB09la5IIue7toPD4wAGdVIcSiLK0w9psIXAlSHJez?=
 =?us-ascii?Q?tRwz7ZZzmcAcgdev7Vj0ifqpnI+AQgZ0RAShrzdLw6c+Q2aoz+5wlXQkrc+d?=
 =?us-ascii?Q?lRmH8Fffz7MUb8OVellsoKtZe9FWlajgFSUJIp5mSpjzLBHcnXsao/cdqzFj?=
 =?us-ascii?Q?W1IkYTr/2pBRk6aX4oXYe/tiNYpaCX7ECfCBYjTcFcdiDNZ7WYr/36/ltems?=
 =?us-ascii?Q?SmVIQVxvohN7TjziJH2PcFSfsWgMGYIONW8hrVNDADtcr2Wrq15zI9zSgtZf?=
 =?us-ascii?Q?ARpCO+q3z+nEAnM32DB4cciFC22+ZjnNXCFXYoDzSFbsCWgsajcltVdHPrgm?=
 =?us-ascii?Q?rtsg+gSBTzrbjDDROQEjf6ymbaw9jshzfM9dpPZLTDl7Zlr4cGjdww7dJ9/A?=
 =?us-ascii?Q?TcdsxWPsqi6M/sW1z1ulDthV6rJ3P2nQQAKS4tdq+lQ9KFSpsyuFEq/wQt0z?=
 =?us-ascii?Q?5vU0WDsDGMbSPAudIx3XZfoFnI/KiG+kMF5W+3o5wFNpurQ/pSWiiXXrr5EE?=
 =?us-ascii?Q?D8BxoIeQJnM11EHNCAiBzmPmEffVvRl83FaXO0qym2yHykAOPhcV2CMMGNG+?=
 =?us-ascii?Q?9qyx/dYzP1174COIl4DRSzBaLXtTnA4t7oIJ10WG0MR/zTNgIC7V28TJKZja?=
 =?us-ascii?Q?y6Panp6G9eQxtC7KHftXR46wFfgXOjcrtbFDeyRo5aMf71KTZf8I82UHG6b6?=
 =?us-ascii?Q?z+iiljhMMqhzp71qirGY1ObTusWBrKkYOpQmO2rwnywnLYAxjts0rO7IsIe+?=
 =?us-ascii?Q?LApCl9ii8F2aalZnqVcdpqIbT5SPr4OpBKfDqh9v1s6jmvOIZ1U0GgXJRmo3?=
 =?us-ascii?Q?CPfSXIxT20MmEeznNNwvplscgrXg8sWEQFClWp4v9JlrczxPhJ8+x2FQe2Jl?=
 =?us-ascii?Q?sqNr9G5LvG1xsWwh2l3PbEUDBwUzJ3UNLWu7bKHPJVm7qGaf/qlSrIFNeqk5?=
 =?us-ascii?Q?/cT+X8DBckQRNYtIwAlh10nV/xRItt42ckIh+ocYTaUHcG8MIDYL9suIAEEO?=
 =?us-ascii?Q?pw9l/MWKzSelQYiu2ZfmZdk4srK461hwAgbLhZtSxFILX+XYbYu+VR9LbBg/?=
 =?us-ascii?Q?StDAL/qMfA2BpKY7zPRp6ub7SrDUHzVviqZjobkJNqrg4hYrnvAxCYMS/nmJ?=
 =?us-ascii?Q?iDGC6ppSeV0nyLhkZlTc0jfW9oV+0zDouJkQMlqYlEHfMf10oSz6DXcdvHrP?=
 =?us-ascii?Q?68iOvvrm43tn8/rQFrG4MYT8Zwe7Qjl1WOzkcUwCihy7eemVOIM9YtzAGXwg?=
 =?us-ascii?Q?x+WiwmsME6xv4iB38x4H5ur+IBSJZUboSJPc?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(52116014)(376014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?ZXWVeUnzd9kvmeWX9lWY7akaB369a847s+tB/w9ZBm85e1qShj8Ujcs1niNK?=
 =?us-ascii?Q?aHybuawjAp5BXeN8eHxCMu373FrmeHnvLkg6B70OovF/0jDZobLzPIyqP8Yp?=
 =?us-ascii?Q?WZBGGh/Dx8UjO/CTMGUV9o7SyS4DLUEw8hyDYO3y9j01dmEuNSlBhA/8sTw4?=
 =?us-ascii?Q?gQ6s4nITN18Teus/Ztg3Db9Yx2VJHWv3ybcSLVGv3wSClke/jWpEs4H+iSlm?=
 =?us-ascii?Q?XWjl1ZHB5mAS+QkeZ0UoVO32EaWZZIM0ySMMsadSJx3X9s2AeHUPPFjWxVbP?=
 =?us-ascii?Q?P/olQQ0aZJoZobxFTWn0MjlBuVYwp27h7aWSXTHi5ImNnx/yYTsAFqN1yymU?=
 =?us-ascii?Q?/howri6/2S5QB86stgmr/Z31wFZnf9J5epkoNBfujvfY8NFfMVWLOyWr+aGb?=
 =?us-ascii?Q?Ph2k2YAE2jo6wS8NHp8w1DeZobBjiQdeLsxVQeBZxj051aZORD77b/+X++SG?=
 =?us-ascii?Q?qXX7cOVgAh729S50VFIInLn9/VeU2c8qKVLO6gpTm7N9kp3VK4jkdKUj/QPI?=
 =?us-ascii?Q?oGcjNFa4fEmO3giAEP9ospujYFg07lJBCnZ18gKLzSnWMQ8c+Ih0BNQoeaOl?=
 =?us-ascii?Q?JLkcgWto3c1oW1XtfsKMuFypBIRKJ5lHehZtj26JBOjt6h1GEIefEg+9X18X?=
 =?us-ascii?Q?pOrPfyHfa/H9g3mb3LJ3JVAqeJM9RtDg1MJuijgbx+DuLVQzyeuBTr1FPK+y?=
 =?us-ascii?Q?d2Bn0Vg2Yp0tCjzXq4Y5syxjQ4/VIEyvA1c7js5+o9mE5X+fgp66+53ULLaz?=
 =?us-ascii?Q?wTD2aRpN+H2Q8HucXQl6SeTVXQAWHEoVlqBOcDLgLMia6HkO5Nd4yee1ZCFU?=
 =?us-ascii?Q?GSZyWjDqOV8/4lF93WP3NJEgOi3+U/AeQUfGrfkHN5Rf47ZOmQJ8JvfdPtAo?=
 =?us-ascii?Q?OUGiMqmmsGquH//5XkV3y6EYGQHbRCjDDomJGdtEv3APvxUgLeYkHaq4kWDQ?=
 =?us-ascii?Q?zQnmoC5rL3cmymO7KHi5569dhTzH1xYpI6DRIhZiGw4TEGj7vion1MQv47UR?=
 =?us-ascii?Q?H9NHwkV47JqLzSjG6/NdaPZsse6XBoqQ0oIdS1wb+o276z71LGA9xzErAlGk?=
 =?us-ascii?Q?9NEkQlHly6SpTWLraQZs+lN1a4GJz4EFdCqLovS68kylND0C6UwTMw8LyVjn?=
 =?us-ascii?Q?f1Jz6wElOaL/2Nq3OjWeI2geH73bGvVYGqj7UIQxOuPrMLcVd1OTx8z/5KlA?=
 =?us-ascii?Q?LRI21+3j9kq/SCrO1nNTKzcf0FP5gds5s8dd/Js+sJJBWseWafkRtOp35UlY?=
 =?us-ascii?Q?WtxiBSsIsnOg9EANZquuoC22rDAusJ5+37p+YU6dxaDLhzZd4k7/akfDkL+h?=
 =?us-ascii?Q?e8eZAteOqSiSdz09Qk6Bdptlnpfc+cXCOBPco0y5qH2AlLtIhE7kvC9c2koO?=
 =?us-ascii?Q?ij6UR2WtZYKfc0OxuwClJPiun5VRKl1mP3R8k3jSyJqxgDfpCAocRJ84wcHj?=
 =?us-ascii?Q?MEPIu9Wk4lQ/rjNetmBCcP309eRMrLgrHMd/QgZmWAOt2XHRm0qcZs0JL8vo?=
 =?us-ascii?Q?uFaPYyMxcV9gIFAJ7lfPHeWUFWJBLandrH2jFh+tzRC7kAGBg26Gxv5Jmb6t?=
 =?us-ascii?Q?xcS2E4zLr7cJ3mLPHKSqbdIBlSF9PncKae1SHbqKVOlIJl7/zNvb9dXIJOKL?=
 =?us-ascii?Q?OoC7koyWAglgxiHx7RlO+iA=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 37a5ac95-4a51-4c5b-088a-08de20b7f955
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Nov 2025 00:19:26.8653
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: o3J1nHXwCLWaejDpek+7U3ePobDPAA6oM5dTi9ikzgZgxcKI/K/NMAQ0ad3Xvx160rP39edSbTjvCyUbJHvQlmLdGSQ4bGJhthw9qd1v0lb+b+miwk7C6nmRJ+3TPc37
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS7PR01MB14361

This patch converts below functions.

dapm->dev					-> snd_soc_dapm_to_dev()
dapm->card					-> snd_soc_dapm_to_card()
dapm->component					-> snd_soc_dapm_to_component()

dapm_kcontrol_get_value()			-> snd_soc_dapm_kcontrol_get_value()

snd_soc_component_enable_pin()			-> snd_soc_dapm_enable_pin()
snd_soc_component_enable_pin_unlocked()		-> snd_soc_dapm_enable_pin_unlocked()
snd_soc_component_disable_pin()			-> snd_soc_dapm_disable_pin()
snd_soc_component_disable_pin_unlocked()	-> snd_soc_dapm_disable_pin_unlocked()
snd_soc_component_nc_pin()			-> snd_soc_dapm_nc_pin()
snd_soc_component_nc_pin_unlocked()		-> snd_soc_dapm_nc_pin_unlocked()
snd_soc_component_get_pin_status()		-> snd_soc_dapm_get_pin_status()
snd_soc_component_force_enable_pin()		-> snd_soc_dapm_force_enable_pin()
snd_soc_component_force_enable_pin_unlocked()	-> snd_soc_dapm_force_enable_pin_unlocked()
snd_soc_component_force_bias_level()		-> snd_soc_dapm_force_bias_level()
snd_soc_component_get_bias_level()		-> snd_soc_dapm_get_bias_level()
snd_soc_component_init_bias_level()		-> snd_soc_dapm_init_bias_level()
snd_soc_component_get_dapm()			-> snd_soc_component_to_dapm()

snd_soc_dapm_kcontrol_component()		-> snd_soc_dapm_kcontrol_to_component()
snd_soc_dapm_kcontrol_widget()			-> snd_soc_dapm_kcontrol_to_widget()
snd_soc_dapm_kcontrol_dapm()			-> snd_soc_dapm_kcontrol_to_dapm()
snd_soc_dapm_np_pin()				-> snd_soc_dapm_disable_pin()

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/codecs/arizona.c | 18 ++++++++----------
 1 file changed, 8 insertions(+), 10 deletions(-)

diff --git a/sound/soc/codecs/arizona.c b/sound/soc/codecs/arizona.c
index 99884dc6ff86e..8c683b0bb74c4 100644
--- a/sound/soc/codecs/arizona.c
+++ b/sound/soc/codecs/arizona.c
@@ -169,7 +169,7 @@ static const struct snd_soc_dapm_widget arizona_spkr =
 
 int arizona_init_spk(struct snd_soc_component *component)
 {
-	struct snd_soc_dapm_context *dapm = snd_soc_component_get_dapm(component);
+	struct snd_soc_dapm_context *dapm = snd_soc_component_to_dapm(component);
 	struct arizona_priv *priv = snd_soc_component_get_drvdata(component);
 	struct arizona *arizona = priv->arizona;
 	int ret;
@@ -238,7 +238,7 @@ static const struct snd_soc_dapm_route arizona_mono_routes[] = {
 
 int arizona_init_mono(struct snd_soc_component *component)
 {
-	struct snd_soc_dapm_context *dapm = snd_soc_component_get_dapm(component);
+	struct snd_soc_dapm_context *dapm = snd_soc_component_to_dapm(component);
 	struct arizona_priv *priv = snd_soc_component_get_drvdata(component);
 	struct arizona *arizona = priv->arizona;
 	int i;
@@ -255,6 +255,7 @@ EXPORT_SYMBOL_GPL(arizona_init_mono);
 
 int arizona_init_gpio(struct snd_soc_component *component)
 {
+	struct snd_soc_dapm_context *dapm = snd_soc_component_to_dapm(component);
 	struct arizona_priv *priv = snd_soc_component_get_drvdata(component);
 	struct arizona *arizona = priv->arizona;
 	int i;
@@ -262,24 +263,21 @@ int arizona_init_gpio(struct snd_soc_component *component)
 	switch (arizona->type) {
 	case WM5110:
 	case WM8280:
-		snd_soc_component_disable_pin(component,
-					      "DRC2 Signal Activity");
+		snd_soc_dapm_disable_pin(dapm, "DRC2 Signal Activity");
 		break;
 	default:
 		break;
 	}
 
-	snd_soc_component_disable_pin(component, "DRC1 Signal Activity");
+	snd_soc_dapm_disable_pin(dapm, "DRC1 Signal Activity");
 
 	for (i = 0; i < ARRAY_SIZE(arizona->pdata.gpio_defaults); i++) {
 		switch (arizona->pdata.gpio_defaults[i] & ARIZONA_GPN_FN_MASK) {
 		case ARIZONA_GP_FN_DRC1_SIGNAL_DETECT:
-			snd_soc_component_enable_pin(component,
-						     "DRC1 Signal Activity");
+			snd_soc_dapm_enable_pin(dapm, "DRC1 Signal Activity");
 			break;
 		case ARIZONA_GP_FN_DRC2_SIGNAL_DETECT:
-			snd_soc_component_enable_pin(component,
-						     "DRC2 Signal Activity");
+			snd_soc_dapm_enable_pin(dapm, "DRC2 Signal Activity");
 			break;
 		default:
 			break;
@@ -1911,7 +1909,7 @@ static int arizona_dai_set_sysclk(struct snd_soc_dai *dai,
 				  int clk_id, unsigned int freq, int dir)
 {
 	struct snd_soc_component *component = dai->component;
-	struct snd_soc_dapm_context *dapm = snd_soc_component_get_dapm(component);
+	struct snd_soc_dapm_context *dapm = snd_soc_component_to_dapm(component);
 	struct arizona_priv *priv = snd_soc_component_get_drvdata(component);
 	struct arizona_dai_priv *dai_priv = &priv->dai[dai->id - 1];
 	struct snd_soc_dapm_route routes[2];
-- 
2.43.0

