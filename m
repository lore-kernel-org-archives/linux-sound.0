Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11010064.outbound.protection.outlook.com [52.101.228.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A09B8238159
	for <linux-sound@vger.kernel.org>; Tue, 11 Nov 2025 00:35:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.228.64
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762821359; cv=fail; b=OxkbMn0shhcwHWkjNJH8arOSw9060M8brw+uILYzQgmRJF10t9HiD94sWU2rY5ynSNvxrpZbXRSoYoQ39Qj3cBBc1Jsl8+POf6bp+lnlydUf6p0vjj69mmfhTPiv1h1rJACWUOS6/V87J6janlN57MNcXmSnfqjdVVOhvx2ZKM0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762821359; c=relaxed/simple;
	bh=544RWFuaP/Vu+924jQKt+faeLUqC7KiBMBtgb4b363g=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=rjbk3Ne6yLlp0nLFdSUUQ9XOYBCm0aVGkNHWdvfoGu7oOFAviBGW9QnrwUA3cWvyhyqkm0dnk7NaydZfcyZmMKxYPGkm/SvjM4mqtDzyxCg+Xgx6GbE4jJIjxlXqEzLRx13z3l0bujrlI0yDCxlh3s9RKZCA3XPU02RwL9R5pGY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=ZLqa75WP; arc=fail smtp.client-ip=52.101.228.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="ZLqa75WP"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JxXClBZ3gzrfF/3pMG8rJ2L1+n3nUaU+ggBbvBFBiDihx5R5Ag6eZkGujiH0gzgcy34dp2+nn/X2I5mX33ftGys4dwsNVvOzQQPvEwtbrYwkjmcy8nKdKQ8XDeDNJU70ce15d18WGEIUOZCkNuv+nucbnGm1YedUsUKCYanhVeEs0uG5mTXi0/BDo090MSSsmmr8wW/Wgkt9zpvaaRW03YIAITAZp4dHJPG1GoTRkhc+gK4GN8EiaFWqqFO3F8M1dWzwCuebptsN77zcNSgdOE6SLvnZM+ihdmWRqpv8GimgExgFl6W9ACHEKVGSjaAcsfeUFbwgFYNiNNcdSbygAQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=L+7wNXYdvNhEAm1ifJzC7x/M+j8ZVjrlA4HT6kxq7p4=;
 b=QIDD+hm8T3xSL2Kh1ADfWWicaGF6my3wfYijRRzeVN5jNkjYjPURvvPeRVQSfpIoHbzBXhaHe3BOa5FGRYTq7PbcA5F3M5DybextCA84/iDuJEjZvM6qpOmy/DuFcHliAokA3LNUieK61uEMB+shw8yoDk0HIfPMXpYl86YR6mpr3zSJm2dShAMjun6vn7R+31NNNsOi5TMOWperOtPe7t1PBSEhYi8evsSFx0otcgenB7sG1trtKGaZeW+tt5KxT6L8gstUbL7S6Q4H3MOSfizUFIAUCUwR266btoSB2Grbyc/pv7a16XZUigfwDxBKADwmILtsn+YhcEKS48OODw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=L+7wNXYdvNhEAm1ifJzC7x/M+j8ZVjrlA4HT6kxq7p4=;
 b=ZLqa75WP942RpgiANf7z/JIILlu3TO4uYYxm08P18sgl1tr6DlqOqC7k3TdzFhoPuGyRe6K+sxq4fkuYS8nqrshfw/YKSR/5o64WpnM8nYtND5auFnxO06RQErkoTlId1t8UzRXCFThB+Z7k3GxlyKk/AgTidHmwnN8CcZ+3lUc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TYRPR01MB15789.jpnprd01.prod.outlook.com
 (2603:1096:405:2c6::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.15; Tue, 11 Nov
 2025 00:35:55 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%3]) with mapi id 15.20.9320.013; Tue, 11 Nov 2025
 00:35:55 +0000
