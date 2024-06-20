Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 908251CB301
	for <linux-sound@vger.kernel.org>; Thu, 20 Jun 2024 17:58:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718906303; cv=none; b=cs7NMptUUUIUDWy0bC8myW/cDKpFItl5msw2djcSB61ONv3EpDKOwlVkKwhSsXXck/L76X2lpcY8BasBlytiuYFWSFh/WX8pJHTFGFOW1IzyUkRQGDtB3dk5R2YwCwjmkwpLyshz6bh9lyJe/0bX8C/QtA8qQ6+v8RyCq2u6O3o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718906303; c=relaxed/simple;
	bh=qFS8dbUIltaliP34b4s9iOYNBl/H/n7Qhca0kv+Esfk=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=VsRLL8hW/LWGnExSnClvX3z5/GfoXuE+jLnrQ2GPSgbUn/aCJHQL1n9xaJ9u3oMDU11WoFERNsZCNRaga+yrElxOG4AtbGVaTfFUpdXAI8ITqhEKlzLp8sWSq7ElwKpw4yKXTIm+Tr6QkAM5cuAX/8/Ry/RltmDJZuOJXCHIGOY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=timesys.com; spf=pass smtp.mailfrom=timesys.com; dkim=pass (2048-bit key) header.d=timesys-com.20230601.gappssmtp.com header.i=@timesys-com.20230601.gappssmtp.com header.b=cFhihpqE; arc=none smtp.client-ip=209.85.218.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=timesys.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=timesys.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=timesys-com.20230601.gappssmtp.com header.i=@timesys-com.20230601.gappssmtp.com header.b="cFhihpqE"
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-a6f7b785a01so126234666b.1
        for <linux-sound@vger.kernel.org>; Thu, 20 Jun 2024 10:58:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=timesys-com.20230601.gappssmtp.com; s=20230601; t=1718906300; x=1719511100; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Dj3DX12QYavc1OOQJN+Lhj+prqOyJf9zJxwWhTZ5aE8=;
        b=cFhihpqEGSNaDlRMjYIJJTJjiUfXMDt8wlISE1cdQN6o8aLt7JcEnbBwLJYm+MzkjB
         aMRm9e2UVA2H0OcRC/SXhT1JbDDQZLt2PdAwqORJ4GQTwimbp8fd4Y3hnpe0ImpJlICU
         KsLyycXIsU0m1O9wegcwMXBPUMwH99id/ixXP1LZC7xvWb5B1BmJSSEX+0OD3/fIBe4a
         M3fHOCAIWgzazbcTTsce+XJAgqvzbR4pn7pkvGslaytZB/LtQhyYEcx/OXb6RUOT/4JY
         c32cltnnt4RhIo8A8Gas6qRcvWv7hE6rFo651SmNsqjJoCnkGmcxxqCqaqealzbUQTfl
         l69w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718906300; x=1719511100;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Dj3DX12QYavc1OOQJN+Lhj+prqOyJf9zJxwWhTZ5aE8=;
        b=eaJwa52/K1nb5rTI8PqKdf0b58wq2HCXh4S+b1f2KaiMvdbX/qJDn//+yTYqnpV6KX
         z46MzLAenWwtJps/HnCDota4a5GJJhefeUJC10/pp0SfmBGE/owEI5GVwdqsYSzwphwo
         Xu+GMMSil6gXSpGn5GEbegtkOo/YsfMLYDJ8LkWRig09Pro7rNVz31hHJYtllizTRHsV
         F0ryajUtyG7ZMOHA4rYB8iza2aBKuAcpLesFXQYax3xEfE9WoYHxRJILokEAlNiIPJMt
         gmMnZ0SckmktseqFk6de+VKzD7D3wXGkONa9EkPxX70Yy2OG4hV5Te2fhDS6fIJT7Lqk
         GAvw==
X-Forwarded-Encrypted: i=1; AJvYcCVMa8v/4PAuS5Bsp0SKeFfzbA/iGljr5+97FI46dTvaXZen0EqD5mkCJ0FC5t2je4gaKCZz/ds1qPTchfP/+3qwis9GUyrlS8Rx/6Q=
X-Gm-Message-State: AOJu0YwWMgyZXIQ/WyXA+azNE7f5l0MpO0MPJsDogEY2jsWmulNsALaI
	fAphEKBtx5HzaSar4C78ZacVLj4ZKguOFFg0PKgmlqzb/7kcxM7xNU9sX89X47U=
X-Google-Smtp-Source: AGHT+IEhPPFEKagTHzQMOwX7NrYh9+xyhRsxpQErqvlswtZC5Lb/tm5y+kINO8slxfzNDjQFWUOp4Q==
X-Received: by 2002:a17:907:a646:b0:a6f:5192:6f4d with SMTP id a640c23a62f3a-a6fab60321fmr428721866b.8.1718906299800;
        Thu, 20 Jun 2024 10:58:19 -0700 (PDT)
