Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794070545;
	b=u3zOYekaVS0+qYqT/NkjUBW3oMeOWXYh7xAl19wUWuTcqYpze51fNcRYCigzsn51sl+d
	 W2cKbJucyFMprvlvJuTdq4dZZq6OEuQQnOuE9u2yZgTVYwWkr2T9OD+5xPGLp8gIoAchU
	 +fxHT/l7FVqlLWvm4+Cmg/XM6xfvPrjuEqHt9LF2YFmgTfHl9ZdnNRB2Qo9bVgdZfuTK1
	 4lZhAAKtWG9XEUHPC+5BXwGnIH5DftcnEokAC60mIa5WMm2uo1tovPzR1Oj6havc7YPSh
	 A9vXj2Oi5HqO7108HTlN0GNGuZshX9UoAv+WbFaILVAkd7yZg3zrjfKyezoQ5M7b04Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794070545;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=yB3F3iURSo2op220m5n6KYAkOCelQKBFVJEduVBmqr4=;
	b=jBV8b1MGzHNL/uBpOOCRu+WLFhxp2Ued2PTmMeOESA6zjpdJR0dq2C1DjRSZ/8HCgszD
	 3ViVNscb1Syl3pm0xexwRwZRLX9xxbLidzYTO+OmzLMCpPfl/kcw4VOIQqiP+QzHEWayR
	 kO9SV2SYwvOX+buVSkHpXqBdDNrMIEGJlk62pPSWtRNJWLbDOYkS4AhKKS9AFRGrfZLcm
	 HAp/IK6h9CFRxQELCvjRSZ0MHzv5e0qTQJEvV6e0jY4prHRIP9ykbD2BBEjB0g3Op0eUm
	 l6VReCI7JRuP46/0ErDVJOTEkfk3R0X5xT0eoFmSUrA0Zke92lPc6rL4QdfOxKPeI1g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Wg29UCVh;
	arc=none smtp.remote-ip=209.85.221.51
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83860606A32D
	for <linux-sound@vger.kernel.org>; Sat,  7 Nov 2026 16:55:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 83860606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Wg29UCVh
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-492690dd5daso1170714f8f.1
        for <linux-sound@vger.kernel.org>; Sat, 07 Nov 2026 08:55:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794070544; x=1794675344; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=yB3F3iURSo2op220m5n6KYAkOCelQKBFVJEduVBmqr4=;
        b=Wg29UCVh+UBlf3B5/iQ4dQDcH6B0YEWDgtuaVlQuCBJ+4KK6QIHgNINCiJ1pZQQOWT
         xzysJws0wvE3VF7JMYPT/8s5H1CA/0KwabEitUEZD1Y+gUFxMSjdqOelo5xnpOILrNSF
         /dGWc7U3Jc5aT+HelgqJSTYUBS3Z+kjkokECCgEpS/fVADdzUqtZ9qNmmkEZ7pOM2f/X
         HS0eMIcqeyQEoxzJAQMTtMTnqqGEzmmxkHvfr1IXdfJ/74f8XCTwqWrd1ejq7frglgMt
         jE1ZT6qIFJJgW3lBfOjRLOj+SBQGkylFPp/Lg0fotF84rAktvOpauIMCLLaYif0yZMcm
         gIgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794070544; x=1794675344;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yB3F3iURSo2op220m5n6KYAkOCelQKBFVJEduVBmqr4=;
        b=APkZROW5MWKNdu0WKu+VZOtOdcVLt4IbP/aZKEhkkEnFT/JUcTB8BTWSG9yU3Y8fRp
         r8q3nalMvC9FBv5IuhCvGjaVFye/vfD8DI8CMlj6bwCN8C/zx+VjPgfpu+BcZQiBV1MO
         Ao8E9p7puZNUFGvw1pHoM2sTGzm9jleIEUgd3hacuARENYRHjPDgY5xkU9NTvLNumBBX
         c5ydYakCJkDaCitR1KQ+1cNZPTu6twNZ97njY0JK1Grk/+c3S43Si1SjE0ZFmc4WnPPm
         wZNY76Fha7MMKlwk91vCswwCF90WFYCMh/fTTGHofu5bHE+UkOH0NqnMpDjeBliaAsnl
         9h3w==
