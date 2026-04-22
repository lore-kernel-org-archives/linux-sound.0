Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11011008.outbound.protection.outlook.com [40.107.74.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4320F221F2F
	for <linux-sound@vger.kernel.org>; Wed, 22 Apr 2026 23:27:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.74.8
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776900468; cv=fail; b=iDur/RSIRClkgP5vPG91f9tai1BDpCshvED6Ydvhp27qA9nxVhAUDc7YonSzUp8Lv0JJEqL0DJM0PzoX9YwiubEFJOOG3T4I4/sCDO+e/iPs9tipEpwMXj91gCNx3gf7ZOoo8VCCkl0VMmPsPXo0pYZv6u45vMyFWDOSn99Qcjg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776900468; c=relaxed/simple;
	bh=iP6jEOXavQjApXnqRoeev22vKPCFTukl71CYbzS0PIA=;
	h=Message-ID:From:Subject:To:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=pW4rlvTu/XTVXiOEbiNLvhBxFBAu4rx5YARiWJqPtEypK2D6HaEv40q6FANo0R8VBtvsUP6BD43edQz2HUYX9oqT0rlORKbvp7oR3ZBHvaMbSCtoCi6ZsXz1mfIBK59ntT1bStGL/6q3qIMFJLRi5II65Fe+zZtnQ7odzMrm0Zk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=aU71j8sJ; arc=fail smtp.client-ip=40.107.74.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="aU71j8sJ"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=H8RnhguOKIsoYCJ14mgGjcyGzgrU+ef4RrYOv00xRESezhnpgTsDSGOxbIMruLsrJqq6Md0LQSIaY2BnJhFVfgCsCsfQhgmSGNzlKVYE46xnXJ7XzPw6VZ7oibdBrsKt12C65ZZu0yDrDhwTY3bpUcq7sXn3HPMrkhjPOFBd6SjJImHR3yVc3JI028B0HIrXwc49pgefloMmHghGQzKwWxcC5BhwV0k5roIJ57a5rHrkP6oGpUf+OP/Kvr4T8vZHs46P/7O7xtB1r+BAu4HbSwAl84dWoCNvERClcUFJBSpOtf1L1fLYYQU+Ypd39BijLXzVAIqUxWX2qtumY26tDA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9UIE1JrjXNAaxTaIFd6zLmg+rZ3AO/lh40sCYWlaSHA=;
 b=h2mLQSP/ka4JcRiOpXe9FOh/mY5UkeeITcFb2x/WFZb1MdWGhKOl43ggZbNgEd7kmUHW1wbaNC00Y1oGnXmR2Vhj1XHIZFXrLLfgBLHSpaGxwGHXqCnP2OAEb9Ss5h0xhkOt7HDJxRkOE6iy5CBfcMIOsA6EZgp94pWc8JztNPx7vOaCpCEiyZSxzs8YyqCnd/EIwm+6KaNfxHpzCq2e+3NNghXoJfiFM+WbW9goiC7idz386POv67Drmr15WZGbkYwTnNkuOkkvEy+y0IWtZYq1B44kM16jzCW7kr4NdtGUu7Qe0gl+iGRJWbKx8SLVM7K1QWI3IiEGGuEJ89XWWA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9UIE1JrjXNAaxTaIFd6zLmg+rZ3AO/lh40sCYWlaSHA=;
 b=aU71j8sJXX0wMtLsM5chaFI/BpoL4a/GveA/hhHqb6eLZNPQsrysj1UZEW9trNVtA7oxpRbuL1nekqLS2WDINwTpaBASvu5azPv0oGU6PpwT3vzJnbbeklZWEFfB3SrreWG1Je+x+9aDIvPwr3Xr8ssx7nSYp3vx+Pwko+iz4PQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TY3PR01MB11797.jpnprd01.prod.outlook.com (2603:1096:400:373::8)
 by TYWPR01MB11934.jpnprd01.prod.outlook.com (2603:1096:400:3fc::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9846.21; Wed, 22 Apr
 2026 23:27:44 +0000
Received: from TY3PR01MB11797.jpnprd01.prod.outlook.com
 ([fe80::1868:c915:c230:a383]) by TY3PR01MB11797.jpnprd01.prod.outlook.com
 ([fe80::1868:c915:c230:a383%5]) with mapi id 15.20.9846.021; Wed, 22 Apr 2026
 23:27:44 +0000
Message-ID: <87zf2ubmog.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH RFC v2 1/2] ASoC: ti: ams-delta: Stop (ab)using card->pop_time
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
Date: Wed, 22 Apr 2026 23:27:43 +0000
X-ClientProxiedBy: TYCP286CA0241.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:456::6) To TY3PR01MB11797.jpnprd01.prod.outlook.com
 (2603:1096:400:373::8)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY3PR01MB11797:EE_|TYWPR01MB11934:EE_
