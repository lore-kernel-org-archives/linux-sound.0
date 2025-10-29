Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CDFA20297E
	for <linux-sound@vger.kernel.org>; Wed, 29 Oct 2025 11:21:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761736864; cv=none; b=tu/vZVBJYhREcOYWZwfkWLvXzm5lOSNIgWYduoQ14egNtwOGptIyBoxiafrBCenvHqaPvMGkWL8Bnb7Hgsywt8K6PMVrz1Ejve80paXTvtDWlAxxpMfddD/bMc/586OWnbn0eJQm+kWQy/RtI2/nqfGN3SEqJVRZDW7gD1dNgHI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761736864; c=relaxed/simple;
	bh=khg1xFFDM2akAOOkxLyacg/lV+HQFDhET/KCJgZNRN8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Y3JOkb562Cfpl30wmXlBWz4+dZuzUBc6w4YduTLFa6G52qJUjwGf1zchAwHrw5DGGXoSDHahBxJeutGwH5n79ZOWtfCa0g3KZ6XlGxRZx/brzr38LH72OR42y6gqceWy1YVYq6epc40GjYh2uSqajfuK587OQtbnn3rl5Ka2DZY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=RmIjtjhx; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="RmIjtjhx"
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-3ed20bdfdffso7121761f8f.2
        for <linux-sound@vger.kernel.org>; Wed, 29 Oct 2025 04:21:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1761736861; x=1762341661; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1lIU4oOnd9wxauWH3/Fw9rcysB+ICjm9HLPuh90L95A=;
        b=RmIjtjhxtCq3olEHKY/9W5iPfL60X4k84njdNTEwi0bhc/K4Td5l0zu99KzN8bwCyf
         Yssa39t/aHH2oUdypXqIxUNfVn3MxD2fvgfgOS6a4OJLZxhgmT5ilabBkFDhcetPahbU
         3a6y7+lU5R+BXajqsFTL4N0eVCn10pIYfFHVlodZjaejsMg0Y1oE9F9eYwEXKcfvaPcD
         yg94o1oMAiXp5HXtyiWm32j7gbJEQFouLO44S18SLG4Gc6z/8lWgrQ0jhxU5qgD4VRca
         FoVi3WIXoDcHJGmvg1zluV+0v7PO4LjXJS4yogLAwXOJf15zYr+yJ3O+OmvhMTTQBqkG
         lU2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761736861; x=1762341661;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1lIU4oOnd9wxauWH3/Fw9rcysB+ICjm9HLPuh90L95A=;
        b=K/lI3F1Xas9sXQ1yN04AMNW/36VjfMf5on/jnG/+NbI/D4tRQpisXUGTEFTOmY76UZ
         Km2OuLodIt/t7qB2qgCrIGu/shWsJtxiYlwAXCJeKHOKbGVlZmPwerZH57AF6JFHtgrc
         tWYJCvssb5dDXSYBbsDWantmLUDs2Gen1NqiGxUt4nZQPryFyQvMmyWG2IyqugvXi86c
         2Rj9GOz6zpy4t4bPQHi13TINbD9ItIgL+xwQXZajRBEB4BBMlfgw9oxDknS0nJLvAo0a
         yGjxEbowbfvKAAEhQ1xw84/2UqnIyEApQUEZ6CaQOvBNDuKUsunNz6bLVw9+8F5BHPFP
         Jf0Q==
X-Forwarded-Encrypted: i=1; AJvYcCUie53XpzPo9oVv+dAGL7yL0uSVjT6NtjvJKDiPHTPYvKMTcibfQoKSEfX9hnwrgI3RrkvQzKHEmh9dwg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yww6+YvOSzFy0Aec+qRPN/BVe4hxnmSIbWx/a1Ewh5UtF0poW8q
	9NG83kKDD31ckudvTZnCAibQESKH8RzQZhMBV1suoARGrnSsYsuAzH460YNBTV42AEY=
X-Gm-Gg: ASbGncv2zrMpCQslGXeSGSgZ7AvCtOcoN4aetqh8yr+E+29Wk5XswOJNc7HRb8YpVsT
	j6luwmgSPP/qN5mPY3/rBU8apMXVknCVd7K8slEpXyaQTJ/Fz4NDJzlM9MuHyhuVPjGv4r/5eXR
	nIEER1M7EbF4d3Mbar2kOsPfoXy0mjApjCJmyskV/7Szrb8ehlhRIXeP3o8OszYVkMULrNKWbIQ
	2rQXLIgGNL0ybSR55ftk3dOH0/OtLIvuSWCQKviTM4ts+bzvIppqVP+RXJ9F+ydIrsfgLE/RPob
	x9pmzWvbbt1rxGER4Z2fdhXg084f3Qns8Zw7gbqO3tgMHa9Vqubfl+FB9USqy4qr6FmEe5SU5Lw
	iUu+y62ntZv7fko/a2U1GyrjADtA4kD1kPiVms+fTw5ZS5+WXYDtx59BaFo9v6vBkMe89X0OodJ
	SoViqB
