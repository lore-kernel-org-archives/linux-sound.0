Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazon11011009.outbound.protection.outlook.com [52.101.125.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBEBF15624B
	for <linux-sound@vger.kernel.org>; Tue, 11 Nov 2025 00:21:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.125.9
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762820520; cv=fail; b=q+kbCEscwJFhljbTEslR2kKSR92CVwd5c+SfkP8WK5cjGg508N4UnXpdfKwFSOKItIJRZo94qmsDS9e/ZXfRjA3Tn1dmWMb0xGsUnikN+Fxa9dPdTFevrV82sI1ZP+v9g+NzHkZw0zNafgX5Hr93oOTN9m9hKpgxmFaMQ6ob4K8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762820520; c=relaxed/simple;
	bh=e8fgDfF6CBYG8/D/jdd2Ol+Hn03UvkGiRtjvcWCJYAE=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=K8NXVmWyZ34tHqSkRcHnXRmyZAfEL4cMM09kUO/hE9ns3EKH0fbNH2PziTCR8jvYjmbl/suDza5Pl0f5MGRdkoez+/LFzc8CX+4CWO3IcrSkgTU6gKa7V+nPFg14o4Dz0x9LhnQP3G0u5X462qXZZAFEyRHB+lswFyj9jyD/o2o=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=JXEuwDaD; arc=fail smtp.client-ip=52.101.125.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="JXEuwDaD"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IIrlUeDX/sYk0UKFrPhCAIBEmI+CYqtSOzEQKucPCcbmCAAZlJOrGCdneyxhwW1Q65hQm0u48ePoGT64BPgQxEtv9AdwXtrQp4b2bbA3aY2SenxBbG1rWjIhaO9HHGVaXw1esrR/GspT5kRzUAVzsQDvjGM3O1anWIGUquWxuAGV69YYmPsla2aaLMAS4TRrnPQCfNmQxNtMCWyral2KQKP9N7gnrv+gv/T6oIrTh0xWy3tn0GsMyqR4jEpgNAA85r/4YNurdQiM1IRf0l6PepxK/36NpENQlNszZzZEVegfvuaARWWdo4rn9ixyR1V/gfDcWf55ogmJB5llbCOBAQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2VCeJjqzlqAWPeDryVx08E8dr80EVfiU33PwSeNBFpk=;
 b=Wn9jAjl5rY4+eRxdxQ3/wykOS1nQ8WSSmyAqJAAIn2COqFwjgY4+DXi1ewUnxGd3/B0ZOmJ58L1Ttq9gCtF9+MxLnEeFHlVpDz00wyUP1cSF41sGmCMNj/fSLienU/7vhoGGIJuXWzIrVbkLukfMnOwOPNomrC+KUHhm6jUF1b22YLSyL6ReWF3AQebEbKI6GUSkoXHs2a6fEEBW3slbRsoEYFeQHVFrBwbbjDAXUrYcFtzJm2eSAuf9l7BGGHuse40YWePcp02qHKKeWOqa+w4gj9kmHXEem9nggglCZmfkamDS6R7nq/osCgh9FBSueRzQKTd4lspCGCH46LgYyQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2VCeJjqzlqAWPeDryVx08E8dr80EVfiU33PwSeNBFpk=;
 b=JXEuwDaDs1XvyvyCkgumLeR/WooUyEPJFrhnaKKfuGTvFVF6lfdvpUThNM1SkqC1X4oqJZcdB6vV3pkGMdOG/W7Zr2vrpiTsQ7Z7tRNOVrL10mvIWvF2QIOiMGnH1c5QmYLB0Az3vmqyCaBk86qX1HqFaWFQ0nGJmyB+LQ+Yeds=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by OSCPR01MB12802.jpnprd01.prod.outlook.com
 (2603:1096:604:33d::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.15; Tue, 11 Nov
 2025 00:21:57 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%3]) with mapi id 15.20.9320.013; Tue, 11 Nov 2025
 00:21:57 +0000
Message-ID: <871pm57717.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 057/292] ASoC: codecs: da7219: convert to snd_soc_dapm_xxx()
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <87cy5pa0ea.wl-kuninori.morimoto.gx@renesas.com>
References: <87cy5pa0ea.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 11 Nov 2025 00:21:56 +0000
X-ClientProxiedBy: TYCP301CA0002.JPNP301.PROD.OUTLOOK.COM
 (2603:1096:400:386::20) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|OSCPR01MB12802:EE_
