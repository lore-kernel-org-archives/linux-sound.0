Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazon11010020.outbound.protection.outlook.com [52.101.229.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1738BA38
	for <linux-sound@vger.kernel.org>; Wed,  5 Feb 2025 00:16:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.229.20
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738714600; cv=fail; b=K/IT7Or7gvdllbTYCb2rCZi5epgWcnGsExmVrRCepvwCLxNYN8OBcZpr3au02VNkmBgAfwHy2Mt3CO9Xqws8/uXIGkvgWu93YrT96WFReb5rIlfZUdlAFjSEjy2z1C+gu3vAhoJ7jgySENt+cVloqROLDZDfydtu7xGCQMsIVuI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738714600; c=relaxed/simple;
	bh=qH84IT/IqlbFAgVR2p1wfRlwO8I9S65tYlwNWm5qrDk=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=PTl5RR2eGdSor+6V6J7oFKxQ08g/89ugdifHHf27LSw+X4EdVSIMV604kSAI6v7om/Zt3aOv/gOXCcKqGjmPPPFoCMlzf5uSWiCplBGQUwvVch8+Wc8Xp6UyPTrk5ob/6dvxp+hePmy/Tl0SRwpZEqmreh2YjVnwhh3HvwY7rfI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=DqFjdaga; arc=fail smtp.client-ip=52.101.229.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="DqFjdaga"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QVx+nzJza5s3SGNK87UmTdxY9YAtc7YEFO3l1324Aze63WCYM44aIS+K57XjQQptxhNdINd5XsU0AeyNvy9m/9uyI4P1L0eAXznPXm9fk3Awqw06Yn0hTiyks4kmtFLiiPI3Kp9SkNPeoGXkIpTTmlZgR/2GVrT3Cw7nGvNY0UAnh11ReMelyeMcuIt1FdiWplvbBdwa6t/IhrV/4ByJiKsZX7zJL5OITHzuWeJVeQbavKYcCCRtMzv5MwAFV9O9KlgAW0H5KF1toy7D0RoyVu1Fe7TKpRiA401IJ+xunRW/mucJN0DEf6dhGh9DHGeTFg4iqVdYNqjIWNugC3L+WQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oTZi0kjDixf8Wq4KTG7Dluh4B9mULwFJaK/IvjXagJc=;
 b=l1uNv9OAxl2IeCBEVS5PA/KlX+8SC9QEu0OckuqNBIcnr3N7lLLKFXUd2oSo/5cGRwFrMVDkIVPBI9BAL99BzBev0DCQd2oP00kHFww4a3s0nIz1j5EQpzZRQdQpJDMwUvF0ws37Hdlgo7VftM53D2hvf//u/vQGa7mb5gTd+0X/kCMwP8bTzLt2Snz6RwxPtdyek1SWglHsQe9A2C26+rv/+vJL6dFDR9A6eeKnm/QYsEsIp/lkoHsHOwADUamugM3QTiJFzASd81yQAe3LWUWSTQhIdrxB5C17B4rpojM291W23AHXwJNh0vwC3SXkXD79Ui++9icGcxi/gVJDTg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oTZi0kjDixf8Wq4KTG7Dluh4B9mULwFJaK/IvjXagJc=;
 b=DqFjdaga1ifSc2BesExNd/44HLHn/yD0gJXwLh/PFa9lvl+qDygUp0+c20HHp1VStkjLriEduvFv0gbZjWfS2jXmlAdjg94kOrjTYUZUQPCudDwUkonOZLzgKZ92OUO7RaU5507N4c5IIFGNKH24VItadVORrhX/ChltY0LpQBk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TYRPR01MB12774.jpnprd01.prod.outlook.com
 (2603:1096:405:1b3::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8422.10; Wed, 5 Feb
 2025 00:16:36 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%5]) with mapi id 15.20.8422.009; Wed, 5 Feb 2025
 00:16:36 +0000
