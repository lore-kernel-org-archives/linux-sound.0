Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com [209.85.208.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7AB6E15698D
	for <linux-sound@vger.kernel.org>; Wed, 19 Jun 2024 14:47:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718808434; cv=none; b=N4dU0t1NtkRWAEe9oocLq3cSYFUOqE2Tt33Jfo8yQceLlKj92nTzJBdRC74VjnupSPqLnJB/5j+G/f28Xe815dOaqaI9/YLFji8r8A5rNIa8khBsfLiS1DQtMd/GqyaV344qjFwJ07/kdtTo24a577pTf0vvqeLzF4Kjd2fw10w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718808434; c=relaxed/simple;
	bh=cO45G3J6A2HCrNyifwgmbquTtW1hXtTIuXDjiQ9kiyk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=KuxpI6xU2hcrFQjssGkwbMoN58fTr1YEL9nDpaGo52T+Y7Q8+haybowB3UG4bSJsGG9+kWliSiQ/Z10ibqm+PcxTYU1BbjW0LFOeCG07k/pskMLchsH4bB5KDvGI4h0myFMkWWZpcSostTHRpp9bHooSpiQkAbmc5CAeKfdtPcw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=zRizFSzI; arc=none smtp.client-ip=209.85.208.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="zRizFSzI"
Received: by mail-lj1-f171.google.com with SMTP id 38308e7fff4ca-2eaae2a6dc1so118951521fa.0
        for <linux-sound@vger.kernel.org>; Wed, 19 Jun 2024 07:47:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1718808429; x=1719413229; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YOYHy0wGdKj7gYao1Bs3zuE6VV+046rxXLiuWBbG9as=;
        b=zRizFSzIkYbQVGHPtoXwUYPn4+GzQT4Z5T/C+BJ8ARc7/ZgQkfo6N+DJF4PisTI9N5
         GFNLUU1foCjZaxrS39UhCJA4JVpcdCRo5UEE1odX1XKxAnhLM7TwAa/BkWUx8g1qa9qy
         WAw8slZoFVn5DBxsFtEn4dMGHlr51L8+YEav8V6zLwZN7vEhAiOmQYOs9gJadSaxlHoG
         TYN5XjsHZzbjLkocserP/Pu4VfT8gpoqsYjPwElBaxC7nU99LlA0zzgOiOpKy5MfDmlc
         ciJ6m9mqw98WFsLbjP0ii3aSBdjW+vHOqMYhuuIwENpeanU5jFUqbRir8ZLGi6G1v3kQ
         2w9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718808429; x=1719413229;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YOYHy0wGdKj7gYao1Bs3zuE6VV+046rxXLiuWBbG9as=;
        b=LQI8+j/K4VlSyr6Rt6uBPivpinBZNj4tJHwUuwco4Q8EXj5OQO9p9NvdObrE4ffjY6
         exWfV590M/ddSdh8NIDMqKQPCAiVB/aKw/f3L47naM6/E+Ki12JfH8RsmcyEVEXQmMoF
         UCqeJEyPCYU45bmjqIUpq7MWJMtWrVMvTmWVj9kf5dq0Za4PXMkJYQJFdl3WqQjz+4eG
         P8Rmv8CUtiWsrgmdTVhX4y+c9rvu4ynK4IctLLqh8RhWC+q+4CN4qKaZJcyH2Hknf7wj
         GZb9e0RJHlIdqPPI2NCi+EfuozGCcmQebuF5+Rd34O8jPb7CLA4ju4g6fbQb8/qSEeVp
         qoJQ==
X-Gm-Message-State: AOJu0YxAbmB6zMLOk0sTIFeonAYdS9VCo6nBbPNkhopbIsEsqGSDYPqk
	5uzVXZGoyamhDtVwIRS8PfGz2kdZvjZCAG2Gs531uq3hVMsPvHbJ2c1k1G2CtxQ=
X-Google-Smtp-Source: AGHT+IHZjLCp6uoXlXfqQ0RKu5pWr8gxWPkxcPzzjLNo0AhaIUbrnCYVVlqUcTfIBz485mlGmWKOGQ==
X-Received: by 2002:a2e:2e0c:0:b0:2ea:e2d2:6231 with SMTP id 38308e7fff4ca-2ec3cfe9213mr23132561fa.33.1718808429743;
        Wed, 19 Jun 2024 07:47:09 -0700 (PDT)
Received: from [127.0.1.1] ([93.5.22.158])
        by smtp.googlemail.com with ESMTPSA id a640c23a62f3a-a6f56da32c3sm679787566b.13.2024.06.19.07.47.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Jun 2024 07:47:09 -0700 (PDT)
From: Alexandre Mergnat <amergnat@baylibre.com>
Date: Wed, 19 Jun 2024 16:46:50 +0200
Subject: [PATCH v6 14/16] arm64: defconfig: enable mt8365 sound
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240226-audio-i350-v6-14-f754ec1a7634@baylibre.com>
References: <20240226-audio-i350-v6-0-f754ec1a7634@baylibre.com>
In-Reply-To: <20240226-audio-i350-v6-0-f754ec1a7634@baylibre.com>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Lee Jones <lee@kernel.org>, Flora Fu <flora.fu@mediatek.com>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 Sumit Semwal <sumit.semwal@linaro.org>, 
 =?utf-8?q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: linux-sound@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, linux-media@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org, 
 Alexandre Mergnat <amergnat@baylibre.com>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=860; i=amergnat@baylibre.com;
 h=from:subject:message-id; bh=cO45G3J6A2HCrNyifwgmbquTtW1hXtTIuXDjiQ9kiyk=;
 b=owEBbQKS/ZANAwAKAStGSZ1+MdRFAcsmYgBmcu9Rr31FcrlNuhRLXo8LEdu75PcCTBqW0u596FYF
 k5UOpl+JAjMEAAEKAB0WIQQjG17X8+qqcA5g/osrRkmdfjHURQUCZnLvUQAKCRArRkmdfjHURSe5EA
 DBeGdSSHpPMzGpeI7wNiG5y2VIzwe/IbVqGnCja84KdFBZP60REsnzx06exUV1LY0J0aEVp+sMhom1
 YR0dWD9pSUFYaJ1MieeF+nhaXBAnabOgoVj0YbdL+QP9oLoGBXPYGkxHH5OQE7ARC88nziL+5IjPpg
 F1eCcUCVDfNzlUqAzVZW0mKPDwsqepJWsZc4IwPyPn+AMdNwCcGi95SWV3ZloRUZMsPNCPo62v3dEj
 TluHhrArRuR0DM4rHGp/+FVGYnzvwzYYmTDkAtEKAtUVTXrTUbnmAgTm8iBONqSjmNxyigDMZqOW/G
 xhWA2aObi+dPX5iBDnzzhvSg94lJhQqs4qkE0D/6i4eDZsxw1AjWtpg7w1TXANsbwIon8nZwf2I5eo
 KaqTTsXIyO3eM3s/m5RIscP0UxdM9uV3c0OVe+FhN9QmpUzKs1f9Ncsx10WXBM4f0XNlPfH4V4Czab
 GhH9t9ehABinDvKvUULzLJM7o3OQ1VStF2S1FRkM7piYcYNhscWQsgwyE/0UbNC7YTIEw50G8IX9Wj
 Achaw7Dp8flH8t/Q0+auOQOjQPszi7eCZtAK8CxXrX2ur5u+7O4O8jUAyfITPt/sIogKMEGF94EW71
 cPBz2Spj7AJZW4378p6XZDWDoziFyqixN6TaLC1d/20pIrKQl6S+zpxGRGgQ==
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
index 57a9abe78ee4..24b4d1a4992f 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -950,6 +950,8 @@ CONFIG_SND_SOC_MT8192=m
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

