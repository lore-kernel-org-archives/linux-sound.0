Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazon11010063.outbound.protection.outlook.com [52.101.229.63])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B91C31DD889
	for <linux-sound@vger.kernel.org>; Tue, 11 Nov 2025 00:28:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.229.63
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762820900; cv=fail; b=ELUC51gqH/cyuk/xo0KeRv9T/99IVWEwHdH9309arnoYkJi5pLFh6g3Av9pkapyQ0+nhGHLX4Gxk9ToTfdgw1nD6Q7DqwFz3nLjZewlQGoRS2TLhPJRa1pHfFuE1x2VSzAYQvdVpX0nXy+AfpdusHaesixBT2TGprZ2L7adBELo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762820900; c=relaxed/simple;
	bh=y34EmYnVJieQDnWpNut3u3HAx5bBTIAeNp1yVXLktjs=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=Ag0CPvZnZvmamC7g+b9A7abx+migaRJyf2gWwgvarfEHXXprXkaj1DbvZHSIkAgjwmjxng/2dU59q3g6CT3LwlO2dpf0P24F5Gex8rlM6fchAugJ9kINeLpatNAkx66Q3WZBNI3pB41LQOJK6OFj6o7qq6k1yb4j4JDA2HSQRhc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=p8orPG2X; arc=fail smtp.client-ip=52.101.229.63
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="p8orPG2X"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=E2hSFg6duN1GqtlzYiqvbgo7yPQjH65gmAA4cOrcgJnDlyp1J3Jr0cOX3V1AYd+mS5+BSCgYNiekZrdCFFAcaKe7vn6LsExG+dBnJOmKXBXvDkSgEguAS0qxe/jJ9JENIHUntkDLF6yo3avgw4HNk2cNcCVdFxHSX+Jg9y/e3a4kVCBt6IGtF/vtNIPnvC5HYiUyivkGE7r+9XqdJbpThp+UqCOkj2FOhTmbsJ0jqvj8YwpPZkCN1gZyff9SCgtdJykoYlSnnyvMyNp/mmzrsSetqXJj4gmlF0G5LdMFGJRy0Nvot4udUnNw7eAJ9AmtM0VITR8UqLkBUSS3S0F4AA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LeU1dr2H9mr60fdN0gR6NKuJ+cQ7QG9OtWb5p5I2qEc=;
 b=b5BmTl9WYycCpXaX6qXiM9Q/bvWeU6fPKY5CS9R3CepIoU5PhQHLPIGpUSiOnRy03JA4wKPGc0pm79TEM5O491gHlsNLupKleQdP6waq/+thOtmrXqIQcBdaxbqL+p+BMN62AGVHdwIv1JRcdOIhGpmsqkudDyG6U3aNTWVVc+j0IYc0kYrAoWDr8Zcfhs2w9lv9xtazBYUrM68l87fAgSVrJ1szXorYK1p7m82WSIPJNv2TcnmpB0zQugGTfEohVbxvCe427vO6Mk/ewCFK4yFKyYxEgwmmyV4V/luyJEhgVK9L/NH2ZfFp87g5a24VRNXot76TmYL+Lm3BaS3iEw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LeU1dr2H9mr60fdN0gR6NKuJ+cQ7QG9OtWb5p5I2qEc=;
 b=p8orPG2Xbs+L+tdropzx4ylaDThwkTpvcPqKv3TPSUi+xJZgU1/+3SJYYnlHYl7hIVI+2JoB8QWOR1CnwBqonKjzd8xP2zF7Ei8C2be1fWrsdDudois1StqKQmrD4QUEnKe9AjmlIk3kj/yj5J5NQdGsO0swAjFts1WUL0Bw2p8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TY4PR01MB12798.jpnprd01.prod.outlook.com
 (2603:1096:405:1e9::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.15; Tue, 11 Nov
 2025 00:28:17 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%3]) with mapi id 15.20.9320.013; Tue, 11 Nov 2025
 00:28:17 +0000
