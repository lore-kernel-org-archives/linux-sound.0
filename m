Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29D82839F1
	for <linux-sound@vger.kernel.org>; Mon,  1 Jul 2024 07:39:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719819595; cv=none; b=UcStjpVAO/b85kbQyxcfAz8bCH63XPeshNGaUxBv3ro0+ZFGbOaEZxN70YZ1lfZVyJjUVA35650dPmTGhQvJNBiXNRnL2KFPagLOhXIoWV/c0MZdr84AzdgUYMQBd5ZAB0NDJwFkyXsP+U3HHPCwXpiwZVMzea6n7o1kqiA+lOY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719819595; c=relaxed/simple;
	bh=x29wiXWpg6jxb2D1xLhsOVHl1vLxmaL7w/bv/sExbXA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=KM1IIoeWYpb0LwH9fPr+atJ8bZ/FpXNp1HX7D2ToD8CunM4VnFEbkpqQrI6KqaNga8QCnK+jaA/7Pv5dtJ5IDHmhUntrt+QCzLXOqKBJwFdiHV2apekhL489SoTIbLmT1MlKX096sMDe52Y7+IwRJmK7HIiCS8FBgYZa96V8IUQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=wNj5/uXr; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="wNj5/uXr"
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-3636c572257so2047668f8f.0
        for <linux-sound@vger.kernel.org>; Mon, 01 Jul 2024 00:39:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1719819592; x=1720424392; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JlFPWXG6JCmSDQcnpPbHIJV1hXvd50IYEdMdlRm8NpE=;
        b=wNj5/uXr4Symqe79zf+Tw1xUY5rayAtkc1NCLs6OiYE/y3nmiNOFZ79Q040cozoRz0
         x9utJdKhDfuPuWV8KToHh+CE2K5TtkDUtgOIcnLK0y0EKwpxqP2umiZASdTGS8dw7mjO
         syiiDfLjd3DNusumHesQnqM4lZeW4uEVcSQsJSw/PxPZp2PKlQA0l7vFu2+X6GgQHvyN
         OXZM1HiD9o+JnkfWp2UCmiI87nQBvvgf0I3d4/2856s1JaGmxW4KkLkDnBPXNoJVzCYD
         HnYF2JJSRWJ5W0zl/JEEc/XEHzJY/TkiLkkDwn/42+/4ZfhHIMlMNWO8BDacEK6taJQ4
         j8OQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719819592; x=1720424392;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JlFPWXG6JCmSDQcnpPbHIJV1hXvd50IYEdMdlRm8NpE=;
        b=jPfX/coyH5GRja9iM8bEkxQlgocKGXXGTdtOkQBL6RHwqsiXJnc4+JsA325ZQA6Zw7
         beif5iU2OGrXuNXl8SxIlqJmElYN8gHYFc0NsAZ/59fzfWBuFFpDshJv6zZtK7t3a4R1
         J0Zb+Lr3lIG3v9x+zwuUnlnnp4znWWZkRRZ6sAbHhOwmW6k2xaOtolcKeJSsRE4Wv4Af
         80Kv7xcgwRdytlYYP55sQsTxtlXzD1qyTbk4a/o7knLB/Gf2zWVRcTz6aRIP4C2SIGlW
         mNargNGgFk08JE+wPKM4mwFPSLpSxYaTy6U8MktFPA178+9lXHLcYX827NbhrlxMO80V
         EwnQ==
X-Forwarded-Encrypted: i=1; AJvYcCU8kLzllOTrNG4feHr2tNWjkuLHLRCDBjbUHxBqvhkTKPtS0THwsva1E8lRUigU2NAEyHpgvs/utGaPkqn8Qw9MNYewPfQfgmmTz/M=
X-Gm-Message-State: AOJu0YyLysK4mZRE9AfT5+3z46tMwIH0J7wQeX9Ky6hngRCCUUNDcTrt
	pQDtZTWc1XmKi3qGol3FP63WtNT5KDAMxzcLLyMv3KOfgnKxM6z8SLo5d0wiGHM=
