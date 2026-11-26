Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.228.0
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795737484;
	b=zkNzFJj4QxHF3pLJmEkWl+1BT/I72YelHqZKd0cWiC6cBdAuUEN4QKVH0mjIdwX7wfz2
	 j/7G3t7O64AkYSh8WSM9Fugj6Jb4FG1P4ggeHwkOvYL3bcfzxirSkCIPvrDYS++BfXZ7W
	 P1T9y8BfJztFtqbZg9VkUh71Wc57PjZSJzXIe7rIFtKLfMOiBYJc8M5bV+T6jMnYGkxkx
	 yJ+0gy91Ruv8IcH6/qfgGDn0DJtia4XjrAuu7xuh/MyslyrQym/eAqf3dHyY60Nk9AoG7
	 X3MYCrO5FDvtSZIij4cPpfvU+34sXBXO66uUC2dmEjJ8o0KzrXxIgv9coC1q18LrTHg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795737484;
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
	bh=Qv0HMiK6A0o1yL/V0ag+M9Y9HFSOupEmGQAyLQxce90=;
	b=sboeeofJnjS7TXyaPMmuZb7WZIi91U2zat+UN2RlAS96VQOdC44TvUNpGXH9mx96scks
	 yyNeVdpGQhjSV2MHZ8yeXCP1V02MSwnKRFCMoF7pudY/GGRjnCWm3aO3mNsILu45FH7l3
	 oYaq12+w5wmJqjQ73cTFEtNvGxnjCvTp3FvGbWeWi9yDqoWlF2KXC9/Opep+m/qV0o1rb
	 chNwVCvn65fDY4KVUNZdI1CL3wizmSyfs1Bnjk4Ra3s7/ntPmJsRU/3/bvyajKxvEmqqd
	 rIfPymYcf1gDzwiNVgJiEA8L81TOQj5N2H15DBjVyxoz09HzWTHwDy1y7x7Z6R6ZSmA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=renesas.com;
	spf=pass smtp.mailfrom=renesas.com;
	dkim=pass header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256 header.s=selector1 header.b=KJFYPSis;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.228.0
Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11010000.outbound.protection.outlook.com [52.101.228.0])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03BF1606A31C
	for <linux-sound@vger.kernel.org>; Thu, 26 Nov 2026 23:58:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 03BF1606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256 header.s=selector1 header.b=KJFYPSis
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gnYlrDxB0srXDaSp1Pa6ZiZMh3Oce5sloJ2aEw/fI3sL3U0v0qh2aKU0ohkOgcTOxL89f+9Pc73UgGlwy452KP5EL8te96dWkwdiQmANlJ+UourJrK6FshvyuTpTr/LIYeDC3Tbms3agxOraFmwMePQ0BYdYBzfwmIa05G1Jf8fYzmLG28xzUeSrwGpMvD20opd1ZvH1Cuj2pwKgyMq627OP6/LRv3ZNP/N2odGjGoADO4Z7c3Z2HRm0ltKP88JttutT55CQC0T/PPZK3alW3qaKQvxJ8Okx/qo7pCfPPU95UNxesWuxUJPQ4xL8S5EVVXjoAXiSxL+zJUTzpLt2YQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Qv0HMiK6A0o1yL/V0ag+M9Y9HFSOupEmGQAyLQxce90=;
 b=sI0TxRkxqjaa8h3C6gRFdHzzBicbnVyD549AtGlWi7eoH1tI4N86JaEBy+Xae/kX8q9vGFJaPmxdAfY/74+TQmXf2EwpjkZ3sRObsaE3zdRxeCv15K7Ya+ILiqClGx9pMYIEajVWOFdKC9p6dxVJL68p/3BM9M5idmjGJN29XQfx3nxjS8q6v9ouT6a4UCXqLx+46QX8n8Nwvph6geLNIOrU0UMdlkHhe1mFHqBcT5DI1Wyb5jDpmOLdYMt2lWvtB5D1ssd1trEnMni4i5TEBp7NcTAgFJs78rdn3vyYOYoK0mqWpPm/VPsjA/hi1SegAGDnEovxWKSKm70sVfao/A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Qv0HMiK6A0o1yL/V0ag+M9Y9HFSOupEmGQAyLQxce90=;
 b=KJFYPSisq4FveTrG+SbQRf9m01iyqjsCvn7ZG+U/IE9rk1nCzbFMa4j+7ku03bz/T2pwTL0+MW9xgi6Dc8xBU0biyFv1tf60OMoYDKszrIslowajOY7alezBPeYv/hfvtbCtlJDms1YvObPlX7FTCIsCBU5prDUw15A3hwqLOIc=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from OSOPR01MB749128.jpnprd01.prod.outlook.com
 (2603:1096:604:4ba::14) by TY7PR01MB17984.jpnprd01.prod.outlook.com
 (2603:1096:405:3a0::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.662.9; Thu, 26 Nov
 2026 23:58:01 +0000
Received: from OSOPR01MB749128.jpnprd01.prod.outlook.com
 ([fe80::6a3b:d29c:c743:5180]) by OSOPR01MB749128.jpnprd01.prod.outlook.com
 ([fe80::6a3b:d29c:c743:5180%3]) with mapi id 15.21.0662.004; Thu, 26 Nov 2026
 23:58:01 +0000
Message-ID: <87qzg7qh6e.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 03/11] ASoC: soc-component: rename list to component_total_list
User-Agent: Wanderlust/2.15.9 Emacs/30.2 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org, Alvin =?ISO-8859-2?Q?=A9ipraga?=
 <alvin.sipraga@analog.com>
