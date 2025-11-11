Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11010041.outbound.protection.outlook.com [52.101.228.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B75A91C84A6
	for <linux-sound@vger.kernel.org>; Tue, 11 Nov 2025 00:27:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.228.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762820878; cv=fail; b=HTaWWS+t7SYTd77Vd/+yCs1EKpTt2jK6+hydfRbD9rH8xKnH0nq35x/jTJLWFbCtTXiWnYLH9Ow/KPopbLEqiik2YWjoiyLrnx/dzYR/pu9ooQHHp7RRIQOVmWZEzCVRz0kOtH8OpuGJIvXHIdAkSVIpuYXD2JYpbK3tWN3Ukk0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762820878; c=relaxed/simple;
	bh=WFyFHpaqUHZB2jFx99iqF/9yRUUHi3tEQi42AN2UDLg=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=aA605kfISa0oyf+yRWLbqx5TpfbYj3FeIKj2WIH0NFpUPxVrZuTYT0ZA29Bwrwa5sGU73Ul/naB9/QCUqQ6iz19sVAMya1RPeMo+8L8d8mfLnQ9oCP0D+Hslwj6z8f4j8Mbs34nCp7X69myXAdq32DnueoLU1OIj84T74HzuPuc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=hVV9clN2; arc=fail smtp.client-ip=52.101.228.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="hVV9clN2"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YgUppvRH0PX8oORUVRGFlyQPxDhYC1PZl1xP1cmYi9b99VZnRZBVebnNSf0DGo/z6wwEO0QvobC6G9t/3081lKLZ/JvMursivnArmiw5ejWxU2k47zb43jfOgH2QSDMvh1KjmomSwbDx/5H9+iBs3TpwC7AqJugOhoJcyp9TDKk1wWp03CbmNw1sl5BeK1duzVsKN1oSMul2rZbK3OlZTc/yK8spHpT18dYph8ae3kWnPVp84opAY9c9tHLcL/2qJo4juEIu0yLi7ZCjE5z5BTOwo/vvE9CCoTYb6owdsPBg5bY8pzYalfbxbWM1FYiWO/lCjXDHRvDBBKrDL1VE0Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EcwyMqyHizyeFziKpBt5Q9L/QvkZYjZjN02x3tclVAc=;
 b=uvPHxzMKizDp0BR7l7ebLCQwNC0yH4Cr4izHAYpXnzY1LDbFmYpLydTVskLgvDAxOThJd2rySnY8vWTPvUNFuqUGmDQhpPyzh1fgZ9H21HS9I66aBpakcsTMtzq17AoyeKxjhY5pc1YmhTS1/qiA5D9+APwgzxe52eDexeNcbixbZntP8e9ZylKv6dB4R3wfcm7pq6gxBTUUqxBNoiCgY+NloWEPdiN9neXeR6Yhs1F2z+ku6J0/fRF+el52dN8ftwD/yEteS74N57DkgFt2t7LbxaRMfS5Gc+56H7C6eLdSGoOb4Yom9hohpqaD2IMmk/NcPRDJjwrPtutxfv6tAA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EcwyMqyHizyeFziKpBt5Q9L/QvkZYjZjN02x3tclVAc=;
 b=hVV9clN2QLW3raCEd2JV584DrNJHCxW5SMiz0m/AJEBPVOkr9MvZTMEx8eZxbllxulxIWay4vjeS7BRmgIT2YF4zIeBPYMdzOLQKqvO6ZPdBTRPvLCr/DoYff2YWus6d2//epGSVskf1sOk4lqoL55pZVSE3Atj3D7IyL32Gw0o=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TY4PR01MB12798.jpnprd01.prod.outlook.com
 (2603:1096:405:1e9::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.15; Tue, 11 Nov
 2025 00:27:55 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%3]) with mapi id 15.20.9320.013; Tue, 11 Nov 2025
 00:27:55 +0000