Message-ID: <877c652ql8.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH v2 7/7] ASoC: audio-graph-card2: use snd_soc_ret()
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <87h6592qq3.wl-kuninori.morimoto.gx@renesas.com>
References: <87h6592qq3.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Wed, 5 Feb 2025 00:16:36 +0000
X-ClientProxiedBy: TYCP286CA0097.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:2b4::11) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TYRPR01MB12774:EE_
X-MS-Office365-Filtering-Correlation-Id: b752aae1-d5dc-436a-b47a-08dd457a5a59
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|52116014|366016|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?e8lpxyHbKFRyRI31QlkJlpWhSmhaTFepiBsGy9ViiDcja8LIUG3WsuwCxxEi?=
 =?us-ascii?Q?UIXXFc+ricF/HjlKC+cQKwytWXb62FEnj6y99hZcm9JJsALOEl3llfm4bUwP?=
 =?us-ascii?Q?NIGRKRoKe7y9wFpgvauQKF7uOW4nMp6GVKvPrOejtSRlsW8cnoWRdCv92PPO?=
 =?us-ascii?Q?oHVwkGH/ORj3Dwm7jrIfobMBnYOCzMlk75H2W32htuu+TGB4GylI3VLnNhdA?=
 =?us-ascii?Q?/Thvp94wL5+wSXsxEUx62JPJjxv0JQk63mp/Rzr0rPJyILwizsdUJb8IeKxe?=
 =?us-ascii?Q?YixIKHbryDwgAOyIsrs73Sm8Z3IkuDu+kSPYrM1BP3gQSfqqDHcCtR4IVynH?=
 =?us-ascii?Q?gi3YJFwafow/7iv0ThIJPGAJPs7EQBs5JVCr75tn/ACVrpa6OY9hO7ZgVw24?=
 =?us-ascii?Q?hgeNG07lhoDxGASCsmsauTAfvARr8ffzMGz/3/PSUsM3Hwo/YE2MquZ4D4ZX?=
 =?us-ascii?Q?yuHRHJRrR2GSZhn3ANAax3Q3JextUHHJU8RLd33ebpmN5ey2X0zyolo/e7TA?=
 =?us-ascii?Q?9dnlGH+Y2yNxdva14OmVP6CoZPn08C0/e9vuRL6UWVrTWMJ3eX7dSdSAl0Kk?=
 =?us-ascii?Q?iJaPCZFEoXA85W9oWv0915M43+ir09NMCDowMA+0RNNxmTv9p9w1/OIIegLh?=
 =?us-ascii?Q?BUdGjuZC+SOnYVyTkiFj1eAMHZbxKSUv2XoU8ED8gCm5y8vI1bKNu3ijLq3m?=
 =?us-ascii?Q?hmoQGjjed1eeBv6K6NizvbL6Vj+n9mHFJ5EYTVP1dmKiJAwN/E+Is7t6reNq?=
 =?us-ascii?Q?nqx1Kuseeq2TnOxoNi5LItE74mzvPa+ZVFAEiO2U2Wk8iwUMAsbV9xglQjC3?=
 =?us-ascii?Q?dhIHEdsOhvrR4zOz/FSAErlJKXddYkk9jKbAxFm+bZzIQR7IbBQofA91Q7dO?=
 =?us-ascii?Q?WORCACY5RM8EOwnb1XZ6zm4lApArne2FQdvTKTf0bfgP22QWBMJax1DN8kTF?=
 =?us-ascii?Q?E0Z6mSnbDxPGWdKhIWNkpqh5ZLJ2Zv7cIL6L3pdoO5ZA7BXOg9H0ENfhCmZy?=
 =?us-ascii?Q?0TdVmRmOGRrS1B2yCO0ELx0gWWVrKPw8+NyzbBAF9dKPhi/60p1eCzND6uOk?=
 =?us-ascii?Q?MQjEuCWzh1Rn09/o10X9rLzW/x7NEmnNB7sJfupzt2Xl02KtjAJ5J2FFhjad?=
 =?us-ascii?Q?WEfmf9OHBUJEcsHFbqObZXC+h7qNaqLde3TOiL9wF+3443WE2eWZ92bUej30?=
 =?us-ascii?Q?gYIbZf47HZxHGyyljnSBx0KKhUwT+0VPd4bSRIAAK7dYvTiv+hYDIdFqO3gp?=
 =?us-ascii?Q?jPvzA4PkmQkM7suo871Ru7G0nXEpR5al5jvGUUOzLRYNSbW/2ywPL+BFYvR6?=
 =?us-ascii?Q?CPdjkDeRHuxtHfnjkmcmMrk5SuLWqecpaZeVlCcDLhdogz4UmAOxApxHJuzL?=
 =?us-ascii?Q?mBJyC8+VIgXhsrzAbbrSKgYgkLqeHAhKRRQ3A0LssGBR4/4qQij42PJ2gfEH?=
 =?us-ascii?Q?Cp0Bo36SfUQ5I26XfxVwH1PUHqtTYRFq?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(366016)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?6WGIdojuGSEzFPwoRtx3tO9Pq5hoWIveLh7DYRVn/BEV/Rjz7I/dYgF3mXpZ?=
 =?us-ascii?Q?9D01MisnE24/uNfLBpilc93FDaNfbN4PbRU+DB02G2c+0YEgL+/vRjZ0ooaJ?=
 =?us-ascii?Q?Ymgnuh+9QjTRTV13V0yxDjHWk0VDyqeacB2Q0QHlqfhU7dSDw6p77WzcjbCf?=
 =?us-ascii?Q?ANxWvVzqZyFOt+L214c8zC+uO8XCyndwYJz0vS3Rc8RvOTxwm04ywfw1WS+k?=
 =?us-ascii?Q?1atfZ73axGq4O8idWv1AW3IYoM/Ag/kFlMLZ2WnmmjF5KKXMrdtURJapGPWb?=
 =?us-ascii?Q?iwklJmeTdVQmrVPSGZ4tsbBG1vavOl0HYGHcF/sHDU5Ozulia3tz3/rdcX9T?=
 =?us-ascii?Q?q6k8jrYbHt/bW0UJpL6Rf3raw4pEmaNKKBx8W9HFX7nQbA8Cr69nEV7eWGIJ?=
 =?us-ascii?Q?3ghOO99glnwpKNNusJ900HGiS6Advfr5fs0tRaBZayUxEBIrHk/izy12SkBg?=
 =?us-ascii?Q?hM2zLqCuUA2gu3/uspwy73TV0ki3bykLHPS6nb8ujEGlkXc03pyp29rkKvDO?=
 =?us-ascii?Q?EYbRoaI9yVBYv/xemeI4PTLlUW/CzSrmgNxv975g+2BcrWxGQwn5Ra0n2RhZ?=
 =?us-ascii?Q?QzIX6P06Udgi+qrkLREsrQG0epRhPWdESobrraBfsdZS2wvASWeZS7lVgcIU?=
 =?us-ascii?Q?16iFXsdw8es8wOBOf+UXocSUzqHV0F3+d5Pd7GSZemgO6J53H4Y6vxbzFBtz?=
 =?us-ascii?Q?iKlW8kVeqtWtnlPBRwvEcb88h6mfLS89HxL4zMPi/dfm2fcnKll3cLBDoGsO?=
 =?us-ascii?Q?pEt2ey13ZrKvWfNbCNDi0g+arr7Dmbif6B8xiScIBAu7KnBMYP/sr6FLj1ra?=
 =?us-ascii?Q?QqEry2mkRaAcnR4zAuHsWu7vsZCNB1i3H0G74AD7qkwZsjlRhiasc2FtagfY?=
 =?us-ascii?Q?g0cf6gcEiAvMwIpKiKWOyFkvzJh3W/f33QFxka33b7k5SDKk3ANgln/Nbmh+?=
 =?us-ascii?Q?3mImH4xx68SpoHYQIk4R1bZpfc/FcpEWQ9tczvI1Wsfkvp8pGvl6r5Ya8AoV?=
 =?us-ascii?Q?VA/Kfux54UEmTHXwl3z3qIa8kKUirZvvCOZJ0GMwxmPqml7vL312TQzbVeaV?=
 =?us-ascii?Q?PzKVoQkicQkExoYgj71jYhRd9zk7z4vpPEStG/BYrqU35+0vm1lyILPei2Z0?=
 =?us-ascii?Q?P3wZrAyn354+dKH2GPDepN2mTHkopyTYXFa9sRNGEw3EGs1QbYzcw8Z9AYh5?=
 =?us-ascii?Q?9Ge2LQnlNrg60I98IERcyLoeTrZRaNWwnAxrju7Z6Q3gIIC67kfgeprixYr8?=
 =?us-ascii?Q?J7gYYjnYjGw0mKa155dzOa5jq0rvvAH//EXIv3njP+7c5KxFETFFtWyEXMWN?=
 =?us-ascii?Q?33BRtJBtV1MOL9vcJ4miGdMJl4MBVajCsd6AQRhAAzreoWFp/n7aoCX8ywLP?=
 =?us-ascii?Q?zvTive6gpEbWMY/xW/1HzOZ8XwmlFj3KfUjKMenKB7JnpnQPAmrBpymNa5i+?=
 =?us-ascii?Q?R8e/+RY1e005e2+UvfzCrhaQ/JMfkoVzW1ZbjeTsAmMG877U0NtbrKNX0rnN?=
 =?us-ascii?Q?PU2tb7D/+LCDIJ3tOMghy5AmKeRVMtHwJjMNuWbF3YmVCVtDDX73LHamSmbC?=
 =?us-ascii?Q?jbGyghgqoMKe/HJjWyTwjdlPHomlQy6XUvvarsguM2ITAnNfNFiQH/ELeADJ?=
 =?us-ascii?Q?Lm1TXKvdPgNZ6yWAwr4qwdA=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b752aae1-d5dc-436a-b47a-08dd457a5a59
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Feb 2025 00:16:36.1481
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Og2r2PsjV/XVqIkmJiDzEIm+Yk10K7Jo0fkRLtzl7gvSEvpYhg+YQangQPfWq4yiYpDwlSC1MsbiNO0Ta3OJBsDGkBOwEmso23PEnCqjjdLvg7WbJkHfx3M96SPARtc8
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYRPR01MB12774

