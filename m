Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazon11010027.outbound.protection.outlook.com [52.101.229.27])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7127320459A
	for <linux-sound@vger.kernel.org>; Tue, 11 Nov 2025 00:32:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.229.27
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762821159; cv=fail; b=QH5H7ibvCfQVf/ShrD6axQEwUny3KMrbGsCY5LyIBlHxB1HpLXnH6AqbRb42Jz6Mlfh4vZIORStpJkBVYVW45GfUPxhabxMJofzYLKdp1VNGLQqYe1puyEwomRhAh5BN99PYvtM5UXkkrVxRNPV65vl7iOcVN1ZWFd/4VVccPXw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762821159; c=relaxed/simple;
	bh=bX6XOdrTTKURamkox8glGdrT9aJmM/UA7A8X9XL3/oY=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=pamaMrX24GVXzeljKHzMW/GX8xzdhhnSbBUFTaTmNwqIKzE19IF1OdSAPN4vnkbkKSF5B+jCeuZDPSLsQCqJ6B5pMHDaVibvUipcbOBEfQdC27YtNM/rrcLNuEp3R+eB+LOLQ12j5pQ40sZTh7OfxFKDRmFu+Q7uItaXLLCO8KQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=Y7/nAr99; arc=fail smtp.client-ip=52.101.229.27
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="Y7/nAr99"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Kitp2Zm9i6gdqjkcKju0gUCzhOjc547xetb11dqlHQPWOd2M2QLKNwUZQEq1KlGEhDqJaYY0IIJ41JukEXE+JTXVjg66jJVxUQ0wRWSzkH988H9FIlEO6lmtpuVBfDQWTKUL9r3SasQte9nzwW+kdw7WqFFWmun+TtWqyxY1uiMDKQn/dWbxgbWI7eMDLAajCYjGEC7iQGZhScw+NkE28gDbkEu3vWu4nU/LsZfYGJ0WF2V9Hyb3ZiY+DBZ2AI+PS8ML0ifN86cSeZitStxJlhi0skphnuyn5khQa86+JzfCgYxyRa94MWNIdjrhaXSA0CDttbl78vJFJD3957YqqA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vRRpOjig0wkxd+sOMbVH47YpiNOhEeY9SHbi6WQT1PQ=;
 b=NAqCkK5UVXDhBlNNritGU3rKL8ti+XXw+RD+epsfzEoHoJKnHY1n0EwfgDWeY9t09ma4N7gu6H4XuPbUEEEr2dVLMl+Q8eOFz4Dt53HSTQfSCUqs4nFcTTgKS18ArX/ZEYdKpSKEixhLq9ligjN9ZtX9Ul1RCViV15v6OelSkpaB8mMgsIgCT3kCcxGp0wztw/1S4XbfLOxqpdgwTwlAtqEoXq4nLPdwJVv+30t9EpHy81tpQZBWuAqqu09APwPHXYzxX8SRCWHvCkqryhDITOjzdTLi5oQ03I0sRuLOaIwjZfOOSjjFyySxPa1s211NbNA0zKZrWAzTQ+Jk5fRzhw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vRRpOjig0wkxd+sOMbVH47YpiNOhEeY9SHbi6WQT1PQ=;
 b=Y7/nAr99koeR5xwlZMTc7+fwXs/gooyKEgRLOh9COeRJlxnNfRGrnDIX8jTpMBhOEEzXCG7RjG3Tnuf2Nv48uhaLPioJAp/fZdwjd3MfAJVWeY4GhJMikPujy3V8oy+iwmCH1ax6cw1I8iNVPwH6NBPIa7Gt+LKr6ZZ5UC2E5F4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TY3PR01MB9810.jpnprd01.prod.outlook.com
 (2603:1096:400:222::8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.15; Tue, 11 Nov
 2025 00:32:35 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%3]) with mapi id 15.20.9320.013; Tue, 11 Nov 2025
 00:32:35 +0000
