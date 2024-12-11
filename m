Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A42A29A1
	for <linux-sound@vger.kernel.org>; Wed, 11 Dec 2024 03:54:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733889249; cv=none; b=ffIEK7hqvran3HrYIPKyhs54PanzOwmdvKaK5x/menaYj5QRdvLC6fY4Y8WZ2XGTkKw2PhorF/3y3MOejNk2AEnx58z5QMkn5ju4XsvHBkXfRkW8unETVCQTKBr/pJnNG99thsXsCJXyEx5L2pBe/jG1yXy/TavIJswK5lu38U8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733889249; c=relaxed/simple;
	bh=I3XtbIlImj1IOMYUD+gy6ZO5yDL5zDoJrK625xtEw6Q=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=TwrhSeqPPZPlro/bEWwgzrgOMYw2F+3T8xwYEg+n3nCMqeBdH2n5IBOhWPIUfXeXA6HcnycKkX5KmDWpFjboArpqojI1uOQvfduQ4zGaPTSm/6jUn8QpBhlMPMbSe0ucVVAL40RupdRmBPZpFvNmouGoe4pbfZHosKdvZi/etjc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=E5dqKNY5; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="E5dqKNY5"
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-2165cb60719so21995195ad.0
        for <linux-sound@vger.kernel.org>; Tue, 10 Dec 2024 19:54:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1733889247; x=1734494047; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Hj85AA7d7cYe2L08PxTXiU5BhO3GZ67bD+np6NHRbRI=;
        b=E5dqKNY5EE0KuHd+RgOe7PVkh2IysOtTdbiZkR0Tml82zI7A3wShmraH/Ey0ssibNI
         RYsHinnNdCOkt2Ypliev/EmZBwbATaDZFckuJQbs5RrtmaOGWoLCNVehxzbCCaw97KWf
         yJV/CgkX1pF54VLndk0BYSTFkI3dV9dZDr8Lw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733889247; x=1734494047;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Hj85AA7d7cYe2L08PxTXiU5BhO3GZ67bD+np6NHRbRI=;
        b=KFCHwKN1QaCvpzKnvN58vzlhQYwVGly/Ca0v8er8dWWthc4pr9Z8KGv3NWkvNJK79T
         nfEWqkNLHr3GbrpNnuFxZwS4tkenbeXvPzi3IAcgp8gh6cYsXnQnBTKDSH/vmAg7AWek
         aslYRwLa/ZfQAJZkG510DJhd/8UhoFi7xZrU7taGVqU8GeR/oWpjqxCNBHOJxW0Ljis6
         hwausPSOvY9HZYuhRx6q2igxbYh4nyiqfK1R8DeWtK8/d0wMs0mdFzi9a780wk4INHtE
         YFrrTNu6dtUzGFMoODXceh32pSy9RNcmnXw+QanHaLauT4dosnMBu5DYr5Kb9/nII5Me
         JUrw==
X-Forwarded-Encrypted: i=1; AJvYcCUIC7Dv4PIWCZUTt2vVPpa+QrnUwpiyYc2D5jb5ZNNsq0F2yJhySQpCFZJht6lvnbnc87tZvo6PqFb7BA==@vger.kernel.org
X-Gm-Message-State: AOJu0Ywk/xXf78Zwnbx+pKGK3Xtx9sYpFu7zVBGO59AzCpsgP448Wmr4
	HdRUMhtzk7+A8w32NcAErC8vxoG/Js/HmGLp9WckAXSvIayHmktbpVc4M4Y4Mw==
X-Gm-Gg: ASbGnctLV9vxmPyffvO4QK6HSA9Eo3FTWBEG/y4LSVxOxoKGzxbvW1+c58EC/L3MjAt
	2e+8rY4OdMee2IKMlf+jBPRrlwIg3tvTxaV3QX+yBDLc3ygkiRr50aUFMTsHxGkF/zkaCyA+p8E
	T86qvpEOytCMwdRRAubG1XafMfbjuBYqxfI6jMZApvTV2lQqkUYYQ1BC1JnREicUSZPzrIDw6e/
	nqdD1wAljVKmjuCwCkdimNu9BsXMOZm7TSoY6amt1l2qHs9ko78n3zrbUOwCrY4DDKHxBWK
X-Google-Smtp-Source: AGHT+IFmL9D+O3T4O8t006Hn2rBO12sN8OA0ya8GF7SZU8FDufxRpciGgm+45zKRIGHZl+ZeYHa8mA==
X-Received: by 2002:a17:902:db04:b0:215:44fe:163e with SMTP id d9443c01a7336-21778397514mr27904715ad.1.1733889247375;
        Tue, 10 Dec 2024 19:54:07 -0800 (PST)
Received: from wenstp920.tpe.corp.google.com ([2401:fa00:1:10:4dfb:c0ae:6c93:d01e])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-215f8f3189asm97532965ad.248.2024.12.10.19.54.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Dec 2024 19:54:06 -0800 (PST)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Mark Brown <broonie@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Animesh Agarwal <animeshagarwal28@gmail.com>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
	linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Matthias Brugger <matthias.bgg@gmail.com>
Subject: [PATCH] ASoC: dt-bindings: realtek,rt5645: Fix CPVDD voltage comment
Date: Wed, 11 Dec 2024 11:54:02 +0800
Message-ID: <20241211035403.4157760-1-wenst@chromium.org>
X-Mailer: git-send-email 2.47.0.338.g60cca15819-goog
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Both the ALC5645 and ALC5650 datasheets specify a recommended voltage of
1.8V for CPVDD, not 3.5V.

Fix the comment.

Cc: Matthias Brugger <matthias.bgg@gmail.com>
Fixes: 26aa19174f0d ("ASoC: dt-bindings: rt5645: add suppliers")
Fixes: 83d43ab0a1cb ("ASoC: dt-bindings: realtek,rt5645: Convert to dtschema")
Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
 Documentation/devicetree/bindings/sound/realtek,rt5645.yaml | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/sound/realtek,rt5645.yaml b/Documentation/devicetree/bindings/sound/realtek,rt5645.yaml
index 13f09f1bc800..0a698798c22b 100644
--- a/Documentation/devicetree/bindings/sound/realtek,rt5645.yaml
+++ b/Documentation/devicetree/bindings/sound/realtek,rt5645.yaml
@@ -51,7 +51,7 @@ properties:
     description: Power supply for AVDD, providing 1.8V.
 
   cpvdd-supply:
-    description: Power supply for CPVDD, providing 3.5V.
+    description: Power supply for CPVDD, providing 1.8V.
 
   hp-detect-gpios:
     description: 
-- 
2.47.0.338.g60cca15819-goog

