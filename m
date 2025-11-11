Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazon11011032.outbound.protection.outlook.com [52.101.125.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4A58185955
	for <linux-sound@vger.kernel.org>; Tue, 11 Nov 2025 00:22:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.125.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762820570; cv=fail; b=ov1JpXVg12ccZKYCua8sSHXCmXVL/2qEuv8xml5QgDAkslw9trVIykgs3EKY3N5SptriM1kwk2SnGYPLnS3unIs8+q1Qc2fZR/rIZ1RKRBvye+wTYutnmiNx8/Y0Eh9661T6YF0XblAf3BzPFPb/PYvoiOFIeP3lz+nDGAyiKPw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762820570; c=relaxed/simple;
	bh=qQhfzL8QX4jqctS4l8Qe/AelmzdLJFXraMNQO8oO6QM=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=fKUY4quuNZ/r5uLLlgZJkvMO2WpdL0x5mEiua7YX54F7lduGHJPUiUEhQx4R1WahZUL+XYN5V6xZuW/ZDAH8QfDMMiHAWZadKiYeTNCS+6KZm8Qf2dVHSZNBVowuN3BdpMtCLoeAeLgEmsv/8I7hC+K6rnuPssTUwr/06AjPFAQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=MCQpy253; arc=fail smtp.client-ip=52.101.125.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="MCQpy253"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ClvEXxP6ffVTitm3mD60nMA0SEIpnDpEoY6AqPFgszltJGo5+VdNh5Bwo+iWfBPxhehOLJdbZyuaZRFG/oSjMjjdUhG+Jnr6rXEDJ0M2XI0uJcw1tn3CIE9dE1xJBD/pMcny69idO9DdrRgI2DEfmw2YNpkDNePmdAhq8ydOLB6zDGGh4k3UnburchJGlWM1zynSmUNBb3jbUqLIjEXGx6zNg32sAnu6JH1lcQ8/Hw6apdbIHvB9Fu8rOLYTwfAdvyTfyj+o7Wlm5VJT/BPU2qUrROko8G56xRFGuZHJA78HW+9jNnQeRh4xgVaT1JzSgD9QlSJSl5KaEfUEEG8DMg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SC0uL2VykVhuXT6CcsoO91Rkh7Orwrk9vDwuLRSoO9M=;
 b=xGFAPj2/PhqHgzSV8+LgWU2CSpo1JaXld9d7rKClp8cxKoggsvYWcHeLh7y/KLUbAEtJxvtMNbALuqhjLGev/BcydvwghT2gZYEvpsHGPTFLyqhVshd37FD5qpQVJ+35I26AgBlVKlMejNxt5oXf9TnxTXZnY7lY1zBbv7xjh1IymZQoOIaneEL6r8oRnQyZmyXUFeGTCJ4lx4yBLFyHuY7jGEvL1v427lFL/uQeThYHUrUa6frhkn93CrYmNLut8b+2n6J6X0ga2zCwwov9/qqLnfqaQkNaYDSjxDBp2R/2xguk3zoyDkxJncSElOJHCMf7Pb5/j6bPL20VBHNV8A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SC0uL2VykVhuXT6CcsoO91Rkh7Orwrk9vDwuLRSoO9M=;
 b=MCQpy253nPXeyGrQRSxDFv3diCB1dX/T1brVsy1fq7s/OrJN09S5o8cCu23Al1OqnOO+dW5XyMRcFsLLvecWw+ZQ3oDFU+zptM87x4ElGQ+F1teOl2z0obb4RPRV5XdFULt7+8wI3PENF3OlvbA4kI/DSZZ5nLMxviNt8rLanao=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by OS9PR01MB16404.jpnprd01.prod.outlook.com
 (2603:1096:604:2be::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.15; Tue, 11 Nov
 2025 00:22:47 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%3]) with mapi id 15.20.9320.013; Tue, 11 Nov 2025
 00:22:47 +0000
Message-ID: <87h5v15sfc.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 071/292] ASoC: codecs: jz4760: convert to snd_soc_dapm_xxx()
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <87cy5pa0ea.wl-kuninori.morimoto.gx@renesas.com>
References: <87cy5pa0ea.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 11 Nov 2025 00:22:47 +0000
X-ClientProxiedBy: TYCP301CA0037.JPNP301.PROD.OUTLOOK.COM
 (2603:1096:400:380::9) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|OS9PR01MB16404:EE_
