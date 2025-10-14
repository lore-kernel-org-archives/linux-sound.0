Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazon11011007.outbound.protection.outlook.com [52.101.125.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2778230B512
	for <linux-sound@vger.kernel.org>; Tue, 14 Oct 2025 04:27:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.125.7
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760416077; cv=fail; b=FR56qgCVMT4Jq115d3rVibNNurJTBVwqJuMzLMJdIBk9RpsXEbCRQj4/3AUGMBBfjENDYrEJlgFlU99qJcFIkXBmTb8/32EA0hkUEKim9JyZiku8cIBa5kTZTWvmGou3dDg4HfCSys8gBdgWUnRfE4CiS76GRKUrwqsMq6khh9M=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760416077; c=relaxed/simple;
	bh=hn1ZXkao1SmP/NMRTFRdhTbB24ayPJDEiMlRgW9HEsY=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=Y+irUynNQHHDQmimFPqF7v+qLENQ2UY9zMYJpqR5hb9LaKkVE63Mry1HAy5BO8qrjRVN85ODGlPJNeivArDEJ1cU+fUPwODiXoaDfPGtlJOXYzdTvCUEQEx5RSO3rQsopFbSkQTnUjS3fs1XUVKq969mOkU9GsV19NVAlivzic0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=DOZKY/aq; arc=fail smtp.client-ip=52.101.125.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="DOZKY/aq"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yx4dgU5gJAMZdV+4/JSaqNGcD6gBaaD5XbyC+Dw9NZDPF2YaLL1F128WFOvyItUrbKt5yavLxfvbfdUNh4TAcoye2Lb7LSlKKPqnYyscAmqF9t2NFvRgUytbpmw6rOkeiKTpasayT9n4ZjchVQDGJ4yI6+SEpnYvW+49MsZ0779bgS/tU+DZ4ZDmLqmbkoIoa0Ef3kmIgoRz0ZnAOJZb3oVpFxf8dhwg0xESSYxHJSwknnX8h6UjoKSZGILQ2Cg428/O6Y7OocNV4kVHRM4Gt+LTiLZl8yYOicRWmL6QoAS/Hnn2pq3NZjUQzTrYCjNXiwbZ5zH5jgQcsRWzEW8m2w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YSfSEKSH6+OiSynWfTdeRWbaXVkYpoPihzlDLILHjn4=;
 b=i6AtjKH4DLYh8tuS4Kpr7XwG22lsPyqLnjGCS/q9QEGBbS6U9+7fJKksXrIKZs8hSi4uiwQ0PcjI2T7ip65Tv/aV0HZMEw625A6Fr/AgvUT0n9yE+JCX3wnACu/g7UobAuvUR0PMb6XqUt/yw66LrfXngw9Png85TT1W5FQinvawc9JZs1imXw/gUe/7ikwDAUFDCqChCEINjNps+DJ62ADGdZ8Hr3Ul18jM4VxD/XJTm2/DjEyN4Qzv7UHJQvaFkUMJzrylXl4oixST0lW3aFJvKJjmdneHJEgLMwZhEncLJMTCBLOeZzJe+LduBaASNoHxLtkeDY1fi7MK50+EKg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YSfSEKSH6+OiSynWfTdeRWbaXVkYpoPihzlDLILHjn4=;
 b=DOZKY/aqCTSLRdwCfLKDbCzuCEXue8hvGIeoS+IbZRfX1BPZwSogzk3+XNu35/dyyYUO84IGXu9Fdpl6SuP6ORIV7nM95nIWHno9XXVyf4Mzv3XZyl6HOFi1d9sPUVKXxP8o7dadSGKdyzapOKt4GueELmoJnnbgJCqIxru3mbg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TYCPR01MB7268.jpnprd01.prod.outlook.com
 (2603:1096:400:f3::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9228.9; Tue, 14 Oct
 2025 04:27:53 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%3]) with mapi id 15.20.9228.005; Tue, 14 Oct 2025
 04:27:53 +0000
