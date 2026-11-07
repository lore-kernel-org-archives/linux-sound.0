Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794070551;
	b=l+ZIWQK/XHKP6dl3jeLpkhfSwhvfLNVSBvYzA4g2KTGiiGvHBku2Qwr6EFIv8fhfzVzH
	 sssN4Esvb5YY/ot7vfm4T2Cu0hpT5wS3Y/M9HPwFiMCcv/WoyS8iuPaInIrt6CG9z1Sjw
	 MWLbe9EQUX0o0EA35w/TvZQYu3CiqZILLcCOc8E2ziUmST54fc+P32HhaIlFJxy6BuEpL
	 NmmGkWtv8g3UnyfVE8JXAmr9orDKqBQL3kO9vScZjWmt2RDmhkIK8FWa4MyLHuzD4yEB8
	 Ar9LeOXTevF8UxRX9WOoUvm+JZ7kKSYzqNN43oqN0vBBm+CrIRnTdyxeoI0k9av50zA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794070551;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=5Ftq9kuGRF2mqnT2pNXkfcKGmq0aRLkEtAjKZxJ0bq0=;
	b=TFOWXy7xoaN7A8pQla7Q1EOsfoJDXzoDzMKdqa1JO4MRfY5n1va9qC0T7X8qYOnWOLKN
	 oXA58J1jfdJv9rbOLEZGuJT3L6L8Oe+z6K+kuzxGmv96C67ljDBm8myqIELKeroj5ToEH
	 Hlkuj9NISGxLG9o8MrlAdQ94BIYFo79bOQot3p+gQvNOlpuTNpvEq0AD2+39S0PeZiCv1
	 zHNL+tQQXjExSLL44xhLxdLbHtxOAw5iwFdt89G4xpaKMz3FXPbv4LA3/vYyfJ2mhSA+a
	 mdrbWj896qM0cenvC37x9znWZH19eNL+GhH+eedUuvHQT2TMzdzZUfEar7NUPP/qeDw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ZwxdpkhI;
	arc=none smtp.remote-ip=209.85.221.54
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D43A7606D810
	for <linux-sound@vger.kernel.org>; Sat,  7 Nov 2026 16:55:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D43A7606D810
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ZwxdpkhI
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-491971ac844so1422303f8f.2
        for <linux-sound@vger.kernel.org>; Sat, 07 Nov 2026 08:55:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794070549; x=1794675349; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5Ftq9kuGRF2mqnT2pNXkfcKGmq0aRLkEtAjKZxJ0bq0=;
        b=ZwxdpkhIIaLrAp7+0L/UFp4IcmNG/Q5vxgosx1FGfaZPFwVJS2FZ96A1qFkdf5Y/9f
         GNRoxR65L7e6NjmSPNVxwgzREq2dSPmLv5Y8o1aFruse6MhXtoARerVT60/9cg+8xIbo
         KlJNGoI0ZyBtgoYKDE9Qn5H/VTi/LXbdOKks1ZLbpzm54mKo8SjlG8FlX03gM/trIX9N
         r0E/5JSpeAO/+C1M5nb01xP+uo6c2kook6k49bNLSffLTx8E4hco61hHOsV5mR6aX96q
         r/GmRmwhvOf6geN2/ax6QXpN4QjzCqtxhNzhPsxPSr0BSGwlFJKfqe/lYGni30d1baVK
         gB9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794070549; x=1794675349;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=5Ftq9kuGRF2mqnT2pNXkfcKGmq0aRLkEtAjKZxJ0bq0=;
        b=B0KiSj4zvSfwAnn03BDiHq1TclF2EpQS5C8qaAn39nvilTBwWbdtXNNzQRjkTuZQ97
         e4v1b6wZPxqyoT8Efb8YZJH6IJEOqxC2BjDwPrPTTayFPOEXIgMbOEmkEgr2GCT/omB8
         o0iQVSdhMoq6O4mVqLb0A6Uw3Ecrj8K5BZA/mlLLfB9bs2kBTOSY1Q7n6onA0bR3pIMv
         SQPhomn3q+QT/Oh2HG5PkHenatbdQe5v4RuzLE8zKTw+VB2a/48f6aDs5+1S0HtJxcmk
         UrQrmxV4V8VV/nXRyL7zlfv+KhYUwcXOlj7jF3eIs3udKPax0VLfLcgoyLxzjYCk55K7
         W3qA==
X-Forwarded-Encrypted: i=1; AL+hErEeRTbMgMJkg1FXqyIwYmxWIK9cc0cmUsCVXcE4NRQPOHd2oEIeS50+oUfk8PPZd/vEoIRZdLc1TsSjHA==@vger.kernel.org
X-Gm-Message-State: APuU4Z9MM/tEjLx7T9ZS92N0H2Cg4EAtzVDkJEksQfXaYIwZeeAM6Coh
	vlqd2POQQhS8Z2jb0U/fPp98v6yUsP3UELVOC/XIhJ0nRXYa/tt7wtpIYncjTLyP
