Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazon11010043.outbound.protection.outlook.com [52.101.229.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B1E428000B
	for <linux-sound@vger.kernel.org>; Tue, 28 Oct 2025 06:53:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.229.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761634388; cv=fail; b=ie+xEO40GTj+2QJ89Pj9YuIhEQOT1skrGioCdoan0Xc9eYZZPQhjLBD/XfmKMwx6SvVg4unoIfHKwcMDtWkno+beu5V5wpXLOUzyq1kjTxQTIf3UbsB3EyQjh1tHCIL8kl+QUpZhoV0jNhIloPeXOeqO+/w2nNoszEl11qEcRIU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761634388; c=relaxed/simple;
	bh=7BPU2t/Nq2z6xyhQcJLmvBvulmYjMS1SsZE/8GnO/ng=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=IU7m3oouZqfoQuSS/4erOnwEjIysp3L/T4ibwyO39dRkO5rHd1+KWQPLQWrgB1gjGNw746r2lkHaRG3hLqlh/IphMpb5hra0JbSwE5BsFLtIiPypTtwpPwUSUifO0+Ee3gDx8vTrRiuHA+pZbtZuI8yxnwPwDvAJDK5hzKaX99U=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=fNUGVtdw; arc=fail smtp.client-ip=52.101.229.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="fNUGVtdw"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WGRkylNa/8cuzh2qGoHRvUnLfv5jUdkoxJnNa7Bvg6U2FE9JzkFBq5NnaSEVE2LNeWtij+1Xz/jCJerBZajE5uMOm5rKpa7gOQf6Y9CCvzLoMEHOcVBXmzDDrnD+1zEKt0acrNRu9BOgF7xwQSVE8xni64nXBO1jTNILiZGtGPRyaIUWFDD6iiSahJk/HYgXi+PegBMvKjke20npb0/cGemxBuSItc28bOLwhlI/Z+0FM8ZfGIi69k04jip8DRb5Rcgq/NaSg3aSPyZ4sGLAEdVJsmT3WK7cmKNIgN1TGaAS7YqF5CKlH2xKMG1Ce9KSCPoqpcoI79sM9DQGkEUKuQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=h/HyOTvo/T4nJnBeuBsepFBOCmi+DIT4/kwTUs2F7Ng=;
 b=Gm5mjSBmUMwDYVMxehou4PjCd4wrRqI4u2SGTKlnEHkrZhDWI1kvmkrx4WLRUu0/X3SlMooezxT8U2IJz/HiMdmRzcz7RHsMqpGfc9x30vacPWCU3sIq9KJC0Zo5lYmmaVmYUzskDrUxDVDx3faM6YLwmMK4OSlJYnJSf6ERs/4pO3D73QgtUuoaf5hY+Se5XIzwu1PDH7WjJS32Sg5UE1d728m9R5AwmBus1ssI6fboOVdUNBr4uZHlZhQJyaPPBV8Shjy5zKj5/KrtoQuDsDNNoiIFKF1nQx40MMZL2nzmrfNExQahMfiYFd8WoB2Hdl7dpb2URXtD7PR352axRg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=h/HyOTvo/T4nJnBeuBsepFBOCmi+DIT4/kwTUs2F7Ng=;
 b=fNUGVtdwR2wxhA+K3D9iTMK93bXye3pfLIs65kDoeyt8S4TPszxnbvrkcntN3A0jaPWluOru02MKYM0aM+l06vvBnonG5yfv9zvurnLW/wkmrwswx4R/s6f1im0xzqrLjrGBsN9VeWF9OJJEcThJvNOlIrdsY2zDhMs5R2y21tM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TY4PR01MB15756.jpnprd01.prod.outlook.com
 (2603:1096:405:273::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9275.12; Tue, 28 Oct
 2025 06:53:02 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%3]) with mapi id 15.20.9275.011; Tue, 28 Oct 2025
 06:53:02 +0000
Message-ID: <87cy67sek2.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH x/x] ASoC: ti: rx51: convert to snd_soc_dapm_xxx()
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <87h5vjselx.wl-kuninori.morimoto.gx@renesas.com>
References: <87h5vjselx.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 28 Oct 2025 06:53:02 +0000
X-ClientProxiedBy: TYCPR01CA0150.jpnprd01.prod.outlook.com
 (2603:1096:400:2b7::19) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TY4PR01MB15756:EE_
