Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1A2118622;
	Tue, 19 Dec 2023 12:30:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tq-group.com header.i=@tq-group.com header.b="dDE3bWgO"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1702989006; x=1734525006;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=+sXSTczRsrJn0kE/lmF+JUlGkSXRdBSKQ03I6xnFnTs=;
  b=dDE3bWgO9vtbAUDStiWU9dcDaxJ7vd9H863VOoeKLc0N/0nxdCVNa3jY
   bqUrML4PkHQMXrZczd2QAXRqwM2YkuM4iy493qqzw1OmBLIFSaz3ANyWO
   c1fF+opZxG7UlBs1YIDgORxPiVwJQe2ubDkO44rIoANyjOPZuhReM1gIZ
   S4Sm9zaTAuxL275vl8U3njJRShTP0v0v/DmOxDY2AazMU8MypxqeB0lof
   vU4iPrh6V2WPcTePRa15CNX8GOUYUvF5FpUylS9p+xty1R2U3PRcCZrxB
   RvojWWMvTAm5eQ9yQhB2vAXbhVaJvaPRcY3jCK+Yn8heSYTGsCkqzhte3
   A==;
X-IronPort-AV: E=Sophos;i="6.04,288,1695679200"; 
   d="scan'208";a="34586283"
Received: from vtuxmail01.tq-net.de ([10.115.0.20])
  by mx1.tq-group.com with ESMTP; 19 Dec 2023 13:29:57 +0100
Received: from steina-w.tq-net.de (steina-w.tq-net.de [10.123.53.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by vtuxmail01.tq-net.de (Postfix) with ESMTPSA id 62C6F280084;
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
Subject: [PATCH 2/2] ASoC: dt-bindings: fsl-sai: Support Rx-only SAI
Date: Tue, 19 Dec 2023 13:29:57 +0100
Message-Id: <20231219122957.3358149-2-alexander.stein@ew.tq-group.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231219122957.3358149-1-alexander.stein@ew.tq-group.com>
References: <20231219122957.3358149-1-alexander.stein@ew.tq-group.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On SoC like i.MX8QXP some SAI IP cores support only Rx path. Allow
specifying only an Rx DMA channel, while omitting the Tx one.

Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
---
The feature list in reference manual IMX8DQXPRM Rev. 0 05/2020
section 1.1.2 "Features" explicitly state that SAI2 and SAI3 is
receive only.

 Documentation/devicetree/bindings/sound/fsl,sai.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/sound/fsl,sai.yaml b/Documentation/devicetree/bindings/sound/fsl,sai.yaml
index e90286f9b5fd..1580b1759fad 100644
--- a/Documentation/devicetree/bindings/sound/fsl,sai.yaml
+++ b/Documentation/devicetree/bindings/sound/fsl,sai.yaml
@@ -79,11 +79,13 @@ properties:
     maxItems: 1
 
   dmas:
+    minItems: 1
     items:
       - description: DMA controller phandle and request line for RX
       - description: DMA controller phandle and request line for TX
 
   dma-names:
+    minItems: 1
     items:
       - const: rx
       - const: tx
-- 
2.34.1

