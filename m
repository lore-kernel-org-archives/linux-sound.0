Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6BAE1E5739
	for <linux-sound@vger.kernel.org>; Fri, 21 Feb 2025 04:40:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740112831; cv=none; b=FUD4jOArIepCFi+C3ua9pj4e2l5LoJ9znpHQSQHS7vLY33JMgTef7Cfb6niVnNYod/Hm43pW5jqyLjzPBiit922fXxSzrsgSf9G4am4Gexglg99U2iu3zKb3H5y2JQbkOyxr1aZqkizU1SzeiFgzRSAUIfUi41YdzlHpF6AVfCA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740112831; c=relaxed/simple;
	bh=A370FwgmOcGxdQpV0Y3cC3Eh1VAs/X7rXfoHTYBE+vs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=FoD2Ibn6uz3rEg+/F0qDW+kh+hUhN772DLoYCgo0WYYx14ZcS7aoSykYcLG7JUnHrl/dkUOvKysNnrTL8OSV4AnkSo736R8RoO15JhKlqjN4SWG/MGtn16BSNa+UVWHB3mrQZyznALa7DsVCqUE8kzxYeYA19BL8ftr6s7cgeio=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=TwdRa2E2; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="TwdRa2E2"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4399d14334aso14623325e9.0
        for <linux-sound@vger.kernel.org>; Thu, 20 Feb 2025 20:40:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1740112827; x=1740717627; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=dUxQ8JHeZTOHPECNht+upnWJNGmFSV4ta5CH2/NFhzA=;
        b=TwdRa2E2FgdYdAtyqMcPFqPuo0MSIr7+RJaRe4wls56hcgiWr8Y/NKCQhViJ8mcxvZ
         tsyI+5t8ZhSEDFXUmrKoKijK+p6N6ECwfzWYSeiHFc3Vb0LeGA/0VVsIvl0s9XCQJSGC
         iKiDx7/V1p+u4/ImWVaCjqkqTIOr8QTFiXvDGaPo9oPvXfzyYYwO5Afk14SexuLMkM6g
         5NgjukzjXAD+Z7+J7P3pFMv0INDG4xeng0RSUnhrfg7UaGpWY0JUwUDlRjdKul8+un6C
         ZCKENt0oniKziiLGEZaLUIHybIVNLr/njTb3uhQQICKQdauOnANQVu5w81oqdOKm776o
         P+7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740112827; x=1740717627;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dUxQ8JHeZTOHPECNht+upnWJNGmFSV4ta5CH2/NFhzA=;
        b=Xr6VvNCGx5LXOCBc4qMp3opCxD5hDcWfiOmgZtB0XQD1sS7IuwozpM5jtZ7bNhI8Dw
         0WWmew+ufAvm5XrgzDS/ShFWVLLVK0CAFdgGQJlCh81iNvkfUE72+dPU8sNKF1bBFddV
         oNDB2J1+xAW+7ArWGRL56kRoFcVEKqnP6n6aSDIZWjm9oQJjEkwDz4IB0z+MSejS+uL8
         nwwIVgH8I5R94JRxxvhzdnFRXn56DhuELMHdBEkxW4Yjvpeb9mIEuBOikWpnYaazpQLF
         2K1eh3qrGn6yOJlACN6Fk9EFh0P/jAygSAAKtzoHTVxNcvaKu+WqZKiGfSVCenSDI9Vb
         YqDA==
X-Forwarded-Encrypted: i=1; AJvYcCVfwL7Yhas8wkiewAYOenlhzYLYW1QA3rjnbzuZGulWWtPpe9Mle4EOCgzxZYv+xnE3qWa5ZY2kkFCT/g==@vger.kernel.org
X-Gm-Message-State: AOJu0YwnL9nN4kIIHvzdBmqvSsbLBmxGSoWa4mGxQ7t1flUoDMTi1yW2
	wpXvxR7+Q4pqXy5CfCAGNIQr+tOq5nSYF57b9Tp5c14gbFdbeUVW9tBKxOkd/D0=
