Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11011005.outbound.protection.outlook.com [40.107.74.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D42319F135
	for <linux-sound@vger.kernel.org>; Tue, 11 Nov 2025 00:23:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.74.5
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762820608; cv=fail; b=RlRtbrZp74qBaTQr/fjj4RHIiorffnJBrbL5r+UW5vJCRrvu1ZY0ynbgal6FBIceTPtUM1WfIn4SrNGH8AY2Y8iEnBaCvYEe9dwBTAT3ZNf1knWxOzVq6B5n8erGKj0nM4S8eIn9zpDwwPDhH1cUx/S18iWokaih1zzGuBurqW4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762820608; c=relaxed/simple;
	bh=2XFOPZ1kuhJt/7NmJIOZ+gI9blryRSEx8TceCMxByyE=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=tLBb6+Ez3W+Z0VU4l1o8/mCH4Ao5JZo/n/UpXaqMLMqO4+Flmy/jat4tGHajse3gnX9WexdRNY0Pv+znnJ0kD1BuBJ5omdSDwvZIl1cBoaj/rDO3AzNj7bafrGTi2b5xwgBXhbV660aoOm/AQY3Fz8R0R8zsyHKM7bAzgv0u+cw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=f8OkI+Ew; arc=fail smtp.client-ip=40.107.74.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="f8OkI+Ew"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ULRQYFhEnI4RXLbPgcJjqZCQ6HnCNPtmrxXwVbS4GtnL9BQnkjKBPBshQQBObvo/tN9/sGLzhZM5WjxZmhhCnWvVxePHR1TZyYshCmE+Uaoj4VAw2b9F/zncoQEUXsePmf2iDejzSbOFbwBrJMpY8RCloReOMuOguet4HI1cFd+otboDEBegqYFexibdV/GwyBlhvqvUPZfjgGpEgC/8cP2iMp8Uno4g+6ZkN4RMmenCZPXqkjt8+xHGhPPn/aKbdRFkCqTOL1Q7cV08ilZRzX5CwC7tzJKgIwDEIwfxo8zbWxaYhPgP3NxidPMaI1vwnSF63ZjwIksf4ATRWhnueA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7fe1pFsAjURrrG2tdKF9R5s/VKR1UAVs4SQVFb3SxMw=;
 b=MuuOGsd54ZHi1Qmu+hQvnqmWVl7SWioL4ZA+4+wi9XGwMXSCbXYeS5gqgyd8CH4ir6R/1tUBHVhGLGCYWLWsMMk84CJahbUmxtwy2ezZ18I4RN5JCHbZEYcReb+O1XkalPyiiUvDsXhBUTG+LukuJTYMhAn4DNxPUMmR1Ejfqcm5g0L3r+KdIJSrxCQ3MkfPiSB6i11p0umqaK1vuSxzoToEpBP8oiQqrSZmWLtneBmn6vU19kmxOXpb5KKz1Hm1+Si38Gmnn0l/VZkCE+tubOHndiImf+irO/7uitZbOjXW7r8bljdVA+E6ALXpTHBZ7IS8n2HKWlLpjEOyYIp86g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7fe1pFsAjURrrG2tdKF9R5s/VKR1UAVs4SQVFb3SxMw=;
 b=f8OkI+EwXKD3gKEz/kZpU8DObF7M9mkLeRMphI0eJGUAJiUbKk/i43yJ5QXrA6Xf9eSVyzIse84aR+qLGP1RCiFVgz7NT7CzWtUGmM4x6RYmKNCRUYhrdwBseJ+das0iVqO+7sDRk5YEQEOaAMSB87Pdi+Rqvn1hRRMH0AAfgNc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by OS9PR01MB16404.jpnprd01.prod.outlook.com
 (2603:1096:604:2be::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.15; Tue, 11 Nov
 2025 00:23:22 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%3]) with mapi id 15.20.9320.013; Tue, 11 Nov 2025
 00:23:22 +0000
Message-ID: <87346l5sed.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 081/292] ASoC: codecs: max98095: convert to snd_soc_dapm_xxx()
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <87cy5pa0ea.wl-kuninori.morimoto.gx@renesas.com>
References: <87cy5pa0ea.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 11 Nov 2025 00:23:22 +0000
X-ClientProxiedBy: TY4P301CA0081.JPNP301.PROD.OUTLOOK.COM
 (2603:1096:405:36f::15) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|OS9PR01MB16404:EE_