X-MS-Office365-Filtering-Correlation-Id: 3fd13737-80e9-4f30-1eb1-08de20b852c7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|52116014|1800799024|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?aolvIhj15Rw1I4VFJwwMnqfRPupTCgnWau0zNZpgxtlp9zIbDD+2qq2MTYyY?=
 =?us-ascii?Q?jd6xX5UjRCcBHj+Oafy2xA1qe7B3jA6mgwygRH/4Kf2xA2TqlBFbAxWg3D2T?=
 =?us-ascii?Q?YeCB93oYORKuy4cMRNRbU7+UGvi3TUGnXQYmLtOBjO6fMh0XtPpWZJdwnxu1?=
 =?us-ascii?Q?bGbX4h/rR3/N9/Yg1O7sYC9VZtE6BXeW+/X/MQK9txKgsusmfGbG9EGA0eFR?=
 =?us-ascii?Q?YhqN+wm0eACvQsDh6/Z33w7P/4LWWQn3BG5wJF23DCrn2QZ23PLOAg+fQRHc?=
 =?us-ascii?Q?4z9NN4ythKqWZw6Pyk1ujCWmN4OT4G9HK7Odl9iiof7qBwJhH42slAryCUQr?=
 =?us-ascii?Q?9un82WIlXDOioXbCBDAj+TA0qWLTwT0w4DU3qcEBJ+MO8EPKa/CuGNZsG+NR?=
 =?us-ascii?Q?OtVJNaqsRDxR03ZS0SQ31kz6RLsfei92WDo1jmIfz1ZqZjX6vIfIVJx7v1N1?=
 =?us-ascii?Q?QNmbcRgF86DsSqxw6+4KnQYXQeSGsK29xcX4jKLMUl079Weovix6q6eIG3eu?=
 =?us-ascii?Q?PPfU3hXSZH6e/wHFN6kenVhz95LHn26F9pmzVnizAHCNl3VMXAsnhETVo/6a?=
 =?us-ascii?Q?ME+X2VEp4n42R+BFIseEAQbcQ0pREoIpf6GxdTI/XIimaClC4i8mZRlVk4Jw?=
 =?us-ascii?Q?3RGcQXlcDlshEmo3Bk50wokBuIwjZAK+1fTemIDRtLMD5M9O2ervedVe709Z?=
 =?us-ascii?Q?3i0HDmsZbMBnrmHUHk1N9rz4JPKZF0kHw0lk5e4DyTEtL72G17loYjOutgdg?=
 =?us-ascii?Q?4L3x4yU/htCpn8o19Pv9kj2EcAXkYKjRZVJdMtNDUzRMlMZF25gbN094I80a?=
 =?us-ascii?Q?XJeoWXFNe1XoC1kczRNJjVq3LgHSXf4aaT68oEhslru6kwp37Yfi7pNxk35D?=
 =?us-ascii?Q?2wMScz+/Prn7quOX0/gqVTsfjbyyHXrxqxQgVz1QE8nDWJqXcPmaCQg5fAqM?=
 =?us-ascii?Q?gZXK3+xS/o16+00BZDdA5BEbJFUmB8VzUMrQZ/Xyo1JosdAXx0JE6EjXR2Il?=
 =?us-ascii?Q?Y7s3wQ+VO0fGMH15Kq8ETYo5JEChCYGG1zRbK5yBgJ/4Vktm8at6hV190pmN?=
 =?us-ascii?Q?EAbMILaFx8LQlyOoqWMX72przv3MoUXYlb2JZSLSp566akU6skKqpX6eHff+?=
 =?us-ascii?Q?8PyAPPaYezVWExQu6jrsLUNBC1M/VzBk1SajgG8SOejUzw7/SxZKuxunDjyE?=
 =?us-ascii?Q?U2HMJvoXBSAKNNjzHUtl0E5yLDRj8DpHhqbgyvIvbVbp1DK03/oqoG3q/0bB?=
 =?us-ascii?Q?sc7tNS79PEjVi5S0Vh7T3fvlD+TNfmxTAoyOSAFKOwUnvXi7+7QhPPier9rI?=
 =?us-ascii?Q?wPMZdB+yEhFoH5rdZ0MXmT0oNlysUF6NDabK7E5fttjcrBTnP/D81vFLprIV?=
 =?us-ascii?Q?wDhrZlIFnEn0sjZHL3nBsIkXmaK1uQOO+2d0LSKH/o4St0CnCfC3HOU5cxtL?=
 =?us-ascii?Q?1HDDPouMo2QrJA7WtLn9ht+aJKgJkMMBDhjHTalRyzUJT1KdC2rGD5+sl9k0?=
 =?us-ascii?Q?oTBny6pmk8L8uUmjQoClhAy0FdvMNMFRcYU0?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(1800799024)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?uafTyFIR04r25F79GYwRyvY7Y+nOhLMqfRvHLrjU0RhsgR3bRYTn7odzKafD?=
 =?us-ascii?Q?EE5kQFXzCWhJZJ6Wf5Pjv4EsFXCvW6QnN+IbFJKXlflnxnPQVQzVuIkpdi8s?=
 =?us-ascii?Q?NTkUVxXFZjp8cQgS7xIZ/z+ETBYZdjJtg2mvSnlQD02UFRtAsFuTCurAGaNx?=
 =?us-ascii?Q?/zDLO1y7GWa4/2TdkFQa/jwkuOVq8eu0fLqEd2L7NJ4phENO6L6Sag65/7dd?=
 =?us-ascii?Q?Yy/t0xCjAnfv4EdQ0ZbAk3pohH1uqesN0HW982xjzjcCASAgDFwGwUml4eFL?=
 =?us-ascii?Q?c3/DduopWk9+mBcqXZeM2cNXdwZCLXVLbqeJ3y2w4pWoklgkOv1WrVQcgYYa?=
 =?us-ascii?Q?KK79NPZu054jj914HWqFcCtHINHr+lHAHFyT9Mr/wRZcNVafjCyT/JDZHzdN?=
 =?us-ascii?Q?gldaVmk31TJv4xFV8NOW90WLUpeT9q7gYnwd3XTqvuYa1Ek62y3lom3A/FPI?=
 =?us-ascii?Q?EDGJPqFBdxHdP6H61Yeco1hK4s6I8lPp3SiOoxNt9Pqkz1DYzDa705HuEnjN?=
 =?us-ascii?Q?9NXpj5gKCO2nSjd22p8qUuXR9BM25cFbkdV8szz7KDVaicSOzF8chJcjX+l/?=
 =?us-ascii?Q?PmxaNDgas21eDS/kCNOZ9U9V13c7dDkuY9DgNAjIlGSeOm1lzLwEpvO4i85t?=
 =?us-ascii?Q?gN4LQ8UeK+zMdAEhupMS3IdzwpIujCp4Y5NwLVlXSWiUa5LXKcp4OCSbD0YO?=
 =?us-ascii?Q?gYxV+LJDpr0/BSdW9qqCYfbhEfAFDytN86nN89Bzgjg8MZk1qnAsJi9O9H00?=
 =?us-ascii?Q?v5kmd8xF8weWaHuakADmfurqIhdFCEgHhbGh92qkG8uJCy3CJuFsfQv+Vzun?=
 =?us-ascii?Q?8ce0I5YE0hkUrfIDfiYibMvoUee2bUotg45/jHze0M9sXXPO5E6HZ/jyaS0P?=
 =?us-ascii?Q?gZG+qfvIksAlEn10Pv2bCIRWiGS49OZx9JGmDBvPFtBBRCcjSaYUus77qptk?=
 =?us-ascii?Q?gzxvhfKfvfGVLGdDwDXcnIY1MnoOnyO5n0Fd2vskx3bP7jGnjwtiIJXzUyW+?=
 =?us-ascii?Q?FUn4L6HvvMK2prDcAViY/gRAx27orj75ALsP9YsYPmc47GBAHfRjj/y6qHFU?=
 =?us-ascii?Q?nmq+SMztAmpsmdaR2YeRuYnvQGLeL+uEZG0KwHmZaH5JhKT5C1naPKkF8QHy?=
 =?us-ascii?Q?rBJavzZY5W6/NB1rIq3FEs+ocDvp/OODyswo/pP9XlCJcqnJNtuBVeT7hQsN?=
 =?us-ascii?Q?IknY5ujHd6G2NdWwNPL08wiIfLi5UjF/Jwybk4W4ey3Cvnxesfi0tXSKn9Bk?=
 =?us-ascii?Q?A1geWvZWCPEvQjR4BMAZCu2wB3MA9qLwDAbn3FYGacHgW52zTx1MYdYgqD2j?=
 =?us-ascii?Q?JzwoRKDwmPBLgiJkGUted0PbnVMa5raMgZ1+pl+5e4UT9HzDpwvHs32sGgh7?=
 =?us-ascii?Q?9cYws4xUO7eypzmdUalrmQ0tkSE3z3a1cOuGoQRqhkYGZrf316Rr03UhHl+f?=
 =?us-ascii?Q?KNjRj63VUd/mO0nfXbVJQwNBospOao/ijPzmQwOGfhq5LonQsBNpH0s4mu8S?=
 =?us-ascii?Q?Uk/uSekJX09JYF84wJYpW2mid0V4r+b5eWSn5d7SXm4eCbYD+JIabr/wVYE/?=
 =?us-ascii?Q?MCSExCZS5CbKcZihCKjpEYiJH10ek1KxWOOEUWMdZ/o7uORHkrkdzFy5n8q8?=
 =?us-ascii?Q?n6GiZF8iPzNnI/z65j8PsSg=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3fd13737-80e9-4f30-1eb1-08de20b852c7
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Nov 2025 00:21:57.0260
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 59lurfcm8vc15JNkSGx49Xwvp9ZGIOD4N1Ek9had/bOROc4uRTfXt8MfvIxbUlo8NHHEPsB8rbms4EnZ5V3qaa9vIYR6v9iBTky5oo48WVpMKEHV/OXFOYnFfEdJ6bxw
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSCPR01MB12802

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
 sound/soc/codecs/da7219.c | 13 ++++++++-----
 1 file changed, 8 insertions(+), 5 deletions(-)

