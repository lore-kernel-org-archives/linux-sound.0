Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F1FE41A4E5
	for <linux-sound@vger.kernel.org>; Thu,  3 Sep 2026 11:28:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788434885; cv=none; b=Mt/TPVgAR0JImkCQMUW2CNHeJy50Wqm9SNLun5lsKblhtYt7T+gPQISf80h8sU8afveBFu7m3EGBKKAkdQnETkCjb+WAQvuKZbRsxG9hXMsMEkiKdwNtSH/QQ6gjtIztNzY0dgrhBFlpR2j102kdJyHGUYQyjVhXa3GLOXpmqmc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788434885; c=relaxed/simple;
	bh=XRpAi5i1Z+CWPXz7fQWZ1j7nFW5lekc1/Hcoyy+O2zQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=fBqIc7SscF7Nf9n6wJgipEGefNk/iAMVNb/cyVGYoHo1UFx21/sIb/u8oVQ1NKnwoVackrkdgZ7NCNLPqGlqQAKQVATKchSxrun3LjKty0wHhgUnX2EuRNKlckizEruDkCVQVvl+rJRtXCx9zpNVjFmmdZ5KijuJ+etklULfJsQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cWSNl8gs; arc=none smtp.client-ip=209.85.210.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cWSNl8gs"
Received: by mail-pf1-f177.google.com with SMTP id d2e1a72fcca58-8541875f596so1022846b3a.0
        for <linux-sound@vger.kernel.org>; Thu, 03 Sep 2026 04:28:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788434881; x=1789039681; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6DSDRRDoLPHiKnDrwS7cordsPoUIfThuJ85SX43JJJA=;
        b=cWSNl8gs8k2b8ZV7Pso96CT5G2rf7Q7wmZx88UNm24wkcx8mid2V2n6j33qLcZEqjh
         FVsnoDhB3TGWmxPiGTaszJxlg7Dq2J8zhFnrvCbENxGi8KrcP5uUPsVKxdNUBNy7W2ZQ
         8cWP+iAQiCPq2mhIqtDEy2lImMyCILo4Xw7VE0/z7XetE17D+ogD5kYFM81hC3Nho1zO
         Np/vVQP4C51zufdwt7JF4luLGE/mWA8tbPoHssIJzpGFMPfbpF1lD2DCjHiXDgZyXTFu
         YEc0J3wa5+yQqdQG+/g/2Povebp6hgpad5nz2i1h1oWo0KCuvVYFtlMxoKZDMdbHcAYk
         c77Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788434881; x=1789039681;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=6DSDRRDoLPHiKnDrwS7cordsPoUIfThuJ85SX43JJJA=;
        b=C8l0nCYoErDRuNl66D1hE0n3EsaWuD5U8p+1IeCBN1bbznBVuX0oP9Ns2WXO4H4lB7
         SDmYULKUtwkqBElHgKwydJtWUAVQsRMFgKjxfHabqYRq5XojJgekOVjC5vqq/4teXBkT
         5l/IZNKzdZN2hKSB2CKQ5vG3K9b3OE0N4U87FvjammdVU8yeKd8yPA5oIqWxjLv0tQUm
         0Xsh0rDsgX/MykALSOZ+yjPkZ6J9hbojgyanZgGy5R4Jio3wjzKrvKe0b1hHW+XDl1TJ
         0Ba9UnsqTcTriOWIjXe7XO3gJrtL/hF/r/DzJOAq8Q+YFFdoCdCMGSi/7SfTcAL1xWGn
         T7DA==
X-Forwarded-Encrypted: i=1; AKwUvBwvo7wbplWks1rvCmz0wnqFBEvLhSaG3jKLpupGjDj6LbA3ELTdg0FWt+Y76prkD/Djp2+dMM3lKFiyQg==@vger.kernel.org
X-Gm-Message-State: AFuF++l0VRK6uNsLxxu7AwlyF7OjdEyx4qIAl3bfRq9tKZbMEx1X3bZo
	TBOudytuOwYCNXEX0hWuySFd5L8j7bnosVndSktyp3KkmWtIXsgPbF7u
