Received: from mail-oa1-f53.google.com (mail-oa1-f53.google.com [209.85.160.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 158431F4CA9
	for <linux-sound@vger.kernel.org>; Tue, 30 Dec 2025 19:58:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767124731; cv=none; b=qms55qanMk9sH87pV20pEC+Jp4zbRF+N3TPYOfBT22IVgiC70cn8nu0rdLSEXLKcUCeDsJhxPyCeBk7TfUSncwmRWmIh/JCcBYXCkSz8ZuM1MKWglCr6mLn4QhP54IPH52LWX+9bKF2ATBxA863C/SGw2DFtLAz/uqNbrIkmBo8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767124731; c=relaxed/simple;
	bh=UfuU7YANuY2DtAb1JPJwiKh/zNCqLQCQAfbDrFS7vE0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Xzq8i+5VDdbIG2fJQKHL3Xm6gXUM8cSCHdM88dTfeWMNlfTnKM6T3I+4fNLl6Gglv4+pg1u9dStPs1f/kOyCelVnpsMM0WcBj+PzY4aXenyMTwXKxn/11cj7HxW/U9uDy6Gz09A+72IoH61NTszA/1b1wRGRmLgnw5R7ebhcYCU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JjYcauAi; arc=none smtp.client-ip=209.85.160.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JjYcauAi"
Received: by mail-oa1-f53.google.com with SMTP id 586e51a60fabf-3ec5df386acso7323412fac.1
        for <linux-sound@vger.kernel.org>; Tue, 30 Dec 2025 11:58:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767124729; x=1767729529; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=83p8xxawIJkmopSMpAdalPGsHw+uQLv1ciZtoS9EH+c=;
        b=JjYcauAifzOSll69Xcvce9/uPSqcfZw9lX07PK7pvENslr9YQ/Tzdd1RRzPkcTVdPU
         5AMBDwPZXQ+Y8qx9oFCKAfVP7DxTlfq7cbJkM4qjM56XQ3jO0I7NYrCO3AHUda/lQ6kG
         PPkfsD/M+BIs7TlF0o67oyQIsCzAwIRKxpWmLb3YiVbV+szyaS2qXHqYQTNnGngHhfJ7
         czNe0OhJOTf9gj/AdqqZIeAVdYK31msub3muhh8/ckmgpn32ZrDkoF7CqhMCIqLieW4f
         2yKCYf8UWqB3l8C+MYXuc1i/so0vKdYa1dwNXJLL3eJMGiyjp98qTJO8mWKhXclXAJdJ
         POGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767124729; x=1767729529;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=83p8xxawIJkmopSMpAdalPGsHw+uQLv1ciZtoS9EH+c=;
        b=GIls/aoHRCUxJvH1yzHKn9OJugBJNC+gL0J3ZgMpCSf6HSc8I0K/g+dayxlsv1p1QY
         RaQUf/yA16/D94Jt6738fjnywFNG2PNZ412hpLw7wr+vcVEK3g9SCSbrEUUend/CYpP8
         K2+q0RZlqKrRPOTEKjh6oKrjrEZTqi/lkMzhAGJtANUoPqhtvXggmR7br0sOuUaKkqW7
         AhSb40aWSMj8Y5CaiRQHY6vLpTGdKx0ibgWIs+XlWeCVNZyeCU1BQOfY8wVfiNJdt8BQ
         Nljzl2GypEtPqQIrtR/PM9BZUmT2GXvet31nz9CUYoWD6qVcXQlLah+OONoR5cdgUq+L
         gGGg==
X-Forwarded-Encrypted: i=1; AJvYcCUk+DtLhTZ/I1/d4OVUGrblZzUTv6wX4S7Fb1KQg4S2BySaJmZavmtdTcsAZStXCsrwHfjX7mVNvPXSCQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxUADaea5pdZuhHVD8kCXCpUXCc86KJQV4r/u9SzBheuQiPvO37
	EnW0OYpBy4Z1/TvqO7aTV/mUPnDtQdeAp1YM5kQfxgCtS7PZFFboIZBq7FCdqQ==
X-Gm-Gg: AY/fxX6p8Ch4K4R2cPlf+F9kNmzZL19RsVsI/NkJiLRmJAqMksd6pu61Zp/Eio26SaK
	kx9k/HdoUrDhzy6fsOWQTzo2QylHgvGWcbtAZ8AF0aC4jgpNTI1F8+UfuXHIk8/OXRYdIwr2f+F
	wO3RYWxkxLj0tW3pDt7KywwlDOi/jMFH/SGCbRk1s/k9NnDJDBsQ/L0OJY73LIIAW1qQUJztj23
	E9U1qpTX6Sh0SvMFh3EB1GRU70P6Bt1leXdJyyKYRyWhI0Yq3Ab4ZX/Z3aQ+yIGJ7EsS/Rcrfk/
	DcGtnKRSNuNLyhIO6GxZ22Idll9OckC8zPmFdZSSKAF1X9Fpd4HqMnev5FNohgXmWC28EtI8reI
	0+8yFDYIg2zAGpybn8XXQmNZdnGNq52pi6w814TvgeSqHlXBFK161BE8rY+bd3kAeLAvVgcdnc9
	+DU+qRvfDWI7lA40IcWVso5pbeau0UqwIcXYtRXb5Uyk/2rqySBtMVQITcOyQFyPYWXuOJFLr89
	aa6ZXNGsuxEL9+Xd/e3PA==
X-Google-Smtp-Source: AGHT+IFIRsb1yFLdQjiEzch59E2/VO7Id1WJQzqg0S6DL4+slVXOXOweBZRKfGEK/PtM3/p1UkcWag==
X-Received: by 2002:a17:90b:3f08:b0:341:8601:d77a with SMTP id 98e67ed59e1d1-34e921ccb3bmr30732436a91.29.1767118270582;
        Tue, 30 Dec 2025 10:11:10 -0800 (PST)
Received: from visitorckw-work01.c.googlers.com.com (25.118.81.34.bc.googleusercontent.com. [34.81.118.25])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c1e7bc69728sm29598278a12.19.2025.12.30.10.11.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Dec 2025 10:11:10 -0800 (PST)
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
Subject: [PATCH 4/6] dt-bindings: power: supply: google,goldfish-battery: Convert to DT schema
Date: Tue, 30 Dec 2025 18:10:29 +0000
Message-ID: <20251230181031.3191565-5-visitorckw@gmail.com>
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

Convert the Android Goldfish Battery binding to DT schema format.
Move the file to the power/supply directory to match the subsystem.
Update the example node name to 'battery' to comply with generic node
naming standards.

Signed-off-by: Kuan-Wei Chiu <visitorckw@gmail.com>
---
 .../devicetree/bindings/goldfish/battery.txt  | 17 ---------
 .../power/supply/google,goldfish-battery.yaml | 38 +++++++++++++++++++
 2 files changed, 38 insertions(+), 17 deletions(-)
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
index 000000000000..a7c98ef56201
--- /dev/null
+++ b/Documentation/devicetree/bindings/power/supply/google,goldfish-battery.yaml
@@ -0,0 +1,38 @@
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
+additionalProperties: false
+
+examples:
+  - |
+    battery@9020000 {
+        compatible = "google,goldfish-battery";
+        reg = <0x9020000 0x1000>;
+        interrupts = <0x3>;
+    };
-- 
2.52.0.358.g0dd7633a29-goog

