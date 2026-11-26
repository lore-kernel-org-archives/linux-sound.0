Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.228.53
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795737504;
	b=m2ADajeQXuiPRT8rHTkMmwdA+drXP0zKxHRFkDyg0MtQ4f7gkf4bC5jNEyB1lsg2kWmb
	 qOl88CHn3EowJN4z16M9h3hu3lgUY8Tlp0sd7cHg+T1mu3xnbKnuuTnlhTG3UyEfOErEu
	 9eHQRwwu1sCvBb3A8RQ9YGIhj62s2kBXCr8RPwdUgkG8gSpjEpCPMprWBOAEe2zYRC4co
	 QWCu/vBtm1xzdjxsVFHt6vwEwIudE6w38sqUb5WUnrnvdAlw7knWsywGdEyLw/sXcNHjU
	 IkK53xqplAiEZNWw6HsdkcQiu/wD73oKtmnTm6T8n3ktwxcmthQ/05SN7s5UbUIACiQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795737504;
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
	bh=rnetkeLEKFRNx/qFO7aCHVtyT3gEhHTD6h9qoODOIrk=;
	b=qf0tCtSdzMI5iIYUAeUEzOHwq4fOuPKMGxZXWFBWtoTlRYipHmo1cmAkcOe8cTokdDjs
	 LnITXa8+VzlxalaUhfVW17qsOuePAmDkVkRH+V1+DGazbyjfjw5pG0FNhySHxxhn/a21A
	 L0Fs6yCAw8RQy/JUHi19AyuuJdj2S0ukJZoVtO83utk9R1ENLH3uI2s1JntUFcCED0q4i
	 pSmztkxppx95WDpGJjojluPPD/dxEmLh5U8MpcdtfPZizHJdBHcf59FvOs0+Qbr0BMos1
	 DzhibD4zZI+5vv3RQv7ny9lWFGx4ALxM4D30A55V2anDExHZ7u+l5Ek2acaCxGqhokQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=renesas.com;
	spf=pass smtp.mailfrom=renesas.com;
	dkim=pass header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256 header.s=selector1 header.b=GLWHWLV2;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.228.53
Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11010053.outbound.protection.outlook.com [52.101.228.53])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA593606A31C
	for <linux-sound@vger.kernel.org>; Thu, 26 Nov 2026 23:58:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DA593606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256 header.s=selector1 header.b=GLWHWLV2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=x0AbjY7xsk4Jp84Z67+Qrc9/KbZFb5zhVx0k0CnL0cMYQvVKG3zCkq5X+/MpHC5iDuvgpC4zt2SUWN1MfVJzrDtDNk420v9F8MqIxWmJnCZQa60M/k45LQWLmi8VVs38T1FB0+JIRgbFGtMAwCJgOct7nfjlJfV3t/gfpy1rpIlueseRGfRiT2AwlPYDu9kWqA7t6Fkdt8G1CAunsjZl+85pmwUnwgD6rfCo3rMEl9hhAnXoiiUdzm9EViPl9ht92MvPMQ+kA3/D8q9DFlEUfebrCgrHawxMieofkUUdzMEJXhPBbw/R6eAyJakhBe6Fe0eJhV/drqONDQgvsLynfA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rnetkeLEKFRNx/qFO7aCHVtyT3gEhHTD6h9qoODOIrk=;
 b=tybxmGzVo2vjeDYgOr3u9obTSzmPW/9zQJBbf10L4eEt1VCbj+oeNN4STModU8xBXWUveEyVflHN28VuKUMMv6vRNo1+OTE/dk+guU0a9P3+nv79D6ECauHqg3kC4p/tjuJDUbsc7POPVoiuuF46uBL93mBmGz4jjrcE/+/16xlNn77SeTzCFcdqQbcA4YLd0Wu3gb8TclgEFW7eL+9EVfO+gUDsIfxi6pTPNnuJM2nhfEwoZYPklG7Z2hRkpcziA7UNFEePqe/y/Po+N3aa3VYWmZ1NqD4cxl7GetzpWMMeTPqHtX4NZAMjUNSqb4083lMVCMH9rU+3zawCY+MgLg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rnetkeLEKFRNx/qFO7aCHVtyT3gEhHTD6h9qoODOIrk=;
 b=GLWHWLV2pynYflkhmqd3SFA8aAvsOMAOpy6aieY2WI9IiJ050kFMrRLllOEct8zyW0TEkZumoinJJO+S88tGPUTO/qSh/GEPBGN+9U/yeHtPsbkziGVZZjcwAH4qlLWd9xuNMTHzIk8WDPdKJqYQh9+m2ZNnsLZop+ffwFTUU0Q=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from OSOPR01MB749128.jpnprd01.prod.outlook.com
 (2603:1096:604:4ba::14) by TY7PR01MB17984.jpnprd01.prod.outlook.com
 (2603:1096:405:3a0::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.662.9; Thu, 26 Nov
 2026 23:58:20 +0000
Received: from OSOPR01MB749128.jpnprd01.prod.outlook.com
 ([fe80::6a3b:d29c:c743:5180]) by OSOPR01MB749128.jpnprd01.prod.outlook.com
 ([fe80::6a3b:d29c:c743:5180%3]) with mapi id 15.21.0662.004; Thu, 26 Nov 2026
 23:58:20 +0000
Message-ID: <87mrqvqh5v.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 06/11] ASoC: soc-core: rename list to unbind_list
User-Agent: Wanderlust/2.15.9 Emacs/30.2 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org, Alvin =?ISO-8859-2?Q?=A9ipraga?=
 <alvin.sipraga@analog.com>
