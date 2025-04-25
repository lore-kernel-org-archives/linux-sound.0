Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94D61233738
	for <linux-sound@vger.kernel.org>; Fri, 25 Apr 2025 08:07:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745568458; cv=none; b=LDX6EYWZJx79asSa2vkId/SNIFdyqtK8swuiKNvHy8RawSqJwJ5VgvbnuAFIf0GBas8rJ743E0YKHZsWAD6m2usQJaoJjvM8uuzrCWpcQcps8vNitleMfl+E3m8xnAlm0mOlOWH2q28llyAyZOXiqI+/cqeaJi7CMuHF5crBAuw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745568458; c=relaxed/simple;
	bh=0Tu7c/55MLpVHgNQHr6rjQgjyskQ0bSBrdifeMj848A=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=GFMlkBa/mM44amLL2lslkP9lFEiB9Dhg5M6NMIcvd8C1rXDBZF+C2tXlCoYtEW8zUJZe1dCdzF/nz066RCM5xfgN86MYzrsxQNinFJxdMlTZozlnpQi++UbtEPfGDk58EAvVVKscJDJoIwBQcDWLEc46bCYg6cl2qRHOsXWwfXU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=3r4Iwxtv; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="3r4Iwxtv"
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-39c266c2dd5so2076206f8f.3
        for <linux-sound@vger.kernel.org>; Fri, 25 Apr 2025 01:07:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1745568455; x=1746173255; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=E/5LsCgffLwJC40iP8PJSPd6pyxub1HE/XdBIbu8y+o=;
        b=3r4IwxtvoEAls5z8rgeT4GYq9RM+ebzqM9NWWv55SkxOgf/eAMA/oUFh3CogGAyxOJ
         qaQ6BpAN4/PULiSNNS8cY7ttpkqFh1KROe2m8Txd/KJKylJd8Ysq1iYljOOBM2pTnQQI
         jzddHh8t1K/y7OR29iVGSV1FnjAYNS9HTJ/sg6aw/cyJ8/DkGRS+ayANKllXWQY0VXF0
         MEEhSywxxyKyD1fvYUf6vqe9uOT/Rfz8Q7f6HxypG3NyyFegpvyYoUz9fKS15Yt/Ma0K
         DzvmCYMUbCO87Uf8UBIwFVUkvRHF9lxTnKQ3yjq3aHklywOLw/oC5e60mjXsYXfJNKJN
         VdHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745568455; x=1746173255;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=E/5LsCgffLwJC40iP8PJSPd6pyxub1HE/XdBIbu8y+o=;
        b=mG8GQ3djVOdBVlq/eLHpCpPBOSCaD3WiK+AwYo+pnszGp7s6SRe/dcw6NEGFCPsN0u
         I648w0L5Y4r1LLi+BzEmoCfJdCB3Dym55vVJPPPQBrA+vsaiwit04WIuFD+TjRz0FzOg
         EPY8TPnVWgNOgwgDdGOPc7QT51fdzZE3cDCeZExwOW7nJrsO30Gf5wGpdB8ZIft1f4a9
         /7iET8LB0AyHeX64UjDME/ybbCOlIGsHvUmHcFV7udixhs8IMg+Qfo4fPCUrFGCc9WBw
         kKvmqQByIoYx849HilCtVg9JXRMQ68g454BIk3+01rgvbjC/FOH6/L4hYLZSKgqJPlBi
         9tNA==
X-Forwarded-Encrypted: i=1; AJvYcCUk5JL6MsCRw9B6n1B27UEpMa4prTbhA+fuzgCfp8pIg15xMBcpt2LWyEsNdtTzstUibPmKyJjmEDKMUA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxNzEJcce5aCW4YghLma9ZbEp0bwaPBZXa/5ELNYfLDGznetztq
	4kLhT9oUWnbapAiqL9PHxLCHlI7NXJRpSVNTCyXCLuFfLv/UX9WBp7LMJ1zfqOs=
