Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazon11011005.outbound.protection.outlook.com [52.101.125.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B938275844
	for <linux-sound@vger.kernel.org>; Wed, 19 Nov 2025 05:24:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.125.5
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763529844; cv=fail; b=gvDw8jhxsR8aMvQ1w9i309pY2G3p8LU1L1Tf9TabF7zATOkNL8bDNUeAQ0QODQwDKncsqmwswH2DeCxsyLyWiGnKL+m72zCpAN+PmUichf4qeLi0HcdRMgaBkXdsN+i5Ql6tIJvGIsioLNK3Jn/uInvsyd89uPP/fDB8wpH+9+k=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763529844; c=relaxed/simple;
	bh=B4JloeHOxuFpooQvdEVwqE36B9koO98Ty+4+wlkbQfk=;
	h=Message-ID:From:Subject:To:Cc:Content-Type:Date:MIME-Version; b=fObLIGgt4SLhI6CXZXfhLB/hjAIppUCkmkpl/Uaak7H4zUAjytn+GA+tuYMizyxwTlENq2fPdJ2410nCCegQavLRtH81RDTvP31XTNLU77s+X0udL/LcXWSTBXogMCKVyOFywFaGjge9R30C4ol3HBe3jiVX9ZpvOtb0eaYIBrU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=QAwI+vE9; arc=fail smtp.client-ip=52.101.125.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="QAwI+vE9"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KELeXVx08zHwvd4NJbms8o7Gt8WnBcj9WbTC7yAub1YYq2MdnhIkABDoxARIgmMCxDKcfFrDk8XJdMdpdPvhoeu5VXKqcfOyT+SkOcFkak1cfnug8TiFfwXaOZBy3sxw1gVXfcCEispxYa7OWAIi/8e7KoDyY4Gr/JcAxN/urz19Wuuf6NR8o6clzzuW0CQ6zehB5JYLTgXv2GSA6I7HQENSSeF9RU2o54pDfCwDSz4D+V4AqzNfThCiD4DgH/CPDx92PgNWjr1ter7XJnPxkQxrW2064FxuNy1yVU/03IRJC1+IuLBlGd5NvIDrvWExMItDyjLXBi70UHDiUmecew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aDbLmjl0if8v1w8K6tGxzrYHAFPFiv9TxTN4p2NRCX4=;
 b=M/ESxODEQMAtZ4s5Zto3+Fq1Rnm7J9FJp7B8AhLZGuPLGTqOSAFCDnq9V486y2QbZ3hXIU1/PrA9vAQgO0H1e8/lbSG9FwANlHRLkuFJeQCABp8U4ZyFdjVWYfHaD+jbqCFJ0KRGs78AQtyT9XIi3VLDiw8aDFozy3CvbjO9macdNKJFcPFqlGye12NkhNqZlwEsJDWO+7sd8gNtwQcc0uOO70rnM4KUzqmAsYK8IO/P16Y0pqbhPuoOiqdjljYm2MNWAT/Mq6LAAY6t4gJqowA/ahV+Q9oQfPIWxpE4Zeu0EgbHoUIPjZy1avRkTpHbOmCiwIo4Ll+dd2KRHYuUfw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aDbLmjl0if8v1w8K6tGxzrYHAFPFiv9TxTN4p2NRCX4=;
 b=QAwI+vE9+MKFAI4RNsalCqPa+dR/YYJwwpXZYz+BWI6dHCQwJyvWMaSUYna8nuqNj2+a/ZHjePBC0opM78lzdRk8SzINdbl8dfAuNa9ZQ3j+ico28kfL3CoeRsES6SgKmQDORLalAAiFJkXye5e1odIdYmIoVCfvxyThWhvA2Hw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by OSRPR01MB11598.jpnprd01.prod.outlook.com
 (2603:1096:604:22c::5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9343.10; Wed, 19 Nov
 2025 05:23:58 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%3]) with mapi id 15.20.9343.009; Wed, 19 Nov 2025
 05:23:58 +0000
Message-ID: <87fraasihe.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH] ASoC: codecs: arizona: convert to snd_soc_dapm_xxx()
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org
Content-Type: text/plain; charset=US-ASCII
Date: Wed, 19 Nov 2025 05:23:58 +0000
X-ClientProxiedBy: TYCPR01CA0191.jpnprd01.prod.outlook.com
 (2603:1096:400:2b0::16) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|OSRPR01MB11598:EE_