X-MS-Office365-Filtering-Correlation-Id: 9509c81a-0af3-4885-2f11-08de20b870f4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|376014|52116014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?YdMnZiics77LJ2ZWt/NiYADHc/PmPfRWzQq/Af0cKgb6+vaQtu/mK0MSA4x+?=
 =?us-ascii?Q?npmmIpgnVPrO/itLf6LrcSodQbwZ+W0Gn2uiIqkXbeXxHEH08TRMYqA114qS?=
 =?us-ascii?Q?e8Q2Tmps/h4C3pSfhrg4u7F1ihzBDaNkR+KEAVswBhTG8MTpnoD6XHPqOX8l?=
 =?us-ascii?Q?mzoedNwu3A03mQ3JU8QO5jpS4E/s2WfqUcEioVfa97BZx+yOuHD5SMJp1ymS?=
 =?us-ascii?Q?+HJ/k6uPgkzhzpvu7w5dgZNN4qJLjmY1k1eg7EHrRoKDh5sS9MDcJHdktQ2K?=
 =?us-ascii?Q?P/Jr8RaC/VXdrflrwc66Y6fd2sOa9lrBbG4AGHNNKJwxUSIup73ts1t8OSZG?=
 =?us-ascii?Q?NGHhg/MOHudK5h/4lWLLyMNTD++Ev1tecr3fxSiJqqD9Cn61QNx2rbVEkyJ8?=
 =?us-ascii?Q?mFW/2Pl4WuvDl1o7vntBPShJxlzE2Ti/J35Wa+6gbcm/v2VozgWRt6jULPcF?=
 =?us-ascii?Q?Zf7imW0ct5SPv18uym507qpbvKpgXPbFfxQkYeW4cCDWMKbk5CNCuFbW9bKB?=
 =?us-ascii?Q?pLkY7+3uLkHInBWOTVy3OSfTBWEGtMDm6kQZupvS7iUhICfCZPZOGGvogvOb?=
 =?us-ascii?Q?RA8aPVif0pR66xIHdAG/E3OQpp1vR9gyXXBL71DbDkQFR5x9m8hZ6PuvyJNB?=
 =?us-ascii?Q?De1csh+bENTz+CnnY0z2QJCMIrCvjla5eiAtwktSu1oa/DgKKBGo0/B3+4th?=
 =?us-ascii?Q?jtZbPdIu0ozEJyw6z/MvZHoxqXrUsai3Wa+ZnQDEBhzMAU+O/a4L1ioypS/w?=
 =?us-ascii?Q?5t6zYxqtK82ZAB752njQ1R65B6SdyjCVFAxU6rw46Ar1Oq5als9mdRTDBzGa?=
 =?us-ascii?Q?XFMM2IbPeqveJ/xsxOEiGCgdD2c9gxc54i424uJQGrh3b/ySRDO53hBwp1U4?=
 =?us-ascii?Q?/C32tU7qUSZ8DYFyOncHach3gYiijWbPuY/qd2ccpD9fbED8ptW8apw+7+aJ?=
 =?us-ascii?Q?OpMEV+30fz1t/cZEVEiq4FydCmt04K/gZ1OOVI6+EwK7v4LmMgRPRWXEXdLA?=
 =?us-ascii?Q?5iYw6oCB4O0i2o+wg90A6owOebp+M7LApnTxEiTUb5Mr1h1XNIG0ZxZvOs0Z?=
 =?us-ascii?Q?zkUSggihANnISi9tGltEkDPYyukOSQlYH1gFqnYp3ch7oe7WnW9hjLL3PF6a?=
 =?us-ascii?Q?O7m6j10pHjmP+CHgSJ9fvKZHVWBjdoHMckTGNBnwM47Fcxyg1a8gjMIobU4B?=
 =?us-ascii?Q?/eeJNoNLscFXRuAh7E0+cJWsRXlXigsWLVSxBD0EbV0BkdXwQJ+B48sfXdxw?=
 =?us-ascii?Q?YKrv8BcarE5pQ/NqUQnPCFrjS58Zv/q37qXUnSRUMzmW4uijSoY+3mcYu4cG?=
 =?us-ascii?Q?C8bSf38KlC6C3nBj5fT0Tr6hn7i+VLoA9CKSJjxnQPCWg1cDZlEEEA6qh2LN?=
 =?us-ascii?Q?xDdZBnNSX1ZXhG0SaIIO91JT1XMye1sNDxcM9whcIJtdHH4DRtBSzvgk+S5h?=
 =?us-ascii?Q?80pU6lGctfi1YLrDTjiWHxIi8dz7gNrpc7XAadEuhS5nWKS4vAuspMMq4G6m?=
 =?us-ascii?Q?Iw6YQ2+XL309gDGqmwza6qRzgj3TFijo793F?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?a9nT6MtiHOXMYVVSwX5iTB2irIHwca13AJIohD1y5/353WCu+NmqjpALLGcg?=
 =?us-ascii?Q?5Zdd+Z6TdMDQI/jIjgjopLg0CxtEfR0Z4cEGcR6uDupn1sj80Tg13T4aruw2?=
 =?us-ascii?Q?U64glZgOCevlXWE3AnyHP6n7ThFiwQnYHqqRGzeGV5JIIrd/YAUcPr1bK0W6?=
 =?us-ascii?Q?80T5f7YaBevQkAKBUNS6P+nkCRaNxwzudP135tt1HCnS94sdFiI3trehHozJ?=
 =?us-ascii?Q?XZee+wchYvxwDxYqljCN8M+bOvD4jRsy6HXQn3XOm0VMttLo7VUukyG3UlJi?=
 =?us-ascii?Q?sOHM+lfVGX+xc65rW9iNr5+3VwCjUeq0+nY12A4A090jSPEl5mn/1omdzwJZ?=
 =?us-ascii?Q?TbxtlYAWEV/lUGQo9yS+gjzwVtLPFKuAFDmLAo2buZUMR6fzrDczsvEfHDGx?=
 =?us-ascii?Q?MT6VKwFgprH3j3TtzknJQvi0BwXJ3yAGx4cI0ckRrW8Kr12YAKy+zJHgV8QO?=
 =?us-ascii?Q?axWBqMcnx126Qx7KLDylg7RPApi9lssub1MfsO2zo3siEgbqWdrfCdzbltf8?=
 =?us-ascii?Q?6/2D/Je+mF27bhvixJYw5zRkO3GumznobIxiBJP86E8Zb8EqaZkqqp46DD3L?=
 =?us-ascii?Q?yEWTvEm8nxn+uMrapVcrzEbCtUoIo2NOaA0QBOLZiY3sNCt6eiWh1EwHpVD+?=
 =?us-ascii?Q?7gjToZy1xBxx0BW9btrZJqAS2Wo8gp8oiGsfxdZ/iAWFYKqrnclX6VVcv7yf?=
 =?us-ascii?Q?f40HzPgeje0CYOBsxwnRjDjvMpE2cOGK5heO6C87fZtBBXbJR/UA3yQ3lTj3?=
 =?us-ascii?Q?FvfcxXpox6oaLQ/gKmAeL0uvbjwXUBjJvx7SyzxeXCbI1gAktGLepmdxVVfQ?=
 =?us-ascii?Q?4Xrczwr9WX7/54mrWgFT0PpS0kfaskKF/Mmb023Fb91RUyT2XPIsDSURJ9eZ?=
 =?us-ascii?Q?ZWGHfOWx202kRN3VsqEcFmH6IYyI8fDZqrehTT6ubeETBSPx+yiEhDH2ariQ?=
 =?us-ascii?Q?fNqPxVmraK6U86YSQZT7BeX4s+mrilM/pscTYa/BKh8sfuM6wln+yZtKVdjX?=
 =?us-ascii?Q?ZBexsDJWiuWAJNpt3PogBI4sfqZI02hEwGCS9+vYxfH00PDw58ivMyaf3ITF?=
 =?us-ascii?Q?LbKyFf1rkts6qBx/nBPn61GlT8VofKch6kJch8ruKa4pPjkY9xPAWp45Hpz5?=
 =?us-ascii?Q?WuT2RQvLP9i0PS8xOL/KfJUgDBhqS9wve41nGQQclW3IBHpEJfFJMsnj0p35?=
 =?us-ascii?Q?Z6xMmla7Q3+WDwyvbowEeemaRQwPKJIj3VTndUx5D541qucpurz8CIWGLJa3?=
 =?us-ascii?Q?4tZxYRobVJ4pwBK5O+2mAvctlG54/Hb5g70F96O+0c8J93uIrXD1fB5FAx26?=
 =?us-ascii?Q?kBKEYh8zpn3OqavN+RJn7RYPakc25DNhWO30P8NSpWKswODLMAAICd3UUiPK?=
 =?us-ascii?Q?ACSZXq9bZvRzOZJGX6DeOjqvVKbP40K6zAbSFETCk6wtPA2kiVbS9pCqLTqY?=
 =?us-ascii?Q?mXEiwABPmTXvs6UTOAN8uuyUq9Du73eeBCEqwngneRLC/kheRN93RJwx4yS2?=
 =?us-ascii?Q?iqYLN+5tt/uJCjIi9lXT4ImO5tF2OCyNqOF9qowPSUzDFO3DFXJkUEpIRXPO?=
 =?us-ascii?Q?TzlVOP5221ZqB3brbBh8bAaHZmFlWuA5ikaAPK3qkpiREl6u82Dj6qCeLhI0?=
 =?us-ascii?Q?JwQFVRtNYHh7ToxKmTGqBi0=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9509c81a-0af3-4885-2f11-08de20b870f4
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Nov 2025 00:22:47.5462
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vkBEIMam2vz+UIhKwbuKdeTH+XtPzm/Hm5UMBTqqCZI6LphhehYaXJVqjTcRZ+A4HeD3UreZGWgtj4FAvyJSLu22UhU3Bl9oYNRJga18Psq4+t97NZdklXEajsXA3rPP
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS9PR01MB16404

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
 sound/soc/codecs/jz4760.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/sound/soc/codecs/jz4760.c b/sound/soc/codecs/jz4760.c
