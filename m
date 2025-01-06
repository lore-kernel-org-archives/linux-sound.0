Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11011036.outbound.protection.outlook.com [40.107.74.36])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8D0617C
	for <linux-sound@vger.kernel.org>; Mon,  6 Jan 2025 05:49:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.74.36
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736142593; cv=fail; b=OPLUM8Z81RN4DMSl0t4KLrbmq6M+yVcstvQXRJNQiYbdYX4knskft1d+oPbeaGVBHxaq9Df0MbAaN+X8qxpW4OkyFIEmi5XT5QDTkEPV0uMuvlSk79gwpNSlJ1MwUVbs65MHfD+t+MmoGK2JbX3h0ZStttGOTLCEU9PJ7s1/RsM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736142593; c=relaxed/simple;
	bh=v7Gh0yu807l1qwUuwvWAPDaLySyF9L1zH4wn3YeQbf0=;
	h=Message-ID:To:In-Reply-To:References:From:Subject:Content-Type:
	 Date:MIME-Version; b=TYH6Bsfp9+igftXLoUtcpO3erLA+2RiZHW4/rnkn0hK1BtImA5eMh18zEu9/N7D6q9jhlmxqzMh0a0wpS7e6oUqUGLUNLiItJtwyH3EpL9Aaf5ytfhHdsc4KN7/LjiBBhE6MEjOTb5YQ4spme/rLBYhEqQeJZ07etImLLe+PVWw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=MJfMw6f9; arc=fail smtp.client-ip=40.107.74.36
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="MJfMw6f9"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VG+yEEYOpNHt023M4iF9NcPhILugjlEUGBYCRJLfxArd8U2rVa+zLoUcWbU2Z44sZpeVgk5K66OAGripW965B0AbM48Mo85cc5RVckNA1uy6DS54ITgbAr/w+oEI9zj7KMUuAyqfsXFLodwWhm+Lk2LeuyRMhVYhZDzwsILujyC0Xozdz/3HsGO5hCMX5MnivxPEj7QeUFdf1FYEneds3h9msh0xw1+Lv4xk2SoeOyexVIrLhMsBLBYH6J0gfCNcq9i3AD5vLtB9J+CfRJoV19GmmjfJT5v1HZj0Qu96TUh2wLUMpOIeONi/snoOYVYFiBDiyoYq/Egv9f2apNXTTw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ukbgokp6BcdP4zI0o7gxBu68uiQJal0gfmt/12CkmD4=;
 b=VbhnWxQ+CoT+Fvpn8TdFiHkg2YDpT8q2Gt9u2d4curbvsYmvQQuz0gGupAsb+YwaXcJL3kXwFdyWz9CTb/71cnKAK8TyQkGnVAn4U+Bk7gtGg2t6pD8YDHbiousiRl8wypQcrpBsn/0AkryfTyywcBwtNa0E6yag4h9OSf3WwnXm/4OO2lHUqSDXn9BhLJb5yaJ15PVmQ19ybaZ2W062hJxfD34omqEEvlfm+5qvMX8fYhBsXcqDz73ZK044C2v2P+u/T+VCmFIsiudFsNRKK+XZjoGOgLL8Ce3qrW3gCSUQ99TxKVo3CFaFYfeXRSE2qDiFVq026QNiZKR8iw6DXg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ukbgokp6BcdP4zI0o7gxBu68uiQJal0gfmt/12CkmD4=;
 b=MJfMw6f9vHedmeRN+tM33Bb/Ar2a2UAgmJcvC9YUA2eLeEIbuTLG6lypkUsRcEXxOrPb+fJh3gjxqbQVZ8ShVMO3rDrIwYtsSVDYYkU6QpTrl9BM+edv6ZTL2qnkXPDT5jUvF/yxocH6RMUDzQiARjJu8b4Ejh12SSFrKJnaso0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by OSZPR01MB6247.jpnprd01.prod.outlook.com
 (2603:1096:604:ed::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8314.17; Mon, 6 Jan
 2025 05:49:50 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%4]) with mapi id 15.20.8314.015; Mon, 6 Jan 2025
 05:49:50 +0000