Message-ID: <87frbmm7jr.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 136/139] ASoC: tegra: tegra186: use snd_kcontrol_chip() instead of snd_soc_kcontrol_component()
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <87v7kit8sh.wl-kuninori.morimoto.gx@renesas.com>
References: <87v7kit8sh.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 14 Oct 2025 04:27:53 +0000
X-ClientProxiedBy: TYWP286CA0032.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:262::16) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TYCPR01MB7268:EE_
X-MS-Office365-Filtering-Correlation-Id: b257be33-fcb4-45b2-75ef-08de0ada0aae
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|376014|1800799024|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?zldnO2MkbD7dbfHau7lg2dMaPRXzOVF3Sb/8vHX8IaOzP7kXeLe2N9UhFDHm?=
 =?us-ascii?Q?kbDZOOZo4rlTQHzkGtq1+ctI8awZzrUyou29rmE+HxrpKztJ0+b/4mPvbVng?=
 =?us-ascii?Q?i+Q1nC7Xr4VDGmEvQIoz4beLNkUDvGTm25dYjsxv3G0kQ0Zwxb5pSwKfb382?=
 =?us-ascii?Q?Lgj5ecRmiInOps3VfS+ckDtY6SqlsJ858sZHqpjM19SzY8ntexoEwwq1Oqoo?=
 =?us-ascii?Q?9BfKVATus5E4EHe8MEeMMfhbW0br50H92gJwKy4wKSKe0BT9f2GPGzWdR1wG?=
 =?us-ascii?Q?y56ZTx/EWJdBEesQI/1vqJm7EXmAxMmmnXa63JcAXpKe5h7NVSNZZlmbvHii?=
 =?us-ascii?Q?0dYFmfkwgQToRTd8cnmlB1ej0i5tTd2Qz/8GlCcbUcECKoAfLcPuYrEnWoNm?=
 =?us-ascii?Q?CWT8MfXqHy+BoB+o7MWyRlp5UjZNBc95FHdBPBbyhf7RLytzep1ak3DsRnD9?=
 =?us-ascii?Q?ah4+Am+9dNWO5O5ImJHhZJS7AebOJrH/50T2UgGYhja6aYUv3uRity9MxzE/?=
 =?us-ascii?Q?/HzGLK6+zGhJ+d9Fs0iPBE5gqHNW79GaxxhKUFM7M8AiKahf+35mT5YnKJWx?=
 =?us-ascii?Q?s/jyibzMnj+OQPMsOBFa2eJZJVkSfdzpysK7txP9lGmPcZXeGKNOKxCqadZE?=
 =?us-ascii?Q?DBjjNGBCn8CB8B28sHUx8/mQiPyzVLaHTJuiumH49et+2tUqWLl521JqF81U?=
 =?us-ascii?Q?6N6CwJMRDmzAclhOGHnE5hulogAU1usIQj1dDLVHzPP648jziQYjIJU1fAZc?=
 =?us-ascii?Q?OKSNgd4EXb4Qvi9yauAjEtCAiz7sfN2zXOGxxa8XgGsJ/rwvS2rx2tnkecqP?=
 =?us-ascii?Q?rBTloGTvHzEd/VEsT8P3twOMU4o4HoJsWMV142N57zKOHnEFwYt3TSac6a2K?=
 =?us-ascii?Q?zHgaxIOgrA74HI0Mya6RlHSBWWGLOTqCu7ovZlBEo7trVnHZVlEvUvEfj/Oi?=
 =?us-ascii?Q?zkf6YeqG3DB35kZkZjRMeJSiItaJ3lX4LgFwlf+dn1TQaMbTepM2e5q0DYpO?=
 =?us-ascii?Q?AEfg+DFiVGjR/Q5D2ykinjCbpEVSwxfbpnwU6zKXDpTfu4BAV3YKMVNQAN59?=
 =?us-ascii?Q?GauDaS7V1vPS9sHGCmWc4HNYGeBd0QF2RFFUV8Dx7s7tUx4adhrEVWLOblc4?=
 =?us-ascii?Q?6mXhBcg1iO1VzEz4rDpPDS/QMKRq1gSLDR9vXvBxZgmTk5iE3xyhNAP5hd+e?=
 =?us-ascii?Q?n5USI1MqhkZUmqaJpdC/x+mfMFww4toeHtjje1OTOl3lAYz9RRjTWpOhADDJ?=
 =?us-ascii?Q?b1/StvleGOYZJCqMwp1sQij+wpS34+Ybuqsq/1sDumph8CJ4SEhFQFjQhlvA?=
 =?us-ascii?Q?9vhfZTTC9NlnXfTq/Z+1xWPSax2zdXuoNkbuI6vvgFyGRbfXYl6xqRe0SMpu?=
 =?us-ascii?Q?AfgFP+bDKqFJ9mmhgNQH1msgBy7J1VbcWCmuI2Ld8CowaqjOow+Q+4dSOyCE?=
 =?us-ascii?Q?DOE26aQjMnR8lXuXUbo9D+6DxZl3/e0GEyvUORw9iudYBfhyy+cdGDiN5VNN?=
 =?us-ascii?Q?IdzpAlGpjUg32r8X/a90r8KSkAQOMiA8Ilb2?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(1800799024)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?XrZxuB+peCkce0ZhqYG6iopa5udYZdESgaevKaJDvONmG1VXT1zbrcxMxYoP?=
 =?us-ascii?Q?88FJix9tY2OTNhmQ3C083FFcIFZ1qWwjO7kXVbuKIJfnrhmXbo2GskqdhcZF?=
 =?us-ascii?Q?xs1wUf/yF5aYOgrDH18USOVaam8JF6L6M+xEzvh7e8YRKwk+zFMo59lV/YwB?=
 =?us-ascii?Q?FMErEmspZjdEvxTb8+ca3O1M95J5OaSLbHmWKNy162a9OdnHtESqXhsk+gW9?=
 =?us-ascii?Q?6LVcYtZziS4MHYqGufe5ykKXCfSiAwV9TKRYSmG8GrHmnfSRLCp+KdPJ0D6c?=
 =?us-ascii?Q?GeUX8l/+mMGdSv9FQXotdTKXOtif/hgllu7oLihEzCdECti2JA0ySQsuzpFn?=
 =?us-ascii?Q?pqGDkkkq0Y5gWw/z8fbT0fJtNitBnWeGjzABl00K7AElwOeu8XNeI5NRJp5b?=
 =?us-ascii?Q?WkMUmacvsxrpQC1FXcqVGuHm+XGnBKEVkJCuuEZgeQgzODh924WdYkdIhARj?=
 =?us-ascii?Q?HijpJDEio2xtu/azw87m2DZrorEc2cI6Jy/VdOVuH99S/bmeCzfVwmldeaUY?=
 =?us-ascii?Q?NkN9WD4oO3ocK3eOF+JcGHHsDOPNJ8KJVgBGXpQH4T1AUA3+TZSU2pzYJZSo?=
 =?us-ascii?Q?1KJnjMlx4/OtnP4MuJ5iA0OWJb0N5bdDH2Q6VeNXqUggC+VYciiCWSOOc3iP?=
 =?us-ascii?Q?v8ydCFI7IXplJ0KOgLYbclBZWAypghgYHYwU7rUp2YaZTIoPbNFJ4Pg/VlVl?=
 =?us-ascii?Q?B34knM9vo2XxuwwD8g7TENMzd21Nwj/bAC0fpRl1AK4G5FDwNo04/A32SnVB?=
 =?us-ascii?Q?oJWNS3M0mDnQTv4U6qpU4Z/Sco+GTonNugX3KPyYAdzJHgRRYh6mu1Za950Z?=
 =?us-ascii?Q?uIuEWSlIJzPC4Xe0Oqo/3RYvfvEsDG7JVuqVQI6rqOeZDuUD4hW2L1aLsk1q?=
 =?us-ascii?Q?YbmQx8yXzc9AKarKLsvxLxxxHuyDYzHuEG3ob25HFM0spclYm0rOSr3xTgCl?=
 =?us-ascii?Q?rEQfqVEY8ij+m+5YOhlswD1IKEuNlVn1W3JTKgEzRLaUVbUlJStoWZZN7T3g?=
 =?us-ascii?Q?DJEyyIYL/iWIQzMsiSD5WEKhzCJGmpLCOWlo7u1W+CK3w7bxYKWZH7zSjpsp?=
 =?us-ascii?Q?MbnknugAjWYLBuu93clSQ9ls8hW1wrA/dD1r1rYRmUAXiQ1OYvkF2xj7+nlE?=
 =?us-ascii?Q?ihqDjtaRXiPUiRHNxpNAhZPdIaRFUP/JMoqSh9nGpHu85CSEJ7myns0NbEf9?=
 =?us-ascii?Q?rhUldAaSEzYsvEnt2WtglGtcd5i9K2gZQO+1twpX0XjnQTlbz1pjR71RTsoY?=
 =?us-ascii?Q?SRRyOi7H1u7yx+6XOXYf4OhNLUhDDWz8c7086vrTo7IcVzatlBIKKyOepS8p?=
 =?us-ascii?Q?lqBVwo/SbRZKy04IbTGcSLUGiUHDDSNM+SVmZpyGT+EmM2SIYtUx7nmJoxXS?=
 =?us-ascii?Q?rbxiGmjALU/GmFYVQxhuGG/8VWQmZ/gV6V37y3Qo2aGzQSGuOZeZ6VSESZgv?=
 =?us-ascii?Q?kCh+cT3khedll3m8e6j6kiQ4Ow4o/NIy190rLLwKxDIgEhDgh8mKHJyvReF3?=
 =?us-ascii?Q?dWxiQm2KFXsWzTryDFpdwM+sO//77i06Ffp393RKz+47FxImfJtt5lv0DPtM?=
 =?us-ascii?Q?X1pj9XsW6lv3VF2osAtkxiDMBEQO5UGrXfU2kbog5SiMigYXGCNXKUip2w67?=
 =?us-ascii?Q?NUy/NuTlDbi5Emfy6rmHuxs=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b257be33-fcb4-45b2-75ef-08de0ada0aae
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Oct 2025 04:27:53.3110
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /aOAWH3n8Ll2m18zL6MPd4Sust1ftogoOHfvyi8yegebiNMjlVR0OsMSJqDb5ERn/7Ysw9fkQ/mgQDo0snd1oFRBOgAKWyvOzmKsztiFsloMWxT+AE26kwJwBwOLjuU+
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB7268

