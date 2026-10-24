Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792831414;
	b=IV/oxXhD3ss40ebyPVk5t8WGol5JPsJEg85iR3r3XgMrVxgY/6gbP4m00OFqDZ5EfgUY
	 jsz9LvPJc0CH4E2Xv3TlCKvKs4d9ey5B/icD1SooPAM0lH/m8WEPscW2FOkyaF2y1K0lP
	 zJT7vXBIZEE7lFYcVXvjrsivlzH9GtU0V6S+5el69twaHbSQkD+mo8xAEJ0Bbdu8aEC4Q
	 8CavGvcbEH0vmhDmtLwR8UoWXpzzu6uzRZN5c8y7LzF+4L94lPmHNFjhq1dFIzKJY5zhJ
	 iCYo8gIWgf59Qnjq5u3TBz0UfVqgOlaCx2ABq+pY5lU/tuCH0H96olMHHAVLz6X6pzg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792831414;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=NyJpmj5FPVaDV7h+XvGySkhqmILNqo7NWUj7f7DmacA=;
	b=Bcp3oVLQ6Dm1T58O0CdZrRbj4K6zJAPFO8veVzKTlSA8k7MbvU7+2d/wRxa0y/S/BJGO
	 m1hKPpQLNtIUNQ14aWtarShU77D3HkSeFHN/FF9q5bg1h3HTh9XUoZ+j4JgUCGflblr76
	 IA5v3pzDyts+LaW+cbq/3jcDLkkhFg1G/JdevZqAp3edSCpiALFMuWY62WL2uIvI3h4VQ
	 RKO4Lp26Bo23qjcRO5j3jiXO40CiqC7Sg4x+caEkJ+vHqq/MFKgXFViuXpVPiCKJG7LlB
	 /o/F6ZDEkW9UeLu6TZ1dFev5vs67wQn6rkz0Nd9SRzNCns6s7OQy4MsnZwg7Eh7XM6w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=ncOG1xga;
	arc=none smtp.remote-ip=209.85.218.50
Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86A88606A31D
	for <linux-sound@vger.kernel.org>; Sat, 24 Oct 2026 08:43:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 86A88606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=ncOG1xga
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-c2055573c8cso199318766b.3
        for <linux-sound@vger.kernel.org>; Sat, 24 Oct 2026 01:43:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792831413; x=1793436213; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=NyJpmj5FPVaDV7h+XvGySkhqmILNqo7NWUj7f7DmacA=;
        b=ncOG1xgaONvXeiaMUE7R79ovJmwawvtZtfagrUqVaV6SCx3XMHlsbs6sSfOF8KdlSv
         AMAp+8v00bmNVHOUvqO2+6QzbcTm2dHjSPn6ykRWAbQI3FAj9QkqeRhtDrBSQObhk9Hl
         olSDf3wCDZSvG+bru+umoFIOSZBg2a9hsh6HLiquxNDSAK6HV0dCNDfdfnU9tJ500gsc
         SPg4ybU6xy22v58T+GJmx3gBX53Y9taqF41tXHGihH+DH8i8P1C9wED1kHKvHtbVDBhF
         pmTD3ADcqNcwMRBxtcrSY7lJvOj5zKaTPXZeJHyWNTV/kfjd0Cg8PHw9y0ZXq62r7GX2
         G/1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792831413; x=1793436213;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NyJpmj5FPVaDV7h+XvGySkhqmILNqo7NWUj7f7DmacA=;
        b=VaRQymHMT0AhUodC5IlF4ddYcH+aL6us5dhMqrcVZ9pagDG85RjBR8koECj3RFk0Wm
         OasqzfmDGv3CSr40CYzLHvLY++n2shmk1aJODbXacladaVHuP+xD4Ww48hqBgiEvsDSh
         97h8ybpBcl6mOXSrqekje0XHBOrcR2oOUnNFtNzvzmU5ccFUS3S+ibwUabv0K/6wJHau
         h1KByd1dkDLzqVbjOMAkK68IwzpWwXQET52nn78xUj2KC6R2izWhg2YevTMqGbz8rZE3
         yybXPacZj573hqo4jcVjUcoHupbLifau9uANZww8Bt+03uoJs03gybuoE5RqU37ESfx8
         pFCw==
X-Gm-Message-State: AFq9FYKFgOtEUdxpT8iFH5q+iNZ9tsCvtl4XZx3koHFGCE0bOLoKTv9L
	aSCiSfQ+H2XdWGkw/SgxYc2DJ+lB/jpPbKhVI3XQv3rLilOCxT3VaTF0
