Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazon11011021.outbound.protection.outlook.com [52.101.125.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EEC2E19D074
	for <linux-sound@vger.kernel.org>; Tue, 11 Nov 2025 00:24:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.125.21
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762820662; cv=fail; b=N/Sz+H6XiHte/54CAKECdYMkmghuZcIp8WayJx5JDxF0wOKCBazv6/RnhxfFv4PWqd4bA70bAoxZNr8hZrvKF76kzuWwUV3I68KgtZIzqDxIRVZqCbdP7hBT7OHU64cIgdOcLEEIgF5YRG26bl6QAxXyFV++LRoBwM1ML6LbGc0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762820662; c=relaxed/simple;
	bh=ZJFjN/zdkn29eYiJ9fyBSJ85zAvdpQl7GsCnWnLL7G0=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=XQI7wSgMkzbX6MTzcSVW554X6aDls0XNTJind89y3oq1Nq7BeMMiMtihsT5ffE0mCgh9pMNK4Ptnudx5IWPIodvPw35OkHOsN/D4eBMCQLHDoCaDhZQQoYt850segyMdlEn656VMTpGuKFvuyfdUOQw62pbmDQRqYYQYKvC3juQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=CQRQTyBI; arc=fail smtp.client-ip=52.101.125.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="CQRQTyBI"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Y944789/53/F3J81LH5D/1mH/jgiW0/P57B/V/7pJAVDdSuNqLtrsTwBAhuTeA5ruGcUhEcE0gZy+ANrUCOf6dQHMSi7xi0rzd3Wc6Tpw0sC2kdSPurCBQNCgBUAUi8uoO/qkrW3QfFfOliK6Tqf67GAXP9/G1NhYkTdxaEW+GTPkzwqqXPvsX9IqIM97bEEvxKgcLQThRx5E76f+/nVtpwUtCUiKFYL+GdsNLocHGCWDZHr/DGpZtpXkXbrOm9Yfub1KMbvZkKDMx3BmGjny53qUufCfAHeGBP1VnXnUk+H6FSnJa6vqLpo7Gsj/VIqgJl2YfjA3yMG3ApX5K2jRw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BNJ7D453cTiMZlR4h8OC6ik9HnvrcEgu8PlPo2pakW0=;
 b=lYA+J2SGFKgri5HU2nVlUZHS54TuTdvdGVsvZkZGSinvAazUBtknNiR4y93QO1ian66MCXPS2g474xJ68ROaZNRxX5UD04X6pn6YJhEDQk9ev+G22yx55rGmPpiUcMCFvaB5xo/C07Ex1H+ZzGWLODWLxAGIcLwyRHDMqrqPqTc6Mq8AgXrbrTlno4kJgRktN2j+m54K7EiUxibDHkNkxByOd5++Tvux2c0QnwaviKNQACH9bHdF1xBQpLKHu8jBV0hfTImfvTfu+DttmEvaZ/sQaJBB7l9dsv3bI8ouHjJLGsWkotTflY3myET5Ngi01ykZKyacaJFK9Rc8+QZQEA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BNJ7D453cTiMZlR4h8OC6ik9HnvrcEgu8PlPo2pakW0=;
 b=CQRQTyBIPr+IJaBcGy+mCH8JlrF0vyP+pKzFyppEFp5+j3HXb3CDAsI0PTKfKTpjpWQtbwMMXDMYfZ/d2qN/KeY1gnOrkKq8LIToWqCdccAOuBo+tfT3Glwq25KR3X5rNOsbI1m/2nqK0jSgCvVAD8jJj43hMZAhSvYbTqQeliM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TYYPR01MB16440.jpnprd01.prod.outlook.com
 (2603:1096:405:147::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.11; Tue, 11 Nov
 2025 00:24:18 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%3]) with mapi id 15.20.9320.013; Tue, 11 Nov 2025
 00:24:18 +0000
