Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4503637C0F3
	for <linux-sound@vger.kernel.org>; Thu,  8 Jan 2026 08:09:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767859783; cv=none; b=SH5D4wK3kE+KAO1wTfW2adbTn+DvMvIPzRnGjMOUbY8Rh/qIVYg6My/TZ75Z79yDyPCT5ygN+EJbCGl73Y0RTbQbb63d8QE7u8TXPlR+2jCjuuha5uGtP9MgvmH8d94FCWjrrtr1gqxTWh22ps5PkgtLqj/CtWWqahUNmr1Qwj0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767859783; c=relaxed/simple;
	bh=BkuzIM+xJSw6D9gd0ClP6IeKUS3iAxeuX1yHGi4chXw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=eXDibF7mof7i3QBOxLv1zZ8/LVZMhYjs6nebKitbkjgEwMaxVDLCpyQx+QWnXCCVSiapEX5TtbmI9UQrU7q9IMPoThjlqt3rIW4w0SAoY1jW1fb0VLp9TYhcencMHiNAJQlqFIZtQi0M5Bi1iUJyl2lNeexzXYZHsWLIoxVvWm0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WbMtxix7; arc=none smtp.client-ip=209.85.210.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WbMtxix7"
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-7b8bbf16b71so1979400b3a.2
        for <linux-sound@vger.kernel.org>; Thu, 08 Jan 2026 00:09:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767859767; x=1768464567; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cM8S9Nf7P6gRpX7oKCBS4znehPOLHvbNE32ZCa5tCAA=;
        b=WbMtxix77iyRiMu/v6TL6S3OE4lOZf0DwNv0JOtIuj0UWdibRbv7EvHx/rC4SrGzEI
         j8FIUcuUbWNqf3OHvvwnjp16n/ZVsN3Zqqo2u/sPVCPcDY7KRQCIPkCfqBx+MSCgeNrj
         FhglvRwKieoa43KClvFE1X8AXiHAqWN1u2qcBtrQyxADPdHHAp5J7G0PeJ+VGcmzc16H
         Qr6mlPaoK+3KHnALV+6lbtMfVlf8sNcOAUz9K0VWPh1zGndJCuKoGfn46pYcTUej8gWW
         wn3jYiiY6+sQPI/3ufuLrH77ZZvcplgWmNlX601WCLYmsP8NVyDteo8AjjAUd5uAhraR
         OnKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767859767; x=1768464567;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=cM8S9Nf7P6gRpX7oKCBS4znehPOLHvbNE32ZCa5tCAA=;
        b=iyXmQqauxrN5nTLzlnuzAN7Kprny+kslajdUREN8MkDUkpdG92KLOKEG7VI7x8ndGj
         y6+U73mpUrnNnMfITF2WeZjen8v11QusF4EM88oUDFuN+44mgL6ncOzX9OUz0Evdtyx8
         PIkV40rzBGhx+9sVeAejndhcGyDKwZu0QnVgEM4Dh503mnQmfVXsyJ53Op6y7IDNKdVw
         ckpOFjw44fFXISsGU5ArrIKb0mW18q+nxetGL66rn0vJsyFZqcn3cKz09UvNJl5N3GEh
         I2AD57fB1vnncN8N53Oud7o61pE/4NdWAlNiMyemox2ki56bqwoKUEbMyhG/b9F6N4By
         4z7w==
X-Forwarded-Encrypted: i=1; AJvYcCVchOLzUixSZACLvq/7M1HxBAs7PQkIhsvijd9bvC8IX9kdfXVf5DIg1orhjjItsNxgNSWHqQLMPMfU0w==@vger.kernel.org
X-Gm-Message-State: AOJu0YzxW4oApWghin2A6uS7MLJPxi1rsnIY9F0V9kYGyGL1/pmzdpLc
	GxNU/2KNtD9TJSEOvTMc6XW4sRSD/eUQPMFt8cPVvQ4Hav4vLXfB9V5T
