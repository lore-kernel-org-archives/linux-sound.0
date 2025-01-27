Received: from mail-qv1-f53.google.com (mail-qv1-f53.google.com [209.85.219.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F7C957C9F;
	Mon, 27 Jan 2025 16:07:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737994068; cv=none; b=d14BldyxptYr+xUAZ8o3aeHeXcs0enig0PphWYX8z1xB4XfYpTHTfHoy/+QrdBysJhHZCkgZVqVt1pkvyx64ESlfNIvlTas/02R6b6yGXdOuV8tO+GfncUaz5ZNwBg/d4A7z9S7FYqz89HVnbiIx9KIrrl9gqaPBGyLDxMnATQg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737994068; c=relaxed/simple;
	bh=U4lUEMJ0PXksiEtUCgs2Ne88v6K5Xsy4dsYZgbL0JGY=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=FLUblPDKbnvcR+kVSK44b/bR4IABujNz9awSeuFqYUfpUdby57JcO5nWFRNYlo9Mnh2geL3oTfEyzt6Trx/FpnKWi84HiqtYJbTUUEtVs+q7/pbr2s1h1E4OmXAh3JpkobE+buQwSpUHSeBOg9FGc1UBrhCrqMp5Pln6ioMyVrI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Otsp0d9r; arc=none smtp.client-ip=209.85.219.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Otsp0d9r"
Received: by mail-qv1-f53.google.com with SMTP id 6a1803df08f44-6d8de4407f3so4908176d6.0;
        Mon, 27 Jan 2025 08:07:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1737994066; x=1738598866; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=BhfR0ytzdRoeulm5QovmJ+N7NuyoMnehJlCc3iahzTM=;
        b=Otsp0d9rcFIJ+MDO9dK0/+LSWl90lYLC0SzoGg/AA0gGmsVx1+8uGjgRhlhUDVj5It
         fbcfNEnpWyeJ4MaFUUox/u5kEGpvAkJvtEwJlpHj/U8888ZVR9CVvphO2JCdBs65/g5r
         y0DpjbFTiSy6XF2qik/bZ/7XJlKM+n/pPFvHphg7dqkkIr4zBboyQHjLTaCn+fNO+/0C
         2Ht43GW6bVNAH2OgAHaLLsXPzlS/PRQSONKRx6R3M0XXbCIScWUsK6sBBEjzVlOvWY3g
         T+1vYtk6jZ4Ku6kSnJGdxrBzj1kR+bi3rKwk4IRPuP8JYIM0F8c/0bL2snDRAp6IucO6
         yaJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737994066; x=1738598866;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BhfR0ytzdRoeulm5QovmJ+N7NuyoMnehJlCc3iahzTM=;
        b=V00Tj2CUQQ1EKf9+9l2s9a90ojyAGqpjCUT4XckY6DGfqIMt0pze5jMUts1oOc624K
         RwjVPHDXhxcSNEABrwcXsUoTfSXS8cqJCLnfqWrNM0ap7N47NFxAtNjf81JvSnw0dNDT
         vXTeZ6zIVyzEIciahgv/Dq8J+d9XDnN+1Vwg9czTX6/LVYft3ssqVA4o5jGxXhXoGFBo
         ZEBnqRXZaz2SAF6JgIvT758lD29MbyllSfbD3kXxt4WTY6eBiPtfD+FbiGpNOOwXNfNO
         Xo8v/SDLqg+YrXr5vuFkNa6jh/szOHG0LXORxeK/yldCrodK6dVOjBiX2YCGeKQfSJJw
         ftrg==
X-Forwarded-Encrypted: i=1; AJvYcCX8XxblHD+UTMMcax65SQJQ0h+qDlg8M/7zcPJNJsvXRME1TKXhsMaUI2Z5FldBYBM8L0lpbBCfRbF9QvE=@vger.kernel.org
X-Gm-Message-State: AOJu0YwqP3tocqPYkDrm9OYkXp8uGtUNpg2mR8to+ehcep5tLb7FX6Dc
	9p/R/ct/ARiisI0+V4H/ELtwKLe0Dzw2mRYwdEXY8Z5YQMmpNEU=
X-Gm-Gg: ASbGncvbLCiAjdh+ofsUx7lmNeHPu7WY+TyKajsHOhm2VImL3IsV7YrN0ylRV8PqBgD
	b/AsG68nnOOSsgCoDAIqrOssoVIwy5veS28ZInTZ1TWhhurHpesvL910aAfv8cTECfZdwbiNaGU
	DO2M0ywV/YbViYpKGj8/sBO4XRefsxt231QY2PP5Ps8us7ycmMdoq8NRg+qNL778L0t6J+APnRf
	DbOYLH/AP5oFCEkIaA7Xxa9E9qV09xZUIlMfTFAWKAkYMyf/eDvj7YK0S0okvD5ZjMf1Px1ZAOB
X-Google-Smtp-Source: AGHT+IEVMXAfBjj9dbgset2MX0EdpbUhiWhFZorbTSI6OAKYweMxFewBBX3Ag85/tmEAhUW9ABIUmg==
X-Received: by 2002:a05:6214:1301:b0:6d4:2db5:e585 with SMTP id 6a1803df08f44-6e1ee631c4dmr138320056d6.1.1737994065858;
        Mon, 27 Jan 2025 08:07:45 -0800 (PST)
Received: from ise-alpha.. ([2620:0:e00:550a:642:1aff:fee8:511b])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6e2058c2328sm35817456d6.95.2025.01.27.08.07.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jan 2025 08:07:22 -0800 (PST)
From: yangchenyuan <chenyuan0y@gmail.com>
X-Google-Original-From: yangchenyuan <cy1yang@outlook.com>
To: perex@perex.cz,
	tiwai@suse.com,
	viro@zeniv.linux.org.uk,
	brauner@kernel.org,
	pavel.hofman@ivitera.com,
	jbrunet@baylibre.com
Cc: linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	zijie98@gmail.com,
	Chenyuan Yang <chenyuan0y@gmail.com>
Subject: [PATCH] ALSA: pcm: use new array-copying-wrapper
Date: Mon, 27 Jan 2025 10:06:55 -0600
Message-Id: <20250127160655.3119470-1-cy1yang@outlook.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Chenyuan Yang <chenyuan0y@gmail.com>

This is found by our static analysis tool.

pcm_native.c utilizes memdup_user() to copy an array from userspace.

There is a new wrapper, specifically designed for copying arrays. Use
this one instead.

This is similar to the 
commit 3e91a38de1dc ("fbdev: viafb: use new array-copying-wrapper").

Fixes: 67616feda99e ("ALSA: pcm: Unify ioctl functions for playback and capture streams")
Signed-off-by: Chenyuan Yang <chenyuan0y@gmail.com>
---
 sound/core/pcm_native.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/core/pcm_native.c b/sound/core/pcm_native.c
index 8a3384342e8d..6c2b6a62d9d2 100644
--- a/sound/core/pcm_native.c
+++ b/sound/core/pcm_native.c
@@ -3245,7 +3245,7 @@ static int snd_pcm_xfern_frames_ioctl(struct snd_pcm_substream *substream,
 	if (copy_from_user(&xfern, _xfern, sizeof(xfern)))
 		return -EFAULT;
 
-	bufs = memdup_user(xfern.bufs, sizeof(void *) * runtime->channels);
+	bufs = memdup_array_user(xfern.bufs, runtime->channels, sizeof(void *));
 	if (IS_ERR(bufs))
 		return PTR_ERR(bufs);
 	if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK)
-- 
2.34.1

