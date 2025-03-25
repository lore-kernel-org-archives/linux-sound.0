Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7603F2561C6
	for <linux-sound@vger.kernel.org>; Tue, 25 Mar 2025 11:41:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742902869; cv=none; b=em+soxD0eanANdN3uxh8tfAlpsRmu1mk7eUDP3OTnv5oewRFWeTZam0IiGvGOItk6Gq3K9DK9iv3CaCDvSTowY91N+QWzurMNVUEnBN8ydG7z4pNGX+ITT3uuhMaTFqO7F/ZnMsW5s4hng4NiA6hi2Li/d4IG7ILvDR0iwlFvco=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742902869; c=relaxed/simple;
	bh=5X1aPO2z0jUPOmAmxxbRnG88+AZ4I5yT718/OM1HQtE=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=WEgYNc1octY0khcqU/d4DfFtUXRC2ng+Z9AH0mXVewq7rRSGfMG5i3RudXfJCcdlui5Z5rRrsot6ynzqMbC0Hao5bV8SJcPoOyIFdwT00ZtCgYlafqpSR3s5CCUuKF7Hy1LIppSSA+yWtvhLcS5maScV44OkiHzANEk0YQPn0p4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=usKXiX65; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="usKXiX65"
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-39ac9aea656so424558f8f.3
        for <linux-sound@vger.kernel.org>; Tue, 25 Mar 2025 04:41:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1742902865; x=1743507665; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QPfdok1uXbCV3fbB68Oh0kuMKD9EmCqvBmSN9d5b64A=;
        b=usKXiX65vIWe7q2d7htqljwhlLNAbcNC8d+RPpW0XIPTuELCE68RrY/B7D0vW3fIU0
         HR5a93xtJBjJRre9zzsTSbTA+JOPmc08bAVizY1fVVD8CEvo25qR7kTk3iDndWEm9trn
         NbF/Bquob1YR23U3anxQ4jKhoGuB+NIOhXraQWoRL70luThMNDKWJafMMvpOVtVsTtQx
         QMR0I5eChNE9dl2wSy19R8u9W9yeSaIWlyjCuzYUTGPYf5PUc9+VifBc0teGazFPUXzc
         DhlglhqJWE3+CSQs5fr8drisvfzv8oQf/m+6uAWHEDuZ0L/fvm+G1k+R+IOrIc1EgQL5
         f+7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742902865; x=1743507665;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QPfdok1uXbCV3fbB68Oh0kuMKD9EmCqvBmSN9d5b64A=;
        b=BqBTFCy/eHLtLGc8br1O8AoUhgPeF+geuNpvO9SSD6ABTrRXvfvUwmDXvALn9YyX3u
         rTqXZinQPU9sRw/4XGyEVi0Galtqwc0hLqMX3439CDHbeiCefwgm/v5FXxicHPdUSsO0
         2mijFZazumKUBVd2xs2/ZNypa87eqaarcw1GhheT8XFoz97UfIjVChHI1rPsTxBc7ewi
         vHOgaZY0bUAWq+7T8pRR9OQcBubv3bGiPdnDZGZXVYaW2UCQDRJeTfSewtpQtTp3cFdr
         GmFNPKhBxmbNvBPGT2HCv0+X4ZZbe35J+G/vaEKnbI2bL7X++zBtIvgzg0ikS6rv9P8e
         4WGQ==
X-Forwarded-Encrypted: i=1; AJvYcCWc5oeOokLzUvdDuB4fDETZmn5M+Ha8HBh//aUWUxa+npDPrwN27D3qsX2lIPG6aA8cJt1i93cumLQYoA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx1JoE6D/KJgzvHH0u3oxB6KzwZuICxYFVi2MytC+9to24k1LKe
	9s+5+rSdQIEhv2uRJVSh5asNso/8zxETNRxeIqzFs6BH+RONURSeRsvx7O/tx8c=
X-Gm-Gg: ASbGnct9Wc0SbO+jYsQJTyTioUpdB77ce+Fx9vYke+Tpbgs68puEnvVJvtWB9Nm+90t
	sLczuVZt6Q34ubFLydNcmo6X7aSzqud4yVe8ZXMhkd3wONE9XT6Hzu8kSGB4ARp3iBOJpuaFGTS
	95MUNS/w8CKOrANCBWF2NRKdwR4ygAY/ZWlC4YJIrI5ft8aRAg/rk0z3Uxy9bQmWBpI/evZOcVX
	8y6JqyDVoAdGHoKPH49SC/C3JZfV79qwRrKdMZVJ+4jab0xxo+M7yi5STC6tOlB+UsMiLWteKUx
	QtC3p8F1JgVk7QO9xBcyvNoXlYxwF0IV+nqyKOZbzAIIOftWbg8ktcbNiOFwAKMNP0QHbA==
X-Google-Smtp-Source: AGHT+IGX+E1xFo91m0AYrkO4kkEoY2JQnq0F/cboQi3QOCvL7ex9DY7qp1H7fIxNEBp+thnIa9ixkA==
X-Received: by 2002:a5d:648e:0:b0:390:ee01:68fa with SMTP id ffacd0b85a97d-3997f91287emr14148949f8f.24.1742902865471;
        Tue, 25 Mar 2025 04:41:05 -0700 (PDT)
Received: from localhost.localdomain ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3997f9a6326sm13213330f8f.29.2025.03.25.04.41.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Mar 2025 04:41:04 -0700 (PDT)
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
Subject: [PATCH v5 2/6] mux: gpio: add optional regulator support
Date: Tue, 25 Mar 2025 11:40:54 +0000
Message-Id: <20250325114058.12083-3-srinivas.kandagatla@linaro.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250325114058.12083-1-srinivas.kandagatla@linaro.org>
References: <20250325114058.12083-1-srinivas.kandagatla@linaro.org>
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

