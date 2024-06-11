Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7E08176FCF
	for <linux-sound@vger.kernel.org>; Tue, 11 Jun 2024 09:48:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718099328; cv=none; b=roCNLxSKrPEmCxRT4F+ThgzeyypKWkgO1CRCSVdgEcE0HAX7nNqnaglFVjBxdvjsRj5xIJXxRq6+D0R1oqzLn7RcKOBCzP+X7ET8w6JM3UBUiZnlOrWMVWh4kG9t5LhJnK/gJDz3lHxCbJV8l8BfyxZ1JK7yofNvFgjk6zLIADo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718099328; c=relaxed/simple;
	bh=rY1E63AFRlnvfo6oM5WyAgqbtSr3Iiigk/dvnbD7cdM=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=m0AJ8r8UiqESfodQ5Bzuojo8SRl2sm/HB7tt0QgpidgZpVOTY8BfT6Ar628fPDonEPFlMdbLu8ixg7V1WZEQHi61kNvsVLj0RotfkgkpSFf8ajwNprWlamNILQqYHzLqjTdJp0nFi/ys3qjdLQg9F9pXEvU6eg+x/dHjk8nlpC8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=timesys.com; spf=pass smtp.mailfrom=timesys.com; dkim=pass (2048-bit key) header.d=timesys-com.20230601.gappssmtp.com header.i=@timesys-com.20230601.gappssmtp.com header.b=mbiD2GPs; arc=none smtp.client-ip=209.85.208.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=timesys.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=timesys.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=timesys-com.20230601.gappssmtp.com header.i=@timesys-com.20230601.gappssmtp.com header.b="mbiD2GPs"
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-57c7440876bso1074008a12.0
        for <linux-sound@vger.kernel.org>; Tue, 11 Jun 2024 02:48:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=timesys-com.20230601.gappssmtp.com; s=20230601; t=1718099325; x=1718704125; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3URf1bqoxt6RvPsq+unfHOhtdPyrUcD08+rrLeED5Co=;
        b=mbiD2GPsD6Euborju0ealfurXCJ9AUldpWjr+zUpduWNfqoI5gwBAbs138T2aiLOVB
         KNd6f2Htb6jJkJhztl7EG1dNAmpQJigtjWbdHyTfb/EL2OzDaOfJ1St9Pgg/8Mff1Ji1
         63xZBSOS9QPEI4GCWw7HcJiIGff5qkwyp0p/zaJd/Y99xn3pBRk7x4Id96aysuTB9Z5i
         QRvhI5MHe3ZeeBcYIgeWRJSqdmjj19ZyXEpN61B7Pr8E8iBkmQSKCkLcEYSE/ej0oi40
         BW65Cy6jLpXAazSe3FRXECggmCXtZnA82hmrp53/GP/ZusXo2k59yEovTru+qVhyqQ4g
         Xg1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718099325; x=1718704125;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3URf1bqoxt6RvPsq+unfHOhtdPyrUcD08+rrLeED5Co=;
        b=mPeZCmiPbbKKo8ogJS3iHCmDddgCkwkizqEmJeQF+DsFAc2nL3JDilmm0Y2SttHh3S
         7ed/2M39Lusxkhf+9rr2Yt+NpUroGpySXh6d5BgX0mGom/Sd0Qo6rCFq3TPqamQlBzKf
         NIJdKm3gEx93lmu2lPlLX1PNdb8BlPFr0X05E2JJM5jkFnxS/0XhynUpCCpqbYKmdT9j
         dJbJJE+2G64e1z574XBeQwMD6cllJLXYJTovHfuO98ZF/QBJ5wsFQ7l2n8s6od+vgByU
         tzTSk9iZMwzkiKd8cAg0wy9+Q11PMHE00UwSsqV+DhLzemgbsSMK1sygXWTxlYwVF6E/
         Wlzw==
