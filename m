Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.228.8
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793156602;
	b=oQMWqM89LnyAhGG7z3OT0VfHCKNQMPQQsWR5XLEFm1FlGvuP+FX8UTnM5OWoWEhujsEy
	 d3IIzKVT3pD3MaLt1COxyEhOzfSbgQ0GcXeRbsRlB0BXy0ZNEUithRw1/diuK1ojz4DT/
	 2VZFSnMv+5skfpsHBEvTRqn67EU6RBOC4gnoi2U+yRIJYGvgVR57NXUnCWvR5rkFOKqo3
	 R2PwXgZyO6dFlktKvi0KVeXOg/cnv6t6NHn7M/ZkiWbmPf1ozlWrd5XfW5h4xFb/gmuQN
	 +tHjtfFvbs+Ed01NuyVipOLogVORY+rUCtkcphKNTAqdcx+aW+5sLxMEIyPvOGH1kIQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793156602;
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
	bh=A4yDeB5E/70fQhIOMBxvscCXSLjZ/a476DaBXFKagbg=;
	b=V20ZPPb4JczMoPhUUlp1EioX4gJaKTkm25BXW0gE2JpwcRkQCbiF0qc8I23RKB+eKAQE
	 aCdb49oJcGNsGLiRWkUgAbPukFvaGvyFvSljGdxA3HaYXQ014Q5EV2PnkOtd9bUPaJyex
	 cOGE/A8nm2R894u9b48jsIVdNzg1KC6BZY/qDpycg2FxuJJoLEpeLB0F3b1FIBxlw0yww
	 MYFgRwnCtb3ofZPuulhjOeKf69SS3G+wjSUNr1auzWu64B7+VU1qXXFlL9Up8oNufzVy4
	 nNqQ66mSs/w8AIZrVnvtlb4AnY8wsE+DL7egMawxXhy24uqziu+Ahzsa7f2sZmechYA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=renesas.com;
	spf=pass smtp.mailfrom=renesas.com;
	dkim=pass header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256 header.s=selector1 header.b=BRkmNZL0;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.228.8
Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11010008.outbound.protection.outlook.com [52.101.228.8])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C894606A320
	for <linux-sound@vger.kernel.org>; Wed, 28 Oct 2026 03:03:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0C894606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256 header.s=selector1 header.b=BRkmNZL0
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RRqa9CUK3kNYHem4DpBu/T2sAVENqGDz31wXyelu3x25VYQXOszOSbv4wdUVq+MoBOOnMJWDCyYBfnLmqQV+G7HXJfPK5PytW8iNXIKAT86z3aRkP092/Cuj1Bsw2kUMk10yImSghs+EpovuVcSzNZ5LOF6KvcJdPEJyyXnvIXlDPOelBhtmcNYvPjwAngyz9temU7QTZva0/KwYVQRPfN6YNIJd+ZPNl2m32Jk/KXkGm6juDSDClx5eqUZTZ5qN7N82YYXu2dJcbNum3Hz91oO1a5zp7/hoVy0zJZPzVbK5e8BZh0fFoqDirt+wvSAZxg/JUCl5gCLvkZNH5xExBQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=A4yDeB5E/70fQhIOMBxvscCXSLjZ/a476DaBXFKagbg=;
 b=TV6/L5YYnM6jXHrFGJo/B2CzxqF92jJERUodT/DIQ7kGAc4soc7kcxrhyFpkYaKdinAryTqu6AK18w0MrOlvgvaTJlNtf+Zd86J+azcH0udIbiVyTPDgFsIK73q7Lm4IyHnxsV1R54WUcYd63gK1fsRDRfCK2jYKt6QxRIYilyV8zTsGC1tk0FRpuZ1Vk8HCzknXomUuWzpD/zrL5MRkVZSGlFRKW1eI1gMQpbJScG5FEV+IGHvQ4JDhcyEuUg88VnC/eOTHK6Aw7aydFgz1NuRSFSj8rFU3zMpbxwMR8CgZ3jn1buwTpW1Y0RiJIoMUkvBvYhPhY3GcCMErf7Fgtg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=A4yDeB5E/70fQhIOMBxvscCXSLjZ/a476DaBXFKagbg=;
 b=BRkmNZL02T+0q1O44IekW29qL+ecVlK6i1eqaCXLxudscPZM+j0w8jvp+cbPcDZbo3XrlAgQjsY0n8/YkhG1mQ0rhE5qWnGHDgbfNVpfsD7I6m8+eMh8iKqbPguwg+aL1DhqEqKtNBOe7ybGShENWbBh/Sesi0ZWXtsHRJLCz7A=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYYPR01MB15175.jpnprd01.prod.outlook.com (2603:1096:405:27d::8)
 by TYYPR01MB6650.jpnprd01.prod.outlook.com (2603:1096:400:e3::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.22; Wed, 28 Oct
 2026 03:03:20 +0000
Received: from TYYPR01MB15175.jpnprd01.prod.outlook.com
 ([fe80::9bfd:a110:68f1:134d]) by TYYPR01MB15175.jpnprd01.prod.outlook.com
 ([fe80::9bfd:a110:68f1:134d%3]) with mapi id 15.21.0546.021; Wed, 28 Oct 2026
 03:03:20 +0000
Message-ID: <877bj2ttl4.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 03/15] ASoC: soc-card: move snd_soc_card_debugfs_xxx()
User-Agent: Wanderlust/2.15.9 Emacs/30.2 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <87bj8etuj5.wl-kuninori.morimoto.gx@renesas.com>
References: <87bj8etuj5.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Wed, 28 Oct 2026 03:03:19 +0000
X-ClientProxiedBy: TYCP286CA0196.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:385::7) To TYYPR01MB15175.jpnprd01.prod.outlook.com
 (2603:1096:405:27d::8)
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
X-MS-TrafficTypeDiagnostic: TYYPR01MB15175:EE_|TYYPR01MB6650:EE_
X-MS-Office365-Filtering-Correlation-Id: 2f24b460-6a24-43e3-2fe4-08df34a00544
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|23010399003|1800799024|52116014|376014|261009223027099003|261021121427099003|261021123027099003|56012099006|10067099003|18002099003|22082099003|38350700014|11063799006;
X-Microsoft-Antispam-Message-Info:
	pRZYkAllP2fHLXpCbcjCBYtWsaAgwzwpg8QLnschVx8NEguFg4nU2NTDF8KVgYkG4jQfB6WI2xQFykalfpu2CNAHdhUR5Wo+rvXogBOhHggkQ+GTC7l3S2SmLY3OjRS5AOloCPA57hwzSymkyLfYs/qAboq7owHnnbHfV2akssZtB5NcHEi+rtdisjbTtRMazmyqCgSh44MdVLKZQ9XW9fngbZPhU/EfgBFBqxt6xjou2XI5nJqXaic9+g0Do0NwEaBGxL64QoZs9mOuu6oX5zlg7NTs0qbK5BzVZgpl41Lwo3RHvMEgaw/YfsCVCk7Npgm+gaKGLhnMW+bQPXduWtg9X1OnNZ+gPZ/C527V4rIE9EkyJoK2F8j1aWjRMKEt7XlYlymIQvm/6AzAFP5AF1rKISE66VQsWvwHjJpUk+P3acnh7gVHXq4y/Sk6NlxhTlAg+LXOqXoHJkwLZNv3wmsECU4B74TL1n59xdrn3633laROxQ7UmKsUfCFSCm2fendTfrqRdzFy2HNSaijHeJaaGv7HEi7xpzt+ydHToOn5U5VMEHg65ymEMqDIToalBV/8qc7oUvYjSbXcY9gGP6tGT5IN7MMpprzhJheO/9q2qznwQltOA5MUWwKLCG4TFzwAEYXy+SKXk7XkbvW42Q3F9iqyIpT7Mqs3IyiHv006A5GwKxUQPRj/31XzIlCBJSYsQs5fixs02lj2dY6CXophGInQ2owG8Vu/T0MVBB4=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYYPR01MB15175.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(23010399003)(1800799024)(52116014)(376014)(261009223027099003)(261021121427099003)(261021123027099003)(56012099006)(10067099003)(18002099003)(22082099003)(38350700014)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?wRmqOgI0W8CwZCNmNuVEfdL+CLQBHiidCDCXUWKTRUagR6kh74OsY2hw8fGy?=
 =?us-ascii?Q?UsaiI0Sw+flG41C+4axRVlIKZ7MXAo7Z1j6y/ZTIFaJ/T0DBBaKoCbnE58jz?=
 =?us-ascii?Q?70ibcOsMdX3KKd3xQrNuB9Rb5zFraWJuk0HcrwxVN4IVaao4Fu4bMqbvxR4D?=
 =?us-ascii?Q?34ILbQ489PZSg/xq4dRHlHvyLK01Yk5DsgP4e5bSzGoP41soJvyyBhrNLKqu?=
 =?us-ascii?Q?/hP3QdAZzu34uzfKAmzeX7sT27Cpz0Ei6akmlMA4EF7D7eVnQ4VsWGU0zi3k?=
 =?us-ascii?Q?nLQYrhinAk5ckxiajszU2zYor0mOnB7d2IpmGcQLihRixkIsOEu5tWP7MI7V?=
 =?us-ascii?Q?xwkJzHKN9pkU12wB94R9Rqwt9rz8xeRuda/XKdJPjowdlzwJme5On0MWCIEC?=
 =?us-ascii?Q?Ych6UZzVoml4Khq9+l7+Ioxu1Wbfs71gFX+QB1Nb7Fstd4vc/6nSwNoa3Q1j?=
 =?us-ascii?Q?EPIO+M6EFYte6cS7JnBivY+CRtePDRBouUOmVHzDABl4zDi/iGmWeUxo99cC?=
 =?us-ascii?Q?zrszYZO6RRNym4Um2PsERNiaciyuTTSBGhGvK2B1ciIwPwg5BpEWVndDxhd7?=
 =?us-ascii?Q?DRBY9ANdCeM+YefuQyVgmh9yqk00D+7sTLOrCz6w2friqPq+/TMyAeNCmPIK?=
 =?us-ascii?Q?6wWIH/eXkKr9CRC3ZzBF5rzE4go04X2MEZiHnvRGo/5tTJjKKQ4xgSe7YkoF?=
 =?us-ascii?Q?2dwi+xWqYF44LaFG8KQ/dKy4Tnnd1fQxdayGOAEZTlGIil8rjhVuMR3Jcouw?=
 =?us-ascii?Q?TuualCIJvRTCSek25feXekcYxLBQ297s1M/RTwUoBKdDdt0a/zmq/ZzweFXf?=
 =?us-ascii?Q?sXqjYPRhw5AAQ+Oi+GzyO1yQVVmXddujjNkEESnbE2n49/UzRKIgjv0OF4Bg?=
 =?us-ascii?Q?HDsYeDdXjH+UZ2b0vOxsFY5cFIO8Fl0On6NJfR5CV0KAFp/J1ZBERV9daBES?=
 =?us-ascii?Q?nuJEMub1fe2ZK2ybDl/qAskfDfG2UqGdFhRmLoIjFzkonMxg39tMHNKqxu7l?=
 =?us-ascii?Q?btJvuPKMHeySF8/88MD/SO3UGvmHxK93bbQi+SaTRRT+Nk2eHyHczFGQ5FX3?=
 =?us-ascii?Q?F5o/DQs9dtJjnwuAarvdCA59sefC098fgWvu58W0QAiTc0WztYPm3WF226bT?=
 =?us-ascii?Q?GiuSDdPlF77r/YAD6UGByoNsEapTABRjzQFbOIEwq5y6l+/hPjK316LcjzFg?=
 =?us-ascii?Q?gHjXXr7foOJRDLQ/XvQRzbwnMfuVDKhL7EZw2W4cRa5KOhNCr8l5YOwUfGGY?=
 =?us-ascii?Q?3E2evj82pPVocLc8ivvRe+EOz/2to10vNBH88WNb/X4VGfZRleSGiz0qnLxe?=
 =?us-ascii?Q?M7YCSXVz9K4mPAabJNS2+VWxqUj3SuCWC+iC/BS5ndbzHc+dKYDWXlEzv5y8?=
 =?us-ascii?Q?gZKYzBLWX4v2gdlc4JwFBvGB7QOwndXG0IlZTJs1iGKRCiFCcnJUtjRQhW4D?=
 =?us-ascii?Q?i6Z+yyXQJCOzLQQu77z6NnMfkb5SwS2q1YVRu/RIj2zrmlIIThoGo0cDlNH1?=
 =?us-ascii?Q?XLgBOJDNfqSbEdoptAo7Y9jBMyPZ4PDuw9BJOhFSNrMVItkIHHDbVxzMDAFi?=
 =?us-ascii?Q?m0RRJN0QZpEq4Ki2JN8MNWvCv90j9tGFNAS+itaBY7CZHz/110Q3xCC7ziZ6?=
 =?us-ascii?Q?wEtrNp2UZLJvZQgpBNCCAjyiGl2v5TuPkzdDojKu9yx72+D9qZ25Fd/98KXG?=
 =?us-ascii?Q?jqTliZpsZqZ43d7bDn/V459Ol+Rcx/D/D8E342vyoG83fKVARnGzLaqWCLgD?=
 =?us-ascii?Q?7bHd0V15rmFGOuWqH4kWK9FYLH79lBw=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2f24b460-6a24-43e3-2fe4-08df34a00544
