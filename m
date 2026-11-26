Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.229.54
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795737527;
	b=tWy8/OhPwiWlLw/nMOhUNT7roksoo/hrfOQziJw1OeDh+X3y0h8eNFXUHjMejyH66a3R
	 UzOFFfnRSCECbxmYeWtdYTFpEXv+cnNK3TESc2MJFDCXzb8pIMoS9S5k/50/dvr+2PhDy
	 jwzUqIA3tH8YyBLRayBIofZop3ut/TcDU7PNLhtJPVKk3PVhYOHYyfIL9SkV7LgTAg/Qp
	 fUOSdr5nGrrYaTIz5Eu3anyk+bb106mFHGq2c4ca/mvpjNFVBgHrzpF90KEg9SjgS2hjI
	 j2SFN+eCe+yDh+GsKd2kuKjLN4IeiEvuGcqVnIwt44IRVXEweZKLGgaGAh4PDtH5G+Q==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795737527;
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
	bh=4hjoV5XLwD8NwvPU+fLVdYsJcavxgzSH/gHc+PQIIMo=;
	b=ILnBfxgBztemO6S7ypJWNzfc9ZjsWkfJVhuWKWg4IdA/blOIA03SDxn7qNc2rjsb+5OH
	 LVFfSgKT0JjL6KjI0vUT+0YG/BObWI2RplvS47t0wd4PpHyabxMuTsTs8DrO9JfmbqOEq
	 JNi0z1/AEO1gKhjSkcxrVz40QjPWeQ0shZ0P/0SRz4ih6yXq2/5dZI++XSOgvsM25XN1O
	 BjyjY94XyswL6ouhREPNBONrTnTN1saz2IKbujIi48yZwE+T+jT34sJpal0FmAh46Yo/K
	 dNrHP0Bi3ogYdjhhe3wm78RDGEwL4qwoLsN2nodPBfkoz2hcolSpkJ9m/bncuOJussg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=renesas.com;
	spf=pass smtp.mailfrom=renesas.com;
	dkim=pass header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256 header.s=selector1 header.b=KTnVOnus;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.229.54
Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazon11010054.outbound.protection.outlook.com [52.101.229.54])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16FAF606A31C
	for <linux-sound@vger.kernel.org>; Thu, 26 Nov 2026 23:58:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 16FAF606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256 header.s=selector1 header.b=KTnVOnus
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=En/8nfWS7DcshtvC8FCsTN0Rok6cwOaGzHKDxMO7tev77Gd5pGoUy/UwkkgQ9RwSrgMIqVDOWrO5SCb+Wj0P2k/cxLCcU+pXf1Xl9yA/Q/5navw1jK385X4ppIqvZMRmlC+vmVGr9MEh78Lbc3850AEw93lQjsk3UiHLUGrtALucmpj4fSOsYAF0zZRMrftoQ7K2l43PYriQo50YoLpU7fYDDjqD8rEvPwwhNzbwYja4kw0vOIH1cMtEnCzRfopE7QLWnNzjdQTtMSmXW/I78FyRVupfjpGUDzmhqPRCMQqLxNDjLdBB6RnKsti+keiDqZkj17nCLuVyzNI1jDMcyg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4hjoV5XLwD8NwvPU+fLVdYsJcavxgzSH/gHc+PQIIMo=;
 b=oQtt8cXFVLgspZTvZQQB1A8fvMhXxDnvl0wBmxkXUWB4AewmwTdhRJ9cOBaUPjDMkvdEyEiDRIAwSuSFtcCIyRfZ7vl7uTyJ1HtEolUWjcSkCXs/XDye2gvPWSK5K0ZsikrM5gfcmJUEjMa1RCBMxvtOUe8SY5S42lQ2aJbXH1cVC20bL+ogAHpfGoGyD0PhR0h8PtPAKQ/f1fTBlpOs16BOn9K6L3btj7FPT69JHk9JeZFfC18L99RVmJuZz5KZtrqNrEz4f8vuERmmwz80soeIT5OhSFDcm8QU+Mi4oqQdrjbW2gpLAFUzSw5wPq/L+8JytRoAL/rRquypGIi5fA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4hjoV5XLwD8NwvPU+fLVdYsJcavxgzSH/gHc+PQIIMo=;
 b=KTnVOnus00+7xFUk2/WpkjlnZY6KLwTURXW79cCcSbFGCwKR1FfpkXtgruc1DKMocEQK+8gTUEVpd0eBMUgIK98vF1ep6Csk1UovY5dNnzstH4bXvawFD/IH2lEcBPewyNt4/qPlKI8TSwerN+554TEYyDvSkOokyvl341Iukr0=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from OSOPR01MB749128.jpnprd01.prod.outlook.com
 (2603:1096:604:4ba::14) by TYCPR01MB9643.jpnprd01.prod.outlook.com
 (2603:1096:400:197::5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.662.9; Thu, 26 Nov
 2026 23:58:45 +0000
Received: from OSOPR01MB749128.jpnprd01.prod.outlook.com
 ([fe80::6a3b:d29c:c743:5180]) by OSOPR01MB749128.jpnprd01.prod.outlook.com
 ([fe80::6a3b:d29c:c743:5180%3]) with mapi id 15.21.0662.004; Thu, 26 Nov 2026
 23:58:45 +0000
Message-ID: <87h5h3qh57.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 10/11] ASoC: soc-dapm: rename list to dapm_list
User-Agent: Wanderlust/2.15.9 Emacs/30.2 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org, Alvin =?ISO-8859-2?Q?=A9ipraga?=
 <alvin.sipraga@analog.com>
