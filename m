Received: from mail-pg1-f179.google.com (mail-pg1-f179.google.com [209.85.215.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42918259CB1
	for <linux-sound@vger.kernel.org>; Thu, 15 May 2025 07:38:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747294715; cv=none; b=rAC9+QZOcFZraJOFOpmntXOCfhPcSPrJqPReJ+cE5Q1zSmMAGTfnwQoFbQtxDKSOlkQgGCdRvQhhKK3qrXF7RXoaIKMpc3SDtV7sg+q2FGQq8jh5J7mvFOCGhoCEKymxlv0fjittPEtiZBzNJBs4N2SVxUwZvE8aYxRhYKiTZr0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747294715; c=relaxed/simple;
	bh=A7YTQEvxzdjN/uPXGiOZhVl7xg2CZBthDtu/Z0dxqIM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=JuWrLUSaQ1r3M1iFsa1pxdIb6q6VgrQwCyaOcd+X6l/FmG1I3TZIz4sNQc3hwo9aB2OlHBu04M7z7ETWSv60Xlbi2MvVv19s0agpQG/R/pA1VX/Gzb+Eg6mqo31rMDlIRO8r2u3lhgwJnWt9ZotNk2op9rFxuQrEwC/qbpF8I2E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=FlJFZoUE; arc=none smtp.client-ip=209.85.215.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="FlJFZoUE"
Received: by mail-pg1-f179.google.com with SMTP id 41be03b00d2f7-b1396171fb1so266906a12.2
        for <linux-sound@vger.kernel.org>; Thu, 15 May 2025 00:38:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1747294712; x=1747899512; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=UTuhmwgeL8CMgAtrwpyLwhvwNVYclkrjjEa64TIcJ/A=;
        b=FlJFZoUExZGyDkT078gsEjRFHQuEePzz17LUtkpA+hBDPwzdfUEB7SFCrjwvbB+W1j
         esFU+eBDq5KTa+z5O9so5Z3XcgS6jK1cMYrwWnkXd/zdPyZv5/vzZ11Y6s99x4Z6ppHo
         PIf2rFY/XvKOaswkAJ5D0McLo7GlE3wH78CqA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747294712; x=1747899512;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UTuhmwgeL8CMgAtrwpyLwhvwNVYclkrjjEa64TIcJ/A=;
        b=oYz4c3CyCr2r3TT5HK6gURZZ4tH3yl8JISJTyze5Mu5M1MEbUvyULd7TRHVg67kE+F
         jzzmna6h8tXpAPQnA2HXJqKgP7JC8TLXR/yJCO5rzBHsY5IRW3PasPnFxgm0eUmpb+E1
         XkzHR+wSbOocgLaBASJpRLUs1HuhCBy9/U5eMC42mAt2LMqmauQV8v6+XV2YUzMZfm1V
         /pT2uMiQjug0/3tHEpUOTtuADGk/EH9VQcqK+aS9FUAULTR0tzNHJWpath80ZLRj5j7U
         TZZfs3wXQHuI0HAAzVwQ3jmR/vkl5saYathNwdrryMegTCuJqHznv+6XMh0ly1D7r6Pv
         F4ew==
X-Forwarded-Encrypted: i=1; AJvYcCXB/qI0PDFk9CDNKwSmGPKm1Ia8ZBycUdEprg3X122BmlXDdn+aahuZf+J1p5oilmtRe6y3S4JdSoD+Vw==@vger.kernel.org
X-Gm-Message-State: AOJu0YwUZojBpwkFIWIywfu8DOcyB3fxsKrwm/49Qh/IbDc8C4ZEJ0wB
	gLGZSAkrJF2P8RnAqbYKWXKSzCuZXjVlmsQ3xwMTr2vFR33U8KODsxJx9azfJw==
X-Gm-Gg: ASbGncttz7O7+RqCnOCYZ2ScMNksI9x5W/ImoWqMIN/2yQiZS5RpEo5TaQYURrAYl12
	8p9ERrbIH/qLVT6b6mCJvcrlgWb5ZpVfjNi0M532O23u/k9Xua1LHG9kGUq8uvI+kXwj3PaKMny
	QuWTuizzsP5HY/r/bijxtfEA/GSCumBFyHhvrpF7/8PMtiO84kh/rINi05BnVij3vZVU7sO+MFI
	KNlj6Z+guhY5rtT3LBR988ntwld6OjjwFvGTZHOO5ld7M4ETPlc4mZbHW6JZkeXf87wWGNt9RZ8
	0Inok7wzRI77UAzROcztRv5TV/ISNKY0Z8f/v7RINwCXwPzAimAJZRvaJDAo8XTbza6NrdoZHnj
	hcSrs
X-Google-Smtp-Source: AGHT+IHd+tTQ1WkK+zV3TpgzWBvKz1U7eVTGR5TBqP6q/kPdJhkugAruaqhe6ky7C8X/88yU/ln4KA==
X-Received: by 2002:a17:903:11c9:b0:223:3b76:4e22 with SMTP id d9443c01a7336-2319810ffa6mr73889445ad.6.1747294712457;
        Thu, 15 May 2025 00:38:32 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2401:fa00:1:10:c43a:aaea:5f52:5763])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22fc8271f61sm109750825ad.142.2025.05.15.00.38.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 May 2025 00:38:32 -0700 (PDT)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Jiaxin Yu <jiaxin.yu@mediatek.com>,
	linux-sound@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Darren Ye <darren.ye@mediatek.com>
Subject: [PATCH v2 0/3] ASoC: mediatek: mt8183-afe-pcm: Shorten source code
Date: Thu, 15 May 2025 15:38:20 +0800
Message-ID: <20250515073825.4155297-1-wenst@chromium.org>
X-Mailer: git-send-email 2.49.0.1045.g170613ef41-goog
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi folks,

Changes since v1:
- Rebased on top of -next, dropping changes that cover the DMA address
  MSB registers

This series is meant as an example on how to use macros and range cases
to shorten the MediaTek audio frontend drivers. The drivers have large
tables describing the registers and register fields for every supported
audio DMA interface. (Some are actually skipped!) There's a lot of
duplication which can be eliminated using macros. This should serve as
a reference for the MT8196 AFE driver that I had commented on.

The three patches tackle separate tables in the driver. The remaining
one that could be tackled is the list of DAIs; but that one has more
differences between each entry, so I haven't done it yet.

Please take a look.


Thanks
ChenYu


Chen-Yu Tsai (3):
  ASoC: mediatek: mt8183-afe-pcm: Shorten memif_data table using macros
  ASoC: mediatek: mt8183-afe-pcm: Shorten irq_data table using macros
  ASoC: mediatek: mt8183-afe-pcm: shorten mt8183_is_volatile_reg()

 sound/soc/mediatek/mt8183/mt8183-afe-pcm.c | 571 +++++----------------
 1 file changed, 127 insertions(+), 444 deletions(-)

-- 
2.49.0.1045.g170613ef41-goog

