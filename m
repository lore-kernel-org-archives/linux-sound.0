Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794073429;
	b=4xFEm1JDAb1s3rSU83c5u8XpaNMU2xZXcp+LcJ/Ze4kz7rX8GKk4n5XONuM1ITEllBz0
	 N8+HIP0mSEojfqLS1Fso3Mseu6nQrX6cLrsrrBR6GL2+4kgRn27Th9juYv7dJfU1oCTeQ
	 D42zmM/47j4IW+4z2BBRA0ISumOCR98qDomUQztZZ5dPgCA4EY7SE3AT3Ohb5M5KN08Kj
	 ro7HRKNAhChospg5UzAzYhDUqVHjRkljs7DpNkLYIi4YxgUaiLyNsRyLkT/leqcyblIWC
	 iFPDUOLR9QVqGd+yjwuqQOdMQLxtEE+6K8liTIRu1nkwU0aHn+Za22P9F6kZI9Dvxsw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794073429;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=peWVPhRlZ7hn/ezXyD6N2KX4kKjmXKdM8KfCK+LMazg=;
	b=vpXqNpzQ3a3mDaHocQ3u8HBtMJWS/stENqfHL6tSGJVZ79V3vd5xhV/RTHgwhk5CJIZC
	 EVmowqLumC62F45WsPeV4ML+azhGrbE/MXNyCgyg8abfGJLi98yYtIy36M4mx7YEp5E8i
	 Wx7aCUwKgsQuhAiHqd698j1X66YhziMitrNCpzKuGEQE1GX+XeRjc8LiE8R+DGrL74fPQ
	 S97gDNXSrPM0Imj4+LhR3sS4LzkHU2nLfHxlXLUPcAZI9ntDJGa8ICkGkLIe8ZCOUsQKU
	 svQ5/QArMsbNRQfBhQhAyF68y8qGc3HaaBTIME1E+g45Q1V5OHxadES5ZegaojTRxQA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Ex9UcnXj;
	arc=none smtp.remote-ip=209.85.128.50
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A980D606A326
	for <linux-sound@vger.kernel.org>; Sat,  7 Nov 2026 17:43:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A980D606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Ex9UcnXj
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4a214c5c4c0so14331775e9.3
        for <linux-sound@vger.kernel.org>; Sat, 07 Nov 2026 09:43:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794073427; x=1794678227; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=peWVPhRlZ7hn/ezXyD6N2KX4kKjmXKdM8KfCK+LMazg=;
        b=Ex9UcnXjVjvGoF9hVF+uo8B30EGHQnW7NrgerLelKNR2YGt4MfMvI8QLWg0NZQajyh
         izSgtygmlsdccSva4ME/iDutWUBZdw5SO7YaCbcbx6vOMezbbQi9vwoIi8JtyC9IOJyL
         BnxCGmMyW9OBQPiVf20i3I3D6H+ylWjJ7ZzRyyPAuhsH/XrrxhJOcRFUUdI9AHymJA4o
         6NUISlCNJ3TFA/aAz9OTCzfsRxumuUi4TEe9EIzP+UGqMnbHl3f2oLCNigSHbs0qhiUI
         5o8w7oMeNJWDG4P5kgBlZe1Jwgc983ZIdodcYQMPBKaIUCYU9vvtczoX2cEHzKRhdU1+
         1I5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794073427; x=1794678227;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=peWVPhRlZ7hn/ezXyD6N2KX4kKjmXKdM8KfCK+LMazg=;
        b=W9RJNGORSXsgKUvEjjTmiFfuCh9lkDlMXODAqiEfREW82WR5QTuGUruneQsI27jB/3
         6ugSQDRA2HFpWM9bXJGOyomLpnhEdwDt+buK+vvVbNJF8P9bBZzif9rploAlSmPWC4n+
         /mKy/uQ5tQMbSXGdoCf8IujHrqKsfaGAaWGpu6atFZ5nN5X1tHcrmSSXDG21Lvi0I9rQ
         7BtdhWT3PAv7m2xXM+h9mRSMe7HvViUR0IzQjdPbRb588j6oC4pXaJLnjm6trD8uH65u
         hL0Va2OtGsX2EZql61VCvNq83MkPFMGDhtrRDQeQnnHnBVNNElZV1dLDG8YhcCwFg5N0
         pUqw==