In-Reply-To: <87v75jqh7j.wl-kuninori.morimoto.gx@renesas.com>
References: <87v75jqh7j.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Thu, 26 Nov 2026 23:58:44 +0000
X-ClientProxiedBy: TYCP286CA0372.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:405:79::20) To OSOPR01MB749128.jpnprd01.prod.outlook.com
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
X-MS-Office365-Filtering-Correlation-Id: 7cad728b-ff2a-4f28-82df-08df4c193484
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|52116014|366016|1800799024|23010399003|18002099003|22082099003|56012099006|11063799006|261102123227099003|261026121527099003|261021121427099003|10067099003|261022075727099003|261021123027099003|38350700014;
X-Microsoft-Antispam-Message-Info:
	Nc1/d5N7TJObqqGHAynNTlrxPPZbRQP7SGp6qoO0LM3ZB8g2NotXYZxSuevyDztWDuc+iFATBlbCC7kUFtb94OUD3THx7eiVyr3Hjg5wX56YZHIJ+behQmpcExpUe+p5g+NY+sYFBGDkFrDpCsKE3prVvo0rrPIqm4t+cCzyWDY8+Lkf6O9gL6gY3qV54bauRNMPegfKx1PTjMxfxT1dfYF1lbyNGB//XeyJSPYRORWvXEBubS8AyED95htxkLbouihVkd24DZHCiRyioTp8VPIWdQzFOuyVsyWRHVIHEXOMTN4sWaQhatlPrfC73ZEPzUfugAoLkQ+SlzhtY5gRSIZ/efQawjCEtOe4JHciSTXyaJCGA5PGBfT+weSCfHCXspE0r0x0/ANBhadlvaXnfkoSllGTme1LCTJ3rb/c8N3rkS8DPHxWWMv+PFkNEjHu8V+/gZmxWS8dWvs3Zd7JVUsF0NQwHK36Rv7LazZtnC8U9izUIiAk+KeVmv0Ri2tgnEtN932mpE4lxRqXaqloFzPk8i+iv4v00h1+49TzAHpfrLcdU+V9k5gi68c0NnK/4oLuA5616rRJNwMyQwF+lOlnW53Oy1xKuzBTSdIhhB8VYR6ldt2yznsSQu8z357Nhy6xZVki8tf+iPMAiuBZcW8wVhWC3kr0opLnSfqgSzADHYJf5Y4+Blxk+R6CHPF92HTMAN5JZ/oc4OtzN0CyML7t3p4dQGVmCu8RzYBnlfY=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OSOPR01MB749128.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(366016)(1800799024)(23010399003)(18002099003)(22082099003)(56012099006)(11063799006)(261102123227099003)(261026121527099003)(261021121427099003)(10067099003)(261022075727099003)(261021123027099003)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?fII3dgfzqYR+Rj4AYqKGDI0nQpaoA6Bt/U+u2qMRKVM4wPlsveKwyA+1sWUh?=
 =?us-ascii?Q?RB6dR7RjiW7Lz1OSDYU3N/GLhSI1QyrWrRhw7QLavw0jZURRW9gWiax9Xea8?=
 =?us-ascii?Q?qQMM02SBaqD9tlCc1NUXQJ5Bnd5HOZMea7sEzDEtBCiRPwaU7NJ6O04DMCBi?=
 =?us-ascii?Q?z8m9q0+1xEmB5LeT9JbyGg9ld3SyMgH1XPC5Sp0QgW9gMxT7o0Y95Di/6Qlf?=
 =?us-ascii?Q?u7dMLCQ7mbg+Lg8yZo3LD37HbvxDfiaXQ/HPWhuXc4azDN4hpiqAzxlpdqZa?=
 =?us-ascii?Q?Hv6pUS+AeT/TxWpaQ5c/qpwCah/NjHuE5T9JedbSNc1tq7hNIUdJUWRSspmy?=
 =?us-ascii?Q?WQPp9N6PlK/nW0BxaYC0Tfqj2AAlvyZtQImFxeRh1J7Kz6NS6tJAUnfDDJDV?=
 =?us-ascii?Q?7sRjlULBrWyOF183XZ3pWMi+/MVQ09b+hAy3r4QLl0mWNf1YNT5WBd3zrEZG?=
 =?us-ascii?Q?Ag7PRPxOxazHWyuQlIwtBFG4Q6ibfLBkQfyd/u8Tkf+0m03PRHFGFZY3QZzl?=
 =?us-ascii?Q?qzxVUDfiErGNf4XCc3aW2xt9Lx2xrTzEiYKHM22y61YmVRVZo87sSIYE40oj?=
 =?us-ascii?Q?hQKOeR0fJaCVhqg2d79e8oWzwCPacOl9f9roKx3RVzrfZmalPZzbeq8wXR60?=
 =?us-ascii?Q?Spm57ARkR1XJ3/qpXDXuke9gXU5HzBFN/zEj6WLc4Pfma9wRLKK5EEGD0KHO?=
 =?us-ascii?Q?NLiKKPU/X/P4h7h7PW3eAGj8nv1uFG/Gj02S47kGsCqe+n81uwy028LfXIP8?=
 =?us-ascii?Q?jZnKA+FxRBu4/inqaR2PuiTBtWwccDuOpASGcFR5KPPRCoA3KUZte5HaLYLV?=
 =?us-ascii?Q?HvzBEhEkEFX2Y4WaaAi/25VetwHqR3XOJ3IRf6ECkxcpmog8v0s5tUohP1W0?=
 =?us-ascii?Q?PUtBOC8gwZ30Fq031wZ2BmtpZYhBetMoBhbI/QksVx7QkD9lBwaZfQxpv0yS?=
 =?us-ascii?Q?jhRHhvR6ZczMZxKvY5TnMiZ5jHY0EDDR1hfOLQ7LsN1L229BSuzHrZUBrwGu?=
 =?us-ascii?Q?UkkAa5VbFCWo4lJvgF4IK/ZiIGJ1SrSqDLYVYh1d17sJibmaR9QYNYbxTIfm?=
 =?us-ascii?Q?gcbn5HBgWyr3ARIt6ljVW/0XfE1lkt2IDkUz9dwYmAtKVXEHqzjXIHkAPJxx?=
 =?us-ascii?Q?nc4jZaTlVR4Srkrr1S6kdhcU3I7C0s31hM0328UUfugms889A3emkr8sXPmN?=
 =?us-ascii?Q?QtFUxhldgCtJQTx4u3iEKVwSEZ30RJVMfp+SJVbrZ+VwcEGrbJDZ4f3jHAJk?=
 =?us-ascii?Q?aes87N3sTLWSuAMT/IJInOmHiMOYx6IQ9TTbF9HOnnL0QHD68Ua3z/WC5Ojr?=
 =?us-ascii?Q?ll6enWJ4THNSo0Jrk7QtSrIuSXywQH1GL8M3dBuPMCMHKtzD5ME+oQfmqBL+?=
 =?us-ascii?Q?QOujL4+9y4qxkbgckGkiasbLauBpmGRkTeslDOt3+ki8LXdT/Hl6dAl4R37G?=
 =?us-ascii?Q?u6pA+miL9xTp9iV9TN1U5TNPFQ5nfLNE1Z8C/jx/a5mlcm2C2uCPpUKvjTK/?=
 =?us-ascii?Q?wOP5BQlZbWWv14J6quBOx7pnGCH3U1xRfLdb6tAPcOY7hbVLiGnEpGou3sN9?=
 =?us-ascii?Q?A5wVSg7y3VUquudW3WbXniHUSxmNNHilaPBaizj/OQ5Il/p0i8dgRqDklhqk?=
 =?us-ascii?Q?B00fWQKeiUa4EiqKSXGMMigEwg+TOBM4hHoEaTJXwSMhzu+IS1xBvnrN/Opw?=
 =?us-ascii?Q?gX98Kg1vqMGbyABbam3q5KwWJfr/DvHgmdCDlROyw8Vvz7VTqiAhRXB+yduH?=
 =?us-ascii?Q?w5nVTbjvPLRpAr23/u/crfUjQM2ucpi0NXpGkOD/92mNEzrgwBO3?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7cad728b-ff2a-4f28-82df-08df4c193484
