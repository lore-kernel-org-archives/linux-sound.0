Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1177197A9E
	for <linux-sound@vger.kernel.org>; Thu,  5 Sep 2024 09:07:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725527259; cv=none; b=dutlDpmLvnXUsqrie+DQgMBTZr0bkNcoJoyvKuUkqimzKhUZS1xCTQgSZhc3cXb/dXoLIGTdczFZaPeBo8V1E9mmzesSZjPnYo12MXsq80b8aE0ggqgzhcrNIrYPON5zgYI2lqBkSWllw2/NcZo2tBRInL/gMLQB49XREmGC0bE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725527259; c=relaxed/simple;
	bh=HPABLM/OnGZ5eICgnPMApPSABlUQgJEpPt3kZFnmNiE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=kDxVzx1dybbcRsj5SwfLN4jZDSkB/o5ewV3pKrkWRCVPHBM9Nxeno/5VvfvHkbsEWJAY6Z4r9mUnaQGBIgvobiL3Au6oY+0ry6q4XLD1FBPH2Zz9K+ulY0Ju4Q+O7SvddbxXXUD50bwLOgHoGm5o/FSe3JA7umdiqirjhdT25vU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=vVFOzEbO; arc=none smtp.client-ip=209.85.167.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="vVFOzEbO"
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-535be093a43so614894e87.3
        for <linux-sound@vger.kernel.org>; Thu, 05 Sep 2024 02:07:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1725527256; x=1726132056; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sJk7f2N+HA1Y6YzjwIRAJ/Lk0gofxkpiCV/2fVty4rY=;
        b=vVFOzEbOUZgUn47l0HRCPYwBO0rPNehyJ6R2mrT8q3N4Hc+l+dB3fivWSXa49IRgXi
         hGO6Kr4b7eyGinZX5Cw5cfhJyWwQMHBLZghfeeIT0GhPY7gRXcjvgpGkwHYW+UYSggyg
         U5v/MkhQocMDlwDGpuR5mA+xCuRxFOJP6TUj+Awugs0+4Wq9c97t4/eKraPAk88sdnhg
         lb1rwjHX5+y7iW+YL21dobiQgafRoyruY3Z0keI94VeZLiWWZjL8Aa2i5nbnMmjimOIT
         6UkVdw8dLCG8YgmMdtgfIODzbRfiCXWfs7+MDAC+tM5+bFXPF4StvTzecwzgixE/w/ea
         b9nA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725527256; x=1726132056;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sJk7f2N+HA1Y6YzjwIRAJ/Lk0gofxkpiCV/2fVty4rY=;
        b=P4nP9A22O4+jhSOeFGzONH7HsFgPis7A1BCjN4MhQQEaTBSe4ADcBmbjLfB9xJT6iN
         Uf1MK2JyANW7ISZbfApQSpLcBVlW5WZJbC7gzKaUhwOK01Lvtpeb7MBvha4+iG7DE7p2
         dFiOyTAk1LbZRtNokykkb0MkYVW0rFArTl4qSvtwLCygP/l1zcUlH1oZlq2aEptMHJNZ
         Id4oVXRoemN1D7qt05sfUdx1DGZwpO8CZ1QsFdSqOxh1lIA7CIGWzvug2ooXVNq1xkVj
         eo3iSAYmclei9/hIwopsO6mt+JblKb4Sy/EbuSY2m0f9Hd6GTxJWREmgQ6IzBzGWjGb7
         LcKA==
X-Forwarded-Encrypted: i=1; AJvYcCWaJCEaPVf+xkYa4ViiUc5w0JPcYFWuqah2/PuC7eeWCghaYeupV/8kDnRLJ2mYg1NHl30hozu/A0T70w==@vger.kernel.org
X-Gm-Message-State: AOJu0YyAxhPQcXJ/6rAEd97Qi/P7ReIlUlt8UpObReXiMmG+4K0ds/Cp
	VZEMrI3/LHf1YWc03RfpD0Naf1lxqzRhHlaKj9feLUGZ8xOML8Du1KbyoCOriNo=
X-Google-Smtp-Source: AGHT+IFs8+VMCCS+jvh6TTSKud0Ey/SyfqlH/srAGZesQOhIuMZ5vqWUCBd0aestqPfkgml3SydqPA==
X-Received: by 2002:a05:6512:3ba4:b0:536:54df:bffc with SMTP id 2adb3069b0e04-53654dfc0bfmr209480e87.42.1725527255868;
        Thu, 05 Sep 2024 02:07:35 -0700 (PDT)
