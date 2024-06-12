Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C34DB187551
	for <linux-sound@vger.kernel.org>; Wed, 12 Jun 2024 16:16:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718208978; cv=none; b=oKhi33fOzj3PGwIDN5N1aImCPBxm9s1R2Yv3RaB2SC+nz0TdosA3AlEeDUtwhPJ1yJSmTMzlQx6+SZrthumfsTZDTk2vXS7L0fVjlGpKPw03NXtlo/O5SiuA5PCD0eW2r5UpJaNpoO3fyJRfxBJIUm7FmDc7PpzJvZTNuekYh/4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718208978; c=relaxed/simple;
	bh=AqGJEeLHu58vzcaPVEiybipjhiSIkfgmXeCqrJqGrnA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=nhZIoznjfm+ocREMvrRDvCdDulmDj0mmoUe8f85uXBM5Si1SnIYGgsY4SKrp8wor95Lsk2Q/4YtMNHaPc2aHkoqzadEqRMOKvYShIZ5cvOrAammmf+sSwAbt/Jx4NGeviN5PO3C7xioU3HHZEwUQUgr4ob7VzZrPOpL89Bz1kVI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=xRrLYX/3; arc=none smtp.client-ip=209.85.218.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="xRrLYX/3"
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-a6f13dddf7eso9872766b.0
        for <linux-sound@vger.kernel.org>; Wed, 12 Jun 2024 09:16:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1718208975; x=1718813775; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XPjxtHHdxxnis6XGqFgLr48z/PZZvjJ4q9YoUmBEYG0=;
        b=xRrLYX/3KYWeUlXwvEaTPLvLOytH+cnDZeAkoRc2emOLLW+IhoAmsb34w/GX+m706v
         1Xb9th0GH62abjIXAyRaf/5JEq2+e6Te/ETAILudwv3DCcMK/Qa6C/ZVpaBtIWoH2R5U
         oFJHOJvucz5FMj8cyYSxnVc8CSv/8ZYegdKy4R/mNT38jeSfI80bIuSgf6vk6q2lBr0p
         7/ViucDdwKtSLyHTXVDNivsv91MAtVCZ5doWQhaPyJ89dCDfOjSjVxnLpooJb7wJ9DaR
         rxK1AS0xsvBIG+k530fwyZTODcV0m+ysJ8oU4TP/eh6JnacsOIc+WPmyKbxG2oO3716+
         KTyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718208975; x=1718813775;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XPjxtHHdxxnis6XGqFgLr48z/PZZvjJ4q9YoUmBEYG0=;
        b=qKy8skuCT36XtxXNWC+aDGsUXALd1VNSDY/sjsV5xdDffSeEFV+eIfRbzZL6qXxvgg
         Nu2XwtRoDgihkYhyi3yRd6rHvDVgNbvHKm2Ojt7R8uuMjBPW7dpwNxdiVGirYcnsQ6Rn
         7XF9cEHJaL0/+gpXXFuvRxNtVj6LU/ieGE3t4pL7eguEFEfkeibOmbk8leX2K3FnPVvy
         K3zLizWIBDkUax8Gbm+MAAqDZjwZCfAozQh4LDlO4t/Y1SmrAQWYUtiGjjPkoVliWXWl
         Mclly+Sm9y4fhUp4iTev9jSJU3f+8JPPpBHjseCm+s8/o40ow/28quDTuxepb1AoDj9F
         2/QA==
X-Forwarded-Encrypted: i=1; AJvYcCUxJQH+jPiUvgg3H5EqvFslPJQ4rY8cwyW2w+m239k7BgHYXXrYuhzhfEVnqNbTTOGlU1b2Rvwc58h7kqNo3j/Y0X7CGz2dVQmO7ec=
X-Gm-Message-State: AOJu0YzK4oPc9oEB1aE18XCRRv2aIlHYpnqecibg9hehK7PDYO6Qw6+e
	TaJjsOp1FygFz6A36ZzxpzYEm59r7rXpJ1xr9yv8Lgd1cojFHRChT/lEjuEikEI=
X-Google-Smtp-Source: AGHT+IE9yWBR/V1EKyUJEqTgvztyKXOF8S1AWCeYdztPcdcZitZUuETPOkxcpZ9R31ob9kdpEriv5w==
X-Received: by 2002:a17:906:48c7:b0:a6f:4b5b:4ba7 with SMTP id a640c23a62f3a-a6f4b5b4c43mr123244466b.67.1718208975296;
        Wed, 12 Jun 2024 09:16:15 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.219.137])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a6efd6cfb74sm624815866b.20.2024.06.12.09.16.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Jun 2024 09:16:14 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Wed, 12 Jun 2024 18:15:34 +0200
Subject: [PATCH 21/23] ASoC: codecs: wcd939x: Constify wcd939x_sdw_ch_info
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240612-asoc-wcd9xxx-wide-cleanups-v1-21-0d15885b2a06@linaro.org>
References: <20240612-asoc-wcd9xxx-wide-cleanups-v1-0-0d15885b2a06@linaro.org>
In-Reply-To: <20240612-asoc-wcd9xxx-wide-cleanups-v1-0-0d15885b2a06@linaro.org>
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, 
 Banajit Goswami <bgoswami@quicinc.com>, Liam Girdwood <lgirdwood@gmail.com>, 
 Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>
