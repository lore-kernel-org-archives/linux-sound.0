Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazon11010004.outbound.protection.outlook.com [52.101.229.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72255380FEC
	for <linux-sound@vger.kernel.org>; Tue,  4 Aug 2026 00:42:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.229.4
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785804156; cv=fail; b=BtKK2aH1gt6B6hFdRZzF3fqFSGZ9H34QOcDK9UMpgthi5CcrBFx0UVY70QGuL4ncDaEILZ9zwo4anYfxhiavA2oTqg9PFT3R1tWLtjs5q9mu2iuvX2FKfeiDtvorjVMAmsYPmkEhUL87SYntL1AZuyTGXRs9i24J3xwz/WsibQs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785804156; c=relaxed/simple;
	bh=voYSZZkS116oRFLDax2KSjTLbbSHfGdkyPl9KAXui5k=;
	h=Message-ID:To:Cc:From:Subject:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=BUNSF7Yi1Eyd/mg5bg63NjzhdUS6hTJThibq21+Kvh5xu0yDKiO2VcW6YKIm16KnptjBw1k+ONOJ4xHMW3/tuLzMwMPsF/9M4+FOnX8UsmUsNi0Kg41558R+xC9bqgGJAvHMpXjO/8QLiopg37gBXPnA0tgdgNmNy5kzw5sjt3s=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=bjnwytwe; arc=fail smtp.client-ip=52.101.229.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="bjnwytwe"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UXH/W8XlbaChp+H+Y3gyrEQdF9fgp55BDtT0agyFNj0uMzVv2I92UpFbdA3MBW88I6cKgVxQIV0rTDv9S7XXUa+52IO8OWMi8YlqzKAjkj5mv/phgtGL66lO3fHlZBVmKW9X7n5a+wDOFr/qG8Ks8XlCSaILuTm9fiE30NRBS/ApItkAeNlpPzp448zygeJGJz50lYfv3YhayGSyjEUmoroo4yATensBvrcg3UvKCJpQsQIvVpn1nMdxVwvQFQbYQynMRVXLRdktVOVHFJ8teXG90dxW/BVioBJ23JnfKtQpa/JbF86X8NlXXPMC7r3v4ee3q/H2WqKVOAjmxzVA3Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=02+Nk/kkYTG4CAxbqEqAvVS49hOjiT/Wqq9rXirC1jc=;
 b=DA0loRUyU+ivxG6cd1iMaY3uWqNacOpXzwX1ZMdGn2HUw35kNW7uTCCLrT/xJrZZjHp/5fZ+qmCXr0sUIVANNvOhcbhvmlWlEO+RTn8CrXh4L5cCoA/bpfjCOSkGR0HmjcQQvUiypJc0wwgy7AfoldFDVej1UaKRrO9qGu1rRs3zrOrU3lIBP+GnCGy0ttb3cF+IBxSlilC0jmFDzTHz94uZL6bNGddtpEeBrexKJbOnqqWiSqwOO5kt/QTfPf0Zzm1aRQ0XOsJJIObOu0ugNlA2QP7HqMGp4iqKfV+eR9FLMd0oPZ+iD7s+PZVggaWUqYl5N/rP+iJpc/GNmeKU5Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=02+Nk/kkYTG4CAxbqEqAvVS49hOjiT/Wqq9rXirC1jc=;
 b=bjnwytweaznyn4SI/LvbEYJQYvLEMCUYe+w6yy0x6aekqVemBhs+DjkOUz/LfTq7G12Ren4ujXZXsHJDzGR9bghFbbJEEnS7tupL2Txq8xz/k13QnU76NwK0xyQScEEd4h+B3NDvQEzKLncRNM2k3kUBOIzGGGua+PatAG8Lra0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TY3PR01MB11797.jpnprd01.prod.outlook.com (2603:1096:400:373::8)
 by TYCPR01MB18168.jpnprd01.prod.outlook.com (2603:1096:405:3ee::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.270.18; Tue, 4 Aug
 2026 00:42:31 +0000
Received: from TY3PR01MB11797.jpnprd01.prod.outlook.com
 ([fe80::1868:c915:c230:a383]) by TY3PR01MB11797.jpnprd01.prod.outlook.com
 ([fe80::1868:c915:c230:a383%4]) with mapi id 15.21.0270.017; Tue, 4 Aug 2026
 00:42:31 +0000
Message-ID: <87ecgewwax.wl-kuninori.morimoto.gx@renesas.com>
To: Jaroslav Kysela <perex@perex.cz>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Takashi Iwai <tiwai@suse.com>
Cc: linux-sound@vger.kernel.org
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 24/44] ASoC: codecs: mc13783: use .auto_selectable_formats
In-Reply-To: <87cxvyyazi.wl-kuninori.morimoto.gx@renesas.com>
References: <87cxvyyazi.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 4 Aug 2026 00:42:30 +0000
X-ClientProxiedBy: TYWP286CA0003.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:178::22) To TY3PR01MB11797.jpnprd01.prod.outlook.com
 (2603:1096:400:373::8)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY3PR01MB11797:EE_|TYCPR01MB18168:EE_
