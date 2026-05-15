Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E27E147ECD7
	for <linux-sound@vger.kernel.org>; Fri, 15 May 2026 15:11:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778857877; cv=none; b=DCCgM1hR6RD8MQ8ayOPlBfhmm5ebJc2bLUP7aUaBMCG+1ItjdwmvKqrES5PnTJH87dEAJUabr7po9sWv0OpttAdGjH6UOh2iCk8nEgmd3KwSthgoB855xKJXwHj+yMAQHf6EIOa8qX8h+QqkV7MQMpEQKQmjd7dcGTHo8CEJXIM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778857877; c=relaxed/simple;
	bh=5ZZPJ3XMPQ41fzz63UvCOXZMzSqThcABEgMu/nPg1ZQ=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=b1EBwAnHINpnpxuMqF7sYQ4PuDR3RwMDJaXlqi/ivpS0OBWD3Lhkb7fLwIttKMmdvRVUN3qqhrA5rP9Qa/SxGSR5qo9PubMlQLTgVJFlQA4jEPdsnEybvTUObXUwE/6nMlzkISG6cq7w+NIGBf9BZnkZFOLz+grJYMKFb9SFqSs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20251104.gappssmtp.com header.i=@baylibre-com.20251104.gappssmtp.com header.b=mhxTWDYP; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20251104.gappssmtp.com header.i=@baylibre-com.20251104.gappssmtp.com header.b="mhxTWDYP"
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-448528f4e69so5345714f8f.3
        for <linux-sound@vger.kernel.org>; Fri, 15 May 2026 08:11:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20251104.gappssmtp.com; s=20251104; t=1778857874; x=1779462674; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=iCaqo1MKwSw4Wk2AfYX46XSUhbdW1Kp79bGu2CD4qM8=;
        b=mhxTWDYPaKSF4So/hkXeKyqszyMyDt+CFfK3vqBd9lffL83RfIFlRuea6hoQuLEF+e
         WJF8oaDhB5FThMcHJmeKpjHOW5R+0lTCZbL6pjwaFY/ow05wh/Hh9577xJH1wbPGAHNz
         cuwldekPRqtnxg1b1TOdd4+nfO4Xe/7nhdzg7yEWeFcQvcL2OVdm3bHTowXlX00GWf1T
         RtJGAGNNkzKpJjS9f59Tpq5fZJwA5Z+GH+9Pq5Il2tEc5PTkoe5JQbBk/rjuSseq2r6M
         zDXdt+tYnpaTLt4g84RQ/0M4kmrJIO3EAhaS2ESxRaCeQLIJL5dX5nvMZ+ZON919jsaR
         szUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778857874; x=1779462674;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iCaqo1MKwSw4Wk2AfYX46XSUhbdW1Kp79bGu2CD4qM8=;
        b=G4I+1RidRrmEtgvUYINWtirAlaQk1n46+j33JUHLGhJKb2XV85sE6Uhy2H8f/mrcTO
         I2M+9NEqKJ5NOvoIPDFc8LAdQ4ndiv1Fg24mGdlvSA2DVolsOFw3z0ZxnHNX5jwykSI7
         SNv2bbhA7+PlqMn/qzZEmCXibh8c2ZyR+LedN05SAJz+g7CbY46LaDojmEYMxJtLl11I
         skiPShsCfU3sVL5sxHCi9B4j5PdklAf5025+dYutYns/txfCOy4neTc2KN45D/GjtY3F
         x1gjFPW9KSyi4bu5XI+4H11MvYOM5+ppDYAi0i89rM/brOgKIqZLyDkz2mjAKrH11znG
         DgUw==
X-Forwarded-Encrypted: i=1; AFNElJ90u3i9X47IZx7ejCJA8F3NmOER2y68wIn1+KMTMgofze1pwkjL0xq2gFz/w9QVzHxW8XWgKDIQ0EbqAg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx1m6NrJiKltPCUPI2QkkePK9nD2iOWFwqFe0aLADMULvvBXkOH
	SpkOZhGVLN712wKc8Ck+nlLnutEZSDsKMHWjh94GefLooaRyKMtrG6ldx8OM5Wl1CyI=
X-Gm-Gg: Acq92OHki2jKiwsJzDYAKcJ03eaq9xpLNJKQw3RFVIOInhkVI+2K5R446hxCcBYrztd
	GoJVWxRi1ctoMFOK5g0Nn10/XbZ57WBUPFPmTonA+QZn76afKaGA1SBTuGCMSGd9yluzILJ8ci8
	tX/P3ef7coYlTO3SsoQaQtqwYiMtAttzpiEBMhBEL5YrZ1nDWtGP6fKn9Xr2Zn2gYD5lOr0as9S
	+GA9Zo5QrwVdI6/FRBGEBf9spOj2i5L97jRrIsPKSBqRWUwnfulPqoK3U61H1sKgGJrt3JXBHg5
	yxe7tSpySYj7N/dwO4pbM3J9QP2V374fm1VR7nhOTWo7uoruHtP9HXNga8RdRcWvJt6wM2qU0a3
	qDBuhLso9YBnL2sSx0pA1JFXmyGkzzt2yYPlfbSfV3hQ8HQyyfGgfpPMgbbGNGK8B7ZCD4mnWNY
	kn9ILxQIrQhAfTRYVt0Ij6
