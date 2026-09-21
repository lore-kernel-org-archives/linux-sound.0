Received: from mail-pz2-f43.google.com (mail-pz2-f43.google.com [74.125.228.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99286194C96
	for <linux-sound@vger.kernel.org>; Mon, 21 Sep 2026 02:44:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789958653; cv=none; b=jcGkJAtAcU37X1dEORNgqYaPpqjpSJJocZ1lSL482t0bqawJU5gWmBKJAIfWQKdCxBlRIxcp03NSF5cu+pyyoMtXXOPG+Ud3XvmO5YpGKVtzQT2YEUBaKGEgmSgHKIoavUe9j/kaaIceROr6ZZqn6O3/7goVU92Ib9a11xF0QSc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789958653; c=relaxed/simple;
	bh=6QsF3BJyS1Tx2+Q734PigXUlUsK6C2ZWsao8yBHz3F8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=OHOC+XCSzRq2PkJWmnpgBTgPUrrCylPJdxs5hY7XR9qkiZU37hvVOewZWQt3EgsAgEiPDSZ5vTtNr3BQ+AV4avRAmskGBW4S17ajC7/D9YkyLg0PRAY+hXmxb1+DI9b8sho7WjPGvq2aVVY9qG+3J0J4RZ1W5xH3MEAuvdClEYo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Fdc5KBeI; arc=none smtp.client-ip=74.125.228.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Fdc5KBeI"
Received: by mail-pz2-f43.google.com with SMTP id d2e1a72fcca58-85469a34908so2261946b3a.0
        for <linux-sound@vger.kernel.org>; Sun, 20 Sep 2026 19:44:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789958652; x=1790563452; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=GA8yU0qhjadXwW8wCXQaNUsG3cJ9ydAokzsVwPJZYp8=;
        b=Fdc5KBeIShlZKBu+iMzSmU3X5+SfL2+i7I/o7/sjmLUVBVymzXDHpf0juP3QWj53Pc
         EjS8rG3fpdHhhMdiSKbHk7Pk96GRP3LMNvH31eHtjFyzgrF2za/tkU880E8aYT+CJHwQ
         M2lMCp3yl5GLiIny7QCokr3FAyDc7Vgku6GX6TC13ww248J9jSnVk4wpIESJhRLZ4uNH
         su2bnPVBsZw/FQ8KKfwUg2+sK4qWINcJC/orUBpnhvM0IfNh2XnO93TXDWX/lmmlEY9C
         G45tBNf5ZY1rNKG0OluG1vPJh6C946DpCvM0dGd6jtz2xJPT5CyCtrIqxgMLlLKh75nD
         v+SQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789958652; x=1790563452;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GA8yU0qhjadXwW8wCXQaNUsG3cJ9ydAokzsVwPJZYp8=;
        b=mEBLyI+PZHyAFeYd09qn3PBlbRgZ5J+clih8wmS+PBXlxbai3t1aIhY3IrW2Zq1IGU
         holUx5QIC+URCoOtfa74+CO86UnaAznle6nWbLJ6NfGghM6/D5EzRaqhrdiFXbVkezZr
         NRyiP1fWImMrZLQTzRyz5DLr50s8c+KRceAdmt2WtAUjG/m7TaRJ8NHj4IqEnLDFS1D0
         SRFZdg6ggJfL8fY1WcX/sCWJ1iY9zSQFfvwH6kIE5RUdlbemra0YXKGLNqVEMkULxq4p
         hmvzU/SL18eNzQAxZRe9EsBO+BVG6DVj9HUBTpnb82g8eIuUfLg7SBJYL6iKmLBwVc9S
         uTYA==
X-Gm-Message-State: AFuF++naPfrC7UrYvl7jjQHl+4xDw35eQx3u3bOuJTgeNJJWiqvNZXT1
	PpQgEirA+qTKdBmT3H+5tEos2edneww7LB2GWNuW+/5/pfj1aRpkUPRE
X-Gm-Gg: AYBFou3sz9GfBV+wh4sld2VMjgaMYXoAzhV4mDX1Y1Fbslf/6EB6LZiNFR2KDdubwdj
	GPgBUQB6EzyGsWYwRNBN7qyF2zKAdPkk/wdo2Mlsq5SHrVF3U0GDGMiswIsKY0Uutre23iVtwYu
	MoUG/76NePDtdA7zyq0swcZ15gKMeKGAxWw/T73Y3R05qzYB43wfFiExMGT5VFmMuQFVOWoNRpx
	jNRWbUhja91dGg5Q7qiYOuItpN9vtXFiT94Cn7xwYwG7f5LM/zHdW1qBoCyyhiFJ231Nv76x6tz
	VYdGEf9yxOABf8myEVxUCzdHtq6vdqb29KE/xSyd603YK2R3BtR0dfoS+2UFbx93bRXMA8E1i5h
	vsAWDx+EWXsCFdfchtBQ7cMOYb4mUgwOW4+f9etmRL8YSjgRGQtap1bYIP5yBfb6NTeRiHBqTzd
	X8Cj+uTrvQXITmWD1gfFkSvQjD2AIqeSO5l9T6QxlmuRBaLXu5ds8nfqakCjkNJXjsPkJ77FFrj
	tFlmZ+UCnn9HaTSiKbOJtAF7FkfISkl9MSyYrG1bLglfX6TJ4D8zySGF7ZVHa4m5vk42bIxKQbM
X-Received: by 2002:a05:6a00:4403:b0:870:ef71:e8c8 with SMTP id d2e1a72fcca58-874dc1f748amr14067287b3a.12.1789958651857;
        Sun, 20 Sep 2026 19:44:11 -0700 (PDT)
Received: from achilles-zhang-ubuntu (ec2-3-39-185-208.ap-northeast-2.compute.amazonaws.com. [3.39.185.208])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-877aa5f8098sm2463684b3a.54.2026.09.20.19.44.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 20 Sep 2026 19:44:11 -0700 (PDT)
From: Achilles Zhang <bnqzzdf@gmail.com>
To: Takashi Iwai <tiwai@suse.com>,
	Jaroslav Kysela <perex@perex.cz>
Cc: linux-sound@vger.kernel.org,
	Achilles Zhang <bnqzzdf@gmail.com>
Subject: [PATCH] ALSA: usb-audio: Add native DSD quirk for HiBy FC4
Date: Mon, 21 Sep 2026 10:43:43 +0800
Message-ID: <20260921024344.391912-1-bnqzzdf@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The HiBy FC4 with USB ID 32bb:0004 advertises its native DSD
stream as UAC2 RAW_DATA with a 4-byte, 32-bit subslot. Without a
quirk snd-usb-audio leaves this alternate setting as
SNDRV_PCM_FORMAT_SPECIAL, so userspace cannot select a native DSD
format.

Mark the device with QUIRK_FLAG_DSD_RAW so the existing generic raw
DSD handling exposes the stream as DSD_U32_BE.

Tested on an FC4 at DSD256. With the quirk the playback alternate
setting changes from SPECIAL to DSD_U32_BE and reports DOP=0,
bitrev=0; native DSD256 playback works correctly.

Signed-off-by: Achilles Zhang <bnqzzdf@gmail.com>
---
 sound/usb/quirks.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/sound/usb/quirks.c b/sound/usb/quirks.c
index c587090..924d930 100644
--- a/sound/usb/quirks.c
+++ b/sound/usb/quirks.c
@@ -2542,6 +2542,8 @@ static const struct usb_audio_quirk_flags_table quirk_flags_table[] = {
 		   QUIRK_FLAG_IGNORE_CTL_ERROR),
 	DEVICE_FLG(0x3255, 0x0000, /* Luxman D-10X */
 		   QUIRK_FLAG_ITF_USB_DSD_DAC | QUIRK_FLAG_CTL_MSG_DELAY),
+	DEVICE_FLG(0x32bb, 0x0004, /* HiBy FC4 */
+		   QUIRK_FLAG_DSD_RAW),
 	DEVICE_FLG(0x3302, 0x17c2, /* TTGK Technology USB-C Audio */
 		   QUIRK_FLAG_FORCE_IFACE_RESET | QUIRK_FLAG_IFACE_DELAY),
 	DEVICE_FLG(0x339b, 0x3a07, /* Synaptics HONOR USB-C HEADSET */
-- 
2.53.0

