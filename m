Received: from mail-vk1-f177.google.com (mail-vk1-f177.google.com [209.85.221.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 524D017BED0
	for <linux-sound@vger.kernel.org>; Sun, 19 Jul 2026 09:00:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784451645; cv=none; b=sdEq0sHzp/ityaZmTjQ1e7qGYerFjY2d9iKY5ygeIg+Xe2zqjRSRrVXOVWuEOWW5LgQhTPwpyqXwBA5wjOp/Da8gdulDie7xOV9vWwd0lE8MXN3+uIXTnDNa20ubT1z2AhuxZZFAhLSU/hyNfUDcG+QA9U2F64P9rrPVR93u5gQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784451645; c=relaxed/simple;
	bh=9dYNFhAKpR0XQwSnynhyj/LiPfC6ppcMT9B8FcM25q4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=N+MaollTUbXDk9h/FDiz0I7kX9Sr8Sp+X1gtSfEMayUgBywuf/r3TbC33mCjX0YKDh6vzB8p5JNEDr/7m/sSqwvp9e09+zH+rAiC681nPKNEse9SLLUqIjozHAPt3WfTreUiR2PIUxIJPimJfHRGgfiOlXaBUa9ib1cEYjmzS/4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mVS8pojL; arc=none smtp.client-ip=209.85.221.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mVS8pojL"
Received: by mail-vk1-f177.google.com with SMTP id 71dfb90a1353d-5bf62388d17so2004737e0c.3
        for <linux-sound@vger.kernel.org>; Sun, 19 Jul 2026 02:00:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784451643; x=1785056443; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=+acCkA7GrZP3DG4Y3Ko22gvaNC7QyPw03/ZzkXuRbd4=;
        b=mVS8pojLcCAhcwbMGRJSSDX0ERJMmQ01f56lhYKpx+uwm8oPZutLIKFM87XkZAATxu
         8JaDhFxnmi7ks1plCus/eAyMod9Bj/yVSN7G8KG7g8NktHgVNqZercDpHJOh95k26J7e
         1h9xD878Oaz3Az4+g3ADoq/cLfEvFv/+6SJYXDQ7BjMDPMXwWBSAWStjnJFUaFVfX9tU
         jWv/3C7fSptviK/QCYXcPK3bzWgIduyoYabJjBMq3QjQI4fT15/Y6XZp669i0xVu3183
         2zqHMElzUD9Z9nYhTFgDq5+G0KEGX4gb+TmZTtMUeT0G0OXK7O4lTDSLt3Q88tW/NzpA
         Bvqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784451643; x=1785056443;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+acCkA7GrZP3DG4Y3Ko22gvaNC7QyPw03/ZzkXuRbd4=;
        b=qn4qZuAFeXvkDbI73Aump2ycossaF0+kmliSuKbuqep+RZSMOVEEfxF1/sh85A213c
         EROHZaIRR27I0CcAK4zC8z04gviFhGUreCJxLuX4fuN/33dYn2XEH95xMR+Ps4XCr+W2
         fOjUXuSC71pFCipmSVsYfTlxouUR3mLjt7gVjdkSQ11RPyyYBZ4I/J+kpS7dHwLqw8Lb
         RryD818J2dOkzm9BeEBuzsEKk2lTP7XY+K5rPfu5yxUEkhXx39mcYcurQaJIEP+gp3hD
         jg+4UEU7XAKuhYjjXksoggALUcju0shplINJpUgBUY6wx9o/rCkgK3o5I390gWOPY0y/
         gKaQ==
X-Gm-Message-State: AOJu0YzqHAQy6esFioxv+tLkj+4O8ptA5mgFR2fVaA+dMcZD3OYKvAeg
	LDdIm3X9tWhEjWe7qnTu6fpH0ZV+PN8RAmUgQCC7q8dxol5yIwRevGYr
X-Gm-Gg: AfdE7cljes+bxyoUUEH3etCgdCUAM57Q+7WzPzDds2ZOOIDFIQMyDmXsOFSqfYB065j
	VdMHzStFqusNPx2Uh0cqKBuLhUGfmcTLP1ffKFtIhbwEY+rc6xnQxEhPg7LnSlkfiREH8l3dF/l
	FYhiojSIBiR+7sgnMIjghaDoKVUhfnYAPTHWznYH4CzTDrnLu2oto/LJWwMhAK9FJeIWwbUm/xR
	GOBlzlnQdw9NN5KVxCVFGQoqRda4nC0Fl2IglIrBlyq43cqz8lHxc/Phkval79qqucFlYlmnGn7
	3yKX1tRYhgj+Z+ONfbFbW8d2ZRXL41g1AyD7bENedQc08ZCPXnW4e9IfMqDQGAc/ECElkW4bT3d
	dI1Fnvmyj3FzRDsKmq/+U14lOMqAJQjIqJNh9UuUAmocsRGZqliig+dB7FtxP8m+z5RhVpenvCB
	3TXf82jbnsN8wGOfN/TF9/0i3uY6lrEHlsEV4m6qFQHYARiIJWobGB2xJO44Jie7ILzej1zGc=
X-Received: by 2002:a05:6122:82a5:b0:5bf:6b19:2762 with SMTP id 71dfb90a1353d-5c1b68d2b59mr1486727e0c.7.1784451642983;
        Sun, 19 Jul 2026 02:00:42 -0700 (PDT)
Received: from millennium-falcon.tail826d87.ts.net ([200.233.231.142])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5c1f6c5111dsm5136517e0c.14.2026.07.19.02.00.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Jul 2026 02:00:42 -0700 (PDT)
From: "Daniel C. Ribeiro" <dcoutinho.96@gmail.com>
To: Takashi Iwai <tiwai@suse.com>,
	Jaroslav Kysela <perex@perex.cz>
Cc: linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	dcoutinho.96@gmail.com,
	d.r.ribeiro@outlook.com
Subject: [PATCH] ALSA: usb-audio: Add FIXED_RATE quirk for JBL Quantum650 Wireless
Date: Sun, 19 Jul 2026 06:00:37 -0300
Message-ID: <20260719090037.40149-1-dcoutinho.96@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

JBL Quantum650 Wireless (0ecb:2125) requires the same workaround that
was used for JBL Quantum610 and Quantum810 for limiting the sample rate.
Without it, the capture (microphone) stream fails to work.  Setting the
QUIRK_FLAG_FIXED_RATE flag, as done for the sibling models, makes both
playback and capture work correctly.

Signed-off-by: Daniel C. Ribeiro <dcoutinho.96@gmail.com>
---
 sound/usb/quirks.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/sound/usb/quirks.c b/sound/usb/quirks.c
index 41149561aa06..0de7c9d94259 100644
--- a/sound/usb/quirks.c
+++ b/sound/usb/quirks.c
@@ -2346,6 +2346,8 @@ static const struct usb_audio_quirk_flags_table quirk_flags_table[] = {
 		   QUIRK_FLAG_GET_SAMPLE_RATE | QUIRK_FLAG_MIXER_PLAYBACK_MIN_MUTE),
 	DEVICE_FLG(0x0ecb, 0x205c, /* JBL Quantum610 Wireless */
 		   QUIRK_FLAG_FIXED_RATE),
+	DEVICE_FLG(0x0ecb, 0x2125, /* JBL Quantum650 Wireless */
+		   QUIRK_FLAG_FIXED_RATE),
 	DEVICE_FLG(0x0ecb, 0x2069, /* JBL Quantum810 Wireless */
 		   QUIRK_FLAG_FIXED_RATE),
 	DEVICE_FLG(0x0fd9, 0x0008, /* Hauppauge HVR-950Q */
-- 
2.43.0

