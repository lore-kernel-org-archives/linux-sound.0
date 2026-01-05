Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7639D23184F;
	Mon,  5 Jan 2026 19:32:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767641533; cv=none; b=ttmTA6y0zRSA5PbyHW+uofGqBWwmVaPOIaocHy7zM6C3Ds0WQoaNkZmXqSeoQ90quc/UTbhuNbgcnxiuHbUJtaSq34Qgq1YA6AIwWVgCv2o3pWGnr1bU+YQhmD43SMbiaoOqwMBYhygkmY9v09J62RLCv7C4yi5viz0xrN14MqE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767641533; c=relaxed/simple;
	bh=KBG4rviyS0j6Xo5va6SbAcnrxZBfIhv+e+OgRAYM6TM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=DhncB2Iamw8j/j7jUcotJTb7O4mD9+JC/mhr/ouZiTX2iYyxL+pZVWaZDSvDWINBBfLQg7JAK5wSUwF07MLfUgvv+bk9/cXmpQw3943KPhMp9FYhq2QwIhvUV4SFJAbu2HCEJ+YarohXgf44wP9c73wbqqCa7pavF9dwzBIZsRQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=oWGXp6aL; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="oWGXp6aL"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BA9B2C116D0;
	Mon,  5 Jan 2026 19:32:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767641532;
	bh=KBG4rviyS0j6Xo5va6SbAcnrxZBfIhv+e+OgRAYM6TM=;
	h=From:To:Cc:Subject:Date:From;
	b=oWGXp6aLh47mBISayyU2wHoYxDZ/UzjaKt5m9A7587BJC2tchvadf+BHwutJ9N88S
	 dGpFgGd+KETpeHR0G1xdajsjbvxdWt0oX2CIkuJ+k+9t0MUUAFuhCE6tXJOqd/CRKm
	 NmVqwEL18z7T2Z2NsNHqFwIeJxpxhar5iHh9JnXImgWVa6ybr1cQuQWv4Lsuqj8T28
	 9bp3mgIK4lcu7QetNGdovj2FVWzJjmGEwPy5bG9Q7ACVNwJsRhFBB/Q5EfpoK/fYD7
	 0FDzCL8SY9fZPq0haIHPzx6fX14uV42UPkHv0UB+N498lb66iUzTOnGCo3exlQEzgG
	 cE+5E4kebsy5g==
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Daniel Drake <drake@endlessm.com>,
	Katsuhiro Suzuki <katsuhiro@katsuster.net>,
	Matteo Martelli <matteomartelli3@gmail.com>,
	Binbin Zhou <zhoubinbin@loongson.cn>
Cc: linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] ASoC: dt-bindings: everest,es8316: Add interrupt support
Date: Mon,  5 Jan 2026 13:32:03 -0600
Message-ID: <20260105193203.3166320-1-robh@kernel.org>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The Everest ES8316 has interrupt capability on its GPIO3 pin for
headphone detection. Several of the RockPi 4 variants are using it
already.

Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
---
 Documentation/devicetree/bindings/sound/everest,es8316.yaml | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/sound/everest,es8316.yaml b/Documentation/devicetree/bindings/sound/everest,es8316.yaml
index 81a0215050e0..fe5d938ca310 100644
--- a/Documentation/devicetree/bindings/sound/everest,es8316.yaml
+++ b/Documentation/devicetree/bindings/sound/everest,es8316.yaml
@@ -49,6 +49,10 @@ properties:
     items:
       - const: mclk
 
+  interrupts:
+    maxItems: 1
+    description: Headphone detect interrupt
+
   port:
     $ref: audio-graph-port.yaml#
     unevaluatedProperties: false
-- 
2.51.0

