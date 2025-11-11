Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11010025.outbound.protection.outlook.com [52.101.228.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F405B221FCB
	for <linux-sound@vger.kernel.org>; Tue, 11 Nov 2025 00:33:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.228.25
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762821196; cv=fail; b=fvkmgc3YahOKSMZL00wQw+N1bXKw+emWQvVQCSIN8kZ0jQBMRsh9TFT4m1i96UQN8Dsp6dIaDji08VqFfUyxHj+xbFoZw5v15Qe442OHB5ovHRIgPasdRjsBWLnnXiS6UygzEvkWp1vvUSj+JlwQbiSYTA36gkL570Sqgfl2S4Q=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762821196; c=relaxed/simple;
	bh=N7/Sy6MT6l7fE4HcldZPgakzsDL7fO4YSQ0fP7nSezw=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=MuAL5qpC0KmrEsW9ghLPlsQzxTTH50iQtjIzv38oYewdKhpYvH8w+emLOTF2+KxMf6zsLlBvO1seZGKG4sJp0ZIDkoWx5BQkVzBoshhFveZzSEjm3trFadyjH6peY7RrP0II+Did/lCHHeRRpNlrlmslDR6EQvpso56e9YAkn3o=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=j2cgYDKW; arc=fail smtp.client-ip=52.101.228.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="j2cgYDKW"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SqUjOXLh2Iw/OgMgbp6mqsSN1rRd1p74FHvFxMR6bbkZ6rv/YNjEjybX664UdUWIIXuuWP2fZk3mwMHjNELBm34KuESNK3sJldIgkeDzHc3avVJIAXcIfkScbBW5RpoxB2b8rJjKMk4MS+5crEO9ki+8Igzh4a6C01XEnd0B6jO5cJ4zAUSuClZqYP74ZcC2IXGXDdefE+TcXDHpxx87gIy8GiB+04ezgqGTOYGAdiy6bljVT8mhxeF10TbF32sFAfBH785mq6UyMP2zVU6sJ66u6XzPrNU41SGs7Q9NVUYKIQUgcpLdO0oL4sJW2YiCJU68V/tn/wRcZ86Qo8/OVw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PU5dvVs89X9wpH0EWRwAS7ICejFV7Ft4Wrh1lgU9flo=;
 b=EBz5BBL0lZHZ9NR3phVO8HCvtfsHkMvaUg9krheoV3JmomCBs7gqswxffObD2U2dsbTfc+czaJOCg9URu3B2cCRInIVecA0t8gRoJuZoJJ/S/9hgEEXLeXaYHENFsVkoFlbH2oCTuL0oL5J3UbY+TJsQz/yTe1xdU1SfZPM+dfpEfDvUkv3E9K5Qp0kwU69KF5yX0i9v3Od7z60qVDfPlZiJyYok2QXxQPLl4kU79/UgFM+BnOelEfyTAult0dHos/5xhH7eWCG8oDAcYbm4c5/p/5G5Jrwol9Iox2p7K+8AtSgybk1yqiPg1goDCUFWmeNw6I0fP3NwwRNPA4C3zQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PU5dvVs89X9wpH0EWRwAS7ICejFV7Ft4Wrh1lgU9flo=;
 b=j2cgYDKWVwL6m/RwpOD+PqGn5QYsjm5YLkZIgLIzdQ6jvECI4P5a9YZSOqszED42WyfUJ9pz+4cvlDvLWesrzlkXJ3X/AtroOg+f2iCj70EhcslILozVfDZbYhSSkRBMrNrPdux5VIVkw3YD6nstOnuNFyslaihe9iWtQlVQT7U=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TYYPR01MB12531.jpnprd01.prod.outlook.com
 (2603:1096:405:19c::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9298.12; Tue, 11 Nov
 2025 00:33:13 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%3]) with mapi id 15.20.9320.013; Tue, 11 Nov 2025
 00:33:13 +0000
