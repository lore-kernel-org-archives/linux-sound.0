Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76D8542BE9D
	for <linux-sound@vger.kernel.org>; Wed, 15 Jul 2026 09:56:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784109385; cv=none; b=HX7hH03RXFttWk+xDU72SmpzS0UWmMy85W7ohWtG+K/vBICj7q+zW3Oyjm022MvKujCkP30lEejoqjxmyNR/qVSxcbO6CYieUsUSIZ4IBfjhdqlZQCQGudMjNO5i+hEv5jdQ5y2zhM5pjWEACigkEVZo9u61HUtMqquD8rlK5CU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784109385; c=relaxed/simple;
	bh=RVMpE/2zJngbP2l7dUgGImsnDYyJOJke9NWacK4SwV8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=bBxhNtaBU6mNT5Z6j1RT9el/oQ1VtvUiWLNWDo/gIjoPpu99ZsZAP3yHrEGoV5pr5ss5BHPNyjOuNVd7C61wegW1DqxkgBW9cXPljaIbjG6dpQUL+CkVP+RzpAQysAcy8lx0UIZjW8xlNynmSTvTNFXsO0bbcGnEgJuj6u2mt14=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=N3e0Qx/e; arc=none smtp.client-ip=209.85.210.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="N3e0Qx/e"
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-84a2dcec51cso3730074b3a.3
        for <linux-sound@vger.kernel.org>; Wed, 15 Jul 2026 02:56:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784109384; x=1784714184; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hMaB8cZfcOw4iICxwreQT8955W297Mz8pA/NoRorvZg=;
        b=N3e0Qx/eg80HoREkrlk2nkftyqd6pNcmin3ypP7kBE/9fxY0jfGdIdJMgs1N8+UGEb
         pdPSz5s+4eQCkeHj+dinLJemhKk1mH0qJQOBwmeeNSt6PTH0BSctdFFTT2xErPyKmTh/
         blibOXIIrOFMe1OcDvYvRpNQNztDumzuZBWfLUH1HMA83cprygGdgmulJzriCGSpj2Tm
         9MIjkyckSs33dzc7HYom5DHwJGFKNh9i363ccHdh9V60XpUHWfDvx2Op166vLaBE7M/5
         bNhLOSDUNC5ylJ3laqdeikn7KDlTWpECoUtVQmsyIGnES3si9LOUGcZhivam3PuOhsaq
         w5SQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784109384; x=1784714184;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=hMaB8cZfcOw4iICxwreQT8955W297Mz8pA/NoRorvZg=;
        b=EVjx6oz7qv9F8EJWW5A1mC1uUB7uTjmCXpH0cH6oEVRybPJUExouqnGYsJM5TFj6Wz
         Xz0uO0odbvxiX1fLtafDzbvWYQ4U1aZ2cVxRBnA/BNWgMp/2P660qKUW8WTmLOxJ2hS2
         ueWSz2I5E6fNn7USpEw6IlHXKusIN2sbFVn34C1Ul6+qEKAWwrIN0aVqU0JQ6UjtNw5P
         so3pWWbEaCu7L9sYjZ2HY/m5qauRh/IWvmQofwXfZ6vaeIvbXtc2Nohvm6pDH+OCgl7H
         7PWr73lx8VHxoV/Ay0mrZlLiGlOMZ83h4JmRhY/NtxWyZX0pJx090e4RUQz94oLX7VEC
         oUjA==
X-Forwarded-Encrypted: i=1; AHgh+Rq9nO/rKcS8lWuRYDcGKCKXMYSwjM4MlaRNZkXR6/aT3wFXnnVyq9FFDbGej3KD9IpyY7rcrCZs4C4Bcw==@vger.kernel.org
X-Gm-Message-State: AOJu0YwZm40P5Ibl2/7+jz6DO29G7baWl22hJ7NDYWziMnfSOoq0SYq7
	Nv6W2tiIyW1a0d2Ilkpu92HQ95Q8xdgNLUoIR/FbNUj/T7oBu+GEYL+M
