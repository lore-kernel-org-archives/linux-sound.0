Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11010059.outbound.protection.outlook.com [52.101.228.59])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9C07320F
	for <linux-sound@vger.kernel.org>; Thu, 19 Dec 2024 00:35:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.228.59
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734568523; cv=fail; b=exA0VZKxWaNIYPP+PNMKvMkIcM1DQnAhqzMgc1M5fPmzzeJ9OU9lLvuczPLoZsaPXyO8wvaua0argbPSj+9QTOChspzwrALav1yWxBT+1Z+YY5xQu6kXCoqlNzCWio/vpfzV1PFB69PJCaQ1IeADt3eqdrtsZMcmaNwLvD2McrU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734568523; c=relaxed/simple;
	bh=tGcFxxdLtL9v/FocUqoOF+0WgyRgMs3IoGhbzcBshD4=;
	h=Message-ID:In-Reply-To:References:To:From:Subject:Content-Type:
	 Date:MIME-Version; b=qQIETqBB67CWqUhUDPakznicCQYdMIQHx2k9eDsLyl+rneXmJiEHOCyju1IX7Zr+IRJINaTNUOJhsM1x4vDNwm4WchaBOS5LNteH/9WfIak5ChTyT/f9lo0gzCYk3WIEV+96YmndypYtleAvX9vouEZAgKs6Een3QUyz8vcWpGY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=TbiFuoi0; arc=fail smtp.client-ip=52.101.228.59
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="TbiFuoi0"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UL7vKhd/E+534fjky2yOmgiypT4sw3cJiXzWKFzzxXWYO7RthTjDKNMt/BzEyAp7qs57xeBVCpintyzknHkYOos31qDaFtHmOEXv/xBKPsWA0g23v4+poZVv8xjwE2n8rljvhSUZK5YDr0ZpBFevGGnHOoHAtDh+5nPnZhHBUQ9RKTL4W3s8BLIYekqaqyldsHNWmShinzNxWp+2rJIv5dRimgtTuBCmv7hkM38FDhldks8IlbhAhmVTjFwjKs8+7NZZEN+ese9zRwEk698pHvL60wMChk7glyz8fwjBM/7HlCU1nfzeozIAk6zDc94BJ3siNLeBUY/iIfm5fAkmMQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0zUoAJeE3+6qnE+y8FzuZc7ykrl2IL9PBgyEkfxctoM=;
 b=WdMvEKBp8ZYoATK96D5Qb1E/7T/TmMO4A8YTB7dM0T8/JQNsJ2hLJlZ4bdSHWldr/sE0z67fFM6vwaCsU6SsrD5yH4+lWR3SEEQznB/3f6ZuPR2N+O4tC5rzMPmpl6vBCqn1bWw3NLzQ07HDmI7oDQjN0+3bF0zDCsMPii4yd1F1vU2iw+Hti1XNpLEWY6wo/CUeshVuizd1AnEnnl/eeuUYu+s/7PkqQ2GNqEm5b1WR/Ttl9TZR3e8P7NA4Cpn4GeN/sm5gsgvOC3znHdA9D/+Aeo8BvJmp+U9L/4iZnHaHLJ6lVz6yhyNtyQe7OxZjXd7pFmEH41YL7ylc+IcbRA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0zUoAJeE3+6qnE+y8FzuZc7ykrl2IL9PBgyEkfxctoM=;
 b=TbiFuoi0KB11MeHXD5D3mAEfg5pu+upXfi9ztUBGkOW+kB8UwzjIUIxElwoIVBIbltUdmX/dDyONaiaP6v9wf9i168MEzStcYQcknKDLVVuTwJMovpE/CwjBaSp6IKs3mNNeQ+66LwMREuEG9XmNrchimXgKTt1qYHMCCxhff4A=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TYRPR01MB14144.jpnprd01.prod.outlook.com
 (2603:1096:405:221::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8272.13; Thu, 19 Dec
 2024 00:35:19 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%4]) with mapi id 15.20.8272.005; Thu, 19 Dec 2024
 00:35:19 +0000
