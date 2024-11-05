Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F413B1D0438
	for <linux-sound@vger.kernel.org>; Tue,  5 Nov 2024 09:19:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730798364; cv=none; b=H+Em1mFpGsVmIBPaAh3sUYauJAX1Q72A9m4entUEjBVNHC6g7B04suusk3CscRudxi9r4wvAOreL78ucE8PBtxvmKCIXnh1ZdffT5An8r71rYRvKmHsZlAn1qTMeXs4SbmEaJKVxiIpXu7FR4DdFu1zuMG7Y8joS9yDPrXmC8+E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730798364; c=relaxed/simple;
	bh=T4lfPA8S9ixb3LEM2QOxvR7XTTqcM7Y8IyvOeRDKLNI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=dcBl5yBTY0BvarWcHO6G5NTm7g581UDwYWmTs0ViE7Uz4nvObUt8G3/1005tqR74Q/6StyVvS1Me3IYD7lQ8UORren3y60qWjJENSeFeHWBAFzCIWE9Wr+jJBaeGBTrgnhucj0z+Fv6w8+AfZRS744WevDSx5u1BUhyiulkvDZ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=Pg1tl8xo; arc=none smtp.client-ip=209.85.210.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="Pg1tl8xo"
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-720cb6ac25aso3882542b3a.3
        for <linux-sound@vger.kernel.org>; Tue, 05 Nov 2024 01:19:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1730798362; x=1731403162; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=LW99LC0Kexi86oGAcb2ljvk1jhRq1I2JS+rEVFAlaw8=;
        b=Pg1tl8xo9t2aKiuSC/Iv0U8IZ+eCGe01RiKmydINKypkzVA/TXhfg8TbTUWSojNsWA
         rPqEgpuJw9afTkiE6QC90FEB1cQ5BhyKdYnXa7hezPo9Z8SLomvSUosRzk+ang4SgzAY
         aVYEiHiSNzZ+eOu+DGf6DeljFxnV3P9MJnTZw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730798362; x=1731403162;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LW99LC0Kexi86oGAcb2ljvk1jhRq1I2JS+rEVFAlaw8=;
        b=GlzgnDRh+bNNvzFGM4jBKslQKUFuTro4MhWpSnKDuYV39vLFv/Uzu9ZeTZNVHLjKT9
         tcx0NHQaNyQBnNxM08cTUQ7G5yidoB0CU2O/suGgyJdtToFwUUbu+vxz99l2QAFfbWer
         bbIkF9VpJ8oSNMyOKx7A2RtqAeM5sjY9SbE9VXR1X5PGgxsNb1ICh3WZzhDsPLt6Rqdj
         ewv8t15F5RT/caPRCGv07cuNv9S3cBJsE2psX8AVkQD9BXGeWS9VXBmG4z1AuHtzQLzo
         zsyCPJ47QfHuzT2qC6UvpSBCGxsTX+L5y2R/Z6lvU2Ph6+iepkiE61LGqxaPDb2dbPaP
         /CdQ==
X-Forwarded-Encrypted: i=1; AJvYcCWkh2brDjbbFum6stq4CATeT0i2XRfLw+5S32ESUsY22YiVtVBoRzA3rd+nnQJH4qvj1woFfjcp/D19OA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxCqzSc8SMR74s8groYqiiTUoltIQMkSFvHnx3KHJRUHduZj6GS
	XOS42HfpwhX8Suph+nktBwnqZalgQJ7hHmpvIXlsLxUcx6bCqsyh83nm3mWQcw==
X-Google-Smtp-Source: AGHT+IE+RQFeVzw8zbEzlCI6PqWB5TBlBgH4MxGi/9juWqisHT1+H2kFPqs8VV8Xihz0bbOqadeYvw==
X-Received: by 2002:a05:6a00:8cf:b0:71e:587d:f276 with SMTP id d2e1a72fcca58-72063093364mr47257026b3a.25.1730798362339;
        Tue, 05 Nov 2024 01:19:22 -0800 (PST)
Received: from fshao-p620.tpe.corp.google.com ([2401:fa00:1:10:20ee:3712:ce0b:1ed7])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-720bc2c58f7sm9337566b3a.140.2024.11.05.01.19.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Nov 2024 01:19:22 -0800 (PST)
From: Fei Shao <fshao@chromium.org>
To: Mark Brown <broonie@kernel.org>
Cc: Fei Shao <fshao@chromium.org>,
	Conor Dooley <conor+dt@kernel.org>,
	David Yang <yangxiaohua@everest-semi.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Rob Herring <robh@kernel.org>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-sound@vger.kernel.org
Subject: [PATCH] ASoC: dt-bindings: everest,es8326: Document interrupt property
Date: Tue,  5 Nov 2024 17:18:11 +0800
Message-ID: <20241105091910.3984381-1-fshao@chromium.org>
X-Mailer: git-send-email 2.47.0.277.g8800431eea-goog
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The ES8326 audio codec has one interrupt pin for headset detection
according to the datasheet. Document that in the binding.

This fixes dtbs_check error:
  'interrupts-extended' does not match any of the regexes:
  'pinctrl-[0-9]+'

Signed-off-by: Fei Shao <fshao@chromium.org>
---

 Documentation/devicetree/bindings/sound/everest,es8326.yaml | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/sound/everest,es8326.yaml b/Documentation/devicetree/bindings/sound/everest,es8326.yaml
index d51431df7acf..b5594a9d508e 100644
--- a/Documentation/devicetree/bindings/sound/everest,es8326.yaml
+++ b/Documentation/devicetree/bindings/sound/everest,es8326.yaml
@@ -24,6 +24,10 @@ properties:
     items:
       - const: mclk
 
+  interrupts:
+    maxItems: 1
+    description: interrupt output for headset detection
+
   "#sound-dai-cells":
     const: 0
 
-- 
2.47.0.277.g8800431eea-goog

