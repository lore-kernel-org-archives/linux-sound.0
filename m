Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DBF33B2BB
	for <linux-sound@vger.kernel.org>; Tue, 22 Oct 2024 03:31:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729567899; cv=none; b=CqRegzzphTaXlYysBTmgIfPZ+qQ92z76/or9Xy+peGkRBAGgzcxsPA9xjteZ9WEMar4dsO4WgMvs/XPz+VvB1T07EVQKM79GjlYMrQEJ/FguxDvo4/qlcANy4pgWj4krLh8dw4Bs4njpqGr+m8KJVC8IHzVw+9zwX/qoCsCAONw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729567899; c=relaxed/simple;
	bh=KlYS0u+UdAyAAPyvPaxQwNeaRW79KZNHr8momw/teMc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=mqj90YvLsn/EGj9Ue0F6OstjLI45ZqTHVnA+prmXVL+Tr7Yc+viH4wtElStwwXj+oFMv2Q5Kp+ryIHy/t9PNiwR55OhMRY3uW9HragpomkL/OPtTfCsz9+SkX8ygGHT6M6kyV+yaboYSMAtp4WelnW9+ZPToLzdC45W8jfoA6H8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=wfYxC/IN; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="wfYxC/IN"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4315839a7c9so56699435e9.3
        for <linux-sound@vger.kernel.org>; Mon, 21 Oct 2024 20:31:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1729567896; x=1730172696; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XnGrvWyEkfJGt/0DtGtUAuajOGPJlvd3hyTQL/5+oQU=;
        b=wfYxC/INd+q0EidBB+EDUXKxsV7PUfelOAXdiFG0BcMVPWe9sRCkWZtebP7Wryu2hq
         1VUNoCzgyP2fTE6d6CEnbL7K55CCcNvvK+PtPSe+fmUFfRwEtAm/XWWpE1gAZfMWNWch
         fpZGsXrPEyu0QmFmwTbACfSs0amIzYYjD3su9YW1+ndQXv4zX5XX6nCKuN1p9cPGcM90
         rNQ4czF4fag3LRduZ6iLgJBVD1CmnxW+k8y4ulUUDgcTrYQePbNX775uZlR88zi8Y2Ru
         zRvmo5XwtEgLX4cZWrHd1ufh/+T9pYuUB0HI8E1D+a3xZ6ot2nKfgGajG2DqecZyjq7z
         MydQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729567896; x=1730172696;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XnGrvWyEkfJGt/0DtGtUAuajOGPJlvd3hyTQL/5+oQU=;
        b=lIrP8E/JKeEUE4IlG1PTMi8S5i2u9VrVwNoioZtGOHmwsvN40mzzEvp578tVV0v2WV
         VyKqA3cclzhbIngFzESMYpbtwMFRfd1C3C/eBmr88Ad1hd6WtDG7KQxjHTKKUkbRWc4A
         zB6OD+5d+Nl+tG9tw1hgl8rV+yx8gtZENnOm1AgC9EqOKaG0eoAYcL1kAdU5VLiMwW5+
         pdGJ78iP7NW8uKUWvKEQ9zWLQ3D87DfizXqCVbAn+yUVp57zXe5vroo/ye3MmAgEGSMn
         yiFqEwRCB86zmg8UxGZP4oqXb0umTquqiBWCW+VeWIR1eRv+8+MBJ4m3G074RC5b2oUX
         tF3A==
X-Gm-Message-State: AOJu0YxHKofkfC9W5SdJ+FzNIxe2ao3TpBwsO/uX5knnfUBIC5URPskw
	xfFwXGcm34r4MfpkYPOJOQ2xYN1ckqFgJ9xUm70kE/AjJ4eH319zcyTuSgfOMj8=
X-Google-Smtp-Source: AGHT+IFuE/kXInfVZsurmtQHN+jwzqaTxF7tmY59sYJo7LsBOCzg3DUkV15bKsOh9KTl27pnowbuhA==
X-Received: by 2002:a05:600c:1c29:b0:431:5df7:b337 with SMTP id 5b1f17b1804b1-4316163b55emr101507355e9.8.1729567896395;
        Mon, 21 Oct 2024 20:31:36 -0700 (PDT)
Received: from localhost.localdomain ([2.125.184.148])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4317d03ea4asm4768455e9.0.2024.10.21.20.31.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Oct 2024 20:31:36 -0700 (PDT)
From: Alexey Klimov <alexey.klimov@linaro.org>
To: srinivas.kandagatla@linaro.org,
	quic_pkumpatl@quicinc.com,
	a39.skl@gmail.com,
	quic_mohs@quicinc.com
Cc: linux-sound@vger.kernel.org,
	krzysztof.kozlowski@linaro.org,
	lgirdwood@gmail.com,
	broonie@kernel.org,
	perex@perex.cz,
	tiwai@suse.com,
	dmitry.baryshkov@linaro.org,
	linux-kernel@vger.kernel.org
Subject: [RFC PATCH 1/2] ASoC: codecs: wcd937x: add missing LO Switch control
Date: Tue, 22 Oct 2024 04:31:30 +0100
Message-ID: <20241022033132.787416-2-alexey.klimov@linaro.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20241022033132.787416-1-alexey.klimov@linaro.org>
References: <20241022033132.787416-1-alexey.klimov@linaro.org>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The wcd937x supports also AUX input but the control that sets correct
soundwire port for this is missing. This control is required for audio
playback, for instance, on qrb4210 RB2 board as well as on other
SoCs.

Reported-by: Adam Skladowski <a39.skl@gmail.com>
Reported-by: Prasad Kumpatla <quic_pkumpatl@quicinc.com>
Suggested-by: Adam Skladowski <a39.skl@gmail.com>
Suggested-by: Prasad Kumpatla <quic_pkumpatl@quicinc.com>
Cc: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Cc: Mohammad Rafi Shaik <quic_mohs@quicinc.com>
Signed-off-by: Alexey Klimov <alexey.klimov@linaro.org>
---
 sound/soc/codecs/wcd937x.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/sound/soc/codecs/wcd937x.c b/sound/soc/codecs/wcd937x.c
index 45f32d281908..0f0d2537d322 100644
--- a/sound/soc/codecs/wcd937x.c
+++ b/sound/soc/codecs/wcd937x.c
@@ -2049,6 +2049,8 @@ static const struct snd_kcontrol_new wcd937x_snd_controls[] = {
 		       wcd937x_get_swr_port, wcd937x_set_swr_port),
 	SOC_SINGLE_EXT("HPHR Switch", WCD937X_HPH_R, 0, 1, 0,
 		       wcd937x_get_swr_port, wcd937x_set_swr_port),
+	SOC_SINGLE_EXT("LO Switch", WCD937X_LO, 0, 1, 0,
+		       wcd937x_get_swr_port, wcd937x_set_swr_port),
 
 	SOC_SINGLE_EXT("ADC1 Switch", WCD937X_ADC1, 1, 1, 0,
 		       wcd937x_get_swr_port, wcd937x_set_swr_port),
-- 
2.45.2

