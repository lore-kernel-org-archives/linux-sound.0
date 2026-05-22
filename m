Received: from smtpbgbr2.qq.com (smtpbgbr2.qq.com [54.207.22.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F14DA3A1691;
	Fri, 22 May 2026 13:12:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=54.207.22.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779455563; cv=none; b=ovblzPuIwwt1zLv8uZlEDUA3zJBdVN2PJBpnsjtHtDwpuzY+7KC0sz6bPp5hZNciUpNsnTILvuH2cBQn3LYXQRru+C4f10/55LNw11XIh9JW2Zb9c89pWJrlIFbwn/5Aqn3u8z61axrXAwkB3YXZHQ0TMmQtunAW8h5RSwXmtpk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779455563; c=relaxed/simple;
	bh=WCbZ8iopcLSLXkEHIgHHSSkd2u1qQfx30P4JpAz6ZKw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=GOj2/x/+tF4fXUYIFuzFT6F8ATs9EqnXL0oRpB2oKijPXhNi8R6u0Dx/z8ANM1t1Y28DUZdv48sMc+EZwycEqzkiR56KGkYQFAxFSUoNVQ2zZvZg/jK24IwnrjNW35Qd9FxX0pSZPPbZJ7er4udkjAlA4jfUMdTAcof4x2JvxYg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.spacemit.com; spf=none smtp.mailfrom=linux.spacemit.com; dkim=pass (1024-bit key) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.b=YHnpkGvr; arc=none smtp.client-ip=54.207.22.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.spacemit.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.spacemit.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.b="YHnpkGvr"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1779455546;
	bh=TmI0UH8/e3iTldNLhwHi7B9I6Rl5C/JYONWEHU21eJ8=;
	h=From:Date:Subject:MIME-Version:Message-Id:To;
	b=YHnpkGvrYJmtUysfQlrSPLBE8N+F2SlhF1tx3JOwFctCaSStRUzflkfEe/jgEV3kG
	 Po9kqkqaTkqYiPbQfJjPI71juRYRM6yrdjkV8p2wbFK2mORSsj6t2y3K7KXeIU91Rz
	 FZQH75xqPt964sDLIcbGIhVSTEM/LZHGGHl17QFg=
X-QQ-mid: esmtpgz11t1779455541te29f3b0a
X-QQ-Originating-IP: VzNX9YRWRqB5R6Dems1eB3rbkqjzRrFXa6EG+p46DKo=
Received: from = ( [61.145.255.150])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Fri, 22 May 2026 21:12:18 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 14195901067407488268
EX-QQ-RecipientCnt: 15
From: Troy Mitchell <troy.mitchell@linux.spacemit.com>
Date: Fri, 22 May 2026 21:12:14 +0800
Subject: [PATCH v3 1/2] ASoC: dt-bindings: add SpacemiT K3 SoC compatible
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260522-k3-i2s-v3-1-08e3eb811d93@linux.spacemit.com>
References: <20260522-k3-i2s-v3-0-08e3eb811d93@linux.spacemit.com>
In-Reply-To: <20260522-k3-i2s-v3-0-08e3eb811d93@linux.spacemit.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1779455534; l=2349;
 i=troy.mitchell@linux.spacemit.com; s=20250710; h=from:subject:message-id;
 bh=WCbZ8iopcLSLXkEHIgHHSSkd2u1qQfx30P4JpAz6ZKw=;
 b=QQGi/9za3k+THqNYX5wU0DsXs1+iVxXoREo75GjalvipjhfOm0a5i8lVp1Da/Yokt0E9yMW6J
 OEhPwxQkzo3BHTyDNudFOVH37fsHX9+5LkbI+1OfKW7Oinou3h/T7O2
X-Developer-Key: i=troy.mitchell@linux.spacemit.com; a=ed25519;
 pk=lQa7BzLrq8DfZnChqmwJ5qQk8fP2USmY/4xZ2/MSsXc=
X-QQ-SENDSIZE: 520
Feedback-ID: esmtpgz:linux.spacemit.com:qybglogicsvrgz:qybglogicsvrgz3a-0
X-QQ-XMAILINFO: MFpdny7R12c2KTyrW6VX2oziyXoN2tBs7SQV50pqPG3XB9QNrOhN6gWU
	axGk2KBfTfNXTlJXGV5Buq7CK7PUcvQ/jyK8FVIYzoWNiAWCPaOYd692gaAfLWMIXNl3jDU
	vFzyqhvTL1t7r6/qdi2Pvzv+BBSKWRvpBlhKB041HCTZEx+5w7/Xf1vO6VFUbMeBg96WwXu
	htQGogzhd2oNh7F68XhMSbmFzwn0wsfb+jzjJ56cDEVMNzodk9WXgvD0klqFwk1n4CjapbN
	fHCIq+icW1fJ2wUM3IpIeqOeXt581WZaQSUOxMUO7Xx5k/R+P5xl0oFdXYWFbkBUryleRBh
	6D0h5vVbSptmdNZLm9D6+3P4H6oRHANBRvs7if959M2PKHgfOEq6V7bQrgWtRHqvFm5AZ5G
	zIL3a1qCbUl2MaYWSwi1KE0TPCR5tBiwR8K6nE/Y2FUub1FE/8jlZd2NnDKbQc5pNfoaQ7E
	Opv/oVeRYZiXdjEvGLP78aLPp91+k2N834+wVBpbw8zzB667vd0SFrngYnKQvg/rLL0BqVm
	ldJ9R830rb+Kbqe+P0Rg0CQOkhXa3XvlTZyozpHahIxw3ZLp3kAd8GXDABhG8Wb9VsrtJFv
	zjZeqSGoB+Cuk+HeY3acWWr0lK6L08FGzDNEjgghrDMCTT3otU3LFBBlxWdRJscmzSJ2rhc
	/06Ys8KmgowGIGkmeyYl61lp7E3otshMzJDmyPmDmOnnm/rhcUJuFRzB9wR/yfqsi7N+EB2
	ROaeUjo4qnmOc/Khu93MlrQye7FQTW8bW2mEU+sMcsERLxs6pjksRu7vQ742vX+VzF+RgQN
	gqFpOYN7HGMUyil4O1pOucMFIXKqwnsOPd9bP7Z9ifV3bZqBP/oNZxD8H/8thXuCr4Z7ekb
	kk3kypGMZ9fHF7EZPrkCY5ZFawodfXwUwdNdYBI9npzd/5ADJ2ToeceU5XjuuxRv5q/qvaM
	QjIU2kY71+hobulX9HdViyXvnX9wBWJYktTwhXMmH/btAMdXwCSfo4EjBgG8qmMCBE6+riV
	UnFZWX0gZaPDmp7iSNvy7P8x1xsUJpS6BYiJi5z045fdxsTEyIwZrRa5F0qqvv4gPChj9hM
	zIR595hGNvutlMd7QseZMRSnumB4IIz1DnSXVSxfq8fNPTUnBPMO8Hf1Fqld4mJOeWQG7gv
	k93FV2QqXuGbvXtZLxyF7xt8RfXVi2jKqTp5xTaN5UUfWtVWM8Njohoi3A==
X-QQ-XMRINFO: OWPUhxQsoeAVwkVaQIEGSKwwgKCxK/fD5g==
X-QQ-RECHKSPAM: 0

Add the spacemit,k3-i2s compatible string for the K3 SoC I2S
controller. The K3 I2S IP is the same as K1 but requires additional
clocks: a dedicated sysclk_div clock, along with common_sysclk and
common_bclk which are shared across multiple I2S controllers on K3.

Acked-by: Rob Herring (Arm) <robh@kernel.org>
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