X-Forwarded-Encrypted: i=1; AL+hErGsyZuka9ZvyyMi5zozv7HdoahS+siVSiyAtblrCHjxlwO5tkT1De960TjZ7aGkZDgpo8YIc9nLZNy3MA==@vger.kernel.org
X-Gm-Message-State: APuU4Z9i7y7+0FnEQrcrV+tGRP/sZC/pF9ZrckurOvW9GsMgxdeJDZXK
	yaJB2gwAJHBOwNVlReU2gC6f0msLOg1D6NZ/AtBP5+hxhKSXHEtlrHLr
X-Gm-Gg: AYBFou0NvZ6YE9ysKPH8Grz4qkuzpJ3ed0LlQneRGFtwUtxhh0YUtI9KZiCqo1C7TB4
	NcbHiKa4epTtpfSkq24Gxq414XfpMD/2VWHFgXfDMqONZtSBZSh6I0pUA1rk/NriFnkIBs2zr0R
	KKW9WrUivyc3ZvsqQ4/naZiJUECDv+p+WBH+SqgY+d3MdzFjQ2hyOG38wDPH6bni+VL7w57jrYe
	cMXnVXavPTMklaYEpUYaEoq1/EKR5P9XekurathrvBc0BBbpN5FwcbguADrdvhJ8QPzo7zuaRzD
	jrxiXhKXxFFbsI0Slt+nWzQLwhZpWUVr+dkRqu9CPCG4juD113ZRy2juJNLLDS0ROZV5HyDy/x9
	i6VQuwZ29fHdHw10d/EwSPdLOBYmh90J4VaCewsQBUBu1wy5R/kibCvCo46L/+YZQBAWnfkXxog
	7Xe4S5+nG5tUK0rPo191aAxyhYBSu9lGC9yIfdYFMQTQuNUBLG6oYgTsYHOvXJhYQccyVUZ1PBG
	yJBRKiAgUtt8o80t4UBad70G+OHfkVrAQAGA0US/PANeU18N12keR9UZNEnG9z3ZghLtfINyIba
	lsDavTLTn0SimKLKmQ5FX2l4VRzBUzyWHA==
X-Received: by 2002:a5d:5d82:0:b0:48e:6092:dea1 with SMTP id ffacd0b85a97d-49277bb30fcmr10474276f8f.47.1794070543659;
        Sat, 07 Nov 2026 08:55:43 -0800 (PST)
Received: from kreach.multipass ([77.37.5.67])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-492d723222fsm10544837f8f.21.2026.11.07.08.55.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Nov 2026 08:55:43 -0800 (PST)
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
Subject: [PATCH 0/4] ASoC: meson: fix missing REGMAP_MMIO dependencies
Date: Sat,  7 Nov 2026 17:55:23 +0100
Message-ID: <20261107165527.576383-1-jude.gyimah87@gmail.com>
X-Mailer: git-send-email 2.43.0
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

Each of these drivers can be built into vmlinux while the code
providing a symbol it calls is a module, which fails to link.  The
same shape in 4 drivers, so they are here as one series.

Affected: aiu, axg-pdm, axg-spdifin, axg-spdifout.

The fix is a select rather than a depends on: the providers have no
prompt of their own and are only ever enabled by a select, so a
depends on would leave these drivers unselectable.

Each was reproduced on v7.3, arm64 by a vmlinux link that failed on the
named symbol, and each links once the select is added.

Found with kreach, a static check that compares what Kconfig allows
against the symbols the compiled objects actually reference.

The checker is at https://github.com/JGyimah/kreach, and the
reproducer configuration for each finding is published with it
under results/.

Jude Gyimah (4):
  ASoC: meson: aiu: select REGMAP_MMIO
  ASoC: meson: axg-pdm: select REGMAP_MMIO
  ASoC: meson: axg-spdifin: select REGMAP_MMIO
  ASoC: meson: axg-spdifout: select REGMAP_MMIO

 sound/soc/meson/Kconfig | 4 ++++
 1 file changed, 4 insertions(+)

-- 
2.43.0

