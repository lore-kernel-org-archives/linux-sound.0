Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.179
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794364108;
	b=XFcxo1K/mjGj3+ksCOVCAx+qDw5RYacA9yJQgPlSdoNXrZ4xuIIsDpTtWHmot2ZVs8Az
	 9GxfPGtyItw9bpTmn5Jl001xllTR4m6v1MSgBkmvNuNfC1wRFUVmKQ8A2IsDNWiTQ8xEU
	 3tuYcFgPpeY1pDf+xkgnDWUi1MgTJbo+VcCCWqdhqWPFUXHIJZKBGGEn6bDd1DQCdMYfs
	 YbQEJbZBSFzwzJ2g+7n2fZPjEXbWUjkktbjyOLEvhrUH2gMWVGhFO/59K5wjYYlADYRq1
	 /Z4TN3HFsvsqwe+CyFHfBFwlTAEdz5jw2FJHuOVlpYdGcTFZ6Pk7S1tGDhQzBcf2Z9g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794364108;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=k7ESrloobDv7SNdQrKyuiHBRBGJ/v+HpoIq/NFIvBiY=;
	b=l1pONL3DhcGG+yvC7fjmMT6qw/M3d0cMlMhvHeEtwFxGE81Vw6axLaiLXu1aLCcnS8ou
	 nZizzUh6aksPGh591fDF8LckTkHD1UXcoNUqYrvRQr0080i20OTNNx9KwJy9pE7Ax8Kkd
	 Ts0zFgokOyzIg0qWpc0uWpqFo2flZELtenWRhLo29yEO5vFqAjqwUxufXpZJf3MV8y2e+
	 o/mlS1qhG+14JTVC6tigz9BrxmBdoCaQ7Q5Y3YuDtlnm7z2bB8FVbRREH6jl5EQruNJkO
	 VdNimUC2OrMLRilBRlKB0d4BwtQOJ3F1cz/pwRC9oqPqfTBPOOUzsbHVf5znXYHDw7A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=QTHAJ88P;
	arc=none smtp.remote-ip=74.125.82.179