X-Gm-Gg: AfdE7cmAzq4/wGJ8z/k7Uo1fQY4bCWfcyEJBcveVmkdDycS7YCkdcJxGOKuRIeRP2Fp
	Elul8esAn2IAy+iyhPw3Tf/TSUn+ymUARVgkDMse833ArQvVV0V1DmciDF9l+drFO0qGlfI0S8i
	+BlfPJiD10Ztpm39rE0XGep5GHAV722HySbN1LpEP5guorxTzv8J7klL4RhnjgmFWOVqnZe+RxN
	oBPKdkLtaOw6l8aakGrrbfEtgprufNnZMa7QBE9Q/VF+s5zRT9+/l7vaWGGaETbiuSDovjHLFF9
	U+IzEchRZGmx2zAC0C3ztxkLBV1La0WkjLsH54RqYScNgIYtnqo3dCcfi/QqYdKonxD7DZ1ZiWz
	jg/vpqeVrTO/7bKNAvdaMbrXPtgf5Pt+UFw0ad4RawNZVtwWeHUxgwbgvofSOKVmzQbAGFsSeRn
	6kmrJvuwDwQ+S/c6YKxwxTcV8thGIwfpNlt2f3qasHx+IkkD8=
X-Received: by 2002:a05:6a20:2584:b0:3c3:2e2b:29ef with SMTP id adf61e73a8af0-3c3575df9dfmr6494504637.51.1784109383732;
        Wed, 15 Jul 2026 02:56:23 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-ca5b3643399sm11628908a12.22.2026.07.15.02.56.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jul 2026 02:56:23 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Mark Brown <broonie@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Chen-Yu Tsai <wens@kernel.org>
Cc: Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Charles Keepax <ckeepax@opensource.cirrus.com>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	Chen Ni <nichen@iscas.ac.cn>,
	Marcus Cooper <codekipper@gmail.com>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Danilo Krummrich <dakr@kernel.org>,
	u.kleine-koenig@baylibre.com,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sound@vger.kernel.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH 6/6] ASoC: sunxi: sun8i-codec-analog: Improve probe error handling
Date: Wed, 15 Jul 2026 16:55:25 +0700
Message-ID: <20260715095525.40668-7-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260715095525.40668-1-phucduc.bui@gmail.com>
References: <20260715095525.40668-1-phucduc.bui@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: bui duc phuc <phucduc.bui@gmail.com>

Drop the redundant error message after devm_platform_ioremap_resource(),
which already reports failures, and use dev_err_probe() for regmap
initialization errors.

Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/sunxi/sun8i-codec-analog.c | 11 ++++-------
 1 file changed, 4 insertions(+), 7 deletions(-)

diff --git a/sound/soc/sunxi/sun8i-codec-analog.c b/sound/soc/sunxi/sun8i-codec-analog.c
index 2024e2b2553e..3335855c6311 100644
--- a/sound/soc/sunxi/sun8i-codec-analog.c
+++ b/sound/soc/sunxi/sun8i-codec-analog.c
@@ -822,16 +822,13 @@ static int sun8i_codec_analog_probe(struct platform_device *pdev)
 	void __iomem *base;
 
 	base = devm_platform_ioremap_resource(pdev, 0);
-	if (IS_ERR(base)) {
-		dev_err(&pdev->dev, "Failed to map the registers\n");
+	if (IS_ERR(base))
 		return PTR_ERR(base);
-	}
 
 	regmap = sun8i_adda_pr_regmap_init(&pdev->dev, base);
-	if (IS_ERR(regmap)) {
-		dev_err(&pdev->dev, "Failed to create regmap\n");
-		return PTR_ERR(regmap);
-	}
+	if (IS_ERR(regmap))
+		return dev_err_probe(&pdev->dev, PTR_ERR(regmap),
+				     "Failed to create regmap\n");
 
 	return devm_snd_soc_register_component(&pdev->dev,
 					       &sun8i_codec_analog_cmpnt_drv,
-- 
2.43.0

