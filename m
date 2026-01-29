Received: from out-188.mta0.migadu.com (out-188.mta0.migadu.com [91.218.175.188])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B18F734B191
	for <linux-sound@vger.kernel.org>; Thu, 29 Jan 2026 17:23:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.188
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769707405; cv=none; b=gjE/BSGImE0GB/+wqf2vs0xbkqF+zg2IvYOppxLN3rv9LR6olcPXgXoEUeIMysfXAVfrX8mvqCV0XPc32n5/gEbfnBzz01LA1IVi+OqwPm/0QiONIMo3ODovReuBHMqPaaWoJVZPkVqzKglajq1G27NU1dpOdik+qmuTZK1qbME=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769707405; c=relaxed/simple;
	bh=pRBa5TBjuQYiYyDUyFa9T4Jx9I8aK8yOKph8e6rqDMM=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=jesJC+qi0GDokSuzPKuHURdojei+d3hFtAebc56uNxbSEOSBJDKqFKGxCwOfzQ3JnleSIpGg43C8MrOi4V/IH99r6EQrG7nAPKCZHbW2AVziD2ZWJUE858o/i/1+uVR9/imbNTOGv152lgCgr2WXDK+3YWYFsHBWYcRSXFeG71k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=gUibd4dK; arc=none smtp.client-ip=91.218.175.188
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="gUibd4dK"
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1769707401;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=1Puyqb4KlLw9Tw9YVBGXVL1lbSf9jM4gxR8qM3PJNjw=;
	b=gUibd4dKPoVe/gk+34E+1BEgtE1x5UGgCa2Tc8KZCiiA26Yp/nX3+Od1EBm9s9c27qraxZ
	7qktT7InYMiJs/eDsEMHcHp0k08EBMeG1dXvD6Xr+F9hhvExGZ084O90gUbp1Vg5UGbylT
	892LahQ6dunQe5XkgWpgntqpyxJf51s=
From: Sean Anderson <sean.anderson@linux.dev>
To: Vincenzo Frascino <vincenzo.frascino@arm.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	linux-sound@vger.kernel.org
Cc: Jaroslav Kysela <perex@perex.cz>,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Michal Simek <michal.simek@amd.com>,
	Takashi Iwai <tiwai@suse.com>,
	Sean Anderson <sean.anderson@linux.dev>,
	Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Rob Herring <robh@kernel.org>,
	devicetree@vger.kernel.org
Subject: [PATCH 1/2] dt-bindings: sound: xlnx,i2s: Make discoverable parameters optional
Date: Thu, 29 Jan 2026 12:23:14 -0500
Message-Id: <20260129172315.3871602-2-sean.anderson@linux.dev>
In-Reply-To: <20260129172315.3871602-1-sean.anderson@linux.dev>
References: <20260129172315.3871602-1-sean.anderson@linux.dev>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT

These parameters can be discovered from a config register. As they will
not be used any more, mark them deprecated, make them optional, and
remove them from the example.

Signed-off-by: Sean Anderson <sean.anderson@linux.dev>
---

 Documentation/devicetree/bindings/sound/xlnx,i2s.yaml | 8 ++------
 1 file changed, 2 insertions(+), 6 deletions(-)

diff --git a/Documentation/devicetree/bindings/sound/xlnx,i2s.yaml b/Documentation/devicetree/bindings/sound/xlnx,i2s.yaml
index 3c2b0be07c53..180f43f2b230 100644
--- a/Documentation/devicetree/bindings/sound/xlnx,i2s.yaml
+++ b/Documentation/devicetree/bindings/sound/xlnx,i2s.yaml
@@ -29,6 +29,7 @@ properties:
     enum:
       - 16
       - 24
+    deprecated: true
     description: |
       Sample data width.
 
@@ -36,14 +37,13 @@ properties:
     $ref: /schemas/types.yaml#/definitions/uint32
     minimum: 1
     maximum: 4
+    deprecated: true
     description: |
       Number of I2S streams.
 
 required:
   - compatible
   - reg
-  - xlnx,dwidth
-  - xlnx,num-channels
 
 additionalProperties: false
 
@@ -52,14 +52,10 @@ examples:
     i2s@a0080000 {
       compatible = "xlnx,i2s-receiver-1.0";
       reg = <0xa0080000 0x10000>;
-      xlnx,dwidth = <0x18>;
-      xlnx,num-channels = <1>;
     };
     i2s@a0090000 {
       compatible = "xlnx,i2s-transmitter-1.0";
       reg = <0xa0090000 0x10000>;
-      xlnx,dwidth = <0x18>;
-      xlnx,num-channels = <1>;
     };
 
 ...
-- 
2.35.1.1320.gc452695387.dirty

