Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11011016.outbound.protection.outlook.com [40.107.74.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC50E1A2545
	for <linux-sound@vger.kernel.org>; Tue, 11 Nov 2025 00:25:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.74.16
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762820717; cv=fail; b=GfGpm7mXc3ti5qi/m29/0NjHiySYon20QSgUzufBDFkS0KLSez6KJ7MeDHdsh8S/zPrYD6YO6tn0X/uRxnOq3JjpeXbdUqc0B0KTV0KQKnUEYN/eyHc8awCjQi2F31eacGwc7jppJM2+sUn3yI/HVblVUd9JMyD7tBfYlFwdmuo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762820717; c=relaxed/simple;
	bh=/nhM0GcxfoOf6QnjenviftYnSKjeG4vL0v/s+qYuL5U=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=RfiuT+GLUwgkbyMsOfHO29VvjnRS6WzbzbgQQZ0XAhTrnQ31gkYDZvUg18NZ2R6/rhLUqFIKL4yNOaRwYtbZXegHGwHX3EvCqvkAgKokrflzdKXqhzpgkP7SsSw6DWhIHxd4T4+gr7SkCwtZzshEJrmgMWpsWuGSxG8dmXGpzX4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=p+svDzh9; arc=fail smtp.client-ip=40.107.74.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="p+svDzh9"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kHemgDCTkJ9ggM8uyCOb38DgyABUWXQPWDmmLpJDQm3knSbXMOe6HyMh7C14+itujILh7/2HUi+8fOYx0dF/m3HHMr0ih6XR4FQDNw/vj23uumc7FbKbysqoYl9N1or76149T2bx8xUEwnoj3rskkmkR6G0rAIWlf6e2bxm9zTsD9vOie6HEEKuBARqjOYupX7DMBmmiAV175dA46LGqZtgb2PdvBG4vZ0wQEIhXIkxbYW2XGl3PJlY2/zxq9+rlMjT/CMFTLwY1S0j1UjkqSh33adv9CPrqHjWsvZQnH8JYeezXjjCvmbaFZ7mh3eG077pq0V2BqkfLLkpdJx0mJg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YSELv5zor60a3YYDPeHb5eQQ51XH9Q1yc2yAeRcjxvM=;
 b=hOTPl2kNCO5vURrW2dc+CmeQy1MPZrJJiHqTaZVd0uTQxQIIwXw8v5c/HwCbEr0FJ24ROHqvlxxnZQ8+Oogtx5m4p7DMIYtaoX7qLabHA88Gq9iwMS6Wc8gFUDx23tUOwP9VtaIO8p7KMIAeZZd9pmaCcgN8P4pv6G4Gw+3VV5usPF0Wq71evCF1z6xHy4L2tqYGRUsLdr/4dt3P7g8H6Whe9tKTHXWIsSDiY7M42T49VixB/cLHe/yv7LW2ZkOP1sLj5kMZH+KO8g0QdIni3or0kkh8APqnnxoNx8W//LkzWZtSAXtbEvaLA8KSYhE1nLgTeIlV6bOEoxez6LQ3JA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YSELv5zor60a3YYDPeHb5eQQ51XH9Q1yc2yAeRcjxvM=;
 b=p+svDzh9g7VoevYmemplaHP7FEEmg7r+zD4GifYgp2HxzTH5p9iv77KW8UP60XYLK4F/QaPpsLV1YuZHTjLntXzukQnWdUrkLhfGQQRSAFlPvQik9ptvMI7+ymhc6CSNjGYkSQ4wxgs0bmKy/4Op/gmTzsUcZP5uyIhjYsZQzdo=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by OSCPR01MB14439.jpnprd01.prod.outlook.com
 (2603:1096:604:3a6::5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.15; Tue, 11 Nov
 2025 00:25:14 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%3]) with mapi id 15.20.9320.013; Tue, 11 Nov 2025
 00:25:13 +0000
