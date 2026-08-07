Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59F7A3446C0
	for <linux-sound@vger.kernel.org>; Fri,  7 Aug 2026 11:42:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786102970; cv=none; b=WvXhbbObTt5atkK2rJnzK82m5m9g2lmDf6mzQv1xEpT+2H90i7I70515o9pRFuWeimgjPTO+5kSVkKpshJngWfbfs8dwkjCG8ulNo3AK9GQ79Tg8/dEJE0ADrxin1/G4jiqLY42/UvxC/gEFx1L1lb9EPjlsQrKKQ3Jz7by45MM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786102970; c=relaxed/simple;
	bh=6vnc70YAJ6OLk1J5alGQJ847XnOiFkHduNWP2sl7tdI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Oa+cNO5rpBdwhKrOV2qc/kB0X2svsoUHKZyCcKVvjH8/+IyX5tm+s146BVAYexQpnHA6bGf7/ztGplJIcVOwbd5If4WEwxooCcZXNtoFVaE2EcHub/DNqExahWL68bf3XXTVQSfMahB18M2DMBFO+uR+yPAneuM1HlKm+nqIyEc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IDirJw0Q; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IDirJw0Q"
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-2ce98cb8165so23026425ad.1
        for <linux-sound@vger.kernel.org>; Fri, 07 Aug 2026 04:42:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786102960; x=1786707760; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Z1KI6aLTxpK9OyfSdZpf8ALQPnrnsIJtqqHlV920g9A=;
        b=IDirJw0QVCfsqiJJche1uiEG/btukFbvJiDq7LLpM+wWZQS+a60MZy8op5kd42mRDH
         G53psNggZsTqLlJFiCvkkVQugVHQcSj/g74lSFgEW+mYh9pS0HRPOWIGGjyBFN2q2J0i
         jC4ceJYNxUvgRbOAM82cy6HWrCqg+yr4K5W+P9135DXiIRJLR3vgKSSRA/HzNih9K9IP
         O1eP5XKUmyvsnry8uSfAcMxtYkpKV7WmaEQ8DFfX/5HmGjRrRx06QZigSi2uPgm3uen0
         gFbTiYq5K/37xY2E+2gnTK6umQh8Nw3UTnlFs7fn1glvpV+xlcS4prHR/5El+Ri/GG7C
         bJeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786102960; x=1786707760;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Z1KI6aLTxpK9OyfSdZpf8ALQPnrnsIJtqqHlV920g9A=;
        b=Pgt9m9q+EZxIZIYmqSDFng30b/IlYEibTNLJgCdvcGc3STm+TZVIyTe+13qwPCMRrr
         5n6y2g/ghAU7Vo9IX1vXBmNCE16f1AbqPa18uMUAKcSGK7FSV3YS+fLPbNyPyLXZxRFa
         Di+XielZUNHYXvRJO/x8IaP6YAxhhB+pH2SJkDfbQ/YLMEtzxg8XIQh9MpsE3fz5+cih
         VPxGgYGFZNnk3MjjdKbCMWZcNASAM5NygPrCfm5ZE50xB145WZ/dVxM3yGDgAd/yVtOW
         qV6scwFD9bUZxW2MGSFP7wEElYSHNbj25ksdsfgCNpxfQrejRpe6OK6zUfoI+HuPWBov
         TYmA==
X-Forwarded-Encrypted: i=1; AHgh+Rpr6RbvL/NJ3S8GBL+JTMZCNBj2qkwQ5L6A+osDwG5TmY4g7LMog7uJ1VifdWxeTfPycVY2nXJBAeVOKg==@vger.kernel.org
X-Gm-Message-State: AOJu0YzCedyExBeVl48h/xbDQ4JSsSCP83GKRTQad7B/wusqjRWYUFQw
	C+OWF30RQ9n+IedkB9IS4Qj3g+9N+dwjGy3DZgmiGqd16eDCojz6TXLx
X-Gm-Gg: AR+sD10fhWBtLtg9Kntrlj68JCdpc8rrVsSSY+/TusvqLFd1216W+l2zyppCfvkjPLt
	uu2L3M8c7wUeqCGL2MJHA4ZuzVvwxrMLX1liN6QfdHRlI8vb8G6OqOXmqeHK5PX+o6xiEc+pJn2
	QAsYSaLQJtVoTwMW1rLuDRu0sZDJyLUU6c7uuD19vcfvSuZdSf85PLXtX7lHz3u+TETtlwd0Ze8
	v5+bTKHKD4zNb3BgO7LE9WV6ngETFQb1VmHDKv01zgx7buFbEavKFVH9f5dBw3mFcM1mi28lR9m
	mEwUZaCy8lnopVB22H1s6FjbCQ2Wn4PtIumahzhdWENWMkCJGpEcXPlDeCN+h2qyXeGfLqtCOWr
	nTFmMQB+PXe+JRFeDHoiNi3Vv+E1EBkaliLawQu29ASLVDBZcyvB30slqAIUkoDSwrEQ/i4BiBx
	HbyK9YfXKFOjmJcMDB8NXJ8EqyUu9YSBP0VArnOHN8pQsUHlzVqzqzKD5j+l5uar4+4A7nYb7He
	YuL9c4+aJI=
