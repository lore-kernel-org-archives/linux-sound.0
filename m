Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D9B3260383;
	Tue, 11 Mar 2025 16:34:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741710866; cv=none; b=qFXj394a7wVHTCg6pRcLId11elXwqg7B07f5c7zvWkLKiOnWwoj+nbdCPTlCikLwRFX+Gn1vDSSlyMhySKDFRAiK/u+hZnIPbKWzp80A1Fj7kEB/Z71kINGxs1nXAm3meVepel3W3+a/yONrGlh07fBr0hdOk/xaHuVzxp8eqEk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741710866; c=relaxed/simple;
	bh=hNAzxEX6IvUio8dYBq5iC1JrFqvRdDIob8Pe6pjgCOY=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=FioHwYJpanapPfjLFmMMbrMe0xA1o/GoWjgy6EkaRMjHDErVV+B95Vn8fYar+zADQ6XWjGYXxDu/M7DNaXPnOX9UbWBlnlTcRZlyDuQy77rQ1NZP2qkJTGNNKF10+StEdQUkMasHCvRDyAAnPMybgqWsg8yyt9Vypndh5+z8cSg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jYFEY5Z4; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jYFEY5Z4"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-43bb6b0b898so48937495e9.1;
        Tue, 11 Mar 2025 09:34:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741710863; x=1742315663; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rtbLHz1ogYRzWdnGh7+uet0QbKRU5Eajq4pPXQMZdpo=;
        b=jYFEY5Z4Q6CmsVMIaag4V15qvn3DHtasjFEMilxl+Oo8cmn/VaZ47AuHCDJFP07Or4
         dkFQpLHP7Sk1UwmKp2huus1d5kPOYiIbx2iHhklDVGwljtW4/2oQQGg2GGCivWIUmaeC
         07nVy7q4Y3RIL6fA2Fm1dhk9QxdyXr6o9GZUiowZNBvdQf0f1R4+trRs1CZJemATSSu+
         Vi9XBKsBtsCMh84FLxO3Tx0gVH1wrtrt6Md0vLV0p8S65jvyoIcNdfzZpntUFF/AYQp/
         oVKYG3SlC7UZ4dLETFp1QFZCNfhXYhpiqTcl9S971uuFUl0zp3B7vKHfsN4/TWTiKKUo
         heIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741710863; x=1742315663;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rtbLHz1ogYRzWdnGh7+uet0QbKRU5Eajq4pPXQMZdpo=;
        b=nfEWXecwjyn1KXbuUlhckNQyswV9iscNbwevzixfwew73mGWKy0oDjcMB4zoQVaFCI
         SWtDJPDVNToQhZd+XnHyOx8GSWEW+sR4lV0GOYaI/TvyHiUU3lLVfgfbIjPhN6n1bc4a
         55maM1egNK6U0jPDIvNNKpFbFw7r38K7IkmI46RMIUuUSjm0S6jOhCC/uFoTY2G7XaLJ
         7/hVpOifc9qkqzPWuhFNkSKSgwn2YiiTPoqhbVmzwqKaKo82wKcsxyJzOyBtl58r0iUt
         XX1VGq3ZawnfFnBd/VSYV6ZyB3krExl2zWfRq1q65JPaBj+XqUJEKWFbNq9VVJwwdHoL
         0W6w==
X-Forwarded-Encrypted: i=1; AJvYcCULu/UquWMxUqLAPr50lRFkiIeKRTeBOfxL5wjGrap+nqRpQ4bifNUHZ/hzL8LJGuyVQDIyCl6Nx2Gz@vger.kernel.org, AJvYcCUMhXi3elP0DFMWiRdjTRFS08pNswXdd9NSa3euuTd8pN77UTOP1YR10mgRhQ9U7MSpy2bl88anzpxYZFI=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy6OY18JuNaQXTgEFJldVHeK0vC8YQgzJuPB7eqnZMGYh8+/Gdb
	MNXL6YQ+kzA1qdGo1rNpsN0jCFcm3KEHpT5lEn+20FW6JMtwsZp3
X-Gm-Gg: ASbGncu5Nuvn8lbx5xUtpDIx8hz+Zk+nU+OrIuCg7TCHhLP847UrBtyUHc9qtvZcodn
	uj/VyOy5WeogSws7ASn4LH2X2RTnkMej7CAsdvYzPzPx2ZrgK6wb5QGTVTuAhWipKJ5TGDMzwfx
	5kqFRSdT272fyZMKap2XKliDKLGx2plv8jwLXlGqG4RlK7RGnxO7VD5jiFwvt6vLlEWGngsDpI+
	Dtbvr3UK6PdHFe9a2CxtsEhEiKDPYlpcbvkMXY1kVFIO4vx3FDrkiys+tZxCpthwWehogcpZK87
	UD9iFWAmXno9aZT5OqSTrl0QLYC9JZcJAXy33Ob9bWfXVQWq46XS2WwEInLD2BNSPJfMRXIuPBo
	MM0ntGQE=
X-Google-Smtp-Source: AGHT+IFlQFbhR6ZyJ0YJ4Jp/6nAyf81QOetcCX+atGFftJ3QGc1xuajtd/R1oj0kBDUVF3B5CIeiqw==
X-Received: by 2002:a05:600c:5109:b0:43c:ed61:2c26 with SMTP id 5b1f17b1804b1-43d01be71ecmr58521685e9.17.1741710862554;
        Tue, 11 Mar 2025 09:34:22 -0700 (PDT)
Received: from playground.localdomain ([82.79.237.110])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43d07fd046esm13398935e9.19.2025.03.11.09.34.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Mar 2025 09:34:22 -0700 (PDT)
From: Laurentiu Mihalcea <laurentiumihalcea111@gmail.com>
To: Mark Brown <broonie@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	Sascha Hauer <s.hauer@pengutronix.de>
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>,
	Frank Li <Frank.li@nxp.com>,
	Marco Felsch <m.felsch@pengutronix.de>,
	Iuliana Prodan <iuliana.prodan@nxp.com>,
	Daniel Baluta <daniel.baluta@nxp.com>,
	linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v5 2/3] ASoC: dt-bindings: audio-graph-card2: add widgets and hp-det-gpios support
Date: Tue, 11 Mar 2025 12:32:54 -0400
Message-Id: <20250311163255.2664-3-laurentiumihalcea111@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250311163255.2664-1-laurentiumihalcea111@gmail.com>
References: <20250311163255.2664-1-laurentiumihalcea111@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>

Introduce the 'widgets' property, allowing the creation of widgets from
4 template widgets: Microphone, Line, Headphone, and Speaker. Also
introduce the 'hp-det-gpios' property, which allows using headphone
detection using the specified GPIO.

Signed-off-by: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Reviewed-by: Iuliana Prodan <iuliana.prodan@nxp.com>
---
 .../devicetree/bindings/sound/audio-graph-card2.yaml          | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/sound/audio-graph-card2.yaml b/Documentation/devicetree/bindings/sound/audio-graph-card2.yaml
index f943f90d8b15..94588353f852 100644
--- a/Documentation/devicetree/bindings/sound/audio-graph-card2.yaml
+++ b/Documentation/devicetree/bindings/sound/audio-graph-card2.yaml
@@ -37,6 +37,10 @@ properties:
   codec2codec:
     type: object
     description: Codec to Codec node
+  hp-det-gpios:
+    $ref: audio-graph.yaml#/properties/hp-det-gpios
+  widgets:
+    $ref: audio-graph.yaml#/properties/widgets
 
 required:
   - compatible
-- 
2.34.1

