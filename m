Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CEA60199E9D
	for <linux-sound@vger.kernel.org>; Fri, 11 Jul 2025 03:00:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752202821; cv=none; b=PJJWPeqUh6SF5+L3vxTIXR8UCqNmhp9FF8ZFb2ub7fH4czDk0qM9DkpQIp1w82yqyIU6gdzmeIbJebHO28X60EIzBqkL+N8oIltis6dJOWiMIGmmlxsQ95E1doIDak/tNhXBrRhqGGoWp+S/0NWSi6fKMGln16eWh+0ofR4C5vA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752202821; c=relaxed/simple;
	bh=5MIvJ0dgsrFZQooch+SFPSiVUKGE2pGyg4740J8aJX0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=D/QFfghFtHH/3Q/gel/p8bUtpZJajPNsVNPboN+jpjGq0ve53AP65KbZGkHy/q/GSARMElJomyjOWJyZWjpUa8Rwbft0vAAbVIxXzBzylj99Iuox6idWXon5IUFaHx47HzEFbGrQxOexFIhUK/SbMi6i0ZcgZMyzmVSlDijL478=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=BipYl5Zw; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="BipYl5Zw"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-453647147c6so14850645e9.2
        for <linux-sound@vger.kernel.org>; Thu, 10 Jul 2025 20:00:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1752202818; x=1752807618; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PItV10s0cZSW+yN+a8jyJUy2gpJRDMCrOerQQhZoaU8=;
        b=BipYl5ZwCMkqSFqVnqRGFrqXP7lFCUjIYj+xiVYE513PcboaZxuwHUNVao5IQsXYKE
         R0cPwOJX8Ustpl88t0Q1Dh56XSS9o6+T7tgLnQYj0UNq9mem468DDHEY1xGg2NVHUUQ+
         ywvKxH3orTrHCMuT6tCnh1dY0MVE190bZrSZMbmsIW12l5Kn8OjbD0jsTlOv9wWaflEP
         L1HyeTG8w6rS3yPBRKbpUh7k/R28iVbIZv8xoSoR2pDfxBAWlnAVKLEWO0VeF6C+q9Tc
         4OqcL2uqrrkXAD8z2XrZ8Gk1pZJ8ZB2ZoCXTH7wtkuHumxG5AtAu4QdEtp4BpwULo1tJ
         Gvww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752202818; x=1752807618;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PItV10s0cZSW+yN+a8jyJUy2gpJRDMCrOerQQhZoaU8=;
        b=skps7+oeJKsSd99oi5K4WYuL4bQAT4HhkP31qSwQ3dZ9RaxHjEiI5rWtF0KlPTwoSh
         7B/Ku3y06HaZEigrLCYtA6rlnOdvCM1O0Z6POL6cUdDsRdVaYAEPKnPW8J/v0fzacMxh
         21VwNEgUVVWV7DCM0rV7hkZ6Z/UMiylKDWTL6iQZQ5cXwqlhPFu/mDCiZU3OUyhbm5te
         G5SDZFTTYUQgqtT6gNHa3sB1hJMJALCV4WLjUDJqWzW1JwhIc7lilkIddQBMIgsh4bu3
         DpSqWZQz2wBkJMWcfVqAdcXpPNX269ZqPy81mK2DazE7Toqx4RkmbAvxJ3cDjmha8UHO
         iyig==
X-Forwarded-Encrypted: i=1; AJvYcCVbpsn7J/pjbVM32ESe9YIaHO0jls8uZz4a8AxXbu1v5cGhCULbYN+wHQbmLz5Dskp8POHWyVbmjdD79Q==@vger.kernel.org
X-Gm-Message-State: AOJu0Yzz3nSNbfPR/34juuysNC1htEjQLAf4Zc11FUa8nCxZZZVGmmze
	8dx6XiCmS+h+tFdIYZna/FqvxiN4OtdacTmaBRZuJx09WKY1TGk6cle2Xm8db9F80k0=
X-Gm-Gg: ASbGnct14ttPFiuK4BH974jG/sGGBqZe1+UtSSJK8lENoghvXNMTefu1HlnvDoBy3fQ
	8WF9EXxYjKv+PXlfNH7z+w5UcekJoAxlJpbnCuxOTI6pGsCpiHsc82QFSHW62MxFH3S7sEPkNyr
	96VODehGAK67dFN/rc/J4xEwiv1M49fMLI2myhw/OluHGQBxSGEcpXt+2Xap022Oxg3rJlpgtkw
	OWg0LkuBDLuUfXfErp70nyBTFdXoiAK/nzuFvYUhox8jZfJmgigEmniD2Du/TaSDPIvdnyQZRez
	JFGy8RQUJCG2S9BLgVk/tfKsVE8Zg21LKMvIuYx/uY1mPiUE957D1J4JuPhoXaYb1WCvOj3f0au
	wxUfpI0bgLuotMIdJmGFSUSGpbTcmtg==
X-Google-Smtp-Source: AGHT+IGu2ldXw3cTzJ/uXsfrw6SXkpbJlU3IpHW7dkiNBEJvGWLqmXfnAmpjdfy8ipaz837wikLWnQ==
X-Received: by 2002:a05:600c:628e:b0:450:cff7:62f9 with SMTP id 5b1f17b1804b1-454ec2769e7mr8969525e9.22.1752202818181;
        Thu, 10 Jul 2025 20:00:18 -0700 (PDT)
Received: from orion.home ([2a02:c7c:7213:c700:e4ad:f2d9:9dd9:cbf2])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-454d50fa9b4sm75424355e9.27.2025.07.10.20.00.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Jul 2025 20:00:17 -0700 (PDT)
From: Alexey Klimov <alexey.klimov@linaro.org>
Date: Fri, 11 Jul 2025 04:00:12 +0100
Subject: [PATCH v2 3/3] MAINTAINERS: add Qualcomm PM4125 audio codec to
 drivers list
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250711-pm4125_audio_codec_v1-v2-3-13e6f835677a@linaro.org>
References: <20250711-pm4125_audio_codec_v1-v2-0-13e6f835677a@linaro.org>
In-Reply-To: <20250711-pm4125_audio_codec_v1-v2-0-13e6f835677a@linaro.org>
To: Srinivas Kandagatla <srini@kernel.org>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Stephen Boyd <sboyd@kernel.org>
Cc: Lee Jones <lee@kernel.org>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>, linux-arm-msm@vger.kernel.org, 
 linux-sound@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
 Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>, 
 Alexey Klimov <alexey.klimov@linaro.org>
X-Mailer: b4 0.14.2

Since new audio codec driver is added the get_maintainers script
should catch the new files.

Signed-off-by: Alexey Klimov <alexey.klimov@linaro.org>
---
 MAINTAINERS | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 41d95e7c60c629338fbab8e6b001029de3c4695b..3ef80be4f2b6dc07cda7a6418eddb7a07ff28962 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -20221,6 +20221,8 @@ F:	sound/soc/codecs/lpass-va-macro.c
 F:	sound/soc/codecs/lpass-wsa-macro.*
 F:	sound/soc/codecs/msm8916-wcd-analog.c
 F:	sound/soc/codecs/msm8916-wcd-digital.c
+F:	sound/soc/codecs/pm4125-sdw.c
+F:	sound/soc/codecs/pm4125.*
 F:	sound/soc/codecs/wcd-clsh-v2.*
 F:	sound/soc/codecs/wcd-mbhc-v2.*
 F:	sound/soc/codecs/wcd9335.*

-- 
2.47.2

