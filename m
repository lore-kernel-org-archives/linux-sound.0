Received: from mail-qk1-f171.google.com (mail-qk1-f171.google.com [209.85.222.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 385B5315D53
	for <linux-sound@vger.kernel.org>; Mon, 12 Jan 2026 20:27:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768249628; cv=none; b=cvFI+b4XbMGDfrbCQOo8zlFuUEZB5ErUodFZzK/Pbt3CUXhN6wVPUbYdwjnm1fZUmRck53ylakQF6GhuDUnabuI3LwylWHtZjc57+CnkHDtQthdROVb0wztoLj6XQ9rKp+uhiife0xWDeGb8iurEH52U7NxvEtYsTsZqQkjIwhs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768249628; c=relaxed/simple;
	bh=ymB4O87Tj8cdyAQ2Mbv88kf7il5FRPCeihIKxEZnuSQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=rR6DObL0acFjVHieuoZ8C1koSibYSAdGoaViNLHHXdMkl2qA8U4CLkXgftx/K8YFqhS4ytZ6Vky2vXCLtrYqjcXeLp6HsUz3PCoRk6v7j7vYFNvLHQh7ugGxkyf5oWQLaVHCk54rYaFBB2Xav7NA2x62dy9CeJJ1VD0ht1DhL44=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Jl1bKIK7; arc=none smtp.client-ip=209.85.222.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Jl1bKIK7"
Received: by mail-qk1-f171.google.com with SMTP id af79cd13be357-8b2a4b6876fso1046466485a.3
        for <linux-sound@vger.kernel.org>; Mon, 12 Jan 2026 12:27:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768249625; x=1768854425; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9IpW9E256hAdb5Kp0Yw/WkAtwWAPi3uXbVhccnFIi6E=;
        b=Jl1bKIK7ekwQVD9oF25Mg5XpNfl4UECJCJ3gNvdXc0oQ5YLlcwtLajct1a4LooYVP0
         du2NXWNBHf63KEze5CRQjnADesTrgDktbMBH+9Q5VUskaLGs+J+yt/J5JOB7oCjkxLx+
         AnMx4kcaQ2A0k2vg9CSCugrj56oyP3lNSzDZ/4DjOXdap0kd7M14OWII+o2dag9+Eb5N
         Uh8h37KlwnQqgmw8Z8GTNKF3toZGjLDINe5ybeAtXlPb/SNYYHzhm9lhtWf430caRN30
         2IJ0mZdQYDUkbI0Q1OUBi8KDtU539q9TGdejD358vIB16EIJLXl0hH8ciyMi4WyK7xbK
         heeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768249625; x=1768854425;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=9IpW9E256hAdb5Kp0Yw/WkAtwWAPi3uXbVhccnFIi6E=;
        b=mKI/X4vbVlKY2yGLgMqgo2cIpZYis1U1zHmIRdD6AjfdtxJx0D2BJnW+MIqnQ/Osag
         7LCZUr9KGeLQb0uJVjZ7AgKj8hOAiysztnGwNY62gvezXVDNVs7KOF2F+ybhdpTlNhCk
         QuLMSERtaOjzk9ut6ARME6b+a6dgALluleVm0Y+lCaawQq/uoD8KisN+q6/dnZwkzozN
         XCbtlZp2aaFEmwVaNl1NzXB4z+wtIfolH1HC2fc98lqMP6r6413FaHl8CdKZBrJg8kMC
         9oBTDWLU8MUqeskL9ZB8OpHmxfk/s5uNiEvSgYLtOWXHT1vWr0Xrx+bspaJnMH4tmrlM
         ShHQ==
X-Forwarded-Encrypted: i=1; AJvYcCUCseiVPbZwMqHw1jFFiohR1u0JERhhKygXJEMVr6PW4Kpsyx2T0P81uUB4FGLE+H82UeJOc4cHH24S0w==@vger.kernel.org
X-Gm-Message-State: AOJu0YzvYtMV1P91hq5QKkP32evik4q6C0O9GLmnItajuYFL/7aBT6oN
	PLLhEtfOiNFyySZmoPNcNVhN66uJHLC2eJ4kZw5aYGChyowP8pwMQpzrqAa57A==
X-Gm-Gg: AY/fxX7ZJl/XtrQkAucEMjzhQy6Q20xNloe7ZXg0YirCS5AnHTsbhEswEiA5Yipzuq1
	e+vTNG/sO4SxfrJR5TDYhDCd9BgmYcmSKM9sYem7aJ0LTc2JxbZezpoOrF5In6Rbc2kAd3acXtE
	E+yLdA7aw1NbNbvuhIAl75Z1en/q+gwzT+7YJQg3p/Zu6C64F4lye7zqci9GDKCpjuXtl+vXePf
	cQRPSZCSZRFm0eciIPVcFh3Ovw4xb/AaRtyyjoAFxI34q8zPkAQ75SE+e8N9J1mUkZLqoa2QIK3
	ORrjNRBe06InHvEDF6L0NxcE88Up2i8weikqssk9MffxbvBMjhI80W9QrvtSIp4pImr42y4D1NE
	CUAhvz7HnhTyYPADyvEaUUsHIdcyVUQ5spiTKGITDyPQE58XGVSEDYqPleocTFV4Qcdg2Y93xk5
	HvDf7QLcY5QcnYo9r70ysD7suNqrZoIVeH9z415Yri9638F5zlFdZhvUItOTclio6Fu57NR/848
	5aI2un08BrexDNC3MW0FfkALffff5y3
X-Google-Smtp-Source: AGHT+IE0iF957v0dhX+oh2JuRctvQjKaodi99ci7bX97j30HxAiXsxhGrr+rNQNYdsy9DMkXs0FDHQ==
X-Received: by 2002:a05:6a20:4322:b0:366:19fd:dbe4 with SMTP id adf61e73a8af0-3898f88eb3emr18090615637.4.1768243916723;
        Mon, 12 Jan 2026 10:51:56 -0800 (PST)
Received: from visitorckw-work01.c.googlers.com.com (25.118.81.34.bc.googleusercontent.com. [34.81.118.25])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c4cca06b16fsm18874197a12.31.2026.01.12.10.51.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Jan 2026 10:51:56 -0800 (PST)
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
	Kuan-Wei Chiu <visitorckw@gmail.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH v3 2/6] dt-bindings: misc: google,android-pipe: Convert to DT schema
Date: Mon, 12 Jan 2026 18:50:40 +0000
Message-ID: <20260112185044.1865605-3-visitorckw@gmail.com>
X-Mailer: git-send-email 2.52.0.457.g6b5491de43-goog
In-Reply-To: <20260112185044.1865605-1-visitorckw@gmail.com>
References: <20260112185044.1865605-1-visitorckw@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Convert the Android Goldfish QEMU Pipe binding to DT schema format.
Move the file to the misc directory as it represents a miscellaneous
communication device.
Update the example node name to 'pipe' to comply with generic node
naming standards and fix the mismatch between unit address and reg
property in the original example.

Signed-off-by: Kuan-Wei Chiu <visitorckw@gmail.com>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
Changes in v3:
- None.

 .../devicetree/bindings/goldfish/pipe.txt     | 17 ---------
 .../bindings/misc/google,android-pipe.yaml    | 38 +++++++++++++++++++
 2 files changed, 38 insertions(+), 17 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/goldfish/pipe.txt
 create mode 100644 Documentation/devicetree/bindings/misc/google,android-pipe.yaml

diff --git a/Documentation/devicetree/bindings/goldfish/pipe.txt b/Documentation/devicetree/bindings/goldfish/pipe.txt
deleted file mode 100644
index 5637ce701788..000000000000
--- a/Documentation/devicetree/bindings/goldfish/pipe.txt
+++ /dev/null
@@ -1,17 +0,0 @@
-Android Goldfish QEMU Pipe
-
-Android pipe virtual device generated by android emulator.
-
-Required properties:
-
-- compatible : should contain "google,android-pipe" to match emulator
-- reg        : <registers mapping>
-- interrupts : <interrupt mapping>
-
-Example:
-
-	android_pipe@a010000 {
-		compatible = "google,android-pipe";
-		reg = <ff018000 0x2000>;
-		interrupts = <0x12>;
-	};
diff --git a/Documentation/devicetree/bindings/misc/google,android-pipe.yaml b/Documentation/devicetree/bindings/misc/google,android-pipe.yaml
new file mode 100644
index 000000000000..12b0cfc815e4
--- /dev/null
+++ b/Documentation/devicetree/bindings/misc/google,android-pipe.yaml
@@ -0,0 +1,38 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/misc/google,android-pipe.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Android Goldfish QEMU Pipe
+
+maintainers:
+  - Kuan-Wei Chiu <visitorckw@gmail.com>
+
+description:
+  Android QEMU pipe virtual device generated by Android emulator.
+
+properties:
+  compatible:
+    const: google,android-pipe
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
+    pipe@ff018000 {
+        compatible = "google,android-pipe";
+        reg = <0xff018000 0x2000>;
+        interrupts = <0x12>;
+    };
-- 
2.52.0.457.g6b5491de43-goog

