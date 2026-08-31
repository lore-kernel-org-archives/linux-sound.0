Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11010034.outbound.protection.outlook.com [52.101.228.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9ADE23C4555
	for <linux-sound@vger.kernel.org>; Mon, 31 Aug 2026 05:08:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.228.34
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788152929; cv=fail; b=ZzPUVcXYP2vp2d9wcbHMQaLGuc6VrUccib7R8Q619N5AnGSSD+ul4T8QAJOoFdaO6r8mzTAvsQ232o/ynC277yxl8RU8eF4i5emiDwUC4C+4gfUc2CceAqDS6WEySp3NxkCPauEnHSoY0xYMSjx8Dtyz6+Q8LA9yn30iFOn/IAk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788152929; c=relaxed/simple;
	bh=D2h+XBv8skWC+YbpWt/LN+B+qCbb7t40ihh8oS1TqI0=;
	h=Message-ID:To:Cc:From:Subject:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=Y/CVb1GW9HEt45RHi2//VkQM4/bLbXVonfSpLxl792IP4xFuL2wjdWtVL2SusUIsDyud5yjFcNY/0C7+J99Wf0O0q3KOCAZpJLSYxD4nxDGPZX8hoJFHXs9WMbwjCDR0SxF5hMQM1I8DIZ+Kui6pPfjRAJ/vNWXGOgcAToasLIU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=OJzQZPUo; arc=fail smtp.client-ip=52.101.228.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="OJzQZPUo"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mmVrJ1UtvCE6jlfDqxMbcKj/UWfNEOblqRuXFWbUXKH3QIgvHClmXOCNpO2N7pocCxMKjMfk/xJPgXTOtyIxts8Z2oMVraHdg5l4DW+gDvtv5uGF+c4koxB+9I9lAFp8yXJHsso1cElQmCnhgIwqYyg6qbL28E6OyFVLyaEE8i9tHZYQ7OqExTILYWQZXDJE8ObxLEf4fQj9fMLTTvIH7ee7cLLgFevBO69AvJvFcTu+QcM1WakgOlwCphEzV6/TjTV+CSPsRgzLAjKee9C7j+zLrC/zL02MEeTPYl8BzFkdssxGErusIgTAIuzKceKCc4rAK+QU42B19+kziD3euA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7Sqh01PgRtV0lhoONbDHoCR+5lyy1v3jObYm4+XTveg=;
 b=nzZPmLOvebysVYyvBDA0xx8jBQUKlofnM3CMTPaqTU798kU2LGRHR46ylImb8rMcptim7tIIXVVPi3p04C4xw+aPnhozx8ob++obuXQ6ZpoVR1O0F/y7s8afJdCS1U0/s3c9PZVLsYjnZzEQc3+tVTKQM5s2d8A7Uk07Bm9OMq088aAHLWLaQn9raIN+1WGYXV3KaprDp/3Fs9g32/K8R4+nWxwe5jfr05V/apWYRMvJU9qkLrGTLZbAbs8Wk6z94sK3ZykzLV+5eFsTO+OSMiroE1iQu21XUHF9t81GR8/6nmMt323LZVKwy40q99rSbvZUS0vYc48OdeU9C3AhOA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7Sqh01PgRtV0lhoONbDHoCR+5lyy1v3jObYm4+XTveg=;
 b=OJzQZPUoAKuvP0RaqRbhwsIkn52XROz8nFsZo4lRyMWrYkL53JP6E2jsFmEN2GPD/kh4nfCbjrs38QHdPRYA+Y/W32aydr2DicLV0DMyxRpHtQDR9qvLBQsix2w2E2MA7D+3BpBm9HIx0qvSLQhUkQfHH/lEhM1+LitURMLjuh8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYRPR01MB16474.jpnprd01.prod.outlook.com
 (2603:1096:405:2ee::10) by TY5PR01MB18382.jpnprd01.prod.outlook.com
 (2603:1096:405:3e5::24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.13; Mon, 31 Aug
 2026 05:08:46 +0000
Received: from TYRPR01MB16474.jpnprd01.prod.outlook.com
 ([fe80::2a39:9988:dbe9:894b]) by TYRPR01MB16474.jpnprd01.prod.outlook.com
 ([fe80::2a39:9988:dbe9:894b%6]) with mapi id 15.21.0360.008; Mon, 31 Aug 2026
 05:08:46 +0000
Message-ID: <87mru2uba9.wl-kuninori.morimoto.gx@renesas.com>
To: Fabio Estevam <festevam@gmail.com>, Jaroslav Kysela <perex@perex.cz>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Takashi Iwai <tiwai@suse.com>
Cc: linux-sound@vger.kernel.org
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH v3 26/39] ASoC: codecs: sgtl5000: use .auto_selectable_formats
In-Reply-To: <87o6eivpyd.wl-kuninori.morimoto.gx@renesas.com>
References: <87o6eivpyd.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Mon, 31 Aug 2026 05:08:46 +0000
X-ClientProxiedBy: TYCP286CA0333.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:38e::19) To TYRPR01MB16474.jpnprd01.prod.outlook.com
 (2603:1096:405:2ee::10)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYRPR01MB16474:EE_|TY5PR01MB18382:EE_