X-MS-Exchange-CrossTenant-AuthSource: OSOPR01MB749128.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Nov 2026 23:58:44.9650
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JoPGN2Ymr9rJsLGc3UcF7v+dWZRUB6p1fSadeNKSDON3rjukKBss7FpaG8lATsdC8ae2exCq8ndgcTzmP9N3e+lxvcUa40TVTHV5eXzoN74EeRRH1C9TwD7YH2q3gKKO
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB9643

Current DAPM widget is using "list" to connecting to "dapm_list".

It is unclear and confusable naming. Let's rename it as
"dapm_list" and "dapm_list_head".

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 include/sound/soc.h  | 4 ++--
 sound/soc/soc-core.c | 2 +-
 sound/soc/soc-dapm.c | 8 ++++----
 3 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/include/sound/soc.h b/include/sound/soc.h
index fe9712a560c15..c886d2edf46c2 100644
--- a/include/sound/soc.h
+++ b/include/sound/soc.h
@@ -1041,9 +1041,9 @@ struct snd_soc_card {
 	struct list_head component_list_head;
 	struct list_head widget_list_head;
 	struct list_head path_list_head;
+	struct list_head dapm_list_head;
 
 	struct list_head unbind_list;
-	struct list_head dapm_list;
 	struct list_head dapm_dirty;
 
 	/* Generic DAPM context for the card */
@@ -1089,7 +1089,7 @@ struct snd_soc_card {
 	list_for_each_entry(component, &(card)->component_list_head, component_list)
 
 #define for_each_card_dapms(card, dapm)					\
-	list_for_each_entry(dapm, &card->dapm_list, list)
+	list_for_each_entry(dapm, &card->dapm_list_head, dapm_list)
 
 #define for_each_card_widgets(card, w)\
 	list_for_each_entry(w, &card->widget_list_head, widget_list)
diff --git a/sound/soc/soc-core.c b/sound/soc/soc-core.c
index fa839b33e247b..0064fc3a17851 100644
--- a/sound/soc/soc-core.c
+++ b/sound/soc/soc-core.c
@@ -1278,7 +1278,7 @@ int snd_soc_register_card(struct snd_soc_card *card)
 
 	INIT_LIST_HEAD(&card->widget_list_head);
 	INIT_LIST_HEAD(&card->path_list_head);
-	INIT_LIST_HEAD(&card->dapm_list);
+	INIT_LIST_HEAD(&card->dapm_list_head);
 	INIT_LIST_HEAD(&card->aux_list_head);
 	INIT_LIST_HEAD(&card->component_list_head);
 	INIT_LIST_HEAD(&card->unbind_list);
diff --git a/sound/soc/soc-dapm.c b/sound/soc/soc-dapm.c
index 5ccb9e087c6e8..5d6b095030560 100644
--- a/sound/soc/soc-dapm.c
+++ b/sound/soc/soc-dapm.c
@@ -54,7 +54,7 @@ struct snd_soc_dapm_context {
 
 	/* used during DAPM updates */
 	enum snd_soc_bias_level target_bias_level;
-	struct list_head list;
+	struct list_head dapm_list;
 
 	struct snd_soc_dapm_widget *wcache_sink;
 	struct snd_soc_dapm_widget *wcache_source;
@@ -4962,7 +4962,7 @@ void snd_soc_dapm_free(struct snd_soc_dapm_context *dapm)
 {
 	dapm_debugfs_cleanup(dapm);
 	dapm_free_widgets(dapm);
-	list_del(&dapm->list);
+	list_del(&dapm->dapm_list);
 }
 
 void snd_soc_dapm_init(struct snd_soc_dapm_context *dapm,
@@ -4976,9 +4976,9 @@ void snd_soc_dapm_init(struct snd_soc_dapm_context *dapm,
 	if (component)
 		dapm->idle_bias		= component->driver->idle_bias_on;
 
-	INIT_LIST_HEAD(&dapm->list);
+	INIT_LIST_HEAD(&dapm->dapm_list);
 	/* see for_each_card_dapms */
-	list_add(&dapm->list, &card->dapm_list);
+	list_add(&dapm->dapm_list, &card->dapm_list_head);
 }
 
 static void dapm_shutdown(struct snd_soc_dapm_context *dapm)
-- 
2.53.0

