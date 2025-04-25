Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 781B4233716
	for <linux-sound@vger.kernel.org>; Fri, 25 Apr 2025 08:07:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745568458; cv=none; b=d2aYTVeDNAStnr2s/P5aCz5/qlC+d3nx5uJaD582ntZu8Ho/lr4HzRRXbOaz3WSdpCJg7P2X1VVclDbQmcWylPidgUny0LrOUmnRXzEvAYXK3kxyNeCXtbztNIvNBBn/Bn1vG9xgryx+itN654cH1qWUsVWHp+4lYwsNkA8qdfM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745568458; c=relaxed/simple;
	bh=t2UqwPYP1B9XN/iC4TKLlBIAancDyLL4wrE626PGHow=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=C9hadLYDIc80wzO/a0e+vw5bezvlZks2HrJgtu/t1qdoNE5kLY3dvgG8bRpVgY0JxaPMzc3FipTPFgHXz1wdvJLlG4uhN4oCjGnzDU2JO3CsE8gRWHuvt4Yj1PaBUmBdi4Tvjl6ai/uoNsTKO8sTlVyamX6oaK1wAEhV7uVbRP8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=E/ZeNWO4; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="E/ZeNWO4"
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-39ee623fe64so1823678f8f.1
        for <linux-sound@vger.kernel.org>; Fri, 25 Apr 2025 01:07:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1745568454; x=1746173254; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mF78VVS1a3vgPm4/yr7suBZclt6DuZ16jbZS8capHhc=;
        b=E/ZeNWO4NOjvxBEyxrMqorhodK7sD0OA8gGwrzWhSZm+/Eruria3SxiWJoJC1dI8lk
         0qe2/F8iWfyDpJqHMckbEZtd510KWYkbyUhUbS3156V4Z2ZPTyV5OUtcUsVArq731Dkh
         +3fohrEDKlc6iTjK7AsMHPVAi44VjDgPIFQ+bCcGCbtCGlrJz9dgurhjAGYHt2UYTfvM
         VnBcMp52NSfSs4ffnjBfE6n7DFJ5Pf820fh1f5O8G46UBDBqRXl/3AbCqYVjwkZNOqWM
         xFLWhIfGezYoRtQjZi0tbRPWK8MaGYVIVoLESQxGqkMa+ViFlwhYGSiaZA+FAv6EPLYN
         FwQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745568454; x=1746173254;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mF78VVS1a3vgPm4/yr7suBZclt6DuZ16jbZS8capHhc=;
        b=gWGqalcmjNujUPO6IKjP8C/uv3JO9zSBcZLZhwoLPSM/I543kDJ8+h2bnE9QlqaGP/
         Atbm2hEKLhmCyZgD3gx20EzFPw23QFZT4iu1bwHL62/tDFbkJknQ/Ffphz6vppF+aVeI
         dy+PY3cv9oxAt+pB3ULVeWCKxG94GXm+0gnzwH/8o46BoJQxmI/d1A+k4E4Vr5mLrBVn
         K74hm7ymG4rTn4VPsYqdI5RcQKiOQYQbE9Q7UsQ6xyIG3aw0QygiKKb7iAFqqTCjNXgy
         0SEp6uJlthIkrD2OPbxdW5RA/m3VhZ4CaToGBOPkbZep7mhnaZQRj4GeQm8bmNHSsmV3
         KjjQ==
X-Forwarded-Encrypted: i=1; AJvYcCVo4NoU+zRq3wnTt5gG+wR5vfWTlyHakjwo3E3IRVb1wvBTF5PtbHvXtlvYSNaxSbt1/BZXE4i/sXqnCw==@vger.kernel.org
X-Gm-Message-State: AOJu0YwDq6w0tMQ01S7+A96io2JIpcAbpzt8W6kCQcJ939wOhINJMoQ/
	XvJ5eTIWZ8aLWOvPB76va+dJSITcZuILsKhL6iIVUHrBkARKEqDkbACPdiA+8LU=
