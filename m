Received: from mail-ot1-f42.google.com (mail-ot1-f42.google.com [209.85.210.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31B09A930
	for <linux-sound@vger.kernel.org>; Tue, 30 Dec 2025 20:00:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767124860; cv=none; b=ukGupoMu4PCRgOasqFsKBl1UkfOdAMmG4jZvqIbOPmPwbCcEplIkLkVUvKV/OkBism0WFA8B3QxtorKWxGot0q0x8ChAFd2KXAqbkq5tWpIS1LKGOizDGG4K40slm9smP2mF6wDBXAIhHyAySUjSiwOz/tzKUy6KDBsv1NORYRU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767124860; c=relaxed/simple;
	bh=4Uq/LuMFJ/bKwMeSTNcN1XmhonxlOFuHeuhk/6pGReA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=HvgJhjh9ayWCCq0qgPgVOx6K4Q88QV8pXRV6vP1nLRnvbxxIBeDo6B0c1vfHEuuLVsXyfG+1cDv0iE1lwtfLrT5+Z/h9y/FboNaRKBjIzYCsx8L6ezOr0BgHCOhB1DzpHyebBzti8uhC5KPMoTH1Ny7AdOu9HJWhVvInGElQQSk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Hpgfi6xt; arc=none smtp.client-ip=209.85.210.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Hpgfi6xt"
Received: by mail-ot1-f42.google.com with SMTP id 46e09a7af769-7c6e9538945so7419360a34.1
        for <linux-sound@vger.kernel.org>; Tue, 30 Dec 2025 12:00:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767124858; x=1767729658; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SQ2qeV8/CMzii4Cc7pVXwWXbCg7/CDjibpfP3lPkew8=;
        b=Hpgfi6xt6PSPapYvCfZz+t5spyz7oDZW7aIORuYYBAZVzJFH/GI+1K6Zrwf5Gf9+KP
         IGPtiCZyjDESGc9jD30vYqFhvPK7SovrCE1+6z2WQFdJYnMnY3OF/JCO3YPIdz3bjTh2
         y0MGWzhEBOz8LVE+iKBdFF20c7M0d6SJBKkSRn+BCpiBUWaMaRnKF4WBxNP8NfyxjsPI
         PVeJo1FDFzoJ/CtxDo0ComHNH7ZpuvOl6Iwno3sv59+OILX+sbVSdPsTjHhVLitxiEIf
         /o6g84ZHUaeqYNB+XWikXYPPJqhb79rcaEVbvvPKoZxehgWwReJOVxYavjwdBhDP3Mw/
         Bt0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767124858; x=1767729658;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=SQ2qeV8/CMzii4Cc7pVXwWXbCg7/CDjibpfP3lPkew8=;
        b=vQQeMZZEpTs1/wOzDo1CJJIJLOyAlCpdtdBjt6oD1yrAaDbAbsq32N98CKDk0cP4qG
         d13Oi35w+QgMO86d8QuTL/agyQS6OwdQdl/LH7jXAhIFCs3SeZaRCVrg8Y4H+L7byf5c
         tKtwUAPB2wDWO8AxjdQNCUGobXeII3NBGmMApZGoy5e3JLCT4LNdt6+EZ3Wi0U5EjO+x
         M0x9KgptBnh9SjbJ+bJKsaAfO2FlBJVEmjVQU2S4xdTSPcWNj9UAnxJe/7ZjrWW7PTEi
         nrMUHcDyUN4Cl21Tz3zG0k7DUY2kal6/BFesLMixo0wvJh1byBhj9pThIRtd1isftVcl
         udaw==
X-Forwarded-Encrypted: i=1; AJvYcCXByVOiAZbq+DQ1ejJuMA0Vt6LAsA40C9LkcrufDuVluda89RBLOIWSzon1FxTEtTsJV36PZv4m5UbEjA==@vger.kernel.org
X-Gm-Message-State: AOJu0YyCFhkq4LJCknIjmWDQmXDre84+jDeZ9bR6I7HT7IUJNci8LS6C
	CgTnuluXrrPh0pfRuHLaYbCv3Xe6ZytuxMgpueEoEMhj+6arVnplBeu7t3FB1w==
X-Gm-Gg: AY/fxX7vHh0MQqhDx1sSD45KPfxTY1Ac4OCIMh+pv7AAwkTAvhyB0LGIyHTqRQc326T
	pGkEKaOa/uY+ZyvxqCIJopfMIVUu9hrviXmZXqCT6SKSFJWJyrFzHEWrUz8zPz1oc5OPJdu+FaT
	CmRSfgE5IJqppDHEq14zHgvsXdR5b+sO9ocRsipux3GWe2Nv51ReN1MXWgTPgrO4xR/L2rj8QGm
	9eC7YTcmq5Ga2ZsUxL/vG2kmMvU5cX8KS1yzUEvXoCkhwi1e2N6IEBe+PzvyUognuqm5IXK6sRV
	Zp92UmHTbSeEV5l6W9kVHDbpioMrc4gDXAeQwQdCy8XpaPAbdDxVRV0EQ/JL1FI7ywcj1FIdSeo
	UbCFzj3IMij4yEPkQnZAvw98z+UQBr6U11kJG8yriQsl88R0Pq2SFRCTTULboxKHzerBXEj5Zno
	9diaIhvB2NrBf6q1eioNEyxu6Kbrp9HqvaeascH84AIwowRD7bglr6NI3Fk71nDhFNFjGxo1Ceh
	RZ9Z9GjfhHlZI3H1G8D7w==
X-Google-Smtp-Source: AGHT+IESyaAQ5T3YAYk5oG3HpiGG3dgsPGYC0NsIxOY31vJ9VG1hZq4KkWvGFlOWl7CULDPAileC8w==
X-Received: by 2002:a17:90b:3843:b0:32e:4716:d551 with SMTP id 98e67ed59e1d1-34e90d6a42cmr29651001a91.6.1767118281443;
        Tue, 30 Dec 2025 10:11:21 -0800 (PST)
Received: from visitorckw-work01.c.googlers.com.com (25.118.81.34.bc.googleusercontent.com. [34.81.118.25])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c1e7bc69728sm29598278a12.19.2025.12.30.10.11.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Dec 2025 10:11:21 -0800 (PST)
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
Subject: [PATCH 6/6] dt-bindings: display: google,goldfish-fb: Convert to DT schema
Date: Tue, 30 Dec 2025 18:10:31 +0000
Message-ID: <20251230181031.3191565-7-visitorckw@gmail.com>
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

Convert the Android Goldfish Framebuffer binding to DT schema format.
Update the example node name to 'display' to comply with generic node
naming standards.

Signed-off-by: Kuan-Wei Chiu <visitorckw@gmail.com>
---
 .../bindings/display/google,goldfish-fb.txt   | 17 ---------
 .../bindings/display/google,goldfish-fb.yaml  | 38 +++++++++++++++++++
 2 files changed, 38 insertions(+), 17 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/display/google,goldfish-fb.txt
 create mode 100644 Documentation/devicetree/bindings/display/google,goldfish-fb.yaml

diff --git a/Documentation/devicetree/bindings/display/google,goldfish-fb.txt b/Documentation/devicetree/bindings/display/google,goldfish-fb.txt
deleted file mode 100644
index 751fa9f51e5d..000000000000
--- a/Documentation/devicetree/bindings/display/google,goldfish-fb.txt
+++ /dev/null
@@ -1,17 +0,0 @@
-Android Goldfish framebuffer
-
-Android Goldfish framebuffer device used by Android emulator.
-
-Required properties:
-
-- compatible : should contain "google,goldfish-fb"
-- reg        : <registers mapping>
-- interrupts : <interrupt mapping>
-
-Example:
-
-	display-controller@1f008000 {
-		compatible = "google,goldfish-fb";
-		interrupts = <0x10>;
-		reg = <0x1f008000 0x100>;
-	};
diff --git a/Documentation/devicetree/bindings/display/google,goldfish-fb.yaml b/Documentation/devicetree/bindings/display/google,goldfish-fb.yaml
new file mode 100644
index 000000000000..48b9c056d9ac
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/google,goldfish-fb.yaml
@@ -0,0 +1,38 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/google,goldfish-fb.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Android Goldfish Framebuffer
+
+maintainers:
+  - Kuan-Wei Chiu <visitorckw@gmail.com>
+
+description:
+  Android Goldfish framebuffer device used by Android emulator.
+
+properties:
+  compatible:
+    const: google,goldfish-fb
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
+    display@1f008000 {
+        compatible = "google,goldfish-fb";
+        reg = <0x1f008000 0x100>;
+        interrupts = <0x10>;
+    };
-- 
2.52.0.358.g0dd7633a29-goog

