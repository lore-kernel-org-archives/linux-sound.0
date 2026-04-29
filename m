Received: from smtpbgsg2.qq.com (smtpbgsg2.qq.com [54.254.200.128])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 622BB22370A;
	Wed, 29 Apr 2026 01:39:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=54.254.200.128
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777426759; cv=none; b=sxq997cxxaQonDdosbAh5YIpJs83M3KPvp/UTT7XA7oRWFhLJvlS/GgQQt959xBpyiUFb1On6Cv+x2BRNpfGkAnF3WmCvW+YEunqjJNisONsdCS6DZiH+xAEs1gCxEv7QuZnU7+BJ/g+NfGoQzhja21/+zKH9UT4DVvwMKy/+bc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777426759; c=relaxed/simple;
	bh=PyG99/8R0TpsWO1jWHnifATKcOhOPS8LywBZeCYZFZY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=hpgzD/lylHUVsj8/WGsFOcAWPhvt7ev/kpHRbKKf1NWvlS97SxVnoTtbXPDddkZvSmi3lporNgWz+xXIbrNK+aJZ/5Yf5EKK8slH8xYFyeCM1ouR4LpqgfgkwfyhRDR2uuvKjU5E+DKGJCy4ruvL7Iwl1r04cTrX0zJH7K5Fzfg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.spacemit.com; spf=none smtp.mailfrom=linux.spacemit.com; dkim=pass (1024-bit key) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.b=nHkucCRv; arc=none smtp.client-ip=54.254.200.128
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.spacemit.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.spacemit.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.b="nHkucCRv"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1777426755;
	bh=wUXoDWfKSMmaRMhMXzMvroZGWtAYAAcr+bc0qP0VGz8=;
	h=From:Date:Subject:MIME-Version:Message-Id:To;
	b=nHkucCRvl0GFeUoU8qsUbQDI689HRP6VU2d1huJEi3iQTAE91Ssa1lzi9Y1yWmgR/
	 4IIfaNk5V/xEwzJxo+XapGFwwfWPJXlA0QMTCogH8Y8DCxoACC2Tz3vwqs3vYa1+8Q
	 5ipBkJjo/Ge6afT40zIh8zQUNLWhrwEll/sdveik=
X-QQ-mid: esmtpgz16t1777426751taed3181a
X-QQ-Originating-IP: vI4sGNfIgv1/h6mK+YQd1WJmQOsZPj6r30Cg1uCqF3A=
Received: from = ( [120.237.158.181])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Wed, 29 Apr 2026 09:39:08 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 11863181746122903502
EX-QQ-RecipientCnt: 15
From: Troy Mitchell <troy.mitchell@linux.spacemit.com>
Date: Wed, 29 Apr 2026 09:38:49 +0800
Subject: [PATCH 4/7] ASoC: dt-bindings: add SpacemiT K3 SoC compatible
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260429-k3-i2s-v1-4-2fe99db11ecb@linux.spacemit.com>
References: <20260429-k3-i2s-v1-0-2fe99db11ecb@linux.spacemit.com>
In-Reply-To: <20260429-k3-i2s-v1-0-2fe99db11ecb@linux.spacemit.com>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 Yixun Lan <dlan@kernel.org>, Jinmei Wei <weijinmei@linux.spacemit.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-sound@vger.kernel.org, linux-riscv@lists.infradead.org, 
 spacemit@lists.linux.dev, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, 
 Troy Mitchell <troy.mitchell@linux.spacemit.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1777426731; l=2426;
 i=troy.mitchell@linux.spacemit.com; s=20250710; h=from:subject:message-id;
 bh=PyG99/8R0TpsWO1jWHnifATKcOhOPS8LywBZeCYZFZY=;
 b=XPnYB5sjZ9lutwmRgfjnz0oFWS9Zl6AxEVe+jvTb9maBaSi+h5G1J+ifvsEpt1vdxM4vWqIly
 r4iSsTIbzNCAFX10bIHT7pe+HZc1V1QBdd7FpLdew8mK2kPqfcC5oxk
X-Developer-Key: i=troy.mitchell@linux.spacemit.com; a=ed25519;
 pk=lQa7BzLrq8DfZnChqmwJ5qQk8fP2USmY/4xZ2/MSsXc=
