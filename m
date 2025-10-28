Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11010028.outbound.protection.outlook.com [52.101.228.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F149728000B
	for <linux-sound@vger.kernel.org>; Tue, 28 Oct 2025 06:53:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.228.28
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761634401; cv=fail; b=CAhZUBDQBXkzZO92PR1lyvxWLqOrWQnF5BhO8dOIo1WkEFoc7wE7Xs6ukoYy4yEnGmhyMeMHRQbPqaH0VTwu3h0JkscLXVEy7U0Uxb4Ca8a/5YDIDYffgJ2I4GbDZAUArOvC9unXO8FX506XIcfGfhx+ZK4VdQ6kdhpfaAgKAk4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761634401; c=relaxed/simple;
	bh=hbkjssTLUTJeN6I8ysXNAGxPwPFPHoy/bh9X/LKd1UA=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=mV1QBSXwODOGwLmuN5SpSfxt92C5Zwp4erE2NALZ4JZZppNxXvzUZpwRHQ9t8vlezGpiUbgKuNNOdLv91ykcsStuesc6ixkivDiAQlJ3cyhrvJ/2Qu1g9Kutpu0XcsDo/RSOytF3v+qVcTIGYc8kNIVmb05BcuLO+x+xdH1/n2w=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=gJ+dt1b9; arc=fail smtp.client-ip=52.101.228.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="gJ+dt1b9"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bty8on0fPj6H0828Bwo20p48aB5T1TquiwDjE/0S8etE+UborRaUfFab259eLWXB/WgnFNShr1Ufbs8b8XyebwMdyxj32HM4XWUCrQhGwShGOp58Sb8fu9jGA4lPo1NMaQ+y9mbbScwQXFJpnyFOxl392Z/ICcfjsQjymV0WmACSvNyCx0VCLXzqQ+JRncTmaifXGWg2rtSW3RQkyJ9c/xIiyin/PlQdbjuNaWnNlg3CLBhe6tG1IKVe+OrQYD58iXk83sXLunmxzQlZS94c+hWPXrM3oTMBpl4F8/SCZ3ZT2FV83ZwtGQMY+gwoAxFlzQ7EGl20j2dF0s5VRWGa2A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LuQep/xJl8t+IyTRi3Gf4TU/BRxbfImFgzltSaPF0u4=;
 b=LnYAyNqxLON3bllQ5Sy1Qro/fkCFF1mMSmxXh8j6jwbLmobCPYsiXermsm9FrQA51CHZOixU72wig+xtb3zj3nNKFRi+MmLtJG7k0Y2ABRq+iS2bgcwdUVFS/Cf9AZHun3jyxYzqQgnvjYkb6BjvWJ5Vwq1C418bXShIq3o2r/02y5ADoZWHbPAEEM7oHmkpfw1a+onh4+nO3Sfw3Yd+WN5Wgr3zJHy/KAbuCNH02ybeoeaV0wLUfQ7F+D8yiiyNLdi4T0j2IC2Kn9we1f4I/grOGjj2jXkL5SEyAB+Chjved/7PbACtjUmDHzJFHm1QzvVCmGpnyMIW9BbeBvFEmw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LuQep/xJl8t+IyTRi3Gf4TU/BRxbfImFgzltSaPF0u4=;
 b=gJ+dt1b9WVqDmp4sJ67dGfaLRA6CDeRLAUsRZjkah6UxGdeSZRh3B+NPyU9Dk/48dC459QWtV9FqKIJdHS7bKaAzG0qHoqRjfkKP1I09+CBAzbKym7c8nRJiVt+INlPh4lc8+FgRN93ikMCUbn53phMnDa80/FvgXv3Va0piF20=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TY4PR01MB15756.jpnprd01.prod.outlook.com
 (2603:1096:405:273::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9275.12; Tue, 28 Oct
 2025 06:53:18 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%3]) with mapi id 15.20.9275.011; Tue, 28 Oct 2025
 06:53:18 +0000
