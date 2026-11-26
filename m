Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795716643;
	b=iH9fhc8PifQFZXNqoH3EvbuiI/DnCzfz0lejysulgkWczvOszzUhAV6E7M3nPGojEceS
	 lxEvW2tkchyPNHoE1RYsjxz07Drg+WMTUDuIdv2o29bwMrUF06SXzoKCqwYFDpmqCvK4k
	 KH2IxuwSUcALfsuN5AhTlSdXKZcjuwgsNNzQVWj3KrG3s1g0D263aJDWY5E15wzdo5cjC
	 z3sbbn+TgL9Z77/a+H6tYlrKq8FuoHUtZOuL8+lO/CMfreA2jF2nLSP/AaB1oRQgNGGxo
	 ImnpClMfUBOvipfUAOmNPXMqaauGZact6dOjYLyIbXYO737GT2/a0lLEXsf99qMG+sw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795716643;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=nGSVVjQ0r+iSguJgKuCAXf6PPIandnXG2Iedl8pD6MY=;
	b=HsEZ5ZU3hLnzzsTlDbhAG4+6fohnREJ1Qk0JfE/JoPiBFijeF8O3/J09RKznXo680Mp7
	 stIGHYuqNc/+iJoIWZL8R7E4fGx/pgEG6Z8Dq5+rH+bKB9duLU9xk6roXgSBy7IXejbRw
	 zMvBXBXTs1aXLmJqzOxQTmKdVw+DCW4MsZ+qzCwbeHc9XFtc6+Juk0HaNhOy41jp50BfU
	 xssh6M70N0lPEgoL+ZSxgCkosh+IOkmGfOB3pCWmV4EV40TD6JhdYnmnRHFlhdrpdVQdg
	 4nsSPGhEdfcnGBIA3EAwvS9M94oAkb2Fane9dPGNjsVlWiTxm9laLnB4TWZPggcuSDQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=YXsdTrdK;
	arc=none smtp.remote-ip=209.85.221.47
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2313F606A31C
	for <linux-sound@vger.kernel.org>; Thu, 26 Nov 2026 18:10:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2313F606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=YXsdTrdK
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-49412eb1474so4775662f8f.3
        for <linux-sound@vger.kernel.org>; Thu, 26 Nov 2026 10:10:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795716641; x=1796321441; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=nGSVVjQ0r+iSguJgKuCAXf6PPIandnXG2Iedl8pD6MY=;
        b=YXsdTrdKMbKCXR9uO34stn9X9Mn7Uo+MZcNsE6LX0pNaz1LNMPCK0WKiSaDZA5CKAt
         6gwS7ncDs7/v1c6LpfmrYmg65xEeEF+CkvIhkXK9URd0io6/VgmOHdeaVMOJrHmS5ssu
         sVhM5y/miYHlSLv/Xo1hAGEumVEYPHnhFlq0/ui1TzaHqeQRHJl5ig8RFoKmuBA0x1fX
         os8OGu3nRetaYAY8F/Jb7FTRBWVoioWwTfbrxEvVaMARAUpvKhojeFvxdCZHwEbYDQso
         3ZjoNHA+o76KaxX0DvsybUbPoFdSdwQtxEecCjiQdUeoJDry3QqBcVQJHr4B6YpXwAan
         eqxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795716641; x=1796321441;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=nGSVVjQ0r+iSguJgKuCAXf6PPIandnXG2Iedl8pD6MY=;
        b=UTzZIXkhDhOi1O5o36xzONyBT5GPG7IZPOobXK6pgXpX9JihiwInJNm7B7dfMpQod+
         /SGb0UCYVPqRfVTw8EBbdSwWvDcbFf1nnI/BEFeClnJCyK/ef/diaDtD60cSr13/ADas
         AJm/z9e8FEIQrp6yJKRtJbMmyZxappJbDxduH36Hrk3wz9F1kx4Oqk1BkkIBVjtGKvAx
         102vijP12iiqNvkTr7utgwre0ZuWAWW5PX5Bdp+7bFPM68Q0h2VFq1daZR1MOtyvMkT0
         kYWM4qs9xz1d62w0nrmCSysw8iq97hVeNL6uJB9k6xatTfqQUyTKzJMXNrXS2P47KFHi
         QNnw==
X-Forwarded-Encrypted: i=1; AL+hErFnaR8jIGULTGm8ouAWXfMJqrJlS7DesYM+aLXNv93/kc4zGdONjj5EHwMawd+dY2/u8reTJmWIBzey1g==@vger.kernel.org
X-Gm-Message-State: APuU4Z/Ckqe9StiIhSAAUttxvtxR2YKvr6pUMTWWodUxAxI0cG27HmKj
	U5WwAHBJhBgnzpRBu+bbJEYTmB/Ttc3DW5g8/2jQx5Qq2f0uglcFOFnzKEV02oP+aw==