X-Received: by 2002:a17:903:3885:b0:2cf:af20:4254 with SMTP id d9443c01a7336-2d0f1c0dc3dmr168401505ad.10.1786102959690;
        Fri, 07 Aug 2026 04:42:39 -0700 (PDT)
Received: from localhost.localdomain ([72.255.58.127])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-315be86d3fcsm6930508eec.4.2026.08.07.04.42.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Aug 2026 04:42:39 -0700 (PDT)
From: Mahad Ibrahim <mahad.ibrahim.dev@gmail.com>
To: Takashi Iwai <tiwai@suse.com>,
	Jaroslav Kysela <perex@perex.cz>
Cc: Kees Cook <kees@kernel.org>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Mahad Ibrahim <mahad.ibrahim.dev@gmail.com>
Subject: [PATCH 7/7] ALSA: usb-audio: replace strlcat() in longname construction
Date: Fri,  7 Aug 2026 11:41:39 +0000
Message-ID: <20260807114139.1661-8-mahad.ibrahim.dev@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260807114139.1661-1-mahad.ibrahim.dev@gmail.com>
References: <20260807114139.1661-1-mahad.ibrahim.dev@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

card->longname was assembled from a chain of strlcat() calls covering
the vendor or manufacturer name, the short name, the USB path and the
speed suffix. The return value of one of them was reused as the
offset for usb_make_path().

Keep the current length in len and write each piece at that offset,
with scnprintf() where a format is involved and strscpy() for the
plain speed suffixes. len is taken again after strim(), which
shortens the string in place, and again after usb_make_path(), which
writes into the buffer directly. Both would otherwise leave the
offset pointing at the wrong byte.

As in the hiface conversion, len now counts characters written rather
than requested, so the bounds check before usb_make_path() is always
true; in the truncated case it writes only the NUL terminator that is
already there. The strings produced for every combination of vendor,
manufacturer, short name and link speed are byte for byte the same as
before.

Signed-off-by: Mahad Ibrahim <mahad.ibrahim.dev@gmail.com>
---
 sound/usb/card.c | 27 +++++++++++++++++----------
 1 file changed, 17 insertions(+), 10 deletions(-)

diff --git a/sound/usb/card.c b/sound/usb/card.c
index 24112e491779..3c15a6862046 100644
--- a/sound/usb/card.c
+++ b/sound/usb/card.c
@@ -651,7 +651,7 @@ static void usb_audio_make_longname(struct usb_device *dev,
 	struct snd_card *card = chip->card;
 	const struct usb_audio_device_name *preset;
 	const char *s = NULL;
-	int len;
+	int len = 0;
 
 	preset = lookup_device_name(chip->usb_id);
 
@@ -675,32 +675,39 @@ static void usb_audio_make_longname(struct usb_device *dev,
 
 	if (*card->longname) {
 		strim(card->longname);
+		len = strlen(card->longname);
 		if (*card->longname)
-			strlcat(card->longname, " ", sizeof(card->longname));
+			len += scnprintf(card->longname + len,
+					 sizeof(card->longname) - len, " ");
 	}
 
-	strlcat(card->longname, card->shortname, sizeof(card->longname));
-
-	len = strlcat(card->longname, " at ", sizeof(card->longname));
+	len += scnprintf(card->longname + len, sizeof(card->longname) - len,
+			 "%s at ", card->shortname);
 
 	if (len < sizeof(card->longname))
 		usb_make_path(dev, card->longname + len, sizeof(card->longname) - len);
 
+	len = strlen(card->longname);
 	switch (snd_usb_get_speed(dev)) {
 	case USB_SPEED_LOW:
-		strlcat(card->longname, ", low speed", sizeof(card->longname));
+		strscpy(card->longname + len, ", low speed",
+			sizeof(card->longname) - len);
 		break;
 	case USB_SPEED_FULL:
-		strlcat(card->longname, ", full speed", sizeof(card->longname));
+		strscpy(card->longname + len, ", full speed",
+			sizeof(card->longname) - len);
 		break;
 	case USB_SPEED_HIGH:
-		strlcat(card->longname, ", high speed", sizeof(card->longname));
+		strscpy(card->longname + len, ", high speed",
+			sizeof(card->longname) - len);
 		break;
 	case USB_SPEED_SUPER:
-		strlcat(card->longname, ", super speed", sizeof(card->longname));
+		strscpy(card->longname + len, ", super speed",
+			sizeof(card->longname) - len);
 		break;
 	case USB_SPEED_SUPER_PLUS:
-		strlcat(card->longname, ", super speed plus", sizeof(card->longname));
+		strscpy(card->longname + len, ", super speed plus",
+			sizeof(card->longname) - len);
 		break;
 	default:
 		break;
-- 
2.54.0