Message-ID: <87seelwgrh.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 213/292] ASoC: intel: boards: cht_bsw_max98090_ti: convert to snd_soc_dapm_xxx()
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <87cy5pa0ea.wl-kuninori.morimoto.gx@renesas.com>
References: <87cy5pa0ea.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 11 Nov 2025 00:32:35 +0000
X-ClientProxiedBy: TY4P286CA0104.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:405:380::17) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TY3PR01MB9810:EE_
X-MS-Office365-Filtering-Correlation-Id: c188c869-1c52-44f8-f856-08de20b9cf3c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|376014|1800799024|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?YgyqcUUOvG3fWK8173YpqH2M2wHQ7ZS0c2icmnv+9X5efEz7H0OHd086BMVD?=
 =?us-ascii?Q?l0/Fy/Rtycx/a5ijIfMUbiYalXNND9o/x4+zgSA2EGI5TLzbEXKWqHe7RE0T?=
 =?us-ascii?Q?7sl3VdUfrRSIpm1ngjX1JLsP5OdZPjL8YeEJdoF10on2FmnLVIKTGMK3MDBI?=
 =?us-ascii?Q?ioIZpJIc7rELYXtBHiKGBH337Bq3HsJD5EKuTPlAz+fyfZ5k0tjRN5yjMA4e?=
 =?us-ascii?Q?e/oJjkVEtQvwnsA2NnrJrLhPA++LqSVGM3xr63ovxuTJYXr5U3EN39dIs2uW?=
 =?us-ascii?Q?SITr3NNUY7NF9DlpGJlzjw8NIosvJkxVQm3/VbTbaQBemPiR5YsbLpNZUYtj?=
 =?us-ascii?Q?mX0e7gpBz9i0Ev+FVe6zwnNLHLGIPjoC2jWqfuztmXQlxBe1eDVo+Aa+4pdN?=
 =?us-ascii?Q?Gtd4fhF6+1VeTfR2/XEmrgK8rVMmiNzcGaR5aQF2WgtJUKDIchAj5oYBoqhT?=
 =?us-ascii?Q?FoUXDFpdVt4vKhUtLDMzlv8galwwUfQRly4PUT+haRLZjWRT3E7XrjKH5a07?=
 =?us-ascii?Q?bqvyEqc4UYR8iqJ6WuG5hhrMorMKUmFYbjdYXzX58kYENljprvMJejJPuhN7?=
 =?us-ascii?Q?5JuFQA83QQdJiy/ffSzepqHJlPPrtpQI0RWWWlzMmG2NlYI0CYXeRv7FVZLj?=
 =?us-ascii?Q?DElCGfp+FK3kcsaAJE6ajVTtWvae4/wRJSETGGSAwaj2QwLaeiZm9iuqLZzV?=
 =?us-ascii?Q?rXOS8cGcgEcAyLDBnahbhvC6Qn73KWt7jiyZ/kMwl5JHxMR0iQ9hdjEdelU3?=
 =?us-ascii?Q?syCmY0e/okqaL5Ims2gEjjYFlDonEaHoWX5CMMPKPJ4kHyVVhWpRULbbjKQq?=
 =?us-ascii?Q?DAMl4IbbjOENkhWmzf08NN9tEHwuRCqhoKKb9gs1rHtQk/Oy5oanKd/ejz4d?=
 =?us-ascii?Q?1DMbT5ngboyzmQLzVRp0701fUBnl9l7+X2qYnREfJ0LlYNSxe5S0OU10CBsq?=
 =?us-ascii?Q?aVlSqbhADqctHt+wqr1mwLqtsFcB7F1ORbbIOd0xlCAf5cwquYSkGjhnjL0y?=
 =?us-ascii?Q?WxJgHiAWwh/6XCMOvSGZgGTIIbxWnIqLddl/EFx7Y15AH0GBr4PJ1Gi4TUQj?=
 =?us-ascii?Q?1PEbPR2FM7PfajfKdPzUGuO0DPK7vo2zYWCuUKGgzEO690QjUMU7nSI14g4J?=
 =?us-ascii?Q?izdvhWcdrlQVzLt/ToNwDjX8D8FuT3uYkA24ENePIw+mNkvBsyndmIL8bD0o?=
 =?us-ascii?Q?hhSbOz/DlJS7LH0reFIgBP5cDKCRcMQkiCOsUnCB+iusx1K8LMutHTyMYiju?=
 =?us-ascii?Q?w4zPNIWsgPsYOgGl3Rp4woae7bajMXhheseb8OKvYk1cpunkQ/8DEqdryGYH?=
 =?us-ascii?Q?JRZVcVCxUSDXs/zzAypw/3FJPgU9VW89hJUtgD9zyXkAA/iDGzWeY7Isrbda?=
 =?us-ascii?Q?+ez6MJI+zjyxjr29x5+AUFkzmvrqYsAnm+NYX0bPZ1hUEKXTppkvDKCdkA//?=
 =?us-ascii?Q?zOJc8XyKDkSQQ6ifkcYieDAwMCOCMaaF5D3ZdpxjUpP8oHSQ2x17pfzJcxNX?=
 =?us-ascii?Q?khvqyECvby9dXyIWm3BxMXYG8DdLZiTlM2BQ?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(1800799024)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?zjIg4XK3NjuRvYAP0Gy4Jq1A7anE7493/PEhpYgU+S1EglRYYOLi1SP8e+sS?=
 =?us-ascii?Q?Ifle7hFHG5zS/kyU9884rQKQ37onnLmDS+7LF6118Kl57OvwfCHlS/77fiZ1?=
 =?us-ascii?Q?CeHa1XJ3TGUDwC7OlBs7MCONNqYSX8ML2thb8L9pXtkYrGZV435cy5G2KtlL?=
 =?us-ascii?Q?J50AH0xRk/W/iezBnMYKTwkbaysg36WY0eVbmSbsnW+9ZryXUvvhoppN6oZK?=
 =?us-ascii?Q?aZF+/CqwoUHhJoA1Dw2GknVRRssI7NsANurINR/8qlYd2mLDNZzh2Eo74lyY?=
 =?us-ascii?Q?U8/5hpGenQxO8y4yOL/Lv5SOsOrTi3ym7SwOz8eiyA73Tt/rl7EJPkTTDJMd?=
 =?us-ascii?Q?5pufs8s7RP7g+VBV0EtlB7fVurfTowLAharGS8y4yYmO3Pedr4Dk7GbCmD8L?=
 =?us-ascii?Q?KlK4LPgbQcW5NDiouM4R4SaHeoON48kOqqEyIBGDzLj79rHhTjt33ciooxFu?=
 =?us-ascii?Q?rcAxK+i2WqW2zMG5U1QofssJjzpcRMHYGyNwO44gUxikDo+8zTRp+ChEfVL1?=
 =?us-ascii?Q?onsmS4u5TZFmy5OwbEv7YWlictXW4ApU5jTo4xn0eULOHMtKIJdr4ZUd5OgF?=
 =?us-ascii?Q?qbS4ykHGhvrRVTN54KvlEHq1ga2az+ML+u7XGD134Fzcnj/VvjyY7lwtNWx2?=
 =?us-ascii?Q?PgvQJ4BmC7UE4r1Vu7aQ3sMSu2Bhp11TqRqGtnvGRLaEwaIazNEG5k6GIsTS?=
 =?us-ascii?Q?Vp7c6BBdVETYwNsB30bxs7KSMlkYGdZu3OzWnhl6idJMqMszjTfIy/nNnfMz?=
 =?us-ascii?Q?47QGNdbcGkzqszFO8g/y+kYd0hbMJaOFuf4lypr81c0htXkIe25EvYlm7SG3?=
 =?us-ascii?Q?o0ZM6Qax3c1LvA+tAPl3j5UU8YCzBKWTfOf1PfCIbpo1XGHaZHgeWAd3Wi3F?=
 =?us-ascii?Q?j+t/hkai2IRHuihyvxubHIkbTghUWxQly66czvSy90z9DHsvMTys7yCrMoR+?=
 =?us-ascii?Q?qb+LV63INrtwJfdTLzTtN5J2dQAKWeR+SFZcgw46THS3x0MWOAR7rD0iZxx3?=
 =?us-ascii?Q?GdMpaudMEmqVoMvJMaMn7NMIXp43GbKPaO6DPo2X0GvTaqjCFhOja8U86Zyl?=
 =?us-ascii?Q?t/Qp0vmHWNK5sj2zIZgsnAcv862HnXU9SYATzmnLRbzEtbSe8fLZoVwUyZrf?=
 =?us-ascii?Q?AIBxaqS6l8JU+ay5gNycp94psXFR3ramvpEGckDExsAz2GxXw7QqPmfSew/P?=
 =?us-ascii?Q?363mL6SV7Xicp4ApuKwnc7/YAHMnuTHWUe6oS2P+/21ZrZLHOEj8fPeVxvIO?=
 =?us-ascii?Q?WdIyqtmAbsGaUvsb68LOpBWSxTJHb2DpE8m92xipLnIgOdLY+u2+rl6C25im?=
 =?us-ascii?Q?CMwXCKO0ItLqqJSiPTTY+vRJJKtXV0SBJuf265/w1p2am2tTg7Ji/sXDs9+t?=
 =?us-ascii?Q?lWu0Z+HIyr5afxptAtiBDowNy4ImSUG6rAf7PJY7azfKqAkl1kMERg/V7Oj5?=
 =?us-ascii?Q?2Rtwg3eYDVc2FFx21SQq4SF1VN4083e1RWYwWkWAnCC80S8HvrOp4dfSOWPL?=
 =?us-ascii?Q?McS3GG7pHap+67ZSMuvhekYbcMf4QCvRUHZ4X8YRqQ0NhIs+t50zMP9iSlch?=
 =?us-ascii?Q?KELfks+oXjL3PUR6L2YAtaA2L6m9jMMVlXckvaenIt51qrJvRQ4FLVGQtm6i?=
 =?us-ascii?Q?rfuf5jhtdmNJBXj4ZO4flCo=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c188c869-1c52-44f8-f856-08de20b9cf3c
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Nov 2025 00:32:35.1942
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PwxZivUUCNS05b7+Pd6ckmWoRhSP8vogtDhPQ3rF5dqp5Mdb5GneKmaAGAu4+zfdrquq3MGHxlrWR98wBMSwAwtRmF/wbseUeK3nJGuU8m8HGgngaR9Iowal3b1VJ84Y
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY3PR01MB9810

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
 sound/soc/intel/boards/cht_bsw_max98090_ti.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/sound/soc/intel/boards/cht_bsw_max98090_ti.c b/sound/soc/intel/boards/cht_bsw_max98090_ti.c
