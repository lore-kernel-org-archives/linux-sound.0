Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2319E277806
	for <linux-sound@vger.kernel.org>; Fri, 18 Apr 2025 13:14:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744982045; cv=none; b=rY8QqOp34hnEg+Wp3/C6iLe8ZoK/NwVipzZNKFeuLV7dwXAJES1nkxaJvE9XqzpeMs/ejCTjVJ0jg3tWVVqWGkqodydyLuYbR32FzLZEtgSGge5w1xQ5BZs9YEdIEF1VXHb+JRHjqBQqsQWzpq48cquNabfWdd8PFfnhQJiIq9M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744982045; c=relaxed/simple;
	bh=6LWWCl+fw76HY+PZdOokf+xdGWSBmr74emQwtZNOoaw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=i95MDyHVAGr8x5cL2u8/t6tPvMkLoSNCTZA+L5rW7Du1Fw0UwI8zUKCNh7xtk/iarRIfDHJ/CGxtQlNZniK4ibIWouAmOilIDLUm9/URelKVxdSUGYHELhNLjgK3/wC2fpDZLUGbpVzL/d9QFcQC9YmmzwE+Z9ZeRMtiucrUBvA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=SyiuupG7; arc=none smtp.client-ip=209.85.208.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="SyiuupG7"
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-5efe8d9eb12so41757a12.1
        for <linux-sound@vger.kernel.org>; Fri, 18 Apr 2025 06:14:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1744982041; x=1745586841; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Ih9KqGuWJ1rc0JvwhZbwATHF/82WoHzu4xe2IRdIO6A=;
        b=SyiuupG7H306YWVn0b4dY0TBaDmRtwIL6sVFw4/ennSWl1NemCLouC80dO3bUVG9Um
         5M/dfjs/DRX5qDbpVBdQpLP1xQsr8pxzAZFgxyTRCmaQVwQc67Rso8gQedp4lsJiBnpH
         kMLuz0gB851OwXqYcAQw7KMa47CZrLt8c0e/WZwmkWTvYK4xGWTQtja1tBUSnf8bzHrY
         H4VWnrlbLy7K4TQ4qxq/w1L+Qw4zGb2DVJzmL6SvpPm+13fTrsbvW+H/FBZ++BMqJa4a
         TwuEzCX82+WpaikrPTmMnHehN5DtBl6feHHLoAF7v5WD7Ewk8p2KFaxAYRXpS7c28OQZ
         apXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744982041; x=1745586841;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Ih9KqGuWJ1rc0JvwhZbwATHF/82WoHzu4xe2IRdIO6A=;
        b=hY6EoLEjGHGwDn96Z5pRlAtrLoHEVZYmtM/95AoQ1n07A/hjy3JIFvRN0RGSiSQolV
         0yP7+649Ka/toB7wiW36QvnNfxbg/CBVeG4GkWIvftR4jOuOEWWt7aFz7iS8+OebzdoE
         Zqb9Fix7Ag5P5zDUC2533zahqNKOqYNpl7itydibA+MDOF70VfMBDXueUDwayV7fqmIN
         kgFe7TcKQK/3aHf4KsdRHJqfvK0ny3tpaS3MCiA1o074wFDWNZTdV7xMc3LtgydBwifl
         HWozHtVZjSjQWcxm/j0JAIyPma0UBQ/FmG6LEhAysEYV/jSN760qa4LFQtyTPYU2K5/j
         a34Q==
X-Forwarded-Encrypted: i=1; AJvYcCUstFvou1TpdvvlfLVxFYw96eAuDTtQ1zfetLsD0ni3KoOvCse3CzK5UiCe7gK5vJaJqcaoJ5GxchahSQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxovTm5Yc6Uz2AlsjSE5ibnLmzYSQo1vjMVZUtHrLydSmJsHr4v
	crKQ13Yl1bj78dgtkDW6ZqlsJFCUnZ1f6OTHLU5FAlxnVVAzyJs274qzAg7RUgA=
