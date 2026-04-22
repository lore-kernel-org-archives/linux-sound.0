Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11011052.outbound.protection.outlook.com [40.107.74.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E2AA3A3838
	for <linux-sound@vger.kernel.org>; Wed, 22 Apr 2026 23:27:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.74.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776900476; cv=fail; b=H4IBHBZrOPrnd441KR9F8793XTLUyDGjYmus+0Hpk/M8+eV91rMzcVkmmiPxvTqGc4Gjs4vcyZbbpyW6fS+TkGqpT2/XCkGLvr21eMaChMSnnUw5pD+DPAeJ3RA54tfYOnlWY24u7WW550Nb7oP+Xt1Lmgj6cN70kXa6aJcafjc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776900476; c=relaxed/simple;
	bh=r3aIhB9k2Mp8mfUYgrPKzc0k0GT3NfWTh41lVmBwHHY=;
	h=Message-ID:From:Subject:To:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=EPaByOee0O66v390oTeey9d2yYfQcxfvsqChNS9Z6I7tN64yKVLl67T2gQg7XqA0SsZUiXipTo2QG65caXFdExYcyrVGwWWmBd6wviZBz4OBB23Hgf3sZqsUc004+g9q/bvcJnx3tY5Lv8s9t3HAUliD9ZbFQnUSaBgEcULfuP4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=P+zo2Hvu; arc=fail smtp.client-ip=40.107.74.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="P+zo2Hvu"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gCLpMVZYg3i0BgKRevhY5Wn8+QYptonoIVOrlIqlMyYVwM4UaD7Ia4c8Bzzqxwa7/4yIaqd3hBOdvUU6TcLcEGjNa+B9m6Rkempt+ohHj3dCpkbYlhxRYgjim+VheFKePN2W7t+lqv8I7zMqGRl3jc97ad5+k6BEQ6VMmAc+KhqykBFWZpolromJ7N36r4TpHI74khKH3UGTcUHiP7yKPGY3dEoX9qbQU3OZnu02O4M+jmHWUaeDrxzD2jZfxgHzJkek9fA0ftAapZRuSoh35fJnGVRUXaAZeHoUcPGwtfX8Nge6PG4s2o1Rxe16hocXWMCo8drYUkdK/JRUmr/k9w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6OmfKDgO9A/042Y7s3Uznv87bAbjYAqz6hCRVVr2oL4=;
 b=NIlre+A8Ln1EyGRt3FJg5QOMbwW3S8OcaUzPV45Ggt0cr+OmoSFF2xLfBsp++8z5bWnCF4j/FNsA5D4QoxkpTI99kNHnoTa5DSFAdn0hSxCEzRQqNiXefnjcV0V3Vz+soRRUu5lGHyOi5E3VpZWTs374eb/m0BCZ+xxI9X49kNX+T3xdtPtm9Lwi8hb7dBAbCpm/RuIgqLA+OS7R0WIwAQ9qzBUhgLo3CAF2u8+gfXYPKZ6ORWeNedT60YvtmFh362YA5edozHN27vQFECstxLNmj1Xg0zctTo8plCDs69gbA8vIHgYg8kGAIVFAX5dnA7w8VnY7CJuMPKibzMbo9g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6OmfKDgO9A/042Y7s3Uznv87bAbjYAqz6hCRVVr2oL4=;
 b=P+zo2HvunxLo3Q3c+JLQ5YFbMH5LXHOkm1dU7ZpOngPrFqJMUdQ+Txec7Xp0wlNDzO6yNvT1uRtSEQAlskY59ep2gn/mszkgomKqYGW8NVzcYqRN3pJm9uGLtpJ+OfHEf+l+Qs/xOXCq5coqaBhHV3rQr07xud4aux2/pXEIBnM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TY3PR01MB11797.jpnprd01.prod.outlook.com (2603:1096:400:373::8)
 by TYWPR01MB11934.jpnprd01.prod.outlook.com (2603:1096:400:3fc::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9846.21; Wed, 22 Apr
 2026 23:27:52 +0000
Received: from TY3PR01MB11797.jpnprd01.prod.outlook.com
 ([fe80::1868:c915:c230:a383]) by TY3PR01MB11797.jpnprd01.prod.outlook.com
 ([fe80::1868:c915:c230:a383%5]) with mapi id 15.20.9846.021; Wed, 22 Apr 2026
 23:27:52 +0000
Message-ID: <87y0iebmo7.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH RFC v2 2/2] ASoC: soc-dapm: move card->pop_time to soc-dapm.c
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Janusz Krzysztofik <jmkrzyszt@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Peter Ujfalusi <peter.ujfalusi@gmail.com>,
	Takashi Iwai <tiwai@suse.com>,
	linux-sound@vger.kernel.org
In-Reply-To: <871pg6d19f.wl-kuninori.morimoto.gx@renesas.com>
References: <871pg6d19f.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Wed, 22 Apr 2026 23:27:52 +0000
X-ClientProxiedBy: TYCP301CA0020.JPNP301.PROD.OUTLOOK.COM
 (2603:1096:400:381::13) To TY3PR01MB11797.jpnprd01.prod.outlook.com
 (2603:1096:400:373::8)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY3PR01MB11797:EE_|TYWPR01MB11934:EE_
X-MS-Office365-Filtering-Correlation-Id: 76f0cef8-32f7-4196-50d9-08dea0c6c670
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|376014|1800799024|366016|56012099003|38350700014|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	KILSTJ4TyNMPkBu2AUEQxh9ukCOXZrckA8dnzjLfNcj68AQ9AEk0WPKqL3jtHFWTwsLmlcw9ZNDjX7E4/tt3JMJuVrxzk0vONF5RRgkPp0dWjIn3uEEicYSmOgeg972SHbbqWLi80gs504qJe9bUkFsxMrqt168rZeJcjPFnJC+dBJV+5HCCQ44T14JWsos5BjE8PpCkhawlD5kihHMz/MIr5XFdMWIZG36OEhwuBuU9wz59URSRaj1Neqv7Wmky6jTm2+tLE/sJfPD5CfoRk9/YYtGBu725puuqSYau2PJsWpC/p/OSXWyGk8VBkjd8MpF1KxLId/QyFj8Jj82quX2z1pAZOwYOeMgEjoD8n+7fnTCk/L6pZC3OfxuEneuqv/lSRSq0Ru/hiBCfS5VKmHx1sbeZV1m5sKOvwKKN+DsXMLKw6PDeWT+ds3ZqnSqLmPEfnN0KJ2tlawRrsduBg4nGcPd8h0+pShqiNDILssdHBm+Hd6RaQj7LTEIsCBg79oN339f9TNFbdLEDNHtJWU9aPZhM2TANmRyLBSiSAAP+mQxe7Yx+WTSYGZ5nk9VAiGMSL/Ri2AtZXZ9lZC4OLUIX7Xx8+X75nhT2bvDCRRXvocLjvJVyQEUJw9IkQKk3OACHCpO4od8gC+Xig1yFG+xhyMG6//rolXFrj4KuWUlFlQpDzHrWBHyd8yAXmCZlvpdN2nTC5UO++62Cghr4ktyk37J6yqprErcnV9KUL6qcWNIg90j25GL0EIiRh+tsWBX6nIzSH+r3VrlTfzN8N/BZ73WWq/5T5A729AIH4Xw=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11797.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(1800799024)(366016)(56012099003)(38350700014)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?lqDbepWbxcq4HdpucZslZvwAlo5iqqGlNS5d4oTLjuEYZubNLu01v4WPD3R3?=
 =?us-ascii?Q?MZ4qCH0shy4RtkxU8phE9fqse0UcQq+RCcklQUPkYyIZXiM89/MoVENuFk+n?=
 =?us-ascii?Q?s6qfIYHnlVqs8hHC+rVbWuMuUsWoeDGMm9nAmrbVMAq0Z04HNO/JlFB99M4Y?=
 =?us-ascii?Q?86izaI/wDEhxbZaFtqbSHx0N6Ki1JpMLoDF3PkDI9XgJh2gKt+JG0n5QuTQk?=
 =?us-ascii?Q?6ewPRCWuoVsJPHis9+Ph2VXihSozz0IQd7L/2vYsEqe/QjhXp+AwYdM59rP7?=
 =?us-ascii?Q?R/SO1YVvu0jGkKJgFduYT4JAkONM4MvKDxcZpXu+2j7s2tl0WakSrMPF7do7?=
 =?us-ascii?Q?SXE6nVKhD4XKVOt6eFpBMEfQ3s3o04Q6Tvy0tchQvJGEAtTeJZw+5BdNmSnY?=
 =?us-ascii?Q?t8qXTvpU3wrsosR6opOrjicq9Q7v4jr2879Dfdwn3jUxgCIXOnL7vV7NPKTD?=
 =?us-ascii?Q?zD8JAS3dZQqYyK5SCFWe7PPCHfukFDk9V2rfbgQ6+OermsWk9OnM7n3oAKgc?=
 =?us-ascii?Q?xJJbefE3sOhoAl5HfZNyWnahE762lENWqmXxBxCj2SqyDNq6ki33n+hXDMxk?=
 =?us-ascii?Q?PNqOuLPzBBZSVQ7yoxM884VqtweF3M4powJRWgP2kDQnA+9aSZlPZDq2jIKV?=
 =?us-ascii?Q?fW3WYbySRmKGeerRxo7BtWHu5tq3ngL8wOeGJmiPOg6QFtuKbrbmujg3EwLl?=
 =?us-ascii?Q?XNXSD2y7pkK11A5b8xLhvW+wh8sUJliI3cqV1xzQL4g39nhWnyRmuL4la1ov?=
 =?us-ascii?Q?zzDMuIDVfnXRz03uZXn3vw7NbSy0TQcGB9RSGlCnBFgeX5gP4sxtteZGjlSF?=
 =?us-ascii?Q?uf8oMokukjBgOX87shaDZGzOh5gBEd6ZVIHiaVzb0rvRH3C6dWlh0clgsnM9?=
 =?us-ascii?Q?Lt0wmHUPtHqErFW07uJWdkQmGshx8weqpNI/LrsW2wfjQOh5/YpTQlMAhObh?=
 =?us-ascii?Q?RXedjGyfHrYdug6FeTPhEvnktuFFfmlIEOqOFx0Av32G5AvOXuIz8GRAvgnP?=
 =?us-ascii?Q?0VV+E0imqnRYgeNTFiylie971ucqOPpQwx8NPeNIGrpvLw2RZblqOu9UNhKi?=
 =?us-ascii?Q?oz5MMpi0QCmz0aobd7rnzlg7ol2lPLcYKRbL4EkVfh18RgYHTKzdz6C43hdv?=
 =?us-ascii?Q?w7uZNYtTH82ONttDKzM4YWLjgFjgI/EIcOiMooieTTSOg26g8D5nDzIPPnq+?=
 =?us-ascii?Q?vp0oOK2iKpfnqKX6c4yOY9pKRIMGVH7LzUg+61cZPy2+Z4gOyX1wRXbhZ1MB?=
 =?us-ascii?Q?u0iw8uogghk2j8N5LNQzK+NvWIZxwZ1fcAF5F9BZbPr3A+5CAXOk9ndLIMgG?=
 =?us-ascii?Q?2iHAoUnDJBDNdj16qQOedR7jTUfg5byMUJXYZUBHM4+HiFgc3sVdTSpub7I2?=
 =?us-ascii?Q?NNwpeg5eJrcbTA7jCbq/BF+0OHN5Nmea2N53QxKrpYnJoIPQ0IsZAaFSAY0N?=
 =?us-ascii?Q?3/f5Yja5AEl5vx9rkzJD3hB0rTwTVuLlDF9XfhHlvZ9gcisepETs/uVgjTkN?=
 =?us-ascii?Q?TeFO4p+eQ0ZqnLvlXrHDRTvxAXTUN1h2q2ZkoZ1EaTTNZLY2P3oQ32prYJGm?=
 =?us-ascii?Q?qRNw9iOWM5nVSLDVKyiC85+047GU/nmZ4XgyMQhTK6ddEzOkc88vf4R2rPWl?=
 =?us-ascii?Q?z1IvLpiColupXIbHV8jrW/h2VsEcGMs/OaaZhRuBqQnTdyAdgEZezIOBbrWc?=
 =?us-ascii?Q?8FLZXxfJioi0zfFxINz1ACgf2On+v+ypaYSeekSke4KK0p8pxGCbW4T5kt8i?=
 =?us-ascii?Q?+zGVCFKtAjxat2a95VauyrAU+J/htnizpHEXODXD2besn9m90cOi?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 76f0cef8-32f7-4196-50d9-08dea0c6c670
X-MS-Exchange-CrossTenant-AuthSource: TY3PR01MB11797.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Apr 2026 23:27:52.8048
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KUfpxSKAC3IjYH+HJQ9zJprlpOmHADRV9pEEpBCcc4m/IZcZ1pDsNyUVRzsZB07mWU7fI7/Ku+EcO6IbUVu0cMa+72FBZnGXAuO1SdSrERlT63atPvuykDCsmfdV/Bys
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYWPR01MB11934

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
index 3fecf9fc903c0..7e93a5026da68 100644
--- a/sound/soc/soc-core.c
+++ b/sound/soc/soc-core.c
@@ -194,9 +194,7 @@ static void soc_init_card_debugfs(struct snd_soc_card *card)
 	card->debugfs_card_root = debugfs_create_dir(card->name,
 						     snd_soc_debugfs_root);
 
-	debugfs_create_u32("dapm_pop_time", 0644, card->debugfs_card_root,
-			   &card->pop_time);
-
+	snd_soc_dapm_debugfs_pop_time(snd_soc_debugfs_root);
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

