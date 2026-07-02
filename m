Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7A773C872A
	for <linux-sound@vger.kernel.org>; Thu,  2 Jul 2026 10:56:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782989819; cv=none; b=lXDmu9TkLcdD+Wz3pkb2ySKhDYsRIz/bpswlHa42vmXAKf1rlen9SV2ummOtHoshcXlhDnBU0QAM/mJIW2WDDXEOOC/Bb5/r3dUbcK+hiTNSGX0Yg5StbjNrw188kibYBBUVQIIAB02MYexTb9IVuF7R+bvBTyFm3kLzkQXfXEo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782989819; c=relaxed/simple;
	bh=ZGpbg2z/BcDMR3QWPvQQyG4U7Q/PzwR7ljHElEr4bCQ=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=A8jTYcST1UPLTS56Gzi7q6ZL7FtNrUJ1eToDFsdZgLHllxLDD12RzqYxKbYP9LRTFtVYAet7RMrODgW7MmsFVBCK1+48xykDb/7hYmqBFVz9VUPENZlRUp1l7f7a/sUb7ohWm9q14YWHPNFo1sZxbIzmK5fS1M0+ITTEcqNk8ns=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=cPNQ7ePL; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="cPNQ7ePL"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-493c55d5c7aso6051825e9.1
        for <linux-sound@vger.kernel.org>; Thu, 02 Jul 2026 03:56:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1782989814; x=1783594614; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=nhPyR/JHI+8SvwQdakUo+27AIHgXTbajazll57qRqz4=;
        b=cPNQ7ePLR/xliG1dFthn4nm30W3FlFv4l6ngBOEjn10o08w2QrntoS/eObAmk4MPt+
         VpH/K/wcdEEJLlC3in/HX9MMvWyHKpmc4b5Mh1hRTxahU/CSP2jJUW8mERgTm/fv3HDo
         mKCkWGQiNcAjo6SoxmRzZ2bF7cMSobtPc/uoCcoMgrGX8dlIVxAGRuqAy5HhRg4J8ZVW
         pe1r99U3cqu9d7Y2n32hCxxrHu+nIhwcJ4RGEERBPzg3FSMkNlOP+G7Uwa2kx4twb50q
         KfT4b8D4K84anIXgLzzrHXAEfKtwvtd/X1Q6SNB4+BUizkEqSD2osSyB2lFBXkZ1EKHR
         bvRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782989814; x=1783594614;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nhPyR/JHI+8SvwQdakUo+27AIHgXTbajazll57qRqz4=;
        b=AoH/jPjqFjNsBqA2VhlxMZX50oCfx2ynE6cTXgQ0PdqTedl9Dz+yv4e1XbnCB6pku6
         W5MPzsUOLD1iIDNC8Q0E7gtJ8uysiik91wCzMiahmFvWjxT+oqiLD8ay6ICbamRwXM0A
         YDgu0i/cnlDMFro4BcDMzbMLhMftZs5vG3NhlxPs+pD9Isj79m6qewZJEYAkpsRpWE5+
         0N1jM5fnF7noDxaZbkQrAHM6s1FlYEnr+pgze/LUa3KpjWqgkDatkMwWZ415ABEfj4/O
         jezBXKRJAtRtlKjW8TjD5IChBOKXcpCTqvV/Uj9UAi3EYjuTgSEpsdUxcyb47SsF/afU
         fm0A==
X-Gm-Message-State: AOJu0YyBTswfO2TdWua8R/H0sHoVOVcpYotT+balX1lewy7f/3ik7Mgt
	eMqOkaz+2lwOw8j8Nonqz8SBWQohsCGjvltqR2FgplRjqZ49Pg1makwGBaWgLuirM1A=
X-Gm-Gg: AfdE7cm0BWtaDOKq9tiieGUzEaHNC5foJ0Ot5Y6dAGw0RVcwjpGF7/dfSlewcS1oaoc
	gXXzyJpsPX+nPFWOR5M5HJEt9Ywjl0YkNpAYfAx9IVzx6EC7J5nssCdartkyY+WNZg3ZEIByCki
	FvS3zkMWmy5oJFXvpbGodDxux+Mx4YfMzu5mzVlOSCCAvSVnoWydXlJSnY0nRCICkYh1e2cZX0t
	1wsxkmMlevKds+CWK4f7ZrLw2BJORBIVB6mH7+buwUXyCpGOQ1udvunH2FTaffzyTa/Lp+Hd+DF
	LXKpMnTith0WVppeAABxlhJ/WNe3XdTOqzAp8EchSH4ybc0Xxu7/TPKdm1OH6VuteCkowrP5Mzm
	Tip7M51zf3wA1aaK8iumUmGnTZ84t06YJ7XT8n67L/bQ7uLvYBy58qpjAgN9hbUQyRWTJ0MFOSe
	NDtokiXHzrnQ==
