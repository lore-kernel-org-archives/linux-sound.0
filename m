Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794364117;
	b=Aizd7L0SCpvUJ6/0ktx6Ujz/K1XlR9LVHUBPZaRa3h7A0SoyqMC5vxh8KnSf4GNYwcrb
	 UhXOsci9uPYGyXoHPKB8FEvTKULjw9U4LvQ8Y2BDmCeVaEeYwVA9ws5ZLNJAx82DNzU38
	 Aq90WTRzL7l7rG2eEvG+JGZDEoZrMdnf5fITIdGkZPqP86KUid0U/Aae2uyQrtvW/KBDe
	 4qYyVhs41SCNB7RpJhUEmBMguxiT33/ygKZnH8xndbkApgGbk6b1deiOzZg0ULqk8E+MM
	 fweC6KnbX6UiF5YP62kYEWpNOP0yCoeSvF0i4N/JwDFXR4XOpnjz/OShRxCgVwN7gng==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794364117;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=IvOvMCi4CpsDXeK5KUPd/ai6uKkI9PBafZrGZuMgzXA=;
	b=Cbu+MHXwbaLQTbTbQLUa15I1cXk8cegY6gArKZStHaXZdlWAttHpe/3FSLF/FFHn097y
	 1lwHw+WlCcLDoQWGyr4md4uOHJoUchI7TUZUaJ0K0/ySl4+i2nAmggmKZi0/bOAG6kEcJ
	 PyLsXY95aw2aVsm16JqLIdEAxFz3euGT5pgeTTfFEFfxKIg0bPyzC0RN+Pr/gNU8oKOgN
	 1bEPjGgVIfhvUmqV/9iYKNXE0QsfBBP1cSiDwAnibwbb0Fdw/a1YfLti/qlF1zZ6h/7Ec
	 eDRZ60/cKpaZUSw9e2OGSXLbhIM1HHPjzx9BDcuwfr+j3qu+gZsJHUOooXjJbuZAluA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=TbnuFGMP;
	arc=none smtp.remote-ip=74.125.82.41
