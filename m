Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC9BF41DEE0
	for <linux-sound@vger.kernel.org>; Tue, 28 Jul 2026 22:22:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785277368; cv=none; b=qI0KCWckFcOM+KtkQk6k9QBc8A/tNBuT2VFGt1bPU9xJTS4Yl8YhrdfF/kn526xPWpnAz2+k1AXCqJTnYI1pfoX51CRhJLdWfhE2AanM8jXKu8h9b8jK0jG0tM9z13dfed1HkNJaQD3Q9bK5MDKw29lCiOFCCLoHAQL8/G8AMXY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785277368; c=relaxed/simple;
	bh=rTn4CE5PZ1Ab4oR4xQ7GMX1koTAWw84oQCP3eU41dko=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=S5N3aSUpot/u2iHkB7L6C+zZ7GKByHfcTJCQdbZGoWGx/iQqNBZTbweVOdr8AV3TJmuCoptbcCXDGyydxMcBIJXrKwrCCY5/SRSn4I3IJ4KqhsX8mA7EkCKiSd8QEj9NmhzhMdhXsOjn0AUt7Umq8H9BJq8y51yckKqDQ2kAz7M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=qyA5hrXi; arc=none smtp.client-ip=209.85.167.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="qyA5hrXi"
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-5b013aa02b2so1656944e87.0
        for <linux-sound@vger.kernel.org>; Tue, 28 Jul 2026 15:22:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785277365; x=1785882165; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=UNHt91EwyxjpUNicV0LVE8eKrSS/noXw9SS9l+jds1o=;
        b=qyA5hrXiYUGj/aLNwJlgjHsZ5FQKa0hQU4IDqwSvxqNwQjYxNuy5HcP3tyPKkvR+Ft
         dgWTyPwhsRWVHfOlrjkAv1lOaa6n1Ztu5Mi2+8CvhXiYLfFUE0eAKBGddsXYgr3ZSb54
         sIh4H0PWacrLZ0WvmSxQ1x7opcafCfjX3uOMdqvT2MXd9XnHKUM8/o9yV7NjmBytsTz3
         oq7qAK3soa/0UNOr3mUz3B8kXfKJ8UaB03EOuQOiaHQKZU2OiAEJ9HS6zOnnKLVz0o3b
         75a0PaBxhtQZywrOI4izAdMS9MIvFhpEEjkVFyCT8iZZHaiWIiwyydePuAW78XeLpu7K
         xjrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785277365; x=1785882165;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=UNHt91EwyxjpUNicV0LVE8eKrSS/noXw9SS9l+jds1o=;
        b=Gmy3pa7RfPe+fVX3mcfx3ApMow8Un/6JvHzOf/Wc+2A0Pd0CQfhfdLhww6b9mZ1UYG
         0yTTl5RMn6Dhx+tENeDG20v3mJNpWIdvAYb6Mjaez3sjLyodUWfuwS5L7CD7btO4hHOB
         /2p1dU1SPyyTvAi3cBYIBRWl8/D03fKkG/zG/Ad4TI+6g4nEMfUHVeBgWqEF1URVN1y3
         Z0Mk9aKgbjCKUzgg9o4jbZOG0wPJ4C1E2pzDA1ngADuqAcl/AC5Jb4rHOz56ndEp3ZIk
         j5RE57J2/OFEwqT2oROfa+piGchiZinKwDGyTBvWEAfgC3X03DwEYNGs1Y9meQdx6NtA
         XkoQ==
X-Gm-Message-State: AOJu0YxdJmNYkOxjYPCwT8lq4NUO89ybqnr16pZ2+vTuBuTFr6VdkI+R
	muBzq2To+T3X5zWpihknzagswSVUitAznAwOVaGM9KG+WwMXVBh/mL0THfYbFlL+SwR3ow==
