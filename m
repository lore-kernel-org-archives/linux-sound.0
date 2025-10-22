Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5E9234B419
	for <linux-sound@vger.kernel.org>; Wed, 22 Oct 2025 13:11:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761138684; cv=none; b=OLEpSqPeagmx//O1iFK546eAxQFeGvg0V13W/DEX86uTKtPiQhjupUnCMmfzO7sp2e0B4xW2008OlG0JkeCkDpG0fOuPtnWsONvYQdpAkF7dW7Fh4F3BA8yfU8nIw8ecxVJXqNsPtys9ayRx9QgehZZu2tcHXanhj+z+IQF90yQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761138684; c=relaxed/simple;
	bh=kA7iX9loqcR1iPNQOHLnQ9pDOo+AVwSl3LLk/F4br8U=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=pJJuTIKcudHipJq8eu3xejMXi7wqp55lLAKfuEEkWUXcQv5Cc4pSkwyqoDIgnkYiZIEToHXe1FriHQObjTtfkjWpgBPDh+O2OiamSY70ns1Uq3c3XJERMBm+pOPo2nDOnmRvy0AusYSRGnFvQAcZh7pDTg4KCDLv8Og4CVWtS+I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=GVW4ye2X; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="GVW4ye2X"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-47118259fd8so43229255e9.3
        for <linux-sound@vger.kernel.org>; Wed, 22 Oct 2025 06:11:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1761138680; x=1761743480; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ndMaJDazpE5vfGfuGA/DbEp6kihBYbJYnxWQMZaUODQ=;
        b=GVW4ye2XC2mSzzm7rrhjJ+qKEEFXY+9D1iIrKlTJCLZ9F/JF+2asbuAevXxhHcWerU
         RpenGia5TNlCQZQuyyVZUksr/gvidtG2zIQf9avrQYL4+cMX21tJRO1lPLt6kjycs5zf
         NiFyQDitVvNsaMvvHk7FcYq6K+kAWWx/Dbw5FpG5uU3BMrv3YeXA179M9e3OAIyTge3w
         BqTbxh6JCNKGwbhjzbaZWTgJptGX+9SJZZkz8p9o5GxjFSnvPxruvrLQhta+TsBviTzq
         A9iAWInHFFIgR7sC9eJExGS+rzDV2IeOnUq3uTQHPfXZ1ajuvx8jCZ9djwhy2S1DYjrj
         93Tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761138680; x=1761743480;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ndMaJDazpE5vfGfuGA/DbEp6kihBYbJYnxWQMZaUODQ=;
        b=CLiOMpHTL0++eUTe+Opi3pwnzCm0FApWSO5dYSBI+Im7nUdgh1YZRiri+4+hEWxV00
         r6XxPXQ9uw7dKDBhXSfyUDiUZ3Sb3i2frly4a4Y0fDbTA/1AdZXK7J3s2DRziAG1MXUA
         SWyIY/3dT2rtiCXhK8zjS/cF1Fl9TCR+Puog4UWvOEdsGgDAM2vvPiL6yjhgY78SZXiE
         8DPUXJib8R33mfW4AcL+kFd668MIuqx6xrQp9F+CfmCHzvVDALWahX1wMKBzQngjR7C3
         Qzx/gYWn97aiM3Fq74VKB5jghOPFvrEOHGAUmcZz1Xcc4E4NKnnhoYhojomMiDa/LRSI
         jy7g==
X-Forwarded-Encrypted: i=1; AJvYcCUKi36Q/HYLp26GPV6gqJkc7f4bDovcdzvSDgiZuPDup4CJuGPpZJQYpY+jMhdnkTIJTOW7qmc3yBEMgg==@vger.kernel.org
X-Gm-Message-State: AOJu0YxDLb4pcZXuASC2/9fM09m2wM1KqpCBTZxKPu21SK7nB035bL+O
	4nRfPYa8XKJQK2PSubDBCUI0QLHhuoaL36RUKVjuFFaEr082anJ1hj96thdPJaT3RvNCgz7pTsU
	d18rn3ZKsZg==
X-Gm-Gg: ASbGncv5DMiUzH2oSO65nQ10LszfceLTMw+N9bky5NAjsEEHHNRsiYwhtg1K5ma3D16
	6VornRy5MYxCZqHTvEkvStRzuFfFqMcWxlUTV201Tbl8Iy63p3Fbkmhk2Caca1Yel8L+oyJDi5L
	TwMk9d3KE633TaGTmymDfEawB9E877LY3ZUkoNNxIskmI8yRI30ZXLw6+kDd1veTz5b/gopDvQ8
	L/LfHwKMzLAcBltsghKI52cSeS9qRnNR1NoM8ca4zTyRTXk3TdrmhIVYj7FjuZagXU3cwExYau3
	oxle4YfgQDdmAwAZm1t9ISiVtc8ymJpsam+TtLy8U8NpK4I3Gc9OCok/33moy30YQBKu2uSvCgJ
	uiCHgWWUwtL2z7sM2WR8di6u7Rn07l+vDnl9i2XvIGem36hewYEGJHMSD83Sx926JuXTjZP8=
