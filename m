Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 263401B4F1F
	for <linux-sound@vger.kernel.org>; Thu,  2 Apr 2026 05:56:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775109403; cv=none; b=jisiHI2zaDcE1qFeruyGexL4SWEJKdfTHgkLV7lXomG+MUGOzCllPcZ6PnOWN71mniHXjiekDu0Xx4LaobbnwtQxyPrtKvlVSyxZxU0A50WYCROWLtH3x+EJhBaVL0TDnZt5Pi1Y7tJPPnAoP8qOA/8TxAKW/Jb5TQ6gNUTAgrE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775109403; c=relaxed/simple;
	bh=XkR+zn4k/BCu8qKphCVhxX3i/GSEgiXeHl/XYDStLuI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=SJkHscDSm0xlub0uM7SqXAg4jCmjtZUdF1LODyRejuEaZUVckTbHJJKgzGK6w2XpzDjO3aln82eSXQphtmwoePsTg86bbgw5BfZ5M6xCT/XcLKIgoC+xCc7ZEo+6/BhW3KSCPD+DZHtiIRkLNhcfFY0fuQPD5XGyUForTA6Cft0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SAYUV7Sp; arc=none smtp.client-ip=209.85.210.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SAYUV7Sp"
Received: by mail-pf1-f177.google.com with SMTP id d2e1a72fcca58-82a7539851fso223445b3a.1
        for <linux-sound@vger.kernel.org>; Wed, 01 Apr 2026 22:56:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775109401; x=1775714201; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=mPa2JorjoSVyHfMjtpIZG1uYQS3gSdgtgYbveNq9dMc=;
        b=SAYUV7Spk66xHyqjhCPymWce4P79LZ4jhthD3R1RfcuTouAxYVxMczfaK27SgaPksr
         aHdaNhujyXa4sqX13Qc/Dd0/wNOeS0sjHpBmCNAPz98ixwfYXAgagec8fS4WuV0jwYrL
         CQBw6KkO82lIo+KMnAUG9IqfuAxyxo1f4DMYMYXCD9XodLrj9c5kNZK4H3RbkMfhfVW/
         C7J9jmrEPVtbX6+zmcLuYrOPdJvyYKlg/Gf5YZNlSwfshvFZqyVURwaiN8+yEDjhxKbJ
         Lrx2+xKUV4o/YlYbYFXe5GBO8XNwqOZZeJTXogQXsQuD307dp7937TLQk2JIZYm50VFE
         lroQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775109401; x=1775714201;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mPa2JorjoSVyHfMjtpIZG1uYQS3gSdgtgYbveNq9dMc=;
        b=R0AuPR9uO+XXzJ/zhmIU++BENKy8SsU/8zkOZc1gfbuy7hLpQOhjcaLOE6GoKIcJTQ
         NAInOdHcJ87cCbBlBJXZ758RCDYXJr7F4MjWZt+x5qYOKywCirzaZFOaRec/t3nFHtsx
         HgNa6JI6uuCDvP/WAoba272n66hIcfZfuVzx8hpXke3wO8f+R71qGVOaE8RJy2odrQXV
         t33q40h9MJKbQmhwIt2sR1rMitMURorE5uu7CtXA+IRzjFdQkgyJSMISbWOmgatx48m3
         fRPi7iZVhF8Xd5OnOKwX935Ga1FnHvTfZ+sz48k3vpSdRYcu6IYRNwQigj+Zlwdrhh8l
         ss2Q==
X-Gm-Message-State: AOJu0YyIJ/Wwuo47rPTOS0Vp0idL9wqTOxJttkA3BUF+yvKZN9m71QED
	3H81hezw+f59tKj4QOedQQquVFz9ECORlv54oS3SH+TKmoicjTMI64ZmmoDP9LAp
X-Gm-Gg: ATEYQzzgYguiKS/PMN1j5PchYkdxds9zosoctS1wKlKAoZuY+lQUX98vlh4FZRKyNTx
	1n1t0uLMNOTHEPrHh/3xPey8Z9YEVwMh2T25pbcv3h9fpejhFpFVJUAGz9JCE7YzEUUpERESFan
	HqrnkTomO5QwbEtpWRoYjW3P4hWIlXxl+8wBV/8ps4WO7ZGGpe+/Au3KxokeXTOWG42bxbWAUUi
	jDdCQJ9gX9J2hqer0BWFkyS7xO3CB0DlaleXScKDMoOWig9eeEH3LcbDyGGwKWdeFnUewmzvmnh
	olnA2Y3jzvibYDPW2FUyKov1Gr0SKSS35m8iyF5rb8iowkSuqYYswnpNhAZs/IvYI4xa9ooBJ5/
	h7c4WWSkcTZUEWlvWle2FnYRaELimyiE7JfHqnuuF/ZUeK32ntjc6XN5xEwsJHV+y+0b959I0Jk
	21J3AJpiaWfM2+vT/P+D5Z6oGcBEfJfSc66SGdIA==