X-QQ-SENDSIZE: 520
Feedback-ID: esmtpgz:linux.spacemit.com:qybglogicsvrgz:qybglogicsvrgz3a-0
X-QQ-XMAILINFO: M/5qe47GLMYOQHgZY0Ycgek5hYmKhrz1s2Pf3TldZ+DzyI4ntzjZTVVq
	reeTDxqTfR2Dj9Ov00i3JLBZOYWDeTLyJ8riYslVZ7nx6CVl3GAO4hnIeHGogWLRH3LvXp/
	U1aWIrFC2hFVUyqlRsDFI5qlaV4i+rVM/xqF5eWiQnop5Nsb9V9KxkPk+5T9BqmEcXauDyR
	8gTEqZmnhmdNyXJncqP0fnUK+hs+J9H295Ns7zVwgnJoTCYISOne170n2Mp7WjwSVjJQnsc
	49QBbUqVuBYqRXZ1SBugVehs/KseKDR1tbRCdWh6XleLRKkZf6H4eAI/F+njWFBc2sica41
	BzOo9XfP0spWSxzHIms4wVX3rGkNLyrV8edHnNQkCWZf3rqHAOUpKg6Wo6wKqM6+U8VNgNv
	TTZtoCil3F/10kQswNSUeh4rbQMOu+D9NHZrQIB3/UuL0EF1oejRB/2bMZCTHxJanzMAUYM
	1jrdu0FrinW+gl8QJ5PAX4pYHi/vhw2IsF67ZlbG4j2aLxlkHC7Oxp3QVHhZWSEiaRewQlY
	l++mucbEJvpeBWBklckQFwA/oNCFdb8NPcHeVWFi5Fb3XcIMkZB+OQZ7LLOdfo2jWFQW5gs
	4zUTrlvr1EjB+H1nB2HjqeqgqyqpMgNcO98LTwJvlURICdcEZOGNaHAi5gMxmTRObxQOfJQ
	hFck1z4fU+7aGU0CCFiuxUq0ANqSyxP+K/vw4l85Up1yw01THvgUnqS98FRq64GhDTL6OZ0
	ml0nblwcwf79Yi+v0hsuf/h/0X7UzC44Sb291ydzLeaF9cW8MA0C50xjd0nAqUaJAm66gG9
	N8CeHntgpt9d4mfjz0Sem+4JJR3kmK709VhdJbhQR3BsZFz80N5Uxtzb8vuC2nUyQMowRM8
	3jPu8FlwVYBp95RiV43czYFTTRj6MJd8EhrSRsU6guClqmNiXc+q8K5vNlxFI97Mew0Kyjy
	YIQ1LdcUBWEYAuctqRO+T5tuLHOfBTVfMBMdVLBgTf+SFsYqNfFB45fb60sgKSl/ZMKAcDK
	Orw1p89bKi73n1vy+q2T8auvQ5ZAQ/IyHof2Eh8ZmBL/sAEgN0LXeidZ9FpJ4Hb74EzwZQW
	7mdIFHiIW2RYuSuw3xrouw7DY2rIZiiSUUZuoWP+PCgUcuR2CxBSVDeJ6TnFHEGHgCZoORp
	S86PuRt7QvcUfiVtxo013tKdtLT9bVIdifez
X-QQ-XMRINFO: MSVp+SPm3vtSI1QTLgDHQqIV1w2oNKDqfg==
X-QQ-RECHKSPAM: 0

Add the spacemit,k3-i2s compatible string for the K3 SoC I2S
controller. The K3 I2S IP is the same as K1 but requires additional
clocks: sysclk_div, common_sysclk, and common_bclk. These common
clocks are shared across multiple I2S controllers on K3.

Also add the spacemit,fixed-sample-rate property which constrains
the sample rate when multiple I2S controllers share a common bclk.

Signed-off-by: Troy Mitchell <troy.mitchell@linux.spacemit.com>
---
 .../devicetree/bindings/sound/spacemit,k1-i2s.yaml | 31 ++++++++++++++++++++--
 1 file changed, 29 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/sound/spacemit,k1-i2s.yaml b/Documentation/devicetree/bindings/sound/spacemit,k1-i2s.yaml
index 55bd0b307d22..240d90402e4f 100644
--- a/Documentation/devicetree/bindings/sound/spacemit,k1-i2s.yaml
+++ b/Documentation/devicetree/bindings/sound/spacemit,k1-i2s.yaml
@@ -4,7 +4,7 @@
 $id: http://devicetree.org/schemas/sound/spacemit,k1-i2s.yaml#
 $schema: http://devicetree.org/meta-schemas/core.yaml#
 
-title: K1 I2S controller
+title: SpacemiT K1/K3 I2S controller
 
 description:
   The I2S bus (Inter-IC sound bus) is a serial link for digital
@@ -15,27 +15,54 @@ maintainers:
 
 allOf:
   - $ref: dai-common.yaml#
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: spacemit,k3-i2s
+    then:
+      properties:
+        clocks:
+          minItems: 7
+        clock-names:
+          minItems: 7
+    else:
+      properties:
+        clocks:
+          maxItems: 4
+        clock-names:
+          maxItems: 4
 
 properties:
   compatible:
-    const: spacemit,k1-i2s
+    enum:
+      - spacemit,k1-i2s
+      - spacemit,k3-i2s
 
   reg:
     maxItems: 1
 
   clocks:
+    minItems: 4
     items:
       - description: clock for I2S sysclk
       - description: clock for I2S bclk
       - description: clock for I2S bus
       - description: clock for I2S controller
+      - description: clock for I2S sysclk divider
+      - description: clock for I2S common sysclk
+      - description: clock for I2S common bclk
 
   clock-names:
+    minItems: 4
     items:
       - const: sysclk
       - const: bclk
       - const: bus
       - const: func
+      - const: sysclk_div
+      - const: c_sysclk
+      - const: c_bclk
 
   dmas:
     minItems: 1

-- 
2.54.0