X-MS-Office365-Filtering-Correlation-Id: 5dda8829-8ac9-427e-2bc1-08de272bd747
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|52116014|376014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?53nCJdIeKLTVPbLrKOw/t+sJrS+jRs+12faHfHYN7DQX1XpFwLzxGUpRJIYF?=
 =?us-ascii?Q?cNh4ZvpsLYzJYBVNTSWIwBPZoI7paZeArV5Kp7AOdt/BDpfDKtCr83bDfw39?=
 =?us-ascii?Q?PSDP+Zc67X8LTWEQMuvsvbTfSYLlZ7RBmuSRcnR3q76/xZRo8dxuTtzc0lhj?=
 =?us-ascii?Q?4dTB1RGWapnAfhGnm0Kv+3aTseX10tANQrnAG0tSbtDTqiUO4D8vB/w89rHV?=
 =?us-ascii?Q?s3Yi8pQpNhZ3TQfACtIaIef+GiHW4aBRbfvESC1lPo70GSlDdA35bthMFyNF?=
 =?us-ascii?Q?Mtl12BKEd5Nlj/otyzjtX6Q3iyJEvkbSCEs7LWjiPs2u1RQA4kPb85Jvo+EW?=
 =?us-ascii?Q?DsE0SBqEQHZ2ysDBf0EtFHrRd8SAsa7wRJ58Td5bmZb5gBN44FGFOsxpPtxJ?=
 =?us-ascii?Q?EFXg7vXQmBjTrPOXNopmIoP+SSTz1Zb90WTi1Q1KMbSwpzLgweG5WTIuH2yP?=
 =?us-ascii?Q?UhLK17wv+2LDqp/eVDTryJBsOzK584dgxUSN2wcn+QovpGZZGDjNOFUO85zS?=
 =?us-ascii?Q?HV4UvFtG1b9t3q+H2dyvvmlJdCbUJ6Ex7JJcyDBh9b3KJ4vhmJeXU07YCNwY?=
 =?us-ascii?Q?bVB2hcz7ggF6tlNiucAaBsU2OrHE2ZRMirFcFqcCr/+qrio0D5yK3rZRxOzg?=
 =?us-ascii?Q?9PBoE6ElVl6B8Ay4DW63s0NnIV+0UAMXRivG+wDyutEvNd4YyXUl4RPqSLH5?=
 =?us-ascii?Q?UdF5buM3jSiauSUiYqhnDDh+ozN6DcsazTgdzwMhRgnCHIMqnxLHkwv7FXX3?=
 =?us-ascii?Q?k09sjqj8Q2LSQCCqGEZUX5ykr6rBbdpY7gc/qmNKHO6hfwDM+DWWxOVmzEyi?=
 =?us-ascii?Q?q82n2C8IbB6FsSD9NqLM/aiJRtTNwdWIiOnJDM86Ez/znrv8xlFWKs0he655?=
 =?us-ascii?Q?cf9VSTdJm5JmlVG2O/5QZCOAbYhR78LmJ84xP6e/nwm3SzVfjpmqEpepn79j?=
 =?us-ascii?Q?NARGEu74MemyhHA8Dr17jz+A1LHTcilb+2AxEUDZQbHbYSUp1IhkQC4wJGTL?=
 =?us-ascii?Q?jltJ1/TE8oZurXzjMCVu8JYYLTdGxXMSfqLWk89aY7IKOwWtI5QDrqnbB9nL?=
 =?us-ascii?Q?aoQD8++BGdm5GhOVUvOOaNTXrq3TLiXMNGsLZUtLRW8d+OEpvnDL5WLpWmpY?=
 =?us-ascii?Q?8HesPjhxJSPbGfhq95LRlfW9yoAfU7LF4LFQEoRTgTUPFVewnlcOU/Vj28aQ?=
 =?us-ascii?Q?VqzNjxNxx2Ul21+XF10qmmCNOpAf+sxLR9PdQIr0lc53jQIKCZE5o/Mj/rqs?=
 =?us-ascii?Q?ueexlcidxIFfOC+wU9oIkUs5iOutcISKAWyxwhbvWi9CbY9slYDqupHFHDWH?=
 =?us-ascii?Q?7o6iARq06Lo3MAxJZQlIyIvKbGB1llVNMQqKs2/YX6oa811xW8ujTfJutvhF?=
 =?us-ascii?Q?ZXlRCPjiL2kyQtkSXKXGPuP3382SMVROJe7q/MRAnlhxNX2qio6253dHXSu/?=
 =?us-ascii?Q?JU0nD6orG1QxG3qR9j3Exi9yifcqDvyo+XM4qWwttFWDXH9VUvjsIMF6hIQx?=
 =?us-ascii?Q?4GDAXlYaTvO6/54Gd+dicG5M2eFvXb5zZh2r?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(52116014)(376014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?dGMWXCSaJJedcnyPG93QIII/5eCczZGzQGWtdmQCAkFSSRNRDSlflBSwqDE8?=
 =?us-ascii?Q?+IKSt+/CsaIAJrLcj+BLAPtBCZ3tVqDALEwHy9c2JrD/Q5DqhtWjUekgj6m6?=
 =?us-ascii?Q?TVJX4GD4L3/xamL1U47YilbVENsXAiOAgtTtjOLE5WGcwFZj0CHGOqjhZCZD?=
 =?us-ascii?Q?C+8Iv1MXBOP/+1/W5EDTANnpeyXKm7XgawN0+bpjF82rvLYQCyTEPVkf906n?=
 =?us-ascii?Q?JiOdFSL775CrzeheMdMYN4NzSIJETQo1gX5Ex9VkbcGxaqAdqnB/Tiw/q17w?=
 =?us-ascii?Q?mTBwbLdEv4hmrHzqohwPDGLgsEYA3WIjaaW1nrLtBSF85/wIeDoB8JaMqZb4?=
 =?us-ascii?Q?m+eO0T7LA879ywxSD+hsqtxJ00FxCenz1YXOpwDYSYWeizJLBgPPInO8/Ec/?=
 =?us-ascii?Q?WFiKrRmRYF9YICZ6auZjPOd1H3DZFeUMFVnU+ZqTGIjdXrzmoLN9Am/WuQzS?=
 =?us-ascii?Q?xEUFbXIJArFSY4zCjXk9qAdu7sfSWLEPb/q5biEutbZbokaYc4XJYsYIlvIe?=
 =?us-ascii?Q?6OICoHgg4bI4yDQEIHSF62wFR+cO77W+r73z5yPX8rjvIvM78aAkhuSkdfRZ?=
 =?us-ascii?Q?Dtu+C1G2W/ykD1VdpnIPTlpBGXLLq0/nNj8Q2aj7sgzTj6NrbWrDLuNPabtv?=
 =?us-ascii?Q?0i51+tr+NNv+pYR0re1IarpLUGFa4cSG2EyVZDOlsyLZ2ltS+PIPfG3KEejt?=
 =?us-ascii?Q?b/yT34cihuj9A1vI3gldtv7QOdP95ZtuA4NQyEyfcJRlqR8o/xRUl+fifgDK?=
 =?us-ascii?Q?LhujmAKYeBzZwcvIzlgcaz7buQ0rK8XzJCCkjvXAA58dJ5oPRK0QYy8a45XA?=
 =?us-ascii?Q?blmMecgwqy9m0YZJHAusb21hoIv26E4L1BB8qKLlW2D1yKfUwySNThu74FBz?=
 =?us-ascii?Q?Gp4tfsT8+GoBnRVG3yJGrKgdQAGJfEmJfJYxwng0YkzCGIuCVtZ1JXVOEG2f?=
 =?us-ascii?Q?jqAeebAnzn2Dz8NomVGFVChjTX9kysAOg+igRZRvOouo9HpJvGu415iUSB9g?=
 =?us-ascii?Q?0j6f4SCIivYkLUJ96KYjNvL9k2JmoeERViwMPT+5XoWZCtLTsMWcWajPm2Dg?=
 =?us-ascii?Q?6fqIpRxMUX9FvWQuWnL9jbP5h0/kV75HfyipMohszDuwEU5eeUJal4+6jsUM?=
 =?us-ascii?Q?t2aNnuQLi0ZNu4F2YkEX/nBquhGhlwZEi+pVxf7ppCLYYHYXEg1qPbjfwHec?=
 =?us-ascii?Q?z8X932IHXM1kdRzLjAToNGH+pfRm+haMjBJTyvBvEjONMbhL9jVgqtkywHZi?=
 =?us-ascii?Q?3NE03k2umCbzjxRRYH0KRPfGkaOqYam2pXSxrJObk170sxEKwgsF0nFpwelm?=
 =?us-ascii?Q?AqRRw+vvudFEFQAXXwFxx24pt2aFuvxOO1mv6QCJPDHkW/GZcmvpnSkjlvCo?=
 =?us-ascii?Q?r8Wwc/j+Bf8UHZfcZe55Dxa5fk/SYjsx4G/WYY1DNbVa69UJzXwjCzpT5U+l?=
 =?us-ascii?Q?dDod4+oWO/klA7lyjW8+ePPvgZ0KY98lu1vUxI3VP0IUouBuo7uStkarMgXM?=
 =?us-ascii?Q?2PpEwekLdO0G+Y1WJVyJqV8i3oqPJVk2V+BF+scKojBjVXdLA0fPjyLiCwmZ?=
 =?us-ascii?Q?Y+ZOaB2Z9NLh5cp960GvpXeyPBwlGKkap3KBr+3vEdmjfbM6RNp3c9WK0g4R?=
 =?us-ascii?Q?BDuG7eqmUPaV0nHcw+KJvJo=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5dda8829-8ac9-427e-2bc1-08de272bd747
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Nov 2025 05:23:58.3797
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8FJcpxaS5esoaxzX4EgNn3S+zgN8w1J6s84SQcAW8Qj0hUSk5/qdK1muKHsGaGIQi5YP1dDBGsEcBxKbvW2THRksdhCqp8Ihct9Xge/iSG+/u4NP07t+agIZ1CTJnpxl
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSRPR01MB11598

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
Hi Mark

It seems this patch was drop in the crack

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