In-Reply-To: <87v75jqh7j.wl-kuninori.morimoto.gx@renesas.com>
References: <87v75jqh7j.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Thu, 26 Nov 2026 23:58:20 +0000
X-ClientProxiedBy: TYCP286CA0048.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:2b5::11) To OSOPR01MB749128.jpnprd01.prod.outlook.com
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
X-MS-Office365-Filtering-Correlation-Id: a5608885-dae9-414c-a34c-08df4c192626
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|23010399003|1800799024|376014|52116014|38350700014|10067099003|56012099006|261028144727099003|261026140227099003|261022105027099003|261021121427099003|261022075727099003|261021123027099003|261102123227099003|261009223027099003|11063799006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	+cy6dN+16eAiSaO8PuVx4nh36v382twvj1nCSisYzZ+EPA/esMJboxHZqentPE1XzF6IVLBmXHrNmTFZB+yUgrWLBZ561k7yslBuWLLiQKFQQ5wTWzbAAp8RpQ1MVzyaj4iE3ZV/wMg5M1Gkd0GXi1zgSSsFYYDJydYZ5eoDis0/Pt0LVbGGgL3Trwrws75M9XDPUFFOFx1OzlWsE9QOI/tGGICcZj3XlmCIdCbHUmqsvPoT2TqBDHKkQBLlnyNGtwoz3H7SPUYGwNlVWKq/3qECp1GYohHnd/OjI0M6EH9zYykkwEgQzeSxwC5e4S4cZMDHtIlrZSy7Sgoce9TCD+s6HkloDf3PHDTjWSIBxfM3sX+H33BK0FIZZH9AtJmfPs8YQvGC+//zJ0Ty+rtG8IS8YeVjCQUunkH86jXG+hXMVPXxkFJTa2pw1U1cImj/lkFTfff7B2h7uhoXXHGc0JhmbtBjC2dsG5dihoKlA9J3PMJgthuxTkW9As4+XJhUej2725GIKyaVz4X2VHWgW5wdWk2y2IyQfBOmxtDDCHh8Egk2044O6Dg3zIW0k6EPZU7CnlNmGgG3ElC5KQW9zf/6oZj0/oGqmyan1K/R4knabfqr3NISXBzABTRs9dI+Hk1lO7aFj5J6iOm5YM4V6Xr2PbcgXGWzivYhn5BQAAwrZ04jSsXHX8B/2PMViQFMCeUwoIB8o6TxdeMEfSl21EVFIjRpm11aqSfDUGlIVEk=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OSOPR01MB749128.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(23010399003)(1800799024)(376014)(52116014)(38350700014)(10067099003)(56012099006)(261028144727099003)(261026140227099003)(261022105027099003)(261021121427099003)(261022075727099003)(261021123027099003)(261102123227099003)(261009223027099003)(11063799006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?fM5/tt1AM1g4P7hc+8+e5NKr9n3pR/pIsof2EyfuO1Q3xFOceZlTB+gSrtk8?=
 =?us-ascii?Q?m6pT0Tc0PcHI+FDnOHOUkX/qo0m0Djbs9XQbOqmzExuFdaGr9RRFkziOMDXI?=
 =?us-ascii?Q?+1fEh2HfHNiV8olYxzSgJUK/mHOTIh6BDU8nWQz3NUMe+8Vgc92pkNZfqTP2?=
 =?us-ascii?Q?lWHsojxqkSYRAcRrYX4v8FJfdMSr7tpiuRDEmuOZlsqjedFbmfGjdzAqxJ3u?=
 =?us-ascii?Q?41FTIfnfq7y/CVj67MX+oQlJjdfca3XTKPSSF8px6C9f+1IFMU08JSGeZX0M?=
 =?us-ascii?Q?y03cRVea2wfuXGbhfNl6DEq0lX8oTA5Ps7EP8l2Lq4LGZZv7NN9iPGvyPZpi?=
 =?us-ascii?Q?BSNK+UVc8K8R8hf2jwNoR5NOYlxEXJT9r/oWj9qctQvXXKH5V8GmxWJ7RXTF?=
 =?us-ascii?Q?05NAvubwdSg7eqRZ7Da1AJeYOQCA6p8C9RMioLXseoFjsbXZODqTQl/YUmZY?=
 =?us-ascii?Q?KmiLaM77tgCSYanLdDZslEWhsffsyrJn9bzVV4Rts5cCkP+74l0yFTQg0mo0?=
 =?us-ascii?Q?TAhC/uzbqqaqZXn7ouomXKPdv8ulCh+uCComhhdNevg7Li+QkpfaYkirADHO?=
 =?us-ascii?Q?phD9SIvv5oXNYL6aqHRvJvtqJSvJToX+KLMcb1wthcewnFfPA5ZiNRlnLCkZ?=
 =?us-ascii?Q?2H0XFg5ilDh5DIg576vdtQksuwK231cHfCWPOaL51SMrb3HVlDD1BpB9/FpG?=
 =?us-ascii?Q?bdkzr1F3dkNl6NFHmz5BbFrqf03JvLhNd5+1DtkEw8/zZK8ZFnBXHYI4bLRV?=
 =?us-ascii?Q?tZVeArArmME0SfOb+PIMEGpUiFNhW+fkxdM8L6tRvCmZRAid47Sz4qb2q7V+?=
 =?us-ascii?Q?WM5XS1zLzJq7dVoZf4q2xIY7ebakeVJaXXKY3LK9zKthlUDZNQqYSvc4Rz1V?=
 =?us-ascii?Q?p93MrNrPYIWHrowD5gsHSEwzenW7Kit1nnjZPNYMbymaOqKwgebVBv30x8wN?=
 =?us-ascii?Q?bCGgbhy0LVpR1uN+g/iXMyV8BajMf0GpC2zOy7PGhlKP74AudrlfRcEvfLBK?=
 =?us-ascii?Q?bVhmMIKW6QXuu0qlqyTxOwJ0R3tOrfRWN7RN3rVRzHHCf7lJbA4NRDr2LQCK?=
 =?us-ascii?Q?3/nojSvnH4fNjCRn6pBbU7RZNo+q+go/wiezMuS+2TY6e/Ou962vLuzehG3b?=
 =?us-ascii?Q?ZitPeTjWf4lHBvXCcIel8fRif0CMRrxghZqe4oQVOmH/ARec3KbRHS3R8ii5?=
 =?us-ascii?Q?afWhd5Lyy7v3QXzf4xobXp1t41+lTkFEVd81xRMrsgSSzTvpcQQRRyiqqNcp?=
 =?us-ascii?Q?Vzdc8oY8YkNiGSAm34iRtxz1E5PqQ5/1W9KTYp4pcRf4HKhreL5o4OqgzJfu?=
 =?us-ascii?Q?KSQ+Z1TRJhQNggLyx+KdW8JExeZeKjnnZy/0pZWQCUwDpvFlG6+LoLMhPi5q?=
 =?us-ascii?Q?bvSrmkNCgJdAKAsrPl1WMQeqle49UfM4AuoQOIsEQn7c4VNwvVBsRDKA5kDh?=
 =?us-ascii?Q?Bl4ly/953xlt3BB7sDi003UXlEbZ/saPqKB9D8OAM01XjQWcDOpzKB6K3Sfx?=
 =?us-ascii?Q?7WleychNJ3bHZGonKgm4oZBL2t541CdomcO1vn+Th4+yBKd4RO9ER5VkMmby?=
 =?us-ascii?Q?J3syFGjJNyKfwxxt1yuS4HcpR4BH+1dnvb28SsNLytpB6b2HAhaByQTwklUC?=
 =?us-ascii?Q?8NXoiW+1DH69YrNHNzctBug3MFGqQp6qXwca2/jTT9GrlioJQabf0wFHJyNV?=
 =?us-ascii?Q?kjbTbsip+TU18eHx0qBx5amR9u57nuvxUzk6+6Hy5XLNHTVqWphwo+nrhMo1?=
 =?us-ascii?Q?psXzG7pvz+qKBBkFBPCZ4KuhqOum18I=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a5608885-dae9-414c-a34c-08df4c192626