Message-ID: <87ecq5wgqe.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 223/292] ASoC: intel: boards: sof_pcm512x: convert to snd_soc_dapm_xxx()
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <87cy5pa0ea.wl-kuninori.morimoto.gx@renesas.com>
References: <87cy5pa0ea.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 11 Nov 2025 00:33:13 +0000
X-ClientProxiedBy: TYWP286CA0004.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:178::6) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TYYPR01MB12531:EE_
X-MS-Office365-Filtering-Correlation-Id: 14682745-fb8a-490a-ad38-08de20b9e63a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|366016|52116014|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?H0hGihPGel9dBbIH9D0mUMT82I7aCd/O94pviNyH06TgBVshzv9/bx/UEdxV?=
 =?us-ascii?Q?UbxFAXwTbm51jIIYHn88dYIROHoCRdz3MQnvr6QqHC10+g94XG7Axv3oT30K?=
 =?us-ascii?Q?UMFSzSx/j3jeVAcTSLGb4SXtyii+6MP+esNcUiPuhums+oYpj4qAMqo6SsSE?=
 =?us-ascii?Q?8t7bT72k5Lv3JNrHWZoCn1b4nSre8vzKQIBKqBifK1m3M5R0+JWVEmh3QeNr?=
 =?us-ascii?Q?Cw82kvw/bKqr8jXvGP7yGrvZil4ngOEMcTrXqLKkCqwsUXG21pI5vMRwXLtK?=
 =?us-ascii?Q?wnbhe1CLfPgF9hr/flcMMGhm9Xr0c3qh+zg7pmBFa7QcAzqEpPy9RDTTk3hE?=
 =?us-ascii?Q?3BBfO+/jIF7i8IN0Z/bHLPRscRiUSo+9ZaKVhVAQn71KqSJghSJVEYRHR2rA?=
 =?us-ascii?Q?SETpRWiWoVhdPli9K8tVmaTFgLx3rLtEA4Yz9fKLWgRFDm3BFj5Sd/y8/3Qw?=
 =?us-ascii?Q?sTxh3bPg2CJGlIfrhga9up5sYzRrX8iq9lqgFmahlRQ0gywjdRPs7a/YOqOA?=
 =?us-ascii?Q?DNl0W90o6Pvr/Af7/Cb8F+VBX24fEchQTygB+ZbFhQZlfYBCQG0zdmUufSle?=
 =?us-ascii?Q?Ey+enVyEjTpKignacBS6Myeu4laDGLdwDg3CV4blL+kGQKocL11WjWskN5pZ?=
 =?us-ascii?Q?bFXz6zZuIMqtqpBOln4Djjz+zGZD45Ag5ahTGU+T368dGc/HYZZhwspm69Ap?=
 =?us-ascii?Q?OV4H9ulGFfUS6rKziyc7C1Fky4N2H3regU+ZantIRh1CmMzBsmgNYxl0iMx5?=
 =?us-ascii?Q?LvCEy+3b59VogeQVEpSKLeNLlQAGIbljgZosDGW5j1DV2051EmBclItg6quI?=
 =?us-ascii?Q?0z42n9xBYmVKmqB4ravDvJIsq/dLt9gkE/mPgw4+XXqCk57A9ydWUKRqcSQj?=
 =?us-ascii?Q?b8nI/MDf8pQBBSh7CI5UchVRFUquyitrESvuS/XMWASVLl2HtF486atlaG1O?=
 =?us-ascii?Q?X2zYjbOz8YO7JW8bWf5uwFRw5ZPRbENEYkIX4x/uXp5kO+m36eYIYQEnZoqz?=
 =?us-ascii?Q?gySf6iZCLkmHNNaewycg4kMm2x258CBg4xsHxE4gEeOzAqLLKL9ygVccUb/x?=
 =?us-ascii?Q?6kTu9MpztyuZY79u9rwQqvBLXVZeRIWYgfv6VrMrOvLzEEb0SmaXv7KHFgYp?=
 =?us-ascii?Q?nf0P1NFjohmxdbkq3CDQRlLlXXcp3siVXU+NfHhe49IJ4YaX5H2XLfsGe/lA?=
 =?us-ascii?Q?BMF/CqWPif83mFuBqvz29c/yqaoyISFr/dRzvuPIL3bJVFg6dD3qLZ/usk1k?=
 =?us-ascii?Q?g7i37x9m3CJq8/S/7HFOV9QgRcaJmejKsDGvtuD9c2CIgDerIxwgczDeN3zE?=
 =?us-ascii?Q?ZGAulVHh6d2V+/U8zSujwRZGiKjUnA929LkQPow3sBMKVSpCz6+AvB0vZLI8?=
 =?us-ascii?Q?BjreByWsWQcmqZsZbdxATY3x28uYOwOEUT+HPB9Q2E0/Z0Po0OSG1nXJlHRT?=
 =?us-ascii?Q?X3G1B3d1Nc/EmbjBOl6sJVym334zDs7XhZIoQ0fwOSkGO4xAI/Kp5NEIqz+n?=
 =?us-ascii?Q?xUtY7zDeM/8r+EEDT4W4G+rqpwHffCIhFA7F?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(52116014)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?81kaZ3YMhTfPnyewPSFHKSaFCxqCin3flM+Qw1Ehdm3Y29XSM4k50v2YVREz?=
 =?us-ascii?Q?iz8GBBA1+BQ6g6v158nFoXe0IfBmXdHt8Uo/mqPBT0X37qor1RnKoYZeCAG3?=
 =?us-ascii?Q?A6kbQrr3J+IiH5yKEtvrneE7dwMQG/AIOfvQrw9vVoMfxSBlsQ6W3fWTSXOo?=
 =?us-ascii?Q?ygBVK4PcUge0VsZOTE8CKvThuxVG5WHyS+ttpdmyOAqF2/jJJfEsaNy4YVQK?=
 =?us-ascii?Q?YLs1AcvMO473rPct3SgJtYf/lJFsE89QB2obFvtoIDw+kNk8v8reYT/abT3l?=
 =?us-ascii?Q?y8DNI/6t7n3a5ro3wIlZmV7nHwvJP/vi18sI/0v3K8XGcXzHhKbSLgq+vI45?=
 =?us-ascii?Q?ISbQMxsyglkHb5agfikSnwiBGNSa6mMawGO1mAgv+W/DsTegGrlWicykrP45?=
 =?us-ascii?Q?ewBljC6Y1PrQLfIXvJmarr0svi9DnoTLiIFCTrv9ZD9zHMNSsoD/wcfAJAQs?=
 =?us-ascii?Q?oPZV1HHKoU74ZsAjvjiCNO1kozKEFlmrF/RQDcc053VqwtzBI5TGCoYCEqDs?=
 =?us-ascii?Q?S0LQ0O8/MYn0WQBjg8e5QX36fDXU/DuhhFiybLOiFpiXEEuxz7z56CidsYX4?=
 =?us-ascii?Q?adYnkPw+llNIH9+p3Xbg3tkO9Khu5jyU1QEPhAYf6xK+qODe5YEJ1Q81gIkP?=
 =?us-ascii?Q?EbradsRfWeEIPsJWyLfZ89cXvBeRtYTYFQ1nYvaZpM05dKKN2T+HMeUiqf0L?=
 =?us-ascii?Q?uZb5wl0D/STYtDXEMHoUOaYmSwYysh7vBTC/oxAQ6Sk757iWeDkZr5un27dk?=
 =?us-ascii?Q?Mqe8G37iQFol1OCwnjjjV8+IY4OeTPtQ7EUp3vSlV2SrP2PGSbQ2Rix8K4Vc?=
 =?us-ascii?Q?32SmUNILc3rdM4zf72Rj8pruFxHKU0rNrAvBCQbs8otcHHXEswahfh/Qf2pk?=
 =?us-ascii?Q?ckNERFyZb+GHvT+08qHtjXzoFHnSnhzXDRPKU65kposgU5MyITzQcdZeRI20?=
 =?us-ascii?Q?AUAZJ+18hQr82E65m3ISpuvtbvXW2gJMQALGOVZ4yn3n9PxJ3huFOfmix157?=
 =?us-ascii?Q?LJ6Msa39Y89YhU+NqCv3dFt+Kn1bvHLxMYhoIk0LjoDYRDMo0io6jJwGZjQN?=
 =?us-ascii?Q?zRPcphSCotRh64yAto5Kg0FCEwlX/F7j4gdnlOhx+Wm8zTBfPddIVA7EWYX/?=
 =?us-ascii?Q?y35Na+wKSQjM8Z2BgQclLmYtXTYYQDwl6sAecAa8Y18PQREc0MEaqtyfln+T?=
 =?us-ascii?Q?AZ65H+pNGKNfKG+FYYjrw2U++HFERbj/j15bMG3kC+qblN2NHh9xsaQcUcIh?=
 =?us-ascii?Q?OrmsK/5ZseAVGkr4k+Yb3YX+NNfxM0shLdDkt4I3APEgkEt9z0dXIlGHiz2h?=
 =?us-ascii?Q?lC4U6UWNpfOXpADlJW24AD8ZPExVYUNkUdDnZEH0SGOvHVt4VQhM5TGamtqW?=
 =?us-ascii?Q?K90dkhpQ2sbqZ6vQv37r1wFnGXZqAKqkvCZ6/wb8TYVo+JF+Evqr+lyw5lAl?=
 =?us-ascii?Q?kHVaxVxR4knf2lahFsG7kgFgCVz7lfU1KuALWOsaPBH1++CuiCsJbFHVfDPv?=
 =?us-ascii?Q?3yPIjNnksVht/kfTpI+8+EhxO9kliKzAiUrQDxLsX4QRQXdhX07Larw+qnrh?=
 =?us-ascii?Q?RFcyQOmVvcZfYsv4gxJUJbwBrhjRF78ZtvTEz+PheUiriqJ/RqYfeyjZaloa?=
 =?us-ascii?Q?UX5/L9e56LPl38upAI99T6o=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 14682745-fb8a-490a-ad38-08de20b9e63a
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Nov 2025 00:33:13.7894
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KpzdYoFHumZL0WIG3f7goLt+fvZeHhIsZRSBDk0K1BGrvhlrnkGE+XLW2+4Lc4u2UaGfQAo5C5gEvuHeFMj5x8n+7SJI9xDSOI/DA7A/0BHwRj+LxBND40MG1RBS6Vtz
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYYPR01MB12531

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
 sound/soc/intel/boards/sof_pcm512x.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/sound/soc/intel/boards/sof_pcm512x.c b/sound/soc/intel/boards/sof_pcm512x.c