Message-ID: <87v7jh2z6e.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 111/292] ASoC: codecs: rt5660: convert to snd_soc_dapm_xxx()
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <87cy5pa0ea.wl-kuninori.morimoto.gx@renesas.com>
References: <87cy5pa0ea.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 11 Nov 2025 00:25:13 +0000
X-ClientProxiedBy: TY4P286CA0046.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:405:36e::13) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|OSCPR01MB14439:EE_
X-MS-Office365-Filtering-Correlation-Id: d018147d-db20-4b08-d920-08de20b8c801
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|376014|1800799024|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?OM0EO9s/7C1O6wUatUCWG2x2d6dgcQNP16LtTctNTYufdbWx1cy5euNI34Is?=
 =?us-ascii?Q?NcUV4MbwstlfaN5cfTzDTYZe2Z80RXv4ARowLvtiK0UCCF6QjI3BbqmhitCm?=
 =?us-ascii?Q?wh5HFkWEhQ7mu33yAtVh0/KjX8QB9dyihcgjnRxhh/jFlQH9LXw6jLpuIZ2z?=
 =?us-ascii?Q?L7vE6lNklt0WzOMRYuBZHOSkiTElNz5w+EXxNiqaiwm5eyCqtVJ+38HTFZ8y?=
 =?us-ascii?Q?aPePFiFOLqyvDKZ59kUthP/my7jOYO2++XX8AIWWUWMF1MKdkzBiv88X/kVR?=
 =?us-ascii?Q?IIa+Eey5FB3PMvkJ0O5zobFWfYV/MgOUPWyFoGQDUXSRj9tyFDXnveH3ZOkh?=
 =?us-ascii?Q?3jeE+zW1DZDXH/4wZCk0c9NpflceZRcjTE4mwFflyTAOvbu++5U3utEW4lzd?=
 =?us-ascii?Q?/jBD8D4GxDGxRAwsLF7JOGPL390o38erdfTeiPKmvUEQ3rRJzzpU3JMBMzPR?=
 =?us-ascii?Q?THUycu+uzzMYCBOgf9CcuzQSq0aetC1OhpKXGRcwpbAINNsBpM34balg+YYZ?=
 =?us-ascii?Q?0Ww/I5fsDEhfS5XxSjjs64oKnYP0aQpPLbU4EN8rZ/2FtSBm9uWr1CSo18Uf?=
 =?us-ascii?Q?Mm9XzzEzsg7mVWKp2DYZ733RcKdWaW3xbIQJjF7W4UkiYlyy0CiwCl22RNg4?=
 =?us-ascii?Q?JZ6AwKe/Z3VaVXrKRghwNn45VbNR2bysz0xT5w7SMQUSqexsuehMqtyTlcCr?=
 =?us-ascii?Q?YB1a8dwmnNidCE6JkRJTDbFO0sNqGuO4VxQRqcGddT1PX3ZMiX8M1+OCE9ff?=
 =?us-ascii?Q?EVmP3m0P6ZQAJ3f+gYCLP0orxy1mLn+sFd25QX3GDUpo4YksC5t+ibilDVf9?=
 =?us-ascii?Q?yh1J4uXvRmsc5eGYVTcqYxO1fA6Iwh+i5srDwf/LKH7ZoTFBkHqoq2oBKoeE?=
 =?us-ascii?Q?CR2rZTb357etJkEDq7gnKmorD2qGFOgIz0XfZa+M4SxmyWFcWU7I0ULKiiGQ?=
 =?us-ascii?Q?RNhakebb5oRtjCxvQdcTwuijgjEtb9MlGnAFZ5sGDNdQBsCVsOY+Kn4z9g68?=
 =?us-ascii?Q?9Iqsi5+wOKvq4WL+DQ/6qgh/P89CKEtPQDiptUx7DdExJDRMTp8SIztVaMCT?=
 =?us-ascii?Q?wGy5Vr7IQr7TnLeZfdnmi+8juolxauSkveKQgk4rPOVCBECyS6VlMJQDDzBi?=
 =?us-ascii?Q?+HCf0y5NBocMj0u4HN7iArcZ4psXiy9bVFyd639zzEjUlfk26deQghFa11yr?=
 =?us-ascii?Q?JaeO98w5HSkgXjHmZHczKv2GGvTmJrhhASM/7mTLvFy+JDdn2x+NAH6T83+q?=
 =?us-ascii?Q?z5yPyTnI631cYTicQfVYLV0Q5b+LwOo/CXly13H2L32t5Xj0r8V9fzn+E8MG?=
 =?us-ascii?Q?bvkOwe3iCFSJiCuj57Ip3ki3/VdcBVoxIFc/By2kP1Bbn4TdAwcAwCcdubp/?=
 =?us-ascii?Q?3mTavRBr4OhbbKbpGimuO+Wk+qtwPf0PyVwK1lk09mZx9nrtW/eoR+QNveMm?=
 =?us-ascii?Q?8Q2KBo+Q1ZPv8CqjYfvBxIEpESmPynear63jat7pNH6ymWhRzzK/eqaLqGoe?=
 =?us-ascii?Q?nE+LYLrub7FFOV5S7rXyt8YWnEm2om0hZ9qw?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(1800799024)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?W8M8j2pS3jvYNdkvkx51wu2Nw3ZK3h8UgohiaZEzv+te3kCrCmLEh/hKNMuv?=
 =?us-ascii?Q?qBFyFMfh/VQRj4eUVtcjMINNiPWk0ABVhjnwpK+LI7IltCwXdT0+ttG0anEX?=
 =?us-ascii?Q?x0TWHP2sriZLZ7B0ll1fo7G9pQsE5jkq0l4y39pxxgxywc6clJTChHUQkdWG?=
 =?us-ascii?Q?so2Q5l02h8w542M2TZdaVa3OlZrieRt/bDWi//eamT/EVH8abHU1IVuWbB4K?=
 =?us-ascii?Q?lyOvsH6xKiJ+S0TpRjUd63d2J4JSH5zNEgR9OuAF0gmMknNSzI6WFSZVNiIy?=
 =?us-ascii?Q?abN1LtpQXrSpIogHCmi8JpdYEC1fYLo7asX0PmBCk6TM2iw+g8ZUZKBQUWZj?=
 =?us-ascii?Q?UdcWCx/GkTk2JzF+j1TZO1JgFZNWgj+X1TGl3FJ0z8g3fG4K8LZPfcIEQK1+?=
 =?us-ascii?Q?bXdVRYnvAur7x4noPA13uUyxB82QhjDex/A3FvhVIoTX4UlfJLtP903S/u/J?=
 =?us-ascii?Q?3jhCEp/gJFc4gOB5uJxQMSR3oe2smoXzCZsfyGrPUU/EfCIOjiGkE57f7dTG?=
 =?us-ascii?Q?J5Y0OzEcMb36OWrvhH6x3dDk8+U+ZkZf2wVG0KjlCE/cx6VBOttwkpyEAgZo?=
 =?us-ascii?Q?fhfsOfFT5469ceb6ep6Er+FzadjfiigIjCu9sdh0vUZpoR3XeVcHsFsLj1AO?=
 =?us-ascii?Q?3vkJRB6Uj7/QMgRLATYmrHZLz57oT/R+UGk3mK/T8GXG8T9X5AzfAqVWiwdB?=
 =?us-ascii?Q?EkD+c2jDY3jFdVpq1EAyLWHUvcZOJTffW3Lxo/b8/vDE/LC+ExtwMqBT8Jwj?=
 =?us-ascii?Q?3dFrD2f9aeNTIXj21jlok6j9MLssiwGfD4BTId3W8iXcxiF4ENz0XzlSCGbA?=
 =?us-ascii?Q?xS4qNmHN8l/ww/Jh/SNtVmL3RDuokBbh+i3r0SSlv/iMTtvnD7YZ6p1mhN+0?=
 =?us-ascii?Q?2G4HktH2fvMEaKbk1HE0Hi++M4dHm1ERE6w4bOLpkl1C5cyOwm0tJVRymLDi?=
 =?us-ascii?Q?p7a/1Ha0bzdqDHfDfmqYwv+QLPVPeLHLKG2B5RwtV2GANPS+gDYnpg7yoHZC?=
 =?us-ascii?Q?7fN26kT46GB2v+rSfk8JeBAuZUdxcolOdFVasQaO9Key1yiZRyPj9KA3dvZC?=
 =?us-ascii?Q?+1PSW2ja570qstMciIeQLCnnP5G2c/kVuQYz1w+Q48UqMvLlcdb1bxCW5N6Z?=
 =?us-ascii?Q?LSc9rEFuUQ1Q28aoIZsyIl+j1EFWlKJynbrZbvDNN3vgJmpeUdg6iRy/J7jw?=
 =?us-ascii?Q?ZMCR0OByKpOdl2TBWaFZpJEQcwcg7RdGGU9FVDwssI15hj6JNAKB0uAHjNzN?=
 =?us-ascii?Q?Qpo457UcMn/PMHEkLM5fLTfb07OPaa94BqXE7LXqGkTWmVWwQIP1gRlcBRNF?=
 =?us-ascii?Q?Gwy02rYXt5qdBDvUKdZMvDjNOl6lxAHVMP1ybQmZJfK9K3QEfRX2fOnYlpWo?=
 =?us-ascii?Q?DW+6EkQzQ4BM9R9dQb8UikKQvtQtKgBla62MFKLO4y7skaLSnoYrpKrfsR6y?=
 =?us-ascii?Q?aR9LlYsj3n39JXzdlAC4hxE2oTwQZvSDTsqM0hqMELh25loTyLu9d3sUeiTJ?=
 =?us-ascii?Q?+MYMqbFHNWzpBTfrB9eraoZ/W+F+bWjPmcUxLaEOvDQ7+OpEudmH/nLs587j?=
 =?us-ascii?Q?0szwRIerrDhTJ4wkZSxGy2Khp7gBIA3iCWRsyMaQ0yrIxunhnzJdwtVEwVmz?=
 =?us-ascii?Q?Wt99+VFIOC3GEijslg+4X3I=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d018147d-db20-4b08-d920-08de20b8c801
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Nov 2025 00:25:13.6082
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5cJhLozc/jKaxxuVKaB7uy/xuGsM+qYozyBCLKgetAgRRYp0o6LK0OVWbkeJ53FNdew+KxGAYUfmnvaS5frvGtk+4wScRZhe87SqLedp8Ba/4TRbAhf7FhcftT8RZElJ
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSCPR01MB14439

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
 sound/soc/codecs/rt5660.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/sound/soc/codecs/rt5660.c b/sound/soc/codecs/rt5660.c
