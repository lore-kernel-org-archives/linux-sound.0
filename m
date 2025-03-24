Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B278A802
	for <linux-sound@vger.kernel.org>; Mon, 24 Mar 2025 12:51:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742820703; cv=none; b=oCnP2+OdrbSnA2+VRawV6vnrhHPlo4Xq4qgDpEv9/LVsT2/++xEMyCcXFYEvOLBo85PDzBQIAeMbjFZ6qP3WLXNWvgyG4IgtFDDNOXwMiPospNJPRcBEcOCVgx7IxJJXxzoAPCro3KSHArRf4qdxeEETQmzlDTsWZRAzVsdNrY8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742820703; c=relaxed/simple;
	bh=7kIvTq8/90tuJI0ossbD6JrK6jg28QkHXDUN+Mt1w5Q=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=YrubqiMOAjzcGyhfNNH1QCzBg1wB+0NAAnJ9eCY8xKmMEhEJLZJBV5y3yVSmLJOE4IEslK+ZkxZmsaiH5h61mmCE/9wOYfVHjt06h1a8WpALbvzMM74/20gSGn7fxZirS55zuvUwr107IzsfvAp2D1pic1Vv/iZlRTjk/aBHtok=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=h0UJEf2i; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="h0UJEf2i"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-43ceeb85ab2so1816515e9.0
        for <linux-sound@vger.kernel.org>; Mon, 24 Mar 2025 05:51:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1742820699; x=1743425499; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=HH2nVWiRSh3C8d+9des+5Ue4QF8h0ddGAB6W0heB+v0=;
        b=h0UJEf2inqoLg6VnD/svxPMEEL/6IX9rXkQ/wTS0rTLrzXlJWWCe4IqgDj/7wMyCMO
         VYHz87KNc6xZ2DzqUfYUOyqDPlwKBOWPqrzFUIIUDohxw74H4t+iwMjeaIdYls/f+CTn
         Tj6sLYhG8zewhMlQC794vUC38IS1+WCVPdwqKE1oMCVcUHu33XNuuYsUFbxr6b7CSHxJ
         DSnCbJHUpG4gEogMEgBR8WE0LsJXWNROADfsihlI38TyAsp6LyOol9GIGUSj/2ldFukp
         BWp+1fClEJHIafOtfI6lcAoKAcnLkp0S8mbxc9poL8h4EL3U4to1X2bdJRS2MijjBh2Y
         xYug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742820699; x=1743425499;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HH2nVWiRSh3C8d+9des+5Ue4QF8h0ddGAB6W0heB+v0=;
        b=kaIBIwz/bHa2Wudb9CY/5Yh2m8qZZovIR5TW6ZaJ6l+LUYCx0+/duO5rLCNN+wHQkN
         xNQZcYKC17eL3xoxc7xfpqOxPcAxGdlUg87wWQxbYdkAHFNnIunqINb9SmVcQ5figXhs
         6zjYk96LP4/PwiWDwcfOTuKdkXcDOymSayQwG6PDAaege61NAJHtW4pKhu8EO/Fbj0a1
         QhLDLCY6Uu1/nY5cM/azyRZFzGeZagro0bClhjH/U9cOxlvhL9ENEV063fk0d+FJKEm1
         n9GVONMeSy5r1+SjQD+0goNOvPqU1nCEHO6AobxlYaw7xx8nwmyzYTMgD/d15DQeaPVy
         qMtA==
X-Forwarded-Encrypted: i=1; AJvYcCXRljNWkRgD03yWpUJFMe6UolXdhKyIfdVc9HFvj3UHdP4nJI59c3s5wMOgEec8b3Vj7jNJIzUwZ39qlA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yyf+pZwrIwpqINOV3ASNYLf+THMzvQ+9Ig+kUA1e4q9mSI1XlFp
	I+ripzoTpz9PzrVE0AjYZs6ywgaRH9BDsiwdmDPgjM2jQAeV94K5r9d59J12MZU=
X-Gm-Gg: ASbGncvTPAAnOiGWvPtWE079gLH4CkhV59IoHcyDRF6ZKHNluNUFubReCP6YBgn/0+p
	ul72qrwbfbdoK0zGlKpw0lQLwOmr0O0zjhxWnlBnsGLBV7iwmL6BCGRf8TJE0HpGPhIX9jj45SQ
	QdKujjNsDtWqCRRVKVVcU5Sqf1AQs0jv3J9I3+NOqqlRkAEX4G/bwvcPTAkkcQCHjNiKog7Y9VU
	4gaGO8xSgIAamY8D8C+I95UAvdZbhAHlOEycWWalcQrqe2Z3VwcUX8FzXn9fA4kXBF0pZwQlYp9
	Rs4o8B3jNCE/hTRRegJbav6dH6PLF/kDWEFBN+0Rd5vEuOlJe2jvBduXzg==
X-Google-Smtp-Source: AGHT+IET4L7ay6BiqJ5c/HRaROSkcjTOjOcbxJ1/qWXG9QvpA45PLADqwGvdOQ4N9AD2IEKf1fUd2w==
X-Received: by 2002:a05:600c:3494:b0:43b:c825:6cde with SMTP id 5b1f17b1804b1-43d50a1d20bmr45138235e9.3.1742820699040;
        Mon, 24 Mar 2025 05:51:39 -0700 (PDT)
Received: from krzk-bin.. ([178.197.198.86])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43d43f32fb3sm171222655e9.2.2025.03.24.05.51.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Mar 2025 05:51:38 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Ryan Lee <ryans.lee@maximintegrated.com>,
	linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH] ASoC: dt-bindings: maxim,max98925: Fix include placement in DTS example
Date: Mon, 24 Mar 2025 13:51:31 +0100
Message-ID: <20250324125131.81867-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Coding style and common logic dictates that headers should not be
included in device nodes.  No functional impact.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 Documentation/devicetree/bindings/sound/maxim,max98925.yaml | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/sound/maxim,max98925.yaml b/Documentation/devicetree/bindings/sound/maxim,max98925.yaml
index 32fd86204a7a..121e8d2d44da 100644
--- a/Documentation/devicetree/bindings/sound/maxim,max98925.yaml
+++ b/Documentation/devicetree/bindings/sound/maxim,max98925.yaml
@@ -77,11 +77,11 @@ additionalProperties: false
 
 examples:
   - |
+    #include <dt-bindings/gpio/gpio.h>
     i2c {
         #address-cells = <1>;
         #size-cells = <0>;
 
-        #include <dt-bindings/gpio/gpio.h>
         audio-codec@3a {
             compatible = "maxim,max98927";
             reg = <0x3a>;
-- 
2.43.0

