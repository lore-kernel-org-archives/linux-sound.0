Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazon11010001.outbound.protection.outlook.com [52.101.229.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44FB7239E61
	for <linux-sound@vger.kernel.org>; Tue, 11 Nov 2025 00:36:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.229.1
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762821386; cv=fail; b=NX0ULywUib/JvRrqLqQEQXPst6Mp4VecMhXhZ4+K67kOC+43VbuLZ2TmIDHDty1sRs42orqUNom1OUTWpzE6TPW258Uz2V+edSgv6qDhEibeorslOLwDo+aqwhZeyHMPMdOE1bbeyys2o1ZvzC8HBuenHNT+ns9u4gMs9uJXnQY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762821386; c=relaxed/simple;
	bh=vzPHTU/KRWUPdhAwvUKK8m4pK4HxXZc4yF8DtIhBPpU=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=V0NH29xQKnRiYSSUGDZMapwB32MScQwlQvdX6LxPgZfko105rBa2FS1x+zvHh5WC1tIE9C8GTgNbknTb4dXb8WfsAIMv86cjRwxgThtKpN4ZZbb9zSdpYFaZPXS9IkakrEHNGP2L70vP27IR+CGULl+EUnK2Lg3Hbf6otlriQyM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=CniKuVuv; arc=fail smtp.client-ip=52.101.229.1
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="CniKuVuv"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EBDsqJ8EoEMx3aVzmxYcG/x0f5dqxAYwem64uwgxFApkK723jWqSxVHaOJZ8sv7F5h4MKiBYdBMv3MGkTyhMrU9Myywp4ze9ifDng0XR8dn9gmCSUPsHZDEM588uGSyJVovZXwMBy2TY5Wh8ljXGMuMtvvNrZIbz3KBn5DmQWh0JSP4CvYIqjYsr/OX7RoJCrh104LLa05ix60kFz832MDx8qeubIZYszLQrCaxulNsSNeBvDw4FPPAYC4mfb7dvH7SttM2zIhqrstLJQg1HzPi8C3p8YDPgV2Z8xiUfw4d9bkAlrEbn880UG7AdT4aNSH2mRNGGc3mxPvySiyWGdA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Iqw8BiddIbHwZmY18sf9RxbmfnPX47Qroch2jl88W2Q=;
 b=DpXDoIOpiSaaqGLTCh9l1aEEI1Eu2wYs/0mwkrvzR5XjWLjyQD7a48GWeS2tyr0Y+FoOPcys50CkqSbk+Hga2yBoqJfePqz1UZ9U5nXRokAesN0AOwQ0KnH92KP0N5WD5ycxFQr/4jHMJaK5ZR9d10g3bjiGs3koEeqGaV+yur0GB7VXO+6WbXbLvB4cpaxDnaUEvBrP+w2EpUuaC40JUX+GaO/VW+1fGBdJzL6GpMAs7Qr90b8b5KrOO/ScrdAGxoDBQrHJKgx7kYZ+TiIY/nXKJFW9bqE0rWEoBE+23m+7xY4M0dT/P3sVsxc+cpehWSbUH6FNQkf1KVwDlxaAOw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Iqw8BiddIbHwZmY18sf9RxbmfnPX47Qroch2jl88W2Q=;
 b=CniKuVuvjk54qpzM0zvwaIE4ubDS/RnCGgF9dPcqJOZyZLbucdjrhEiJbB7GUdwikYjLqFUab+TpUDCElG/UOZ+qexkTmhUX/+Vla9UcWKTEgqmOaH1u0hauY+RHpLgUQ/lfrMKBgB7kdYBPinj73v+c8feRHx8RoWQKf7EiDVM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TYRPR01MB15789.jpnprd01.prod.outlook.com
 (2603:1096:405:2c6::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.15; Tue, 11 Nov
 2025 00:36:21 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%3]) with mapi id 15.20.9320.013; Tue, 11 Nov 2025
 00:36:21 +0000
Message-ID: <87cy5ptngb.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 274/292] ASoC: soc-pcm: convert to snd_soc_dapm_xxx()
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <87cy5pa0ea.wl-kuninori.morimoto.gx@renesas.com>
References: <87cy5pa0ea.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 11 Nov 2025 00:36:21 +0000
X-ClientProxiedBy: TY4PR01CA0097.jpnprd01.prod.outlook.com
 (2603:1096:405:37d::10) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TYRPR01MB15789:EE_
