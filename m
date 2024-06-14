Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CEF616E888
	for <linux-sound@vger.kernel.org>; Fri, 14 Jun 2024 16:24:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718382253; cv=none; b=mIvFFia31PvZLHc42aemb+0inO6XrM7uydSR7UdMPR3UfNHRQaPRZ1HtdxMTPWeWRTJ4gOXuqTkFM6HmM5LcCWcuoGhWsyDPd8klUHU/SysBAdRAuvDbjDJALsDUjPuHs2Px8iUkTkCsrmdDT0dGmbWXrfUAw8mkBB4Zae4D76Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718382253; c=relaxed/simple;
	bh=nDYX78s666lmvDzBJf45D8iEKOdkkaUkatUIYyWZVnU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=UglTxZabOEfpyxyk1CSGxPA3CXZTLWdVIQJGFVm8OE0CMd3iemGUCqL0fM49zHuxuH7cvs2WIqasrxw+vSPlrhmhhp9v9TmmOo5xFD2lc8L3BzxizfNOkxWAKK9ufWvcLnxzN5RbM5UTh/JgAz1SZMuzb1nbyeF9sk9p3dFVzTU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=y+jJ1BnK; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="y+jJ1BnK"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-42108856c33so21667275e9.1
        for <linux-sound@vger.kernel.org>; Fri, 14 Jun 2024 09:24:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1718382250; x=1718987050; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Ms3akv2NcjLsPvbUoYiATp1OV1bkvK609lQrIE0+ce0=;
        b=y+jJ1BnKfnJF8AHaqBP1aZydhd4SwBZLv+I6XpjQA3+NbsKHzDPNWUZzQoWTLoGC5i
         t0e2c0t2ZV7q7KMdiVsewmZMmDR3xFvJX9+++QhqteGZGZhZ9Z3/8RZ81OwAbn8TLFE+
         8HS8EMID49nBDcXI5BzlurRHmP4GutvbpCRBS9mpLgS1P5ZKrVE3vZa4Dp9WCifzBzi+
         k13kBIUI8CZA/Pgq4hnjyKZImE3aYgRiiUzHwGLOYvUknfvDLWo77zUUMJx1spdkEIST
         y1Uc9uvWP9xqEhGZ5II75yWSv5QLykSqaHr4Vglf2zjcxO2BI35fJBomSP5CmUEiAHzv
         LMbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718382250; x=1718987050;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Ms3akv2NcjLsPvbUoYiATp1OV1bkvK609lQrIE0+ce0=;
        b=iKlzOVPS1hoU5cmLxzSsTAF8OBda3ShpvFCnfSTsIrOLMrcOLfuy9r9qzW/RIhiMWe
         ajyxUlKo/MlEd3C6sMaWXfs+Wb21p6XZFfZEgjNDCILEUeSvjJQqonDAnxfclBYtLV2I
         aOMqPZdtrPGA6nTOx5ef4MM7UPZbp9iwMPive8SQla2XYL/0+ZwgdE2D1DUJr3uUCYIA
         o4Gw88Rf9J9zJmTqLG/IgfvzJTqzm3eGNjnQgNDW1dDTW5vJ00fMR5oX8cTxpjKKEZVU
         22b3Ak4iSwJ1SdZoyIRm9je54x9JvOk3pcNShAXYdSv3w7PASNnGI+jTZS+RpXdgje09
         STXQ==
X-Forwarded-Encrypted: i=1; AJvYcCUfUIPoZjHqa6aiOX0w6Oma9fA5hOq2xmuKhZ8bx6A8Np3/X8WckzgrknEt0mIM2t6MPVnR4DO6CE5BDMowtnFHc77s248sSw9N8f8=
X-Gm-Message-State: AOJu0YyhY+mx1PLvTtlcwzRUAdUrFR8/dI3hH6hAa8g/wnAOFisQZO6T
	tXazdYpba481hNARBwzL1o4JCDhVmfv3NR2NvhX7cIWwAzJyLYCOKpaMPoVeuQw=
X-Google-Smtp-Source: AGHT+IGubE2KBTAuJluvEZeX/JZ1C1o/BuDtJFqq9WxuCqZs7reywce3tZSwQNvzmAj/9g8N03KusQ==
X-Received: by 2002:a5d:4b4e:0:b0:360:872e:391a with SMTP id ffacd0b85a97d-360872e397fmr482102f8f.16.1718382249730;
        Fri, 14 Jun 2024 09:24:09 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:52eb:f6ff:feb3:451a])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-36074e0e5adsm4931165f8f.0.2024.06.14.09.24.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Jun 2024 09:24:09 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Fri, 14 Jun 2024 18:24:02 +0200
