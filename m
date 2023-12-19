Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDE4D182CF;
	Tue, 19 Dec 2023 12:30:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tq-group.com header.i=@tq-group.com header.b="aOu5hjZD"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1702989001; x=1734525001;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=646o6wc7uGHm95C0Ll94rSDrk+hRlXnq3SXee/PrxZY=;
  b=aOu5hjZDja3PJBtshv1cwDMwmpbaRsqOnr9JkDjYTOdf+eZKD9om0FiX
   rkKgCi0ktQlpsG51Q2oALX43qqP+Fl4kAyJ/C7VN35+P8gQM530dXfJ8o
   zr60/Ca1WeEUqJFwtxQdyP9NSBcrpBg9uHcwdbBfxnsHsF4dqHjc+w4Vo
   PJfnXmt0yAk9OIvMJoeLIIQDQXTYGcaQzzW6qqmTZbRlXuZA1Bal/GYaJ
   GgyV7HEUcvS/+0aLfDkfMNctf6NXy+cuHDzP921LmXXFjlOpx7+/KDeba
   Oc184L+kw7LHqAW1HBc04UBSfsmk8BzqlJYlVid9X8OUFuKDMEIT4LJTE
   w==;
X-IronPort-AV: E=Sophos;i="6.04,288,1695679200"; 
   d="scan'208";a="34586282"
Received: from vtuxmail01.tq-net.de ([10.115.0.20])
  by mx1.tq-group.com with ESMTP; 19 Dec 2023 13:29:57 +0100
Received: from steina-w.tq-net.de (steina-w.tq-net.de [10.123.53.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by vtuxmail01.tq-net.de (Postfix) with ESMTPSA id 277F0280075;
	Tue, 19 Dec 2023 13:29:57 +0100 (CET)
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shengjiu Wang <shengjiu.wang@nxp.com>
Cc: Alexander Stein <alexander.stein@ew.tq-group.com>,
	linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: [PATCH 1/2] ASoC: dt-bindings: fsl-sai: Add power-domains
Date: Tue, 19 Dec 2023 13:29:56 +0100
Message-Id: <20231219122957.3358149-1-alexander.stein@ew.tq-group.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Some SoC like i.MX8QXP use a power-domain for this IP, so add it to the
supported properties.

Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
---
 Documentation/devicetree/bindings/sound/fsl,sai.yaml | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/sound/fsl,sai.yaml b/Documentation/devicetree/bindings/sound/fsl,sai.yaml
index 088c26b001cc..e90286f9b5fd 100644
--- a/Documentation/devicetree/bindings/sound/fsl,sai.yaml
+++ b/Documentation/devicetree/bindings/sound/fsl,sai.yaml
@@ -75,6 +75,9 @@ properties:
           - const: pll11k
         minItems: 4
 
+  power-domains:
+    maxItems: 1
+
   dmas:
     items:
       - description: DMA controller phandle and request line for RX
-- 
2.34.1