X-Received: by 2002:a05:600c:34d4:b0:490:5057:f5f7 with SMTP id 5b1f17b1804b1-493c2b4a99bmr74553955e9.11.1782989814221;
        Thu, 02 Jul 2026 03:56:54 -0700 (PDT)
Received: from [127.0.1.1] ([151.41.178.17])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493c6372a31sm42649685e9.13.2026.07.02.03.56.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Jul 2026 03:56:53 -0700 (PDT)
From: Valerio Setti <vsetti@baylibre.com>
Subject: [PATCH 0/2] ASoC: meson: aiu: fix playback issue for 24-bit mode
Date: Thu, 02 Jul 2026 12:56:39 +0200
Message-Id: <20260702-fix-24-bit-i2s-playback-v1-0-bcd3a43fe32a@baylibre.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAOdDRmoC/yXMQQrCQAyF4auUrA1MQ+iAVxEXM2nUqNQyacVSe
 veOuvzgvX8F12LqcGxWKPo2t9dQ0R4akFsarorWVwMF6kIMhBf7IDFmm9DIcXymJSd5YMfMbWS
 J0keo77Fonf7Kp/PfPue7yvTNwbbtWmYAkHsAAAA=
X-Change-ID: 20260702-fix-24-bit-i2s-playback-6444174c7cd7
To: Jerome Brunet <jbrunet@baylibre.com>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: linux-sound@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Valerio Setti <vsetti@baylibre.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2223; i=vsetti@baylibre.com;
 h=from:subject:message-id; bh=ZGpbg2z/BcDMR3QWPvQQyG4U7Q/PzwR7ljHElEr4bCQ=;
 b=owGbwMvMwCV2z3ty7kUrRgbG02pJDFluzl/szCo/TP5e//H1mz8NC19vCJVoclxsM8nIlLln+
 aa1+54u6ChlYRDjYpAVU2RhmX7vd0Gp2kPjhJMFMHNYmUCGMHBxCsBEMkoY/pf27ao5di34+5sD
 1Ruf7LCI1FtXNHnl+alRdTyzpE1+i5sx/E98VLpAXzz5tGu1qq5K+OvXR7UWSwQe1f75JuaOzW5
 XLlYA
X-Developer-Key: i=vsetti@baylibre.com; a=openpgp;
 fpr=0497DEFB707526E13360C970DE4B936DD13A0100

A patch series has recently been merged in c7852d2dcf66
("ASoC: meson: aiu: align I2S design to the AXG one") which unfortunately
introduces a bug in 24 bit mode playback which this new series resolves.

Among other things the previous series moved the content of what was once
called 'aiu_encoder_i2s_setup_desc' from 'aiu-encoder-i2s' to
'aiu-formatter-i2s'.
'aiu_encoder_i2s_setup_desc' was basically accomplishing two tasks:
- reset the i2s pipeline.
- configure number of channels and physical samples width.
Before being moved 'aiu_encoder_i2s_setup_desc' was called in the encoder
DAI 'hw_params()', whereas after the move it is called at trigger time
('aiu_encoder_i2s_trigger'->'gx_stream_start' -> 'gx_formatter_enable' ->
'aiu_formatter_i2s_prepare').

In parallel 'aiu-fifo-i2s' (DAI FE) already performs the very same reset
of the pipeline at trigger time in 'aiu_fifo_i2s_trigger' and then it
triggers the playback.

Since the DAI triggering order is the default one (FE before BE) this
means that the pipeline reset happens when the BE already did it and
started the playback. This cause the 24-bit playback mode to be
corrupted.

This series:
- re-orders operations so that 'aiu_formatter_i2s_prepare' is called after
  DAIs' prepare, but before triggering them.
- removes pipeline reset from 'aiu_formatter_i2s_prepare' because the
  very same operation is done by 'aiu-fifo-i2s' on trigger.

This series depends on c7852d2dcf66 ("ASoC: meson: aiu: align I2S design
to the AXG one") which exists in 'broonie/sound.git#for-7.3', but which
has not been mainlined yet.

Please apologize for the inconvenience.

Signed-off-by: Valerio Setti <vsetti@baylibre.com>
---
Valerio Setti (2):
      ASoC: meson: gx-formatter: prepare on attach
      ASoC: meson: aiu-formatter: remove pipeline reset from prepare

 sound/soc/meson/aiu-formatter-i2s.c |  9 ++++-----
 sound/soc/meson/gx-formatter.c      | 33 +++++++++++++++++++++++++--------
 2 files changed, 29 insertions(+), 13 deletions(-)
---
base-commit: bff7fad1010eea6f183fb110b54171cf8700ef8e
change-id: 20260702-fix-24-bit-i2s-playback-6444174c7cd7

Best regards,
--  
Valerio Setti <vsetti@baylibre.com>

