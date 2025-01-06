Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazon11011024.outbound.protection.outlook.com [52.101.125.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61C8B17C
	for <linux-sound@vger.kernel.org>; Mon,  6 Jan 2025 05:49:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.125.24
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736142563; cv=fail; b=bm1OiNc42WOo/BTEWAvLPYesa2y3+e7X+jwpAOhoOZATQnnEmsNGpbmnYKZLNcuAwJ9+PdNuzxPUSla8Q9FuubNgtPi7jm1fsd6GYj63vxvyFx/tehyv36uDeZix0BqxW+WZqF/dkF4RUqqHuPhQvLG+/AETXRDsDOiS+G0tgh8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736142563; c=relaxed/simple;
	bh=tGcFxxdLtL9v/FocUqoOF+0WgyRgMs3IoGhbzcBshD4=;
	h=Message-ID:To:In-Reply-To:References:From:Subject:Content-Type:
	 Date:MIME-Version; b=rmkOafo4Ds8oHZtd9NQt3Kr7CKmeFz9Fzmwu9DmSef5ofHWTZ8kWWzwiE/SJum4/hbPrurc1wC15bhIFmDOZV3h1ySzKMp8tIwiOP6lcPaTJZ8zbMU/eiCDCmFDgmegsfm/oPtYhPjZWFLQoDKJxX34HmnJDrJep84LTA9zFCEY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=NC+S5/ri; arc=fail smtp.client-ip=52.101.125.24
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="NC+S5/ri"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EPkqvU2TwGJsBurC1ZgzJip2oXeVk4JjiCZvA7v3ZRVc8o07h0YIDbUXA7xBgTkffNzgrer4AC3tnrZ0O7072Cacv5K0gXh7rvCyma0o4e4oVzEajitiohd9cIbN2GjM4sCNPberfPhAKw8rvHR7AkFUZwhPsScdH4Gw1r2CJN9SYuA+JV2RN7Ktnwy6T0tDHktFCYMj/e6r63ysdhhRLB2//aZid4xIRWue9uViWt3acaT3PnGdT7dyYoqH6mEe1nsC/0IVsx9/KsRRvJPeMwvnjFhwkBmlv4g88W7iu/H+CfG0z0U9ReRByl1B7d+HYJKX9cy0if9m+upTSgriCA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0zUoAJeE3+6qnE+y8FzuZc7ykrl2IL9PBgyEkfxctoM=;
 b=Ei3nUHHBRMpIULxcwvAPrph41lp0m+OVWJ+ct+pYPTwvd2wDN1MSLGJ5OvIDdeTWpPvMS++6g1a1u9OA1pKTHI5R687snnW5ODDeNt5h/U3VsRXLCeJPdMWgw0IgQts/w2V4VKWISdBxfX9hZlbsuQqURtcxUMikCAjFal+zWyS8FzUSajLqwoSVMCv3bR2f9JQqrvccKdGiWw2lQxjz9SlH9w0+u0ZYG5CbvYbQ7Hx8BfTWYIIsT1VYQwbRar/YNAn1e+/nwKZGkL2KdffHK6GT/mmXZUyRrND7rBDA2md6NuDNjXauO2FDNfWpqYKAGFF+bHDsDZMXPuX3+t0aPA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0zUoAJeE3+6qnE+y8FzuZc7ykrl2IL9PBgyEkfxctoM=;
 b=NC+S5/riuL2XdZDd6gtz3lrjSxUyDrB9CA0wqw1mR0nSxFFH62LQr9gz4Zu38AmeFmkImKeAxfaU2kezFThnt2BN3mpPuTc1KUa4JMHbdCNsu3EEounUGHbmJqNotj5k0E09Y3jwRn5+I6yiUWh/gYWY8kJoiHo/Kw+h6/vNzqI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by OSZPR01MB6247.jpnprd01.prod.outlook.com
 (2603:1096:604:ed::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8314.17; Mon, 6 Jan
 2025 05:49:19 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%4]) with mapi id 15.20.8314.015; Mon, 6 Jan 2025
 05:49:19 +0000
Message-ID: <87wmf8o5k1.wl-kuninori.morimoto.gx@renesas.com>
To: Jaroslav Kysela <perex@perex.cz>,
	Stephen Gordon <gordoste@iinet.net.au>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Takashi Iwai <tiwai@suse.com>,
	linux-sound@vger.kernel.org