X-MS-Office365-Filtering-Correlation-Id: 981956ee-8336-406f-6786-08df071defa7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|52116014|1800799024|366016|376014|22082099003|18002099003|56012099006|11063799006|10067099003|38350700014;
X-Microsoft-Antispam-Message-Info:
	m0luhpvNu41J+YZBM+7KbTkzt2qLZK7XXuEQ+77lHx0lyeC6KqEkxMEg03J3vt6Yu/EtEeCUfAI9xthIYLOG+bZxunRuyKt23s0xON26A2KBbLLPjKan7JLNTiLm0ZLg27Drj1tdmhGk3uHgVg0uxoc7GyhED6Dk0nxmd4LRt+dJh6FWiaC/F49xt2u5HuIX5zXevjPuT48mwgQoYpQULZd/YxiwppNtIYBotDF1z0hTo68OVxjCkfE890pMCJDiObuC+aVkzNBrro+TXOYghUbFiO/nc6/wRadamFK5a/hL/WWhVQnT5JibMGJbBx4ZqJTDyXV5xorFLL0oB7Y+9CC6p/1iivMp3nLioC8+qyDzQgGqvpuyxOPDqO0FbwYjrlSlv772185gpF0Jqmr7eYJblOkOKqMRtbOeVEjO8kaqEwb1Sg9MyhNlOvVwcxMJ3LndogxgLhKyRA4zfGYgkDFG6FcyzqeyLODNOqCZNIr3PynzdPvUAA8z38TazSvVaA1U35aGntF+daSN5nfHIF0lBeMa2BdWWhW7g/hs4OdfTXlArLkVSJVtigGPpnWQZjObicWC3Vho/qJ+OAGPPFd781qcgJYDf5R7nq8O6pyJ4BcPZp5DjxEIXL7X1KvoV6O4BSBbyuLsAyFiv+ppLTwNEz4ZCkNNnuQUCyEqfJXLe8iv4qn5ZZwrDhNjeAf82hDxfPVejGMldrykQ6ZPiPzSDWxNko2+5TBrzmzbadg=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYRPR01MB16474.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(52116014)(1800799024)(366016)(376014)(22082099003)(18002099003)(56012099006)(11063799006)(10067099003)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?g6EzhXYcGKXMdaJNjVduWGgMPn+ByATk7U2OFAxsNWUc2H4/QkjcfFVnYhHk?=
 =?us-ascii?Q?Dg+BQjuJrXo83qytbG5ytDbAs1iAwb9E8fmEFbfe/LdGq4D2E1LKJlCq8EPy?=
 =?us-ascii?Q?8MMM5dhth32GgIDDzKU4BJzvUKSNIchnYrFcb/Ox3OOv2R2F8JQuCg9/bLBF?=
 =?us-ascii?Q?5gMgTBwBXHse8Od98HZYoxIXkgtrROIyI/nBJBbebxjeTdy9Zr6ZB0HOOgeb?=
 =?us-ascii?Q?+aC5DAaDhHROrfyNfQ5UEdNeJjOk95PXh+XDPkLCVuEOoPBucLJDxII/U6V/?=
 =?us-ascii?Q?0AxGqouV7GX4hh2vduIGbZOs6zL3ORQOUQAPUO3sxdOcaw38/2mKXCbOE/zA?=
 =?us-ascii?Q?DLt6owxSlzo1zNuOKYY8RjpTOWCHT65WWds2GQOW+EZf4tTD8HCM3eJaCC4r?=
 =?us-ascii?Q?2OSHaVj5Q7VH24Yfyr/7aKKYqqt8dVUAB9PMlY8UfH1dxReQHGlubj8iiJgf?=
 =?us-ascii?Q?coPxkzK4L8LEn2ewt6XL9ki/Xo4xYLdYsApo+CCos4yH3FdWHNzzvx3we48E?=
 =?us-ascii?Q?oI0U/Yh494Ds3pB5jlP2t9v4mjAioVeXrNlP+TXYCGvvrjTZoQznfojFYDjr?=
 =?us-ascii?Q?G98rXAXazhQgzwEzJusb9c5vYuT/oBUVIl9dQ2fUb5/xXxTx49YjdL9e0dPd?=
 =?us-ascii?Q?0v/ucfWtIOy0mHe1OXV0+UiUXuBJTFLmmi+pnfBgiJ6Q7rRB5RTtQkwpfcGe?=
 =?us-ascii?Q?vQNds+EfOLhdiA2tfl24zQImNfclgxUU28Vp0N03B2JK/U/nGHi5r3osmzO9?=
 =?us-ascii?Q?KJmexjPjCmynZnby1yVr0petR3Oa3fYimtJBA8iToVq/FWigi28h2wKlfQ3P?=
 =?us-ascii?Q?/RbYeCPmVzdZVjhDgDQ2R6CDgOyav8lh+NDTHymht2quAlTd9Fl84fd2rEhk?=
 =?us-ascii?Q?t3XWBoQlHApKXI5ectxb1RvLWceoGmeDWUJIsDXMcwirfWOX6pv9Vd99dHVk?=
 =?us-ascii?Q?BGtFAx/ZQNAFDJbCVmDfXmotuiiXX5mseTzzuq24XlFVpTZ6+k5zA5OLkGvy?=
 =?us-ascii?Q?UBowh/ZAEr4VMZdPUlylNkw3UrZo5l5d7tUk7a+03PdNL2/vdXiJW2NcbFtk?=
 =?us-ascii?Q?DuHWJzY0UPGmEo0r4X9saKwITW+Afbt9soOb7fIYZuuFZnw8O558oLWju1zz?=
 =?us-ascii?Q?rUCl2FxAiOcA/DE4goZpAIab7w2r2XGK5oClhcTGlqMTnMQlwJFqpreCKKwc?=
 =?us-ascii?Q?XSxvde0tW5OU61YfSTilys4vHJ/QaK3ARFot6czpcFUEmwTvY6ppm9fGk5OS?=
 =?us-ascii?Q?8wM6wwEwJxVwT4k3knuqTWvYtHZdc6mJ651Y68RxMjUOuDntaNBnk7bCfH/B?=
 =?us-ascii?Q?DTbRWFcHt4Qak1eBfz9k1T0Nlxw5cLNj51WXPfwRPa1pdvxkNLzruJvJah9L?=
 =?us-ascii?Q?KGVfOm7DgPcpCPkMx1oTuGSQs9MJJsYi390T+VqqgJJ8QmiH6W3Ljy3yW32F?=
 =?us-ascii?Q?CIkXL7Gv4L/PpVBcxqlmWFbunvyNGDKBY8y5JDj953e26ydLP21mnEdw3t9S?=
 =?us-ascii?Q?uuXgkkpcVt8Wmqao1hp2svFWwpD08k2YPWMUAjtpkn26KgcpKujXlULUOrcB?=
 =?us-ascii?Q?XcEjjxMHx2dQkadoUUwyYHD8vLoObjvvKRmrhmnLwn+rv/Jef+fWcsSBZKUY?=
 =?us-ascii?Q?2Ha9TL0OJ6YPsjbvl0RZmLtHWFtYcM4e+6poSPwkXkjLs2EbRt007fngS7uf?=
 =?us-ascii?Q?ammrcs7/iIHDRhV4AcxniLU9uXcNzERDIJIzcAxK3g09naDaHXbMJsP0HUx/?=
 =?us-ascii?Q?R4yglyQ51XqaNgTPO/E9wpNijDIKqaoZoMPiO3joWScMv2emSOx4?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 981956ee-8336-406f-6786-08df071defa7