X-Received: by 2002:a05:6a00:883:b0:823:3079:7c7 with SMTP id d2e1a72fcca58-82cfb9011ecmr2049074b3a.29.1775109401437;
        Wed, 01 Apr 2026 22:56:41 -0700 (PDT)
Received: from localhost ([2401:4900:36c2:bd58:77d1:5e5f:850b:d2c])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82cf9c41bc6sm1760623b3a.29.2026.04.01.22.56.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Apr 2026 22:56:41 -0700 (PDT)
From: Anushka Badhe <anushkabadhe@gmail.com>
To: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>
Cc: linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Anushka Badhe <anushkabadhe@gmail.com>
Subject: [PATCH] ASoC: dt-bindings: rockchip: Convert rk3399-gru-sound to YAML
Date: Thu,  2 Apr 2026 11:26:35 +0530
Message-ID: <20260402055635.8798-1-anushkabadhe@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Convert the rockchip,rk3399-gru-sound.txt DT binding to YAML Schema.

During conversion, property rockchip,cpu was changed from phandle to
phandle-array to properly validate existing DTS usage.

Signed-off-by: Anushka Badhe <anushkabadhe@gmail.com>
---
This was the error reported by dtbs_check when rockchip,cpu was defined as phandle:

sound (rockchip,rk3399-gru-sound): rockchip,cpu:0: [211, 212] is too
long from schema $id:
http://devicetree.org/schemas/sound/rockchip,rk3399-gru-sound.yaml

This error was found when verifying against
rockchip/rk3399-gru-kevin.dtb

 .../sound/rockchip,rk3399-gru-sound.txt       | 22 ---------
 .../sound/rockchip,rk3399-gru-sound.yaml      | 47 +++++++++++++++++++
 2 files changed, 47 insertions(+), 22 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/sound/rockchip,rk3399-gru-sound.txt
 create mode 100644 Documentation/devicetree/bindings/sound/rockchip,rk3399-gru-sound.yaml

diff --git a/Documentation/devicetree/bindings/sound/rockchip,rk3399-gru-sound.txt b/Documentation/devicetree/bindings/sound/rockchip,rk3399-gru-sound.txt
deleted file mode 100644
index 72d3cf4c2606..000000000000
--- a/Documentation/devicetree/bindings/sound/rockchip,rk3399-gru-sound.txt
+++ /dev/null
@@ -1,22 +0,0 @@
-ROCKCHIP with MAX98357A/RT5514/DA7219 codecs on GRU boards
-
-Required properties:
-- compatible: "rockchip,rk3399-gru-sound"
-- rockchip,cpu: The phandle of the Rockchip I2S controller that's
-  connected to the codecs
-- rockchip,codec: The phandle of the audio codecs
-
-Optional properties:
-- dmic-wakeup-delay-ms : specify delay time (ms) for DMIC ready.
-  If this option is specified, which means it's required dmic need
-  delay for DMIC to ready so that rt5514 can avoid recording before
-  DMIC send valid data
-
-Example:
-
-sound {
-	compatible = "rockchip,rk3399-gru-sound";
-	rockchip,cpu = <&i2s0>;
-	rockchip,codec = <&max98357a &rt5514 &da7219>;
-	dmic-wakeup-delay-ms = <20>;
-};
diff --git a/Documentation/devicetree/bindings/sound/rockchip,rk3399-gru-sound.yaml b/Documentation/devicetree/bindings/sound/rockchip,rk3399-gru-sound.yaml
new file mode 100644
index 000000000000..10001fd2f886
--- /dev/null
+++ b/Documentation/devicetree/bindings/sound/rockchip,rk3399-gru-sound.yaml
@@ -0,0 +1,47 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/sound/rockchip,rk3399-gru-sound.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: ROCKCHIP with MAX98357A/RT5514/DA7219 codecs on GRU boards
+
+maintainers:
+  - Heiko Stuebner <heiko@sntech.de>
+
+properties:
+  compatible:
+    const: rockchip,rk3399-gru-sound
+
+  rockchip,cpu:
+    $ref: /schemas/types.yaml#/definitions/phandle-array
+    description:
+      The phandle of the Rockchip I2S controller that's connected to the codecs
+
+  rockchip,codec:
+    $ref: /schemas/types.yaml#/definitions/phandle-array
+    description: The phandle of the audio codecs
+
+  dmic-wakeup-delay-ms:
+    description:
+      specify delay time (ms) for DMIC ready.
+      If this option is specified, which means it's required dmic need
+      delay for DMIC to ready so that rt5514 can avoid recording before
+      DMIC sends valid data
+
+required:
+  - compatible
+  - rockchip,cpu
+  - rockchip,codec
+
+additionalProperties: false
+
+examples:
+  - |
+    sound {
+      compatible = "rockchip,rk3399-gru-sound";
+      rockchip,cpu = <&i2s0>;
+      rockchip,codec = <&max98357a &rt5514 &da7219>;
+      dmic-wakeup-delay-ms = <20>;
+    };
+
-- 
2.43.0

