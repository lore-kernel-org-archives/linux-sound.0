Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazon11010005.outbound.protection.outlook.com [52.101.229.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 830011D86FF
	for <linux-sound@vger.kernel.org>; Mon,  3 Feb 2025 06:21:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.229.5
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738563686; cv=fail; b=OXwNghPHrp8Els3/sApIu31qFgrGQ49G/4NvFTZE4wSyOX9lfAJ7PF9gA6b9qnk6RZ6twVHtWRNlh9ZZUyPBNU5EFAYwVSWOcaUyZ7ZAPxTAP2HZ+eghZ3xToz8kW3yZnS4oR9NhRh3r3bwVkN4CGsVfSLduew5LMZ4IQPjPXq0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738563686; c=relaxed/simple;
	bh=qH84IT/IqlbFAgVR2p1wfRlwO8I9S65tYlwNWm5qrDk=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=UYCgaYX3qx9eF0owJsutn8x3DRIBHjCJhipGANQbsm/1Pm6tS6cCZ8IpJA34qa8veiCfOAG7XLg6suFcrmkMDLT/16/W8SPJnrQD7eIOP8bKMtTN0D5vLl1tmWc2gK2Z4PB/BzFIKuY3AdH6XUvxRanBOosQdFRrKPejDPgdm+U=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=a70PQCja; arc=fail smtp.client-ip=52.101.229.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="a70PQCja"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VxJ6w7Cv0jodHQ1wD5EeK+VzYrcS5Oj32npNCWMCVEQxSSInnT/5mgSIHCuVsTV/mwphVipz71YkyNHZb/tzGaSXBqU+8BdrLsuOBa2uiZG6KHqTDDSqfdEcIQVLTQ5Z3l+IgIeqgHHKqUXxfNOBmOrmwoJK3kxPEuwMbh7PIFSn8cM1P7mSMavCmlHGRJ22ZQ98zM8QlIU/EftLdHnqey1xnrFKJeE48f1RUpQO1Tir4NTpYBz1xJMUn2vtHYEm6FBQ2LBwZfqVsRcy8Lss1n74DWefyt5oSNqZhMl0lKAyjpNKkPmKFfRBe//l+ZKhATzx9s+9PeXvG7zkuwV1FA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oTZi0kjDixf8Wq4KTG7Dluh4B9mULwFJaK/IvjXagJc=;
 b=ELQzr0HyemkOAmElOz5/h5AcmY3ZmD4SRDaJhnVkWa3Pp7DfQ9RK1McTyVtSV2XXb1trNkzj3PylcCBWQbHsW/RcyQqIyBQ7lQ7pKwHZKIQhBJX0ZlQvGO1fi5MervnO2eJYNpJQBK4nd0PMCAS6qjyNMrcA/xl71hgvph85a+at3gTxhYeKg69+0S3uekLgUaU9Jcbc3vKOq0DFNo/LnBAlqCiibdpQkFyH0FxHYCnFo+nd+ppWTR7jIHWi0iKmh08iqGK4qsWZvAqqC5ncGFMJ29i4cjtNlV8vT9n5xSuVB5MpihHlh66pI+atZy1TEYaO3XBtAsDw2nWhkPoOpw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oTZi0kjDixf8Wq4KTG7Dluh4B9mULwFJaK/IvjXagJc=;
 b=a70PQCjam/ikuOEyiZ/0n92HKx5qhSgcMzuFf81wBzM2PkwKcUvIOYSl/AWV51jyjXaZ+fN/2vZ1QSDuI50ZYEkEreE7Y9QSRWM5UJN3s0LqXDuS2H2E/8A5R9ScQkJs+oSNCMbUMxhUKNpT4T7FqgWmYSD6DDf+Y0833YxjhIo=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TY3PR01MB11036.jpnprd01.prod.outlook.com
 (2603:1096:400:3ad::8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8398.24; Mon, 3 Feb
 2025 06:21:22 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%5]) with mapi id 15.20.8398.025; Mon, 3 Feb 2025
 06:21:22 +0000
Message-ID: <87tt9br1jy.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 6/6] ASoC: audio-graph-card2: use snd_soc_ret()
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <8734gvsg5i.wl-kuninori.morimoto.gx@renesas.com>
References: <8734gvsg5i.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Mon, 3 Feb 2025 06:21:22 +0000
X-ClientProxiedBy: TYCP301CA0086.JPNP301.PROD.OUTLOOK.COM
 (2603:1096:405:7b::12) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TY3PR01MB11036:EE_
