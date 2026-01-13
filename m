Received: from mail-ot1-f43.google.com (mail-ot1-f43.google.com [209.85.210.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBCDD3876D0
	for <linux-sound@vger.kernel.org>; Tue, 13 Jan 2026 11:13:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768302788; cv=none; b=fSC9ddmcHCAKhVAn2G/GxjOo4C/bJOmXtPoivy3gFA227q0TdHVu9WcEK5SvRp3Nc42HCsPDxLcVZjXm5SU4wf6z2UXvVilmXkFL05fBajnau/VxjA9Exw2iZnQJrZyFLO5sSTfJiQPxgxVUoAHvPbbPh9mTQahZBfTJKJZuFV0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768302788; c=relaxed/simple;
	bh=H/DtsJ2E/56brWT90bF0TB1znfavml5P75EoVlijniE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=KtcLXTe1IOuSQBf5sADZfg/PQ0XfiGw5pMRBEw1rYs1PZG+8unf9nCm2jP1IEa3vVMa7PQhN1UMVYNcHf0zgM4gXtxtqdCJ+BLAoXAOz4zzyA514+OujgVwnT1MZodewrfoC0ZP5WQhSf9x/UPCNRNliCOag/vRsZRQ43vA/h94=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CmPcBVQX; arc=none smtp.client-ip=209.85.210.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CmPcBVQX"
Received: by mail-ot1-f43.google.com with SMTP id 46e09a7af769-7c6e9538945so3996000a34.1
        for <linux-sound@vger.kernel.org>; Tue, 13 Jan 2026 03:13:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768302785; x=1768907585; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4XLlcSDrZxQliY6Jsns4WsjKtz/A9etiQH4EFHPP5z8=;
        b=CmPcBVQXmRxnFs9fvmGYNxU2dnnTM3aNaTTeFJMh2spJA7xAirf8dodlyJmkUi+kzK
         +5+N0O85NX2w7thvk71v+uWGCefgN1hARRUv/p25kufrPASEjrV4tGYrZyt+fi8wcNw8
         yhMWRHsdJMy7sN+aAocjsEQlvUDYXXXfPRvFzKTmCf9Kr6eJ4nyOTk+Sd7YHlhGFiP6W
         9Hll7N3z0UxyndNXn95wr/AVuFW67G5MpHIBpCrnbXFMH0zVKz7rRFp2ePaMVZQYSELJ
         RNIWOT0nfOmu+4WxlwLbDMbcVisjzIn8gJGLgAeC1MfticAEpI5mapkGSjwzaqNijgii
         Clmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768302785; x=1768907585;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=4XLlcSDrZxQliY6Jsns4WsjKtz/A9etiQH4EFHPP5z8=;
        b=jxxV4KetqXaMT2z+48IW55zM3GWjH2xwUNq2EUYIL8CwceB87lDsl7TzqeuLoBd9qX
         HwpdePOtrqSc03PY2xf7P5gSF75tCd7gR0WAstkIPWLaLltpLwKkSQtU46XQckh4Ro+I
         4CkrwiXam9FUTPMYAYjlpBiI0Ak6yEy5ukObzJpmDu4TsKSu6scQbqVH53P0dP6AjhG0
         XA2kNbcA/uxRUAuYsDNMcdX+FahogLf0Kgde7/aF7cbv30nfK3gasylW5CpeBXbJqqye
         jxnkDztGbT3KJiehBtcHDskIGSR/RxJ+1+O0J69JwKDpvW5kgioO8ZCctiyQD6dfqs8Z
         Gn5A==
X-Forwarded-Encrypted: i=1; AJvYcCVankyQLfIudtrkkeO3Rl5fV/VFxgLC4Y+2UumZZneC62FS37vOmc7gknwW/dg2bcHH8wjHGpkd8qXpLg==@vger.kernel.org
X-Gm-Message-State: AOJu0YwmWmoCOyTLNe53k+t1pqyLcDBtzdEIeMre0fBTV0DBnBk9R8R+
	8fcbvNcKEbScj9uADpjTuRZ4j/POimOwwq17JYOnt/oOZkLeX/bkOJQ4w/UryQ==
X-Gm-Gg: AY/fxX6LG2+214SyWMKIH7uJugFdkteEPNh8Ks0bwmEouqLQ51Fo7ykhiRVCb9VQtxR
	vzJiPAvkNKBxp1j/KjvOw5CWVG4OZEp51EP5Q/xKigxhHvUA6EaBDAB/zh3pUNdqXgzJiFBr0yI
	PIqN0Zke71Bhh0Kw71FZ1YQTr9PnCg7F2jMuhfO1pXU4cJ1Bkpt9KpzjJWvd4dTmz+rJBmOD2yh
	n64xptm6ut+XvTZK1TyJsghne145S1m59+aoxq7DvQVOJyQn0JvNDVaGjGv40LONDsJAK44OPXe
	wAuf+HtrBlNcLXrVe/F0q4oj5MAGnezfpFnT7+K8H7OnBoc8fWF2pvQqEuPtLsGmODj3qGV4t1k
	Dyx2uAE3L4PxLVN+VnO07dCYDAWPWsBwwYtr1VRGM9nu/PO31/jmThwGxE/NWRj2B+9G+IVtdR0
	VWfVpH07oafSPLf/x2tKpAf5skEvP9ztf5ILX/HTJS0Z5f1Ab+DEY1/zy0XFc6Fh7TwtwgBL6gv
	A/VIc8Oli8b5UjHNBHzZg==
X-Google-Smtp-Source: AGHT+IHoetKCTy/pEDc32+prvwD2Q1RnoCrCBHHEv/M6mDpq1Oqnx5ryJch1QdsdD39c7PlRb7aCxQ==
X-Received: by 2002:a05:6a21:c154:10b0:38b:dd94:936a with SMTP id adf61e73a8af0-38bdd949736mr1217364637.24.1768296389614;
        Tue, 13 Jan 2026 01:26:29 -0800 (PST)
Received: from visitorckw-work01.c.googlers.com.com (25.118.81.34.bc.googleusercontent.com. [34.81.118.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-34f5f8b0f67sm19483200a91.15.2026.01.13.01.26.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Jan 2026 01:26:29 -0800 (PST)
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
Subject: [PATCH v4 2/6] dt-bindings: misc: google,android-pipe: Convert to DT schema
Date: Tue, 13 Jan 2026 09:25:58 +0000
Message-ID: <20260113092602.3197681-3-visitorckw@gmail.com>
X-Mailer: git-send-email 2.52.0.457.g6b5491de43-goog
In-Reply-To: <20260113092602.3197681-1-visitorckw@gmail.com>
References: <20260113092602.3197681-1-visitorckw@gmail.com>
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
Changes in v4:
- Use decimal format for interrupts in the example.

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
index 000000000000..9e8046fd358d
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
+        interrupts = <18>;
+    };
-- 
2.52.0.457.g6b5491de43-goog