X-MS-Office365-Filtering-Correlation-Id: 16ecd40d-d5d1-4f6a-b4e3-08dea0c6c141
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|376014|1800799024|366016|56012099003|38350700014|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	dJiJ6UJeF6zKMwP8CxhfK+DDRzd9R1r6Uwkp+0SHnoC35KozEUVGOrje6X5cLrrArGegl4pDpSLbV81MgGmv+/AwkjULt8CcFj9biXd7cudOsEbJDS+JcFQwBs+M8zebU2+iyBWzAOgcSmOXsbny5CWZaxx1GEG6LmA5A4RH16v+paj3tCjaCk0bpnnSYlyZNz/7E7eFDe099ldvZsg2q4wgs01tPRN9CD1T7Gn+xx4OMLs1R5ebDiDL4/qge70cxxqpq4J7jicscTgT0YuldzCuKobZyahJx8tBlPM/2CTpKkwd/27WsTYQ6nQ60YaAoRaBo/15I4cG6L687tegVXJrZCa8FYEtJpbPcsmvYg1oKFPHWOHKOIYfSC1nNUAhWxpgbNoF/Ft5uKs2rrsP8sWKg094gic+jHToxQ5A1J4cEa/kTh61E/gKh/vWmjcGLWUuFRUBysqGHh2iCNU4lAbnpCAz4nog+rxWosVLLRPObpNt6Kh7PAjkp7GD1/mMiqd4FCv5BnCSrRCH3hr+ABpQDxLeWD9eu/sc1aocQb4ls1Er+ilFbqM4xTsFwaUagjKOJhOgwIQCUROfNBpBWSDuG79rRASY72eLVaG5jOgb3LGxbjJUaJppB37iqLxS4tU9FrVBUSlm4N94iznS2KsKaZPeKEwLOQQQTX0QGOqKTg96x1c2oIzc+mom7kcMUKAivuSDewm30DxO1iRXdApWnht+DWyVguCH5ociQ5jimdhvJT7YR3vErskOGRjuydkBJ62XyYxC+D2vfh3/zV32Qz7XLM4nzOGMyLmYlmw=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11797.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(1800799024)(366016)(56012099003)(38350700014)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?7lvP5HEdrMNCfxmivxGd/xhidFWSL12sM2T9m5po60bGuU3zLKAfb15rUV0w?=
 =?us-ascii?Q?gITjUSbNNzKqPDTMEKsufqsrXqc8ydXCdzEK6a3/uBhx2mUvhr0B9IIIkIUm?=
 =?us-ascii?Q?FPm52GR6bQBjDJZqS191xghTpH86V+oCKbew8mmGcW4XnoogK+8eBrIlwZdL?=
 =?us-ascii?Q?7vWKXwTdZyTvZjkB/cA6+VzD46YcCkpfnFG6BMRITWo9RsY0QHnH6rYQjvHH?=
 =?us-ascii?Q?MTut56TMdUeaDhoO0dbLRv4b/8TT0liEsBP6VZUr8vpAw2yuTZX8JpmCI2ak?=
 =?us-ascii?Q?XB8gsA4WrpGuWRKh/wTqM49Sw3Th+h87JTYJaWiDYdirCDswi3FZQXq0nsgv?=
 =?us-ascii?Q?e0NUdtfPXEaBf5o5Tu5PDRnKeR4/zNvETqO9NXjqWQEdAhCUcYNprzAEswpW?=
 =?us-ascii?Q?lzuLe7dHSmjfFTnhOVdkuPcAFlKeyQQEV5+wR10Hvtia/ebf2AYkU0y1M/8l?=
 =?us-ascii?Q?DrNabd4Psk8DmCNbB4P8KKrYhE2BcaeKC0wug/GDRVLyb6EqOIGHWseCpws8?=
 =?us-ascii?Q?WIkTA45XfKFnznXiNWQHt9mn379hFjssRuO7Zh9fHf/28132GbZLcI3hnMye?=
 =?us-ascii?Q?D/bpZzolWvmQX9PxdkBUsud1E11RpaLBR9QzhgycSQJb5G6i3pf1/oIj6iKA?=
 =?us-ascii?Q?oV0+ssX22ZL23hNDkm/g9UqdHz4K0HzvRWgCDGAp3u/nPH9cTubDt0Hd8Eor?=
 =?us-ascii?Q?1PkpxSK2ygErZRUDkfHaCWYoTwvBW6kKidQ8zIwFPV0qxpRHCptkkBFLnfFa?=
 =?us-ascii?Q?BhYwBwx/mtYfZLksIqXDYZrtpCaa0nOEQ7pNFX3sg376W2gqFh9mR5Y/VsZS?=
 =?us-ascii?Q?erj8g6S3zGIaQh8Qcr8DxYP/4uwdF5Y6bLqock0eFQjQaTcTP84zR5pOWB1l?=
 =?us-ascii?Q?ypdnzwDj0ULkXlE46YYcKtt0JJoVtIu58bXHgGHYeQpbeE+R04qhGQxjG5GH?=
 =?us-ascii?Q?Ol/ZtQixSTSdrHmN4ibivJhiwdvYmrpWX2nlB7olAqmYVJFM7RgiY+EfceZR?=
 =?us-ascii?Q?ZPQiRi6aQntIClXmV+t5CYHZXnS07EanitZet2Wn7dKM6U5C58zuIjzAlo4+?=
 =?us-ascii?Q?uHKDw2PmxWFrAbQpBO7paJ85GJGFmBf4HiqPAzAfj/SMrqb+5Tp9tC821QH4?=
 =?us-ascii?Q?UCyxwPlLc0bFek/pixxvbt9ZClROQdc5aHesT3mWwtc7No1Z6AaIgdAQdKuX?=
 =?us-ascii?Q?vUv3Pj9VRwUdIHqqkv1waTA8fEq/1SI2PckQlnH3E3biAP30j+36VuJFlVGp?=
 =?us-ascii?Q?l8i5xQyyVShJqrVNt/KSSFVGnq+R9P5c0uAja24ABoa5wl8n1j5Nkzv3ripE?=
 =?us-ascii?Q?Xh3AX0DMp0vBo2/rrFgyZNZdEK7xmvVtNiaIFc5CIvCNcFyp2PXhviqcjg+Q?=
 =?us-ascii?Q?RGOOc1Ktwo/zGpd29FlLEohYJ1OZ7QIOfQnLs4/uQVZ69RRMu53kX+5i+4ri?=
 =?us-ascii?Q?/dX5mP6cr8qD96H6jcfrVgqkAArkgjXRI2oZKq5JttdZVK+U9G+7NuFfhjb9?=
 =?us-ascii?Q?+sv7g86VnbdBDzUlHjCG9N5L6r5o2NZzBsWPNSfbarSv9PzAQPN+/wUF+GFk?=
 =?us-ascii?Q?lIFCnqZW4t1TsZ/aXh4Zcohwu41vhZZ9Z4ct9CZw+WBFuZqepq7RaOfNXRYc?=
 =?us-ascii?Q?rN1nugmH+Cuu5SCsFXJuUyAVrreTyh6gIFDlfXeWkicpwoyygimbOE9wjWJw?=
 =?us-ascii?Q?+tIuKkSuNAADQsTl+FOhSZAPJ09PikiCJmM7m7nXERXdC7dAX/RU6veCnZ2z?=
 =?us-ascii?Q?SMp6ljRUT3GMiEE4rnpIBUd1aHm1bJWs+6+5Ji1VeerY0KFyiNal?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 16ecd40d-d5d1-4f6a-b4e3-08dea0c6c141
