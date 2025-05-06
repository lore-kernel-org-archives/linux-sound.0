Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA2BA264620
	for <linux-sound@vger.kernel.org>; Tue,  6 May 2025 09:01:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746522118; cv=none; b=GW4KAVaOXOGoDrwkQsSid6SSqQA02mQ+Ce0fo8uw31ZiMB7sxXIqfQ3U3fsi45t0l6H3wRjBxzldtpV3T6SHva//uxjRnfWLlITX4Ejp9sROSp6ipGhJHSoIFTdx6ONSMwj6z+M2QrglAbsSmd3PBz1SwA3PirrpU6rpNIDSCuE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746522118; c=relaxed/simple;
	bh=2or+JBNGnO4YRdXBRTn6HPiuWZpgrAjupHyyTXPwtVI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=u0n1hRR9h0NomkoVn6AVoXsE+dK4BHuUmKeyyE6jtsWtdU1OnXX4bwFdG1YPzuY+UUJZUeukFMSL7+ca6Eba05OtziGVnxg1KcYsIf1Qm3DvJcvPL4pcPzk3OdGt4967U9LEGdmdIAFf0gFlJhlJFsu+i0vCa3xaXGKUUzMyHnM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=mIhx1pNX; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="mIhx1pNX"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-43cfebc343dso35664415e9.2
        for <linux-sound@vger.kernel.org>; Tue, 06 May 2025 02:01:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1746522115; x=1747126915; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XRbwfcPISTocHOhXVUtVqcS/MjhgKVKyymoCXJ3Oarc=;
        b=mIhx1pNXiRg6DKqnGmXv7U3tmrU2QkwhC0UIUDnOP56SBA3guWJq42dedFTc67sEmp
         ouM1pj7gJbytnit+E3ok730tsVXEhKP3WyQY9u77zqIE1NLCmHn9+GHPzbIdY936A8+B
         hcxHqLrO1WYiejhnXgp4f7pkF7mP4qLtIvk17DDHe7zbx8xJVu1mBDv8YKFp+3T3qDBA
         aqPjIULm516IAzby1rzStCMCt+Bp68mB4tV2GdSFAOx9iipSpS3GskcsnakXJQt83KaA
         f63897Aii2+6eVbOny/THQIIIUXQvDZhV1o3JFDQr9KOTZX8GTHRG+fTqXpekFgXRITK
         BUqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746522115; x=1747126915;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XRbwfcPISTocHOhXVUtVqcS/MjhgKVKyymoCXJ3Oarc=;
        b=ny9P7B4S8XAStshj4q9OM72BcZy0srKH7HRcZe82ag/KekxzffR251bFuXo1Lj5vjP
         meV3oXo1YRQTAlU8N8nrBCCsPaoBKT/yhg0FgmWG28iH/Miuc7tvpAEtDxa0Xc97r+Gi
         c0+fEOrCkN8N/Wm+5hxmJ6z98GPMqYmAk0kI1pMqckH10daRO6yZwqhxF0ujeny3kX8i
         6YALs/OeXXWxPg+WzbjSkKzAiAYMcs4AGBXjmk73vxlJpxO9kd7FP6AtM1lZB7GhM9l3
         GtEIL/SY06pjECV2SSRnqU/2aWzKaja3UVzIYD6QD5Pg0XGFbvfX3hFr5mw1fpW5xyjE
         aR0g==
X-Forwarded-Encrypted: i=1; AJvYcCVA72yZuEvmbOY5FCdkirDaRCjqtNlHV6uYDArEYOWMqBIReL8T79WIQdEa9pumzRhhZCSfOHCwUlPVyg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yxgk1SLHuykNa1StM1YiNCSe4/9Le/dbWmpogvogUCmG51bFISR
	osLzO+h4H8RRK6MKG7mNDNtd2/hYf933JNbCVht8aC8Ay/u9Kkq3mTP7z2rH/0c=
X-Gm-Gg: ASbGnctGO5rVdYO5xVZV+55ZLIYH49kCZTMRgkqOgqfVL2ht6SmG79pEN6L3EoIdbEa
	w5TMGzlTQGg/f9828jBMLw3uKJr+z0/+TlXFRYmDCL6uK5na+xHzcqqH23+miyqy+0M2DAB57bA
	dgiJ5o/kQfLLCJi3ioPeEbDXVa5rOoV9jb0mCK/O3Av0fAd+6t4ezkOEvdld1Y2FUBtwpM07+yz
	KL6x2l0fBmGtKn1CaZEKhXByae2mtAZewH+mJzJJwL17cktJzWhd3v/N1ZYRZGI27V1Zbxj/20B
	Ko8phtqiODQo26QVsH/YrIpsNRe6mjZVEeU=
X-Google-Smtp-Source: AGHT+IFaS4uuNDBaE6dhkhCQZlPqtoW9s6ejNK/wKywX5ZJFKn+MgnjgDQY3rIFa7aCju9NeyyMDmg==
X-Received: by 2002:a05:600c:1987:b0:43d:49eb:963f with SMTP id 5b1f17b1804b1-441bbf33b31mr127301045e9.24.1746522115124;
        Tue, 06 May 2025 02:01:55 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:bfd0:3ad7:fd8a:fe95])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-441bc83d471sm138125725e9.26.2025.05.06.02.01.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 May 2025 02:01:54 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Tue, 06 May 2025 11:01:45 +0200
