Received: from baptiste.telenet-ops.be (baptiste.telenet-ops.be [195.130.132.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC7FDE576
	for <linux-sound@vger.kernel.org>; Tue, 23 Apr 2024 12:19:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.130.132.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713874778; cv=none; b=mYWlb5hxM9FlW+6CBArKJ9j1eD7PqNKXebHMlJtw20zF1oWxC/oV29oir9jDfBfJhTq51fGl4eaSens2k3NAty1iGy60O31lY0cEzRlw5fZEUAJ7btZJUDvzRJttR1n01+QvBNC2AKKvg1PGQjlpWbKF4IaR02Ou+4k/84qEwJA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713874778; c=relaxed/simple;
	bh=6jEH/pAi1in6+A/unwwPBc/ZKH5MjiTYdiouHLTnAQg=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=QUe0enqrwGxoG7Q90l0Tr9xChVPgyyr5gMh92aN0d+4YtijqmAfM8sCc9MiiW1MMykmH/hqAPxn/gYsgWp9EBt/1HTZwdCzZqccr7GW4+bXkkomJgZIve2Z5zVwP+ANzxnnxpBuk0CyiUVUNT23n94fuDQC9OVb2oiIDjm5rn0M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be; spf=none smtp.mailfrom=linux-m68k.org; arc=none smtp.client-ip=195.130.132.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux-m68k.org
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed80:76d0:2bff:fec8:549])
	by baptiste.telenet-ops.be with bizsmtp
	id EcKT2C00A0SSLxL01cKThf; Tue, 23 Apr 2024 14:19:28 +0200
Received: from rox.of.borg ([192.168.97.57])
	by ramsan.of.borg with esmtp (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1rzF6m-0040uE-97;
	Tue, 23 Apr 2024 14:19:27 +0200
Received: from geert by rox.of.borg with local (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1rzF7P-0072z3-AJ;
	Tue, 23 Apr 2024 14:19:27 +0200
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH] ASoC: dt-bindings: renesas: Fix R-Car Gen4 SoC-specific compatibles
Date: Tue, 23 Apr 2024 14:19:26 +0200
Message-Id: <b3a6cf12c46b23a501b0d54c6892b969e2a55145.1713874657.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

make dtbs_check:

    arch/arm64/boot/dts/renesas/r8a779g0-white-hawk.dtb: sound@ec5a0000: compatible: 'oneOf' conditional failed, one must be fixed:
	    ['renesas,rcar_sound-r8a779g0', 'renesas,rcar_sound-gen4'] is too short
	    ...
	    'renesas,rcar_sound-r8a779h0' was expected

The list of SoC-specific compatible values for R-Car Gen4 SoCs is
mutually-exclusive, just like for other R-Car SoC generations, so it
should use an enum.

Fixes: d6e792ed7dd022a1 ("ASoC: dt-bindings: renesas: add R8A779H0 V4M")
Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 Documentation/devicetree/bindings/sound/renesas,rsnd.yaml | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/sound/renesas,rsnd.yaml b/Documentation/devicetree/bindings/sound/renesas,rsnd.yaml
index b3da278cf141c373..07ec6247d9defc41 100644
--- a/Documentation/devicetree/bindings/sound/renesas,rsnd.yaml
+++ b/Documentation/devicetree/bindings/sound/renesas,rsnd.yaml
@@ -48,8 +48,9 @@ properties:
           - const: renesas,rcar_sound-gen3
       # for Gen4 SoC
       - items:
-          - const: renesas,rcar_sound-r8a779g0  # R-Car V4H
-          - const: renesas,rcar_sound-r8a779h0  # R-Car V4M
+          - enum:
+              - renesas,rcar_sound-r8a779g0  # R-Car V4H
+              - renesas,rcar_sound-r8a779h0  # R-Car V4M
           - const: renesas,rcar_sound-gen4
       # for Generic
       - enum:
-- 
2.34.1

