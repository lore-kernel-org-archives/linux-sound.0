Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazon11011069.outbound.protection.outlook.com [52.101.125.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 019AA19047A
	for <linux-sound@vger.kernel.org>; Tue, 11 Nov 2025 00:30:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.125.69
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762821061; cv=fail; b=TaT3OyNZasjPfHEpa67TrFj1Tb9Ea/T2oZWNQV5Rnk5FIDrxwgEbpwqbgP0StQZUnQ1uHYYt94EvOOnkeaVn/xKcvLAfXOTg9GswuJz7gk2ojJWPH0/PV3YGIyVzqSWhWc8/PMFFWdWGykbiYPw2vOsDVxa2WJWywNP0wBWo1kk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762821061; c=relaxed/simple;
	bh=aOlMWgP41Yp2xldrx18RAXMiDmbs4qRQ8PkN1gM3Ptw=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=Bvuj7G9+nrxJqJl8FgChr35xSor5GIZ1TjKrpkv7uYqIhATtr3M5ciYMCFCqam3T2fmrVm3VD7PHa519EZxFGQEo+W++yVoGBFGGzmmWiWBS04x8tfa4zOFHVaQvjsoEcLNxt8GTUHTijIEyP2JDWgiUG+f33E5hB2sMSzQCMyg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=p8pPU8uY; arc=fail smtp.client-ip=52.101.125.69
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="p8pPU8uY"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PuM5Sk8q2lftKAirqRoKjd82Ww3f4cNCtGWI8JrS4KZ1YVeUlMRZibgBSRK1QRNxcO8Qam9QPekCRnoagiNgdtQutAs81pVgPjS9LWCK80TOmBpGwlaSiA6JBqHH/FzEfonETRH0mmIwjLN7IrA2y+CK27wGEBcPlUSbW0qp8MHMJHh+bJWh24RJv0DAa8xUI29i8Uu6y3yp2dC2JvfUVNeWbWmIRCRaFfDXfcC3esLGCZVglowjzCABCFE9yyeQ3Z6O66rgkN/FeH9eyMZN6aKwzYkGTLivc6itFw/9+ULvomGhppQIN/rHUOHalvVNxX9gQjhAYppKX5cgm+g64A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hcM+yk9xpAj24R6JER/np4aTlnTlwA7DvFjS8qLWdQ0=;
 b=qBIVMjdw0oPg1BwhDRydIijYG4zIWCA3TmVuOoYzusbdNT6+/+NadZ0oK6aSmBVi6GM7VJUNS8SYNe9Y1WWuHyuR2MjSrao9HGMD6ojMs7wddC33PsHUlX9lxW/Hmto4nxdEFb0ERj5udf0YV2K7OxeDfy2UmR0i7gjGgvFs07BI1NgRnKdh5mxK8FjPIosm6cmKUQ6BA78zBWn7ouMBe3WgaCW0WTnRO8Dq3N/f66mbI9z5URRMSWHFKKIZOligZMfQKy+XTmSAgw1qYmjkYVWCsZwbEnb17/GCaVhY/X/NYeovWcxlZBEqU781OZbKv5PcN4BefTvJPT54gvTcgQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hcM+yk9xpAj24R6JER/np4aTlnTlwA7DvFjS8qLWdQ0=;
 b=p8pPU8uYjRSA6KRR2pdLTD2QO9p0o6p7KCOXpVznyCv3THDoYg5fUGzHQXqLSZKN987tLA2ukZIxFplb37VJ5LKEdiTEJFAMG/Bb/Q9+bdtpZUTFainO0V7Fpdxo5aUnAXSgP0ItuayQMU1lpfeu6QGuiAfknovlYRvsB+LwRjg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TYYPR01MB16440.jpnprd01.prod.outlook.com
 (2603:1096:405:147::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.11; Tue, 11 Nov
 2025 00:30:57 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%3]) with mapi id 15.20.9320.013; Tue, 11 Nov 2025
 00:30:57 +0000