X-MS-Exchange-CrossTenant-AuthSource: TY3PR01MB11797.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Apr 2026 23:27:44.1053
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QGheSc0wGk91eaRLF5/EBiwGOovMUbjMuNvp+fdw2jzpQZfVVcJEsh3qnv9O1haVZIZ9CpBhrHcgXouPGN0BJEqNgMtsysGM/i86DLSztT6FH7sawi6lVhK1q/Xt/v2R
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYWPR01MB11934

From: Janusz Krzysztofik <jmkrzyszt@gmail.com>

A flag is needed that tells the card driver if the codec has been
initialized successfully over the modem's line discipline.  Initially,
codec->hw_write was used as the flag, but it was then dropped and the
flag function associated with card->pop_time, already managed by the
codec driver for diagnostic purposes.  Since now the card->pop_time is
going to be killed, stop abusing foreign fields in favor of an own one.

Signed-off-by: Janusz Krzysztofik <jmkrzyszt@gmail.com>
Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/codecs/cx20442.c |  8 ++++++--
 sound/soc/codecs/cx20442.h |  5 +++++
 sound/soc/ti/ams-delta.c   | 21 ++++++++++++---------
 3 files changed, 23 insertions(+), 11 deletions(-)

diff --git a/sound/soc/codecs/cx20442.c b/sound/soc/codecs/cx20442.c
index c0dc69ce4d0e7..3a1455b79cd32 100644
--- a/sound/soc/codecs/cx20442.c
+++ b/sound/soc/codecs/cx20442.c
@@ -236,7 +236,8 @@ static int v253_open(struct tty_struct *tty)
 /* Line discipline .close() */
 static void v253_close(struct tty_struct *tty)
 {
-	struct snd_soc_component *component = tty->disc_data;
+	struct cx20442_codec *codec = tty->disc_data;
+	struct snd_soc_component *component = codec->component;
 	struct cx20442_priv *cx20442;
 
 	tty->disc_data = NULL;
@@ -248,6 +249,7 @@ static void v253_close(struct tty_struct *tty)
 
 	/* Prevent the codec driver from further accessing the modem */
 	cx20442->tty = NULL;
+	codec->ready = false;
 	component->card->pop_time = 0;
 }
 
