Received: from mail-wm1-f65.google.com (mail-wm1-f65.google.com [209.85.128.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA7CA362134
	for <linux-sound@vger.kernel.org>; Tue, 27 Jan 2026 19:08:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.65
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769540934; cv=none; b=Gdcbex25hhvwnXNRicdFnbtmgiSQU8OWN1IjlGHOOF2eFJVV69D9cAP0jezxmUbOD7aFqalbVMN11UyTKW7kysKZKdXUICGfNnZeEEhXmxMca9O1dR8HGQ2L9WnUE+kXncqCS3Bx0a8rDiN8rKkXLPQlmuvxT6oedqvrSOGOpnA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769540934; c=relaxed/simple;
	bh=zadY22GSPVPhNTUtDV/+6Sluf6seV+Q8lASvyVpCmJ4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=BGOWjQeII89fPPpxUH4l2HzjoH9s/mW/+SDOSMTv16cLS0VatF9B2m803qPZ2ZvMCg0mxcnFnRxcvBzJyyO6GvnHNtpFLDWmKIih8OHiAgmyFEKjTsDSaseYxuxz54SFPirMyybgWFqj5b9QTjHZP69OWuXfu5nImoljOFJQSro=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iFwUTGJq; arc=none smtp.client-ip=209.85.128.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iFwUTGJq"
Received: by mail-wm1-f65.google.com with SMTP id 5b1f17b1804b1-47ee937ecf2so1219315e9.0
        for <linux-sound@vger.kernel.org>; Tue, 27 Jan 2026 11:08:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769540923; x=1770145723; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Sw0L4UiyDeVexCr4mH5MBXgON1vZTOJNFRmxBOuEtVE=;
        b=iFwUTGJqzPM218ei4cSNtvX5VasQXOSyagqyiGQFPe2IOD9WHtp+HTkoxCRXQ+g0qo
         Ls9wKkNq6pwtPJvn3rXUYvPh2PDP8dPFuO9nETZMiV+SM3dRvIWEbYJAjn32P/w2cXzE
         gzm2BJ17wnM6CRhVVeckKVuTOVfQJWaztNDXdhthFpip50Ns3FhrFTnZFzlEMhonIAOX
         e0h5BJOzjVoCiVfuB0GZ+LNqAj6dsmdj18pYzFDs+NbAvr2Tnckj/+cNEJWbOkmT/P3j
         KtCHGqUtZWQVL9LjeeYdN/j/ckv/PqOhXwAQHQP2IQeKwZxehZawwTwW+za5lZnGwkFj
         aSIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769540923; x=1770145723;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Sw0L4UiyDeVexCr4mH5MBXgON1vZTOJNFRmxBOuEtVE=;
        b=Uycbg2xZ5GjBWUguJHyr+5IRFmaJDa0Vwj3zY3walgqsVtaO8KqVRN7dzx2MSGMXTt
         KZobseyoLpb681Q+upNdDlCmWa1TQ0Mh2dpvkjuDDUF64Pw3aOGWipS/PENAxV7Ch6Gp
         yOMeCrZXt+C807wIMGE2De5A5XMdxu6ApBm2iReUh1kR7c68NRZ/zfVayqjiVOGZlGuu
         sbfbTH3G6I/z42J1fYoAL0ojbzQkHEyaTvwazCxvUy/5knbbJZJYg+Ro97fCOJSgRiUq
         mljD5Rs6bRV2BAG4h8uEqi50WAeCYgZuX5TvcNaSG3KaTXNmnfjK29/oR32HI4VMGgyv
         LMrA==
X-Gm-Message-State: AOJu0YxFUi6Z+Cyb4dGA1w7SAdnQ1C+HHN7vTY8wa8dmqdGM35mCRPbH
	Ie58b7va0FUJb7aYDO7zOSQwR5gPEq2P3oAE/Cmo9wEvIc5xxj/vsayO
X-Gm-Gg: AZuq6aLlSXO4juuMBjT+rpk9cvCh4Xc/8bpN2jYbsP9pjsQzsiJOBNcbj9x3ovWezSm
	E6ZktAX+FMfc00IfOegyLN5I6MzPp/BinNvy2hqfroEWioK42FyjR2jPE69I74vzvk6BVQLVehv
	icO/ImaqP5v6NPaSTGdwyzdWIR44wqeOhDO/o9qsOd4Ca/MorSF01AFM+B/JUpQz03WEZ0wmGoG
	suZbI5kdgxlntdKSKkGu/DX2JN91Iul1EDkNT4g/hM52ZqKaGW8mpJbDPJOYIblaG16PT5aru81
	lwXiFWCi+fLQeEVjYo97BZAh/GNMxRIwv5gue4O3TMhy+sD26R7MUEI+dKc1HAwSLgdbG2kmJY9
	wBnCostYMV40XVVnKPGNmJS+IZqWhJ3Zvr0OQ54uJtxC9+hF6Cf/N6nZrqzqiOIUyfayGlLJ1xK
	q7e8gYhHgTZa3FfTwzvdFUoSSqC7GkeDPYWGTvrOaV4RA7
X-Received: by 2002:a05:600c:821a:b0:479:13e9:3d64 with SMTP id 5b1f17b1804b1-48069e95c98mr40755575e9.15.1769540922876;
        Tue, 27 Jan 2026 11:08:42 -0800 (PST)
Received: from [127.0.1.1] (bba-94-59-215-181.alshamil.net.ae. [94.59.215.181])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48066be77b5sm74577805e9.2.2026.01.27.11.08.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Jan 2026 11:08:42 -0800 (PST)
From: "Anton D. Stavinskii" <stavinsky@gmail.com>
Date: Tue, 27 Jan 2026 23:08:19 +0400
Subject: [PATCH v2 1/2] ASoC: sophgo: cv1800b: document DAC overwrite
 handling
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260127-incremental-for-i2s-dvier-v2-1-5f66b841f63d@gmail.com>
References: <20260127-incremental-for-i2s-dvier-v2-0-5f66b841f63d@gmail.com>
In-Reply-To: <20260127-incremental-for-i2s-dvier-v2-0-5f66b841f63d@gmail.com>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>, Paul Walmsley <pjw@kernel.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>, Chen Wang <unicorn_wang@outlook.com>, 
 Inochi Amaoto <inochiama@gmail.com>
Cc: linux-sound@vger.kernel.org, sophgo@lists.linux.dev, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-riscv@lists.infradead.org, 
 "Anton D. Stavinskii" <stavinsky@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1769540916; l=1287;
 i=stavinsky@gmail.com; s=20260115; h=from:subject:message-id;
 bh=zadY22GSPVPhNTUtDV/+6Sluf6seV+Q8lASvyVpCmJ4=;
 b=rcy0EioZSDj08un85FD4cMTF4dOy7DTuSQ+7myJ0yfgsHFL4rCXoEjKKSGdM7eWN8MUM5J+1L
 rSTdu+GC0QwCHnuC5/qCHba9LWd4lsde4UUcAK/xj9+KiVKjYPcIw+f
X-Developer-Key: i=stavinsky@gmail.com; a=ed25519;
 pk=2WxGZ1zd1vQwSPFCSks6zrADqUDBUdtq39lElk4ZE7Q=

Add comments to cv1800b_dac_mute() and its caller to explain how the
overwrite mechanism works and why we force it off before playback.

Signed-off-by: Anton D. Stavinskii <stavinsky@gmail.com>
---
 sound/soc/sophgo/cv1800b-sound-dac.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/sound/soc/sophgo/cv1800b-sound-dac.c b/sound/soc/sophgo/cv1800b-sound-dac.c
index ccf386174639..135322bcf6ad 100644
--- a/sound/soc/sophgo/cv1800b-sound-dac.c
+++ b/sound/soc/sophgo/cv1800b-sound-dac.c
@@ -57,6 +57,10 @@ static void cv1800b_dac_enable(struct cv1800b_priv *priv, bool enable)
 	writel(val, priv->regs + CV1800B_TXDAC_CTRL0);
 }
 
+/*
+ * Control the DAC overwrite bits. When enabled, the DAC outputs the fixed
+ * overwrite value instead of samples from the I2S input.
+ */
 static void cv1800b_dac_mute(struct cv1800b_priv *priv, bool enable)
 {
 	u32 val;
@@ -105,7 +109,7 @@ static int cv1800b_dac_hw_params(struct snd_pcm_substream *substream,
 		dev_err(priv->dev, "rate %u is not supported\n", rate);
 		return -EINVAL;
 	}
-
+	/* Clear DAC overwrite so playback uses I2S data. */
 	cv1800b_dac_mute(priv, false);
 	/* minimal decimation for 48kHz is 64*/
 	ret = cv1800b_dac_decimation(priv, DECIMATION_64);

-- 
2.43.0