X-Gm-Gg: ASbGncu8Vr51Ei+l0ZCozZMo+dAQHRoSScE8npMjECGOzHHEQvCOCOv0yyWR2CHkVst
	M2s3lJSdpK1JYyOprsW3f/cfAkeoCE3zbhUua18KOEKO1X3j0nQ2+IMXFCK0E6IvKDjsiJDYTh7
	oMpmudpNi18zOlCS3J4hxRjuzL5zj/pO36k3zl3CsrE73mtuCH6QmPg1PWMpA8KqfxU5WVSNyQT
	b/SGArGWxV7e8yh8/dHjJHyJ8eR1JN4SmCMTUJtEtTs5Fy4cfY6w3xHxUKhEVrVBpA99B+yEKi/
	sNfhBtUDPyqArBBTut9fcxIzPhkHntULnYD8IsUda3UopoGggNDaorYNITJAWFoZQ6avYs28Fan
	znzTXxq9FweZu6Q==
X-Google-Smtp-Source: AGHT+IEQnUcQbXMaqk61okzrXh46x/KQ61UJQzrcCrJS6MAJvzXtug796hcDtEBAuUVns86R4gHd4w==
X-Received: by 2002:a17:906:6a23:b0:ac7:391a:e158 with SMTP id a640c23a62f3a-acb74dda17dmr237991466b.59.1744982041377;
        Fri, 18 Apr 2025 06:14:01 -0700 (PDT)
Received: from [100.64.0.4] (144-178-202-138.static.ef-service.nl. [144.178.202.138])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-acb6ef41605sm115901966b.124.2025.04.18.06.14.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Apr 2025 06:14:00 -0700 (PDT)
From: Luca Weiss <luca.weiss@fairphone.com>
Date: Fri, 18 Apr 2025 15:13:44 +0200
Subject: [PATCH v2 3/5] ASoC: qcom: sm8250: add DisplayPort Jack support
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250418-fp5-dp-sound-v2-3-05d65f084b05@fairphone.com>
References: <20250418-fp5-dp-sound-v2-0-05d65f084b05@fairphone.com>
In-Reply-To: <20250418-fp5-dp-sound-v2-0-05d65f084b05@fairphone.com>
To: Srinivas Kandagatla <srini@kernel.org>, 
 Banajit Goswami <bgoswami@quicinc.com>, Liam Girdwood <lgirdwood@gmail.com>, 
 Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>, Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 alsa-devel@alsa-project.org, linux-arm-msm@vger.kernel.org, 
 linux-sound@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Luca Weiss <luca.weiss@fairphone.com>
X-Mailer: b4 0.14.2

Add support for DisplayPort Jack events, so that user space can
configure the audio routing correctly.

Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
 sound/soc/qcom/sm8250.c | 18 ++++++++++++------
 1 file changed, 12 insertions(+), 6 deletions(-)

diff --git a/sound/soc/qcom/sm8250.c b/sound/soc/qcom/sm8250.c
index e920b413b762c803cfcc4049f35deba828275478..aa3b4bc3fcc7b8a8dccc75ef1309bb26a2a8105a 100644
--- a/sound/soc/qcom/sm8250.c
+++ b/sound/soc/qcom/sm8250.c
@@ -25,6 +25,7 @@ struct sm8250_snd_data {
 	struct snd_soc_jack jack;
 	struct snd_soc_jack usb_offload_jack;
 	bool usb_offload_jack_setup;
+	struct snd_soc_jack dp_jack;
 	bool jack_setup;
 };
 
@@ -34,12 +35,17 @@ static int sm8250_snd_init(struct snd_soc_pcm_runtime *rtd)
 	struct snd_soc_dai *cpu_dai = snd_soc_rtd_to_cpu(rtd, 0);
 	int ret;
 
-	if (cpu_dai->id == USB_RX)
-		ret = qcom_snd_usb_offload_jack_setup(rtd, &data->usb_offload_jack,
-						      &data->usb_offload_jack_setup);
-	else
-		ret = qcom_snd_wcd_jack_setup(rtd, &data->jack, &data->jack_setup);
-	return ret;
+	switch (cpu_dai->id) {
+	case DISPLAY_PORT_RX:
+		return qcom_snd_dp_jack_setup(rtd, &data->dp_jack, 0);
+	case USB_RX:
+		return qcom_snd_usb_offload_jack_setup(rtd, &data->usb_offload_jack,
+						       &data->usb_offload_jack_setup);
+	default:
+		break;
+	}
+
+	return qcom_snd_wcd_jack_setup(rtd, &data->jack, &data->jack_setup);
 }
 
 static void sm8250_snd_exit(struct snd_soc_pcm_runtime *rtd)

-- 
2.49.0

