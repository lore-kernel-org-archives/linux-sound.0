Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CFAC266588
	for <linux-sound@vger.kernel.org>; Tue,  6 May 2025 09:02:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746522123; cv=none; b=FWO2O8Zo37M6dlOw+fqfOvV85ckxRhXW9oFSnNbqZbg+TUTWCKz28i2dBXIIrMTokV+e9sjsgzkeq9aH/holskx/PD1aEgv5AQVhUBjer4s3CkUmrkNZcR/b0AV0GOhFGDeVGJeRtaGBlsc25vwPil713OApxNeJ/OvzKt0f0BA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746522123; c=relaxed/simple;
	bh=J9Yj8CedNMj5JM6ni24l2rshEZjkmfXOzVX7kgR0zdU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=skq3I3jb2XIa7T2gQ6SIdOO5GjIFIHvsyVig60oPpmYE999QibdBVOwIUNFuOw5kjixfc4MeaRrvcwQrB0XdrBnCX4tXaQruxWZZNWzV8mgPy5hEMSdPLS6Q3NkSbTz3W7it4LDkqaqQ2i1l+/7dno/H4pQNVXFKjiK0aCsw4cI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=wZKt+1lC; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="wZKt+1lC"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-441ab63a415so53419705e9.3
        for <linux-sound@vger.kernel.org>; Tue, 06 May 2025 02:02:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1746522119; x=1747126919; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZqmuA8vzWG7JwGdGuncL1WKx+Z40oy7BuFrvWPOr8LE=;
        b=wZKt+1lCx9UFftWQ/Z1O8FzSDDfMRgh/gjJY3kzuJ5F2+yNiMmMnau4X3cLEuccVMV
         7SbVA2v7iBp96KOYxJ+WFoszrPCQGKQoT+pNFGCHy/K12cf7Gbcb9jgFgSP9p8VtkfoT
         7X9tqx6j/oNNB4HdBLUr48iUcqZCOnobbyXZlPR2Qrsa9VPn5EPwZ8+5CtwpggcdXbX7
         SqVHDFIMzV/lR/m58AluR4qIekSFmcz63RoyjT6hCc1mrJU/FXEZo+qKb0miIKqhilEl
         iFGUez7gHgar28z01/yy/DrKVdbqmltn2IVyTBtKELVeyPS/0Fl1KMBMo/KcxqKk+PBN
         MTXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746522119; x=1747126919;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZqmuA8vzWG7JwGdGuncL1WKx+Z40oy7BuFrvWPOr8LE=;
        b=Zd0x1UNpj0b2W4M0UJolOKIi/usvcuDUrmf8gp9Fu256kaSZINrgRWdMzdjhOndjbW
         N2+2WvWr6BWC8/qg6C8pYbMZfaBqaRjN+zBvM34f2X9vF7znIpKjGNZOFWlC+b8f0SBb
         IX1ftcj3qkPvfD5KS/Ycv2a6aIqyZ/1NKRk8wIH2zXulXR6F4BY06kP50BFaqZTLxPtA
         zWwkh6Jxs4+VKn1qTo8cltQbfibRxjguUTjgYP4Q3K3vc7JxJ0O4m4M9AqsXnCiJrxm2
         Jof3powavPE4AMEwtPW5kpJXXyN3RB1jymtzirNL+OGTVAXCUKujl1sJXROjjvuiuAHN
         BVnw==
X-Forwarded-Encrypted: i=1; AJvYcCXZC7heML1nwlMxOUA/zkfGV6+IqJ6sXO9x6THG4n42DPjiT4IXMfIPWfvKcZYlMbFczx5ZpD2A9cR+hw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx+8reXvKBIg46O97vop8YeSYtMzPm1hMt0Q8VeQ1HKVzqodrHp
	DFC/4BRHEEr0A9o/aHssavhsl9miosrqRDsHC4yc2UBnsVwLO6Mbbdtbvemp04M=
X-Gm-Gg: ASbGncsHWuxOWInqHZiXcYlbivmBYJUY4A+H1FOsJVu/SDmYSDRMl0Z5LU2eQjyK6np
	sNPAvCXigIrvrNSB6dNe8lLVBEuE0YBfkH8jJ1t7B0sgq3t/jLoA6QfF5RlLvYvQar3A6i//xsL
	Xab2nwxjn0Weu1ie8SrMMGFVs4Ma8y1oMFu8DHsJU8Bdw1RFSspdmxZPf+Ob8LfgFoxqqwRHPjR
	N+B++McPblPbOVy2C6wpubSQ37wk9kITGm09EZHBfm7TF1uVqN2mmbPUQCj9BmJGlT2KeQv0N6g
	sciW2Dv+Ipe0zqVuXS07S5u3cbmmcB3LBVk=
