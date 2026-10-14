Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A17CE41D135
	for <linux-sound@vger.kernel.org>; Wed, 14 Oct 2026 06:33:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791959597; cv=none; b=QOsAWRA0HbfT5tms9BCghdDFOYKArpjWugHY/DaXJaEjUAKh7HsdkaGkmC92m6rUuUyXK76O6OmEaxIWSwdhMe/56TqHPpBPE4pXFsCK9KH7Sfk3IiApafxQdfl4P8LT8/MUmiIGTfh7AlwvOvnR1oKtbFX1swSw4LTAzryoxyk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791959597; c=relaxed/simple;
	bh=7bLsNLFv0BET3HGlyxG1JEhRxPCrckEkbWhieR5y9OU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=H6BrbzNbXPLOqPouvZKhPIe+m7kQ/H2VPQqdhWHJdYI8KrSS1pMP/hNX/Q9Cm89vduFkktnKsUCLxlfnlV1bTnevx7HjdYcQkVSXtgqpSA2+m6BRKx7eFgOhDjTuw1wrZNyKflvaOi4L4YtucEo4dV60PP/kPzYSVIoz1chNYwU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=n3F4xJi3; arc=none smtp.client-ip=209.85.216.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="n3F4xJi3"
Received: by mail-pj1-f49.google.com with SMTP id 98e67ed59e1d1-38ec1402b05so29350a91.2
        for <linux-sound@vger.kernel.org>; Tue, 13 Oct 2026 23:33:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791959581; x=1792564381; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=a2ojX+iLeNHEewalV9Bv/DjQVM0k0JpOfvvYHz6MVRw=;
        b=n3F4xJi3lXWVht2gNsEmftbAR7xtWUVGHMwDU4UZnaqpxmJSh871S81S+FFq/EO7xL
         z2t7N+kfjJV2BJ/yPzQrVOU4p0CUJ9t8ucgmMmfqZjDuIH7n1K5HPGDgv5jO9L4kfUD9
         vkO1YExHqNxmEgDK7Qy/EG0rTGEaN4DPM5sULXdzVUYP3uMtH5oy6vdjRzytsTedCwiq
         wN9ULnescn5FbpKVr1Yhtu5iJq/SyU86GWof8wl0hnwJcMTPwQy3nfmPDpc1veyoD9oD
         +26xqkiFvT9BLRr7CgkgbVMLBkQaugg9v6Z0ZacqTb6MhEY+RDfSTIJLftvUmo+CBeJh
         3xEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791959581; x=1792564381;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=a2ojX+iLeNHEewalV9Bv/DjQVM0k0JpOfvvYHz6MVRw=;
        b=P+PMpIuKOLzZZBHnuR6TasTPEI2l9wvkLU+p4r8WoRNrgnWmalQLRuIebGlc4v/SxK
         HfzAc5mjDuj324/OKkzkBD0bwKgTk2LU030s6WA40sH4QaiQ1kbktbVKVrneTq6O721b
         c7n/nDtbrUck1VZTK/XvgYNyzB0maPuHIb3XHUJz+Gu7A0QWAaUQlZ5JYn2HNGjKwHhH
         /jpw05pmIp5Dr9Tm3zlHQjor11h7DGA6tTbqE2U+HSeUUljcM7AViQd5KFm43ad4NqXU
         RsFeIBmch6fKIp3HD+gEZrawxtweX6OR2REqMfDfQ3xZ8mtDQvpYZJqNU6sDGin5QfpM
         9TCA==
X-Forwarded-Encrypted: i=1; AKwUvBz/vIUQwKOQwU/LU3scD/ZHYAd8t074y7OMKsfPutO9A/ZJGj9K0XaAuzFEHFWjrTFfuvQtJK0ec/sfFw==@vger.kernel.org
X-Gm-Message-State: AFq9FYKvlMrJkxY38PJiCGDrjTYfCdn57MScCJQAqvxDzUp9Gtbdgnwq
	HRC0apdPCry1NdHJJ3O/ya5TXoe/B6QQ+CFcBp3VFBbHNKhVbFq4W4aj
