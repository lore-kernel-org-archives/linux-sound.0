Received: from mail-qk1-f181.google.com (mail-qk1-f181.google.com [209.85.222.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32A4F3D6499
	for <linux-sound@vger.kernel.org>; Thu,  8 Jan 2026 10:01:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767866470; cv=none; b=ilZLcpiYFXGGw036ofZl+rjPPCeVQh2YjPzzo0hwOgPqRVxVpd2a7w/IrYWkioQN3k66tFDK6nWHaupShZM9wQSaeXnlbp2yfW1eIOaVMpgwLiFFWluwKu2n8o41kR5D6gFaQro08vVNcJdVf6+bye0UoGh+2NUlaiPVTy/qfwM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767866470; c=relaxed/simple;
	bh=1t0rpAxQeLHUoXH9EqV6OjuM5gq46cEpA0JagdgwR9k=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=mH3FV5SBuMATiMNe9cj9UFYAJhqfk+1rXxF7j1M+77LRv4g1oOwFKiZeeTbNi0XABuFlvZjEBd4o5mKBSh6MgwcVtrbjIyhPbyINTArT6B07ZNyV4rkivuFRTb6+oikVUIerHVnVBFBFCw5dgV4i06q3SKrYRvb/qedC7qJMcwo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=f/8FEpoJ; arc=none smtp.client-ip=209.85.222.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="f/8FEpoJ"
Received: by mail-qk1-f181.google.com with SMTP id af79cd13be357-8b31a665ba5so347728185a.2
        for <linux-sound@vger.kernel.org>; Thu, 08 Jan 2026 02:01:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767866465; x=1768471265; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KNDmxXp+I2DQQMGpjKHJPmnR6bZXLNX2CabD4SmBa4E=;
        b=f/8FEpoJQbP6qWmFr72nxEZuHXe0CxIgI7qmX0o89FvG+XlxwLlt6qwb+ANI8Zexza
         AGZb5bZZmyHH/06Mrw206lhbXw8VKg0u8IZNjjrNbSS4r0zQFnsGdwC+J/VjcobwdfX8
         ICoF9yJ2SlTA1/Zyu/MZiFu9/8snuhvOawdPTjCMCeu4Z35pP3v80mOEOEdTisHMjN+J
         ++tyJcFoIQgc4hLNWeuW6YZtaHi8gxh9DRE7E2DKDuHDzMZcQqMxIWPd+jqalPYIXxA3
         Ieqe2xXyQIJMBpk1SRhYnbMOykUxijBVpkqe3nvECOUw0gJebGrUFxBcWFtVIpTRrV/W
         VSxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767866465; x=1768471265;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=KNDmxXp+I2DQQMGpjKHJPmnR6bZXLNX2CabD4SmBa4E=;
        b=bl5UdywUKdjY8jC6Xa0Ev5t15ymXP3klD1+1BOzc/3jjWSQ4MqEQMpYaJAUajbomQ4
         PKhKM4Lg8o4u4nESy5iQa2kQmXI4kv9LZWfStDedhgodAwjBIzqSqUN06LN6MMG4ZCtH
         2rnTVSQOThevjSxePBJ1HYMAvCFSu6I4w7e25zNFxMjeP696VKwrXe8Y3y8M8vLLeTVV
         g6nNRpZN4qpeVA1bH7sZmlVczmHtIYPc9WtNoXgQlZch/EFCQthnfwsW8nq+fVBItpAu
         0avkKTTDrGc1mlOP77gvALVe9pYcMMlQtUt1hmIzVK6VTvW/4LaTrRAhX0mLvUZvDWcD
         fWIQ==
X-Forwarded-Encrypted: i=1; AJvYcCU68DZOcRtN4K+a1lJEfVRJxPaKUBPhJvtp1Icmfwpe1NRtm9Yww2d6jxT9edHwCv09jp6Z5+PggVAWkg==@vger.kernel.org
X-Gm-Message-State: AOJu0Ywqwz1a3uKPC92yW6O/8C2r/lDSEhNTagf8NoaW4T9zjOfhCABP
	ItDZ6viRRnKz8vrDQJruCt8JfuwU2AZFVdhhW4Zx6FaUtRX3Q3DKfB9/8aDc2w==
X-Gm-Gg: AY/fxX4OUBdgPxhCrdu/fosaWdjik9AFM05uORnD/KDHJSH8EtUKY7ygN9LmBIUjrTC
	5akjpypNfn7Kz7Av6sQqm0wsdHuuXIdwh0EDSVgmxZWssL1DRIQ5HTltJxmtfuXVC+8ZWGTr4Is
	Bn2XmRoLbjXcMhz8uyapE2ja4SXoH4B37QywpfdF5m5XKXMFMctLs13OBjZRCNBvboe9TkL5b6T
	KQNlGHvIxwl3PbMXrMbEgokBXwGDIQFl0v8thxPT4RQeV8tgzSVsU7Au95uw+FLhb9DdAf3mNiI
	hPX6yY0bBCY1c7aP0Kz3lx7lLs+IoFpfNy/oMjxsqLMcbvNnK7gXG9bbB5xvODjRMK0QkH78xW0
	xQbDq0ecYVgFzUfD7bmeF7spwpOKf0bmWoixFwgADtLY0/DJDZWk0p8ixhNZRZ2961eE1IZqmNM
	tyBKKYE8PRrf1Z6Hbg7TF/1pXIBTrKO1s7MOhi1OdrihjGW6r/AogUqkgaZheBemcJtyu8s2O2e
	0o6FPzItRfcELDF4WnsOQ5fc+6+TGSE
X-Google-Smtp-Source: AGHT+IEtkI6q/xm4mTDrq1zwIoRGWeEmLimQWTPdv0cxMzV+X4wwZ1AH39dUZF1XLibUlHDhrrF/7Q==
X-Received: by 2002:a17:90b:1d01:b0:34c:a35d:de1b with SMTP id 98e67ed59e1d1-34f68c48346mr5296424a91.37.1767859752118;
        Thu, 08 Jan 2026 00:09:12 -0800 (PST)
Received: from visitorckw-work01.c.googlers.com.com (25.118.81.34.bc.googleusercontent.com. [34.81.118.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-819bafe991dsm6900582b3a.16.2026.01.08.00.09.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Jan 2026 00:09:11 -0800 (PST)
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
Subject: [PATCH v2 1/6] dt-bindings: serial: google,goldfish-tty: Convert to DT schema
Date: Thu,  8 Jan 2026 08:08:31 +0000
Message-ID: <20260108080836.3777829-2-visitorckw@gmail.com>
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

Convert the Google Goldfish TTY binding to DT schema format.
Move the file to the serial directory to match the subsystem.
Update the example node name to 'serial' to comply with generic node
naming standards.

Signed-off-by: Kuan-Wei Chiu <visitorckw@gmail.com>
---
Changes in v2:
- Add reference to serial.yaml schema.
- Change additionalProperties to unevaluatedProperties: false.

 .../devicetree/bindings/goldfish/tty.txt      | 17 --------
 .../bindings/serial/google,goldfish-tty.yaml  | 41 +++++++++++++++++++
 2 files changed, 41 insertions(+), 17 deletions(-)
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
index 000000000000..0b702c8657c2
--- /dev/null
+++ b/Documentation/devicetree/bindings/serial/google,goldfish-tty.yaml
@@ -0,0 +1,41 @@
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
+allOf:
+  - $ref: /schemas/serial/serial.yaml#
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
+unevaluatedProperties: false
+
+examples:
+  - |
+    serial@1f004000 {
+        compatible = "google,goldfish-tty";
+        reg = <0x1f004000 0x1000>;
+        interrupts = <0xc>;
+    };
-- 
2.52.0.457.g6b5491de43-goog

