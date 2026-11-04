Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793795586;
	b=zCWRz8npjmPLaq0rOzGDCfWCARkMu4e7DrEljShtYhT2bvfJRJxGwzj8qhSp+0hUvkrw
	 YiqQNzOZSU+TfNpC02AtkItjLTugoFmq1u515d6tM17Gw8NnMFE919xnKPtNhBmXoLUna
	 MChJdLcZ1/bWqXGe4n6fISpodfHNQc58f0/MZh7nRz+tOfGiKWZcxLhfagFADGBPjSI/c
	 beyqi2SFDwGUlRb0z6SrUDGM3F2BNqwE4T4KXDYjuymtatjPsw8OHEU2sIr2T2YoNSdps
	 uOfkVmpavHx4VIjUNPEo/Ae/FRdXXk9tJnnmjQmI06GuutJNXIT/V3W7ORksK92sLlA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793795586;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=fmtZfLH8E6ofPNEi4R9rGr1nVfuLDaNXdp5QmRMTCjE=;
	b=wRX9vJy4vgZFcNjNXyxzVnsw1vPcvG1YcskorEtvhJKfBKCQLUv3ZnA18E5gqXdNdF8N
	 wnrTletZdmG1VkiAvSJ9so0jihBVC+1ZD3WX70KWUYUa4DjJPLA2txk4BbOyUWB4sp2dK
	 qYALOHyylvkE796w/dd5RlvaGSAml3VEKOHZmbuaUKu7YWqDhVBmMlkYs6EV77zRtv6+b
	 eIkZ9E5tdBog3+zq9G1E54ZN+rIoyvHS4oSbHjdXPnyF5ZI+/Xaqe7mcHbPuUnrSK2bTx
	 /CGFM3lNJDHJoOB5yI0rTMWARJF4MT7oJnk02otpsBr6nKoi10V0uyhBZEgpllrT7Tw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ord7SymA;
	arc=none smtp.remote-ip=209.85.128.52
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC44A606A328
	for <linux-sound@vger.kernel.org>; Wed,  4 Nov 2026 12:33:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AC44A606A328
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ord7SymA
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4a20bdaf39cso6496785e9.1
        for <linux-sound@vger.kernel.org>; Wed, 04 Nov 2026 04:33:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793795584; x=1794400384; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=fmtZfLH8E6ofPNEi4R9rGr1nVfuLDaNXdp5QmRMTCjE=;
        b=ord7SymANmYwvG85xkqojZpBx4zQekmKlhxmqa037yOFtNP1AH+jeKnSngoH5fyUih
         bBBXNgTkRre2Dbqc1tWkowbQjkABtv0PcQM5gcZfYNA7uRgE0+E9N/ZCU5vUmtRfYw6D
         stgfjZNFHJK/rzoEsdTc4DsS9KtT/ztygYlPyiDoDsNJSFLxI6XTgoshejuydrHCjpEz
         YU666/gp3RRySEBLtJc3lPHVKJM3DmUQ4tOBnGMEUNn+jlGsXHidsBQgZz403M0JnQUh
         uDEEawih0jU1Xl4Lm1nsmyNhKjsi3uW3iPXJLVU5j3UlLxkfHoQN2YPVgoJPm9nK/wvT
         NdUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793795584; x=1794400384;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fmtZfLH8E6ofPNEi4R9rGr1nVfuLDaNXdp5QmRMTCjE=;
        b=xongW5EPzoSSyk2d7M97lqr6CsoG7IRHrYoKAIPwtBmKRCnH3tN9+PbWpYxm0XqjbM
         dwg8ekO4ha//IYr65dwZyedpYelrj/6C9SYPyk7+sEvJx+gCjv0xQv9KtZI/FXzz9nvH
         ON/u5/Rbbc+Huy2W4LhXaoXcJWe8mmSaQ2zyMwO9BVrwBpgDr4wqdC3n5F9OBAp9rEo0
         juSOw3HNxq0RlLrR3MyuzWoxH7vCfkRjKcnCQqTmp5bH74UHTMTCJYErx0LVXLlONeCq
         11ZeKqx39lULZXU55HXkSu+MmL5eZTji95PwrSsmyCuviFtC/X6b0ff5fEem9JkMtb5K
         ODDQ==
