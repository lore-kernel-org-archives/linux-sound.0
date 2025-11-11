Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazon11010068.outbound.protection.outlook.com [52.101.229.68])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 198DB22B8BD
	for <linux-sound@vger.kernel.org>; Tue, 11 Nov 2025 00:35:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.229.68
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762821305; cv=fail; b=kEGeKjp5qTCdihbOJTu/jsGQkuOo9O/BAAz8psCLd8xl0JQ+bzybZzV0NOjRVhr5XlnHARGbJO06JkgZ7665CrIIvVwJwB4Dx8hy96nQx1wuamTLCmOoFm7GPdUwsJ7QZQimBAnFZSBFiXl9sKj4qpLVSQIVfwpMBrRNThmEysY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762821305; c=relaxed/simple;
	bh=WpHp2+Tm//adDfGJo93YtUnO3k3trH7bOaz58yASzRY=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=SUQ0pB4BP8qLS562wIjuN/qxHJ6PO2Ffzs2vl0vqIQljYhvx7Zmlr5mr7AmluGSaj0qaLLVxjiY49eSs9NVVw6vStabT53RbtrNZ106NwPutmgu8GbB9C8DlIXDZ76ZvOYEM64hDlZ+NgQS9KdW8fNsu7sB8mStywaxjTahhVrk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=aH9PiGpC; arc=fail smtp.client-ip=52.101.229.68
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="aH9PiGpC"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KW+AJhFjp04oWbYUUQ47sA3mnqQDTIPb+1PXOPsCD2GBADULANe2UUqiCF85WpccpHfsHkrGLmeY2/gAs5OlN4URUIlv2GkuXAcmNOoi/UkNnyhQiHxTpottb8KzLksLoEyOWjY8tmXK5nrI1GSg+8nKMcWhjK5Ou8q0Mw8m4IaYbw0EFQXx98HyenwFw2fJR0kJ1/aLzjJKoRGaVSNkUpBigFcz8YO7llK78llRrLj2YlbO7qLPrAoKo/Xx4UuXmPUkghSSNJ+aktM7mdDVwXGNyQ0wy27S0OJ7yg32rpt4CJ7UfHWBHK4OC6++8DRC61+HTPbT82wTs5F5W6zuAA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GQYHoGsuEnEDQdIjCMIyLmLTonwQlFKoAHh3plk/sDs=;
 b=M2Cyo95nq8Af41YHMUiMLdJwuU71egLz3uTMqEu32fOy9YMk4Y3OM2YBTUa86otR7HlvVjMJfDVXhF+4WEUawgTjtNztGb5rf/NuqMw29NsjlXMa7b/X1dnqcxxYJJF3GkxLcwlk62yAU+P9FgtwJ29PMq+261JG+N9px9Ttd7AVE3HEiCgDhbRaoqwnjiTQs57V3WyFNW9VYhHVgFaRnd7nVxu4EiSN71QDE9Z1g22/vtj+uObA4Mt7mvH9JhPQs3RWzdJsSRlRB6/QMJ1xWsrivOANz2BlJY5GEOjyfI80y34WJ/zp7541PLk/H8lbyml+I2bAeTKKaeb1KR17qQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GQYHoGsuEnEDQdIjCMIyLmLTonwQlFKoAHh3plk/sDs=;
 b=aH9PiGpCyId3lEJg2aUbLhyGuihYph3q7pS/O2vLJkaWhfDU/VLVvu4AlhDLw3ikJ0oTnKvW2llL9e/0spX2BzHzx5FS6/SxPjAcdS/fwaLztkWwVdrlss3drZaf8DJ7RP5wBlB7cd1SKaejTgEHIquSAzchK+8LzlGAUXPoqEA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TY4PR01MB14482.jpnprd01.prod.outlook.com
 (2603:1096:405:238::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.15; Tue, 11 Nov
 2025 00:35:02 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%3]) with mapi id 15.20.9320.013; Tue, 11 Nov 2025
 00:35:01 +0000
