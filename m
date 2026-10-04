Received: from mail-wr2-f34.google.com (mail-wr2-f34.google.com [74.125.225.98])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD6A13F888A
	for <linux-sound@vger.kernel.org>; Sun,  4 Oct 2026 18:46:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.98
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791139601; cv=none; b=F7yKME7T83SNk7w7sHgKZyE8uy6xnCSE7DW1ER2W6ZLGch9+5NjFXownmKIQLH8wXuY8ogFEXWPaoJwrl32xLE1EpbgRXiTuzvlnRACUewX0KZQjkue796gZAKY2Qh0wsWQZQroJLWltjzpOowUxRWdfoGY3rCFBlhh+9JshG6Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791139601; c=relaxed/simple;
	bh=ZEhDPZo7Pi9t2F29hIlWPWIq/RNbNj79JGslseqy9NE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=tm/I2UjA1NFAsKn409bqAJ51V+D2qb85eXgMrMYTIu4UyOoDj5gYoRp8fcyP99SWDxPzAJQLbU7gPg2upUklVjHZ+C1c2xYIcdWYl1qmZZjl66jSDA8fDuMlL5CxptK/iFHcCpXC0VH/c9zkbex+yanblK4Z8bbmqPczRP0CFA0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VITKVTdR; arc=none smtp.client-ip=74.125.225.98
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VITKVTdR"
Received: by mail-wr2-f34.google.com with SMTP id ffacd0b85a97d-48b01c41135so650718f8f.0
        for <linux-sound@vger.kernel.org>; Sun, 04 Oct 2026 11:46:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791139598; x=1791744398; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=EaKQNPs1qaiOc1buy/JrU9ZbzGwKfhNY3I1FClEqH18=;
        b=VITKVTdRfGf4qwlCNzWbGS7Df67MlJXxrazzg11XpxlO0JD2+SHVUr5k+mzfh+LtIF
         QD3zubNTjlI4gpTaZOg/3KO+47yz7veliM8TfozruRggD1/fntLZTLNbXyZnRd3Munem
         IZBEfrSPQ81yZwLdBvqbP/y7AYl5lXDBcS8upifD7pL7mYItr7/vGYldd+HcnkwFwkQV
         kWeryncVTpIu7wA2M7QzfG/pGzp2KLpcwo4E/Kytm2xxNHboE3VSeqK7Z0wz2MVGbWr1
         oC8Vr7UcSNI23Xob1zv/e52ZRXUVZcShC188X6JQxdG1mMXdMHZx1apbC7HtAJh5OuHf
         46SA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791139598; x=1791744398;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=EaKQNPs1qaiOc1buy/JrU9ZbzGwKfhNY3I1FClEqH18=;
        b=b/Tqq0UIy5Hi7uIIoDf6lhHZh1jz9SsB3PJFla7B+/48XAKxtlVePqkNiF6Wtcv8lm
         5r/23XEZ+6WVMPHmC4Huv7ExqGd3eowlbG3DCOMpj6vc4Lxg2LbkAGLohRwSiyVSzrUm
         B1SGts3llKCEIXvMAyfhZMmrn7HKA5IhMB5RpVYHvFiJ7koATD/npHJiDy2Kytz9dUVr
         eHZRe3MMhLva4j/njy+PPLbOhWOVLNdcQQj2drCQ88z/mb4prBnujGxFeVkrp/Ow7XwI
         7UT386AnBMzBa8vP62MapxjCl1AWzn6bW/nnxTZKFYYjcsdFgvl81ICERQPEQ4dmgF78
         dGiA==
X-Gm-Message-State: AFq9FYIkJqLPPz1/JhUIdngCWxyLBvqH2tbHwgFNA2vQVd49KCNcE3yT
	oSrFDcV3iQOFW/ZPHKlxwXrNg1MECdKjlbI55vJwFpN//KYwv20GVDpu