X-MS-Exchange-CrossTenant-AuthSource: TYRPR01MB16474.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Aug 2026 05:08:46.7120
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UO0iffL7oZ9GeiKHeBv4o/7LEWexBCFI8YqLKMyiF24x+yi81jhxZl511X4oTaSSc0qtCxHKvQzFOw23R6/yml48v/r/vCsvCl9tzBK2TgGlcwbrF47a2lTxMzzQkjQ0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY5PR01MB18382

We can use .auto_selectable_formats. Let's adds it.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/codecs/sgtl5000.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/sound/soc/codecs/sgtl5000.c b/sound/soc/codecs/sgtl5000.c
index 35df1a8c4c8c6..97bea75ed24f0 100644
--- a/sound/soc/codecs/sgtl5000.c
+++ b/sound/soc/codecs/sgtl5000.c
@@ -1158,12 +1158,23 @@ static int sgtl5000_set_bias_level(struct snd_soc_component *component,
 			SNDRV_PCM_FMTBIT_S24_LE |\
 			SNDRV_PCM_FMTBIT_S32_LE)
 
+static const u64 sgtl5000_selectable_formats =
+	SND_SOC_POSSIBLE_DAIFMT_I2S	|
+	SND_SOC_POSSIBLE_DAIFMT_RIGHT_J	|
+	SND_SOC_POSSIBLE_DAIFMT_LEFT_J	|
+	SND_SOC_POSSIBLE_DAIFMT_DSP_A	|
+	SND_SOC_POSSIBLE_DAIFMT_DSP_B	|
+	SND_SOC_POSSIBLE_DAIFMT_NB_NF	|
+	SND_SOC_POSSIBLE_DAIFMT_IB_NF;
+
 static const struct snd_soc_dai_ops sgtl5000_ops = {
 	.hw_params = sgtl5000_pcm_hw_params,
 	.mute_stream = sgtl5000_mute_stream,
 	.set_fmt = sgtl5000_set_dai_fmt,
 	.set_sysclk = sgtl5000_set_dai_sysclk,
 	.no_capture_mute = 1,
+	.auto_selectable_formats	= &sgtl5000_selectable_formats,
+	.num_auto_selectable_formats	= 1,
 };
 
 static struct snd_soc_dai_driver sgtl5000_dai = {
-- 
2.53.0

