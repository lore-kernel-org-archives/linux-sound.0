Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11011029.outbound.protection.outlook.com [40.107.74.29])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCF3F39A7F7
	for <linux-sound@vger.kernel.org>; Wed, 22 Apr 2026 02:56:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.74.29
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776826569; cv=fail; b=Penmiu68YUVyOcj2mzyv+09Xp7gKNrXAEGwBOZ+seBjhbM8Xq57WfcYvrVwqqnX7QF4VCgMbedv7vnmwa8BQi/opI1ve4OY8HO64FI9VVSwQLKeIFFuc+AN+xMRIpbdcZaLe2Ln8P9BkUrBnUVSwfXWZPlf1imFCkObX9VCvBAs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776826569; c=relaxed/simple;
	bh=uRw976yaiPTst8P8mKqMp2HTmr9vRM1PIHOa7lV/ksk=;
	h=Message-ID:From:To:Subject:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=N09fNrZFXpdue0fcUlNzLoj3P+jGnvVgKhvAM3s1rCObVidVZHpdtlSp1oEHDyVBvqbmjA70hRJrJfHKW2ybWXQCmmFFtVLadwjQ/r1QGcF4QHEofGieUPjosfPRJ3xcdevurNaTP8rLWc8lUjE84yDWJLiG0O1F0Ks3P7SJxIU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=Gg9y9ayQ; arc=fail smtp.client-ip=40.107.74.29
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="Gg9y9ayQ"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=zOoGDXSFjGzJAr3LgZqAHTxMBsB0fz5Vc3tvnkO9njbjROyilh0b7GLCtFH0us9pI4e8obJ7Sg5tvsjIN96YUCxEGbCeP4fEme3T6e5k6Cgh9eEcX+rfznuz0Sb9wPB4kyKGyW3KWrKv1oZDqd5eVdi68aRbgcQEUoh+N2jTEDU6jE5phcBrw7mT3aWsAnzP2yMqokqAfaYemrdfkKsD2SzcRFOaZJQFuaX+G2vQ2Sdi6qmV/7oK6UhvrCuooQxB7xL8QhWWlTvw+Utv0QcHyAkcoE2oNy4Dwgut2eSBUZgMS2UbTSxVdgHrQj/tIzxgAZxthOMmNIMx2m1ynoxfiw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wLBb7V55nMIZYzeGB3UABiDgnwfXm4SPuld92/dT3FM=;
 b=AA0Yo0+fD9xzRTBFNW8TARPS5/d+6QIgj/47PmmxNyYNhb+t9j9LA0ApXAUVrXswV7BtpZlaiMiz4HeY+WZDmMZdD2CkErDkS3M/ArscqAh3vFZUICQQQYYkn5FvvIRRL68CxpJ6bhmnNlUzOMvpYlL0Nk7C67hjkRI6xy2B/8iYUTaHlMpC56yCGEH9Wzc956ul62jA0A3x03UZygLCZhy1SK0OJx5pBn0mFUJ4n80SB//Xp1FSpYEdLZC4CrtUlFzSTC4bfb+d9DXk+0bErDoQMwFzAqRlnLhuZzjP1QHW5+PG/v5LGkGDZZUy+SdTHzVrqg++f0BiXDi3wgR9iQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wLBb7V55nMIZYzeGB3UABiDgnwfXm4SPuld92/dT3FM=;
 b=Gg9y9ayQ4hgkdsyERYlh7n/47Y9LQm9GpFF2QqRrQrjwapAuWOHGQQ8INgpe8LXAVK8EUOWg1A18BoY6Hlx8RI+B8mp4jr+rIHEJteCvpxwv/9CoYfr2RtnB1fSrNVKTDvB6WlPZ/Di5mi8LIWtXYIXykwwxNU6vU6S7oCeYL9M=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TY3PR01MB11797.jpnprd01.prod.outlook.com (2603:1096:400:373::8)
 by TY3PR01MB11763.jpnprd01.prod.outlook.com (2603:1096:400:40a::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9846.16; Wed, 22 Apr
 2026 02:55:54 +0000
Received: from TY3PR01MB11797.jpnprd01.prod.outlook.com
 ([fe80::1868:c915:c230:a383]) by TY3PR01MB11797.jpnprd01.prod.outlook.com
 ([fe80::1868:c915:c230:a383%5]) with mapi id 15.20.9846.016; Wed, 22 Apr 2026
 02:55:54 +0000
Message-ID: <87h5p3k8jp.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: Janusz Krzysztofik <jmkrzyszt@gmail.com>, Jaroslav Kysela <perex@perex.cz>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Peter Ujfalusi <peter.ujfalusi@gmail.com>, Takashi Iwai <tiwai@suse.com>, linux-sound@vger.kernel.org
Subject: [RFC][PATCH 1/2] ASoC: ti: ams-delta: Stop (ab)using card->pop_time
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
In-Reply-To: <87ik9jk8kd.wl-kuninori.morimoto.gx@renesas.com>
References: <87ik9jk8kd.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Wed, 22 Apr 2026 02:55:54 +0000
X-ClientProxiedBy: TY4PR01CA0091.jpnprd01.prod.outlook.com
 (2603:1096:405:37d::11) To TY3PR01MB11797.jpnprd01.prod.outlook.com
 (2603:1096:400:373::8)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY3PR01MB11797:EE_|TY3PR01MB11763:EE_
X-MS-Office365-Filtering-Correlation-Id: c95ec601-53a3-4421-ddbc-08dea01aabcd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|52116014|1800799024|366016|38350700014|18002099003|22082099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	5xCqN10kc0wQru1V1IQ9YpCkT5PnNpx3uYWoh5YKfGj39gAREQM5P3OmmYn8lXyXh6dKgI09Qs4KjsQozLfVFWA+304UQbTBlRex0AiZkeSbI2ObftunzRvuggDfXx0ZMpgxP80Zy6U2YoJXeMghPGC9CuBCREOja50EvAk7zuGcbmzjrZvgz/ZpabqyDWuXjR0vLGs6fUEN8BdJ/p8y+BgbeTe9hTzeE0ffaZjmGNRLmTdRcWMpNMoaMwvBbgQtzTrNatZ+Gw6kxhbTEagGiys/SJATh8U5/DTG/rBPptyjyolApiivu923GoUMTqByDozMiCfr9FmxFLuMeFXwFrYl0MYP3qooh7u19o95THZ+rYYHkIj7sr1XjehvuuKn3y57HoiA1CRCfeU/qPK3G+dXjrHlFkEF5IOh7/hmV9YYeHXCvIQHjDNcXKJRXLvy73239GWSyi3UsixoJEh4Rld8sLJet8UrbzF+J77iuU84GV3RH9dQSuoiJFHKft2u6n5cCtj8OpTJ27GtW+0S5+gYqxMHp1XyY6SzlqodO16P3owYA0ScWyKiJVxnV6+xMTyJNa36FFweND4+N7VXr4pFU655SexPMfhdlch+YIfhDe9kK4HvZUT2fKSTcFlqQQiAmP2czoz3vHQrN9u8N7m7c7sOm3PAgSxUVuqD6iUDr0Kdsug1TR95gXnjaqbbTpjSM5URdZUDwQTkZ5fFW7wNwnu0i9w3GbPPBielWb1wUwBpYtvRqfBJHDOrlZUq61EBXwQlTce17iZTp4m+4GyCnc99llBvClg5pqJfvVo=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11797.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(1800799024)(366016)(38350700014)(18002099003)(22082099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?Gbt1EG6paNyF7jh8cfAhAugiItrCkKanokVtSd+BMcRCSlf7RCxoI6S0alJs?=
 =?us-ascii?Q?NnPj7KtkuNIQpvcU84NEntq3jQajIajZ/DwtSiVpQB2NGytfyw4vELtHYppd?=
 =?us-ascii?Q?l50ThMuhcao+03rIkBBTwyAuf1Dc6RZMt5EWo7wWv1iWzZWjfqeW5qPhLV1R?=
 =?us-ascii?Q?AWikpTJQUFq1PYAVnl/kKnOVSkvOALrcUcWDKiT6vvftHCVHGe0edmBkiepD?=
 =?us-ascii?Q?B/kFJCPAopK5ADE32fsJhLbpV71KhaXJANZTDtvFp/pVghCsvA5KxB+1+nmW?=
 =?us-ascii?Q?Le7W7dXFZSf4b+whOU4Em2sGQ8uWcE/SK2hLHwaNwKP+nDw1QlxguvW5GIO/?=
 =?us-ascii?Q?Ysje+19y91zGc3r4MUZKR9En+tuiy3DwNMoAUWfcm4C8+r6q0+92rfxYwOpt?=
 =?us-ascii?Q?P8AdPSrTLzTxMgvorS/GVodhHezOvyW770hYC/4JGfS2JaDVV+21soS3ZLTC?=
 =?us-ascii?Q?sCrdfLaucqiu+AvqYSMqcBEU5YFtUfn2bQO01KW+L2Wvl3m2qHSKURiG9cL4?=
 =?us-ascii?Q?W9D0a/jdDSxTplQ3hP4sh8eJ3RHhxMO07Yf9IPkxWEbAzaqIfNVUlhpO0vJp?=
 =?us-ascii?Q?8pedH15EYIn03EulYcjfumYEuxJztibTYscY9Pl+g2S2JpYOYOcScN9U9uTx?=
 =?us-ascii?Q?P9VrEVIjUBs44wqxmkcciL5FmTAv98ZiPwfC7DrgDjRhe6RrVzQmSUM3VLGD?=
 =?us-ascii?Q?hM1+rMCtC9tiAwHTD9yK5o7G67Ay9q3ZErccWxnPH5RdzL+WC4/H+Il8BsZJ?=
 =?us-ascii?Q?e8hiOKLBsiDpY5s0MqOczRrKE9OmLWjjHluS578pUNXQsi8xr+Q64jX5jkYZ?=
 =?us-ascii?Q?Mx7EnanpudWwkRh0Cn3zyEcDWTlFVDJCligzf2Hflgetf+UeDtLIlHwVAYXB?=
 =?us-ascii?Q?GSoHr1CWBM+5UxXLDqKRvFHdvCCZ50UUopOeeREMGR4cMmJfqmzN92Iw3OCd?=
 =?us-ascii?Q?RmcdSNm4ewEdHhULeuK5C+RK114za47zEWTWSWC2qo0MusEU2IpBBVvZ4bsJ?=
 =?us-ascii?Q?UqtTDdKdCRzgJqWujhgXfe3dTHq4ZfZiGhzxYmstDop8CkEDnNGva7wDMr9p?=
 =?us-ascii?Q?fIhGRLAQFORUw9r9EZjQzl9w8H7BYysF+yDnG6RUZI9GPVXfkacGcS+m9jtx?=
 =?us-ascii?Q?/q0ROY7TtFwP1uYfSvTSv6iNnGi42YiaElIbgfiRTld+afdgFvsKjtj/c2T6?=
 =?us-ascii?Q?uUql2/cHzdgYo0UI4ZvK29sP+/9AD6I9HUBFfa4+1CmduuwP6NBLNXT21l2M?=
 =?us-ascii?Q?15tLHTQxW1WLRCTnnTzzEFZCimea4QK28KNVRoVGHBj2AQUAHK2/W8xNBEi5?=
 =?us-ascii?Q?nKWgSxTGZ+0bY2md+LwJjNtBs4CJwsvAx7WErJk5E7JaOm9Ca30c7+bvVHrr?=
 =?us-ascii?Q?aTPp5tzliAUMMwsvZ8xtUDjgqmpfOZEnznHUVG150K6mARm/64VBwq6ptced?=
 =?us-ascii?Q?73OxsNBtKjrEROMxCBMk8dUGRK/Cf8qpJtJSttswnC1QUT3w2MiUapqAWW5U?=
 =?us-ascii?Q?nWFL2VKkSt7lg5unllR5sl+O0lnAagBInmoogVrl5KgApYFXanH04PQ1ueYI?=
 =?us-ascii?Q?iAxdWV8ssF8Y4+CqQgZ45v9uO91GLYSMgLQCbFLRh+yeiRidq1AwcOz82zbp?=
 =?us-ascii?Q?ToEc5kvZf+dBsqk5ZAFdN6Qhv093XqBmbbkABjmRYJAAZluDG325dHMr/TX2?=
 =?us-ascii?Q?guU0K8sSkMO/Kb1po24+H+eQawQUSX1ExmCiM+m1VPMuYxJaMqk8doIxGV7o?=
 =?us-ascii?Q?Q2MMmAVKzb3lXbi9jbsiTzaJa+366gonDtBeIxcKcOxPgh4AxUKs?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c95ec601-53a3-4421-ddbc-08dea01aabcd
X-MS-Exchange-CrossTenant-AuthSource: TY3PR01MB11797.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Apr 2026 02:55:54.6789
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0LlgQ5YhfJmwqhW+PRMnLFOBNLHXyaTqroNfCARYaHlPPe+jEesaoiFUyDiRrNypVd4ns54w/reE0VJUsvPBVE6xGDQ7MZOAZBjZO/JCOzR3G6+1CSDeT5CvnU0IVs8H
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY3PR01MB11763

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
 sound/soc/ti/ams-delta.c   | 16 ++++++++--------
 3 files changed, 19 insertions(+), 10 deletions(-)

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
index ba173d9fcba91..2a6fa75ededec 100644
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
 
@@ -339,14 +339,14 @@ static void cx81801_hangup(struct tty_struct *tty)
 static void cx81801_receive(struct tty_struct *tty, const u8 *cp, const u8 *fp,
 			    size_t count)
 {
-	struct snd_soc_component *component = tty->disc_data;
+	struct snd_soc_component *component = cx20442_codec.component;
 	const unsigned char *c;
 	int apply, ret;
 
-	if (!component)
+	if (tty->disc_data != &cx20442_codec)
 		return;
 
-	if (!component->card->pop_time) {
+	if (!cx20442_codec.ready) {
 		/* First modem response, complete setup procedure */
 
 		/* Initialize timer used for config pulse generation */
@@ -467,7 +467,7 @@ static int ams_delta_cx20442_init(struct snd_soc_pcm_runtime *rtd)
 	/* Codec is ready, now add/activate board specific controls */
 
 	/* Store a pointer to the codec structure for tty ldisc use */
-	cx20442_codec = snd_soc_rtd_to_codec(rtd, 0)->component;
+	cx20442_codec.component = snd_soc_rtd_to_codec(rtd, 0)->component;
 
 	/* Add hook switch - can be used to control the codec from userspace
 	 * even if line discipline fails */
-- 
2.43.0