X-MS-Office365-Filtering-Correlation-Id: dab91308-a2fa-46bf-116b-08de20ba5619
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|52116014|376014|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?wL2vYyDrpFzWfgZTrUpyzwjYIljP3NGZ2achhBqYBDmRYodmzR1fQ4m1M7vB?=
 =?us-ascii?Q?aGg1qJRBhd7EKSf51rnfUO7K9k5qx+hFFV7qhcCZL1In9le9o+QtnZIKupwH?=
 =?us-ascii?Q?zsLCIJ3FTy8TTPdGBqSiToTPUJKw7u6w0dS4YBbPw19c+2SdEOKPWtyVoYiy?=
 =?us-ascii?Q?5Z94wzKD6vEFNuSGkPPWhYUHFT5KkXvzFuXr9ZRjDNHcv8r0oeo+NB5mDUyb?=
 =?us-ascii?Q?SXeI7R/0R9Lot0tur00el7OCUvsB9DqXC/JuCi45qfl4AZ/Pgn1058SaUCiX?=
 =?us-ascii?Q?g65yKhPc8O3WnlnnfJJWCG5vGvF7U4BVJYGMnMt3pGKGxnKfJoE9VMBauIYn?=
 =?us-ascii?Q?/pIyd6WYFGQn5jyuLD3ABMk5wmY50/H6kLlGPRER+pW7diImE3dQeYkpTNVb?=
 =?us-ascii?Q?V/mMXERK3RXqwtpDAZqhzw7Pqv99t5DIiZgt5hDFZFeOK39vSE568C0SrTWg?=
 =?us-ascii?Q?SRxjja6Vfm/jDn4lWivjR4WBOj8QZ9sWO+BqJ9UYoZqHNpOI5z88jp+BOh1D?=
 =?us-ascii?Q?qL05xieu6iKgAXunBjV8It1NOLoFzbEwFfVS8pcn51ReuOaXPdGsodnNDX4m?=
 =?us-ascii?Q?LUh1cbrJfcL+TMOtkMrDleffPuLYggqY2aXd5v+7oCskfnzkAQ1S+0WJuyMG?=
 =?us-ascii?Q?0ORthVrnMICUEdjhcAVJF4k95WyGAagH7RxirTCkxSRBwsVVXYUG4FqaqGes?=
 =?us-ascii?Q?l2qRo7DzQcSCwNXe3wJy6nn9RuvTTC7T857U+mLO151Etp18x5j7er2QlK5P?=
 =?us-ascii?Q?8UAFyl1XHhiqzsXbMK+GTR48PJhbDnP9AVVsCtie4OeHkIIjS0WMYwHLYVkR?=
 =?us-ascii?Q?uH/HsVFdOni4IalKuheCW+GTyArIFxe+oi9AXvZX2stD/CSap8z3L6WUyr/H?=
 =?us-ascii?Q?yXNWPZcicFynH/lTyekNa5EcHxVHr7jZ3Fl5pPMvxGU37eZsewMTTF24S4e2?=
 =?us-ascii?Q?5+Ih03TynD2/GRQvd936n/0AK63YGfW/RNtXP0m3kpeOlZOzswXlNDSRCxvJ?=
 =?us-ascii?Q?BEAZzaSV0Rl4sy/YoSd+qqsd++qKoowDqGKUstPelQUQmg8IRrY/BV49yxOq?=
 =?us-ascii?Q?ScuXGbwwOPwlDufns1Swzjk/Fu5+XB5U6o5b9KdWaQuQEoruKEnFUofQhSUD?=
 =?us-ascii?Q?F8hpBjgbXDtr5DG7LfyJMvhrrdEgQaaDWvWQDCoUFU8oFHzgMjlshWcnENw/?=
 =?us-ascii?Q?yCkRbqhwExi1IxW/P6uOne1eUIno/qbpjJIgDkmccRlywXOwVmqLIW/mwjWU?=
 =?us-ascii?Q?0OKoAiIpVqs9JXpxeXrWX2m09RvW4IQOY+3LWkpeVZo+cu0HtoyroXd9RMW+?=
 =?us-ascii?Q?XPvrHvD0calRvuCIjn5VS54Bd/Q8SZkDsT8qaG58k9JZBeksAwq7OpDKsF5E?=
 =?us-ascii?Q?qdPv55f+e3yqOW7XBZO0gS+S7KwE2NCraNF01SbXJojskD+yXgxoKdbsTeI1?=
 =?us-ascii?Q?xflMW9T8D0CsUBz+wkhjl9cVocAW8IQDtqJGQbFqL84ti4JdYEbckzNYWMkQ?=
 =?us-ascii?Q?0zprwbRqCJ3wL3yTeQRS/uKwKdxZH5CDs4mp?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(52116014)(376014)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?FpWnBPMWo+ilVdrdgPUX2WsX6b8UUO8HWBBcRvACtIuObgAjAxMo55D2acEG?=
 =?us-ascii?Q?Z0PWN9qxoFcDWd9hKbr/mJYGx/zM5+fqU71UGipTQmjlH4fe2FDhnZ/O3JLf?=
 =?us-ascii?Q?fSFjh1TzQsT8Wuz73VRlJ8m0EQdaWDpgzhIi1Nt7zoW1mASeGsBLCL7AKEVm?=
 =?us-ascii?Q?xVYO/FiYxBsDLw32krJUdGI0ydQaZtFwu0zGlD+SCmq+wnZJWsPEcUrXejVE?=
 =?us-ascii?Q?VyWcyvoi/iDEogZj2gPumqBYsybmmHX1wTopVmgtR9xBy6ulKQeaSWzFmhk4?=
 =?us-ascii?Q?f0hdrUuMqUxtwyxv3Nb/MnUuok8k5S1E1Sx2GW1ebEgX1VdnjpIS4nEzS0ED?=
 =?us-ascii?Q?i0TFrIYwlNmhGiVnFstqwciCYiVS4PLR5fnlLYPZsnaIdnWQtbXE+pr6rwGm?=
 =?us-ascii?Q?BwVQpJAfLHyC78re/Udg3PPVZPMplZjOBr9ztQeON3fZCOv8AotZ0Lx4Fr7B?=
 =?us-ascii?Q?XIxvUo5MkPDOox5LQfw85FA6Kq2wRyf8Zd6afcRRYZFzeUS+AyKGHtvIFyep?=
 =?us-ascii?Q?BUzhuf8IfjbjovzR9/AlCLJS8KWHYGIMY5Mjvxlqv48bIJ1ClBNuysxxtdO3?=
 =?us-ascii?Q?pp/r0tDbLNbA9QGsFWcbemsEu33lCHI6gWu5uYD2S2Ot+G4a+ohoRn38GDdw?=
 =?us-ascii?Q?UuR5qXXuBX7uY8BkFDfwej0KcqK/vnN8Gn6wXQ1s5mpZJ9zAgKxFSs+7sXqR?=
 =?us-ascii?Q?TnEtacR9YVTQUXXv5UuV/6uvetdRu70uLeEioBmwCQfNqiPaVFBJVda8DMND?=
 =?us-ascii?Q?Wde0W+aD4CXzPlbFvP57OqAiarvlscFDxzOpOnJER0NETylWvrGLRvShd5AL?=
 =?us-ascii?Q?hPneyievu/G+be/mzfKij/2AWWbAouUBtDWc8FpfEs6+M7a3qw5D/CZ2ZYPB?=
 =?us-ascii?Q?qyeUH0jlBwO1FYZRPZZR/ZGdldYiELUEGvQbUW/Wk9RuBmGfzbk2jWsR2qwZ?=
 =?us-ascii?Q?9x3GK09DaEP2y/z4Ucq1BlCE9QrdTXLyaOCJUpy6oL7sJ1Ytmq9wrqqN8yjt?=
 =?us-ascii?Q?RewsJktAQHuehKaVCdA5VSqz5GNOQSL76P3BWgwpSPJY9DFaXvvWH+gntqDi?=
 =?us-ascii?Q?S2goyO8J3X7wWzaXMUejGceT4njUQAFFtgG+ghH+0QwjjTQSWQjPD7Mk7Ehy?=
 =?us-ascii?Q?5/XoNIcQh7r9fL1TQqpDVceW7XXTrkZCbE4iPNUD9L/+aCQm8eMA0PG10Br5?=
 =?us-ascii?Q?RbRlFjjLHhZn4tXk1A7ICCDFQdyTKhAqcftQgXQw07mfHrTBNsc+SnG2DiqW?=
 =?us-ascii?Q?JTH42BLEgeZO/BnvRsm3BCk2gbAI/JHb3Vdx6EHlwddMYxnOxUwqP2RNZG1u?=
 =?us-ascii?Q?pqibgng9Nn5xDJTj9hXAZNnXTTgjxlP6jdwICgMvUFvW/j5RGO8iyZifOvVK?=
 =?us-ascii?Q?1iIosv0b59u8nvl29bSq3ie1C4GQwEf5lj2Zmo0DDDO8MX6axSPT2/+ETL1j?=
 =?us-ascii?Q?0vaLa8MrN/dS/7Upk0tD2SBxvr0mwJorhvpKUnrlk4cMMsCjVrBIj9PV8gXR?=
 =?us-ascii?Q?V7km2UTOnGuouY7zKvD96Pio6vRDs7+lT0eQVdsc7D4BvErrgCYGzAZTVmNW?=
 =?us-ascii?Q?ugieKRXFocrAQXNBVAhHUfm3vPaKHtAQhRmLuev9oK3Sj/eLQ1rsUeWyY78q?=
 =?us-ascii?Q?SLPcenEZ0j4GDIf4qNp+ZBY=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dab91308-a2fa-46bf-116b-08de20ba5619
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Nov 2025 00:36:21.4638
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6moNpbcA++ctCrl/tyTGsbW3TV8rCy/Dc8oFBgXWg+2dJwoy1LrC0eX8vbqC5hsbrpb5HjQskDgZG876tXH5V4m1vg15iYp4388foVFpzRxcVMXYOUww3Pe864pJDTAu
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
 sound/soc/soc-pcm.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/soc-pcm.c b/sound/soc/soc-pcm.c
index c82b10578ba60..6b134962c71c7 100644
--- a/sound/soc/soc-pcm.c
+++ b/sound/soc/soc-pcm.c
@@ -1463,7 +1463,7 @@ EXPORT_SYMBOL_GPL(widget_in_list);
 
 bool dpcm_end_walk_at_be(struct snd_soc_dapm_widget *widget, enum snd_soc_dapm_direction dir)
 {
-	struct snd_soc_card *card = widget->dapm->card;
+	struct snd_soc_card *card = snd_soc_dapm_to_card(widget->dapm);
 	struct snd_soc_pcm_runtime *rtd;
 	int stream;
 
-- 
2.43.0