Message-ID: <87o718cxx5.wl-kuninori.morimoto.gx@renesas.com>
In-Reply-To: <87r064cxym.wl-kuninori.morimoto.gx@renesas.com>
References: <87r064cxym.wl-kuninori.morimoto.gx@renesas.com>
To: Jaroslav Kysela <perex@perex.cz>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Takashi Iwai <tiwai@suse.com>, linux-sound@vger.kernel.org
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH v2 2/6] ASoC: audio-graph-card: use __free(device_node) for device node
Content-Type: text/plain; charset=US-ASCII
Date: Thu, 19 Dec 2024 00:35:18 +0000
X-ClientProxiedBy: TYCP286CA0359.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:405:7c::13) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TYRPR01MB14144:EE_
X-MS-Office365-Filtering-Correlation-Id: 57fa8661-1901-45a7-e3da-08dd1fc503c2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|376014|1800799024|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?nVhsJZDNm3fZfEUlh3IqMDyGj3XXkydARSHoIY8NMDf8mAwEwpHIYDfs3AJQ?=
 =?us-ascii?Q?zRxWSgfBIgsy954GgTMOEf7DUWyhq0G47E1bNkoCUFgVPHWWwhNgPc2/Stct?=
 =?us-ascii?Q?ciqXWwupuepSwoybQIuxBvh44M/6I866OazdRRuSOIFEwesms8cXAt/eUC+p?=
 =?us-ascii?Q?d4E2VcjeR5q2hI8NQxInY0mXM+NfdEaHmmMXxO4MfoNLYWJSYOrP7UrHx2P0?=
 =?us-ascii?Q?JUOYnk5i8TJ3qgLPB0QELMsSTzomxb2OMbi4oWR4IIm+4a8fkrDeXn35+uOi?=
 =?us-ascii?Q?6Tn87+5oWLk2NfDkDw/yDovrEyMC9ptdKVSARNHNGC1hkvsvpP4ddpwyJWxu?=
 =?us-ascii?Q?sOnZVkvgoyzvTHz1fcTIdtPnUlfFYRVnyaCIIEgKCkpji21S6cnzjdPXiu9e?=
 =?us-ascii?Q?W10/nOguKJjvAWO5IXDn12f+JFm+vkyVScc2ydW6q7v9WlgaliCFWWqK4WHz?=
 =?us-ascii?Q?gJIZsYCmqhyS/8KjNOix35B8AuhEF5sEsOW5BMvlaiPsYj4sgwkCdbVCvt3P?=
 =?us-ascii?Q?nOcsi+WTYJ3Bk9e+0kfg0F28VQ21Q32G089b1rv0l2C1R5g1JUHucsKA1tgN?=
 =?us-ascii?Q?9IBvP1DFXUvnZkzMEVcsD8ayqBfGJ5DU39Y/PyYwEMg3vxNpeRXe9mkBl+nd?=
 =?us-ascii?Q?TiTf1+bOvI8eyIvTbB6CZqNtK7sm5V19FxDWCb6gP+r/n5wI3i++zpfp/0Pq?=
 =?us-ascii?Q?B8eThUa6ApYsUiDlATA1V37g/7o45W68kz9zMhm8wGpyvZfSkmk0CA1gHMFz?=
 =?us-ascii?Q?OGfWy8gUi8qgGUKGAYnCN13y60lSDLFCjS6QYoP54TyU1ubNB7Q3Tfi+CN13?=
 =?us-ascii?Q?S1ScAdqHHaBKriL2WnUp6dgrnfa1d+3PmttdvFjDbr/xDVRqHB6aT+mf5B7j?=
 =?us-ascii?Q?Blke0qo7KHqPrkvvVUmcjcHeZaGNaWv7UT2W4Eqd4qRzgbSxE8Q/6HQSn9jg?=
 =?us-ascii?Q?Mm+rwtCSEaaLLTrB6muuYynOgY6ORr3ug8V/B+ty9ljxGtGatD373Pa5ZJ3T?=
 =?us-ascii?Q?Kdn7Gt4lgPBeHl2Q7SFa1HsvITsVFHYueiJzZWNr3IIETkCbN3aFKXsf87Sa?=
 =?us-ascii?Q?3NnvJsApP3JjUXliDT7Z+/9IkzgzLgqZYvKYoA3sQNPNDYW6Jrrptjf0PHYB?=
 =?us-ascii?Q?f5GBTrEjjVr5GHzbFNaFwu4uETwRcJIHV18EMmDzULz5i6TcREwqC2o4Xd8l?=
 =?us-ascii?Q?B88Hb4ibcyKGP6xIpYJCA2kJh864Pv3llGoXZV9mzjT3YalYUS63W7Q0+I0Z?=
 =?us-ascii?Q?TGfAhapS+aLDFdez1ToaJRNI1gE61SYq2y3iH2bB2Ltt87VxJ3x5iMmaCb0I?=
 =?us-ascii?Q?gnLdYyNcXJnEcoBUS0V7p19WccV3/GRAnfY8XPRb4CKUSC7S0PmnjOGEJP18?=
 =?us-ascii?Q?jhJKrEYh6t6G6w76jS+4oruLg5cSypzTjynEVbIGXYQpFLJ+vLBVNOfUYAnE?=
 =?us-ascii?Q?tDjaui61YvmKy7GavnLloE4g2xtK8cVZ?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(1800799024)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?HoUwaK9hgvsgxuzR0XocaSA71DQl2cuI7qNyn2GVwLkbRCiAaOkYAc6K0V78?=
 =?us-ascii?Q?YI5sZ5dlg7SVHLaDuVzgUzhqggFuxzeBBc7JlpsKLsh59x6zkJPwg02nRxhz?=
 =?us-ascii?Q?IdvxpDFp8BFicOax1SFSkz9ypVXJireOCYh7isCj4v5c5kVmyVLqmdI6XSrK?=
 =?us-ascii?Q?IxHGEkALaNOjT5fdu6j9GLenu3glNlNKY6jpC8gKd6PFcHhd6+pwol3NV/hd?=
 =?us-ascii?Q?zHlZ2+IgZrZlIReB0SdHv4iRwEDnGhBGS4/iryY2bHwN7U80eM3LsmlTvFnU?=
 =?us-ascii?Q?8M5rAVRlXEBFne8gBUAt3z7AMZnfJMkcoQa0EOm05a3nBDyLPW3V4051k7gv?=
 =?us-ascii?Q?DqpGXAyDFFVOSynHi8fhXG5og+AM7Gnl7X7hh0r+UPPWqjysEZw/GQe42Bql?=
 =?us-ascii?Q?Wruszok3S040kk01tpo8C2wfmNK2iaU5vvAZ++N4dHK1IcvCgz8Xl3OKbym6?=
 =?us-ascii?Q?7l3gNabfM5e0aS1VPSFsMl5L3ixbWFH3bbB+HORb7UllsatuPcZGR1Z9tJgt?=
 =?us-ascii?Q?gPgNxSJZ0csIDnA+m47VbXUoQTlAgMrUH2ZqRWEj8ZS6OgnGJaiqWxY67D0v?=
 =?us-ascii?Q?QsrCYBkD8IJB42PxSo0m+pNGw57EUeS/aHPTQGHTvU+dYjZTPDdi42mcW3Rk?=
 =?us-ascii?Q?aLf34X1rbUxj0xAPBLslJ4un9c/QMs9ImrMWrQUBODNNMVPnMQMaIHOOY8Ub?=
 =?us-ascii?Q?RRVL1sTp+R4rIQ2Bqma5+upj+CHPVn2ZEtFiz+Xmh9XIOdGVd+6H27/FJP7q?=
 =?us-ascii?Q?CA59HJs+ZH+pqPNZD29nL9VfwGw0Yqa1wPH0+pfFf+VPRzR7uSEge+eW63yK?=
 =?us-ascii?Q?QluVpWxrYcYXy9W43WqQvxrEQH8j4Pf/3e/s87/hYWC483oB2tG6eWgnkYSr?=
 =?us-ascii?Q?rI7DLsslYOhsBgqqWdlgq73kT2vE96kslK9U3UWoo7qJteyi8HEDvYqNO3MW?=
 =?us-ascii?Q?zGqHzvtXnRJG6m6EBn4x6sXlA9CA95DsP9NpNdPeR0mCUYd7jXOWOJRi4Sfl?=
 =?us-ascii?Q?agJlfOp7G2MqPn9JZEuCJSoAHcFTQwV8LKorZi54KNYiHRoIWRiKnK24SdCd?=
 =?us-ascii?Q?8EMDDzTePfJmdsONeOMZn0NOl21niOOEia8qIijL11jAqz41VePO4Mt/Y9DH?=
 =?us-ascii?Q?ip5bF1On77MtWzJASbnne9LFxY89heJTLDLgRfoolrvqjw0LizVQigWwkPR6?=
 =?us-ascii?Q?38AH8lIqicNG0U6QmRk4FIh4Boe1y1AxZS1SVePtvQ7JYdQw0jImu9hWr4Lw?=
 =?us-ascii?Q?tXxBNqK+Oe+MPvRtmH4DcOI+92DjldsADomnGEpNrVPPw4J1kDqIG2hQzCeT?=
 =?us-ascii?Q?6vhdNZhftbLvLC/ibSfv8iZ0dbv2owOgYhHgldbLySMbMbb/SM2in6X9Pp/e?=
 =?us-ascii?Q?owP1TC5eUVwyN7QOLMESW6k/1ON7v49N3xv+XmYmB1G1cFZu0fr2cDHw/3sw?=
 =?us-ascii?Q?sWzh5dJmE08XcfJSybjaJuIvCIRqENiKjEkhFpU8UNqeVHbID9Ng15fx+KLg?=
 =?us-ascii?Q?Qo+eRQnwn7dnDYd6PB6fvXeYoK9BxIzTPoOdoJylqkrkvUS6fQ8/dfBn9vlK?=
 =?us-ascii?Q?vD3x3He9rnKNOH99rLlY54GRRlqcGAWG9ldBcVma2VQSJBTdPKWQJ5nATxFF?=
 =?us-ascii?Q?saCr1Du4jW4Ckr3UGcof9sY=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 57fa8661-1901-45a7-e3da-08dd1fc503c2
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Dec 2024 00:35:18.9445
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: eH6EFKnRPkWhbxbcOOUL+yzPPTBtChr0KObGM8QLQ85mNGaAmeCWMVy9+1l/BSQ8xFV9d7xs5vyQa+fUOlZyC0hPHr/UBWHl/9hwzimEhknw1kzyZ+yjvsIbVFE8UUPZ
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYRPR01MB14144

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