X-Gm-Gg: AYBFou2mwJ9OUOMFGARJoFRK93mjG021O8MPHjIa+jxSPd25QCfMXOQ7pPw+fk9qWH9
	uV+u+A2Sbn33P7Qlkps8x2my2hr7HzzAeBOB8aPgcXFfC8Q2wjl0Br9bsLtw2PoTWuEmz0DSP+m
	UIFdl2FySODUQekot7hJ+WHs+oybyAMEfpLmOiEnqThpJ9tcsxLie1t3KpjqJZmcAtQQJBJWn6M
	QPdSziEgkgL1viOCQVgPk+RpmmFUkBVO+62J/3RSujh1tAV1Uzo2xz51lbO2AMUQqyyUmuEMKoj
	Xuo3VlU63La+WFfYHhFlUbdsAzW4k5ug+a1fq3hWTBLYAoPK1XoabBGHatXoaXAULYFL5d2BhcL
	TuPuD6396Tlul7u7O99C9YjjdlrMEQZorsUUkn0jVWNVbnMAEQbKC4satX5HVZ57mTY5KelK4T/
	mzNJw5Q7FY95f099Z9AudQZOmVfw5beAOQdwcvup+TxeE90Y8Bw54tjDvWRSwIS4Rim9frs+nd7
	x/nelCr4KnAzJsCPnhgGVI4bvJtYZs/3RpYAR9msf3+ZO9b/SSrO4Fb3yJCLcr8zSjVy+SxSTg=
X-Received: by 2002:a17:90b:134c:b0:3a8:92a3:8baa with SMTP id 98e67ed59e1d1-3ab3a953bd3mr12388992a91.27.1791959581584;
        Tue, 13 Oct 2026 23:33:01 -0700 (PDT)
Received: from nugod-NUC15CRHU5.tail9f095a.ts.net ([218.237.104.87])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ac600a0619sm3384495a91.7.2026.10.13.23.32.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Oct 2026 23:33:01 -0700 (PDT)
From: HyeongJun An <sammiee5311@gmail.com>
To: broonie@kernel.org
Cc: lgirdwood@gmail.com,
	ckeepax@opensource.cirrus.com,
	patches@opensource.cirrus.com,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 06/13] ASoC: codecs: wm8985: Fix definition of ADC 128x Oversampling control
Date: Wed, 14 Oct 2026 15:32:33 +0900
Message-ID: <00ae032401aaad740b61d664c861b72d2e5ed520.1791959026.git.sammiee5311@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1791959026.git.sammiee5311@gmail.com>
References: <cover.1791959026.git.sammiee5311@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

ADC 128x oversampling (ADCOSR128) is at bit 3 of ADC Control, not at
bit 8, which is the high pass filter enable (HPFEN).

Fixes: 6d6f8b832705 ("ASoC: WM8985: Initial driver")
Assisted-by: Claude:claude-opus-5-5
Signed-off-by: HyeongJun An <sammiee5311@gmail.com>
---
 sound/soc/codecs/wm8985.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/codecs/wm8985.c b/sound/soc/codecs/wm8985.c
index 2a64d5a851da..f400f528321d 100644
--- a/sound/soc/codecs/wm8985.c
+++ b/sound/soc/codecs/wm8985.c
@@ -327,7 +327,7 @@ static const struct snd_kcontrol_new wm8985_common_snd_controls[] = {
 		8, 1, 0, pga_boost_tlv),
 
 	SOC_DOUBLE("ADC Inversion Switch", WM8985_ADC_CONTROL, 0, 1, 1, 0),
-	SOC_SINGLE("ADC 128x Oversampling Switch", WM8985_ADC_CONTROL, 8, 1, 0),
+	SOC_SINGLE("ADC 128x Oversampling Switch", WM8985_ADC_CONTROL, 3, 1, 0),
 
 	SOC_DOUBLE_R_TLV("Playback Volume", WM8985_LEFT_DAC_DIGITAL_VOL,
 		WM8985_RIGHT_DAC_DIGITAL_VOL, 0, 255, 0, dac_tlv),
-- 
2.43.0