X-MS-Office365-Filtering-Correlation-Id: d96797bc-44d6-4498-a7c1-08def1c14429
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|376014|52116014|23010399003|11063799006|56012099006|22082099003|18002099003|10067099003|38350700014;
X-Microsoft-Antispam-Message-Info:
	705PYsMc6j2Y7ERFVsRGLh+3OvRH7kz59TdP76RlVbvIcnAo6hWd7z3gxNlxqXpHoffFJd7FXEOjuuo9G6s+n0qMn/MYhA3McM7mZCT+u/xRP67OAfjXPSUaQMf0DZ1JDb0HE8sUNxEbpzzY1MoMdDVXsjtF4VZej0EB8ZMA3/lAPsXi4iu8O/YuVHFWBYRO6pzHysuSqaLvKckiiPUi2272P3Wgu7gCsac7wTLjYbpi84ObJHB7NSXV6Bp+xZ/pKP8aA3/aqr5W+CaKt53mvLW+755xT0aIk8HYEtd1/pKlPWoGKXawOUZP9UUY5NuGBEZANsiAzTY906ubRpaVqChfPAfUGRQ31I+n2m8DRmSxGRhSojvZvTsYx38zJX8lxQcbz4XTcMvpDNW6ccTgym4tiA9wUVD+S1ibnWZ8IZPNc8CJpj2jJNSKr/3Pnfu9geASwz7JCFcIfWs/eiZ4l9l7HKiDjvSiuTqbjaeNgMV7K66HrGo6xUJXmdqWmYk/pcX9ZayxWVFOTPiGY50AlNgbzfxdVke3n1nwNoUnHfKFQ0ZEGoPU07V4grSfKZwogu4XF17c61Zk4bcWQUYBZ+OolnqMd5VqIu6uFytlEEXs4xEoVTDOiVPSGhgCV8GnRd3h8Ra/JCIuPzkSRF64cDuzbot55n+vD5JbjqqtkcCmtmNQYhne8drad8eNXuLkw/nW23CvdPDDwsnqlHs1qEYdDrN0OZFHyvHVLSRvEi4=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11797.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(52116014)(23010399003)(11063799006)(56012099006)(22082099003)(18002099003)(10067099003)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?p/BiHaDNiWCNhS1jyMEKqvr09zSCx5MLOC26LTDd7YKksqNzMV/t853dDKz0?=
 =?us-ascii?Q?PXXaC68U4uwtKbdSuIoD9ZmZlEqu3AN1WhKWi48pn+30acIsRk52JGFtrjMM?=
 =?us-ascii?Q?7Me4AOPnS31/aHhMNVMbziGp0E4G0hqpJyEoSOQ9ZpJT1ABsan1+dVCHD3GE?=
 =?us-ascii?Q?RUbl8aOCc3Wtkfm7dy8A+X/7qYt1BHHbkfZ99UvZAbkJdOpWm28/DsCIM7W7?=
 =?us-ascii?Q?ddQwJbri2MR9Q7VcGRr3ltFfNvxCR7Ukt6H7fpOT5MBYll69lzhpPKZCILK4?=
 =?us-ascii?Q?67DpK1zCUhVhNshqXC+0uzUYsLyaDnSA5N5MlcKgZ1EEWGEYZc9u6E8zq1QI?=
 =?us-ascii?Q?6WL4vhtxx3Y04JUk1dcI2aoTvqXq4gZ0rD0JbgMW8X6si5gqjH1/vhuXX84g?=
 =?us-ascii?Q?Po8wkxMyyM4c50c2IX1yK6WSHd70wvYb6Jq9kzVpd9vo7y0F2BBAiuJDYRnS?=
 =?us-ascii?Q?au+lIBamrp9r7hSBNcTRunSNn6r64fzRwW2abxPuo/KDp7LB7lCX2srQxt/+?=
 =?us-ascii?Q?/ZnhDpT0BPujlxrsS25LE1JBJE+dE7VcXqOeZaKk9IhNqBeH/HGTT/vcWOEu?=
 =?us-ascii?Q?NeiwnYh2+I/C+1Bb0cwUq7X8ohIFvPy0Am0J5g30gSDESO4O+UTC+ySooCaY?=
 =?us-ascii?Q?jJESoWcTR0ME8VUd8TIlIdOFEAH3xd2aGypCgN6YM3aJ4ndxUF/b+w7ZtHcn?=
 =?us-ascii?Q?+Ffzab/xtSdYy1ZiyqfPfDduXlpDD56FhUDLqZc/37EWj+hnPo/+U++yWJnC?=
 =?us-ascii?Q?IZu9ciz9JoqPafSjfNFKA6v431h5F/bc3UBMn7tlirqffx9k6KsYxV+mHkZl?=
 =?us-ascii?Q?eEJ+syhleVh2+Lnh1ydcEno8ES3L+xMnSU4+IeB8RO3LXY42ucLIdRteSyEi?=
 =?us-ascii?Q?zrmVjQMB9U6cMzdqAQhpPqhu+P1KO74LOXN8iQufs82lDqPoOkdx6GQf+knB?=
 =?us-ascii?Q?o3lw3iuoz6s3dydF1bSK91ciM0k2TgX877paHcJbGJGSGRivSfurhR+oLefw?=
 =?us-ascii?Q?qOBxq8x0iIQiqFgJiXbnMR5GSGzc8ZyVXWe86hx6c4UuxmlBDn//gmVCnXLd?=
 =?us-ascii?Q?hak/gfURTt/skiJaNjC5M5SUqDg8AkkcEIueG6UPob9gk9kLrdpNCYFuY6WC?=
 =?us-ascii?Q?V9Eg8H3kcoY8auLjDmORlQrhZ4uOBLdYHCRXHlFrIUuuPRqvzuVKDA+tMltA?=
 =?us-ascii?Q?i0u4LW9MNZIbOSNJ99iqRAaw2t/z5riKxsRLUAAEB+gIB5F632P06PnTWElh?=
 =?us-ascii?Q?JRDAY0XrMaAEmW5Qh7Wy4Uh/LxrrX9aullaZQNrnX5vbSpzoiSmGVUeHUw5p?=
 =?us-ascii?Q?ma/GUB2orH0FJTZB96hGueCMl3XojbrscihsLdYQhGVe70rF5PSo3NZak583?=
 =?us-ascii?Q?NVANX7+bgsODKnYrKqIuUVhzvy4sdTK0Z1wUoaQCoM6vrmaMLa5L6oaTbHSf?=
 =?us-ascii?Q?/kdd6ljM0qa8YCRHTGoKC8T/yPl90Dc8y/2iNvghkmVzvbJxgAxJGqRH2O8L?=
 =?us-ascii?Q?dfKYOefy00bTPNGefbs/bnJxY86EN5JOItfI/dYD7hvblvRgkFgd9ee0Phb+?=
 =?us-ascii?Q?hkVt37nh8SJ/+HkIxBjSqscbr8vnEZZHyWd6jG6RjmClQmXU7pUi5NkKp27G?=
 =?us-ascii?Q?cexp/G9n9WV68w1qa8hWFXI8rDrM5TXHVONssyL5TmxYiTKn4GhLpUzu5j/N?=
 =?us-ascii?Q?E/7cQdwt+4cLo62obT19v9hvr4sBgeci+bRxVLTGYXA8N9zqyXpfiP6hRzH9?=
 =?us-ascii?Q?0y1fC1e1KDJOpZrO/KgjBuHPlOMlazryO6dykqX4BBAA4WCvAh1Q?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d96797bc-44d6-4498-a7c1-08def1c14429