X-Gm-Gg: AZFdTZcW1nP4VecIB+AnA9MICpw6XpGoK5DTrXpk16DiD9YMrsU9cpg1P7oFfSoxwVu
	urLmI59F18kCwXjEQdW5HLVIhRWs3SFZGCFXAgzpj7TMX3UX5kcPLgLbBIL1rMVNpEaRqFXPszM
	S4UXDADy4yym78+2c7YkVCWBLkEgEeydFOekLkAYpegtEAWfmzE1JgJFeN36qiwZjDLrV/3BjMX
	tQvr7+A+CIKCmeAFZnYaFUk31+ejVYi+SzCz+mD0C77HsXaNCxcqDITR7WnOsibI14pciOWEtY7
	9gcnnT2jZrpZ1oHyeeWxrvBIS4ClhTIh9ii3OkQL2kbjkCVG9dQlzeVvo9906bQ9V8DvfJtAa54
	0BB0SPfHXTda7I/gPfj1gMSJR479D3H2CqYYYpUvHlchh2uzc/Sji5FuE7RMsG7gSvOPQT4wJWP
	duINCI2GgGrIUs5kbiquBF7Yi3m8+pe9MbaCcBRxQoEFus0u5/7n14nXdgjg1qgAJhTNWaoJTyc
	6eXjwJGWTcMuFWh722DzAyPpCS38jNPVvNWtCBYYpLKetzKGxmN5nkdLZrLlWIDacOi5MTImNnw
	pC0ZkDEbwb+80QJVao+LHNO1leWu05R5nDB94oyjoTeLNDKa8DTGjc0cG1FOWw5ITKZn6cYhYn6
	wATVglHazf7ho2T7I3L99FMARE/qOhN6z+Zd72/GaqYhirAeMX6XU8Qkskl0=
X-Received: by 2002:a05:600c:1d08:b0:4a2:392:9de2 with SMTP id 5b1f17b1804b1-4bb8882bd7bmr433521135e9.28.1795716641384;
        Thu, 26 Nov 2026 10:10:41 -0800 (PST)
Received: from localhost.localdomain (host-94-89-17-99.business.telecomitalia.it. [94.89.17.99])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab69bf630esm42675231f8f.16.2026.11.26.10.10.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 10:10:41 -0800 (PST)
From: Gianfranco Mariotti <gianfranco.mariotti94@gmail.com>
To: Mark Brown <broonie@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Shenghao Ding <shenghao-ding@ti.com>,
	Kevin Lu <kevin-lu@ti.com>,
	Baojun Xu <baojun.xu@ti.com>,
	Sen Wang <sen@ti.com>
Cc: Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Gianfranco Mariotti <gianfranco.mariotti94@gmail.com>
Subject: [PATCH v2 0/4] ASoC: tlv320aic32x4: Complete analog routing, Mixer Amp bypass, and volume controls
Date: Thu, 26 Nov 2026 19:10:34 +0100
Message-Id: <20261126181038.99595-1-gianfranco.mariotti94@gmail.com>
X-Mailer: git-send-email 2.25.1
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

The TLV320AIC32x4 driver currently exposes only a subset of the codec's
analog input/output routing switches and omits support for its Left and
Right Mixer Amplifiers (MAL/MAR) and analog bypass volume attenuators.

This series completes the analog DAPM topology and mixer controls per
the TI TLV320AIC3204/3254 (SLAA557 / SLAA408) and TLV320AIC3206/3256
(SLAA463 / SLAU306) Application Reference Guides:

1. Add the missing cross-channel DAC negative terminal switches (L_DAC
   to HPR, R_DAC to LOL) and output driver bridging switches (HPL to
   HPR on AIC32x4 only, LOR to LOL) used for mono differential headphone
   and line-out configurations.
2. Model the Left and Right MicPGAs and Left/Right Mixer Amplifiers
   (MAL/MAR, Page 1, Register 9 bits 1:0) in DAPM and wire their routing
   switches into the HPL, HPR, LOL, and LOR output mixers for amplified
   analog ADC/DAC bypass.
3. Add the non-linear analog bypass attenuation volume controls for
   IN1L/IN1R-to-HPL/HPR (Page 1, Registers 22-23) and MAL/MAR (Page 1,
   Registers 24-25) using piecewise DECLARE_TLV_DB_RANGE tables.
4. Expose the CM2_L and CM2_R common-mode resistor selections in bits
   1:0 of AIC32X4_LMICPGANIN and AIC32X4_RMICPGANIN (Page 1, Registers
   54 and 57).

Tested on two TI TLV320AIC3204 boards (one wiring IN1 with LOL/LOR, the
other wiring IN3 with HPL/HPR) across headphone, line-out, capture,
driver bridging, and MicPGA-to-MAL/MAR analog bypass configurations.
Since neither board wires both IN1 and HPL/HPR on the same codec, the
direct IN1-to-HP bypass volume control ('IN1 Bypass Playback Volume')
was verified via alsa-lib TLV dB conversion and live I2C register
readback (Page 1, Registers 22-23) rather than end-to-end analog audio.

Changes in v2:
- Patch 1: Restrict HPR Output Mixer 'HPL Switch' (AIC32X4_HPRROUTE bit
  0) and its DAPM route to AIC32X4_TYPE_AIC32X4, as bit 0 is reserved on
  TLV320AIC32x6 devices (Mark Brown).
- Link to v1: https://lore.kernel.org/r/20261123234050.150364-1-gianfranco.mariotti94@gmail.com

Signed-off-by: Gianfranco Mariotti <gianfranco.mariotti94@gmail.com>

Gianfranco Mariotti (4):
  ASoC: tlv320aic32x4: Add missing DAC and driver output mixer routes
  ASoC: tlv320aic32x4: Add Left and Right Mixer Amplifier DAPM support
  ASoC: tlv320aic32x4: Add IN1 and Mixer Amp analog bypass volume
    controls
  ASoC: tlv320aic32x4: Add CM2_L and CM2_R negative MicPGA input routing

 sound/soc/codecs/tlv320aic32x4.c | 155 +++++++++++++++++++++++++++----
 sound/soc/codecs/tlv320aic32x4.h |   4 +
 2 files changed, 142 insertions(+), 17 deletions(-)

-- 
2.25.1

