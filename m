Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11010066.outbound.protection.outlook.com [52.101.228.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8274B32694E
	for <linux-sound@vger.kernel.org>; Tue, 21 Jul 2026 01:33:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.228.66
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784597605; cv=fail; b=XQk3HAz4JEaxAd53x6UDCFer9wG2ejaOKjOaBSbvGepmOwr1oHMNg18EFZ6ql++C0NJAGV5TWxr8bRhOf3RLdpfCbvmmhdVvkZSOT2zsbdZh/UJrTieMk0lMUxTSkILNm3FtQAYorCje0j3vKS1vp+BJGHx0Z05NCh3R2IMmpLc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784597605; c=relaxed/simple;
	bh=iEM6rhjKo+Zyh37uYmD24vRBQ7LFfOAgZ3FqrgmnBJ0=;
	h=Message-ID:To:Cc:From:Subject:Content-Type:Date:MIME-Version; b=CUlGYHdsE/56PFgjiwnQmAg8KW6xcESSGP6FX4K0dMIEii97Olv1MojIMCb7PPB8PH8l3zz3lhtZWDiKVekoM4e8FFgdyW0wYtH+kCizGqB4J6h8MPbiqN+4Gnth39yykIqQXwxf0vEBxVXCFUSQ+O2GMT+Tn/X5tVUGdNKA9s8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=gD4w2XG3; arc=fail smtp.client-ip=52.101.228.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="gD4w2XG3"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rGY9riXWer3sjvP21Zieg7jG7hIbaV9bGh0hRR5UIZbjA+Mz6bLkJavjrR0b+cx0Be4ICyD68PKQsO5fNoThKQzpCs+AuP9Wb7HukpNAku6DMp8I3lX0ahSp7cNzJQldZw3BfUPJYt7fMZUF5xRs9JQSiD2u7c2UMHXj2+QmaUukplz8G4Oqvs86OJMqjBJe+OZZBeb3DKWuuyFZ7IW2zPAC+2dsKD7UyBiNwOkiHLsoUGDOlSJ9Du8I5KxVfY9FQL77zLDBNiNSnIrDxx4uZJNjCVQbRs9nmI54pFwzt0f6SLt5pRSdMf0q2TMHL/EBQ6YK1g8h/KfnUZxupTQZVw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+a8age3nCbPZlRdRE/eEw21lCR7mxmH/nINKzELH4mY=;
 b=FYmbg7owjquPkDjQKt82koKiVdHrPyS4jUiGokTLc7mxKNp8i2Juj2fMUFyU6gdAYw0Knhpz5IUcM7SILQnnbmo5Mn9LXZW3po5C6C9RMMeKgIFhnyCBm3XLhGuNkyysDtxFQHoJk5oBcETi1KA8F/ps/Mxk3AqoRuFJrt8kE3Lte1wdCcyQcl8tIX1TBYC6veRypZgWjUt10Rk6mhuZ33myeXagNS5px46BnkXuN+Da8CyokVZ1A1R6srNZKCH5K4oAvEWA8vVY9G9bLYDHvtKQPlVYuZt3JJMTRSunSjG1DphZjavBQZJrgiOaGbSAiE1Gmfd3EfuYF0hDENVdjQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+a8age3nCbPZlRdRE/eEw21lCR7mxmH/nINKzELH4mY=;
 b=gD4w2XG3VEiAI9CufShr7LVph/ukK/Z1pizN1nTpo2mvZHar9nvWP3UOif2MrEFzeVVd+C+fRkKAqIjfp6/eyxNAoqG54j9krFZrhcFjUlNSmtaez99ou4k51Bx4mc8YU/QnPZy5oOiA2ukXOY/XjRgyB+LRVG4C77b3Qdwhgeo=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TY3PR01MB11797.jpnprd01.prod.outlook.com (2603:1096:400:373::8)
 by TYWPR01MB7282.jpnprd01.prod.outlook.com (2603:1096:400:c7::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.10; Tue, 21 Jul
 2026 01:33:22 +0000
Received: from TY3PR01MB11797.jpnprd01.prod.outlook.com
 ([fe80::1868:c915:c230:a383]) by TY3PR01MB11797.jpnprd01.prod.outlook.com
 ([fe80::1868:c915:c230:a383%4]) with mapi id 15.21.0223.017; Tue, 21 Jul 2026
 01:33:22 +0000
Message-ID: <8733xdjfdq.wl-kuninori.morimoto.gx@renesas.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Darren Ye <darren.ye@mediatek.com>, Jaroslav Kysela <perex@perex.cz>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, Takashi Iwai <tiwai@suse.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-sound@vger.kernel.org
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 0/4] ASoC: mediatek: preparation for Card capsuling
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 21 Jul 2026 01:33:21 +0000
X-ClientProxiedBy: TY6PR01CA0023.jpnprd01.prod.outlook.com
 (2603:1096:405:3bb::6) To TY3PR01MB11797.jpnprd01.prod.outlook.com
 (2603:1096:400:373::8)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY3PR01MB11797:EE_|TYWPR01MB7282:EE_
X-MS-Office365-Filtering-Correlation-Id: 42404715-087c-4dc2-74b5-08dee6c80cf6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|52116014|376014|23010399003|366016|38350700014|18002099003|56012099006|11063799006|10067099003;
X-Microsoft-Antispam-Message-Info:
	V+/bBLZUmByHiAg37jr54uCfNRBBUvtb38Y4prJNSBjYeaYpqdEUecXEzCem6/cqhNyj1EEGoHlpzLyPEk+e24Dp9DTlNmV5sVIgxRqMb3J01uVVLKmodFKhWSMrYPzeoixh+/FsA+TqWmuEfuGp3oGl0429PfoaX5eqljsvhJg68EDL0Uyc3osg8J7+T+x7MM54PHbVrv3C28B2S5oZNK29hwVyQBPh3PmBBT/klA2mWa3misSLxPFC50qGd/dvCPXm25mnytey1qZ7TzGYMYtsxwSeupun7hbSv6NcgagHd9FT2YRNVDQwe9OyYNe/dvpoUysNBMzq9ciHrTrQmUaDvZ46keboNNR2H6jvlmQtTF5HwNYSL3qr69XapxdJDOJt3sOl+utAOJ2WD31IuG0LsJNNSmob0LyPKJhZpFMdanIY3fJYbID5CJGXvs4ah3E8csAArtyhJzwPWNuHzHs8/VIKZkygJqtYq/jOFK5+oChWN1crJCgiHPaF10S5Cd0XQNFUwA7ZCue30burcnI+057Ml+xu+58fq8OkHnHHaruvlvVZZ6G6oJMMjawP7cM8DGtFf81/FlYr+WH+3Pm7FsWpmBaom3rNBhRaZIuLTV38k92hXR6dUBkVEeinGp3tDAe94mWPmO2Mb9ZXaN6UoZnQwX76H8O3/M0DqygAo3WhS81L5ilbiybcFuPd2m84HNK/jMTYdk4LrQpHjQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11797.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(52116014)(376014)(23010399003)(366016)(38350700014)(18002099003)(56012099006)(11063799006)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?JFzW4CEkN7/O4FudY6e1R+itwZ4KMpJWFQeFikc1Ws/AnBSWZRJjuMpFkLEm?=
 =?us-ascii?Q?Nb6h16tZw5+5D3IYronWnEcFRFihrTzkXEqHhoqAzYgHKBi5HpWmjUto43Ad?=
 =?us-ascii?Q?IlWPXCBLwpKlOnAiHrxlC4gHOtHKB9bRKxqbyGjusFWE1c+wPt3o27H0z2IL?=
 =?us-ascii?Q?P7z9R0DKDi+BDOCZDVR3LiENsp99Szx8DXtn0iVXY5W1ymXK7RmSawYKMZEW?=
 =?us-ascii?Q?DKw5aF/t5RZVQIF+AQuDtSelL1DF8t6Rda1QewxAa6Jnt9nuy/xHv0n7cjp4?=
 =?us-ascii?Q?T9HkGf6BDsKkg2wplBRXpIoRBxBRk5E7b+e8qUiuWrEUeuDVdYnz8BfROHF3?=
 =?us-ascii?Q?NxBY5mPO9OszXMsoPWF5MUs9NHvYO18wCwJtpsphIZnMfZnfMQCUM1g93NyI?=
 =?us-ascii?Q?nDMIqwG1wvtCFHOA4TSvIHIS7lex4hQmyySgjuXr/mRXSIAC9qgwfijBfJED?=
 =?us-ascii?Q?M1sskp4R5rzm0vkVBjbTZ4G/layhRIGQFGRiQ72D+Qm9DLCHYx7DEb0cLIoA?=
 =?us-ascii?Q?wS6lWRK4hkocswrZZw+UuR6ZxZlnv/eRkwUXMok1CH7sD8SYiQxeKXZ3W3sN?=
 =?us-ascii?Q?UvBtgdKFcAw8ZTCLaZqNmNQ3V6UI016N7tQPX1Z1qm77zj5j+bx+NZaOWdUR?=
 =?us-ascii?Q?Kz9r3Eu7fleSxz1YdmnpSOG/PCLHto8DIMsiU32EmRjlXXOXVuphGaM/MGfK?=
 =?us-ascii?Q?Es18IaVF54SxGV0dtRoV3fobd/sdUBeM31gsH5TRMBtIYi7eG2sWohOQxM5p?=
 =?us-ascii?Q?Z5/sfD73xmo8xkgpcxHLgZ563GAYXRgwHPvLGVSQGh5UDitMloiJ+ha1y2Ny?=
 =?us-ascii?Q?jQCNwmD2ZmHITd5VeXWNEbR1+HVHqAxkMpy5d4O0CLo+WybNd1LZu3nj6iFK?=
 =?us-ascii?Q?sb+3UCLAzsazWVqsv1/1/x0YtdyxDYylkEsBMI/+kXb9q6t1j1ynFwzNkdW+?=
 =?us-ascii?Q?4jF5uHX/QyZp0d3E3OsPPbDMioakExxcjsZDUi8s1+9yXOSxDFZ5qej+OUkn?=
 =?us-ascii?Q?uKlImGTqqYhlyxK7gxKk8Ff7mnOQbGGzKROH9FpRyamSZsQAiCtWuyM+A8uM?=
 =?us-ascii?Q?sbVKQyDB4hxJVUFoogQ1sAdC8yNTaCjuz/tMl5jJz0e23YeixBsVxEgFP8wE?=
 =?us-ascii?Q?jcALrlwzOIutEZgOMCkoMBf8FG/2uFm8X1lHxR3xWkMf/AC1CAHk2Xxr7Ytz?=
 =?us-ascii?Q?/JrTnyCzyuKvas+LXzG5Zg/3zlLAtku4YhLyKlhAkPHjPilnUjJ6uyhb6UWW?=
 =?us-ascii?Q?1IE8XmjUhxsL9H3fSK6Vl/MJSxK5YaBcn6i/XUR5+jeFTW+3DfPtWI16+FEj?=
 =?us-ascii?Q?SCAKTmhwaWGuzLGT946zVZJKNlMCNi1dQi1YzuqAC88v2fB/0uuq1TLzS9tp?=
 =?us-ascii?Q?0Uptu+sEQTqHQaVWGCNVS14HPsqd9xURKTIc06nSxmxwbh37TX7w6rU3C9q+?=
 =?us-ascii?Q?RleNVBXGrALkiiUHHBUyHWC2SZFcntP3fn1xBJAZJ6mlFjMqIVmNsCdtR/bc?=
 =?us-ascii?Q?DUwzhc8XBuZ4GSjleQZyzs0qsgjB2Vizz3sXNxFWM9xOZwYMpWZIQz0oiSe/?=
 =?us-ascii?Q?jw9MrHV+aaLWOciHLvcXgw00Ke82C+8R4e31wb+j8Vcj778jqe0yCFhvyvIw?=
 =?us-ascii?Q?4GIrAg+4M+j3Z6emyXl2p7JiaIC3ug3CacrXlioXm2NEEYgH+MW6lkG6/0/z?=
 =?us-ascii?Q?Sx/qE+Od+8GynfsmbmFkoT/HvRtudGe9ieY67zG1MioLgil53kxPF37mvA3l?=
 =?us-ascii?Q?ol2h+KyIKSS3Fqx2x/YfXlDzVG/MdTKb8pzI5mccctdgnS6drNvD?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 42404715-087c-4dc2-74b5-08dee6c80cf6
X-MS-Exchange-CrossTenant-AuthSource: TY3PR01MB11797.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jul 2026 01:33:21.9998
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Bm/IMWVoVNRE4COk4M304KWVB+fl6S2RcR/rE9+aJYRR8fywZjn6YSIqawpAhGD/uzO7PJMLQnmjRhYuFuB3Xi2Yh4ZNOSVAr8kEdVt7ZZKuhw/ghzz+sjfTPUmSX03b
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYWPR01MB7282


Hi Mediatek developers

I will post Card capsuling patch.
To makes its review easy, tidyup mediatek drivers to reduce
un-related diff as preparation.
No functional change, but is preparation for cleanup driver.


Kuninori Morimoto (4):
  ASoC: mediatek: mt8192-mt6359-rt1015-rt5682: use *dev in mt8192_mt6359_card_set_be_link()
  ASoC: mediatek: common/mtk-dsp-sof-common: use for_each_card_prelinks()
  ASoC: mediatek: mt8196-nau8825: remove unnecessary declaration
  ASoC: mediatek: mt8365-mt6357: remove useless assignment

 sound/soc/mediatek/common/mtk-dsp-sof-common.c       |  7 ++++---
 .../mediatek/mt8192/mt8192-mt6359-rt1015-rt5682.c    | 12 ++++++------
 sound/soc/mediatek/mt8196/mt8196-nau8825.c           |  2 --
 sound/soc/mediatek/mt8365/mt8365-mt6357.c            |  1 -
 4 files changed, 10 insertions(+), 12 deletions(-)

-- 
2.53.0

