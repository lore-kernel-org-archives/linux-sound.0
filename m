Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11010012.outbound.protection.outlook.com [52.101.228.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D657A19F135
	for <linux-sound@vger.kernel.org>; Tue, 11 Nov 2025 00:24:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.228.12
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762820687; cv=fail; b=B440Hmq3BZVIC+/E0p8Vm3jgV6tYcAl3jdbdqeLcY4bIK1++vndUREKUe9TKYvcYFtLOBav02zBkaS+PujVb0OgH7qRP/xiifpgfk7c2n0zoY7F+wwlQ1nyCkE2Ib2UUUTk3Jqcz2UR1Ogc6Ya7frTDN2yUoEEFAjCenP/vDeq4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762820687; c=relaxed/simple;
	bh=9WRkt8vr3p5yhTyAwZ4VE0CuWSw4f9yESo/2l7Hn5JU=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=u7oUs4N11QjZCU02ItjB8UwN9wA2V6mjMYh8I3sNDVizz1QI9WLh0sm8i23Jm7jjS8n9AYfTSyQQu7K8k8s2eUQ9bJHXlHNhRyejgA206gVg31Jvj45/DdxYLoPRDugYafMk9MrIdWkFwIUgd1vima6FU5E4QaQLNgWakfFKwpc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=ixravTK/; arc=fail smtp.client-ip=52.101.228.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="ixravTK/"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dgSmi8z2BeqKM4/xZivkRME4w05zfuDKkcVgo9qdnwAokLqwCNfqzPUhQ7cAAf6IbnX7BmgBAX2oxg20S2jD/AO1RBnH8TLK55gVwzZFFcc3ZRy67tTTItAZQ5YIg1muO+ujh7sUSM7chrqtH+XxTbhpasI2p21fQJqNeIXsz/qIzeYJc1IwNqIvc+Lp9GQdFScMDF5pPq32Z81znXAjgAK/DBeD+H85Txm3eweAZEWRVcDrMF8hqRDTGlYkzrgD7tg69gKqH88CbGmNlYd9WVgunLu22RAj7OqI0lr7nAr4BuArFh19//W+1rYGdJBl+8F0rQk7o9e+P8D1A3A1Fg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XUaEmo51ymR6FIWzNyr4rNuxn1JllhIiFtRCMWCT9lM=;
 b=esG7/8d7K4mnAXR3kmuLCCbx/u7kQPAvYy4s5vHB4ARWSiAP6FN9fos3AWeNnybUwS7FaqDQOQEBUrB9ZqDyj0zycFpPUh0oUv/QkBZtrd0X5mtJP+MrlB6gfMyIV7mxXtTJxPo7T93oGmyQ34wJC4cooxisF7yHCW/gx/AF53NHeeCbVlbCho71qLh0bgdhLV5RAit6wpz+UI2H0ocqjEqxS8Q+1+H85zjDjzecdmgSlprGjpeera1VUjJhnQ9MeRer4VhVble2lRgp5z11+NeIWM6tTiNlUaVEcHeTV2UT8uyFcwzhOtbamKXMwP8v/zfAs3q4/vOZGbYPFsngJg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XUaEmo51ymR6FIWzNyr4rNuxn1JllhIiFtRCMWCT9lM=;
 b=ixravTK/UmVUx2hDy4qnov09mebGZgLBfvXzX4wmdSQzM55xe1tyPQx4Ly+xNo8Fgb9h2VxBlxNegQsz2B8g2UjYk/rfePwdWfMCPtqM6KYoBg449TFpjftRExr0GlKMZT+pJVPemE6jlEQhUH8vidvMEUvbSrKv/g0GipWpbLw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TYYPR01MB16440.jpnprd01.prod.outlook.com
 (2603:1096:405:147::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.11; Tue, 11 Nov
 2025 00:24:43 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%3]) with mapi id 15.20.9320.013; Tue, 11 Nov 2025
 00:24:43 +0000
Message-ID: <877bvx4drp.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 103/292] ASoC: codecs: rt298: convert to snd_soc_dapm_xxx()
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <87cy5pa0ea.wl-kuninori.morimoto.gx@renesas.com>
References: <87cy5pa0ea.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 11 Nov 2025 00:24:43 +0000
X-ClientProxiedBy: TY4P301CA0087.JPNP301.PROD.OUTLOOK.COM
 (2603:1096:405:37a::6) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TYYPR01MB16440:EE_
