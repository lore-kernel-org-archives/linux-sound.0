Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 479C520E314
	for <linux-sound@vger.kernel.org>; Thu, 27 Mar 2025 10:06:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743070007; cv=none; b=O2xTFB8YylurNmDGxkC4takJih7Yty8ctvWQub+wbr6u6+s0W+61lraPVYnRsHvrMnSMqTATNnXmlxwT8XIB+TZG9sd4Y9vPulOgxOzCo3p2HT/RIWb6UdYwz7oJNFO+hsqXIm7CaEryPDArKbwliTGaw0+28FeqlLMf073GuOo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743070007; c=relaxed/simple;
	bh=5X1aPO2z0jUPOmAmxxbRnG88+AZ4I5yT718/OM1HQtE=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=cyx3LJovjZLoaHaXdzcuhbBPRKS5ZvBkdvfcV0VlcIs9YTu+Az30oeiXVwnwXPtrWzPw0DxexdEuLGmk4EhjYepULnoNYbFDUPOc+M+ouPNe0vwRgsUyEV+h5J5mcew2XRuodsaoyYTqsEKs42e7XK8WI7z5aFCo30ejrVqfM0A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ERcgIXfu; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ERcgIXfu"
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-39143200ddaso428247f8f.1
        for <linux-sound@vger.kernel.org>; Thu, 27 Mar 2025 03:06:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1743070003; x=1743674803; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QPfdok1uXbCV3fbB68Oh0kuMKD9EmCqvBmSN9d5b64A=;
        b=ERcgIXfuYJBP+Fu00nEvbZ/9/C/qhLfcTVYbc9VFyt8flpltttQDuDMYksDAIfcphF
         ZDh2VrKzgSwXwcfJ96c17J6ThD7iED7TwG+SBLU4C0khefx3uXuZbqtx0N8OFjBzG2HL
         HTI4yoGcbNCU2IkX3QqfII9sGyj/iXr14uQm0fBOKw4UNhj9Q8NQNZRNkpdcOUNuGnWQ
         2+eTC/vuv9yg6Xr9z6oRX/ECdaYX8Y19a8Ha4I/clSUDiuPqrqmsAcdPKo8Ey0cGr7qe
         543kR2A+Ou9ziVMC3wZfYK2g3wnZ3iQ5XmPKhN2/1mjJCk8P6nQ+5VHsWni9VkdiBNBl
         9OHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743070003; x=1743674803;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QPfdok1uXbCV3fbB68Oh0kuMKD9EmCqvBmSN9d5b64A=;
        b=ORhp9rW4A8XU7BF9+3tbhNKKxHrHpIQRlQMsd4sxzvgYJqAZcSupNO/l8/fbBEK8FV
         NgR3RKUDjwdc83ZkBTgd8V9OGdfVtvHkFdvXO8NlENWXJv+bTIoHvETo6BZsJdJyHkCC
         q8L2GUSHf+RlhBgElW0x4VAUW9Ctd2M/dyaifCPI3xbGqNkKIWFwI8d2hU3tUScyCG9R
         76u+RIsXUfGEjOklEI9K9whJPhLjt9d4s2aqXnA7eLIbGgeaEnAKzvi7kuIZVu7bj8uQ
         x5e6IHYAnPFK/nb1TnwyiKm9yBu87RnMLksM9Hu5uIxc2bi0Vid2jA49ybhFE0eTogLm
         rH5Q==
X-Forwarded-Encrypted: i=1; AJvYcCXdZbnp7RhkFSoKFhn6t1GIUkGG4FDPmJNfd6otcUgez1Ka4f9F2tiudh6tbsgeOqL6oVvNPtYB+A2ZoA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxoYvgSRVUwmrNVl0rR4hErjd9l6LPVJXrZ6I7cmL9Cp9f+Cvoh
	2wJdF111tHRb+/b02z+9HUFwBmafaf1449806Qrds5XWg7rCKFtnxHwZyAodjRk=
