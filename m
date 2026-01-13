Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com [209.85.215.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8959B3876D1
	for <linux-sound@vger.kernel.org>; Tue, 13 Jan 2026 09:26:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768296413; cv=none; b=Plni5jGtoCsMR2NCQrxnnooJF56tun9css87kUkFUkaBBviUEftNFAxRfnthzeI59kfZZzgbhsQxw+bfY7KsWdMh+KVcUVEUPtiGRbf3ggB3TzISe1KQSV8m0zL0+qJu/ILTdMtZTrjicXMMqndqvOo8bdFMt+4L8VQhFTVnsoM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768296413; c=relaxed/simple;
	bh=ws1p+puMOcBf/qfb0sFtnVfbyocdGIjo6AESCEhizgo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Szxph4axoFsoJnsJiKoofKoDfk1CeeZOSjFIENcYhy2Gg3jOyp6wrQ3wHjv/oR8X4KpfapdR7EuszHTsSA+0h3N+Zt3Uz8lf+qRcdN25bYXMvsepm4JEhTAKIyQHJvBBSsmJKfQAZQC6WElGeVNy3wTYTklNgyR8EYf7o8WpwAQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QdHFDrGq; arc=none smtp.client-ip=209.85.215.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QdHFDrGq"
Received: by mail-pg1-f182.google.com with SMTP id 41be03b00d2f7-c06cb8004e8so2750677a12.0
        for <linux-sound@vger.kernel.org>; Tue, 13 Jan 2026 01:26:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768296405; x=1768901205; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=U7EWk7TuRK54To9ZAGQlu+fCN9Q9oadA9Ns4P4AvNGA=;
        b=QdHFDrGqqCR+WcxB146DlBBMKwfRMeXhb3Dpy1o7T8ppDIfxBKmGwj7y/CQHmtc4ft
         IEE4KePrThXEN3XugJJqPbtwPf9TVio+dRxTs7lNju5a6Li7K77eKd6CnsKaQu2u7a4e
         8GW0u7Agubdx4ucIMvZD0C+dgA6pCD7evlOHQqTBJGUIcRwfkijMghBW8SUBY24Q8BDc
         LZ5YAqgKJNMQ601PWds66a7YxKBgc5AUtWKH99EI+EY+OcvXPZiFkmYPnOR7o3Ey4jKk
         FbJ7/p2Sc1oC7v75Z/mL6cUY+fvKjrHzQ+6bdVO8m3GCYeclikBq0a2qvyhzMxWfkJic
         DpnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768296405; x=1768901205;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=U7EWk7TuRK54To9ZAGQlu+fCN9Q9oadA9Ns4P4AvNGA=;
        b=vcuOqzqaYCUReZfiq8K7GfUqjWyN48AWdXof2gD0cprixUWMCzwXszE/Z1c9/qQc77
         Hp5P6CBMw/H25o6Ox1sXKG2R2UY5v/S9wQsT5qt/YEHkDbzN0bmk6B+LqBLGpKVl2G2J
         +IUOqKHAt5Uo26FEmPbLkcxY/cm6ibw3GiqyMX7JtIeYMxiuBeawZ3TMp+7U+C6GX9WY
         6kj4u+IMj8jKJPmj8NjzJ5yefl0JelTb/KLIIoJUosi+dBM3KQs/hCchrmQpWThzc3AO
         NJdk/LGSkN/3hoy2Li8VEfmLRitVC3pJilE6BXQxIbqiZPmPuu/E6K7QhSxV5kg306nD
         CVBA==
X-Forwarded-Encrypted: i=1; AJvYcCWMg5dauOBJMqMFnpxI1W2AgfnONQrs+tVFttgZmAqH28rVWD1TYIGDttxQgTX3lvGci30p4rRg0bMQxw==@vger.kernel.org
X-Gm-Message-State: AOJu0YxAjGGNz/a+GjKRf1+bWhIRExEmrDwDvt8kMt4DYEQTta3Y3u9h
	eG7yLn0VZ9qy6LXO2QkP0Er681FOzQrj+2ieCSYsIRDl/QYNykQiw/K8
X-Gm-Gg: AY/fxX52qHfoTVWv+TVwubAKn1K2faf+4j6tMfRe1l3PD1hyQSbr85b665JPeVa8iWm
	jfjTc2SEyOzdsMMOWBcXNEm0Gtj8XoyLCLQWjSajB/H2gQLHJoQtBBhPWySsSlOxzZY2lMtbo+v
	MCHeKYArekuVZDgoTdOJwkdzrPncGMZZ3Z41tq5QKDuCLMe530Qbss3nDijU50uAFFMVWH5uh//
	BOgMQ5OzntsIztdEpecp+MXjDKq8iPLEPmSBN5obREL9qO3AlnRQRtLHYlQCTgL73lrWfLv2Ogk
	F8GOkRpbGE1SUSECR/flefXIoByA+5tK9S8g1FvxW+Nxve5wbRg8qQtz43AzP0DL/+h5htcgBcq
	Xdih9zjrpjW9MuFsdw/RNUphyeBThht06B72fn0zs2O1Rn6GCX7tkXjUogE4bHcMz2JBUA/dVxv
	rDgibcihb7iZWg3MbZJPtXVu/1SdKVQdXdp/OQgjRyi6O/WuKem/tl/u6IcgMIfb8xVhLqQ+G0g
	xfTW/Ng6LBDILIThG44lw==
X-Google-Smtp-Source: AGHT+IEUC0KJ50PkwzVSwPCDoxMcw68KkQ+8iOouE/4n+Sa2Bhle44HLNHQWtPdhk/bI7tQ9NQN1XA==
X-Received: by 2002:a17:90b:5823:b0:34e:6b7b:ded4 with SMTP id 98e67ed59e1d1-34f68ccceb1mr17985068a91.36.1768296404680;
        Tue, 13 Jan 2026 01:26:44 -0800 (PST)
Received: from visitorckw-work01.c.googlers.com.com (25.118.81.34.bc.googleusercontent.com. [34.81.118.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-34f5f8b0f67sm19483200a91.15.2026.01.13.01.26.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Jan 2026 01:26:44 -0800 (PST)
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
Subject: [PATCH v4 5/6] dt-bindings: sound: google,goldfish-audio: Convert to DT schema
Date: Tue, 13 Jan 2026 09:26:01 +0000
Message-ID: <20260113092602.3197681-6-visitorckw@gmail.com>
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

Convert the Android Goldfish Audio binding to DT schema format.
Move the file to the sound directory to match the subsystem.
Update the example node name to 'sound' to comply with generic node
naming standards.

Signed-off-by: Kuan-Wei Chiu <visitorckw@gmail.com>
---
 .../devicetree/bindings/goldfish/audio.txt    | 17 ---------
 .../bindings/sound/google,goldfish-audio.yaml | 38 +++++++++++++++++++
 2 files changed, 38 insertions(+), 17 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/goldfish/audio.txt
 create mode 100644 Documentation/devicetree/bindings/sound/google,goldfish-audio.yaml

diff --git a/Documentation/devicetree/bindings/goldfish/audio.txt b/Documentation/devicetree/bindings/goldfish/audio.txt
deleted file mode 100644
index d043fda433ba..000000000000
--- a/Documentation/devicetree/bindings/goldfish/audio.txt
+++ /dev/null
@@ -1,17 +0,0 @@
-Android Goldfish Audio
-
-Android goldfish audio device generated by android emulator.
-
-Required properties:
-
-- compatible : should contain "google,goldfish-audio" to match emulator
-- reg        : <registers mapping>
-- interrupts : <interrupt mapping>
-
-Example:
-
-	goldfish_audio@9030000 {
-		compatible = "google,goldfish-audio";
-		reg = <0x9030000 0x100>;
-		interrupts = <0x4>;
-	};
diff --git a/Documentation/devicetree/bindings/sound/google,goldfish-audio.yaml b/Documentation/devicetree/bindings/sound/google,goldfish-audio.yaml
new file mode 100644
index 000000000000..d395a5cbc945
--- /dev/null
+++ b/Documentation/devicetree/bindings/sound/google,goldfish-audio.yaml
@@ -0,0 +1,38 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/sound/google,goldfish-audio.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Android Goldfish Audio
+
+maintainers:
+  - Kuan-Wei Chiu <visitorckw@gmail.com>
+
+description:
+  Android goldfish audio device generated by Android emulator.
+
+properties:
+  compatible:
+    const: google,goldfish-audio
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
+    sound@9030000 {
+        compatible = "google,goldfish-audio";
+        reg = <0x9030000 0x100>;
+        interrupts = <4>;
+    };
-- 
2.52.0.457.g6b5491de43-goog

