Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F5B843B4BC
	for <linux-sound@vger.kernel.org>; Sun, 18 Oct 2026 06:47:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792306078; cv=none; b=BR7NNyoyWHap2/dfHlPZCwvIz78sAxeI80Sran7FLTfnAek/zzTF/bDXusNTiMzu943CE1baTE0TyZX4tRHIXbZ5wYuKgYe8GsQKmL6jGLk5YxoCHyBFeEKJ8Re3kVgNJriIXLIoOz/AuBlzHFQEIwywLVjCB0lnqowCmSswXgA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792306078; c=relaxed/simple;
	bh=e+BEb6UlQLW3JtIsBF4GSSPN+/P8k+djo5vfsu3asew=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Q23VfyysCJaniVXD8/MLxptZDevK8x62s0jlSnF2i5Rf2qs9DSm52XShYn5Seu1HxItNn9DoQwvMAqG3d5mWc3aCmYQ/u5o5FNe/xbrcPJbGk7OrCdRKQkq81tVKaE/j9fVHYcd2gIAWA3MFBb7Wi3+rqNUd/sRAhs/sccfKujY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TRbxqCD1; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TRbxqCD1"
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-2e5fb79ce82so5277965ad.0
        for <linux-sound@vger.kernel.org>; Sat, 17 Oct 2026 23:47:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792306077; x=1792910877; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/LPAUeWagHiERAkLycObD1lVxd+UOAdr/y89xz30ssI=;
        b=TRbxqCD10oBDPA/50QuKvZzjUjofZM5wSyVvvA8nakitxfVq1SmNSCZNetX+r2LxlS
         9IE95WPkdYWU2HTbzySNVsXD8kCTRonP9B+yLnURCgG9UsNXSgWHOyTBLgS0+UXvzvEC
         /n77AYf3z8joWIExTUFrsF2erYa/LvkWPWGu2VTmAoKZsy+EIXObX0m9AukYDbCBeeDC
         gXLgl3ZwQF1h04+TZiVj7Kzpxf4BVXvKrpdhjvR/WBL5w1qLeyC7XylbHFB2SoQRmXYL
         jIe2NQaKC2X8RcV9pfVXvyszMvENt3tmWaDZniHxTZ0bfK4wF6yTxLzk/4CaFEd+azLV
         9aqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792306077; x=1792910877;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=/LPAUeWagHiERAkLycObD1lVxd+UOAdr/y89xz30ssI=;
        b=0JcnozXloG/pQ0P5QZdMBVmenKmQXTGlowjDGxwrec0dZd10oPV/u5Dfmy42x7P0HD
         EpmyDnCBLFEKD3pnJrTn74CoR7EwsZ2iqtpPaMaAvbGVj3Ar69fs4ejwicJQsN7YwWvs
         g1fE8IDhG1AT9oP2decqncEIYfcT8JOlbDOmRgc002GH2apvxyyzFealGULBoY9NLGUS
         5D81IjLQAlXfx8kPx2HMAVm8VKuZDK4R220g1j1RufcjbvemFTAnDPO3xFq0QcALBMIL
         m44WtgQdwghGfPULcnsOqqNspvRQOiCyRChwedyotBzNZ1ZixX6qiAgJvUCYpEpoQDu2
         EHdg==
X-Forwarded-Encrypted: i=1; AKwUvBwjV0kkIIypXKt1LjdwuDSzm0Vk2nxri8Vvvdf2VENZUE8CxdbirbvvQxY67Go9p+KJbhvRgCYfD2k7Xg==@vger.kernel.org
X-Gm-Message-State: AFq9FYITrNTJNYpHud/zhajAoC5jSwgWI0xkFpsf9PHlkV+b+M3lKz6d
	VipkkUt2BjPbRu7nuUesT+nADtDhqbu0qLa1HgKUvSL55+137Gyz3ft0
X-Gm-Gg: AYBFou2aJoBp8jE4aiz6wlt96DmQ5HhTX0goXEOq2h7zIx9QSb0J+eG8ckqlSOyCDyc
	Vpe6WbJ84xZwgmX57LW6ys1LWlJbOhPlsFHvy4jkVze+KHGEQY8w9nEUkOYtCoTdx77/zS5pT8O
	Q6bD2HDS60WP4N81FWumpYopAbss4uixORmsV4PiYfSrrpXE8St0XYrbVnZsuknmLuiNhX8TtI8
	yz6+S5VZJ8pIXsxedwF/EnzwU6y0iNpYOS6LJgjiCC47iPx15iNL5aFmGQJauPI9sng2JpeKQ3M
	HxJvgL+tH1V99ZihA0JQHQwsgU1b7t4+r204yABRTz5AQtGN0v6PnK/Ion+H2Tc36FgLWdOdc4w
	mWL0nmfJAQk72aBYLo/axgp045spyxNn7dKM5cbYwvk8zXYYGz96nMBly3y+3F9tJl+j+e4N5sL
	I7xV4pTzXhO06zroX1//lUv5jv5qYYrpcFekpOS2MBdVk7COrliNGKMOeEUq6qrXUuunHXazoLw
	pkSR89uLwfA1QT4V15j3P1ze7xysOUUvRz50KJUmjlAe5jVwNUG99qN4pXUMCHoHXPfvp/JGkU=