@@ -261,7 +263,8 @@ static void v253_hangup(struct tty_struct *tty)
 static void v253_receive(struct tty_struct *tty, const u8 *cp, const u8 *fp,
 			 size_t count)
 {
-	struct snd_soc_component *component = tty->disc_data;
+	struct cx20442_codec *codec = tty->disc_data;
+	struct snd_soc_component *component = codec->component;
 	struct cx20442_priv *cx20442;
 
 	if (!component)
@@ -274,6 +277,7 @@ static void v253_receive(struct tty_struct *tty, const u8 *cp, const u8 *fp,
 
 		/* Set up codec driver access to modem controls */
 		cx20442->tty = tty;
+		codec->ready = true;
 		component->card->pop_time = 1;
 	}
 }
diff --git a/sound/soc/codecs/cx20442.h b/sound/soc/codecs/cx20442.h
index bb897bcb24869..78ab1eab083e7 100644
--- a/sound/soc/codecs/cx20442.h
+++ b/sound/soc/codecs/cx20442.h
@@ -8,6 +8,11 @@
 #ifndef _CX20442_CODEC_H
 #define _CX20442_CODEC_H
 
+struct cx20442_codec {
+	struct snd_soc_component *component;
+	bool ready;
+};
+
 extern struct tty_ldisc_ops v253_ops;
 
 #endif
