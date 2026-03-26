Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8EBB402BB3
	for <linux-sound@vger.kernel.org>; Thu, 26 Mar 2026 15:31:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774539079; cv=none; b=gfVcDGZqfgZ7GkACI+uaNujW83Qasysa8I8Qtjtawfe5pKZpuH5Wpx3om4UDdSHV+SAJn9VBh7lLRyhjbhSipMvjJdAbOA3kJKPQ4TPQAcNYPjvu9x/Nl1xPgm8dbQUqp/ljLqcNYpZZLJ6u4NCQsxEIh7mWmC/LI95XS8UJabc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774539079; c=relaxed/simple;
	bh=UL4qhY1GW6q837tlvmze48qQ8k9CAYqbOo9E/+wgRyY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=MhBG7Km5ewmINZ6xmOEfuU3MIxJd/W+zRmo97dhyqhrBZ1zGfilndniZltNNQB5l4RVVX1uOXr/mpNyyzNMXe6B7qhLjh/Qi5WMzgunJOOb4/turFBBT/ikL3TprL86evmdebvR8WmYhiuP70jVkecBK2qNfFjKa46YF5gahYHs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UlipWtYZ; arc=none smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UlipWtYZ"
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-2b0603ee486so7353215ad.0
        for <linux-sound@vger.kernel.org>; Thu, 26 Mar 2026 08:31:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774539076; x=1775143876; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=GMDen7TgZzaqdsouNW3DcdKw+MMrqwjkqsk86h7I8tE=;
        b=UlipWtYZX0UGtXGL8QiXXsHQJr8+1pmyVRSLz0TaHiBF6EJbYlHtb6HICs74l8IeXv
         q4uDyMQJgB4hfDL6UfLScTS7/UHMISlzHAxlmb6zb7Y7jsg0wa0GXkcnlvXTwqXV7oxS
         uq7zks5El3bt1ZVLwyjBij/ErYZZ3AVRA6qK5/G5AL+gWfboW3bHXdX20mRyIgIYkyXW
         LZciEjjZyurKm+jbwNOEmKUIwjaIQlF4HkYMdXuiohwmszPdEzhSoIpTAN4jQIe+Xjgq
         oBl+RhQw4n2o8YT4guPXWXvzZ08viXrv0zPZqBmPVCI+XQIR39F/tumH9O/Ujbk9jY/u
         9vNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774539076; x=1775143876;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GMDen7TgZzaqdsouNW3DcdKw+MMrqwjkqsk86h7I8tE=;
        b=rC9LJXzvy7oKcTx49VMHZIr1dZVXsrgQJokuFNfodp9gIM0EX1vBhUBzNYSsQWlGb8
         7BHtx+pJ7zvY09j2a1MiItCylqnGNvG/cOzx+66V0nz8mlTFAUz7svZfA9V21SZNFY8v
         onqmm1YaXfAq95TvaLubcvV93/doXWOREU+NASiO1x7aHJzM0QpAsrTnESCYPB2P4Dud
         IL/o+UCHnVfSjcsYi3dht3dr3JnVuapMfophkhTU89mHp1zJaZ9qDStlO+zmf1k5pooU
         JYuHLhnzlpEhwAf0QdF326r8DH0Qt2Emgje3xkwWdrNfcBismZh8cBI8Em8GDHp7muOK
         MScA==
X-Forwarded-Encrypted: i=1; AJvYcCUeRCXo1hnckvNEg06i7klkOzzarF3Vs068aE1CzXWwLUK6Kjppqf91XAdYLsKvwm+Cl8pppWM+VIN0FQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YyWoskRTaYwGAJqfsMEh/mlGvLs4BpQwDRQml2RjkwYn/tHAEIp
	NF21X/PdfJTIo0p7wuFj0bll+VTefnbDQ4gY1cquCGqFNKEaN0zeLO7J
X-Gm-Gg: ATEYQzx28G0QYx8iC1vhY2ODqIVqvJuUIL60vkYqeBR0YU5fKB0nqLOaHKEtxqL0wOd
	96uklFxcziMEt7vqPEscURKlcKevWLpoImHT1kp66iqs2y5SSRzw1ScAc8JkN/hlB0HNXuJLjHQ
	3RNZL9UjbEnH4fm1phUb5XsKhaNXvkKGxfZC64NeYifEEjY1+nKzSNBLU0vYXGjfvieeiP5tww0
	2H2W89gv2ccsgX+TpwBC/OjNIxvqJqFSvFQLFHurD82VTRGFwdOuHj9ply340DivbS9c4E8mBCG
	3Z1qQp8AUxk5hr1+6bVuScaRn3nILcvCqSjuNAL/XNsC0yNjQJRZ+6kMYMvX4rfZBsOrAnQx1hP
	Hl80LLsoLkOejsh6B1uNfVjCxKoK8J7kKXvaOOW8F9pQPkdpByFzHDQgcHdZihF4zPzzpe5ZobA
	2JxZF2FzalJZWp17zb4hL8mTSq+2BCKZLIgJArxSDLKmVzBlH0