X-Forwarded-Encrypted: i=1; AKwUvByp0gzwCJFKBKCHrF/vBX0LVX0h+wicvkMW2vblJDzPC1nFU9vmueFc255/2upY1iPXaiCl3tLwhHoaEg==@vger.kernel.org
X-Gm-Message-State: APuU4Z+POc1WjonmtFkvO1UuvOFtjEEjKlxlnI1sSkKo5nB3HWmH+lIK
	rOlanjFLgftaJRhu7onowCBdaLVwsiewOsXwGSc85n8o6oP4wX0UXxr5
X-Gm-Gg: AYBFou3zCHkjfYix1llzpR30Qs2X+MeCq0oUSqrtmFP/QufQP7Z5pmCihAjajx4b9Z+
	GZHYXLn7GDyV/vsZQ7INJdwrMqL0H5VXORlmgWDrKgeVejY7lxXGr7uItnzwfzspW6n9/D6mnPK
	4C+LtmEyJ7swlRCwdfhvYBwxq7pu8+v/Qanw4HK/c7zFOTdezB0oCjebwaBQoWrZdTsbG1XLssm
	svcLE2FocF89Xp03Y7EssFzKiHd3UwCIlW9Oo9MBCcFuMHeROGjNjqNY+MJUybhr+7b4jPWgeTh
	UpKHKowVnWKjtCvtWQ+g+Hjtokv4hVCOeBQzj1O5yQ9XawcP2NndAgDONbNPWaP5yifWxl06gZT
	25TLLt/eezaDgi03A5azPobspwlmKJX1fC4GqutqFP5RlXTVv6JKWC6c4AWBjDMZ6WtxlrUcDbE
	Dv+qQxaRv8Bf1uR4Cl/ObTVu50PugPh1VKG5z3dpAmOphuM9JeHN3UxM4luf1SYxk8Tt4q62B7S
	8zhyRSibfKPTcR543M6icjNmPOdcTwYnapPl2v0w4AYB6DKyqZzSnPOGSRezr/Bal7KCewAkgbe
	H7M60CboslHSrm+kVd4WByqdGUHNT2ukbw==
X-Received: by 2002:a05:600c:6814:b0:4a1:da58:1ee with SMTP id 5b1f17b1804b1-4b6df4f2554mr125464935e9.31.1794073427028;
        Sat, 07 Nov 2026 09:43:47 -0800 (PST)
Received: from kreach.multipass ([77.37.5.67])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b7e3291526sm91814315e9.13.2026.11.07.09.43.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Nov 2026 09:43:46 -0800 (PST)
From: Jude Gyimah <jude.gyimah87@gmail.com>
To: sashiko-bot@kernel.org,
	jbrunet@baylibre.com,
	neil.armstrong@linaro.org
Cc: lgirdwood@gmail.com,
	broonie@kernel.org,
	perex@perex.cz,
	tiwai@suse.com,
	khilman@baylibre.com,
	martin.blumenstingl@googlemail.com,
	linux-sound@vger.kernel.org,
	linux-amlogic@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/4] ASoC: meson: axg-pdm: select REGMAP_MMIO
Date: Sat,  7 Nov 2026 18:43:23 +0100
Message-ID: <20261107174323.577410-1-jude.gyimah87@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <sashiko-outbox-203084@kernel.org>
References: <sashiko-outbox-203084@kernel.org>
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

> What does "These three" refer to here?  Nothing earlier in the commit
> message names three stanzas, and this patch only updates
> SND_MESON_AXG_PDM while the other stanzas are updated in separate
> commits.

Correct, thanks.

The sentence is left over from an earlier three-patch version of this
series, where "these three" meant axg-pdm, axg-spdifin and axg-spdifout.
Its referent only ever lived in the cover letter, which git am drops, so
the commit message never stood on its own -- and the count is wrong now
as well, since the series became four patches when aiu was added.

It should read:

  Several stanzas in the same file already select REGMAP_MMIO,
  SND_MESON_G12A_TOACODEC among them.  SND_MESON_AXG_PDM does not.

That is accurate at v7.3: SND_MESON_AXG_FIFO,
SND_MESON_AXG_TDM_FORMATTER, SND_MESON_G12A_TOACODEC,
SND_MESON_G12A_TOHDMITX and SND_SOC_MESON_T9015 all select REGMAP_MMIO
already.

Only the commit message is affected; the one-line Kconfig change and the
other three patches are unchanged.  I would rather not respin for this
alone, so I will fix it in v2 -- please let me know if there is anything
else to roll in.

Thanks,
Jude
