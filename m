Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B2B5361DB8
	for <linux-sound@vger.kernel.org>; Wed, 19 Nov 2025 15:21:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763565716; cv=none; b=lSkvqlJHThC5ByGKMYmh/WHPhwuFZnPOxkeABWqrMJjzz5rGKnq4Fh3eF3gnmRfzORtP0XViP3o6uFxLkOIZ5NPxcbyTnLrOvQU67bbY8Up2Gah2G+ezv7EuTsx8ATDjLmnjeYfHJmVqgnrG1LTJllEPSqj90M4di0n/wqFIilE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763565716; c=relaxed/simple;
	bh=N3l59kOsQt7nYIQ5xrgl5IaNVvlsHEsLL3tCZhtIQ2Y=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=fBa5+pq40C9NMGX9S4vQyCAX1fb9Jhf15R7M1rOTHukCxTWk2sdBr6kchoa5KtQ3hWigdLwuNnvMm2vk5Jv4jaaAtd/X8SQAP2SY0eiZS6q07uJBV3NPgiIAmyIolOcYygy1+eWp9LHu0hH7mBYpLrwFTgDdOfL83YJ2OcTGuYk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=WLCJhtcz; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="WLCJhtcz"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4779cc419b2so48026455e9.3
        for <linux-sound@vger.kernel.org>; Wed, 19 Nov 2025 07:21:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1763565712; x=1764170512; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WWzVKv5ouKkFGvVUTZu4Vj8DMC+GR4MyL5I2JNNHBKI=;
        b=WLCJhtczJTtnY+sG28TP/mFnhGcneqK8wZ0Ga1JWWgygHwrXBzuMj2/MjEeykGSdaJ
         UtGhBiWVOF9XYBnWrm6zO2pdelRYUDocy3KAF43/lqgYi9MhT3yTj8Q9uIprVWQMT91R
         ZwvBq74iR3l5aOeis6sn4kmwlQRnc7gKSxj1n7qM/uDghRhegaC8pm9meTEukE9E/Zed
         3uhNlWzWWcSxs7nN5RhoQXxY3PKq8qpTVs6FmXu9UguKPGSJpHh83QPJC/Q+9BDDyGQh
         yYQBn7E0gIVUBAnoCEUUPW/YdNE1oNf8aN7i4AgeLzic7jNdz5w36WG5gG9SxyJYBnjj
         3EJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763565712; x=1764170512;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=WWzVKv5ouKkFGvVUTZu4Vj8DMC+GR4MyL5I2JNNHBKI=;
        b=h+l7svEZmFqrw0sAkyTI0L9YcKycVnJ1fBlYLylcS/VzeRrDzCxIpaEOnwbjDJ66I6
         zjSKjIwIErHcE3JUf6CqvqJ+iNCejZxOStmaB2ntXI00pStvDvlvgJ8uQJcYV4MJA46v
         TPzah/Sr+QFnDmZUfH+Tl7Jf2zumn+rK08THijTYbVvY6kEuBgjcCvgygfv5ZgtWxm2y
         wCreqBMySjKsG+uBSokI3kacvlXUCCNEqYpn5m/P1UrdJVyfzuO3jPcWWCH5WGZvmxdJ
         6K1FxQmP6ZGJ6OBk1ddVKZ0C0yQq+Ek0PehjFteYaAidfeHuP7VMvOtXUaF6KZJuZwi+
         I1tw==
X-Forwarded-Encrypted: i=1; AJvYcCXtSW1eXdcF28iPtjdNWp0Vq1bHTRjYignYDUh36rpVY6bvEsmckl2rzHaAjI9QsStRLnoKejcJ0eCypg==@vger.kernel.org
X-Gm-Message-State: AOJu0YyeMD+xinkzg5qWHPhPGYs4r71HfEt4xvBhneEAvuqsPusV79TZ
	t9NMhMLSecmjv6mCiCT9i+Zgh5iuFRoeDgdLrDnC9jnISeaSiFIZUhXmWCKbpid5070=
X-Gm-Gg: ASbGncsAhH9ofw90mo0wfhXx+lqyz/dlhv83cMu5ttSPi4etlTBV/DaOXf2qzSp5cLU
	evLoFnSphou1w2PKgHkVzblSCfZQcG5WMecBxvH/A4yTHu6d2MxaQAvj8qiwwi4qSjT4dy66rFX
	Ht2MmG0+3OFxB8CzJLx/5GDvIgkm4U34dx8ejoOsuDW4u7fScKHeSN8GR4rrrhU7O6PxKLTBWFC
	AASujr/Kojlqdhfc1yMBZH6OZGrM9HLVyRDicKTAGFE6Wtoan9bllNnnwkCmuZb1OUIGj0pFdQ3
	oGJ+Gr0U6g+wEq9ZqHXUPR2CTY4uSTMpTRvdeFjCpxngl8UHQs4KdZXMzzMhiTml2hEKwGWxbi4
	dP9JmMx8TsoGOCWBG9eE0efq49mUC/JwWPHvIJpjSskJxzeL0uOGXbGnGTIOmlUx2f+o1PPKEc1
	gyPNm0kp+BCF4dkuk=
