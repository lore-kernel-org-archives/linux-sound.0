Received: from mail-qk1-f176.google.com (mail-qk1-f176.google.com [209.85.222.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1037F446070
	for <linux-sound@vger.kernel.org>; Thu, 30 Jul 2026 17:44:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785433488; cv=none; b=r1CiQr7tL7xDHK52HZQ5K/oVOMbMbLTfGY665yOz/3f4/CiDLdgYtzYqyAYYkYtxoMq8KKnQxdHXs9JcO3DNX92ZsUOPy0nBjT6ljrXfF9Pji+NDJK0tgQe42WMUUVOjeRDrN8ybFJBGyKSe+BXztnT5eF/0Yrq1IVQ/N6ptpWo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785433488; c=relaxed/simple;
	bh=A4EcUqBUamR2r/Iyk/gfR6LX+9b+7S/k0p7QmFKYf3Y=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=NLr5HmT0WfKVyRnEM1JpWXaaeeQljvO/Jskg/gCwSfKtP2GDZ9nP8ooEDPPfoZjzXyKfutSrBLsOKNx4P1I4sdoAtZkn8Sa+RU5nDVO4vxOql4EI5YelnLr2/83YiKTxDxJJTCQ4bQVnsT7QCQ6sRCntyY+d4ySF6JHq9hmSTD8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=pQoLHX0l; arc=none smtp.client-ip=209.85.222.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="pQoLHX0l"
Received: by mail-qk1-f176.google.com with SMTP id af79cd13be357-92e85499ffbso11263285a.0
        for <linux-sound@vger.kernel.org>; Thu, 30 Jul 2026 10:44:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785433485; x=1786038285; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=DKJHpeAHU57LnqfzYvQX3/o+Gw7QJ2BjYIAi4uUHpUA=;
        b=pQoLHX0laUv+I00piiQuJH7WCX0Jt6CiP3hII4+OfSdB+6viAgIwDUCTStBKTFWvRT
         0mTgiaA2h2TWnLwg+Jp1xcEK/lY4PurYTQR1wRWm8xSHcdiF9yWXfZvdFL0S1+EBDdC4
         Un88LgzjJTT6D9qdO5hzL+brIhKyQNdeYkELzQsFUhX3okLrdgvF4cdZJ+KyGTpVAlia
         +PXibQ/AM6myn9XiN9GCKiFqwX3WApwr2Q1T1xVv4Ej3vZ4u/8WSc4VgOOqniaRonehK
         okkCSePJCI4lG/2R6rheFIvmfx89ZDugAR7dSmS4XZcQefTasjxl3+ltvmL7Xx31fHub
         cJJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785433485; x=1786038285;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=DKJHpeAHU57LnqfzYvQX3/o+Gw7QJ2BjYIAi4uUHpUA=;
        b=sQDJ8KFtvTEH/ua0gBeKYzG7Rb7J95eW12FPQZOqYshCqnMtu5PaJtoP1uDv0I7ZsI
         Q6F6QbzIRlShDf0VkUhMrXOrtYU5gEEZpnmcXUvGL1KlQ0ySPTembdSmKGEQT3uKfphh
         h53a9lbtqDStH8kgBygmRU40wBJFhbE7MhUy2VaR4xJhqEje0RgB3MOaZJ9KfPqmkelU
         SAsON0ATfikgJ336HOAjlNzVHxq5vQlx+jxAlkUx6bB/wfP2mnDazj9Ep4eZcfaQws5n
         XWlUbij3ioutE1/96ltPmVaWjV+MUOYDZdFfAM4dokBAJQeyj8Kn0GTcV/mcdU+JRWRr
         Rk1w==
X-Forwarded-Encrypted: i=1; AHgh+RoiyF/nVzo2IEgSoCqsF7j8ZGIW52iTfzfKwi+ShJBSfSJy5o/lMSlHxrXB7sGbG+vkQyQT5E6ggQ/RUQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yzfbzoo+HXWn+54c4DIFXZcScVOj4nLjKKLYrlX24Nu4EEY4PHk
	muZ0Rg1atp13s7FvNxT2w94zOEB8HvLns+69SDvSYF9VqFEZ6kFYHyoJtd5qaw==
X-Gm-Gg: AR+sD12VRttHefrD1o7kNRYF7FFvxcvmfDL1ijETj70QADtN0/7AQ6hxF0J4q9jTbfK
	YzFEEYWVdsh5ThpLUjtY+h0IVZ7bGNLOBK4LEpExsDWEyZrPsXv3VQYSzEQ4SeU0UJXHYl91F/V
	L4TrYA3VYfco0Mz2zSW2BgnAdLX9D0UQKWb2cQMzOLB/Ealg0J+yIvsH/pWC0NSydhPaWlngEWN
	TlqyrNWIpftPq6ZX7y7rvxYnxjaAK9umlTMBQ0g0TCnTG24DVaAzrDhY4ZsGYWBbfMM97AQ7gqn
	9PbZEzYs9hhcYTxWMVutcNiMa+IMUmCzfZqmstM62Yl99AiJT7ju42K1kGZDqBTCuZGZktfD5UP
	eM9Ahe+YU6zanOllR5K6LzKu870nUSKcShO0X+8dY3kOa/OHySidhUXFzPhe6yzGqY8BIRc1gqb
	TlZW3uJMpf6hQEQ8PwbYyqX5BT+fgutsEOz6xuS0Oyhpnr8R7QCuMWINMqmzA=
X-Received: by 2002:a05:620a:2547:b0:92d:aa96:932e with SMTP id af79cd13be357-93485fcb296mr405846785a.28.1785433484807;
        Thu, 30 Jul 2026 10:44:44 -0700 (PDT)
Received: from localhost ([70.54.57.80])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-933d3221bc7sm457575685a.7.2026.07.30.10.44.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Jul 2026 10:44:44 -0700 (PDT)
From: Richard Acayan <mailingradian@gmail.com>
To: Srinivas Kandagatla <srini@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Konrad Dybcio <konradybcio@kernel.org>,
	linux-sound@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org
Cc: Nickolay Goppen <setotau@mainlining.org>,
	Adam Skladowski <a39.skl@gmail.com>,
	Vladimir Lypak <vladimir.lypak@gmail.com>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>,
	Johan Hovold <johan@kernel.org>,
	Kees Cook <kees@kernel.org>,
	Charles Keepax <ckeepax@opensource.cirrus.com>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	Richard Acayan <mailingradian@gmail.com>
Subject: [PATCH v6 12/15] ASoC: qcom: sm8250: add SDM660 compatible
Date: Thu, 30 Jul 2026 13:43:50 -0400
Message-ID: <20260730174353.108023-13-mailingradian@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260730174353.108023-1-mailingradian@gmail.com>
References: <20260730174353.108023-1-mailingradian@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add the compatible for SDM660 and SDM670 devices, which can use the
support for WCD codecs connected to internal MI2S.

Signed-off-by: Richard Acayan <mailingradian@gmail.com>
---
 sound/soc/qcom/sm8250.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/soc/qcom/sm8250.c b/sound/soc/qcom/sm8250.c
index 1952c599e004..76dc3a3f4a31 100644
--- a/sound/soc/qcom/sm8250.c
+++ b/sound/soc/qcom/sm8250.c
@@ -210,6 +210,7 @@ static const struct of_device_id snd_sm8250_dt_match[] = {
 	{ .compatible = "qcom,qrb2210-sndcard", .data = "qcm2290" },
 	{ .compatible = "qcom,qrb4210-rb2-sndcard", .data = "sm4250" },
 	{ .compatible = "qcom,qrb5165-rb5-sndcard", .data = "sm8250" },
+	{ .compatible = "qcom,sdm660-sndcard", .data = "sdm660" },
 	{ .compatible = "qcom,sm8250-sndcard", .data = "sm8250" },
 	{}
 };
-- 
2.55.0