Message-ID: <874ir11kgv.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 155/292] ASoC: codecs: wm8510: convert to snd_soc_dapm_xxx()
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <87cy5pa0ea.wl-kuninori.morimoto.gx@renesas.com>
References: <87cy5pa0ea.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 11 Nov 2025 00:28:16 +0000
X-ClientProxiedBy: TYCP286CA0340.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:38e::20) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TY4PR01MB12798:EE_
X-MS-Office365-Filtering-Correlation-Id: 225cffa0-f135-4ed5-ec70-08de20b93559
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|52116014|1800799024|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?rT1/VICMfwrPUOKa+UMGCZtjUu9oT2VOD4SYIeqb7T8M3SJAscAz+pKeqv87?=
 =?us-ascii?Q?Mith8wWC5XK02lNTzdhU4MCUiwL+R6vol1MO/9UdFMBDh8Yb0A1QJx4M7pJU?=
 =?us-ascii?Q?jhL5vG4pcEHiVss/p0L2tMXpJ88cza6odXuwjZCD+STwMN9wY6wPe7Knxiup?=
 =?us-ascii?Q?vgGYxH3o0YYl1SibRICR14bkj0oPTMJ9+wtxbmHmwtP0NVvQD0Lvmq0xZ0hZ?=
 =?us-ascii?Q?W1kqVkvYUvGX4n1jB3mGzxIJAngnrmjvQHepQ6WrDQkzLxtplni3l1WX37kx?=
 =?us-ascii?Q?AHmfIlXfXkxpM8dht48j2pWmEje/9cK6nUNGWQNVsLffDU2Ia3DYMj8xwDGu?=
 =?us-ascii?Q?kua9v7Ayg7l7TaNLpxLwV7a2g5e3s/eVN/DmYcfkneCXyh6QYyT/Tzqw2Deu?=
 =?us-ascii?Q?PoQS2FcjAv3jBPewB8yaX1hr/mFwqee8XbnNKWBXBrckcyXT2uyv8xOXFhJF?=
 =?us-ascii?Q?lhBxOSwJCWZHpX5UiKblCbAgWlcF9x243zPc0u9yQ9jFdGyXJslFfcbQfLf0?=
 =?us-ascii?Q?nRHVNTr2PXXf0NVgGOQaeWdcDhefEF2VSvyWEUhd5l+DS4v7Q+5k8KbN2xdb?=
 =?us-ascii?Q?mfkOwbroAmszPfDMlZbuFOrtn2S5kRKxH9BtvifYFyhWlo1MElraMjfs9+M5?=
 =?us-ascii?Q?yUy5Ft20P8RbaS7VUWZWAkXV4oJsoIPOnk+QkdTFg7uYSOz9X3ZzBq2h98cy?=
 =?us-ascii?Q?oVSExSjHPkig9IC6KRGH7+wnFPmD0YFddgfWtSUOyVJlCzD1A1aWTTHLTOCa?=
 =?us-ascii?Q?ZNJHPFIxKkTVrbJmwWBk19pqKKLTzyzVmTsmMTt1K1tNtm7x9cqJd9MU/xsS?=
 =?us-ascii?Q?3iKipjeLfSJ90S/E4d6nFZbWznHWzrKBfLvkL9UJZ5/GVAemGBTnGYj56Com?=
 =?us-ascii?Q?4vKsaHLxE7I34/nL2UQmlpxbEZfcH4OeQRjRXGpBiqkrV0zkiX3Het9L8ojX?=
 =?us-ascii?Q?37F1EOeGKs2zSNsJTfT3M78zvocrDX4EJcSOJfYai7WPuVKUqT/nmA6E+vmU?=
 =?us-ascii?Q?OclZHZOGoVUwdVAjNcPu6vNMwILGrR4xR/bRj4nN7gkjb4cVxMtsgEJXdx1f?=
 =?us-ascii?Q?x47p57ytxFB4cQKacyvQt2s1f1s1v5YD1MArfOAaiXth6Hswz2Ye6LYKRX44?=
 =?us-ascii?Q?JtVJtc/IAGWJjJCDAfH2w7xFinoZ6jTvSiCGToiKggD7U0K3eKCOR3BCN2WF?=
 =?us-ascii?Q?PLsmXBBU0Lkz+fP5v7yrq3XMyKI4NSa66ZC0RqBCC/YNuBKy17eWiCwIfAW1?=
 =?us-ascii?Q?H3BbE9MceH+g/9zFhGnMsHYls/OVQYxZqDacJNSNc0DJ6DelMuQadBOE0mqp?=
 =?us-ascii?Q?H3WzGGWfEQeWOD/2trkzxsF1ly3HSsuwpe9IY7iwT+db+U7+mLI6Hcnq5l+H?=
 =?us-ascii?Q?Hu/Yrvui0Pz9MFQcIXgBwmtmhWta2Gm/0Wi8vtZdrMWn5W88NxRNOFNurrzj?=
 =?us-ascii?Q?UBYCeNJMqbwU/0YSh18aQIRCjAG+Uz5CUgVfGPw3EIswx5CnDWbr3BHsbzVI?=
 =?us-ascii?Q?inQQCunNU2Et3ZOBhpXapt9oA+1lRg/oHoEk?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(1800799024)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?2wnFJEYdomQec7fgGAbp9IHtmm34sw8GkZwubJyPqO8EFagx5GHNNzxcc1UU?=
 =?us-ascii?Q?YuNebgPRGqCK2VfE85R3t2oRh3UWftg3lzoMHZZpwuPT1jGoLB5ACW4tgyLW?=
 =?us-ascii?Q?JNswhIFAHJgVR/qmOqCxIOkx/rvpWofF9IH2DAStI43GmnIV95EcV5niRQlq?=
 =?us-ascii?Q?ADsmM51ysiatHDWctQcuuP+8A91zQ+LRUOqxe6e04mwg+dqjBxxCBeDvqy9n?=
 =?us-ascii?Q?T/z0mVDZrKwHKdNXQDCL6qJuijqv+kOa97RNW7lvuHUxIkhIezrVC7BlLmMY?=
 =?us-ascii?Q?T6sl6g+h9pSpq/4hwWd0RESc7lp7TIYjHZKLSHYE8p4QhRwQ8zkUtn4tJRoX?=
 =?us-ascii?Q?OYSj8ORMwA72A/pp0ELAhz8aB1O9NeeEGfd1FljBt0xLVuuRINShM8I3KTv5?=
 =?us-ascii?Q?Ov8v5movZpHvOz6YdPXV2Obur6mHg5Ml79tTuwyPLGWfx53GPPs0LCodKRGX?=
 =?us-ascii?Q?PYYO8em6489T014/eKXv8FCftsow98YrIEnKaxlGFVm9GVj5qtYrHsfi5/SP?=
 =?us-ascii?Q?dXzDKvK6p2pb3NIqVS5I3XD1+1LaUTxm6uU8SxK8WuuKcObr1ZOq7+6ijDBD?=
 =?us-ascii?Q?uTFy9vUsV/dkLcopsiLMwnSiONLU5UI7fuKG6XbrWB5QU5m5FjJ7nrTyUpHY?=
 =?us-ascii?Q?SZkMzVE2xEFmkkGhikIvig6TLBFnsb/Ae8Wwyhg4Nn4lFpnQ8xQDAba/MZOy?=
 =?us-ascii?Q?XFC/B9lhHpZupq5FQKMSkFtxVXriFxq77n0yfHstNH5aSTP5oySGlB4p7hBH?=
 =?us-ascii?Q?8QwdlxwtGw+lYH5R5CzsD4Bh45UiWVHdj/xFejKZbnrUFTUuruiplKx0sZuW?=
 =?us-ascii?Q?SUd5TXH+WBP0c4s4NXXKFehhCTt4ewMIfP8s2RoxgYmrg1aOn+LwpdZHVDkZ?=
 =?us-ascii?Q?8MuWIsOADVJT5RksGax5YwMFSQbbN3rdJYRmu4glT7kNCiwl0kTjk4BTgASa?=
 =?us-ascii?Q?lFbO6u0MZaLzYunlpvE4QLNkfUKtpDTNJzcLAgknk/ikOXDWk14k5lQYdwqm?=
 =?us-ascii?Q?wzkBF+0yfUmTEJj3trUkAgqkR1WrEn6zHV+wRyPRWj+JKAgGrNQTOOMCK887?=
 =?us-ascii?Q?JfoL6HIvxmuIoYchkedwXCzCt0xsp4cSKbGz4wCMTZKIPsven9WprSX8JDVV?=
 =?us-ascii?Q?pdeZgxLS971vm/JuPuxup/DlGh8ewMtpVGwNOOoJP+hVFEJ7FuuCLIYlDN7z?=
 =?us-ascii?Q?G+xZ9ju6nSDqr0YVf6TwwxQVe//6MXT/b8FKyGTR0cVWAUdZKmsIfBHs1A0x?=
 =?us-ascii?Q?u7EAAXp1F+QZZw9pMS1Cmbq/9Mfme6by/hMcAyzydIiXCQWJwL5MvM1LOdnd?=
 =?us-ascii?Q?Q17YnO4zZU62jDsTj2ts7QRWIEAd68tCcQhWB4Z7DCw8Q+rA5o0S7+OqdNy3?=
 =?us-ascii?Q?vgWS3eKzFBYmq5VTaEbbkwLBdlxbHCednpSH8Vh6bGRMNuq7RENjnhtnmqCG?=
 =?us-ascii?Q?ac+eTl/8YYkJbAZ40CAriSzyVMGarBCJq5W7KiwZtoqd53ym46AYclWh27Lt?=
 =?us-ascii?Q?1zx+Tqa+29gGEixNRJ5/YZGsSq9UT/Xf5hJNU/Zi0XK1Z+q38Gf+qttqQXq8?=
 =?us-ascii?Q?UUsCJvr5VY4J+7DtVXuzED+EE1/fguKMg6F+67LE1gL9BiuKlNjS2dW6pK5P?=
 =?us-ascii?Q?P5SQDM3YNoz03LPwUw+wy1s=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 225cffa0-f135-4ed5-ec70-08de20b93559
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Nov 2025 00:28:17.0282
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1K0nilKsk84PRcbrd1nQT86pkdTv70hdSGc8W9iezY8S4L6FtETFqlAN+DCkg5J4qcFhX+Aa+Sq/JFHulzXoBOYqFuCjD1MEQAEcrnMbVjrWRydnFvNk64EVcH5hZ0nA
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY4PR01MB12798

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
 sound/soc/codecs/wm8510.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/sound/soc/codecs/wm8510.c b/sound/soc/codecs/wm8510.c
index 79adbcc90d4a7..bebee333d3fd8 100644
--- a/sound/soc/codecs/wm8510.c
+++ b/sound/soc/codecs/wm8510.c
@@ -504,6 +504,7 @@ static int wm8510_set_bias_level(struct snd_soc_component *component,
 	enum snd_soc_bias_level level)
 {
 	struct wm8510_priv *wm8510 = snd_soc_component_get_drvdata(component);
+	struct snd_soc_dapm_context *dapm = snd_soc_component_to_dapm(component);
 	u16 power1 = snd_soc_component_read(component, WM8510_POWER1) & ~0x3;
 
 	switch (level) {
@@ -516,7 +517,7 @@ static int wm8510_set_bias_level(struct snd_soc_component *component,
 	case SND_SOC_BIAS_STANDBY:
 		power1 |= WM8510_POWER1_BIASEN | WM8510_POWER1_BUFIOEN;
 
-		if (snd_soc_component_get_bias_level(component) == SND_SOC_BIAS_OFF) {
+		if (snd_soc_dapm_get_bias_level(dapm) == SND_SOC_BIAS_OFF) {
 			regcache_sync(wm8510->regmap);
 
 			/* Initial cap charge at VMID 5k */
-- 
2.43.0