X-MS-Office365-Filtering-Correlation-Id: 27f2d844-8a64-4239-43b9-08de15eea396
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|376014|366016|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?s58Q8cokAdzKMss7Zi/2xSKlO/X/ougTbR1Ws8LRTm8AM/D8Z52HxkTIqWvA?=
 =?us-ascii?Q?h3sdofQ4+vU718ND2mCJVlF3t/rRqKIMoso7YnCtWpykmDXyY44UX20sUiq7?=
 =?us-ascii?Q?G5lxctGKLPBxYLnUKo7GdIuXTv+VKzQFuF6IgQSrBQ7BiQDMFYjT0xrlA3zP?=
 =?us-ascii?Q?3icrsQ3nnA9gD15MdR3mXeWpkWqTvIxZKkazEcHKw1WDg0BftBs8xvQfbszT?=
 =?us-ascii?Q?dyQY9CSCYciHXDStMuEfGvVraV7viYoSbmlSspWJUYYIyZTezCBUlbNPB2cL?=
 =?us-ascii?Q?AJpyfFBdw2UNzT5eBavDe51+XLoABa2vHQYvHTcTuQpnRiWHmx9Ynk8AL+XQ?=
 =?us-ascii?Q?d+1pfZ/twcW29KOR44nPj3JoxkQZNSgoMB6mpvHWtkxrgXTIIwV7Zrn4RxjU?=
 =?us-ascii?Q?moBo9B7RFivbMVPiTZn3Xmulh+cGWRJaYlhELAlNOvW0Jdb8ZQpx6t78R7Gz?=
 =?us-ascii?Q?j4Rc4P4WB9+tNIlfEQRAPTGAak01fbujGYoa/Jx3Sln4Cjk+L6cw/ZEpUJGU?=
 =?us-ascii?Q?JLNHOwnMi6w4KKNvTibpVLe9mfNUIWxhHYK4cGfGOMAgR4X3WArPbYUrTEyz?=
 =?us-ascii?Q?VoaechaYMtf0hDZMmGvg/YDP17ApuEbDWgnls/MsRXeQ6rXAP7nOWgSSbgar?=
 =?us-ascii?Q?pBzW2o19PsAUOHKAA+n2qIuisTReJ4tnwPiNru9Yv1UaX9GkRWWK8xLreSyd?=
 =?us-ascii?Q?04HYUtMivk2UWQLiA4cQ//Zmd7CSPOnILB/hu/fJ7KClMEU29HxfDC1WQe3M?=
 =?us-ascii?Q?NLlKX0jok/ppm7g5Tcm5VYCOeG25OafpT0gZKGsNghArSrnwZ/lMojrFV9Ry?=
 =?us-ascii?Q?gLF7jesAHD6hhXLh14qMHxzOhBMTjOIOWkKFM/n6p0Uq+wJeGNrn/98xh0v6?=
 =?us-ascii?Q?+nfsQU2VpVa9lcsPU/k1lCsTzbBZFRtrzKlKTluCUz3pKGzQGuUs8e7EDuC4?=
 =?us-ascii?Q?8JGOkBKJBSJg53S2eEtNU7N0ciylkNQ2aEqc7sCeWe5wnTIvpkWw4UOhHmvI?=
 =?us-ascii?Q?C909th9sjMbfLfuXVtSWrnrAADdVWvX3s+W22v+IIHFC1f7vpbuMvwVt+O+q?=
 =?us-ascii?Q?rSI9Y9dTfx1jJOWBfsz1AfeGqFKmiC/wpkns7V/RMjAPJ/g1MgjKvqzj8mEq?=
 =?us-ascii?Q?J/tBRxs+f/FiciA8wWNRWCDR7rv5KQ4Kvr7RrRcZOP6nT1aHFM3V9IiSfdYS?=
 =?us-ascii?Q?VP9boRymZ8is+56f73+VujXhbfqh3KACHNPsl0bdq5iuXaDEs8QBLWsEbRSS?=
 =?us-ascii?Q?fmo6wN2Kxqzk9npmQR3p7yHrhXhVB2m4Ua0XYtEIUpE/sQz3NNSOSkjOfxJZ?=
 =?us-ascii?Q?P71TcwHRQi+fZQe1hTkMjijuCP6wVcx3hNAOG2weFKxzE0cvN5Ar+YKhJz6r?=
 =?us-ascii?Q?x6b1/QdXp4HhQyCXtILd6yxReMj9vHOtvl9cDJbReQcRizLTRyddo7HR5QVE?=
 =?us-ascii?Q?XhW+iWzB0roMIpK4whcHr5LzJld9tw3HY7VElD9pDkFpbcK4M+JGSkItmnwX?=
 =?us-ascii?Q?wRQso0ez1kIEAra69jUUYm0bYyksdyyDhm5M?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(366016)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?zo6HsVogCSVvUE6KzShXFlxS5wnhY3t/Gnb1SRlucRvAl94e83UHp9gGcMCu?=
 =?us-ascii?Q?M+V2kS/BJxOm8X3OJWjl7NrpgME508NNKJzeHm/9OF41jw/8XRNHMdzTGJkQ?=
 =?us-ascii?Q?Rm24Q1Ee5BHm0Xdbd8GctA+SMWyyCpRndd8nO9hA0K9AcEZygXJgeCzw1HVu?=
 =?us-ascii?Q?yz8u3JgeOhu0ocoTXn/+JR+Tn0mq9RKEJ5JqRDZXwYLxhBMrXJWVmONcVZxF?=
 =?us-ascii?Q?z73Pb/esiDTHPHfsUytThSMMMQB2OjVOaRIqxMp3VP00PoRnndkDBXZNZvLV?=
 =?us-ascii?Q?VoHftMRU1BQvkAmNL+4h8nJSJbMIza84IJQ3on2r5Gifwh3mtxPv/7k9Sl0r?=
 =?us-ascii?Q?XO1Bqtzw+q6XCM6CQHuRv2qFKdUGO4MxqjlWQkOQgWU9zzuDo/oT1/+hSFAV?=
 =?us-ascii?Q?yr4y9cNRJe6gO1I2oVrbeZfuZzBrwaQhIVKqRu5EKm2FFrvajECl6YiuB7Bp?=
 =?us-ascii?Q?Bz+CWl1tM/XLRdWKCyd/EecMNUU7Hy4H+VGFLWA1oC9tZZovi9YdidUBQrUK?=
 =?us-ascii?Q?RiR/5UJ+zyaQviJEJXAd3zbKYXWUqMiKwzNboy4P9PL2DcG7/7ufVKzQ926i?=
 =?us-ascii?Q?5+uaPuUX0NdCF09yl/ZLf4QTIP80zkK3xMvf4YFk7dZKheaDThqNDcwLyxe7?=
 =?us-ascii?Q?1ZNoN+ynbvw2jH3i6k6nHsziqyiUVNjwCbjwxDnNw0CcF5XQLnGcbi4U1hGi?=
 =?us-ascii?Q?7Wv1mhou2BBpGc5I5XUnwwmasgUmBd1KqwbFMg6ca88xUwBV3spdvJetF+Xz?=
 =?us-ascii?Q?r8+1J2Wm4nl7+e2SJOfLEF/jRHDxAal3oXh+/AKNkvT5RK+8aeusC9vClJek?=
 =?us-ascii?Q?JkETt2lMuDdmwl9vOfgPomT8puDCju1rPTp7FtlgF5ECPIcPKpStkz5s9bPN?=
 =?us-ascii?Q?oHZ3D+GdZ1sON0MP3RA302b0DhIy9y5dIMWA7mHDRVI8+32NUq145cxIlwXU?=
 =?us-ascii?Q?BD+kfq0ros78um0UCTZRNUAAyQqUb2IvmsYblqIDvo/9zQgOh7ntx9bLD6XY?=
 =?us-ascii?Q?d2MaWFc1oRCAiNobvmMkgBzRxmxDsS4Ivhf+iULjnwytw2qwJj2bXzHziRws?=
 =?us-ascii?Q?POJZD2jWTnZfsOzw2NeICdY2k0EBFLmNAK0RbwFdCaQy+sG0tSnM6hW0OJox?=
 =?us-ascii?Q?Ut9DFNDjlIF9AM8YwN39Fc1f3YpMPmJ+Z2sP46ZTgBTszOuzlt2nM8SZh/CF?=
 =?us-ascii?Q?+QMvpmGDYtiVNKz6KseZxvscBzkrGHJ2Bcma3VmDXw1FYygTlp6M+4NLYPAd?=
 =?us-ascii?Q?KlfDGMTOrUzo53ojiCUsRoywo+2eKQP7H6PO7+dSt56Q5N5hkHu7IN60GtIv?=
 =?us-ascii?Q?lddmJgMQzH9iN1C/KjpLcLpd+mTUOP6j0GYNVRuKM8U27GMqgN2FN6ajReGY?=
 =?us-ascii?Q?Mo/6jNi4O7CcUOz7w/gMx60d6CAZ5B1vsd4keGbxZFmlvSbXoejO2vSXYJb6?=
 =?us-ascii?Q?50ZBLiy1XIQKC7N6KtFMBovWZvb7Z7osRcxzl3c6/gStlMAkmLRA65k+XgjH?=
 =?us-ascii?Q?QYRBzjDViOAXU4WoGBqbqAZ+LJPfwBy3HXjLP6JfDlVbJ38DQIwP1i+EkWe+?=
 =?us-ascii?Q?a3gWGhNB1bWzaF7ou2DfbHzAmdevHo70ll+bscf0F+FUXz1qkRHbcoDjnUwp?=
 =?us-ascii?Q?q8vTvYH8jqij05YtOF8z1m0=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 27f2d844-8a64-4239-43b9-08de15eea396
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Oct 2025 06:53:02.6012
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Rvrb2wIqXNlY+odjBJ3NFvM+Y8a0OVNurLz/lQvGzldHV97OwfwUp2HtdgIvHy+EKtSw2DiMWjXs7GJH7faDyNUtXscqtl2D2qQhX9t3wdTMBYz/DSnoPiZ3PBSTMhLL
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY4PR01MB15756

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
 sound/soc/ti/rx51.c | 17 ++++++++++-------
 1 file changed, 10 insertions(+), 7 deletions(-)