X-Gm-Gg: ASbGnctgHK+uKecy8j+eRzP6sDtchZ+2bn12y/u/d8pfxocPqMreAVJ3ce2BD2/+n1q
	XUvDIsMjIozehrE1M51Z3VyQ7qphCadizh9dhqjnBzeK2YVnQ1DGry06Twq2s05tFbeUk3XMPB6
	gXhAx8XUCgizxazPmG6z9tD5uf+4h+z2KiJBCWnKWb8UFueAHgEAc7CTf9yGhgsDH1ajZr9nTf3
	MAHyNEIY4BmruLAY6Y04vQaz1Zlvbk/31ZVn5OOpgiENqN8Bx0EQbkprrTvL9hhnA4w2iMa9GFC
	7tuEI4AoLwFWd1WmqK8d9JJkaeXRGF4ttK+bvR08eQ5Rp+SRChKjIv1laBnyNGQ4HNa3yWb6wYS
	gkMMocN4TNcXJl1Rro6xhm2WzJRjpIloRojT7yhoaAeIGTmt1C91Le50p
X-Google-Smtp-Source: AGHT+IFVDfaMfuOXmMfOCltuXID8xfqxstRaUVHZiIEzVJ71LDPZOd47+6G3giv9YW3kXwRnEPBUTA==
X-Received: by 2002:a05:6000:1848:b0:39c:30c9:815 with SMTP id ffacd0b85a97d-3a074e1e7b5mr964843f8f.21.1745568453788;
        Fri, 25 Apr 2025 01:07:33 -0700 (PDT)
Received: from [100.64.0.4] (2a02-8388-6584-6400-d322-7350-96d2-429d.cable.dynamic.v6.surfer.at. [2a02:8388:6584:6400:d322:7350:96d2:429d])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a073e461casm1593513f8f.74.2025.04.25.01.07.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Apr 2025 01:07:33 -0700 (PDT)
From: Luca Weiss <luca.weiss@fairphone.com>
Date: Fri, 25 Apr 2025 10:07:26 +0200
Subject: [PATCH v3 2/5] ASoC: qcom: sm8250: set card driver name from match
 data
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250425-fp5-dp-sound-v3-2-7cb45180091b@fairphone.com>
References: <20250425-fp5-dp-sound-v3-0-7cb45180091b@fairphone.com>
In-Reply-To: <20250425-fp5-dp-sound-v3-0-7cb45180091b@fairphone.com>
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
 linux-kernel@vger.kernel.org, Luca Weiss <luca.weiss@fairphone.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.14.2

Sound machine drivers for Qualcomm SoCs can be reused across multiple
SoCs. But user space ALSA UCM files depend on the card driver name which
should be set per board/SoC.

Allow such customization by using driver match data as sound card driver
name.

Also while we're already touching these lines, sort the compatibles
alphabetically.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
 sound/soc/qcom/sm8250.c | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/sound/soc/qcom/sm8250.c b/sound/soc/qcom/sm8250.c
index b70b2a5031dfbf69024666f8a1049c263efcde0a..e920b413b762c803cfcc4049f35deba828275478 100644
--- a/sound/soc/qcom/sm8250.c
+++ b/sound/soc/qcom/sm8250.c
@@ -16,7 +16,6 @@
 #include "usb_offload_utils.h"
 #include "sdw.h"
 
-#define DRIVER_NAME		"sm8250"
 #define MI2S_BCLK_RATE		1536000
 
 struct sm8250_snd_data {
@@ -200,15 +199,15 @@ static int sm8250_platform_probe(struct platform_device *pdev)
 	if (ret)
 		return ret;
 
-	card->driver_name = DRIVER_NAME;
+	card->driver_name = of_device_get_match_data(dev);
 	sm8250_add_be_ops(card);
 	return devm_snd_soc_register_card(dev, card);
 }
 
 static const struct of_device_id snd_sm8250_dt_match[] = {
-	{.compatible = "qcom,sm8250-sndcard"},
-	{.compatible = "qcom,qrb4210-rb2-sndcard"},
-	{.compatible = "qcom,qrb5165-rb5-sndcard"},
+	{ .compatible = "qcom,qrb4210-rb2-sndcard", .data = "sm8250" },
+	{ .compatible = "qcom,qrb5165-rb5-sndcard", .data = "sm8250" },
+	{ .compatible = "qcom,sm8250-sndcard", .data = "sm8250" },
 	{}
 };
 

-- 
2.49.0