We can use snd_soc_ret() to indicate error message when return.
Let's use it.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/generic/audio-graph-card2.c | 81 ++++++++++++++++-----------
 1 file changed, 49 insertions(+), 32 deletions(-)

diff --git a/sound/soc/generic/audio-graph-card2.c b/sound/soc/generic/audio-graph-card2.c
index 945a16e6d6919..5dcc78c551a25 100644
--- a/sound/soc/generic/audio-graph-card2.c
+++ b/sound/soc/generic/audio-graph-card2.c
@@ -234,6 +234,13 @@ enum graph_type {
 #define GRAPH_NODENAME_DPCM	"dpcm"
 #define GRAPH_NODENAME_C2C	"codec2codec"
 
+#define graph_ret(priv, ret) _graph_ret(priv, __func__, ret)
+static inline int _graph_ret(struct simple_util_priv *priv,
+			       const char *func, int ret)
+{
+	return snd_soc_ret(simple_priv_to_dev(priv), ret, "at %s()\n", func);
+}
+
 #define ep_to_port(ep)	of_get_parent(ep)
 static struct device_node *port_to_ports(struct device_node *port)
 {
@@ -411,19 +418,19 @@ static int __graph_parse_node(struct simple_util_priv *priv,
 
 	ret = graph_util_parse_dai(priv, ep, dlc, &is_single_links);
 	if (ret < 0)
-		return ret;
+		goto end;
 
 	ret = simple_util_parse_tdm(ep, dai);
 	if (ret < 0)
-		return ret;
+		goto end;
 
 	ret = simple_util_parse_tdm_width_map(priv, ep, dai);
 	if (ret < 0)
-		return ret;
+		goto end;
 
 	ret = simple_util_parse_clk(dev, ep, dai, dlc);
 	if (ret < 0)
-		return ret;
+		goto end;
 
 	/*
 	 * set DAI Name
@@ -488,11 +495,12 @@ static int __graph_parse_node(struct simple_util_priv *priv,
 		simple_util_canonicalize_cpu(cpus, is_single_links);
 		simple_util_canonicalize_platform(platforms, cpus);
 	}
-
-	return 0;
+end:
+	return graph_ret(priv, ret);
 }
 
-static int graph_parse_node_multi_nm(struct snd_soc_dai_link *dai_link,
+static int graph_parse_node_multi_nm(struct simple_util_priv *priv,
+				     struct snd_soc_dai_link *dai_link,
 				     int *nm_idx, int cpu_idx,
 				     struct device_node *mcpu_port)
 {
@@ -534,10 +542,10 @@ static int graph_parse_node_multi_nm(struct snd_soc_dai_link *dai_link,
 	struct device_node *mcodec_port_top	__free(device_node) = ep_to_port(mcodec_ep_top);
 	struct device_node *mcodec_ports	__free(device_node) = port_to_ports(mcodec_port_top);
 	int nm_max = max(dai_link->num_cpus, dai_link->num_codecs);
-	int ret = 0;
+	int ret = -EINVAL;
 
 	if (cpu_idx > dai_link->num_cpus)
-		return -EINVAL;
+		goto end;
 
 	for_each_of_graph_port_endpoint(mcpu_port, mcpu_ep_n) {
 		int codec_idx = 0;
@@ -578,8 +586,8 @@ static int graph_parse_node_multi_nm(struct snd_soc_dai_link *dai_link,
 		if (ret < 0)
 			break;
 	}
-
-	return ret;
+end:
+	return graph_ret(priv, ret);
 }
 
 static int graph_parse_node_multi(struct simple_util_priv *priv,
@@ -633,7 +641,7 @@ static int graph_parse_node_multi(struct simple_util_priv *priv,
 
 		/* CPU:Codec = N:M */
 		if (is_cpu && dai_link->ch_maps) {
-			ret = graph_parse_node_multi_nm(dai_link, &nm_idx, idx, port);
+			ret = graph_parse_node_multi_nm(priv, dai_link, &nm_idx, idx, port);
 			if (ret < 0)
 				goto multi_err;
 		}
@@ -643,7 +651,7 @@ static int graph_parse_node_multi(struct simple_util_priv *priv,
 		ret = -EINVAL;
 
 multi_err:
-	return ret;
+	return graph_ret(priv, ret);
 }
 
 static int graph_parse_node_single(struct simple_util_priv *priv,
@@ -651,7 +659,7 @@ static int graph_parse_node_single(struct simple_util_priv *priv,
 				   struct device_node *ep,
 				   struct link_info *li, int is_cpu)
 {
-	return __graph_parse_node(priv, gtype, ep, li, is_cpu, 0);
+	return graph_ret(priv, __graph_parse_node(priv, gtype, ep, li, is_cpu, 0));
 }
 
 static int graph_parse_node(struct simple_util_priv *priv,
@@ -660,11 +668,14 @@ static int graph_parse_node(struct simple_util_priv *priv,
 			    struct link_info *li, int is_cpu)
 {
 	struct device_node *port __free(device_node) = ep_to_port(ep);
+	int ret;
 
 	if (graph_lnk_is_multi(port))
-		return graph_parse_node_multi(priv, gtype, port, li, is_cpu);
+		ret = graph_parse_node_multi(priv, gtype, port, li, is_cpu);
 	else
-		return graph_parse_node_single(priv, gtype, ep, li, is_cpu);
+		ret = graph_parse_node_single(priv, gtype, ep, li, is_cpu);
+
+	return graph_ret(priv, ret);
 }
 
 static void graph_parse_daifmt(struct device_node *node, unsigned int *daifmt)
@@ -842,18 +853,19 @@ int audio_graph2_link_normal(struct simple_util_priv *priv,
 	 */
 	ret = graph_parse_node(priv, GRAPH_NORMAL, codec_ep, li, 0);
 	if (ret < 0)
-		return ret;
+		goto end;
 
 	/*
 	 * call CPU, and set DAI Name
 	 */
 	ret = graph_parse_node(priv, GRAPH_NORMAL, cpu_ep, li, 1);
 	if (ret < 0)
-		return ret;
+		goto end;
 
 	graph_link_init(priv, lnk, cpu_ep, codec_ep, li, 1);
 
-	return ret;
+end:
+	return graph_ret(priv, ret);
 }
 EXPORT_SYMBOL_GPL(audio_graph2_link_normal);
 
@@ -946,7 +958,7 @@ int audio_graph2_link_dpcm(struct simple_util_priv *priv,
 
 	graph_link_init(priv, lnk, cpu_ep, codec_ep, li, is_cpu);
 
-	return ret;
+	return graph_ret(priv, ret);
 }
 EXPORT_SYMBOL_GPL(audio_graph2_link_dpcm);
 
@@ -992,8 +1004,13 @@ int audio_graph2_link_c2c(struct simple_util_priv *priv,
 		struct snd_soc_pcm_stream *c2c_conf;
 
 		c2c_conf = devm_kzalloc(dev, sizeof(*c2c_conf), GFP_KERNEL);
-		if (!c2c_conf)
-			return ret;
+		if (!c2c_conf) {
+			/*
+			 * Clang doesn't allow to use "goto end" before calling __free(),
+			 * because it bypasses the initialization. Use graph_ret() directly.
+			 */
+			return graph_ret(priv, -ENOMEM);
+		}
 
 		c2c_conf->formats	= SNDRV_PCM_FMTBIT_S32_LE; /* update ME */
 		c2c_conf->rates		= SNDRV_PCM_RATE_8000_384000;
@@ -1019,18 +1036,18 @@ int audio_graph2_link_c2c(struct simple_util_priv *priv,
 	 */
 	ret = graph_parse_node(priv, GRAPH_C2C, codec1_ep, li, 0);
 	if (ret < 0)
-		return ret;
+		goto end;
 
 	/*
 	 * call CPU, and set DAI Name
 	 */
 	ret = graph_parse_node(priv, GRAPH_C2C, codec0_ep, li, 1);
 	if (ret < 0)
-		return ret;
+		goto end;
 
 	graph_link_init(priv, lnk, codec0_ep, codec1_ep, li, 1);
-
-	return ret;
+end:
+	return graph_ret(priv, ret);
 }
 EXPORT_SYMBOL_GPL(audio_graph2_link_c2c);
 
@@ -1078,7 +1095,7 @@ static int graph_link(struct simple_util_priv *priv,
 
 	li->link++;
 err:
-	return ret;
+	return graph_ret(priv, ret);
 }
 
 static int graph_counter(struct device_node *lnk)
@@ -1249,7 +1266,7 @@ static int graph_count(struct simple_util_priv *priv,
 
 	li->link++;
 err:
-	return ret;
+	return graph_ret(priv, ret);
 }
 
 static int graph_for_each_link(struct simple_util_priv *priv,
@@ -1266,7 +1283,7 @@ static int graph_for_each_link(struct simple_util_priv *priv,
 	struct device_node *node = dev->of_node;
 	struct device_node *lnk;
 	enum graph_type gtype;
-	int rc, ret;
+	int rc, ret = 0;
 
 	/* loop for all listed CPU port */
 	of_for_each_phandle(&it, rc, node, "links", NULL, 0) {
@@ -1276,10 +1293,10 @@ static int graph_for_each_link(struct simple_util_priv *priv,
 
 		ret = func(priv, hooks, gtype, lnk, li);
 		if (ret < 0)
-			return ret;
+			break;
 	}
 
-	return 0;
+	return graph_ret(priv, ret);
 }
 
 int audio_graph2_parse_of(struct simple_util_priv *priv, struct device *dev,
@@ -1355,7 +1372,7 @@ int audio_graph2_parse_of(struct simple_util_priv *priv, struct device *dev,
 	if (ret < 0)
 		dev_err_probe(dev, ret, "parse error\n");
 
-	return ret;
+	return graph_ret(priv, ret);
 }
 EXPORT_SYMBOL_GPL(audio_graph2_parse_of);
 
-- 
2.43.0

