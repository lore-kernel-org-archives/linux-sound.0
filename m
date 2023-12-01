Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="kVc3BHY6"
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com [IPv6:2a00:1450:4864:20::532])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 41077170E
	for <linux-sound@vger.kernel.org>; Fri,  1 Dec 2023 05:53:38 -0800 (PST)
Received: by mail-ed1-x532.google.com with SMTP id 4fb4d7f45d1cf-54c4433e98bso1399431a12.3
        for <linux-sound@vger.kernel.org>; Fri, 01 Dec 2023 05:53:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1701438817; x=1702043617; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0XO1jfSNAX5UUapl1o0DoRwp6Muw1NAKcPjYnOb3wSQ=;
        b=kVc3BHY6ms+vr7mCEQhUipVj6lSVOqPo9jLWvxYAuvO8C1gVMG/80/+N27hEVVrxIA
         h8BmlrCeJZtS8jo28/0BE/4dht1RgPizeFEYE1lOuGnxT8+XOAuQdGf+7Ggf8Rw8ODvB
         GgdaLWX1xM8MVryLNF6Tg76iiDUr/twUugpVKm5iOp5h4oNOclJxJW1/1YLCr88srRgc
         f6GH18qhjRrzeZ456y2qzFjG7On/G3MmXe3aW4ukK3hnMVzKMcqmj9zMQkBGdpqdByxS
         03z8OwV69sAoiN6L6qPmTM8lRg0BVy3sYffbVRocc/IJ87y6+6nbpYouywERIJ9qkOjT
         Ccow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701438817; x=1702043617;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0XO1jfSNAX5UUapl1o0DoRwp6Muw1NAKcPjYnOb3wSQ=;
        b=TK/4hkv8zxWy2TGpjSJjDXh2ZJQIelNaMC0sbl5aXATz1rypg6CBAtnTs0wdkEbZEK
         MzpJdf2f0TpW8hgWGvvewTs+pTuwycfLRs1yUatf8khjPzT5SOvvfXBvjSXlm7/pEd6y
         CxB8u/xzUN9O/S/gyIFzJbJkD/py5b3mizTKuS+WVjYQhl54UuVLc8zv2PyC+I9N5jn1
         1DHGP+xvQf8RoeCBZTA0rUBvGNvKz4AUb/trJN+dNwOlLvTOep2FjXvOTxhSKR0Lqkrw
         HeUTOC98cP2xm51xmD919tYC8xgXXdlHawIqgdZpsJbn/lWFa9K7Bk0OQeMSjJyCQ/Nt
         86nA==
X-Gm-Message-State: AOJu0Yx6+Dl6AqKsjG/hwE80Hn9HsuHhbRZeLfZSNbfgd1/wx2um2UXf
	y34uWJTtm5574MwnoVtzpO5nX48OLiVoUjCDpqw=
X-Google-Smtp-Source: AGHT+IEUEBgek6GqGcBQw9JPEGr/EOjPY1nRmeSrVXDWF27h8GC0nLXB3/Be8p+vpwpYsM4Ye9nsOw==
X-Received: by 2002:a50:d651:0:b0:54c:4fec:f1 with SMTP id c17-20020a50d651000000b0054c4fec00f1mr361610edj.128.1701438816710;
        Fri, 01 Dec 2023 05:53:36 -0800 (PST)
Received: from krzk-bin.. ([178.197.223.109])
        by smtp.gmail.com with ESMTPSA id d20-20020a056402001400b0054b531907f8sm1643159edu.73.2023.12.01.05.53.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 Dec 2023 05:53:36 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
	Banajit Goswami <bgoswami@quicinc.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	alsa-devel@alsa-project.org,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH 2/2] ASoC: qcom: sc8280xp: Add support for SM8450 and SM8550
Date: Fri,  1 Dec 2023 14:53:32 +0100
Message-Id: <20231201135332.154017-2-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231201135332.154017-1-krzysztof.kozlowski@linaro.org>
References: <20231201135332.154017-1-krzysztof.kozlowski@linaro.org>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add compatibles for sound card on Qualcomm SM8450 and SM8550 boards.
The compatibles were already documented.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 sound/soc/qcom/sc8280xp.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/sound/soc/qcom/sc8280xp.c b/sound/soc/qcom/sc8280xp.c
index 7df28ecefd65..837356ac541f 100644
--- a/sound/soc/qcom/sc8280xp.c
+++ b/sound/soc/qcom/sc8280xp.c
@@ -138,6 +138,8 @@ static int sc8280xp_platform_probe(struct platform_device *pdev)
 
 static const struct of_device_id snd_sc8280xp_dt_match[] = {
 	{.compatible = "qcom,sc8280xp-sndcard", "sc8280xp"},
+	{.compatible = "qcom,sm8450-sndcard", "sm8450"},
+	{.compatible = "qcom,sm8550-sndcard", "sm8550"},
 	{}
 };
 
-- 
2.34.1

