Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11010030.outbound.protection.outlook.com [52.101.228.30])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45678248F7C
	for <linux-sound@vger.kernel.org>; Fri,  7 Aug 2026 00:56:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.228.30
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786064194; cv=fail; b=u76XwRXJOio87qaW2YRkPUJiOpr+Hz1OfJd4dH/RGYjeuuapDXS7KXz21hgTPczfaEcvA5JDla6PgEgTzYAn/4jQqReLboY8RGxbPmDcxEXbI4sX6XoRNqAqyhUiX+fSi+T0z7y/pk+7JhqD4JgMkHSjrryknwOYFsf6aqZI8xI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786064194; c=relaxed/simple;
	bh=k2eLtvpB4o2gkBXoANF6wq9q3VBKWhYCqvDHCbQrl+U=;
	h=Message-ID:From:To:Cc:Subject:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=qe7ostFKw7LuvKcUGpLoyUdZ6dbAouZPLLCfJOU2nHbTWLMHJA4uLoKHpCeixpTMpNK5VtPNG/nGuIWUD5e7IDhNA/uiCYrIhv72ih9Z+wR+3GcvFnTaabKnQr6IbpsiSv+17m+s1Dj3pZ+i6Ap51hvgcYFVzCjQIqrAvfgsGwI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=X7IfGUVx; arc=fail smtp.client-ip=52.101.228.30
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="X7IfGUVx"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=x5YM8SPu0HLeKu+ABgL9fJiUiAd143b/VK66bK2efJpRI52zIfEpbo0Job1GROf8/q89m4Y8hcMteWGNWiB1rXix6Yo4ePRDU+jnm7Dqq2YAH3pbUvpyufyNH17IvWH2pZEfUVtCl6RFc90Iv5ArWkmm1WyS1VcH1OXKQ6AJT+3xQG2GdefpbaZrKOd0fZOoZKnRNPS420vm28mcgob5hi47UtR60hDI6CL80i8S+v4xQCfcudrMQIVEo4/Dt3qkc+/W3UJlrnt6vTo+al7GWGPiA2RRNvI5hgdeqPz/OiogeB1gAZPkQubnPbgvFP0xnJQSDJ9PEHEBL9yqKRnACQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=h1sZC8dGwyWCjxljvmMd4Fd84wsBFEyjPZuCYUa4W7M=;
 b=MaXP0PosOMYkmYTL0aRgNnDMBTLJJXCDAKoKVFOb4dI7PkPyoDH1iWUB2qTQFRky+ej8wXQygPIpTPdYGe6SWb8Zd5LH1PbDNYenl6fmliKUfDLQxWT8JSL9qiqV3yxObLBMA0ATDyb1PQXT99VgwkUPIgiFCsSgBjJO+rYC6Ugo2P/w6e8TKKLTSJR8n6SbpxuASeTMKumXu1LxgT3SlqgoOQPkqPm73zr8N2dDD8c8xW6MAOqjtb0nlx5EqyypHfAdVRAzymX1hV/hqdZJFI0OPpEByF8YXpJ6yb4Rx9riKLopmvET3SWVXL0EtpZKBWEneniDGUqQMaVndbeigw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=h1sZC8dGwyWCjxljvmMd4Fd84wsBFEyjPZuCYUa4W7M=;
 b=X7IfGUVxfv9BYoXWS28U0rHXu/dcJeKag+IWIVbIHE4woZjWf4y3I4m9jypKSxGWFxunMgNFaETv8XLjvz6qcJ8NUWTxXVtYf6YrsNFq6xPqowBYlNqIw6jgGmq/9qaDHmPSnEqfClJpPTW88nwjR4SNTh3ec8is2qyoaDADvaI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TY3PR01MB11797.jpnprd01.prod.outlook.com (2603:1096:400:373::8)
 by TYCPR01MB6638.jpnprd01.prod.outlook.com (2603:1096:400:9b::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.292.23; Fri, 7 Aug
 2026 00:56:31 +0000
Received: from TY3PR01MB11797.jpnprd01.prod.outlook.com
 ([fe80::1868:c915:c230:a383]) by TY3PR01MB11797.jpnprd01.prod.outlook.com
 ([fe80::1868:c915:c230:a383%4]) with mapi id 15.21.0292.022; Fri, 7 Aug 2026
 00:56:31 +0000
Message-ID: <87tsp6sq81.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: Jaroslav Kysela <perex@perex.cz>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Takashi Iwai <tiwai@suse.com>
Cc: linux-sound@vger.kernel.org
Subject: [PATCH v2 34/44] ASoC: codecs: src4xxx: use .auto_selectable_formats
User-Agent: Wanderlust/2.15.9 Emacs/30.2 Mule/6.0
In-Reply-To: <877bm2vjjn.wl-kuninori.morimoto.gx@renesas.com>
References: <877bm2vjjn.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Fri, 7 Aug 2026 00:56:30 +0000
X-ClientProxiedBy: TY4PR01CA0021.jpnprd01.prod.outlook.com
 (2603:1096:405:2bf::19) To TY3PR01MB11797.jpnprd01.prod.outlook.com
 (2603:1096:400:373::8)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY3PR01MB11797:EE_|TYCPR01MB6638:EE_
X-MS-Office365-Filtering-Correlation-Id: e16d03fe-144c-4e47-dfde-08def41eb80d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|52116014|23010399003|366016|1800799024|38350700014|10067099003|11063799006|56012099006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	PwIfZE4UuTK4oWTw6yDEC4F0IXShgyJoHZ9CGx88ywmjqjPoyW6RkpdYhrBlzBaDx9L9Xl/RzPNmEPup3ZIDwkp0LVwBLGsFnRw6uxBWU9IWhYwxI9Q5fTjNFWsXMKy8JMQufcLbCiNqpfxfbc8kG420mZY7sPDshVFBvVy9YQwFjIcHPNrBT5a9399nk0Bk8NTIw3EPfmVvvJfUDC6XaiCG+8D/CAVLj6uR7hVR9tXvu36PZDdiVIYz4lTTYbvOyBd9fshscTQAIiL8HzUGshuRoImgY2Nz/yDd/LE1gW538RYc1moM9HKrroANhQzYRzOWIbFMY1dC7JAXra8+mQ12wleR3Uj4PLWb5Wv7szVMpRBKrmhArhR/hulcG0bRQ7tbzvDUMQnQ1slVpMWwzbm23FJCYiMiom9gC90XpaXkRg8ztnxP6ihLoPRVZNpTjTVZwA+BNRGkMZQXikohppPHfLqv+d0NEkiH25xH3IoxOMoGSz4qdYc4BmB5Arm/Gyo6I9zCYBnJzC4rRjZKWRZZhlt5Z3AGS5tx+ckc8zWT2fqnyYjIsBAFleUGuE3kvBK5AMSWh5Y7m79sGgEmdcgpQeInNMreNVDmDHl/qzHXKYSZKz3K3Fit6yELhDVdu3L4Q+SLYSDmSBo8jmphOgC/xjyMHScteJO5dSIxWH8nwZfeoi5TD24cbEHEyjr3QHjOAxRuvcTudHJsieDZl+sETfRoeMxxovaoubHxLY8=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11797.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(23010399003)(366016)(1800799024)(38350700014)(10067099003)(11063799006)(56012099006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?fZHfIEyP6qvJO67ME3tRZKyjwxjR66gYdZUsNRfEJ80Y+h3s3/k9skHkqMBR?=
 =?us-ascii?Q?xas/Sn5QbABn1wcSWGxefl6G7bn7PzmFywOprIMIYcQfSXUGr1nWqcmPXrdd?=
 =?us-ascii?Q?XxRTz9lItj8GeE0mM2p25b4ubBIYKWI0oS2Ms1eGyx+sbTChbArSVSGf1R43?=
 =?us-ascii?Q?1vOb+xQGAVsx8cblV0s8rAMMfEMoX9xmjgpHpYj9eOpu0VnaCB+uRjySVpUG?=
 =?us-ascii?Q?S7dVL/reagkf2bYXIiAOkRRgkLpJh0OM4nkwQlPOGbkKocAtBnoY5zQiRnOs?=
 =?us-ascii?Q?SjPc8Y/8NHOFRowtkLnF3Ih15dKKTbtSJA+1ggykx/8ZdUDBxWSs0i+yCA6N?=
 =?us-ascii?Q?Q0Pu7xzWxS8g6JoIJv1nVcRFTAwnW9Gbn/yxNc/5HCNojbj+H1g/pyUuXHQs?=
 =?us-ascii?Q?NUnMqvTjX/MA7tSvOocwp5/+lDiA60K3OF5Q8AvwYtuDtKCupLnzGT3SQYEf?=
 =?us-ascii?Q?jJ0qOFj0HtsTarVhnNbh3MkVpAyJw41TC9ofuiSUVDoMKc2dDRc/xc3ObBJy?=
 =?us-ascii?Q?H6+O7oo55d3gVvFFfgB6lmMzvZGCDInjxbvZA5ftrtXLsAcsLoYDWkzAJfjI?=
 =?us-ascii?Q?T8CGHoMvgpGoCoUCQFqZ0Tl7zDJnbQdPEXfMywRVC9AbDEHGtp00HyRPHhrS?=
 =?us-ascii?Q?QFPgO/+7c1/ktA1bmNEgdQ+1rx3mQ5Z0n5Vn8Pf2/npgcbF+9utfaT2z0ol2?=
 =?us-ascii?Q?bGNuQYGS5h2Wq6QovlxRptDmB6dhwCyNX8TRFA06sV6kUD2tyWfusemON/pp?=
 =?us-ascii?Q?qzx9rpoyk3h0NQWJeozva7E01k02tJ6MnFJKrM2nmNnnI9EWjiw2Z7Y1rnym?=
 =?us-ascii?Q?hYPudIE/Rz28AHoqhc2lJtXXj32X8GtXFIGFFIC5nb6hiuL7txct2jUU+K6M?=
 =?us-ascii?Q?l+Rv0arz3rd6poIcg4P4FjjJ9oB9QNtq0ijy5NAcoZ3DMd85n+rWrsSEZeNf?=
 =?us-ascii?Q?npEBlsIjWamqw/QklubJWy6/F45HBwNlB7diMU7BEwJJQ+oKxo8nRXMyVT6I?=
 =?us-ascii?Q?eqSbMzMYB4725DxKP69akAAsXF0JRAxQiNt5Kj1MTXlMrKGTq9nml9d538e+?=
 =?us-ascii?Q?uP/NRNIwbDja3i3n6F5hVKPEUjMO5wRuwXTPNRa7LcbsQqFo8PLl7xWnC4ov?=
 =?us-ascii?Q?sO9LIJZmkaV8xdiirVdKhhf/22Gm3L9/l3xk9X/JhnNQZBgV3Oob7eMCTY/7?=
 =?us-ascii?Q?LExS9O9FXmlQidTPZN2CEMeor49RCBIfpI/Fmq1pGqwguZkueAqZe4CEHaIL?=
 =?us-ascii?Q?W7J8xjn+o6Ulx3sZjB7IrhUbDS8BPeucXhj5hb83WT4TZuIt5e7M6q45BW+P?=
 =?us-ascii?Q?K0w6BrqL6A1lXnBY7Zdi+1XhL2CNljLtbA1UN6LGS6p9tjX3cE2l3wSh6duA?=
 =?us-ascii?Q?ZU27bY2Y8rE3Fz0/5A4ELAHd3EVwekdly3xRS/safbKwCqqrFTj0P+3KvnCF?=
 =?us-ascii?Q?GusfxL97NNmqQYUimTLUlMMfXetHbS/dK8bA34B1QkjbVZINXlTGcS90REQJ?=
 =?us-ascii?Q?jjp3y++F+7ArpbqG92SpMznVEhME2Al3T5kjHjvFWECFe2ervnpNSBCMfT9v?=
 =?us-ascii?Q?013PTYciR/23OSujYI7M0RmTpliprCkEqjNDuzpkSAwTuQChYUSWRRU76xgJ?=
 =?us-ascii?Q?nOY3xiQSnZZCriUn+dY9FyCPJYFQpsgD9Ty50Bzwg+cm9U/fVDO+PnmjChoe?=
 =?us-ascii?Q?N6jZEZtZghtPKN8S5r9mC9fPErFmR6xTkHzmBffb1wq1klXxm06/v+4qxMfl?=
 =?us-ascii?Q?797ytUqtz4FBjq7ZItMPHM+kpf3KREM=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e16d03fe-144c-4e47-dfde-08def41eb80d
X-MS-Exchange-CrossTenant-AuthSource: TY3PR01MB11797.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Aug 2026 00:56:30.9311
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 296kjXOktVM2G72hXcVuvj7RD69fItU7GXH7+t1ZNncHQ0ue2deWcdLT4PX4r11fGCMD6D4MiygYgPhD+ZSaiW8X/Q90nqU7CbUlqVuRpzW7Log6XOIoccV0pTJEXtXk
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB6638

We can use .auto_selectable_formats. Let's adds it.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/codecs/src4xxx.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/sound/soc/codecs/src4xxx.c b/sound/soc/codecs/src4xxx.c
index 5a34894752251..6e187c930372f 100644
--- a/sound/soc/codecs/src4xxx.c
+++ b/sound/soc/codecs/src4xxx.c
@@ -326,10 +326,18 @@ static int src4xxx_hw_params(struct snd_pcm_substream *substream,
 	return 0;
 };
 
+static const u64 src4xxx_selectable_formats =
+	SND_SOC_POSSIBLE_DAIFMT_I2S	|
+	SND_SOC_POSSIBLE_DAIFMT_RIGHT_J	|
+	SND_SOC_POSSIBLE_DAIFMT_LEFT_J	|
+	SND_SOC_POSSIBLE_DAIFMT_NB_NF;
+
 static const struct snd_soc_dai_ops src4xxx_dai_ops = {
 	.hw_params	= src4xxx_hw_params,
 	.set_sysclk	= src4xxx_set_mclk_hz,
 	.set_fmt	= src4xxx_set_dai_fmt,
+	.auto_selectable_formats	= &src4xxx_selectable_formats,
+	.num_auto_selectable_formats	= 1,
 };
 
 #define SRC4XXX_FORMATS (SNDRV_PCM_FMTBIT_S16_LE |	SNDRV_PCM_FMTBIT_S32_LE)
-- 
2.53.0