X-Google-Smtp-Source: AGHT+IHHtHxDqWdH128hQmSA0cf68mmpNc9DRTecEH9In5YhAxmj+nZy5eqG4zRev1smLhlwMVcEcg==
X-Received: by 2002:adf:ce0a:0:b0:364:29ce:b14e with SMTP id ffacd0b85a97d-367757307aemr4223694f8f.69.1719819592610;
        Mon, 01 Jul 2024 00:39:52 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.219.137])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3675a0fb9absm9279936f8f.80.2024.07.01.00.39.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Jul 2024 00:39:52 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Mon, 01 Jul 2024 09:39:37 +0200
Subject: [PATCH v3 5/6] ASoC: codecs: lpass-rx-macro: Use unsigned for
 number of widgets
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240701-b4-qcom-audio-lpass-codec-cleanups-v3-5-6d98d4dd1ef5@linaro.org>
References: <20240701-b4-qcom-audio-lpass-codec-cleanups-v3-0-6d98d4dd1ef5@linaro.org>
In-Reply-To: <20240701-b4-qcom-audio-lpass-codec-cleanups-v3-0-6d98d4dd1ef5@linaro.org>
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, 
 Banajit Goswami <bgoswami@quicinc.com>, Liam Girdwood <lgirdwood@gmail.com>, 
 Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>
Cc: alsa-devel@alsa-project.org, linux-arm-msm@vger.kernel.org, 
 linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1007;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=x29wiXWpg6jxb2D1xLhsOVHl1vLxmaL7w/bv/sExbXA=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBmgl0/b6W/jgS8oAl3i/WUq1uwI+lyOS8exPUTa
 7WelHm2nIOJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZoJdPwAKCRDBN2bmhouD
 17wJD/4nCEib+5DqPEHKrWFzzhh4Pm8WGZESnEx+zYlUmkRVYwHgyrsI4Mx532DRm3x1JpagKWI
 NNv5xvIOQARUI82dK92tuAaNW1qkThmKV6PIVa+Du38dXD0izYl7MYjaX+uJhODQwLiHXDioanX
 KpTfALvKiVIxq0CV19/BTcBNozPiWxCsCDd2TpnhKcCxes6uHEuU+5+5duoAh9YSqvOc+aOvl2J
 k+JTKgo7R4nN21KhbN+1I9KcV4CsLI/ctn5ck0fMzA0u8qs3dvDI2WbunOPZ5HDm8mPEO6K4Pyt
 CHe+AMqDcnb7v2LAwoD1HcXcGkKPFkBkKQ3JNZtBUB1Eqgrs889RAjPURnmPg56a0Frp261pnKb
 lx05CvmKdZ/BlXGt5Uig+hIaIB7HR45/DLoweL8UVXsZlUlDwhTneAwC9T34dCksGINAGffk3OP
 Q40wmTWZ4CS5nMZQoogd9DKazRdeQ165EUe4eBh+FUJOpJ1NQLPoJE5fkxvCYxrehrZCuAwB0ny
 0GBdeBEWnA9t76TFcHt1c9HajeZ/57VAj6tprxMXq+It1J5C4UPp1zLaqss1o6ifvwVn1JELSJy
 fu38XyflpmvvHQra2o8VTeRd3BIHJ1bWKIQJXt4Em0MHDhTlXrnKEIasb5IYpDW7pwRQ0Xs9j9U
 CnbTb6iGmhl1w4g==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B

Driver uses ARRAY_SIZE() to get number of widgets later passed to
snd_soc_dapm_new_controls(), which is an 'unsigned int'.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 sound/soc/codecs/lpass-rx-macro.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/soc/codecs/lpass-rx-macro.c b/sound/soc/codecs/lpass-rx-macro.c
index d4d7e02db83f..ce42749660c8 100644
--- a/sound/soc/codecs/lpass-rx-macro.c
+++ b/sound/soc/codecs/lpass-rx-macro.c
@@ -3612,8 +3612,8 @@ static int rx_macro_component_probe(struct snd_soc_component *component)
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

