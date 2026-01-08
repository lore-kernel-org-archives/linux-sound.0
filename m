Received: from mail-ua1-f53.google.com (mail-ua1-f53.google.com [209.85.222.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F377B399A73
	for <linux-sound@vger.kernel.org>; Thu,  8 Jan 2026 10:04:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767866644; cv=none; b=D4TTsl1N7VdG56vscEKeuHGAAIQWlnj59OExKwMAKrnZbV0W5LcPjiGvsfiS1Mcv4vaM6NX19bMUSouLh1XisIuMjqseNCbNaj93q8VUs04Hf5f6AszYobsA8RJlTjooSSr3euklCbztgr9ugZ4/puQ8eLQ9zBUGR5djXBhnMJE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767866644; c=relaxed/simple;
	bh=+em6k554hiEdgZ3gCIS3vNjm0IbnUUOfSriX33xjyhs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=O1ITvrCubhX4JhodunOFGmPhRDJFwamht57BO4tOiD5+Ptnwy73waQEePOUKch2MCV/QpdYRFlFrnE4X4cCEgiCys99LfoiKXi4StTdf38i0tv47lFQJP/05latj7J3puPCNXW76AYK+ANOayzSLriGRzWzJgxyipdrlNtjJzjw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=J2vrAcmB; arc=none smtp.client-ip=209.85.222.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="J2vrAcmB"
Received: by mail-ua1-f53.google.com with SMTP id a1e0cc1a2514c-9413e5ee53eso1758454241.0
        for <linux-sound@vger.kernel.org>; Thu, 08 Jan 2026 02:04:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767866639; x=1768471439; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=s9Cv7mdPPcZ8e/4RiioRb+FP1zONlTuWhguDLBncdBY=;
        b=J2vrAcmB80ywZGBi/L41TE5tn/EG/DxczfceFRcmv+OZiVog2j7Ermin6rzw/Q8eKf
         uzGC27Skgfw3lul8LIwToISvRdW9zTOpcOea3FQuteXcF7K3v4mZ96L8cTU5ipafa6xR
         MsMekQUz/ae6ttqRWAnNQ+tIf+XAE/hw+ivucHYioufHq/UebZFI8n7qKIsArkOUKsxH
         fL3rS6rgt/SPHizZiV/hSeJ7d2iwgvhgcr8y7599El+SR3dXb7BO2paaggwUXZgCwLGB
         qWTma7h1ScrA/qYj7Wp6n/64anRKnu76g0P6Zq2TyDV0TPxfD0M58XjI+MYgZ6uPVEQh
         jHKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767866639; x=1768471439;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=s9Cv7mdPPcZ8e/4RiioRb+FP1zONlTuWhguDLBncdBY=;
        b=Qc0DipNd6PphvQeE2YF+PuvdAC326iJypM9lQXlMDA0iucCPt5jQ1rrSgYqkA+t0rL
         5KleqnO75cg7ONadO2aZMB78egIgZx5+RCGdHyI6ooI2Q4YySwJ6lO8mNOmWd9mt3FO6
         BY7p+Y4pWQn7a8u3Qi63IYkQ9OUC0Kf6MHquRkNlLrcsjloOcCaZCmlbmDNOowUp/Sbs
         e8WPeTCEV0wnhviBbmr96VyJ5QON/6o+6SgaIezFMTYvSDbbcYcXsTNUaTHxSFqUYAcY
         /AgPv5tQ29q+0iDB/VSsFOvvf48qnp2FJfRMsZBnRurYnkSi0/2maTrh8Fj64BKd6LLC
         KnyA==
X-Forwarded-Encrypted: i=1; AJvYcCXbGlVi1wYSIdfLlcCjiKvtisB057JTrU3lqeDjsMjQj6MZyRPfE0no8pV4GXXITZW2BWXbwncj07GpEg==@vger.kernel.org
X-Gm-Message-State: AOJu0YyJGHfjs/bOCtsKFviy2tZet0dl4taFTGLRSHCHnWapMnxFVe5U
	SH5VYQNArbXJ9FrAaIUIwoq8aD4vqpSXrRHHELntuaTFsRiPDHQUISSEzp2r0A==
X-Gm-Gg: AY/fxX68dECRh1UuhZi1dqwzpo26QfIc/aO7eSEt8tywyT1JmlSQqM4DzKcJk+ZznFv
	DdeQsoxo8lq3RQl98QUYLnIW88GbTC/dq7bqlFNBo2WaTQZ2y7hkvHtaIxL7tSknwVtjDgSpPjC
	nPlrGaV8QMTeoZdsM9BN8gLZMGwXQ6aU1Z7hA1d55k7K9zjEh44DA4vGtTnwvV+TxXV2NpI1aCj
	QKmXjNDyATGhnZhqde6IRw1k30w/ZprUeMNF4oiipNRToJ1EHKjqX7P9Yn+B+7UrT/PS7PX1e5a
	g76+tYQJv2fktxNWqbdZ1z8VHVuWjck0ZKfeaZWLjPAnB1xfSrAKG6JC4iuJhA7qfAbRx1nqluY
	b8Yzt5OHlxuq7ZvfhOwwMTsYLqUVGkT+xpFnfP95C4jlOIT+K2wKkkrnOniQtF9vo56lrduiPCr
	DYoRR/oUCrfNERIbhXFrXf5pvYYZP5ocLVVY5FCqHjZfBmbzhIbdsxgSISAEfgF+HjDKIHT627B
	9UflDWWLseMoURbwJgK5Q==
X-Google-Smtp-Source: AGHT+IE5lf3uPbw8VErEKzhFGGbzHGx8u/fDHReHMHASFjL4yvedLS17Wjxspaaf5SF45aWguaeksQ==
X-Received: by 2002:a05:6a00:8c10:b0:7f7:497d:8118 with SMTP id d2e1a72fcca58-81b7eb26e99mr4452899b3a.7.1767859776927;
        Thu, 08 Jan 2026 00:09:36 -0800 (PST)
Received: from visitorckw-work01.c.googlers.com.com (25.118.81.34.bc.googleusercontent.com. [34.81.118.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-819bafe991dsm6900582b3a.16.2026.01.08.00.09.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Jan 2026 00:09:36 -0800 (PST)
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
	krzysztof.kozlowski@oss.qualcomm.com,
	Kuan-Wei Chiu <visitorckw@gmail.com>
Subject: [PATCH v2 6/6] dt-bindings: display: google,goldfish-fb: Convert to DT schema
Date: Thu,  8 Jan 2026 08:08:36 +0000
Message-ID: <20260108080836.3777829-7-visitorckw@gmail.com>
X-Mailer: git-send-email 2.52.0.457.g6b5491de43-goog
In-Reply-To: <20260108080836.3777829-1-visitorckw@gmail.com>
References: <20260108080836.3777829-1-visitorckw@gmail.com>
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
Changes in v2:
- None.

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
2.52.0.457.g6b5491de43-goog

