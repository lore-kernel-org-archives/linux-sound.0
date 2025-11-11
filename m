Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11011037.outbound.protection.outlook.com [40.107.74.37])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C03431C6FF5
	for <linux-sound@vger.kernel.org>; Tue, 11 Nov 2025 00:26:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.74.37
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762820801; cv=fail; b=VNA0k2YYRVqO6PvwI18DV/G4O1yenexaE06om3DcD3XNjMXne5Jzc9+pqX0aT04SdlrnIOiBs5if1OH9Sf3/ax36X4LAMNoFfWyNH8OUXr6dyZKfRe0Bqk9cELbkmRyTPmUUnbK5bWgWpFwK42qFtzsq+ahD8UWJhbgxBDDCOtM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762820801; c=relaxed/simple;
	bh=ydYKxbzPldfQ7rObp5DaAiSm1rILj/60h+hAE7S2G4Y=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=VxwAOJ1c960NfY65XGdlHjkxG0dnuGxMsO0htyIV9QYvEAiP7iOQa9qaNWYHc8UoV/ItmbgMOvkC2Y0wa7kv8ZmEmw60CwXDgmih36X//F4q4CXyVDhv868Jtlpv736eIWH4S5Ja6cnAYiS0QRzbTDF4KjYDOGi4v8Lo/1mhxfA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=NGxFCLtn; arc=fail smtp.client-ip=40.107.74.37
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="NGxFCLtn"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cN4dLQ/fSoT6ZZ6LT5I4ZrhF9DGIJPMlF6o6/82Fno9RIsdIcsHeDTyzB8fowCrFiZhiUzqQZOjId5HHes5//RsFeywiW4XXS1iOwA7zXM0WxvzaZdEKw1ThTSxZLl//tZuM337Z9oTVZhFpB3hJi4dZqPVNEUgTPPrLJs0Xakxz7pbVmiwiaLVKbFqumVGopapjQbnFwHpRFJiqe5d7U3W20/wENAom3kLLB2Q38MK4PtNAookvppbuegiEmY1FE4KUUrgl5Opk1/0dHIWANiYEsK5CsCk2OBAE27sb5pPKsGtPk/rM5LU1Cz237bDNeNhOMKL/4xaY0dxI8Tz77Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=g1AUwdflpHmJgjQ6gsx63p2LLkjINImoOnQ9/edBQ3c=;
 b=I164oCu+/Y4JTqoGphtVlz6td+jHzVzmWj5NSnwM9QVvjFFW3tJO8Y2us2moPBmwxcvRvcw76kQXHtSTIkXvbGR5F0VF1WBLPu48cPsWb/UHZg8fwvR5dbw/JG9eyNXkqwd+h8hhCupegHE0FVxuYrZCWReJCHupEpfgr8Xg0lLqzYC2IV2R7JhII70XTL/xXdGVHpWtskxdIr3wkZHMSeXj9i5VeCPJBbjqZ8QtoNfbfco5ffGK0nXHnbOwFQMLgA9rwPZXzIX3xBwKfX8PRau2RNfff4yuAOchSdHqsFxj8ySRl+X4cpJnObdGnDSpAwybln865Q2xjvvIs+OCqA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=g1AUwdflpHmJgjQ6gsx63p2LLkjINImoOnQ9/edBQ3c=;
 b=NGxFCLtnIwGvl/O/Kh+8yt09++eQ4cYnqluN16rmMVQGlIheTMQSXkFkxi6+TSDzBIcuqHKr9e76h4HXbdqYxt8Qoz3SMJ9yObP6f8r5P2U7YN1I6PMbG2Bh/vxMTzG8/QehzwnyrKgI9j18DeJJfGwMrM1rzPHIXmfGQkZmyTE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TY4PR01MB13460.jpnprd01.prod.outlook.com
 (2603:1096:405:1d7::5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.15; Tue, 11 Nov
 2025 00:26:38 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%3]) with mapi id 15.20.9320.013; Tue, 11 Nov 2025
 00:26:38 +0000
Message-ID: <87y0od1kjm.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 134/292] ASoC: codecs: sta350: convert to snd_soc_dapm_xxx()
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <87cy5pa0ea.wl-kuninori.morimoto.gx@renesas.com>
References: <87cy5pa0ea.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 11 Nov 2025 00:26:37 +0000
X-ClientProxiedBy: TY4P301CA0027.JPNP301.PROD.OUTLOOK.COM
 (2603:1096:405:2b1::9) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TY4PR01MB13460:EE_