index 36984de8a0679..ad45b79d3e4b8 100644
--- a/sound/soc/intel/boards/cht_bsw_max98090_ti.c
+++ b/sound/soc/intel/boards/cht_bsw_max98090_ti.c
@@ -42,8 +42,7 @@ struct cht_mc_private {
 static int platform_clock_control(struct snd_soc_dapm_widget *w,
 					  struct snd_kcontrol *k, int  event)
 {
-	struct snd_soc_dapm_context *dapm = w->dapm;
-	struct snd_soc_card *card = dapm->card;
+	struct snd_soc_card *card = snd_soc_dapm_to_card(w->dapm);
 	struct snd_soc_dai *codec_dai;
 	struct cht_mc_private *ctx = snd_soc_card_get_drvdata(card);
 	int ret;
@@ -130,7 +129,7 @@ static int cht_ti_jack_event(struct notifier_block *nb,
 		unsigned long event, void *data)
 {
 	struct snd_soc_jack *jack = (struct snd_soc_jack *)data;
-	struct snd_soc_dapm_context *dapm = &jack->card->dapm;
+	struct snd_soc_dapm_context *dapm = snd_soc_card_to_dapm(jack->card);
 
 	if (event & SND_JACK_MICROPHONE) {
 		snd_soc_dapm_force_enable_pin(dapm, "SHDN");
-- 
2.43.0

