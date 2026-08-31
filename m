Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazon11010000.outbound.protection.outlook.com [52.101.229.0])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 897F43C4555
	for <linux-sound@vger.kernel.org>; Mon, 31 Aug 2026 05:08:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.229.0
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788152933; cv=fail; b=dtY1zt3PDNjBFLK2PPJIXbp54NS/QhDEPXvyeeMTa4B57PDzi0VPHY073kbqWaFEqJfgZGMbyb7F5aTuAb8z4PVb+kI2rERV4bHUkJliFkKsYCRk2rfAczyzC6kGQ6AiznrMp4+/7EtT2YmHu7JEpx087zua2lCZzKSfHhYZWtA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788152933; c=relaxed/simple;
	bh=o0fUhGQ0A9Xz8x6B7y456GrnKH5NfFOsRDNn+lWkV3M=;
	h=Message-ID:To:Cc:From:Subject:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=bAqonUC3Nvjp9nKDkaQrApjB+ExJA5OJqvJTPooebEQFHGTHqGGGbFQ1OEfPvt6OrwJ48OqirdMbNEI231Jow86qEZtbwXB/+tLUg1Y1jJvuZieXP4WcG/JW2KO/vH4NVYIIzWvoW5nGv1b+WZHMOStg9hSRKANgyd4hkstySsM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=kA/4cp6t; arc=fail smtp.client-ip=52.101.229.0
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="kA/4cp6t"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ANokyBxxgMnxSehBGc+UMHuovBGkTeKR7f5c6oavsiTrQuyf0dcvLOvVR0YZaUsk6gwgasxkCgIJdQqmOuwbQFQFQdTDehfnEsn10Lm8Kjccdhm+0ajpmJ5aL1RFVmREVzzxJVCYxLqDm42AtDPTG3zi8rV3AICiRcPyUzkn5FbBs0zLsuFs4HJBTMrs/Sjyf0h5M+2exuQBamfqp+duwSpA7kCYKwMtF/wj7ssXDgrcSmdg+PW/TdnHjL/mgbsG2ZvgHFyT6qGwMJMV0O72sODf6XrssS5OTz9YTgWhoOSPg+Uzy7AIYdMaK+lqoJ665nBpu5x6UWZqI9d80TvZkw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3MKRMr+nO+ppejIkFGRqZjDWJpkIiEJvNWoc4SpOP+w=;
 b=uIti1JBOfkE2pRHnaEZvBOZ1FV5OVMJCy3F7sqAFuqvkKxTQVWAETBBqSefpn5ktu9L0f7cv3nU+BQOsk6+wyHNQPnUx9aifsdNPGaEDFBOw3e4Qmq2Zxcw4VvhFCHPmhVwnS2LoptzHefCzgSKC9wO/RzoVa7UtguQdI7s1FzAWfMBUPujMM1T1529WAR9NyLjL5t/Z6yZcyY/Rt3a3E+OzBy/r1eQejuXWKm1m+UjepxGnR/ehOLf4UE4op50WZzf9kZWxG8iDHRdlEoowhqWLdzOCja7Cf5hkxCtZJmlJwIbwfVQrOEkPIvg3QPEK+Fx93A3m34PeiSjmyFI3pw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3MKRMr+nO+ppejIkFGRqZjDWJpkIiEJvNWoc4SpOP+w=;
 b=kA/4cp6t09CR9SKNQ9pU4/UgxIqD0irO1G9h/XrsUj8s5GpoSxOU6zfOCHbIMgbqACNE8TvMWumFr1wwXcsbD2sqLZIK0IhaZglyQFp/m0Sb9JajQ23vDOXPNetrUYQxB52VC68ezS/JmWgozpFjR7yVbzfFfzVwwLRpwTGyezQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYRPR01MB16474.jpnprd01.prod.outlook.com
 (2603:1096:405:2ee::10) by TY5PR01MB18382.jpnprd01.prod.outlook.com
 (2603:1096:405:3e5::24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.13; Mon, 31 Aug
 2026 05:08:50 +0000
Received: from TYRPR01MB16474.jpnprd01.prod.outlook.com
 ([fe80::2a39:9988:dbe9:894b]) by TYRPR01MB16474.jpnprd01.prod.outlook.com
 ([fe80::2a39:9988:dbe9:894b%6]) with mapi id 15.21.0360.008; Mon, 31 Aug 2026
 05:08:50 +0000
Message-ID: <87ld9muba5.wl-kuninori.morimoto.gx@renesas.com>
To: Jaroslav Kysela <perex@perex.cz>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Takashi Iwai <tiwai@suse.com>
Cc: linux-sound@vger.kernel.org
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH v3 27/39] ASoC: codecs: si476x: use .auto_selectable_formats
In-Reply-To: <87o6eivpyd.wl-kuninori.morimoto.gx@renesas.com>
References: <87o6eivpyd.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Mon, 31 Aug 2026 05:08:50 +0000
X-ClientProxiedBy: TYWPR01CA0007.jpnprd01.prod.outlook.com
 (2603:1096:400:a9::12) To TYRPR01MB16474.jpnprd01.prod.outlook.com
 (2603:1096:405:2ee::10)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYRPR01MB16474:EE_|TY5PR01MB18382:EE_