X-Received: by 2002:a17:902:d501:b0:2b0:b1e2:583 with SMTP id d9443c01a7336-2b0b1e22151mr88076775ad.2.1774539075760;
        Thu, 26 Mar 2026 08:31:15 -0700 (PDT)
Received: from padmashree.. ([2401:4900:94ef:3410:d6b4:902f:d713:b1b1])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b0bc7bbe57sm45130925ad.34.2026.03.26.08.31.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Mar 2026 08:31:15 -0700 (PDT)
From: Padmashree S S <padmashreess2006@gmail.com>
To: k.marinushkin@gmail.com,
	lgirdwood@gmail.com,
	broonie@kernel.org
Cc: robh@kernel.org,
	conor+dt@kernel.org,
	krzk+dt@kernel.org,
	linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Padmashree S S <padmashreess2006@gmail.com>
Subject: [PATCH] dt-bindings: sound: Convert pcm3060 to DT schema
Date: Thu, 26 Mar 2026 21:00:40 +0530
Message-ID: <20260326153041.496811-1-padmashreess2006@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Note:
* This patch is part of the GSoC2026 application process for device tree bindings conversions
* https://github.com/LinuxFoundationGSoC/ProjectIdeas/wiki/GSoC-2026-Device-Tree-Bindings

Signed-off-by: Padmashree S S <padmashreess2006@gmail.com>
---
 .../devicetree/bindings/sound/pcm3060.txt     | 23 ----------
 .../devicetree/bindings/sound/pcm3060.yaml    | 45 +++++++++++++++++++
 2 files changed, 45 insertions(+), 23 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/sound/pcm3060.txt
 create mode 100644 Documentation/devicetree/bindings/sound/pcm3060.yaml

diff --git a/Documentation/devicetree/bindings/sound/pcm3060.txt b/Documentation/devicetree/bindings/sound/pcm3060.txt
deleted file mode 100644
index 97de66932d44..000000000000
--- a/Documentation/devicetree/bindings/sound/pcm3060.txt
+++ /dev/null
@@ -1,23 +0,0 @@
-PCM3060 audio CODEC
-
-This driver supports both I2C and SPI.
-
-Required properties:
-
-- compatible: "ti,pcm3060"
-
-- reg : the I2C address of the device for I2C, the chip select
-        number for SPI.
-
-Optional properties:
-
-- ti,out-single-ended: "true" if output is single-ended;
-                       "false" or not specified if output is differential.
-
-Examples:
-
-	pcm3060: pcm3060@46 {
-		 compatible = "ti,pcm3060";
-		 reg = <0x46>;
-		 ti,out-single-ended = "true";
-	};
diff --git a/Documentation/devicetree/bindings/sound/pcm3060.yaml b/Documentation/devicetree/bindings/sound/pcm3060.yaml
new file mode 100644
index 000000000000..a0455c9dad73
--- /dev/null
+++ b/Documentation/devicetree/bindings/sound/pcm3060.yaml
@@ -0,0 +1,45 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/sound/pcm3060.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: PCM3060 audio CODEC
+
+maintainers:
+  - Kirill Marinushkin <k.marinushkin@gmail.com>
+
+properties:
+  compatible:
+    const: ti,pcm3060
+
+  reg:
+    maxItems: 1
+    description: |
+      The I2C address of the device
+      or SPI chip select number.
+
+  ti,out-single-ended:
+    type: boolean
+    description: |
+      If present, the output is single-ended.
+      If absent, the output is differential.
+
+required:
+  - compatible
+  - reg
+
+additionalProperties: false
+
+examples:
+  - |
+    i2c {
+      #address-cells = <1>;
+      #size-cells = <0>;
+
+      pcm3060: audio-codec@46 {
+        compatible = "ti,pcm3060";
+        reg = <0x46>;
+        ti,out-single-ended;
+      };
+    };
\ No newline at end of file
2.43.0