Message-ID: <87h5v14dsd.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 096/292] ASoC: codecs: pcm186x: convert to snd_soc_dapm_xxx()
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <87cy5pa0ea.wl-kuninori.morimoto.gx@renesas.com>
References: <87cy5pa0ea.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 11 Nov 2025 00:24:18 +0000
X-ClientProxiedBy: TYCP286CA0048.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:2b5::11) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TYYPR01MB16440:EE_
X-MS-Office365-Filtering-Correlation-Id: aa567064-a941-4dda-7930-08de20b8a747
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|52116014|376014|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?R2X7M/FxnNG+mx8RGiDcNfphkqOXHO5wKRcn/5XeS3Y5RTL9H4C8f/F1CeeF?=
 =?us-ascii?Q?a75vAMCdKH9lHFGy20awORFIHhVled0ObbNdjh7kCDot+oNqdnJRokJ1O5XX?=
 =?us-ascii?Q?JBVKKho/9p0k98INaENVNj5ntUsoX1wBymJAGYshixcmqGuluepf/GJiAnFH?=
 =?us-ascii?Q?4ZMf5XyRaESqySJJD1OX3CoM6D3BW5y7pEmWi+ewhnE9LUi2jVEiheGd/XTw?=
 =?us-ascii?Q?3sM6NqCKVLxO2jJ0dl0lZxmxZrNphT/8ggK5I1NIpQ3Rvv5ePt2+XIg6VybO?=
 =?us-ascii?Q?/1teZsnhW93d8GrallNFMHJcxwZ9aJybq9tbiJVUF+qV/R3BA/c3vIFV5m29?=
 =?us-ascii?Q?yTdP23DiTpq5ESMhqKdISnQQASoRXCXVZRHl0cv9n2x+y2mHlnlBhjtYcVZU?=
 =?us-ascii?Q?i+12kSV2RbWpNe843GkTMzjsCYLFBf7TQbUZMfJi6yAhnFXhY6mDkBVipuVu?=
 =?us-ascii?Q?b8Gx0FK5GSJhIH+MjblYDeU9WERJ2xLvuOP6jMcesvWJYVIAbrzyhRZGaGEE?=
 =?us-ascii?Q?V4dRA1oeC0JBCdqCkIrTXfDQ+bnF5KCYbnWWd3V2ILqc6AOTWKUVfE35BiMd?=
 =?us-ascii?Q?wSdHEBa5xGE6nRYzHYyfqS5TNA/hj6AjKQWmwQRk6Ey7x+4tkscVYfqsdd9t?=
 =?us-ascii?Q?LDa4QWV/Se3SaMvCIUXjZHtjyKKhzrb2D4/LCVa/QMRWqVTVNFInRNonZN9M?=
 =?us-ascii?Q?UgoKK89qZkOI1w7+dYmkz64VaHoJ50N0rFEFgmhAaPHSiSDk9srdImeJGcsA?=
 =?us-ascii?Q?W8+86jzaAEsnH/hrqi5O8LTf96UkSrB/gEYfIhPJJ/a2RWjz/dD5bWdRuc5x?=
 =?us-ascii?Q?BN1C4uD5qWcfUzMABInSbeWNOCDUQAmJpce1NU6YFRzplq4wIBC7Z3SnMVXQ?=
 =?us-ascii?Q?SfoFCuz/valfCzJVrbxX73Bk8tqVMPPB/uNczkr2wRD/l8viPgEg9MdbndiB?=
 =?us-ascii?Q?9lO5MKH2GR4ICmA4UfTJMxzStch1TansMBeY1gWSt8sBe5gPZp9IE1OrUHWD?=
 =?us-ascii?Q?44312XLTo6qlcUGasWhe3vU6h7ZI/R8wMF5FRM/alRozFJzpq3PLZm0i3saH?=
 =?us-ascii?Q?ISXG/ZTCUAcCUh97zOk3IkqqaQtzOLrXwySaJSbNtaGahVr2WbzVXYoTYMtj?=
 =?us-ascii?Q?TBPypT2yDpNhM90XdQkgY+0nZXKi6SApAH8051Vd+VjUXdDbH+EfMFvFKPS/?=
 =?us-ascii?Q?9JMSrgSneJkdSdkMBptKxfS9IsIH6KhQOEtKwiW75j4FWcUZFs2hvOk0/qkb?=
 =?us-ascii?Q?x+k86AWjeSo7po6EefU0wKcT5nQRAbJWMVBZXPO/DyyWge53xe53dx3kWrVG?=
 =?us-ascii?Q?0FWEtCuPWA423elJgSS/JDLoljtyp3I5VuXBWxBS9g5/8aD+tHXxU6YZfJeQ?=
 =?us-ascii?Q?D+nLRLG6WtzWb19+YjMaRnDl+mXOQbvzFkNqm+DiOmH/5oc6mAkLUPS4xmhJ?=
 =?us-ascii?Q?2rUIH7uDvItqNZsO3kX2TZntHtqEL/xyc47K0S3nzz8OgsD3R03TbLbqfND4?=
 =?us-ascii?Q?wMv9kU1ycFLCgPv0UHKqKKuFAx88wYZT50V2?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(52116014)(376014)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?K0xVPa3pr4FO4kqmWQFL8Rei31SJCmcTEuOqQCvWNoJKGnhUfVC5aTdRlCMv?=
 =?us-ascii?Q?0RdOaeaxHd3DYmy0dVZf7h94QMy9Jn/lq6ntDJIB1bEmLUImVsQd9XLhR2+g?=
 =?us-ascii?Q?lIERJ0SRh+L9usxIQ9lE3grUUvvn4m01UTjFb0VHCkRW7UsXDqcfT09Ygqrv?=
 =?us-ascii?Q?rhXBbZwcesqud2nsu87jIRhqPsne6HMMx2UbscVo8s/NeT4XYo0cdtxW5Fd1?=
 =?us-ascii?Q?0As7WlOpL9jAPSIaT998FUxxw7kVb43vWNbPNfTxWR2yWCXuqbIG2zTdqJIL?=
 =?us-ascii?Q?cae1L0OUqMFDgP/kCb5xl/WtB6BiWO0nqwGIVshkCtRJNMLD5PPnW7dR7P0E?=
 =?us-ascii?Q?twatLme2N7LvHO8Ty/97t6rxIKbuXK2llmB9GgZLWdQdAZfOSKCoMGdx0eba?=
 =?us-ascii?Q?Rv3+bh+wACAPk9daQ3ly1lPov1jF4fVAYjuH1a5i8YBQ+9b6JLG1PyCn4soB?=
 =?us-ascii?Q?osh5P7lx6ItPf+Dr8XEqDVfa/eS8lkOpSRTkip7P8qqZIQL/qmAfbrQQcee2?=
 =?us-ascii?Q?WpI81e4yamxLeILXummA9ijMV1ptIZCOqW1JY1+HHukysg37EcYDqmHEdUfR?=
 =?us-ascii?Q?Qy465qcd0FmB1Nxj846gPf42Jb+cPdvi7SaobdoXbRZE9zyY9G88pjXSRjCt?=
 =?us-ascii?Q?K1UZlyblSyimCRcpq5qCzFVdEUkzoPJuZc8dPBZ5NRiZ1ZLKGlqjI0ILGS8M?=
 =?us-ascii?Q?WzOAlMb1bN5kBdzZw2KTlsARcEvU8UFnDXmp3a/rQngCx92FFi4iUUbAsMHj?=
 =?us-ascii?Q?qC/BTUATx7oDAGjK3VKokREVBsfzmiWyzrwrcwqn1hpbSWJe5ee7z7LeEonH?=
 =?us-ascii?Q?Rfm3qvcj6e8qFqvj6j8q9AaQK38zRBEeJ2TvaCQDUHCSD/VV4NieL2W5PrrV?=
 =?us-ascii?Q?IN5lrVIHhKW7SXx4s7AHKkd0Rfgyvvjj4GFs97gVo9LzUIMD1uwAFPM8WKrj?=
 =?us-ascii?Q?vj1eZsv38AfbFa/NY35ZTS8T9HqH5AawjAKbRoQyR6rRIdmZn7tNSswZOfCk?=
 =?us-ascii?Q?V5tKN6DA65M/a0Yrq7ngusb4Pvr0qMpjHXi27sFCPPscwkpFXfpSmFERGdpy?=
 =?us-ascii?Q?G95zjrM0i4uj6eKjT9X6/4IahZbOiXGSrDK5kkYaKwzHzQsb4evEqcuS8v7C?=
 =?us-ascii?Q?yJEuv6BBI07bFGJFXO/mBUxJtwmhEfO22gR8Uv4aILzShu6kHfGUCw7pxegE?=
 =?us-ascii?Q?pm/lclq98CSh27RjTP758QMZWvVzhzVtHYzRLlnHu4wbQF0Hfl67q7w4IZOU?=
 =?us-ascii?Q?o6Fq4t4po25tus8TA/cv16n6v3RHTg1wnR58gxUcbAF49GXCgsINNmjBHRJz?=
 =?us-ascii?Q?1HDp2kzVQrKQ3wKW2zhj5t9Qfggo/Xtqa9VRcIGl4kw3YctDRNe4K+Mk8DxO?=
 =?us-ascii?Q?CcjqSC++Ecn/d9/E++NAKuLekaDUKgr/CfsduEIBsgeI8yuXlk8tZL4DHC72?=
 =?us-ascii?Q?apVpH+VWEYF/Cnl+VpBHDIu++xq/N1qwu4lILtp6NkEBUyN8ARkbNMZzP+RR?=
 =?us-ascii?Q?F55nNj/aWSon8j5xvBVWXOi6HNKLZ7O/3FH5Hfy0oVINc0R31WSGguWj/t/F?=
 =?us-ascii?Q?PaydkNQXgRIR7A9MhwkFc2fKDiryjVadoqhUNpKw7P9XSohgBGe9LK/ZeS1j?=
 =?us-ascii?Q?5Oe0aw+XXJqFIiN9wkAA+Qg=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: aa567064-a941-4dda-7930-08de20b8a747
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Nov 2025 00:24:18.6711
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4x5XvBbm7XsT0wKOdeCXl39RcSLK/toc55J2XaGcNmRWl2fwU8ZFTA/lhaxhj9sQ6F7b7n19ZBVGfqpGjWUxcroTH+0pJRxn4HjE3SGkcm/mqtSInN9GayNkzHpIK97l
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
 sound/soc/codecs/pcm186x.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/sound/soc/codecs/pcm186x.c b/sound/soc/codecs/pcm186x.c
