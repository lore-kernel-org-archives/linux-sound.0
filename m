Received: from out-181.mta1.migadu.com (out-181.mta1.migadu.com [95.215.58.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D483331214
	for <linux-sound@vger.kernel.org>; Sun,  7 Jun 2026 10:59:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780829998; cv=none; b=avyS1NpgiEY531UkXkgse5leDKIizFOtMeYxSKrpEK6WcAajIZshgd6nVODp9hdvLscf0VB3IaYHTxvnLWDUzcVYlrH8QroCN3UbV5nlrhE/PnJ6QdilYrhh2ZfLgpLJZ3Lk1tRa8LRs34L70KT70MB2SfhPUhyLNE1qSu5XGzk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780829998; c=relaxed/simple;
	bh=tBNWRdL1DmSRf5RxUSNWn2Y1GTy8ZM/itRVnPEHbgNc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=hm/kZqDGipYJanSfFJA0lOOvKRfGRufA43Nr2/KOZ+kLPv59RBDoQDkuQsWlOfhglMJQ+lLPgOR0quhDH4FpdYVHJzmuH2VrK0hhj6bHTGpg7kAiSlPXipBR/md/yCnioCAawGA0O6z2QlElPXdzoJf/zszjuVug0/wJAZyyxCI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=cknow-tech.com; spf=pass smtp.mailfrom=cknow-tech.com; dkim=pass (2048-bit key) header.d=cknow-tech.com header.i=@cknow-tech.com header.b=LXI4zFQj; arc=none smtp.client-ip=95.215.58.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=cknow-tech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cknow-tech.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cknow-tech.com header.i=@cknow-tech.com header.b="LXI4zFQj"
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cknow-tech.com;
	s=key1; t=1780829977;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=Cyn/gncd3DffYsVl4KwtQeIdhBYRq+sThUlTyYAeBgc=;
	b=LXI4zFQj5lI2EkFPr/3bEMs2TuWU6dX/gPvUAJWablbt5d485LkPlb9RmExCCrodK30qEZ
	KGVBUbdaQBmHAzSHIRYER06B04/P+Hiyj1MxWBO+JK4xDewI/3cMPjlCIjKdZE13rKZNF9
	LxTK2YJXfVSbp1HkxHhntpcFHYzII22+hOxyJTMCM4ioQY1nDePhBXJa5MTCy63mSvNJ+I
	MkBjikAIPgJ++QngdmOj8gm/cdIfyc61HCvkDJEhqMjMilE4fOW58YxwxHUNG288FTep2o
	o8Tbg3vMu0aqhr+Mmk2lJPb+pNPwyqNOFo+tJMRH53tPl/+smEcQ9gkLmyDwMg==
From: Diederik de Haas <diederik@cknow-tech.com>
To: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Michael Zhang <zhangyi@everest-semi.com>
Cc: linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	Diederik de Haas <diederik@cknow-tech.com>
Subject: [PATCH] ASoC: dt-bindings: everest,es8389: Document audio graph port
Date: Sun,  7 Jun 2026 12:58:49 +0200
Message-ID: <20260607105913.355966-1-diederik@cknow-tech.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT

Provide an endpoint for binding with the other side of the audio link,
which is achieved via the 'port' property.

Signed-off-by: Diederik de Haas <diederik@cknow-tech.com>
---
 Documentation/devicetree/bindings/sound/everest,es8389.yaml | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/sound/everest,es8389.yaml b/Documentation/devicetree/bindings/sound/everest,es8389.yaml
index 75ce0bc48904..7db84cf11386 100644
--- a/Documentation/devicetree/bindings/sound/everest,es8389.yaml
+++ b/Documentation/devicetree/bindings/sound/everest,es8389.yaml
@@ -27,6 +27,10 @@ properties:
     items:
       - const: mclk
 
+  port:
+    $ref: audio-graph-port.yaml#
+    unevaluatedProperties: false
+
   "#sound-dai-cells":
     const: 0
 
-- 
2.53.0

