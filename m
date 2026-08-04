Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazon11011065.outbound.protection.outlook.com [52.101.125.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7C2637F322
	for <linux-sound@vger.kernel.org>; Tue,  4 Aug 2026 00:40:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.125.65
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785804045; cv=fail; b=fwJXNOKTPnZaZRyJ2jeNuErM3wYmDLMNyj6GP0OtzFh9nHG8lJ856mveg94vPKtQQQzq6BULcyQeqhKvv57JEUZF6E+9F+gDu3lF2O15j5R2fqY6dansuv4c6kVPAHX7RfmNMzQgIV3zYcTt4P0o0XZlGZ4ht9g4HkJR+ujtmPI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785804045; c=relaxed/simple;
	bh=qhlUkQh22Hr+S+oHpolK7MfNWlOBhkYckaOi4J+Sk18=;
	h=Message-ID:To:Cc:From:Subject:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=WdPmY1L8goOnO53EBoUWvXVA40eivKSM6axIUzPOlpcYK/x4tTkaWT38FIIjLIYoRWU050dEQjDRNh/lo4SywNOlC1GNypDFUdDU4CmPdChSHXhrLsaEddXpSTlJVzf2ZZsRnnsAVtse0twIijuAS1uC7ksAljo8Yuhqwww5Ta0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=TgmslOIf; arc=fail smtp.client-ip=52.101.125.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="TgmslOIf"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZNmdSnfAqyLLpjzVTiSdERxcLvilW/sHh38xSTJfhyOeaTFK7krx1WPFRua88akzSsXJFzOhwUuy60LQUo9GKSu5dy/H9MECCYM5SHUU9OH3n/ZukKwJhSi0rS6Bz/1w0oV23Y2nwNvPySWTa1EI60lJ36Vt/gQQ9/myllpBKkm7q1PsrY82kfZZsfnqoLOosy3UGRgFGgQLR36IvL5aJVGpyldv0zwwyhkfWoOruAfYVsncMCi1kGXfOJR3Eg5zn2OBB8PSrIc9/9O4qQ85epySIoXBvaBpYk3PfgIkLZzbnMkKlUr9sasobtflnsHX6cNPC8wNfOHJHXvTtDHO+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5Wq4B3C8SONeoK20bTARxUC89uOYYGER3xuTsEA2QSU=;
 b=OBcmfFThi98FNbiQ4eapE/KetiIqO0oYL4lGXTnKKkzeO+QbKE+TipstuPLaBcesmquoBRw7mp5ZPST4grvYlepFX9Hteus2qh9lhvb3qIpoExRwWfGzDlcZZiewrFjBzvdG+ye1NY4vKAT2DpLMzJnhr+kwr39xak7oThmjWqC+42GuOJGXrbQ0+YnxmmKhZiwHmiC85pqZDA9IELtNjSVlNt/C2hZSh38g4aTKv5Z6RpWq5gN7MArAxRZkKf2jRKpWUq8M5ZD3I9G1mmifc1bUrKWif6gvnmo+abhjmI8FkXpxhtCzNo/5sB6QdYgWqtWlX2PDAy0AG3OISopMYA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5Wq4B3C8SONeoK20bTARxUC89uOYYGER3xuTsEA2QSU=;
 b=TgmslOIfCgVqZ14eVaNdDj3EgaiYKlNSayWpW/bLQiNcsAUTZ0hjqRSK8/tV4IzP3QcgsfOBrDfiKCmplKVooC7DzHGj/leSOBE/2b58iinWcbYnPcpVYivM4FAoMx8Mis9I2WEBaY56Gs4ql3jSAsbFfiRE3MPN3bvTs1V1iGc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TY3PR01MB11797.jpnprd01.prod.outlook.com (2603:1096:400:373::8)
 by OSOPR01MB12264.jpnprd01.prod.outlook.com (2603:1096:604:2d9::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.270.18; Tue, 4 Aug
 2026 00:40:41 +0000
Received: from TY3PR01MB11797.jpnprd01.prod.outlook.com
 ([fe80::1868:c915:c230:a383]) by TY3PR01MB11797.jpnprd01.prod.outlook.com
 ([fe80::1868:c915:c230:a383%4]) with mapi id 15.21.0270.017; Tue, 4 Aug 2026
 00:40:41 +0000
Message-ID: <878q6myaye.wl-kuninori.morimoto.gx@renesas.com>
To: Jaroslav Kysela <perex@perex.cz>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, Takashi Iwai <tiwai@suse.com>,
 =?ISO-8859-1?Q?=22Uwe_Kleine-K=F6nig_=28The_Capable_Hub=29=22?=
 <u.kleine-koenig@baylibre.com>
Cc: linux-sound@vger.kernel.org
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 03/44] ASoC: codecs: ab8500: use .auto_selectable_formats
In-Reply-To: <87cxvyyazi.wl-kuninori.morimoto.gx@renesas.com>
References: <87cxvyyazi.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 4 Aug 2026 00:40:41 +0000
X-ClientProxiedBy: TY4P301CA0030.JPNP301.PROD.OUTLOOK.COM
 (2603:1096:405:2be::9) To TY3PR01MB11797.jpnprd01.prod.outlook.com
 (2603:1096:400:373::8)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY3PR01MB11797:EE_|OSOPR01MB12264:EE_
X-MS-Office365-Filtering-Correlation-Id: d091488a-e6be-496c-bf6d-08def1c10309
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|376014|52116014|366016|1800799024|38350700014|11063799006|56012099006|10067099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	7X6Ktr5wGD8qz3fzNodoA5EHe1cWLMd3zkvsyeaMGh83cJ5J6yivvHAeDXb5By2zZ5jvb+hua7x/rTcVaWX/Yh9s2V7uyA5E67VKktuJ7ROC65+1AneHTyiocdXZucDtGdOH8yDJKy/mw8+ALQBIqSsj221iFswF7+8kKzUKI5QLw7PS4DzgZMZdZOiG+UPjdQqaSm97A/kgt1k+DeSkoBIbSMqlJt1CKNzhaqYnRJ6YCMXELPiFVtlFFK0ukDRaFOwyLvMnalV5NFIOq8UkvSw/EP+IuiR0Ykr1AUU2N0ef7bTehijPVOdG8triZzYWjxbpsutEyAVq88QbOt4YQXE+0lmC0DG4X0/f5+DuSZi6UPgo95S9/blnmXTf8prrsoN7C6rm9b5nELAnSM59pgkOiXXyCBVPLSAeniXxyd7uY7wrz68N5IKB/owmhCN2n4C1WnALA1OY99A3v3F5O3YHi/ZNUQr3CaK20ArsXMI9ffErn4Ss9r+i/HqI0SWQx+WZc+1SgpzOZXH560lBjz9ocy6uB/0kzU/Rvh+pIvFKXRa9Z1gLSlQ57nyvjh+hdlhlHI8aCx1B2rAqJoPIDG4YfbTFzA5gp88t372Sl7XvEnYN5Xupwv8kyLhYwKszWpNULBIPLj8moOmDlqiwIn86DfgLLkAPB39jfBC8XEAHMTkZ6XUzlBDuwnqf/oE9drpfXXa1Pa9djjR0nJbnsDxDZgHlRwxu5k5yiVcvFuA=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11797.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(376014)(52116014)(366016)(1800799024)(38350700014)(11063799006)(56012099006)(10067099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?UvETjFAsAQPeOyR/uXMVtdYtiwQCPkRtcH/H9/cb7DMWmQRAAC1TKVBTMcip?=
 =?us-ascii?Q?2PSZ2IyO5dqk8T1EzGZZzHOrZTt44vOTIFDE9W5+BS98i6NstjfgJLZylpYl?=
 =?us-ascii?Q?I2jn61sFQvBkdFYPD/ul5/zvEFBlMG0O0eCk3NsI15vcfsMgOG90vsP7R8Dg?=
 =?us-ascii?Q?GRk9pv1wHwtM4otYKGT/i18cl3IFJ+jWCIfQJuM/AwdOKE3CKp0aDNem+qEH?=
 =?us-ascii?Q?59hJQfDLHawYwsjVlUQkiyFFZU02jGZYeiXWZT8k9IKewBx5cckgwYOhEPJF?=
 =?us-ascii?Q?fiUjLPwyXNABwazeFnwQs+x2P3F3ug0g7vrEculxxz6hOHGp9vMrW9y/d+F+?=
 =?us-ascii?Q?wsQLXyI1U1/rvZGN5tZKcPQ4ndViKdGhcfBrAkBhGTjXjajqF5hTngMwQMDE?=
 =?us-ascii?Q?6p6iFN+CCtIHekF5D46clew6BkZQXClDLD3bSyk5BQIB4Sq3tiCOzIFFjCl7?=
 =?us-ascii?Q?e7e9MLdjufkvFpjclI+i0pHU7vyNurh8bAjX08zr/ZpB0R0C2s4zW6FEJZ0n?=
 =?us-ascii?Q?e0IQYEwwB+11mzuYH4PabYdddgX3nLsoKrouHaW1ma6dvpGbipMooXe1Jc7/?=
 =?us-ascii?Q?YGP/s+zeIO+3o5WGUUl+EsJ6vf3R56kUH7k5hB025Af1L2NVp4wFRYiVSt3D?=
 =?us-ascii?Q?bg84iI6IuqrFbgXOlpotlK0JQ+vz1pw4y2IIfNnGQYmsEUjfgDurFiwZFGaP?=
 =?us-ascii?Q?rDQlJGCVcPf92bpzYYe6HlDL+oFQQresU95GxDTp6ln05HLtF8cw6h7QbMrK?=
 =?us-ascii?Q?B4EyoF9MSwCONTIMtlboSchfpdmu1Zv5B1Kp6Zm+QTDuDN7R98Ef/fLaaLOp?=
 =?us-ascii?Q?qKAKaSDM0J3BXuK3CqV7/gTNZOviUSjcejRhvZz307FK+Azt3SGmh8Z0BUgZ?=
 =?us-ascii?Q?aqVucs44NNsrDrTF5Z0kKnMuRJk58dUO/RczsIN00yIx/HTVQOnj7yFMByTS?=
 =?us-ascii?Q?0oEAjTAR0ZAlwHtaH0CQCAiIgwjZK+13baHcbbdlNWu2KZIFv56lCkoZIvim?=
 =?us-ascii?Q?dVTDbkTIo2WrkJZ+eqhb1jLqmznehXSFdeKItejTlffj4kaMFQqfvnzd6BQX?=
 =?us-ascii?Q?HszY8OYrLVrXsiInYTjoKoLFmGuWbeUPBtO1RZJLessQsZSMD6fAJdbtd4LX?=
 =?us-ascii?Q?D3T9p8fcL94L2yQiYzA440kGvx3+oYIvVN5JNXX6vUmWZqEX3R7+ztddNNpC?=
 =?us-ascii?Q?6Cy3hpFwKizcdaz7DSp8Gztucvzz4gRKWZc443tC0cg3WWZMepnIkZJGT4Ab?=
 =?us-ascii?Q?CHaE8hIziNrney/f8CX4dV9zrkLy/4UQkOGv/HBAPciOdhRhsHtrKoewOHeP?=
 =?us-ascii?Q?X+7QsvyG7tLl3wj0MyzE9jWKi281tCivbfYN6Z6TY3zgiNpkLhrhYKt2lNI5?=
 =?us-ascii?Q?gIa8apPePss+qBP+KNNKOgXqTU9crk5eSLgksWB/AuQNUmAh5C7fZ/VGOXVr?=
 =?us-ascii?Q?GF2MXsBjOaZGgXO6fUaoToi8eAe1s/Uuk5UqRRFuuZB4XtCVK7/u56JNtz9h?=
 =?us-ascii?Q?4qSIBCr7DWkma8kaYEt1gwfghU7JzY8VPVYenXrb9t6qwekefplz1EFm8Vd9?=
 =?us-ascii?Q?spADyAWNiQTyb2oeXHP+06I/k69nS/JD4vJWbSRc2B+rxAZsiOhAJ6Z5YiKO?=
 =?us-ascii?Q?mmmQpnrP/rudsgxU/h/rQ1LJVpb3dk585OAv0qZM3KMoOD/AC3UTRxnkZaGw?=
 =?us-ascii?Q?Hnpq2gogoKbA1pXUdNHplMVRk4jBsm+JTv8mCpaVnrY/40Dvo4YX4gPI/j1X?=
 =?us-ascii?Q?pfKw61pRSLJVeT8nT7TuEFgK2p1CIEmKHwdzRD+zXnmbKgHvJNkw?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d091488a-e6be-496c-bf6d-08def1c10309
X-MS-Exchange-CrossTenant-AuthSource: TY3PR01MB11797.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Aug 2026 00:40:41.7376
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UvYjEchSc/d+vFqVlKLIfTrRn088InXYVDv1rEWmAcXbGYSstaNIYV3O0WutulXwn10NRrj6vTrvtRWK0rEx0rR/dkWnbWqb8bjxuOaBBPBdM2yODmLvTNLsNpTKhdc7
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSOPR01MB12264

We can use .auto_selectable_formats. Let's adds it.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/codecs/ab8500-codec.c | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/sound/soc/codecs/ab8500-codec.c b/sound/soc/codecs/ab8500-codec.c
index 2cf96cbdd294b..e315638499b69 100644
--- a/sound/soc/codecs/ab8500-codec.c
+++ b/sound/soc/codecs/ab8500-codec.c
@@ -2079,9 +2079,22 @@ static int ab8500_codec_set_dai_tdm_slot(struct snd_soc_dai *dai,
 	return 0;
 }
 
+static const u64 ab8500_selectable_formats =
+	SND_SOC_POSSIBLE_DAIFMT_I2S	|
+	SND_SOC_POSSIBLE_DAIFMT_DSP_A	|
+	SND_SOC_POSSIBLE_DAIFMT_DSP_B	|
+	SND_SOC_POSSIBLE_DAIFMT_GATED	|
+	SND_SOC_POSSIBLE_DAIFMT_CONT	|
+	SND_SOC_POSSIBLE_DAIFMT_NB_NF	|
+	SND_SOC_POSSIBLE_DAIFMT_NB_IF	|
+	SND_SOC_POSSIBLE_DAIFMT_IB_NF	|
+	SND_SOC_POSSIBLE_DAIFMT_IB_IF;
+
 static const struct snd_soc_dai_ops ab8500_codec_ops = {
 	.set_fmt = ab8500_codec_set_dai_fmt,
 	.set_tdm_slot = ab8500_codec_set_dai_tdm_slot,
+	.auto_selectable_formats = &ab8500_selectable_formats,
+	.num_auto_selectable_formats = 1,
 };
 
 static struct snd_soc_dai_driver ab8500_codec_dai[] = {
-- 
2.53.0