Message-ID: <87pll0o5j6.wl-kuninori.morimoto.gx@renesas.com>
To: Jaroslav Kysela <perex@perex.cz>,
	Stephen Gordon <gordoste@iinet.net.au>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Takashi Iwai <tiwai@suse.com>,
	linux-sound@vger.kernel.org
In-Reply-To: <87zfk4o5l2.wl-kuninori.morimoto.gx@renesas.com>
References: <87zfk4o5l2.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH v3 7/7] ASoC: audio-graph-card2: Use extra format on each DAI
Content-Type: text/plain; charset=US-ASCII
Date: Mon, 6 Jan 2025 05:49:49 +0000
X-ClientProxiedBy: TYAPR01CA0053.jpnprd01.prod.outlook.com
 (2603:1096:404:2b::17) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|OSZPR01MB6247:EE_
X-MS-Office365-Filtering-Correlation-Id: 4205b672-163b-4416-8a5a-08dd2e15ef45
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|366016|1800799024|52116014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?CCreLxHhaR7u3ojCB3Rk80Gh07+hV/B2+POMvTzIwFfS7Z9ZS32aY6VF2C2K?=
 =?us-ascii?Q?Mf3V8EtA1pLp/x627US7zDGRn+SzpJEcFfdrXIo+Q+AkP8imlqqWn2DxyZn4?=
 =?us-ascii?Q?QM8FtHtMrT1mc81A30mkPWl/IfpYe3i1djyRxNuOuYsr1cRfNHD8+h7cDXXC?=
 =?us-ascii?Q?I1AiFP/jm0OuIIWL/S/5+T8e/7Nf0yEwnZ/+Njws0V4sf78GqFdPUrAboKzZ?=
 =?us-ascii?Q?V1Jd0KRbpJzWoCYuuu4y9ye6yezsDVs/NDsNdmMHIyXKACoQRmavodo8XZls?=
 =?us-ascii?Q?1ebqLBT9e8fBSlalpWJK08GSExxx9VwBDW6D3D758VnZ7OBLQ8hmm9PUfXHR?=
 =?us-ascii?Q?UAcAy4AaWVRm4eGSCLvtic8Q4Haamp/OxCAL4TWEnSMnIFSp85XbRuDq3gyD?=
 =?us-ascii?Q?Ik8xwfIBSrBThem25w8drghY4PpKliiGb9hJJVDXHTMM3I5A62SBbiQDoLWO?=
 =?us-ascii?Q?KnuX2Ojn/u0z0FpYEKhghvvrSaF5My6fn4+G4/X9rgFOMQuFOOLUkPRqpE0J?=
 =?us-ascii?Q?PoTFLAj/5WKzf9goE0tSrkfVKKWpehJrM4JsZgEvrLJw6LJyS7XKPvn/VJv2?=
 =?us-ascii?Q?PdCZd7SabkzURuWLjqR1dbqXdCcK0+q60SP0+YV+caFwCtKUde7q7YJwpVq0?=
 =?us-ascii?Q?I4yR91O4rBIXLXv6Ib9uaSMglexrk80jlgpkXaMbsiZmBljhQ72jOacMf3u8?=
 =?us-ascii?Q?oXPfOyakYIap5KVnXDUE+4NBkAHBsfasAyAMb8fllRDmSJdy+1auVcYh2TcZ?=
 =?us-ascii?Q?MUwmx7lt3uyrSmRYG3wS487axIvKknqt7j+btNLMv+zFtMI06MyFb4uj1leZ?=
 =?us-ascii?Q?s/S0zPha/oVvMQO2My2u0DNb5e54FcU/5rkDvNjVRqEdgNLxjhauiCKTEi39?=
 =?us-ascii?Q?eN3hhIVXejbLlEWTykJaf0pA+k0ZBDHJFh2Xr/qXNymw3NPhtzg02G+AGTx0?=
 =?us-ascii?Q?37MZ31nZgOHnWp9maE6k3MXqrYE4zB/s0C7yeupoTu5TYlJwwE5D8H1IPKZ5?=
 =?us-ascii?Q?yk2eilZshfqodXzrmunTz4nCpfANxYbQj4YVeOBGO1RCZ5R9zkXQ30eyzOae?=
 =?us-ascii?Q?ZYWhrwDRSmdWJpLTywry2B2o2F5gUv6jc/Wa6mGm65/y37BTfv58qWfWcmlf?=
 =?us-ascii?Q?OTqBTEqBuEouqUaMTN+duFUkJ8SMTIffpRIcCDsZUFT4K5mXILAb1k5dL/xs?=
 =?us-ascii?Q?leYtThmiNVESwhwb1bKz8eHbYL023ePs4S1q+P4O+0R5Hn2QE+fU0jo3W5UC?=
 =?us-ascii?Q?AOHUmWab3IRFVsXtgrXzyYAPBjncRMiFsJ0P9EWMKzqIk5tc8IimhcJbIJhE?=
 =?us-ascii?Q?BqNCcZ23u499CE4X+qtgCUDjVaQpWCuRci0DUoUTRukUgDGvo2jxRykGogdZ?=
 =?us-ascii?Q?JdFTufKf10Hgxei7RU4gKd4YJ67NyxkTiWxIFWafpWMvPEk/NTqVFMII0HVr?=
 =?us-ascii?Q?76bwf14Cp5fR1YboyYmxMmLzrAV/jlTp?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?MH08JNO2JkeV0jsrZeTEdkcP0X4xah3kLPlBF4sqU4MTB9SicCBz8R4OflKm?=
 =?us-ascii?Q?nPWfFtLRJkLmVawySzc8+Kjes99UwtFQMqKhSgP34rkVbEjgJCKy6HLDvLDB?=
 =?us-ascii?Q?GA5AHQ10nKEPwwYMhoiMecQHfSyCT3wvxDWnJxSuIq6LNCd8eWegir4pl/h9?=
 =?us-ascii?Q?cOSO7Omnhx9GqIQzGJUpi2eQdEtpr55szP6uDhTicfKIef7cfsm4yHAlxI15?=
 =?us-ascii?Q?WYB7yn0MfOBaZEfCuFzTUo+CEriTtxpTk+8DEjt2yatQLGLyST0Zl4DFyzqZ?=
 =?us-ascii?Q?QEVpA8paGqgT7kdrfhbtfZnlH+UFgQBBYc5h+1FvXOEEl+bBdKIX4QT5gNOn?=
 =?us-ascii?Q?GPkiHaP2RhOPqdlzpXR7nchRkf94A5t2iQMzRpme2VmQW6DQU2zjRxftVphF?=
 =?us-ascii?Q?5k2a5ZpjbsOOuLKLdM2+4lRIMDvfGBKzTGOnyAGtCB8PZTpCRxemkaUqQ6d2?=
 =?us-ascii?Q?TQbsxirKsHs7A8E/kxgwrNhxFmzUO/7xZouChbFDpzUlyocTEQVPCOaSMHBi?=
 =?us-ascii?Q?hWuULMngLM+Fh+Gcj/Fy264jzqfqa9GnFxhfN0D01lHSlWLSxDXkzddRci9W?=
 =?us-ascii?Q?eAOpXjsJOqvbZVbBOr0Hh3u5DG2yy9Gn6wXaaJaHQlIM9+XgZDn3qH/0sZsG?=
 =?us-ascii?Q?tkQ065PugNqY4UD3e5ONu24W642FRypPuSKwaVpWQf4LTVA7ao7dVUVQtErD?=
 =?us-ascii?Q?9NYJeQm2Ci2TdHkTXYF9D+aDmrrD8+Oi3aqnK5L0I6czWudBLXOl1Kwgx3NB?=
 =?us-ascii?Q?DLnwDLOl/ef45rg5OEcwQ1KOSWJL+H4YYMyIMv7StNTht/v3TEcW6Uo9wWt9?=
 =?us-ascii?Q?M2fXTceHWPjKnGfsIRYs4TnhYVgJyFtkqYJQsPTwv+InLScuLtw6leH63D9X?=
 =?us-ascii?Q?w1iuBir+9vJlZU95wQLD6AS+Jh5w+riPqxUnKpbX8WehmvFJBqHEAVXq0d0Q?=
 =?us-ascii?Q?3y6rXfJMTK3DPaoGVa9KM85/HvR5LMAs4b7l9MRiwb07w6VyxzWtTzUdEJH4?=
 =?us-ascii?Q?wnOrJChAPxT11yacjsTFb6PPPSacrphqvWRrjnvEUT0fItdcYC+g87hwKmt/?=
 =?us-ascii?Q?QGgbzZ4CbHPycd9TLkg7q/jaajlKjkPGBWp2UBglkTpaNryccBjUBX4xveof?=
 =?us-ascii?Q?oKqBuyTdv3zRxX4nUov+R37+KfqDS5Ri5MQzlAsvSyxmdnEyhXmBuy9lfWrF?=
 =?us-ascii?Q?z6fIAP67zpjjTqScCoLeI4rjXAh0b1tNyByGZCsFUPtQrySpG2wG6SG4N4Vp?=
 =?us-ascii?Q?88AU7FBWtWx+qDHFXKcxaeuTT7jPlWmvmoNHGkoT3WUZ+LIN8WKQE30cMtdT?=
 =?us-ascii?Q?IFoqKuKGTzZ1fFFNDL/emqkEdP6XOIVHZiZJB0YyohJgtw3k7w5cLHvV3Nj0?=
 =?us-ascii?Q?gMoUJB5GopHChl9KHZih5Of6U/aNglmsot9ewVGR9yiO/6+kKAs6LBfRp6Ob?=
 =?us-ascii?Q?OMYL9pDMxBsNnBXmyP1uet+piCKgJ7M0j4kSk38hSPYEZKZHRwWzSj/QpagI?=
 =?us-ascii?Q?9nS1F6SPHlyAGnHHETb3gd/o2c+oPsicqeE/5XOUGltxBtRCS6XtM0wHWyb2?=
 =?us-ascii?Q?cTy0BXiU+siTUZrlWxM+IgIuodtRr4uPr9M9VkGOEZ6p2z7aRr45vsF7bL35?=
 =?us-ascii?Q?SBIIJd4doYLm7p4A9G3doZU=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4205b672-163b-4416-8a5a-08dd2e15ef45
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jan 2025 05:49:50.0828
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: oqi62K/a2CN0YKxOkOSC6neIHn97PWkKHy5+k3UTvrn1Qj3UrHR6Nqu+17BhHP8jWJOgO1QQR6cCAX1E898ak8RlSsSyOw1huGazJpntbxWFzhkhbXfHW9pIaSTGfwOk
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSZPR01MB6247

