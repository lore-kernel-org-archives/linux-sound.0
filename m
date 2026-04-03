Received: from mail-ua1-f50.google.com (mail-ua1-f50.google.com [209.85.222.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25ACC288AD
	for <linux-sound@vger.kernel.org>; Fri,  3 Apr 2026 03:47:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775188045; cv=none; b=BKkkpV1YD9kVLLWZojXhQU1ZWKHnQ/Z9WlF4UsQQKfHSLRVRS2Cth0RMi/beP7foK27wBqMVfrjEqX0TZJ7I7ZIojVDHvd2mLPUd81DEMJVx7+oJhHjsq0ON92nte1aindAuzNuvR2tbtkeRhzjyGImC2vsZ7mMVF2QlxrSSHv0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775188045; c=relaxed/simple;
	bh=i+jTnj9uWTVTpk/43LHEyjWkuxe1ecxKHb3ofhIcLBI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=gwUBp6qDCmUNHuTTtpp4Lrc7qsoHtcz4cQIZkWdE6gT6/TQ4egVQwfBvvBhk0AovFk3urhJt0XNG3X6ZgJ2BJvQS1+guqg7q6u51RQsw1QxWSGU4s/i/2/5mw6k00v+QypRmjnLH2TYwpwXKMLsw21bzOx3Zt8rAE+EA9DqP9g8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hTRzPkt6; arc=none smtp.client-ip=209.85.222.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hTRzPkt6"
Received: by mail-ua1-f50.google.com with SMTP id a1e0cc1a2514c-94dd01deb53so433224241.0
        for <linux-sound@vger.kernel.org>; Thu, 02 Apr 2026 20:47:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775188043; x=1775792843; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=mQJe7gr2NY91HuvsDinY38MzPt4uB1n6FAVnHxFtD78=;
        b=hTRzPkt6W5Nq5UKqtp01Kf3mlEeECOUUEmAe7d0+rgmWCJQ5dNgQ1pG5ltZe4lZ3Yb
         ncK/9f6rFtY9T9E/GN3Y3bLeR6zAeGhUjscKKk1qWQxuKxa7qgTDfbW43NS5YvfWKHpF
         uDjGDYb1BHZ+NZ6gDYtBji9CcMIVED5i5kGCJum0X4u5NcHx8+08he4Kn+5o0XfsCqjT
         eM+UmhwPvrZvzsDUxswullonM3sDbjQoNPqjBw5r4pTmLj9eXEK8+b8FdnTfwLFA+vNw
         P2RpllLYsshoFW1oS6Qjepp0XX518ZCJ2e5lV9wfdf4bl6+X1PJihf0GPAP01WcMyL9b
         R0sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775188043; x=1775792843;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mQJe7gr2NY91HuvsDinY38MzPt4uB1n6FAVnHxFtD78=;
        b=LV/lbQ/Vw6TpCD8ef6E8R+Ie5fmj7cWCUUvIGpQ+64ROPb9khQoDMDYmyNqK47PGsl
         FrlWEqBO29C1FHK22kiRpZsy2aT+U9Do6ZylkwVozirz14kIY01cNnY5YA17ylUzXhZg
         ac9cb9ycmtioboaEqCDa+bheYDeecM++9Q16XjHJtKDKAUQhlEXCucHhl8qJgFm31PLd
         iQedL3SiIlKAsS77d/rYvh8fN4WswN4s5hKgbbmjodmfpxnQdV7LAbPvA0h/gJloz1hT
         91c0yRuc1B8GS0uOmvli8A2rczFkPfL1wd3n/LeMwzLmP/UfadIyy+Dt8PrnDL3FCsDn
         elEQ==
X-Forwarded-Encrypted: i=1; AJvYcCX1bthgSCF576Lvl0EhGkXrPDL958v9Rox2ANeJFiPxqc1g5vAnyicdt4L0ZiXPqe2VYk7E58FGgvkpHQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YzKcoz5URR4oua7pqh292KQZtAglm9sPn+Hr6QaAJftbXtJMkUZ
	AVHYjXRQDBODZgFXrZqlUer86otDeqi/YOR2aPGKd8wM5CfKL60hVLE4ScSAMgzW
X-Gm-Gg: AeBDieuoKOzPzOTgvLrT7957ToejMXZEuWGQpzt2+XGIFiehnc2s1RuFJleJGOaABAX
	bC1599eCYAvT9Y/DOMBll6jkQZSlnaP5zo7RoXxzO15aTCWuIrBYQxf25sEJYpFUnmO1P3jmEHW
	QpKyWr2IJUvUTAb+vEKp92UeNI8ZXcpaKOoZ8+Yr3yLuryrL/KH9jDinq68JML6q1Ew2vqws+QP
	uR0pWAvAtViSZVQKxEM7UMmdzn6b3FgTjM4tbiGOSKM3Mm5o69hIksZM9+GCmhd/zc9NzNb3IfO
	wlBERd62YE1MmRe1PZld2ZGp8fKzlrL6RYh5tJRlAJvUdE+kaAIWz/7KmkNBL9EdHRsJkBhW4Lp
	qtWlHA+G0vDfj67EsRsiMkydtfATRfLJit3YpboKnfEKZQvPzlJfYug6EzFkq7BZkiJZkab3qWA
	OXf91uA2Y/QpujlTf1NeVr+ccSv576g5IWfW1AJEVZKw2kFA0u6u3P0ORIUSC2H1LlplDIRH09K
	xin
X-Received: by 2002:a05:6102:5107:b0:5ef:2457:8015 with SMTP id ada2fe7eead31-605a5099bdbmr580390137.29.1775188042928;
        Thu, 02 Apr 2026 20:47:22 -0700 (PDT)
Received: from [192.168.1.18] (177-4-161-217.user3p.v-tal.net.br. [177.4.161.217])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-60583049c1esm6652525137.8.2026.04.02.20.47.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Apr 2026 20:47:22 -0700 (PDT)
From: =?utf-8?q?C=C3=A1ssio_Gabriel?= <cassiogabrielcontato@gmail.com>
Date: Fri, 03 Apr 2026 00:47:13 -0300
Subject: [PATCH] ALSA: aoa: onyx: Update IEC958 sample-rate status for PCM
 playback
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260403-onyx-spdif-pcm-rate-v1-1-dcfaf931cf83@gmail.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXMQQ6CMBBG4auQWTtJKcUQr2Jc1PKDQ2JpOmAwh
 Ltbdfkt3ttJkQVKl2qnjJeozLGgPlUUHj6OYOmLyRp7Ns7UPMf3xpp6GTiFJ2e/gBFca13j0fm
 GSpkyBtl+1+vtb13vE8LyXdFxfADCTi1WdwAAAA==
X-Change-ID: 20260401-onyx-spdif-pcm-rate-ec45243ae8a3
To: Johannes Berg <johannes@sipsolutions.net>, 
 Takashi Iwai <tiwai@suse.com>, Jaroslav Kysela <perex@perex.cz>
Cc: linuxppc-dev@lists.ozlabs.org, linux-sound@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 =?utf-8?q?C=C3=A1ssio_Gabriel?= <cassiogabrielcontato@gmail.com>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=2998;
 i=cassiogabrielcontato@gmail.com; h=from:subject:message-id;
 bh=i+jTnj9uWTVTpk/43LHEyjWkuxe1ecxKHb3ofhIcLBI=;
 b=owGbwMvMwCV2IdZeKur/u2bG02pJDJnnLdxF6urnCQd4eJhyftXVm5b8Lezv0c8Pn02ZpLFI/
 Ulvq7BDRykLgxgXg6yYIsvqpEWWe7oeXK2PW+EBM4eVCWQIAxenAExEy5CR4fdqDs7wG8KzRU1O
 7Xx6u1swOOzY4ZlpJ9ZuN/s3LVlE7xHD//CqMGO1YHGna4In6nzfJXNfagrYclny1+Q07Zgteia
 /eQA=
X-Developer-Key: i=cassiogabrielcontato@gmail.com; a=openpgp;
 fpr=AB62A239BC8AE0D57F5EA848D05D3F1A5AFFEE83

onyx_prepare() accepts 32/44.1/48 kHz PCM playback, but it leaves the
Onyx IEC958 sample-rate status bits at the driver's initial 44.1 kHz
setting in DIG_INFO3. As a result, 32 kHz and 48 kHz PCM streams
advertise a stale IEC958 sample rate unless userspace rewrites IEC958
Playback Default first.

Update only the consumer sample-frequency bits in DIG_INFO3 from the PCM
runtime during prepare, resolving the long-standing FIXME in the PCM
playback path while leaving the other user-controlled IEC958 status bits
unchanged.

Mark IEC958 Playback Default as volatile as well, since prepare() now
changes the exposed register contents outside the control put callback.

Signed-off-by: Cássio Gabriel <cassiogabrielcontato@gmail.com>
---
 sound/aoa/codecs/onyx.c | 37 +++++++++++++++++++++++++++++++++----
 1 file changed, 33 insertions(+), 4 deletions(-)

diff --git a/sound/aoa/codecs/onyx.c b/sound/aoa/codecs/onyx.c
index 04961c456d2c..6e2da2aca2ab 100644
--- a/sound/aoa/codecs/onyx.c
+++ b/sound/aoa/codecs/onyx.c
@@ -32,6 +32,7 @@
 #include <linux/module.h>
 #include <linux/of.h>
 #include <linux/slab.h>
+#include <sound/asoundef.h>
 MODULE_AUTHOR("Johannes Berg <johannes@sipsolutions.net>");
 MODULE_LICENSE("GPL");
 MODULE_DESCRIPTION("pcm3052 (onyx) codec driver for snd-aoa");
@@ -514,8 +515,36 @@ static int onyx_spdif_put(struct snd_kcontrol *kcontrol,
 	return 1;
 }
 
+static int onyx_set_spdif_pcm_rate(struct onyx *onyx, unsigned int rate)
+{
+	u8 dig_info3, fs;
+
+	switch (rate) {
+	case 32000:
+		fs = IEC958_AES3_CON_FS_32000;
+		break;
+	case 44100:
+		fs = IEC958_AES3_CON_FS_44100;
+		break;
+	case 48000:
+		fs = IEC958_AES3_CON_FS_48000;
+		break;
+	default:
+		return -EINVAL;
+	}
+
+	if (onyx_read_register(onyx, ONYX_REG_DIG_INFO3, &dig_info3))
+		return -EBUSY;
+	dig_info3 = (dig_info3 & ~IEC958_AES3_CON_FS) | fs;
+	if (onyx_write_register(onyx, ONYX_REG_DIG_INFO3, dig_info3))
+		return -EBUSY;
+
+	return 0;
+}
+
 static const struct snd_kcontrol_new onyx_spdif_ctrl = {
-	.access =	SNDRV_CTL_ELEM_ACCESS_READWRITE,
+	.access =	SNDRV_CTL_ELEM_ACCESS_READWRITE |
+			SNDRV_CTL_ELEM_ACCESS_VOLATILE,
 	.iface =	SNDRV_CTL_ELEM_IFACE_PCM,
 	.name =		SNDRV_CTL_NAME_IEC958("",PLAYBACK,DEFAULT),
 	.info =		onyx_spdif_info,
@@ -695,9 +724,9 @@ static int onyx_prepare(struct codec_info_item *cii,
 	case 32000:
 	case 44100:
 	case 48000:
-		/* these rates are ok for all outputs */
-		/* FIXME: program spdif channel control bits here so that
-		 *	  userspace doesn't have to if it only plays pcm! */
+		if (onyx->codec.connected & 2)
+			return onyx_set_spdif_pcm_rate(onyx,
+						       substream->runtime->rate);
 		return 0;
 	default:
 		/* got some rate that the digital output can't do,

---
base-commit: f16695c0dc9db64f0a5a9871a10b70daee2653e3
change-id: 20260401-onyx-spdif-pcm-rate-ec45243ae8a3

Best regards,
--  
Cássio Gabriel <cassiogabrielcontato@gmail.com>

