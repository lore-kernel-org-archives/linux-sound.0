Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 328C218EAF
	for <linux-sound@vger.kernel.org>; Mon, 15 Jan 2024 18:20:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="p9jv8g1c"
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-5592d2bc270so1628918a12.1
        for <linux-sound@vger.kernel.org>; Mon, 15 Jan 2024 10:20:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1705342822; x=1705947622; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=vfqDNdJii/JwczmpCcKHtey65uDHFKVGPKm3GAmlP5s=;
        b=p9jv8g1cY2LjoakEladZbsX9fkCxeG5doIoKFumXvdqSw0PSDoZ7QYPqj60kHivXR5
         N2VUgmBC96BRun5Xzn8wexnnUvBtxvqVLlJzJ3k1+s+bQbZbAyJ5i2H1DXkZDFMmyOVQ
         XRJ8kPuUd7QbBbx3XMLnyi7pogmMh/TUNJGbK2AfLmWc2mCeVUYT9xea5N3t8Te3hW7X
         eIOh6hQ4VPeiIVOX66JcVODOWrL+6MrL7NWzPICsjmXjLCPe2dfMYobJ7sy7XNnzC4ok
         opDnlSk1syUBbyY95YEmvyweTn7LxM93MkUqWLvUIsqZdJfJQ8gDXCwKcFcjHydyiYal
         cgBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705342822; x=1705947622;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vfqDNdJii/JwczmpCcKHtey65uDHFKVGPKm3GAmlP5s=;
        b=ZuucSefF2JM+cIWfzyUhCB9J9N7DFHrJlDQhgTolFp6b23/xC+XlY++JE6OOYwVJFh
         lG9YNDhCq6xaAuKLznGVu8cz4euonqDlzB1XxVVppHKNKJnl5gxl1zMGmr4BLJVALhTm
         uWfok7GA/FT7p8YB5r0I/ytxGn9eJA6kBGZhJabJlmsNBdRgmbeEGEh4ZnQdUryY8CjC
         oD3+a/Ki1QVMiZidrbwtc1FlAd5131x3dW6SX8PblpjSuTnmpsyrRJ+DyETTFOmIw0Jz
         AS1igPCBPo7N3t/p8Zzw98OyvC4QhtIdNi1k9hTVKuh+L3Z0o2nsG4yVMvoWOH3Hvv9s
         ZQkw==
X-Gm-Message-State: AOJu0YyhP96meCOdF/P3zi8FHXyYDTCRiqd5U72BF0uTTMFf/0A6/0n+
	0SijUsLPEHUPCHG5eVWiDG/TaDuaV29rfg==
X-Google-Smtp-Source: AGHT+IH4iiT1305wjSx0qw7+JZyagxUkxX2NGFDlrUVaieyWX/cQtizfU3/Ag65NHQO/QGBhgiuxeA==
X-Received: by 2002:aa7:d80d:0:b0:559:565a:8fb0 with SMTP id v13-20020aa7d80d000000b00559565a8fb0mr751869edq.84.1705342822468;
        Mon, 15 Jan 2024 10:20:22 -0800 (PST)
Received: from krzk-bin.. ([178.197.215.66])
        by smtp.gmail.com with ESMTPSA id l26-20020aa7c3da000000b005546ba152f4sm5761795edr.71.2024.01.15.10.20.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Jan 2024 10:20:21 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Herve Codina <herve.codina@bootlin.com>,
	Shengjiu Wang <shengjiu.wang@nxp.com>,
	linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	alsa-devel@alsa-project.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH] ASoC: dt-bindings: Do not override firmware-name $ref
Date: Mon, 15 Jan 2024 19:20:17 +0100
Message-Id: <20240115182017.1610055-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

dtschema package defines firmware-name as string-array, so individual
bindings should not make it a string but instead just narrow the number
of expected firmware file names.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 Documentation/devicetree/bindings/sound/fsl,easrc.yaml        | 4 ++--
 Documentation/devicetree/bindings/sound/infineon,peb2466.yaml | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/sound/fsl,easrc.yaml b/Documentation/devicetree/bindings/sound/fsl,easrc.yaml
index a680d7aff237..0782f3f9947f 100644
--- a/Documentation/devicetree/bindings/sound/fsl,easrc.yaml
+++ b/Documentation/devicetree/bindings/sound/fsl,easrc.yaml
@@ -51,8 +51,8 @@ properties:
       - const: ctx3_tx
 
   firmware-name:
-    $ref: /schemas/types.yaml#/definitions/string
-    const: imx/easrc/easrc-imx8mn.bin
+    items:
+      - const: imx/easrc/easrc-imx8mn.bin
     description: The coefficient table for the filters
 
   fsl,asrc-rate:
diff --git a/Documentation/devicetree/bindings/sound/infineon,peb2466.yaml b/Documentation/devicetree/bindings/sound/infineon,peb2466.yaml
index 66993d378aaf..5e11ce2c13ac 100644
--- a/Documentation/devicetree/bindings/sound/infineon,peb2466.yaml
+++ b/Documentation/devicetree/bindings/sound/infineon,peb2466.yaml
@@ -51,7 +51,7 @@ properties:
     maxItems: 1
 
   firmware-name:
-    $ref: /schemas/types.yaml#/definitions/string
+    maxItems: 1
     description:
       Filters coefficients file to load. If this property is omitted, internal
       filters are disabled.
-- 
2.34.1