X-Received: by 2002:a17:903:3905:b0:2e9:d00d:1306 with SMTP id d9443c01a7336-2e9d00d1929mr12360325ad.36.1792306076861;
        Sat, 17 Oct 2026 23:47:56 -0700 (PDT)
Received: from nugod-NUC15CRHU5.tail9f095a.ts.net ([218.237.104.87])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e97e8b98a9sm27280335ad.74.2026.10.17.23.47.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 17 Oct 2026 23:47:56 -0700 (PDT)
From: HyeongJun An <sammiee5311@gmail.com>
To: broonie@kernel.org
Cc: lgirdwood@gmail.com,
	shenghao-ding@ti.com,
	kevin-lu@ti.com,
	baojun.xu@ti.com,
	sen@ti.com,
	marex@denx.de,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/3] ASoC: codecs: sta32x: Fix definition of limiter threshold controls
Date: Sun, 18 Oct 2026 15:47:44 +0900
Message-ID: <179118fc7680b2b872d1f917b7fd21f54a73a6d8.1792135145.git.sammiee5311@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1792135145.git.sammiee5311@gmail.com>
References: <cover.1792135145.git.sammiee5311@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The limiter attack and release thresholds are the two 4-bit halves of
one register, so their maximum is 15, not 16. With 16 the controls on
bits 3:0 also write bit 4, which belongs to the other threshold.

Fixes: c034abf6e503 ("ASoC: add STA32X codec driver")
Assisted-by: Claude:claude-opus-5-5
Signed-off-by: HyeongJun An <sammiee5311@gmail.com>
---
 sound/soc/codecs/sta32x.c | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/sound/soc/codecs/sta32x.c b/sound/soc/codecs/sta32x.c
index 1e4a19769618..773a9b203456 100644
--- a/sound/soc/codecs/sta32x.c
+++ b/sound/soc/codecs/sta32x.c
@@ -507,21 +507,21 @@ SOC_ENUM("Limiter2 Release Rate (dB/ms)", sta32x_limiter2_release_rate_enum),
  * two different enum definitions; provide both
  */
 SOC_SINGLE_TLV("Limiter1 Attack Threshold (AC Mode)", STA32X_L1ATRT, STA32X_LxA_SHIFT,
-	       16, 0, sta32x_limiter_ac_attack_tlv),
+	       15, 0, sta32x_limiter_ac_attack_tlv),
 SOC_SINGLE_TLV("Limiter2 Attack Threshold (AC Mode)", STA32X_L2ATRT, STA32X_LxA_SHIFT,
-	       16, 0, sta32x_limiter_ac_attack_tlv),
+	       15, 0, sta32x_limiter_ac_attack_tlv),
 SOC_SINGLE_TLV("Limiter1 Release Threshold (AC Mode)", STA32X_L1ATRT, STA32X_LxR_SHIFT,
-	       16, 0, sta32x_limiter_ac_release_tlv),
+	       15, 0, sta32x_limiter_ac_release_tlv),
 SOC_SINGLE_TLV("Limiter2 Release Threshold (AC Mode)", STA32X_L2ATRT, STA32X_LxR_SHIFT,
-	       16, 0, sta32x_limiter_ac_release_tlv),
+	       15, 0, sta32x_limiter_ac_release_tlv),
 SOC_SINGLE_TLV("Limiter1 Attack Threshold (DRC Mode)", STA32X_L1ATRT, STA32X_LxA_SHIFT,
-	       16, 0, sta32x_limiter_drc_attack_tlv),
+	       15, 0, sta32x_limiter_drc_attack_tlv),
 SOC_SINGLE_TLV("Limiter2 Attack Threshold (DRC Mode)", STA32X_L2ATRT, STA32X_LxA_SHIFT,
-	       16, 0, sta32x_limiter_drc_attack_tlv),
+	       15, 0, sta32x_limiter_drc_attack_tlv),
 SOC_SINGLE_TLV("Limiter1 Release Threshold (DRC Mode)", STA32X_L1ATRT, STA32X_LxR_SHIFT,
-	       16, 0, sta32x_limiter_drc_release_tlv),
+	       15, 0, sta32x_limiter_drc_release_tlv),
 SOC_SINGLE_TLV("Limiter2 Release Threshold (DRC Mode)", STA32X_L2ATRT, STA32X_LxR_SHIFT,
-	       16, 0, sta32x_limiter_drc_release_tlv),
+	       15, 0, sta32x_limiter_drc_release_tlv),
 
 BIQUAD_COEFS("Ch1 - Biquad 1", 0),
 BIQUAD_COEFS("Ch1 - Biquad 2", 5),
-- 
2.43.0

