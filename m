Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11010041.outbound.protection.outlook.com [52.101.228.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1137C2FD1A5
	for <linux-sound@vger.kernel.org>; Tue, 21 Jul 2026 01:46:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.228.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784598364; cv=fail; b=U/fuapk/sSp4og1JaYmu/xptpEodYoqnjkvMRlkJkzChRbtBhkNc6dpUVkBl6D3KOxpJXpbRIJ1CaTSm6OySQtcr6IDPaqMMTmFIiDp2c+jjH/svTkny+Oxk3JnJMK5obMA46D8sFgG19FnmicqKP6oXYGoVu0OnPlJXebPXYwg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784598364; c=relaxed/simple;
	bh=IDRuS14z4YcY7mjLIHlapW6BjqtwXKVKieLyeS6okRY=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=R1whn3UdYw4qJqeskv3ZB3+AmpOtJ8ykmR7MKzYadzh9R8+oB9hZ+YEfOIxASdtUGO79Im18hFkNLaxra2PQlW6stj2i5dcR869kLTSNNI2G096nuQM3PsnogGZUQtTqsxkU7V7khIT2ooZ8ENUlKAIII0CiiFLjMDjxSNJ590A=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=nT5fWe7H; arc=fail smtp.client-ip=52.101.228.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="nT5fWe7H"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vxHJmEG0Sp9NCVMIc+RZIbfe3iE5t/XHOJKELPDMzcV0u5NoUkbDGu84A/+QxJgXXezaaW/9IDGUChuKeBe/dr9YjD1RvYOCq021d+Sox+DH91gOglNiFkInBlbL7hgkIoiULq6lBG5p6XKxQWAlJFACmDgGe4/tsVwnkOkb2x0W4Yni5+raBj2oerHyUh4UWBOnJheyF3BYeWO0tsBcaffjBt24/7fzaP9q8ZZO1xXQ086qDXaNCFmQGRyBbsiltGrBGhnjBKEHLDQ7GRrA2Sjc/0JHt/1jo5jvGW1YVfK0z6gYJk+zTU8WNCYnoyoHKgfZkitxrVzds2bEToj6GQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wgQKYz+GEHDo1O+11V+nyxJ6teF9hszMNIFcx7tXJAA=;
 b=GvwgXOHcXVs3GrMgqawaGf1Yuufo62+H6Rs9W15BWG7rOBltkFii7qcDVTcw4goYUfMC/ITbMShkxkxb2d8ur/mszMLjFuX4F+km855wEg+XQWm1nUY2n2QZKIi5hWWyehLx2aMISE6dsvkGdkhlkMuz+ia1wITQ3aS/IQ5o2KBytWEo4qFQPWJYBXwHWBYY0dI9OndzopX760BkpjtVDLoM8QSVugPB1YcknuOeUCrEzy7yIT2WI+FsVDMjUH+RYvOQKfXgsPq8YrCzhZYV/DqPkDNATn8oGVsObYbWRWMiP8JJTOuGCnGsPczyuKh3VVo7PW82hFi6aF2/4gpJ+w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wgQKYz+GEHDo1O+11V+nyxJ6teF9hszMNIFcx7tXJAA=;
 b=nT5fWe7HAKwQvjPWqScRkKXshpDbzVF2D1JEemG6f2eFXKLQoeAvdTtPTMQY4hOmAjRQ9TQNCASvX0geTOy6LptCScgb3ZczvjDKRxmMMZFeobmOTYomDPXd6cwCuwxHCAVhX5uREfzlNaEDplffM71RMslRZSdvJ+9jXJ9xGxc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TY3PR01MB11797.jpnprd01.prod.outlook.com (2603:1096:400:373::8)
 by OS3PR01MB7707.jpnprd01.prod.outlook.com (2603:1096:604:17a::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.10; Tue, 21 Jul
 2026 01:46:01 +0000
Received: from TY3PR01MB11797.jpnprd01.prod.outlook.com
 ([fe80::1868:c915:c230:a383]) by TY3PR01MB11797.jpnprd01.prod.outlook.com
 ([fe80::1868:c915:c230:a383%4]) with mapi id 15.21.0223.017; Tue, 21 Jul 2026
 01:46:01 +0000
Message-ID: <87ecgxi087.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 1/2] ASoC: ux500: mop500: tidyup mop500_of_probe() parameter
To: Jaroslav Kysela <perex@perex.cz>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Takashi Iwai <tiwai@suse.com>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <87fr1di08n.wl-kuninori.morimoto.gx@renesas.com>
References: <87fr1di08n.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 21 Jul 2026 01:46:01 +0000
X-ClientProxiedBy: TY4PR01CA0006.jpnprd01.prod.outlook.com
 (2603:1096:405:26e::13) To TY3PR01MB11797.jpnprd01.prod.outlook.com
 (2603:1096:400:373::8)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY3PR01MB11797:EE_|OS3PR01MB7707:EE_
X-MS-Office365-Filtering-Correlation-Id: cd2e7503-8246-4c8f-946d-08dee6c9d17b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|23010399003|376014|366016|52116014|56012099006|11063799006|10067099003|38350700014|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	i2RBpQQWj8v85n139/fUtXJBOOrbN38rz+Za+R6kRiGX+l3h/EWa5WOxlMJiOAwATKim4hjC7oWNHAj30o7eWk/fwHP1dRFvfQy9QKWjWmtsLtoWGt50jHBG80nbkvhNnrQAbMCB6kOrkrNIi8Ls1DUGCGIbQkDsy1nPPhsvwu+qUQ+N2rtPADhhz5ob0cSvCHxYGCfFEQ0ClgjD6S5/HwLoROMnyYUCwm70f7TL4XuQ/WP2XSWxKRsc7C6pAdl7GZ0i5XJonPXLHKMRMnbIlCfB2SbkOARm4PukaWY0gRcNY+VZ7nkVQvgjJ1xI1BuI6SNOgeUx1k0qSyvjRDEIHOwKCuZRbZdpQLBjj2AB31i2cf+Gquq54aVab6fAmGZBVOE1com9n86lPGAtqt0a3u5MFjNgJB2Tc1fF0N5A/VVfO3LvhHqs1vH5XMyQ54dSTXAI8KRRvZl816A4tlONJYNeJyxAWKcODwueQV3sJIjHUbTYttdQVRwkjHRG7x4WsuwOziLzRN3lITNbaVV2NYKpM0ZGPXVLB5zNMOPQoyRfNJPjojgFsc9iAryu2yisy7qnA6rXF1HdacuP1Gw8r4RfcQRzvcfEF+J6ErqcTzRKPfK9xdN8g92r9XktrwN5s9J8j4RvsdaXEacCne5tiHFsJoz+16u/Qwd0ahDMlstcmCKdDceK/g0aTbF7zZtXinEWMTyF58t/JQE+Jjl6IudDMO2XPk91SSs75eoCgrY=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11797.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(23010399003)(376014)(366016)(52116014)(56012099006)(11063799006)(10067099003)(38350700014)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?CpWkCtR7gOjSVV+JbE/LOMNIUKAXZVE/lXGjzqaGfwWXjhA3qMZYTCEBwFPI?=
 =?us-ascii?Q?PAxdyZ8eiHSh00QVLW3KyT/VwprJQ4Sezpi578nkQLwNlNSw++avtWVuh9/w?=
 =?us-ascii?Q?JnDIOxHvRmsDZwCj8QOJt5PD/UozCDA29TZ/nkjeKvGnbsaSg2LRQSMoYQdN?=
 =?us-ascii?Q?IVOAXNR6RFckkd8KW3Y+oIm15ftEW3xzZZcoPXwzl/RPaQJUgE4gSxV2kDw1?=
 =?us-ascii?Q?xSfHoQoVaIq97G0oP7Zau+CwPRkJM536rZcmjpwLvlxmBk5BVx/WUr4oymWJ?=
 =?us-ascii?Q?VuXakbdLGCThGXfIe4XxWU+NLxgruTWT8bPuHcfuUy28Jwe0Ihp7WI8LXW/H?=
 =?us-ascii?Q?vELzGWPLJe8qfb96X0+uMSlWhBsgoGYNN9zAYv17icb/YgS+MbW+oTLpUn2v?=
 =?us-ascii?Q?Mi/YNi9F5jFcMntZfQHk5JaSCSCENk9KG+x8fosw7M5EBOCsZkcP/vzu21PN?=
 =?us-ascii?Q?Cgj1GD+Byh2oHYWd9x78yVro1K3E8hOk7trn+p8/i4TmhxrB/Oi+Uh9+Dzdo?=
 =?us-ascii?Q?im2uH/tmSrBOwUNHN896WC9YlqWRQ/7kuVkr58FT1c4AbOvj0SknRYz911Wi?=
 =?us-ascii?Q?ztf2sUn4uc8ltqDwmNTkOIVe1m0pMEpZRAA8+SaB8hV5IvcMTQjWnNvUFx8Z?=
 =?us-ascii?Q?bH/mJ6IcwN/7rLi0gfciGsHmNq8EPyx2blxOKKOWw65gVr4tY/uzGuGKTsHw?=
 =?us-ascii?Q?4ydxEWtMI39xhv791I2Xg44q6+CAjScr/LyN9P/cjFGrV3xdq2xLSpOHo1pp?=
 =?us-ascii?Q?Qmwg+fTPn09Y6ivdE8Zuqph2BQBm6FNvZqRE8jhoB96Yzy32cZYoeUEJ3ByT?=
 =?us-ascii?Q?tCI2+5uk/wA8HsBLg1CkEq9W1Mobvv20dTOLfgEjIGmTgyuazFE0HsWX/ymd?=
 =?us-ascii?Q?Cc7CHAtGlPEN35iTsdstn32HHmv9lE5PqetumNsa79r64cbgFyfw0cKP3Pa+?=
 =?us-ascii?Q?LJKHqyICSs6DmEbyuT516/9eeEGLxRT38hp5W5x6NKwF9Agy49Gpp1ofrPF1?=
 =?us-ascii?Q?r+U+8UF4FgswCrfo87C8zUbpn3vG051jdRQe261AOQe1UiXgqj93QmNDwj7c?=
 =?us-ascii?Q?a9wkJvzfBqT0aIIbNo5iVNGiuHGig8FXethoWrppokEQMyteKzaniLa6PN+s?=
 =?us-ascii?Q?VsTZXGX6BCwnj/wCkbUnFS/kFK3UjkWqqVVJJxilS/xdmOcxOhJOzT7lklYK?=
 =?us-ascii?Q?iKKNPpVJrlWHLJVSPpBFITa5+KnhWzlT5FvZC9JjKnw/kAgh+W1S9XclYkmi?=
 =?us-ascii?Q?fZB7N9bAwMAG0L/0yZMhR3bQHHu6teZ/orEzAfz+AdyHegfVo20iozIsM0JG?=
 =?us-ascii?Q?Ak0g3ujYBCfXFLSCdiqma4gs0o0uvCl92ZUAHjunAjgGH7/nBad12xxRABTI?=
 =?us-ascii?Q?PGgBhnpqO4qjJexwb4rJaOWBBVdP43lc/D6bDapPpjKuRhvSGT5TGQDMb0uK?=
 =?us-ascii?Q?aKLIntramIzNeqjNP+Kr5OdqnjnudVnfXJaRVm1zE25DDx4cuqNDOcBpkXl9?=
 =?us-ascii?Q?1AiT6aYQWmcf+tUWJtiwl3sjsmUu4hqJEx2N04k+uOhLCjO6+2FI/q68KMqR?=
 =?us-ascii?Q?m/TOyUgnVPMgmouv311bh3u9zjDIqs3fuv8cZn+QvQyF27dddOp53bULvcQZ?=
 =?us-ascii?Q?21jtaTZAId2NKN/lPPr6eb1R/67TINWJpqjwUaUqnnlAf1bIPzvv9h7+eBq7?=
 =?us-ascii?Q?dffluzsZ0WTcbFKxfvDCvz3VaJXJ9zSr245vBW6jEfHSCJypjs9fwYnH/H9Y?=
 =?us-ascii?Q?R7X1fPVy1NbedjOdy2ROKjTliYNB9diy9z8FAkfCBIRkj4rWhnF3?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cd2e7503-8246-4c8f-946d-08dee6c9d17b
X-MS-Exchange-CrossTenant-AuthSource: TY3PR01MB11797.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jul 2026 01:46:01.1921
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2CFa9ci6PRG2qLxtS+aB/FjA2qmr1WpwhQuXXA7F0o14qeL1bRhoVqXtA1aINl3oMkWYzbtI9MB8Cui7w1wIFdFCM8f10pTtG8DkWBq3FHI+/Ooa+SEzENe9wfdE9DxJ
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS3PR01MB7707

mop500.c will be updated when Card capsuling.
To makes its review easy, tidyup mop500_of_probe() parameter.
No functional change, but is preparation for cleanup driver.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/ux500/mop500.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/sound/soc/ux500/mop500.c b/sound/soc/ux500/mop500.c
index ae6d326167d13..6d196b4b88027 100644
--- a/sound/soc/ux500/mop500.c
+++ b/sound/soc/ux500/mop500.c
@@ -68,10 +68,11 @@ static void mop500_of_node_put(void)
 	of_node_put(mop500_dai_links[0].codecs->of_node);
 }
 
