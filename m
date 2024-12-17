Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11010065.outbound.protection.outlook.com [52.101.228.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A58A115AF6
	for <linux-sound@vger.kernel.org>; Tue, 17 Dec 2024 01:49:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.228.65
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734400174; cv=fail; b=Z3d8krtfdkcbcsTPR9/ZTK3NdTQTqby/9SG9/CXuUqLSxw2UKg1jZRrmiDI2X9lSpTWP86asyyVexw22ujfCN8+/h57cDETwi6qHsr+s6lY6RMiTJ1bUiOmMPFtsqMouvCak1Q8tspsl/S5B3EU/HNnPB/ZjrDfbk7LODtIq/p4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734400174; c=relaxed/simple;
	bh=Gd/GBORinSQkxtk7j5JYVafvWbJjNbEYWZkgpb8glsA=;
	h=Message-ID:From:To:Cc:In-Reply-To:References:Subject:Content-Type:
	 Date:MIME-Version; b=MzmX8ENAcgFsu49Zj41GvpON1pK8Ki/rxeOx2BQNWavNy0txcqRlbvksykFB82pj6CxHTcTXP+Roqub5Fg8M0XNxXNIDsGf3sQ3go43da2cD1WV4alV2/ZJ0dKtYH9OgHU0Zmq9SlghB8ijnOKqHfB8MSf4ombyhUErGqApB9bY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=k9q9gHew; arc=fail smtp.client-ip=52.101.228.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="k9q9gHew"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=K9O8tMbEmjl6TFYCIxcdpz2RRC/m8cQfRx3wGCgQsVv4XqUnX866PMHMdrR/TujjyqPdEb3qLjsOqo9LWrj40xvUMZbgIj9dL/nGZjV+pNR/cTvqWis0O+07usYdjVj3tGdL9kPyv14On+icJX6aF7UaS8NL/esln/i8/5NpKkq+CyhDxSwivll49QND2hEZUwRXBxcoMQ3UkOBdPGn5mj54WNlG/frTxInqFXeB+T7bgPhWuclZb+w6x+FIxw3oBRITFF5nD1+8uYi3CfaYskhdceNCeTTPi+NPtUNGLX3Odbrj00acr9hdIrBycFT7hDLbG+T6uli9MueZlsPVtw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=p0gUNXIC9Lxos9dWK/7vbC3OJ/k0KCzZ3aM6iG6YJ9o=;
 b=fxv4yzrg5Aj18B/e98wXywuJy1nYWv/HgLnxcV/W/3EFvwT2xqTzAfSGFrvhVi5woEwq5o6p9QpTIw4FHTfZnbaKsycuL54cZSbjTtEy+lQ9CmREHBma3lYguY5LfIXder6F/4rkOmZzgwq2kcP7nPpZvf8puNZp9+gOi0L1mYHColauSvoNIb3/WK3WNBZnPXZP3vjpsiJKYV2VfcqHrstwccMUZrrPTx9K0CMsm4yA/gIsOg/wuwRPKA+5xi08i1mPKuO/ALMCCFxljVmdeeXPASfp08ufvrMltkDyldy5bXbjFNtTnP3yyg8EcpdXnsajML29iv2Nq/dAGRf+pA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=p0gUNXIC9Lxos9dWK/7vbC3OJ/k0KCzZ3aM6iG6YJ9o=;
 b=k9q9gHewQatGyNBBGEgh9dnw5WkrqdMT2vpc+2Cithz1hIVvavrGDg/8ledMVrsPi33Dk9CikH3igZ5PGzZva+aAl0elFzKbAt8b4solm+KppSwYTwGTvnzJs2Y+wMRfqbABXYx07Xf5EFcK85ISLSGV9ZqJZo3CEekjPRUglQY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TYWPR01MB9279.jpnprd01.prod.outlook.com
 (2603:1096:400:1a2::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8251.22; Tue, 17 Dec
 2024 01:49:30 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%4]) with mapi id 15.20.8251.015; Tue, 17 Dec 2024
 01:49:30 +0000
Message-ID: <87v7vjm639.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org,
	Stephen Gordon <gordoste@iinet.net.au>
In-Reply-To: <8734innkpy.wl-kuninori.morimoto.gx@renesas.com>
References: <8734innkpy.wl-kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 6/6] ASoC: audio-graph-card2: Use extra format on each DAI
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 17 Dec 2024 01:49:30 +0000
X-ClientProxiedBy: TYCP301CA0006.JPNP301.PROD.OUTLOOK.COM
 (2603:1096:400:386::15) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TYWPR01MB9279:EE_
