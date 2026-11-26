Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.228.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795737508;
	b=aH7teLDe84pY8cwL7H5/hPrMAoWi21LJwtD+9S3yxeuFNo3Popka0JkVw5U4hVlENjL9
	 RHoZVwP5jd7dK8Cns6IbJhxaZVPP48tuI/6E76hkWl+2szBC6SpIoOQ8xh2qve8HFIUeK
	 Vx6/qPwYfhgZPAPAIwLPcsif0cYlMeOwxs7j2tbgP5hQbBKfDrN7B3KjlY4ETIA021GAN
	 mdVSsqkfQmAMIXAZCf0VSmCdlT8HzmEdZ9T4lrERqAm9cR8DBX234qSaKShTL4UoUhAXi
	 zdcHMqYhb5/x0ZUZz6AM/C+rdf0jbSJeAnjraSPFXvEU3BQi5jbBR7PO6xa5Hxe9muw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795737508;
	h=DMARC-Filter:DKIM-Signature:Received:Received:Message-ID:From:
	 Subject:User-Agent:To:Cc:In-Reply-To:References:Content-Type:Date:
	 X-ClientProxiedBy:MIME-Version:X-MS-PublicTrafficType:
	 X-MS-TrafficTypeDiagnostic:X-MS-Office365-Filtering-Correlation-Id:
	 X-MS-Exchange-SenderADCheck:X-MS-Exchange-AntiSpam-Relay:
	 X-Microsoft-Antispam:X-Microsoft-Antispam-Message-Info:
	 X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-CrossTenant-Id:X-MS-Exchange-CrossTenant-MailboxType:
	 X-MS-Exchange-CrossTenant-UserPrincipalName:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=OtYYYSi0JhzTqJObdFmTrPJ9GYp5nm+vkKx2dm4sSOM=;
	b=iZiKOUa6hFBBobZ/8UrQgTe+olRjU78fvSydAi3deXeZTZIrPFXhs7tJlm4YRIfUz/qq
	 G2DTOIsGxJfFeiuFpsTuMk7QSCwRzJ7wo4Z0oLbPbX5gbnzgbM5hjNqFpb/uHBXHig8j+
	 PxruNEYubUGrPcq210nai1E+m/RhqFkqqQHB6hRNPokziLAfWz8ptfg+vibP4vDma0a69
	 omi2N72y2iT3HhdTT/DWN4Y71wuwFMLeu/pjZPWvE1VyeTAEmKgqFUb3H+m57QXdT3Eqr
	 pUA3fTj2LcTMoQ7FpybzYBwtJ+Sh+XCrnFDqLmESJmW60b4b2qx3GE61EjE8Tfy1eGw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=renesas.com;
	spf=pass smtp.mailfrom=renesas.com;
	dkim=pass header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256 header.s=selector1 header.b=byQSWuHQ;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.228.18
Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11010018.outbound.protection.outlook.com [52.101.228.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C61F606A31C
	for <linux-sound@vger.kernel.org>; Thu, 26 Nov 2026 23:58:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1C61F606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256 header.s=selector1 header.b=byQSWuHQ
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rULIrX8DwZDoovMX6tHydcBMM93cI5lrxbvnL4X6KotbZWrtupKawsGyzP8SpdXC6pVLap3q4Mr2PdKw+PLGdkA7z9+AOAf5ik7AzpHTv9Kti3jxFotSVvz5nrDMWnS++19PsKUU4Ro9a72Al+taACYvFVZCovYGFVVzBlDrtGJ4oib9TAaJTTbsiUB6Twk5LG+suMRoYeDjdbrxmjuVgANliN032CjnC1N5lYsGAvy1P0FJdSW0G2WqtLm5o1RQSoHvcfEdoL0eX4iRsVPN7Y8WMeWUhUu8Nsehlp5rtVieS/4XayONevsd9pOcgfFjr8A3boTPZ/VFvJq2ZD5MFg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OtYYYSi0JhzTqJObdFmTrPJ9GYp5nm+vkKx2dm4sSOM=;
 b=HcpG/C+SmM5aizzOA2hTT4eYwMH/H7PO41+487BmwdgQUvek6KmyzrjLpu+85+Vj4yE2hV1yNiROl6+849+edH2L6UJ2mMLjgUMRx4iqabZz4uMid9M7jdahiVMNPjSKC2zveydhKyiin+CMHsSYhtKQnVJh8d0rqTFVAQhVaOP2xsuWd4MsFNMVkZhNfakpyWIHt6qZkD7q5nJdhVxIvAjiIpwRJ3coHaWvOLXW13gcjIEQTVVQxppnNmVAVZ0zYOztu/sL3Bm/mjdeMFFxBpF1vJTvQtpw7AAu3RJECAYUKBQPD8DxVpC5H/xaVEVoqW8x7B8u3nyGVbF5AHvtTQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OtYYYSi0JhzTqJObdFmTrPJ9GYp5nm+vkKx2dm4sSOM=;
 b=byQSWuHQMqZT69dh6MXJ1xGadmVURnrwzN4vSPxESzTQIMIOinF9SrUUhz11tljL2gZIjguDDRmyzMHsXUmo5+XLL8ixzGyRHzU7DC0boCHrNMT1WvIbU8Kw7MN1Pw8V7MqQzLG8zgAkad3ZVlWIf9IIqHXH1J6yH7aTB7f2sbU=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from OSOPR01MB749128.jpnprd01.prod.outlook.com
 (2603:1096:604:4ba::14) by TY7PR01MB17984.jpnprd01.prod.outlook.com
 (2603:1096:405:3a0::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.662.9; Thu, 26 Nov
 2026 23:58:26 +0000
Received: from OSOPR01MB749128.jpnprd01.prod.outlook.com
 ([fe80::6a3b:d29c:c743:5180]) by OSOPR01MB749128.jpnprd01.prod.outlook.com
 ([fe80::6a3b:d29c:c743:5180%3]) with mapi id 15.21.0662.004; Thu, 26 Nov 2026
 23:58:26 +0000
Message-ID: <87ld6fqh5q.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 07/11] ASoC: soc-dapm: rename list to dobj_list
User-Agent: Wanderlust/2.15.9 Emacs/30.2 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org, Alvin =?ISO-8859-2?Q?=A9ipraga?=
 <alvin.sipraga@analog.com>
In-Reply-To: <87v75jqh7j.wl-kuninori.morimoto.gx@renesas.com>
References: <87v75jqh7j.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Thu, 26 Nov 2026 23:58:26 +0000
X-ClientProxiedBy: TYCP286CA0109.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:29c::6) To OSOPR01MB749128.jpnprd01.prod.outlook.com
 (2603:1096:604:4ba::14)
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Post: <mailto:linux-sound@vger.kernel.org>
List-Help: <mailto:linux-sound+help@vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-sound+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OSOPR01MB749128:EE_|TY7PR01MB17984:EE_
X-MS-Office365-Filtering-Correlation-Id: bec1d43b-8308-46ac-889e-08df4c19296d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|23010399003|1800799024|376014|52116014|38350700014|10067099003|56012099006|261028144727099003|261026121527099003|261026140227099003|261022105027099003|261021121427099003|261022075727099003|261021123027099003|261102123227099003|261102130727099003|261009223027099003|11063799006|22082099003|18002099003|6133799003;
X-Microsoft-Antispam-Message-Info:
	T/y9cuHA650Q4zQWsIBo9au+DJ9Ype+Kpy9UAT8qDBSUZQ2SD4qf0KPrteW904b/79ozeYKq+wCBhzVneScJO277y+99O51I76VbaR3ia2frLgu9cJMaVnSMbGqQcTPIGzilvBcyyemL8Hj299iYP64PeRf2qdkqIslXMPEJzW7eKUCjUpV32RTgP8qR9v2DwXzVvbrytZYRrsQoQHrPX2YdTM1ttRjjML3o5Wpd8Fwg6EbNZVpmP05JVeCNbALSXbnaVXVLwYZWjDlyaC4v9GJwQZmUpbbVgVtN/0u0FFPpeGtynjVv8PIuzQcCa7mYA92DdWEPYXkg9JIDq1f31pIrxgcO/NyCgkH/AXPO+elgD6yI8M0JNZz6QUpCe80gGTtTYrz85MgFBJCB5Rx/3alfbyvgq/oZnIyZGnibMR47yNL5xlCsJNiaGLVPprUF4cI8Rfus8m1evOErn/zFiT+nRiFOfajl+kO/gajX7yoRMTj8pLmuB3VzG9r1w8OqGkzmN0DUs7WHQ+2UosYfvIQN7Ah9cPZM4vmPzM2E2amLJQHfg6T46f7GFlhQidDqQYm5VtozTNeMGIFPnuZRRw930ACI1xpNMjXv6Z0E5JrcUwx41lvEhWxkYV0AfRPzEUPeHWu99hlmsVpRWEjy2gC1V+1M40vNAOsSsceMAYFTYIl8oV0u7Wkoay3gPWAZgLqDLytFMa3bs5YE77khod/EuPth2XUDGWCozoB/3qQ=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OSOPR01MB749128.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(23010399003)(1800799024)(376014)(52116014)(38350700014)(10067099003)(56012099006)(261028144727099003)(261026121527099003)(261026140227099003)(261022105027099003)(261021121427099003)(261022075727099003)(261021123027099003)(261102123227099003)(261102130727099003)(261009223027099003)(11063799006)(22082099003)(18002099003)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?Zaou3P6Rb/vM9bMVfkgbIONiyKs6C46UawMfd5YwPAlV36CpL5yMDYO4240K?=
 =?us-ascii?Q?MhbpI4Qp7zMYNUF7wCSnean4ZTgSfpa4Qko8uISzMQhz20vEt1YGc45Pq7mk?=
 =?us-ascii?Q?Q21L1/TaDvnlZCOeDRN1wvuguUL40CLIfFY2XlCpRz9jnv+yCJ/TXOIXcz2e?=
 =?us-ascii?Q?LUa0lde92j5s1eobhz+PUs1EWZC5E6nD8Vi+sPyZddh4bv9eQqAJePvOR0ft?=
 =?us-ascii?Q?smcMQEwP46NtTys3lzbKH7v0ztspNF7qfYeB1o7eSeBYZCLGNo345NCnmSV6?=
 =?us-ascii?Q?IzlDgZpoBkceO2/dM+/cn+uTGX6qV1SCdoTdA5wxIWN3vATXC89tb7qa8QBh?=
 =?us-ascii?Q?4eXr1V67k6T1/bio0mNp2q98mZNx/eEBfO7i14W8N3tgT+n072E6OWDyhYlC?=
 =?us-ascii?Q?pcFdaG7U9lHaZ2ydW2T01OevX+wKSTJTdfopZ+39wLhP+bOOtHCy3y3+NOvE?=
 =?us-ascii?Q?Pn+1U+8E8lV3yNYDVWqmnT1YcfPnvoNJPyWY3174KsLFA1qCkiJCkW5n3XMl?=
 =?us-ascii?Q?T9hCEPcFQ1xYdQsWcKILDa90nC7G4qGerPNz9WlCW71t7INZkT8qtHf8Dp40?=
 =?us-ascii?Q?MLPsUU5UVhrWPWPQmtNaFkeBBcVb7pvOR87sKZ4uISuvPtJZiKrG8xdeDz8U?=
 =?us-ascii?Q?t5oqUGsjnbxbTl99RNYhgCqPETqVN2Qhj0CLFPXeIoB4En01J5E5KlRvbLBX?=
 =?us-ascii?Q?DmsUQVVUqjccTAUic50qIaHRHMkcUTbas+RRdju9zZS2/osWCC3HVWKfynxm?=
 =?us-ascii?Q?pLE3TDHsvEdXJtw2Wzac2m4zTK4V1J6tann38UdKqabbylBB4UqAheOYuelD?=
 =?us-ascii?Q?J26y/FeJezUqpzANDJPZzGHDPmaIUtC6zrmddLUL/YO9GH/VDvQN2JWapNel?=
 =?us-ascii?Q?psgRgir1ZNBR5XFae2CmHJlkZhdNuY7Wj/Xaon/L83TQQmE3NTmADzYZtiAf?=
 =?us-ascii?Q?omXtFOi0IdlK9grtOdFpJhqJ935xtGUbT+7D6U6ZsHi4zJ6afWibzSGbSy73?=
 =?us-ascii?Q?VLLjuKZqGHEU927lbktsD4Bi7qq9oN57D1bTVPzITsl0EeIMmr5uZy9531ZH?=
 =?us-ascii?Q?hupPt1vrVPRiJGY1A6XrRvk0ix5M2COVTP0XquMcKfzKe50T9Ll19Dg8EqtP?=
 =?us-ascii?Q?KKi1KNG+UlEcFjfWZ/EJpLMJOZSx5C/mdKWpXXmzkGhZoUzt97nAeRy+dmSv?=
 =?us-ascii?Q?xj2AKV4r+7cEqLJz0nph/Z+xfgjyJbFU+Mwy2cxvfJ9FVqKEUF38kv+r48Cv?=
 =?us-ascii?Q?9cEdcrD1jutbk1w+Nqq8Ucy9b4GrZClhlC86eSSvC++R7c8lBzr5W76ZKSax?=
 =?us-ascii?Q?am/HDk0uRfetvJxjZ4oelhQ0/055ahxmcUw9n+tQLUmdFwxpy/uQkc1wl727?=
 =?us-ascii?Q?Pg4+JMmV0zgqXgko0gOn9EHPWCLEhGyoEB2yHpkGKP5OKGFX7J8JIslzlIMC?=
 =?us-ascii?Q?ZBlE9zXMS1slYGiwnNfJBWTtMUxSa0guh+pv5Jx6ABDVKiqamsF794qsm1LS?=
 =?us-ascii?Q?Tp2lsLSvWcTHY5uu3Tm7AO2DU/1JT50dcOHHnO7OREZe9NNxZ3X4yEjOD22J?=
 =?us-ascii?Q?6tJP5e7cJBvO3Vhvic+3YTdnQq35GIexnyPIIQN2EZgr3aCtE2QJnvves+sH?=
 =?us-ascii?Q?qTiYRwGgXoICx3mikNiRdJATYytwk0gXNpWcbDk4W6rJPQohI4He+Ib7GNiZ?=
 =?us-ascii?Q?pzjPc5fCoDVLu/tm5vk/q7urXEYwmKzbGVGQq/N3cNoq7SwRclq/j6VO8xSp?=
 =?us-ascii?Q?QdQmpBpYp5TjBx3pdyeLH1FlUvP0210=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bec1d43b-8308-46ac-889e-08df4c19296d