In-Reply-To: <87zfk4o5l2.wl-kuninori.morimoto.gx@renesas.com>
References: <87zfk4o5l2.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH v3 2/7] ASoC: audio-graph-card: use __free(device_node) for device node
Content-Type: text/plain; charset=US-ASCII
Date: Mon, 6 Jan 2025 05:49:18 +0000
X-ClientProxiedBy: TYCP286CA0255.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:456::15) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|OSZPR01MB6247:EE_
X-MS-Office365-Filtering-Correlation-Id: 042c2a4b-ebf2-451a-a3aa-08dd2e15dc72
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|366016|1800799024|52116014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?VyEV/1hihnhf+/r2BdrwLJ0LMJLOelrc28NAQuQOppQDh2myB+Be4i25A9IX?=
 =?us-ascii?Q?jP1S/QnM+yGn0njVg7s27YIRB0VyM38p1dJY5L2uUa6Wgw8Z1H/2WAd4pJk8?=
 =?us-ascii?Q?Omo4nyvx1Kme+c34oU8JS3tGR+brEfozrn+y2429mx5nD6WTqcm4lyJbHAJm?=
 =?us-ascii?Q?5yUkM+Jfa89m96MXD/sCJsRMFWeyNz93HqZSaNsaJhTsMnSZIc3/XrJquDMP?=
 =?us-ascii?Q?nH6gHZW4zfdvoZ9Ik2vW2wr7CuJc3nP39cqdF2Wsc7DluVMIztOIgX4pZoOr?=
 =?us-ascii?Q?Z5kZ3Hc8dGEtJzTtlQRDgkZPlXQ67FdJd/0fGT3d318HQK555DzAgHdvLRN2?=
 =?us-ascii?Q?KJ0rt3OvkQNWMSrk5oXPmivmyC/jzbP8mBW7JESk7GUYuTJ6Kx+o/kh1loaH?=
 =?us-ascii?Q?DD6YWVnzQvsNhFuyGnzy4zEL/oTQT5ibvfPjVtwkmdwjqVCdL8xOjUxkQ+mI?=
 =?us-ascii?Q?vXqbpoCIQbogAOwFScrf5cQmq2OQr3utDMrgPrVIlxcdJgPKp8mDNx8BAXvk?=
 =?us-ascii?Q?l/bfHRxZnkj0a78cH5SVcVbGsvGSVZDIYrHF5nrNDA4Hkc4hoEyNV92wmsj3?=
 =?us-ascii?Q?1xMSWfkN9YeFNh0MSEL0V7wK1CX/mXT06b1r40yUxB9e9uoVDFmx4p8MXnvr?=
 =?us-ascii?Q?i7g3zzPf099+btBI0NaMdauWP6vEYsttqfUkXma3DtG5dbCAAFl8Ot7VBkWY?=
 =?us-ascii?Q?9g2Z/McYKNRVlqKtJ9GcJ06UL7ozg97N1EXHNWOwR2lDZQ6srH7FzsgbNh7d?=
 =?us-ascii?Q?jqzsMQ/o/kL+ksxjYuiMF9Z8jSJx1nX/zbe7GlpEuwrjhIbCvy6iFgRSuIGO?=
 =?us-ascii?Q?+nkW5Huvh/hdZdPakjIRlUTIWHt23uZdnaprz7Un50CqR4byHP4mX9A7GMuU?=
 =?us-ascii?Q?1rZSh/WJ7+aPmrfqed0byAIbkboc3hXQ36nvSjOoHJ8gY5gvmbWSbwoQnc/6?=
 =?us-ascii?Q?Gvh6Ae4u7eVN7u4T+FYvtV31KKPhtLpHyziR5J/RYuC8vjLxsqXe7gl+/so/?=
 =?us-ascii?Q?d2t96h+UEBdm1yFBwxTfMDInZzXu1xxCpx8kgE9m3KgNBli2QLZUy8yTK2ZI?=
 =?us-ascii?Q?DB1VHVKP7D3Bjww8rXIheizU0DLLLHlV/MFa0jAJQU7l/UrPg7Mq9LkFWKsi?=
 =?us-ascii?Q?j439Nn88Qlhfwf0UJAdJbEHQiaVJkhnSlUlmEIyf9MLd0nziXAXOxkAmUsFV?=
 =?us-ascii?Q?SvtWfYO7HSVaJXfyzAxJPFrgv2u6GZhMddKMViEpcPPynt/eHDHGTUQ3fUEw?=
 =?us-ascii?Q?CV56vFNan/q/oS5xjgrcOLpLdO6SCIgIR3XkG6n5YGXuFTXT6dcOwHFvR5vv?=
 =?us-ascii?Q?pkIOdeVqr8ItE3Uz4RToe1+1KRclLavOCrpvqewPZWUW0y+0ew0ZY/33MBjF?=
 =?us-ascii?Q?WoMOuBL5i1vETKkdGmIgUa0MzK5ACM9BpG6IljBu30bKt1PJIUXKqyXX4eRr?=
 =?us-ascii?Q?PGDD9MTYraBS2v4YEnPu1FN02EAUBiDq?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?P919nFO9OVtVqUAG4FUSCQRiRPW7rKDT11+3fiFREjnFUwuSrg2Njvn76JK+?=
 =?us-ascii?Q?wRxPB1bk6xGyN1Xlqq9iyKrj8LwlTFTnOFfhv6TYr52SfZvmZZUat0lT2Toh?=
 =?us-ascii?Q?RUowBTaeK1e4XQ/VnXt/hW6RNhrTevwiI3kmuRSD9PtaZBsXvbIbZfUnPib2?=
 =?us-ascii?Q?Thw0Zsag1n+41v8UVkJOhYEmutoDuvGtjosrK3QUp9DebU6OdkAGBPsJw2er?=
 =?us-ascii?Q?GORVjff5jGV7wLI0e/Gt0yVg8zJflsIifOYJlHTJEki4PlC8ZP3RBGHXNe7t?=
 =?us-ascii?Q?DYBnRp60Yt5met31oJCZbwlKzK/Xto+5ATf3f90vOxeUsJcbDB+A2aNr00n0?=
 =?us-ascii?Q?uA1jszeFpVOk0fsjrgFwrTPidbu9bPDlHf7rBIWYUu88oTZEoqeUQ7QOuiMm?=
 =?us-ascii?Q?oUpYxK9PJSM6TfOvWAPEvPJlOW1YfazVrbZXwcKTf1jazVqzDJk1ElQfOeUv?=
 =?us-ascii?Q?6x49wXHOLeGfS2OL/WgNCf2QE8vbHO7kPbHZIVCj/rbcptvesndzsxoBLFpc?=
 =?us-ascii?Q?ElfYNKFphHH52VYXa7m41qPvPbT7kQS1Lm3kyV4Zw1dYlgBc5GVJsd2J+Mwj?=
 =?us-ascii?Q?wMzhZxgYNxcR8bZdOJCIVW8SNR3zCo/zUol7bafb7neYTKgj7XWWGM/eJFnh?=
 =?us-ascii?Q?QhjTY4riWGOr1eGfGbMushoYY9mIm1zDoRCcNNh7HqL/cqpbfd9fPxD31p7E?=
 =?us-ascii?Q?gzfKgzieW1j++tZSMqGXhI4fNIC+bXEGjkbR6zzypW0EQ3GEJZ9azRl8WVXq?=
 =?us-ascii?Q?SXUmPgDkissUHSFosIFYLYOBFdaUDWan6H/L5tNaIhELojD+DWXTY0RK0nTW?=
 =?us-ascii?Q?hfwXX6PVorNDLw6yfHIN9TxOtfhNe7Vr8WSwpUfg548rYqnY6ZpIUvgiD/SK?=
 =?us-ascii?Q?knqjo1EkDGrYlRXINBhntonMMp5la/pgNyLY8lnXe+txpXbwa9pXQbOL6rac?=
 =?us-ascii?Q?QVaJP1qr/FomiIriWIQJtsDyuHF4IG0bklS1u4fP+fVW3P9kRVN8WFpgpIVV?=
 =?us-ascii?Q?lxi33Fusu4VDVvftoCBjv3v/XFwZ6A+wFJf1cfEGSbrp8lPstjX8nAfwFrsO?=
 =?us-ascii?Q?ChZznNSlGXJmna+Tnv57S3lFZ0y88Fcu2PT1KaIFtowDMYok7NfPaHm0VpY2?=
 =?us-ascii?Q?fUABCHNNYCAHEsyH8sE1ThCiYhhm0ULJ0OFw78ejw5CyA6xgV87TgowRnEKc?=
 =?us-ascii?Q?WAtcsJb4F4mPqbp9NnAmbchJVHMPG2j7hnV4lItXAsiqOGZNyB8HsnobXA74?=
 =?us-ascii?Q?1fZam03c7hGrusTwlVI8qFu+ZR6CDpkpeDRn8wI4M7RtY0okrQcIb/eUdmpe?=
 =?us-ascii?Q?+OpUtaOWExL04ji1E8MBzPUTifoLicUlJa/nV5QE1UGKmUXOYA8hoPSHfkTE?=
 =?us-ascii?Q?3aGPVfwAq00/1XEXgV+Soi8KvJr8F3BqqYM7XCIPFRu21b9LxPFo22R/ytGU?=
 =?us-ascii?Q?A96RVx7zNXzKwIylsk3rFnOSqCZWeP7JKVj5yq8EIFas4WDLukcsoxe99Fzi?=
 =?us-ascii?Q?bVUdXgWS2+G0nT7A328bAtXphiBlNaDjzD4/wrtrKcuPnzHXEFrefgFrH87G?=
 =?us-ascii?Q?BZu6cDuG6EXQhaSPZi5UQNudrJmFcfWCgb1ZKMhYU0TJzQCHff4ilsyf1bn1?=
 =?us-ascii?Q?SMD2Chs/WO8tX+7OB9ctJ/c=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 042c2a4b-ebf2-451a-a3aa-08dd2e15dc72
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jan 2025 05:49:19.4755
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: aZeYX8hMJ5DqxPeZwiRj2aFc2o3/o4gJHaTRVHYSZaHeOID+0L+RqH33UeB+KkCtRVog1hK0XeF0kVFTiEIHu70I61W19yd+D0UJY3eNuuVnCxcsyUuF4JVrLMT2Gr2z
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSZPR01MB6247

