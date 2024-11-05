Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A017D1CF5DF
	for <linux-sound@vger.kernel.org>; Tue,  5 Nov 2024 09:13:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730797982; cv=none; b=oWrZZt1CVSg49CbydFC4o+ZmWyEL/Ht5ydX7AwRihS7cgSp/muBsAPv25ZIgv8kdl8AMfx+bx6my25DhXMt8R96qo2WE7yJLaJjfWpGk+3wwC3Y6Owsns/ItJDYDi7TMNMqoLJJgGLpXC1F8ojsH3pzTqkuYUXcf8o95PR0s3vA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730797982; c=relaxed/simple;
	bh=1OPoB1ELy0Uv78kEHQdYhCn0VCG+Za1qNrPf67qHaE8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=TmhWQY1iGwY6i5+ZCtY10JWZUehKpFlQRtKRfzgeTZsku2kwwrKyKdfLjEwPZPwAs/mFEbkTXTmqmnIVnD4oMxNmrjBLLKXyH5M0J2vh47Ek6FnxMuYJdED2l5g2Lv1G7wr3R5oXWfB7rAvOB4xdnFLEf8GtcIDO7FibBlb4oak=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=iU13i8Oq; arc=none smtp.client-ip=209.85.210.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="iU13i8Oq"
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-720cb6ac25aso3879157b3a.3
        for <linux-sound@vger.kernel.org>; Tue, 05 Nov 2024 01:13:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1730797980; x=1731402780; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=f+4NwQTv7E4920mh+Y7a29gPk9vmlaHbaiEomCWWFMY=;
        b=iU13i8OqxlR99JEjGZ5yxryTjTiUVtMV3SI0oslFHjDQoH/Cg4uw6zNOsCI89ax5eJ
         4oZ2okrO+wckuMF+5vaBhKeOIDxiDgIe7ruvt1Pu0PZgylhuP2WSKzP+c/lJJg2ufQiR
         g5ygcgNOtqhOzyibczCQ0Hz8o2cTBBHJrC0lk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730797980; x=1731402780;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=f+4NwQTv7E4920mh+Y7a29gPk9vmlaHbaiEomCWWFMY=;
        b=gW5XBdVhrACL8Lxlk6Qv4Ao+0gFgVdmKBt2mzGFu9ajzrCQtFRj4zxMMosRhtCZdf5
         2xpKYxEHB00TJZ+KbniS7/Q4czRrw8Q/UlTAiJLlKybObv8DYl5MRrgTMKhs/PBSTd2l
         FKh1iV5MFZGx5GO6vOwRteZAHod6pW+A/rNh8ShGbnzI1bSnJhQdSUmufP/UbDrVxa9y
         9UUWnC+VByoLedOAD+IS2IwjcG6QeINbXTB0j8GzarUf8mu3qXqg1aqn5HlcCIgoW3mf
         u15RthE2hxQJ4MhnkgrpGYSopl//Ysaoz90ZacIeZyry3caQFwdCsFK2+AHrpZaqX+Jf
         FyEg==
X-Forwarded-Encrypted: i=1; AJvYcCXHGXeCkpVkiZbADcWoFHVYcQukgK/gX6WEaM03j1CpwlVOAlSLxkJe3jE0uA1p4TMa0CuteHKU0upDoQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YzJFa6kWk9UMDVJIBs178prnlxMi/QTcQqJC7kJ8tNOagzYQvfD
	90fP2n8m07Rrxrk+fw1Qa/9s0LK91mE+l+8OULmXr6lkUb1Y8NQ7dshugbVXyg==
X-Google-Smtp-Source: AGHT+IFfp3tQ5uLnmExGkLWD+ytb0gK4uUh68a0Vvv88I2b/msUwcuNAU6GAKyLacYFjAI1B1n9KVA==
X-Received: by 2002:a05:6a00:3d44:b0:71e:1722:d02c with SMTP id d2e1a72fcca58-72062f81d35mr48493079b3a.3.1730797979801;
        Tue, 05 Nov 2024 01:12:59 -0800 (PST)
Received: from fshao-p620.tpe.corp.google.com ([2401:fa00:1:10:20ee:3712:ce0b:1ed7])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-720bc1e7825sm8943185b3a.76.2024.11.05.01.12.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Nov 2024 01:12:59 -0800 (PST)
From: Fei Shao <fshao@chromium.org>
To: Mark Brown <broonie@kernel.org>
Cc: Fei Shao <fshao@chromium.org>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Trevor Wu <trevor.wu@mediatek.com>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-sound@vger.kernel.org
Subject: [PATCH v2] ASoC: dt-bindings: mediatek,mt8188-mt6359: Add mediatek,adsp property
Date: Tue,  5 Nov 2024 17:11:36 +0800
Message-ID: <20241105091246.3944946-1-fshao@chromium.org>
X-Mailer: git-send-email 2.47.0.277.g8800431eea-goog
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On some MediaTek SoCs, an Audio DSP (ADSP) is integrated as a separate
hardware block that leverages Sound Open Firmware (SOF) and provides
additional audio functionalities. This hardware is optional, and the
audio subsystem will still function normally when it's not present.

To enable ADSP support, a 'mediatek,adsp' property is required in the
sound card node to pass the ADSP phandle. This allows AFE to link to
ADSP when the sound card is probed.

MT8188 has ADSP integrated, so add the 'mediatek,adsp' property to
allow using it in the audio subsystem.

This fixes dtbs_check error:
  Unevaluated properties are not allowed ('mediatek,adsp' was
  unexpected)

Signed-off-by: Fei Shao <fshao@chromium.org>
---
This patch is based on a previous [v1] series.
This is sent as an individual patch in v2 because the other patches in
the [v1] series are either invalid or for different purpose in different
binding, so I think it'd be better to send them separately.

[v1]:
https://lore.kernel.org/all/20241025104548.1220076-2-fshao@chromium.org/

Changes in v2:
- drop `mediatek,dai-link` vendor property because its goal can be
  achieved by using the existing `audio-routing`
- update property description
- update commit message

 .../devicetree/bindings/sound/mediatek,mt8188-mt6359.yaml  | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/Documentation/devicetree/bindings/sound/mediatek,mt8188-mt6359.yaml b/Documentation/devicetree/bindings/sound/mediatek,mt8188-mt6359.yaml
index f94ad0715e32..ba482747f0e6 100644
--- a/Documentation/devicetree/bindings/sound/mediatek,mt8188-mt6359.yaml
+++ b/Documentation/devicetree/bindings/sound/mediatek,mt8188-mt6359.yaml
@@ -29,6 +29,13 @@ properties:
     $ref: /schemas/types.yaml#/definitions/phandle
     description: The phandle of MT8188 ASoC platform.
 
+  mediatek,adsp:
+    $ref: /schemas/types.yaml#/definitions/phandle
+    description:
+      The phandle of the MT8188 ADSP platform, which is the optional Audio DSP
+      hardware that provides additional audio functionalities if present.
+      The AFE will link to ADSP when the phandle is provided.
+
 patternProperties:
   "^dai-link-[0-9]+$":
     type: object
-- 
2.47.0.277.g8800431eea-goog