X-Google-Smtp-Source: AGHT+IEDKWc8zQoL0/HIGMblStUKKbwxr87JALzkXWBHan3UsjV1tyVowkbbkfozNa5172g/CAvNQA==
X-Received: by 2002:a05:600c:4f0d:b0:477:a978:3a7b with SMTP id 5b1f17b1804b1-477a9783aaemr62118455e9.22.1763565712234;
        Wed, 19 Nov 2025 07:21:52 -0800 (PST)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:c10a:203f:120a:d2f9])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-477b1076865sm54429375e9.13.2025.11.19.07.21.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Nov 2025 07:21:50 -0800 (PST)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Wed, 19 Nov 2025 16:21:28 +0100
Subject: [PATCH RFT/RFC 1/2] gpiolib: support "undefined" GPIO machine
 lookup
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251119-cs42l43-gpio-lookup-v1-1-029b1d9e1843@linaro.org>
References: <20251119-cs42l43-gpio-lookup-v1-0-029b1d9e1843@linaro.org>
In-Reply-To: <20251119-cs42l43-gpio-lookup-v1-0-029b1d9e1843@linaro.org>
To: Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, David Rhodes <david.rhodes@cirrus.com>, 
 Richard Fitzgerald <rf@opensource.cirrus.com>, Lee Jones <lee@kernel.org>, 
 Mark Brown <broonie@kernel.org>, 
 Maciej Strozek <mstrozek@opensource.cirrus.com>, 
 Charles Keepax <ckeepax@opensource.cirrus.com>, 
 Andy Shevchenko <andy@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-sound@vger.kernel.org, patches@opensource.cirrus.com, 
 linux-spi@vger.kernel.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1153;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=p2qr9cuaBFmf29Kwl9Pu2TEsEALyFX5fRqqffYfbc4s=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBpHeCMHDIjZ7lYX4IJcx54rCtuMc/TP+vjyd1t+
 x9jaKqfgHyJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCaR3gjAAKCRAFnS7L/zaE
 w8n6D/9dGM5Y42PSNAC2Z+vDDvJVLHGQ0abvZavHWl1YP985hGUMZ+mRBoFTavPXN3sgkZgdnrK
 68tslGfpvZ+RmJRNuLS7tDgiQiZH6to0q6TBvyDO3kKx78UsLzRlhz1vybs4N9jmyE7UwLeCeAv
 wojpzJFV5MeQq1dfyW1gxbtC3vsiOXoMXg+zqzMG//8ypGxOX2n7gkik5KLkzzWsq26rBelCmyn
 BjQbQF9/POwftv8mVYmYfy0xHHLYO0o71hzgPO8F43lBnLeVIhtScwWA15nPyoIxpzTYSZPvSvg
 La7nT5/IQHsqNXh6QBEz7ikuFnizP4sKkPOtPIT7EL1F1nmu2qc7fnX7MDj+FIZHzc6Z+evxPzm
 rzVB9W03A1FBTP2BjDocuDvVtCbrQaEBIkOLkLDEZbTuhUFYkvx4WUPqbEElhbgTxeagLK/pT/t
 UmEKyzt34ncPQLKn6CYO87qmpvagvuKrHX9qe6rBT6VPYLhIehFa8obD3OC8fPYlZblRkEkuk6r
 /FTofah8y+FbiYpuslDuQbPE443VeZlx3E+URPSW6sguUj9Bq6UUV1ZW4njbz2op3/NASiPpbXR
 l0tqHMrmF2A4/1FuE/XcYoo550oL86NKt/j2YD/I/q3F3ejck/ol2Iovwox5vZsvfZeGPKpoBUY
 Y5Mx6ub9nnbhmDg==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

SPI devices can specify a cs-gpios property to enumerate their chip
selects. In device tree, a zero entry in this property can be used to
specify that a particular chip select is using the SPI controllers
native chip select, for example:

    cs-gpios = <&gpio1 0 0>, <0>;

Here, the second chip select is native. Allow users to pass
ERR_PTR(-ENOENT) as the key field in struct gpiod_lookup, indicating a
native chip select.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/gpio/gpiolib.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
index 91e0c384f34ae5c0ed61ccd3a978685d4f72e867..dbb5f7fe7b661979f559fcd32ad6e1c463431a18 100644
--- a/drivers/gpio/gpiolib.c
+++ b/drivers/gpio/gpiolib.c
@@ -4557,6 +4557,9 @@ static struct gpio_desc *gpiod_find(struct device *dev, const char *con_id,
 		if (p->con_id && (!con_id || strcmp(p->con_id, con_id)))
 			continue;
 
+		if (p->key == PTR_ERR(-ENOENT))
+			return ERR_PTR(-ENOENT);
+
 		if (p->chip_hwnum == U16_MAX) {
 			desc = gpio_name_to_desc(p->key);
 			if (desc) {

-- 
2.51.0