X-MS-Office365-Filtering-Correlation-Id: a8c4d65a-91ec-44cd-c82f-08dd1e3d0c6a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|366016|52116014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?cKfhYxpCwF+y+8+yE/XLntB6N9pFKqs5cY0GHPgKm9yNoX6y59mpS9lug1pb?=
 =?us-ascii?Q?7SMPWqulhA0hrPxuhDqd/R1jPqT04edEb5b27Llpp3JBLUE4VFSoNsKqEDO9?=
 =?us-ascii?Q?RSR8qap0gkg1vp5JE9n4kUvUmMYMv1f5urg0+bcPbAl/wHwV9eTHANoPVgxl?=
 =?us-ascii?Q?jq9Ld13zGyy5ZciWkHeR7TbZkTgClQ/+i0DrWwyeJSBCyhDcW6GtBM3+SBCR?=
 =?us-ascii?Q?UoQuXJ04ht/EAFrWLDhqNmHOY6ehsrgKAJfjJsVVm28/zcyY1ncAnqmRSIrm?=
 =?us-ascii?Q?zTt3WPvjNk7kk7JcfR6GqUM/RfxwCZFOLySS2RamGs+ikGBDmoe023sCRt5I?=
 =?us-ascii?Q?KAiacat0FobibMRYwwbXpzat6AWGsKIbbvOx1iwRA9CKOrG6xWw1/pugNCfn?=
 =?us-ascii?Q?Or6dMtzN4BhEk4pnxw+eQ3cYtnhLxWNWJHY9f4XZt6m5OJBALXRK/uQP+t5X?=
 =?us-ascii?Q?qp+641QF/GVFmn1ny/EyvbEDiqIW4lf7/t5USWvePSDhOTPhaZVXxoA3bl3p?=
 =?us-ascii?Q?xYXZrnD3udRErkocqK6xQ46BVXeb/5kEVz0dntWP32lXh2LsemR+s0NoLPOx?=
 =?us-ascii?Q?Ovs3oLCCXLOOLw6nAlxdLBAZAXUE3t0S6SysiDFmjM04dQy2Imxn0ANDjwHG?=
 =?us-ascii?Q?02Plc6V2zIjlGRZSjMQirJPfYPfLO/VqHLuwx1r9hrnt3e5fPm3tDJ7KpC+U?=
 =?us-ascii?Q?IBGJGw95tyQ6/oKuJfg0NLgHvgW2EkaVtt31ULU5E6DpHWoCe6/zatD0Vrw+?=
 =?us-ascii?Q?4ceOyab7O1qmXOCuYCVshhPZXwgcL6UX0n7r1WJ1sz3pGOENlhL3ZDlc6LH9?=
 =?us-ascii?Q?HG5KxP3HWqxGnA7bW3Ni3pwrHiL9KxCELuqKSlMLX3fATwQFOu6T3H1XzBiM?=
 =?us-ascii?Q?D8Z+DwBBxj0sEWnGChDMDlrpPzfHH8JCTOcqoJDK2vWjElVHaHm10q6Fdyny?=
 =?us-ascii?Q?8jH50C1BzYK8pZdfvofEwyfC4ip27mGoi5Ntf5weszIIbk+S7fqlc5HKAA7m?=
 =?us-ascii?Q?yd2GPc2jXkVOZ7Kd8IzFh2JBBdmJnKmqmM838akwpe3tnIw1PN31N48MkSvJ?=
 =?us-ascii?Q?Os61uj/JDtbYjg2msoZmfzikTCdOF8x5jyprtZ8GOMIVH476oeRNTKw6ihIK?=
 =?us-ascii?Q?S6xMWoRdWeYYpFebaLA133DlaUKnpWnRbOLVtbsZ66j2WpskOTgVawsjN32T?=
 =?us-ascii?Q?m4U2SMelGglcTSxoS4cOqM0gf0jtEHVCHhjfXwPUp5o+WK7CtIYWEaegotZy?=
 =?us-ascii?Q?FzZVyjY2zvwO90t3ELjCafFESP0lxR+3bhOC0MCKDPA9TgsKcUrY8O6OkKsC?=
 =?us-ascii?Q?YDQdLUvkcLqPYdDA1t/lu4NpidInz3sMPqITMflKzZJygOyIEJQxSm7kocWh?=
 =?us-ascii?Q?fFEeIbD3+LWP6scdIJXQxDwCoVsA+tA4tfGcX3oAuvpvbQZzzlg6Nmgp+BaV?=
 =?us-ascii?Q?08BwB7MZXCAtsh5+bmDWMn+wL4rC8Q8e?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?mIWvc78H8t10G7gsdhTcu09E8M5XMAkkkH8ubL5AtKVTpIZqjXNwv2FFwp6G?=
 =?us-ascii?Q?yTUzklnd7y9ttIl6UbAQbKPdgM1lYcXO2jA2Dz48C/HqZR+uD7k9ypQajJq2?=
 =?us-ascii?Q?G8gd+hyWAVhxd1sj7V1zqsR82V/jgra9d+FtEnfF4VQ42A2KoC/KRU3W/hj0?=
 =?us-ascii?Q?Q9FxnOBwAw4i5Ax2GIcvss5vF8pN11nNUa1rbyR2XGWxcpvXDgnPJxWYgWMx?=
 =?us-ascii?Q?BDt1s4gOOHgfGU3BQV7UY2zeO05OkqKC+aW9UTo9lBqV4pa79LC4NTHNeoxy?=
 =?us-ascii?Q?jOmFTsIDx07L1CRhQAqoRpHhtAf4CexPXH7tANMmhzWpuo64KgKicUjbI20q?=
 =?us-ascii?Q?kaM5fa5EgydJc76bbICtUW+f78DoGFuvExAjLJiLNZmeVs7MilOBwIBCH1jn?=
 =?us-ascii?Q?gMs4QONEUifL2FOlUdKZBMKP4Kb5CI0WWvrXVcrYklNa1UZeCxTtHi6CA2Hs?=
 =?us-ascii?Q?k6WtYFXGzVNPSWrGUm9FD/6xpFX4FcE+MC20HVLtxGsupSk7a8vWLXkzemPk?=
 =?us-ascii?Q?9eVBa5VSSlU8Q9DFmkhdd8k7ZTorwI15MJEayIyXHXzVdlgQq0sPwPubr8IM?=
 =?us-ascii?Q?feZErKN18awm8sUGyLUNYVUn0Imvh6NAloVxrZ44WSd3zJCpkSVNaVZcdZal?=
 =?us-ascii?Q?OLTXdpTxTqAdmljMDkq8+6oHXjkSMyAIkMwfxVC6XwECfjHsYcdfnzFMaPS/?=
 =?us-ascii?Q?YVijDzu+OvTLzo5G5Lk9+90q2Y0H3gxf4As9UKxgrD9P2MvSIEmJiF/kZ/o4?=
 =?us-ascii?Q?ou0BrOUpRdxtpwkkFjD57GzOXmycNqCf+s5tctOeszi7MopiVfuaD3bi3SdE?=
 =?us-ascii?Q?owA4DGQVXPLVlVrdsUliQzae53uks5Cl5ABF58/YubwXYLzoCdLNtoVr6pZg?=
 =?us-ascii?Q?HD9Cm4v4xpaVHvEKzY2yQ2a8M7XO4xam19ZDdqT1pdbX987X0+RWg+e/KaX8?=
 =?us-ascii?Q?vD8sUngY6LCjT8sPzm8ghaWyZH75IfLXF8yvIPTu5m4Ff+aQhw0gcDMhoHZP?=
 =?us-ascii?Q?oMQqECZEq2z/q6tOX43WWJtomH61qUH2Da5fF8y44CncSdmBn+K4p76le0QA?=
 =?us-ascii?Q?eKMw2br1x9DcSWRN3jqo9W7xajz6MupuwWUZdYkSX5h2n6ICnLSdu/cYTdMF?=
 =?us-ascii?Q?Ae2UMndf5g/7ekoUtjvJ5v/LfCAAeOVs+C5u3siVXwxdGWiZlpllR69GEpUo?=
 =?us-ascii?Q?KtQGG5i8v/+MvAHNxewn8tX9Mrwb4Fb43L3yvXqEKRQtBoQ42PstHlXGfrLZ?=
 =?us-ascii?Q?h6erq3xhtjFd6qBsBNzwjRkaVJU3VCDwlePAfuRskES2F7ECKXL89DuJNIhB?=
 =?us-ascii?Q?lAufx3nVKMIr65WUSsxCE+Jo7djkWzKzIEhUCJXo5hwgXgo8bmrYeqmE1LH9?=
 =?us-ascii?Q?lbLFujaDQLaI4lRSEyh60iTuQH2YJlbLFxCwGzk9VdKOibKUiFRh02X4VTXJ?=
 =?us-ascii?Q?XVK8Hgg2L3QU+kxn2gyzPYBFJ0ltlkKPw1oGV8cc0bBYbWv98fxLU2kN9Jk8?=
 =?us-ascii?Q?tIIJjNFP1xnUvJ122T+uGXV0fARqaWlujey53kgPQeAu7YRA0KYpFwOBr/Js?=
 =?us-ascii?Q?AzxAa+UZGhupIgVHxYeTnnMu8zZpNPbl8YQEE/J5uce3GRyk4Miet93UCYOB?=
 =?us-ascii?Q?7LsM99edz8Y2FtVyfIALzIQ=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a8c4d65a-91ec-44cd-c82f-08dd1e3d0c6a
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Dec 2024 01:49:30.7414
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: sXCMbRLVpnrzW3lf6LEhB1u3UfjY0/AhfCKo0qygRukhwtsY8XizhsUStvWQYneZ2/8z6WKEXGDRCIjd5vO6/KBGAIwqrYs/yqqTQduN5BFcaadR7jmqt0s9qHr5cuzv
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYWPR01MB9279

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

