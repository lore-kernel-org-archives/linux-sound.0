Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A392D2DC77D
	for <linux-sound@vger.kernel.org>; Tue, 30 Dec 2025 18:11:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767118262; cv=none; b=LsohQ7f6xbHChsBsik4pGDZLxPqh4g8x7piCvFXR37bSGtpp5T1QlwjENAw2RQu7o9LpZxQvIJDv0cyMg4NtCygzjVoRIFeaslREmzO+VyVTvX7Jzytj54AJIO0eunGl22CO6+Vr3RlJMs690nkghmLSI7P3Z90BmPJgT2faJBU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767118262; c=relaxed/simple;
	bh=TPtWoE4C3jRebC+9Hd/fYSLNQqRY65T1NXTeH1DCygs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=fFu+VCwQ83OmhixOage5lBfCJ18hJLEy9oQI1Hx0KCHvXF56BF1f9lj4A0UJFe9S4OF83J1YvT7GJp+75t7efBj9CqWEVi+fJ82LIsSgeXZQqdZ5klW8ccuZFBFa3YZiIyq1Cv7nSI3+E0BU+dsvWD9NTso+u069K5AsP4+vKa0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gp2ahs32; arc=none smtp.client-ip=209.85.216.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gp2ahs32"
Received: by mail-pj1-f45.google.com with SMTP id 98e67ed59e1d1-34c1d84781bso11567068a91.2
        for <linux-sound@vger.kernel.org>; Tue, 30 Dec 2025 10:11:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767118260; x=1767723060; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wiqtyI0E+EZ2TXt7IOrDDwvPaZp+SknY+Ea1unU062o=;
        b=gp2ahs32IzCjIw06uLOX9joppinreo8/MHeGq9gZVuKQRB/I+Fj878pzYjDSt3i+ik
         YCqR7uD6CGX1Bfy4tf08jeU+I2ypnyitJ0i4ZH8LK0dpch6MaZEGlDfcQwMMGPFCfH8Y
         lTeJdXxwj1Yj9AICIC+Uptv5n24FzSF6ddlQ9DO48Z40D0BHYwHZSztTnxeqmlVA2g0q
         0Im0LYIXx+32K7MGuICESO/hHYLr48/5kxBZCFdZZoLMEC4Cp9XIo8wT+tRhtQ5ozEp/
         Iu1+Z/rXlu9PVNnauD7QEt9P62uWJFlSZrYH10QrRSA9CRBs+R6feTaTFSL+xUyUf48X
         W/VA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767118260; x=1767723060;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=wiqtyI0E+EZ2TXt7IOrDDwvPaZp+SknY+Ea1unU062o=;
        b=CZj/da0hqpiCEdOWXHGO8TWjmd2WwuHEIbUpnXorraetYumVTX2pxLwUSUQju8Tt5x
         poGRNKbX6N3ceFBW6tveMsmHBntQu32qHfoY/3LP4/V3FWHn/PLSzm4VYq3z3Hq1R6xm
         UHH+LU2B3WD6Q4N/Oq5SxaoCWyE1k3WAG/50l9E/Bz/b2yt3hD4iPzD6TinAHoOHS4e4
         d1PZV9laa4eOzngHb0sNCO7AGnjiyKgkkl+k7XST1kII3dlhPUXg72RFM+Gn4OtHAN1X
         yOpDlZG73Vk4JyYDXoBkmfzYV6roHFuIZoShxCCuglRK3og+be6FWhZmCCt2f51kHlgD
         qlUQ==
X-Forwarded-Encrypted: i=1; AJvYcCXaASenQTZC4HQmBXh7Mj/XUyw7Su2r1t62feAHnNHxu2VTH63d7U6i2xoP8ZZMzNPGtj4OuWZZ9M/dLg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy+tBP83iDo57WkvePq+kHHekiP6SinsUBISMd89t5Gom+JdajL
	xNES/xbxQ+LgXQ1a4Iyi/O3CQ2euLo5FOsYmQbA4GgGvmM9GbuDP3pYKkV6PCQ==
X-Gm-Gg: AY/fxX7SAOBaH9ThE/RSO370V5yIwM2ZXgy/dPTmxayo0eucZGTj7aomr3vqijXQiLN
	loB0Tj3Wslw9eKrj5+NnFZ/8USu2AwwOBs1DbKiA3S0CsJ1r6Y0IueZjW2d4wDo+AVmfrlMUDAE
	aamTFqAInwAs2YaeRUqJiAV5fH5tGdd/rwMrfGRNhvBtc3TTdJ7HYQEpOzTpFar5jadJGffRDf7
	fGpgDuAfDErDZlHDhHYXsidsW+CnqQXsLSgUrBeyJGiFH/d3Q8ifud0JnZ/+hz8zg0epDxGaaUC
	c4ClxrP3VVN4m3cgeuzNcGepLY1UZ8l42q4uW81lhTyXkM5TiUrSb77ThScmJHZwqsjL9Iv2XFI
	LfKpfV6BerFs5YcI0PVqm3ld20NrRt6PLpVd73dDtWhdsJUWHXni9akUV1E87SWJh175ROhwfPg
	J8zIeo1akm22hF8DpMvFSJPC8MTKydffeoVSKXgeSZUo9VaeYC4T9UZJ54TIL5TGWwbd8cCenEj
	daRn4RALb01h9hW2+K2Fg==
X-Google-Smtp-Source: AGHT+IFysb5O/IJUVTITdM4KylhE1TplZEdTk/XkUcd/+h52MkW7iQODmWt+Z3OinYOcQ+IJmSy8Wg==
X-Received: by 2002:a17:90b:1f86:b0:340:2a16:94be with SMTP id 98e67ed59e1d1-34e921137c6mr25807297a91.4.1767118259879;
        Tue, 30 Dec 2025 10:10:59 -0800 (PST)
Received: from visitorckw-work01.c.googlers.com.com (25.118.81.34.bc.googleusercontent.com. [34.81.118.25])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c1e7bc69728sm29598278a12.19.2025.12.30.10.10.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Dec 2025 10:10:59 -0800 (PST)
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
Subject: [PATCH 2/6] dt-bindings: misc: google,android-pipe: Convert to DT schema
Date: Tue, 30 Dec 2025 18:10:27 +0000
Message-ID: <20251230181031.3191565-3-visitorckw@gmail.com>
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

Convert the Android Goldfish QEMU Pipe binding to DT schema format.
Move the file to the misc directory as it represents a miscellaneous
communication device.
Update the example node name to 'pipe' to comply with generic node
naming standards and fix the mismatch between unit address and reg
property in the original example.

Signed-off-by: Kuan-Wei Chiu <visitorckw@gmail.com>
---
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
2.52.0.358.g0dd7633a29-goog