X-MS-Exchange-CrossTenant-AuthSource: TYYPR01MB15175.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Oct 2026 03:03:19.9802
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bljlnOFQzXgKD24dH/mf9xkoUq7cqv7s/Oip2/Wi4WzJSUo5Z32/vOqy0pTBFsVkiVmNrHM0yCdnRDLLw2hOgEyn7mIUtn8AdBhGMFdTmqNWxXXWAC1B5YvgFTkU2N3C
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYYPR01MB6650

struct snd_soc_card will be capsuled soon, its member will not be
able to access from non soc-card.c.

It has too many local function dependencies.
This patch uses temporary funciton define at soc-internal.h. It will be
removed all funciton were moved.

It renames function name
-	soc_init_card_debugfs()
-	soc_cleanup_card_debugfs()
+	snd_soc_card_debugfs_init()
+	snd_soc_card_debugfs_cleanup()

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/soc-card.c     | 20 ++++++++++++++++++++
 sound/soc/soc-core.c     | 20 ++------------------
 sound/soc/soc-internal.h |  7 +++++++
 3 files changed, 29 insertions(+), 18 deletions(-)

diff --git a/sound/soc/soc-card.c b/sound/soc/soc-card.c
index 7dafe22d8a789..58aa75163045d 100644
--- a/sound/soc/soc-card.c
+++ b/sound/soc/soc-card.c
@@ -6,6 +6,7 @@
 // Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
 //
 