Message-ID: <87h5v1xven.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 196/292] ASoC: fsl: imx-rpmsg: convert to snd_soc_dapm_xxx()
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <87cy5pa0ea.wl-kuninori.morimoto.gx@renesas.com>
References: <87cy5pa0ea.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 11 Nov 2025 00:30:56 +0000
X-ClientProxiedBy: TYCP286CA0004.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:26c::13) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TYYPR01MB16440:EE_
X-MS-Office365-Filtering-Correlation-Id: 0cff3256-228d-4d35-79d7-08de20b994b0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|52116014|376014|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?mwIzpKf6blJl7qAy475dl+dkV8gfBbx7QQZswEI0eYBHy2NMdExpMIenI8rM?=
 =?us-ascii?Q?jQ15r4xUkIRcElVysF9v9PofLtKp9d7s5K3KSqK0h/KuDu+Pv+A8tDICxSC6?=
 =?us-ascii?Q?vpXzwUogkE7MZJhVIuO0Df9b+dkMH+MtyYSYE8bdSVADJePS8UiE1op3ZM4O?=
 =?us-ascii?Q?2tHEpR8o56XWmGbywHSmZKPMKqDbyvZBrSV5W7gI1n+u8fuTac2YyDyakkUl?=
 =?us-ascii?Q?w7/K4KDIaIngofQPkOOpkV2lVGyXXLV+I2Pj6D5Kdcu43KwmnXHJX2gMaYsI?=
 =?us-ascii?Q?/A6nmWSfTOq34GWzSa50hRBqkF/ORa/pkFZOlcQxInsk5cxafRZnP2EXpjDo?=
 =?us-ascii?Q?OrIRF2E/TkR5FNSEJe+Sz1QMb0i6jzZ8KQyBHydvZuhEFIH+tXuNCKP8h/sU?=
 =?us-ascii?Q?wgidQHuCXfOxvcW3yxP1LaCOV/K9jMyB2ako4QFPXmvTHDKIFwmEFqrxEwRW?=
 =?us-ascii?Q?tM2/oMywPgU4lxz6aINscuOp1JrdOvjxNzET21qSNkvpNAMwfiZl8LDgRWN7?=
 =?us-ascii?Q?fhcTNnYmacdBFM/GM5aXMye/5Okpk4QMoUAYZ9r72no8OzZ5fU9MQ+MY1eqI?=
 =?us-ascii?Q?HeC8JwI5BeYODDKUzyznhWYGEuWr8Edm/ldE/YCL7gaZcjlgXQbIbTOxgd9v?=
 =?us-ascii?Q?z8TG9W5dZEOgJ8/bGzU/sFY1lDjQ6fT9nXhi35q/W54xM1/kDLc6LSH9Dpee?=
 =?us-ascii?Q?tJXf39Qh97xWrjh+njG/3L3yZhPE1mpf4D1/LZBRDZweqhnTyq+hu6F0hPDy?=
 =?us-ascii?Q?JIf8iL3oMcNpgc8Y86cVNkfSDrP9OD3Nz0jiNrSx8fjRUaSxjF0O0u9hAleN?=
 =?us-ascii?Q?hIgzmZFBGh/sszJsU793SDs8/lFAwYEw3evLYPtgWooI0a0bosmHYUB+aTJ8?=
 =?us-ascii?Q?zQl7YxGjAMrDzxkR74iE+TS+KwsAsb7h5WQs9/m3uu4yMVL4k1if+1s1vKyY?=
 =?us-ascii?Q?BATH7zGy+5vGQ6c/bWLv3Dr65ohbPpBcRkUadzqMBHhApHGcXAD0RSjoAQqL?=
 =?us-ascii?Q?gBN6gvlMzfoXJpPuLmc1qgIgEmoUCHGIwe5gH//DrzTQlC36ByEY00vdvkpo?=
 =?us-ascii?Q?v3XiYsWxxD3TcJRYQt3Zpu5oP4uA9QfR/hotRN3exZmoZOkEib/8JsxllgdO?=
 =?us-ascii?Q?SMDli0rlHV0aD73YcV6SX1nZkOGwlMZFYo6DR3rWdV0ppNh+Qb2Byh8J9Tfj?=
 =?us-ascii?Q?FT7Uh/87n/CvW+KAcfaTF4cBqSOhdXEF914CBIlpRJIjNe4zbWeNdsm8twVD?=
 =?us-ascii?Q?9bhHmmkJIsFGEgt/kUl3Sa4EpkHH30JkOEbZH5LWXi/+hJSwy/Aia9oBGsRA?=
 =?us-ascii?Q?oXWS7u+u/DccA2oe/YogbrcfOnSM50CBX0D7dvNgYVq30WqNsWl12ojQH5jQ?=
 =?us-ascii?Q?k4JWH5ml+YoNYeDSW1G66oO8CyDHjrbxjLtcDUoLrX7c0qLLdM0QK2ka9eh8?=
 =?us-ascii?Q?6736/G0X8JFJlhx7WNy4zO+fq+diKRT2JHNxFJa0EogsGLsXUAeTv+xoDpk6?=
 =?us-ascii?Q?Mz39VeyWrmPd30NS5BX8DuQzHYniOFwZ8j7f?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(52116014)(376014)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?UgtUxWZWztX6Fa1oVmrkm/S7a80oYHIh4SCgQlkLPzMHF5PH9ZKgMLVqg4Vv?=
 =?us-ascii?Q?BrZ2BrJgUGwSaG+Wma+cmvx/kcekUD/vSE48wYbgZjJG0nt8COtyRJ5k16Xs?=
 =?us-ascii?Q?INXzlgEmUimpIjX5IjIJrYQ3lNl4Hi/S4Xg9bBxX3VB7B3ya7vMnjz0Z96Dn?=
 =?us-ascii?Q?kKQ/E6XPmajJFFyTAojCHoV4PT7sCvmrugpqLSmdW6IM0e7/N3mufNXpINpy?=
 =?us-ascii?Q?hMR9bKuwKhyMDioyNdu5GTMKGTtOBf6glBmTP/jfkqY82aAwQFyQIqMKq4yV?=
 =?us-ascii?Q?uGWnWbOLzzIMILWCjBV84ZlsCk7+D+kA8s9WeMetdkRsaX99Zu962tiiyVRk?=
 =?us-ascii?Q?hYjmp2paALJa1n27cgQDJZCLjmFmPQAYFKLyG69MAFawQ9OOy/nVEQ57S+/t?=
 =?us-ascii?Q?H0fVII2uxKPePJadF8LE796CjtfpTxLTyDqpjkMI2W/kRkvm0AuUyqvHnhaB?=
 =?us-ascii?Q?1OLUlwtBwmcGEesyKb07av/Jkmp0A0KmKNzbyhODhGB6aVaPNvPA7FzpkXWh?=
 =?us-ascii?Q?SsUcHbddwMCVznFnnLmPB/ng8sEY8YgqqLsXrdjKTUGSYRHg/H3PVIO04uXW?=
 =?us-ascii?Q?Gby2MV2JFOLmNZiZw1iZrfh3Tvmv4ErtdTwP1tJvuh6Q+Qm8sUwhP+nH9+z+?=
 =?us-ascii?Q?4UDfvNOnKzpqzmE4g0Q6asBia7fB4ToOrlUH2sK+zMAQb5o5blRmk1zyJLSK?=
 =?us-ascii?Q?DYG1Tdq03ntH+KDLTqpQIacExkoiQ3gU72YTjDC/P5HajKu8X79vYX4AcNw3?=
 =?us-ascii?Q?OzOgopiZZbEr2+UJ6jj6tF+k4Iy/BlfkrY31/ODi2qTkWrmm2kzN1Ehqpvmr?=
 =?us-ascii?Q?4PmaB3/4iEH8WmHLegdiFfYK1wkXy8lyP0/hXKxNngUpue+JFGpnvZDRXkLm?=
 =?us-ascii?Q?qaHHbttPmZTnYVdEML4P7GuPMvRytxj8FqR6NKcXRO+9zt9zP5IIJ3lv/EnV?=
 =?us-ascii?Q?Ya/e+X5eh5V9ZJBsNkVkpNEQm4oj7yFc8M0cVzYy4ofrdrvWyoDs/2UrD2f6?=
 =?us-ascii?Q?Wc/rX2P/UZtoMqMnSGnDKzMfOEulaWtSC0z8ILPgWS7fM8xWUfJPwBKpMm+8?=
 =?us-ascii?Q?zGl+yvExVS2F+Kp19eSRkg24+OwzHbuC/6r4Sc1rFJQCsIETjJ2J1SCFuGXi?=
 =?us-ascii?Q?k99wvjzXNJ7ElSd1jjWNJH/TyBE+O406GGDCSNKORl46dwZfN2P5AwGDWF/T?=
 =?us-ascii?Q?IgFIIb9HODcFHhlJ5o1NMhYEbdH/2Ze3Q2dYEbjdWyaZjKMz20+IVA3/hlbN?=
 =?us-ascii?Q?fd3TuSS+IwPuGivE1q1eyqlmBxR49ER4OnQh72Em5BCv5sfEkX8EoDKbc5d0?=
 =?us-ascii?Q?SaDsfBqfFBRiyFnZinzSmlsOwUdDCBDhzddtTR495mP2quZRGpcaWr15rNTM?=
 =?us-ascii?Q?xZiE0ZEDoMydhXIQE4Y6+OhnMD6nQi/kwLhqfRCT94wsPItfVZs+ZaiAe059?=
 =?us-ascii?Q?vMJiiMcjvEPkp6ZA3CbJC/bZb9vuOq59P9N99HxgCZC6UmO/ur4MWHKyuaqW?=
 =?us-ascii?Q?l68kDcQWEsg1cWdxYIrhrg82zdsRQrf+6kSUkcGmRpkMbN2mPm44e/uf9SYs?=
 =?us-ascii?Q?B918sLNUcfYMb4xkNkFHqtvU3v6QTAlEIPP7Z1O60zA5aam3K26UfAEQ+EXt?=
 =?us-ascii?Q?LYpWX7e4PQhkbg86f34s1gI=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0cff3256-228d-4d35-79d7-08de20b994b0
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Nov 2025 00:30:57.0110
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 383zGkxwjndj2VI+lkaEap+CcrXzDV6jmVtXPhri6fDq0i64kXbxC5Au1R56UOZu58g33LSVw02Jvuh0w41za+YeBhF154rsCisYAiK6FSmp9LvQgXaCgvNRuK8Qx6qp
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
 sound/soc/fsl/imx-rpmsg.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/fsl/imx-rpmsg.c b/sound/soc/fsl/imx-rpmsg.c
index 7cd3aa4c87060..53f04d1f32806 100644
--- a/sound/soc/fsl/imx-rpmsg.c
+++ b/sound/soc/fsl/imx-rpmsg.c
@@ -72,7 +72,7 @@ static int imx_rpmsg_late_probe(struct snd_soc_card *card)
 					of_property_read_string_index(data->card.dev->of_node,
 								      "ignore-suspend-widgets",
 								      i, &widgets);
-					dapm = snd_soc_component_get_dapm(codec_comp);
+					dapm = snd_soc_component_to_dapm(codec_comp);
 					snd_soc_dapm_ignore_suspend(dapm, widgets);
 				}
 			}
-- 
2.43.0