diff --git a/sound/soc/ti/rx51.c b/sound/soc/ti/rx51.c
index e969031657e9a..7eeb12e5066c4 100644
--- a/sound/soc/ti/rx51.c
+++ b/sound/soc/ti/rx51.c
@@ -42,7 +42,7 @@ static int rx51_jack_func;
 
 static void rx51_ext_control(struct snd_soc_dapm_context *dapm)
 {
-	struct snd_soc_card *card = dapm->card;
+	struct snd_soc_card *card = snd_soc_dapm_to_card(dapm);
 	struct rx51_audio_pdata *pdata = snd_soc_card_get_drvdata(card);
 	int hp = 0, hs = 0, tvout = 0;
 
@@ -89,10 +89,10 @@ static int rx51_startup(struct snd_pcm_substream *substream)
 {
 	struct snd_pcm_runtime *runtime = substream->runtime;
 	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
-	struct snd_soc_card *card = rtd->card;
+	struct snd_soc_dapm_context *dapm = snd_soc_card_to_dapm(rtd->card);
 
 	snd_pcm_hw_constraint_single(runtime, SNDRV_PCM_HW_PARAM_CHANNELS, 2);
-	rx51_ext_control(&card->dapm);
+	rx51_ext_control(dapm);
 
 	return 0;
 }
@@ -125,12 +125,13 @@ static int rx51_set_spk(struct snd_kcontrol *kcontrol,
 			struct snd_ctl_elem_value *ucontrol)
 {
 	struct snd_soc_card *card = snd_kcontrol_chip(kcontrol);
+	struct snd_soc_dapm_context *dapm = snd_soc_card_to_dapm(card);
 
 	if (rx51_spk_func == ucontrol->value.enumerated.item[0])
 		return 0;
 
 	rx51_spk_func = ucontrol->value.enumerated.item[0];
-	rx51_ext_control(&card->dapm);
+	rx51_ext_control(dapm);
 
 	return 1;
 }
@@ -139,7 +140,7 @@ static int rx51_spk_event(struct snd_soc_dapm_widget *w,
 			  struct snd_kcontrol *k, int event)
 {
 	struct snd_soc_dapm_context *dapm = w->dapm;
-	struct snd_soc_card *card = dapm->card;
+	struct snd_soc_card *card = snd_soc_dapm_to_card(dapm);
 	struct rx51_audio_pdata *pdata = snd_soc_card_get_drvdata(card);
 
 	gpiod_set_raw_value_cansleep(pdata->speaker_amp_gpio,
@@ -160,12 +161,13 @@ static int rx51_set_input(struct snd_kcontrol *kcontrol,
 			  struct snd_ctl_elem_value *ucontrol)
 {
 	struct snd_soc_card *card = snd_kcontrol_chip(kcontrol);
+	struct snd_soc_dapm_context *dapm = snd_soc_card_to_dapm(card);
 
 	if (rx51_dmic_func == ucontrol->value.enumerated.item[0])
 		return 0;
 
 	rx51_dmic_func = ucontrol->value.enumerated.item[0];
-	rx51_ext_control(&card->dapm);
+	rx51_ext_control(dapm);
 
 	return 1;
 }
@@ -182,12 +184,13 @@ static int rx51_set_jack(struct snd_kcontrol *kcontrol,
 			 struct snd_ctl_elem_value *ucontrol)
 {
 	struct snd_soc_card *card = snd_kcontrol_chip(kcontrol);
+	struct snd_soc_dapm_context *dapm = snd_soc_card_to_dapm(card);
 
 	if (rx51_jack_func == ucontrol->value.enumerated.item[0])
 		return 0;
 
 	rx51_jack_func = ucontrol->value.enumerated.item[0];
-	rx51_ext_control(&card->dapm);
+	rx51_ext_control(dapm);
 
 	return 1;
 }
-- 
2.43.0