In-Reply-To: <87v75jqh7j.wl-kuninori.morimoto.gx@renesas.com>
References: <87v75jqh7j.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Thu, 26 Nov 2026 23:58:01 +0000
X-ClientProxiedBy: TY4PR01CA0004.jpnprd01.prod.outlook.com
 (2603:1096:405:26e::16) To OSOPR01MB749128.jpnprd01.prod.outlook.com
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
X-MS-Office365-Filtering-Correlation-Id: d9110719-23e4-44cd-10b3-08df4c191ac2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|23010399003|1800799024|376014|52116014|38350700014|10067099003|56012099006|261028144727099003|261026121527099003|261026140227099003|261022105027099003|261021121427099003|261021123027099003|261102123227099003|261009223027099003|11063799006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	LcznZFr3/9zb+ewruvbWA44eR+QAB+vADGLsjQxApsDZDZbg/TNeSrOwFipXlR+peQrXlIzpUnstDqOHEKjUVJ83FmtIcjaOEH4mgfoj84YKca9zWavCiVwVD4E5xCU7EDw2MZhTHdJt9PlnOAWC0J4SSYJUoB5CysLCJhvGdPnOohdGsEjxUw8yqPGZxxVBan3IeWDYGQkTMgaQERve8drqSg5RfoBc9ceinf9djwJjOfO69SQGs2PL0hjSP0t6hAQauQ+t2QCV60o/QOvX+s85535FeM+OI9Ps9H9eRQDdQhbkgyTPV+DKyN+Ns5MV4eEB2JYLZEXPyLKA60dBJFPqV3SXQ/ttzLdOx1a3SNFAEcbSeRp96cKhQCx3QqKsqm0N9qYPwBLgnBUg4+mVskGxSB+SW7YFuNB8HYQglySBtuZX7faFlciSjrqoSk+JKMqiE1tZ6xCzi/kdqvHnopXwIn7fnekG6jbcaUpvUUBuzqqUlccfEGQsp4Ka4SBbLqGbZdbNIZ5H2ZfZvY/C/IBYPNRAWyDOnCDrHLcCVv3aAXY09nHDbfT0q+VNItvvVBJMY4RbVALU8itvcB8p+DpJF/WQKHQamOL2AmYK+p4xzV7MEXPEdqpYwV/dV6GRebH7PntRVOCJkM48VQeszPuU0pIzdr4s3RiLcXMEJdw/xYNIDUPqnWvpVfKijUg4itF7ZKaaV/4yDlsmE5jHJ/0w8bpIEOsanIZhjJ69jf0=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OSOPR01MB749128.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(23010399003)(1800799024)(376014)(52116014)(38350700014)(10067099003)(56012099006)(261028144727099003)(261026121527099003)(261026140227099003)(261022105027099003)(261021121427099003)(261021123027099003)(261102123227099003)(261009223027099003)(11063799006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?u2sxmB1TSpyGeVOTcsDoEazdLvj9f0V0PQXbJP4LTSZsh+kWYjDeSfdXjkOX?=
 =?us-ascii?Q?JQaApc2YeeZJTNn++WV5OwbOnDPdwnbZsOdLgYku2Vmroz+lfuQwRsURG10f?=
 =?us-ascii?Q?a8O++p2Mc4lrBBwN/QWi8RE04vMyHKXYPZcMwosoB8naQwt4XEPWvyhGUl8i?=
 =?us-ascii?Q?hdSGaD88U9duXdw1wYg1O7dlRXraptJoNFL+/u4TPpaObhVLBm5VfpADbj/E?=
 =?us-ascii?Q?n6GURx0EjNBGOLck1td9T+2qWuDf4ZKxMLFhcMDxXYopoBJcgBvew47L20ok?=
 =?us-ascii?Q?3fuaKJNWWbE8LrgIR9FCVn5aCvFvc1OIeSuzwNCjBBc2+u323UzrsO1LUpnd?=
 =?us-ascii?Q?KNbyoP1YECy0eFM5SGg/KsPyWgIoBegYsLtEgdgOsrBUoo14NZYvhKp3eLM4?=
 =?us-ascii?Q?+CsbFMj9nQ405WC6Bx3DfqESrdbvCdTVddYDfVxLyTzd61YSPJyqi2mZ95D+?=
 =?us-ascii?Q?/8m3eY4fWA7oLnAESYquQ7ls/PPtZgEdTTbloiJKBYS03qwcqFSv+EqOmIob?=
 =?us-ascii?Q?Id2zeXgpg4D98RTUiIAvL60UEFoVCV8tJl6OBBMVc9LXEqokzAlKJJgMXuGZ?=
 =?us-ascii?Q?mG+chN+ult/q1FQWynTtDdMYDD6qmOS8Q4CmLUK93KSF2BwqzDbjNXUwQrtw?=
 =?us-ascii?Q?kvQiV2YpP51TDHA+faLDe4ISYCcewlbAo9js155aKDBZcMHbRxBsPaQIwsX1?=
 =?us-ascii?Q?u6PogALRyl2IUkTDP760hprFHK5pTQAm12GfoS67OyT6jUZMHwuVfU/ODZXP?=
 =?us-ascii?Q?5CETFtfO+yckJcgz84CVkaYvq2+Bg8LUcMLSdkrdbuyOrhA5vxq0PoFbzsbR?=
 =?us-ascii?Q?6jeXgG9tQUSrqgnBgvTkFQkg38K7sJCmOQhWwyXDfErEwMn65bGCHTzrUM/E?=
 =?us-ascii?Q?WJj27vPuzf2xQpyw1/ooJQ73T+vVWp2GKEXNmc/es3SgUF6i9K9ujRPXWHR3?=
 =?us-ascii?Q?pt3Q9ftwwyB7rpO2oZ5y/AYcj/HAG6p/xG/426fM77myaCGD8Ly/3WG45MOu?=
 =?us-ascii?Q?KXtzf3mqLAwnwu8NweqRio7H6lBm0QNSnnggzqyHmGdbc4jNV3y7uDB4ZQgG?=
 =?us-ascii?Q?HgEoTC8X4HdhBk0zDzLHfLcfNJW37nDaEb2lHJbEAc0RDkvXBRpNX/18rC/6?=
 =?us-ascii?Q?mjzfHeObkPjaGnj1vkoZ6jTNzh4SU+YNkQJwQSpNt1sEcLeW35gGA39Q3lKw?=
 =?us-ascii?Q?I/M0vSCB/LjfqTI+BQvDiB/Dkn+uRtQhDdLcrJDaX39P3E+7LH4/sEmeRVXK?=
 =?us-ascii?Q?8Cdn7xKMmBirqgyet54GoB3iVDgADwEfHxYzKrgQf29J1s1CdnYFc6UEx+Ye?=
 =?us-ascii?Q?rB3X//vb/7WUvDJ5klV214G9XX5qx0ioD8rUbwctX8Snj0O4uhN1XW2ezlAf?=
 =?us-ascii?Q?JmAGqArwVufwotUMP3AtGhyJAzEnI5bMLhv7HBDxbW3yQq7k8bgzCluwdapL?=
 =?us-ascii?Q?6cWs7IgDfxIzEFPSZectoR3UZcKGcX/9+3yAwmYLY+GSrdJqoqK6bw4Btx1b?=
 =?us-ascii?Q?wCvgydRMYccCp1ZWp1rVTmHksZMpfJpbO/9z7BfyJnn+vo/68CHvrtRiCD2e?=
 =?us-ascii?Q?BvS9uOVYUmuyWsUVPljNaayhC0ZlU8gaO9H3CIaE1hW2ywALRsTS3y4oltz7?=
 =?us-ascii?Q?xYamYGfPVB4kLTQVDNrXq+q8eV5o261KCWUweMpZhbFePzZKO2046Jrx8oES?=
 =?us-ascii?Q?2t4uRIKiRosrOHTkL2iurEtipI2r8yjqOubQdoa6A8EmY3oMTS5SdaTQcZfd?=
 =?us-ascii?Q?2TyU0f05TkokWw1VTEW0ikirzLLvU80=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d9110719-23e4-44cd-10b3-08df4c191ac2
X-MS-Exchange-CrossTenant-AuthSource: OSOPR01MB749128.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Nov 2026 23:58:01.7707
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4kZXwvbTsI+I6t5IiPKkjvuFn6dl/Gdyg+KntSxnPZm1AKKjmW9AeH1pS6qfeMcvn9wEfwA+T2MBTXjqD6qKRyJuRk+bCofBGp5JunCbIYf66L6k2jTT7qDYThVeCHKE
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY7PR01MB17984

Current Component is using "list" to connecting to "component_list".

It is unclear and confusable naming. Let's rename it as
"component_total_list" and "component_total_list_head".

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 include/sound/soc-component.h |  2 +-
 sound/soc/soc-component.c     | 12 ++++++------
 sound/soc/soc-internal.h      |  4 ++--
 3 files changed, 9 insertions(+), 9 deletions(-)

diff --git a/include/sound/soc-component.h b/include/sound/soc-component.h
index 72513e62f7511..cb7f5d6c6017e 100644
--- a/include/sound/soc-component.h
+++ b/include/sound/soc-component.h
@@ -218,7 +218,7 @@ struct snd_soc_component {
 
 	unsigned int suspended:1; /* is in suspend PM state */
 
-	struct list_head list;
+	struct list_head component_total_list;
 	struct list_head aux_list;		/* for auxiliary bound components */
 	struct list_head card_list;
 	struct list_head dai_list_head;
diff --git a/sound/soc/soc-component.c b/sound/soc/soc-component.c
index eedf8a6d312ba..06e14f368ceb3 100644
--- a/sound/soc/soc-component.c
+++ b/sound/soc/soc-component.c
@@ -31,10 +31,10 @@ static inline int _soc_component_ret_reg_rw(struct snd_soc_component *component,
 			   func, component->name, reg);
 }
 
-static LIST_HEAD(component_list);
-struct list_head *snd_soc_component_get_list_head(void)
+static LIST_HEAD(component_total_list_head);
+struct list_head *snd_soc_component_total_list_head(void)
 {
-	return &component_list;
+	return &component_total_list_head;
 }
 
 const char *snd_soc_component_name(struct snd_soc_component *component)
@@ -1786,7 +1786,7 @@ struct snd_soc_component *snd_soc_component_new(struct device *dev, const char *
 	INIT_LIST_HEAD(&component->dobj_list);
 	INIT_LIST_HEAD(&component->card_list);
 	INIT_LIST_HEAD(&component->aux_list);
-	INIT_LIST_HEAD(&component->list);
+	INIT_LIST_HEAD(&component->component_total_list);
 	mutex_init(&component->io_mutex);
 
 	return component;
@@ -1802,7 +1802,7 @@ static void snd_soc_component_unregister_unlocked(struct snd_soc_component *comp
 	if (card)
 		snd_soc_card_unbind(card, true);
 
-	list_del(&component->list);
+	list_del(&component->component_total_list);
 }
 
 void snd_soc_component_unregister(struct snd_soc_component *component)
@@ -1842,7 +1842,7 @@ int snd_soc_component_register(struct snd_soc_component *component,
 	}
 
 	/* see for_each_component */
-	list_add(&component->list, snd_soc_component_get_list_head());
+	list_add(&component->component_total_list, snd_soc_component_total_list_head());
 
 	snd_soc_card_rebind();
 
diff --git a/sound/soc/soc-internal.h b/sound/soc/soc-internal.h
index e713d13543b2d..b6226af38f6d9 100644
--- a/sound/soc/soc-internal.h
+++ b/sound/soc/soc-internal.h
@@ -68,13 +68,13 @@ bool snd_soc_component_matches_dlc(struct snd_soc_component *component,
 				   const struct snd_soc_dai_link_component *dlc);
 void snd_soc_component_remove(struct snd_soc_component *component, int probed);
 int snd_soc_component_probe(struct snd_soc_component *component, struct snd_soc_card *card);
-struct list_head *snd_soc_component_get_list_head(void);
+struct list_head *snd_soc_component_total_list_head(void);
 void snd_soc_component_connect_dai(struct snd_soc_component *component, struct snd_soc_dai *dai);
 void snd_soc_component_active_update(struct snd_soc_component *component, int action);
 void snd_soc_component_device_link_del(struct snd_soc_component *component);
 int snd_soc_component_device_link_add(struct snd_soc_component *component);
 
 #define for_each_component(component)					\
-	list_for_each_entry(component, snd_soc_component_get_list_head(), list)
+	list_for_each_entry(component, snd_soc_component_total_list_head(), component_total_list)
 
 #endif /* __SOC_INTERNAL_H */
-- 
2.53.0

