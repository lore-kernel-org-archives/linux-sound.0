Received: from mail-dy1-f180.google.com (mail-dy1-f180.google.com [74.125.82.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 189C347B435
	for <linux-sound@vger.kernel.org>; Tue, 16 Jun 2026 18:56:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781636189; cv=none; b=P2Xs2ejdn7gwmlDxwttm4NhPrcY4QidAk0LYFs2EavrAzCOe9EJ/ePAOk/miMRD3+1XMk018E+vSA9L0/N5saXLLhKZ57qmYylJSadT5QThCLMT0VqKDQrxqtB3SUQe1WvD2gT2Mt9ABx5KSKpZ0xYaVROevW2zPkmzuIghI75Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781636189; c=relaxed/simple;
	bh=uamPQj2GJcr8hli5E7AL/lW+3vBdlr4biIfKdnJ8WR0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=G+ox2cf1Ol4jX994XcGP28r1pC8rfgKkScsXtL121kqeH2+MziuEqukHvRe/HYjJZ8eiaK+ayo+vz+wFk4bVjlWt1fb3BMPVoQiv+4UGSYg5BMgaVn83sBPCdKofHplyzyjoh+pnTZDlEkaKROkmKpFkQf1WkAK4JqJZj1oV18U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MI+QNfzD; arc=none smtp.client-ip=74.125.82.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MI+QNfzD"
Received: by mail-dy1-f180.google.com with SMTP id 5a478bee46e88-30759632453so7658338eec.1
        for <linux-sound@vger.kernel.org>; Tue, 16 Jun 2026 11:56:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781636187; x=1782240987; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=EIgTF5O/yhj6128vPN9UJW0fZzS2s+5C3Fyk+MW+nJ8=;
        b=MI+QNfzDlzYPtGFsHRXcKe/yNy+9VVS9wzNZUtAcQIsDPp37MTec8K8uWgal61Uu0e
         uf+HoOGYGVGFoQtQZ6+2fzE8aZ3e04pvZGcKp/Hf07q/v/jqUA7SXNisUmKni0Ik5wDy
         i4CRVKMqyc6rbbM0aiqi1Pnz/8dATyHceSDTYm3kfCSIoVIh2PF6j0569xqJlkrgPGe9
         3MU0gTiw3jXZf3v1nByj5gn5KNi8UJvFTFHv7is7HJLCZD4zTuL+4XIDfwnCRx5O37LJ
         4eTdMfLEBFIgL8sSHq0r3ECFfcitBP3IxBUOIQvP1Snk3TCgb2AALMaTBIZermJKEgUT
         5LLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781636187; x=1782240987;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EIgTF5O/yhj6128vPN9UJW0fZzS2s+5C3Fyk+MW+nJ8=;
        b=YecAaoUjp8CyHLfgxPNQPiySm8ypfCA0bA84qThpZCu1R3q3BmiI3NfnIDKxW/kbOK
         cTBXPnRwv5J8keAfHD+3KA5oZoiximKmEs+rCRWJqMnqvVHzMBf5ncEo6WPHBh7Kv9Yi
         lGyH7QZSi3PQv3RPx+zkotx8OiLj3R8K+oJmMRkA43bND2neMUAF/UMGz2/a/hyWtwgH
         BIsv6ZVF3vawDmlOd16mHBEKRZkC6m+QBBRKJ3E3FYUY6QVs3YV6yiCE6Erz6c23MVC8
         21IhHu0B0MbSASbEHRNHwKmFl90MYOUF3z5Ra5eKLW0iHks+uY/uGyLQoCZkexq0TsWb
         AWzw==
X-Forwarded-Encrypted: i=1; AFNElJ+ndyO+PsSdjjCtv4mVuVA50mmsWNCqt290gYlmETkGxjxrlQWE6PWY+W2LWemUCygHaiNSxxlUB6TGHA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxxTtIhqMynBKNcW4ni9tkZb3XxbzXkpYwby5r72TPVpqwiNbgJ
	PevomYDVlR7hr1a8glL9Qv+OrvPMNOoAESTQNqemVbmyP+zaqsTTko4V
X-Gm-Gg: Acq92OFvrmeu5BlWr39Vo1+JbXd4PuY/N52SL7gCmT39zbd4d8Pcd3HcYyUdHLcIAb3
	Qw3LSSE+zO+bfLiZocc5Mgwu3vOBLH37aYJww6ezN2kdqxZ7jb1h7vaS6obkgqlMZLtXsm1MYzB
	LR4LQa4n6RikTDgrylO6v4MwOPo3bnH9ODq7Pxt7qg54ToMI9yeNvBGeP3n/VRiuOPZ8WdnzknZ
	pc1HMoxs7YCfSjb174yLHPnRjBQy4OniywsrgkMSbd+9UrzYqfuYyXsqqLuU0e7F3YOSTB8o5Db
	wvikl91blfA9X+8mC8JOYbhAi47G/6OrmF7jsWOsI1FV0fV5RZxOCrK0JaBOcZ2nBN2ZxKv1a58
	0Ggi722YLmh1sF444Je0SXjJ6XxFEftR6sObnidda8A77YwDRCa1iBCnM3MDjIZVE487Amb8+Ci
	5wBsu0i3KRzZtGCMLb/C3FCvUXyhgxy5c4jVhpu5Ky0w==
X-Received: by 2002:a05:7300:a497:b0:2c5:50fe:c795 with SMTP id 5a478bee46e88-30bca0ed5a2mr321628eec.29.1781636187121;
        Tue, 16 Jun 2026 11:56:27 -0700 (PDT)
Received: from qchaos.cnea.gob.ar ([186.141.198.40])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3081e91f878sm19886502eec.17.2026.06.16.11.56.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Jun 2026 11:56:26 -0700 (PDT)
From: "Pablo D. Bergamasco" <danpablo@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Vaibhav Agarwal <vaibhav.sr@gmail.com>,
	Mark Greer <mgreer@animalcreek.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	"Pablo D. Bergamasco" <danpablo@gmail.com>
Subject: [PATCH] dt-bindings: sound: add toshiba,apb-dummy-codec binding
Date: Tue, 16 Jun 2026 15:56:19 -0300
Message-ID: <20260616185619.1581174-1-danpablo@gmail.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add device tree binding documentation for the Toshiba APBridge
dummy ALSA SoC codec used in the Greybus audio framework.

Fixes the following checkpatch warning:
  WARNING: DT compatible string appears un-documented

Signed-off-by: Pablo D. Bergamasco <danpablo@gmail.com>
---
 .../sound/toshiba,apb-dummy-codec.yaml        | 33 +++++++++++++++++++
 MAINTAINERS                                   |  1 +
 2 files changed, 34 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/sound/toshiba,apb-dummy-codec.yaml

diff --git a/Documentation/devicetree/bindings/sound/toshiba,apb-dummy-codec.yaml b/Documentation/devicetree/bindings/sound/toshiba,apb-dummy-codec.yaml
new file mode 100644
index 000000000000..e0542feeb980
--- /dev/null
+++ b/Documentation/devicetree/bindings/sound/toshiba,apb-dummy-codec.yaml
@@ -0,0 +1,33 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/sound/toshiba,apb-dummy-codec.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Toshiba APBridge Dummy ALSA SoC Codec
+
+maintainers:
+  - Vaibhav Agarwal <vaibhav.agarwal@linaro.org>
+
+description:
+  The APBridge dummy codec is part of the Greybus audio framework,
+  used in Project Ara modular phone hardware. It provides a dummy
+  ALSA SoC codec driver for the APBridge audio interface, enabling
+  audio streaming between Greybus modules and the host processor
+  via the APBridge protocol.
+
+properties:
+  compatible:
+    const: toshiba,apb-dummy-codec
+
+required:
+  - compatible
+
+additionalProperties: false
+
+examples:
+  - |
+    codec {
+        compatible = "toshiba,apb-dummy-codec";
+    };
+...
diff --git a/MAINTAINERS b/MAINTAINERS
index b2040011a386..b6b4b488c0f7 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -11077,6 +11077,7 @@ GREYBUS AUDIO PROTOCOLS DRIVERS
 M:	Vaibhav Agarwal <vaibhav.sr@gmail.com>
 M:	Mark Greer <mgreer@animalcreek.com>
 S:	Maintained
+F:	Documentation/devicetree/bindings/sound/toshiba,apb-dummy-codec.yaml
 F:	drivers/staging/greybus/audio_apbridgea.c
 F:	drivers/staging/greybus/audio_apbridgea.h
 F:	drivers/staging/greybus/audio_codec.c
-- 
2.54.0