Received: from mail-dl1-f41.google.com (mail-dl1-f41.google.com [74.125.82.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4CB8606A321
	for <linux-sound@vger.kernel.org>; Wed, 11 Nov 2026 02:28:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C4CB8606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=TbnuFGMP
Received: by mail-dl1-f41.google.com with SMTP id a92af1059eb24-1b3acec6677so4226644c88.1
        for <linux-sound@vger.kernel.org>; Tue, 10 Nov 2026 18:28:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794364116; x=1794968916; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=IvOvMCi4CpsDXeK5KUPd/ai6uKkI9PBafZrGZuMgzXA=;
        b=TbnuFGMP4qOfQBQjC9PkLNLe8ZPMuTZ5AJPeotGBSDrNILXneU8XRGGTRNiHGulTdi
         gkQXTzv1UzjTiDQZfW9mvdy3xMBlnbEU/Sbw+6Fuo498ngp5iL4W2MJiIbEQCknf8zRv
         H6S9dkqSiAeincJfjUcU9siif9/hp+JeTt085LKnCqqOJSW+FJQPYHGJ0dNGYzffBz6v
         94GRY69idkudXl5zJYcEwNBRhGanQk56DncY2y2ml8Pn1JQKVP4DinmR6jXDR+tcZgYz
         FFLr6hWunqYDIKOfKlwhZdx4UhpUetUU5rt+VML9NeWMeVNvewYY1ud8/dem6Q/m6CbB
         Rf5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794364116; x=1794968916;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=IvOvMCi4CpsDXeK5KUPd/ai6uKkI9PBafZrGZuMgzXA=;
        b=QWGwlKhl0nRb1J/FGWGfJbZ7aFMJ+CNAgmeU9Be5lkmeF4qzKd+PvsBBBMW2mhbhsb
         T6AdIUgYVTSMRdddKAAw7SThpK0hOLWDXzQL7NMegZgl3TQwUmwBlez5f56DbHNoqTXK
         3PNsJ8MNuzpTUUm7qFpl4ULPdPgovsZ/nH81ackWUPAW48xmo/ZnlWFXhcxQcBWleDIv
         Ex0qjPtOlK0jv6NON4vF0kbsoXUd9C8Ry0vnkItnCN3W9RwTFAb/e2ZVz/h+oSKnY6Vd
         pG27W7tyCJU3sU3C9ug4lp4X3Lu5UJGH4TyarIHaqMsbzjDxsTTuIUBIielGsCSRKMlg
         0hig==
X-Forwarded-Encrypted: i=1; AL+hErGvGDn8bz4r8k2Ht4A2XAnT7eN4cE3ERFn3epuWOKogxHAzzbr7R4XcNKfaopyH7OgKtH0jlJrzt8CNUg==@vger.kernel.org
X-Gm-Message-State: APuU4Z97KUIBrOmOil5ancA3Ntu8Nxm+75HoL+bJwbzVluxqaAGwVs/J
	Ym5qwgGsZNGvDlcPFtPeCSltpx/ss0VfVGmI1xxvNVYyvkvgL4c/BepU
X-Gm-Gg: AYBFou0nwHLipHt2hpNItZA0Nu9GLRW4Qmja2KFsGKoHNijmmRKts9Y89/UaUUgByYX
	WQrjkz43y5n5/xN5bM8wJOq5EJdMabNBwt1rX+NcB0OJmA/8Am1UloLsIkuaBLzSQlKC/ldIfZB
	LizDYmWxuvVV4cBeNIxXP2GryTRzFMTePSvK0KxqgRzBo0XC1kr33rmuQiU/UY12koup+49DiLq
	BX6L8J4xbSNK/PR1Py57pa8ebYhIOOwd8KbqhakctoMvau/2r9kbCJCih7bShLuulAPm63wF2CE
	Cxd5vV58PVrNfFcaMOvvQ0pr7Xa0Wt0tw5ao1VBpx7SnNJfgmF04SFVYuk9+a2gnYDps10rW0IB
	elPfX1lrMp/6tqijcKyEi28XpjWyc6kycK2xlS2+xRaAz2hmCqA6RUHbKKIa+50Vn6KxEfNzgw6
	zy8MVti9o7wNWIoGl3RvBt8tGu4QI1mY01OvP3AoQX4vudqxWpFJ4Oary014yFx1uHkyCZfoivO
	fpfrx1EoVTTxShctDmYLuEu6DqYHUSYoquA1/CdqrdMzOB5LHOVD8rjBOX+rdYS2a4MJhStEOcV
	g2Wl7WIuVACAzZ3WqNspWRfT9+OkJp1P5A1i+VnELfWdD1G3n3cT6fmmX4i1bnddhXbQcUqhoge
	Xs/K4g83QY0n0ESXM5iq0PN6au/cSzKqinMVpLAh+AIHirw==
X-Received: by 2002:a05:7022:3a0c:b0:144:fd7c:84fe with SMTP id a92af1059eb24-1b3c0342ac7mr1035433c88.35.1794364115796;
        Tue, 10 Nov 2026 18:28:35 -0800 (PST)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b3b5b4b90csm10054285c88.14.2026.11.10.18.28.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 18:28:35 -0800 (PST)
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
Subject: [PATCH v3 3/6] ASoC: dwc: Fix channels_max derived from COMP_PARAM_1
Date: Wed, 11 Nov 2026 09:27:28 +0700
Message-ID: <20261111022731.8243-4-phucduc.bui@gmail.com>
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

The I2S_TX_CHANNELS (bits 10:9) and I2S_RX_CHANNELS (bits 8:7) fields
of I2S_COMP_PARAM_1 encode the number of hardware channels minus one,
i.e. values 0..3 mean 1..4 channels. In I2S mode each hardware channel
is one serial data line carrying a left/right pair, so the maximum
number of audio channels is 2 * (N + 1).

The current code uses 1 << (N + 1), which only produces the correct
result for N < 2. For N >= 2, it overestimates the maximum number of
audio channels.

Use 2 * (N + 1) for both playback and capture.

Fixes: b226efe5818b ("ASoC: dwc: Read I2S block configuration from registers")
Reviewed-by: Maxim Kochetkov <fido_max@inbox.ru>
Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---

Changes in v2:
 - Add Maxim Kochetkov's Reviewed-by tag.

 sound/soc/dwc/dwc-i2s.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/soc/dwc/dwc-i2s.c b/sound/soc/dwc/dwc-i2s.c
index 6a25d2a69ea7..c5773f191db7 100644
--- a/sound/soc/dwc/dwc-i2s.c
+++ b/sound/soc/dwc/dwc-i2s.c
@@ -605,7 +605,7 @@ static int dw_configure_dai(struct dw_i2s_dev *dev,
 			idx = 1;
 		dw_i2s_dai->playback.channels_min = MIN_CHANNEL_NUM;
 		dw_i2s_dai->playback.channels_max =
-				1 << (COMP1_TX_CHANNELS(comp1) + 1);
+				2 * (COMP1_TX_CHANNELS(comp1) + 1);
 		dw_i2s_dai->playback.formats = formats[idx];
 		dw_i2s_dai->playback.rates = rates;
 	}
@@ -619,7 +619,7 @@ static int dw_configure_dai(struct dw_i2s_dev *dev,
 			idx = 1;
 		dw_i2s_dai->capture.channels_min = MIN_CHANNEL_NUM;
 		dw_i2s_dai->capture.channels_max =
-				1 << (COMP1_RX_CHANNELS(comp1) + 1);
+				2 * (COMP1_RX_CHANNELS(comp1) + 1);
 		dw_i2s_dai->capture.formats = formats[idx];
 		dw_i2s_dai->capture.rates = rates;
 	}
-- 
2.43.0