index 44c3a3b92f98f..84cdfb810c66c 100644
--- a/sound/soc/codecs/rt5660.c
+++ b/sound/soc/codecs/rt5660.c
@@ -1069,6 +1069,7 @@ static int rt5660_set_bias_level(struct snd_soc_component *component,
 			enum snd_soc_bias_level level)
 {
 	struct rt5660_priv *rt5660 = snd_soc_component_get_drvdata(component);
+	struct snd_soc_dapm_context *dapm = snd_soc_component_to_dapm(component);
 	int ret;
 
 	switch (level) {
@@ -1079,7 +1080,7 @@ static int rt5660_set_bias_level(struct snd_soc_component *component,
 		snd_soc_component_update_bits(component, RT5660_GEN_CTRL1,
 			RT5660_DIG_GATE_CTRL, RT5660_DIG_GATE_CTRL);
 
-		if (snd_soc_component_get_bias_level(component) == SND_SOC_BIAS_ON) {
+		if (snd_soc_dapm_get_bias_level(dapm) == SND_SOC_BIAS_ON) {
 			clk_disable_unprepare(rt5660->mclk);
 		} else {
 			ret = clk_prepare_enable(rt5660->mclk);
@@ -1089,7 +1090,7 @@ static int rt5660_set_bias_level(struct snd_soc_component *component,
 		break;
 
 	case SND_SOC_BIAS_STANDBY:
-		if (snd_soc_component_get_bias_level(component) == SND_SOC_BIAS_OFF) {
+		if (snd_soc_dapm_get_bias_level(dapm) == SND_SOC_BIAS_OFF) {
 			snd_soc_component_update_bits(component, RT5660_PWR_ANLG1,
 				RT5660_PWR_VREF1 | RT5660_PWR_MB |
 				RT5660_PWR_BG | RT5660_PWR_VREF2,
-- 
2.43.0