Current ASoC is using dai_link->dai_fmt to set DAI format for both
CPU/Codec. But because it is using same settings, and
SND_SOC_DAIFMT_CLOCK_PROVIDER is flipped for CPU, we can't set both
CPU/Codec as clock consumer, for example.

To solve this issue, this patch uses extra format for each DAI which can
keep compatibility with legacy system,

	1. SND_SOC_DAIFMT_FORMAT_MASK
	2. SND_SOC_DAIFMT_CLOCK
	3. SND_SOC_DAIFMT_INV
	4. SND_SOC_DAIFMT_CLOCK_PROVIDER

Legacy
	dai_fmt  includes 1, 2, 3, 4

New idea
	dai_fmt  includes 1, 2, 3
	ext_fmt  includes 4

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/generic/audio-graph-card2.c | 76 ++++++++++++++++-----------
 1 file changed, 44 insertions(+), 32 deletions(-)

diff --git a/sound/soc/generic/audio-graph-card2.c b/sound/soc/generic/audio-graph-card2.c
index 4e330aae04894..c36b1a2ac949e 100644
--- a/sound/soc/generic/audio-graph-card2.c
+++ b/sound/soc/generic/audio-graph-card2.c
@@ -667,8 +667,7 @@ static int graph_parse_node(struct simple_util_priv *priv,
 		return graph_parse_node_single(priv, gtype, port, li, is_cpu);
 }
 
