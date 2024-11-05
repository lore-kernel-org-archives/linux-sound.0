Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 354251B0F10
	for <linux-sound@vger.kernel.org>; Tue,  5 Nov 2024 09:15:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730798139; cv=none; b=mypn+W++ZxDnGDdH4eESENfZ8/YYGrR/GvIn1L4QZJ+IqTqMrGqfeZ372jbFmvZpx/pPIsGrQFoVkPPw1QV0j7Ow2S8P8zAHqoW8fd30hWvAxxG5+ePhE3JC1WGZABsVEW07QqF9lk9A6SO/6SOuy7NiFffa121BqwBsnW4/cps=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730798139; c=relaxed/simple;
	bh=NoJ4ZGaZx7AkDYtA5g7KbWAi5e6RM2XncfGQkpsnNAw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=D0dmkjFMijqeir6Ji/8O7q0Xj9vdRLHfbDhcrpTrYFuFoxyoMB7lpuXUzrqShmz6RMGzHyE8gCwJiCoHh0CVzNtbhK4b86GIdik6R2lBD1HjQh51GN4BvPaRXoweDgEQnx7/OwDhhbm78y4UlIv/ApYAvOyE7J4791WME9RPb3w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=bcRwHDx7; arc=none smtp.client-ip=209.85.210.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="bcRwHDx7"
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-71e625b00bcso4647792b3a.3
        for <linux-sound@vger.kernel.org>; Tue, 05 Nov 2024 01:15:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1730798137; x=1731402937; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=bp5SzzDrkWzFz+KkFH2AjLFNmdPoRX4+H3HpHMfQq2k=;
        b=bcRwHDx7domjvFWQCpaq8ih8PLMPJ76H6WR3ocqINJyc9knP/GhsOcBaRbPm33J7aH
         E2a7Z2C0XiEaCoINUtw9W9oe9SNLrM2w+jcMZ0Ke62o96MvZSYBqPLqEg4/o2fQMBjUq
         AVxeGYtzw0RfNWm+Fey44MJN7/opG88VhKtvY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730798137; x=1731402937;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bp5SzzDrkWzFz+KkFH2AjLFNmdPoRX4+H3HpHMfQq2k=;
        b=r/W+5T0Z2tlahwrZpVeQ3Xr3cnKahXXxPv1AmD6T8VuOMYzw2h2gYCtwX94603yu+a
         RWUa8fp0rWokrZCxKNQr8JFCg2SwXm3FO4dJMzCSdidiZJGnnGUPCtAUidXpIlfytzJG
         HdrH5ZI5WujmpIRLgZ1viRozD1hcTkHH8g6KB48U+/v0u/X0NVPMknGmFxwpdAOZre/Z
         wPFDShcnWs8a/CyKzeaLX4TkI1Gz2//9B+7nXCdSmmDAz5SOJerQQ3unbfehb1CMnkX+
         e+E0xtXLh2VcnYu0XixlFRtZxSxclftO/vCFIIOWG2U3UguCd4J8KbCXZsBFxxj/smya
         5EHA==
X-Forwarded-Encrypted: i=1; AJvYcCWsOv28q2t20SrNdBV7Yg6POBZu36ldv2TNiGKu//FFnFQ/MoU02CAfxfJr8U+sYFZlr8z3UdEalZDZ5g==@vger.kernel.org
X-Gm-Message-State: AOJu0YwSdee90+f3owvH+yGIfQ4+lRTQOoTSIwr3URLkBSHBcski2E7m
	vfa9LGUvxc1mjP8NPMgtr1rVP4Fqb2oU3ACQ9behaSltErZUdYA8tgfhcX9XXQ==
X-Google-Smtp-Source: AGHT+IGHX0L4HfW1RQzdQL8LuZUiHavKnr2hG99pMYDCnlf3de5sLsOYbFCY7gSPwFvuixT4u6i6bA==
X-Received: by 2002:a05:6a21:2d8b:b0:1d9:28f8:f27d with SMTP id adf61e73a8af0-1db91e533camr28597387637.38.1730798137580;
        Tue, 05 Nov 2024 01:15:37 -0800 (PST)
Received: from fshao-p620.tpe.corp.google.com ([2401:fa00:1:10:20ee:3712:ce0b:1ed7])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-720bc313502sm9137251b3a.182.2024.11.05.01.15.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Nov 2024 01:15:37 -0800 (PST)
From: Fei Shao <fshao@chromium.org>
To: Mark Brown <broonie@kernel.org>
Cc: Fei Shao <fshao@chromium.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Rob Herring <robh@kernel.org>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-sound@vger.kernel.org
Subject: [PATCH v2] ASoC: dt-bindings: maxim,max98390: Reference common DAI properties
Date: Tue,  5 Nov 2024 17:14:31 +0800
Message-ID: <20241105091513.3963102-1-fshao@chromium.org>
X-Mailer: git-send-email 2.47.0.277.g8800431eea-goog
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

MAX98390 is a smart amplifier and exposes one DAI, so '#sound-dai-cells'
property is needed for describing the DAI links.

Reference the dai-common.yaml schema to allow '#sound-dai-cells' to be
used.

This fixes dtbs_check error:
  '#sound-dai-cells' does not match any of the regexes: 'pinctrl-[0-9]+'

Signed-off-by: Fei Shao <fshao@chromium.org>
---
This patch is based on a previous [v1] series.
This is sent as an individual patch in v2 because the other patches in
the [v1] series are either invalid or for different purpose in different
binding, so I think it'd be better to send them separately.

[v1]:
https://lore.kernel.org/all/20241025104548.1220076-4-fshao@chromium.org/

Changes in v2:
- specify '#sound-dai-cells' with const value
- update commit message

 .../devicetree/bindings/sound/maxim,max98390.yaml         | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/sound/maxim,max98390.yaml b/Documentation/devicetree/bindings/sound/maxim,max98390.yaml
index deaa6886c42f..d35dd8408c61 100644
--- a/Documentation/devicetree/bindings/sound/maxim,max98390.yaml
+++ b/Documentation/devicetree/bindings/sound/maxim,max98390.yaml
@@ -9,6 +9,9 @@ title: Maxim Integrated MAX98390 Speaker Amplifier with Integrated Dynamic Speak
 maintainers:
   - Steve Lee <steves.lee@maximintegrated.com>
 
+allOf:
+  - $ref: dai-common.yaml#
+
 properties:
   compatible:
     const: maxim,max98390
@@ -32,11 +35,14 @@ properties:
   reset-gpios:
     maxItems: 1
 
+  '#sound-dai-cells':
+    const: 0
+
 required:
   - compatible
   - reg
 
-additionalProperties: false
+unevaluatedProperties: false
 
 examples:
   - |
-- 
2.47.0.277.g8800431eea-goog