Received: from mail-dy1-f179.google.com (mail-dy1-f179.google.com [74.125.82.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F26A606A321
	for <linux-sound@vger.kernel.org>; Wed, 11 Nov 2026 02:28:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6F26A606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=QTHAJ88P
Received: by mail-dy1-f179.google.com with SMTP id 5a478bee46e88-3704d30b84fso3472846eec.1
        for <linux-sound@vger.kernel.org>; Tue, 10 Nov 2026 18:28:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794364107; x=1794968907; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=k7ESrloobDv7SNdQrKyuiHBRBGJ/v+HpoIq/NFIvBiY=;
        b=QTHAJ88P6t7TG3Sa6xSPIQ7wHWglXc8XZ57RXXmGA5xrATbTAPpd8HJXGbj5X2zucC
         goHjlrfmpw7Ub1efUYYVZyT7ub4CrhY9eb2s643NkHY2+kWcyCTTi0hAvNRV7Q4PQM7S
         YhYkFyQyOp5gEagw7x+bG/j2nYN7netRhS7POYlkEFAJ99K6m1DkmpnWG9dsacScWiUn
         583qWLm0e33tRIg2JVr6TXcl2plsw32KtKAy3mFRhkJEjEGuI2zH7Gt5He0dk/HrhEVm
         7K2C6McU1L8B0+Cy9/NbjvT+27IhZOmdZ5PtmGXGS8gTov9NL/DFMZQgiZ/3cDHgxszm
         QAcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794364107; x=1794968907;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=k7ESrloobDv7SNdQrKyuiHBRBGJ/v+HpoIq/NFIvBiY=;
        b=G9++nywtvsBg3X1vU52uxnusDNDDCB4Sg5SWRXnALOW4QOCHXFEoW4teUCJ53f/BeO
         RdOPiU+nrnki0C2JhbPr8ooasceWKtjMZSe/56gCg8VAH2GdsTeANFe17uSQsYYRS7g/
         oQuT63PHjVGWxcz1SrJRTuv6Cs1KgJ6pqkecoS4Qfbqa2/VW69izR/VY0e2UQfh2l/I8
         2ZNM41yD8U5YruyJoTCMRB3JQyV1RWZkXn5ianjRPTfmos9x6MRQyzOETOrxmlglqyJs
         Yt+7SZ7b1Ru/hRaUawbNh+Bo1+WM7jnYvtf6ZVLDrPdQWxiwgviDg3FtIlKnqcXhqfQh
         xhhw==
X-Forwarded-Encrypted: i=1; AL+hErE07BAfNCRuhp8fKLjAbbv6sKm8X8Clq6WheDaQasg01qdvdkkhIrPXBK9VJ+aaf8HfWCbfXyHcUTO6DA==@vger.kernel.org
X-Gm-Message-State: APuU4Z/jk6YYms0kGylQu6g/dGMjCuWNz3kZPYSebzlZdzergzz31+Zu
	YxbtwRmRj97OwoksQzAmwtBg+I4Gsb/pKPmi9WiUhGYaLCTrPIj3g6Q1
X-Gm-Gg: AYBFou0Bl6EaRoWyiYkCU87zVwDaqMNpKq775rCAdjdZFh01JVU2QJtFzgbUY6ox8b5
	A/plciqOvSi1Jq/pr/cvLK9S34rGr3kntY/7pzYOs6Avh7ht+qiNb5HN2zlWMtei2vOeRprDxub
	48lvDMR7G4c0GfmjGqF7FG6nrlBD/TNOkmuVx5OLCn/qh+Bs5x9s40xIIAa3FSes58VM64oUPJB
	qmBW5EQcDQ3tLl+vW0e+YXAFygkFNtO00eXcB/Yy31czbjQa8OAWdP8nYL/fXO+1uQQwTadc3Ig
	3svKoVCMHf0D00o0mcKkv2KU26NU1FFoLXB8OQrT9EzQ8tQ8auAXB/U6moZK/Gt3mxrWCteI/1v
	Z9zGvxWHvJWD5PChQ3cP604zmJ55PkAfogfQQCGnqBbydAPj+RF5NRAA4eso7bWJ3TpBLDzuQAy
	TW3s8GQtqEpZamhTsOBDOwAe/4SoFyKPlux256s8m49zBbQN73ODz0twgwF6fSwAbWjkWFx8Ft+
	6jQXRhlvUK72yoQFHtMQ86xp6Cb+L/lTzzeQERMipbJVrkOrPQErjVMZyAnIVfyCAdNVGIQNPNN
	aBgoftiYNV5Nott4eZLg56AaYC50Qwl+1GY5hdL2NcoAKfMxaJZY9hSVOY3C+S4eHN+vjJOlcWD
	TEzjRNWiTqM2KQPSuTRmznhSolb+2xrPFFI1Z+oBSlKJ4
X-Received: by 2002:a05:7300:51c3:b0:36e:d060:8bad with SMTP id 5a478bee46e88-3768385dc4fmr1822913eec.5.1794364107186;
        Tue, 10 Nov 2026 18:28:27 -0800 (PST)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b3b5b4b90csm10054285c88.14.2026.11.10.18.28.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 18:28:26 -0800 (PST)
From: phucduc.bui@gmail.com
To: Maxim Kochetkov <fido_max@inbox.ru>,
	Andrew Jackson <Andrew.Jackson@arm.com>,
	Mark Brown <broonie@kernel.org>,
	Xingyu Wu <xingyu.wu@starfivetech.com>
Cc: Tim Bird <tim.bird@sony.com>,
	Yuri Zaporozhets <yuriz@vodafonemail.de>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH v3 1/6] ASoC: dwc: Fix bit clock rate in TDM mode
Date: Wed, 11 Nov 2026 09:27:26 +0700
Message-ID: <20261111022731.8243-2-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261111022731.8243-1-phucduc.bui@gmail.com>
References: <20261111022731.8243-1-phucduc.bui@gmail.com>
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

From: bui duc phuc <phucduc.bui@gmail.com>

The bit clock is computed as rate * data_width * 2, which only fits
a two-slot I2S frame. Use rate * data_width * tdm_slots in TDM mode.

Fixes: 221acc16aee1 ("ASoC: dwc: Add TDM mode support")
Reviewed-by: Maxim Kochetkov <fido_max@inbox.ru>
Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---

Changes in v2:
 - Move the indentation fixes into a separate commit.
 - Add Maxim Kochetkov's Reviewed-by tag.

 sound/soc/dwc/dwc-i2s.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/sound/soc/dwc/dwc-i2s.c b/sound/soc/dwc/dwc-i2s.c
index dbda943cfaf3..1f4d06a82333 100644
--- a/sound/soc/dwc/dwc-i2s.c
+++ b/sound/soc/dwc/dwc-i2s.c
@@ -332,6 +332,9 @@ static int dw_i2s_hw_params(struct snd_pcm_substream *substream,
 		} else {
 			u32 bitclk = config->sample_rate *
 					config->data_width * 2;
+			if (dev->tdm_slots)
+				bitclk = config->sample_rate *
+					 config->data_width * dev->tdm_slots;
 
 			ret = clk_set_rate(dev->clk, bitclk);
 			if (ret) {
-- 
2.43.0

