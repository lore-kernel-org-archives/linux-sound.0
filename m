Received: from smtpbgeu2.qq.com (smtpbgeu2.qq.com [18.194.254.142])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FEEA38737A;
	Wed, 22 Jul 2026 02:37:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=18.194.254.142
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784687834; cv=none; b=uaLyEcYvWRVzt0b66cLB7KBBvmPopuhk79sm/ZfHTdeBs2Jgeyg2AqYtLN0/iXGD7SinACc0zDu56GlZagqp1z2Fyx41UCq80CEmCBNYpgBXSPyXt88OePZqDjEqeQKhVZCgjOZqlEU3GB3ScBuGJytk9tSQGeZMfTW03W7r4GM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784687834; c=relaxed/simple;
	bh=3XclcJ4XW55zz2372RWOxPaffuQ2freHc9ROzBHC7a0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ZG7Xx1sJ4YVIRyxzP9HbEEoEE+htL7Z6yE/dj/AaL7d8765B9NikTI2mUDKlS7FkuabQzRPzcWPg7NOVI4wLHa9aqEkcm8NKJL7sqeB0DNWFZ7IAUkinWgKQ+lZmwx2z5ipZGL0eWCcve3eJ6ngFpSgC0P6HlEa0IXsSFMeQj8Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.spacemit.com; spf=none smtp.mailfrom=linux.spacemit.com; dkim=pass (1024-bit key) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.b=DyGuII3L; arc=none smtp.client-ip=18.194.254.142
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.spacemit.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.spacemit.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.b="DyGuII3L"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1784687787;
	bh=HGW9RS99UXPTRIjcR5ouUmO1WCCQhB7oA3V+O1SJRmE=;
	h=From:Date:Subject:MIME-Version:Message-Id:To;
	b=DyGuII3LFiHsoIp9tHVc/8bzB0TvUMiZjxoCAiObfW/UB7Xa5gdvQWfPrrK+eJ6gD
	 A7ZyX3BcLJLW4hPbMUbBj8XKwAn4HdRZ1BPQzGiFQdNdWI6N7epLS8ln1iFsvMZf4O
	 spRodoyWlkAAgvByzfEaiHdCYgw/QoJtu9bWYBQg=
X-QQ-mid: esmtpsz16t1784687785t775da8d6
X-QQ-Originating-IP: JrFIRd5+Oox+EKXPj8BBg3/w3oO5yvLiSC4GkB9KUSI=
Received: from = ( [120.237.158.181])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Wed, 22 Jul 2026 10:36:22 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 4977255373091264881
EX-QQ-RecipientCnt: 19
From: Troy Mitchell <troy.mitchell@linux.spacemit.com>
Date: Tue, 21 Jul 2026 19:35:56 -0700
Subject: [PATCH 2/3] dt-bindings: sound: spacemit,k1-i2s: allow 6 clocks
 for K3 i2s1
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260721-kx-i2s-dts-v1-2-d22cb6cfaab5@linux.spacemit.com>
References: <20260721-kx-i2s-dts-v1-0-d22cb6cfaab5@linux.spacemit.com>
In-Reply-To: <20260721-kx-i2s-dts-v1-0-d22cb6cfaab5@linux.spacemit.com>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 Yixun Lan <dlan@kernel.org>, Jinmei Wei <weijinmei@linux.spacemit.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>
Cc: linux-sound@vger.kernel.org, linux-riscv@lists.infradead.org, 
 spacemit@lists.linux.dev, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, 
 Troy Mitchell <troy.mitchell@linux.spacemit.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3386;
 i=troy.mitchell@linux.spacemit.com; h=from:subject:message-id;
 bh=3XclcJ4XW55zz2372RWOxPaffuQ2freHc9ROzBHC7a0=;
 b=owGbwMvMwCU2g/N9w09jE33G02pJDFkJOjOVbLv5QmY2tU1UnXpk/mz3NJmXHiw7me+qcfCaS
 a6datfeUcLCIMbFICumyNL9gGdbgU+UbYFAoS/MHFYmkCEMXJwCMJEp9xj+15hbKO+WmvSpRuV4
 9hGm6z5BouuFpHlFAn94S0317735i+F7RabTSkkRS7nPvw9MeLj50MxSdfEj/ZKL/2YKn/QsSGE
 CAA==
X-Developer-Key: i=troy.mitchell@linux.spacemit.com; a=openpgp;
 fpr=3FE5535CF1B0E658E57DB59BAE1C2FBEA7DB42E1
