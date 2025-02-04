Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11010033.outbound.protection.outlook.com [52.101.228.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BB4B537E5
	for <linux-sound@vger.kernel.org>; Tue,  4 Feb 2025 01:41:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.228.33
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738633296; cv=fail; b=MQfyDCR++J6sJdGdN0yNnBe7+S1/K57yQ81X6YMKadlATnlqnFJJcpuxS5Fo1t+UEpCpocD1ObAG2lotlVQV5To84wvkAWBevGqbpFnCU9Mab/FM/XFOOOPko0NQCwtwiasx1VOcWVN+uVCB+DSdg5Jxxzyy5jCb5rX24MlloV0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738633296; c=relaxed/simple;
	bh=2cotxvhrDGU59wLd5RzMiIP0j3mmCieYAnaYNPFz52c=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=l/H0hL/SnPePGQEZVHoN8SFDwGkDmLHUlZtsqaummsA2wtYH1mjJA6GJgJEzozaB3WexxNSb9iMbyJMGQ0xIh1JGswLsRq6c5HhaWqUU3CN4b8OnvsWbgM/8YdIqomG7vgFZHHvThu0DHP+zcPdYIgTAIMAF5AVP9dPnxJNzxms=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=PS45BEe6; arc=fail smtp.client-ip=52.101.228.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="PS45BEe6"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Y0kLVjPrbFntrB9n73h5yBv8OAqXVyxxHMeV7isSFC9UV4Y2oyyWXgBbzfjqpqvh8MivJsVfjKe3/7qVlzkyM7+BDeJ99eFO5GS5moeMsb9/MZaPKPctG2uQQzz3/4FYJjUvgBm7l+MMqUPtBrXy1JOqJkEZSNEGe0UkqU9pEhaUSniZS/+g8pW7WdSEJWM9u2hsynF+S6FsLWm/3CEhWVk8iq+w6LI69+b5T4nv+nNSLNwEaKG7yhIb8T7mTQb3kpIQRlIoQNNIhRaiKcTpPjXIuR4pehwCrbjF1bai2CCMsEYjb9Nk/lZgrRPDx0v/58gfm/90cOU34Sq+/BwXWQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fnHVmqlEaxxQlh2AaFNjrp/bZwiq6CSOzFmNApGU+xU=;
 b=ARHuUTtbm0KrdpkkOd7Q5Al9kE+wwWEAW6y+Z2P851t7QWVLsfWp/nDuZF3FUBXO4SunppoCmmGR9tlyObWn+PUKg2f2sIAzQUyOMXB0S8XzuJDZL+VJXiDg7OqO1VyLYjqEnomm68gouMArYMevDk1bDkcJ62mnO7jQKnaILGKJ/ex8UY+oMeJ2GiYi5ldkycIN5CMslLa3e39d30Rb+5C1VHwC46CbySXvG4R0ror0nZauCxQB0jxEJEqTCjab4ei/t/8y7xCn70qzr/NhG5NhSTYfmCejj/3jNO8p8ZaVuzyVxOEaMUXVHSNlOCoauGNU6p3GImmVYzrA/29r2g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fnHVmqlEaxxQlh2AaFNjrp/bZwiq6CSOzFmNApGU+xU=;
 b=PS45BEe6lYsa67Iv6R6U2XyD+ucHMqY33zIQLw4F8r8o7dS5H+bhvwS9BUxq6tsjse7bcOQDnwaUZboSGseqTx7NrdvmM0AID179xaVwqH4MIsEw1Q8e27w36WEBlbjZh1mK7kHba5YbE+IkHUUwJrToDViB4eAR0XSr7QBiFDQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TY4PR01MB13000.jpnprd01.prod.outlook.com
 (2603:1096:405:1dd::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8398.24; Tue, 4 Feb
 2025 01:41:31 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%5]) with mapi id 15.20.8398.025; Tue, 4 Feb 2025
 01:41:31 +0000