Subject: [PATCH 02/12] gpio: lp87565: use new GPIO line value setter
 callbacks
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250506-gpiochip-set-rv-gpio-part3-v1-2-0fbdea5a9667@linaro.org>
References: <20250506-gpiochip-set-rv-gpio-part3-v1-0-0fbdea5a9667@linaro.org>
In-Reply-To: <20250506-gpiochip-set-rv-gpio-part3-v1-0-0fbdea5a9667@linaro.org>
To: Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, Vladimir Zapolskiy <vz@mleia.com>, 
 Piotr Wojtaszczyk <piotr.wojtaszczyk@timesys.com>, 
 Charles Keepax <ckeepax@opensource.cirrus.com>, 
 Richard Fitzgerald <rf@opensource.cirrus.com>, 
 Andy Shevchenko <andy@kernel.org>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-sound@vger.kernel.org, 
 patches@opensource.cirrus.com, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=1940;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=g7BgjBBWPP4HAHZDBrZkWD5sdQj4Cs5tbDmVip+FOsM=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBoGc/9ERgHtadWP7KkHQX+SJca3tVfXEyXuW72V
 BoPbo0tG1CJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaBnP/QAKCRARpy6gFHHX
 ciGyD/4zlyrvqUlkFdwqgF6/1bmPTMA+93X1SFLWKapDdKrqY6qB5ax4uK8vlaoVJj+EGNLpV45
 PxHxDOaQwYLAlMSatc7jXiGCGhFX8dfDyqEcKM4w1ow25Cgx9GaOf2IxMKeUtA5DljGR+fvaoLo
 itfBnXi9u0KhlfX6aoEtMfKJjL/waIWp4HMGISTreeWZBiK/Cancv+qdCZem5nlVnQToK+nrrY4
 C1rwbZ20aJhha4hrK/A2mGKhGOtA1qA/CXE7vBSKVVN5BraH3iAvlbNfWgk1rCz6X9x58IRAE34
 gc9M0lREJ5yJoopjEyvR7jxpGpRZ21kiuIMlvD6PRwNyUwi1j8I7SoxNr2UwWq+vmQcN/qnE1nQ
 fFlHfYEhHGibqrl/EgGf/eeG0O4qc1GcoCLK2ocm+ENCoFiEpiPYbS56b3rYUHy6JFWD1+RIJ5/
 4hdQE4Gm0b7F0sOa7+yC0sijojAZ8yPPZFhHayprULmzhS9MNlO9lAOjh/VXpKOrdfi2lnarnvy
 HqvtmfwYKU6qCO7JnlJP8GRepr43s/XAN4BVGd4J9hX+CcPSLfKB+xkM/D0XukauNtFoUctNuX2
 0VmdoCwcYQWChvaZ3d49YENC3PYbDFUmJm1LMxRXD8oMQHMSi6YELPLvRftvqL0K5n7q412i8uz
 XTil/+VBYkSIXwQ==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

struct gpio_chip now has callbacks for setting line values that return
an integer, allowing to indicate failures. Convert the driver to using
them.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/gpio/gpio-lp87565.c | 15 +++++++++------
 1 file changed, 9 insertions(+), 6 deletions(-)

diff --git a/drivers/gpio/gpio-lp87565.c b/drivers/gpio/gpio-lp87565.c
index d3ce027de081f..8ea687d5d028a 100644
--- a/drivers/gpio/gpio-lp87565.c
+++ b/drivers/gpio/gpio-lp87565.c
@@ -30,13 +30,13 @@ static int lp87565_gpio_get(struct gpio_chip *chip, unsigned int offset)
 	return !!(val & BIT(offset));
 }
 
-static void lp87565_gpio_set(struct gpio_chip *chip, unsigned int offset,
-			     int value)
+static int lp87565_gpio_set(struct gpio_chip *chip, unsigned int offset,
+			    int value)
 {
 	struct lp87565_gpio *gpio = gpiochip_get_data(chip);
 
-	regmap_update_bits(gpio->map, LP87565_REG_GPIO_OUT,
-			   BIT(offset), value ? BIT(offset) : 0);
+	return regmap_update_bits(gpio->map, LP87565_REG_GPIO_OUT,
+				  BIT(offset), value ? BIT(offset) : 0);
 }
 
 static int lp87565_gpio_get_direction(struct gpio_chip *chip,
@@ -69,8 +69,11 @@ static int lp87565_gpio_direction_output(struct gpio_chip *chip,
 					 unsigned int offset, int value)
 {
 	struct lp87565_gpio *gpio = gpiochip_get_data(chip);
+	int ret;
 
-	lp87565_gpio_set(chip, offset, value);
+	ret = lp87565_gpio_set(chip, offset, value);
+	if (ret)
+		return ret;
 
 	return regmap_update_bits(gpio->map,
 				  LP87565_REG_GPIO_CONFIG,
@@ -136,7 +139,7 @@ static const struct gpio_chip template_chip = {
 	.direction_input	= lp87565_gpio_direction_input,
 	.direction_output	= lp87565_gpio_direction_output,
 	.get			= lp87565_gpio_get,
-	.set			= lp87565_gpio_set,
+	.set_rv			= lp87565_gpio_set,
 	.set_config		= lp87565_gpio_set_config,
 	.base			= -1,
 	.ngpio			= 3,

-- 
2.45.2

