Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.74.47
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795737533;
	b=tuSVz9ahth8mvdXvybD64lWov1d4OUk8aN5iCapmdSu81CrtLrUvrXCoPMpcNtRdFDv+
	 8nFFpk/kKDFYFEh3wTYw+ByZUDGp+6i8B7elFJ148gK+CP31gPUJUNIXLSKT9M1RVMsvC
	 4IXb5d87XNqTtQvQKq8zd6o0hp5HvpK4AP7PQjQNRYN63XdNoYrn3OHfGJPetggZNmgKj
	 faVWUGNYrTmnyBHBBVSFaZM3yiQ4r04cJVOqUVBtSWz7GSP0oqDnylBbF3GMJ41S+7598
	 NFaD9vhYXcousSKt7NmQ/A/Km8dZvFY7DqXFChjKvzCHBuM20+QjeMtVY2IoycLWEBw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795737533;
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
	bh=zNqJqyso/RlIF26s0CsygNLkEH3N0ZNl3BjoPvSby3s=;
	b=QtiNgl1DXgvJaByItImOQK0sDSySnp9K9CR7mVDfGTDi3DI21xzBrqeeKUcCbUb+9xSg
	 rxLR8JM4S7uKpN5pW2c+TapTdriIYtg6cWGc5S5DoVXCUERGmGRD8cM6dth5mqcKPXpIf
	 bZWfxh4WJUzdrmVd1UJmlZWuNCIS7d82+dQ1uNHFj9yb5bn4PBkcrKuuNurcr6EqGHt5K
	 x9mtYwG99+Oym3Ty8sQBGxZec/qaXyiIMONBu6zb4vnqG+qxhxw+HOJfl5YUyLpFLNVW8
	 e82DmRqhh40XbUzf+S7LTskTYXvoMM0xV9EbQXFqUlpHFuJCdgWPl7fLXd+dErlqfCw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=renesas.com;
	spf=pass smtp.mailfrom=renesas.com;
	dkim=pass header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256 header.s=selector1 header.b=ih0pomuS;
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.74.47
Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11011047.outbound.protection.outlook.com [40.107.74.47])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0EC17606A323
	for <linux-sound@vger.kernel.org>; Thu, 26 Nov 2026 23:58:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0EC17606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256 header.s=selector1 header.b=ih0pomuS
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FUWDAyCBcsuejwDYFooSXL4GwykiXKnjLJx7BVspi+jiKpzBqZC4XuidC5fcl0R4wSSsgQ3R8pJVIJH+nASIpt3qiiaa63SHH6b24PRb8uxNZXKxtfepqrAqNntgDYigoyWqRqeguRXNTQYUh9A74eSZe27sq30+k9hFV2OpW9cbdDnlVcsuGy3+dgH187CN+YsbA4HlY2ugS60WOqFdd4GfMh+4SzIAavEY1s7aNo4ZhNLsSD8zHwdjX6mswF7QA9ildaIX4LtKROAp3JTgbgju45YhS7aWmsgXrr8r3/biy6Nu9pLFlGqh5uwx+INS7zIwmJyEENbnod+wg5KE2g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zNqJqyso/RlIF26s0CsygNLkEH3N0ZNl3BjoPvSby3s=;
 b=gAQxmO94UnYPny5FRIvWgIkDxGiyOuAi+NRI/0rMI51hrViLF8J28musHk9xNrymk/lye6XZPMg0/dR7fZbagvkFCd5LgdxZvO6Hg0JdC502n3niFlPpA76W98n4I3+nD1vFp9jZWaUoEE6U6JcPG5ok3Rw1si3DJxj2IXCaNuar/YlEQWZ+RjmG75Ooxvxw1TKQoryRspS5kJeAcMJoA9STpG10DGcKpF4LMLdVpKvlGzmNwNKuHXkQbd4O++sWNn3zoSpeL/N0gW+1Khi5cFJhiI+9oE+GmtlqQJIcN6ZpMKaT6Xvgujpuol2NX2jJ3YTBdZm2hu7FDZpZWU4I5w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zNqJqyso/RlIF26s0CsygNLkEH3N0ZNl3BjoPvSby3s=;
 b=ih0pomuSAUy/RSmjsVIbEYqpVcnkxJtEarg+gEkO/AMTKp+5S00mvkQLUJ+d2kOmPW6CqG434cq+3jrgLPhQ6gLD5KuD4AFxBYT5qnwqYat+02MFOXtFADwBdgBwEBZrtEE8I5ECUia57EilV1jyxYHL+5r6nnb9Yz1pBePFVnE=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from OSOPR01MB749128.jpnprd01.prod.outlook.com
 (2603:1096:604:4ba::14) by TYCPR01MB9643.jpnprd01.prod.outlook.com
 (2603:1096:400:197::5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.662.9; Thu, 26 Nov
 2026 23:58:51 +0000
Received: from OSOPR01MB749128.jpnprd01.prod.outlook.com
 ([fe80::6a3b:d29c:c743:5180]) by OSOPR01MB749128.jpnprd01.prod.outlook.com
 ([fe80::6a3b:d29c:c743:5180%3]) with mapi id 15.21.0662.004; Thu, 26 Nov 2026
 23:58:51 +0000
Message-ID: <87fqwnqh51.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 11/11] ASoC: soc-dapm: rename darty to dapm_darty_list
User-Agent: Wanderlust/2.15.9 Emacs/30.2 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org, Alvin =?ISO-8859-2?Q?=A9ipraga?=
 <alvin.sipraga@analog.com>
