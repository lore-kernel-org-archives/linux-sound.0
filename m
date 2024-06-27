Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1A8C19AD48
	for <linux-sound@vger.kernel.org>; Thu, 27 Jun 2024 15:23:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719501837; cv=none; b=cJOddgiiD2/uIKFNdKjFjRFyzIDlnjYzEMACPaDDlroudof3CD52WjQwe1OGdVQ8WY6PdTlwsQcY1Q4rK6uxzr8FG44dobqFP/dY/KVJuE292z3ZIYRjRLI8+lGxkqdkPpLZYi7gGi/HLxGCWIzwFhqJnUG3od5uhhtlJ80xHzs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719501837; c=relaxed/simple;
	bh=l8Fs7uNm1FChU4HgNrAzvxr0CjT3lQ1EHDABQ5Se0aU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=JIDTDsek1mLiBkBBX43q/H8SXjB/zBhpB/XvmssHyDd4pawT8OD3a/kzRp7V3s+XzwjyelPcYekHdhdJl53lsMb6BiaMfRB9aaEIFocXCtjzfzUM89v63fm3yQ3V1IKENFGCwMrC45GwxU2raLq6cjNxreqcUqWpcVVLyci9olM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=O4jRsBdD; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="O4jRsBdD"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-424a3ccd0c0so26584705e9.1
        for <linux-sound@vger.kernel.org>; Thu, 27 Jun 2024 08:23:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1719501834; x=1720106634; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=x7JX1Bcmrsym1bUeGPwa5YrFI0Ft58jDDZJ4/xxAojk=;
        b=O4jRsBdDbdPuc0npGe19bnuyXA1/w/07VlJDYFLJM/gWfacPamIwZ8N5RCO/dxnGK+
         Bk0OVOhlPqUonBPLnK6sH/edy2B/Pa7t5nKPm1Eww308OS3e8zVAsyOQ43f9S1haSZD4
         hgXBGLFp82y5T5sagbEwU05RGW+gTDv6lDyZfQ9MXPbWb4uutOshYX7L0r+7Y9qaW2MY
         AABZ7RsKuGrOBkue919t40UQx2BGGCDhcPjzCWb66cNPvthITai6EegzAr/aauNtPv4w
         HFDwGQQ0eVElN7TLdj+XhHiLcT/K2FCygEnRHSTcdkQ/ySZPjKMpIfQaycwXff/Hic1b
         rhgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719501834; x=1720106634;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=x7JX1Bcmrsym1bUeGPwa5YrFI0Ft58jDDZJ4/xxAojk=;
        b=IJ+kpePOOJ5clt24BerqvR1Cwx7+ncbMaxYsy1aCMB5mGRzQZbpA6FdyQ3ULKQRRRn
         IDkEZPmKqhr3mZbcDkkVJ9MmHbILb9HE+PQ26QVuXkTZBhhcKTdrkauNIQnFlZUilMNO
         OKFx8+S2ZWTpw2pN4SD4iMBJZmtbe6aYnAgIl3os88jPOO9ha1tah+j9IWQwNyKt8wQk
         j5/uEJabawtDxyev+4sOoa95K6seRv5bQ7TIq6aYBfbRUDFqcJLjxENwkWZjyCJCjaZM
         BRdbWzolz9M43jsSbB9p0y/5x2MgMKrA+WDj+wv0bXc28lwNbultVO7Rrrm4I92uJBNc
         a1vA==
X-Forwarded-Encrypted: i=1; AJvYcCWXMaikitsIX4sbRGBHeCqGw3mj46KBnPvEHmAF2zaYj3p9q2aUxTnvfWJ0nBWzEMkbztpgdI3QLM8+ER2SkU9E2fMPmt5WzkQ7ggY=
X-Gm-Message-State: AOJu0Yx58A+idNCuHkp+G2CEXg3MTrPpaPlg7LpsnF7SyUNsDrQ87OAi
	2ZrdfcObrU3bIzSxIReK75UOKfjVr+woj8KhmgPXAkZluvlUc7tuHKYtx2nYnuY=
