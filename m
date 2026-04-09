Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11010007.outbound.protection.outlook.com [52.101.228.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B7D2F9D9
	for <linux-sound@vger.kernel.org>; Thu,  9 Apr 2026 04:37:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.228.7
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775709440; cv=fail; b=eqTL5aqOwHtmViJ53GorYueRmAukSqzInO0mGmjEhfqLghKNEE21EpkvDeexPZqtrOwdA7fnGTBKxtkM2RuC7d9ki7OvcYDWjK+e+Yo0ECU7AjibogwwlBSp2c0MH4Cow9QDy/IkPBG5YtiPuzWnM8I772iOP7ZwNIppoHwC1Xg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775709440; c=relaxed/simple;
	bh=1w542PGQ9RGWA/0FSNFZ28nqI1x/uuEb6IDDXCCFvSQ=;
	h=Message-ID:From:To:Subject:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=ROAqwzAbGaE57Xp6WbvdHBaslxpCRe7/ssKLTT2gbgaF+zy/qj4f8z3n4mqGL7yvluiG7MtQ0s0WIcYLbfIH+xiyJPFxQUNUMf6n5Noc6O7/un03lsZF3lYbMoc2ZjpYz1V7O0ErceDSOs3fv6lE3f0Iw7sOBuBfb+eU41gNOgQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=F893Tele; arc=fail smtp.client-ip=52.101.228.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="F893Tele"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZnnTrj2AGPUK6DW7nEr34p/7Fm3eW9z6/CRCgf968q6WuKD4aV1N+Cx2EI2qHAOLn9l8dYj4qwJIXVUTe2xZCtip0W8Y0JV04rAAjay0iXczgmPqqxRCoTcdm+cHmRuRVYmhRisOND9KW9qS0OV6Odgvxth4SqG+7wtkIS6AeK+dX3BIbnLwbFO9QjTYiMU7HY03zqmwQsDwVWTGASVGcnqAdpkjVf/dXWE+QYrMRJv+EVTGegRgR2zY5U9zavbWeRkDh5xuxjI9E/MAb9tMoc6GzyqCm5SjazWmFMqQ+YQyvXy3NLv+lgq1QfZgZUw8poKAUqMSQKUdZ0+/q9glcg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jpB6FkCRabY50zWDQx3gzDNAqApcORXC64Vp2sGjdUo=;
 b=YHG1+tdf+JrNfvAuP/bKxXp15WlenMnTHl8qzuWn7DhQHpOZ4N2rAy3XD/DVpYmW0zG/sPtujvGNfg68UEgQonRAhdjjmgO91JXTPiSK3dwMyRYFoE+5YihWlz8hZ9B5UZSGzUW4sJ23wjJA/b+OEGPRuP0yP4l+Hu39PUpQah06uiTeDA5u8pGuL4a2Qg2yoLBdNUiQq8aXYkb54xyXD2H/O2Q10njllMDJmaVIeRGNt7Ux7SoiQnG3AgW5Bxrd4OL0/VN+tKcke4HbVr4+qfi1LxAHodrg0GcAgrX8/KyC8TycT6uB7m8OiBmkv4xPLqNk2yKGiAzG1PZF3RX2Yg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jpB6FkCRabY50zWDQx3gzDNAqApcORXC64Vp2sGjdUo=;
 b=F893Telex8Q5zIRMtxFoBUSQx+0jkGbCnepnMRDQHjgkFdnX3Bli4KqUvLAIpapO/uEqTzXpQwjsLE1vHhljnghpYNIlcOOYXRIk8xpFNSi9EkGVId+rVURuPzaEg4bLWUJ38B2eI0kx6YgyY0ieouQ8JDnxCCYuje6gEpiEO+U=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TY3PR01MB11797.jpnprd01.prod.outlook.com (2603:1096:400:373::8)
 by TYYPR01MB16304.jpnprd01.prod.outlook.com (2603:1096:405:2dd::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.17; Thu, 9 Apr
 2026 04:37:16 +0000
Received: from TY3PR01MB11797.jpnprd01.prod.outlook.com
 ([fe80::1868:c915:c230:a383]) by TY3PR01MB11797.jpnprd01.prod.outlook.com
 ([fe80::1868:c915:c230:a383%5]) with mapi id 15.20.9769.017; Thu, 9 Apr 2026
 04:37:16 +0000
Message-ID: <87fr54da10.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: Jaroslav Kysela <perex@perex.cz>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Peter Ujfalusi <peter.ujfalusi@gmail.com>, Takashi Iwai <tiwai@suse.com>, linux-sound@vger.kernel.org
Subject: [RFC][PATCH 1/3] ASoC: ti: amx-delta: don't use card->pop_time
In-Reply-To: <87h5pkda1r.wl-kuninori.morimoto.gx@renesas.com>
References: <87h5pkda1r.wl-kuninori.morimoto.gx@renesas.com>
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
Date: Thu, 9 Apr 2026 04:37:16 +0000
X-ClientProxiedBy: TY4P286CA0061.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:405:371::15) To TY3PR01MB11797.jpnprd01.prod.outlook.com
 (2603:1096:400:373::8)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY3PR01MB11797:EE_|TYYPR01MB16304:EE_
X-MS-Office365-Filtering-Correlation-Id: d0cacf52-f1ea-4450-60b6-08de95f1ad7f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|52116014|376014|22082099003|18002099003|56012099003|38350700014;
X-Microsoft-Antispam-Message-Info:
	XslM9ZutxeC7ZEhoYC4jJdlQgF+T1ypYKd0rl9YXhKVBg9CCFsi2GXZqunxcngJSJWPrEodz0pcV7LqHydH/M1KzdP2oqBcRzxZ4IAeh9hNInfhMiG3Fe4NZRxPR3CU6IjH0yiuiyW8PzPazlm2t2PwpPQDawLpu+0RVpzgEwg8FxKwezVPwxBuyd+A4bLuHhzWNZe8P3vLarSRgYf30QrNc+wHXeas4f7vZ7SJbeXC4rNhlrzCcAIJQt0hQOAFd/MlN2rFgrgJqHY0L/mOkQtppZ4FQwztCq1N+cJ0/SLW7N+fNsEKqZ0wZY+w8DVzYW0r5Ndans9vIt85Xwu0Vsx4sxqaFHDHcBaTA0VkIGB8pWErtqCGDRtMqDTEmOrIFkaRva1KNr0/k5b+ueTEJUWdcEP0BW1OBqrekUFXpAEJ73ihxs2n46erdc8OZbipmFSLlOdefOXhAob3CE+53G4FiiBNp9fgtHYPexq81KaNSj0wpz1sPGg6bpRO4R8cIbFQ9AbZ8CRj0psToEVO4o+fPr647Jy8msUx6tONM5EnKln621PquGLKGyNP8flJYHBCAc/PQHM0YbN5BPdkQKg0gacQSdY07SKhEUk1q5MvCMHUS/fEndkgGBOD2UhyKjkJBNshaVEXpRhXMRwlJ+HW53JqltDsdM05GCVb6Vu0gr+ZHpz1fuYlvTTR1xw4kLYbCrjeqY8oKTHtmehx2zArtMj5GfelUjSL2ZtWLY+ZHLO2zko8Rb0AErJoVcI45cbOgXZ6MzrNJDMTXfcYLhWPUVuDqMJMR3tj6jAN2MiE=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11797.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(52116014)(376014)(22082099003)(18002099003)(56012099003)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?IpD+3YDe4uhOJFlHE6sR6FJOgPyY2MeeDrapgB45v91bvj3app8aGv4avdRt?=
 =?us-ascii?Q?bvFXg3Re9yu95ZNrBfVeyrE9Rc1eM3CDaQ58NeNGgGmYoO4FSOtCEWcssdMg?=
 =?us-ascii?Q?0/f3DPKmEyl5224f5xpo0H4zXNiisq2KXQf+uPZ8RZi2ZPzmOWH/rBM39qym?=
 =?us-ascii?Q?1fHaQYRq1714A7r4ZyOi2q4SqfGZiSKNSpU4XEFwJ2TnlntqGY21B7yusmpe?=
 =?us-ascii?Q?k3t2CkJSYeYnrnZ6GQS5ozwiagf7PTci8b7rvHXOigAseT3NFMR9etXi7kGS?=
 =?us-ascii?Q?mbw8fXnU6I0DbcUO5v6I7DYR6Q6E5+mDPpzzltYdN97QQjCnp9fHh/ZESrzv?=
 =?us-ascii?Q?HeFIBVqU0UycE00msOTN6LH+jj3YbLNvC1OGOM4iFREWMkzBL49OfZ7yZJOD?=
 =?us-ascii?Q?/jFckIjVQmJeRqOmczHJc78MfsthIFxeVUG8cbgQ2AbRGdQDQDqs7y+kFvOW?=
 =?us-ascii?Q?UUVjUL6Lo/AJO+moeuYRyzZqczawqY36U6exvZVBDVHXqpz5NyRGLyTI5xbv?=
 =?us-ascii?Q?98/FU5527mlbXmOQEKPscS8+R67FbKlqQptHQqQO5yEz/Rc1bnP3BsSs2N5B?=
 =?us-ascii?Q?QBaLXzq77mNzYIcm7TtajbnURGSxH4N6GvRcMaSkwtnUXV6zJTmpS/S0cFiO?=
 =?us-ascii?Q?Z2i5RA2ubrmcUAEcc23hg+angTB+t7T6UQcHrswnOFWYLM9wmcZTwsNwfrPA?=
 =?us-ascii?Q?5RTbHjJzLmRHNHDZIvzGPA6ZYZlFHdjSGKGoF3qcvrt7iguyow+s3IDa3bEQ?=
 =?us-ascii?Q?RGChfRNvrbX/6toSi/cUo36JFLKht9HGzmdGCW/fLEKMIwjjlMubW4NIcvLc?=
 =?us-ascii?Q?BTD/M/3P3/VnDL1nqX6FDsA7LQpC7970jWSb2eiBpoXtQUhFDS6Do4IZY2K3?=
 =?us-ascii?Q?tc/YngL0ddX1fbu2pGGq3NcfN37OXLsAPBiK59dGJPTEVcF86lzTerUk7CaG?=
 =?us-ascii?Q?aogF5Gi0m+roe9muSQypvEKClUltO9MGckjWceEC9KWVCaVLpBdkc6Pu7hmo?=
 =?us-ascii?Q?3H0IXzPX9xlvLUtWo6kewqUYdWwV3eux0ajjUAbQmB3UIQsYHSnP1kw9hni2?=
 =?us-ascii?Q?CsP/kHggW9Hy+fueMeup0YHBKOf6flEX7LeQJbb5nHiof7XLE+x7dOUKWfwK?=
 =?us-ascii?Q?yVLOj45giIIpag3EWEHZDqdV0oK4a0Q/+9QztzCti10WHocVj2zlD40CN7NT?=
 =?us-ascii?Q?o90IZm4i8yt4ABxPUGNycjdEaywpY7SliRCBEW2aeC7OI9V6zCSRKxnvJUIe?=
 =?us-ascii?Q?KADok1CBFIU0km5/Mv1vrWSlWrJI3JjIR2nGKcCjSLRgWZlBFU1YQ+IE57Fh?=
 =?us-ascii?Q?kDcc2bRRzI+BL44L0eqX/B4idi6ke5yrrOF4f7mgl0z5QzkU95+a6n1zkm6L?=
 =?us-ascii?Q?gRVsr+VUO9jG9o9jd8WMj2hKKpCVw/Jj6/f5cFMXIBl8EX7ATve3mKysNgCU?=
 =?us-ascii?Q?PIVXX79X60KOraBbxtv6IxifdGjMzIw22lpJNC4cc9gXBX7Wokby8AWpXwuk?=
 =?us-ascii?Q?1Zc8yRq8TYuHqGLhAGhvnAg9jlTjGnPS0dRcuhME8kodQlKjEwSsN7If5uTZ?=
 =?us-ascii?Q?kFGwXrRjzniE3aPBs9hV1Hkzd2/u22IMbJWT6BD0A6NRIrPmaGW2tonomhyX?=
 =?us-ascii?Q?Fyh52MmVAaHP0sO7LjorXmqipad2Qvbv1EBq3ZM2idxILXUdwk5Onl71CqvB?=
 =?us-ascii?Q?MKZFK7xIKnAk34QTjfJfbZS1Vy5Hx1wDJaYqPEjqxROZRSHIKAkVBFfj2svK?=
 =?us-ascii?Q?pAV+IALaqoEWIR71N0uM23NrM/3MRkuvrbXL1b8Mv0LEOEdJlJod?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d0cacf52-f1ea-4450-60b6-08de95f1ad7f
X-MS-Exchange-CrossTenant-AuthSource: TY3PR01MB11797.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Apr 2026 04:37:16.4926
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5rDX+cw9HXVFT4AaJi5jWDXWDaC7QORklmPoaAkaQHnXgpjJfaMa0zF4M+uBQa2trXH/qL3e8V4KpHB1stYR0fCsPQzJ03Up4FczhvuiDyyYI2de3vxQV6+lAfTQy0o2
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYYPR01MB16304

Very few user uses card->pop_time and pop/click stuff is much less of a
problem. Let's don't use it.

card->pop_time is used at 2 parts.

1st one is at ams_delta_set_audio_mode() (A).
It is pair as set/get (A)(B). (A) did nothing if card->pop_time was 0 (C).
So I guess, this driver is assuming to be used with card->pop_time.
This patch removes (C).

(A)	static int ams_delta_set_audio_mode(...)
	{
		...
(C)		if (!cx20442_codec->card->pop_time)
			return -EUNATCH;
		...
	}

	static const struct snd_kcontrol_new ams_delta_audio_controls[] = {
		SOC_ENUM_EXT("Audio Mode", ams_delta_audio_enum,
			ams_delta_get_audio_mode, ams_delta_set_audio_mode),
	};		(B)			  (A)

2nd one is at cx81801_receive() (a).
It has 2 parts (b)(c). Because of above guess, Let's remove (b) part.

(a)	static void cx81801_receive(...)
	{
 ^		if (!component->card->pop_time) {
(b)			...
 v			return;
		}
 ^		...
(c)
 v		return;
	}

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/ti/ams-delta.c | 67 +---------------------------------------
 1 file changed, 1 insertion(+), 66 deletions(-)

diff --git a/sound/soc/ti/ams-delta.c b/sound/soc/ti/ams-delta.c
index ba173d9fcba91..4f3b0cf1e68d8 100644
--- a/sound/soc/ti/ams-delta.c
+++ b/sound/soc/ti/ams-delta.c
@@ -104,10 +104,6 @@ static int ams_delta_set_audio_mode(struct snd_kcontrol *kcontrol,
 	unsigned short pins;
 	int pin, changed = 0;
 
-	/* Refuse any mode changes if we are not able to control the codec. */
-	if (!cx20442_codec->card->pop_time)
-		return -EUNATCH;
-
 	if (ucontrol->value.enumerated.item[0] >= control->items)
 		return -EINVAL;
 
@@ -220,32 +216,6 @@ static struct snd_soc_jack_gpio ams_delta_hook_switch_gpios[] = {
 	}
 };
 
-/* After we are able to control the codec over the modem,
- * the hook switch can be used for dynamic DAPM reconfiguration. */
-static struct snd_soc_jack_pin ams_delta_hook_switch_pins[] = {
-	/* Handset */
-	{
-		.pin = "Mouthpiece",
-		.mask = SND_JACK_MICROPHONE,
-	},
-	{
-		.pin = "Earpiece",
-		.mask = SND_JACK_HEADPHONE,
-	},
-	/* Handsfree */
-	{
-		.pin = "Microphone",
-		.mask = SND_JACK_MICROPHONE,
-		.invert = 1,
-	},
-	{
-		.pin = "Speaker",
-		.mask = SND_JACK_HEADPHONE,
-		.invert = 1,
-	},
-};
-
-
 /*
  * Modem line discipline, required for making above controls functional.
  * Activated from userspace with ldattach, possibly invoked from udev rule.
@@ -260,21 +230,6 @@ static bool ams_delta_muted;
 static DEFINE_SPINLOCK(ams_delta_lock);
 static struct gpio_desc *gpiod_modem_codec;
 
-static void cx81801_timeout(struct timer_list *unused)
-{
-	int muted;
-
-	spin_lock(&ams_delta_lock);
-	cx81801_cmd_pending = 0;
-	muted = ams_delta_muted;
-	spin_unlock(&ams_delta_lock);
-
-	/* Reconnect the codec DAI back from the modem to the CPU DAI
-	 * only if digital mute still off */
-	if (!muted)
-		gpiod_set_value(gpiod_modem_codec, 0);
-}
-
 /* Line discipline .open() */
 static int cx81801_open(struct tty_struct *tty)
 {
@@ -341,31 +296,11 @@ static void cx81801_receive(struct tty_struct *tty, const u8 *cp, const u8 *fp,
 {
 	struct snd_soc_component *component = tty->disc_data;
 	const unsigned char *c;
-	int apply, ret;
+	int apply;
 
 	if (!component)
 		return;
 
-	if (!component->card->pop_time) {
-		/* First modem response, complete setup procedure */
-
-		/* Initialize timer used for config pulse generation */
-		timer_setup(&cx81801_timer, cx81801_timeout, 0);
-
-		v253_ops.receive_buf(tty, cp, fp, count);
-
-		/* Link hook switch to DAPM pins */
-		ret = snd_soc_jack_add_pins(&ams_delta_hook_switch,
-					ARRAY_SIZE(ams_delta_hook_switch_pins),
-					ams_delta_hook_switch_pins);
-		if (ret)
-			dev_warn(component->dev,
-				"Failed to link hook switch to DAPM pins, "
-				"will continue with hook switch unlinked.\n");
-
-		return;
-	}
-
 	v253_ops.receive_buf(tty, cp, fp, count);
 
 	for (c = &cp[count - 1]; c >= cp; c--) {
-- 
2.43.0