X-Gm-Gg: ASbGncvXYQFFcJFoR55IQf31TbWx2eKMjoyIo5b5tG9rX4g6bJGtVBk97eZ/ZAIBy73
	WAxoXo6mXEADDiXP7dLzKeXXqhl3sh8hGftgdqe0noUdb7FPoi7C+0jkQP77L36QyIXVTmOmng+
	FaDFjTcVTjk6U/Qs+VhXMHo4s5r0huvMuN/OhjXMwCuEWCII4HIBNbAXbx3ZpaF4Bp6LaPXYc4O
	ncRxaGLyuT5i6aF1/faUGd3txPKwfeAeoA2D19mnC8lf2cgIc36AVmHx3TZDFQ2FdZgzi4O4QWY
	tfHFD6KtBVxbDsNgT1qeWP3dCpuWz/GWQ1Mc1SJKwyr/srAGx1PSBzlXErOae6eU7DQmzt79UNM
	0jIJ0
X-Google-Smtp-Source: AGHT+IGvhejD0NIOJT8VU6o6/lTjL7NGCr3dmcDkjmpV3rceQSS3SZ9h5CMW7LsJMAed7F1uaAVW1w==
X-Received: by 2002:a05:6000:40e0:b0:39a:c9c1:5453 with SMTP id ffacd0b85a97d-39ad1785e98mr2439933f8f.49.1743070003510;
        Thu, 27 Mar 2025 03:06:43 -0700 (PDT)
Received: from localhost.localdomain ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39ac3ce3dd1sm10843204f8f.88.2025.03.27.03.06.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Mar 2025 03:06:42 -0700 (PDT)
From: srinivas.kandagatla@linaro.org
To: peda@axentia.se,
	broonie@kernel.org,
	andersson@kernel.org,
	krzk+dt@kernel.org
Cc: ivprusov@salutedevices.com,
	luca.ceresoli@bootlin.com,
	zhoubinbin@loongson.cn,
	paulha@opensource.cirrus.com,
	lgirdwood@gmail.com,
	robh@kernel.org,
	conor+dt@kernel.org,
	konradybcio@kernel.org,
	perex@perex.cz,
	tiwai@suse.com,
	dmitry.baryshkov@oss.qualcomm.com,
	linux-sound@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	johan+linaro@kernel.org,
	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
	Christopher Obbard <christopher.obbard@linaro.org>
Subject: [PATCH v6 2/6] mux: gpio: add optional regulator support
Date: Thu, 27 Mar 2025 10:06:29 +0000
Message-Id: <20250327100633.11530-3-srinivas.kandagatla@linaro.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250327100633.11530-1-srinivas.kandagatla@linaro.org>
References: <20250327100633.11530-1-srinivas.kandagatla@linaro.org>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>

Some of the external muxes needs powering up using a regulator.
This is the case with Lenovo T14s laptop which has a external audio mux
to handle US/EURO headsets.

Add support to the driver to handle this optional regulator.

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Tested-by: Christopher Obbard <christopher.obbard@linaro.org>
---
 drivers/mux/gpio.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/mux/gpio.c b/drivers/mux/gpio.c
index cc5f2c1861d4..d1607f287755 100644
--- a/drivers/mux/gpio.c
+++ b/drivers/mux/gpio.c
@@ -15,6 +15,7 @@
 #include <linux/mux/driver.h>
 #include <linux/platform_device.h>
 #include <linux/property.h>
+#include <linux/regulator/consumer.h>
 
 struct mux_gpio {
 	struct gpio_descs *gpios;
@@ -82,6 +83,10 @@ static int mux_gpio_probe(struct platform_device *pdev)
 		mux_chip->mux->idle_state = idle_state;
 	}
 
+	ret = devm_regulator_get_enable_optional(dev, "mux");
+	if (ret && ret != -ENODEV)
+		return dev_err_probe(dev, ret, "Couldn't retrieve/enable gpio mux supply\n");
+
 	ret = devm_mux_chip_register(dev, mux_chip);
 	if (ret < 0)
 		return ret;
-- 
2.39.5