Message-ID: <875xbhv22y.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 254/292] ASoC: samsung: tm2_wm5110: convert to snd_soc_dapm_xxx()
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <87cy5pa0ea.wl-kuninori.morimoto.gx@renesas.com>
References: <87cy5pa0ea.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 11 Nov 2025 00:35:01 +0000
X-ClientProxiedBy: TYCP301CA0057.JPNP301.PROD.OUTLOOK.COM
 (2603:1096:400:384::8) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TY4PR01MB14482:EE_
X-MS-Office365-Filtering-Correlation-Id: d3812a00-e1f9-4092-edbc-08de20ba26a9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|376014|52116014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?bAXRM+YiFCC4bRxPa5c4GKZhPoACDNQwc5wYN/5eKNqjw+8GBKXBLfSzNa71?=
 =?us-ascii?Q?96vkskgw46gSEFmMD+uasX+Z4o1DissZ+FCeTWKg8qL8X5fWt/U69x2beYxL?=
 =?us-ascii?Q?2CLOY6oQtEAYRrPQ5qqVbfp1i53YMMdrhkwJ6CS4Ryz4aNC70aRbCPheX1F3?=
 =?us-ascii?Q?KSzui/jfr3JmasrOvVK+ANcrOYKeki4jTydr3B60mm/04qWVSZAcbqFpuD40?=
 =?us-ascii?Q?1IhggLr7BMRyKVnYX7sUr5VBik/mmiZnFEFxfBAa/ONXrWCckjt/gHrZrV3X?=
 =?us-ascii?Q?3y5zC44l4P6RAVrLEKmYsn6DdcR8p2XOQX1DyhnkbOWbJumhCNWumhIuCgvn?=
 =?us-ascii?Q?A7GpjURlBcKVBalSUZrZoSTKmM1qpAFcuRqNn0ff4n44dWjJ/YqYCu+pOn5f?=
 =?us-ascii?Q?otvZx5Ev6Lr6qMElh1UlNAaQ99MmvFWcXCuZUrVzyQbIG4bKirbjHQg5vdlR?=
 =?us-ascii?Q?+0nO2zoWIsWouth4yq+I/hyHMIItlfHCipuNijiA26zY7Aj42pk72pAcXOWL?=
 =?us-ascii?Q?u28aM1s1ySldzzSEpD5IkxP6IznlOLgKq/6AKbm3IEIOzcfGc72jC58B0m5M?=
 =?us-ascii?Q?7nZ0zSVTuTDuQxjPTmYdr1NvyWZVciBJU95Zv8Hj39ZZd46nJgYNlAOsAlxg?=
 =?us-ascii?Q?X0zHdxtQikp8g7/B3ayV91KhQxiUXMgm8+WtNJiXh9bxc6eRfE48mqWp6FU1?=
 =?us-ascii?Q?y583zrMTtg6de4x1K59xx/WsHisEpmi8+5WfRQDPtIk7fzr/zXCxrYtBKAMF?=
 =?us-ascii?Q?yTSYmqGwg1M9oNPCRaHo8nunUlQR6k6zVMm/ReWnm6nsso1giLFvuSyEQ3X0?=
 =?us-ascii?Q?eN50HvU6zPUkXdQs5fTs5jI9vjhsKLdMTPoXxzYlPNFn00x/lHo9jy1x3dk9?=
 =?us-ascii?Q?h0wwE9sdsZ+lj8PU5rWDI4IFUtWmmnXz1MOAq3LQrbE2sEdppNWbLO9V58dB?=
 =?us-ascii?Q?rcRNREDEdqynwE1GhB+VmI/AKxK5QO9l4d+xDt7mZdT9ucS1z2QcNHlleN7Z?=
 =?us-ascii?Q?FQWQq5Wai4B5sAe/a30fupLIWXfQEgC5TMcpahPdi3nES70aedZrBYGqUk/F?=
 =?us-ascii?Q?MyLk1IQet7s3HB1NZDCO5HN8oNz2ip35/MMfJbB9WpZTdy+4tWkP3bM0doI5?=
 =?us-ascii?Q?W3oGXCmq3T+n6jdW0Crt0yYpwq50RNJKYoZc/G8t/PUFOaNK1lRb3U3nHHl1?=
 =?us-ascii?Q?D9e3C2GefyPUFOXrTcvebjiSGlTLH+obaq2wvlF7FOFPFsAtf/XmCL4aMOrW?=
 =?us-ascii?Q?3V2PeNyaddAjJUooDEqSp8czaDqCjt+P5OFOdTKayjpiUXvXHSe0Vk0mwfTC?=
 =?us-ascii?Q?LAgg4hPV4ie1gA7+AH9dCqX5oZEPFMp5T9i4B2zuY34GDaA6EYlIqgLeCm2q?=
 =?us-ascii?Q?1vTTG6xLJ8nKhsCHgF3uedZFNUM+ArdFhKVoH4kL2q+EBA8o8D+sTzDDs5zg?=
 =?us-ascii?Q?xH7gLvBLxq9lkl6iHw8IrgMRM1HnkjDp5xnbRcG1nz8IaUC9u1dHEiePlphv?=
 =?us-ascii?Q?ZlnWAv+7SubPujcrgo5SJ91ZShugnPHUEiiX?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?V1Stj8iHYLk+eGm66gw+u6qY5W9we5yLSlpmlojHj2wdHkdfuAdiPfVnsRTH?=
 =?us-ascii?Q?zZ8NN4XmTmrEe+tSsQFTf0Yz9950of+GLgs/+3pYNDOWU0Y0G3CfgXJfZ4UC?=
 =?us-ascii?Q?xR5q1ranLnDQQjqu6HB6luKNejswA3BtRgFiJMItKvXV4Z7B0gLIlPPqiFC0?=
 =?us-ascii?Q?wfLs3vpH9+18Ff3j6RyHBNnRUzUAXXgyTiPYV7EwPL8PbN4eW6/3rBgErKb6?=
 =?us-ascii?Q?mr37cUJ0RKVZrX82JsIsTe3N5tdrpbmmK4gI6RV4I7eIczGeUCCK3Gbp9ERY?=
 =?us-ascii?Q?hdfO6/g+NZkDmPePAQ0HYtQuYb7B+CGyGfxtYbAkdBE1GRev/ZqElaOOzhFq?=
 =?us-ascii?Q?MQZNB6qd9sWmkOdKDkZdxKJ0zsomOz2zqpUBGJ8E8f1ZTi0NoWZ88NeqDPH2?=
 =?us-ascii?Q?WGzumt+uc/qOcg62X7AFzjFKP0xu5PwLix/mcCJhJWoQF7N0zBKeUVmmqhs9?=
 =?us-ascii?Q?sC/SI1yDf0gFBemwtwJbneahv0wtdX4TgwsG4wJA4RTE4VZSMb/bQlVrdNWg?=
 =?us-ascii?Q?ElCJial4bx7eUIDJ8huC8G43fKXvRJFSsFs5ORfVASXRPDLE4Pj9tsiMBURi?=
 =?us-ascii?Q?vmc4ei/ItPmvOwqwG4mYJrYtG7pjGJv62MAEm/ryLuaRNPLiLbj7I8u6c6Zt?=
 =?us-ascii?Q?iscOZz3WwHUjwNtXhYwoh6b0XSS57dnhpps+u6aNecOk9aOitZL7FlHX1J+x?=
 =?us-ascii?Q?xaF601L5nSMyQ+bknVV3n4Q6Y2Vtq+nNdvqMNV7PSUOin/iPbdY5EsLi/svp?=
 =?us-ascii?Q?UbCsYB50Ie7oywUcY2fDbLNGdmyCvIZLQkGdHga/Na32SeEGhifZy1zLt8Gc?=
 =?us-ascii?Q?kS6qlWEMFbvqQW5nGhzj5aa6Z/11UXU+m6Segsrvtf26VGIz8m03AWpwdlsf?=
 =?us-ascii?Q?lRn7f55PbyK44sRNlRDzImB/8AnU757d7TtnTRe90fjED5mR+7q9Ser63m1M?=
 =?us-ascii?Q?kXieAuFRZhjo2KjTGC94rwWoPPkLoKZd6qK8/HFE1drFLI7gwOX3lNIr7UoF?=
 =?us-ascii?Q?kzbF7OleHbAim3UQsdcAd9lHcBS9K2C5U9cZFyXds8+IZdjU8qEQobTBNIu2?=
 =?us-ascii?Q?feBFXdxHvMLqWd9uSqlydv5zlBeQef4WYZzOCrsmOZnfbr0x3fdnmPlqxsf7?=
 =?us-ascii?Q?f0yNJ21+nkqHNmXfsCwRs6W0u34JePXje5Kqmuc+zuLns6eONUpCTmapk9yC?=
 =?us-ascii?Q?QQpiZ0gmiK2GW6p3JUUX3lLq+rzFdMcQAayhRzaEVKx3ojLKEauQbPi8H6Dm?=
 =?us-ascii?Q?27aT524HX+K7ou1XIxJnieIW83HB8hfTEiQRw7M/B3y8/QwiQXWqJtBYkNVZ?=
 =?us-ascii?Q?TMBQCxZ1LxwulptvRx6QHOrStP6NEEWj1hrNP8jSy4iT7ibuCezZNXegXH4i?=
 =?us-ascii?Q?CPJW24dJreLGUZhGP5WWoWX7SW+tOn+gjitmJESMOpfdvWuNaG6jl1vISHpK?=
 =?us-ascii?Q?0Rp5Izbiopz0PXYW6hRPaqnkgadOZ/GJYHYVftkm8mISDK4LiJZ4PsdCDldW?=
 =?us-ascii?Q?dkmmYVKp0n75dmAGmrRtkc7PYqd4rICN46/nVP7i4GH4p59MeB0/GzCGTw0X?=
 =?us-ascii?Q?7IXPRcOGPOaA/gz0Tzd3M7jTvWJJR2oTBk0bvySeaKeGlGP7M6pB7Q4dN+6R?=
 =?us-ascii?Q?46J8DoHwZiXW6CMiBlXSIq0=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d3812a00-e1f9-4092-edbc-08de20ba26a9
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Nov 2025 00:35:01.9161
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8SNWZ7RgMevtq/ge5ocldtIHiLkpSVLhOiHgj0KLjxX203KNBJjvczLQ2q/a77yyhJzZkhr285CvMxCSYVvFO5hg1pEYN6ysqv4L0TlJgrphEocwjBYUBQDJ9cY5MfYl
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY4PR01MB14482

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
 sound/soc/samsung/tm2_wm5110.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/sound/soc/samsung/tm2_wm5110.c b/sound/soc/samsung/tm2_wm5110.c
