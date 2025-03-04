Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49727204F6A
	for <linux-sound@vger.kernel.org>; Tue,  4 Mar 2025 10:38:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741084699; cv=none; b=ldlI5tzb9vKCdz6ItydSEJubq59ih2jNM2qGLoMdntEwp0IZDgmuccWw3TqYkWSEdm8Xxf8P0iFXkb5gndDNTt2gpej+0F0bqMbfru/biva9xl6RHE8LLGRAa1RmSFb+pY8pyh2gYHRCHWiB6/ZFbd9u8elEHU0z4CuYHVA0TKg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741084699; c=relaxed/simple;
	bh=bQKkwDg66kSktLEPRMbXRZs1JHN1GixPZhKMmLhibFs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=SOK19YEdylFAo5qgbcvyi2bLJQfnEfTlBu48C00G3GLBfmUwuGVNlxM7fRcqogB62aOr40Rw3NnxBaGDJHjL8DSS0NeOupHn4uawsaJaUWqk9EexFhGMPZm/e3WQaz2FdLt3QrJGeD3gBtHH2aJwC0++bNJENbwgC0STYWflJMg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ObKoSlBm; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ObKoSlBm"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-43938828d02so6469565e9.1
        for <linux-sound@vger.kernel.org>; Tue, 04 Mar 2025 02:38:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741084693; x=1741689493; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=m4c6wKYsvgnAeVjnxoSb9zpE19mfz0UUs/D4oCTMhK4=;
        b=ObKoSlBms0pIvvfRY54fp97O2009ia9A0yma70iqCh5v3vb0VqogmZwSJRGh1/7TOI
         aCrKNo9EgaFNYWleBw7oBoHImTilOcHn2QYKj49I5nigrCz0zCpzvjEQy8JMWfBz2k/t
         jJFDHkX3QDDMkjWQTiNutBRsqGbOus6VhBDMK2D8/uUvw2GzrJI3h9Hf1oYMw4sgS3cz
         PIj25qJHahjvnxTghwtRaAewJAyINx3rKZDXF8zhKjnc+bt9zVXQ8pQr0AIYsICjVca9
         ubGNLGrjUPVn/wzXyRIkdYD04fImTi9axg3MoBzPGLYqNYXWFuiw+04/jzIwcN3O/zoV
         rouQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741084693; x=1741689493;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=m4c6wKYsvgnAeVjnxoSb9zpE19mfz0UUs/D4oCTMhK4=;
        b=MhF6uIeQm02wOjQJ3gKDvrv5LCf6+5GOc/22mQ2yCCQUnSz8tSBdPo9E6DjKxFXUEM
         KZfNeJInt6dsk+o3KPVjOXrN2zp7P+W6EPkJ0SRlgd8vRnA9kIbuDyQu4P9DjkhAk9D3
         AfD2sV+29KHULuI9hSOhB05Gbd4/D3QeQrzej/iXOhUjQWekvTAYhFuYELZD0lM0YXYH
         K+1+CzARabd6I8cqKo4sogBPyPx2NgOO9ElRvBfZ8OtJj4bGZPRgHW/ls0+Wq09GcaHf
         qjsfPYsfQqGAgmITVFkf8ep3NqX1dYZaU8DOQJs3O8XUQ3isNkI3wzoY3kabLryTozW6
         gYng==
X-Forwarded-Encrypted: i=1; AJvYcCVdbamw62DlPFmLbMO18/uQIr4OgF546nvqgsiFGjBBBmB4evCT5GjUcnbVrD00tUOidUDT+N4nBbelxQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YytMHdQaV524daHLo5YmI9J0L5Qjrc45LQ47df0tSydGbGuIpNf
	AgkE36Fp/QyLdkpJTwBh9NCv1yUJiTvjDmS9eFNBD5QG79PhmT1hMCddr7sFPLqDr+3WKP7NU3g
	LLQM=
X-Gm-Gg: ASbGncu3mOrBGpSx5CovUrBcEc3K6g8x/qjet3pYloWRgJ0nytogNKY+lP38HAWyDyq
	tJHrj1yJQVALmNMXbKdwejGt9b2ce6cgfHHGl1ygYVIu/9XbH6a+eU/2ia8Vgn23zF7s8n1BpRh
	es8WGqFw3KCNQxe4yt+soWcGoLA++h3hMTllZikHLTDhWKes/hV2CH+GY9o1CNSr6knk+gVKjP1
	gUUi1uOlhDVZIYTnTuCxA9gzP2/f0F5+MmVh8fTuiOn2FtJ+yKbrrx7QkLv/xTEVerR7AInOYF1
	MZsYv0LjXuOSq8LqQ88+hSviRzVZA5u3oNCm97oRuhs/qazaq/rr39+8apw=
X-Google-Smtp-Source: AGHT+IH2p/EmPnfRVQkkOTi7SSiFvE6P2sYVBO3i3/SpzlZxDLh1MnVA8qE4Hr5Fj8Vaxg0QgloJwA==
X-Received: by 2002:a05:600c:4c89:b0:43b:c0fa:f9c4 with SMTP id 5b1f17b1804b1-43bc0fafdbemr23862335e9.4.1741084693497;
        Tue, 04 Mar 2025 02:38:13 -0800 (PST)
Received: from krzk-bin.. ([178.197.206.225])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43b694524c6sm198574825e9.0.2025.03.04.02.38.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Mar 2025 02:38:12 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	David Yang <yangxiaohua@everest-semi.com>,
	linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH 2/2] ASoC: dt-bindings: everest,es8328: Require reg property
Date: Tue,  4 Mar 2025 11:38:08 +0100
Message-ID: <20250304103808.75236-2-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250304103808.75236-1-krzysztof.kozlowski@linaro.org>
References: <20250304103808.75236-1-krzysztof.kozlowski@linaro.org>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

ES8328 and ES8388 codecs are I2C or SPI devices, thus they are
addressable on their bus and 'reg' property should be always provided.
Requiring 'reg' is pretty close to redundant, because the I2C and SPI
controller/bus bindings require it already, but the convention is to
mention 'reg' also in the device schemas.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 Documentation/devicetree/bindings/sound/everest,es8328.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/sound/everest,es8328.yaml b/Documentation/devicetree/bindings/sound/everest,es8328.yaml
index 309c4d01db76..ddddd7b143ab 100644
--- a/Documentation/devicetree/bindings/sound/everest,es8328.yaml
+++ b/Documentation/devicetree/bindings/sound/everest,es8328.yaml
@@ -60,6 +60,7 @@ properties:
 
 required:
   - compatible
+  - reg
   - clocks
   - DVDD-supply
   - AVDD-supply
-- 
2.43.0