Message-ID: <87ldkdtnh0.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 268/292] ASoC: sdw_utils: soc_sdw_rt_sdca_jack_common: convert to snd_soc_dapm_xxx()
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <87cy5pa0ea.wl-kuninori.morimoto.gx@renesas.com>
References: <87cy5pa0ea.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 11 Nov 2025 00:35:55 +0000
X-ClientProxiedBy: TY4P286CA0036.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:405:2b2::17) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TYRPR01MB15789:EE_
X-MS-Office365-Filtering-Correlation-Id: 0b61e738-9af3-410e-f5b4-08de20ba46dc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|376014|1800799024|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?uYsMmQxzCCQEj70k5XYJH6T3nM0+aLt84dDuAbIxnQFJNLfEoyLDXfXZsR/I?=
 =?us-ascii?Q?AKIDOxcvyOyRPggMkwSMsliZGFSB7eI6VomEFu0Q2mP2Bib3t6lQyruDZIzu?=
 =?us-ascii?Q?33mQsFvBMgStCLR/S3uy3TGhoJsRAQ0ObogbRZxtSkP3CmmtEZXcPoqBBuDS?=
 =?us-ascii?Q?BNA4yF8f5xKOxlnvOxI7tZYpjdBHIVdCQF4Ubfu+t1X+/yCXlo+8VYosMDUM?=
 =?us-ascii?Q?Ebm6IJWDVvr6hoUR4cpMIR5sprcf8+/KuHWx2PcyRUPHDAkUB0/RkihkqD+Z?=
 =?us-ascii?Q?uepeb33WJG0BOOXch3VX9iGAcJxjCUWWrvXHLr6kDMkTnPHaOpss7pWi8tqe?=
 =?us-ascii?Q?u40YDfPv42sRHSQD9vumgwta167sORxKhdUZeKUANjEbnFBHiR+eoPOzSK1E?=
 =?us-ascii?Q?d4FclAnDzH9JpOZVrjDP1CaKKeyYl9Fg++xbIKXAiTWeQcKgIFLDn+JDFcXr?=
 =?us-ascii?Q?XQlzf1WTq2LJvjhaa918ZmN9F8bTmtwHRKEtQjSTQvTVhpQbvvEOANDhsAJc?=
 =?us-ascii?Q?TFOW0NjaSJX0/wREo4C3Z/K2MNafy/AQqi5G1NoKB54CiTfDqCuETG5iXsSX?=
 =?us-ascii?Q?aHwMwbf4mjjAuDbGwJSHo9ziUbv6BfAQatqhBWVtIow4O47E3aizEjlW+TOQ?=
 =?us-ascii?Q?Wab5QWTzEh/N0RlHawYbBNnTVmZSAXCSrv3PDHWtaA/yn2AtW+yQUtlPwCTY?=
 =?us-ascii?Q?uMQrQNwFHyrIGSjiNLeFCldeotvSva0bfWCBTl+OpOQtYGRLKxbC5DNfoBE4?=
 =?us-ascii?Q?/8SPxDjGn4EGBlCM+sAPHdYzIY7yqMuhlmNYu7lXritU5Tp9weAOWYGzxYBP?=
 =?us-ascii?Q?dx+R6485FuFS1dr9/KsoIjArCl7T+PxaF1NLIxBB9/eW4xgknE+jVteDhitp?=
 =?us-ascii?Q?vYRRkkz6aClFP4bvXUHdrw8jJcoiU0hqcEwvO3lDPTEVXJJ8Fj59MnvIR3CU?=
 =?us-ascii?Q?a+ALkxQap1JepIBAi5rrx6vfuhumrDE7nb+1mX+YflbluUA2SGWvpZq5/297?=
 =?us-ascii?Q?4ZHmd/KkzSgxE27WMKm2P7DHWs4iwrV6oJGj8YPks+Q0/YxdIvU9e4VKjPDb?=
 =?us-ascii?Q?YlwGh0hLoWUNYbOZIua7x8aWnyznuXmtB8q9t+4hYiwpCgfyNbEcshZ/qdiK?=
 =?us-ascii?Q?RhwKWIqBxBQawPLP/655QhvGU2Me1zOlCpvb8PuJ3LkmbCDJ2xiFAkk1o65R?=
 =?us-ascii?Q?+JLejKNed2CrZ4Mq1BfseRhHXdh74urFFc97q9ef887GvvTJ+9SaLQF5tR/m?=
 =?us-ascii?Q?92EbGexlxldKaJ/K4MUk9/IGgNojDE8zne7g+z4gtH+LoX8NRbf5ERQU3L8O?=
 =?us-ascii?Q?fFFQrjvnwHzqXwDC8Q+jWHhhzWjrjOFpdh85CO8IZantVEUl3eu9evTdBjhc?=
 =?us-ascii?Q?0SB0U2m/r/mZWBioQ9Xb13EZZkCMymLVOLkh/NfdbA4X8CEL8TbTM2JRb0Vm?=
 =?us-ascii?Q?Bv7g4RLlMDuZhSxdO98XPCfvNbpMV2Nc6DF62LwlFCGiTESHQaZJNj1NVzgv?=
 =?us-ascii?Q?qgOi+tVk2htA60IsVOhaEHqmlAyDaumX5YGW?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(1800799024)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?fCRTIhDqJlN9yoFmq0TIJX0EIeJ8yRRPQhzWtwSko6zhUMW+eK4WRmCg3rqt?=
 =?us-ascii?Q?RYLDScUk5iW0M9GIVvM+EconJl4s4crxPEKxFKpWocor+tydiiNdXSC+sNUJ?=
 =?us-ascii?Q?4vfk4NgFLSaBkEWp+vG1q2/cugRYg2IzuxUSb9p7H7X908XJv7KobZEHvKG2?=
 =?us-ascii?Q?6NYVkUvUXIPB4daoNmR4wU7iInK2P4JlqEgNTarqvrRo0FaTU6joByH3BP9P?=
 =?us-ascii?Q?vtLB5YxNyJenJbLyPmZk+Zbk+GX0PsD15OK4cErpCaqnlb5Xqe5SomRqUQMP?=
 =?us-ascii?Q?UCXGckfza8SeuKDjYVrpBzh2wOBHPsY1wiFJjRytiGPUrtaavEBimLWfaj0K?=
 =?us-ascii?Q?osS3MkKB7qxiN0yJeuCAbY0zMtprTGiTivBRrX/EiAES12DSA5NHEsjBG0B4?=
 =?us-ascii?Q?DSgiSXx9O1x8WskU115DNpPJRaiVmgGOIAjZg2HSa2mZwnusu/j8HgO0HuBf?=
 =?us-ascii?Q?vKDWSW3xGspXnkUAwsxwogTJ1by2EKTPSrbAyiypQtZNPv5VXU8ZXcr87bg1?=
 =?us-ascii?Q?0Idjp7r/zTm3IcespAz2EEKok3odBqjmOS/2Yij6K28GGakxV3ncNSgv026l?=
 =?us-ascii?Q?OOlbDFhqR7mKLPITgMkTjinhpTI+M6JF/Oc6N4n9hB3aIsVpi7ozXjxEDcmx?=
 =?us-ascii?Q?nTeHYFKj06xRGV+/ibQl1fHfqtymaKoeJiNrHi9iEBjYhe+87CH2Z05LiQRo?=
 =?us-ascii?Q?baMVfxrUSHBQ0dUgTCUMor6RBvZ9JavZUUwihD+VrDwIgVMQDHPShjasK5bi?=
 =?us-ascii?Q?fxjZmVgv3UmpFh+etdrzqYkRH+wb+hqdfIPkqSBKfiJfaiZHDQ9BvzIY4EfT?=
 =?us-ascii?Q?h5gsrbRuQbPOgmMyi+irb0QlArKLFvqntQb2YtehF5I/lvhyY1c8nLeZEG4M?=
 =?us-ascii?Q?HRYKM2PHerM2MMnebkmIiMFWaQIQaMHWrad1sCAGf2t4rzkGF8M1zsjfTjHP?=
 =?us-ascii?Q?DGmChUFukB3qhzP9x3eiLsMuxoN1z8PEX/MOLzGWOInsvlvzbfJAmC+l8zWb?=
 =?us-ascii?Q?IK5PrZrfxEMnMfrxVZ7LsMdeZyn8tfOtODYPw52Vimg6jxrxOiuYI/i9zuhn?=
 =?us-ascii?Q?/MJa0UVpikfHWQDquAAMchurvs1AaP+K8uTIaRQ2Zb96e6fZC6BWPH8mbnR0?=
 =?us-ascii?Q?Z1dREeh8OEYWitR3NAhnNsDuqFTt/tGT4If+/B45IR70x8HsRkS0Ru6nCzN5?=
 =?us-ascii?Q?M1WKIf9Gcc7eLI1nxoJEQE8bW/ZRqrtgqvkALVMu2VjTwthnPORzqUEP4WK4?=
 =?us-ascii?Q?HvmE7VszeP+df1qB28bSHkbbS4vgPhISJ9LYf9Krm0/FjV5jY96AlEMYJmAz?=
 =?us-ascii?Q?HP/wAWFcC4tyS0R+cdvOSDk9N3p0jhu9BobJ59M/dFjzmAcpcPvmGT4D40YB?=
 =?us-ascii?Q?baiBRYfvDpFN1ailQLij2BzO/z33zU6kZePnYg/9IT8EwgWgHsBfnl9e6q1u?=
 =?us-ascii?Q?87CgvBYOZCSCHkQuV0PLftu9mkr4BO/G6Xngf/pWy/hTtAW524kW/urxDeiS?=
 =?us-ascii?Q?CVCQnBfJ571epPO0A3h/xKhgwwWLaw8+C+71bAdwFFeuXsdBdQ3ZM33nYOK7?=
 =?us-ascii?Q?53RAB7AeW8sFik7jXIctRnaui0PBXhbiMeFU0s+uuD2YPi4s08W/2o5CHIYV?=
 =?us-ascii?Q?BhL7sGZtJ7LjXwQXK2h6kdM=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0b61e738-9af3-410e-f5b4-08de20ba46dc
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Nov 2025 00:35:55.8897
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ustqhJ6JKUahHTloyf4eZESkncNtPgICQYEHvRvvLtrl7z+tkCZRcDDG6kKwDoKqtqaVae8nuqp5k7JD9rVAyWHebmoRg9lMHUtR36T2ImDGaCndGqTL6iYj0rlFLWAH
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYRPR01MB15789

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
 sound/soc/sdw_utils/soc_sdw_rt_sdca_jack_common.c | 11 ++++++-----
 1 file changed, 6 insertions(+), 5 deletions(-)

