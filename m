Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4106E409603
	for <linux-sound@vger.kernel.org>; Tue, 26 May 2026 15:03:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779807795; cv=none; b=Bn7ZJfNVp8XtaYGHTDhQaxOkCAKYWJotO6w34rPzKJ61m3YMqfrhMp2NUwCgi6A2SJ8/1LKx3vlu9BmXNudzstxIwj05CItF04aHLf8euFutS7KWvZZDx/5EgHSWRuIYv9nUY6bO5UtpyPX3d4H/D/+5LGDgF43+W1MesxDx+wE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779807795; c=relaxed/simple;
	bh=MdzDJMQisHkSOiLYvopwwr1v98FNTtU6w7SCFX6+GsU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=gKPMev4LTAMDbspXpiDv2hwTwRV6brV2W2iPu6N904ain/WAKHbF9G1SF5zjhdYuosqapGXeQDDqsPKodbldbi66zLQrsm7PrTb7v0Memez7fa6SOJSY8JaXviDyfsrohxlkzBYkHlz0yQdqag4/OvdGjJLaOdBIGTcDHj8x0us=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=F9c6yTQp; arc=none smtp.client-ip=209.85.167.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="F9c6yTQp"
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-5a877510541so11633138e87.2
        for <linux-sound@vger.kernel.org>; Tue, 26 May 2026 08:03:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1779807791; x=1780412591; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=MDbuAa08BqGLwPFVUvrCU0ivDFLjKQA1mJKnc79aZhw=;
        b=F9c6yTQp9UzQ/DAIpeEYTPwgT+IjVgoR/EiYo/n71jNBXx9e3aZPSaaX4pkL9ErUSZ
         L2hLH/a/l9S3EoS558bL0pM2kxDOKFE+7WCTjfXEGn6hUWrJe+MmC5E9M8MfvAt4Ypgj
         m6rd2lUJQP8F0in/zdP8A9E54lO3ehsENVAxZ0KJ0r8OXApPI7BfNLA9HaY2ecaVaO/3
         1fAFtrwTIkGPV78Xe1/i0IUjbNBHPOun1HXnJSIJMDglbpgKB14taXFOqM1Zrl42EHvl
         IGNIXpiUfMDd9He5bh/N2efHAM4qdFpBVyBb3bwbCFGYCnioUiDCyNzDvlUygj3sgAdi
         wc+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779807791; x=1780412591;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MDbuAa08BqGLwPFVUvrCU0ivDFLjKQA1mJKnc79aZhw=;
        b=QOuSsRN9bFsLSpcBg3dCQUhwzb2RrLEGjech9Ct5uVAUAVnNgh8FvDboIZS0nZk4gG
         qtw4LNEGRSmVrhLiShIlJ8eos1o07Rn77QVNhDsBOap6HwDbpsidfwkkWis6FQM4cbIE
         beJeK4YxHXEqVZwhW2CXzDbt1qQzVm5yBdMGXLpokXP20ir/RHttvOybSVHRSQwEmZan
         /hKL1On+9oIQGh8mtkPoQmId4RS5EJzRCAvj6n8800YjGzlaz0QEBTkXmEsOyBSKw4dm
         oMSE6hA4fByoqE+B+val31nDKOHg7M05vM1wsa1ghe98hKLJD/a/3zdjx8QrOEzy8yDh
         KWNg==
X-Forwarded-Encrypted: i=1; AFNElJ/4cejsstUFsG9PaxM5hB+loKEXlbBaBQNlT2EJYmSAeBRe93vIuUWahY0usGs3GuTropCU6PKJAvtetQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxTgy7+xzfBrYmMbuM42SVs3uF/OAbcEoLPAgKFEuOTJYS4JrRN
	xNgvuNOpo24Xqt4V+1tmNGy/FpP/03UXtuCJYG6l42s6oikT/6PCXHWqEoJBapYuH6o=
X-Gm-Gg: Acq92OFUJzkOBvId8brM6GdrfduaNqww09iXaYpcEZubmarf86RENUT4d3KmIO/occE
	CQ/lcytA528ntKj+XFITySs3vt337ujM05OAMsV3/x63VDvNEoJrMGeIktbx4QcBtSkRjE6MUr7
	4/9Jh0O7tRHRIEB5mB6IzCMOOpFtjbLcXXJts8QJR9KdOGjEzkTn0AA8E2irj485e1YXXptmGUX
	GEXnkIHIVYcxA6Z2A/oW+LI8/RRZvQcS4zMfFVE4mLllOWE/iPQyWvNMVKjNXhnkp+Ay3wmBnaB
	Q63387xDMCkqb4XNyCUWt3TTQN1oHWPZ4vjFU7+s+WUclVJ2NQo4a93HaY+ST5OqLDsBzvJj4Rj
	4ut4W7j/qGD4P9mTFqFg0gqu2mLKx67VmDe9xehu6lajPUrF/nBTBjJUCjw6nx64bbxeOX0nsvx
	/DNMCCRvyQ8zUVQ5hGEe3iH/ZRWOlWTe/H