X-Gm-Gg: AR+sD11n/lFdU6k0WjLn+hE40cl9wIRs2un8MKUdx/fCetl86lsvAqXjdtRfon9FpLK
	4cldbpuczDvUprW0yJF+JFZghb7xT38DbsVMRMAPEzyULdQ198gtdV9O8GNBr+oX68C3MAB3yCi
	yKXQoTM7isaBbjpuEL2VaYCc0OuXK4o0amuvx2vGItulUVEYT5pfxiDxQblwvIWKHPt9m8Bdf+l
	+TPnD1HvJ5ljsGaboqqOdY1s+P4ahWPUaMdE9MtqOjI3XccxLOGAyLgT4EgjPawvfnywYPqKs8Q
	7cpn/3Z9yx+vi4Zvj2IphJ/OEVAGat19mRIs81VHxo4upQKe3d8knLiJL860ccxaOTLw6e45FrN
	5NR+ORjew7mDbbQKhtRi8DiLOMrITbxvGRKzuLP4GU+LjtrjDSCQgHF49e05qNDHRjWklbrCMTp
	VNHaaBQxlFr8A/bsBwCpRyDD1VeSrJrFmKzJDkFVxHWqAro/qhM6SO8jtcy9iBF5vAAdwY/g0=
X-Received: by 2002:a05:6512:64a4:b0:5ae:ba20:9772 with SMTP id 2adb3069b0e04-5b2d0251f3fmr857799e87.23.1785277364639;
        Tue, 28 Jul 2026 15:22:44 -0700 (PDT)
Received: from localhost ([188.234.148.119])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b2d7697241sm69188e87.1.2026.07.28.15.22.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Jul 2026 15:22:44 -0700 (PDT)
From: Mikhail Gavrilov <mikhail.v.gavrilov@gmail.com>
To: Takashi Iwai <tiwai@suse.com>,
	Jaroslav Kysela <perex@perex.cz>
Cc: linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Mikhail Gavrilov <mikhail.v.gavrilov@gmail.com>
Subject: [PATCH] ALSA: usb-audio: Add GET_SAMPLE_RATE quirk for C-Media CM6206
Date: Wed, 29 Jul 2026 03:22:39 +0500
Message-ID: <20260728222239.62749-1-mikhail.v.gavrilov@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The C-Media CM6206 (0d8c:0102) truncates the three-byte sample rate it
returns for UAC_GET_CUR to its two low bytes.  After the rate has been
set to 96000 (0x017700) the device reports back 30464 (0x007700).

At probe time the driver initializes every altsetting to its maximum
rate, so altsetting 5 is set to 96000 and the warning appears on each
plug-in, before anything has opened the device:

  usb 3-1.3: 1:5 Set sample rate 96000, clock 0
  usb 3-1.3: current rate 30464 is different from the runtime rate 96000

That altsetting is the one parse_audio_format_rates_v1() already fixes
up for this chip, so this affects every CM6206.

Only the read-back is broken, the rate itself is applied: a 1 kHz sine
rendered at 96 kHz is recovered at 1000.2 Hz, and a silent fallback to
48000 would have been reported as 0x00bb80 rather than as the low half
of the requested rate.

Add a QUIRK_FLAG_GET_SAMPLE_RATE entry for the device so the read-back
is skipped.  Setting the same flag through the quirk_flags module
parameter makes the warning disappear while the 96000 init still
happens.

Signed-off-by: Mikhail Gavrilov <mikhail.v.gavrilov@gmail.com>
---
 sound/usb/quirks.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/sound/usb/quirks.c b/sound/usb/quirks.c
index 0de7c9d94259..18d252de19ec 100644
--- a/sound/usb/quirks.c
+++ b/sound/usb/quirks.c
@@ -2342,6 +2342,8 @@ static const struct usb_audio_quirk_flags_table quirk_flags_table[] = {
 		   QUIRK_FLAG_MIXER_PLAYBACK_MIN_MUTE),
 	DEVICE_FLG(0x0d8c, 0x0014, /* C-Media */
 		   QUIRK_FLAG_CTL_MSG_DELAY_1M | QUIRK_FLAG_MIXER_PLAYBACK_MIN_MUTE),
+	DEVICE_FLG(0x0d8c, 0x0102, /* C-Media CM6206 */
+		   QUIRK_FLAG_GET_SAMPLE_RATE),
 	DEVICE_FLG(0x0e0b, 0xfa01, /* Feaulle Rainbow */
 		   QUIRK_FLAG_GET_SAMPLE_RATE | QUIRK_FLAG_MIXER_PLAYBACK_MIN_MUTE),
 	DEVICE_FLG(0x0ecb, 0x205c, /* JBL Quantum610 Wireless */
-- 
2.55.0