Cc: alsa-devel@alsa-project.org, linux-arm-msm@vger.kernel.org, 
 linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2471;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=AqGJEeLHu58vzcaPVEiybipjhiSIkfgmXeCqrJqGrnA=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBmacmpxeuRkJc7UskyAuH3KS6z1/56YQ47Nrud3
 89R9FiDZdiJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZmnJqQAKCRDBN2bmhouD
 1x9cD/43TrxRdQE1DLNeZsA2ZfnfnJ1pH9+KHD03KLq4jRMaNGc0vOD6gAW8YiXcfQpY5mnxwij
 gPatOixM/87wwVVpUFEl1mR6zyYy9gLekbU3XcgEcEFBzWfvZaG54dMfhIs1RZQD9CJaU1OeefJ
 MKzFWzjeeRToXCmy8z4uBl7VwPZnXc/HmdwUIQ7hizF/nconAkhnEsDRE5KQkv1EHnJ/J5ycXCm
 fkyVv4tTZt3GSxG9HzSSMjUPVtHFiVN7R9O3nN5SRe7VLlJfnn9qT3C7s1a2RAfWFWPpD8Im0vy
 slzrMvYV9fmZtjsKBTAvU+SkWOQaqL6mQ5kBZA7+ZalF/K+XWaNtNO0VQJrGPDDjr+qM5NW4aRh
 XFlYpJC89EFLVdpg+cquAYm/NF9tf/nfopHSgLxye0KILe0Su3ocAVO7t50OQWKhCcaPZB5vZ2Z
 ujcsM136t3E5JG1QbBwDr7f6hwfOe0mBLgHhwxFM2Jm8M7dyqPVwkI9Or52zkfWE7o/6lxmdfaY
 VA/v/HjLqDWm/GdJpRXGJyWbEpee6+qEytMnCzxEKZEPwplo8cFED3M77+uT2uQgi0lJf8Ww3tC
 f+7V03XArBf47xBwzv4g00GjANSYmhUFPpjNYbyjvTMnNzdJBR3fmqBKmDjLKnr2yiI9ur5ZRXx
 hNciNnxUGFGKUdQ==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B

Driver does not modify static wcd939x_sdw_ch_info array, so it can be
made const for code safety.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 sound/soc/codecs/wcd939x-sdw.c | 4 ++--
 sound/soc/codecs/wcd939x.c     | 2 +-
 sound/soc/codecs/wcd939x.h     | 2 +-
 3 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/sound/soc/codecs/wcd939x-sdw.c b/sound/soc/codecs/wcd939x-sdw.c
index 8acb5651c5bc..94b1e99a3ca0 100644
--- a/sound/soc/codecs/wcd939x-sdw.c
+++ b/sound/soc/codecs/wcd939x-sdw.c
@@ -23,7 +23,7 @@
 
 #define SWRS_SCP_HOST_CLK_DIV2_CTL_BANK(m) (0xE0 + 0x10 * (m))
 
-static struct wcd939x_sdw_ch_info wcd939x_sdw_rx_ch_info[] = {
+static const struct wcd939x_sdw_ch_info wcd939x_sdw_rx_ch_info[] = {
 	WCD_SDW_CH(WCD939X_HPH_L, WCD939X_HPH_PORT, BIT(0)),
 	WCD_SDW_CH(WCD939X_HPH_R, WCD939X_HPH_PORT, BIT(1)),
 	WCD_SDW_CH(WCD939X_CLSH, WCD939X_CLSH_PORT, BIT(0)),
@@ -36,7 +36,7 @@ static struct wcd939x_sdw_ch_info wcd939x_sdw_rx_ch_info[] = {
 	WCD_SDW_CH(WCD939X_HIFI_PCM_R, WCD939X_HIFI_PCM_PORT, BIT(1)),
 };
 
-static struct wcd939x_sdw_ch_info wcd939x_sdw_tx_ch_info[] = {
+static const struct wcd939x_sdw_ch_info wcd939x_sdw_tx_ch_info[] = {
 	WCD_SDW_CH(WCD939X_ADC1, WCD939X_ADC_1_4_PORT, BIT(0)),
 	WCD_SDW_CH(WCD939X_ADC2, WCD939X_ADC_1_4_PORT, BIT(1)),
 	WCD_SDW_CH(WCD939X_ADC3, WCD939X_ADC_1_4_PORT, BIT(2)),
diff --git a/sound/soc/codecs/wcd939x.c b/sound/soc/codecs/wcd939x.c
index 1f94f49f9829..66af035bd0e5 100644
--- a/sound/soc/codecs/wcd939x.c
+++ b/sound/soc/codecs/wcd939x.c
@@ -414,7 +414,7 @@ static int wcd939x_io_init(struct snd_soc_component *component)
 	return 0;
 }
 
-static int wcd939x_sdw_connect_port(struct wcd939x_sdw_ch_info *ch_info,
+static int wcd939x_sdw_connect_port(const struct wcd939x_sdw_ch_info *ch_info,
 				    struct sdw_port_config *port_config,
 				    u8 enable)
 {
diff --git a/sound/soc/codecs/wcd939x.h b/sound/soc/codecs/wcd939x.h
index 756f497a337c..a6c9c6cee056 100644
--- a/sound/soc/codecs/wcd939x.h
+++ b/sound/soc/codecs/wcd939x.h
@@ -914,7 +914,7 @@ struct wcd939x_sdw_priv {
 	struct sdw_stream_config sconfig;
 	struct sdw_stream_runtime *sruntime;
 	struct sdw_port_config port_config[WCD939X_MAX_SWR_PORTS];
-	struct wcd939x_sdw_ch_info *ch_info;
+	const struct wcd939x_sdw_ch_info *ch_info;
 	bool port_enable[WCD939X_MAX_SWR_CH_IDS];
 	int active_ports;
 	int num_ports;

-- 
2.43.0