audio-graph-card handles many type of device_node, thus need to
use of_node_put() in many place. Let's use __free(device_node)
and avoid it.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/generic/audio-graph-card.c | 48 ++++++++--------------------
 1 file changed, 14 insertions(+), 34 deletions(-)

diff --git a/sound/soc/generic/audio-graph-card.c b/sound/soc/generic/audio-graph-card.c
index 7655425a3deb1..7c422535b01a2 100644
--- a/sound/soc/generic/audio-graph-card.c
+++ b/sound/soc/generic/audio-graph-card.c
@@ -81,18 +81,14 @@ static void graph_parse_convert(struct device *dev,
 				struct simple_util_data *adata)
 {
 	struct device_node *top = dev->of_node;
-	struct device_node *port = ep_to_port(ep);
-	struct device_node *ports = port_to_ports(port);
-	struct device_node *node = of_graph_get_port_parent(ep);
+	struct device_node *port  __free(device_node) = ep_to_port(ep);
+	struct device_node *ports __free(device_node) = port_to_ports(port);
+	struct device_node *node  __free(device_node) = of_graph_get_port_parent(ep);
 
 	simple_util_parse_convert(top,   NULL,   adata);
 	simple_util_parse_convert(ports, NULL,   adata);
 	simple_util_parse_convert(port,  NULL,   adata);
 	simple_util_parse_convert(ep,    NULL,   adata);
-
-	of_node_put(port);
-	of_node_put(ports);
-	of_node_put(node);
 }
 
 static int graph_parse_node(struct simple_util_priv *priv,
@@ -140,10 +136,10 @@ static int graph_link_init(struct simple_util_priv *priv,
 	struct device_node *top = dev->of_node;
 	struct snd_soc_dai_link *dai_link = simple_priv_to_link(priv, li->link);
 	struct simple_dai_props *dai_props = simple_priv_to_props(priv, li->link);
-	struct device_node *port_cpu = ep_to_port(ep_cpu);
-	struct device_node *port_codec = ep_to_port(ep_codec);
-	struct device_node *ports_cpu = port_to_ports(port_cpu);
-	struct device_node *ports_codec = port_to_ports(port_codec);
+	struct device_node *port_cpu    __free(device_node) = ep_to_port(ep_cpu);
+	struct device_node *port_codec  __free(device_node) = ep_to_port(ep_codec);
+	struct device_node *ports_cpu   __free(device_node) = port_to_ports(port_cpu);
+	struct device_node *ports_codec __free(device_node) = port_to_ports(port_codec);
 	enum snd_soc_trigger_order trigger_start = SND_SOC_TRIGGER_ORDER_DEFAULT;
 	enum snd_soc_trigger_order trigger_stop  = SND_SOC_TRIGGER_ORDER_DEFAULT;
 	bool playback_only = 0, capture_only = 0;
@@ -152,7 +148,7 @@ static int graph_link_init(struct simple_util_priv *priv,
 	ret = simple_util_parse_daifmt(dev, ep_cpu, ep_codec,
 				       NULL, &dai_link->dai_fmt);
 	if (ret < 0)
-		goto init_end;
+		return ret;
 
 	graph_util_parse_link_direction(top,		&playback_only, &capture_only);
 	graph_util_parse_link_direction(port_cpu,	&playback_only, &capture_only);
@@ -187,14 +183,7 @@ static int graph_link_init(struct simple_util_priv *priv,
 	if (priv->ops)
 		dai_link->ops	= priv->ops;
 
-	ret = simple_util_set_dailink_name(dev, dai_link, name);
-init_end:
-	of_node_put(ports_cpu);
-	of_node_put(ports_codec);
-	of_node_put(port_cpu);
-	of_node_put(port_codec);
-
-	return ret;
+	return simple_util_set_dailink_name(dev, dai_link, name);
 }
 
 static int graph_dai_link_of_dpcm(struct simple_util_priv *priv,
@@ -250,8 +239,6 @@ static int graph_dai_link_of_dpcm(struct simple_util_priv *priv,
 	} else {
 		struct snd_soc_codec_conf *cconf = simple_props_to_codec_conf(dai_props, 0);
 		struct snd_soc_dai_link_component *codecs = snd_soc_link_to_codec(dai_link, 0);
-		struct device_node *port;
-		struct device_node *ports;
 
 		/* CPU is dummy */
 
@@ -267,14 +254,12 @@ static int graph_dai_link_of_dpcm(struct simple_util_priv *priv,
 			 "be.%pOFP.%s", codecs->of_node, codecs->dai_name);
 
 		/* check "prefix" from top node */
-		port  = ep_to_port(ep);
-		ports = port_to_ports(port);
+		struct device_node *port  __free(device_node) = ep_to_port(ep);
+		struct device_node *ports __free(device_node) = port_to_ports(port);
+
 		snd_soc_of_parse_node_prefix(top,   cconf, codecs->of_node, "prefix");
 		snd_soc_of_parse_node_prefix(ports, cconf, codecs->of_node, "prefix");
 		snd_soc_of_parse_node_prefix(port,  cconf, codecs->of_node, "prefix");
-
-		of_node_put(ports);
-		of_node_put(port);
 	}
 
 	graph_parse_convert(dev, ep, &dai_props->adata);
@@ -361,8 +346,6 @@ static int __graph_for_each_link(struct simple_util_priv *priv,
 	struct device *dev = simple_priv_to_dev(priv);
 	struct device_node *node = dev->of_node;
 	struct device_node *cpu_port;
-	struct device_node *codec_ep;
-	struct device_node *codec_port;
 	struct device_node *codec_port_old = NULL;
 	struct simple_util_data adata;
 	int rc, ret = 0;
@@ -374,8 +357,8 @@ static int __graph_for_each_link(struct simple_util_priv *priv,
 		/* loop for all CPU endpoint */
 		for_each_of_graph_port_endpoint(cpu_port, cpu_ep) {
 			/* get codec */
-			codec_ep = of_graph_get_remote_endpoint(cpu_ep);
-			codec_port = ep_to_port(codec_ep);
+			struct device_node *codec_ep   __free(device_node) = of_graph_get_remote_endpoint(cpu_ep);
+			struct device_node *codec_port __free(device_node) = ep_to_port(codec_ep);
 
 			/* get convert-xxx property */
 			memset(&adata, 0, sizeof(adata));
@@ -399,9 +382,6 @@ static int __graph_for_each_link(struct simple_util_priv *priv,
 					ret = func_noml(priv, cpu_ep, codec_ep, li);
 			}
 
-			of_node_put(codec_ep);
-			of_node_put(codec_port);
-
 			if (ret < 0)
 				return ret;
 
-- 
2.43.0