diff --git a/sound/soc/codecs/da7219.c b/sound/soc/codecs/da7219.c
index 2bc6b03488105..298a626df3ade 100644
--- a/sound/soc/codecs/da7219.c
+++ b/sound/soc/codecs/da7219.c
@@ -1807,6 +1807,7 @@ static int da7219_set_bias_level(struct snd_soc_component *component,
 				 enum snd_soc_bias_level level)
 {
 	struct da7219_priv *da7219 = snd_soc_component_get_drvdata(component);
+	struct snd_soc_dapm_context *dapm = snd_soc_component_to_dapm(component);
 	int ret;
 
 	switch (level) {
@@ -1814,7 +1815,7 @@ static int da7219_set_bias_level(struct snd_soc_component *component,
 		break;
 	case SND_SOC_BIAS_PREPARE:
 		/* Enable MCLK for transition to ON state */
-		if (snd_soc_component_get_bias_level(component) == SND_SOC_BIAS_STANDBY) {
+		if (snd_soc_dapm_get_bias_level(dapm) == SND_SOC_BIAS_STANDBY) {
 			if (da7219->mclk) {
 				ret = clk_prepare_enable(da7219->mclk);
 				if (ret) {
@@ -1827,13 +1828,13 @@ static int da7219_set_bias_level(struct snd_soc_component *component,
 
 		break;
 	case SND_SOC_BIAS_STANDBY:
-		if (snd_soc_component_get_bias_level(component) == SND_SOC_BIAS_OFF)
+		if (snd_soc_dapm_get_bias_level(dapm) == SND_SOC_BIAS_OFF)
 			/* Master bias */
 			snd_soc_component_update_bits(component, DA7219_REFERENCES,
 					    DA7219_BIAS_EN_MASK,
 					    DA7219_BIAS_EN_MASK);
 
-		if (snd_soc_component_get_bias_level(component) == SND_SOC_BIAS_PREPARE) {
+		if (snd_soc_dapm_get_bias_level(dapm) == SND_SOC_BIAS_PREPARE) {
 			/* Remove MCLK */
 			if (da7219->mclk)
 				clk_disable_unprepare(da7219->mclk);
@@ -2613,12 +2614,13 @@ static void da7219_remove(struct snd_soc_component *component)
 static int da7219_suspend(struct snd_soc_component *component)
 {
 	struct da7219_priv *da7219 = snd_soc_component_get_drvdata(component);
+	struct snd_soc_dapm_context *dapm = snd_soc_component_to_dapm(component);
 
 	/* Suspend AAD if we're not a wake-up source */
 	if (!da7219->wakeup_source)
 		da7219_aad_suspend(component);
 
-	snd_soc_component_force_bias_level(component, SND_SOC_BIAS_OFF);
+	snd_soc_dapm_force_bias_level(dapm, SND_SOC_BIAS_OFF);
 
 	return 0;
 }
@@ -2626,8 +2628,9 @@ static int da7219_suspend(struct snd_soc_component *component)
 static int da7219_resume(struct snd_soc_component *component)
 {
 	struct da7219_priv *da7219 = snd_soc_component_get_drvdata(component);
+	struct snd_soc_dapm_context *dapm = snd_soc_component_to_dapm(component);
 
-	snd_soc_component_force_bias_level(component, SND_SOC_BIAS_STANDBY);
+	snd_soc_dapm_force_bias_level(dapm, SND_SOC_BIAS_STANDBY);
 
 	/* Resume AAD if previously suspended */
 	if (!da7219->wakeup_source)
-- 
2.43.0