X-MS-Office365-Filtering-Correlation-Id: 01344e98-fe60-4d68-ba26-08de20b8fa4b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|52116014|376014|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?Bq1YaUMrvI4kdbEg4JUl4F0BEDZwZEhcQBduXunIVN8UVBOksjY7agRVtMgQ?=
 =?us-ascii?Q?dXNC8FnSgsfjorD5pIs7Ay9ifomHUabdgIqvX0B6myhqO/rZZqNnEZ4qd70E?=
 =?us-ascii?Q?m3f57WLj52QteAmoNYg8bhd0f1WVjMRn3qAjgXKHMHapQMU+M+4ap+ejT3MH?=
 =?us-ascii?Q?ZIRMdIFdzYKKCA2EzHMSvp7J7HHQHxm0uyFDNsEiuHPJj9KofGFWnxBqnb4L?=
 =?us-ascii?Q?NeY3I71+v+/T7ZEcyIr4eG4Tj0mWagJNppPQ1I5IfJXYlMFqf4MHvejjXCC8?=
 =?us-ascii?Q?tAnmP4AdJMKzaaAXySUIOJDPfx/rO+cEH8Sd3f2JjKAtnp3ROHDPr3dWVv93?=
 =?us-ascii?Q?z+nsS+854FfjQHD8rDc6nmy3WOeucg2WzqAe+AaXV8Ua9s5JtQHqXA8aOMgc?=
 =?us-ascii?Q?4Xl6PnTvU+a/K3q0YsF3uENflavcNx0f64vdm6p0Kk+9iYF+94vxoqQ3Bwwa?=
 =?us-ascii?Q?qg3LJOxhXRqyhtcwMCINb5MHsYiAGdZDCPb6gx0XJI+B+mAb0Rdt7PY001h7?=
 =?us-ascii?Q?6xKu00GY8Wq4ZghX8MNlFD+rPOA7GSxMenUOP4VzkVpUnQy0SnuiNjN8S8he?=
 =?us-ascii?Q?l3VxfeYlGoXpfhb3loHuYo8icxPOMw5cCDGqm7Q1pREhCh3aWnrKfx5isEVh?=
 =?us-ascii?Q?CEJANluxVES0NeItKIvIeSaVChC/TMGHmLWkhOKlgek+Av3nCKxD/wtkbQ8+?=
 =?us-ascii?Q?FXQ2wTQAKmvQ8oTBNmaQALXldnxsQvb70aSpon6chnhTtbm6tnEpCzqF5mAL?=
 =?us-ascii?Q?W8nzU85asx/ewhB5CBVa09M3YexGSnSKcKx3CKItPL9ScjnkH2jQZT5r922w?=
 =?us-ascii?Q?hyRnttqak3+rP2RR657+Tf3au9WeF+zhHYu5grRQDhS0KqYv/1YmBf/a14gN?=
 =?us-ascii?Q?6XUZ/xZCVa0Q63tawL4uhbAzq/9padRDju4HCeYVfGO4mILTq77cCDkliDhe?=
 =?us-ascii?Q?1y9nSOsv3vuPO5fJ629RsPG0Lipx2pvaO526848LlIBEC/x/TSQcwIF8GDry?=
 =?us-ascii?Q?dZBl7SosVsZUSiKOsZ3n//WdW9Csxj0K7nipKMMnoffd60ZXPaj4B/q7fi5d?=
 =?us-ascii?Q?TYjPYfOrQYkmnFsIVJDF4M8LjDOD96qq9c0FROEaYXpC06nYE19csM7ylLbe?=
 =?us-ascii?Q?vEQMutfMqKQKbID4Is0XOlBkEUp6CW7si7Tkgl9w1250yUFlSS6zqEJJ2bSk?=
 =?us-ascii?Q?xPR0cjaUp6jzbdX7Z0hCd7Zb9ju9Npuly18d+FmMe4K27DwlJcjWPVdQIsgl?=
 =?us-ascii?Q?uT0mJ40kxY4n/r98fSB7BKjTOeTGcN/TgH6eHPWjzCDcVXnKlkGQ2EdrTbR5?=
 =?us-ascii?Q?ax3xDZuSEGfA0NRLl4aQ/q1c3uyGc1EjqqpR9ebuA6Hyg0VCOiJA4T+qc8Ph?=
 =?us-ascii?Q?AznwAUpsK90posrHwf2R6kvAe0PVcsltV93KAmrvZY0JKUpP/KJXrYUMnRyt?=
 =?us-ascii?Q?RJmCbCZVjoXgy6jSfy3UojIFEVaeeeYDMSFlivm8vNWMa31VgP7/tdSCmYrR?=
 =?us-ascii?Q?6I3EdUIsHOjH6eMOo5khMpHb+qHRqQQJDp0W?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(52116014)(376014)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?zFzGoOP045Ibom1ex77bVdKLx0mK5YqqHy2SerYTy2FayDODk00/Yj0M5KC2?=
 =?us-ascii?Q?f9sdDIvPf/A80D73Nr3DfOYc6ld2CRfuNa2ylGhfPw7/TTUGm6OHCBPhz2Jh?=
 =?us-ascii?Q?loNa8F9Cwya4zjQL6k587ofwgV6v9qWe6eQdpVQpTLHC/OpUX8pBlWsxEebX?=
 =?us-ascii?Q?Fsy1iRNUceFgoCgdJ9HV+YxpFKBMb4L1eps5LQf0+laUYB/U96zWM7RqNX+c?=
 =?us-ascii?Q?3sbuCsp7LIyvBUo37Hrd2N/88eLtjZ9wXYn9c1yFn6tO7VguwqTO9L2YISr9?=
 =?us-ascii?Q?XUn8ymba2pL41mcUYrgKi4eocSH3gqQWaKvfwbd8UlfgFH3wdXqSg84hREZ4?=
 =?us-ascii?Q?l/J1ppNIfXfOD5/SUV8fABwZufLVv1x85YgvmBbMMF7c02WdHqcAIMLFGHrp?=
 =?us-ascii?Q?I94+24bC8qh83kL89XVKB2YL1+PjoslEDWnqQXIFEc2Iq6AFnCMubXHjAHd2?=
 =?us-ascii?Q?UeV9VpCWgRsFORSZsPyo1fCnqyBhg2m7Y6EImbx3psk8uPM9yxjFMMrX7b+f?=
 =?us-ascii?Q?gVImkBCIdh8MUlbf8wbDiTuXr/BaU0gBj87MJ8UTClVq3fy7AwG+OYUbZI9m?=
 =?us-ascii?Q?igTLCdgoeUCoAV4QYdW6FAQ101xmUGSqFa2JNx6QF0AgcVh+SlGFRWdHqzaS?=
 =?us-ascii?Q?GGmB3TNCgkx+KP7gpsq42n6CytuShY9/W+NSTiJqyF/yBtc01G4jEynKNhj1?=
 =?us-ascii?Q?NZj8CjZ5tSZjKs1ysM4DEQhzjVbAGLczDzooOvFY02FcRhm2crqGCqyz0vw/?=
 =?us-ascii?Q?LzGgSlFGtDenyURn4lKc5bFersRlX2pQeM1Kmqyf6XRqb/9QuvzLZS8mu0du?=
 =?us-ascii?Q?y9iLs3yjdAtP12+xv46E8X4EUAHrgm32AuZCQVPDfN/gm/YSzAI4ggxhrJQE?=
 =?us-ascii?Q?Fb1k7EjIke/qrhHZBNs9b7o4Eakioux4uKje1jULi01rt3pEGaaUoHbEcUxC?=
 =?us-ascii?Q?ow2m3CdkxhDvVfUoxl6XvmCRtNXZw/3XqQ2An32e7UcjoYwLlSt5lg2OMpeP?=
 =?us-ascii?Q?i8Wu8TDWylNPcarV1uvaZNYFZCgeMDEAv+1nU5oBD9AZJXfY4tO2cApwapcN?=
 =?us-ascii?Q?3Jz6OvBHKdYoDpOxDQcrSgMceoyXqHQLHw640i5YWarGSJ7xFwoXtHmhQ00k?=
 =?us-ascii?Q?H3dtuJhd7JkaOHG55m7HjnCIM2TBPtct2Of+V0kn4WHFz9u5ZtmtF9R4x2HJ?=
 =?us-ascii?Q?9dZcDifrZvOZTgGYUTUHQisfdlgxMec525DTjnQFXaKunoXQuPZhKsUiRGVK?=
 =?us-ascii?Q?OMoLOr7+yTvctQadLDXgUdUQ5R085ujyzU9VVWNpWNbuH4HMdxekh6Q9VIAp?=
 =?us-ascii?Q?mS86tewE4bn6EuX/6cdUAe18F8xRPeq7avNjaCGev0oZrYOYTbCSXreUGBWx?=
 =?us-ascii?Q?zFlZG7NrTR6JAX4Q/R6OmnOf69RFyoloJo+wQOVVTnOHxGrDo1dWr3JT1EsG?=
 =?us-ascii?Q?P9BpRNa/0QuDY966NX1V4EcdXG1sJuQpGgLZc0fyeCJet0eJAvZ1IzrtzkG5?=
 =?us-ascii?Q?d6OdpoGkI3pjypmo36M9mV4vD69+vvdjyz2KJbl9WgKl8YaPLMg4aoNWB2cY?=
 =?us-ascii?Q?g9jhKYei+IePDxrK+aeycbezh7dwBVupJnBlgFhtU4yoAX4lucgZaQuzN4+q?=
 =?us-ascii?Q?4M4Fzd3t6t811VRxfU9Zb/Y=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 01344e98-fe60-4d68-ba26-08de20b8fa4b
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Nov 2025 00:26:37.9570
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: aHgsTUvt2bMZJD9bjhoSGptKeD5xaR9RSWRTrbfCHlB3lSw5J1+s9nSZV0WI8Pwn9lxe8uyItthZ+n/5g3FYdvFGLQOtRq71fSwcaOY/zHr98hbIxO9FlJfPl2wacY2p
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY4PR01MB13460

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
 sound/soc/codecs/sta350.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/sound/soc/codecs/sta350.c b/sound/soc/codecs/sta350.c
