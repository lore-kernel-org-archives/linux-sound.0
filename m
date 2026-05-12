Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11010016.outbound.protection.outlook.com [52.101.228.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 926A51367
	for <linux-sound@vger.kernel.org>; Tue, 12 May 2026 00:47:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.228.16
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778546874; cv=fail; b=L5OJdK4MdlsOg/G4prs599WSJZ/Ra8QN159b+LQqRFPlyVDcFkqhm1j7xp56lHAzRDWclwGncxo7AigOFjwBoCJ8BZ2F1W6X2s5NpZTbrSFEE6L7y/RLyYrO/dqrbAswpo0rUVSnlpXXOpAOD1Y5NvbvJZUoy6O9dJXaMJyPm7E=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778546874; c=relaxed/simple;
	bh=WOqf541HXurJFrJOceF4Vl/YBI7jJay6X9rS5fWwsfY=;
	h=Message-ID:From:Subject:To:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=s68iJgKXOGhGsQXYyPuKSu6X2+JaB9aVCieGl8WkuxjxeplQ6qP8q8Vrgm5R3uNxjOEBJInyt6hCqC5tLXijGpu3hXEnmwGdtY2cKmDu4I1CQiYNbzKMVfqkExVvVUMudV9qdXXS0dznHoTs8DtTLKO79Cg1KGfxMbsBMXQ8lKw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=Q/BOPdxu; arc=fail smtp.client-ip=52.101.228.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="Q/BOPdxu"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cT7WNWNEDstRgLWS8qCJLhGH9OchdiYn+9ixqvEbRwSVeZu3SzQIBja9eXEw15vv2mA2ZW6NJeKoedBrVYJ6RT39kyrimUpmkCYdXcpXCIGlIVsSLJmVfP8s6O37TUfg3nPtZKjK3gjLUsDkmeQlalaNQCEmqn29dfqhA8L7t/MeiDoV5a4j2fodYc9/jdZ63p64hbWmq9/NUy4t8aSrFK3rhVmzzTKV0kddKogQ6JWFJ9fJh+cM/jhhgcNFNav4w86ubqlhymHBqrGECu7TAs5tUvtetAxJ/oOm8My8eHMa+t6pd3dORHF+6FvMxXz5u9b0JBJsqTzhgHYPWOnUlw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=q4OEV8c8Bw2cuF+x7JncIpEJXxJljEkkj0CIZmFgvao=;
 b=Wh0gs+k/R1Bz+6a4Ryk/t4v8IegimS4MDjeXEgL7E1AEnw/BfRt07c0WeEfelnGDJh6Aq1FGCJ8yuRxuMTgFprA5QID1myoKtexGlgBZblgDdR57iHJeaTIG18FgYuKtxKVXgqJ/jAbhGE5jDRi6H62QfzOZfzMqZW72Bp+YLNRKDiYnXWM+hsAHiFRgAnW/FG+Ft+23kklxbubQSvbvfcTQwxC78OngdZKey7hesc25Z19shbmESCRHRv/sDjyFb0BNR/0PyDxWweLDugZEFgIVfjdQXSYu3emgZqPWPUywgI8ftx9S9D97/Xo2i0k5qg9ZSaI45cOTGTAxpdA5XQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=q4OEV8c8Bw2cuF+x7JncIpEJXxJljEkkj0CIZmFgvao=;
 b=Q/BOPdxuu2sW/mS5T+iuT0Tw0CXc766rEg5Fv0pjJTGUQlcQi5K6Obelaibbs8TcAF0jBhruQ8n4jaglmZiF8+9TRKfp6TJ+gy34s4CQih39Baa3UjGrfE8gRY9Fi2Kc/apO/y15iMcDb54shkhc9tOnYtTsn5e/XXh+5opKkFQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TY3PR01MB11797.jpnprd01.prod.outlook.com (2603:1096:400:373::8)
 by TY7PR01MB14421.jpnprd01.prod.outlook.com (2603:1096:405:245::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9913.11; Tue, 12 May
 2026 00:47:50 +0000
Received: from TY3PR01MB11797.jpnprd01.prod.outlook.com
 ([fe80::1868:c915:c230:a383]) by TY3PR01MB11797.jpnprd01.prod.outlook.com
 ([fe80::1868:c915:c230:a383%5]) with mapi id 15.20.9891.021; Tue, 12 May 2026
 00:47:50 +0000
Message-ID: <87tssdwj0p.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH RFC v3 2/2] ASoC: soc-dapm: move card->pop_time to soc-dapm.c
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Janusz Krzysztofik <jmkrzyszt@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Peter Ujfalusi <peter.ujfalusi@gmail.com>,
	Takashi Iwai <tiwai@suse.com>,
	linux-sound@vger.kernel.org
In-Reply-To: <87wlx9wj1h.wl-kuninori.morimoto.gx@renesas.com>
References: <87wlx9wj1h.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 12 May 2026 00:47:50 +0000
X-ClientProxiedBy: TY4PR01CA0044.jpnprd01.prod.outlook.com
 (2603:1096:405:372::17) To TY3PR01MB11797.jpnprd01.prod.outlook.com
 (2603:1096:400:373::8)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY3PR01MB11797:EE_|TY7PR01MB14421:EE_
X-MS-Office365-Filtering-Correlation-Id: 2a5aee8d-1ceb-4d93-7d92-08deafc017f7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|376014|52116014|56012099003|38350700014|11063799003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	t+X7FwB0UsHJ3pUTuRsrBYCRfLPJ1Y6xycn3dFO42QN/rhJPBqOZwub9Dw1zOxwFsQzgHGWgGP+h9pCjn/QpxCh6aU0yAs+Kl5YlNqn3/E71uKHwHn6QEbl+WVxHWO0ka36JX320nE8TXRJ8y2HdchkFSfcCaCqGObFhmzeRg6BfcLeUcMdU8q0eLTp1W1gh+l6stYOH5Vr0+vlkZQ4NJPgwRemFTNkYfeGicS5tLldBJ/lfE+PQf74M4R19l45em/SA+4uxrxBLS4ZwjRc8BYQWD/JpOhIrafeksW70vgK0O/vXBaqojgrTIVHX+q/GzTsZcwy3X6vataFl96/mqvS55tGtnBOYi3u4n1WLOFr/HVLapi0a9PY3bXh6Z+s47LVL/b1OvIK/1EEE6ugYYg68TQ55POcJt0kdZ+1WxiS3wmRrMMrT+9wjzrSPZhesry5wc8NZd3kqtEhFBmwNP8ObkVHulbMhIKbVD730drP63OeTAoNQmS1YKD6Ep4x06DlhQwoho6e47+kJt+Vh/uvHsk2qfaWpTpPOz6t7By7CFMho240+KnZ/LkJyAXHI3YgZ/IUzC9GJuAWTKtSqv3GImJ5qnR8Zj4bAwlWR/ZraunnZQgVpYsHDg+AfjG1NwXCTEN09bB3z4uN624z+cZTRTOUMdn9WUmI+5xAjs2W62wnb62eSNmO5Fpc1abSQBA3b/hErEuAK+uZ1csJj5v6C+2vhNmR5JYyMUDlfILIYUYhqXS/ns+3ZgMPxWfbB
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11797.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(52116014)(56012099003)(38350700014)(11063799003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?sdkeESgV9ePhPEqa9NUyJgH4T93g45iwTcjrkkbt0DfotEcEoRf+0qJvboPW?=
 =?us-ascii?Q?3/vDKK2EdCv/iB8rSdqArUvsdqbc6XJ07GR0oYMJM4OlhqSduGEyiPrOgwSI?=
 =?us-ascii?Q?kYx/vm+DIPwpJa7uvH1mWjCLO7gft8XegBejtKRguiJMoh37cvGyU7SvAiCP?=
 =?us-ascii?Q?veLYDqV9l4NMNL7zOakyUyCV4E9UWVSErhuS7ZhHoUOQ7vUAsoYsYGAap0ov?=
 =?us-ascii?Q?YFlcAJgo1kiN7j9X4BjJCD8cHRrc0PAMkxCK+RlbDm+vMJQlxVVWNg4Qxm9y?=
 =?us-ascii?Q?g8qc1cFnHK2/+oY2RqSJMTDhnwy0ERG7dIb462DTG1+QNnXkSatOJ1LcIlPo?=
 =?us-ascii?Q?uSTj6SaInIuIcadf9+PX+Tph6xlFZcrwbO/S027Q3PbDBOV3lJehGubBzdcW?=
 =?us-ascii?Q?cGJpH8cLH7szjhH8HTbNhKldW6flQE+1itwLEyosYX0sMjjxvZeqxcETdw/A?=
 =?us-ascii?Q?+89qtziEHcy4R2/wfeCmJTyYHT3/8orCbpWsnydERR6QE9OFx/3eZIa6QLu5?=
 =?us-ascii?Q?yYn8hrTdxmadtb4sJBbaAJrcZI8gMTT3Ax4ABGOQVqNGfOyejX5p6f5mmR05?=
 =?us-ascii?Q?PKEwEgB3+t7TvnALe3mrh5cZ5CVGSJ/Xf/bLuCkJNpmae3sr05O/so7mcrWH?=
 =?us-ascii?Q?U0+qd6cAwKaWPtj1Uf7PhESV2oWDiJ624gI0j5cDc2KAwGgnUF9/0IAf16aO?=
 =?us-ascii?Q?D7pbtqHBJo+ajwGKaYn+pfvYAXdR+BakrrIxEKK5mNhkbgp0MCRGe5esNe7y?=
 =?us-ascii?Q?a2L29GzpTOKQs2t2UP0t6DQJ3jBhLmCqkSaafabXtgbex83jApu2H1GmNMNt?=
 =?us-ascii?Q?rjc7/9f7C4uRE4XOKgOzaQYMoOUGpCZ5iJ6gbSf7KYyEjH+tfIIEn4pq2VEA?=
 =?us-ascii?Q?4QTR8d3X0MYer/n9Xb/lUdIUZW5Y3VHPoC7c5WvEr/8+5Cm3GhNpytn8u6Wp?=
 =?us-ascii?Q?lS9zzujAskCsLeUS3yMrrhPbZjOQFssfP3t5/Wbe4UOIm0E9rECJ+4EsamWS?=
 =?us-ascii?Q?nwrQzO09vGpCLPSNDABDwL8VzUJnfREtXJibYBL5xcrt3tW26xG62f/sVYTN?=
 =?us-ascii?Q?ixxgvJDzhU40UR3DOjbideooP2xV0Jqj3yIwod0ozrGhosynvw0nQ7eLxOg+?=
 =?us-ascii?Q?ixb8Hjg5A1yyipm7QWSCydyg1pn/Lzs6lIYQsX97+Pa8SyfchIFrwfElcmAV?=
 =?us-ascii?Q?QXcFm1mPgoCpjMFMyhG5M2huuP0iDSGhrYj4JRMAtwhjnv5psb8i/UGhT63Q?=
 =?us-ascii?Q?q/+bIWI3Ikl6On/DPEETMkrQgsaSkSshlAjM1zCM6UfhYIHz/fvEjAhApfTW?=
 =?us-ascii?Q?VwoA10QZY/58j6tymj+x8OTVc17KLCIbldzqc1ba8zN6a0lU8w0gadk8FvOZ?=
 =?us-ascii?Q?NSKc8Y2GxymO/3CGldR+lQ2Yfq+qnS/fkhD8D6Ie/8is2wZRc0t0a/6w/k51?=
 =?us-ascii?Q?iS3ZE28QtaRaYrimj755/ey+6dsM6JHCTYTqa4Y0DzBome3Av582MPypbmqU?=
 =?us-ascii?Q?2mTOfHByZDJEkeQQVnaXPFCr2NrE8Uc5Q/AEvidjjmXolYyPVdEiwW7mQ+Vg?=
 =?us-ascii?Q?esGYtqjabS4dXJH8RCpaoPFWW5Lntobw2S0vJG2MrBwJ+K5bSwnG4gePeTIS?=
 =?us-ascii?Q?AFD7ewhtBjlANTMtb9nCdZTacuk05TxTzvodZbhrJto11W4ESxEfbUVw63I6?=
 =?us-ascii?Q?RBthA/Q8E7+R/8Va0nmUaCFqsZVMyIjo5gDT0/d+4FoRBJ/BKPghqqFbjXsw?=
 =?us-ascii?Q?piq04o+G1nAEEzEyeV4QTlKzOYOWr3iMdV7pqVK5Ua6ZJwA/CXBk?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2a5aee8d-1ceb-4d93-7d92-08deafc017f7
X-MS-Exchange-CrossTenant-AuthSource: TY3PR01MB11797.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 May 2026 00:47:50.5412
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qekvRR9S1BE46Szt3/OJiQAU+gdQv3W5pwgSswoqzxutlaDtVVLsgZiX3PgMlbr65bL0DPDgXKdjxd4RA6ZF3EQScUNKRqZkwy6Qy2dPKZp9RXkgINpW6w9DvFJ0yrNj
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY7PR01MB14421

Card has pop_time which have used only from TI, and it is now stop using
it. This pop_time is used for debug, and can be access from debugfs.
Let's move it from Card to soc-dapm.c local.
This patch renames it as asoc/${card}/pop_time to asoc/dapm_pop_time.

This patch moves it from Card to soc-dapm.c, tidyup soc-dapm.c
accordingly, and remove card->pop_time from cx20442.c which is no longer
needed.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 include/sound/soc-dapm.h   |  1 +
 include/sound/soc.h        |  2 --
 sound/soc/codecs/cx20442.c |  3 ---
 sound/soc/soc-core.c       |  5 ++---
 sound/soc/soc-dapm.c       | 30 ++++++++++++++++++------------
 5 files changed, 21 insertions(+), 20 deletions(-)

diff --git a/include/sound/soc-dapm.h b/include/sound/soc-dapm.h
index 4f8fb7622a139..f24eafefbdff2 100644
--- a/include/sound/soc-dapm.h
+++ b/include/sound/soc-dapm.h
@@ -673,6 +673,7 @@ int snd_soc_dapm_mux_update_power(struct snd_soc_dapm_context *dapm,
 /* dapm sys fs - used by the core */
 extern struct attribute *snd_soc_dapm_dev_attrs[];
 void snd_soc_dapm_debugfs_init(struct snd_soc_dapm_context *dapm, struct dentry *parent);
+void snd_soc_dapm_debugfs_pop_time(struct dentry *parent);
 
 /* dapm audio pin control and status */
 int snd_soc_dapm_enable_pin(struct snd_soc_dapm_context *dapm, const char *pin);
diff --git a/include/sound/soc.h b/include/sound/soc.h
index 50d1fd110a4ab..967b68d4d142c 100644
--- a/include/sound/soc.h
+++ b/include/sound/soc.h
@@ -1081,8 +1081,6 @@ struct snd_soc_card {
 #ifdef CONFIG_PM_SLEEP
 	struct work_struct deferred_resume_work;
 #endif
-	u32 pop_time;
-
 	/* bit field */
 	unsigned int instantiated:1;
 	unsigned int topology_shortname_created:1;
diff --git a/sound/soc/codecs/cx20442.c b/sound/soc/codecs/cx20442.c
index 3a1455b79cd32..0dea84cd8ef2d 100644
--- a/sound/soc/codecs/cx20442.c
+++ b/sound/soc/codecs/cx20442.c
@@ -250,7 +250,6 @@ static void v253_close(struct tty_struct *tty)
 	/* Prevent the codec driver from further accessing the modem */
 	cx20442->tty = NULL;
 	codec->ready = false;
-	component->card->pop_time = 0;
 }
 
 /* Line discipline .hangup() */
@@ -278,7 +277,6 @@ static void v253_receive(struct tty_struct *tty, const u8 *cp, const u8 *fp,
 		/* Set up codec driver access to modem controls */
 		cx20442->tty = tty;
 		codec->ready = true;
-		component->card->pop_time = 1;
 	}
 }
 
@@ -379,7 +377,6 @@ static int cx20442_component_probe(struct snd_soc_component *component)
 	cx20442->tty = NULL;
 
 	snd_soc_component_set_drvdata(component, cx20442);
-	component->card->pop_time = 0;
 
 	return 0;
 }
diff --git a/sound/soc/soc-core.c b/sound/soc/soc-core.c
index 1d9099595a88e..2c05299604b33 100644
--- a/sound/soc/soc-core.c
+++ b/sound/soc/soc-core.c
@@ -194,9 +194,6 @@ static void soc_init_card_debugfs(struct snd_soc_card *card)
 	card->debugfs_card_root = debugfs_create_dir(card->name,
 						     snd_soc_debugfs_root);
 
-	debugfs_create_u32("dapm_pop_time", 0644, card->debugfs_card_root,
-			   &card->pop_time);
-
 	snd_soc_dapm_debugfs_init(snd_soc_card_to_dapm(card), card->debugfs_card_root);
 }
 