X-Gm-Gg: AYBFou2aLKuOdeV8E2GOCksAHdS+EX3baCPgs0dmZWMDqWj0slpOwTMRaSGeBE9ugZJ
	uMqK9v2hNUCE4XB4Ih8zBDmH1/vkeY23Zijs+yzwOEaeuKXtQjejwTBGZAZMmHB3gYnj00Z+rBX
	idlzLUnJDnpyiXLFLbx4iHxxbLL9Yd59EAeRalmWTg7qII4n8HIi3Gq6lxCL7cH8Dfp2fFVRzTU
	j013FregvTc+uIL3GOD91eyki8kHtbWX9bAAbyExJcGODkVVhv6ArYrD4z7Z4nmgUuuOYnmaoG6
	/nVV9vSIGoR0rF2WokFzZ7sXVADlbdM4JtAXQtls1j53YJ7cCO+E9dLNjhXIh9kkVadQBbVE4Dl
	Up9/OupkAfgS1hfjhCre7ld0otpIjl3ZkL3ze+XhNkGvB5B7WUvSZ++WKUpsc+iI8L94zzRm5s4
	/uH0sGjweOfLLyqaqB/jXjc5DiXQVl9OEwamYl2CD1od0VWJ7RF50Kl1oKfncv5iu9Gis64/V/R
	pgDgDd1W4c87JTsT3h/4i4/jxmvLoFiTl5qjRA6wyTfovQpGq5Lp23DZ8pMtBL4r+4j6c2gxlmO
	nHWq
X-Received: by 2002:a05:6000:98d:b0:488:7f8b:b4b with SMTP id ffacd0b85a97d-48b12736b30mr16063188f8f.26.1791139597622;
        Sun, 04 Oct 2026 11:46:37 -0700 (PDT)
Received: from jjj-x570pro4 ([2a01:e0a:9d5:4a60:d60f:fd1a:fad6:a587])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48c57d927cdsm4988765f8f.6.2026.10.04.11.46.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 Oct 2026 11:46:37 -0700 (PDT)
From: Justin Bacle <justin.bacle@gmail.com>
To: Takashi Iwai <tiwai@suse.com>,
	Jaroslav Kysela <perex@perex.cz>
Cc: linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Justin Bacle <justin.bacle@gmail.com>
Subject: [PATCH] ALSA: usb-audio: add sample-rate quirk for Yamaha 01V96i
Date: Sun,  4 Oct 2026 20:44:45 +0200
Message-ID: <20261004184618.56779-1-justin.bacle@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Justin Bacle <justin.bacle@gmail.com>
---
 sound/usb/quirks.c | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/sound/usb/quirks.c b/sound/usb/quirks.c
index 6176acc04..9a5ea295e 100644
--- a/sound/usb/quirks.c
+++ b/sound/usb/quirks.c
@@ -2332,6 +2332,21 @@ void snd_usb_audioformat_attributes_quirk(struct snd_usb_audio *chip,
 					  int stream)
 {
 	switch (chip->usb_id) {
+	case USB_ID(0x0499, 0x5500): /* Yamaha 01V96i */
+		/*
+		 * The 01V96i declares its audio streaming interfaces as
+		 * vendor-specific (class 0xff) and provides no class-specific
+		 * endpoint descriptor.  parse_uac_endpoint_attributes() therefore
+		 * returns no attributes, and the driver never issues the SET_CUR
+		 * sampling-frequency request the hardware needs to engage its USB
+		 * stream: playback and capture PCMs report RUNNING, but the desk
+		 * passes no audio.
+		 *
+		 * Force the attribute on so the stream is initialised the same way
+		 * the Windows driver does it.
+		 */
+		fp->attributes |= UAC_EP_CS_ATTR_SAMPLE_RATE;
+		break;
 	case USB_ID(0x0a92, 0x0053): /* AudioTrak Optoplay */
 		/* Optoplay sets the sample rate attribute although
 		 * it seems not supporting it in fact.
-- 
2.53.0

