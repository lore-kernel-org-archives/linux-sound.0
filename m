Received: from mail-qv1-f41.google.com (mail-qv1-f41.google.com [209.85.219.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3D9032D443
	for <linux-sound@vger.kernel.org>; Mon, 12 Jan 2026 20:26:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768249602; cv=none; b=FA3BKtRD08Gp/G3mYR3L8JQBmyPj+lDPe15yWhHhJSNffe3IwOuKukByfAK6eGD2SxUpVYUgwqra+I3s611ki0C2taEbnH74UJjtIp3Lc30gUWjKn8TqF3IYH/6p+idVBJsW0tii5/P+2DzcZeD8NRDbLtm1+M4yQaWWx+lEFPE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768249602; c=relaxed/simple;
	bh=x1koErt0KZrKg7lQQJMxHMUYCfWzQV0KokubZfs0FJs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=NpZxSw+zXV13NROaef9fg8//W4LKs94Fd2vMq2Hp8c2lxFMyaCMkfX+Oys+VwaokTx9S7/+1ga4SHgLGxOz6iTzoOM/t6m1TGwOOMATP9OiwOguefEWw7w2oALqOW/83BoEyqptOAK8VZ+xDlZ2agXwSaZALuPaKbGkFR8WjdGk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Hd/RqjIs; arc=none smtp.client-ip=209.85.219.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Hd/RqjIs"
Received: by mail-qv1-f41.google.com with SMTP id 6a1803df08f44-88a26ce6619so71568586d6.3
        for <linux-sound@vger.kernel.org>; Mon, 12 Jan 2026 12:26:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768249600; x=1768854400; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MnJl4mjA928H7c6+CxPcUynMWnjGzO8z//ft5AvFLSQ=;
        b=Hd/RqjIsZw2dd73Me8xWCwOxjNdUuIUadqkZKBjk7ZIG9//K0dHzVxmWoqE44+V0xa
         DUjvoCpM+X2ffiVSYvezmGWlwtkOELCs/qKTHv3aS7BX3T1yddhaZrBPtZZYacjm3YpH
         tixne9jf/oFQmoZS+HIPTXJW8Hrtxt5Mj1iXUZOzFWUzyUxxfjirz62436SWk74w6oKZ
         jQe2cTRinwRYaVwqLe0+KF099MxBuXWKwYgT6KmSGaHbQN3XGyzknWmiZE3sbI4bOFCC
         YUKijrVmMBuMT+4c71AR4tmGSkjuz9jGD3FGKmsi9h2gRMnFAyh2xZK2ea2jO1c6izix
         wQ3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768249600; x=1768854400;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=MnJl4mjA928H7c6+CxPcUynMWnjGzO8z//ft5AvFLSQ=;
        b=r++zkVTK79CKgOOiXEW7S0BU0KhrgZ+NWPAybaAUi7uz1Xzcf7BuhFls7OtkWKqTwr
         67wfkQpvSHLmZyKNasG5iUIP1pQiYnqnPJMKOMxb/g52EcmyFW5c4DvrB8uU6UgaUIOV
         v8gheuMcvkZUO2q7vadDAoFauCN/GTGhfKL2J57bXmTx1XtxxxsoUZ3be79m7YcCmiHN
         dgVNJMwrvBywcfItXSsBGSzgZaeqpESeT73xCqIGnwCnl3b2o/xgLtFEw7nN78+Zv+Ue
         TqgjJflwfpxCzP/stO8acKIG/stmhByLECE+CPQ+YuAolyKG4mf4d2h5IIfHwl06a8S/
         ErRQ==
X-Forwarded-Encrypted: i=1; AJvYcCXO2bMVrqAsCMTgzqA+G4OEqI1tVhJZWp/nh4ubOtMtgUcIU/HpF/loGYZlCaLxFnjgSq58zS19l60hRg==@vger.kernel.org
X-Gm-Message-State: AOJu0YwHev6skYwGGoa+UVF5tSW4E8cYxrWwnniGP9evFFzKt9o35WTq
	OP8ooGnSpBXysB2ZMuqXmoxNfePjfjLplO/Iei7os/hASc5OXZoIabwoVCf0Ag==
X-Gm-Gg: AY/fxX7AahZ5gBnKYD0ioAC1i9GZCLMmqr8uHuyYEW/YONMqnJE29WroPkc3wpaJI6P
	h8Fp0QRXuo2RtveOjArJ/Iatdq+NaI38+uoW9h/MkQxCt5YYASqpZgN2IZz9SQwUtrfuVTkp8hi
	sTmhJJkx2sXG4M2m6+p605WADXuZr7/EHnEF6ZQXiXISbsH+uZP1OPNLLbItSESZ9d70rSuHQjo
	uBIMgaFtWKHWdj79st9kQ+9xbeIcUAdYbjfL9P+evs9zCnY+JqVudOVKBkczrS/giyES1XtrVqs
	S8hd2PhyyUzli/+V1l4pLH3gA9EhY8b/KNSt82Rk+yy3INUayVDhvqVJ/r5Z2cz6/HP+wuwpE0M
	pGdyQh82WrDqeBurW5FQKRkvioDKA8oogVEyFHobY6TMGTjpnxadVt4zEJWn0Tumzr9yOGo3XWJ
	Q1lEdxozKzd92WuxWek+dMg0vnhPmYakH4tPeDzSxWQvnzcSzaTDHHZPIfefP1Nlm999+4AWt9y
	FQq1z4JmM2KtZv9xLsBIA==
X-Google-Smtp-Source: AGHT+IFEOJtKiZOekw3QKky7cg+SUdsdDlCfIy6gQ1Y92OIF6fv5PXYBPdHBg9wlGXMZd4H/lsyNmg==
X-Received: by 2002:a05:6a20:3952:b0:366:584c:62fa with SMTP id adf61e73a8af0-3898f9053f9mr18835078637.21.1768243935601;
        Mon, 12 Jan 2026 10:52:15 -0800 (PST)
Received: from visitorckw-work01.c.googlers.com.com (25.118.81.34.bc.googleusercontent.com. [34.81.118.25])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c4cca06b16fsm18874197a12.31.2026.01.12.10.52.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Jan 2026 10:52:15 -0800 (PST)
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
Subject: [PATCH v3 6/6] dt-bindings: display: google,goldfish-fb: Convert to DT schema
Date: Mon, 12 Jan 2026 18:50:44 +0000
Message-ID: <20260112185044.1865605-7-visitorckw@gmail.com>
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

Convert the Android Goldfish Framebuffer binding to DT schema format.
Update the example node name to 'display' to comply with generic node
naming standards.

Signed-off-by: Kuan-Wei Chiu <visitorckw@gmail.com>
---
Changes in v3:
- Use decimal format for interrupts in the example.

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
index 000000000000..36ed77cbbcd7
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
+        interrupts = <16>;
+    };
-- 
2.52.0.457.g6b5491de43-goog