X-Received: by 2002:a05:6000:2011:b0:45a:d2b0:7be8 with SMTP id ffacd0b85a97d-45e5c589e5amr5705520f8f.14.1778857874048;
        Fri, 15 May 2026 08:11:14 -0700 (PDT)
Received: from [127.0.1.1] ([151.41.223.93])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45da0a19c2dsm15262062f8f.21.2026.05.15.08.11.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 May 2026 08:11:13 -0700 (PDT)
From: Valerio Setti <vsetti@baylibre.com>
Subject: [PATCH 0/4] ASoC: meson: aiu: align I2S design to the AXG one
Date: Fri, 15 May 2026 17:10:36 +0200
Message-Id: <20260515-reshape-aiu-as-axg-v1-0-53b457784ff3@baylibre.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAGw3B2oC/x3MMQqAMAxA0atIZgOtRUWvIg6hjZpFJUERpHe3O
 L7h/xeMVdhgrF5QvsXk2At8XUHcaF8ZJRVD45rOtb5FZdvoZCS5kAzpWdEnioMLfaQUoISn8iL
 PP53mnD/RI4BOZAAAAA==
X-Change-ID: 20260515-reshape-aiu-as-axg-1dac9037cad3
To: Jerome Brunet <jbrunet@baylibre.com>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: linux-kernel@vger.kernel.org, linux-sound@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
 Valerio Setti <vsetti@baylibre.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2819; i=vsetti@baylibre.com;
 h=from:subject:message-id; bh=5ZZPJ3XMPQ41fzz63UvCOXZMzSqThcABEgMu/nPg1ZQ=;
 b=owGbwMvMwCF2z3ty7kUrRgbG02pJDFns5v1LBWvmv26e6jLPpy80UFxITrX0sV6CC/Mb7Sxt5
 iuZRas7SlkYxDgYZMUUWVim3/tdUKr20DjhZAHMHFYmkCEMXJwCMJHocwx/OC9MNJZefL9qC6f5
 5FbRTzfm6OzqXXlCozL3w6N0qbSms4wM3QopiZEr9tTVHzrBLqPxK/X3UvsDny8aB/itWa0puPs
 zIwA=
X-Developer-Key: i=vsetti@baylibre.com; a=openpgp;
 fpr=0497DEFB707526E13360C970DE4B936DD13A0100

This is the first follow-up patch series based on RFC [1]. The goal here
is simply to reshape Amlogic GX's AIU implementation for I2S to follow
the same design as in AXG's TDM. Keeping the same design allows for
unifying the two platform implementations in the future.

The first commit introduces gx-formatter as the basic block which takes
care of properly formatting audio data. Formatters are DAPM widgets
(c.f. axg-tdm-formatter in AXG) which are dynamically attached/detached
to the streams when the latters starts/stop, respectively.
aiu-formatter-i2s is introduced as formatter implementation for the i2s
output.

By the end aiu-encoder-i2s will only need to handle interface clocks and
enforce interface wide rate symmetry (c.f axg-tdm-interface on the AXG
platform). Right now rate symmetry is not relevant because only i2s output
is supported, but it will become useful when following patch series will
introduce the i2s input part.

This series was tested on an OdroidC2 board (Amlogic S905 SOC) with an
NXP SGTL5000 codec connected to its I2S input port.

Changes from RFC:
- Use devm_ variant of snd_soc_register_component in gx_formatte_probe.
- Return on failures in aiu_encoder_i2s_set_sysclk.
- MCLK and i2s_divider clocks enablement moved from hw_params() to
  prepare(). Stream's "clk_enabled" is used as simple refcounting to
  prevent multiple enable/disable.
- Improved the mechanism to ensure rate symmetry on the interface.
  Previous implementation had issues with alsaloop when both capture and
  playback streams are opened before any hw_params is set on any of them.

Thanks to Mark Brown and Jerome Brunet for the review of the RFC.

[1]: https://lore.kernel.org/linux-sound/20260411-audin-rfc-v2-0-4c8a6ec5fcab@baylibre.com/

Signed-off-by: Valerio Setti <vsetti@baylibre.com>
---
Valerio Setti (4):
      ASoC: meson: gx: add gx-formatter and gx-interface
      ASoC: meson: aiu-encoder-i2s: use gx_iface and gx_stream structures
      ASoC: meson: aiu: introduce I2S output formatter
      ASoC: meson: aiu: use aiu-formatter-i2s to format I2S output data

 sound/soc/meson/Makefile            |   2 +
 sound/soc/meson/aiu-encoder-i2s.c   | 250 +++++++++++++++++++++-----------
 sound/soc/meson/aiu-formatter-i2s.c | 106 ++++++++++++++
 sound/soc/meson/aiu.c               |  30 +++-
 sound/soc/meson/aiu.h               |   4 +
 sound/soc/meson/gx-formatter.c      | 277 ++++++++++++++++++++++++++++++++++++
 sound/soc/meson/gx-formatter.h      |  47 ++++++
 sound/soc/meson/gx-interface.h      |  45 ++++++
 8 files changed, 675 insertions(+), 86 deletions(-)
---
base-commit: 254f49634ee16a731174d2ae34bc50bd5f45e731
change-id: 20260515-reshape-aiu-as-axg-1dac9037cad3

Best regards,
-- 
Valerio Setti <vsetti@baylibre.com>

