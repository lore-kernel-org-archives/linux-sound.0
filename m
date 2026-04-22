Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11011029.outbound.protection.outlook.com [40.107.74.29])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6B6539DBCA
	for <linux-sound@vger.kernel.org>; Wed, 22 Apr 2026 02:56:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.74.29
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776826584; cv=fail; b=UYv5n1q6vOO8XJZHe0n3kP7uHNM2+KWaQGB+PYoyvWHb30uwxcfKydzSGSq8+aQT9ubjqfx3W6jG0YMKw0lX75nHO6LippIDpvfS8H27SCJW+GVTV/aW6RNkxieGyCKapLUUTeEFNDqOKwszn6oI44N1d3Gp6S6YOrPbl64EHDs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776826584; c=relaxed/simple;
	bh=atkqW+pHnTbYActx9QmIT/xbJ35rK6vOHJgPRsOrZxc=;
	h=Message-ID:From:To:Subject:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=YaXJEeXZdBKL02pZlvYWCvGslPKCU4WafBIefK8JOqEkYJAy5dS2mMB56Nbp1XXJ8AHy9B142ajQOryKDpNaPFHplZ/VRGSmYtHBB3PKIfT+DIsvy2fd9yBoCW13OkUF+lPxGWhhfmjDy47vwAzunJu0e7sxFiNe073r9yKlQSg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=mnSl0nHl; arc=fail smtp.client-ip=40.107.74.29
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="mnSl0nHl"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nmca1Rp9dvt9A7YAY6j3TmK6OpxAJrRc4cjQlik4bpqKdSc63JEsy6SUpy1yXRDJXyW+Wwznc0YDkODlrDUBBe122v4T8rL2kwR844TxrmraBgkpTChih8mPez/9twbyztM6JZgKZGdOXT26oREaEdMvRE0Vt8l9JGogYikLOYSOGcKOvrmEPtmoAUE77ewpyXf5pgUj4EDIX/cFC8QvevvHVEOsJjgMUGLrMkcL/XLWGGpPQJCLzbf2XpJoVQBwEbmd8VuVEEkJCn0N4Eus9P6+/3VV76gWhdYxQ9krk6K1NZFbAKNg/aOAiortc6Dgv5hKldwy0oLSiP8koBRZJQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+c9YDsOYWKQInu5KURkDvlawduYmwJjWeOlyW3nvW2s=;
 b=WBK3hZjJGyoKffhDPvG5LkT0Q8dtgF6a/ZxQDTNQ04Gh/qc/vlXaNTRr9QYmNDlFvuVnN2oPLF9yKG2cUm4mTo6MdRhyFrgUhD6cNeRD/xxmzBWb5o/WZ5VXiq3vJ7Qa7IH33t8V1eSifJjCf884LCB3r1AMZwiNHB0PuUWx8jutQxegHZFflMGLBoyHhZPdliTm/u4PPAakBl8iGfe/YAuInh5cu27vsAQmx0GYUFatyvAXyachGT9uFKmxQORC309CQlhJA/H0M9dZa//lnNm2vfbNs8oV7TeEv1LADQMz1hEBDIZ5WkrFAGfeePyu85LoiaRWwywVidBwGFX9lQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+c9YDsOYWKQInu5KURkDvlawduYmwJjWeOlyW3nvW2s=;
 b=mnSl0nHlPSw6h7vniu1i+qbpILyXtNgmYai75aCe7WRhXx5og6fnl2RFlIK9tfYtioeE8s+0GYTevbnufFXPZgEdeJrFH0DiM40jsUc2J8iEdBOneQPBMNMkWtJyqM5l4ZSVNTHEnY5ZAw5TB1M/gBsdBXiuJPmXzMDLFXhL0go=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TY3PR01MB11797.jpnprd01.prod.outlook.com (2603:1096:400:373::8)
 by TY3PR01MB11763.jpnprd01.prod.outlook.com (2603:1096:400:40a::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9846.16; Wed, 22 Apr
 2026 02:56:03 +0000
Received: from TY3PR01MB11797.jpnprd01.prod.outlook.com
 ([fe80::1868:c915:c230:a383]) by TY3PR01MB11797.jpnprd01.prod.outlook.com
 ([fe80::1868:c915:c230:a383%5]) with mapi id 15.20.9846.016; Wed, 22 Apr 2026
 02:56:03 +0000
Message-ID: <87fr4nk8jh.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: Janusz Krzysztofik <jmkrzyszt@gmail.com>, Jaroslav Kysela <perex@perex.cz>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Peter Ujfalusi <peter.ujfalusi@gmail.com>, Takashi Iwai <tiwai@suse.com>, linux-sound@vger.kernel.org
Subject: [PATCH 2/2] ASoC: soc-dapm: move card->pop_time to soc-dapm.c
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
In-Reply-To: <87ik9jk8kd.wl-kuninori.morimoto.gx@renesas.com>
References: <87ik9jk8kd.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Wed, 22 Apr 2026 02:56:02 +0000
X-ClientProxiedBy: TYCPR01CA0121.jpnprd01.prod.outlook.com
 (2603:1096:400:26d::8) To TY3PR01MB11797.jpnprd01.prod.outlook.com
 (2603:1096:400:373::8)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY3PR01MB11797:EE_|TY3PR01MB11763:EE_
X-MS-Office365-Filtering-Correlation-Id: bc5f2632-ab9d-4f63-0d72-08dea01ab0d6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|52116014|1800799024|366016|38350700014|18002099003|22082099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	CHb9Lq+EqiOLntdd8eC3TeQWA2yzHburO3UxTH5sA8G90S4713k0mcBIOnZsA2Acf72GQZwIG/U+THV5m8deTuhRZQjHFcN2+r7gN9gKglkF6nBwgPpoMY7bavtYblKvW/p8GMuHwK6VjgKLS6zDDMC15fZ07Axj66nXwgkKJHHrNq6q49W/We3LYo2hdLhKAoyl3ZXJ4o4DkzBquRsTQ/gCf1XSZZGTblga2q5vdjnMKNTXTAeSFFks+83zS+ouisLMc0Kd+EAcqMX+3Rt4IOrFHG6Dzr+OHEvA8fotXrUxzs843+Av/DBm0dkQoxE3MLfpcpz/OGPC6u8GCE5jZLAuOeCREvuc5nPwQ7dJqzPysUnUTFXq4iTW3CALFLwlFm5/f265uHYbIVK7Nb3YU8PwrBN0wEn0yS8QF1RKsmqr9WjfJVPXn/oaRDOIiiskibrpaZLKMmxfJW/lw993m9zeqtbX/t+z6pncpD3F9LxtcuFyTC9K1j0ITvTbKVmdTHfVN8Cau3lXHd880vu4HxXd5oNq/9ZDfr+tsjp5N9A5b1fzqMAgndUOyNOMmxbFiVtrIJRLGRb5RCTFOYiNJUdd2J2/tvkdXHfF3whodpYkoXmwI9Nwtaw1FGJjz/KMCRTJfAJPxlZ4dA1kLcPI1uqKHGZqNHf8llw3Ynfvd1VUpSEIohNlh5HeONlX0hfpeiOddER/qZQR6qVcnxNtRMHSnSrlqSDOFsB5flxs2YORcD7XjVfydJQGu3tHN2Hb1XDMwKqT9L1uteJ+fY9D4cHRWR1qzl2wfNeSIY/SEWc=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11797.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(1800799024)(366016)(38350700014)(18002099003)(22082099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?PoV7WogaMT9Y8Pxc3KCd7xO9nGJU72FURIhEaqvnwSAqMkrUZtf5e4CF74UU?=
 =?us-ascii?Q?BIQ+XAD6PBk6tjl/BNGMIwKY6XwYj/5fft9YfcLXrmSiMZ1YZppQwEayQ7p4?=
 =?us-ascii?Q?+wVw2BhFA7Mp8IIB6srwXQ2AogEcjQ3zxfiN93AJvsS/ycfcPm3hfB/GXV+9?=
 =?us-ascii?Q?c1WLSet1s+DgUxlYHl4LvS7uHKeoEPbnRkNP5I5T6zLUiYUbmyNtLzc772v2?=
 =?us-ascii?Q?eKed1SuTmJK7vNVx7D7eOGEcjdPt1waZCrdcIvDvvUYQFopXvc0P7W1QWaPg?=
 =?us-ascii?Q?PyNFU8Pna6JBTtnVHG/bx1g3srQ8lzWs5zZ0E9kbs4j8gycXsNlrIunxc+c+?=
 =?us-ascii?Q?vS8bawTm4U3zf0b/dLifNfze/ZdnGFN3mn0zGoIVjLH2OykVb1lQDc8Qdhkq?=
 =?us-ascii?Q?zSSrUJi0U4Qv8rMKRzeK/Nr7xJeL8JR0Fvh9n1jefS6EeUAoRvWCQKGN2NZZ?=
 =?us-ascii?Q?RGMuV+oHoh2AN5ySZTiguwPS9tHhhaAe71iCKssLIys67mGs5OyMX13B/bpP?=
 =?us-ascii?Q?K9eShZHpEdJOHiOCQeDEzml0iJdyoPUW2nzjVsh7hPGmjQofY6oHYfhE6RHB?=
 =?us-ascii?Q?hrQdwUn0+vaBFAsL2S5ue7p/lU4/cufNiNa9fnxrWUA7jwdeVzl4iILKVkdF?=
 =?us-ascii?Q?ZmEBy060q6qnEdp6fXEvobfohuqS7EJvOHW8Uug9QG+ukkvj+6S5OFdcQ9py?=
 =?us-ascii?Q?4vjlTtBz7exQC2mBgiiHLHTseD+Zs0ynY3mGhHEZYCrGDl3YQLWSuW/AdOYY?=
 =?us-ascii?Q?PQlzldOAOcS9xGNSK4o7bqkBCgV+sjo9OScjM/uqW2cedd8l9vm5MjmZ9Eyf?=
 =?us-ascii?Q?aIlUhSjEznQp8o1dsOiopgM+YEpYGvzgPoa/ndsapFJ0qgPCQ6IfLOAC2FYl?=
 =?us-ascii?Q?qsDuhAxvwL55jvnSh5iRGbcOvZcW/MEEBObmGE+pGzL14a5Fh1Wh8qdIpeim?=
 =?us-ascii?Q?2EqSAKQwF9a9BFBuDCfUzEF4solDkHlMxz5iKHlC5hnJsnqJAV2rUMHlK2zB?=
 =?us-ascii?Q?Pqj93kYjrVWmXHHLUIb09tQZHhpedY+OJRpWYKwRWnUx9+btyKQbR01UJ3wJ?=
 =?us-ascii?Q?qLwhnyCoj1nGZRTUfE0bBb/z/jJkHceY5dZPtmol5MHj9i09AkDdUbb6Pynm?=
 =?us-ascii?Q?4reC8BSDOeLaxS3SmFKhYhV/2YCyGZKjOtYMKh1Z+S1CyHRymovLORxb9/U7?=
 =?us-ascii?Q?MdshXNJ6XkN2OFhoYAZ0DUC54UQxxjPqg4UMySFmq3ybEaOIDj+1v82cPAWB?=
 =?us-ascii?Q?XIbvaCfBH+OAO8LPytrOyGszTKGEfCgb1LS0SJ2W4UAk+djGqJSeQG93TNV1?=
 =?us-ascii?Q?Pn0qip0GDkvquA2RXHaQUszqR07eFzyZ8KJ3tGxfvDKlUTocJU6Qj54BgxSp?=
 =?us-ascii?Q?ZK7KKLnjQ7NL34GAZ7SJjpJfr3+nHQ7Pa5OOjBEOVrqSlDdQbUYkrlgeTQjh?=
 =?us-ascii?Q?6xEAmmDLNCz0xheGRQ3lFPwLQPkMyDZhIFJ9G4+4cTjP7nxeAWBVnuyLZb+P?=
 =?us-ascii?Q?XShEkzI7tPY8LkSp2ruTZuwEjZYSbFprcm35wekCwxUb1gf6bPGlf3G1xhSX?=
 =?us-ascii?Q?jjUz3+F58YuGjFm3Wt31PJIUQVw6Ju5blZGRIBH56dDFYAY/vwrZEe4MDDwW?=
 =?us-ascii?Q?OdVOVoV+JVS8z1KFFleTmE2Pur3VUJNPh5hn6Ze23PWm5cqnsVUTwluCexEj?=
 =?us-ascii?Q?flBZGH8S13/QVw2JB3FOVc7N4h3ufdSHixkX+G3ceD0JwFnbKDXKc4bu+l+I?=
 =?us-ascii?Q?8WBZGbEhOAElS9dBaxzvyZeA47sIqj1YD6kmRjyIvlPIFqOO/RzM?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bc5f2632-ab9d-4f63-0d72-08dea01ab0d6
X-MS-Exchange-CrossTenant-AuthSource: TY3PR01MB11797.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Apr 2026 02:56:03.1105
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: I8kuxl9A79XzkPMqMGe0VBKLdhl3kDkMlMAd65Q3cDY1PgknvtVvzbqpQnKn5Puj1neBzpHtK2yUI1gIjB65qeThhY5nETcirDb5jb6rrVc8/gfp5VKk7/AVTUKAO7k1
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY3PR01MB11763

Card has pop_time which is have used only from TI, and it is now stop
using. This pop_time is used for debug, and can be access from debugfs.
Let's move it from Card to soc-dapm.c local.

This patch moves it from Card to soc-dapm.c, tidyup soc-dapm.c
accordingly, and remove card->pop_time from cx20442.c which is no longer
needed.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 include/sound/soc-dapm.h   |  1 +
 include/sound/soc.h        |  2 --
 sound/soc/codecs/cx20442.c |  3 ---
 sound/soc/soc-core.c       |  4 +---
 sound/soc/soc-dapm.c       | 30 ++++++++++++++++++------------
 5 files changed, 20 insertions(+), 20 deletions(-)

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
index 5e3eb617d8323..453548988d381 100644
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
index 3fecf9fc903c0..13e933d2883e8 100644
--- a/sound/soc/soc-core.c
+++ b/sound/soc/soc-core.c
@@ -194,9 +194,7 @@ static void soc_init_card_debugfs(struct snd_soc_card *card)
 	card->debugfs_card_root = debugfs_create_dir(card->name,
 						     snd_soc_debugfs_root);
 
-	debugfs_create_u32("dapm_pop_time", 0644, card->debugfs_card_root,
-			   &card->pop_time);
-
+	snd_soc_dapm_debugfs_pop_time(card->debugfs_card_root);
 	snd_soc_dapm_debugfs_init(snd_soc_card_to_dapm(card), card->debugfs_card_root);
 }
 
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