X-MS-Exchange-CrossTenant-AuthSource: OSOPR01MB749128.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Nov 2026 23:58:20.8845
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: iyect+KSv4Q7119tuhDPY/JJ83E/4sQ8fsnMOnhGlGdPnEQeHW5tuPUGLXd7F74Y2jR5clcIZloykwADezi1HYfCVDKgyliCtLBnhOKCAOzwX5cZ8bRDLj+irD0QTRLg
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY7PR01MB17984

Current Card is using "list" to connecting to "unbind_card_list".

It is unclear and confusable naming. Let's rename it as
"unbind_list" and "unbind_list_head".

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 include/sound/soc.h  |  3 +--
 sound/soc/soc-card.c | 12 ++++++------
 sound/soc/soc-core.c |  2 +-
 3 files changed, 8 insertions(+), 9 deletions(-)

diff --git a/include/sound/soc.h b/include/sound/soc.h
index 290be882ecab7..e8e256b7a0fa6 100644
--- a/include/sound/soc.h
+++ b/include/sound/soc.h
@@ -1039,8 +1039,7 @@ struct snd_soc_card {
 
 	/* lists of probed devices belonging to this card */
 	struct list_head component_list_head;
-	struct list_head list;
-
+	struct list_head unbind_list;
 	struct list_head widgets;
 	struct list_head paths;
 	struct list_head dapm_list;
diff --git a/sound/soc/soc-card.c b/sound/soc/soc-card.c
index e0f617077ee80..951ae9ff13557 100644
--- a/sound/soc/soc-card.c
+++ b/sound/soc/soc-card.c
@@ -17,7 +17,7 @@
 #include <sound/jack.h>
 #include "soc-internal.h"
 
-static LIST_HEAD(unbind_card_list);
+static LIST_HEAD(unbind_list_head);
 
 #define soc_card_ret(dai, ret) _soc_card_ret(dai, __func__, ret)
 static inline int _soc_card_ret(struct snd_soc_card *card,
@@ -898,11 +898,11 @@ void snd_soc_card_unbind(struct snd_soc_card *card, bool reuse)
 		snd_soc_card_cleanup_resources(card);
 
 		if (reuse)
-			list_add(&card->list, &unbind_card_list);
+			list_add(&card->unbind_list, &unbind_list_head);
 	}
 
 	if (!reuse)
-		list_del(&card->list);
+		list_del(&card->unbind_list);
 }
 
 static int snd_soc_card_bind(struct snd_soc_card *card)
