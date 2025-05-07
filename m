Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E78C221708
	for <linux-sound@vger.kernel.org>; Wed,  7 May 2025 08:02:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746604931; cv=none; b=aYJLTvRSp65hkvOKhD//09XIC1LHj2vhRUVPSF629EYnokWd3sl7cc9AbLihdha09ZUxJtemAUzTrN31wEyIUr2GKMCuxjBapXHrHkb8RjrRCUO7rZbXva4KuN6pBqYtBlCOrIi4K3BMcvC2tYmTyXMQqfD0D++Yze0ckrPLpjM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746604931; c=relaxed/simple;
	bh=+NkIa3tRR6OnKKuCWg/7/UZBXPY1qcvu5koCiqXLwVo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=NmpIGhXX6FKlXkF6otLhGg9LLf2k2TZKHjCCaxwJ80XNHazN95azSWG1Bt2W7XpEW7/3UGff1nn54xU2xCAcPJYjMbmGaKpxABzH0WSJxBkYdzBuiA4FOLZcXHaj1VdpkxZ6U4udG7A5pLPZcnt5Ww3fOEL3XE/M5RWoCISXS/w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=sr2/yM6d; arc=none smtp.client-ip=209.85.218.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="sr2/yM6d"
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-ace3b03c043so999533166b.2
        for <linux-sound@vger.kernel.org>; Wed, 07 May 2025 01:02:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1746604927; x=1747209727; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zEN0PXya3Y5YPAUDTh8Px+2+gU/KgrKVkv5tePKDfas=;
        b=sr2/yM6dnxNxPqEHg7gCYUuKwRBECOSfEJcdnvo8d6k3Y0fbTC+lzYN1ySoX+B9wFR
         OpwnnTJo6XCqDloc4AjkolinjkcOVJiEj+nVIA16RoxP9xaEyjp7UG8AIe2o0KsdPO7g
         5NO9D91cNCq9MHACcJzNuI7XhMgN2cAQLLd8qHi21JyUR4CiX9uOicZUo6thFNcjwoZ3
         UEz2P3pKTxRyaCA6C8DUojZkD/lvVBZ2425B6SxiXw3CWjZGG6yVzQjZ4N+C+9c9vdRQ
         sGPc/WNFNYc1julwKGKHXFyOW6LMRJ55b4PB+DCEUBdG6j1MmOo18o4VFCMBK3FGpBaL
         huvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746604927; x=1747209727;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zEN0PXya3Y5YPAUDTh8Px+2+gU/KgrKVkv5tePKDfas=;
        b=kU4puqn0cl1+ruwXZhUo1hUIIOVi/y5V7t0X+wDH8QjI8KnM3ecm0eWnoNbU07Iu47
         Z98IAHwgfsV6jjuJQTdXWGaDibag3Y3T2NZmq4+bJAul6bp0+DVGbPf9bLVg6ozhtbmc
         9tmE+8qNbJQZlesGi5B3JZBbLsPbCyKSfE1uOWWZbnmsF7alABPLCIjcW+bm96gh8KUI
         MQPaOLDMOcUvMG7JyVeTExZEegxxn+NvADzrNfELAef1ZDKgnfAhuXZEBd0+w8Z9GNSW
         wCKJA0eeKvG5lkOuEgPvHAlWOE7efm/zZKz3FcZYD24e113lXpoB34y2pVwy3uPXtnOJ
         C2LA==
X-Forwarded-Encrypted: i=1; AJvYcCUhOR/EEexQVMnoSMGpV2v2UiLqkpGZ4OXbAlHnUvmpZTL+SuM5oYX2OBwrH0wllH4XQd7dQY/yOksiNw==@vger.kernel.org
X-Gm-Message-State: AOJu0YzfUvqKzcpuk7heDboB0FxJ4zXjjyOWf7ReaD8xe7cgo75Xv7zG
	MHdMsxhEaXXv0kvbYIUTqNVPo1iG+bMUUNPe/9s9pzfH929UTNBM0rUdsW+4FEs=
X-Gm-Gg: ASbGnct5aiJy/cb4BoULJ36obtBJMcpqd42iWLNy3q5kgGwIvkgZh8rs9lcF7Hr0CHg
	lxMgroe+3uWfVjVPmtW/Du/Ni2vo3Bb17UsSlJGnUIAJH0agf/deCFIsWhw78ApR58lMaR0R4BB
	4r71OLiZEvBBfVyVHo0bOI0guxcwciyf51Sn/20D1wItDVpdNa6Ub1/FkvTJzLP7EqRi8HSjVAb
	iLS+YkMfQMVTmNgpXM2PsfUXjWKp5y9DN81gi5CjbXHZqDeOJgiRJnWUdt9mSJRZCNKIbwFtrT+
	v1f+xBhe5hiVk0t4UpU6O8PDa2oEI+aMIscyan+M/KyEZp5OWgdmXjrdVBeOG+wHAIRfq4eOt/U
	u5RLK6q6F2TUtdw==
X-Google-Smtp-Source: AGHT+IFM7Oq1Xn0VIuxfyz3KRNIFNY5cp5qjc6oWjmusZGZM8KjZIdX1ZYRy5EquRLMrIpwTTSPwwg==
X-Received: by 2002:a17:907:c28e:b0:acb:5f17:624d with SMTP id a640c23a62f3a-ad1e8d2ce68mr215405466b.57.1746604927193;
        Wed, 07 May 2025 01:02:07 -0700 (PDT)
Received: from [100.64.0.4] (144-178-202-138.static.ef-service.nl. [144.178.202.138])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ad1894c0310sm855236066b.88.2025.05.07.01.02.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 May 2025 01:02:06 -0700 (PDT)
From: Luca Weiss <luca.weiss@fairphone.com>
Date: Wed, 07 May 2025 10:01:39 +0200
Subject: [PATCH v4 3/5] ASoC: qcom: sm8250: add DisplayPort Jack support
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250507-fp5-dp-sound-v4-3-4098e918a29e@fairphone.com>
References: <20250507-fp5-dp-sound-v4-0-4098e918a29e@fairphone.com>
In-Reply-To: <20250507-fp5-dp-sound-v4-0-4098e918a29e@fairphone.com>
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
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.14.2

Add support for DisplayPort Jack events, so that user space can
configure the audio routing correctly.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
 sound/soc/qcom/sm8250.c | 17 ++++++++++-------
 1 file changed, 10 insertions(+), 7 deletions(-)

diff --git a/sound/soc/qcom/sm8250.c b/sound/soc/qcom/sm8250.c
index f0d83a843765d8dcdd51569e7cbc95eb72292497..2317fe285ee7d41689d7fac453164fbe706744ff 100644
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