X-Gm-Gg: ASbGncudBc7i8YpFEkURQbviDKvKgvETuDlujVx7m1uF8mN6hu4KA0IGg0EdsNiZogz
	+WMLV2FrI/mMoalufWYNaCeEXEElp/4UHzA2kcuo0TfX2kx5kPeKjD8u4jMwBSZ372Y4Yd0nfJF
	W2DJw5sDE3iNMH3XbsFh0OlugXxuMAIAiCt73v6OzvwPeGzpBU3TDlCnbMdVygjFKgn1ZEFsCx6
	4VgFMowoQpw01LvnaZUWUb0ohlqLJZOQsKCa/qi815CJPV0OqmTwkPLoycTaKmzqGAOsvwfyZyC
	a/RJWCB38SNDnvLLmYItAjoZ7V18M/qYb0TisI5mGL2s
X-Google-Smtp-Source: AGHT+IFZX2tGs3D96ENsDWlpydZ+9vz8q8gMCtR61BTdHRxHTAdwzjKTs3WtllXebpcvU3jdBD83Ug==
X-Received: by 2002:a05:6000:1546:b0:38f:3c8a:4bf4 with SMTP id ffacd0b85a97d-38f6e7561cdmr1272842f8f.6.1740112826930;
        Thu, 20 Feb 2025 20:40:26 -0800 (PST)
Received: from localhost.localdomain ([2.124.154.225])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38f25915688sm22618671f8f.57.2025.02.20.20.40.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Feb 2025 20:40:25 -0800 (PST)
From: Alexey Klimov <alexey.klimov@linaro.org>
To: srinivas.kandagatla@linaro.org,
	broonie@kernel.org,
	lgirdwood@gmail.com
Cc: krzysztof.kozlowski@linaro.org,
	abel.vesa@linaro.org,
	neil.armstrong@linaro.org,
	perex@perex.cz,
	tiwai@suse.com,
	jdelvare@suse.com,
	linux-sound@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-hwmon@vger.kernel.org
Subject: [PATCH] ASoC: codecs: wsa884x: report temps to hwmon in millidegree of Celsius
Date: Fri, 21 Feb 2025 04:40:24 +0000
Message-ID: <20250221044024.1207921-1-alexey.klimov@linaro.org>
X-Mailer: git-send-email 2.47.2
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Temperatures are reported in units of Celsius however hwmon expects
values to be in millidegree of Celsius. Userspace tools observe values
close to zero and report it as "Not available" or incorrect values like
0C or 1C. Add a simple conversion to fix that.

Before the change:

wsa884x-virtual-0
Adapter: Virtual device
temp1:         +0.0°C
--
wsa884x-virtual-0
Adapter: Virtual device
temp1:         +0.0°C

Also reported as N/A before first amplifier power on.

After this change and initial wsa884x power on:

wsa884x-virtual-0
Adapter: Virtual device
temp1:        +39.0°C
--
wsa884x-virtual-0
Adapter: Virtual device
temp1:        +37.0°C

Tested on sm8550 only.

Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Signed-off-by: Alexey Klimov <alexey.klimov@linaro.org>
---
 sound/soc/codecs/wsa884x.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/soc/codecs/wsa884x.c b/sound/soc/codecs/wsa884x.c
index 86df5152c547..560a2c04b695 100644
--- a/sound/soc/codecs/wsa884x.c
+++ b/sound/soc/codecs/wsa884x.c
@@ -1875,7 +1875,7 @@ static int wsa884x_get_temp(struct wsa884x_priv *wsa884x, long *temp)
 		 * Reading temperature is possible only when Power Amplifier is
 		 * off. Report last cached data.
 		 */
-		*temp = wsa884x->temperature;
+		*temp = wsa884x->temperature * 1000;
 		return 0;
 	}
 
@@ -1934,7 +1934,7 @@ static int wsa884x_get_temp(struct wsa884x_priv *wsa884x, long *temp)
 	if ((val > WSA884X_LOW_TEMP_THRESHOLD) &&
 	    (val < WSA884X_HIGH_TEMP_THRESHOLD)) {
 		wsa884x->temperature = val;
-		*temp = val;
+		*temp = val * 1000;
 		ret = 0;
 	} else {
 		ret = -EAGAIN;
-- 
2.47.2