X-MS-Office365-Filtering-Correlation-Id: 7b597fdd-1e38-42fc-be75-08de20b885c7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|376014|52116014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?V/0sVreNQxy+szHki0vKYBmuYZ2sfB/uWw0auG7LaFYKal63Icerb3jSHnTc?=
 =?us-ascii?Q?zQWPdF0g+bK+EPMqx57mMCfok7ZG5gmCB+KS97y84nqL7xjAGoVU2oExi4z6?=
 =?us-ascii?Q?BQLOih2u0HpL8vln8xGkGo2Ed4Yr46UU3psAGYfE720muNfGN/V9zUUNSZ4z?=
 =?us-ascii?Q?MsIMqItr/qsiQ4ymh5SEi9HV8dOb8ovqg+8U6FmXH2rxOcYlkvMTk5V3xLyX?=
 =?us-ascii?Q?DMBpDOFK18oqScIwOu0T02Jt6EPdlaT9OwUhWnMNV7M7a41ZSl/qNJcFVeOD?=
 =?us-ascii?Q?MBi4EOc1CBoyJp+kxLhlgcM7gaVsqHMXc+WMfygDLyg5HErqjW1K0K1bYB0R?=
 =?us-ascii?Q?6HJtzcpZ5f7zlww83rZX715oXzIm2OB3gJXABW6SErExy2RiHoamJXa7dEU6?=
 =?us-ascii?Q?ZoVrM+3ED/JKRto66A4QDk/jIyg9vl0H7/F66AP6g1rp/GLazSJBIv/Sc981?=
 =?us-ascii?Q?Jfb9HbyCw6sEmXIoEn7I5FAaRy6AOlZ/j7gAdqA1ZgHN1cszAhhhPxmdin7X?=
 =?us-ascii?Q?sh1oFH6/pFudfmqHTLRqIhL7RPWP5KG8s18IcFgye6C+4LNRtqzzshJPV54D?=
 =?us-ascii?Q?dzFtx9iw7/lE7vIF+6zJU0LjBnA/fN4EwYi5eHID52SglJGPsTccTYfiBgGm?=
 =?us-ascii?Q?TLRYcHq77FvQn1gHvADG0VxZ7WIig7Mb+g86poq0c31ajZnicY6vbVYUErp8?=
 =?us-ascii?Q?r3d7m+qyIa7ZVpZAaIMU0ETDcAJ473IIMVmuMbWMpnzzci0nv8B97Or1wurf?=
 =?us-ascii?Q?i/efr1/JCktWC7w1rVf1mSnU2bQoYdtqpsAAR/EEbTEVMSVbw5FptP+qrv0l?=
 =?us-ascii?Q?QZjgZXtF4WOcWjf1Kh2Ys1cnBK9QkpEaG7c6WK0xkrqHJuzObc2GuKONsJ21?=
 =?us-ascii?Q?uYsVHVCP3bqwMcjtPeU+uNuNBWMkXLD3hjwFPJyF5mjWW+U/Mwpj51NVShVs?=
 =?us-ascii?Q?czVIGwPzWHMzSvYFeDddpR3iySxeOMJlT/jgMC/RASs9tDSzRCShyVJcWOcv?=
 =?us-ascii?Q?oc3+7mAaXITO8XJPFXcRwTUN34XmwBkahfWkQdeDNoMZTRC2Tpio6opoUa18?=
 =?us-ascii?Q?xWILYPfT5cgwa6GSvb0VgFFuP6yZc0ReVk45yBzf7LSlwjRWqVBQVfJo+9B+?=
 =?us-ascii?Q?TLeNIemEzXUmwbDEEipjEAMgb4/3TwAK58PtEQNGk33+UuEcxCskPHpyE7jF?=
 =?us-ascii?Q?cOei9VugkiiXkRWZe/X2/723DzBGIfD1bwUECrNKYp2Q416hMT8mreUf4pUP?=
 =?us-ascii?Q?53us91r2oX+zKAee6+0LkvHQErVyeRBV4n5rub3mkdAWYcgTIkECa4O+p7/A?=
 =?us-ascii?Q?gX8JdvDRrMmO/D4wEtCXf/LGtN5uFJvq3ESlGCcFGpsbTsh6Xr/YIuPAM8u8?=
 =?us-ascii?Q?tR8Moe7wOOwolYydemmqNIGpUed1pRjFxS/lNubNo/3o1g8CDyFFIkc/Crl3?=
 =?us-ascii?Q?8A6a60DR+tEj2QMNvA+VYUrWFySYGLBqGtQ10JD65PvRkj+NOqPDhqluWfoI?=
 =?us-ascii?Q?+fvWM6KPK02nO9hLSfYKMe/KYeY3zaCsp0a0?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?fstPJ6C2qE5uxu7ou7BczbRJBZsxOKJVSC7dodru735jcs6F25kk2sevUpU9?=
 =?us-ascii?Q?XWL/jy9PaNCPPChETEES4a2KRFO5TWMjPbQ6rx5Ah2sI8nXjSw/TiYX5S2tB?=
 =?us-ascii?Q?ksNGCQEwbskI+cI27pP6lP7hbHfvwQKxHbj9/7TrUGRFVMg89TaipcRdVe8s?=
 =?us-ascii?Q?ut4tPUgw1j2JdhW/WEfsOY3yOOtnNnAh//nC8SM34jg6vSspnRwFtvT+4vIi?=
 =?us-ascii?Q?58uL92Efxr5KU1dsALdKsd7IU9Qmn/8T/+kdGP2Ic/3/oP1474RpjOY/32+K?=
 =?us-ascii?Q?V5ZNmLMRZ1+Epk3g8gftBFXwLg0EABq6EwHvZnzAsH8Jpc+2WVTPbQys/kvA?=
 =?us-ascii?Q?XZV0CiHD43UKAkWc6Ei1AFJmY/d7CKt6Nei51pxvYerb7tDxjMLfy8xh/wUj?=
 =?us-ascii?Q?XLSgV8onCgqGlz9CKjv0Khz0YwX7bVh94JQTaggGgV78CfV7nIYJkKpy3C26?=
 =?us-ascii?Q?W6IWK2S9gZoY1JXr55zjCYxzgvGDwaakbWUDfgwOf8wf2g9FaiVxyfqg4qwX?=
 =?us-ascii?Q?WT7lZrED/hOVJm4EyJ956F/DCBffZl7t6ZYAOdhHxZKwp4KBgacqxIbeKHpT?=
 =?us-ascii?Q?2bhjI1VK/Fn5dHrzVDFgvEm7fLH3zEly+S23j8ETbvNAYqcY55kI5sga0fVd?=
 =?us-ascii?Q?xMvdLdl6V3Ql2fWZhnIu47a0rHSZsHHIiSuhEqs5IvJ2uJ9bg/k4+7k5PmKg?=
 =?us-ascii?Q?Jjz/R4ft4zC+OjGHBL0iAqPazfPJUFrOefRgSmxwRE4jGD6AaO4TFzKw1xVe?=
 =?us-ascii?Q?O5IzlXAM2lEpnYfykuH7z6oKEMT7dccWfL3PyoOq0nsi39hydTH7EohjDaNf?=
 =?us-ascii?Q?uJMbdqvizblAYUqUehVTdGHBxaT7BvDYUABGbh90qIetpGRhqUdelZF4bU9a?=
 =?us-ascii?Q?6+/z4Tp0BTaq0x68XYaL7biF9aA5S4ge4Q8ke/68RB9ZPGWBKGZh41u6iZZV?=
 =?us-ascii?Q?QTfdgT9wv03KxlhV2JWm1PLWvrTxRIJRKoSi8mgNJiIWXT9uchd7yMmn8uK2?=
 =?us-ascii?Q?TJN6G6lDPd76SIGm9atFr5EWrLSXj+4xTO4qMJHwA5GDap6zHS/GDrnfhDM0?=
 =?us-ascii?Q?vtBWBidIsiNxg8weaqLeVBQvEQSJ4S7UFO00RIQ6JlV5eN6GIDCqB+ymR91o?=
 =?us-ascii?Q?+h0i5DKqhOTP+5I8N+DsrxyoJHZucAIitJsFuCr3LA/dAdNBJofAYaOsyT32?=
 =?us-ascii?Q?RUeBslY/1uuPtH3iYG03iikMwfnfxU+bVpAZal9YXdK13Gg3Civ7YrJk4CsP?=
 =?us-ascii?Q?1XneHP7kaGlUCsQaD3hKRLrzuhHu+szdlL07pJys0aiuhnfG8DIRtcba8GsX?=
 =?us-ascii?Q?Fnf+zXvrqZDbyD5QeXrwrohtBxRsjlkMILz/6T1p/TDJsegYBfezUD44/TLe?=
 =?us-ascii?Q?Fn3WkPnY/hrRan79SDoK3qI9FDu/A8zlcmo7s+F1BLfjWexslOSywtMzb45A?=
 =?us-ascii?Q?4p1oIbZgAoJz+LmEgKxmc0No4VReuIFX36JqbgLK655SX9v73D11pI273hFq?=
 =?us-ascii?Q?EAh0KpesSmUmB5+4EP72oFlCzY9EnL69r1hNwOgL34QOxDmXH/xlxxVhh4+0?=
 =?us-ascii?Q?fl/CnG4NWA+Lovu35LvZrXu1/L7UmJ4rg29J2oH2zxKYPLNzYotvVqLxFAes?=
 =?us-ascii?Q?l4IReOQ2RxOIWpH5Nb0SHus=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7b597fdd-1e38-42fc-be75-08de20b885c7
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Nov 2025 00:23:22.4934
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LLGKYp44UECIMfCkr6rbbeUbakJxTYCeUTAG4+Z5hPFMuHeKzKerGPyY/yLcHnW9mvlf2483wJAzbfUahtgBg/9VczMvIUaMNGZo8iylIypQFOu0Uu8js5xUguM2Q0q+
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
 sound/soc/codecs/max98095.c | 11 +++++++----
 1 file changed, 7 insertions(+), 4 deletions(-)

