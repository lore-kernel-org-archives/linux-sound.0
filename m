Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 822B240EB8E
	for <linux-sound@vger.kernel.org>; Tue, 28 Jul 2026 08:46:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785228416; cv=none; b=ZsobA81tluehfydPCWTGX3LnnBu5hiGp6/84ROlpT/8U1Q0sAHpXIGHYV2BxYxMFBh4X4I1DBzQbSS68qAZ+VcJOeFRnmrtLhHsQXAS8OtIJH0NDMVMfV06rtnYHiELlz9yOLs0FANahKsmyaMa8OQRQ8SF2AtSwws/7IcSoXVU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785228416; c=relaxed/simple;
	bh=64LksHE57zQ59yaAnFWACzwMnsWqJv/u11tLSoS5Bmg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=lsko7A/F1dlU3WunaUVWMxcMiaRnIkIXUZ1+Gl5isbyru7oN/4kurVaxYRfORkds3mw7kex0BbkzpCn8BMl7apcm7g8c97O9hnUviPY3glHYnslWUssf0Qm1FT+D3ataDV+Y4SdmELyqim7rGUJ7PBR/f5Wg2pOrmAIXny7GFwE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Rogeywlz; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Rogeywlz"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-49545ba3d4eso20654285e9.3
        for <linux-sound@vger.kernel.org>; Tue, 28 Jul 2026 01:46:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1785228413; x=1785833213; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Z2ehHA2W929S4EjVW2VVMOxqZvmr0eF0aGzWm5jM38A=;
        b=Rogeywlzm9+7qBioS/5NqPBEOLrTY7V7QSDFzc4wsfdxKoWDE4s4W/8/mJnUzqsZ4E
         zfWYz8i4MvMslP47ldwsj3p8oZJS/5iZ8dKJ8GfSeCxcBhl7/YAWN8EIQiOi9DmcVgKC
         ASanP2OX8M7ov+rWcmSr8Y8J6GQ2QEWRA1J2z2IdIE3OY0146rmN44H2KQ89JACV0zhH
         zOczqP6sAKh+7fIyq5pStKF14hlBHMRy2KLVT1qOtGHO1jKKTRtXjiYEeVqV/hRvl5+o
         /a/Lhg2R/VXN9rZbbtj4qrvBhhiYdOy+SxmtjVm5nciFLEF5hfzd/qA+s9/xfu1GbSz1
         7jug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785228413; x=1785833213;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Z2ehHA2W929S4EjVW2VVMOxqZvmr0eF0aGzWm5jM38A=;
        b=JrMea3M0b3CrFsCr7baSJVNWeRdKlQcoN39XWuq26nsyh2SBLdHwNy9wm81ge+4QtP
         kYBjPhKfoXshVg9/xj6NR89UJ0/nYKSOd2vjqbEdWr91YgItFubtgXpEfjnqRjK1r1j5
         RUYfGctBNtd+Xb4Qn0oEyIwVlg8043Zx6IFb8hS/ZdiTZqhqU3itO0uPMN+8oreme3bL
         teltWVsN+Ww33N6n0qIOgAd+loBQb0LvT1kESFCPh0Z1ReclWq0H0eI6hgQrkx1chm8x
         i7SYsrElLSc4F/SIfiZS8q0ZZQ8Z9iXpxN93UwrEBvYSLq8FDQsMpT4v4AxQnfinM2CR
         7Qog==
X-Forwarded-Encrypted: i=1; AHgh+RosMt5BmlYJRdOzmR7FN/1u+2h1ayi+JVudFP1hoNXkdCnP/m68r7BB4F7gQYfqjHKuSZoD0CFtA/AvKw==@vger.kernel.org
X-Gm-Message-State: AOJu0YzkGRCPwH6sSlQuxLUDqLS3tJR0ERmZQrMAJNca6w1uRCpBJR7s
	tEMVWEL0R5T8KxdeMxtmp/I6C34vwWFA6lxjBBllfcOelsPeXE7cHggGE+V1Bs3TZEM=
X-Gm-Gg: AR+sD10xRy/7tiJZVBZjQ510FrAL/Tsxv7E6ZXHv5PssZRvSW1Y7GPXIqvYlZyCpJ9P
	OQWygBragOy28b7npqv/2pG2q3B0Au+UbgpsWtyLCZGINHjnyh195Ht92YRNQt/i/3b4mNvxLlE
	LI0BmHW8415Nx6Ww8xHmYIX8WhAcdpPMDVNKHN/Wv8ONKPfAPP/7c0k+PlVEWadW7zrKa98GZzY
	Do2lu52nLCX8WfUNo/ngmga+qLwxNW9qKv3pkwPl75kQqESWnhGMMaMF5nFjR+4+5zrz2yNHKd6
	t784AR6R36n7LEN65jzHp7kAOBEovlicqvCZ0MX4QBrPPYVqt35xvPkIkbUpLC02KdTDKxOjLd0
	EGjOZ1FFts7Qatd8ntFaMsEa3jLw+/ueNT+SOr4Of5dhjVA/iOtp5STNNZxFJT76HmU8lvq9PeF
	0dsCm4FaKftfIYPh/LZb4w86k=