X-Google-Smtp-Source: AGHT+IE8JUabBzKM92O/84MQPWd1WLHM3XpE0TI2Ymwc3HYRvwGlfQk0QZso0kEgfuXzy3SeMbuyHQ==
X-Received: by 2002:a05:600c:5105:b0:43c:e7a7:aea0 with SMTP id 5b1f17b1804b1-441d100a80emr16950635e9.26.1746522119581;
        Tue, 06 May 2025 02:01:59 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:bfd0:3ad7:fd8a:fe95])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-441bc83d471sm138125725e9.26.2025.05.06.02.01.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 May 2025 02:01:58 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Tue, 06 May 2025 11:01:49 +0200
Subject: [PATCH 06/12] gpio: max3191x: remove unused callbacks
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250506-gpiochip-set-rv-gpio-part3-v1-6-0fbdea5a9667@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1591;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=uCZv0LrEzy8ud4KkWpNsBzdnLQeoymZc1NVUk4tf4VQ=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBoGc/+AppL2eFtEqFE/Vs0gNp1cXoYKuSQEWvx1
 S2/TAMByK2JAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaBnP/gAKCRARpy6gFHHX
 cq5HD/9HyaQrVcRS2SmjLzWGPQc6hSa3wPn27qklXKNgMw8ZoMukH+bqB5mfDRtM6NUrmQD4x7M
 3vd98abOWOBCZkKheY5mu84Ems1rxlmXI9p1M/Zi4lsYf26yT+Pt4dbMt/ZNXxNxFaF/XMUTQe2
 o+4aglfuV0lO3tHfmy7c9dLk8qEEiHXETDfcpHCJnB+BqDgz8aWwfrQYgMFDbXeTO/FVnBZp8Fw
 SutR3wH+u4ac6VY0sIXN3Zz35TrYg0bWElply7PdiJlVUty2whyWhAGt5YnI16f2OYymRDpb7I5
 nNntQtwTa0J8zJ1ArYsW6JaXlIYdBsdM8nXtqdavnT2FmMHLoIk+4CIzaWZ+PcEq5zBLzXWDPYT
 dZRSIwtUKeHxwJfN4T1yaZcF+WXGR5df4XTKfGEJ47Q3CtrRSClqXFT0kxNZvdgB+ovjRkStec+
 LHnqrVYf08eaSeSstqga6tksa7JA5HKAawG7Qr0ThwJmZ29w0HPY+VdzuNyB85PReUluYKkVlLS
 K75yhDoPQtYTnzkIyjpatRNoJ0whVIQaycWgTndtZlo0/Slg6lDwbN8eehGu5o9UVC2z1nSnWI3
 PaftfnkHNsifK6ahgdM/84ynLS728hSV0wOAmsiykjd9W49dktGiYn/5XHdBEKEuciZvq77o4oU
 02XZNAgeT4PdUwA==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

This driver is input-only and as such doesn't need to define empty set()
and direction_output() callbacks. Remove them.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/gpio/gpio-max3191x.c | 16 ----------------
 1 file changed, 16 deletions(-)

diff --git a/drivers/gpio/gpio-max3191x.c b/drivers/gpio/gpio-max3191x.c
index fc0708ab5192b..6e6504ab740a4 100644
--- a/drivers/gpio/gpio-max3191x.c
+++ b/drivers/gpio/gpio-max3191x.c
@@ -103,19 +103,6 @@ static int max3191x_direction_input(struct gpio_chip *gpio, unsigned int offset)
 	return 0;
 }
 
-static int max3191x_direction_output(struct gpio_chip *gpio,
-				     unsigned int offset, int value)
-{
-	return -EINVAL;
-}
-
-static void max3191x_set(struct gpio_chip *gpio, unsigned int offset, int value)
-{ }
-
-static void max3191x_set_multiple(struct gpio_chip *gpio, unsigned long *mask,
-				  unsigned long *bits)
-{ }
-
 static unsigned int max3191x_wordlen(struct max3191x_chip *max3191x)
 {
 	return max3191x->mode == STATUS_BYTE_ENABLED ? 2 : 1;
@@ -421,9 +408,6 @@ static int max3191x_probe(struct spi_device *spi)
 
 	max3191x->gpio.get_direction = max3191x_get_direction;
 	max3191x->gpio.direction_input = max3191x_direction_input;
-	max3191x->gpio.direction_output = max3191x_direction_output;
-	max3191x->gpio.set = max3191x_set;
-	max3191x->gpio.set_multiple = max3191x_set_multiple;
 	max3191x->gpio.get = max3191x_get;
 	max3191x->gpio.get_multiple = max3191x_get_multiple;
 	max3191x->gpio.set_config = max3191x_set_config;

-- 
2.45.2