diff --git a/sound/soc/codecs/max98095.c b/sound/soc/codecs/max98095.c
index ab5a08a9b9c77..aae6423156e16 100644
--- a/sound/soc/codecs/max98095.c
+++ b/sound/soc/codecs/max98095.c
@@ -1359,6 +1359,7 @@ static int max98095_set_bias_level(struct snd_soc_component *component,
 				   enum snd_soc_bias_level level)
 {
 	struct max98095_priv *max98095 = snd_soc_component_get_drvdata(component);
+	struct snd_soc_dapm_context *dapm = snd_soc_component_to_dapm(component);
 	int ret;
 
 	switch (level) {
@@ -1376,7 +1377,7 @@ static int max98095_set_bias_level(struct snd_soc_component *component,
 		if (IS_ERR(max98095->mclk))
 			break;
 
-		if (snd_soc_component_get_bias_level(component) == SND_SOC_BIAS_ON) {
+		if (snd_soc_dapm_get_bias_level(dapm) == SND_SOC_BIAS_ON) {
 			clk_disable_unprepare(max98095->mclk);
 		} else {
 			ret = clk_prepare_enable(max98095->mclk);
@@ -1386,7 +1387,7 @@ static int max98095_set_bias_level(struct snd_soc_component *component,
 		break;
 
 	case SND_SOC_BIAS_STANDBY:
-		if (snd_soc_component_get_bias_level(component) == SND_SOC_BIAS_OFF) {
+		if (snd_soc_dapm_get_bias_level(dapm) == SND_SOC_BIAS_OFF) {
 			ret = regcache_sync(max98095->regmap);
 
 			if (ret != 0) {
@@ -1917,11 +1918,12 @@ EXPORT_SYMBOL_GPL(max98095_jack_detect);
 static int max98095_suspend(struct snd_soc_component *component)
 {
 	struct max98095_priv *max98095 = snd_soc_component_get_drvdata(component);
+	struct snd_soc_dapm_context *dapm = snd_soc_component_to_dapm(component);
 
 	if (max98095->headphone_jack || max98095->mic_jack)
 		max98095_jack_detect_disable(component);
 
-	snd_soc_component_force_bias_level(component, SND_SOC_BIAS_OFF);
+	snd_soc_dapm_force_bias_level(dapm, SND_SOC_BIAS_OFF);
 
 	return 0;
 }
@@ -1930,8 +1932,9 @@ static int max98095_resume(struct snd_soc_component *component)
 {
 	struct max98095_priv *max98095 = snd_soc_component_get_drvdata(component);
 	struct i2c_client *client = to_i2c_client(component->dev);
+	struct snd_soc_dapm_context *dapm = snd_soc_component_to_dapm(component);
 
-	snd_soc_component_force_bias_level(component, SND_SOC_BIAS_STANDBY);
+	snd_soc_dapm_force_bias_level(dapm, SND_SOC_BIAS_STANDBY);
 
 	if (max98095->headphone_jack || max98095->mic_jack) {
 		max98095_jack_detect_enable(component);
-- 
2.43.0

