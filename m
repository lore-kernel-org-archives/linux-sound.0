Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CD1A23EA95
	for <linux-sound@vger.kernel.org>; Thu,  8 Jan 2026 15:44:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767887066; cv=none; b=F6X9YFieSjUdoBCiPMcUhOea21Q9Tt9jKyX7zeg1gCuo13LjApF5cBtPrLUc/NO7QBFca6EDjrnyNGt1u2kWrJLIrIoa5xP2blJSkv8Ogf66q1ByDQlgdruZ53aRfAYlZJf9HbUZhnJXovHKRD9noL4DNA7j8X5seTLVAKIxdtc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767887066; c=relaxed/simple;
	bh=Ao12BqEQyfQ/4Pen7/TZc8Hd7KoQVTDoRAU7Lr7jEk0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=HDvdD2pDlv/E3dQTBWjhvHxw5vWXBYfrAzPQ9pQBd9B3riHd3pfzxgMvRs2dfYPnxRTrX+p402wDhxtUBRbI/g30hCA28WNygD14Wxrgnpyaq3FrLQbR2HBMMXGW4xWIBh32UiLYs9a6yi/vLZfAwEp7QSTFlNAkK6yRke6iR7Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=Kx4m2SVC; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="Kx4m2SVC"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-47d1d8a49f5so22543215e9.3
        for <linux-sound@vger.kernel.org>; Thu, 08 Jan 2026 07:44:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1767887063; x=1768491863; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=RRHfUTN65/SxhjcPxe9tauiwI0lIQzUFNXk8Xbx52M4=;
        b=Kx4m2SVCqeAY7tafhNMcsbXsx+l13vqUok1k056CVpNtGzW8hZWHalN5l9QC1sfR2L
         NDpRVe6zWOSvs1Hm6gXOlmbalAROGPtzIn0E3KcOmoQojfwCIlJUzhWQREAuj3UM6zEb
         QRdyaeyV5R3vus7XjCUkmQ63nd0XPWzpviM8Q9SPH1IxdRhyuJAfEPtmVkktrVPBZej+
         sXalT7yjAayHmnJigMPJ11qdm8yXLCe6vQHUFPsLT3QRbOpAHemjlVdd3uOCQ2oRR+Dz
         /70Cv133vbXhi9TKF76yKAJPqul/tJwmBt29dEz7H4bPzXR0wwNZ98w8sMMdWe4I+HCk
         nUuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767887063; x=1768491863;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RRHfUTN65/SxhjcPxe9tauiwI0lIQzUFNXk8Xbx52M4=;
        b=KLagfFQH7MA5lcy5rz7K4ko9r5DNsnNLu2pXpwOHtn+i0NyLJ/FZtah0mGaM/bnYlR
         t0Mscy4agCvoFzEIxsbjJYQgkVxAFLyV9HaZTsSh+fpKO+gxs+thnCaWcWr6vI1+59ZA
         TmjqcD9pnJDvnOFSoNeO6+1ZS7SYzQwNkC3MGtGwxeGzMwn7GYlXSmdkwwT0rRP0PfLx
         V1VV5GTjgcnw/i03+GH3bGUA9u+SQQZzw+R9rMw3dxB8DzfMFOHukX/qOiWIJg1glfu1
         0IH9URONsgH8FEZxDmYhIVYEnSAgLcQz05uFeHOdChPfuc7OCiqyL3fi5KIJmywcAIGF
         vpfQ==
X-Forwarded-Encrypted: i=1; AJvYcCVRYe1QLwSY9r6tJL94+Mcp+IfYVgUwNDhuw0SpveJO1dSWv1rJMgMda6YDD2jI0m0Z0+nIxVAB5gQyng==@vger.kernel.org
X-Gm-Message-State: AOJu0Yyo23XNwryI1U69UoA2jAkHtgkxMwCOhSD4M4c6VHy712FKKcGl
	fRtVwgpcaO92/cMhcPotFVEUbCHtVcPy4aTkO+ZJPfIBxvFcOmMsvlJ5RH4KBG1WiKQ=
X-Gm-Gg: AY/fxX62PHNnqh4vSt5NbuY0iBd5FN4jua7CikYeVSjXX/Zmi/jf6eRfjHzz3Tk3Sxu
	p8dZ0jipMXAJ7QrHpQrQqvle/PXRq/vrNpdq7QjZudbQEebdENotRKREqSwU+UGL7PN6+Pg3kwh
	uW1BPSgbO/1F4tabD1JNcGQOLuKKbZXG2tCah2eEnSE8dmKWfVe5GVmyZgW6hqX2G2cROm4JjMt
	JkwWuEUASEZNYwkeCR4mLCHJ6Ud599Q2IEWuOec+MNGEFkfjygi/mnbO6mOI7Elj/w3dnn6WsKj
	pf+tyQ2cM/njcPsv1xGcn8OufzwwZOMN6HV/B28pWwnq8Yb/Zt1c76Y7BVedjvrxkvjXrAPBrZG
	aYsNGio3h9GRBm/oQephC6E+rkB6MR3R4issYzott6NK30G2kY0ITYSLcUga+mZcIH+uEEGAanw
	6oZiNR0sfRUnCM3NSiXSXKr9XStrBJO24UijrB3C0=
X-Google-Smtp-Source: AGHT+IETPnYZXqExdCivpdjsKulzUOEgjQ0J3xxIoqwbGCRPDT9f98ykDgpeuTsfhR8kg/LMaaclTg==
X-Received: by 2002:a05:600c:3484:b0:479:2a0b:180d with SMTP id 5b1f17b1804b1-47d84b20fd7mr80173425e9.11.1767887063254;
        Thu, 08 Jan 2026 07:44:23 -0800 (PST)
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.17])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47d87018bbbsm45244345e9.1.2026.01.08.07.44.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Jan 2026 07:44:22 -0800 (PST)
From: Claudiu <claudiu.beznea@tuxon.dev>
X-Google-Original-From: Claudiu <claudiu.beznea.uj@bp.renesas.com>
To: support.opensource@diasemi.com,
	lgirdwood@gmail.com,
	broonie@kernel.org,
	perex@perex.cz,
	tiwai@suse.com
Cc: claudiu.beznea@tuxon.dev,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Subject: [PATCH] ASoC: codecs: da7213: Move comma operator at the end of the line
Date: Thu,  8 Jan 2026 17:44:19 +0200
Message-ID: <20260108154419.3580562-1-claudiu.beznea.uj@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

Move the comma operator to the end of the line to comply with the
coding style.

Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
---
 sound/soc/codecs/da7213.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/soc/codecs/da7213.c b/sound/soc/codecs/da7213.c
index 0a2b50cdea95..19f69a523f22 100644
--- a/sound/soc/codecs/da7213.c
+++ b/sound/soc/codecs/da7213.c
@@ -79,8 +79,8 @@ static const char * const da7213_audio_hpf_corner_txt[] = {
 };
 
 static SOC_ENUM_SINGLE_DECL(da7213_dac_audio_hpf_corner,
-			    DA7213_DAC_FILTERS1
-			    , DA7213_AUDIO_HPF_CORNER_SHIFT,
+			    DA7213_DAC_FILTERS1,
+			    DA7213_AUDIO_HPF_CORNER_SHIFT,
 			    da7213_audio_hpf_corner_txt);
 
 static SOC_ENUM_SINGLE_DECL(da7213_adc_audio_hpf_corner,
-- 
2.43.0