index e04af1b9ace86..344c251be3977 100644
--- a/sound/soc/codecs/jz4760.c
+++ b/sound/soc/codecs/jz4760.c
@@ -197,7 +197,7 @@ static int jz4760_codec_startup(struct snd_pcm_substream *substream,
 				struct snd_soc_dai *dai)
 {
 	struct snd_soc_component *codec = dai->component;
-	struct snd_soc_dapm_context *dapm = snd_soc_component_get_dapm(codec);
+	struct snd_soc_dapm_context *dapm = snd_soc_component_to_dapm(codec);
 	int ret = 0;
 
 	/*
@@ -214,7 +214,7 @@ static void jz4760_codec_shutdown(struct snd_pcm_substream *substream,
 				  struct snd_soc_dai *dai)
 {
 	struct snd_soc_component *codec = dai->component;
-	struct snd_soc_dapm_context *dapm = snd_soc_component_get_dapm(codec);
+	struct snd_soc_dapm_context *dapm = snd_soc_component_to_dapm(codec);
 
 	if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK)
 		snd_soc_dapm_disable_pin(dapm, "SYSCLK");
@@ -225,6 +225,7 @@ static int jz4760_codec_pcm_trigger(struct snd_pcm_substream *substream,
 				    int cmd, struct snd_soc_dai *dai)
 {
 	struct snd_soc_component *codec = dai->component;
+	struct snd_soc_dapm_context *dapm = snd_soc_component_to_dapm(codec);
 	int ret = 0;
 
 	switch (cmd) {
@@ -232,7 +233,7 @@ static int jz4760_codec_pcm_trigger(struct snd_pcm_substream *substream,
 	case SNDRV_PCM_TRIGGER_RESUME:
 	case SNDRV_PCM_TRIGGER_PAUSE_RELEASE:
 		if (substream->stream != SNDRV_PCM_STREAM_PLAYBACK)
-			snd_soc_component_force_bias_level(codec, SND_SOC_BIAS_ON);
+			snd_soc_dapm_force_bias_level(dapm, SND_SOC_BIAS_ON);
 		break;
 	case SNDRV_PCM_TRIGGER_STOP:
 	case SNDRV_PCM_TRIGGER_SUSPEND:
-- 
2.43.0