-static void graph_parse_daifmt(struct device_node *node,
-			       unsigned int *daifmt, unsigned int *bit_frame)
+static void graph_parse_daifmt(struct device_node *node, unsigned int *daifmt)
 {
 	unsigned int fmt;
 
@@ -693,16 +692,6 @@ static void graph_parse_daifmt(struct device_node *node,
 	 * };
 	 */
 
-	/*
-	 * clock_provider:
-	 *
-	 * It can be judged it is provider
-	 * if (A) or (B) or (C) has bitclock-master / frame-master flag.
-	 *
-	 * use "or"
-	 */
-	*bit_frame |= snd_soc_daifmt_parse_clock_provider_as_bitmap(node, NULL);
-
 #define update_daifmt(name)					\
 	if (!(*daifmt & SND_SOC_DAIFMT_##name##_MASK) &&	\
 		 (fmt & SND_SOC_DAIFMT_##name##_MASK))		\
@@ -720,6 +709,17 @@ static void graph_parse_daifmt(struct device_node *node,
 	update_daifmt(INV);
 }
 
+static unsigned int graph_parse_bitframe(struct device_node *ep)
+{
+	struct device_node *port  __free(device_node) = ep_to_port(ep);
+	struct device_node *ports __free(device_node) = port_to_ports(port);
+
+	return	snd_soc_daifmt_clock_provider_from_bitmap(
+			snd_soc_daifmt_parse_clock_provider_as_bitmap(ep,    NULL) |
+			snd_soc_daifmt_parse_clock_provider_as_bitmap(port,  NULL) |
+			snd_soc_daifmt_parse_clock_provider_as_bitmap(ports, NULL));
+}
+
 static void graph_link_init(struct simple_util_priv *priv,
 			    struct device_node *lnk,
 			    struct device_node *port_cpu,
@@ -730,15 +730,19 @@ static void graph_link_init(struct simple_util_priv *priv,
 	struct snd_soc_dai_link *dai_link = simple_priv_to_link(priv, li->link);
 	struct simple_dai_props *dai_props = simple_priv_to_props(priv, li->link);
 	struct device_node *ep_cpu, *ep_codec;
-	unsigned int daifmt = 0, daiclk = 0;
+	struct device_node *multi_cpu_port = NULL, *multi_codec_port = NULL;
+	struct snd_soc_dai_link_component *dlc;
+	unsigned int daifmt = 0;
 	bool playback_only = 0, capture_only = 0;
 	enum snd_soc_trigger_order trigger_start = SND_SOC_TRIGGER_ORDER_DEFAULT;
 	enum snd_soc_trigger_order trigger_stop  = SND_SOC_TRIGGER_ORDER_DEFAULT;
-	unsigned int bit_frame = 0;
+	int multi_cpu_port_idx = 1, multi_codec_port_idx = 1;
+	int i;
 
 	of_node_get(port_cpu);
 	if (graph_lnk_is_multi(port_cpu)) {
-		ep_cpu = graph_get_next_multi_ep(&port_cpu, 1);
+		multi_cpu_port = port_cpu;
+		ep_cpu = graph_get_next_multi_ep(&multi_cpu_port, multi_cpu_port_idx++);
 		of_node_put(port_cpu);
 		port_cpu = ep_to_port(ep_cpu);
 	} else {
@@ -748,7 +752,8 @@ static void graph_link_init(struct simple_util_priv *priv,
 
 	of_node_get(port_codec);
 	if (graph_lnk_is_multi(port_codec)) {
-		ep_codec = graph_get_next_multi_ep(&port_codec, 1);
+		multi_codec_port = port_codec;
+		ep_codec = graph_get_next_multi_ep(&multi_codec_port, multi_codec_port_idx++);
 		of_node_put(port_codec);
 		port_codec = ep_to_port(ep_codec);
 	} else {
@@ -756,13 +761,13 @@ static void graph_link_init(struct simple_util_priv *priv,
 	}
 	struct device_node *ports_codec __free(device_node) = port_to_ports(port_codec);
 
-	graph_parse_daifmt(ep_cpu,	&daifmt, &bit_frame);
-	graph_parse_daifmt(ep_codec,	&daifmt, &bit_frame);
-	graph_parse_daifmt(port_cpu,	&daifmt, &bit_frame);
-	graph_parse_daifmt(port_codec,	&daifmt, &bit_frame);
-	graph_parse_daifmt(ports_cpu,	&daifmt, &bit_frame);
-	graph_parse_daifmt(ports_codec,	&daifmt, &bit_frame);
-	graph_parse_daifmt(lnk,		&daifmt, &bit_frame);
+	graph_parse_daifmt(ep_cpu,	&daifmt);
+	graph_parse_daifmt(ep_codec,	&daifmt);
+	graph_parse_daifmt(port_cpu,	&daifmt);
+	graph_parse_daifmt(port_codec,	&daifmt);
+	graph_parse_daifmt(ports_cpu,	&daifmt);
+	graph_parse_daifmt(ports_codec,	&daifmt);
+	graph_parse_daifmt(lnk,		&daifmt);
 
 	graph_util_parse_link_direction(lnk,		&playback_only, &capture_only);
 	graph_util_parse_link_direction(ports_cpu,	&playback_only, &capture_only);
@@ -788,14 +793,21 @@ static void graph_link_init(struct simple_util_priv *priv,
 	graph_util_parse_trigger_order(priv, ep_cpu,		&trigger_start, &trigger_stop);
 	graph_util_parse_trigger_order(priv, ep_codec,		&trigger_start, &trigger_stop);
 
-	/*
-	 * convert bit_frame
-	 * We need to flip clock_provider if it was CPU node,
-	 * because it is Codec base.
-	 */
-	daiclk = snd_soc_daifmt_clock_provider_from_bitmap(bit_frame);
-	if (is_cpu_node)
-		daiclk = snd_soc_daifmt_clock_provider_flipped(daiclk);
+	for_each_link_cpus(dai_link, i, dlc) {
+		dlc->ext_fmt = graph_parse_bitframe(ep_cpu);
+
+		if (multi_cpu_port)
+			ep_cpu = graph_get_next_multi_ep(&multi_cpu_port, multi_cpu_port_idx++);
+	}
+
+	for_each_link_codecs(dai_link, i, dlc) {
+		dlc->ext_fmt = graph_parse_bitframe(ep_codec);
+
+		if (multi_codec_port)
+			ep_codec = graph_get_next_multi_ep(&multi_codec_port, multi_codec_port_idx++);
+	}
+
+	/*** Don't use port_cpu / port_codec after here ***/
 
 	dai_link->playback_only	= playback_only;
 	dai_link->capture_only	= capture_only;
@@ -803,7 +815,7 @@ static void graph_link_init(struct simple_util_priv *priv,
 	dai_link->trigger_start	= trigger_start;
 	dai_link->trigger_stop	= trigger_stop;
 
-	dai_link->dai_fmt	= daifmt | daiclk;
+	dai_link->dai_fmt	= daifmt;
 	dai_link->init		= simple_util_dai_init;
 	dai_link->ops		= &graph_ops;
 	if (priv->ops)
-- 
2.43.0

