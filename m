Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11011012.outbound.protection.outlook.com [40.107.74.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E25713EF658
	for <linux-sound@vger.kernel.org>; Tue, 21 Jul 2026 01:33:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.74.12
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784597636; cv=fail; b=dADIuT4T2+l73ITJimQGLzcg/y+1zW9H/zeO3vp0RK7wABU88NxBQNvL3542W8B6xTchSXky6XAWOWpy6Grh0I+C6RRQReIxrASs7qlhpc105iZGOuUvHyA8NjRAcqIedHpkq9kh+DdjeTuVb89qRqNmJONwdv6ou4ZTVb58M7g=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784597636; c=relaxed/simple;
	bh=7gBRTstNWxs3cIgBoASiK6u4Fw1QTpBWVvBgW+DIhLE=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=WQbVkg0m7Gjd884Paj8Wbx/0EIJ3HdSDFEKb7cRlU75QgC3Ui6aMQslysW5kl8X03SGIJQT+QDLkp/5B7msf4tBu7YfYWk4IVWkBABNP/CNnuEanxUCxhUbq29JMuyVNafe5s4MdIMmgQ3+MurkFoVv/BqPE93EVGZXcuF40hLI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=W2So/y6a; arc=fail smtp.client-ip=40.107.74.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="W2So/y6a"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IRdEm0HC90dQN08K8DX+j227J1xnxDgXNbXeJiuawmkl+T6iOg0PxB2+qOKp2KO9liU4PIPidq3KfCS0mBVDU/WU6BhZnHtIotOEEHFWPXszd/OKWm3FtcvDf8wsLe3hSDpioY/c+g3SNg70FNGd6w2NjGQofDWywKBJaOC/NKx2fntP0AkDImaPIFTBtIOYCmMVwrlRh0eCWZiOPMt9CgRIb5hhRnmV8PtxsItxlpNne9KzvQgdrOoXZ6B2uJ/IgbHCwRnHQD+DGRkQxOoEr/RmdfhYvZo2BfyFLRhCj0NCQS23z/m6RdVbXh7sDNLlEisoMdK9XWRegZXQ3xhXPA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=scusy1qjER5DitcuHNKjnteY69s05KnoCHsTRfCxn5s=;
 b=uRWzXTSkcO+/fShJ68v7k3P+BLGGMHmcv4Y0nuvzwFVi5FFVGMx7nO3QRGW4OIz14zCxkwMHp5/df7VycLpYn6tdUs7HdbOYq1Q5+EpMHbfCS837WRzzc1dk/KyHXxXA1U2U4jYnbHQ1IOsnA5rd5VvsQh2YCm8M07Qirixz9olukgbUn1Jcl2OQQWjy6sLQVCUXBaeg395sSfIR9/IDpwCh3dKkYrle6PS6CmQdaF+wSHDYIuByIm7/q/s8ZaZyeRXP/ozlKau7Hp3oI8VinZGIX5EbjnC+/1KOZS7lapy4qWsFbeBzofwW4eSI4iPJQRV1D+K8iZrQSi//ONt0VQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=scusy1qjER5DitcuHNKjnteY69s05KnoCHsTRfCxn5s=;
 b=W2So/y6a7vgtqARSAsq7VjpExHEjl8m4Wt9vVtF+47zcP5BWaZhoSO5QX4Y+ajmlXTkH26B0gP0hzGUwZqDeZfbbefNyTfwE0Whv3s/F8R8q1+0QZICtIjUiwrh0xVYlUsY4ebnnntetSZfavC0hQMn5c1o0DL2zPTITqGjG8zI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TY3PR01MB11797.jpnprd01.prod.outlook.com (2603:1096:400:373::8)
 by TYWPR01MB7282.jpnprd01.prod.outlook.com (2603:1096:400:c7::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.10; Tue, 21 Jul
 2026 01:33:52 +0000
Received: from TY3PR01MB11797.jpnprd01.prod.outlook.com
 ([fe80::1868:c915:c230:a383]) by TY3PR01MB11797.jpnprd01.prod.outlook.com
 ([fe80::1868:c915:c230:a383%4]) with mapi id 15.21.0223.017; Tue, 21 Jul 2026
 01:33:51 +0000
Message-ID: <87wlupi0sg.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 4/4] ASoC: mediatek: mt8365-mt6357: remove useless assignment
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Darren Ye <darren.ye@mediatek.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Takashi Iwai <tiwai@suse.com>
Cc: linux-arm-kernel@lists.infradead.org,
	linux-sound@vger.kernel.org
In-Reply-To: <8733xdjfdq.wl-kuninori.morimoto.gx@renesas.com>
References: <8733xdjfdq.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 21 Jul 2026 01:33:51 +0000
X-ClientProxiedBy: TYWPR01CA0050.jpnprd01.prod.outlook.com
 (2603:1096:400:17f::19) To TY3PR01MB11797.jpnprd01.prod.outlook.com
 (2603:1096:400:373::8)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY3PR01MB11797:EE_|TYWPR01MB7282:EE_
X-MS-Office365-Filtering-Correlation-Id: 27d51c0b-b2aa-46db-0f05-08dee6c81e94
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|52116014|376014|23010399003|366016|38350700014|18002099003|22082099003|56012099006|11063799006|10067099003;
X-Microsoft-Antispam-Message-Info:
	EWrh17PHWo4y0t16o2aJKBXuF41SuGdj1EUwuV6KRpOjqYZzsURExhek/xshDeOFlkCWd3MoB0cotuQyITtAWet2k7aG7SvE/pY0XEv7HjPkavcEK4OA/roWP8A30xvYapk9SNEqWuNiuO261gvlV1KGRvnpBCJc2htXgjB4aH82vYSOB5YXq/I8sA1kw244iBks+MZdIaAF1ZzUB5KQD5jGuK1I+s8IO4JtlG1gpZlhBu7Mn5r9nVH3Sr3xwnbG5RLqVFn8Ptzxty1foXGNOhc27HsnKZR5xlfm3WEAYVXgYg5GT5LcfwUBoRohwI0GWmRJaewOMP6j6Zi5Kq+zYzIx0TvSNPOIEkVywBe8CynuUchN6oQGzG1HAUrshSm2qPzyNhhTpd4zgPtihXTnvjj9Q0Zrz5+KGRbd+/umJohSxYfI2UMAb2fFGt5Xo8Fdn+tvoX5u/zF/XjmVhBS9V9YWQ8lzwvKZB/cZ8E/7RqQfw/t1a4znJpXOUnxgLSj/QgPQbJvi1STvWqhogr8aiQo4qY4CHrnih7UTbircMN5ZWSbzA8HnSIm8/+fw9hIZntGlSkVtS5eB9t94D30KzdxQB9ZqRyR32hc3B797+1Fc1988ugaYSnJASm+EGDZR92sQS/TQqvE/tKDnHppn8H2GXD/xlb8ESfIkTIsSBXeE1ycpCSwUEAyOR9qm1W5ISzrBeMKBBSlNDUNQJmS5OPIt8HXNIY6G1NQ+LuFxL/M=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11797.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(52116014)(376014)(23010399003)(366016)(38350700014)(18002099003)(22082099003)(56012099006)(11063799006)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?YcQpyM5xKIQJu8hg4Q93NUt8Ml5VLjmqwqJa6biTk8p+4HXKWkbE8OyQIMrT?=
 =?us-ascii?Q?AXDEyvE4gafJonIau4GPT/HESDqmdPodHRsZbmicpGqhABC8iW2q8it2yDN3?=
 =?us-ascii?Q?kntMPSFDO6/24/t8pt5CvVH2vlRuBLJYkEbNlci1TlBrw8+GYRtYiuhxcPUz?=
 =?us-ascii?Q?664HlIN1mL4voOf+rDncap5pghjE5PtVU/H8f+A1uwTvfTjhrwXz/AaE1Wb7?=
 =?us-ascii?Q?LpVj6rwTBQz0umq0MC+EGjIBy0qk3AdGhjfa+I7ybaX3+qYuXwTSQ+EPNvrN?=
 =?us-ascii?Q?4RbVxSoXCoCDsCbCmLGAY5/lCpknb77u1iSpEzAnEl9A5FfD+J+7alYd8ird?=
 =?us-ascii?Q?bEr01epEuVt9TNnF1wefQU0Xu8OfxZWZaGnpG41SFvcEZ/7QXpF2FSNYy1TR?=
 =?us-ascii?Q?W/Ki0TBmkVDiWp3HQdIcpGsXj92r7mnMDmli9HbfKNk9b54Uud6IUhVCDajf?=
 =?us-ascii?Q?iAwT5328bOo7cNEWKZmkr5XqcVgNGjONn4lCktXWoJya+TY5gO3CkaMJknoY?=
 =?us-ascii?Q?gI1xYW6EExpidBhu/XstpPI0F2U516pRj3iKitb87q5Q/gvbfhGkIAejFPla?=
 =?us-ascii?Q?kD87vGZ/qQdlwRJoWRL62uk0YfZ2djHldyVy3whhKAEtfNkjydL+j6OfirrP?=
 =?us-ascii?Q?FhYvff8K3f9/hhbHnKyEvLKdbGi4y87Xck74AvhPtqZcExW8dUNlawC14jah?=
 =?us-ascii?Q?J7cq//XkrlNwm8xjTDchad4RuYkHmRa87w/Jj6tUKnMotooS0sB5msrpI9bs?=
 =?us-ascii?Q?gkt6wEWXljoWQ97oFzeUnorR+s7JahtPY7/qkOMTCL7shks8zfyiZyJwAdNc?=
 =?us-ascii?Q?7s5Y2cf9txONzmoWaXlJAfGb7RdENARLI5IVJ6bnDe6a2MSmT00+Sm/WF1cC?=
 =?us-ascii?Q?B5zL56fCh6fo3z/uFzfL+0kuJGgj7folb/3CEyvezNDk1YlFXx4f94RDyC3V?=
 =?us-ascii?Q?UPxSqAq1rU6i3uTKUgd7cn/WXMRpTpXQIwwhU1dXlbNeEYBZ+yMMLcRLX7Fv?=
 =?us-ascii?Q?cQpttwLecH8fEN4CSWJnjctvJ+RnmMC++u13ek1cnymOTcySSmQ9WmKRYkNg?=
 =?us-ascii?Q?/dy+pOjHg6tCtkjX5o8pe5UFcDPyopPxdGZ1gRRQ7GFEB5/rtvli86hxbfTa?=
 =?us-ascii?Q?+nPID1nbS6O6okb4YT2EAV1pgKAp85bvuiehKR8KEwtlWWEUy5IKquRXL6xS?=
 =?us-ascii?Q?uYup/sKL3CI+PwK1LpLdqxo46RLlq+B7Kw0FXEnzgL5hjj9oleX56B2ZeYYM?=
 =?us-ascii?Q?q47304PmxhmCcM4m9NSG3dhwlF7FdCSIvtmFLK+NUGVdpAkZ3VPF2uw1ZEHW?=
 =?us-ascii?Q?0dcSim5ET2oDdUrawp9CzHrpf14uRQ5FwM5t6da0D/nHFEIRAe/G2REPJOo9?=
 =?us-ascii?Q?dt9dJJ5nkBGtoayoxotZATkICSbrcHf35sLpcLNEWfUzfmtlzrPsBpX57DqV?=
 =?us-ascii?Q?/KMVCYVUvuGJVOw8f5FQiUjIT5QVVVs/yY+Z0iDZmF/zew0rnxZwat3Ilg5t?=
 =?us-ascii?Q?FD7gVrhjcs+b26MWomwEkYiFniCqLTCM5ixtTKIsDAvMhWyMuuQgXxmsm3VB?=
 =?us-ascii?Q?gnDOIC8Z16FyVIIbwVNNJtyVqEHraNsZKTB5pvQgh6xy8BPfX7F6EaHcsuWv?=
 =?us-ascii?Q?HfjZPvS+sz4/6F/1/ZC12eoaAV/5aQWKmP+Y1FXJ7wZJ9Yt5EE2bZ3kMWg0+?=
 =?us-ascii?Q?emkdqQWNs0NsfKgQQEWmiaQ9wyrWadLBrYAeJFRf69ufIekeJp1ETc8zO12j?=
 =?us-ascii?Q?HLUXGTWh5N5EL+Jdpqbz3kfHqAWZSKcqB4G7KZ2RZQrleqMYtn1B?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 27d51c0b-b2aa-46db-0f05-08dee6c81e94
X-MS-Exchange-CrossTenant-AuthSource: TY3PR01MB11797.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jul 2026 01:33:51.5059
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DMKVW0wlH/KdU1VAql7CHiQWrqoaCRKWca6efjg/1dLysKpAxUaP3LA+03GNuzVz/sXAszfdZ7EDPtTn9M82SX7NGz3bSkkOTQ3whA8Y2RCISbEX5ZOCFlngBiG2UaA0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYWPR01MB7282

	static int mt8365_mt6357_dev_probe(...)
	{
		...
		struct device *dev = card->dev;
		...
=>		card->dev = dev;
		...
	}

This is useless. Remove it.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/mediatek/mt8365/mt8365-mt6357.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/sound/soc/mediatek/mt8365/mt8365-mt6357.c b/sound/soc/mediatek/mt8365/mt8365-mt6357.c
index 4339f45ee115a..dceee837c67d8 100644
--- a/sound/soc/mediatek/mt8365/mt8365-mt6357.c
+++ b/sound/soc/mediatek/mt8365/mt8365-mt6357.c
@@ -297,7 +297,6 @@ static int mt8365_mt6357_dev_probe(struct mtk_soc_card_data *soc_card_data, bool
 	struct mt8365_mt6357_priv *mach_priv;
 	int ret;
 
-	card->dev = dev;
 	ret = parse_dai_link_info(card);
 	if (ret)
 		goto err;
-- 
2.53.0

