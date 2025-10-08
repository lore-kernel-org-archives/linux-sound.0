Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DC0D212575
	for <linux-sound@vger.kernel.org>; Wed,  8 Oct 2025 20:52:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759956745; cv=none; b=FIHSkyeIPEyaqd0BcjJMDx0WiN4DPxCHITChPyYM1zCuE+uFZ/Dv8LBwOEJhjQlPnRPj67bZPgAkXeg2CmqWJ8Llj65G2HuG11RVlbc5Y31hFcQWNFsLj/pFUcf+FwZGkDX1wWNvQLw8BKDpoEcpb5LdYJiGYu9x75Izu2citi8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759956745; c=relaxed/simple;
	bh=ndOxXvsp/HMrhb1gAwYlnHVXo3TWMDryCNFBD/jxrYM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=bJCX6P4uA9MU+PnoC/b14x6GvsKkdpPVXt/U9i/sdDljOG3RY2962OlZrY1qIZ1g0dSGkDxnSJgXaTk6r48LsIstOk4C9/KRZxB3EfjjhpT+SEoNlDdiJyd31qx7hk3Tgj10IWtGesquC6ouoby44/Av84QbwI0EowGg0z3phJg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mmfPIluN; arc=none smtp.client-ip=209.85.210.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mmfPIluN"
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-78af3fe5b17so189507b3a.2
        for <linux-sound@vger.kernel.org>; Wed, 08 Oct 2025 13:52:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759956744; x=1760561544; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=MPwoB9zLVW7tkMuQ4svlkxNKyj7FKo1ljzHs+tkoCwg=;
        b=mmfPIluNOdEUJ2hsENRfjhPtzR8nP90zWxC4PxD8Mm8UFbcv8zuTVY+9uh3Wb0UOdT
         zPHorXGSvhSijTHLcSXbTpZpq+CZlVJKU0tsavWleIJxU131wW977L0JeKqaDoZUNssI
         ++k7xtkGmSsOEdVBi1IjgzHIS4AKEAMQ5j5fdd/uJH4UECpUeFUQAPROwh85d2PECJtT
         0EiSD90C2133dY8H12K/coEX7/yo4OtACJ3TTthl73F3JDiRJJkqY9R7Q/C9ilx6HDmM
         xUrakd1Tgb9hjqPYYra4DFw9W9YrH4fmSx0Ajb6I1vuHzUKwbUZKysuQQlaQmfSDui4d
         3S6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759956744; x=1760561544;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MPwoB9zLVW7tkMuQ4svlkxNKyj7FKo1ljzHs+tkoCwg=;
        b=g9OIqPhAyas4Eyp5CmfqC2W1LQviRBORLZv3qDdDycUwwjhFPugMlXU3PwkYqVg6a9
         Uug38WER+cGayike/GMw+bkDrYwlrmQx1O1jfTLjdb9+y7OyRkSXJV2OI8Iz8kDHqGOJ
         JA9/dq9XqlN+Vj8GmDY3Qa8Iu8/znTBHfFsxpYKp6e1T6i+CMkNLY04Np0t8b5e2lHgB
         CqsK/vKbznuHSGadwVFcjoXwLDk6FUda7MIeJGC1aYIuzP5tiXUtEqv/GazOOKQLFAK2
         A+5oxNEbSV+oBzBVYHCl96frYYk0DYafx4+cuMJ38MQI22b9ifMOQ7SogHRuLdbPpJy5
         ySyQ==
X-Gm-Message-State: AOJu0YzLp9VcQoZdz1CUbDpIz0oL9S31/F/39HJ7gL9d3Uj54zmeZtIg
	wt5W7/vMR0cJWrWdGrBfe7ge7Y0xqzYaErQsPdO7XCNTdAQ7GvT4DyzeGiT/8zJKCxaJVg==
X-Gm-Gg: ASbGncvAmXT4pyAqnJrd/a9z2Ir6jYDOxhaNgChE3jKra4n4vpahyUWuY21uSLrNm2o
	hEqPnD0ylHKU6hSC3ibCfRS5VHEzOc0MUzJHucu7GfymVWux7/eaMWsJmpqk2RJ1W71WTvuDm7v
	a7/R3n4JG8lbe+9c5HOWDvZ3uBX6xZX0/GenuFjb5pMPci4NUCYF5CPMFnqALEKMeX0V/UPygoR
	1SRLHGczzsoG7FZtsassC+GSGHagcyZZnTdOAjh5vcWQcvgfvzRRP1k6KVRGQrXgEZVOfTdWUlP
	NOvn12F19zEltLFsWWRHpN5LSBDsDYfg7DwXczYXrr+xz42krz0kL18gOnXwUr0rTGOiiXyzyFt
	l8LA5PC9iPssJ2sp6sEfaiph/8G8vSki8SYJ8nn/1o8hgfq+f1fYmZOFtVycMEX6NPVD4Q1C1MC
	+riNVaJTc=