X-Received: by 2002:a05:600c:5291:b0:493:c535:3934 with SMTP id 5b1f17b1804b1-496c6592c7amr12910135e9.36.1785228412564;
        Tue, 28 Jul 2026 01:46:52 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:106d:1080:8261:5fff:fe11:bdda])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-496c4632263sm64658175e9.15.2026.07.28.01.46.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Jul 2026 01:46:52 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Tue, 28 Jul 2026 10:46:44 +0200
Subject: [PATCH v3 2/3] ASoC: dt-bindings: qcom,sm8250: Add Ayaneo Pocket
 S2 sound card
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260728-topic-sm8650-ayaneo-pocket-s2-wsa2-fix-v3-2-b29f44720178@linaro.org>
References: <20260728-topic-sm8650-ayaneo-pocket-s2-wsa2-fix-v3-0-b29f44720178@linaro.org>
In-Reply-To: <20260728-topic-sm8650-ayaneo-pocket-s2-wsa2-fix-v3-0-b29f44720178@linaro.org>
To: Srinivas Kandagatla <srini@kernel.org>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: kancy2333@outlook.com, linux-sound@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, Neil Armstrong <neil.armstrong@linaro.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=981;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=64LksHE57zQ59yaAnFWACzwMnsWqJv/u11tLSoS5Bmg=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBqaGx5ehiYh97tVm5Fwv2QY2xNcVdo5ILxbrrf3SIS
 JMPdb1OJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCamhseQAKCRB33NvayMhJ0fQVD/
 95C0r7mQ0bv57c+6QnN6rXOUVGcQEY4SSxriI+0LmAk0RB5L0JMyNa/bZajH1ou5lZ29xbpo8EVadu
 WQCphUOYviRlZsEEwkDKYAkTK8n7XCyGudoCOdhR/zjyAF3Ag/WM4rTQLL+k/DMxALQhwhyU1euTcL
 s6YDGjslSelgDww9+y8vzFqfl1Jo8nTKLYrN3zcyEU1kylrBkWn93falxazC0rvWb90yxco7rNJX7+
 xbS21bb/E1Ry9L6ip+EfTRYgu/+gLMQMF2V+1oegzU9wiH75VywB3zSVc0OMBlORtqo1Fd72dSYG2v
 qbemi1W26Euwo34ala7qreAgWXu8qlNWhV7g3l4EujVT58+FVmUrmFaUf73TLlY1Db8ekPc4VV5K1N
 l1kP1IvXec39kOv17pvb5oOUDnmk3oEB/YQ2pTaSkAQ/L/dVJAf6OyzPSiU424aHT0bP+F3BCAzWXT
 PJOZFDF538+Beug3rRCzG0zEgBM3+Drq+k7g9xVjV8EXiuKx+EWp0+h9D+eyzInplbDqdSlICZjuAh
 qjCcG+ZybIkRlvSAASUCpY1FxazUDewbo2kiKq0NjI8qtVltSmKfgFU1ZCyPaQyAP3GgIijy75FZ05
 qrfzHdWOFnMWXdgR77DhCEsIDkAmFuUqBvfmpt4v9D0c5blWMOFqDmspyN7w==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE

Document the bindings for the sound card on the Ayaneo Pocket S2
which uses the special speaker connection incompatible with
the default SM8650 sound card.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 Documentation/devicetree/bindings/sound/qcom,sm8250.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/sound/qcom,sm8250.yaml b/Documentation/devicetree/bindings/sound/qcom,sm8250.yaml
index bd5f5a6268a3..0998b2abd8bb 100644
--- a/Documentation/devicetree/bindings/sound/qcom,sm8250.yaml
+++ b/Documentation/devicetree/bindings/sound/qcom,sm8250.yaml
@@ -31,6 +31,7 @@ properties:
               - qcom,sm8750-sndcard
           - const: qcom,sm8450-sndcard
       - enum:
+          - ayaneo,pocket-s2-sndcard
           - fairphone,fp4-sndcard
           - fairphone,fp5-sndcard
           - qcom,apq8096-sndcard

-- 
2.34.1