X-MS-Office365-Filtering-Correlation-Id: 20614035-63e8-4e39-f709-08df071df1ed
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|52116014|1800799024|366016|376014|22082099003|18002099003|56012099006|11063799006|10067099003|38350700014;
X-Microsoft-Antispam-Message-Info:
	2VEl3Q8heOADX/y5LHJM7k6E2SCFMUQzwmY7pMlglAsXOCBojxw3MJGNZRB/qx24dgF1OtQ1QDhnUPx3GHPYQ/JSXQpEvuk5SACwfSIAgEOd/9N63VoCCDGe83MteV0DZi3m42V6yCiKyZTdXEJynsZ4Ctkn1sAzZ+mjYqwgR/UwCSqsUNK2uZ1uTUZC/LgEHnscL8m+Odoihz93p9wQmmlgULqNK3M4lv/Z/AdoVfIrws2v85ZnaFz6hoiiU0wYav8pJQERMpb00861dWXpYNiHUnHN4UJwGvJCK/IQmdw+NKaxf76W4BIRZ4mMZEbExYSP8TXbV+vI3C/FtWHoj7rCYBV4ULm/a8sJDwWocCE5rEljGlS6p9HlTzQOiruQhb7PZ4cmRzVEH5CEXiVhUPp6d+ssdAv9cVq7SJqWDQjwE47oYMsNd5ErJuiEqqNddwtt4yCTrWAed2wX4L8bQ/OpXKrVbtD3xC6tX1iNdlHvx1hrpJomxPKhGStvLBAgKwrGT7qVSFAkmGatdv8UGbUjPzxFiaUdNTLBv7dRoSjEhucA7npweyd+SctPa7gkK7/+BzgRhheE/H4ZRCwg/2iQZ2wRtNjoGJ8keI+qN/M8AJMdoW3IQwkPjIJXuEfRBT0Ju1h96Jk3RlSmtvxjfE+pRcaYSnsJ9lMikqIgd6rBOfe6horG2bWFMPKo9IlTADOaj+EqjwfFg4NPX7jgd91Ea51hcpZmEn2Tk8UeshY=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYRPR01MB16474.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(52116014)(1800799024)(366016)(376014)(22082099003)(18002099003)(56012099006)(11063799006)(10067099003)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?d7+OWDyvjqQ03jpSraa1cHE2cxMXIHm8MUyjplfZEyk5ydkpKaRBAuncmPGy?=
 =?us-ascii?Q?IFQkO81yRlEt6ovmMO1JM7o4TSBR3uLKR/MlaHEUgzl5sFnyBY/hLEvX/vF8?=
 =?us-ascii?Q?TywGolIkdkjPGo2tfQPb+OZ0dH/6tcUv2C7ISupyah82Mg2S5cwVWw+YcNM8?=
 =?us-ascii?Q?hPc7c7Och82GFJhuHvP61b9bX4TfKWZ5zXTSEcjGyjeiFPdwhDdV+TmabmXs?=
 =?us-ascii?Q?LsWuxqcZXbW1JetcAY8oTniS8FLd9o2PS2pw8jR26uLYbfbhiw8+dFSVRUEr?=
 =?us-ascii?Q?cDRfu8CfUn7LWZmNET31pOOxNxoRrDYKgN88YPrckjtMF2BRHKdjfv/7GNFj?=
 =?us-ascii?Q?fKf1ZufhxCefU9aL+6hBkJiGDKzbm5+vPjgDylBgpjW5HrFGJS7I51hFgMpu?=
 =?us-ascii?Q?PhBwa56Kwa6bXlj1Bi1/fn8dC8GPa9QEECef2oJzBT8xQh+u+o5vQ6y8vFeu?=
 =?us-ascii?Q?JoaruhnjZ/LQ4ebSIy02I9wgVyyqzcP7sLK26gUl4IfCshyeIbf5AfRgVQZF?=
 =?us-ascii?Q?Log3I5ok8V73dROSSaHWBQ0IEK8TKxMLHKtgyTsU1NTezxSxXXOTPZv1OADH?=
 =?us-ascii?Q?HNWev6o7/ZoeRxdt7VEXhuLrKSjaANR87JqN2pd5ElyR083MilyYuzs4xpuC?=
 =?us-ascii?Q?iH7u3qtZvpWZHdl6cdq6rmTY/hgDHVOd5wA47U9HMivao/toJb2m+X85/5ka?=
 =?us-ascii?Q?Qf7fhaIIdmFO51QvOHE0CCJhQRl0ye1D2qZrtHQL7wwpoaNLZ2ViQGsPoGOc?=
 =?us-ascii?Q?cH/1V29UlKQCqZHJhncEHP7PSdfBKIH9ZIO9ujcS9XF8iZeJ64Q9lAj9pzeO?=
 =?us-ascii?Q?JqTHDGlTBs+D+E+VxHuK6JNf9MshUErG7LLkzwuL04L3LpBKM4WMlWhzZ+3M?=
 =?us-ascii?Q?GMjuiPqwT4JB2QRbWXPb30Ry3Ry0TxcqxiJc/wrEoD2y/g5uthaSjxeiaGiT?=
 =?us-ascii?Q?bmz7F/7SiOJ105gbFy0W0iA2St4pzzxXFO5cAL6+L7Oo6Ydbgtj+KxvaTWDS?=
 =?us-ascii?Q?Ro3kB1D6/LmvTCedyEZW1pvoL1HS430e+RHr9PgBsjN3HPWVu92+chapa0Nk?=
 =?us-ascii?Q?/MoWzene9joihVhl22Wpy+C4ReuFlM8R/J4mfwOA3cb5kObUQ9MomehLoPL9?=
 =?us-ascii?Q?rbae39GMACDkH+cncsAUrhniwpBnjmD7CD3w1xl0wVyELSOOwl7RVyKZJbEN?=
 =?us-ascii?Q?6gZ2xFevP3IPZRL5zzvgDurUzFPP3wLtkiCMCPj1E7wNfJdrpukXvIBoTKX8?=
 =?us-ascii?Q?I3bm8m3Q3Ex4NP8HqDosi7mfyjWRxMlwWeOauOom3Mln+951ekVHTq+Na+t8?=
 =?us-ascii?Q?TUPPbfRdPGoYX3/zX+nj90C4DbkTHHvou7e45MSgLjcAz5oVgTKeJ64xyUWA?=
 =?us-ascii?Q?Jq6JFcRSjYwaTRXb5rNW9GnrnfnwzrE6txjMbkg4U5fvSsMb1n59GC5gKg79?=
 =?us-ascii?Q?q+Y4EErizDlAmD7JtLbduw4LzUScDolwM/DDF+fzy5cV6cW+vmmLpGXi94ZM?=
 =?us-ascii?Q?Jl/lUDNz8VpQ1W4YotmApu+JnrNc/ajQTx5x1EMh2pFaNlvHnIwqMSi2gmWx?=
 =?us-ascii?Q?u+GlXonqe+DmaQCjVcufG3nLSPkmZIZ1WUmj6sAoHHE9DEZenDvvJPtnCddk?=
 =?us-ascii?Q?S3hgX4pc8PDvzkXQfL1H1lSZqYW8cfLV20isapGHA00d+vnxIIgGKjlVW5ss?=
 =?us-ascii?Q?79mu9y8gIg2wcvVpJi6DnDijq1UBGWrINV6cvO6DHeszx8T2s4gH0+JhWZ7n?=
 =?us-ascii?Q?nosF4ESIuHN4gmWaTztM9IqL+rD6LjJSF0rN4QRR1ALUr3kTKzuZ?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 20614035-63e8-4e39-f709-08df071df1ed
X-MS-Exchange-CrossTenant-AuthSource: TYRPR01MB16474.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Aug 2026 05:08:50.6472
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: EDo/SVraUTuHdqjnIhulniTiARf8gOS2mrxVY7OmJmRjuZzcx3o0awxxQfrJq6MuXGf45JfLsOCGZFL7UV8D7xn+oC1y/pxzd2iuTY2Qv87YHr/++n7G8WLNfiite+Ga
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY5PR01MB18382

We can use .auto_selectable_formats. Let's adds it.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/codecs/si476x.c | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/sound/soc/codecs/si476x.c b/sound/soc/codecs/si476x.c
index d87141ba84388..9b904450ab8a2 100644
--- a/sound/soc/codecs/si476x.c
+++ b/sound/soc/codecs/si476x.c
@@ -199,9 +199,27 @@ static int si476x_codec_hw_params(struct snd_pcm_substream *substream,
 	return err;
 }
 
+static const u64 si476x_selectable_formats[] = {
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
+	.auto_selectable_formats	= si476x_selectable_formats,
+	.num_auto_selectable_formats	= ARRAY_SIZE(si476x_selectable_formats),
 };
 
 static struct snd_soc_dai_driver si476x_dai = {
-- 
2.53.0