X-QQ-SENDSIZE: 520
Feedback-ID: esmtpsz:linux.spacemit.com:qybglogicsvrgz:qybglogicsvrgz3a-0
X-QQ-XMAILINFO: Nqf9sU0KQdcIlEjrIGd7eOmqGA7gHo4fmyDF+wHpiIvkkqKjtO8rm84y
	e+1pVIwSpcqXLb5alBI9sdy6as9RU3Wy3F9HWaGhj9bQJkzrBWWWqDxHeqSGGOcmJL/PD1w
	1IBilh9d9fFEel8gXbNwnfvlE+tDVnloC7R57L9TNnGfzKGju/L0r+2LQuGfPWluPZivMjB
	1AaybDFDYM4ebnVx4Zww3W0+c8/axtkRg0Eh+amjbcqEtMt581rB/5fH75j7NRLnV/8Si/3
	L7NrTAxcd0jcsnX+yi/4gwq+YTKUNiEXLUqBGEJiC6RyKIXpKfGcuIoERhm22wVB2Ta3S61
	8NcxVAKqk4wUfuG84fll+Rz57zticL2UAVa/BbnHlDCuPg6BkyzhezVXP8Gg0URd3FT9RXq
	QR7pHcmLH6x0bXOfiEuWJ6gJiCX+kgNBQF7LvfBI2LxcR9wNKhPrZkMUKaWhw5CJ3r+kWcu
	57Qsf6e5yIKdtAGGh+c3JUY2fdPLfrqEygF5QDgokSM+zDl8I9YF01lxZ5z71fy6+Std4lK
	ItXDUteiu4LGVleRtlD7R1Pif5YoSiZknfp1B5GSLqFTWVynrnAxOXdYEby29gKo5dE7k7j
	SgzkL4bal+FgOMG4IXa3J2soz43SrDKRpJnIeOsX0nMOx4ypHb3QocaXatsQGQzk5eJnOfc
	9LwWhGAdwfoosoQMVC8u0e8Hb/BfWGJL2JK4gJ1HUthTWiUmYSyRVY7QzyO59corfh4W8FG
	rDXL1/070JUtsKFKpZR2N5L+Gm0OCjFO2k+RDj8UcWqAHiLOTkJv3DW3bdev9rtVB6Ca36d
	+wQID8urQlqmZvLuAOugov2P42O9BOajh6/GvxLlYRz+kg0+zEHCpCnc77fbj7gDZkWwM+i
	6rjSx5jRDAzIPgWuVkGeZt6uu78yeXXaD/FKBmDBhMc41ssQYlMQXDBgOfIDNzHMg2JlhkS
	WB+Ke1s3EezG88hG83SC1xX9k61go2P7NfcgMXW/8ON5m8qu3neRjlBDYXeAL/cxQpDIA85
	1u2i/Cmb8tPqzEgMKYpKlWusOxX9tCZWiOxtpld0Qnhw45QGtfEF5KXecSoxT+nAyP1XK4+
	yG1RjVI07oao1zXU9WSXyhOQDKBMTqgCGwEe32oEZsGz5aXZIFNm0fiaAIPdQNH6mWUQ/VL
	rEY1
X-QQ-XMRINFO: Mp0Kj//9VHAxzExpfF+O8yhSrljjwrznVg==
X-QQ-RECHKSPAM: 0

The K3 I2S controllers normally use the published 7-clock layout:

  sysclk, bclk, bus, func, sysclk_div, c_sysclk, c_bclk

However, K3 i2s1 has no dedicated sysclk divider and therefore uses a
6-clock layout:

  sysclk, bclk, bus, func, c_sysclk, c_bclk

Describe the 4-clock K1 and both K3 layouts as separate tuples. Lower
the K3 minimum from 7 to 6 clocks while preserving the existing
7-clock ordering.

Fixes: 6bc6b28c0314 ("ASoC: dt-bindings: add SpacemiT K3 SoC compatible")
Signed-off-by: Troy Mitchell <troy.mitchell@linux.spacemit.com>
---
 .../devicetree/bindings/sound/spacemit,k1-i2s.yaml | 64 +++++++++++++++-------
 1 file changed, 44 insertions(+), 20 deletions(-)

diff --git a/Documentation/devicetree/bindings/sound/spacemit,k1-i2s.yaml b/Documentation/devicetree/bindings/sound/spacemit,k1-i2s.yaml
index 240d90402e4f..72723f067b2a 100644
--- a/Documentation/devicetree/bindings/sound/spacemit,k1-i2s.yaml
+++ b/Documentation/devicetree/bindings/sound/spacemit,k1-i2s.yaml
@@ -23,9 +23,9 @@ allOf:
     then:
       properties:
         clocks:
-          minItems: 7
+          minItems: 6
         clock-names:
-          minItems: 7
+          minItems: 6
     else:
       properties:
         clocks:
@@ -43,26 +43,50 @@ properties:
     maxItems: 1
 
   clocks:
-    minItems: 4
-    items:
-      - description: clock for I2S sysclk
-      - description: clock for I2S bclk
-      - description: clock for I2S bus
-      - description: clock for I2S controller
-      - description: clock for I2S sysclk divider
-      - description: clock for I2S common sysclk
-      - description: clock for I2S common bclk
+    oneOf:
+      - items:
+          - description: clock for I2S sysclk
+          - description: clock for I2S bclk
+          - description: clock for I2S bus
+          - description: clock for I2S controller
+      - items:
+          - description: clock for I2S sysclk
+          - description: clock for I2S bclk
+          - description: clock for I2S bus
+          - description: clock for I2S controller
+          - description: clock for I2S common sysclk
+          - description: clock for I2S common bclk
+      - items:
+          - description: clock for I2S sysclk
+          - description: clock for I2S bclk
+          - description: clock for I2S bus
+          - description: clock for I2S controller
+          - description: clock for I2S sysclk divider
+          - description: clock for I2S common sysclk
+          - description: clock for I2S common bclk
 
   clock-names:
-    minItems: 4
-    items:
-      - const: sysclk
-      - const: bclk
-      - const: bus
-      - const: func
-      - const: sysclk_div
-      - const: c_sysclk
-      - const: c_bclk
+    oneOf:
+      - items:
+          - const: sysclk
+          - const: bclk
+          - const: bus
+          - const: func
+      - items:
+          - const: sysclk
+          - const: bclk
+          - const: bus
+          - const: func
+          - const: c_sysclk
+          - const: c_bclk
+      - items:
+          - const: sysclk
+          - const: bclk
+          - const: bus
+          - const: func
+          - const: sysclk_div
+          - const: c_sysclk
+          - const: c_bclk
 
   dmas:
     minItems: 1

-- 
2.55.0

