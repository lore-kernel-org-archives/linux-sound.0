Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DAEA1487F4;
	Mon,  6 Jan 2025 14:13:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736172828; cv=none; b=ElzO7JzYKT6M07AC9CwVvsdRJcWLbzvfgSFhtEXow56ec7dOETSrgq7XXJ2QAtvXlky07w3fhQYwvL9hZzG1pqlonAp10fwk1h2S/BsWdv4ZCGqi9bgdoiFVaVclxKfp8lI0MxX1fYWA9FN4E47xs+1BvskZlBf47q5BKS1ducQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736172828; c=relaxed/simple;
	bh=zBm+ZZcAaKfFSam9YMTfJ0I95qeAfsDpClkEg1Ny+AU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=N2jtMq2faUls7LLJ0FbWNgYeUf6ATSlj6gMM+PRuEQiydvdNneju3Exh55LTZ5porTZHJaoKjPVOhtFrBnJW5/16rlaGqeOvhmAUtwh9yBcG5g5aER4WlE+FubTMHHzciiYUHPDgTzBB1GZLzCQma4xus8BuXx6mGWKhOD9YUgs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=googlemail.com; spf=pass smtp.mailfrom=googlemail.com; dkim=pass (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b=RInHFE2F; arc=none smtp.client-ip=209.85.218.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=googlemail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b="RInHFE2F"
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-aa6a92f863cso78802066b.1;
        Mon, 06 Jan 2025 06:13:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20230601; t=1736172824; x=1736777624; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=deuzC29BtjFy0NCkULSfuChWERldX97tanuampvrqsk=;
        b=RInHFE2FGxKk5IFEGliNxbzd5/TOYw3FMVYf6TFKwGuVfK8pTc1XrMJlbmZpHu4ubG
         nZrCjYoI7QEEd9igc7UiZwXGiWRHQeR7KbZ6kcTjZ5Nf56rvRONrz/VZ786BqFWwFRQV
         42E5ert17zfQ0T/B6ufowRRzJ9R5WhzeU3Bv2vF/och+2oFVII4XNC+PhzWO2BCeSf80
         UepCF2dikcIUGemtbo9GKz3C28hla0yYvMqA1KKqr8L0yGJW6gkwB625aINULEB5RLr+
         j9XL5TOtGmdC0NTkv0L9uAiFasYNr/EtdqcT2msj9hyYlMqvX1LedkcvPw+4o0R3R23t
         eW3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736172824; x=1736777624;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=deuzC29BtjFy0NCkULSfuChWERldX97tanuampvrqsk=;
        b=Ff89br1n+t4Skl3uF8sd2Hq8e4ESbV2O2di6hGqR+DDRtRGhb0kafklDMxdCDGI+lv
         ZUxD3LxBKS1IgpQcjMs+uMwHCt2hivNBfp7E9WA1s6yYWUPgKD2Q8QRWjnluYOQ6HjmQ
         awIAi5EPj1mF+0V+sBILoz6nfAe1HFeGdoiJ5mGxCrWc4LF7VXz+E65aSWHYdOtshtgn
         3BvNp+8gtKvSUB0WnImSjmaF/ywbU71TEzh2+ppZT4IQN0dc7IVz2LhmJOOJyUdTljV5
         AwjR8fEzqep6rbIsIG7jvXitO0o9Z8PCH/Mrl0zDY2xxmHSD3+VeV0hfhcyR4H4VW+Wl
         vScg==
X-Forwarded-Encrypted: i=1; AJvYcCUjO+EiUIr0rPAbZ62/qs07SlIc3TnbTA1Zscd43tFdiL0Fy6GadKQOC92CwMi2NEauhdH4AbWPXHbn2Os=@vger.kernel.org
X-Gm-Message-State: AOJu0YywNj7EXMnmgl2/fKVM2XTT2a8R3nvFCCAG8Lq4a6KJAH9N3dm5
	CTODymgQnqJG9sMNeM0cUjdNb7vpyD6WCmLxvWwhvtYK0HICloUHUudrwg==
X-Gm-Gg: ASbGnctOKLryl1NQvrdgCN7fNInqdaZdjUI++3UEgYKO9/fsk9ItECU5nqzjEZUgH3V
	sj6AgJSn/4DTjNDoUmlyVlr+aVeKE0Pa1OUGNtICI20+4y+DbEMOXhgUQ9Va7zqH7AenjAsWt5i
	xAfIr4J9LiK1myO0xnq2SIYIDb3J69fxecwyPk/wDxOFQ86kfAvBzQoQze0Yz9EnGikI2Wz9j3W
	iXZ1nMVf+xmOWUEjfr+oYwyLB3TzZCGlyTMRdoMMhS96S0PdHS+qBKsEgWUQd0+uS4mJNMTvTCa
	vUEwwG5SXTCP3Mfz3mc62wMN7WQ+Qh+CL7oPCfN0iVMoHaa5RXsVAeKSexRDNCntxa2OsytQfGS
	qcdltXA==
X-Google-Smtp-Source: AGHT+IHYFAClER1tFlfRYUeI2kVSFpYXijNXltkCZwPCe+sxy0eaQoXBkfxp8qViPmzVW1dJIIrKEA==
X-Received: by 2002:a17:907:72ce:b0:aa6:25c6:d94f with SMTP id a640c23a62f3a-aac2ba3f469mr5630955366b.31.1736172824155;
        Mon, 06 Jan 2025 06:13:44 -0800 (PST)
Received: from localhost.localdomain (dynamic-2a02-3100-a9f2-7d00-0000-0000-0000-0e63.310.pool.telefonica.de. [2a02:3100:a9f2:7d00::e63])
        by smtp.googlemail.com with ESMTPSA id a640c23a62f3a-aaede7ef3cfsm1811342766b.77.2025.01.06.06.13.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jan 2025 06:13:43 -0800 (PST)
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
To: linux-sound@vger.kernel.org,
	linux-amlogic@lists.infradead.org
Cc: s.nawrocki@samsung.com,
	lgirdwood@gmail.com,
	broonie@kernel.org,
	linux-kernel@vger.kernel.org,
	jbrunet@baylibre.com,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Subject: [RFC PATCH v1 0/2] ASoC: prepare streams on codec-to-codec links
Date: Mon,  6 Jan 2025 15:13:14 +0100
Message-ID: <20250106141316.375984-1-martin.blumenstingl@googlemail.com>
X-Mailer: git-send-email 2.47.1
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hello,

the DRM subsystem has recently gained a HDMI audio codec framework [0].
This is already queued for Linux 6.14.

I want to implement a HDMI controller driver for the Amlogic
Meson8/8b/8m2 SoCs using the DRM HDMI audio codec framework. Internally
the DRM HDMI audio codec framework relies on hdmi-codec's .prepare
callback to be called. This unfortunately is not happening on Amlogic
Meson8/8b/8m2 platforms [1].

Jerome suggested that this may be because of the codec-to-codec link on
our Amlogic AIU audio driver [2]. He encouraged me to send this series
to allow hdmi-codec's .prepare() callback to be called - even on
platforms that connect it via a codec-to-codec link.

The reason why this series is marked as RFC is that I'm not familiar
with the ASoC subsystem and lot of the functionality and terminology
is new to me.

Also I Cc'ed Sylwester Nawrocki (Samsung maintainer) as codec-to-codec
links seem to be most heavily used on Samsung and Amlogic platforms.


[0] https://lore.kernel.org/dri-devel/20241224-drm-bridge-hdmi-connector-v10-0-dc89577cd438@linaro.org/
[1] https://lore.kernel.org/linux-amlogic/CAFBinCDdiJ3UNVUcShjq=7U2=oUwT3ciYdKSuZ5TdcrikxFBpg@mail.gmail.com/
[2] https://lore.kernel.org/linux-amlogic/1ja5c4b4rt.fsf@starbuckisacylon.baylibre.com/


Martin Blumenstingl (2):
  ASoC: soc-dai: add snd_soc_dai_prepare() and use it internally
  ASoC: dapm: add support for preparing streams

 include/sound/soc-dai.h |  3 +++
 sound/soc/soc-dai.c     | 27 +++++++++++++++++++--------
 sound/soc/soc-dapm.c    |  7 +++++++
 3 files changed, 29 insertions(+), 8 deletions(-)

-- 
2.47.1