In-Reply-To: <87v75jqh7j.wl-kuninori.morimoto.gx@renesas.com>
References: <87v75jqh7j.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Thu, 26 Nov 2026 23:58:50 +0000
X-ClientProxiedBy: TYCP286CA0349.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:405:7c::18) To OSOPR01MB749128.jpnprd01.prod.outlook.com
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
X-MS-TrafficTypeDiagnostic: OSOPR01MB749128:EE_|TYCPR01MB9643:EE_
X-MS-Office365-Filtering-Correlation-Id: 8038ee51-8019-4173-0d5d-08df4c19380c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|52116014|366016|1800799024|23010399003|6133799003|261009223027099003|18002099003|22082099003|56012099006|11063799006|261028144727099003|261102123227099003|261102130727099003|261026140227099003|261026121527099003|261021121427099003|261022105027099003|10067099003|261022075727099003|261021123027099003|38350700014;
X-Microsoft-Antispam-Message-Info:
	97kTxhT8YwlibIMl7BvI4hDfaJ3KBaxyrtDRSPV3SwD0YDEyo3XWIpaT1dj5JvRxesA3CEpZfM5msDKvqrV3/aTSMnAN8Gjsi3sB/LExwQ86rVmwYmCWKsBkOzi6nbNtkAXAU0TYbSMyEPRjJdaGj2o3dDHL6qYhenK6Mgc3Kv3/lJ3VYwLMcrBDnTNzAlIvvEibzRYQey1gGLw/ewZPsJj8N9n+r/i76L7UbeBnguBAcAivJXBfFs01U8OVdu0gK9+xCl5FIi1SuMbQbp+3NWUL9+4mwhPXnZOs/SpKoPbfBplkzhmyF5L2b7rFqMcGCIDBBj56Ry/frJ4QRap5IwvSChjdnuE5OV1DZO8F+rXZvLAFrZv6c2oYo+otlfvJjxTvwbdsgXmvHRmLxzU3R8IKR27vq9F7gUv9Q0ZV+9sNXoyNse1tcd/CDi9KEMvBvyj7+I1i1ISNgTaTY+V/NOWojAG+94dy1FoZXrSufocg7NAtcu6xm9qSFhy7SavpT9JBT2Scl7PnPkrs4aWlgJ75wpEb5tWhDJJG8VMIrRZTfv7ZkgrKkupSdkdPttFCX1F8LWSgTRaheY6OCJXLlSdHQUAmV1dS8uYi0Hh2K1C6zkTFjGe+pKqglWIhCHn3BpXh3BjR0w1WbPgDzL9fuU0R8DA9LT2/9RlyPpbRvg0m2jYeLOkJ+QprP/Y6WuMDY5VOgS4ISr/cJIt4WFEUIf+Xw6Mfva1ND3hxQd5ogOk=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OSOPR01MB749128.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(366016)(1800799024)(23010399003)(6133799003)(261009223027099003)(18002099003)(22082099003)(56012099006)(11063799006)(261028144727099003)(261102123227099003)(261102130727099003)(261026140227099003)(261026121527099003)(261021121427099003)(261022105027099003)(10067099003)(261022075727099003)(261021123027099003)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?jj5QsA1ut+7mtzu38rphJMQ1LSNAy8HvdP5i0tNaiV14zXky5qbEld3YbTJY?=
 =?us-ascii?Q?AgIVAfeMGU/keN4P3yMRrdtzCyCiev1bVytrUSbvufjCb5m80/kQK7GF4dok?=
 =?us-ascii?Q?2PijcjHsHQRiGQtljSkbNOoNo7lRUda3/SLyqMKxnmJqMtwNWzI74eEotox4?=
 =?us-ascii?Q?fIFYlwNs9ie9rDeSMMxmuKQpyhVB/cyJigbZl/eFEs7rDzbdLrn/DThjyrkq?=
 =?us-ascii?Q?DicrFKU0+QnVi84R4aDVmEYIHt+S2INQn1NKpNy1n6JuTGHdHv/wChJCoThC?=
 =?us-ascii?Q?hv/TnVHx2wGyTLX8dy/z32nfTUWSWLPrxprEYMiK/43aA4mSyJNsutMyqMOD?=
 =?us-ascii?Q?Mu+lth6UcEoo6+KgUetexaph8DRSO0hUmAlBBH9GQ44+5B3PonHDQki6rAT8?=
 =?us-ascii?Q?38/kdi74QNZuzaBGXj6WfSV18fAgj0Io6GemNL/GO6Ur+oEevcMsriFr62eE?=
 =?us-ascii?Q?UpB2/26yhx8/eBSjC05kduZEpuSVSDCzOMQA76TWS1nw2PquMbAXZy6DxCi5?=
 =?us-ascii?Q?hpWNIj4bB6SZlnBGLtl0lZwx0/q6ALH2/hpv/Z59bt3BuAQukStN/dAYUYj6?=
 =?us-ascii?Q?o77eQ7zF6PFskRbOOdm7PPvicli+3CtFnaxILvlqrtVTNdVp5gPgleg4/ie0?=
 =?us-ascii?Q?U3yeniaD7znwQo13x4jKBazVOVjPH2Ofw9xpE4WDYQ7h2stJ+9t6Hw0McY9A?=
 =?us-ascii?Q?x4AsSXO0GCykRLCsVh81pS6lfO2UK/lMH5rTJJB6eI3tcXXob1dmMrkhjDOI?=
 =?us-ascii?Q?wn6bmMQUcoH10eKrkxJo2X2pxOCDSkbgLUOONA7tiM3zXNIsov0Oe1Wi+AGC?=
 =?us-ascii?Q?0cmjLm/yAx1NeNhdJbbjFPCV1Nl+P6a4WoiTs042zs1vTsdvfnq7WbfgddSg?=
 =?us-ascii?Q?LG39Y0MtoAPveyowcSysCCBhCyLjkRCPcp42KfEgRaQUiyCRgCQTHuwDM3Nt?=
 =?us-ascii?Q?TMovNsSUEvvQmHWngiScgi16w7Jia3Uuenb2hPDB3Kk0pJKjiMTOIgZvvFKN?=
 =?us-ascii?Q?bmBTvkoH5qnDM0gB4XQXKA9OnPvj3NmuFvMDMgx9KwHtzoU4nXpww0KGrb+O?=
 =?us-ascii?Q?Rfzq4ugFoU8zKz36QXrMeLJFT0JRG0U/CsxMV1NKPKIc37CuKM4ioaIVm0Va?=
 =?us-ascii?Q?FEckBa55Phu7t5nFNUnevj050SRqOcqHP3MFaFQHNOHCG/tYj8nhzNqYcir/?=
 =?us-ascii?Q?9BhnE62cJO3PbV+tqpZiGfDZeEozIPJLlpx71On0/YUXpD4fqhXTny6L+bz2?=
 =?us-ascii?Q?/Vt0V/Ac4rEm/i+ZKshpbsLAPukUpu97m4ZNpzTvEwqM2kG1zljL+RYomjaK?=
 =?us-ascii?Q?01eJukaTvx70Tr/hHzRcybPhr/hlvsl4iq3Q35CnFKkACroP+5SpgLt11acO?=
 =?us-ascii?Q?4nMJ0mY2hFVPSBVBsdqnWGl2KfsBMLBYik3PIQc3zSirVjB+b/R3DDGUG7RO?=
 =?us-ascii?Q?UaZhbRiWchAIYxQAI9Xgrd2cR0teBb4ed2VWwDsrh03sKNHQDzfchjNjRL8I?=
 =?us-ascii?Q?eA6eRFjrKqtQhYz+wAH9xkPB9Y58OzTwAcLES5C/dGQMAZsZ3TsDn1So4Isx?=
 =?us-ascii?Q?J4SOSGQ1H72xWzIRRM03a9siUQmFnfH6g9UmHfZ6gI/D0UL6dObG/h2cv9cq?=
 =?us-ascii?Q?PKtB32C7wszmJnoyyuvvMNeUr7NrXnqfNmEyiaIA1KNK4ssQptHvSvkDqpKi?=
 =?us-ascii?Q?0GFb/6kUckHmLH19ibyzXi8kzeHopQjF3nY124XU85vBZa+1ykfFZy8mIni5?=
 =?us-ascii?Q?hWavk5wTPdki8PB5WUhZ/eny+eEk9Zq6rWWlByGpYzQcaZl92Ptt?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8038ee51-8019-4173-0d5d-08df4c19380c