X-MS-Exchange-CrossTenant-AuthSource: TY3PR01MB11797.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Aug 2026 00:42:30.9014
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 80m8kAtmEtXMYsCSgUbUnUkFLE4p1ZVM5Wp1zYZB5vpJwqbDh3STtDD3hJIoN43wC5iJONiivFQ2OpVCqxv795tCs/YiHYgHNmpsN4fOzqcdX5YmSOyU98cNuLBpOiMb
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB18168

We can use .auto_selectable_formats. Let's adds it.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/codecs/mc13783.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/sound/soc/codecs/mc13783.c b/sound/soc/codecs/mc13783.c
index 086ac97e83866..a6231a12a9b09 100644
--- a/sound/soc/codecs/mc13783.c
+++ b/sound/soc/codecs/mc13783.c
@@ -637,11 +637,21 @@ static void mc13783_remove(struct snd_soc_component *component)
 #define MC13783_FORMATS (SNDRV_PCM_FMTBIT_S16_LE | SNDRV_PCM_FMTBIT_S20_3LE |\
 	SNDRV_PCM_FMTBIT_S24_LE)
 
+static const u64 mc13783_selectable_formats =
+	SND_SOC_POSSIBLE_DAIFMT_I2S	|
+	SND_SOC_POSSIBLE_DAIFMT_DSP_A	|
+	SND_SOC_POSSIBLE_DAIFMT_NB_NF	|
+	SND_SOC_POSSIBLE_DAIFMT_NB_IF	|
+	SND_SOC_POSSIBLE_DAIFMT_IB_NF	|
+	SND_SOC_POSSIBLE_DAIFMT_IB_IF;
+
 static const struct snd_soc_dai_ops mc13783_ops_dac = {
 	.hw_params	= mc13783_pcm_hw_params_dac,
 	.set_fmt	= mc13783_set_fmt_async,
 	.set_sysclk	= mc13783_set_sysclk_dac,
 	.set_tdm_slot	= mc13783_set_tdm_slot_dac,
+	.auto_selectable_formats	= &mc13783_selectable_formats,
+	.num_auto_selectable_formats	= 1,
 };
 
 static const struct snd_soc_dai_ops mc13783_ops_codec = {
@@ -649,6 +659,8 @@ static const struct snd_soc_dai_ops mc13783_ops_codec = {
 	.set_fmt	= mc13783_set_fmt_async,
 	.set_sysclk	= mc13783_set_sysclk_codec,
 	.set_tdm_slot	= mc13783_set_tdm_slot_codec,
+	.auto_selectable_formats	= &mc13783_selectable_formats,
+	.num_auto_selectable_formats	= 1,
 };
 
 /*
-- 
2.53.0