X-Gm-Gg: AY/fxX7b0JVOosf9cT82E+X4/fWUsvKLvfbMJnl+43NeUK5PaugQUSkkTY0uEpv5zly
	oCt8RiE2InoSjPo8ROvy5R+vLCY9HovmauQvAcQbjMZ6lpCGpuw+R088lgBhdLcKefUv1SBMoFH
	0rM5NoWF1anOWjk/bxu5G0tVg0tcwHgZHuRBziwqEM5zj8vVCsyDCrrjC1IAeR+ziVpWOMcZyc+
	lw1+iGEBw03dHh4Y+XaAl0kZZZCuM6wU99C5xY43mZE4t7dqIB6ReNotRKwdBTjU89LjAMtHIyQ
	iBz/Rc2XIiMaNi7GkJYlznwkVNNE1qFbhV+RzgkzvaBkhSyyB5dhkr80pt5exg6a4ex+wgcUg86
	npvHH/fUp+HCTwYXldxFIDYFp9gXsdoQsV/AcpPD5X5EtR8+bFd+5rLTAtUvzheHcWxuVnWmm03
	qxMfx0cXPoHtjCvBLhOIJoG/y5cjGMVSyUymxV95NI8i0bf8afm/RN3tzupGahwuRF+EVFn+q7P
	RF4sX7nc0q3+Ibme6Pn+NNptSeMza8B
X-Google-Smtp-Source: AGHT+IHkLLcdy5t5w8lcYwpa7aN5PM2YSQikFaFZHwIq35VG+97ooL0I8Sxc+NQu2jzK08rf+aGvdA==
X-Received: by 2002:a05:6a00:1f09:b0:781:16de:cc1a with SMTP id d2e1a72fcca58-81b806c7544mr4661904b3a.32.1767859766947;
        Thu, 08 Jan 2026 00:09:26 -0800 (PST)
Received: from visitorckw-work01.c.googlers.com.com (25.118.81.34.bc.googleusercontent.com. [34.81.118.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-819bafe991dsm6900582b3a.16.2026.01.08.00.09.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Jan 2026 00:09:26 -0800 (PST)
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
Subject: [PATCH v2 4/6] dt-bindings: power: supply: google,goldfish-battery: Convert to DT schema
Date: Thu,  8 Jan 2026 08:08:34 +0000
Message-ID: <20260108080836.3777829-5-visitorckw@gmail.com>
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

Convert the Android Goldfish Battery binding to DT schema format.
Move the file to the power/supply directory to match the subsystem.
Update the example node name to 'battery' to comply with generic node
naming standards.

Signed-off-by: Kuan-Wei Chiu <visitorckw@gmail.com>
---
Changes in v2:
- Add reference to power-supply.yaml schema.
- Change additionalProperties to unevaluatedProperties: false.

 .../devicetree/bindings/goldfish/battery.txt  | 17 --------
 .../power/supply/google,goldfish-battery.yaml | 41 +++++++++++++++++++
 2 files changed, 41 insertions(+), 17 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/goldfish/battery.txt
 create mode 100644 Documentation/devicetree/bindings/power/supply/google,goldfish-battery.yaml

diff --git a/Documentation/devicetree/bindings/goldfish/battery.txt b/Documentation/devicetree/bindings/goldfish/battery.txt
deleted file mode 100644
index 4fb613933214..000000000000
--- a/Documentation/devicetree/bindings/goldfish/battery.txt
+++ /dev/null
@@ -1,17 +0,0 @@
-Android Goldfish Battery
-
-Android goldfish battery device generated by android emulator.
-
-Required properties:
-
-- compatible : should contain "google,goldfish-battery" to match emulator
-- reg        : <registers mapping>
-- interrupts : <interrupt mapping>
-
-Example:
-
-	goldfish_battery@9020000 {
-		compatible = "google,goldfish-battery";
-		reg = <0x9020000 0x1000>;
-		interrupts = <0x3>;
-	};
diff --git a/Documentation/devicetree/bindings/power/supply/google,goldfish-battery.yaml b/Documentation/devicetree/bindings/power/supply/google,goldfish-battery.yaml
new file mode 100644
index 000000000000..909252d91c16
--- /dev/null
+++ b/Documentation/devicetree/bindings/power/supply/google,goldfish-battery.yaml
@@ -0,0 +1,41 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/power/supply/google,goldfish-battery.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Android Goldfish Battery
+
+maintainers:
+  - Kuan-Wei Chiu <visitorckw@gmail.com>
+
+allOf:
+  - $ref: power-supply.yaml#
+
+description:
+  Android goldfish battery device generated by Android emulator.
+
+properties:
+  compatible:
+    const: google,goldfish-battery
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
+unevaluatedProperties: false
+
+examples:
+  - |
+    battery@9020000 {
+        compatible = "google,goldfish-battery";
+        reg = <0x9020000 0x1000>;
+        interrupts = <0x3>;
+    };
-- 
2.52.0.457.g6b5491de43-goog