+#include <linux/debugfs.h>
 #include <linux/lockdep.h>
 #include <linux/rwsem.h>
 #include <sound/soc.h>
@@ -20,6 +21,25 @@ static inline int _soc_card_ret(struct snd_soc_card *card,
 			   "at %s() on %s\n", func, card->name);
 }
 
+#ifdef CONFIG_DEBUG_FS
+void snd_soc_card_debugfs_init(struct snd_soc_card *card)
+{
+	card->debugfs_card_root = debugfs_create_dir(card->name,
+						     snd_soc_debugfs_root);
+
+	snd_soc_dapm_debugfs_init(snd_soc_card_to_dapm(card), card->debugfs_card_root);
+}
+
+void snd_soc_card_debugfs_cleanup(struct snd_soc_card *card)
+{
+	debugfs_remove_recursive(card->debugfs_card_root);
+	card->debugfs_card_root = NULL;
+}
+#else
+void snd_soc_card_debugfs_init(struct snd_soc_card *card) { }
+void snd_soc_card_debugfs_cleanup(struct snd_soc_card *card) { }
+#endif /* CONFIG_DEBUG_FS */
+
 struct snd_kcontrol *snd_soc_card_get_kcontrol(struct snd_soc_card *soc_card,
 					       const char *name)
 {
diff --git a/sound/soc/soc-core.c b/sound/soc/soc-core.c
index de6d9746aac6e..91e2eea30cb34 100644
--- a/sound/soc/soc-core.c
+++ b/sound/soc/soc-core.c
@@ -154,20 +154,6 @@ static int component_list_show(struct seq_file *m, void *v)
 }
 DEFINE_SHOW_ATTRIBUTE(component_list);
 