X-Google-Smtp-Source: AGHT+IHU0uHfAgbvO3wWQFz4VkorLowhWrH3I6Q0ilQ6xxfYkyzq0SbVy9LBPiGmf7/YXOrhPlwUkw==
X-Received: by 2002:a05:600c:4451:b0:422:62db:5a02 with SMTP id 5b1f17b1804b1-4248cc586ddmr102982145e9.32.1719501834317;
        Thu, 27 Jun 2024 08:23:54 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.219.137])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42564bb59b7sm32783185e9.34.2024.06.27.08.23.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Jun 2024 08:23:53 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Thu, 27 Jun 2024 17:23:46 +0200
Subject: [PATCH 4/4] ASoC: codecs: lpass-rx-macro: Use unsigned for number
 of widgets
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240627-b4-qcom-audio-lpass-codec-cleanups-v1-4-ede31891d238@linaro.org>
References: <20240627-b4-qcom-audio-lpass-codec-cleanups-v1-0-ede31891d238@linaro.org>
In-Reply-To: <20240627-b4-qcom-audio-lpass-codec-cleanups-v1-0-ede31891d238@linaro.org>
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, 
 Banajit Goswami <bgoswami@quicinc.com>, Liam Girdwood <lgirdwood@gmail.com>, 
 Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>
Cc: alsa-devel@alsa-project.org, linux-arm-msm@vger.kernel.org, 
 linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=946;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=l8Fs7uNm1FChU4HgNrAzvxr0CjT3lQ1EHDABQ5Se0aU=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBmfYQD7NGFlFAPZPk5oxOO2+MovrmCbj4uOIsyP
 e/OfXBPY16JAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZn2EAwAKCRDBN2bmhouD
 15n/D/9qgH86TgweMDT2rs2qJsT1XmlVEPhyqpMP/R9xme0SJMtfcuduTkwsrgdmqKSINPbIQf9
 u3d/5f8FCg8Eb9FhBU9vJJC5JYMLnU1gTKMoGG/DVrc28B4nTWP+FtO3VMEoYagqUJK/h9Z73RP
 HAUXqZ+R+Naqh4KBkVy5HW2m773Y7w2QRH0DdDHOC+hLjjL3nSr29P3ymYl0IBzza5eevLAxmx1
 /bJLceFRg8tedElAOIyRliiJq/z9V/zM0WKHyeVrxea90Jq2bnJ0c/KyKQpigZlyJjHRa+N6wa+
 Hr/aWoCzC1t599cRI3v+lROegFbtmpv6IgC1XPPoW8UwUNZk7JY+wy0PLBLwyvaQaEg8xLE+WmM
 HN6C6+dAz9zhak70UZ/oGbaSTx5UhcO/SVeTOteIzaxSyGF/BSwxy+b3R/hfKk0ORfgzBLUxMEh
 aJMTnkAnYopE185qHVVsSd7zNktFrNBouS33h5HPi7DSi6+Qs3RFHwjI5D+6x/pdKa0UpCpk8ot
 KFEIUX8fyfloTZrs0gvzm336tjIiuJohOp9kh0z2+VJ8kTlxd0deYc8BpqPbQFAtNiortgQZvnK
 p+CWP1afNQhnCiliM1vaAutzd21oORxUBoRQD9s2auCRtUilOI26FPIi8ULQvPAgBEz23+vLVan
 j8qaYgqDZPJsEaQ==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B

Driver uses ARRAY_SIZE() to get number of widgets later passed to
snd_soc_dapm_new_controls(), which is an 'unsigned int'.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 sound/soc/codecs/lpass-rx-macro.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/soc/codecs/lpass-rx-macro.c b/sound/soc/codecs/lpass-rx-macro.c
index 3d8149665439..bfcbfbe8b086 100644
--- a/sound/soc/codecs/lpass-rx-macro.c
+++ b/sound/soc/codecs/lpass-rx-macro.c
@@ -3611,8 +3611,8 @@ static int rx_macro_component_probe(struct snd_soc_component *component)
 	struct rx_macro *rx = snd_soc_component_get_drvdata(component);
 	const struct snd_soc_dapm_widget *widgets;
 	const struct snd_kcontrol_new *controls;
-	unsigned int num_controls;
-	int ret, num_widgets;
+	unsigned int num_controls, num_widgets;
+	int ret;
 
 	snd_soc_component_init_regmap(component, rx->regmap);
 

-- 
2.43.0

