Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazon11010018.outbound.protection.outlook.com [52.101.229.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3AB481ACD
	for <linux-sound@vger.kernel.org>; Thu,  3 Sep 2026 01:13:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.229.18
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788398023; cv=fail; b=KHqg19kBivipxSS4chiJb+uFnWrBJ/ryrQTQmFXRP937H1bhiBgrZQz0TzbSj22CvgOO3ggTHjPmvuUx5SL4iFzyBf7Kcjp8HudaXMAOi9WMDzZB47B8PiZbcbzL0qgN9pMqqzf4DD+ozY4SvQuO8LinFTcYiqINxrBMiaops04=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788398023; c=relaxed/simple;
	bh=ETK7c++2TdV/B4ASFgg1E805qyVUXAyxteYMXtHY3NE=;
	h=Message-ID:To:Cc:From:Subject:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=tVPwSDMcdzpCtMrZMnwP7ICL7ZUlf0I9tR8QqA6Fn6u0DdWXToNQ1yo7RMewDynSnquwxT+VzY0lS71vcNPDUx85TlcVCGMdeUzrQ0hDBIukBeXXv4ekn9OUSfSawyxq4ojDWr2DtocKktB8Mwkc1sM5SJev1KqrCsebQoZRM9k=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=i1whbG87; arc=fail smtp.client-ip=52.101.229.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="i1whbG87"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=isOKmpnCQK7qBW9qsq8ymK5QJsMGKY91kTD5iX7TzU16cLNhOOOPiXUcToD6ShtrGAxOTTONXOAVXg5UNs3zAa7PJMQPgMBX+ti+lWKzo/K4pHW6hfh6qfmLjhmvicS3XKtewOZHp02gQ4/vGDVms07Yf9k+BanJUPA5TfmARx4wD1ijb+3+TJY+a7kzDySHdF6yzyCxLH2r1RCGDhwYUTBNBQZjPwVSUZr4sGYqveFFp1Xm91XXwqKOplADoLng/EePF7re+H/P08vfd3LNe0zmsvcKsAxTZn41Cd1kDusBvWyKgRpDMM5cLAm4QVh100/KAJcTlkafjdMirGx7PQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/ttx7GcRGjf5V3/71GRFj+VLcqect6gxn6wRiJEseUI=;
 b=gx3XC5X0J5+CootsmNqgs3p4PAXHJUvrwdHfq5Ut+18f8mYtSqKeALD07/AkFepqBl2Z0ZEM9thIG3MHCrykeooXS9RCJ1HTX6qcmSNioQNcpP6zNn4MIEeSPwTZ6ksuaZ2HTvTk/jHSqNYHp1hXkLE8yhiqn2eqcYgOHG3I58vZ0e3/agFvSVH6GCmR6rUIo4wVPb1JRi5T1NBrVN1OMhoFx7fBNetPv6m1/ilMuewa1N/hme8Ekrpa1TEx9bshQo1H9YM6NHpAa389nJhVfHriRFnm6pcFDForAzyvgSAgM6a573RD6K6e7dV5R5OQzp8sOT9mTP4deEpjkQ7THA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/ttx7GcRGjf5V3/71GRFj+VLcqect6gxn6wRiJEseUI=;
 b=i1whbG87XGRMMwN4TxbywNLxfZfNu9brqo2asia/oGM61XU3liAhQvb6SC+hYA8RUZX2s+Gakh0EGT3QvfmEVNWk1rKJBX+3PPZLTc37hL6xJsg59KUefN3nju2bhmHI2udTwrBbm+wk+wD4kXgojG+L3WZDNakcKnDXSeYmB1o=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYRPR01MB16474.jpnprd01.prod.outlook.com
 (2603:1096:405:2ee::10) by TY4PR01MB17164.jpnprd01.prod.outlook.com
 (2603:1096:405:367::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.13; Thu, 3 Sep
 2026 01:13:36 +0000
Received: from TYRPR01MB16474.jpnprd01.prod.outlook.com
 ([fe80::2a39:9988:dbe9:894b]) by TYRPR01MB16474.jpnprd01.prod.outlook.com
 ([fe80::2a39:9988:dbe9:894b%6]) with mapi id 15.21.0360.008; Thu, 3 Sep 2026
 01:13:36 +0000
Message-ID: <87wlt3yw5b.wl-kuninori.morimoto.gx@renesas.com>
To: Fabio Estevam <festevam@gmail.com>, Jaroslav Kysela <perex@perex.cz>, "J.M.B. Downing" <jonathan.downing@nautel.com>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Nicolin Chen <nicoleotsuka@gmail.com>, Piotr Wojtaszczyk <piotr.wojtaszczyk@timesys.com>, Shengjiu Wang <shengjiu.wang@gmail.com>, Takashi Iwai <tiwai@suse.com>, Vladimir Zapolskiy <vz@mleia.com>, Xiubo Li <Xiubo.Lee@gmail.com>
Cc: linux-sound@vger.kernel.org
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 02/21] ASoC: fsl: use .auto_selectable_formats
In-Reply-To: <87zexzyw5v.wl-kuninori.morimoto.gx@renesas.com>
References: <87zexzyw5v.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Thu, 3 Sep 2026 01:13:36 +0000
X-ClientProxiedBy: TY6P301CA0028.JPNP301.PROD.OUTLOOK.COM
 (2603:1096:405:3bf::18) To TYRPR01MB16474.jpnprd01.prod.outlook.com
 (2603:1096:405:2ee::10)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYRPR01MB16474:EE_|TY4PR01MB17164:EE_
X-MS-Office365-Filtering-Correlation-Id: 12ed4728-e678-4d34-3985-08df09589490
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|7416014|52116014|376014|23010399003|366016|921020|38350700014|6133799003|56012099006|10067099003|18002099003|22082099003|11063799006;
X-Microsoft-Antispam-Message-Info:
	eAfgoc5nm6WDbYl+YGFvxgTJd6ch3QRtYTRS/+CIRabUeClq3xEBiLzGHh2TFtU0LreluUCQ2qY3UReu2GX4vDYQTkv0FbsN+zstqFfzb/43lWx6+CTmgH1CvX/Aoo6yX4k29tLyXd1rJvrmmhMINgcuf2PzwgVHeOgUcUrNtSxz11ZtIbwzd1fkE+YLDfq9+sC5vwE6u1S4/Ag4SodEZMShpPnM0InjycR5JfdPz2GF4A1fC1u1h33G8UPiOlOYHqf0mw0HuZb3+pzNveQBOOQvwlbT+BLdv1RbbexWANo6l3b37Rm3zSNXteH8VYPbJdeL8eJ0bTlgf+ROEZTz256gXC4KuBD0HJuSpDnS9uoOZYGp7wDwr6FLQi5jgbYMUYhJthWHBCI+Uuos2ofxk2rFPoqkf/AXQapwRINeF0btbwN7fYpfp9eJVPjbL3cFdF4v2KRqJSZvlTBWjoNTmOdYMD0bu3RyUTsyszXinwTWv9Sc5j8uaoFZ0F4mwmaXia0gmNuV9ku6rbnDxzDMfmjG/m9w0ZKl0B7IbBJCBtXfRiNp8KFbBYOlU2Jz6nMq9ITeL+E0ZaznjzYtjYsHIYFR79ghG+LGgPVqk1bjWNkw8jzqwaXSdTLxV2fYmKLqUz3ocnJec5afVMDv6OCyuawK2xUphSwmblGwV+HvoyxKn7XKEjLiltYJ0ywbgv8BkAPM0rY5iOei+3/wurOSuD6FicxMZqJD3cF4cHSaXOE7WmbVlD+D+7lqEK2MGXdR
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYRPR01MB16474.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(52116014)(376014)(23010399003)(366016)(921020)(38350700014)(6133799003)(56012099006)(10067099003)(18002099003)(22082099003)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?scCgXhvD3uR2hgSdUtuMMPJaidaLGCJ7f7nD8gnOpm8ETpXaP6/tI0Nhr30p?=
 =?us-ascii?Q?j0QSgoDJNr9I2j5ltdPi9vHbIY0qGmvSjXW3SYoBOZocWfRmjgli7q9HD7Ms?=
 =?us-ascii?Q?e7i2fedBbp1YykWebJF0xaqnSMXlTO1NBMT8zW0Wkg/9yVbZesYkTneX9dMA?=
 =?us-ascii?Q?WfooBPyaQzKUV7HF1IOcoou8w+CSrZ+wWF3uQxT7qAMzflmCLTl12WTzOqrZ?=
 =?us-ascii?Q?cp9yYSEjKgw/EyjGdrPbcKtfZSvLdDFKY5NWpGzxtpigruW/EFHd5DDTl26x?=
 =?us-ascii?Q?S9JO23JMLG/3llmcPYLpsw2vq6C0Q91C5hHPN513KImvOkl9iWvX6iJJKo+1?=
 =?us-ascii?Q?rks//ieCb1Zcv8QD/5Ovn8YI/EPHwZOfU3nOXBMByO3+ajsaBfFJ3ARykRNo?=
 =?us-ascii?Q?FXoK3TVsu75loChFm1bqdRTqqbk5795pQt6PsSRdcItk9sm6xc8oJWguebSC?=
 =?us-ascii?Q?5jMblQzwU04D4yJ+FDQPmFnb36UHRrmfmFOrovv4pvYzRthkIy2MHzrmAdE0?=
 =?us-ascii?Q?HaiDhxmtOyYuPiXpXTRB5iYUwBAqgmp71eiCS930Lu9ku9z+EeP2F+tiaFOg?=
 =?us-ascii?Q?eOk+aKLlp12uprMIlXL6FaqskWtfylYxdfC64Mkp5reKyx0tdlLjj/iwGkje?=
 =?us-ascii?Q?/j6nDczGMvzbuF6y6vgFItjnEeKBDqIFqvbef3wc2uRqOLqs9Ybih0ul4N1R?=
 =?us-ascii?Q?X+CsuPlYbehTFDVZRNAkxEVwrhaOiy/cJ0khpwH9p9orMoSzVk6ewonnLTv3?=
 =?us-ascii?Q?DbwXw5gbAb5m2DxSbQOIhAZNwfDoSLRoQwAvvnEkm5WPzbt8naqsVEuWJduW?=
 =?us-ascii?Q?9JEO5/v5TbBfe9cYfe+7p8arhjYxmiN8TZgBJuZMG4z85g2Cf+DxKgw73Khj?=
 =?us-ascii?Q?h6HFkR9bbJxiOQyNmM8Kqzd2lXoOPOqr7sGk21QvqaGRiE+5hnX1DZ7SICPV?=
 =?us-ascii?Q?4q7LUlYyZkyVUoXQlXpr5F52CBZr/wiZM5qpgnPRf+4OFQYU+KFvsp4BfDd4?=
 =?us-ascii?Q?GGJsMc3yHTZan9bR/I/F0NAHRTYWbVpQKXBwfssD0kwylleQWvxeJPTFgp1R?=
 =?us-ascii?Q?LIpbKHe3HuXNp2cT15Ko/NLTV12zTXI5HYR08+Np2iPD0J+pnExUg1Hgsczs?=
 =?us-ascii?Q?wOqb9o8idVykMJQnrDlI2h38GaqipLlsttpcMWFAqymEATbhY9BUA/XxCJBV?=
 =?us-ascii?Q?9LjQ600Mlv0RUpopRYyv/cs4xFdfGeAXQcZv/EBuafBkmO+lpDQU3thDliC3?=
 =?us-ascii?Q?kVKRlBMlrQMuvQelQ1QEfxMO5JnjmhpNrT4fJhMpMHh/SDJtVKIKBiZahQX2?=
 =?us-ascii?Q?BOYK2Q1Rqxmzv/kZfOf8JBpCypuJMi9VJBxTo6Cj8pbqpkMq0izIhq2YAo/f?=
 =?us-ascii?Q?UTXyP/TlGEzSAuis+AqR4aubqlkg1o/Y67+t+/WBHf+hzoWRdwQdfKl0epQ5?=
 =?us-ascii?Q?uS4LKg06tOEhBTifj34q65sJ48CzaZp7BJA4wsxVXBpeW5Anrd/JYEveelwv?=
 =?us-ascii?Q?FcdU76wwh7h9f7F2mQXSQU0eovLUqcHdRsUOF9KxFAsdQKXoTAblZfhCXyc2?=
 =?us-ascii?Q?ofcSxGQ7FXiCowe6h2xoa5mYpUeNrF3ArW6nL847ahEd46/d76srpau2SkTf?=
 =?us-ascii?Q?zOSZ3Ucwxn1x+iiaxFg66WTNmQ3V0D4ueDhb9duiRJaRo+ZCTxhwaaRRG+3C?=
 =?us-ascii?Q?y1m4HUc+qhRHi2WBVcwV8j31kz0LQF1SwWyWk9Q8VYpikMIiX8HAYC27e875?=
 =?us-ascii?Q?4Mu/UA4FsVJ7Q2TmnMI8ITXXihsBBeoKnQi+ZkS1ABzYI+leeRZ9?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 12ed4728-e678-4d34-3985-08df09589490
X-MS-Exchange-CrossTenant-AuthSource: TYRPR01MB16474.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Sep 2026 01:13:36.5271
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rpVWKLZCiEinbPsOqKoCE+Rzd0og47X2DvBqUOzY0QchkbU5VK7RqCFatcjzLFmlmykErHsTCLXr+/eUSLLBefH1j3vadVKMLsbK3kCWJ3S24igRk+KMnEkiWIOe9hjv
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY4PR01MB17164

We can use .auto_selectable_formats. Let's adds it.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/fsl/fsl_audmix.c      |  7 +++++++
 sound/soc/fsl/fsl_esai.c        | 13 +++++++++++++
 sound/soc/fsl/fsl_mqs.c         |  6 ++++++
 sound/soc/fsl/fsl_sai.c         | 17 +++++++++++++++++
 sound/soc/fsl/fsl_ssi.c         | 13 +++++++++++++
 sound/soc/fsl/lpc3xxx-i2s.c     |  4 ++++
 sound/soc/fsl/mpc5200_psc_i2s.c |  4 ++++
 7 files changed, 64 insertions(+)

diff --git a/sound/soc/fsl/fsl_audmix.c b/sound/soc/fsl/fsl_audmix.c
index d4140e170edf8..b66a5669a3cbf 100644
--- a/sound/soc/fsl/fsl_audmix.c
+++ b/sound/soc/fsl/fsl_audmix.c
@@ -311,9 +311,16 @@ static int fsl_audmix_dai_trigger(struct snd_pcm_substream *substream, int cmd,
 	return 0;
 }
 
+static const u64 fsl_audmix_selectable_formats =
+	SND_SOC_POSSIBLE_DAIFMT_DSP_A	|
+	SND_SOC_POSSIBLE_DAIFMT_NB_NF	|
+	SND_SOC_POSSIBLE_DAIFMT_IB_NF;
+
 static const struct snd_soc_dai_ops fsl_audmix_dai_ops = {
 	.set_fmt  = fsl_audmix_dai_set_fmt,
 	.trigger      = fsl_audmix_dai_trigger,
+	.auto_selectable_formats = &fsl_audmix_selectable_formats,
+	.num_auto_selectable_formats = 1,
 };
 
 static struct snd_soc_dai_driver fsl_audmix_dai[] = {
diff --git a/sound/soc/fsl/fsl_esai.c b/sound/soc/fsl/fsl_esai.c
index 4a530a6c33f07..e49386f8d7d33 100644
--- a/sound/soc/fsl/fsl_esai.c
+++ b/sound/soc/fsl/fsl_esai.c
@@ -789,6 +789,17 @@ static int fsl_esai_dai_probe(struct snd_soc_dai *dai)
 	return 0;
 }
 
+static const u64 fsl_esai_selectable_formats =
+	SND_SOC_POSSIBLE_DAIFMT_I2S	|
+	SND_SOC_POSSIBLE_DAIFMT_RIGHT_J	|
+	SND_SOC_POSSIBLE_DAIFMT_LEFT_J	|
+	SND_SOC_POSSIBLE_DAIFMT_DSP_A	|
+	SND_SOC_POSSIBLE_DAIFMT_DSP_B	|
+	SND_SOC_POSSIBLE_DAIFMT_NB_NF	|
+	SND_SOC_POSSIBLE_DAIFMT_NB_IF	|
+	SND_SOC_POSSIBLE_DAIFMT_IB_NF	|
+	SND_SOC_POSSIBLE_DAIFMT_IB_IF;
+
 static const struct snd_soc_dai_ops fsl_esai_dai_ops = {
 	.probe		= fsl_esai_dai_probe,
 	.startup	= fsl_esai_startup,
@@ -797,6 +808,8 @@ static const struct snd_soc_dai_ops fsl_esai_dai_ops = {
 	.set_sysclk	= fsl_esai_set_dai_sysclk,
 	.set_fmt	= fsl_esai_set_dai_fmt,
 	.set_tdm_slot	= fsl_esai_set_dai_tdm_slot,
+	.auto_selectable_formats	= &fsl_esai_selectable_formats,
+	.num_auto_selectable_formats	= 1,
 };
 
 static struct snd_soc_dai_driver fsl_esai_dai = {
diff --git a/sound/soc/fsl/fsl_mqs.c b/sound/soc/fsl/fsl_mqs.c
index 901f840df9047..39129f970c3f5 100644
--- a/sound/soc/fsl/fsl_mqs.c
+++ b/sound/soc/fsl/fsl_mqs.c
@@ -187,11 +187,17 @@ static const struct snd_soc_component_driver soc_codec_fsl_mqs = {
 	.idle_bias_on = 1,
 };
 
+static const u64 fsl_selectable_formats =
+	SND_SOC_POSSIBLE_DAIFMT_LEFT_J	|
+	SND_SOC_POSSIBLE_DAIFMT_NB_NF;
+
 static const struct snd_soc_dai_ops fsl_mqs_dai_ops = {
 	.startup = fsl_mqs_startup,
 	.shutdown = fsl_mqs_shutdown,
 	.hw_params = fsl_mqs_hw_params,
 	.set_fmt = fsl_mqs_set_dai_fmt,
+	.auto_selectable_formats	= &fsl_selectable_formats,
+	.num_auto_selectable_formats	= 1,
 };
 
 static struct snd_soc_dai_driver fsl_mqs_dai = {
diff --git a/sound/soc/fsl/fsl_sai.c b/sound/soc/fsl/fsl_sai.c
index d232c8f530615..4dce1a43b2b43 100644
--- a/sound/soc/fsl/fsl_sai.c
+++ b/sound/soc/fsl/fsl_sai.c
@@ -1026,6 +1026,17 @@ static int fsl_sai_dai_probe(struct snd_soc_dai *cpu_dai)
 	return 0;
 }
 
+static const u64 fsl_sai_selectable_formats =
+	SND_SOC_POSSIBLE_DAIFMT_I2S	|
+	SND_SOC_POSSIBLE_DAIFMT_LEFT_J	|
+	SND_SOC_POSSIBLE_DAIFMT_DSP_A	|
+	SND_SOC_POSSIBLE_DAIFMT_DSP_B	|
+	SND_SOC_POSSIBLE_DAIFMT_PDM	|
+	SND_SOC_POSSIBLE_DAIFMT_NB_NF	|
+	SND_SOC_POSSIBLE_DAIFMT_NB_IF	|
+	SND_SOC_POSSIBLE_DAIFMT_IB_NF	|
+	SND_SOC_POSSIBLE_DAIFMT_IB_IF;
+
 static const struct snd_soc_dai_ops fsl_sai_pcm_dai_ops = {
 	.probe		= fsl_sai_dai_probe,
 	.set_bclk_ratio	= fsl_sai_set_dai_bclk_ratio,
@@ -1036,6 +1047,8 @@ static const struct snd_soc_dai_ops fsl_sai_pcm_dai_ops = {
 	.hw_free	= fsl_sai_hw_free,
 	.trigger	= fsl_sai_trigger,
 	.startup	= fsl_sai_startup,
+	.auto_selectable_formats	= &fsl_sai_selectable_formats,
+	.num_auto_selectable_formats	= 1,
 };
 
 static const struct snd_soc_dai_ops fsl_sai_pcm_dai_tx_ops = {
@@ -1049,6 +1062,8 @@ static const struct snd_soc_dai_ops fsl_sai_pcm_dai_tx_ops = {
 	.hw_free	= fsl_sai_hw_free,
 	.trigger	= fsl_sai_trigger,
 	.startup	= fsl_sai_startup,
+	.auto_selectable_formats	= &fsl_sai_selectable_formats,
+	.num_auto_selectable_formats	= 1,
 };
 
 static const struct snd_soc_dai_ops fsl_sai_pcm_dai_rx_ops = {
@@ -1062,6 +1077,8 @@ static const struct snd_soc_dai_ops fsl_sai_pcm_dai_rx_ops = {
 	.hw_free	= fsl_sai_hw_free,
 	.trigger	= fsl_sai_trigger,
 	.startup	= fsl_sai_startup,
+	.auto_selectable_formats	= &fsl_sai_selectable_formats,
+	.num_auto_selectable_formats	= 1,
 };
 
 static int fsl_sai_dai_resume(struct snd_soc_component *component)
diff --git a/sound/soc/fsl/fsl_ssi.c b/sound/soc/fsl/fsl_ssi.c
index dc022976c9823..02ce112faf2db 100644
--- a/sound/soc/fsl/fsl_ssi.c
+++ b/sound/soc/fsl/fsl_ssi.c
@@ -1151,6 +1151,17 @@ static int fsl_ssi_dai_probe(struct snd_soc_dai *dai)
 	return 0;
 }
 
+static const u64 fsl_ssi_selectable_formats =
+	SND_SOC_POSSIBLE_DAIFMT_I2S	|
+	SND_SOC_POSSIBLE_DAIFMT_LEFT_J	|
+	SND_SOC_POSSIBLE_DAIFMT_DSP_A	|
+	SND_SOC_POSSIBLE_DAIFMT_DSP_B	|
+	SND_SOC_POSSIBLE_DAIFMT_AC97	|
+	SND_SOC_POSSIBLE_DAIFMT_NB_NF	|
+	SND_SOC_POSSIBLE_DAIFMT_NB_IF	|
+	SND_SOC_POSSIBLE_DAIFMT_IB_NF	|
+	SND_SOC_POSSIBLE_DAIFMT_IB_IF;
+
 static const struct snd_soc_dai_ops fsl_ssi_dai_ops = {
 	.probe = fsl_ssi_dai_probe,
 	.startup = fsl_ssi_startup,
@@ -1160,6 +1171,8 @@ static const struct snd_soc_dai_ops fsl_ssi_dai_ops = {
 	.set_fmt = fsl_ssi_set_dai_fmt,
 	.set_tdm_slot = fsl_ssi_set_dai_tdm_slot,
 	.trigger = fsl_ssi_trigger,
+	.auto_selectable_formats = &fsl_ssi_selectable_formats,
+	.num_auto_selectable_formats = 1,
 };
 
 static struct snd_soc_dai_driver fsl_ssi_dai_template = {
diff --git a/sound/soc/fsl/lpc3xxx-i2s.c b/sound/soc/fsl/lpc3xxx-i2s.c
index c65c17dfa1747..ea521647129ba 100644
--- a/sound/soc/fsl/lpc3xxx-i2s.c
+++ b/sound/soc/fsl/lpc3xxx-i2s.c
@@ -257,6 +257,8 @@ static int lpc3xxx_i2s_dai_probe(struct snd_soc_dai *dai)
 	return 0;
 }
 
+static const u64 lpc3xxx_i2s_selectable_formats = SND_SOC_POSSIBLE_DAIFMT_I2S;
+
 static const struct snd_soc_dai_ops lpc3xxx_i2s_dai_ops = {
 	.probe	= lpc3xxx_i2s_dai_probe,
 	.startup = lpc3xxx_i2s_startup,
@@ -265,6 +267,8 @@ static const struct snd_soc_dai_ops lpc3xxx_i2s_dai_ops = {
 	.hw_params = lpc3xxx_i2s_hw_params,
 	.set_sysclk = lpc3xxx_i2s_set_dai_sysclk,
 	.set_fmt = lpc3xxx_i2s_set_dai_fmt,
+	.auto_selectable_formats	= &lpc3xxx_i2s_selectable_formats,
+	.num_auto_selectable_formats	= 1,
 };
 
 static struct snd_soc_dai_driver lpc3xxx_i2s_dai_driver = {
diff --git a/sound/soc/fsl/mpc5200_psc_i2s.c b/sound/soc/fsl/mpc5200_psc_i2s.c
index c024a38e3b9c7..72db83994e8e1 100644
--- a/sound/soc/fsl/mpc5200_psc_i2s.c
+++ b/sound/soc/fsl/mpc5200_psc_i2s.c
@@ -124,6 +124,8 @@ static int psc_i2s_set_fmt(struct snd_soc_dai *cpu_dai, unsigned int format)
  * - create/destroy dai hooks
  */
 
+static const u64 psc_i2s_selectable_formats = SND_SOC_POSSIBLE_DAIFMT_I2S;
+
 /**
  * var psc_i2s_dai_ops - template CPU Digital Audio Interface
  */
@@ -131,6 +133,8 @@ static const struct snd_soc_dai_ops psc_i2s_dai_ops = {
 	.hw_params	= psc_i2s_hw_params,
 	.set_sysclk	= psc_i2s_set_sysclk,
 	.set_fmt	= psc_i2s_set_fmt,
+	.auto_selectable_formats	= &psc_i2s_selectable_formats,
+	.num_auto_selectable_formats	= 1,
 };
 
 static struct snd_soc_dai_driver psc_i2s_dai[] = {{
-- 
2.53.0

