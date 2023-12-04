Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="FG22JHgT"
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com [IPv6:2a00:1450:4864:20::633])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F36C0100
	for <linux-sound@vger.kernel.org>; Mon,  4 Dec 2023 02:01:25 -0800 (PST)
Received: by mail-ej1-x633.google.com with SMTP id a640c23a62f3a-a06e59384b6so583812666b.1
        for <linux-sound@vger.kernel.org>; Mon, 04 Dec 2023 02:01:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1701684084; x=1702288884; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5gcpWgbYxTJM4cDAhuGusGlvYgR0Ejalgkc6iMWP0mY=;
        b=FG22JHgTG56LLk+w8LIVub6yVamtIsam+1oKG9ylMA91dBQxWyOq91GuDLokRa+Y6q
         CP0jdSRAeIl6ONcbmjuS4J5kacFHrBeujbjMOO7SATzv4Loi6YDwoEQU0YW7W43OSPi+
         Hm+B2jni6kzHJMpW4y7vHY6fN4Qm5Yj2uBxt5GT/eHRQXeSwfHBBfvDrn1hX0naFWcJX
         Ql9gbjHMJHpli3z7v8vK25iJKKTalkCEs/Ibkw6eWkoQHdABwXaaM7N6Zg8M5TVw678b
         wyrafC12qtAvZNiXAmn90MUUo/TC8Vp2dXjOydaanwIiWieAMW2hTz0MfGu3nEdb0CHw
         djRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701684084; x=1702288884;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5gcpWgbYxTJM4cDAhuGusGlvYgR0Ejalgkc6iMWP0mY=;
        b=RPTm9OpYHjea0d87PfJug5ihNtf+j1mcQy6RTCLmoFnSlFi5caqa2ORtsiD6lz99dz
         rLzETCif2QOzI6vbyBNGu029xOJ4bRMmuaTzOi5s0CIVkJ+3EQE8+t6cBBAR2xK3ga5T
         zy+7LYghSHlxioagQfCLqW+t2ruG6Z05GznXVJSrOd9kaR6tBnkkPL+y4ge0977op/2l
         oTj0BFcnUdCWNzle0iHGJQEBxy6QzK9CXGCqH7Z7IybkaxA9Ke6Xl8LbsixycjtIn9D5
         ZRPZxtmkugJFJHhiHZHNoZTLdfBSfMNx36T/2LrTwKEoTES+bz19+txC6Y2m9c0xhhXt
         qF4Q==
X-Gm-Message-State: AOJu0Yy0v2k8dScS+IJF9Fr2e3jZ42PnB8EADPK/GD3W5zGv1NtJ+KwI
	og1woRWEu7V7GIO3rf+3bZZEdA==
X-Google-Smtp-Source: AGHT+IGIU3jORR6B0x3FGVJgT+5hu64J0FQmCPUvyJ3aNFTkxr8CSXX7InvfFNXJYlFuqoPmGBKcKQ==
X-Received: by 2002:a17:906:3f57:b0:a1b:7313:504f with SMTP id f23-20020a1709063f5700b00a1b7313504fmr701721ejj.101.1701684084486;
        Mon, 04 Dec 2023 02:01:24 -0800 (PST)
Received: from krzk-bin.. ([178.197.223.109])
        by smtp.gmail.com with ESMTPSA id pj21-20020a170906d79500b00a188fe9563esm5065572ejb.131.2023.12.04.02.01.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Dec 2023 02:01:24 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
	Banajit Goswami <bgoswami@quicinc.com>,
	Andy Gross <agross@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	alsa-devel@alsa-project.org,
	linux-arm-msm@vger.kernel.org,
	linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH 2/2] ASoC: dt-bindings: qcom,sm8250: Add X1E80100 sound card
Date: Mon,  4 Dec 2023 11:01:16 +0100
Message-Id: <20231204100116.211898-2-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231204100116.211898-1-krzysztof.kozlowski@linaro.org>
References: <20231204100116.211898-1-krzysztof.kozlowski@linaro.org>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Document bindings for the Qualcomm X1E80100 SoC sound card.  The
bindings are the same as for other newer Qualcomm ADSP sound cards, thus
keep them in existing qcom,sm8250.yaml file, even though Linux driver is
separate.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 Documentation/devicetree/bindings/sound/qcom,sm8250.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/sound/qcom,sm8250.yaml b/Documentation/devicetree/bindings/sound/qcom,sm8250.yaml
index ec641fa2cd4b..4673fdffe312 100644
--- a/Documentation/devicetree/bindings/sound/qcom,sm8250.yaml
+++ b/Documentation/devicetree/bindings/sound/qcom,sm8250.yaml
@@ -34,6 +34,7 @@ properties:
           - qcom,sdm845-sndcard
           - qcom,sm8250-sndcard
           - qcom,sm8450-sndcard
+          - qcom,x1e80100-sndcard
 
   audio-routing:
     $ref: /schemas/types.yaml#/definitions/non-unique-string-array
-- 
2.34.1