X-Gm-Gg: AYBFou2A/8ltXfKOZGQgYs7RnLIJnglyQ01Kx7cQHORYMUn82fxjklfABLsBaiTjGdT
	0xn53kKhSCDKoM4FZon7X9dB+0CK2Nyt3ReKB0B0aJQelYIxdtMqZsrPO79Qu0KSrSYNJQtEL06
	CcPvsjv//MaqaaAgVIa+0gcSszlyzHw2jZCi0tTQk5eYC0Hz7Z9TevENAd1h15ibm35aoUr2TnT
	dOWoeIUiojObFfacbt4XkPGYfnvpAYxhFYnDWoOtgLPasq4F07EoUbgMaVW5+pgVLmh9w9YZQCe
	cOpYzluCctHr3Cwcpo+E7RpMfIH/HmdTbcJWQyTxjydaQxE/940OU2UYWb44PgTfTqy+3J57+vx
	H/4D+Q3BAH5qZdVjfVuhNhQ3HXYM4rPRMPTPeZpGlLEb0bUgI0m11oKxurFKvHQcH90KTGS+6QR
	X9fHMDGz2NU/aP3dELke9eoJPo9yPLplAk3juw78NJi9wVjALErTjve2N8yFWzp3IYMi2/0flP4
	PjG0177KNYWiiwndwAXvOmdWbcGQlGTjqp+Uyy+DxAzyYE6ez5M/MiKMr8KEqhCXLWnkYVewtbe
	NgM2
X-Received: by 2002:a05:6a21:9e0f:b0:3d0:9590:7148 with SMTP id adf61e73a8af0-3d9adcc7c15mr18547929637.17.1788434881320;
        Thu, 03 Sep 2026 04:28:01 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cc43d467134sm856084a12.30.2026.09.03.04.27.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Sep 2026 04:28:01 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Heiko Stuebner <heiko@sntech.de>,
	Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Cc: Sugar Zhang <sugar.zhang@rock-chips.com>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH 2/2] ASoC: rockchip: rockchip_i2s: Handle runtime PM resume failures in set_fmt
Date: Thu,  3 Sep 2026 18:27:39 +0700
Message-ID: <20260903112739.373621-2-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260903112739.373621-1-phucduc.bui@gmail.com>
References: <20260903112739.373621-1-phucduc.bui@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: bui duc phuc <phucduc.bui@gmail.com>

rockchip_i2s_set_fmt() calls pm_runtime_get_sync() before accessing
hardware registers, but ignores its return value.
If the runtime resume fails, the function continues to perform register
accesses while the device state is undefined.
Replace pm_runtime_get_sync() with pm_runtime_resume_and_get() and
return early on failure to avoid unpowered register accesses.

Fixes: 53ca9b9777b9 ("ASoC: rockchip: i2s: Fix regmap_ops hang")
Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/rockchip/rockchip_i2s.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/sound/soc/rockchip/rockchip_i2s.c b/sound/soc/rockchip/rockchip_i2s.c
index 261f36d4c2fd..e7ea71783e37 100644
--- a/sound/soc/rockchip/rockchip_i2s.c
+++ b/sound/soc/rockchip/rockchip_i2s.c
@@ -244,7 +244,9 @@ static int rockchip_i2s_set_fmt(struct snd_soc_dai *cpu_dai,
 	unsigned int mask = 0, val = 0;
 	int ret = 0;
 
-	pm_runtime_get_sync(cpu_dai->dev);
+	ret = pm_runtime_resume_and_get(cpu_dai->dev);
+	if (ret)
+		return ret;
 	mask = I2S_CKR_MSS_MASK;
 	switch (fmt & SND_SOC_DAIFMT_CLOCK_PROVIDER_MASK) {
 	case SND_SOC_DAIFMT_BP_FP:
-- 
2.43.0