Message-ID: <87cy5p1khh.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 149/292] ASoC: codecs: wm0010: convert to snd_soc_dapm_xxx()
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <87cy5pa0ea.wl-kuninori.morimoto.gx@renesas.com>
References: <87cy5pa0ea.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 11 Nov 2025 00:27:54 +0000
X-ClientProxiedBy: TYCP286CA0203.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:385::16) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TY4PR01MB12798:EE_
X-MS-Office365-Filtering-Correlation-Id: 57bbe925-bb49-4c40-d235-08de20b9282e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|52116014|1800799024|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?JHUMPUoE38/2xiEaRRrZe0IJ5EW8yozKad9bSxSJMXCooS6X219C3Ha91krE?=
 =?us-ascii?Q?i6HlzJ56ZLUTz7ZHRFpd3O0vqSJy6X7GWO39RFK08PUptBUo/m/covOoc4mR?=
 =?us-ascii?Q?kZq5dp3tQpIQSE5DeoQxvvHWFuO4mzNOtRJgMruoz5GmigrBaaywL+oK7rGz?=
 =?us-ascii?Q?lqsJ9rgW76lwjwpLhfG6+06l56Tfsbn76ki34r874TOFnlxzRzxTnTXTqiOb?=
 =?us-ascii?Q?SHkhuOERr6ZFpQH0+lY4fMxKGJyhlqUkwmRYcDr0oUuSr4jtpVDWi3Qu1lBw?=
 =?us-ascii?Q?n/Vyl32/1/TRd/g75kz0qUtqfenOeeMzxFuQN65EfK0trMUEQPx98peAUP6r?=
 =?us-ascii?Q?uQdCp1DPAyZKVTBTxM09M8My5oFH9B97x/HZRHHY8drv32og39DJjGz1AL2x?=
 =?us-ascii?Q?xAhPuXuD/t2kmJBMQdA7G7wQZ4tSUgTItIGWHUMlg8xKVJdTtB1zesOmdywt?=
 =?us-ascii?Q?MsccldKwDJpxCUJAb2pmb2bQHr4N9xRTvigwNug+pD8Z+HYRu+6SikXojry/?=
 =?us-ascii?Q?Td/4A3bBEet6s2pWpEcFQCMGAsbJoUeDOpnn8ZbbxmAOtbb+2t9iUoamq2nn?=
 =?us-ascii?Q?UVmkvhFCrkjAR/BYpsArqmNrX8y7gp4xlEEhvdsNghOXgaTzfVGKH/pdzz/Q?=
 =?us-ascii?Q?t20YBD98tKGvAroojEzKZKpBejz7zAHq7crhPcWWyMBWWeP+z1gWG00id6nc?=
 =?us-ascii?Q?ITQicy1OYh246HGqRcVxxERe/eF8EZF/+Oa98MEyJNHW8LPpZuCUHwNwevkP?=
 =?us-ascii?Q?r+nHHGY02X0Z2q1sEVmNA53NuycJ3PrpqR6DkJfKTKR6ciNRSufXoXGl8Tas?=
 =?us-ascii?Q?xDO+1Uj/avsCDT3PbJ39zpe7E617tw0W9nVS2Q+qamYBOSIl+aPJD1ECyZZw?=
 =?us-ascii?Q?BrYl1JdOOeDPwOYS56rLEEPMhBYwRJ/1FOKzhfjOiiH3W1UhyzYqNx3Eu9VU?=
 =?us-ascii?Q?XlV8+1tMlrm/SKCAvAGa5QLH5VbSESjWuOPeEKNPdwr8OMAQAcJEiLRSDJ8X?=
 =?us-ascii?Q?l3+6lxmgg0JdNTc+SnY0gofDl7YkPd0xwU58n7iqoIxXcVam1ph6bySeHqNX?=
 =?us-ascii?Q?ZjwB62V0f2pYBiS1HhuZBv+fr341ZQSwgqN1KwNRHTGTsv5aryuNvx4x8O0K?=
 =?us-ascii?Q?9FT4GiXDQYG21LaEtgEt1JulUh9Y2kBFIiMMfC/28Zpp1/BUGrem92R19gFh?=
 =?us-ascii?Q?uLwNFb6tUoYH+q4WJ9kfWCcUm2SPhj7Gr3jPiqm6rHoUTbxYiWFeShvS0LcY?=
 =?us-ascii?Q?TxOcQxFkzT3P7Hpy87A/8DUgoSUsIgUw/rYQ54A8DbADnUhtiVi25793Xzmc?=
 =?us-ascii?Q?vad37JPVWzwlARbbTfFijA9paCIDPmUzfjqM2OxrLRxNRAXIsa0JESq7ZnTL?=
 =?us-ascii?Q?CDmrR5LZWgQkXHKpaG7vO35hl+rMb19Drw+QFUiEqr82vLqGQXvq30VMbJ/q?=
 =?us-ascii?Q?RGSGNx2idhcjAyNR0AEt6UjwPr+Y+p6sYgvpnHu2IFRM3UrlQNeQSrabCkgQ?=
 =?us-ascii?Q?XcnMnKkL2YMIPxZVwFJ7OGeSuyTbEiSMZ5m6?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(1800799024)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?c4Wn3UtFQHAGOtkCpUkktZy0o/9HH88H+KrA3sGwUIczQnhq5DFwHFFIYsVa?=
 =?us-ascii?Q?ZdNtFJcrGQRzFp5Fk3pIkNHiyzeV6SsP8cUSIWD3dKH8LRnE1iu0pj26kZwk?=
 =?us-ascii?Q?ysLuUA2dIIorL6WYR4ShK0AYC0u9taXCHjRHNxah4Fm2ZL5qm49mYIF7/pdk?=
 =?us-ascii?Q?R2MPrOn3pa9hD2Vg0NFpPrpWRmBKTRR+9P8V1SLrBVRuGYgQ/5+zefEDG8bW?=
 =?us-ascii?Q?/FsAQy/bNLRN/ozk8RiEV9b2Mm4rK5YIX73SiuWsJSlVCFH3/w2mr1vZ0Btz?=
 =?us-ascii?Q?ZpA4m8+LzI/E6lRwaZPB+Wur7QS99tSIQRV1TYaXgwxo2YtHxJDmi8rQptrA?=
 =?us-ascii?Q?kOWp236TrlhiiP+Oo0yB7iKkGOPXFi1ij/wyHW8JdOZO+BXnEskrb6kzSJ9+?=
 =?us-ascii?Q?DQtDJ4S5FWdvCyy3T8kmiEIGkijRyyvA5tjqGd3/n1M2pGa25iuRqL2rIcCZ?=
 =?us-ascii?Q?8fovHI2obAAUe6xMRzlgDO/EUsqH3HaNXhaJh5cCoDCDpLtg7ZAJgeitwaQr?=
 =?us-ascii?Q?OesTwXZXYKXSOJ62KpUdJGLolR6AUlfcPjnzpkLQVSR0WgWnqqR1dqs/eFT1?=
 =?us-ascii?Q?EDrz9CCLYZHS/2bayNemUFmGwHmXMc270ugnyS1u1+flmSXSAYYdybvCv39C?=
 =?us-ascii?Q?E2ZTkiDUIwZVrL9QookkI72bmZGdzX4MsNmivxEXZTAJsBJS9p/QpSpVteek?=
 =?us-ascii?Q?suo9lo0tgdNWO5Cm3rOvZzXdmhW1oXtvsKmb2LsdYc4ohLw1q4mNqN5KBkph?=
 =?us-ascii?Q?ZzJOBRuGnSZIbndedoaM+3/ty4uyiW/CcpFftEYPAGVA6RixCCo+Pfj05zco?=
 =?us-ascii?Q?sbovU4qzCvXP4sgzlNJTy25Mqu7jJaijvHQfW8dNlI3eqLGn4J+VdvKJkDzj?=
 =?us-ascii?Q?EO/lZo8FflRwv9cgVL1iTB2V73u1tno97W+KF8SCbYYslA4uAGxewAOO7+4x?=
 =?us-ascii?Q?VahOnOY5QAH4MvdmzfpsO3LDPr0U6CttCyaodMoN4+OWrgmH9SJFOfmcej4Q?=
 =?us-ascii?Q?1G9ZOTnn5livbodPqBVN+agwoIs4GSHD2HO7GPTVcejB/MiqivIAWUDTtdt1?=
 =?us-ascii?Q?Mm2H3fMEAyuTqEk6PnqBq6haJMM5J3GRzk58ZixOf1gt5c3TyQ1WXp+qYi3k?=
 =?us-ascii?Q?3YA4ailEKO1/OTBQU0RvWaIjYlrgnYOKM9WhFV1OT6bl1O7+CNwrzDN5Lkp7?=
 =?us-ascii?Q?gI3EPoAk9SCoDIi7W3UjftAfr5SGPTLnZByiG93dJxonunoT9e75kG0c2NrT?=
 =?us-ascii?Q?YyqU7IQCKxVQjBjUvc+uWMr+5A43LPzqw98+5EV/BytkWLGPOrb22UX14eeB?=
 =?us-ascii?Q?8WvVZiKl9ofCw0Ok6M9cEvfjV/VGRZYuFIBkeS/fY4xOu6Fo+yYcPx07XiHo?=
 =?us-ascii?Q?iCIGxcuSMAmUgsDWvAvNI3OzoEJ05JX37cRUEsU6pWuPZF7hjAN8PGQDHQ3x?=
 =?us-ascii?Q?h3Bn2dyz1obGxT8/e1HLE4+JyiBLLQEnPV3e/c0gmfWgRph27aetOTN4IVrH?=
 =?us-ascii?Q?8i/jnkEJm/z1dpZZedHTsZI3wxTqMZKhH/f9qXkOIejCV/i2PmRlgEr2CbfB?=
 =?us-ascii?Q?sbTH2Mcl3GbPcI7SDDm4vO6TQTJU0kmt0KOULQZdugLsvRsocInz+2iw8MyX?=
 =?us-ascii?Q?ZRZ6ajCFlwB7AizSAik0J74=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 57bbe925-bb49-4c40-d235-08de20b9282e
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Nov 2025 00:27:54.9549
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: O0r0XwL3hxOPJKDqT8rF7BFXZnTbFR4yCoeTG9jBzY/f+lXSdSTBjk69AghSVIlG9rIS6rvXLSIMQQIIYfBSMhohkIadKrlffgV3Zk+sem1AZKlhnefSdcMMCe2uBL0z
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
 sound/soc/codecs/wm0010.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/sound/soc/codecs/wm0010.c b/sound/soc/codecs/wm0010.c
