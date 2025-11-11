Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazon11011000.outbound.protection.outlook.com [52.101.125.0])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70B5B1400C
	for <linux-sound@vger.kernel.org>; Tue, 11 Nov 2025 00:30:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.125.0
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762821040; cv=fail; b=DvbM3g+mLxAvZddhTCmBmkX8BlKJaOPNC23uX7HZHrnzArVctiiqyxgVgdqpV1guaSY/Qhbk/ifAQPR2fNtv0HBFnIo2o3lUIEZJb577rU1Tcidle79kOoytJMNMP4l+6w8MiURdDlyl20N+s5UCKf17Z+4Ow1ndIFmZVtkEZaE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762821040; c=relaxed/simple;
	bh=UMUEYZ8djDkdgcCVqBIWcCmG2WofbYGKBg2jGrYX+EU=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=TzpJAxmHRQ9z6mc1Or1S98RQQx7bieVIU/15OnoqoHwIhAB6/Igj2NPxgkgbnjMdHqJJxl2w+SLGJOiR/RLllN3j27cE5bJ0Q8L8eXTDm+6L1Fq357V+gwYXYvQ7ly3ROObPiLHe9JE0aIvdPfk0vAZ5CRMVPuI7kqfQ7FAG/rY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=nPsqF0QA; arc=fail smtp.client-ip=52.101.125.0
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="nPsqF0QA"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FAlCxPkRsgR25FXVLMbP25Eoxje8c10yGKArVL1D//pZdIFdAbuXJjNcNLc3nYReXzm5ZjlrZAXpd+kLv3BYJHS+zeM/6shgGU+0Fuj8tQ7J+LDkdAIr1K/KCTUMIQ3dALKuriTybds60GXTpyDpbGt6fhU6/cSi86j/ShN3MhZjAuiU08nECKqBGO+wBSf4Jhy7O+Y8wv1HOHhHkSJLv+8n4LnxSoMOPqYFbtJE8+2KkI7N+yawqivjiG6UsctErqdn/gCAuxZOc3wxy1yczbrE+qkaCO2q2ml6x+qhpAh9QJwSEAsnGvCH8Rr1avwhOlN6lzyuHS8VhZq6lr8esg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qT6x/E+OYO7OBxZ+OvXOQs5cfQ6xMXd5sHXT+kRoTcw=;
 b=OZNe80/MG/Ogy08zwFRywS8ht5dnAqKmBa+NGeFjfW8aXAZUChHeqRJNXkpcebphd3vLw/0GfUr1D91yBXwL0Xygt+nrV+IDRFwzGf4kCHWMmLlHkP6VljUyk0gELY+3U0A6sH89cLVxxkACaHQGv4K4HV2nRp7dLoglOTkdG3qDNtxPLg0aMeY1W5lwyqcJ12wjsx0DPHxAKpXpVNtGkEL4E4gYbjTNAfoT8e7Ccodd3XQuEK0XSGOrL0LncuHDnp/S3WDPcBiBtxJFK3Dd3R29jno1ThshNyeDwpf6ZwRwRE9TPEN6U/fF/pT/4yGowI6YJhZyDR5LxT7NT8q/Kw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qT6x/E+OYO7OBxZ+OvXOQs5cfQ6xMXd5sHXT+kRoTcw=;
 b=nPsqF0QAjTvXL01JBKA93/5fpsm5ENZP2kEEceBzP1g4A1kDo043p1NOEBUEFhg+7C5tDRYJAxvhwMpVlKm4QuVV9c8h+33KKgtBlSRYJQ67BYN1xiDWmiEFCf78g9GG7uxL0QZ1FBM02dMTr6Bi1ytn/JY/4qcEP5ZVMPBrfoA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TYYPR01MB16440.jpnprd01.prod.outlook.com
 (2603:1096:405:147::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.11; Tue, 11 Nov
 2025 00:30:34 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%3]) with mapi id 15.20.9320.013; Tue, 11 Nov 2025
 00:30:34 +0000