X-Google-Smtp-Source: AGHT+IFHOUwcEcxaUjJKJWy7oLOI7A7a4YH2TSqQazR9yR60OyYjDJ8uXuy2atf8vLqEWBv9FkhxwA==
X-Received: by 2002:a05:6a00:3e27:b0:781:2582:822a with SMTP id d2e1a72fcca58-79385ed2f30mr5982076b3a.8.1759956743557;
        Wed, 08 Oct 2025 13:52:23 -0700 (PDT)
Received: from localhost.localdomain ([185.213.82.31])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-794dbc5af68sm647244b3a.48.2025.10.08.13.52.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Oct 2025 13:52:23 -0700 (PDT)
From: Brian Sune <briansune@gmail.com>
To: Charles Keepax <ckeepax@opensource.cirrus.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v6] ASoC: wm8978: add missing BCLK divider setup
Date: Thu,  9 Oct 2025 04:52:07 +0800
Message-ID: <20251008205207.1781-1-briansune@gmail.com>
X-Mailer: git-send-email 2.47.1.windows.1
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

In previous WM8978 codec driver versions, wm8978_set_dai_clkdiv
might not have been called for BCLK, leaving the bit clock
divider unconfigured. This could cause incorrect or unstable audio
clocks depending on sample rate and word length.

This patch adds a check in wm8978_hw_params: if the BCLK divider
has not been set via wm8978_set_dai_clkdiv, it is dynamically
calculated and configured at runtime.
This ensures that BCLK is always correctly set, whether the
machine driver configures it explicitly or not.

Whatever relieved from hell~

Signed-off-by: Brian Sune <briansune@gmail.com>
---
 sound/soc/codecs/wm8978.c | 25 +++++++++++++++++++++++++
 1 file changed, 25 insertions(+)

diff --git a/sound/soc/codecs/wm8978.c b/sound/soc/codecs/wm8978.c
index 8c45ba6fc4c3..23e6b874180b 100644
--- a/sound/soc/codecs/wm8978.c
+++ b/sound/soc/codecs/wm8978.c
@@ -99,6 +99,7 @@ struct wm8978_priv {
 	unsigned int f_mclk;
 	unsigned int f_256fs;
 	unsigned int f_opclk;
+	bool bclk_set;
 	int mclk_idx;
 	enum wm8978_sysclk_src sysclk;
 };
@@ -590,6 +591,7 @@ static int wm8978_set_dai_clkdiv(struct snd_soc_dai *codec_dai,
 	case WM8978_BCLKDIV:
 		if (div & ~0x1c)
 			return -EINVAL;
+		wm8978->bclk_set = true;
 		snd_soc_component_update_bits(component, WM8978_CLOCKING, 0x1c, div);
 		break;
 	default:
@@ -717,6 +719,11 @@ static int wm8978_hw_params(struct snd_pcm_substream *substream,
 			    struct snd_pcm_hw_params *params,
 			    struct snd_soc_dai *dai)
 {
+	unsigned int bclk, bclkdiv = 0;
+	unsigned int target_bclk = params_rate(params) * params_width(params) * 2;
+	/* WM8978 supports divisors */
+	static const int bclk_divs[] = {1, 2, 4, 8, 16, 32};
+
 	struct snd_soc_component *component = dai->component;
 	struct wm8978_priv *wm8978 = snd_soc_component_get_drvdata(component);
 	/* Word length mask = 0x60 */
@@ -820,6 +827,24 @@ static int wm8978_hw_params(struct snd_pcm_substream *substream,
 	/* MCLK divisor mask = 0xe0 */
 	snd_soc_component_update_bits(component, WM8978_CLOCKING, 0xe0, best << 5);
 
+	if (!wm8978->bclk_set) {
+		for (i = 0; i < ARRAY_SIZE(bclk_divs); i++) {
+			bclk = wm8978->f_256fs / bclk_divs[i];
+
+			if (bclk < target_bclk)
+				break;
+
+			bclkdiv = i;
+		}
+
+		dev_dbg(component->dev, "%s: fs=%u width=%u -> target BCLK=%u, using div #%u\n",
+			__func__, params_rate(params), params_width(params), target_bclk,
+			bclk_divs[bclkdiv]);
+
+		/* BCLKDIV divisor mask = 0x1c */
+		snd_soc_component_update_bits(component, WM8978_CLOCKING, 0x1c, bclkdiv << 2);
+	}
+
 	snd_soc_component_write(component, WM8978_AUDIO_INTERFACE, iface_ctl);
 	snd_soc_component_write(component, WM8978_ADDITIONAL_CONTROL, add_ctl);
 
-- 
2.47.1.windows.1