index 2f43710c1baed..359559b6175b2 100644
--- a/sound/soc/intel/boards/sof_pcm512x.c
+++ b/sound/soc/intel/boards/sof_pcm512x.c
@@ -177,9 +177,10 @@ static const struct snd_soc_dapm_route dmic_map[] = {
 static int dmic_init(struct snd_soc_pcm_runtime *rtd)
 {
 	struct snd_soc_card *card = rtd->card;
+	struct snd_soc_dapm_context *dapm = snd_soc_card_to_dapm(card);
 	int ret;
 
-	ret = snd_soc_dapm_new_controls(&card->dapm, dmic_widgets,
+	ret = snd_soc_dapm_new_controls(dapm, dmic_widgets,
 					ARRAY_SIZE(dmic_widgets));
 	if (ret) {
 		dev_err(card->dev, "DMic widget addition failed: %d\n", ret);
@@ -187,7 +188,7 @@ static int dmic_init(struct snd_soc_pcm_runtime *rtd)
 		return ret;
 	}
 
-	ret = snd_soc_dapm_add_routes(&card->dapm, dmic_map,
+	ret = snd_soc_dapm_add_routes(dapm, dmic_map,
 				      ARRAY_SIZE(dmic_map));
 
 	if (ret)
-- 
2.43.0