X-MS-Exchange-CrossTenant-AuthSource: OSOPR01MB749128.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Nov 2026 23:58:50.9199
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3cDay6OpO2EXnUpJKWKBgCXS8oeIv3OxcaRbMaImuJ0NsvaznFxmpYAR5tO9lRmx8oVdL3UKeppwARq7ZMpBxb0gGCu4ppW4EWGVzNo95RI0lJdlCrnnBg0AXm6dVVFh
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB9643

Current DAPM widget is using "dapm" to connecting to "dapm_darty".

It is unclear and confusable naming. Let's rename it as
"dapm_darty_list" and "dapm_darty_list_head".

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 include/sound/soc-dapm.h |  2 +-
 include/sound/soc.h      |  2 +-
 sound/soc/soc-core.c     |  2 +-
 sound/soc/soc-dapm.c     | 12 ++++++------
 4 files changed, 9 insertions(+), 9 deletions(-)

diff --git a/include/sound/soc-dapm.h b/include/sound/soc-dapm.h
index 1f5bb3a92fe08..9d7bf37798169 100644
--- a/include/sound/soc-dapm.h
+++ b/include/sound/soc-dapm.h
@@ -562,7 +562,7 @@ struct snd_soc_dapm_widget {
 	/* used during DAPM updates */
 	struct list_head work_list;
 	struct list_head power_list;
-	struct list_head dirty;
+	struct list_head dapm_dirty_list;
 	int endpoints[2];
 
 	struct clk *clk;
diff --git a/include/sound/soc.h b/include/sound/soc.h
index c886d2edf46c2..155a077bd27fa 100644
--- a/include/sound/soc.h
+++ b/include/sound/soc.h
@@ -1042,9 +1042,9 @@ struct snd_soc_card {
 	struct list_head widget_list_head;
 	struct list_head path_list_head;
 	struct list_head dapm_list_head;
+	struct list_head dapm_dirty_list_head;
 
 	struct list_head unbind_list;
-	struct list_head dapm_dirty;
 
 	/* Generic DAPM context for the card */
 	struct snd_soc_dapm_context *dapm;
diff --git a/sound/soc/soc-core.c b/sound/soc/soc-core.c
index 0064fc3a17851..e2a3e63ade1c1 100644
--- a/sound/soc/soc-core.c
+++ b/sound/soc/soc-core.c
@@ -1279,11 +1279,11 @@ int snd_soc_register_card(struct snd_soc_card *card)
 	INIT_LIST_HEAD(&card->widget_list_head);
 	INIT_LIST_HEAD(&card->path_list_head);
 	INIT_LIST_HEAD(&card->dapm_list_head);
+	INIT_LIST_HEAD(&card->dapm_dirty_list_head);
 	INIT_LIST_HEAD(&card->aux_list_head);
 	INIT_LIST_HEAD(&card->component_list_head);
 	INIT_LIST_HEAD(&card->unbind_list);
 	INIT_LIST_HEAD(&card->rtd_list_head);
-	INIT_LIST_HEAD(&card->dapm_dirty);
 
 	card->instantiated = 0;
 	mutex_init(&card->mutex);
diff --git a/sound/soc/soc-dapm.c b/sound/soc/soc-dapm.c
index 5d6b095030560..2f8cd4355e1db 100644
--- a/sound/soc/soc-dapm.c
+++ b/sound/soc/soc-dapm.c
@@ -219,7 +219,7 @@ EXPORT_SYMBOL_GPL(snd_soc_dapm_to_component);
 
 static bool dapm_dirty_widget(struct snd_soc_dapm_widget *w)
 {
-	return !list_empty(&w->dirty);
+	return !list_empty(&w->dapm_dirty_list);
 }
 
 static void dapm_mark_dirty(struct snd_soc_dapm_widget *w, const char *reason)
@@ -231,7 +231,7 @@ static void dapm_mark_dirty(struct snd_soc_dapm_widget *w, const char *reason)
 	if (!dapm_dirty_widget(w)) {
 		dev_vdbg(dev, "Marking %s dirty due to %s\n",
 			 w->name, reason);
-		list_add_tail(&w->dirty, &w->dapm->card->dapm_dirty);
+		list_add_tail(&w->dapm_dirty_list, &w->dapm->card->dapm_dirty_list_head);
 	}
 }
 
@@ -2292,7 +2292,7 @@ static int dapm_power_widgets(struct snd_soc_card *card, int event,
 	 * that new widgets may be added to the dirty list while we
 	 * iterate.
 	 */
-	list_for_each_entry(w, &card->dapm_dirty, dirty) {
+	list_for_each_entry(w, &card->dapm_dirty_list_head, dapm_dirty_list) {
 		dapm_power_one_widget(w, &up_list, &down_list);
 	}
 
@@ -2303,7 +2303,7 @@ static int dapm_power_widgets(struct snd_soc_card *card, int event,
 			/* These widgets always need to be powered */
 			break;
 		default:
-			list_del_init(&w->dirty);
+			list_del_init(&w->dapm_dirty_list);
 			break;
 		}
 
@@ -2877,7 +2877,7 @@ void snd_soc_dapm_free_widget(struct snd_soc_dapm_widget *w)
 		return;
 
 	list_del(&w->widget_list);
-	list_del(&w->dirty);
+	list_del(&w->dapm_dirty_list);
 	/*
 	 * remove source and sink paths associated to this widget.
 	 * While removing the path, remove reference to it from both
@@ -3907,7 +3907,7 @@ snd_soc_dapm_new_control_unlocked(struct snd_soc_dapm_context *dapm,
 
 	w->dapm = dapm;
 	INIT_LIST_HEAD(&w->widget_list);
-	INIT_LIST_HEAD(&w->dirty);
+	INIT_LIST_HEAD(&w->dapm_dirty_list);
 	/* see for_each_card_widgets */
 	list_add_tail(&w->widget_list, &dapm->card->widget_list_head);
 
-- 
2.53.0

