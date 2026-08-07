Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazon11011031.outbound.protection.outlook.com [52.101.125.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E44F246788
	for <linux-sound@vger.kernel.org>; Fri,  7 Aug 2026 00:54:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.125.31
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786064082; cv=fail; b=Cv4Obb513zpJzirGT5bcZSTbldHdQrsgRPiEpCCf1Fxel/Av4S/sRCC4DC5xAM72P6LA0fPM44DxIL8AELAkK6L/cMP00Cs7e0nDJTTaJDp5BznnCs3R3bPGKNuDwRmwfuVLwEkkDd8HBwim1Ttd8I1tQ4OWigQvBL6fniTaBkk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786064082; c=relaxed/simple;
	bh=g14Y1+0fk+OrMkAeb/kOh/PC+h6HB6Z7y4dxTVenS8I=;
	h=Message-ID:From:To:Cc:Subject:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=XUpwcVRfE04CWLIF7ryE4/HeDHaJxhDmfPtlGGNqXUmhdwrJwZ3vq7KaxzerWmQcCw75NUmAeEyg9kIJWfVSCVQFwCskh7PGgHjGb9t8BpsrLZKOyFSLNokENNGosdOY4boiZJ891cYXeX6Mf/LR7wsH++wfte1uFjkn67RRmes=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=Wx15Ihs5; arc=fail smtp.client-ip=52.101.125.31
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="Wx15Ihs5"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QM5dKIs6QinhnK6qs2zV/dkqAdO8IFqoMstg46sTV1wpfeOwuXSo5XlAr6lyTlUDmb58/VsxvRBl07ukPSBnFUlH+Np1OK/WHDfGuF4olIcKp+obrqB4Uoh/mwnTfcW3nNfeplKwz1r6V/uPt88nFzNupMb6+JWbF7GmkDRuMGDWxmaQJUGKX8MfcNkbTUFLE4SJb9nwdEDd4Oy8X5udNW5HPmWjWElwHkyPHYwCo7WYB2uDYS/aUQZxzDUCQ8myEhjnD8iXoDgJKHeUly567wb//no2KK3ICSxATlm6gr8SCsj+L8rwnjUvI7cuCdQotkjKjPs8SlKAjM0PlO8H/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=949A0tNu46iBDO0TUUjAGQ3w7f8bIIxfbw8MtLdhaeQ=;
 b=rNQC6+hcpf4BnsyTZ/Qy6kx2DiKItskUniVGmCDdyEvzu9R+i3DLKkoMTBhS/UIT1uOZzx8hYd/Lt5Ef2GrYF6Yg3qAmr0TVqXpS/36WX1k0I9RFfmMcTeR5IIOFHTxg4orZnd5d9bmkPbS+Dt4rr0Maw/A9DsGdUR0Mm82GfO8B8CyADbd3Y/a1G5d35sqcpI7c5nigXGq4VaA0ooEqPhaBT6fJb/PHeVzge2tholdRkfKKA5/wbmReYNbUXBuUlu/PWtq5ttM5O1EcE95fEWaBPVd1Vw4E3JLbSyvGg9MwKHcBrHYNK9uazYkji8OVlZzBctNco8nxUg5nMe45EQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=949A0tNu46iBDO0TUUjAGQ3w7f8bIIxfbw8MtLdhaeQ=;
 b=Wx15Ihs5naPmEHPz8bIqeH0z+lcKND5FrNAgBNMRdmr5i7/s/Os6RLR7Tv20uxXG5c+pJJn6OcvUqjQzSsnEIUWJz2fbGxqpjTavPJhNIP54wA4/7nTgK26NwJnOOf7xwgIV+kNPZIR3wiK7IibeIGZUFnEAtYpYfesWgitLvq8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TY3PR01MB11797.jpnprd01.prod.outlook.com (2603:1096:400:373::8)
 by TYTPR01MB11044.jpnprd01.prod.outlook.com (2603:1096:400:3a1::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.292.23; Fri, 7 Aug
 2026 00:54:36 +0000
Received: from TY3PR01MB11797.jpnprd01.prod.outlook.com
 ([fe80::1868:c915:c230:a383]) by TY3PR01MB11797.jpnprd01.prod.outlook.com
 ([fe80::1868:c915:c230:a383%4]) with mapi id 15.21.0292.022; Fri, 7 Aug 2026
 00:54:36 +0000
Message-ID: <87ldaiu4vn.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: Jaroslav Kysela <perex@perex.cz>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Takashi Iwai <tiwai@suse.com>
Cc: linux-sound@vger.kernel.org
Subject: [PATCH v2 15/44] ASoC: codecs: cx2072x: use .auto_selectable_formats
User-Agent: Wanderlust/2.15.9 Emacs/30.2 Mule/6.0
In-Reply-To: <877bm2vjjn.wl-kuninori.morimoto.gx@renesas.com>
References: <877bm2vjjn.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Fri, 7 Aug 2026 00:54:36 +0000
X-ClientProxiedBy: TYCPR01CA0148.jpnprd01.prod.outlook.com
 (2603:1096:400:2b7::7) To TY3PR01MB11797.jpnprd01.prod.outlook.com
 (2603:1096:400:373::8)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY3PR01MB11797:EE_|TYTPR01MB11044:EE_
X-MS-Office365-Filtering-Correlation-Id: 22fc1352-2622-4a8c-0e14-08def41e73d8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|23010399003|376014|1800799024|366016|38350700014|10067099003|11063799006|56012099006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	pNbdjrwWQ1cWIUD7PnyGQ4iP8nBseQ3hU+oUbWjItUs2m3KLoaFG00qDwoVuuBhWafcDqBhfSP7kLfSNSa+xKjdcIYvjp9HMnwG495tKaQPk9zacej3fmOqDLDjFJVJvpt5fo0dsuizNNaIqkvyeWbRg+c+5u4kRNFSI0meYbWnC8pQbB21h9qsRhnuxAld4JtFkDLSOujND3BfYuRXN3FpdaNdsDhc3GQsjF5oj9iEKndKZ/rQQ7WMDjgJsxmnF/kUe2L6J+1KNA1Xz4LEiYZRZ/LeHH5CVRafFg2K9sh1O1aQZhem8ljDWT3qvf2TJAuzAR/rjZSWoPwdhe1CdtKG3p5sFgsDUm+VQwIf7B1D2p6YHrASJDiJ81kAt9oECiSkGU5teAKPIneXG7R4PfOkR9uJjoHnUD2MV2cLzXMtBQ1gpwfS4QZJ2Dvd+pv+NlcdoLLwsrb2B2Fs+xlMh/N+HhE3AMr3hhZPGsroBLLw3NPfP43MNnQXPfNzy4wE3WnRPRsfj6EWH5spqoEvvJ1vT6DPagHYIfsgu6Tt1Eq1/eonk9zXhHAafIvDJL56iESGGJ+NwBNUe0EeoYcS2cFd/7x3yfwRZyiaKRV6nRp3xctVjz5fum75bU2x3nJhUNY4xDFD5G7lIzKHCBKloClTjyixYsdMYV/7yvjK2xPf6KO4X09P75mgYDU3vePAQy0z/tfpswIts+UMUw4tB3lGw/4LmaFJSjoi88hOXnJo=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11797.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(23010399003)(376014)(1800799024)(366016)(38350700014)(10067099003)(11063799006)(56012099006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?kj7/Mho2olGHHVbIPBErBDAO0jnMV0tagx1xSTSHP1wRf1MUyBC+JRRaJ1N/?=
 =?us-ascii?Q?8nSgq1ckNBZn2XSXI7HR34W4WSwXunMpow1JSP4zUyiYv45YLG1v/KZ3pNPr?=
 =?us-ascii?Q?XydZFSoTSIhSu3fKAxsCKG/jNFBOasHkKClSI9H9B6mxleAhiKEAr8M32h4A?=
 =?us-ascii?Q?EJv7BlhOmfDN7DVSsyJosNo+PxrlO1IZFbT8ItVT+52hwlIuNV1iGHcpS+Fg?=
 =?us-ascii?Q?CpE6y56huRmzgCUrA/0teonOMgycxRiziS6AFCkusPz3grhPq7fdC9aP2iO9?=
 =?us-ascii?Q?iDKFybx3Q43wDSGHHGnI9oHp1yJFKd8LXOD6l7M1kWrQdwg4Oci0vdgoxxqH?=
 =?us-ascii?Q?XloyO3FSrC9CUbMx1VWxNXw5j5Aqo1mZcr80fcY9lVQfkz9GBJRKbWb6lBQj?=
 =?us-ascii?Q?x6O9z0qOBIc94orfSSx0pqLo+ozZf1SM95eMKLxAPq0U8j54MQ4RyJG38iwT?=
 =?us-ascii?Q?VFBOA7Bkgdyt7ng6fi3d+Qp0WvgzXL9YcYx0WaIm4MsjAQfO4AqMpkZupdbw?=
 =?us-ascii?Q?pCNpTgSoDGnadA9mfyC3ZWg2D9VqHjqC97iSCr5Ml622jMTpq32xZkAECL0Q?=
 =?us-ascii?Q?APbQGYTkv3xpq/Wn+b8CdtXmVbT8nWTxf8wIawG0T/8KSrfI6P9D9LJ/UOpx?=
 =?us-ascii?Q?j48t+5LsQJRdU/UEQbbQ2vmOhmU7Poq+cWimIXK5Da90ac+E2ZtbSnT3sBB9?=
 =?us-ascii?Q?LXgLdts1g8CLC3Y5pdRfzwa/Mj6frcHymZGUHt4qeHDMZRjZkgfVzX+hH+8G?=
 =?us-ascii?Q?ONkXlwZ9K6Hw/SguA372neAOiJNTrS9dRC/DQK1ai3/0WEXp2v4iNBcq6RfX?=
 =?us-ascii?Q?QIq+3hnkss3WOynMO5oErIdLpgjHswwmRIxRd+ciISQJwsjF+zM/YHwPr+Ur?=
 =?us-ascii?Q?W4QNf+J8FkDede4LHql7HxBLrTgRRYorp6tRowfw3GmsSiQqmHZPHOyV9Exq?=
 =?us-ascii?Q?CA0GjgCt08NR/Thw3CR9qTePED/0GwNK8RcW68vppytSDr6Z5LjvvZaBN9n1?=
 =?us-ascii?Q?fPMbFXyfYfUkvIc+Myx5zID5MyffqzKCXFQL4z5lnjPwch8CokVbnCuiyfe5?=
 =?us-ascii?Q?aXN6I7wRY7RDFE1H1GAsvIZoSjaW4J/q75smn9ChjtDo9JTSkAy8O7f11S3k?=
 =?us-ascii?Q?DjnuDpzHzufQSCi7l0UKpToYK8FaFJqPXHCWCvdyj9Uq9ZBYjCwmav0uO33q?=
 =?us-ascii?Q?sgsRrgkMECWy5xG2SeTAoEgD/rAcomM7MSDe8rGZ5q9ePUjMQG95QQ42oyTQ?=
 =?us-ascii?Q?3fzk7VnSDeRJRzDXXWqPJyk+HpQUTDEWgfG7Plz2no4e2gFlURr8SPDW4fzg?=
 =?us-ascii?Q?5c8axeT5QDlIK9+PEe7jC/Yn7b0sIaw7ATE20sVCe62Fe2xYdOnv6dPxS++t?=
 =?us-ascii?Q?0H979vewpnLg08WC6Rv6N9bky2+odj4IIulleJ2F04bMmp9uKVZpcPL/nDan?=
 =?us-ascii?Q?7f2upEpgCPHghRM1NTPCKJVUKDryUFhJocp1/4TsTWmHLgyc0o4rMkRGNR8h?=
 =?us-ascii?Q?HiztQ5BnKcggN+qRkXugitI4cZ0F8kwjtlVXvoNlzXygTZNsaCJfOxAxZakU?=
 =?us-ascii?Q?I5Ix1QkikdFj18j6dOJPG0XfPcWf11nGTw8qM9/FfkUpHED9n/0GcyI5/kTw?=
 =?us-ascii?Q?Nl7iaY5qV15kTbU6rCvxq61WPtILvIXf1MLnYrDa3veG1lNdq5y2K8I/+MAw?=
 =?us-ascii?Q?vhanzLigwqevymT/auM1WSyI0sG9i1Bbl8sdXkGs9NVKcCosTCm64VIDOPZJ?=
 =?us-ascii?Q?N26YbX2TF48tTEK0UEF5MBoGblznTZbaU40aibIklisezCHbbYbj?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 22fc1352-2622-4a8c-0e14-08def41e73d8
X-MS-Exchange-CrossTenant-AuthSource: TY3PR01MB11797.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Aug 2026 00:54:36.4722
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6HUrabCmymzWDUc+7Ek6hXvvHSx0yaF6xg0UoYISkzd7/aM2bmNd1n7osZVe/SDRHvR2jQE4WOgfQI/7JsdHBv3kgtk/EBAL2wFMwNV7RaZc9CosviLBEmVPQravajhh
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYTPR01MB11044

We can use .auto_selectable_formats. Let's adds it.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/codecs/cx2072x.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/sound/soc/codecs/cx2072x.c b/sound/soc/codecs/cx2072x.c
index 908344ee58920..6e0de380e2108 100644
--- a/sound/soc/codecs/cx2072x.c
+++ b/sound/soc/codecs/cx2072x.c
@@ -1521,6 +1521,16 @@ static const struct snd_soc_component_driver soc_codec_driver_cx2072x = {
 	.endianness = 1,
 };
 
+
+static const u64 cx2072x_selectable_formats =
+	SND_SOC_POSSIBLE_DAIFMT_I2S	|
+	SND_SOC_POSSIBLE_DAIFMT_RIGHT_J	|
+	SND_SOC_POSSIBLE_DAIFMT_LEFT_J	|
+	SND_SOC_POSSIBLE_DAIFMT_NB_NF	|
+	SND_SOC_POSSIBLE_DAIFMT_NB_IF	|
+	SND_SOC_POSSIBLE_DAIFMT_IB_NF	|
+	SND_SOC_POSSIBLE_DAIFMT_IB_IF;
+
 /*
  * DAI ops
  */
@@ -1529,6 +1539,8 @@ static const struct snd_soc_dai_ops cx2072x_dai_ops = {
 	.set_fmt = cx2072x_set_dai_fmt,
 	.hw_params = cx2072x_hw_params,
 	.set_bclk_ratio = cx2072x_set_dai_bclk_ratio,
+	.auto_selectable_formats        = &cx2072x_selectable_formats,
+	.num_auto_selectable_formats    = 1,
 };
 
 static int cx2072x_dsp_dai_probe(struct snd_soc_dai *dai)
-- 
2.53.0