X-MS-Exchange-CrossTenant-AuthSource: OSOPR01MB749128.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Nov 2026 23:58:26.3500
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gCsNomSPUyWRMMTqfzXGXhX8dNkQKY8QY7jSIM2SIukIrT0ewqqEu3mkgtXJ4YOlURSmcRdADuUhFasVtZvlo7aL58ufqO/RT9bnnggDZ5lvVkqB+LR3NHkgWWS9yiS7
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY7PR01MB17984

Current DAPM is using "list" to connecting to "donj_list".

It is unclear and confusable naming. Let's rename it as
"dobj_list" and "dobj_list_head".

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 include/sound/soc-component.h |  5 ++---
 include/sound/soc-topology.h  |  2 +-
 sound/soc/soc-component.c     |  2 +-
 sound/soc/soc-topology.c      | 42 +++++++++++++++++------------------
 4 files changed, 25 insertions(+), 26 deletions(-)

diff --git a/include/sound/soc-component.h b/include/sound/soc-component.h
index 875c532034652..cba4657b0882c 100644
--- a/include/sound/soc-component.h
+++ b/include/sound/soc-component.h
@@ -221,6 +221,8 @@ struct snd_soc_component {
 	struct list_head component_total_list;
 	struct list_head component_list;
 	struct list_head aux_list;		/* for auxiliary bound components */
+
+	struct list_head dobj_list_head;	/* attached dynamic objects */
 	struct list_head dai_list_head;
 	int num_dai;
 
@@ -232,9 +234,6 @@ struct snd_soc_component {
 
 	struct mutex io_mutex;
 
-	/* attached dynamic objects */
-	struct list_head dobj_list;
-
 	/*
 	 * DO NOT use any of the fields below in drivers, they are temporary and
 	 * are going to be removed again soon. If you use them in driver code
diff --git a/include/sound/soc-topology.h b/include/sound/soc-topology.h
index cf5c9bd1037e2..c46cc2ac68d43 100644
--- a/include/sound/soc-topology.h
+++ b/include/sound/soc-topology.h
@@ -62,7 +62,7 @@ struct snd_soc_dobj_widget {
 struct snd_soc_dobj {
 	enum snd_soc_dobj_type type;
 	unsigned int index;	/* objects can belong in different groups */
-	struct list_head list;
+	struct list_head dobj_list;
 	int (*unload)(struct snd_soc_component *comp, struct snd_soc_dobj *dobj);
 	union {
 		struct snd_soc_dobj_control control;
diff --git a/sound/soc/soc-component.c b/sound/soc/soc-component.c
index 10f9b61fef656..5dce8af9e7553 100644
--- a/sound/soc/soc-component.c
+++ b/sound/soc/soc-component.c
@@ -1783,7 +1783,7 @@ struct snd_soc_component *snd_soc_component_new(struct device *dev, const char *
 	component->driver = driver;
 
 	INIT_LIST_HEAD(&component->dai_list_head);
-	INIT_LIST_HEAD(&component->dobj_list);
+	INIT_LIST_HEAD(&component->dobj_list_head);
 	INIT_LIST_HEAD(&component->component_list);
 	INIT_LIST_HEAD(&component->aux_list);
 	INIT_LIST_HEAD(&component->component_total_list);
diff --git a/sound/soc/soc-topology.c b/sound/soc/soc-topology.c
index 7e53e84292205..8440438bea80a 100644
--- a/sound/soc/soc-topology.c
+++ b/sound/soc/soc-topology.c
@@ -358,7 +358,7 @@ static void soc_tplg_remove_kcontrol(struct snd_soc_component *comp, struct snd_
 		dobj->unload(comp, dobj);
 
 	snd_ctl_remove(card, dobj->control.kcontrol);
-	list_del(&dobj->list);
+	list_del(&dobj->dobj_list);
 }
 
 /* remove a route */
@@ -371,7 +371,7 @@ static void soc_tplg_remove_route(struct snd_soc_component *comp,
 	if (dobj->unload)
 		dobj->unload(comp, dobj);
 
-	list_del(&dobj->list);
+	list_del(&dobj->dobj_list);
 }
 
 /* remove a widget and it's kcontrols - routes must be removed first */
@@ -393,7 +393,7 @@ static void soc_tplg_remove_widget(struct snd_soc_component *comp,
 		for (i = 0; i < w->num_kcontrols; i++)
 			snd_ctl_remove(card, w->kcontrols[i]);
 
-	list_del(&dobj->list);
+	list_del(&dobj->dobj_list);
 
 	/* widget w is freed by soc-dapm.c */
 }
@@ -416,7 +416,7 @@ static void soc_tplg_remove_dai(struct snd_soc_component *comp,
 		if (dai->driver == dai_drv)
 			snd_soc_unregister_dai(dai);
 
-	list_del(&dobj->list);
+	list_del(&dobj->dobj_list);
 }
 
 /* remove link configurations */
@@ -432,7 +432,7 @@ static void soc_tplg_remove_link(struct snd_soc_component *comp,
 	if (dobj->unload)
 		dobj->unload(comp, dobj);
 
-	list_del(&dobj->list);
+	list_del(&dobj->dobj_list);
 
 	/* Ignored links do not need to be removed, they are not added */
 	if (!link->ignore)
@@ -456,7 +456,7 @@ static void remove_backend_link(struct snd_soc_component *comp,
 	 * We however need to reset the dobj type to its initial values
 	 */
 	dobj->type = SND_SOC_DOBJ_NONE;
-	list_del(&dobj->list);
+	list_del(&dobj->dobj_list);
 }
 
 /* bind a kcontrol to it's IO handlers */
@@ -890,7 +890,7 @@ static int soc_tplg_dbytes_create(struct soc_tplg *tplg, size_t size)
 	/* register dynamic object */
 	sbe = (struct soc_bytes_ext *)kc.private_value;
 
-	INIT_LIST_HEAD(&sbe->dobj.list);
+	INIT_LIST_HEAD(&sbe->dobj.dobj_list);
 	sbe->dobj.type = SND_SOC_DOBJ_BYTES;
 	sbe->dobj.index = tplg->index;
 	if (tplg->ops)
@@ -901,7 +901,7 @@ static int soc_tplg_dbytes_create(struct soc_tplg *tplg, size_t size)
 	if (ret < 0)
 		return ret;
 
-	list_add(&sbe->dobj.list, &tplg->comp->dobj_list);
+	list_add(&sbe->dobj.dobj_list, &tplg->comp->dobj_list_head);
 
 	return ret;
 }
@@ -924,7 +924,7 @@ static int soc_tplg_dmixer_create(struct soc_tplg *tplg, size_t size)
 	/* register dynamic object */
 	sm = (struct soc_mixer_control *)kc.private_value;
 
-	INIT_LIST_HEAD(&sm->dobj.list);
+	INIT_LIST_HEAD(&sm->dobj.dobj_list);
 	sm->dobj.type = SND_SOC_DOBJ_MIXER;
 	sm->dobj.index = tplg->index;
 	if (tplg->ops)
@@ -935,7 +935,7 @@ static int soc_tplg_dmixer_create(struct soc_tplg *tplg, size_t size)
 	if (ret < 0)
 		return ret;
 
-	list_add(&sm->dobj.list, &tplg->comp->dobj_list);
+	list_add(&sm->dobj.dobj_list, &tplg->comp->dobj_list_head);
 
 	return ret;
 }
@@ -958,7 +958,7 @@ static int soc_tplg_denum_create(struct soc_tplg *tplg, size_t size)
 	/* register dynamic object */
 	se = (struct soc_enum *)kc.private_value;
 
-	INIT_LIST_HEAD(&se->dobj.list);
+	INIT_LIST_HEAD(&se->dobj.dobj_list);
 	se->dobj.type = SND_SOC_DOBJ_ENUM;
 	se->dobj.index = tplg->index;
 	if (tplg->ops)
@@ -969,7 +969,7 @@ static int soc_tplg_denum_create(struct soc_tplg *tplg, size_t size)
 	if (ret < 0)
 		return ret;
 
-	list_add(&se->dobj.list, &tplg->comp->dobj_list);
+	list_add(&se->dobj.dobj_list, &tplg->comp->dobj_list_head);
 
 	return ret;
 }
@@ -1077,12 +1077,12 @@ static int soc_tplg_dapm_graph_elems_load(struct soc_tplg *tplg,
 			}
 		}
 
-		/* add route dobj to dobj_list */
+		/* add route dobj to dobj_list_head */
 		route->dobj.type = SND_SOC_DOBJ_GRAPH;
 		if (tplg->ops)
 			route->dobj.unload = tplg->ops->dapm_route_unload;
 		route->dobj.index = tplg->index;
-		list_add(&route->dobj.list, &tplg->comp->dobj_list);
+		list_add(&route->dobj.dobj_list, &tplg->comp->dobj_list_head);
 
 		ret = soc_tplg_add_route(tplg, route);
 		if (ret < 0) {
@@ -1238,7 +1238,7 @@ static int soc_tplg_dapm_widget_create(struct soc_tplg *tplg,
 	if (tplg->ops)
 		widget->dobj.unload = tplg->ops->widget_unload;
 	widget->dobj.index = tplg->index;
-	list_add(&widget->dobj.list, &tplg->comp->dobj_list);
+	list_add(&widget->dobj.dobj_list, &tplg->comp->dobj_list_head);
 
 	ret = soc_tplg_widget_ready(tplg, widget, w);
 	if (ret < 0)
@@ -1438,7 +1438,7 @@ static int soc_tplg_dai_create(struct soc_tplg *tplg,
 	dai_drv->dobj.type = SND_SOC_DOBJ_PCM;
 	if (tplg->ops)
 		dai_drv->dobj.unload = tplg->ops->dai_unload;
-	list_add(&dai_drv->dobj.list, &tplg->comp->dobj_list);
+	list_add(&dai_drv->dobj.dobj_list, &tplg->comp->dobj_list_head);
 
 	/* register the DAI to the component */
 	dai = snd_soc_register_dai(tplg->comp, dai_drv, false);
@@ -1569,7 +1569,7 @@ static int soc_tplg_fe_link_create(struct soc_tplg *tplg,
 		goto err;
 	}
 
-	list_add(&link->dobj.list, &tplg->comp->dobj_list);
+	list_add(&link->dobj.dobj_list, &tplg->comp->dobj_list_head);
 
 	return 0;
 err:
@@ -1804,7 +1804,7 @@ static int soc_tplg_link_config(struct soc_tplg *tplg,
 	link->dobj.type = SND_SOC_DOBJ_BACKEND_LINK;
 	if (tplg->ops)
 		link->dobj.unload = tplg->ops->link_unload;
-	list_add(&link->dobj.list, &tplg->comp->dobj_list);
+	list_add(&link->dobj.dobj_list, &tplg->comp->dobj_list_head);
 
 	return 0;
 }
@@ -2205,8 +2205,8 @@ int snd_soc_tplg_component_remove(struct snd_soc_component *comp)
 	for (pass = SOC_TPLG_PASS_END; pass >= SOC_TPLG_PASS_START; pass--) {
 
 		/* remove mixer controls */
-		list_for_each_entry_safe(dobj, next_dobj, &comp->dobj_list,
-			list) {
+		list_for_each_entry_safe(dobj, next_dobj, &comp->dobj_list_head,
+			dobj_list) {
 
 			switch (dobj->type) {
 			case SND_SOC_DOBJ_BYTES:
@@ -2242,7 +2242,7 @@ int snd_soc_tplg_component_remove(struct snd_soc_component *comp)
 	}
 
 	/* let caller know if FW can be freed when no objects are left */
-	return !list_empty(&comp->dobj_list);
+	return !list_empty(&comp->dobj_list_head);
 }
 EXPORT_SYMBOL_GPL(snd_soc_tplg_component_remove);
 
-- 
2.53.0