Subject: [PATCH RFC 2/3] ASoC: dt-bindings: amlogic,gx-sound-card: document
 clocks and clock-names
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240614-topic-amlogic-upstream-bindings-fixes-audio-snd-card-v1-2-9f57d9e01834@linaro.org>
References: <20240614-topic-amlogic-upstream-bindings-fixes-audio-snd-card-v1-0-9f57d9e01834@linaro.org>
In-Reply-To: <20240614-topic-amlogic-upstream-bindings-fixes-audio-snd-card-v1-0-9f57d9e01834@linaro.org>
To: Jerome Brunet <jbrunet@baylibre.com>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Kevin Hilman <khilman@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: alsa-devel@alsa-project.org, linux-sound@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
 Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1801;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=nDYX78s666lmvDzBJf45D8iEKOdkkaUkatUIYyWZVnU=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBmbG6lLfrAQbnERIchEIXh2IvUxxAmbWE6wnoxfpN0
 aW/iCjKJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCZmxupQAKCRB33NvayMhJ0a2hD/
 43Zo1fD1Wz3M0L4WUEK9GJMCkzoW9XuWapOWFR60gH6pkFJMo1Fi/AKl0lF2M5/nh543sZN5YPG6lU
 QN7x59WZJ/uyuH8LDSrv2TE+c3yYs9l0F8XIc18gxVZpQAANDFPEdn+LIN71aG8QdVIbPXmMkS/Alt
 Ytftz2OGJ2/kbcNasK1Quv2oD42dTOx0oJ3KxwXyUgmM4Y/t6vDISq87aT0glCnR1qIir2LYeYOucV
 UYqY8hLOJ8nPXRY1ps1rAPemUikvFU043nuWhd0riAGvQ6XL9GR95qLYFBHYrwNYpunLzCp8MVfWvW
 qY5XgJD5ityLHxy17MLOXR3tm8j7yoTLXyfgfKO2/draeksgj+hSQsP0ADZpp8G1YdSo3NoOkkmJv5
 1Gtx8nC5gK4fQeTcMfEZe7WRLlzHPTNb5TODXzYt2kwTHlfqaGS3IQh5I/7XzJzliH9QjPR1Wnj30H
 ebu3jhZyWdvRDiY/0SgaI3IJibtkvjlhkj90PTQMc7tLDyUW9hMMkfkBQrBNvkoEe8wPLOBhJfZ7ZC
 ZM37Bm33KJ84qj6+9xo0+by9yWwDYhKjy2etn4ZxjdMhWu60TJVEt/Ne0uiHLe21aM3L1XvLQlOurc
 SWXEv60anpe89DxwdaWuQ80YQK3PTIJPgWisYRpS/dEm2QXbR6zZaZqI2RsQ==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE

The sound card design is based on 3 reference PLL frequencies that
are the root of all clock rates calculations.

Today, those 3 frequencies are specified in DT via assigned-clocks,
because they correspond to the basic audio use-case.

It makes no sense to setup clock rates for a sound card without
referencing the clocks for the sound card, mainly because at
some point more complex audio use cases will be supported
and those root rates would need to change.

To solve this situation, let's legitimize the presence of assigned-clocks
in the sound card by documenting those clocks, as it describes a true
dependency of the sound card and paths the way of more complex
audio uses-cases involving those root frequencies.

Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 .../devicetree/bindings/sound/amlogic,gx-sound-card.yaml     | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/Documentation/devicetree/bindings/sound/amlogic,gx-sound-card.yaml b/Documentation/devicetree/bindings/sound/amlogic,gx-sound-card.yaml
index 0ecdaf7190e9..d29dbca9ccc9 100644
--- a/Documentation/devicetree/bindings/sound/amlogic,gx-sound-card.yaml
+++ b/Documentation/devicetree/bindings/sound/amlogic,gx-sound-card.yaml
@@ -27,6 +27,18 @@ properties:
       A list off component DAPM widget. Each entry is a pair of strings,
       the first being the widget type, the second being the widget name
 
+  clocks:
+    maxItems: 3
+    description:
+      Base PLL clocks of audio susbsytem, used to configure base clock
+      frequencies for different audio use-cases.
+
+  clock-names:
+    items:
+      - const: mpll0
+      - const: mpll1
+      - const: mpll2
+
 patternProperties:
   "^dai-link-[0-9]+$":
     type: object

-- 
2.34.1

