Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDFA72BF3E2
	for <linux-sound@vger.kernel.org>; Sun, 12 Apr 2026 01:27:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775957239; cv=none; b=PLuE5FfCd+47jtqW03dwejhQoQeRw0mAYISNMypmnBwTB5AfFWzHt1Ib7xd1aBYJD54PcvYZdhriQyvHEfSvfDDfIBg4VCMCNKrSnwtYEafN2fbnWGhepIZykKRSLedDT4CLi9QTVtoeibFyZcjCj9aPHBLF9MpwcIWcrU3tj2s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775957239; c=relaxed/simple;
	bh=4fMFksRa50wp9KwtLwKZC57XtRiUa4gU03pi8eDFvo0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=i7Z/LRjjDR/HmmL6fisDF4bxNgX+6ndHxlQZt06SVeasyiIk0pmHhJsAZQLJG/+ELmseuNcnB6JQrZuHD9g+TnXeZfe7nbgjWWeceqQhtPz9Wb5HLkA8eFfdVDvWZU9znaeM3v8OLbBgcUmulLGCSlkU/6nMLcrrc0QhdsugwI4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=F268Xp03; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="F268Xp03"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4852a9c6309so30746405e9.0
        for <linux-sound@vger.kernel.org>; Sat, 11 Apr 2026 18:27:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775957236; x=1776562036; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=7YMAKOi4y6E81GEs2eaUyE8CZBC1+E+O9qekZpC2rmA=;
        b=F268Xp03DUYG79F7BhVtdb3Cfx8+TmxlJpB3V2GUsFzGDJdR8mZZbvSjT9UMJ3AZJC
         QxZ+hEgY6ucrPz+oOOJpt0+Wm9DDOsztkLgf2WVqfhfidYRos4Gv30BhpY2wp1ubN8HJ
         VKIlee0pYYyxdjHHaFgbuxjTyYtjZYXjU7UrFX8FgG7QMTEXu9HusCl9LFRj2t63gFw3
         KcabO3j3jnQ6v3sMQrmxB9ZeGxmD/a0oEbJKS/szgyiCLKC7dtvkLci6w/yaf1K1RKm/
         RSln2dImjDjDO+Nsxbkcowf/oKR/TaP7/iyAB6Lxf+ESq0Oklpa9Ghh5gPUd4wh/xVA/
         R88Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775957236; x=1776562036;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7YMAKOi4y6E81GEs2eaUyE8CZBC1+E+O9qekZpC2rmA=;
        b=E5akXmjEwJdePt1fuEGlxk5ZWxc3fd8Qy/D4cuGGqDNgmoyczS2zAp7t5AqgDOjaKd
         XxZBdCamPRCtgGKWlgSrCR2dM1G9ORqSRZyayz8VGrpoKAYoKSHP6KY6GoS6GtY866bI
         FxbFwO2sAZkKxqmIvpyIWrr+Q0lZlvVrNS5AT6oP+ueOMpxXB+FW43D3qhNQ2JlhsQ5V
         SvYwMFvxYOjdrPiVi5d4TeDLgRDnlQnS7dFa3WVhKafjlkctHFrAvVPZ5b+U82TqDbur
         ApcEOZRg9RQ7hCEA8RkXszTAUvN727UK/O0dkcDDN3o2+h/PZOSxsuUDIFOh3qvzwv+h
         zDJw==
X-Forwarded-Encrypted: i=1; AJvYcCXLMq2PVN5XVnYQtH64lTe/sT/9Z3fPGD1ftBqPl9trEuN1HZp/G68jvhEvoHeLYaOhCRZgRS+xZAcgfw==@vger.kernel.org
X-Gm-Message-State: AOJu0YxAgEOCmmCsrI8sHeHa162mWcdBHUlNEwFPL6TsVpwV6nLFbRSu
	nynFGXxPo1oCRmTxwyE/iF/5Hn7x3318j+2WZHXTGuJDJ64XaGuQxYuL
X-Gm-Gg: AeBDievuZh8Wm5hZBEpccjyintqNwBZxDx/wzl+kIldEeawPin3ZsEXv823wSBNEc8n
	a9/8ZV4xWxbEfBPyXPRzPy2Mr/5SZFAusTL8iDeCJYYzJXscDmMwXPzY0mDkzWW8cXsCYJwmED9
	uxyDVcd5zrjF9goHSpuNhIGJd+Oyu2MnEMYFlswBBxeJ90EneJ7I4wiNEeFRJYNoc6QhHUy7WMa
	tu++KNdK5GDdfgPhq5+v3JfcTFYx7f1ThUCIJ8Z81IahcXwguwIlvt1UpR/wm5XV8t/1e9Z6E9D
	XnAIK/sYpvp8JdDxqSQjloZr3FKsFLrVbyEOKMy612UlHPcpH8LbbP1h5dF9Ro+0IeHNXvBJSfS
	/Aai9BCriZFQKuEfBC/AKpEfQaiD99kORsicLMxiFKSa/nru2C3KW4OUyzHQg00hRo80dDTmoSk
	H/0wC6VO70cXCvYGt8WLf+aQek++c2hdr4XtX3/mlhc2TYkHndZbYC1t5fONf5ccEJ
X-Received: by 2002:a05:600c:c0dc:b0:488:aa3d:fab1 with SMTP id 5b1f17b1804b1-488d68364f2mr70509525e9.17.1775957235936;
        Sat, 11 Apr 2026 18:27:15 -0700 (PDT)
Received: from dell.intranet (83.23.226.77.ipv4.supernova.orange.pl. [83.23.226.77])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-488d5d80bafsm62229065e9.5.2026.04.11.18.27.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 11 Apr 2026 18:27:15 -0700 (PDT)
From: Janusz Krzysztofik <jmkrzyszt@gmail.com>
To: Mark Brown <broonie@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	Peter Ujfalusi <peter.ujfalusi@gmail.com>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	linux-sound@vger.kernel.org,
	Janusz Krzysztofik <jmkrzyszt@gmail.com>
Subject: [PATCH] ASoC: ti: ams-delta: Stop (ab)using card->pop_time
Date: Sun, 12 Apr 2026 03:26:55 +0200
Message-ID: <20260412012657.1370381-1-jmkrzyszt@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

A flag is needed that tells the card driver if the codec has been
initialized successfully over the modem's line discipline.  Initially,
codec->hw_write was used as the flag, but it was then dropped and the
flag function associated with card->pop_time, already managed by the
codec driver for diagnostic purposes.  Since now the card->pop_time is
going to be killed, stop abusing foreign fields in favor of an own one.

Signed-off-by: Janusz Krzysztofik <jmkrzyszt@gmail.com>
---
 sound/soc/codecs/cx20442.c |  8 ++++++--
 sound/soc/codecs/cx20442.h |  5 +++++
 sound/soc/ti/ams-delta.c   | 16 ++++++++--------
 3 files changed, 19 insertions(+), 10 deletions(-)

diff --git a/sound/soc/codecs/cx20442.c b/sound/soc/codecs/cx20442.c
index c0dc69ce4d0e..3a1455b79cd3 100644
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
index bb897bcb2486..78ab1eab083e 100644
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
index ba173d9fcba9..2a6fa75edede 100644
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
2.53.0

