Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25B05220691
	for <linux-sound@vger.kernel.org>; Thu, 20 Mar 2025 11:56:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742471806; cv=none; b=oYqOezHkav6Bi81kYjONwhVlpvlHgdbdAjJCrvZGgx/rS7d1N7BbCD0dINu1GGZt8gBQuv3boyjIbD3Xki99dnecx6vBvjxpiy6Y3+u/pSi6EGw3P/kL35ZB0QXAbceDg2je9MbHR+p1+Xu27pKRiqxJGTKx9cefavslKYXy2iY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742471806; c=relaxed/simple;
	bh=T2PbRRhtQTGvQFtJCRLISmS81biLegmtD1AJKN9+90s=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=jvVTH4GDL8xD16j4ODCy4xhnEKhIrdh+LT1MAuyyTTowlQSt5T4PNGfMcRGIHP0g2h/15ihUvx9blVyjAQopDldFBGvy0zcmCz++IKoboSSFbQX92FtV2LtLQo8+P2wQtuQYDQShFuBbLSt5nyKEM2kvBV5Ns9PZ4Jg4pbhBzxw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Eb+dSReu; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Eb+dSReu"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-43cfdc2c8c9so3835005e9.2
        for <linux-sound@vger.kernel.org>; Thu, 20 Mar 2025 04:56:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1742471803; x=1743076603; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=b1gFShGL18VkNSl91DJ8JTM4WvU0/x0n8rRRT7Ut7zA=;
        b=Eb+dSReumpURahzlftk61pXmRcqqigcVMFIXqURuGaAMljy13eWSVgJd34XpPUAbXq
         /WVE3M3NhGKKG6NTfU8IIaIXGQrvhbMMF6ZNfJ9tiRW8XKNJ5DFZfXY2Y+zUn3VH9vH1
         k1TldGFpU+6MFOYaCSGrhlxuflL+fDqd/n+//tuEleUcbezdmbXSQE34BdbI6s2GvwYQ
         kU/P3CzJgO9k24vxRbfQ2wwQkfyBLAJI8ZAJFpp5wtCo0Hmt43e6fOeXUfIkJDiaqGKa
         WglRhe1+da1jAlCqdp28elRa6/negAcCS+g1dm7Q7ZW13oZZ+YZJvsA0TlKnwVCwnDN0
         ZMGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742471803; x=1743076603;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=b1gFShGL18VkNSl91DJ8JTM4WvU0/x0n8rRRT7Ut7zA=;
        b=Wl0sxxwTeA2Ln7tG1Hw/MoVhDBEnbc9rZcfLLvtTVgL1sIRFgQNHf3XDvtgMHm2laA
         SlGVlL4j1b3NEpnGCAKckBvQ1rdZDMqnR8T3M3w5U0bsiKhbFxJEKsmXNVBdqzZyapsX
         4kUjIOkQhrk9gwgWMHCaNiHvw2GY7ko++eBo7zPh5gDJ1q3HvojxBC9+fZAfMtEWbZWd
         YauBOW9WWi2PsJ2A6RRVoPFIWDx/3actxfeFgNM1kvOnL7PU4hJdmAsiyxUbsWAAljrU
         XMLKGKfu4dBJrOmTtIpHXjxuKCP3n5uVEYmHZvH2h9ADe18xs/a0IMunS/F5kxZrmox+
         eX9g==
X-Forwarded-Encrypted: i=1; AJvYcCUwsPwd5t7DbzjY0qaX+3u7qR8v5pH/WEuWAWXXqMDkZbgmc+3gjbPyl9ihKrMXzwtyr4StyAh9iOGWSg==@vger.kernel.org
X-Gm-Message-State: AOJu0YxXa7lsONTkus4GJ/OZFfqOq4+Fp+E8tcWDQ09dnyn9k+tQsgLT
	pIRqg3hL4hbodA1RmuIIpST/BTHMl/7XJH8admkNjshlaO796c+EfSrYta7Z06U=
X-Gm-Gg: ASbGncs9tUR7s3vZDyh3fKLNNBgDqDS5Eg/U7gj1FdakbJuRPTT9s7+ILDFOGEb0ap/
	Lp15E0oW7upGCnWtbzr/5jzzTdAM2RTGtNy7qBL4Rtdn2O0EVYMeHKbr9cvIRGXmCjk5o8ZsPA+
	sPh+aDZObQgZpz+JSWs6Rpa0UwoF8Jcwtft30QF5N2CFl8gbGg76sI5mclWGn0CzyfDYEMrUu9G
	94j5PtPzdbiKqWnMeWxAAZgLQV/9dTtpwqBspRayzX2r+vpVbuynIJkEn8fSNn7WfB/LagJhUTF
	ga5frjoWo2qlUyazx02hBu+N3NY0WrJsgZyNRCnNVHVTf6f33XnST/51YOLTi3tKD5JO8g==
X-Google-Smtp-Source: AGHT+IHDaRKUgc9HfZ/3hd0DCQIlmWkm3pZZLNqhOMPZvKa4KfAsekDz2fiYCxQmIc+NA2HX8qs4VQ==
X-Received: by 2002:a05:600c:468f:b0:43c:e7ae:4bcf with SMTP id 5b1f17b1804b1-43d436c753fmr63116995e9.0.1742471803125;
        Thu, 20 Mar 2025 04:56:43 -0700 (PDT)
Received: from localhost.localdomain ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-395c888117csm23257857f8f.44.2025.03.20.04.56.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Mar 2025 04:56:42 -0700 (PDT)
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
	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Subject: [PATCH v2 2/5] mux: gpio: add optional regulator support
Date: Thu, 20 Mar 2025 11:56:30 +0000
Message-Id: <20250320115633.4248-3-srinivas.kandagatla@linaro.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250320115633.4248-1-srinivas.kandagatla@linaro.org>
References: <20250320115633.4248-1-srinivas.kandagatla@linaro.org>
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
---
 drivers/mux/gpio.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/mux/gpio.c b/drivers/mux/gpio.c
index cc5f2c1861d4..12cd9b5c32fb 100644
--- a/drivers/mux/gpio.c
+++ b/drivers/mux/gpio.c
@@ -15,6 +15,7 @@
 #include <linux/mux/driver.h>
 #include <linux/platform_device.h>
 #include <linux/property.h>
+#include <linux/regulator/consumer.h>
 
 struct mux_gpio {
 	struct gpio_descs *gpios;
@@ -82,6 +83,13 @@ static int mux_gpio_probe(struct platform_device *pdev)
 		mux_chip->mux->idle_state = idle_state;
 	}
 
+	ret = devm_regulator_get_enable_optional(dev, "mux");
+	if (ret && ret != -ENODEV) {
+		if (ret != -EPROBE_DEFER)
+			dev_err(dev, "Couldn't retrieve/enable gpio mux supply\n");
+		return ret;
+	}
+
 	ret = devm_mux_chip_register(dev, mux_chip);
 	if (ret < 0)
 		return ret;
-- 
2.39.5