index 13443f569ddb4..0d1103fe4e04d 100644
--- a/sound/soc/codecs/pcm186x.c
+++ b/sound/soc/codecs/pcm186x.c
@@ -546,8 +546,10 @@ static int pcm186x_power_off(struct snd_soc_component *component)
 static int pcm186x_set_bias_level(struct snd_soc_component *component,
 				  enum snd_soc_bias_level level)
 {
+	struct snd_soc_dapm_context *dapm = snd_soc_component_to_dapm(component);
+
 	dev_dbg(component->dev, "## %s: %d -> %d\n", __func__,
-		snd_soc_component_get_bias_level(component), level);
+		snd_soc_dapm_get_bias_level(dapm), level);
 
 	switch (level) {
 	case SND_SOC_BIAS_ON:
@@ -555,7 +557,7 @@ static int pcm186x_set_bias_level(struct snd_soc_component *component,
 	case SND_SOC_BIAS_PREPARE:
 		break;
 	case SND_SOC_BIAS_STANDBY:
-		if (snd_soc_component_get_bias_level(component) == SND_SOC_BIAS_OFF)
+		if (snd_soc_dapm_get_bias_level(dapm) == SND_SOC_BIAS_OFF)
 			pcm186x_power_on(component);
 		break;
 	case SND_SOC_BIAS_OFF:
-- 
2.43.0