We have very similar name functions (A)(B). Both gets component from
snd_kcontrol, but (A) is used in callback functions which is registered
through snd_soc_add_component_controls(), (B) is used through
snd_soc_dapm_new_widgets().

	(A) snd_soc_kcontrol_component()
	(B) snd_soc_dapm_kcontrol_component()

(B) is using very picky way to get component but using it is necessary in
ASoC. But (A) is just wrapper function to snd_kcontrol_chip(), and directly
using it without wrapper is very common way on ALSA.
To reduce confusions of similar function, let's use common way on (A).

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/tegra/tegra186_asrc.c | 24 ++++++++++++------------
 sound/soc/tegra/tegra186_dspk.c | 24 ++++++++++++------------
 2 files changed, 24 insertions(+), 24 deletions(-)

diff --git a/sound/soc/tegra/tegra186_asrc.c b/sound/soc/tegra/tegra186_asrc.c
index 851509ae07f59..2c0220e14a570 100644
--- a/sound/soc/tegra/tegra186_asrc.c
+++ b/sound/soc/tegra/tegra186_asrc.c
@@ -241,7 +241,7 @@ static int tegra186_asrc_get_ratio_source(struct snd_kcontrol *kcontrol,
 {
 	struct soc_enum *asrc_private =
 		(struct soc_enum  *)kcontrol->private_value;
-	struct snd_soc_component *cmpnt = snd_soc_kcontrol_component(kcontrol);
+	struct snd_soc_component *cmpnt = snd_kcontrol_chip(kcontrol);
 	struct tegra186_asrc *asrc = snd_soc_component_get_drvdata(cmpnt);
 	unsigned int id = asrc_private->reg / TEGRA186_ASRC_STREAM_STRIDE;
 
@@ -255,7 +255,7 @@ static int tegra186_asrc_put_ratio_source(struct snd_kcontrol *kcontrol,
 {
 	struct soc_enum *asrc_private =
 		(struct soc_enum  *)kcontrol->private_value;
-	struct snd_soc_component *cmpnt = snd_soc_kcontrol_component(kcontrol);
+	struct snd_soc_component *cmpnt = snd_kcontrol_chip(kcontrol);
 	struct tegra186_asrc *asrc = snd_soc_component_get_drvdata(cmpnt);
 	unsigned int id = asrc_private->reg / TEGRA186_ASRC_STREAM_STRIDE;
 	bool change = false;
@@ -275,7 +275,7 @@ static int tegra186_asrc_get_ratio_int(struct snd_kcontrol *kcontrol,
 {
 	struct soc_mixer_control *asrc_private =
 		(struct soc_mixer_control *)kcontrol->private_value;
-	struct snd_soc_component *cmpnt = snd_soc_kcontrol_component(kcontrol);
+	struct snd_soc_component *cmpnt = snd_kcontrol_chip(kcontrol);
 	struct tegra186_asrc *asrc = snd_soc_component_get_drvdata(cmpnt);
 	unsigned int id = asrc_private->reg / TEGRA186_ASRC_STREAM_STRIDE;
 
@@ -293,7 +293,7 @@ static int tegra186_asrc_put_ratio_int(struct snd_kcontrol *kcontrol,
 {
 	struct soc_mixer_control *asrc_private =
 		(struct soc_mixer_control *)kcontrol->private_value;
-	struct snd_soc_component *cmpnt = snd_soc_kcontrol_component(kcontrol);
+	struct snd_soc_component *cmpnt = snd_kcontrol_chip(kcontrol);
 	struct tegra186_asrc *asrc = snd_soc_component_get_drvdata(cmpnt);
 	unsigned int id = asrc_private->reg / TEGRA186_ASRC_STREAM_STRIDE;
 	bool change = false;
@@ -323,7 +323,7 @@ static int tegra186_asrc_get_ratio_frac(struct snd_kcontrol *kcontrol,
 {
 	struct soc_mreg_control *asrc_private =
 		(struct soc_mreg_control *)kcontrol->private_value;
-	struct snd_soc_component *cmpnt = snd_soc_kcontrol_component(kcontrol);
+	struct snd_soc_component *cmpnt = snd_kcontrol_chip(kcontrol);
 	struct tegra186_asrc *asrc = snd_soc_component_get_drvdata(cmpnt);
 	unsigned int id = asrc_private->regbase / TEGRA186_ASRC_STREAM_STRIDE;
 
@@ -341,7 +341,7 @@ static int tegra186_asrc_put_ratio_frac(struct snd_kcontrol *kcontrol,
 {
 	struct soc_mreg_control *asrc_private =
 		(struct soc_mreg_control *)kcontrol->private_value;
-	struct snd_soc_component *cmpnt = snd_soc_kcontrol_component(kcontrol);
+	struct snd_soc_component *cmpnt = snd_kcontrol_chip(kcontrol);
 	struct tegra186_asrc *asrc = snd_soc_component_get_drvdata(cmpnt);
 	unsigned int id = asrc_private->regbase / TEGRA186_ASRC_STREAM_STRIDE;
 	bool change = false;
@@ -371,7 +371,7 @@ static int tegra186_asrc_get_hwcomp_disable(struct snd_kcontrol *kcontrol,
 {
 	struct soc_mixer_control *asrc_private =
 		(struct soc_mixer_control *)kcontrol->private_value;
-	struct snd_soc_component *cmpnt = snd_soc_kcontrol_component(kcontrol);
+	struct snd_soc_component *cmpnt = snd_kcontrol_chip(kcontrol);
 	struct tegra186_asrc *asrc = snd_soc_component_get_drvdata(cmpnt);
 	unsigned int id = asrc_private->reg / TEGRA186_ASRC_STREAM_STRIDE;
 
@@ -385,7 +385,7 @@ static int tegra186_asrc_put_hwcomp_disable(struct snd_kcontrol *kcontrol,
 {
 	struct soc_mixer_control *asrc_private =
 		(struct soc_mixer_control *)kcontrol->private_value;
-	struct snd_soc_component *cmpnt = snd_soc_kcontrol_component(kcontrol);
+	struct snd_soc_component *cmpnt = snd_kcontrol_chip(kcontrol);
 	struct tegra186_asrc *asrc = snd_soc_component_get_drvdata(cmpnt);
 	unsigned int id = asrc_private->reg / TEGRA186_ASRC_STREAM_STRIDE;
 	int value = ucontrol->value.integer.value[0];
@@ -403,7 +403,7 @@ static int tegra186_asrc_get_input_threshold(struct snd_kcontrol *kcontrol,
 {
 	struct soc_mixer_control *asrc_private =
 		(struct soc_mixer_control *)kcontrol->private_value;
-	struct snd_soc_component *cmpnt = snd_soc_kcontrol_component(kcontrol);
+	struct snd_soc_component *cmpnt = snd_kcontrol_chip(kcontrol);
 	struct tegra186_asrc *asrc = snd_soc_component_get_drvdata(cmpnt);
 	unsigned int id = asrc_private->reg / TEGRA186_ASRC_STREAM_STRIDE;
 
@@ -417,7 +417,7 @@ static int tegra186_asrc_put_input_threshold(struct snd_kcontrol *kcontrol,
 {
 	struct soc_mixer_control *asrc_private =
 		(struct soc_mixer_control *)kcontrol->private_value;
-	struct snd_soc_component *cmpnt = snd_soc_kcontrol_component(kcontrol);
+	struct snd_soc_component *cmpnt = snd_kcontrol_chip(kcontrol);
 	struct tegra186_asrc *asrc = snd_soc_component_get_drvdata(cmpnt);
 	unsigned int id = asrc_private->reg / TEGRA186_ASRC_STREAM_STRIDE;
 	int value = (asrc->lane[id].input_thresh & ~(0x3)) |
@@ -436,7 +436,7 @@ static int tegra186_asrc_get_output_threshold(struct snd_kcontrol *kcontrol,
 {
 	struct soc_mixer_control *asrc_private =
 		(struct soc_mixer_control *)kcontrol->private_value;
-	struct snd_soc_component *cmpnt = snd_soc_kcontrol_component(kcontrol);
+	struct snd_soc_component *cmpnt = snd_kcontrol_chip(kcontrol);
 	struct tegra186_asrc *asrc = snd_soc_component_get_drvdata(cmpnt);
 	unsigned int id = asrc_private->reg / TEGRA186_ASRC_STREAM_STRIDE;
 
@@ -450,7 +450,7 @@ static int tegra186_asrc_put_output_threshold(struct snd_kcontrol *kcontrol,
 {
 	struct soc_mixer_control *asrc_private =
 		(struct soc_mixer_control *)kcontrol->private_value;
-	struct snd_soc_component *cmpnt = snd_soc_kcontrol_component(kcontrol);
+	struct snd_soc_component *cmpnt = snd_kcontrol_chip(kcontrol);
 	struct tegra186_asrc *asrc = snd_soc_component_get_drvdata(cmpnt);
 	unsigned int id = asrc_private->reg / TEGRA186_ASRC_STREAM_STRIDE;
 	int value = (asrc->lane[id].output_thresh & ~(0x3)) |
diff --git a/sound/soc/tegra/tegra186_dspk.c b/sound/soc/tegra/tegra186_dspk.c
index 21fdab2a19771..a762150db802a 100644
--- a/sound/soc/tegra/tegra186_dspk.c
+++ b/sound/soc/tegra/tegra186_dspk.c
@@ -28,7 +28,7 @@ static const struct reg_default tegra186_dspk_reg_defaults[] = {
 static int tegra186_dspk_get_fifo_th(struct snd_kcontrol *kcontrol,
 				     struct snd_ctl_elem_value *ucontrol)
 {
-	struct snd_soc_component *codec = snd_soc_kcontrol_component(kcontrol);
+	struct snd_soc_component *codec = snd_kcontrol_chip(kcontrol);
 	struct tegra186_dspk *dspk = snd_soc_component_get_drvdata(codec);
 
 	ucontrol->value.integer.value[0] = dspk->rx_fifo_th;
@@ -39,7 +39,7 @@ static int tegra186_dspk_get_fifo_th(struct snd_kcontrol *kcontrol,
 static int tegra186_dspk_put_fifo_th(struct snd_kcontrol *kcontrol,
 				     struct snd_ctl_elem_value *ucontrol)
 {
-	struct snd_soc_component *codec = snd_soc_kcontrol_component(kcontrol);
+	struct snd_soc_component *codec = snd_kcontrol_chip(kcontrol);
 	struct tegra186_dspk *dspk = snd_soc_component_get_drvdata(codec);
 	int value = ucontrol->value.integer.value[0];
 
@@ -54,7 +54,7 @@ static int tegra186_dspk_put_fifo_th(struct snd_kcontrol *kcontrol,
 static int tegra186_dspk_get_osr_val(struct snd_kcontrol *kcontrol,
 				     struct snd_ctl_elem_value *ucontrol)
 {
-	struct snd_soc_component *codec = snd_soc_kcontrol_component(kcontrol);
+	struct snd_soc_component *codec = snd_kcontrol_chip(kcontrol);
 	struct tegra186_dspk *dspk = snd_soc_component_get_drvdata(codec);
 
 	ucontrol->value.enumerated.item[0] = dspk->osr_val;
@@ -65,7 +65,7 @@ static int tegra186_dspk_get_osr_val(struct snd_kcontrol *kcontrol,
 static int tegra186_dspk_put_osr_val(struct snd_kcontrol *kcontrol,
 				     struct snd_ctl_elem_value *ucontrol)
 {
-	struct snd_soc_component *codec = snd_soc_kcontrol_component(kcontrol);
+	struct snd_soc_component *codec = snd_kcontrol_chip(kcontrol);
 	struct tegra186_dspk *dspk = snd_soc_component_get_drvdata(codec);
 	unsigned int value = ucontrol->value.enumerated.item[0];
 
@@ -80,7 +80,7 @@ static int tegra186_dspk_put_osr_val(struct snd_kcontrol *kcontrol,
 static int tegra186_dspk_get_pol_sel(struct snd_kcontrol *kcontrol,
 				     struct snd_ctl_elem_value *ucontrol)
 {
-	struct snd_soc_component *codec = snd_soc_kcontrol_component(kcontrol);
+	struct snd_soc_component *codec = snd_kcontrol_chip(kcontrol);
 	struct tegra186_dspk *dspk = snd_soc_component_get_drvdata(codec);
 
 	ucontrol->value.enumerated.item[0] = dspk->lrsel;
@@ -91,7 +91,7 @@ static int tegra186_dspk_get_pol_sel(struct snd_kcontrol *kcontrol,
 static int tegra186_dspk_put_pol_sel(struct snd_kcontrol *kcontrol,
 				     struct snd_ctl_elem_value *ucontrol)
 {
-	struct snd_soc_component *codec = snd_soc_kcontrol_component(kcontrol);
+	struct snd_soc_component *codec = snd_kcontrol_chip(kcontrol);
 	struct tegra186_dspk *dspk = snd_soc_component_get_drvdata(codec);
 	unsigned int value = ucontrol->value.enumerated.item[0];
 
@@ -106,7 +106,7 @@ static int tegra186_dspk_put_pol_sel(struct snd_kcontrol *kcontrol,
 static int tegra186_dspk_get_ch_sel(struct snd_kcontrol *kcontrol,
 				    struct snd_ctl_elem_value *ucontrol)
 {
-	struct snd_soc_component *codec = snd_soc_kcontrol_component(kcontrol);
+	struct snd_soc_component *codec = snd_kcontrol_chip(kcontrol);
 	struct tegra186_dspk *dspk = snd_soc_component_get_drvdata(codec);
 
 	ucontrol->value.enumerated.item[0] = dspk->ch_sel;
@@ -117,7 +117,7 @@ static int tegra186_dspk_get_ch_sel(struct snd_kcontrol *kcontrol,
 static int tegra186_dspk_put_ch_sel(struct snd_kcontrol *kcontrol,
 				    struct snd_ctl_elem_value *ucontrol)
 {
-	struct snd_soc_component *codec = snd_soc_kcontrol_component(kcontrol);
+	struct snd_soc_component *codec = snd_kcontrol_chip(kcontrol);
 	struct tegra186_dspk *dspk = snd_soc_component_get_drvdata(codec);
 	unsigned int value = ucontrol->value.enumerated.item[0];
 
@@ -132,7 +132,7 @@ static int tegra186_dspk_put_ch_sel(struct snd_kcontrol *kcontrol,
 static int tegra186_dspk_get_mono_to_stereo(struct snd_kcontrol *kcontrol,
 					    struct snd_ctl_elem_value *ucontrol)
 {
-	struct snd_soc_component *codec = snd_soc_kcontrol_component(kcontrol);
+	struct snd_soc_component *codec = snd_kcontrol_chip(kcontrol);
 	struct tegra186_dspk *dspk = snd_soc_component_get_drvdata(codec);
 
 	ucontrol->value.enumerated.item[0] = dspk->mono_to_stereo;
@@ -143,7 +143,7 @@ static int tegra186_dspk_get_mono_to_stereo(struct snd_kcontrol *kcontrol,
 static int tegra186_dspk_put_mono_to_stereo(struct snd_kcontrol *kcontrol,
 					    struct snd_ctl_elem_value *ucontrol)
 {
-	struct snd_soc_component *codec = snd_soc_kcontrol_component(kcontrol);
+	struct snd_soc_component *codec = snd_kcontrol_chip(kcontrol);
 	struct tegra186_dspk *dspk = snd_soc_component_get_drvdata(codec);
 	unsigned int value = ucontrol->value.enumerated.item[0];
 
@@ -158,7 +158,7 @@ static int tegra186_dspk_put_mono_to_stereo(struct snd_kcontrol *kcontrol,
 static int tegra186_dspk_get_stereo_to_mono(struct snd_kcontrol *kcontrol,
 					    struct snd_ctl_elem_value *ucontrol)
 {
-	struct snd_soc_component *codec = snd_soc_kcontrol_component(kcontrol);
+	struct snd_soc_component *codec = snd_kcontrol_chip(kcontrol);
 	struct tegra186_dspk *dspk = snd_soc_component_get_drvdata(codec);
 
 	ucontrol->value.enumerated.item[0] = dspk->stereo_to_mono;
@@ -169,7 +169,7 @@ static int tegra186_dspk_get_stereo_to_mono(struct snd_kcontrol *kcontrol,
 static int tegra186_dspk_put_stereo_to_mono(struct snd_kcontrol *kcontrol,
 					    struct snd_ctl_elem_value *ucontrol)
 {
-	struct snd_soc_component *codec = snd_soc_kcontrol_component(kcontrol);
+	struct snd_soc_component *codec = snd_kcontrol_chip(kcontrol);
 	struct tegra186_dspk *dspk = snd_soc_component_get_drvdata(codec);
 	unsigned int value = ucontrol->value.enumerated.item[0];
 
-- 
2.43.0