index 29bdfa662ebd8..71af82b099c01 100644
--- a/sound/soc/codecs/sta350.c
+++ b/sound/soc/codecs/sta350.c
@@ -830,6 +830,7 @@ static int sta350_set_bias_level(struct snd_soc_component *component,
 				 enum snd_soc_bias_level level)
 {
 	struct sta350_priv *sta350 = snd_soc_component_get_drvdata(component);
+	struct snd_soc_dapm_context *dapm = snd_soc_component_to_dapm(component);
 	int ret;
 
 	dev_dbg(component->dev, "level = %d\n", level);
@@ -845,7 +846,7 @@ static int sta350_set_bias_level(struct snd_soc_component *component,
 		break;
 
 	case SND_SOC_BIAS_STANDBY:
-		if (snd_soc_component_get_bias_level(component) == SND_SOC_BIAS_OFF) {
+		if (snd_soc_dapm_get_bias_level(dapm) == SND_SOC_BIAS_OFF) {
 			ret = regulator_bulk_enable(
 				ARRAY_SIZE(sta350->supplies),
 				sta350->supplies);
@@ -905,6 +906,7 @@ static struct snd_soc_dai_driver sta350_dai = {
 
 static int sta350_probe(struct snd_soc_component *component)
 {
+	struct snd_soc_dapm_context *dapm = snd_soc_component_to_dapm(component);
 	struct sta350_priv *sta350 = snd_soc_component_get_drvdata(component);
 	struct sta350_platform_data *pdata = sta350->pdata;
 	int i, ret = 0, thermal = 0;
@@ -1028,7 +1030,7 @@ static int sta350_probe(struct snd_soc_component *component)
 	sta350->coef_shadow[60] = 0x400000;
 	sta350->coef_shadow[61] = 0x400000;
 
-	snd_soc_component_force_bias_level(component, SND_SOC_BIAS_STANDBY);
+	snd_soc_dapm_force_bias_level(dapm, SND_SOC_BIAS_STANDBY);
 	/* Bias level configuration will have done an extra enable */
 	regulator_bulk_disable(ARRAY_SIZE(sta350->supplies), sta350->supplies);
 
-- 
2.43.0

