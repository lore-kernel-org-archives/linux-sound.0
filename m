Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87A642D0615;
	Thu,  8 Jan 2026 22:49:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767912589; cv=none; b=krlxEF7EiLMsttoIwm5+wEJn9stWufTFxQ/Aav3819HBfrmj9fr4xogM8TjAcA17SqSLT2vaW8v7lABiQxxIZOw8l8y1yQtHTsDzVrfYbZm8WCMmMc5MLpmPPjK97/UIoteYnkP0yqmtYihmMrOG9hNTxpuA6IKtgpOhbeOgSWw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767912589; c=relaxed/simple;
	bh=gLUTVZsyrlzlQM2BPw05odFnPxR0Wfu002nPLnUp7tE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=QHm4CrR1MplVTyGCFtMXIbtbFy0K4nKqu13Kcs37HFc8/Mnw8dtSVcJR+FMXFRiVbjlZG8AwJA4c1PbRsFhnHlg2hbEDg+K/ZWZBf9jcQB57bF+mmSNJCKruGGmv7MHT5IzLwsqU3bzgshSY4k4c7RvWV5Mr/q3dcSYuCKpsjUE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=drfh8mEt; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="drfh8mEt"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0A897C116C6;
	Thu,  8 Jan 2026 22:49:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767912589;
	bh=gLUTVZsyrlzlQM2BPw05odFnPxR0Wfu002nPLnUp7tE=;
	h=From:To:Cc:Subject:Date:From;
	b=drfh8mEtaNQj/vzo0dlnRwPecAdGf2qS/KT7xk+Z3GxYlTj5rhR6Fe4X89SGDUYGx
	 9hnar2lvOxLLhRQCDf+PNxyQDqQjpH9Zwvsd/7KoEkNFn+yLyTI1Fr+4+JK9oWGQEk
	 L8xT8kUdH1tVIelIQ4nicr0S3yUAgZvtVVkjisl4vqfg6bSnm0tHAZZM7aeumcWoVW
	 8BSB0yGoknwKIyWBMuRfdDBjegOV0099zUctPq8247OuFaRQ2/JzzDpNS8DZijk/Ec
	 GH/0dCTaV90Wae+gcDlmL2k2nXoK5VRIaaFYV5TuOGBiZU9UaWfNzIpxXJrjM08j3d
	 Om9S15AUKxTkA==
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>
Cc: linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] ASoC: dt-bindings: rockchip-spdif: Allow "port" node
Date: Thu,  8 Jan 2026 16:49:36 -0600
Message-ID: <20260108224938.1320809-1-robh@kernel.org>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add a "port" node entry for Rockchip S/PDIF binding. It's already in use
and a common property for DAIs.

Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
---
 Documentation/devicetree/bindings/sound/rockchip-spdif.yaml | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/sound/rockchip-spdif.yaml b/Documentation/devicetree/bindings/sound/rockchip-spdif.yaml
index 32dea7392e8d..56c755c22945 100644
--- a/Documentation/devicetree/bindings/sound/rockchip-spdif.yaml
+++ b/Documentation/devicetree/bindings/sound/rockchip-spdif.yaml
@@ -70,6 +70,9 @@ properties:
   "#sound-dai-cells":
     const: 0
 
+  port:
+    $ref: /schemas/graph.yaml#/properties/port
+
 required:
   - compatible
   - reg
-- 
2.51.0