index 9e67fbfc2ccaf..7511c71695c6c 100644
--- a/sound/soc/codecs/wm0010.c
+++ b/sound/soc/codecs/wm0010.c
@@ -723,16 +723,17 @@ static int wm0010_set_bias_level(struct snd_soc_component *component,
 				 enum snd_soc_bias_level level)
 {
 	struct wm0010_priv *wm0010 = snd_soc_component_get_drvdata(component);
+	struct snd_soc_dapm_context *dapm = snd_soc_component_to_dapm(component);
 
 	switch (level) {
 	case SND_SOC_BIAS_ON:
-		if (snd_soc_component_get_bias_level(component) == SND_SOC_BIAS_PREPARE)
+		if (snd_soc_dapm_get_bias_level(dapm) == SND_SOC_BIAS_PREPARE)
 			wm0010_boot(component);
 		break;
 	case SND_SOC_BIAS_PREPARE:
 		break;
 	case SND_SOC_BIAS_STANDBY:
-		if (snd_soc_component_get_bias_level(component) == SND_SOC_BIAS_PREPARE) {
+		if (snd_soc_dapm_get_bias_level(dapm) == SND_SOC_BIAS_PREPARE) {
 			mutex_lock(&wm0010->lock);
 			wm0010_halt(component);
 			mutex_unlock(&wm0010->lock);
-- 
2.43.0