Received: from [127.0.1.1] (88-127-185-239.subs.proxad.net. [88.127.185.239])
        by smtp.googlemail.com with ESMTPSA id 2adb3069b0e04-535406e5549sm2554188e87.0.2024.09.05.02.07.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Sep 2024 02:07:34 -0700 (PDT)
From: Alexandre Mergnat <amergnat@baylibre.com>
Date: Thu, 05 Sep 2024 11:07:00 +0200
Subject: [PATCH v8 3/5] arm64: defconfig: enable mt8365 sound
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240226-audio-i350-v8-3-e80a57d026ce@baylibre.com>
References: <20240226-audio-i350-v8-0-e80a57d026ce@baylibre.com>
In-Reply-To: <20240226-audio-i350-v8-0-e80a57d026ce@baylibre.com>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-sound@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 devicetree@vger.kernel.org, Alexandre Mergnat <amergnat@baylibre.com>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=860; i=amergnat@baylibre.com;
 h=from:subject:message-id; bh=HPABLM/OnGZ5eICgnPMApPSABlUQgJEpPt3kZFnmNiE=;
 b=owEBbQKS/ZANAwAKAStGSZ1+MdRFAcsmYgBm2XTOMW5lIAoANVUKUNDjH+dxaohjK3Cg1k73auR7
 KtwDIkeJAjMEAAEKAB0WIQQjG17X8+qqcA5g/osrRkmdfjHURQUCZtl0zgAKCRArRkmdfjHURYzmD/
 9kuyyW6NXuGmylKkT8Lrr4g3YkhzIPfFVZCQsY4nytNGeCmkXCbrkeO2hPOSlf5C3lDOxMnSyztQK+
 0oLE+S2mI7YzhByUJhn/ymca/pPjCymqbCU1GXashLEjhAj00dnGMT4TisoKoSYvSN6DjuMnSao9Wf
 RX+69s1kLd8Z0MAE/fRQ/sPO76DiMIC4HSB94TXQo4gT3yffokHSL7foENi6RLFQKift+ChqquEShU
 NArgj4QJUxnPcYVTUzjTJ2Nj1BJKuXJ8hZodMpPzh79/xNAMl5a5sJ0pdqKphHEocUA+gj3D2TQ6cC
 QPHJmp5KWWNKpFxxnmTa1/obNNO5/JnZdaIe52+HhJHFWAh/HmYnNsgpXYjYKCf9eJq4fQLSOR+uTE
 U3ukEGHz2s4elO+D9DhagDnEGOhkuCB8cBO/R4q9ddsPKk22GVQ5vI4CjoA3oBWqzm4XL70ObdW2pk
 m76P2sh4/MJGXyJgYLHXx+QAAW2yXYbPXtdxsAyVX5THSIKoCYDVBlaV0IgB2su3tu/93btyEYPp+F
 7oHcBHI+AJ5zchHbjKeY7rsgjcP9QETbJCPRNBFGq8wJFi7e2FtgeN/qISxLVafBNv3zt91H2GAFzT
 ooZbNfHZoP3g1tUrIXVLzJZypq1oIlOMuPgZvtWGQcJbkAQf6uSfF9niW9IQ==
X-Developer-Key: i=amergnat@baylibre.com; a=openpgp;
 fpr=231B5ED7F3EAAA700E60FE8B2B46499D7E31D445

Enable the MediaTek MT8365-EVK sound support.

The audio feature is handled by the MT8365 SoC and
the MT6357 PMIC codec audio.

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Signed-off-by: Alexandre Mergnat <amergnat@baylibre.com>
---
 arch/arm64/configs/defconfig | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index 7d32fca64996..111ca3abd651 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -960,6 +960,8 @@ CONFIG_SND_SOC_MT8192=m
 CONFIG_SND_SOC_MT8192_MT6359_RT1015_RT5682=m
 CONFIG_SND_SOC_MT8195=m
 CONFIG_SND_SOC_MT8195_MT6359=m
+CONFIG_SND_SOC_MT8365=m
+CONFIG_SND_SOC_MT8365_MT6357=m
 CONFIG_SND_MESON_AXG_SOUND_CARD=m
 CONFIG_SND_MESON_GX_SOUND_CARD=m
 CONFIG_SND_SOC_QCOM=m

-- 
2.25.1