Message-ID: <87bjlrsejm.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH x/x] ASoC: ux500: mop500_ab8500: convert to snd_soc_dapm_xxx()
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <87h5vjselx.wl-kuninori.morimoto.gx@renesas.com>
References: <87h5vjselx.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 28 Oct 2025 06:53:17 +0000
X-ClientProxiedBy: TYWPR01CA0040.jpnprd01.prod.outlook.com
 (2603:1096:400:17f::9) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TY4PR01MB15756:EE_
X-MS-Office365-Filtering-Correlation-Id: 7d84fbdf-8ab2-4eac-7745-08de15eeacc3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|376014|366016|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?CGGKH21aHYTviYqCalEqzW0sJ9i4cyO2L555bgwy0rH3v0EvFQ59kZ86mBOg?=
 =?us-ascii?Q?tQmx7Uxrc5IQYdk4235egIkgeoXtiJfBl5VkaSHbrVlFgYvR4PGvcjyemhGv?=
 =?us-ascii?Q?77K3NOj4vSswo1v3zy51krFJ/a/rZLoeaRyeciUNaU/es4LHVM/TYOv8Eq72?=
 =?us-ascii?Q?hBdf6QZatK0jEOhJxMSHIQ6SMTmHl+COeSLgFV+SlK9FiL9J19uQQRNQZhWA?=
 =?us-ascii?Q?PB9t0hHB4Smzg5/uD4xCEgscitsnboBPLPhKHD8gi5kZu20DbQhPcJpfoCmv?=
 =?us-ascii?Q?q1b3QV+7rVrw+A/iAl9KCVUNOZQ2Sngbhc2dD7Uw8bF8NbacyG8wDr1+mIzw?=
 =?us-ascii?Q?rGE2HBkdecaR01tbokrNZV+l1tWqabWKqUvKmbXfrUu5dlgeEZRfjhx6NHwe?=
 =?us-ascii?Q?RxmxINJdH4OLNOnsmoQVTaNlKf3SlLaOGZ5F66/b4U6k6BPOmpJLU2jam4ew?=
 =?us-ascii?Q?JQic0ZfEaTtnebwyVmacCZZaM6CMCX0rNR+tpAYc+sZ9ZlG7fjMCjjgqDXur?=
 =?us-ascii?Q?NAiw67J4MgDXa9noJvPrBf1jMoPrNj6YDf8Uo3Z+a4yaF0zwgYvn+wt49AUg?=
 =?us-ascii?Q?1C6Vbhj04k36IRNhYRHQYKMJ4fTHDBz/qgTR/8MOir1H1CaB5TfFHxEODdvQ?=
 =?us-ascii?Q?Ja+3K97pISHsCYHm8xO+rJDlswyC7aM8E5Odv53qI/p8CAYNEiITJbZwyqul?=
 =?us-ascii?Q?eCXcIK1baY/jE61g4j0ODl/lcvjfp14Dapl5UKE3SnJxcKThuRlKDP+wpyhH?=
 =?us-ascii?Q?oJWmLt67Dcuf5YjnhhRxaGGQAAtr0JMY1abHU4S1DSGYE/wFWm41KIMrsmy9?=
 =?us-ascii?Q?0H5u5qxGWZ+81fC466DlEdWpjSr95Vhk2EyPB5YHzesgxm7PvDZDAom1oWRO?=
 =?us-ascii?Q?robBXaJ4Eoaoo/6E3bemsCSbWCeDM2FaGtb5SuAACvfxx8MP/Cx40KLcnKna?=
 =?us-ascii?Q?MAs3bh85W+8noYKsxZ4HASHiN709hUuZUVQi4k8lxLiZk8ri1CI+EIyE4dhA?=
 =?us-ascii?Q?9yKK9LmiyoykHpk157mc8kRzkPg5B4w5gLkcqyQmkc8KLTNR9Ke0NP6RYpug?=
 =?us-ascii?Q?rGp3x8SPKfMwKl5ghz8xkiVSo47MTce7hJs4RW4jOiaBUMFRyTFy1vzaaQP1?=
 =?us-ascii?Q?GIkSYh3nDNWPP3hzzL00YoKvOWYmLp8D6garSLha9FPf+xYgV7mZmJWXrCQx?=
 =?us-ascii?Q?dINovN9gaX7Ug9IiUJEQXbPr5y3hvz63JutDVKRzLotlZss2J8JS+h74wX7s?=
 =?us-ascii?Q?uOtogoC7hFFCdg6kvQmHzgUjujtn8/hie7B6OUgEKKn4Mjuxd1qEnPhA95g2?=
 =?us-ascii?Q?XXqYXfSnm3LjkvkQL/h8jS3jbOgk+KWN4CUN8ZQyVUIK5OcKaRoKetOiBQUw?=
 =?us-ascii?Q?8ZCj0mGalFPmbohQAunjWwZoco4s1dhwjZ1APPah0EdvndrMmClJquxX6ZUh?=
 =?us-ascii?Q?hg/ztYzEtbMC7+Fr3PGlFZJQhS+N1h9BZX5pOukU6rtiBsZlRDMe5n+6yp0c?=
 =?us-ascii?Q?KXL2C45ooMEXzRhfAQ27Bzoq6X4eFSEzQoFv?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(366016)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?7vOQl7E14LPGA9AJ0IAllw7gXnT+xMFhWze4FuRl3nVE3KmlDtCMSuYmqEhz?=
 =?us-ascii?Q?N65wVuem6V3CFGxAuekcbaI4CkxDiBOAd/SQ/+QjTU3/Fv4ycCD0jt6+wbkp?=
 =?us-ascii?Q?oO0wzdHqNt3vWDEWQRW0Y7zJQX4WcGVOvS7d4V+Z1ujzy2plCbqooof9hZZH?=
 =?us-ascii?Q?uK8z4dskHPY/PqJZNMB0m55Ixsu+XG1CiLILJ+DB2P2Rzq7AcMczTKPY3BeE?=
 =?us-ascii?Q?tP5gVp5THYvO8XuzupbLIloG7gqzsg8ewcassOec+4/LJ5E7MiRCYnuR1DYi?=
 =?us-ascii?Q?QRhWV3ZyVdlX97R14wlFTZCaApE3bj3BWF/eVqAd60KEv0ohDVns94yvMlbG?=
 =?us-ascii?Q?2FWMtpT+MwTVK1aqKMah6K5/OjZ6iHIV/nGq40oj/bzWZgU8nc25dXjz7f5u?=
 =?us-ascii?Q?PIpwfa/MbSgDUu1gjC1Dr8uiicjmPvqAFCsGDrLVybGvjaETZXzZ8Xwy0s5x?=
 =?us-ascii?Q?ZITgeFlzxHwZ1yVcus/i8S/9AsOGrJKXX9OhHaZ2Dg50qBFkcm20qrmwIvOo?=
 =?us-ascii?Q?d/dwMHN+gkVWM/wEFsjOm1uT/vD80gadg+GimJSGiE2npNbYUwX4kmUAV99x?=
 =?us-ascii?Q?Vhu0Dq8Xqit6GNL5lF9zICQT8OTTngYReqYGmKPWUOn1P5kxpdAfnUXRircL?=
 =?us-ascii?Q?Qn1fV9+mdx7ZQodCY5qFm8t3bRE3Q+zHKbQouYVEyrvIQ25h4APoKZAgEnHa?=
 =?us-ascii?Q?61UsyPaXbcQCojridRmCDXz8cMHa8PRfZqew4zWdIvFZG7dW5Wpxfbyyy9Ny?=
 =?us-ascii?Q?CV5/tku3hNZqR7J78IHLkstNivdjXghmFMIZ/loC4aplZ/KL42C5/tT5BdPe?=
 =?us-ascii?Q?VikOrfXNRGNrOHP+wlD3Bv96xPY7mGJleYYh9LbsUgsfldEZEXbhv+uAPOTI?=
 =?us-ascii?Q?+Vy7q/5yngfzmRyEJlDhPRgqr7PgSoaj2fA33fcKcXHmQDX4EicwQpE0Vbyi?=
 =?us-ascii?Q?SPTsyhB5JwdgcL9+Z+49tWj5yR+bpzTfsSweCI1S+vvT3ghYaUUaWYBgm2hs?=
 =?us-ascii?Q?m/mOtvTkXfM8meRHbi7AHu7p6s2Rnuu5/gwJUbwJ5ddg2oZUX6uHyuD8O+N8?=
 =?us-ascii?Q?3QX0I2BVJRUjIHw2q/0zKc1L8xeQb6P6Lr2EsTYnXJKAudJeaZq2gl4/WKZ8?=
 =?us-ascii?Q?lQeZEfIkxgb+Ltqa5nPD09Oa0/agm54n7fyiyHbZaUAsxP5dyBAOFNpprjmt?=
 =?us-ascii?Q?WPiOkQ2dFjjWQxGvXvvzlQFUC72asB12U1jR/t+c1XHRgfgaInQXlWQRNlGO?=
 =?us-ascii?Q?WHWmQnO3ltlFlxM3+7azaUreBl7vi6X6YBZwFfMtdWGnK531Rkc2boDisYwc?=
 =?us-ascii?Q?Qp23/GmgSUgxNxpem8aX3IgeG4DQbPkXP/svcgKZ68q3LTteMl/NkA3hDrrv?=
 =?us-ascii?Q?QQn6kdW7r3WXO1xbvxtuP0pUS6G9WgGZRC4R679Dq/Z4EQzlcyL+UDFa8Eyb?=
 =?us-ascii?Q?TRnSNQAQBNHgknlIhasuHFsNSiJr16VVIuCEK4vUc506LMITM3Awl8aqZRiy?=
 =?us-ascii?Q?gvdctuENHfHvvJXtEJsZYM9EZqULOn/9Cc7h1V3nEwVA1XgoKWmSAdkO/Ha7?=
 =?us-ascii?Q?IREjoYt2ZU53cpQlVXZoWAotKQBqXUDRZwMboQTijKLSvT4d4Kkf26IBybNk?=
 =?us-ascii?Q?d73LTLlbNhZRTfIPMIihvyY=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7d84fbdf-8ab2-4eac-7745-08de15eeacc3
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Oct 2025 06:53:17.9714
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6NsQZRRvMPIc1Q3aj0y0Dimt74BfMCjqD0L/qAEkYG+8ga7QOEUZlgk3ZbEArUizfPrPKE5o7/bH0rVYxVNql3N65MdKhP3/HkeKa3LczHuS8UHum/QSfPX6llY7DdHP
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
 sound/soc/ux500/mop500_ab8500.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/ux500/mop500_ab8500.c b/sound/soc/ux500/mop500_ab8500.c
index 5246f73ef12e1..2e6ed19a18cdd 100644
--- a/sound/soc/ux500/mop500_ab8500.c
+++ b/sound/soc/ux500/mop500_ab8500.c
@@ -357,7 +357,7 @@ const struct snd_soc_ops mop500_ab8500_ops[] = {
 
 int mop500_ab8500_machine_init(struct snd_soc_pcm_runtime *rtd)
 {
-	struct snd_soc_dapm_context *dapm = &rtd->card->dapm;
+	struct snd_soc_dapm_context *dapm = snd_soc_card_to_dapm(rtd->card);
 	struct device *dev = rtd->card->dev;
 	struct mop500_ab8500_drvdata *drvdata;
 	int ret;
-- 
2.43.0

