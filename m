Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13EF62222BB
	for <linux-sound@vger.kernel.org>; Thu, 12 Jun 2025 07:49:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749714571; cv=none; b=MCFGmAXLsXtgrKBmp2MsPIFLsJUMjPP4pVz+uud2fCYKB4FXUBxnWa+84pMWPvVJrFO75vS7X/NxLZyWFOA7Z2/3XsAeB+YbkBp0hDV3eMTDL+B38ylCKOQGuq/fXb++jNjaI17ot6dYu+wedUXlXrVBO3m9j0pj7wCNuC1zH94=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749714571; c=relaxed/simple;
	bh=ulJwcQBy9dMgYWG+wUZv9LjO7oJNNwU+lvBcQcMNFb0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=LTprbeyJ2iZ9Go11INgeUne2P9UextwlCGrYyHEU8XcQfCXIiudj5zHRZHZTVOyoAkdpmkW067Xqsi6cau0HJeXUU5GCaxtWvoFrMJ6XKMDbKzEfyMROct9/zGgzRXLgJt+xOArAx67KU6+Sd1YlWbD3iQGYG2SP2DtjsRWDZas=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=kI2y8v4P; arc=none smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="kI2y8v4P"
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-235e1d710d8so8268265ad.1
        for <linux-sound@vger.kernel.org>; Thu, 12 Jun 2025 00:49:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1749714569; x=1750319369; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7XrR9Z799EQOitdhyIDhq08g/G4OghhPor0uKz260cg=;
        b=kI2y8v4Ptw5rXnR3ZiDliznPO1KWcegPU1dtOnbvcmkZqKy+v8Tt5ddGhahZP3xjPX
         zsJYZjhRDcF5XWpXNhX/uaIjUV3zmvzJENNKl3ThwQTv413VhZ7yOhLLNflC00S209az
         co2En4gSZPBj9Cbva8tYx8Cfr4qFFyvxjZqkw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749714569; x=1750319369;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7XrR9Z799EQOitdhyIDhq08g/G4OghhPor0uKz260cg=;
        b=YaFaLT0Jh5DovvDR9EF52yfa5PWEgpm0cbQF3en3o7O7mua5znIgxTdUfD9q2HdJC6
         eUm9xPYY6D5IJzvV4mFYQQxBZ8bDwGuWsQxn4P/hOt3nb9Fkq/jaJajC5AVb4rMzTkmt
         HItkGsUtvoNVuSOJqfulfoXeF4JZuWruB8JKIU0XKtq5yrKd2Xw6kIjOrpefTPs7AH3D
         hJHGELR2OpKzdFuUAMSV/c4aAfOnU+IWswClqmPyJrD74sEJfj2fo9+fx5AQR5w7PXVl
         eElPZ/CEHUfD6hTiGbBqqGdrEie6j6prLeLulsOLpSXa4LRUkNR1q4AmLwYZwIBPSj83
         9y7Q==
X-Forwarded-Encrypted: i=1; AJvYcCU/7BpvEiaXGUqE6cgLWijCcLpcScQ2lCdMKu2iPGCdYAhDAEKDfPaDyVa2c85Pga63BrvOZ0bTbDvKQQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YzATcOeySyz9XPJhoqr6h234jQkSQyA6CZWkcUg7cZSjCuBBQK5
	n3+9t9Se9Tyt3o1FaCnWJiIPSu0BUdKtKNwOsqFfiZVZRLaAXTrjP+KWZxmthy65CQ==
X-Gm-Gg: ASbGncsAe3erSWkZrjgphHsL56PV1rsfB2CwcqKeqSgCzqNMfw9kPOOPpyCmu9HquZr
	+tC0fCHXB2PCTxeK/Fz9z1AbdOdz3/q+CgHLeViXB7UZ5oHZVlPOjYe/d+9lmJRNbdrO46qoSjD
	WzpA4N+PWWjpi1OegRX7ufQi7hAfMDRnekvU+wrV9j+XCHPDA81gbH5mZ8fgZYkk0Uxex3ZPqgi
	kfMrrBqwIXaT86ecBqqppIo8fg1y/FZiJ6s1Rl9knbTPvw8DLyoLdPBp3FvIEb5e4pvWbw6GakS
	BIZ3c6PKDaYVnNbvfH/5gj7IBX/HtU9a/W3HMLkv9vKlGorBK0yvnTHxGZK77H94NMKOI2DOK+E
	EtW3Nlf3THncWow==
X-Google-Smtp-Source: AGHT+IFE5DvvPsxXV+bi1JEfMtSwm9K9UZ18IP94fohAyoCbLtffwhmgBBALXCfno10M7kxbt6Y0fw==
X-Received: by 2002:a17:902:d54a:b0:233:ab04:27a with SMTP id d9443c01a7336-23641b3fa11mr102085905ad.53.1749714569502;
        Thu, 12 Jun 2025 00:49:29 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2401:fa00:1:10:5b9:e73a:2e58:5a47])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2364e63d42esm7893295ad.74.2025.06.12.00.49.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Jun 2025 00:49:29 -0700 (PDT)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jiaxin Yu <jiaxin.yu@mediatek.com>,
	linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 5/9] ASoC: dt-bindings: mt8192-afe-pcm: Allow specifying reserved memory region
Date: Thu, 12 Jun 2025 15:48:56 +0800
Message-ID: <20250612074901.4023253-6-wenst@chromium.org>
X-Mailer: git-send-email 2.50.0.rc1.591.g9c95f17f64-goog
In-Reply-To: <20250612074901.4023253-1-wenst@chromium.org>
References: <20250612074901.4023253-1-wenst@chromium.org>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

It is desirable to reserve memory for the audio frontend.

Allow the "memory-region" property, to be used to point to a reserved
memory region.

Acked-by: Rob Herring (Arm) <robh@kernel.org>
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
 Documentation/devicetree/bindings/sound/mt8192-afe-pcm.yaml | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/sound/mt8192-afe-pcm.yaml b/Documentation/devicetree/bindings/sound/mt8192-afe-pcm.yaml
index 064ef172bef4..8ddf49b0040d 100644
--- a/Documentation/devicetree/bindings/sound/mt8192-afe-pcm.yaml
+++ b/Documentation/devicetree/bindings/sound/mt8192-afe-pcm.yaml
@@ -23,6 +23,10 @@ properties:
   reset-names:
     const: audiosys
 
+  memory-region:
+    description: memory region for audio DMA buffers
+    maxItems: 1
+
   mediatek,apmixedsys:
     $ref: /schemas/types.yaml#/definitions/phandle
     description: The phandle of the mediatek apmixedsys controller
@@ -95,6 +99,7 @@ examples:
                       "aud_dac_predis_clk",
                       "aud_infra_clk",
                       "aud_infra_26m_clk";
+        memory-region = <&afe_dma_mem>;
     };
 
 ...
-- 
2.50.0.rc1.591.g9c95f17f64-goog