X-Received: by 2002:a19:5209:0:b0:5a8:6e50:b16a with SMTP id 2adb3069b0e04-5aa323c8140mr4045337e87.34.1779807791133;
        Tue, 26 May 2026 08:03:11 -0700 (PDT)
Received: from [10.107.1.102] ([212.133.41.39])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45ec7fcd7f9sm22652026f8f.37.2026.05.26.08.03.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 May 2026 08:03:10 -0700 (PDT)
From: Luca Weiss <luca.weiss@fairphone.com>
Date: Tue, 26 May 2026 17:03:05 +0200
Subject: [PATCH] ASoC: codecs: lpass-va-macro: Fix LPASS Codec Version for
 SC7280
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260526-sc7280-va-macro-2-0-v1-1-2c1b572fa388@fairphone.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXMTQ6CQAxA4auQrm3SaWQQrmJcDEOBmvCTqRITw
 t0dZfkt3tvBJKkYNMUOSTY1XeYMdykgjmEeBLXLBib2VLJHixXfCLeAU4hpQUbCnrprWbvgnWs
 hl2uSXj//6/1x2t7tU+Lrt4Lj+ALBIQLwdwAAAA==
X-Change-ID: 20260526-sc7280-va-macro-2-0-f0d4591a611b
To: Srinivas Kandagatla <srini@kernel.org>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 Dmitry Baryshkov <lumag@kernel.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Luca Weiss <luca.weiss@fairphone.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1779807788; l=2090;
 i=luca.weiss@fairphone.com; s=20250611; h=from:subject:message-id;
 bh=MdzDJMQisHkSOiLYvopwwr1v98FNTtU6w7SCFX6+GsU=;
 b=klKyWck4OZBbzCMoyUDCxam5sjFW3KC80yR+prYicLm/iE1cPSctV+zhwZ4rs8aJa3bprNTa4
 fxviKyHu+zsA2WzHYi5LI1SkxwRBbanEyBLa6N7nmDgDYJr67B3ya3M
X-Developer-Key: i=luca.weiss@fairphone.com; a=ed25519;
 pk=O1aw+AAust5lEmgrNJ1Bs7PTY0fEsJm+mdkjExA69q8=

According to both the static definition in downstream...

  yupik-audio-overlay.dtsi: qcom,bolero-version = <4>;
  #define BOLERO_VERSION_2_0 0x0004)

and the runtime detection:

  CDC_VA_TOP_CSR_CORE_ID_0=0x1
  CDC_VA_TOP_CSR_CORE_ID_1=0xf

SC7280 has LPASS Codec Version 2.0 and not, as declared with
sm8250_va_data LPASS_CODEC_VERSION_1_0.

Create new va_macro_data with .version not set to use the runtime
detection and correctly get .version = LPASS_CODEC_VERSION_2_0.

Fixes: 77212f300bfd ("ASoC: codecs: lpass-va-macro: set the default codec version for sm8250")
Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
I'm fairly confident this is correct, but please someone double check
this if they can.
---
 sound/soc/codecs/lpass-va-macro.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/sound/soc/codecs/lpass-va-macro.c b/sound/soc/codecs/lpass-va-macro.c
index 528d5b167ecf..58a5798823d7 100644
--- a/sound/soc/codecs/lpass-va-macro.c
+++ b/sound/soc/codecs/lpass-va-macro.c
@@ -244,6 +244,11 @@ static const struct va_macro_data sm8250_va_data = {
 	.version = LPASS_CODEC_VERSION_1_0,
 };
 
+static const struct va_macro_data sc7280_va_data = {
+	.has_swr_master = false,
+	.has_npl_clk = false,
+};
+
 static const struct va_macro_data sm8450_va_data = {
 	.has_swr_master = true,
 	.has_npl_clk = true,
@@ -1755,7 +1760,7 @@ static const struct dev_pm_ops va_macro_pm_ops = {
 };
 
 static const struct of_device_id va_macro_dt_match[] = {
-	{ .compatible = "qcom,sc7280-lpass-va-macro", .data = &sm8250_va_data },
+	{ .compatible = "qcom,sc7280-lpass-va-macro", .data = &sc7280_va_data },
 	{ .compatible = "qcom,sm6115-lpass-va-macro", .data = &sm8450_va_data },
 	{ .compatible = "qcom,sm8250-lpass-va-macro", .data = &sm8250_va_data },
 	{ .compatible = "qcom,sm8450-lpass-va-macro", .data = &sm8450_va_data },

---
base-commit: 550604d6c9b9efc8d068aff94dc301694a7afdee
change-id: 20260526-sc7280-va-macro-2-0-f0d4591a611b

Best regards,
--  
Luca Weiss <luca.weiss@fairphone.com>