@@ -916,7 +916,7 @@ static int snd_soc_card_bind(struct snd_soc_card *card)
 	snd_soc_card_fill_dummy_dai(card);
 
 	snd_soc_dapm_init(dapm, card, NULL);
-	list_del_init(&card->list);
+	list_del_init(&card->unbind_list);
 
 	/* check whether any platform is ignore machine FE and using topology */
 	soc_card_check_tplg_fes(card);
@@ -1081,7 +1081,7 @@ static int snd_soc_card_bind(struct snd_soc_card *card)
 	}
 
 	if (ret == -EPROBE_DEFER) {
-		list_add(&card->list, &unbind_card_list);
+		list_add(&card->unbind_list, &unbind_list_head);
 		ret = 0;
 	}
 	snd_soc_card_mutex_unlock(card);
@@ -1093,7 +1093,7 @@ void snd_soc_card_rebind(void)
 {
 	struct snd_soc_card *card, *c;
 
-	list_for_each_entry_safe(card, c, &unbind_card_list, list)
+	list_for_each_entry_safe(card, c, &unbind_list_head, unbind_list)
 		snd_soc_card_bind_call(card);
 }
 
diff --git a/sound/soc/soc-core.c b/sound/soc/soc-core.c
index 00d50ef50a3b0..7f21fd1e0182f 100644
--- a/sound/soc/soc-core.c
+++ b/sound/soc/soc-core.c
@@ -1281,7 +1281,7 @@ int snd_soc_register_card(struct snd_soc_card *card)
 	INIT_LIST_HEAD(&card->dapm_list);
 	INIT_LIST_HEAD(&card->aux_list_head);
 	INIT_LIST_HEAD(&card->component_list_head);
-	INIT_LIST_HEAD(&card->list);
+	INIT_LIST_HEAD(&card->unbind_list);
 	INIT_LIST_HEAD(&card->rtd_list_head);
 	INIT_LIST_HEAD(&card->dapm_dirty);
 
-- 
2.53.0