Message-ID: <87ldum32r9.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 2/3] ASoC: rsnd: don't indicate warning on rsnd_kctrl_accept_runtime()
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org, Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
In-Reply-To: <87o6zi32ry.wl-kuninori.morimoto.gx@renesas.com>
References: <87o6zi32ry.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 4 Feb 2025 01:41:31 +0000
X-ClientProxiedBy: TYWPR01CA0013.jpnprd01.prod.outlook.com
 (2603:1096:400:a9::18) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TY4PR01MB13000:EE_
X-MS-Office365-Filtering-Correlation-Id: 45ae11dc-23a2-4d79-9305-08dd44bd0cdd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|376014|366016|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?sTj4RpZKAgpg1BSs/DipIgjcfS3dA6Cw3xwECtct5zkJ/uqlR+QbZI4nos8A?=
 =?us-ascii?Q?fK2y1NW4HpxW0t6w/3sRftUZv59L99shG9mhHDbKCzS8D2IWIU/4+MFhJMFZ?=
 =?us-ascii?Q?Ez7iSVJ82KPm1w2LOfICh8W4bETh/8JhbSgJV8QjHDIUrNCIeG8ZalIuOELL?=
 =?us-ascii?Q?TiDnIUGl5W2rlRfQBn3a42QzUMNsl5LT+OhPmq38GPAvw5AjU9WP2Id7GdJz?=
 =?us-ascii?Q?WAWqUbtI3wl2RWPkFmaQl7US84FqcST5J6GVVgHh26ogF5dqcO8P7LPtc/RA?=
 =?us-ascii?Q?4HO2IRIVGIDYgT/dLR+deJh2JRtcbbXeAPfl8g0KB9S1RarrOnn3zj8ZvKl4?=
 =?us-ascii?Q?yCWWcTefNxG9qM75oE+TEM0qKvqPTadod+kh0mO7yqSslbtNuHQMTu9VUhOm?=
 =?us-ascii?Q?eDUtoI7CFDl49xYRLVgs/XewohlUTJrTez6Fqn7NpHKGFqBM7WLp4cRE3Cwx?=
 =?us-ascii?Q?2A6rhq0YVB7TLrDFiA9OmCkbLyczYQ6SCPQ3I5oiAK++4QPcQEwKvdWkc2bI?=
 =?us-ascii?Q?347QSHUHqC5R9yAdLIcmJfZ8b88jQsKnIx6XfkM22dmm9SA7FmSjkTKcvx88?=
 =?us-ascii?Q?E/GJ6MBZNsUys41Px1t/L98RhLOpJt5MHh341R0hDJPkUQEnUyWFwrj2N1c0?=
 =?us-ascii?Q?zanj9++su9NRcCGxJymfkp87ATGH0fyn4ICFD9BhCQFTJuai+nspcxkCr5PQ?=
 =?us-ascii?Q?trnabZ1LcD/hThkbZYJ/PbKv3Frmq53YTVeHTOqlkQxOfuQKz+yMDRir7kI5?=
 =?us-ascii?Q?w9lRs1m+60FgX4bCmjTefrU6QaZp1swdEGIUHOgzEeMJjlKcEHN+0KGXJSVa?=
 =?us-ascii?Q?LBrZ1eNoKNwtEcWU30ILMFUNdnBpcZpqzRXT7pZKfpKSr9sqfFKaN/txJeN4?=
 =?us-ascii?Q?cjJVw24c2W5PwmtIfWSLbIRanCjqT06oH0npBg8x/ejsNrToozmxb4t72r13?=
 =?us-ascii?Q?lEr5zJt7CU6qMQy1Kn+hZb/YdOjQH8KLf5YuiyoqvKrMWiDH5IFIRM1EB9C2?=
 =?us-ascii?Q?2TC0/1sSpr2TXrLs7LCRujIONmQsxIpGAR3sSKRwL/DkU+iCCl1cTIKMr69+?=
 =?us-ascii?Q?7mz6MmgWgT9jzqM0l7ym+l5KWc636bADjq7GVZw4JeRbI2iOp3w1u8zD2Cdv?=
 =?us-ascii?Q?vxdJEaB7YhJH9RCTdE3jOr/6A/R9f1t3unWsUOU/v6Ys2uGqBWFEhS/tYuOp?=
 =?us-ascii?Q?zzVqNgF9ertSlB6jUZwkEbza77oppDnGGWUh/c5aZGMw28XdqLcTlx34ef56?=
 =?us-ascii?Q?v9r9Z3hxYCVkXOiKXZIgWafTR1xCYc7G2It+lMnh92oCIQcCz98lSfPHvnrj?=
 =?us-ascii?Q?PrYrDrwf0+rxIU5ebusL3n1/n1cTh+XMyTfAGUiSLriPUMFOEZmouiSQ0Mz9?=
 =?us-ascii?Q?RkjqNTmoOtRc0OvdYa7/YdAORjoko7Pa+SDzVrso9Q+/kw5EtH27n7twr09r?=
 =?us-ascii?Q?h9GZs9qzxlZwf63C9glMUxmpRjzoE1IA?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(366016)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?/x8IX4kKqYFJaYrGcRKzkTiZHf7YZ56lrKwFcBCH8raeCSp2cJMT70QkumEc?=
 =?us-ascii?Q?llDq4vl7eR7Lq/KU43PXltVlPYZlrnXO2hGpLi8UvxT0cOjQkZ9sqn1yHcjy?=
 =?us-ascii?Q?9ngorZDjyfUt8InUgiBtjuc2w53BeiKuTKk4w04xWjzxWVI7JwxDNToAsICt?=
 =?us-ascii?Q?Lkx71fqSlrG3ZEb+p29Uhx91+SwHac55mIz+aLAO39zt/6ERCgbTWtZROKkG?=
 =?us-ascii?Q?4nScQs6oyFvqiIohbiA9xzqvmuUGOJwQCKdqt6yUSqbVrTeNXnjwuvtmlnQ6?=
 =?us-ascii?Q?jQKdFRy3X7RFxnRuBvIFoMxh9MP4+C7j2HkfpXt1IIKrRSJFZCr2e9d2Tc3M?=
 =?us-ascii?Q?77LD7uRPeBB1O4981sbpbxhZ2ESMLUCbyn1IG5vTcrd5ZXd5vNmVNA+Yb3+5?=
 =?us-ascii?Q?GET2jCmzitqufIk/EYuOLEIAXjKxE32PjNltSmTby4/UHbbwSkisiLNqBSkZ?=
 =?us-ascii?Q?4Po/56zAXT793MGfe2eBI6C/58VvR/qlHU7ix9GUIxorAO2nXcZDoaRdNc8R?=
 =?us-ascii?Q?eGCht+R5calBWCFJRCsDb6KZi6ViSTFPkHpVHnMvGoDt43D71xN5B1ZjTvJS?=
 =?us-ascii?Q?/YV+wv9lkUKltoYNLHiLTcxLpaejfXMqxlmmjkJC+QTUKl/vRgqVBYDS+SlU?=
 =?us-ascii?Q?03Bbn4QIOgIYjXCod6pEXl2rqJWMQ9mP9o1o8O+WcURybdKQ1cKXNC7Gkju2?=
 =?us-ascii?Q?K+gujlE59hIXY+ozblj9rxBYwlmmFywd1lqAz3Y835jTuw9PPKqijBJm+3WE?=
 =?us-ascii?Q?5TUU8RhG5IXkriMYwR7s1mxvWgdEEYb/j2IyMAAgLkzTLTjZKngLQcrv66j/?=
 =?us-ascii?Q?do+8tXVeVnqryJCSxG7SwklrbrRrUetqJJZleRreelYS8fCiv3ekGETdT8vG?=
 =?us-ascii?Q?4hHUpY0xIL4TonG+YC3Do47QzPisj92zCMdNCSqhRKAjqpDTms4s4SCTZOfi?=
 =?us-ascii?Q?a3lSOGsgE1nKNg6n783ZMD6YaX05WeBZVPEAgXiJB4Z4tBIoaRY87P4DBFzm?=
 =?us-ascii?Q?UImmS3KjBN33r/MyijpaUOC75E19PHmVMX80tkT1q+mni075RI6ishJ2pFkc?=
 =?us-ascii?Q?D8NSYByC7uqGWq+rRxEi0AGDl99RHm5C5kB7SyFie05AAK+2L5PGKpzSqyXM?=
 =?us-ascii?Q?j6dWx/WOx2xe14LCzGiQWY4xkObfVpTfsVqK04iJOBnZT52UjVrGfKAaGbnt?=
 =?us-ascii?Q?6e4VNpri3sJrLqRH3ZqkB8STBJNJ86GXr6vNHU5SmadkXkPVDtrRR9wdG9GU?=
 =?us-ascii?Q?cbIC/cH7tNrhsND8n66qadmAjtqCx5FrLbcEh1AKvQWYdGB9oi1/HScxTiK+?=
 =?us-ascii?Q?kQTpCSZdUyi0Hzapzf4hqVeBPWOeFJ2EF/QPQbTwLPw4aly0lDxpnDV3FRzz?=
 =?us-ascii?Q?F+sVk56R0YdVPrGrPfInHCv+nzsbnjsb+cauSwJ5pfeh4nG5bLFrxF0YM5cw?=
 =?us-ascii?Q?bnPR5TB7YbivALFyZ4TKo0RqebDSRvD+5Nexy+XbjKuf5AMYyP6Yq41nxo7E?=
 =?us-ascii?Q?EsJYqru+TYDvWCZv1i7FJ4colF3EIGGtahkHq0kVfsMQHljlmRlGdYQ9Hd6C?=
 =?us-ascii?Q?XmL7+qthN9rii/vzrHe0O0IFmCh+iZvdQ3MOmBq0ygcf86TnSiGdP/c/lOhG?=
 =?us-ascii?Q?ENjTw/EhqAmuSRDlVP1417c=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 45ae11dc-23a2-4d79-9305-08dd44bd0cdd
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Feb 2025 01:41:31.2899
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vLzJPQ1K26X7JRSrCrAJnhNuB0ui3KQGrP728B/0tqrGmBRpd0l2Py11Ahu7ycH/SkZgp26LzjcQ6tbaBMyrr3MYcnA+X1mzwB3v5aIq7TRX2XSAIKaXFihKQjAy1FL7
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY4PR01MB13000

