Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11010007.outbound.protection.outlook.com [52.101.228.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 919FE381E9D
	for <linux-sound@vger.kernel.org>; Tue,  4 Aug 2026 00:43:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.228.7
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785804200; cv=fail; b=awUkUrYvHJXMYWGDr+wDhUPPM6rwwH14Abz66S7bg5Z2/pK56QeUtCRBXC2pLAZqHG0H0Pm0R6Izimov0fesOwHENGqxynJWa+Qwb9K5worXQmqFmd7888j69Egs/rrxgpFM3gTzrSWqAUe5R13Ef27EyIb2WUIibdlrG4FzZLk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785804200; c=relaxed/simple;
	bh=C8N58xQXlneQcOvtO7Pz60LsAo84LuAkfBvjhhic+iE=;
	h=Message-ID:To:Cc:From:Subject:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=LOYOJntOlT+EEfNwPVO9YfFiKBUATxBTumYDF1P87UU1lfxibD7cpQhxoO8BE23FkN9gnDr8/BabRZFSzB+D1wIU2RHAnUSQVyPecttsUEHAPqFVaEtw/fvbe3LvWZdYfdsyHwyOa/lcrQ6tU1WhdzowN4wf1VbDGD7adNw8fpw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=NCsfOKZU; arc=fail smtp.client-ip=52.101.228.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="NCsfOKZU"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yg8KoZjDXtI0oCfm49F6ZOANaN1Bb1QASWbTwmxuDoln68eQ5tD/zxa9QApJxnlLPloYR7LQBC8GXvLdPn4ed/di8SB2ziMBqyoqm1Tkx8+GjevrfkzfX8stl0UCf2xkcpLQGSN+Xt8So5JnLa2wjnM3Ect4FWXrqYF5k8JkAMjxYx8BvdefHfkIVuQN4mk6o4+lDnRcRaaIYlY30K1UD6UE066Zwjn5gpjZ+3eaJLNPa3fR10OnjYGYC5QnGyr45Z4sCcyb4hpqbnQgWcclOjbgN9r3kmTWdeeJapNfrWUC+bRxZ+wOkt8U0Bm+813pheT5Qp5hGDntWo1hv98gxQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XX7pRt1nPGFk9XNGWEopWoyFaL0pHgMr65y69qPFFnE=;
 b=FMyHHBjw9eomIjz9q1PMHNYdvW9EPgUqPCKWvy9YjDF+fvJj3RlBljfZI+D2BswEC9pJVzZgieNNOJKNNFgGzP78ldAgM0hFIaM42H1gqV+fQf+j3437ffRsHlSpRLwg5PX4WPmucEYYkcGSbvLAX5La+jTEkgxcJV0LoL2tttg3dlaW9Pxmn3V04bkgHkbL7T1OCm4mo28k0dptFhuuJuqnQsPjWPIVia4XWt5n0ZRl9jR4APVRA3eIGzE1vXPigvkgpikAn2KTgYzYjYIoUjJuSl8X8UMmEqB/EEnw5btjbncfTpjb//3vTPKOnzAVY89UkJYxNA5e4u+6AISnuw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XX7pRt1nPGFk9XNGWEopWoyFaL0pHgMr65y69qPFFnE=;
 b=NCsfOKZU2bPnb5gpYkc0sRT84nRW7xDD1L0zsm63k8EvlGSEOmoiC6FXpviFik5r/ZASDcHx1lbj5BJLNvlQ8HsGF3qFO+AyS0kfrl/BmieW1n3TPSJhIJDngqQb31X7oFYxeYla5ZwkjVIt63rIQErKHyGdz0hApolItsCthTA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TY3PR01MB11797.jpnprd01.prod.outlook.com (2603:1096:400:373::8)
 by TYCPR01MB18168.jpnprd01.prod.outlook.com (2603:1096:405:3ee::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.270.18; Tue, 4 Aug
 2026 00:43:17 +0000
Received: from TY3PR01MB11797.jpnprd01.prod.outlook.com
 ([fe80::1868:c915:c230:a383]) by TY3PR01MB11797.jpnprd01.prod.outlook.com
 ([fe80::1868:c915:c230:a383%4]) with mapi id 15.21.0270.017; Tue, 4 Aug 2026
 00:43:17 +0000
Message-ID: <8733wuww9m.wl-kuninori.morimoto.gx@renesas.com>
To: Jaroslav Kysela <perex@perex.cz>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Takashi Iwai <tiwai@suse.com>
Cc: linux-sound@vger.kernel.org
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 32/44] ASoC: codecs: si476x: use .auto_selectable_formats
In-Reply-To: <87cxvyyazi.wl-kuninori.morimoto.gx@renesas.com>
References: <87cxvyyazi.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 4 Aug 2026 00:43:17 +0000
X-ClientProxiedBy: TY6P301CA0027.JPNP301.PROD.OUTLOOK.COM
 (2603:1096:405:3bf::6) To TY3PR01MB11797.jpnprd01.prod.outlook.com
 (2603:1096:400:373::8)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY3PR01MB11797:EE_|TYCPR01MB18168:EE_
X-MS-Office365-Filtering-Correlation-Id: 600f61d2-2b55-4fed-1b8b-08def1c15fea
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|376014|52116014|23010399003|11063799006|56012099006|22082099003|18002099003|10067099003|38350700014;
X-Microsoft-Antispam-Message-Info:
	iakcpAocOSw/rTEyJDyM2VoskozWWQPkdoJxnthXz0WQSRx7JINJ5GfsGTbPXqBj0wroCiZdMkjSZf3LINUTBAwRZ4cXSFRu5CS/eZRTNF7yvh4FhLKq4Eeqn8ExepDYXWiKeH1tvrAg+6fXKUthsHAfwjlZMDixDMvqUjnzSA0cw20ouIGsCh8SMJTMq9Hp+PZ9yWIfBaBWJQlzlVlhjQno5v2KQRCNabR3F7udQ3VSl12FNOEUW0DbZDjerLbXJQcThShcsWX2/iNvdLTlkF+14Xed6gD/ohCYPyu/DbCjFa481cqTxs9TayAWClrdIt4fllZoowMQT8kQhG5Zu0ihcr7GUg8I9hGxf05hSRotIF73rsTXmgzQaLgO94LHT+QJlCBQ2VoDq0nPEQEY+mrQUHeI9Yqjk4DSYivec8M1Ift8C90ff66AH6EOrvnKnnuEn64wFPO4aYh9Kk/09Z8sibmjdA2z6MsXq81nkK4G5X9EmE1Ud0Adkvnas8wGYMRGuyJMkiZwqpND7hXbIyUvqUsj0qNK3gfICLJfCP7FbiQpShxxFdYUuomTHM9tgwnBqCsrZyf9NkgeAEybo8+Or9CMMC4HYlEEymCWQaTlXhEU0ENNMytSYu/OBR5ihqVVbF48PIEd/w3XtyRZa0p7j+TksTeQxgZFPvAs4nfNl3TwoRkCo3WwjsunneUbe4bYnxxq32oh/IIUPaLeo5SyF2eAdRtKog5Xp2vP6GE=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11797.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(52116014)(23010399003)(11063799006)(56012099006)(22082099003)(18002099003)(10067099003)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?M6NV2gPD8w+ZnjwXWWe8E6F3FNRLBDuWo1yNhJAAua4PQX+BIJsQp1l7Jmd2?=
 =?us-ascii?Q?59U4qytL9/Qufpd/jKP9xuTD74Er3yw/JfNf5CxadWHa+ZplQuDwkHxKOM5u?=
 =?us-ascii?Q?oTe6LuhaiCnPUqHJNTuIhc8sF1Kuorm29QZ0df/LW/mEgjLSHh/u3Ff6VTyu?=
 =?us-ascii?Q?Xx3Mgkp+mi2FhmvC1HBfTiTtt6P3okQZCujbsCYp9f1Eq+ZGa1E142JTwoQO?=
 =?us-ascii?Q?09TGYvqehDcto1NDb4TiT47Gjw4mpN0WtPTl5PSaADVWdw+ubLp3zwjDGMZx?=
 =?us-ascii?Q?wyHh4wV77MAlXzVY+tLU4gmDKYiDRwyGwqqAtPjY06wpGWJFWoH6pP/6NXg7?=
 =?us-ascii?Q?GdDJYyl7r7//SpGEjF9PU9iG1u0+sXpnfN1D/Vjc7WZnC5zgXP4JMLr9wVuY?=
 =?us-ascii?Q?JzhoyWqxBkiVc33LVfGt/SLSsH62KbzV7+vzuwRrFluGW+Ffxc5Yp6Rftb06?=
 =?us-ascii?Q?Y/nEt14CF2yOOYjqV8G+VvkMAjJSQFl44fvCopjjzq0GmSwenCWWKpLv3Nf1?=
 =?us-ascii?Q?Xgp94L3q0hb5WuToEYfjkrqC6vXgFi7LMuz3BKL1xjdaZQI2wjbt5Z9diznW?=
 =?us-ascii?Q?KLiFso4iW5l0+ljq7jXb/S7oYVXu4iYxxmz3m5/x0McHsso1K5vTeYW+vx9r?=
 =?us-ascii?Q?b//0k7S4tlCDDtUHFW31+DELokWoYXY4Tir+1/U2XCvZbweCr9rNxqnRh5ex?=
 =?us-ascii?Q?aoKpNEfzRR3DM1ueZABl6k+2XV+mn6ZDscdlPlZhkLzWtWS0RkzkQ1pUWAh0?=
 =?us-ascii?Q?WWvncZKFQzBFggaRywENOn02RqyNgOv5+HWDf1PVMqk48ZtNLE3uiR4tzFX1?=
 =?us-ascii?Q?Zersx8XRlzgsnfB+L+fV3JYgosnigxF3HUjULt3X45CNTTnPHJilwvwzWQEg?=
 =?us-ascii?Q?1lBrtvYw+5VfxeUDquRz9sPAP54OJew5EvmVoNDHwiDwTGkpLWoeH1wmyCXS?=
 =?us-ascii?Q?sRzTj3mFvb8rXzUNZIQ3kDdCJwt1Ma/ghiCZZUPRgWUqgTS6Wyx5d/TiQ5XX?=
 =?us-ascii?Q?Z0ZnJwvgmzI68dTr/Ai37IeZm75tUsgHj64wUpeu9QBfSHT/vlWK9Z8Krsvk?=
 =?us-ascii?Q?dzQEyiSR3N+KoPE7RqymS7XOTs79E3fdf7o7DKeicn/zjoUpHS0ZeLBBOwjj?=
 =?us-ascii?Q?IvafiAzNizVIpGG9n6G98fH7tsygpKNnQEVQweeYju/JojM93YUwN8CRexR4?=
 =?us-ascii?Q?a2F63AmgAW1vxqFbldpx49M2rEfJEQ/czHTt4hMuRbk4Btl4qzb0mABECkUd?=
 =?us-ascii?Q?josBmJpAHsyG1SgjoYLhctUSZt39D61Ui4PL1C0FZn9QZU5mkbM0sLu8d+Fg?=
 =?us-ascii?Q?tmvml4nbvnYG/oMDsaL6ZlvIBskYaE54IH5a6Bkl/VuclS/6e0G1JVZ7/RUu?=
 =?us-ascii?Q?xp6JDC+Iu/4P+GURp8w17IKe4A0XL69dUbXGXPDQ7CFP7QYVt4WvYxYnygL2?=
 =?us-ascii?Q?RHEnS7rNKNmd2ZjI7Ac1lk/BdXszR9gu8fjgali7bcedCIZSHgj7Pzxb3eC0?=
 =?us-ascii?Q?0wu5kYgeNmuKzFaIQHp6kxNbRW3JBEWMCVi7oYE2Wan5ovQDXTN7lJBbT5yl?=
 =?us-ascii?Q?8Bi81rG9l7gF+jQJr51F2U29rQVkO0U5sgSjK4Ri2PtHLqxriEn89sW1n9Wk?=
 =?us-ascii?Q?ZGWDOxu5Ol07qOi33WqLrWoM9wZukjUA/hdpyjA2WcTtIE4iBpdVJBsJeagY?=
 =?us-ascii?Q?QNH0YJsl5092ywVsag/UsgpipNSYj7LyF/hyedAGfrl8Wu+jo0NmxkmvXGlL?=
 =?us-ascii?Q?N3bZkge0FZv4OU2pebFz+/ZF9qDF0DQ=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 600f61d2-2b55-4fed-1b8b-08def1c15fea
X-MS-Exchange-CrossTenant-AuthSource: TY3PR01MB11797.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Aug 2026 00:43:17.4515
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yKLR5HDogG3GpPN6VtwgHXIcldDVo7BEAdgyLvtjy96Ddj9o4NmdH6n45oNIigakpDXBrZMg/CM9APVp8hQyIXhnf6YsSn9DrisAzQqt3vdQEoljLlqGc2uSkPgffIW2
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB18168

We can use .auto_selectable_formats. Let's adds it.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/codecs/si476x.c | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/sound/soc/codecs/si476x.c b/sound/soc/codecs/si476x.c
index d87141ba84388..104ec24abbeb3 100644
--- a/sound/soc/codecs/si476x.c
+++ b/sound/soc/codecs/si476x.c
@@ -199,9 +199,27 @@ static int si476x_codec_hw_params(struct snd_pcm_substream *substream,
 	return err;
 }
 
+static const u64 ssm3515_selectable_formats[] = {
+	/* Hi Priority */
+	SND_SOC_POSSIBLE_DAIFMT_I2S	|
+	SND_SOC_POSSIBLE_DAIFMT_RIGHT_J	|
+	SND_SOC_POSSIBLE_DAIFMT_LEFT_J	|
+	SND_SOC_POSSIBLE_DAIFMT_NB_NF	|
+	SND_SOC_POSSIBLE_DAIFMT_NB_IF	|
+	SND_SOC_POSSIBLE_DAIFMT_IB_NF	|
+	SND_SOC_POSSIBLE_DAIFMT_IB_IF,
+	/* Low Priority */
+	SND_SOC_POSSIBLE_DAIFMT_DSP_A	|
+	SND_SOC_POSSIBLE_DAIFMT_DSP_B	|
+	SND_SOC_POSSIBLE_DAIFMT_NB_NF	|
+	SND_SOC_POSSIBLE_DAIFMT_IB_NF,
+};
+
 static const struct snd_soc_dai_ops si476x_dai_ops = {
 	.hw_params	= si476x_codec_hw_params,
 	.set_fmt	= si476x_codec_set_dai_fmt,
+	.auto_selectable_formats	= ssm3515_selectable_formats,
+	.num_auto_selectable_formats	= ARRAY_SIZE(ssm3515_selectable_formats),
 };
 
 static struct snd_soc_dai_driver si476x_dai = {
-- 
2.53.0

