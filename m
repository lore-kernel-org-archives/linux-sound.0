Received: from mail-pz2-f43.google.com (mail-pz2-f43.google.com [74.125.228.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A21F446BF8
	for <linux-sound@vger.kernel.org>; Sun, 20 Sep 2026 13:53:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789912418; cv=none; b=nl2YO65X/g9TwYdhcFtIMsyYghxDJJ6mhqPLcQxY6wvdXEi+pJU/YpnjW7l5/He45nTdPmYErSNbEz98h2LfLmUtWC73LCxkruLgKEfjgf5NM4I52/7sH505LIxocd7wT7QR9U2j0EunjoAxBs2p6ZdQqgNTIP6bselGURzvQWA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789912418; c=relaxed/simple;
	bh=uW+z/E+3Nf0l9eOVLYAYFxYc51vyvoT/poRq9xAMQqg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=D5dukFG4aa3fyuHw1DVh7H4yaptS+vQ2akB2iPk2EreQVQEN81Z0SBsOfsR25Fg9Fqw+FPfIIWQSawA9PAJT9qYDlTV8N+iS+LxgQ/oPLwr4OrlvFcvKPyoVOTadIirdNBLIOr6rM9AUJcYuwhwlb94ETxXrXUPhocfycIWKJcQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CeGFIzxs; arc=none smtp.client-ip=74.125.228.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CeGFIzxs"
Received: by mail-pz2-f43.google.com with SMTP id d2e1a72fcca58-8686f46e4adso1861578b3a.0
        for <linux-sound@vger.kernel.org>; Sun, 20 Sep 2026 06:53:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789912414; x=1790517214; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Ra+b4sm+WuJgb9+5+fBPfFdOVsdxf2Vh8VhRH35l2S0=;
        b=CeGFIzxsO3CIF+ifCad/axI2H/Kpr25RewsuAbgEIOTwNPO9vHdfTq/riNKqXlP4+9
         tOQmAxg2YB5nbElXEf9+w7QJ+Iptfh8gJJjCnVL5c7tK9waOhXkmDyZKYILSNxc/C+Zm
         0NSiBdPNVEQDYWgYEeAUgVOTx/8TOKrvBAgc5aWtUK7w2tvKlxOWyptPleino33qF+f/
         NJQ6llMtjXlykdsRpLSbGMa9VMcdoazUPlyVCnyBIjnGicyx6jwv62BKEf51HUpqXvlD
         eOS6j2XxyKnvFHAesj11mzSaOLx6i0MiSL7zuE5kF+NFKqyMseboC6IhKlmj1jl3zqCy
         eHOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789912414; x=1790517214;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Ra+b4sm+WuJgb9+5+fBPfFdOVsdxf2Vh8VhRH35l2S0=;
        b=k1JEAal4qgV3CP5r4R+e0U/qHykbgm1K14J+fXfBe8yB9dbyoO63xW0wmj9Ocd3PSA
         +vOXKD99tYgYnrmJaExPpnZlvbZ+kuF5qnlZwYawfml1nyur5Msmu+ibI/vSxvWi9q7o
         yap/ET47DfoxBiAEYO8VEL3g8DH8CvauOiEAlq8qPWQTcYXqHP+EG3zk9XeXPMp/aLmQ
         QLBVGtdHjmgOb36Y7bVJbJKXbSeq8wOcdj0m1TrmVX6fYLglo4HmHVjQBv1h8bamdDkT
         ugdWfGqM+etaDCn12m9WaEK8lqbEqETprkIMDRYYeLCpJlrLv0GWCr+kENI5tRc/KDgn
         ka1g==
X-Forwarded-Encrypted: i=1; AKwUvBz2Kn+jTLmCBkE6l3V83l7/ICNYZYIf7fNDLFM2BzzmxJiwtGZAc60TYpSykUb6ccTinIbDRk9qf+6+dw==@vger.kernel.org
X-Gm-Message-State: AFuF++lVIQ1iWIdaOILuvA8eRfYw0nHNWRfDqn8RP5fCVT0Yfhpc1Vn9
	qA1R4ZvUzz0WoZyJ1hnDVFmJIlpZLZMgpfudN6VlUsqiUreO/kAr/hhf
X-Gm-Gg: AYBFou126xsEdd8N+cL4ao3pOciQExBGjDi6nsCGQzQhlP66FuSvh3x2DX/zmGZGaRc
	/5wW6KY73G3CEejbovG1YOdqU+drl/CbW8ege5+N/OcIbgx7ij+pg/Lx2ws8xgDtv59Tgq62/0/
	usSTkLVQejOF79QfhbG+hxQ1HKeY79xVxxiumj63DulD8IMhGAOiontkNqys9gZ2uOROxHnJMTq
	83q9VX1okvCCXd72NYXjmVjRpQgtWkxcfWYgb5rjFaek+O4n9JaTj/QEggMIHjrGkzpxYk+bxCx
	QYGCXCo1ckvyP3oa68cR1zBqVzXo6fWdFQGU80QE0qXVgALjS3wmJ3av8OMGhk69055Ctncq6iw
	8u1K8lPYm+iYXtF1bvVDV9ecQ/b/ki5ACdQeH41NurSOOlBxYBbAfjbNh1J1iOG0LoHblHwSBIk
	CNXr2O1+UYoc72Q+QqnWffCtMGfERAvPVisozxrsN4R/BPpItqHQozWjFOz42EFdzMCJ3DyVKyk
	BTpn0nz686g9U+bwkyYf1O3TlSwsit9wv1j8AmB0r06eW+VhSHnnLiH0hslKlyAmFxRIWZqQxQ2
	mbwCwPi+cSk=
X-Received: by 2002:a05:6a00:856:b0:878:34d7:6a2a with SMTP id d2e1a72fcca58-87834d76ec7mr4506194b3a.44.1789912413762;
        Sun, 20 Sep 2026 06:53:33 -0700 (PDT)
Received: from nugod-NUC15CRHU5.tail9f095a.ts.net ([218.237.104.87])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-877aa4fd913sm2034729b3a.55.2026.09.20.06.53.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 20 Sep 2026 06:53:33 -0700 (PDT)
From: HyeongJun An <sammiee5311@gmail.com>
To: lgirdwood@gmail.com,
	broonie@kernel.org
Cc: perex@perex.cz,
	tiwai@suse.com,
	ckeepax@opensource.cirrus.com,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	HyeongJun An <sammiee5311@gmail.com>
Subject: [PATCH] ASoC: wm8903: Move the DRC QR threshold to the register that holds it
Date: Sun, 20 Sep 2026 22:53:27 +0900
Message-ID: <20260920135327.3628704-1-sammiee5311@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The DRC_THRESH_QR field is bits 7 and 6 of DRC_1, but the control sits on
DRC_0. Its shift and max are right for the field, only the register is
wrong.

Those bits of DRC_0 belong to DRC_STARTUP_GAIN, which "DRC Startup
Volume" claims as bits 10 to 6. So the two controls share bits 7 and 6.
Writing either one moves the other, and the quick release threshold is
never reached at all.

The six fields of DRC_1 tile it exactly, so there is nowhere else the
threshold could live. Point the control at DRC_1.

Found by a sweep for two controls claiming the same bits of one
register. No board with this codec was to hand, the register map is
the driver's own wm8903.h.

Fixes: f1c0a02f32f8 ("ALSA: ASoC: Add WM8903 CODEC driver")
Signed-off-by: HyeongJun An <sammiee5311@gmail.com>
Assisted-by: Claude:claude-opus-5
---
 sound/soc/codecs/wm8903.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/codecs/wm8903.c b/sound/soc/codecs/wm8903.c
index 156e1e24a388..fbf388cf966d 100644
--- a/sound/soc/codecs/wm8903.c
+++ b/sound/soc/codecs/wm8903.c
@@ -676,7 +676,7 @@ SOC_ENUM("DRC Decay Rate", drc_decay),
 SOC_ENUM("DRC FF Delay", drc_ff_delay),
 SOC_SINGLE("DRC Anticlip Switch", WM8903_DRC_0, 1, 1, 0),
 SOC_SINGLE("DRC QR Switch", WM8903_DRC_0, 2, 1, 0),
-SOC_SINGLE_TLV("DRC QR Threshold Volume", WM8903_DRC_0, 6, 3, 0, drc_tlv_max),
+SOC_SINGLE_TLV("DRC QR Threshold Volume", WM8903_DRC_1, 6, 3, 0, drc_tlv_max),
 SOC_ENUM("DRC QR Decay Rate", drc_qr_decay),
 SOC_SINGLE("DRC Smoothing Switch", WM8903_DRC_0, 3, 1, 0),
 SOC_SINGLE("DRC Smoothing Hysteresis Switch", WM8903_DRC_0, 0, 1, 0),
-- 
2.43.0