-static void soc_init_card_debugfs(struct snd_soc_card *card)
-{
-	card->debugfs_card_root = debugfs_create_dir(card->name,
-						     snd_soc_debugfs_root);
-
-	snd_soc_dapm_debugfs_init(snd_soc_card_to_dapm(card), card->debugfs_card_root);
-}
-
-static void soc_cleanup_card_debugfs(struct snd_soc_card *card)
-{
-	debugfs_remove_recursive(card->debugfs_card_root);
-	card->debugfs_card_root = NULL;
-}
-
 static void snd_soc_debugfs_init(void)
 {
 	snd_soc_debugfs_root = debugfs_create_dir("asoc", NULL);
@@ -188,8 +174,6 @@ static void snd_soc_debugfs_exit(void)
 
 #else
 
-static inline void soc_init_card_debugfs(struct snd_soc_card *card) { }
-static inline void soc_cleanup_card_debugfs(struct snd_soc_card *card) { }
 static inline void snd_soc_debugfs_init(void) { }
 static inline void snd_soc_debugfs_exit(void) { }
 
@@ -1651,7 +1635,7 @@ static void soc_cleanup_card_resources(struct snd_soc_card *card)
 	soc_unbind_aux_dev(card);
 
 	snd_soc_dapm_free(snd_soc_card_to_dapm(card));
-	soc_cleanup_card_debugfs(card);
+	snd_soc_card_debugfs_cleanup(card);
 
 	/* remove the card */
 	snd_soc_card_remove(card);
@@ -1722,7 +1706,7 @@ static int snd_soc_bind_card(struct snd_soc_card *card)
 		goto probe_end;
 	}
 
-	soc_init_card_debugfs(card);
+	snd_soc_card_debugfs_init(card);
 
 	soc_resume_init(card);
 
diff --git a/sound/soc/soc-internal.h b/sound/soc/soc-internal.h
index b844b27574c8a..550fc1c7ef05f 100644
--- a/sound/soc/soc-internal.h
+++ b/sound/soc/soc-internal.h
@@ -13,6 +13,13 @@
  * as snd_soc_xxx();
  */
 
+/*
+ * REMOVE ME
+ * Temporary definition
+ */
+void snd_soc_card_debugfs_init(struct snd_soc_card *card);
+void snd_soc_card_debugfs_cleanup(struct snd_soc_card *card);
+
 /*
  * In soc-core
  */
-- 
2.53.0