X-Google-Smtp-Source: AGHT+IELysTe56E+mhoHZ7NXstUIW6f3UKmtjVO8ghC70j+DW/TkQAucQOrY5XE0HuDLOQMR9DoHNw==
X-Received: by 2002:a05:6000:1867:b0:428:476e:e0ad with SMTP id ffacd0b85a97d-429aef81bbcmr1726436f8f.18.1761736860830;
        Wed, 29 Oct 2025 04:21:00 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:69f2:5f2d:9ffc:a805])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-429952df682sm25657486f8f.43.2025.10.29.04.20.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Oct 2025 04:21:00 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Wed, 29 Oct 2025 12:20:38 +0100
Subject: [PATCH v3 02/10] gpiolib: define GPIOD_FLAG_SHARED
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251029-gpio-shared-v3-2-71c568acf47c@linaro.org>
References: <20251029-gpio-shared-v3-0-71c568acf47c@linaro.org>
In-Reply-To: <20251029-gpio-shared-v3-0-71c568acf47c@linaro.org>
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
 Takashi Iwai <tiwai@suse.com>, Alexey Klimov <alexey.klimov@linaro.org>
Cc: linux-hardening@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1034;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=e8Z3nS5BNhORSph6UaHIgaZHRcPU9qQgBhb27hulPU4=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBpAfiW4FA7llKfwCZoWb8G15eTM+Wy2jJjYF2bu
 3ooeffD6huJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaQH4lgAKCRARpy6gFHHX
 cjYuEACaqpLISq4p8HrYrIb2+Rq8Nb5ILjV+P0hFXGHSWmJC1wjp0nJB2q+9ru0xbOxMWwtW/Rp
 HW4WVkKe+RFWNbdMb9jzaXp39XJvoXW2bNC8pMJcqH12jbX3+gYpHmUe5uVwilYz9qwxIhRbMip
 bQSbDMYxRxK/k/jsxUIxGDKzgFiD5nFCRDva0xP4oHly9vkeMQGzgkQwE3v7lxjzBWTo8KNCOMW
 2R6Y/Z+eGc+qU2hHrAa60nnOkwBkaS/yEgpiLp+gnBwYURCkMcZMR6CfJ5kLuNvaX6F6aNRbUV5
 0E5E3mPawJcF9EpW7UmjFRA240Pq5qs4LbmQy+24bqeZoF3AFFGyGb4F5pISWqsTARmjXJKrVJl
 mAzN6nRo8z1fPDRxUpZTCxr16WdZO5jvvjYltdIQ7rzduTGR3xiK0JPSK6XjzKGxMQNtbnP8sLt
 XK1LJZxGOEtEHQitBbf476R8P+DpKmTJz5uqIzYDk3Z+hIceObbngk687GDaaPmO7bjz9mDcsnK
 yDvbBQKeDs5NoDC1jn/oGqAsKdjei8JS/3auZOUaPGcueQVKL34E6xR6gjhNRjdNhSC3b2zxOor
 CLMRY0amk8PsuF1e5VnsqJ+aoPTLJT/y3r9XLgmvgGUMsqjFHidM8y6QyR+euKXB9P0jPGp8Msa
 dnvUq4A/hNw30qg==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Define a new GPIO descriptor flag for marking pins that are shared by
multiple consumer. This flag will be used in several places so we need
to do it in advance and separately from other changes.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/gpio/gpiolib.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpio/gpiolib.h b/drivers/gpio/gpiolib.h
index 14e6a9807a89da6d7c6594a0a2de5f5032c49e0d..c9de4bb10584206f4888c0f28468762a3680aae6 100644
--- a/drivers/gpio/gpiolib.h
+++ b/drivers/gpio/gpiolib.h
@@ -204,6 +204,7 @@ struct gpio_desc {
 #define GPIOD_FLAG_EDGE_FALLING		17 /* GPIO CDEV detects falling edge events */
 #define GPIOD_FLAG_EVENT_CLOCK_REALTIME	18 /* GPIO CDEV reports REALTIME timestamps in events */
 #define GPIOD_FLAG_EVENT_CLOCK_HTE	19 /* GPIO CDEV reports hardware timestamps in events */
+#define GPIOD_FLAG_SHARED		20 /* GPIO is shared by multiple consumers */
 
 	/* Connection label */
 	struct gpio_desc_label __rcu *label;

-- 
2.48.1

