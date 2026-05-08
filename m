Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0402F2EFDA4;
	Fri,  8 May 2026 18:24:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778264700; cv=none; b=YtQ8mYMREfGa/Z932LbdupDU3aH6h7N/7zTTVWS/B7cx9cab/WN9CLnhAfwmsvqiWVurO0HWwPIw3ORMS4vRrSYIy/KcUuBw3kZBPBc2YsCK0VaqLRXarx9LtwQaVaEOv7oD8QZ4NU+MRhn4tR1pU/bDkzpHEVj5G/IhndaQ/+0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778264700; c=relaxed/simple;
	bh=+dDy4Sjqq5AY6pLl2Yy/ilVxUFJJMhwEepfe/mxYN+U=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=jBrKSHHM4/VXebBex5CXeMA9rTEuKWzad0h5ggKcWXF0h+I6q2Z0BTlKSQXh48k2I5J9m5gWYhTYM54x6SJlWE0J8G5FpOgRiCjQQ9R0R+bzlWdVuGV0s2Wm/naDLGWGRw418pyMeXrcbp2VlJImO9Tb/NMgy1aKCckrCbUt3/s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KZUOR7In; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KZUOR7In"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 70DADC2BCB0;
	Fri,  8 May 2026 18:24:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778264699;
	bh=+dDy4Sjqq5AY6pLl2Yy/ilVxUFJJMhwEepfe/mxYN+U=;
	h=From:To:Cc:Subject:Date:From;
	b=KZUOR7Ing3rdhsLuUrw4FcOylMyjfhSqv26DIBxKllJHtmrIAwFCX3cj2fQWSLciq
	 2bUwnYamwoBe/M+kOxA3MHbmITsntF+1a3eY8qMmPOiFv950xhGGoBb1/eiuroSLG8
	 q4YZTx2hxjIDZKYzfF9kvu3QVoVNITKVXkuxF41qCrB1Jy8QVlpWuDHbyzbWuYaugJ
	 0ql5k38YgybsJPeUftnOPqIuN6qbR1r+laFaU//A6Sv+FSHSGND2Dk6eLju5Uxp/91
	 CXfa1KdOWykUyMD0BTfHDpucFqUdfx8OjUuaOh50PCLK3JWYXyZ/Omk/n4SOoaTK4+
	 NJwFQgPTDpLOQ==
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Koro Chen <koro.chen@mediatek.com>,
	Khushal Chitturi <khushalchitturi@gmail.com>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
	linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH] ASoC; dt-bindings: mediatek,mt8173-rt5650-rt5514: Fix mediatek,audio-codec constraints
Date: Fri,  8 May 2026 13:24:37 -0500
Message-ID: <20260508182438.1757394-1-robh@kernel.org>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

A phandle-array is really a matrix and needs constraints on the number
of elements for both the inner and outer dimensions. Add the missing
inner constraints.

Fixes: 472d77bdc511 ("ASoC: dt-bindings: mediatek,mt8173-rt5650-rt5514: convert to DT schema")
Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
---
 .../bindings/sound/mediatek,mt8173-rt5650-rt5514.yaml           | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/sound/mediatek,mt8173-rt5650-rt5514.yaml b/Documentation/devicetree/bindings/sound/mediatek,mt8173-rt5650-rt5514.yaml
index ed698c9ff42b..becc7a11f8dc 100644
--- a/Documentation/devicetree/bindings/sound/mediatek,mt8173-rt5650-rt5514.yaml
+++ b/Documentation/devicetree/bindings/sound/mediatek,mt8173-rt5650-rt5514.yaml
@@ -18,7 +18,9 @@ properties:
     description: Phandles of rt5650 and rt5514 codecs
     items:
       - description: phandle of rt5650 codec
+        maxItems: 1
       - description: phandle of rt5514 codec
+        maxItems: 1
 
   mediatek,platform:
     $ref: /schemas/types.yaml#/definitions/phandle
-- 
2.53.0