X-MS-Office365-Filtering-Correlation-Id: 17f2192a-6308-4d05-8548-08de20b8b5e9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|52116014|376014|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?Wqb1TphKpdFwndaIXk/8cfsi/ojOZGQTqtjR3dr0bqO2XtVfGJLnYCiySQ95?=
 =?us-ascii?Q?srh+qXORJ0rI4g+Q6thUkihsjKaYngE3hKygwwYemcxsvVLMPm0wYzoPNpG1?=
 =?us-ascii?Q?0RMpH2mxf6loR7H0BR3tKIixAaMKCALxVhhFG+oOKPB7aAKE0OC1pf46MLiv?=
 =?us-ascii?Q?Z9AjpSv94tUFzw2m3oiGpiMl3R/tL7tjnS/PyQ4/vQwZhA0MfLawELauiaQs?=
 =?us-ascii?Q?cJX9JMS5duVc/29yJGCz/1f7/Ugb/ydf57jboQW1swBHpQ1t7m6CD3UwNnVv?=
 =?us-ascii?Q?wz4fIsOrW159HshY3SnyBRU4KRymKz7eGaPbwHRqbJfemQNi/63SZJPktrZ+?=
 =?us-ascii?Q?y8mMgPPkWkoajTQ8rm0PIjtJKmzB0jJ04psklV1Kr4+k/zHX2+RJzfUNXM3M?=
 =?us-ascii?Q?Bn4CFtpKgOK83Fr2TNJtq59wE8BxBsMMcn1O/JxC3q2eKSd+62yF4gmVXzaB?=
 =?us-ascii?Q?RmA3zIZpz2fHaCgAcqiXiDn2Hs+MOuAP3ITXvgusCfnSM1gmQLI65B4m/Bh4?=
 =?us-ascii?Q?/GznrmIPN4Ahy77ldXOhUuoZ9B3vBE8Mo2upiQJw4bzqxM1dOW/JnlW+8XP1?=
 =?us-ascii?Q?JcMB0+ssvVk1UdRhPoXo7d+2LG2uP58QwrJs3PpRJISuSKTilzPUCjAo/2LD?=
 =?us-ascii?Q?os4zn63iU4CM+Q9KZC9J1/Sl9njibZTqUH8LywYTk0R6SLmarcrkg7qlz7g2?=
 =?us-ascii?Q?80fsxoDrTpWvRLE2D+kqJVQm9dvod0J8eq7xFsvi3Hn/opjEO6xfFW48l+gj?=
 =?us-ascii?Q?ZmciCVeSH3skyIGBKsn/AWUUSGtzsK1Jw7wO+k8wrYYp/GXgCVfnV8lbUedF?=
 =?us-ascii?Q?N8Pclw8cZA+ZYqJ+xBjmALu42F8plIUXhGCfFca2F8FgVVWY3V4mfh0Vwg4I?=
 =?us-ascii?Q?R/qK8A6kt9H5kFsSfOxraoQT47ah2uX+PvSk3+LPLqndB1SbGhNO6WrfOpHs?=
 =?us-ascii?Q?r8UzXCkwswzY0HSghvQJf73SQWUneGmEcS/GDJJ95V0XWx7CRPiI+mX+VuR+?=
 =?us-ascii?Q?ZWd6EfsjZEX0uO5BlDIIyfBEx74mjepYnTV228mb6vF4MzNDZ5Fut8FbC/ct?=
 =?us-ascii?Q?hoYvR0uvnsgnWuAjYgEQuOyizh7xNJUbTvYD2Xkhy8w2K8LUKnVAQR9lW16t?=
 =?us-ascii?Q?O5mUgu0n5A9ya7DZ/uMDTsggXCMEVyZMNOrVY8PdbOvM6P/iXv7elRe3ymg9?=
 =?us-ascii?Q?1pYDLFOprxlN/N86h3QgsRe+VsOk2DThZwiuvoWE1nM2b2z2HjUsMcRMsc4V?=
 =?us-ascii?Q?zokP7ogh3eAultIW+ZhkIiggjMjc52EGuayAAyAEs+hlZuTqxU+n1VP6biKz?=
 =?us-ascii?Q?EZUtYR5XN75a6f+zxQVSfvfbWLbGQcoj2cIez3vb0eTKrwPtNNSb/V3CGZHK?=
 =?us-ascii?Q?3u72dEwfwHEIrahS0V0oYjI0bSv6bbjzCco9sjDq3Ojb5mxoKMU7BlrgSJ+h?=
 =?us-ascii?Q?Aqp2VMqVc5apm578r1etss0h6KcibXQXNZyrJmitO3tCUH2uI59cvPUaVYBQ?=
 =?us-ascii?Q?ZzSXR1PouGzw/kksHcyuYBCD5PQI0g9nZ8eO?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(52116014)(376014)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?lKtipj68XtPkji5NM1NhnpH8ZHEzKpdHHoknPMO8hlUxkxVFTqxtJPkqGplf?=
 =?us-ascii?Q?2uvercUgQB3dZLSyxOqAdlN4ebELchX22joV3IsdR2sJrkFfagIYMXDfsbRk?=
 =?us-ascii?Q?MDTt6HLxS2IYE3iMqwVzRzh/w94uFEzD0cNgF8azmtIOgd0sMqUkdqZqTMCQ?=
 =?us-ascii?Q?K2XoAXIkjO3eCpv5BuuF5F0+xlVAGAQ26qegO8CQqdPZ3bzFe1cz6VsPmSTX?=
 =?us-ascii?Q?VLbLmrurkNCQmveFNfolOsRbCj7vZ9fWM20i3ReCSsZhb8gwv+srI5LGajgV?=
 =?us-ascii?Q?pkx7A5Qidweli8VBRWatKmfk611zUDc6V8nSJoOPRFPl7kdCJWaLuUQmUqgY?=
 =?us-ascii?Q?YLmB7LPBeP50GGWF9LiD5nXwDMhMrZpoP+ffRdHfkEhyCq9cfDx7l1qInCHt?=
 =?us-ascii?Q?YNXb+zj/l8gjR4GpzM3uocwLjI1F2dCI/YzUqEc6gYxIPJBk6GKv+3A5BV3F?=
 =?us-ascii?Q?+xQjf87XwCCI2YqIoWJ88Z8lT8bDkhUPrzQ+80vNFdc7u0Ne86jvqPXpCFa9?=
 =?us-ascii?Q?tcD3oVDQCQ+w9Pi964/AKRcpP+k31RGhL118AD3NilI4vYKyBxO+bdaG4zS4?=
 =?us-ascii?Q?l71y+Ye5x2dM1owVJidXrGT70fattoC6DqvGgd4v6BX8vSW83lKsFEPMMzbe?=
 =?us-ascii?Q?m64MJbhCVRHMtRM3CnC28+EdtnSbavVlIKK4sHSDQg5AcX99OSWpYzKcyDA4?=
 =?us-ascii?Q?Lewb+4a+q2g+reZkRYQ90AW8uAKKGO3ERKyaZQPm+ilenQ67rdsj+7p5DQF3?=
 =?us-ascii?Q?HkPl0uyTY3It7lakEwwAyb5wL3UG4tNyN99/zW7lu6JEGvBhAKJOKh2OSvBZ?=
 =?us-ascii?Q?uX0hMFFLk2/PKjt92jBfevXs0JIcs42hEQI5nYA0RVRmbIFyLwKu/rVk9iaz?=
 =?us-ascii?Q?yhAnIJbsl9gkoCMw28ZT4DCmOvDb3hobBiNPvMDXBaz4RC/01GBy3RI8U96s?=
 =?us-ascii?Q?hKd1uqAkvIsMojuc3EIEpxGHd84GwErUMCNHKvxwycZKtiAhJfdHYTUIEJ96?=
 =?us-ascii?Q?XiIh6N1mZ61L1YwTNMaFHiUnIl1YDcsRwnqJ+6RxN6vTJS32IlMvadLN5qjB?=
 =?us-ascii?Q?yM9oWRFEOswTxpmIuru8D8nGjxM/kmfQkeJF0zFn1DNZc3xAmdM3yZ9bfUcQ?=
 =?us-ascii?Q?qhFnJXevt/xHPO6mQyzFksTlZpMwVmKe6PJheCXvSZQ9FUHj8bCkVcFCD7Q/?=
 =?us-ascii?Q?cxpeo8gz58w83ZbLyFps3FqtSDWqFlH/k1ajIRZP8qMUtS82Vxh6781JyXbG?=
 =?us-ascii?Q?J+djmBESVMth99HBid1Et+80UOZDhYzUUWitWUbzANkM0ADsYGrYwxEmnMCO?=
 =?us-ascii?Q?1OXYXkt6DdGQqjkum83T1ZzZrudaPBlf2KbL8Njx0ghEo78Hmobzf3JfokN/?=
 =?us-ascii?Q?9qZdD2uNx0Ukkxj2XVDTCPrVjx9ls6KqqfHyenBCsPAQ2TqNi5PtgodLSXgl?=
 =?us-ascii?Q?7pQqLFS52hV91X5TigZ/X6M5k5T/dM+UGp1LnyONfc3IU0K5ohuXUfAGaWn2?=
 =?us-ascii?Q?qzArPoqKo2TV0NNpQE7YoWtDksUvpO1J4dwCwiymfgbaF5Seks6l7A4nI1vN?=
 =?us-ascii?Q?6wWu13Mc3O6ZR93UFuCsUmKKxAk6IQNpZI//eEW3/4OdUHt00yGXb83mjHV9?=
 =?us-ascii?Q?z7SeCrBVoKQjoZlFUaQeBEQ=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 17f2192a-6308-4d05-8548-08de20b8b5e9
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Nov 2025 00:24:43.2307
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: loX3j5278Zkfdhxqwx9X6ybMXyKw//zK6vqkqj8qMZ/thuTkn+hXuI+10+/ZTIUYOAQDwLwSHu1hbIKkIvij5I9xA195lShpX6bog9N+wxuvJ17FvL4nIHT7UHieaqFN
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYYPR01MB16440

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
 sound/soc/codecs/rt298.c | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/sound/soc/codecs/rt298.c b/sound/soc/codecs/rt298.c