rsnd_kctrl_accept_runtime() (1) is used for runtime convert rate
(= Synchronous SRC Mode). Now, rsnd driver has 2 kctrls for it

(A):	"SRC Out Rate Switch"
(B):	"SRC Out Rate"		// it calls (1)

(A): can be called anytime
(B): can be called only runtime, and will indicate warning if it was used
   at non-runtime.

To use runtime convert rate (= Synchronous SRC Mode), user might uses command
in below order.

(X):	> amixer set "SRC Out Rate" on
	> aplay xxx.wav &
(Y):	> amixer set "SRC Out Rate" 48010 // convert rate to 48010Hz

(Y): calls B
(X): calls both A and B.

In this case, when user calls (X), it calls both (A) and (B), but it is not
yet start running. So, (B) will indicate warning.

This warning was added by commit b5c088689847 ("ASoC: rsnd: add warning
message to rsnd_kctrl_accept_runtime()"), but the message sounds like the
operation was not correct. Let's update warning message.

The message is very SRC specific, implement it in src.c

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/renesas/rcar/core.c | 14 --------------
 sound/soc/renesas/rcar/rsnd.h |  1 -
 sound/soc/renesas/rcar/src.c  | 18 +++++++++++++++++-
 3 files changed, 17 insertions(+), 16 deletions(-)

diff --git a/sound/soc/renesas/rcar/core.c b/sound/soc/renesas/rcar/core.c
index d3709fd0409e4..f3f0c3f0bb9f5 100644
--- a/sound/soc/renesas/rcar/core.c
+++ b/sound/soc/renesas/rcar/core.c
@@ -1770,20 +1770,6 @@ int rsnd_kctrl_accept_anytime(struct rsnd_dai_stream *io)
 	return 1;
 }
 