diff --git a/sound/soc/sdw_utils/soc_sdw_rt_sdca_jack_common.c b/sound/soc/sdw_utils/soc_sdw_rt_sdca_jack_common.c
index 6279faf6edd48..2547b5b3fdd79 100644
--- a/sound/soc/sdw_utils/soc_sdw_rt_sdca_jack_common.c
+++ b/sound/soc/sdw_utils/soc_sdw_rt_sdca_jack_common.c
@@ -93,6 +93,7 @@ static const char * const need_sdca_suffix[] = {
 int asoc_sdw_rt_sdca_jack_rtd_init(struct snd_soc_pcm_runtime *rtd, struct snd_soc_dai *dai)
 {
 	struct snd_soc_card *card = rtd->card;
+	struct snd_soc_dapm_context *dapm = snd_soc_card_to_dapm(card);
 	struct asoc_sdw_mc_private *ctx = snd_soc_card_get_drvdata(card);
 	struct snd_soc_component *component;
 	struct snd_soc_jack *jack;
@@ -118,19 +119,19 @@ int asoc_sdw_rt_sdca_jack_rtd_init(struct snd_soc_pcm_runtime *rtd, struct snd_s
 	}
 
 	if (strstr(component->name_prefix, "rt711")) {
-		ret = snd_soc_dapm_add_routes(&card->dapm, rt711_sdca_map,
+		ret = snd_soc_dapm_add_routes(dapm, rt711_sdca_map,
 					      ARRAY_SIZE(rt711_sdca_map));
 	} else if (strstr(component->name_prefix, "rt712")) {
-		ret = snd_soc_dapm_add_routes(&card->dapm, rt712_sdca_map,
+		ret = snd_soc_dapm_add_routes(dapm, rt712_sdca_map,
 					      ARRAY_SIZE(rt712_sdca_map));
 	} else if (strstr(component->name_prefix, "rt713")) {
-		ret = snd_soc_dapm_add_routes(&card->dapm, rt713_sdca_map,
+		ret = snd_soc_dapm_add_routes(dapm, rt713_sdca_map,
 					      ARRAY_SIZE(rt713_sdca_map));
 	} else if (strstr(component->name_prefix, "rt721")) {
-		ret = snd_soc_dapm_add_routes(&card->dapm, rt721_sdca_map,
+		ret = snd_soc_dapm_add_routes(dapm, rt721_sdca_map,
 					      ARRAY_SIZE(rt721_sdca_map));
 	} else if (strstr(component->name_prefix, "rt722")) {
-		ret = snd_soc_dapm_add_routes(&card->dapm, rt722_sdca_map,
+		ret = snd_soc_dapm_add_routes(dapm, rt722_sdca_map,
 					      ARRAY_SIZE(rt722_sdca_map));
 	} else {
 		dev_err(card->dev, "%s is not supported\n", component->name_prefix);
-- 
2.43.0

