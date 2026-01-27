Received: from mail-wm1-f65.google.com (mail-wm1-f65.google.com [209.85.128.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBB5033D6FD
	for <linux-sound@vger.kernel.org>; Tue, 27 Jan 2026 18:48:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.65
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769539723; cv=none; b=sT7aTPucJOJeaYc0guSCVXMAALUC8ALKc1B9/ukZV6aoudS+tJ5btWGqxMwtfizFs0s5sLzbVs0m7yPurEQpUDLQQaR4e0IClCERuZblIwNc3GlHwyZjkXv8nroW7V6Ru1gTmrY5BNwMDXGX+F+xanqD2nhhAX0cx/aRNF3yBSg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769539723; c=relaxed/simple;
	bh=AAbdYSDBi4nid+vR4fUUeQUqMN1ByaToFMJu3nLnoTA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=G4nBDIGKR5j6Yd5DazU0SP2Gfyf6dS89P8zPHFx2TTrcYroiXQ8499EFG78G2As3yxb2qnaERkfKH7ZnUQ5ZlDo7iAx6F8MidbH9U6GLQ7ecouUr2BUl/l71RpuPKS9+33+RtgY9ittez0l93S4lK8o2O+H+g5sUiMQvEkKqI2w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SrOam8+y; arc=none smtp.client-ip=209.85.128.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SrOam8+y"
Received: by mail-wm1-f65.google.com with SMTP id 5b1f17b1804b1-4801ea9bafdso24870515e9.3
        for <linux-sound@vger.kernel.org>; Tue, 27 Jan 2026 10:48:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769539720; x=1770144520; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=z/IAsIdZyjkDQ3l7ZZkRFYkPArXV5TiBiIvdC8qWxZo=;
        b=SrOam8+y5TIuaVyw5ogSyOy1xBkDpn0ELumXPzTqHCW6avsFcwvUFvqrg9TstInTnr
         QL2Ouv4eDa9x8evvqa0WE8yWgRPAmYVqOK1iZOJlVCliqKTbUFRPgNV9+u2UVTRTlGjy
         eoeSZTxU0LJk+jfDnaI1g3pMYwunFb+aQKEXxs2bA1xeNyALUaJaDk0w8SvEKwXvFA3w
         hcfR08Y7yHnOyQC3KOh4r9e+1hCIghtG2AaKyzyWDEHjbAa5pyZthzUAvS0+5Z0Ub6GY
         cWSj4/BWKYJvaIXjqEINy1USL637+1qA35o+V5L1S7W30IjAcR4B4fxTmLriMp+WoAuZ
         105Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769539720; x=1770144520;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=z/IAsIdZyjkDQ3l7ZZkRFYkPArXV5TiBiIvdC8qWxZo=;
        b=YvFXR94yP9NdHTt3nZ07aTqGPOWfW1LfRbCTb8fAapy/2W0ZEAvtxkhu1cuDhfxqnX
         gnc7O3y0Pb7PUlpqJmCSja1wHUDwgmeY37m1lZVbTWWR0su+b+p0wIph+KxlQKdymylb
         FrdK3TJAVGrzDZos1mRMvL86fx8HRwXlGkXJbTA7Yi1TftI3mYlQzS0COEQZh/zKzpOR
         d8T5/MjQxGVd+cPc7/ILEOTvoVeUxxEcJkSzR8LVRXwhC/5CZmTOKP9v5NJnb6yP5tEA
         8v78v+BE5OdNCqVdwHFQJEkfRxHYCuQlC8OIL6qvm16VZHvXNaHycBQGtsuS8eS123Yh
         P7Rg==
X-Gm-Message-State: AOJu0YwhUi3U9dgH4/4BX4BoLBDNIgHM36/eYilazbQoff3FDg6Xe+s+
	eSH7X0EMmQNOf4XRM3vTzTxXUtSFNrFiQD3ZwMY96d3VvuhNzMKbtBkZ
X-Gm-Gg: AZuq6aJSzIvDq5LqAplkLizoNtdMC2zUTooGJ6kuuCsHcS+wuB98NLip4ojuBzG9y5t
	CvoAbAvBMb/fsonApTg/No6ZGOnNJYLSzYHoKmIHeO9u6//AiCZcagUoA37qmNHV1n1l53AqklN
	9KgN1bMOLKiGtjJrJ5HFOURslPz4xsdPtI+nbNpIusyxrzh5sFNcKEvHFNmZcNTZrdnVhj8hUR6
	KQaF+5am2IglMyjN3oT4uGhnLE8KsNfr0BzOn4XIjZLHuTpZQsvFAb6gn/oZw9Km1HS2qQOO8vN
	IC0/TYWtX+M9gTQIHVyvipRK6FeSK5JnrOCcSJcujsnwQOWQkUx+09fLmgnNGa5MGUR2GD6LTh0
	4vwtWgaLZ0/Qc6aey0QBOlORf7v++szTuiR/HzCHaH43BfLSxUiXJRxdNTNElpeF0rmplfhiOEc
	qUMAEuhwVqnYW3jvrZwqC8J1/Oty6D3rZ+Fdebzq0K5G4kbvhV94jk3KU=
X-Received: by 2002:a05:6000:2689:b0:435:a501:359 with SMTP id ffacd0b85a97d-435dd0a3549mr3707922f8f.41.1769539719907;
        Tue, 27 Jan 2026 10:48:39 -0800 (PST)
Received: from [127.0.1.1] (bba-94-59-215-181.alshamil.net.ae. [94.59.215.181])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-435e10ee057sm903100f8f.15.2026.01.27.10.48.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Jan 2026 10:48:39 -0800 (PST)
From: "Anton D. Stavinskii" <stavinsky@gmail.com>
Date: Tue, 27 Jan 2026 22:48:07 +0400
Subject: [PATCH 1/2] ASoC: sophgo: cv1800b: document DAC overwrite handling
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260127-incremental-for-i2s-dvier-v1-1-431b809c632d@gmail.com>
References: <20260127-incremental-for-i2s-dvier-v1-0-431b809c632d@gmail.com>
In-Reply-To: <20260127-incremental-for-i2s-dvier-v1-0-431b809c632d@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1769539713; l=1227;
 i=stavinsky@gmail.com; s=20260115; h=from:subject:message-id;
 bh=AAbdYSDBi4nid+vR4fUUeQUqMN1ByaToFMJu3nLnoTA=;
 b=EBjERO/do4uI4s6LDi0EEae7uhFRf1KBOOxPbimgtsnly9GdSGLKz0u7DPv20vrXS76n0vTk4
 V30AAY1GAInD44pnZDm7KhGkPBKJzms0Rgw1lZyPo47NIssrrNme8x6
X-Developer-Key: i=stavinsky@gmail.com; a=ed25519;
 pk=2WxGZ1zd1vQwSPFCSks6zrADqUDBUdtq39lElk4ZE7Q=

Add comments to cv1800b_dac_mute() and its caller to explain how the
overwrite mechanism works and why we force it off before playback.
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