@@ -215,6 +212,8 @@ static void snd_soc_debugfs_init(void)
 
 	debugfs_create_file("components", 0444, snd_soc_debugfs_root, NULL,
 			    &component_list_fops);
+
+	snd_soc_dapm_debugfs_pop_time(snd_soc_debugfs_root);
 }
 
 static void snd_soc_debugfs_exit(void)
diff --git a/sound/soc/soc-dapm.c b/sound/soc/soc-dapm.c
index d6192204e613d..10f5fb771e301 100644
--- a/sound/soc/soc-dapm.c
+++ b/sound/soc/soc-dapm.c
@@ -40,6 +40,8 @@
 
 #include <trace/events/asoc.h>
 
+static u32 pop_time;
+
 /* DAPM context */
 struct snd_soc_dapm_context {
 	enum snd_soc_bias_level bias_level;
@@ -161,14 +163,14 @@ static void dapm_assert_locked(struct snd_soc_dapm_context *dapm)
 		snd_soc_dapm_mutex_assert_held(dapm);
 }
 
-static void dapm_pop_wait(u32 pop_time)
+static void dapm_pop_wait(void)
 {
 	if (pop_time)
 		schedule_timeout_uninterruptible(msecs_to_jiffies(pop_time));
 }
 
-__printf(3, 4)
-static void dapm_pop_dbg(struct device *dev, u32 pop_time, const char *fmt, ...)
+__printf(2, 3)
+static void dapm_pop_dbg(struct device *dev, const char *fmt, ...)
 {
 	va_list args;
 	char *buf;
@@ -1872,8 +1874,7 @@ static void dapm_seq_check_event(struct snd_soc_card *card,
 	if (w->event && (w->event_flags & event)) {
 		int ret;
 
-		dapm_pop_dbg(dev, card->pop_time, "pop test : %s %s\n",
-			w->name, ev_name);
+		dapm_pop_dbg(dev, "pop test : %s %s\n", w->name, ev_name);
 		dapm_async_complete(w->dapm);
 		trace_snd_soc_dapm_widget_event_start(w, event);
 		ret = w->event(w, NULL, event);
@@ -1909,7 +1910,7 @@ static void dapm_seq_run_coalesced(struct snd_soc_card *card,
 		else
 			value |= w->off_val << w->shift;
 
-		dapm_pop_dbg(dev, card->pop_time,
+		dapm_pop_dbg(dev,
 			"pop test : Queue %s: reg=0x%x, 0x%x/0x%x\n",
 			w->name, reg, value, mask);
 
@@ -1923,10 +1924,10 @@ static void dapm_seq_run_coalesced(struct snd_soc_card *card,
 		 * same register.
 		 */
 
-		dapm_pop_dbg(dev, card->pop_time,
+		dapm_pop_dbg(dev,
 			"pop test : Applying 0x%x/0x%x to %x in %dms\n",
-			value, mask, reg, card->pop_time);
-		dapm_pop_wait(card->pop_time);
+			value, mask, reg, pop_time);
+		dapm_pop_wait();
 		dapm_update_bits(dapm, reg, mask, value);
 	}
 
@@ -2392,9 +2393,9 @@ static int dapm_power_widgets(struct snd_soc_card *card, int event,
 			return ret;
 	}
 
-	dapm_pop_dbg(card->dev, card->pop_time,
-		"DAPM sequencing finished, waiting %dms\n", card->pop_time);
-	dapm_pop_wait(card->pop_time);
+	dapm_pop_dbg(card->dev,
+		"DAPM sequencing finished, waiting %dms\n", pop_time);
+	dapm_pop_wait();
 
 	trace_snd_soc_dapm_done(card, event);
 
@@ -2561,6 +2562,11 @@ static const struct file_operations dapm_bias_fops = {
 	.llseek = default_llseek,
 };
 
+void snd_soc_dapm_debugfs_pop_time(struct dentry *parent)
+{
+	debugfs_create_u32("dapm_pop_time", 0644, parent, &pop_time);
+}
+
 void snd_soc_dapm_debugfs_init(struct snd_soc_dapm_context *dapm,
 	struct dentry *parent)
 {
-- 
2.43.0

