Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D70A5230BC0
	for <linux-sound@vger.kernel.org>; Thu, 24 Apr 2025 10:25:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745490339; cv=none; b=hpafzHtAdmK7GH0Q2pQun93pKvjqfHdxE0dbpUJdXsOZLvQ3UraFU+DaIKI6VPU+u7HobL/FVkLO4vIJo2KBAZrtOrKnIS0fspNcJ2HAeiyXoFCYzkIPoYl7YSdeAXJdtJvoSAL+tIB402kZEpIZPb89dsKT7r6qo2NILgzKxAA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745490339; c=relaxed/simple;
	bh=SddUH/xqsKCkWdaBB0Rh8l7Fup5QKZ1bZQvIU0QOXGg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Nsa7zVawYF7KyuLYRtPK5rndYtbZJcg0+7vfM9/hxitATNkraRDLIgq1xdsEsznw9TlWSUgUU7fBn8fuYNu5/KNXMr0C9O3ZWx4P7U6HbB6XSv7xeB2fMnu0jvpSiKeQi0TNV7drZwoY4DRwKtH2hYwvCrP5ur2cIMbQThRyRdc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=HAavX8b+; arc=none smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="HAavX8b+"
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-2255003f4c6so8511435ad.0
        for <linux-sound@vger.kernel.org>; Thu, 24 Apr 2025 03:25:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1745490336; x=1746095136; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kPI27XPPYRRK0xWqV54WIVswQxSYJsBtgx975xO40PU=;
        b=HAavX8b+aOd3i4wLFnVYNA/6M4S2WVEZFhdlv/5nEoCrC1wL8Ov+0iw9VcfKiFl4uT
         Hj2i1YhGh0CXlxZzEi1BbQFbxdd8bNtkIB0TZVjTWDKxcPhzCZAVeCvT5p68c4xelxbK
         oJ7vw3D4/ZV5JP0B2DIVTMVFjVtpzcBev6ifc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745490336; x=1746095136;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kPI27XPPYRRK0xWqV54WIVswQxSYJsBtgx975xO40PU=;
        b=dN0bh9wIkhrhfIxdFls723JCOVt+monC85hpLkD/I6ywqYdA+ZlQ3ZpxD0hBNSfO4e
         qL9/D65WWxctXuw/3Iq90soEBXXNDvt3LB0Vk9cvEELtTUEnXyqV6iRpPRlmqxrOKKRX
         WLLbWWabPxRZB9tHe+uL5zuRSpBIfylvKMp4l9Tpi5Lm75YGOkbCKx6sQFHZITBFz0Ca
         Qf53Hl+rwD/S5WkF5sQ+AIkfVC4vEk5qGIW2gUHuLajh8UTMcEuSKSeJM+R+X3rCIGjy
         DhOzKVV3yaTq5GDnjqX2XLCe710p+6meecNVHWJp6N9HvDTXKpb6lYmYdGNyK5kTCpQx
         ilcQ==
X-Forwarded-Encrypted: i=1; AJvYcCXsDRLTnCwobvz/3CN0Fa6DtfkO5E1y+t1l8bF5xwf0SC8fRfznDjHFmC/e+2VvZWfaMfAPD7z35+AaBQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YwjfDjbTfr1bA6wVBPxsYRBQGvsvW8qh0/GR+R5cnvMHtImOwEx
	pscg2188kZQgtprr39yPg/AbbWfiQ6tl1brzkQTdjH3Zz8MferfV24jws9LbcQ==
X-Gm-Gg: ASbGncuS4+DOBiCUM3bOisQUYNIX6YRdoZqc2DDnUD5gbtCSvW9iQKWjxJnz6OHkHkb
	Zgeg80sKRFBmxyJaKI/6mPsweDLSZNy6k1Obud2sxN63xGmKPkd4M9ze+CJwtW3wqJU3cOKQzf2
	AP7Hg46UOy8I8XbVHR1scbcMCwbdnht09WGje0mzhA9uHD0mx84NsTwWxLRsb83PAf9ak2UtCP5
	uy9SiB+kxxFW60b0mPyXwRdRWSm6nEDOBRavm2SGa0YmPcFl1df53ntQW8Fi37ieKEImJmE7GnF
	sPX7YV9R87fgoILGgu1gy+oxgfDx+SduYTrPznAKl5JOdV4gFSjUKd6c7g==
X-Google-Smtp-Source: AGHT+IFl3f1jhKy5TreVsC3n6Tp6f11IsZEiWWY1AzKzoKnuU1FfQGTVtrsgZqmOG5uoeu4Ajq1oKw==
X-Received: by 2002:a17:903:28c:b0:224:76f:9e4a with SMTP id d9443c01a7336-22db3c0c147mr26537035ad.14.1745490335985;
        Thu, 24 Apr 2025 03:25:35 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2401:fa00:1:10:fa13:e633:684b:257])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22db4dda40fsm9680305ad.104.2025.04.24.03.25.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Apr 2025 03:25:35 -0700 (PDT)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Jiaxin Yu <jiaxin.yu@mediatek.com>,
	linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 05/13] ASoC: dt-bindings: mt8192-afe-pcm: Allow specifying reserved memory region
Date: Thu, 24 Apr 2025 18:24:59 +0800
Message-ID: <20250424102509.1083185-6-wenst@chromium.org>
X-Mailer: git-send-email 2.49.0.805.g082f7c87e0-goog
In-Reply-To: <20250424102509.1083185-1-wenst@chromium.org>
References: <20250424102509.1083185-1-wenst@chromium.org>
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
2.49.0.805.g082f7c87e0-goog

