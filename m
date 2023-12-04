Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="WxFUILUg"
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com [IPv6:2a00:1450:4864:20::536])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BB65FA9
	for <linux-sound@vger.kernel.org>; Mon,  4 Dec 2023 04:47:44 -0800 (PST)
Received: by mail-ed1-x536.google.com with SMTP id 4fb4d7f45d1cf-54cb4fa667bso1428259a12.3
        for <linux-sound@vger.kernel.org>; Mon, 04 Dec 2023 04:47:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1701694063; x=1702298863; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KY0JnJRKpd3/EUynN0UwcoxBlBhaBotyx7RxLf0wHWk=;
        b=WxFUILUg9AlH39Y2EB9mtJahq3vrhq/0j2+JHA2WeUFVB/LtnhfAJJ6nRyCnFjGPpq
         BhXtUVYhlZ5Sctx4Jf5xJG9kNB1uhew7yHFhboABHNdA9G6ritHPu+7MyG2S0hMh7rA9
         AwroFr7K940CJq4OKdWBdtYC0AjjyENd5/IHGtq6Yjsan9cNv+IjayLquw1iPCpv/aee
         dtzIN8IBwrImDDCb8s4iKTKA2JT20iNBuC2qDj6lbMWjZbhizaAhvauTUotVGSe86eHD
         giq6/GlbCED9cuEJY21EL25GlMokfTByfuXlceuYWtHd2261n6fkp7+BaSOk1Q+y+Tzv
         oV3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701694063; x=1702298863;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KY0JnJRKpd3/EUynN0UwcoxBlBhaBotyx7RxLf0wHWk=;
        b=JslcBKSLagsxj0386zM8BgSsbWI2I8y9Jv3lDwHajJfqWgHG+nkxGIGP5YVYwAy8Px
         XtDTIc58nW//ej0u2Hc/GBfsD7M0R/0XVeEzkUFE+dV3qFqqMz1apWlGbc/xbwMhnfvO
         3bvLc6bCyLH6Vw58h4rzTWosY5mFZkGrGhtoHEhihozpd44SKFRSWV5xA+JhD2QsLRbo
         TUxtUh++L02vZQVVMKFn73zW0tOpCNsEw+ykB/Gs19eVaDhYqZMeQOOaNxk24wLd4Q1V
         RZhxmBqMam5Rd5jzqznaC49DKHNjGSVj8Afa/FknwQ7wt5DBNzlujmdiLR67zMY2WyjM
         4Jzg==
X-Gm-Message-State: AOJu0Ywi+SwfYGyPAHA58eGt0PObSxy04my/mp3tT1pEn9Oj9J1nuW6A
	LkcE4EsI4kWrLojDnazdQpMqWg==
X-Google-Smtp-Source: AGHT+IFhu/InStD612XpzFwPv9bBK0nLIg+7JO9nMW2ZvtutTmDe1Q3IXR3v2X7PDbYWSph/4G/iGg==
X-Received: by 2002:a05:6402:17dc:b0:54c:a21b:8088 with SMTP id s28-20020a05640217dc00b0054ca21b8088mr1192577edy.63.1701694063127;
        Mon, 04 Dec 2023 04:47:43 -0800 (PST)
Received: from localhost.localdomain ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id dc15-20020a056402310f00b0054ced65bd26sm457017edb.41.2023.12.04.04.47.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Dec 2023 04:47:42 -0800 (PST)
From: srinivas.kandagatla@linaro.org
To: broonie@kernel.org,
	alsa-devel@alsa-project.org
Cc: perex@perex.cz,
	tiwai@suse.com,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	johan+linaro@kernel.org,
	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Subject: [PATCH 2/2] ASoC: qcom: sc8280xp: Limit speaker digital volumes
Date: Mon,  4 Dec 2023 12:47:36 +0000
Message-Id: <20231204124736.132185-3-srinivas.kandagatla@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20231204124736.132185-1-srinivas.kandagatla@linaro.org>
References: <20231204124736.132185-1-srinivas.kandagatla@linaro.org>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>

Limit the speaker digital gains to 0dB so that the users will not damage them.
Currently there is a limit in UCM, but this does not stop the user form
changing the digital gains from command line. So limit this in driver
which makes the speakers more safer without active speaker protection in
place.

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
---
 sound/soc/qcom/sc8280xp.c | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/sound/soc/qcom/sc8280xp.c b/sound/soc/qcom/sc8280xp.c
index 249a43e1dee3..1e8f9452cd28 100644
--- a/sound/soc/qcom/sc8280xp.c
+++ b/sound/soc/qcom/sc8280xp.c
@@ -25,6 +25,23 @@ struct sc8280xp_snd_data {
 static int sc8280xp_snd_init(struct snd_soc_pcm_runtime *rtd)
 {
 	struct sc8280xp_snd_data *data = snd_soc_card_get_drvdata(rtd->card);
+	struct snd_soc_dai *cpu_dai = snd_soc_rtd_to_cpu(rtd, 0);
+	struct snd_soc_card *card = rtd->card;
+
+	switch (cpu_dai->id) {
+	case WSA_CODEC_DMA_RX_0:
+	case WSA_CODEC_DMA_RX_1:
+		/*
+		 * set limit of 0dB on Digital Volume for Speakers,
+		 * this can prevent damage of speakers to some extent without
+		 * active speaker protection
+		 */
+		snd_soc_limit_volume(card, "WSA_RX0 Digital Volume", 84);
+		snd_soc_limit_volume(card, "WSA_RX1 Digital Volume", 84);
+		break;
+	default:
+		break;
+	}
 
 	return qcom_snd_wcd_jack_setup(rtd, &data->jack, &data->jack_setup);
 }
-- 
2.25.1

