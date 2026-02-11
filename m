Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43B9C1EEA54
	for <linux-sound@vger.kernel.org>; Wed, 11 Feb 2026 00:23:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770769404; cv=none; b=I+pDgskRMw2vRhSgml3WkWBh3RamGk+4MybZVgNDQi5XhgNU2B0H+KQYwYP4LGyKZvPpBGWhDV45UAnhcnIxmernAe8VY++S1QETF0lrE3ltHWJDtsUft93Gd/mDa8G8DEPskEYcKMymZxTJv+3aRmRk+7ytgIHZ7AQg4U+PUbo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770769404; c=relaxed/simple;
	bh=M/gnqtVTJy6hC5xCqoKYPlOVtd/MmVT7i8ovqwvZpJQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=iqsSe6sk67ymDPqKebBbb20lsod3TvX0lHm34HNixUM4Qx8BOdZQXq7vwEtpslejMjG8+8M5MfifeTCr817S0pJXIzu9h7YRZMNjueWt2tQTMc7Ea519x8N5oXt21zZfeLjQR/YOJLwPeDdtIkS2nGS0jby8XqwWqx8pmlTU6+o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WpMueeN3; arc=none smtp.client-ip=209.85.218.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WpMueeN3"
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-b872f1c31f1so175763066b.0
        for <linux-sound@vger.kernel.org>; Tue, 10 Feb 2026 16:23:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770769400; x=1771374200; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GqtiDoHe1hXnMnvoCnlwaWBKlrntzDmjJI57vg8nEf8=;
        b=WpMueeN3Sa2NAu/bGj4qWRtwyoXxTKe355SS9Zmrl8qEEVXgOoR++JtqZ68hjnh/fR
         BpX0L6GU8z4dcWiRhEvHhsHKj44UZ0swzDIiDRsp2lw3/RjslXO6spODvs4tuQMN4RxD
         Lo7MpC9caw7DRRUuQXTtBzBE1m37SRym6sNLMbKExRENJuZHxoxqw2Jt9kvCnSOQFHi6
         YqptXUJeq3z1ksV4PuVD7C8RN74gGg5PyPMH9IEZcvfgPKgVZYOieg+ijwXP0m71GseG
         WMLUFhma2A4oZ4LaPVhZYAJPM4bdUjeeDPzUEaqNYDmEUTERWVJECRqzqox38xpiuaAj
         Ya8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770769400; x=1771374200;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=GqtiDoHe1hXnMnvoCnlwaWBKlrntzDmjJI57vg8nEf8=;
        b=iXEa58QTXRSoIk2aHQzG/PhjKhJfPyRzaRwdSWSeOzHYjDwo2DrKLZfGYrS+xsOoLT
         x0C5vUy+kEWdotrv0tp8s9DEWOj1H20tqiuTnbYAvsfwKDcY7P31EqoTi+KsDtkFYy79
         yGBiQrf8wKtPVpCzfwmsjYjF+JGWjbrTpSP29lm+ssWwasXB2iR199KJ9IiYoH0KCh8g
         6Tp1QEaPnPCqjEpFSTS8vG14WA5RVqPy+b3ThRy/b7A55L+gAvXQlLN1f+O3nGIRa8tG
         1GDkZ/4Qs3Eciix+pcxNBFy7vRDzRozXvOqQ0TGVUubzd1rvprELY1F524LbIX268YRD
         1Fvg==
X-Forwarded-Encrypted: i=1; AJvYcCXOH2+vt62PJitE0oUAo337QAmoQgOMKAfmwwBdIOilObb0giylUaE5vABtKNCEC/+5zlrE5ir/iaOXLw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz8GCBSYRlBXoZ2w8LdN7PYrDMd30GycJqgDX5ow6JKiFUi2xY7
	IpMnYIZZ5sTmtm9/4SAQKBQpVTIoKCquPsm1WDiW+URgRBHFRaOw6g97
X-Gm-Gg: AZuq6aIvmwXKynNclq3He62CevDesvWrHOcBkEQvVMjSNO/t9PbBB7YPEiw8l+yTtCW
	YKlKMgf060eNsnkB0ni3Qs6SxROud7BzBcgwjthx+3ZbeymNVpw/l/FgqPYxcsBBq9d5OPNXPkr
	wRPU5oSuZi9nFoElPALY3Fk7O5GguUh2/7pVydn72uHVNNKiEPLy4HwUIfjhR/NZIerimZB1NNi
	65t2L45E3Qk1HaJnuFI/TVU1XDduwXNZZFgQjOwdGLpsLhv49W4vOHwX8nvP0emVdfrTnKQdCvd
	69rcFBcFYEN7YVFPTfQmkDkrEWmEbqBH71CL9B/fbsdmGBL3GXBTzz4cT6g+yWfRX0aiNmzHMme
	2GMjZ/zhqwn+0vRCfUBm0wWmJcVlzrDfuPw6uMxDjim9N7pZ4SXisLYuYZVgWUC/GD6WHxu2B+G
	2NGc9S8gBOvCzlBg==
X-Received: by 2002:a17:907:3d45:b0:b88:7568:26ed with SMTP id a640c23a62f3a-b8edf3ec116mr905654066b.50.1770769399518;
        Tue, 10 Feb 2026 16:23:19 -0800 (PST)
Received: from jekhomev ([46.251.53.180])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8f6ec1db0bsm9992866b.46.2026.02.10.16.23.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Feb 2026 16:23:19 -0800 (PST)
From: Yauhen Kharuzhy <jekhor@gmail.com>
To: Oder Chiou <oder_chiou@realtek.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>
Cc: Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Hans de Goede <hansg@kernel.org>,
	Yauhen Kharuzhy <jekhor@gmail.com>
Subject: [PATCH 6/7] ASoC: rt5677: Reset the codec during probing
Date: Wed, 11 Feb 2026 02:18:38 +0200
Message-ID: <20260211002255.4090440-7-jekhor@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260211002255.4090440-1-jekhor@gmail.com>
References: <20260211002255.4090440-1-jekhor@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

To ensure that the codec is in a known state, reset it during driver
initialization.

Signed-off-by: Yauhen Kharuzhy <jekhor@gmail.com>
---
 sound/soc/codecs/rt5677.c | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/sound/soc/codecs/rt5677.c b/sound/soc/codecs/rt5677.c
index f56ac267f53b..60a93c3fe2e7 100644
--- a/sound/soc/codecs/rt5677.c
+++ b/sound/soc/codecs/rt5677.c
@@ -5581,14 +5581,21 @@ static int rt5677_i2c_probe(struct i2c_client *i2c)
 		dev_err(&i2c->dev, "Failed to request POW_LDO2: %d\n", ret);
 		return ret;
 	}
+
 	rt5677->reset_pin = devm_gpiod_get_optional(&i2c->dev,
-			"realtek,reset", GPIOD_OUT_LOW);
+			"realtek,reset", GPIOD_OUT_HIGH);
+
 	if (IS_ERR(rt5677->reset_pin)) {
 		ret = PTR_ERR(rt5677->reset_pin);
 		dev_err(&i2c->dev, "Failed to request RESET: %d\n", ret);
 		return ret;
 	}
 
+	if (rt5677->reset_pin) {
+		msleep(1);
+		gpiod_set_value_cansleep(rt5677->reset_pin, 0);
+	}
+
 	if (rt5677->pow_ldo2 || rt5677->reset_pin) {
 		/* Wait a while until I2C bus becomes available. The datasheet
 		 * does not specify the exact we should wait but startup
-- 
2.51.0

