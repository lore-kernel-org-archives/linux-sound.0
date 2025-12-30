Received: from mail-vk1-f173.google.com (mail-vk1-f173.google.com [209.85.221.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CD7B35965
	for <linux-sound@vger.kernel.org>; Tue, 30 Dec 2025 20:02:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767124939; cv=none; b=XZ1Lz4pTWjBzanQveHh68tP7gbxc/XM/WSnDDLOw3KMkb1Xr3VDf755E0MS4mDFKXYsce/UT7Vf7pPmY2iQUL5T/QlkbE+VhMYavbw7qaJl7ZSl3F9PTVi7xb9v/W4Ahpofsxcr1o4iQxi0SsGkUT1wHQfe89ieaUPxH5qHlk9A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767124939; c=relaxed/simple;
	bh=a9IYvFqlG/UaJElPMyJFzg5gch1C9rdzE80DQMDwPnI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=NrwkqaAZK5GjP/PcRpjFxNza4vD1tiI6GVdn96OsmLWISVcuXsVbK1v46luTMOTLjbzr4i1MDF+u7Y7SiGqvOe6LDttxGf7oRvfQum7uuKwpe1BF1sPDKZlheFdqzB5ZqnwOzlJ1s+kFbq77XqtBzhNEwhNRDnIYZ0T3cheLaz8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=F6QW5JAT; arc=none smtp.client-ip=209.85.221.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="F6QW5JAT"
Received: by mail-vk1-f173.google.com with SMTP id 71dfb90a1353d-559f4801609so3878684e0c.0
        for <linux-sound@vger.kernel.org>; Tue, 30 Dec 2025 12:02:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767124937; x=1767729737; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vqq42GMedrB/T6d7mRybr+4FEurk5kHOMzPka2Yicmo=;
        b=F6QW5JATh7jQgNWejiACG2BeS8vCdGEx39ekMiHd1Nly9BjEXkmi3ZfNI1shHECMmx
         xYXNzApWDxWUX0Mu9j+621XDIQcNJZivwLc85e3SC3N4+/oznoBupYAKx1APWmcZBQjv
         CCkelmiCRC4BIzNgLLliY3Ksv0JvY1zWoLNxB/3xEOzkzjtXlBF53z/94+ny3QeDMZYX
         h80JbV2LzGFDcSvjv9+jqdgDcyFgX1eRcTIzcVljdtjetNttJRwIwmVRxmtPHOOK5+q8
         e4pNCKQpA0RTUzLK1d0XH0wib2HtjwBKvQ3JQ+Y8GCycik+wNNC8UA+UgE3g85DXYwSz
         x58A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767124937; x=1767729737;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=vqq42GMedrB/T6d7mRybr+4FEurk5kHOMzPka2Yicmo=;
        b=LLOB3Ht7Uj9F/d2fb6k0TrjsNGQd+H+eTldmz+qZNiH34Ft+rJE17KSN9HQmeJBU8G
         SPrRQYBFO9Hgtex54VHbwbgXt3bJrIfZZPZRARSbHS+nkGQHOy8x9FxTFcUG7zRzJu/c
         tjwGy1/rA/lKJ9HnjXNj4eqkkCC4KnVt6IHgGwhCcmjC3S82xyf7uQXV3gmsGtp1/to5
         A2ZEfsExnBHyGmlUYxBKnH+yDqHZHKxavm0cb1YAdUbi17TyHM9qKun5niIfW61LM36l
         YQVyA2yI3G/Ejd12ZewLylNAC4a6eP5z1ZqtJpSkzTL83V8CUI/w7GmBbaO14IArGFKu
         nzNQ==
X-Forwarded-Encrypted: i=1; AJvYcCXkcH6qSMX58CCwAS4akFh9hkpYd4+BSnW0F22Bs5oso8fEmFmphJOqnor5Gy0ZYc4sbhJmtvpI25WPRQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw4zD3jldQja7/uoMiDpcTjsR75iHTyjgar2+g88dltxXfEOcOp
	UB/ajvOQWNQbcqwsB75jyFf84bsOVwqHSV96wUyEHOw8kXAhyqTkKXgdXpU7gg==
X-Gm-Gg: AY/fxX4OHNi/hSyCAABfFucHpNl3Y0+v26OYqhvw2ExB3wVDW3I6FL8T94DocaMMOW+
	+O9PobCL0SlDzmxX2uMUKTwDpAB4Y2BeYwbzcupnj/O7mUayrguHFbnk7ZT6MIhEcCrKLHCytub
	juS30+ceaUjjtNtiuAAYDGvcJgCBDIa91YsrK1DKKD8wz4xIY0DPCxutfyKWlkz/HqPWnxq++uw
	w09eO9jTxpvhdmBzusvnBuYzjoi1a8m3u81XDmC5qSVW9GSJfLTqHyTYzmnaozeqxyM2QB5KUo0
	DuvmO84xpLlCbKepxDsiWtouKu8gXDvR5iqMykUSPrrs1e9bQ1kv9PAI9kooy28E0RZ/nen1puE
	sWessCT/r71oGGx2W6ysj5hR+iiCufHIyH8pWv+Gu611DbQPvv3qViaRdk3b4jWilx4eKhvnv6D
	Y3RmPh0gO/kCBgiAgnwxzrRiEjWF7QWvj3oO8exTtDGekl+uxi165AEcHjvU810VJIjcHXDY7YI
	Kzsd2aQIEHmNlEKZYwo9Q==
X-Google-Smtp-Source: AGHT+IGG4IvGkIealWBZgvBLq7nxU8BQLyVFrfwWxsNjASkIojjiGo3aO9o10cXPbEY9owzzFvEfpg==
X-Received: by 2002:a17:902:e748:b0:295:738f:73fe with SMTP id d9443c01a7336-2a2f2732287mr344445935ad.30.1767118253801;
        Tue, 30 Dec 2025 10:10:53 -0800 (PST)
Received: from visitorckw-work01.c.googlers.com.com (25.118.81.34.bc.googleusercontent.com. [34.81.118.25])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c1e7bc69728sm29598278a12.19.2025.12.30.10.10.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Dec 2025 10:10:53 -0800 (PST)
From: Kuan-Wei Chiu <visitorckw@gmail.com>
To: airlied@gmail.com,
	simona@ffwll.ch,
	maarten.lankhorst@linux.intel.com,
	mripard@kernel.org,
	tzimmermann@suse.de,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	dmitry.torokhov@gmail.com,
	sre@kernel.org,
	gregkh@linuxfoundation.org,
	jirislaby@kernel.org,
	lgirdwood@gmail.com,
	broonie@kernel.org
Cc: jserv@ccns.ncku.edu.tw,
	eleanor15x@gmail.com,
	dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-input@vger.kernel.org,
	linux-pm@vger.kernel.org,
	linux-serial@vger.kernel.org,
	linux-sound@vger.kernel.org,
	Kuan-Wei Chiu <visitorckw@gmail.com>
Subject: [PATCH 1/6] dt-bindings: serial: google,goldfish-tty: Convert to DT schema
Date: Tue, 30 Dec 2025 18:10:26 +0000
Message-ID: <20251230181031.3191565-2-visitorckw@gmail.com>
X-Mailer: git-send-email 2.52.0.358.g0dd7633a29-goog
In-Reply-To: <20251230181031.3191565-1-visitorckw@gmail.com>
References: <20251230181031.3191565-1-visitorckw@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Convert the Google Goldfish TTY binding to DT schema format.
Move the file to the serial directory to match the subsystem.
Update the example node name to 'serial' to comply with generic node
naming standards.

Signed-off-by: Kuan-Wei Chiu <visitorckw@gmail.com>
---
 .../devicetree/bindings/goldfish/tty.txt      | 17 ---------
 .../bindings/serial/google,goldfish-tty.yaml  | 38 +++++++++++++++++++
 2 files changed, 38 insertions(+), 17 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/goldfish/tty.txt
 create mode 100644 Documentation/devicetree/bindings/serial/google,goldfish-tty.yaml

diff --git a/Documentation/devicetree/bindings/goldfish/tty.txt b/Documentation/devicetree/bindings/goldfish/tty.txt
deleted file mode 100644
index 82648278da77..000000000000
--- a/Documentation/devicetree/bindings/goldfish/tty.txt
+++ /dev/null
@@ -1,17 +0,0 @@
-Android Goldfish TTY
-
-Android goldfish tty device generated by android emulator.
-
-Required properties:
-
-- compatible : should contain "google,goldfish-tty" to match emulator
-- reg        : <registers mapping>
-- interrupts : <interrupt mapping>
-
-Example:
-
-	goldfish_tty@1f004000 {
-		compatible = "google,goldfish-tty";
-		reg = <0x1f004000 0x1000>;
-		interrupts = <0xc>;
-	};
diff --git a/Documentation/devicetree/bindings/serial/google,goldfish-tty.yaml b/Documentation/devicetree/bindings/serial/google,goldfish-tty.yaml
new file mode 100644
index 000000000000..08fa12449a01
--- /dev/null
+++ b/Documentation/devicetree/bindings/serial/google,goldfish-tty.yaml
@@ -0,0 +1,38 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/serial/google,goldfish-tty.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Google Goldfish TTY
+
+maintainers:
+  - Kuan-Wei Chiu <visitorckw@gmail.com>
+
+description:
+  Android goldfish TTY device generated by Android emulator.
+
+properties:
+  compatible:
+    const: google,goldfish-tty
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+required:
+  - compatible
+  - reg
+  - interrupts
+
+additionalProperties: false
+
+examples:
+  - |
+    serial@1f004000 {
+        compatible = "google,goldfish-tty";
+        reg = <0x1f004000 0x1000>;
+        interrupts = <0xc>;
+    };
-- 
2.52.0.358.g0dd7633a29-goog

