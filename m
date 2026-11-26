Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.228.39
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795737497;
	b=1WkjqWLtg4Mq02EuS72ELqfZ/DXweAz0LfR1/2lzoGZcgWVUgJ3jGavo40cR7pZOXri6
	 qMGtTS8EbMxJ/9IF6uuIsUGBHfzAEmM3ch1Pf2P43DdS6bs6upCC4UqSZ9hgdOGc9DrP4
	 RGc0Ykkvas08R+xdqepWfZ1nixrgYqOi7YD9wa3ueLXaxgy+rcoOAh1fych9hszFh8Cfn
	 ZlNztvAF/9R14qMDTnA9EMH9uvt5EtPpkL28C33N1ccmTDeX4TUtZMGJWtmnMq3LGTUJN
	 xxi/tPpSjTNZZdwCf8VU7IGGRHhj8z9OQBzYDIeqCOVfah/wb5+yQsKOLGI7DclO3AA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795737497;
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
	bh=WlMB7ZqVDfiPOVaBQAY1owkf0xIX1ITVxj5Qd6jZFsQ=;
	b=fA4QuC0c/Hdcvuloyb7/uMc1IokQtbQy2FhEd47NEhvlLapiYNlof24DJNKJbU7R7v5B
	 aLGKF2ZGv/NMR2+OCeWT5XrYebAXf2WIQG54NThYq2bFEcfbAHEc94E5zDUaa8cswrXRB
	 sE6vlXUP1zeG6M8bf8A996Sg06mTkX/bUMs9FXlXrIZulClBAZGvK38Nhgcg6BzkE5/4C
	 FeyoAkCiiVl66GSAFWBtwaMk1AjBAmbt16l0sAZVGAuePivy+ulZXdkiicH7cx+yDXsDa
	 ZNofqFGwlYpuaoVP47rs4agsFcCdnV5XzfCF4CmyHU6MkKSXFCEPsFTOb2uos/3D54w==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=renesas.com;
	spf=pass smtp.mailfrom=renesas.com;
	dkim=pass header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256 header.s=selector1 header.b=eIc1ECSF;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.228.39
Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11010039.outbound.protection.outlook.com [52.101.228.39])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBFAB606A31C
	for <linux-sound@vger.kernel.org>; Thu, 26 Nov 2026 23:58:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EBFAB606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256 header.s=selector1 header.b=eIc1ECSF
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=F9XTghQWpzd2i9pw6bUdS80olrm1YDEv0HQC9X6K+YD4Cyvgd24fwO5CqqOV7m0sdGEFtK83HHfRhdOX45n4i+FOF1fPEsFsM9FSim2DYWQ4m0v/hgFmtABpVEIp7zQT25/lCiRh5cSc/jyIzC+wwBlcWTjOMeCOBmBBY/nMG1LMFwmdAdFuRURzar/8ba1rKBN8B13N6+6dNVIkjeQQknn+0UwNvx78GusNPSgSf5+rCnjtlkIPFVCUiLB9Fb7GnTO5PmR11pXufo9L0Zkafbv+yvT2ahDiZKTONY2OdH0Ezo0AfSOPaYlE40sBGMER23xqGBz0PSF0iAnJ27VCAg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WlMB7ZqVDfiPOVaBQAY1owkf0xIX1ITVxj5Qd6jZFsQ=;
 b=Nj4A3nBx9OKj3bng7qeFbRJDPlX+Hev3aBbVaVkTHS6HNciE6sMkEN8jLSybbrnsVH25Qr2dLIeFiC88mJhp4THB4SHOCaXyMYdMVDbaAwOrkT0JPnXQbV4T+02f9rIk61S29qLr8i+pKaZNX4jHuGOkygpP7GFqBruiNifBTwKk2dAY/z7eETYJ1Ft55gJh33A0JvORpGb7q0mmAfU0XZuvjJxBEpQbyHVWGz4LhwhOzj3sfkZQwxlzEYP9X4pRJg/yJr00QMVQ0K+nHGR41zhge0dVojn6e2Bqg7RMP6Ks5hBUx8auITcxgCDFKF1X36fu/umjYO2qDX4gPOo7/w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WlMB7ZqVDfiPOVaBQAY1owkf0xIX1ITVxj5Qd6jZFsQ=;
 b=eIc1ECSFXyQno/1yxz7TYQWvvk1kuNazVvbrAazlCV3ibm5Znoia6NuoNy9WjJUBz4ebDhcE9RfWCr3VPAmEToacII8OIaX34EmmIQ6maeEmsLxPysMu3iFO2rWyQUKOst/lhGQnxQsm2O7uG6OSKCluGN/MF47ZS8rcOnY4t6Q=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from OSOPR01MB749128.jpnprd01.prod.outlook.com
 (2603:1096:604:4ba::14) by TY7PR01MB17984.jpnprd01.prod.outlook.com
 (2603:1096:405:3a0::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.662.9; Thu, 26 Nov
 2026 23:58:14 +0000
Received: from OSOPR01MB749128.jpnprd01.prod.outlook.com
 ([fe80::6a3b:d29c:c743:5180]) by OSOPR01MB749128.jpnprd01.prod.outlook.com
 ([fe80::6a3b:d29c:c743:5180%3]) with mapi id 15.21.0662.004; Thu, 26 Nov 2026
 23:58:14 +0000
Message-ID: <87o6bbqh61.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 05/11] ASoC: soc-core: rename list to rtd_list
User-Agent: Wanderlust/2.15.9 Emacs/30.2 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org, Alvin =?ISO-8859-2?Q?=A9ipraga?=
 <alvin.sipraga@analog.com>