index ee3d9291eea65..02247593513ab 100644
--- a/sound/soc/codecs/rt298.c
+++ b/sound/soc/codecs/rt298.c
@@ -227,7 +227,7 @@ static int rt298_jack_detect(struct rt298_priv *rt298, bool *hp, bool *mic)
 	if (!rt298->component)
 		return -EINVAL;
 
-	dapm = snd_soc_component_get_dapm(rt298->component);
+	dapm = snd_soc_component_to_dapm(rt298->component);
 
 	if (rt298->pdata.cbj_en) {
 		regmap_read(rt298->regmap, RT298_GET_HP_SENSE, &buf);
@@ -329,7 +329,7 @@ static void rt298_jack_detect_work(struct work_struct *work)
 static int rt298_mic_detect(struct snd_soc_component *component,
 			    struct snd_soc_jack *jack, void *data)
 {
-	struct snd_soc_dapm_context *dapm = snd_soc_component_get_dapm(component);
+	struct snd_soc_dapm_context *dapm = snd_soc_component_to_dapm(component);
 	struct rt298_priv *rt298 = snd_soc_component_get_drvdata(component);
 
 	rt298->jack = jack;
@@ -949,10 +949,11 @@ static int rt298_set_bclk_ratio(struct snd_soc_dai *dai, unsigned int ratio)
 static int rt298_set_bias_level(struct snd_soc_component *component,
 				 enum snd_soc_bias_level level)
 {
+	struct snd_soc_dapm_context *dapm = snd_soc_component_to_dapm(component);
+
 	switch (level) {
 	case SND_SOC_BIAS_PREPARE:
-		if (SND_SOC_BIAS_STANDBY ==
-			snd_soc_component_get_bias_level(component)) {
+		if (SND_SOC_BIAS_STANDBY == snd_soc_dapm_get_bias_level(dapm)) {
 			snd_soc_component_write(component,
 				RT298_SET_AUDIO_POWER, AC_PWRST_D0);
 			snd_soc_component_update_bits(component, 0x0d, 0x200, 0x200);
-- 
2.43.0