index b68ce7bd44ef1..f1f59e059f5da 100644
--- a/sound/soc/samsung/tm2_wm5110.c
+++ b/sound/soc/samsung/tm2_wm5110.c
@@ -260,7 +260,7 @@ static const struct snd_soc_ops tm2_hdmi_ops = {
 static int tm2_mic_bias(struct snd_soc_dapm_widget *w,
 				struct snd_kcontrol *kcontrol, int event)
 {
-	struct snd_soc_card *card = w->dapm->card;
+	struct snd_soc_card *card = snd_soc_dapm_to_card(w->dapm);
 	struct tm2_machine_priv *priv = snd_soc_card_get_drvdata(card);
 
 	switch (event) {
@@ -279,16 +279,17 @@ static int tm2_set_bias_level(struct snd_soc_card *card,
 				struct snd_soc_dapm_context *dapm,
 				enum snd_soc_bias_level level)
 {
+	struct snd_soc_dapm_context *card_dapm = snd_soc_card_to_dapm(card);
 	struct snd_soc_pcm_runtime *rtd;
 
 	rtd = snd_soc_get_pcm_runtime(card, &card->dai_link[0]);
 
-	if (dapm->dev != snd_soc_rtd_to_codec(rtd, 0)->dev)
+	if (snd_soc_dapm_to_dev(dapm) != snd_soc_rtd_to_codec(rtd, 0)->dev)
 		return 0;
 
 	switch (level) {
 	case SND_SOC_BIAS_STANDBY:
-		if (card->dapm.bias_level == SND_SOC_BIAS_OFF)
+		if (snd_soc_dapm_get_bias_level(card_dapm) == SND_SOC_BIAS_OFF)
 			tm2_start_sysclk(card);
 		break;
 	case SND_SOC_BIAS_OFF:
-- 
2.43.0