X-Gm-Gg: ASbGncvFHo2+VP1VT6voDforLlQZzs3KuS3NwkE2wyyXBU55b5Gi7goO9adjIEVemXL
	ygMiFLYDCgHNKqgyjnQQyAcJBfK/YZuIdsaYFTv8O63XUeb3jnBfqxRvVsN2PGlWe/O3++cnLd8
	hwzqTrGlkPdmlyGZj1xgR8/vyFxJxQozk15WhCoZB4cjhxAcmnwA+EodstnKpyq4udOQmwBc0PT
	GzlX+yEp7oqMsN+vRibPemXm4Vi7wzQdj/c/nv648RBvOUDkgIhHLhjM19Leo2OpFOT2BXnDXGS
	5oWF1QpKgFU2DTVRe4fvTZhhCPC/IJM/tW6ebPGKWVzLfJiAcf+65dpsR31gnhR0wdS6YILPrMJ
	ICcNvyTZ6NOwCYo5iFlHREW9PfqNcRMhPg1RaGGhqiMQUmpIsW2XTymfM
X-Google-Smtp-Source: AGHT+IGnsZ1b2dFNba8xAUTuBj3bQrZzqkheFyeShJZeV/m9/iuVWWISzbszqwiJOzfRZPRZ+u6F+w==
X-Received: by 2002:a5d:5983:0:b0:39e:cbef:c071 with SMTP id ffacd0b85a97d-3a074e2f521mr936972f8f.22.1745568454883;
        Fri, 25 Apr 2025 01:07:34 -0700 (PDT)
Received: from [100.64.0.4] (2a02-8388-6584-6400-d322-7350-96d2-429d.cable.dynamic.v6.surfer.at. [2a02:8388:6584:6400:d322:7350:96d2:429d])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a073e461casm1593513f8f.74.2025.04.25.01.07.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Apr 2025 01:07:34 -0700 (PDT)
From: Luca Weiss <luca.weiss@fairphone.com>
Date: Fri, 25 Apr 2025 10:07:27 +0200
Subject: [PATCH v3 3/5] ASoC: qcom: sm8250: add DisplayPort Jack support
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250425-fp5-dp-sound-v3-3-7cb45180091b@fairphone.com>
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
 linux-kernel@vger.kernel.org, Luca Weiss <luca.weiss@fairphone.com>
X-Mailer: b4 0.14.2

Add support for DisplayPort Jack events, so that user space can
configure the audio routing correctly.

Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
 sound/soc/qcom/sm8250.c | 17 ++++++++++-------
 1 file changed, 10 insertions(+), 7 deletions(-)

diff --git a/sound/soc/qcom/sm8250.c b/sound/soc/qcom/sm8250.c
index e920b413b762c803cfcc4049f35deba828275478..a4bf6eff811ea3e2b005071cf3410e5a0410f5d8 100644
--- a/sound/soc/qcom/sm8250.c
+++ b/sound/soc/qcom/sm8250.c
@@ -25,6 +25,7 @@ struct sm8250_snd_data {
 	struct snd_soc_jack jack;
 	struct snd_soc_jack usb_offload_jack;
 	bool usb_offload_jack_setup;
+	struct snd_soc_jack dp_jack;
 	bool jack_setup;
 };
 
@@ -32,14 +33,16 @@ static int sm8250_snd_init(struct snd_soc_pcm_runtime *rtd)
 {
 	struct sm8250_snd_data *data = snd_soc_card_get_drvdata(rtd->card);
 	struct snd_soc_dai *cpu_dai = snd_soc_rtd_to_cpu(rtd, 0);
-	int ret;
 
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
+		return qcom_snd_wcd_jack_setup(rtd, &data->jack, &data->jack_setup);
+	}
 }
 
 static void sm8250_snd_exit(struct snd_soc_pcm_runtime *rtd)

-- 
2.49.0