X-Gm-Gg: AYBFou3AR6KBw0r7BwXiee5C7hver/P+IYDKD55QzLJWYFcbo1j3PSQlXE1GyT7d7qr
	ze/cooARcQmsWnULMa3AY9b3ceNRcRvBh4f979lj3U27KS6j7sf3Oj+xnDTFte4rnubjftpOJyy
	q3AKrEQ2o6kCVAVZOgX/TypFxavBlmjMc2rqGjjICDel/pm+VK7YPxq70WbMa6S/BO6s6fxo4M3
	ZCBAB+zeVZ4wghdfjUHY3QcPwBl5AJiSNQOlwAFeKKwYP/57vNhtoZv/YYa4XUGv2L71ulr9voX
	ZJPJ3gNwMYlqz1xgWM3ew+VqtTfzGDf7sMttajNa4sUWX7vTY/UfWIjgizfkM4W+3xWr7mRktWx
	5tEqIsws7GnQSjtHrfwEh6HnAGVX1F0qxDyTojk5whHMkaa1/JmwEaSk/XWvaUb1sJoH/L4xMah
	jECveKPJmodXFb3CLdspgFngW8JxIUPzJdXST3O+Stb6NY8mlVm7EpvA2bupIl7qyxYcn+GOVBR
	NFLcJPjkJpFcFnfv/kfU9HlF9A+VliDuDv5k8RprknW1fR5ALA7eWvEP/l+srTztGWM8Lg1jZPk
X-Received: by 2002:a17:906:c141:b0:c40:c6c8:6bd8 with SMTP id a640c23a62f3a-c46bde0a0e9mr153005466b.20.1792831412672;
        Sat, 24 Oct 2026 01:43:32 -0700 (PDT)
Received: from xeon ([188.163.112.62])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c46bd4ea608sm64608566b.21.2026.10.24.01.43.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 24 Oct 2026 01:43:30 -0700 (PDT)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Svyatoslav Ryhel <clamor95@gmail.com>
Cc: linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1 RFC] ASoC: dt-bindings: Define '#sound-dai-cells' only in the dai-common schema
Date: Sat, 24 Oct 2026 11:43:07 +0300
Message-ID: <20261024084307.116715-1-clamor95@gmail.com>
X-Mailer: git-send-email 2.53.0
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Post: <mailto:linux-sound@vger.kernel.org>
List-Help: <mailto:linux-sound+help@vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-sound+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Define the '#sound-dai-cells' property only in the dai-common schema with
an enum of commonly used values and a description on how to use them. Drop
all trivial uses of '#sound-dai-cells' across devices with DAI support,
replacing them with a reference to the dai-common schema.

This should resolve any issues with codecs having multiple DAI cells, no
DAI cells at all, or incorrectly configured sound-dai-cells properties.
Simply include the common schema and switch additionalProperties to
unevaluatedProperties.

Non-trivial '#sound-dai-cells' usages can still be overridden in dedicated
device schemas.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
NOTE: This is currently just a concept. The actual patch will be very large,
as it touches nearly every codec binding. Therefore, I am sending this RFC
to ask if this change would be acceptable in principle, and if so, how it
should best be structured and split. Thanks.
---
 Documentation/devicetree/bindings/sound/dai-common.yaml   | 6 +++++-
 Documentation/devicetree/bindings/sound/linux,bt-sco.yaml | 7 -------
 Documentation/devicetree/bindings/sound/linux,spdif.yaml  | 5 +----
 3 files changed, 6 insertions(+), 12 deletions(-)

diff --git a/Documentation/devicetree/bindings/sound/dai-common.yaml b/Documentation/devicetree/bindings/sound/dai-common.yaml
index 1aed2f0f17756..152f319d8f382 100644
--- a/Documentation/devicetree/bindings/sound/dai-common.yaml
+++ b/Documentation/devicetree/bindings/sound/dai-common.yaml
@@ -13,6 +13,10 @@ allOf:
   - $ref: component-common.yaml#
 
 properties:
-  '#sound-dai-cells': true
+  '#sound-dai-cells':
+    description:
+      Use 0 if only a single DAI cell is available, or 1 if there are multiple
+      DAI cells. For special cases, check the device schema.
+    enum: [0, 1]
 
 additionalProperties: true
diff --git a/Documentation/devicetree/bindings/sound/linux,bt-sco.yaml b/Documentation/devicetree/bindings/sound/linux,bt-sco.yaml
index a67b79cbe006b..f30aea4b545c9 100644
--- a/Documentation/devicetree/bindings/sound/linux,bt-sco.yaml
+++ b/Documentation/devicetree/bindings/sound/linux,bt-sco.yaml
@@ -13,13 +13,6 @@ allOf:
   - $ref: dai-common.yaml#
 
 properties:
-  '#sound-dai-cells':
-    enum:
-      - 0
-
-      # For Wideband PCM
-      - 1
-
   compatible:
     enum:
       - delta,dfbmcs320
diff --git a/Documentation/devicetree/bindings/sound/linux,spdif.yaml b/Documentation/devicetree/bindings/sound/linux,spdif.yaml
index aea6230db54c8..62c035b739d38 100644
--- a/Documentation/devicetree/bindings/sound/linux,spdif.yaml
+++ b/Documentation/devicetree/bindings/sound/linux,spdif.yaml
@@ -18,9 +18,6 @@ properties:
       - linux,spdif-dit
       - linux,spdif-dir
 
-  "#sound-dai-cells":
-    const: 0
-
   sound-name-prefix: true
 
   port:
@@ -30,7 +27,7 @@ required:
   - "#sound-dai-cells"
   - compatible
 
-additionalProperties: false
+unevaluatedProperties: false
 
 examples:
   - |
-- 
2.53.0