X-Google-Smtp-Source: AGHT+IElmfoCM4Q6owceAuIC32Swd+WBqF/ju4yk1O7IMXyO8uZfHXXvVXon02N5YX5wAalBpK6E0w==
X-Received: by 2002:a05:600c:820b:b0:46e:27fb:17f0 with SMTP id 5b1f17b1804b1-47117877244mr152930715e9.9.1761138680082;
        Wed, 22 Oct 2025 06:11:20 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:69df:73af:f16a:eada])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47496afd459sm38839905e9.1.2025.10.22.06.11.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Oct 2025 06:11:19 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Wed, 22 Oct 2025 15:10:48 +0200
Subject: [PATCH v2 09/10] ASoC: wsa883x: drop GPIOD_FLAGS_BIT_NONEXCLUSIVE
 flag from GPIO lookup
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251022-gpio-shared-v2-9-d34aa1fbdf06@linaro.org>
References: <20251022-gpio-shared-v2-0-d34aa1fbdf06@linaro.org>
In-Reply-To: <20251022-gpio-shared-v2-0-d34aa1fbdf06@linaro.org>
To: Kees Cook <kees@kernel.org>, Mika Westerberg <westeri@kernel.org>, 
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
 Andrew Morton <akpm@linux-foundation.org>, 
 Linus Walleij <linus.walleij@linaro.org>, 
 Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Saravana Kannan <saravanak@google.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Andy Shevchenko <andy@kernel.org>, Bartosz Golaszewski <brgl@bgdev.pl>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
 Srinivas Kandagatla <srini@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, 
 Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>
Cc: linux-hardening@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1242;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=xxM5DFs0HrWkdhU2lVlfFzKEyxjnJBr+LeYHk9Z5T9I=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBo+NfewAfk5p+4oeOvjAnI585CCMJu5zdsTl5su
 CQCI6kaATOJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaPjX3gAKCRARpy6gFHHX
 cm3nD/9X6poJlB7hW4tB328EYqSDhizysWMNuFzzrMAB/gZ/dCtlUIbLV2FGSN4/hqWPj9FLVYa
 EfjcmFjHENOOZkS30hb0L5xxn1mh/rjIAWHwi3pbleTnKTDUoCF4W0wJ/Zs6ckL9JzdcWHVuuMA
 Az5VbXNST9iwIAUxWYdmAeAZ2AcD13/pqNrkGvH9uqEwQ3e+wEmMY512+R8xKRhlHPRJwhTR8dL
 5onGyAoPZdHP3Ob+9N9Hlxc4WyTB8rVa83OTlpu7Tag7fbqhRXzngDxUPwYsvABWFvWcdIg8IYC
 k42uNeJy0KNjseRxvzZxC1pyACVME7kz4ig6TJOmGVyfMCenQJ78AeaIqNIGlnKqr3viJE2kxzm
 UevcSl/ZfjTeBVfrRSgC5+3JzKpgYOX7mVPsxyrfPWh74V/Zq4Ba2Pjxbe7Ay4xY3aK+zTbjWrs
 Z58p+1vzp64cUQ+Rqm7Mh8U9+v4gMcbBexYEZFt1g9pqhawriddU5vyYGB724c1Qe49WoWGfae/
 mArKavWc7ccOhUfWgffapFXIglUnrG/NtQcJszys7vV+yPa+djWNZjQ94nRuNhU++rtbmNoDPYK
 77Gqebezf9XhV9ixSvIGqf6I1zHHkROLC5eYTZy6EdG9Saxw8sj7arI4mkuQke0mNuh060xP4OE
 zX/Whv3fFll6glA==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

This driver is only used on Qualcomm platforms which now select
HAVE_SHARED_GPIOS so this flag can be dropped.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 sound/soc/codecs/wsa883x.c | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/sound/soc/codecs/wsa883x.c b/sound/soc/codecs/wsa883x.c
index ca4520ade79aa2c9377449e29cdd33e9e8dd28c5..ba60b4de6cab7740cd8aa70c89f6e03e1dc2dd12 100644
--- a/sound/soc/codecs/wsa883x.c
+++ b/sound/soc/codecs/wsa883x.c
@@ -1572,13 +1572,10 @@ static int wsa883x_get_reset(struct device *dev, struct wsa883x_priv *wsa883x)
 	if (IS_ERR(wsa883x->sd_reset))
 		return dev_err_probe(dev, PTR_ERR(wsa883x->sd_reset),
 				     "Failed to get reset\n");
-	/*
-	 * if sd_reset: NULL, so use the backwards compatible way for powerdown-gpios,
-	 * which does not handle sharing GPIO properly.
-	 */
+
+	 /* if sd_reset: NULL, so use the backwards compatible way for powerdown-gpios */
 	if (!wsa883x->sd_reset) {
 		wsa883x->sd_n = devm_gpiod_get_optional(dev, "powerdown",
-							GPIOD_FLAGS_BIT_NONEXCLUSIVE |
 							GPIOD_OUT_HIGH);
 		if (IS_ERR(wsa883x->sd_n))
 			return dev_err_probe(dev, PTR_ERR(wsa883x->sd_n),

-- 
2.48.1