-static int mop500_of_probe(struct platform_device *pdev,
-			   struct device_node *np)
+static int mop500_of_probe(struct snd_soc_card *card)
 {
+	struct device *dev = card->dev;
 	struct device_node *codec_np, *msp_np[2];
+	struct device_node *np = dev->of_node;
 	int i;
 
 	msp_np[0] = of_parse_phandle(np, "stericsson,cpu-dai", 0);
@@ -79,7 +80,7 @@ static int mop500_of_probe(struct platform_device *pdev,
 	codec_np  = of_parse_phandle(np, "stericsson,audio-codec", 0);
 
 	if (!(msp_np[0] && msp_np[1] && codec_np)) {
-		dev_err(&pdev->dev, "Phandle missing or invalid\n");
+		dev_err(dev, "Phandle missing or invalid\n");
 		for (i = 0; i < 2; i++)
 			of_node_put(msp_np[i]);
 		of_node_put(codec_np);
@@ -95,21 +96,20 @@ static int mop500_of_probe(struct platform_device *pdev,
 		mop500_dai_links[i].codecs->name = NULL;
 	}
 
-	snd_soc_of_parse_card_name(&mop500_card, "stericsson,card-name");
+	snd_soc_of_parse_card_name(card, "stericsson,card-name");
 
 	return 0;
 }
 
 static int mop500_probe(struct platform_device *pdev)
 {
-	struct device_node *np = pdev->dev.of_node;
 	int ret;
 
 	dev_dbg(&pdev->dev, "%s: Enter.\n", __func__);
 
 	mop500_card.dev = &pdev->dev;
 
-	ret = mop500_of_probe(pdev, np);
+	ret = mop500_of_probe(&mop500_card);
 	if (ret)
 		return ret;
 
-- 
2.53.0