diff --git a/sound/soc/ti/ams-delta.c b/sound/soc/ti/ams-delta.c
index ba173d9fcba91..1775997f86d04 100644
--- a/sound/soc/ti/ams-delta.c
+++ b/sound/soc/ti/ams-delta.c
@@ -93,7 +93,7 @@ static unsigned short ams_delta_audio_agc;
  * Used for passing a codec structure pointer
  * from the board initialization code to the tty line discipline.
  */
-static struct snd_soc_component *cx20442_codec;
+static struct cx20442_codec cx20442_codec;
 
 static int ams_delta_set_audio_mode(struct snd_kcontrol *kcontrol,
 					struct snd_ctl_elem_value *ucontrol)
@@ -105,7 +105,7 @@ static int ams_delta_set_audio_mode(struct snd_kcontrol *kcontrol,
 	int pin, changed = 0;
 
 	/* Refuse any mode changes if we are not able to control the codec. */
-	if (!cx20442_codec->card->pop_time)
+	if (!cx20442_codec.ready)
 		return -EUNATCH;
 
 	if (ucontrol->value.enumerated.item[0] >= control->items)
@@ -280,14 +280,14 @@ static int cx81801_open(struct tty_struct *tty)
 {
 	int ret;
 
-	if (!cx20442_codec)
+	if (!cx20442_codec.component)
 		return -ENODEV;
 
 	/*
 	 * Pass the codec structure pointer for use by other ldisc callbacks,
 	 * both the card and the codec specific parts.
 	 */
-	tty->disc_data = cx20442_codec;
+	tty->disc_data = &cx20442_codec;
 
 	ret = v253_ops.open(tty);
 
@@ -300,9 +300,12 @@ static int cx81801_open(struct tty_struct *tty)
 /* Line discipline .close() */
 static void cx81801_close(struct tty_struct *tty)
 {
-	struct snd_soc_component *component = tty->disc_data;
+	struct snd_soc_component *component = cx20442_codec.component;
 	struct snd_soc_dapm_context *dapm;
 
+	if (WARN_ON(tty->disc_data != &cx20442_codec))
+		return;
+
 	timer_delete_sync(&cx81801_timer);
 
 	/* Prevent the hook switch from further changing the DAPM pins */
@@ -339,14 +342,14 @@ static void cx81801_hangup(struct tty_struct *tty)
 static void cx81801_receive(struct tty_struct *tty, const u8 *cp, const u8 *fp,
 			    size_t count)
 {
-	struct snd_soc_component *component = tty->disc_data;
+	struct snd_soc_component *component = cx20442_codec.component;
 	const unsigned char *c;
 	int apply, ret;
 
-	if (!component)
+	if (WARN_ON(tty->disc_data != &cx20442_codec))
 		return;
 
-	if (!component->card->pop_time) {
+	if (!cx20442_codec.ready) {
 		/* First modem response, complete setup procedure */
 
 		/* Initialize timer used for config pulse generation */
@@ -467,7 +470,7 @@ static int ams_delta_cx20442_init(struct snd_soc_pcm_runtime *rtd)
 	/* Codec is ready, now add/activate board specific controls */
 
 	/* Store a pointer to the codec structure for tty ldisc use */
-	cx20442_codec = snd_soc_rtd_to_codec(rtd, 0)->component;
+	cx20442_codec.component = snd_soc_rtd_to_codec(rtd, 0)->component;
 
 	/* Add hook switch - can be used to control the codec from userspace
 	 * even if line discipline fails */
-- 
2.43.0