X-Gm-Message-State: APuU4Z8nTP3MzyAoSiBTzhba5MG6DkqdeBc5LtZ1896/6ShF1gGzyLeb
	7+NXyS0e9VOKal47Ep1gUtALd1Ln6VPP5H/crACCfJCxJ/9zpPgbRLKd
X-Gm-Gg: AYBFou08ZFObNTJLTyGnjZOUPoOW9QUYuUmjn7pER4kDf6Ep2kQYSxnt/GdDiWXcGeX
	Z1yZmsIS5ef++RSUgTScDnf6S2jrjtYG4NV8tJctIQFpuaUXbsPHGNckqF5XeEraofad+IW/XYo
	w761POH0mGOvflWe+lJMRX8pHgTIDasxMeVFj4Pr9lYr0rd/5tik15IrG55Kcuy5zghpJdn8gP8
	VMxKWEewjj+2wntw3Agq3dknCcvfaIrrpkijDlWfMQuHVTXXvEqHq4TQCMpSrwzFVNFSO0wuod5
	iyqsjV1Zu73sRGRNZ9Z5x7gRRJ/3FR0vikew4+Tlkvawsbm1+9ynByt0wZcR/ZiNZm+dgsYFlyi
	Uo07ZZL0YQfCeeTbRFoOm3PRo8uTZiVyjqdTh4UYdHJPOCdnhWfHjxFrd2Ml4SOL3uFdysA3CpU
	4Zr1fXbfxbFFTqAKL7Nauwbakqcsy6Bx8VrfV2GCGXM5UlFU+rzJsWt9b9L0JHQG9FIxUdN8XlH
	YyOkFjzQAX7B8DPwndU2Cy8W2oifHjOdzrLHcftnBTOTRgktcZTlXYLsvMY36yG55pgWINt5F1j
	tkHyLuqrJRA7mKMK0tFpiI7UradYzPDscwV79ouH+fWtxmHbsA==
X-Received: by 2002:a05:600c:3d8d:b0:4a2:cbe:beac with SMTP id 5b1f17b1804b1-4ac18a89393mr344169195e9.23.1793795584006;
        Wed, 04 Nov 2026 04:33:04 -0800 (PST)
Received: from xeon ([188.163.112.62])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48fecac1caesm3509380f8f.17.2026.11.04.04.33.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 04:33:02 -0800 (PST)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Svyatoslav Ryhel <clamor95@gmail.com>
Cc: linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v4 0/2] ASoC: codecs: Add support for Fortemedia FM34NE DSP
Date: Wed,  4 Nov 2026 14:32:45 +0200
Message-ID: <20261104123249.227920-1-clamor95@gmail.com>
X-Mailer: git-send-email 2.53.0
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

The Fortemedia FM34NE is digital sound processing chip used for
active noise suppression mainly on ASUS Transformers.

---
Changes in v2:
- remove ports from schema
- schema moved to dsp
- add return value check in fm34ne_dsp_set_config()
- dropped unused headers

Changes in v3:
- fix port reference
- request reset gpio asserted
- incorporate fm34ne_dsp_reset() into fm34ne_dsp_enable_hw()
- add reset asserting to fm34ne_dsp_disable_hw()
- moved bypass gpio deassertion before return in fm34ne_dsp_set_config()

Changes in v4:
- dropped guarded mutex lock in favour of traditional lock since function
  has to use goto regardless.
---

Svyatoslav Ryhel (2):
  ASoC: dt-bindings: Document FM34NE DSP
  ASoC: codecs: Add support for Fortemedia FM34NE DSP

 .../bindings/dsp/asus,tf201-dsp.yaml          |   74 ++
 sound/soc/codecs/Kconfig                      |   12 +
 sound/soc/codecs/Makefile                     |    2 +
 sound/soc/codecs/fm34ne-dsp.c                 |  388 +++++++
 sound/soc/codecs/fm34ne-dsp.h                 | 1030 +++++++++++++++++
 5 files changed, 1506 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/dsp/asus,tf201-dsp.yaml
 create mode 100644 sound/soc/codecs/fm34ne-dsp.c
 create mode 100644 sound/soc/codecs/fm34ne-dsp.h

-- 
2.53.0