X-Forwarded-Encrypted: i=1; AJvYcCX7nt41aJEC1aU2oy7RCd1Pe7NZqWmVDyPN7cSoPodR1t/nuqiiynX+N6EkTLOwXqgFtUYMur7oagQ7QPOozgKKARqrzNOQx/CEFW4=
X-Gm-Message-State: AOJu0YzCsmPu5QTPgxUtSw49XWmuqSM8dkIC8ExvImjUppPi25I7GH4D
	tXckXxvm/T3n7PcH8fY9MscFTJJ2kf8IOIjVpCGUJ673gljsBy/9gSvs9Sgafsk=
X-Google-Smtp-Source: AGHT+IF14ZNnXOfobI/WB8lXVND+Ohqa5JoXFDW/TfmN1pVZr0QdPr6CGSC0zuZrHL1qY/x7lEYXOA==
X-Received: by 2002:a50:d712:0:b0:579:e6ff:c61f with SMTP id 4fb4d7f45d1cf-57c508fd7f6mr11085689a12.25.1718099325105;
        Tue, 11 Jun 2024 02:48:45 -0700 (PDT)
Received: from localhost.localdomain ([91.216.213.152])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-57aae2340f6sm9059647a12.90.2024.06.11.02.48.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Jun 2024 02:48:44 -0700 (PDT)
From: Piotr Wojtaszczyk <piotr.wojtaszczyk@timesys.com>
To: 
Cc: Piotr Wojtaszczyk <piotr.wojtaszczyk@timesys.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Vladimir Zapolskiy <vz@mleia.com>,
	Russell King <linux@armlinux.org.uk>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Arnd Bergmann <arnd@arndb.de>,
	Chancel Liu <chancel.liu@nxp.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	alsa-devel@alsa-project.org,
	linuxppc-dev@lists.ozlabs.org
Subject: [Patch v2 2/2] ASoC: dt-bindings: lpc32xx: Add lpc32xx i2s DT binding
Date: Tue, 11 Jun 2024 11:47:52 +0200
Message-Id: <20240611094810.27475-2-piotr.wojtaszczyk@timesys.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240611094810.27475-1-piotr.wojtaszczyk@timesys.com>
References: <[PATCH] ASoC: fsl: Add i2s and pcm drivers for LPC32xx CPUs>
 <20240611094810.27475-1-piotr.wojtaszczyk@timesys.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add nxp,lpc3220-i2s DT binding documentation.

Signed-off-by: Piotr Wojtaszczyk <piotr.wojtaszczyk@timesys.com>
---
Changes for v2:
- Added maintainers field
- Dropped clock-names
- Dropped unused unneded interrupts field

 .../bindings/sound/nxp,lpc3220-i2s.yaml       | 47 +++++++++++++++++++
 1 file changed, 47 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/sound/nxp,lpc3220-i2s.yaml

diff --git a/Documentation/devicetree/bindings/sound/nxp,lpc3220-i2s.yaml b/Documentation/devicetree/bindings/sound/nxp,lpc3220-i2s.yaml
new file mode 100644
index 000000000000..66e48d8a5a1b
--- /dev/null
+++ b/Documentation/devicetree/bindings/sound/nxp,lpc3220-i2s.yaml
@@ -0,0 +1,47 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/sound/nxp,lpc3220-i2s.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: NXP LPC32XX I2S Controller
+
+description:
+  The I2S controller in LPC32XX SoCs to interface codecs and other audo devices.
+
+maintainers:
+  - Piotr Wojtaszczyk <piotr.wojtaszczyk@timesys.com>
+
+properties:
+  compatible:
+    enum:
+      - nxp,lpc3220-i2s
+
+  reg:
+    maxItems: 1
+
+  clocks:
+    items:
+      - description: input clock of the peripheral.
+
+required:
+  - compatible
+  - reg
+  - clocks
+  - clock-names
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/lpc32xx-clock.h>
+
+    i2s0: i2s@20094000 {
+      compatible = "nxp,lpc3220-i2s";
+      reg = <0x20094000 0x1000>;
+      clocks = <&clk LPC32XX_CLK_I2S0>;
+      clock-names = "i2s_clk";
+      status = "disabled";
+    };
+
+...
-- 
2.25.1