Received: from localhost.localdomain ([91.216.213.152])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a6f56f42e80sm781370766b.186.2024.06.20.10.58.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Jun 2024 10:58:19 -0700 (PDT)
From: Piotr Wojtaszczyk <piotr.wojtaszczyk@timesys.com>
To: Vinod Koul <vkoul@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	"J.M.B. Downing" <jonathan.downing@nautel.com>,
	Piotr Wojtaszczyk <piotr.wojtaszczyk@timesys.com>,
	Vladimir Zapolskiy <vz@mleia.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Russell King <linux@armlinux.org.uk>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Andi Shyti <andi.shyti@kernel.org>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Yangtao Li <frank.li@vivo.com>,
	Arnd Bergmann <arnd@arndb.de>,
	Li Zetao <lizetao1@huawei.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Chancel Liu <chancel.liu@nxp.com>,
	dmaengine@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	alsa-devel@alsa-project.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-sound@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-i2c@vger.kernel.org,
	linux-mtd@lists.infradead.org
Cc: Markus Elfring <Markus.Elfring@web.de>
Subject: [Patch v4 02/10] dt-bindings: dma: Add lpc32xx DMA mux binding
Date: Thu, 20 Jun 2024 19:56:33 +0200
Message-Id: <20240620175657.358273-3-piotr.wojtaszczyk@timesys.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240620175657.358273-1-piotr.wojtaszczyk@timesys.com>
References: <20240620175657.358273-1-piotr.wojtaszczyk@timesys.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

LPC32XX SoCs use pl080 dma controller which have few request signals
multiplexed between peripherals. This binding describes how devices can
use the multiplexed request signals.

Signed-off-by: Piotr Wojtaszczyk <piotr.wojtaszczyk@timesys.com>
---
Changes for v4:
- This patch is new in v4

 .../bindings/dma/nxp,lpc3220-dmamux.yaml      | 56 +++++++++++++++++++
 MAINTAINERS                                   |  9 +++
 2 files changed, 65 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/dma/nxp,lpc3220-dmamux.yaml

diff --git a/Documentation/devicetree/bindings/dma/nxp,lpc3220-dmamux.yaml b/Documentation/devicetree/bindings/dma/nxp,lpc3220-dmamux.yaml
new file mode 100644
index 000000000000..a5384b6c67fc
--- /dev/null
+++ b/Documentation/devicetree/bindings/dma/nxp,lpc3220-dmamux.yaml
@@ -0,0 +1,56 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/dma/nxp,lpc3220-dmamux.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: DMA multiplexer for LPC32XX SoC (DMA request router)
+
+maintainers:
+  - J.M.B. Downing <jonathan.downing@nautel.com>
+  - Piotr Wojtaszczyk <piotr.wojtaszczyk@timesys.com>
+
+allOf:
+  - $ref: dma-router.yaml#
+
+properties:
+  "#dma-cells":
+    const: 3
+    description: |
+      First two cells same as for device pointed in dma-masters.
+      Third cell represents mux value for the request.
+
+  compatible:
+    const: nxp,lpc3220-dmamux
+
+  dma-masters:
+    description: phandle to a dma node compatible with arm,pl080
+
+  reg:
+    maxItems: 1
+
+required:
+  - compatible
+  - reg
+  - dma-masters
+
+additionalProperties: false
+
+examples:
+  - |
+    syscon@40004000 {
+      compatible = "nxp,lpc3220-creg", "syscon", "simple-mfd";
+      reg = <0x40004000 0x114>;
+      ranges = <0 0x40004000 0x114>;
+      #address-cells = <1>;
+      #size-cells = <1>;
+
+      dma-router@7c {
+        compatible = "nxp,lpc3220-dmamux";
+        reg = <0x7c 0x8>;
+        #dma-cells = <3>;
+        dma-masters = <&dma>;
+      };
+    };
+
+...
diff --git a/MAINTAINERS b/MAINTAINERS
index aacccb376c28..f7adf9f66dfa 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -2396,6 +2396,15 @@ F:	drivers/usb/host/ohci-nxp.c
 F:	drivers/watchdog/pnx4008_wdt.c
 N:	lpc32xx
 
+ARM/LPC32XX DMAMUX SUPPORT
+M:	J.M.B. Downing <jonathan.downing@nautel.com>
+M:	Piotr Wojtaszczyk <piotr.wojtaszczyk@timesys.com>
+R:	Vladimir Zapolskiy <vz@mleia.com>
+L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
+S:	Maintained
+F:	Documentation/devicetree/bindings/dma/nxp,lpc3220-dmamux.yaml
+N:	lpc32xx
+
 ARM/Marvell Dove/MV78xx0/Orion SOC support
 M:	Andrew Lunn <andrew@lunn.ch>
 M:	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>
-- 
2.25.1