Message-ID: <87pl9pxvfa.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 190/292] ASoC: codecs: wm9090: convert to snd_soc_dapm_xxx()
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <87cy5pa0ea.wl-kuninori.morimoto.gx@renesas.com>
References: <87cy5pa0ea.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 11 Nov 2025 00:30:34 +0000
X-ClientProxiedBy: TYCP286CA0092.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:2b4::10) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TYYPR01MB16440:EE_
X-MS-Office365-Filtering-Correlation-Id: c5496798-6f20-4372-6fa7-08de20b98733
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|52116014|376014|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?1f1saOeVQzBW037YSFhZSK1tx8erToJtqlYd5Tel/7BWwnVsVe8ZneD3OoJu?=
 =?us-ascii?Q?Jvf5/nHktE8jYGNZuHZcOjNxLOvNnViwqkcUJFymwF0AbpBjM7lC4FPevjnO?=
 =?us-ascii?Q?f7chBrj1R9yZfpdyL1nl0bPZ2UgjUhRA3kjFeR87uaE4UFDIDAP+vsvaU2ff?=
 =?us-ascii?Q?v24Mf53n47x7KyfgnHbeib0ndBxON2YttAvzRW7KLwFcdIBxGYRoLPRoMdvb?=
 =?us-ascii?Q?er6IQlo14Pf3kxHqcOw5M5fUUpHtO/HVn7XPrJATn1+TEFlj76jcXwFbhN7s?=
 =?us-ascii?Q?ZjPZ/AUb68C64tX1fiepoEnC5JCgi4rM03f1kaK78Y5WYp3WgA+VC8W3h1h0?=
 =?us-ascii?Q?JbiKzaCnSjq0V+v/IQwUsTzaq+SCrJ1qWJbzpBoZWzLYAL5ps1jSxPvDpB9V?=
 =?us-ascii?Q?wJtiM27nXmjBrMglPyTNP9+3fA4QHxz9SCEylfEsN0Rqdvkn5SF87etmUWEH?=
 =?us-ascii?Q?X0etmeJc+WEY/KNkvQvLn7j2Lg5fGOKbv8yW5UeI2o3lNdN7PNon9/NaMEG1?=
 =?us-ascii?Q?MocgAnyHMOtaybqRgc22x+U7o5k5DXHHxDoAx7wKhY+P2jVDP1/JlFTM/+oE?=
 =?us-ascii?Q?O419yDpVbcvRFRu0hBMcwIMxwxU1QQqv6BsHj+qY9NDUmiv0/uQU2wn5w8Lo?=
 =?us-ascii?Q?vxJ8I7TPV3EH3F+L4wOr7yCpz7z8UA0ognnMpi84M58P9mw0wLQHFAGWWxBv?=
 =?us-ascii?Q?8Qo5FjaUehGBqQL7g8UQQvCeUy2wgfMG2veG55+IEaSWbqU0Jjpf9CDbdJOL?=
 =?us-ascii?Q?dwQw2M1VrgM97tjBuEP9ssbXbVGo2Nkx2Yi2gKs51RGfnKFv0/E56Mgs/Q1z?=
 =?us-ascii?Q?iGGMoWHFxMgKqPKvdBq6FjUFZKBdNmNYxKgU9wFjYWzTO3MwVnMyGygJ4eW8?=
 =?us-ascii?Q?+o66pnclcRJAjjnHVXcWjzrinV2Vr7IFasdpTRfA5L/HVAqwFH+YRMmtgRYc?=
 =?us-ascii?Q?ID+MvlmVYKkK0gLqBY0+xg03S5q96F6O43aiMYFRVgThAF4F2QhJc8AAI8Pw?=
 =?us-ascii?Q?qBKypT9SUJkzHKwGBpdy78fy22IbIRWeTTf0uUZbLpzp1AlrhjnGPNk376K4?=
 =?us-ascii?Q?W3wYbX7UjqfdK+kvBrOV3KGHhKXchef0S4bKTFTFzzs0G7x9yOa178S9VtjW?=
 =?us-ascii?Q?9CiYOkTzir1TC1Q3bKF+Z9Pf/jx5Jf9Pv28bsxwTmPcZfy0H3ztyZKSdDFLV?=
 =?us-ascii?Q?U+ZZqe3dXZbQj4BCi/RROt2ymkrK9+1Xgt71OSEexVl/m6rLcQ2NR93NtLdi?=
 =?us-ascii?Q?TyWTn8BROQ3HZnC1NoiVK3Ccq2BlovJddRIVna9GTQbCJmfC4kijTv+wuIeg?=
 =?us-ascii?Q?THUjPFZbT2LYFN3uHsNy8EMpaP1727k9Sv620xo6LC9b+yARMHXr+iuBxMMP?=
 =?us-ascii?Q?smqxebwhgGCRM0nRrtGT4isEn0lQ5mC6KO0BFWBBlPBOEbp9RBY4Ca54/NU7?=
 =?us-ascii?Q?+9upazjvny4RAWOu+p5H1hyWDly1NXNc5eEN5I+vVoaDLvzm4TG6WIe2etHC?=
 =?us-ascii?Q?YQDI0modviMDW9yX3eVabOmro7QgrIADpIA0?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(52116014)(376014)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?TU0R3jCZG93vl8CpMue3nRyBJsHQLqECBOKG0MkGKOTRhyviQMI6jo/xwpsb?=
 =?us-ascii?Q?5LqGBwdYhb7Nxvp6YhFveG4V57J5xl1FthYKp+tUNciNgu3qk47ywcIyKvYg?=
 =?us-ascii?Q?dnjkP9rrx2kXxYcHDqSvTpGefhEAcbZ3CdhaJCB5I1zViZJ0A/jKgwOinS5B?=
 =?us-ascii?Q?8JKY+woMnCYgMK6MUe13wX7+n77Ubg7+td1nm0BChfKPQGvAhlVBTQxZYCZa?=
 =?us-ascii?Q?IZaYQxDTHJ6LLmadvlZqYdLbGw0ezOlz9DfahRRF4Lb8E66Ro4LomcSHamYs?=
 =?us-ascii?Q?JFnmjux5Up6H06AeBWcv/HgmYoMLBqcsMC4A3ReLbXN99gEn/42QUk0+dshv?=
 =?us-ascii?Q?VtG7XyDj7ud/IdWdp8HGvtYK8+M8UCCyqRYcyAVNIKimLX6mHAVDyYhWQ2GG?=
 =?us-ascii?Q?pJUQ88+qh3URPsrnvQocDRpYjcbWY1mTFN0jam0rnwNqClkeHW/im+putfRY?=
 =?us-ascii?Q?aLKtigtf90SzJvLiyGUI29BXFgk/XDro6JtntaUEuU0v3q0BLeQc9XTngmhx?=
 =?us-ascii?Q?ZGWOCzT1VgjcOu5JPcsG3xUE3qMm7d/H9ZRoNW2Du319pk7MXYY67ojfRcwA?=
 =?us-ascii?Q?NkWCGjhfhIeGmChVaWW7EleZ7vmpl60smF2w0mB/HD810FKMuJZHr84K5IhG?=
 =?us-ascii?Q?8E9iVySM5idNcJbMORJKHoEz6wN/fkFVLRslin92i0CrwgzyaoozKXdycL2c?=
 =?us-ascii?Q?N2Qy8efVDRZY2ZMGMv69GZPsg8DtjjWOMksOM1w7d4Ib86hDscqR9NM2WgXA?=
 =?us-ascii?Q?h9a0VhiKAxKXvmXc9luDUKqOtbi7YejwqbkeUg8LUiG7LWrtej3tQKQtZlx1?=
 =?us-ascii?Q?SQouInGUe5lphQe8lMVosuzzAh7tkCRjE1f5VepCTCQefOmZ1ZneM/bucv4L?=
 =?us-ascii?Q?5S+aRbsAFelhDZcBGkQmXP18BQXMueMtfFeDNG/AONE+xCGYmJc5U8vIQQPu?=
 =?us-ascii?Q?rk74Ti+Rp7LRH5RtxExfTjoqGcQwcRFXvc1a/0cGMiCfR58d5+ZNEqMr+m1B?=
 =?us-ascii?Q?lTxwSzhe/PnKFE4lu4A847VdpYMW9ATw01pw3wR8HHetmxzmJ6TCW4bxiBJO?=
 =?us-ascii?Q?6b4bXO+R2LKyTbmdoMYoYn2adBQ8A/2W13L15jml0QuRXUnkA0MRivOC08Dl?=
 =?us-ascii?Q?pFb4lwPUjrNTK+16R3NQSQlsYM35rJePTYoG8bE3ym5g+xtnY0S4T+/K0kTO?=
 =?us-ascii?Q?MUCRK6Miczpnl+i42nE0+dpvbW+hI0F2PsNe9SccuHVnaBAvIcd8a11Nyd/1?=
 =?us-ascii?Q?6ae5uyD9xY09MX1L8fUP6OVRlVEwEPKmaBtBNU54sJbuRqvh7kXXQ6pHVoMe?=
 =?us-ascii?Q?Ldpt3ANLAIaEia52z3fiZzjgrvzLfCozzG3rMTYMmGlfZxM93xYTJN/vHfd5?=
 =?us-ascii?Q?AdRXQtAePr1B87Ewe7P1hJGsOdJgR94aFVJvnnx/j+hXgidjqr6z/xmKTcJM?=
 =?us-ascii?Q?lLPjLw3mtghAo05hRUteEFfPBazNB3oMVj5cUfls7FLnNqvug1bpQwMOJDHQ?=
 =?us-ascii?Q?63yDLOOhQGLLpWGIuTDHU2Ej2hVmOPy9vBTvicYFvv61LDLmboK9xtH+//1G?=
 =?us-ascii?Q?QYl+/ATb+uicZpXzjJPtTKnBuwXqHaR9wXIwPH+Z5DgS0xS0JQ5+Hf8UFEZZ?=
 =?us-ascii?Q?GzfpghPdxlxy3N5tm3XlSY4=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c5496798-6f20-4372-6fa7-08de20b98733
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Nov 2025 00:30:34.3525
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6BGsleE2PA13akd8bXdbP/abV5nUSSLtAQ4+6yGxOA4/otomo7SvYlRPWHPF/nymUK+PheBtcr0koNKtdMbsnUZrpF/hmEj4uv6tTo+JC5tZI2krwsuhRUZ4KyHmHCwM
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
 sound/soc/codecs/wm9090.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/sound/soc/codecs/wm9090.c b/sound/soc/codecs/wm9090.c