X-Gm-Gg: AYBFou1Txt+zvNdVoc7dmnoros6g33Pr4rfFI6dCXPwArTAByungfWmyPGC4H0pDt8b
	WyNrrwc/RWOMOfAmfuaHWFCRZE/BfTG7zX167L3cQy+UjeBfdonuneddKPMXEFCtsjQsmb9wfW6
	48wbc4EkZYWd0QKFBol+9qY/X8wrsFSSai8p22TGi0UXbAMABOzEqjbWlhXNd13Xnxx7kl7FVN1
	j4HW906WbjfdQf41GJcEGU0E7kPYNQyLSonO4EB04nMcJkugSJMCxbn+ANmv0Wf4MQh6+M9LAga
	mLVk7+yRBcbb+lr73b5Pc8mJ3kSEjzI++AnxOBcWNDp/3EyFnpiZ3DT0jWs2vrog/TJfN5bPiwB
	W8lIkGZPRQKHRlRw0ddbU1uFM+2vIGdrxzduNgnIo0hywxwX02/uLPJkQNXJhLNFjf9YrB6GG7z
	bemeYtI0F9qnd7dyxFyyXTtTCTxlgm7+/dAcHfIKp3s7rad1roMtslQSZQb0jebUvyDwAHd08hO
	4g7D0EH3C1UEmtjwd7sRgpAgMSxtJSA8EADTMuTwmL7ZD+41aDHoLyZIW/VvnOIF7c2R3Q3bfRp
	AlmZpQ8AljdE9b8eVaaCut4humm5tBWlLQ==
X-Received: by 2002:a05:6000:2384:b0:492:b880:53a7 with SMTP id ffacd0b85a97d-492b8805664mr13284591f8f.5.1794070549260;
        Sat, 07 Nov 2026 08:55:49 -0800 (PST)
Received: from kreach.multipass ([77.37.5.67])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-492d723222fsm10544837f8f.21.2026.11.07.08.55.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Nov 2026 08:55:48 -0800 (PST)
From: Jude Gyimah <jude.gyimah87@gmail.com>
To: jbrunet@baylibre.com,
	lgirdwood@gmail.com,
	broonie@kernel.org,
	perex@perex.cz,
	tiwai@suse.com
Cc: neil.armstrong@linaro.org,
	khilman@baylibre.com,
	martin.blumenstingl@googlemail.com,
	linux-sound@vger.kernel.org,
	linux-amlogic@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Jude Gyimah <jude.gyimah87@gmail.com>
Subject: [PATCH 3/4] ASoC: meson: axg-spdifin: select REGMAP_MMIO
Date: Sat,  7 Nov 2026 17:55:26 +0100
Message-ID: <20261107165527.576383-4-jude.gyimah87@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261107165527.576383-1-jude.gyimah87@gmail.com>
References: <20261107165527.576383-1-jude.gyimah87@gmail.com>
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Post: <mailto:linux-sound@vger.kernel.org>
List-Help: <mailto:linux-sound+help@vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-sound+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

axg-spdifin calls __devm_regmap_init_mmio_clk, which
drivers/base/regmap/regmap-mmio.c provides under REGMAP_MMIO.

  axg-spdifin.c:(.text+0x154): undefined reference to
    `__devm_regmap_init_mmio_clk'

The driver can be built into vmlinux while REGMAP_MMIO is a module, in
which case the symbol is not there at link time.

Select rather than depend on: REGMAP_MMIO has no prompt of its own and is
only ever enabled by a select, so a depends on would leave
SND_MESON_AXG_SPDIFIN unselectable.

Reproduced on v7.3, arm64, with CONFIG_SND_MESON_AXG_SPDIFIN=y and
CONFIG_REGMAP_MMIO=m.

Found with kreach, a static check that compares what Kconfig allows
against the symbols the compiled objects actually reference.

Fixes: 5ce5658375e6 ("ASoC: meson: add axg spdif input")
Signed-off-by: Jude Gyimah <jude.gyimah87@gmail.com>
---
 sound/soc/meson/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/soc/meson/Kconfig b/sound/soc/meson/Kconfig
index 4b06a9e7c72a..10c7d59a5ad1 100644
--- a/sound/soc/meson/Kconfig
+++ b/sound/soc/meson/Kconfig
@@ -85,6 +85,7 @@ config SND_MESON_AXG_SPDIFOUT
 
 config SND_MESON_AXG_SPDIFIN
 	tristate "Amlogic AXG SPDIF Input Support"
+	select REGMAP_MMIO
 	imply SND_SOC_SPDIF
 	help
 	  Select Y or M to add support for SPDIF input embedded
-- 
2.43.0