-int rsnd_kctrl_accept_runtime(struct rsnd_dai_stream *io)
-{
-	struct snd_pcm_runtime *runtime = rsnd_io_to_runtime(io);
-	struct rsnd_priv *priv = rsnd_io_to_priv(io);
-	struct device *dev = rsnd_priv_to_dev(priv);
-
-	if (!runtime) {
-		dev_warn(dev, "Can't update kctrl when idle\n");
-		return 0;
-	}
-
-	return 1;
-}
-
 struct rsnd_kctrl_cfg *rsnd_kctrl_init_m(struct rsnd_kctrl_cfg_m *cfg)
 {
 	cfg->cfg.val = cfg->val;
diff --git a/sound/soc/renesas/rcar/rsnd.h b/sound/soc/renesas/rcar/rsnd.h
index a5f54b65313c4..04c70690f7a25 100644
--- a/sound/soc/renesas/rcar/rsnd.h
+++ b/sound/soc/renesas/rcar/rsnd.h
@@ -742,7 +742,6 @@ struct rsnd_kctrl_cfg_s {
 #define rsnd_kctrl_vals(x)	((x).val)	/* = (x).cfg.val[0] */
 
 int rsnd_kctrl_accept_anytime(struct rsnd_dai_stream *io);
-int rsnd_kctrl_accept_runtime(struct rsnd_dai_stream *io);
 struct rsnd_kctrl_cfg *rsnd_kctrl_init_m(struct rsnd_kctrl_cfg_m *cfg);
 struct rsnd_kctrl_cfg *rsnd_kctrl_init_s(struct rsnd_kctrl_cfg_s *cfg);
 int rsnd_kctrl_new(struct rsnd_mod *mod,
diff --git a/sound/soc/renesas/rcar/src.c b/sound/soc/renesas/rcar/src.c
index e7f86db0d94c3..3099180297722 100644
--- a/sound/soc/renesas/rcar/src.c
+++ b/sound/soc/renesas/rcar/src.c
@@ -531,6 +531,22 @@ static irqreturn_t rsnd_src_interrupt(int irq, void *data)
 	return IRQ_HANDLED;
 }
 
+static int rsnd_src_kctrl_accept_runtime(struct rsnd_dai_stream *io)
+{
+	struct snd_pcm_runtime *runtime = rsnd_io_to_runtime(io);
+
+	if (!runtime) {
+		struct rsnd_priv *priv = rsnd_io_to_priv(io);
+		struct device *dev = rsnd_priv_to_dev(priv);
+
+		dev_warn(dev, "\"SRC Out Rate\" can use during running\n");
+
+		return 0;
+	}
+
+	return 1;
+}
+
 static int rsnd_src_probe_(struct rsnd_mod *mod,
 			   struct rsnd_dai_stream *io,
 			   struct rsnd_priv *priv)
@@ -594,7 +610,7 @@ static int rsnd_src_pcm_new(struct rsnd_mod *mod,
 			       rsnd_io_is_play(io) ?
 			       "SRC Out Rate" :
 			       "SRC In Rate",
-			       rsnd_kctrl_accept_runtime,
+			       rsnd_src_kctrl_accept_runtime,
 			       rsnd_src_set_convert_rate,
 			       &src->sync, 192000);
 
-- 
2.43.0