index 26191bcc161de..5182f0839b7ce 100644
--- a/sound/soc/codecs/wm9090.c
+++ b/sound/soc/codecs/wm9090.c
@@ -409,7 +409,7 @@ static const struct snd_soc_dapm_route audio_map_in2_diff[] = {
 static int wm9090_add_controls(struct snd_soc_component *component)
 {
 	struct wm9090_priv *wm9090 = snd_soc_component_get_drvdata(component);
-	struct snd_soc_dapm_context *dapm = snd_soc_component_get_dapm(component);
+	struct snd_soc_dapm_context *dapm = snd_soc_component_to_dapm(component);
 	int i;
 
 	snd_soc_dapm_new_controls(dapm, wm9090_dapm_widgets,
@@ -463,6 +463,7 @@ static int wm9090_set_bias_level(struct snd_soc_component *component,
 				 enum snd_soc_bias_level level)
 {
 	struct wm9090_priv *wm9090 = snd_soc_component_get_drvdata(component);
+	struct snd_soc_dapm_context *dapm = snd_soc_component_to_dapm(component);
 
 	switch (level) {
 	case SND_SOC_BIAS_ON:
@@ -480,7 +481,7 @@ static int wm9090_set_bias_level(struct snd_soc_component *component,
 		break;
 
 	case SND_SOC_BIAS_STANDBY:
-		if (snd_soc_component_get_bias_level(component) == SND_SOC_BIAS_OFF) {
+		if (snd_soc_dapm_get_bias_level(dapm) == SND_SOC_BIAS_OFF) {
 			/* Restore the register cache */
 			regcache_sync(wm9090->regmap);
 		}
-- 
2.43.0