In-Reply-To: <87v75jqh7j.wl-kuninori.morimoto.gx@renesas.com>
References: <87v75jqh7j.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Thu, 26 Nov 2026 23:58:14 +0000
X-ClientProxiedBy: TYCP286CA0008.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:26c::15) To OSOPR01MB749128.jpnprd01.prod.outlook.com
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
X-MS-Office365-Filtering-Correlation-Id: 968958b9-b608-465c-659e-08df4c192295
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|23010399003|1800799024|376014|52116014|38350700014|10067099003|56012099006|261028144727099003|261026121527099003|261026140227099003|261022105027099003|261021135927099003|261021121427099003|261022075727099003|261021123027099003|261102123227099003|261009223027099003|11063799006|22082099003|18002099003|6133799003;
X-Microsoft-Antispam-Message-Info:
	xoyedocmLiqBqTFEUjcFD/Vx+GdtwnAmBEUB36AFqKm+lj/RCCLMSWPN/X97CZexfZmblL2aGfOOykb757nw85tYw0LGWaOUeA1N4rap5FFO7LNviLTkYT0/Sp9URJggy8xWmLw3elXA0F7k1dyp80BDK7Rv8y//hMMeRrtvb9mCNH+6o5RuD4PILnwvcPS8Q6OSDaHF/C1sMIxMoT+IwXhYluBDbbatDUih2YA5hnZNGSbezj5BcxhITgTGVg+x/Sl7ybqDv3JA5cx795iDF2OK6lTEBls9Ut4fjuA2Me1tA+d8/P+nuqhTDILnnx4Jy3tu9s75309zO20jtH5G45SJdKaz0bHCuI6Bx/PvaWP2u8cldwy7ugT55xVzKz6UO2Dn3qi6NMRkfPxw15cee1Pbr+5YHtszngAmdUA6grClcUTk7oqcia66lQNIj/vIMH83QFWv7H+C8CmluKG6mwYhFfqZZrAwui+B/INK5zDxcyDEzYT6v5ntC0E8BbIlWWRZeMhmQtdDZIYtkJ9jq2gZtOdm8+u8diNVcPBXmhqK9W9mvUVIZI47Puk0D5IMZD94Ewnx1lTItSZ3jNYJfttjCHIdzkX/y/XqUyZBYCSIU6lIVXCtYudipP/AHngph/quCCS+18TiazFjuVHCGajWgld9d7g/thYLff92fwIjFLOhOf6LYfNFWTW5p6qR8g/w2J9AVYj4eWEu6ToqlDTU22RLMcZAXqyvnK/YhxI=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OSOPR01MB749128.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(23010399003)(1800799024)(376014)(52116014)(38350700014)(10067099003)(56012099006)(261028144727099003)(261026121527099003)(261026140227099003)(261022105027099003)(261021135927099003)(261021121427099003)(261022075727099003)(261021123027099003)(261102123227099003)(261009223027099003)(11063799006)(22082099003)(18002099003)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?cZmrtfDCdWmKAHfWtujFSq3arxmkbBrK6arcJeEkKNZzz+JiJkJp4tFhJX7V?=
 =?us-ascii?Q?TMRA21w7bowhgP3yDGAf4Q2OEtqULdq+4IaWBq7p6BvjJuD2hrwC1BHYW77V?=
 =?us-ascii?Q?mIdPrx016iJkzJPYJU+jCet5mULwI4N6NMRt0S+J4dNUrB09kpnJMqZEhm5E?=
 =?us-ascii?Q?f7mZkjTorf1+ZI/0O3cxs/5c+NooDdvNToDYaSWjXqcx2Z/1qdUthnMPbjVc?=
 =?us-ascii?Q?W9geKtXRw0h4K4WmhM1HDzSJa3tXr0cteW+VGPo5yBMN2LN6eeREnvNQbvh3?=
 =?us-ascii?Q?PUIaUiloXx/Z2SJTffLqnF098dv9s9GIxeDf+3G5WKPqZG/URCcrXT9BO84L?=
 =?us-ascii?Q?4K8iQqjG2w+TT5naYNkKQgYhn9MIObic9zBbbuZNteQH9HUwVxXvrJVs5JHE?=
 =?us-ascii?Q?DcOvPfC2dklk7g/9nd7PKkCkdZaaNUhFSJbOTJXCbSEhRk2RcSj1k4LXDOHq?=
 =?us-ascii?Q?tVLD5tG9flQdB0ISx+XVh8cloEuZOdzyHdWYVpiItNLw0xlNKEczGeBPntTA?=
 =?us-ascii?Q?eyKmj2IdGpxJ/o+BEhwiIhFnQomPw6cQc3y1TpDYfieuOeRz2OZ32zcdsg5b?=
 =?us-ascii?Q?mth1uDKv9pJK20G7h1tDcSjUvF/GpkPF5P5yfw8cVh131W29DeHRQ9x4fF+s?=
 =?us-ascii?Q?lt5byYQAaNj1u8bl9eZnxzsLxlETTrndIeb7HC5Jbr+LZCjTc6nCNP5qcRdO?=
 =?us-ascii?Q?cMKCOGo2lCIM7m+t07VdT6MsgahVz/3UTK3H5BF/5zOgYuKyayghI5hDEcoX?=
 =?us-ascii?Q?nq4mOHIhzraW9HOlA6E7ytnUH4jJBeh0fze7k0JUYnxaJd2EEgwZ/Wg6VEL9?=
 =?us-ascii?Q?H7sU5EQVpOQ6URUPA24dPf1nplagpY1XO8a0zBptWX7rc0e/Du+OMpeBDREr?=
 =?us-ascii?Q?CFXj7F8WOK8ShZ8fxMdPiKwXyMsB5J39VgXkkH7e4NSsrmar/F4lR9EAbaeL?=
 =?us-ascii?Q?cd9hjGdlzEs0gP5dp1TTg1adnBefcPEF0hKrJ4TpY23VFMaWxt8lfc7pwqR1?=
 =?us-ascii?Q?nOfTL2jwmgcG5K+cdUW+8ua5WEOdJMHEpgKdlALoc2GY/jLgq/qeGd5t9HCE?=
 =?us-ascii?Q?Zqvpab3tah/1rK7TXFKjOdkVFY72a/DmpPhOWae0+D1AcqY5BpBi6XrholYM?=
 =?us-ascii?Q?1aATaDVbZx04hE8nHbQoDur+sqlW9LdKTnzE5xetJipmj4h4JxLqU09HF+c4?=
 =?us-ascii?Q?Ttlz0Npznn98WrA6v3bjWRWgHcKKK37TeH4RH0o1mUcOSzGn+0olJQKAAe+r?=
 =?us-ascii?Q?ENo5K3T8jKsKI5DEv92cAdb0rFcqhDl8r/7xn7OOs8schGlxeSLasMQ9OmQ9?=
 =?us-ascii?Q?eyDfg9626nshqjee/QMgAW7j5ufLuJWMSRQ6ykEy5vx5FyBUDwjRfSR/0s68?=
 =?us-ascii?Q?+MqkajLOfnUVa8b8id+gk+TzKyzW+alSYT8Ww3wvwz1JQzgtHNiwBYopDgBn?=
 =?us-ascii?Q?BL61kwJA/JE1ZtIx7rjr+117hva+uke554hS9O7jmjMWHA93Jf/wcxTH8syY?=
 =?us-ascii?Q?LEAiKUeS/kHZYzEuvwhCn3hSMiD7iu020ybpfephT9HyNyTfU5VUMiLkKeVS?=
 =?us-ascii?Q?OD8ZaRQJmc/jp/3K2jhp7qVWSCTOZL5jZ469q2aveAzA9IC/2YBUbwj+gp7N?=
 =?us-ascii?Q?lGk2pXiNoWe5m7JfWhRBUJkhJKtC3XWnHcXQ5iT8S/oQ0e1VaC+vD//MSFdw?=
 =?us-ascii?Q?18bz0VthAIAfFMaozDN7mtEof7iwMSW55Lz2eaTjlpOoizY91/it+yVb9tWX?=
 =?us-ascii?Q?2FK7Bk9dIsGqGdDuRQSMg+wNAOVHRjs=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 968958b9-b608-465c-659e-08df4c192295