X-MS-Office365-Filtering-Correlation-Id: a4883382-5dd3-4f69-44a8-08dd441afaca
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|52116014|366016|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?lZDiUbftGJ5814vvipeTIf732DsjCNBZHuQaSUGvQyv+YWSzRkPb2NH9k8Rb?=
 =?us-ascii?Q?WABinkNXLWErMVfrgCVfdWWK42I9czBnbiLDjHM5BYk9lBSALkZ0BmaZ4Oeo?=
 =?us-ascii?Q?2EKNhiTt42U/XAnCasEd/JQsPsg2veFMnlWXBmiRhfivvM96ihoJHLCNwjLr?=
 =?us-ascii?Q?u6A+C3CWY3dxYhCkA/8ZkKx/IAmSGDFD+EbOOXFfOK82i8UGZkzaIqmxQ4IY?=
 =?us-ascii?Q?OT9LvbkDm5C4kR6R7f0veqsU+lJl2LJFTi23UuLWBFA2tASBn7pmgaI4Tl/h?=
 =?us-ascii?Q?Rf89SlgJdmFjAp4Z0AGGxu8VRnd7G9bMYRQkGDhsBHU/z3Dhq+13vMQN21OV?=
 =?us-ascii?Q?f90box42O1Zk1nPsIwotrS8PbnWvIsJifTUzOqq+5lMpPDZU9J5iLgNXwHSi?=
 =?us-ascii?Q?mVwKDvUmcJ5TpBZBZxKMLQD5IwYsyx5xkm/JTR6spqK0hg5yQ85zo2l1sYMq?=
 =?us-ascii?Q?+yTtSF76nBZQYwx3qA3VW2j+KnuHd228iSLIDiATNEne3DQrwyzbxqgMOVpU?=
 =?us-ascii?Q?ZBiAkIFuzIGN3Dg6itDGpako7nFkKOf5xZ+DK9+f4HOzEFe0ABQmoYvBmIPp?=
 =?us-ascii?Q?uhMXjxH2BgstWQKIHG46cJcRr6DZpO3Qg67+diEZGgpRxxwcpr7IGr+0ty9Q?=
 =?us-ascii?Q?PWISLXxkA7sLJsa/yPbuF5rtTFDQJGsJWj8RMAd+90u34xX8AhOrS59oAsFo?=
 =?us-ascii?Q?mD3Qn0Z6BdQkDNOG9/tLsvNP2vfsMCCPNdvnCc2fp01emJanNu8GhXNA9s/M?=
 =?us-ascii?Q?9UazRIUmaw+5KE7CMdOKFRYduQtbWsBwuCxuUeT+X9JrKgVuv8oFiI3I7tKz?=
 =?us-ascii?Q?RIYIsHd/Q1ckX172vybiSxGDQlIMnQLTuydqqjwQrnmAxMZqUScEc2JxtDbZ?=
 =?us-ascii?Q?AvUrY8ZsUC/yIzsuIwV/KWHev7G7QiLf5VypDV2vYPBFrJdTErSRbyyxlX2J?=
 =?us-ascii?Q?5YbiqQjsk/TJldBPBZW0ITNBQ1UQwEdC+7DT7IzgYs5tLlbZb69JS79ccPKp?=
 =?us-ascii?Q?ngQhkAs0e4ZiBsNCM13yidTdfewGKivFyxnt4jlcbEw+IMYx5tXYsvX+1RCh?=
 =?us-ascii?Q?JKHHgPOFiggCsbL5JQ+Pm5kpzKSFw3sH9j3GcImB+HcsapZofMxT1z9TdvR4?=
 =?us-ascii?Q?VpfB9H2nv+hTCVdXnKEK7RopmYqHjhomUBNVmSP5dkj+bFn01Z0wWRhZ7Gx3?=
 =?us-ascii?Q?k+UO81LHrdpOENxAbq+e3rcIOW21W6k1ex59MWgl6R1bqnZsIKXfkuBVZWQj?=
 =?us-ascii?Q?aOjjjY3ddtK1uSxpioFPsNl8LmrfdOgSLx2sw6s4+RTjrXZN8dtwzJyiFrK8?=
 =?us-ascii?Q?+NEg6znhtlZMOAxRBQySi3xnaDWGId1SbT82mdaRtvST7AUm054lUeU7b0+F?=
 =?us-ascii?Q?jO9Jb59GGOAh2YycJxcYsDsQM6f7Nc8ix0lFv7ceJDFY48wySi37ZcX2g5e1?=
 =?us-ascii?Q?mlNQPIuU39+NULP8cDx+d9HQDBZefsmY?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(366016)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?1CHyWWcNOkDYmvXmB7GGVK90FKLpLAqrnr1U5qerFzW46xe/k+M8Zg0SmwSv?=
 =?us-ascii?Q?syYhff0dxj4tW6LJS5LXTTjQEZRqjYdLGUmTzSsV+h0CGY/4q43ZodFEwJk9?=
 =?us-ascii?Q?lfyfOz6we8mft091m4CjKXU1goUJY0kxEZ99E/BGyoihSu6uWkSWkvPkLgfR?=
 =?us-ascii?Q?liVdL8NaOuzOJ0YfzOrFMpUk0pAcDARR/j+WCXE/CgbBpLNbmcUp/hJnGpSG?=
 =?us-ascii?Q?83E0cnPEQz6cLPon7bhPb8LjNpTc0xPb9j3daqcy1PpEi6fH130t4gkjQ8oW?=
 =?us-ascii?Q?8Fh8zoUuMHi3dhsggyJjGpwon7UNrWxZdJfMwjxs8nQ7SLY1UAyD9mQ4nOWy?=
 =?us-ascii?Q?wFs5O0/R57ELyO4OXy6b/u1ciNLuuE9On52a+nzZqebiqLbAqvu+05vi5G/7?=
 =?us-ascii?Q?I9hIQ+c8mm8WqpTgFW3VDQVqHQ0RPiWgdaaeJwmYg6LH6lfzTZ34NOs6vR54?=
 =?us-ascii?Q?NGupayOHxTRvaFMDF7XRuYqN2heVovAvQdlTLQQslGJolDsGulzMdFBD7rLy?=
 =?us-ascii?Q?auzoh3VcNC0Ga0CwgWmm/VjyaubktqWYRoHYvb9PQpH3J3yvwKgb6yedYKOS?=
 =?us-ascii?Q?9W0xk5cFJsEgA2rNwOQ642WXmJQLgO2YtMwyrJ2Jt1f4K6hD96jQVzgIIfG5?=
 =?us-ascii?Q?/7lbdie7T/42CRZfmO2WRzNBPve59Qgw4oPRUZ3ZplY52PHN4CA6+w5grBRV?=
 =?us-ascii?Q?wtp3m/B/jV+rtmW/+siLpkl2M4Jv0UGAFtrvZdvMjTudHhkan8n7BTBogpT7?=
 =?us-ascii?Q?PByNRXE1lM0zFw0YRaepO/kDlBb/zMJADuyGwn/nuEe4+dCSRxQ5VMs8TSye?=
 =?us-ascii?Q?esOOGMY3gZ95cqy4V1T/gUqBsDvt3rxunvP9t/fFlKApCXqkB5gl8Nbl1czb?=
 =?us-ascii?Q?RbgDpq02TcoTHaEPUB7JeVyMDidHUtt9pChvJNx6XG7m3H99Ji5ZOpaRlWPX?=
 =?us-ascii?Q?w9iVlMJ/VEtPprLl7+LYzFHcJ24/A/Jq/nllBrkKmxB7pflLynkZCueLnkPu?=
 =?us-ascii?Q?DM+nFOH4cuQDAee+hJeyV2GuFQqN/0GDje9W943gcueQ+a7pTZ11cGrYHtQ2?=
 =?us-ascii?Q?527fxwU0cqPG9JOdaL43487ES6AGmYPdc/zjRP+ZtpQqM+T5vrevcznM60hd?=
 =?us-ascii?Q?yhNk9+VsnuRVcBtqye5VK+GMFMNEa0RuNt1mAJSRdpPE39LuzxWXVHTBPx6l?=
 =?us-ascii?Q?gAxpleJiUPwNQ9/uBMQzoAOLwoU678EqI8FWn1kKyaJaoc1qGR6FYKn3109l?=
 =?us-ascii?Q?v0mjG5kfl0P0UNYBhRXXrKUR8IznRcxqJH1PUmJN3YtGP+hh9hGL8soj4Fqk?=
 =?us-ascii?Q?mYLLGOZ0ZpuUHuV3pFtQ1MWGl3Qb+LwOlELAD00zaB/mKTD4ATgE8ncJCsBn?=
 =?us-ascii?Q?4U3ze790PVg4DOcHoagqCYCHaK9zaGHCB/kskDKFa4cHH516B8wwgleSCwfV?=
 =?us-ascii?Q?8T8B1TioQB1wYN/hqGQFwJDnWIoS+y8PSN8sU6msOrByZHtFzY5Mvbyzz4TW?=
 =?us-ascii?Q?3cHMysvc0VgnacexMPyRppq++kILKIcbadD6x+E5AnHTN82agwL2D/ziDGGi?=
 =?us-ascii?Q?5Ldv00JHbN3nIQtS1EKvnalkjAJXrWRvN4hRgq7mCkQ8ZS/xDuYiVjWDJPYe?=
 =?us-ascii?Q?fhPVohrTKgqhZmet1GSGy1o=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a4883382-5dd3-4f69-44a8-08dd441afaca
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Feb 2025 06:21:22.4659
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Lde7XN4RRYpugeTDGRDbFSzoCLul42g8bYOt0OePINyJJUiWIt1yoIIWQsxSz1qskTROovd2AMaQg4WiCqkCxDsLD4rczLhLB0BshMuWuh1EQidcPsrNJVGCAUycxjzz
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY3PR01MB11036

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