Link: https://lore.kernel.org/r/5011ceef-5100-441d-b169-dabba135d27f@iinet.net.au
Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/generic/audio-graph-card2.c | 75 +++++++++++++++------------
 1 file changed, 43 insertions(+), 32 deletions(-)

diff --git a/sound/soc/generic/audio-graph-card2.c b/sound/soc/generic/audio-graph-card2.c
index 079ae8a7bfff8..8c7c449dc6498 100644
--- a/sound/soc/generic/audio-graph-card2.c
+++ b/sound/soc/generic/audio-graph-card2.c
@@ -658,8 +658,7 @@ static int graph_parse_node(struct simple_util_priv *priv,
 		return graph_parse_node_single(priv, gtype, port, li, is_cpu);
 }
 
-static void graph_parse_daifmt(struct device_node *node,
-			       unsigned int *daifmt, unsigned int *bit_frame)
+static void graph_parse_daifmt(struct device_node *node, unsigned int *daifmt)
 {
 	unsigned int fmt;
 
@@ -684,16 +683,6 @@ static void graph_parse_daifmt(struct device_node *node,
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
@@ -711,6 +700,17 @@ static void graph_parse_daifmt(struct device_node *node,
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
@@ -721,15 +721,18 @@ static void graph_link_init(struct simple_util_priv *priv,
 	struct snd_soc_dai_link *dai_link = simple_priv_to_link(priv, li->link);
 	struct simple_dai_props *dai_props = simple_priv_to_props(priv, li->link);
 	struct device_node *ep_cpu, *ep_codec;
-	unsigned int daifmt = 0, daiclk = 0;
+	struct device_node *multi_cpu_ports = NULL, *multi_codec_ports = NULL;
+	struct snd_soc_dai_link_component *dlc;
+	unsigned int daifmt = 0;
 	bool playback_only = 0, capture_only = 0;
 	enum snd_soc_trigger_order trigger_start = SND_SOC_TRIGGER_ORDER_DEFAULT;
 	enum snd_soc_trigger_order trigger_stop  = SND_SOC_TRIGGER_ORDER_DEFAULT;
-	unsigned int bit_frame = 0;
+	int i;
 
 	of_node_get(port_cpu);
 	if (graph_lnk_is_multi(port_cpu)) {
-		ep_cpu = graph_get_next_multi_ep(&port_cpu);
+		multi_cpu_ports = port_cpu;
+		ep_cpu = graph_get_next_multi_ep(&multi_cpu_ports);
 		of_node_put(port_cpu);
 		port_cpu = ep_to_port(ep_cpu);
 	} else {
@@ -739,7 +742,8 @@ static void graph_link_init(struct simple_util_priv *priv,
 
 	of_node_get(port_codec);
 	if (graph_lnk_is_multi(port_codec)) {
-		ep_codec = graph_get_next_multi_ep(&port_codec);
+		multi_codec_ports = port_codec;
+		ep_codec = graph_get_next_multi_ep(&multi_codec_ports);
 		of_node_put(port_cpu);
 		port_codec = ep_to_port(ep_codec);
 	} else {
@@ -747,13 +751,13 @@ static void graph_link_init(struct simple_util_priv *priv,
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
@@ -779,14 +783,21 @@ static void graph_link_init(struct simple_util_priv *priv,
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
+		if (multi_cpu_ports)
+			ep_cpu = graph_get_next_multi_ep(&multi_cpu_ports);
+	}
+
+	for_each_link_codecs(dai_link, i, dlc) {
+		dlc->ext_fmt = graph_parse_bitframe(ep_codec);
+
+		if (multi_codec_ports)
+			ep_codec = graph_get_next_multi_ep(&multi_codec_ports);
+	}
+
+	/*** Don't use port_cpu / port_codec after here ***/
 
 	dai_link->playback_only	= playback_only;
 	dai_link->capture_only	= capture_only;
@@ -794,7 +805,7 @@ static void graph_link_init(struct simple_util_priv *priv,
 	dai_link->trigger_start	= trigger_start;
 	dai_link->trigger_stop	= trigger_stop;
 
-	dai_link->dai_fmt	= daifmt | daiclk;
+	dai_link->dai_fmt	= daifmt;
 	dai_link->init		= simple_util_dai_init;
 	dai_link->ops		= &graph_ops;
 	if (priv->ops)
-- 
2.43.0