X-MS-Exchange-CrossTenant-AuthSource: OSOPR01MB749128.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Nov 2026 23:58:14.8728
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: M37JYeS2eOfbSjq8+nVOhvTX+VYI0s1Ck7o1vqSvvv+MYm0i6RFUTO+nhvnsPBwcpFHhao3g+/VSI22cyLmBZrfECe3CQvKvCPnhzBnVDbz0j4ssHTdtx/R4Zgk7Ipgt
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY7PR01MB17984

Current rtd is using "list" to connecting to "rtd_list".

It is unclear and confusable naming. Let's rename it as
"rtd_list" and "rtd_list_head".

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 include/sound/soc.h           | 8 ++++----
 sound/soc/fsl/fsl-asoc-card.c | 4 ++--
 sound/soc/fsl/imx-rpmsg.c     | 4 ++--
 sound/soc/soc-core.c          | 8 ++++----
 4 files changed, 12 insertions(+), 12 deletions(-)

diff --git a/include/sound/soc.h b/include/sound/soc.h
index a08c0e01cfd9a..290be882ecab7 100644
--- a/include/sound/soc.h
+++ b/include/sound/soc.h
@@ -1002,7 +1002,7 @@ struct snd_soc_card {
 	struct snd_soc_dai_link *dai_link;  /* predefined links only */
 	int num_links;  /* predefined links only */
 
-	struct list_head rtd_list;
+	struct list_head rtd_list_head;
 	int num_rtd;
 
 	/* optional codec specific configuration */
@@ -1075,9 +1075,9 @@ struct snd_soc_card {
 	     (i)++)
 
 #define for_each_card_rtds(card, rtd)			\
-	list_for_each_entry(rtd, &(card)->rtd_list, list)
+	list_for_each_entry(rtd, &(card)->rtd_list_head, rtd_list)
 #define for_each_card_rtds_safe(card, rtd, _rtd)	\
-	list_for_each_entry_safe(rtd, _rtd, &(card)->rtd_list, list)
+	list_for_each_entry_safe(rtd, _rtd, &(card)->rtd_list_head, rtd_list)
 
 #define for_each_card_auxs(card, component)			\
 	list_for_each_entry(component, &card->aux_list_head, aux_list)
@@ -1142,7 +1142,7 @@ struct snd_soc_pcm_runtime {
 #endif
 
 	unsigned int id; /* 0-based and monotonic increasing */
-	struct list_head list; /* rtd list of the soc card */
+	struct list_head rtd_list; /* rtd list of the soc card */
 
 	/* function mark */
 	struct snd_pcm_substream *mark_startup;
diff --git a/sound/soc/fsl/fsl-asoc-card.c b/sound/soc/fsl/fsl-asoc-card.c
index c2a112506d701..c21bd0da145a2 100644
--- a/sound/soc/fsl/fsl-asoc-card.c
+++ b/sound/soc/fsl/fsl-asoc-card.c
@@ -1030,8 +1030,8 @@ static int fsl_asoc_card_late_probe(struct snd_soc_card *card)
 	int ret;
 
 	/* Use the first rtd which carries the CPU+codec DAIs */
-	rtd = list_first_entry(&card->rtd_list,
-			       struct snd_soc_pcm_runtime, list);
+	rtd = list_first_entry(&card->rtd_list_head,
+			       struct snd_soc_pcm_runtime, rtd_list);
 
 	ret = fsl_asoc_card_init_jack(card);
 	if (ret)
diff --git a/sound/soc/fsl/imx-rpmsg.c b/sound/soc/fsl/imx-rpmsg.c
index f6a2633bb812d..31ae8e9feb785 100644
--- a/sound/soc/fsl/imx-rpmsg.c
+++ b/sound/soc/fsl/imx-rpmsg.c
@@ -82,8 +82,8 @@ static const struct snd_soc_ops imx_rpmsg_ops = {
 static int imx_rpmsg_late_probe(struct snd_soc_card *card)
 {
 	struct imx_rpmsg *data = snd_soc_card_get_drvdata(card);
-	struct snd_soc_pcm_runtime *rtd = list_first_entry(&card->rtd_list,
-							   struct snd_soc_pcm_runtime, list);
+	struct snd_soc_pcm_runtime *rtd = list_first_entry(&card->rtd_list_head,
+							   struct snd_soc_pcm_runtime, rtd_list);
 	struct snd_soc_dai *codec_dai = snd_soc_rtd_to_codec(rtd, 0);
 	struct device *dev = card->dev;
 	int ret;
diff --git a/sound/soc/soc-core.c b/sound/soc/soc-core.c
index 2b95a905c711c..00d50ef50a3b0 100644
--- a/sound/soc/soc-core.c
+++ b/sound/soc/soc-core.c
@@ -297,7 +297,7 @@ static void soc_free_pcm_runtime(struct snd_soc_pcm_runtime *rtd)
 	if (!rtd)
 		return;
 
-	list_del(&rtd->list);
+	list_del(&rtd->rtd_list);
 
 	flush_delayed_work(&rtd->delayed_work);
 	snd_soc_pcm_component_free(rtd);
@@ -375,7 +375,7 @@ static struct snd_soc_pcm_runtime *soc_new_pcm_runtime(
 	rtd->num_components = 0;
 
 	rtd->dev = dev;
-	INIT_LIST_HEAD(&rtd->list);
+	INIT_LIST_HEAD(&rtd->rtd_list);
 	for_each_pcm_streams(stream) {
 		INIT_LIST_HEAD(&rtd->dpcm[stream].be_clients);
 		INIT_LIST_HEAD(&rtd->dpcm[stream].fe_clients);
@@ -410,7 +410,7 @@ static struct snd_soc_pcm_runtime *soc_new_pcm_runtime(
 	rtd->pmdown_time = pmdown_time;			/* default power off timeout */
 
 	/* see for_each_card_rtds */
-	list_add_tail(&rtd->list, &card->rtd_list);
+	list_add_tail(&rtd->rtd_list, &card->rtd_list_head);
 
 	ret = device_add_groups(dev, soc_dev_attr_groups);
 	if (ret < 0)
@@ -1282,7 +1282,7 @@ int snd_soc_register_card(struct snd_soc_card *card)
 	INIT_LIST_HEAD(&card->aux_list_head);
 	INIT_LIST_HEAD(&card->component_list_head);
 	INIT_LIST_HEAD(&card->list);
-	INIT_LIST_HEAD(&card->rtd_list);
+	INIT_LIST_HEAD(&card->rtd_list_head);
 	INIT_LIST_HEAD(&card->dapm_dirty);
 
 	card->instantiated = 0;
-- 
2.53.0

