Received: from smtpbgjp3.qq.com (smtpbgjp3.qq.com [54.92.39.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67EC232D43C;
	Thu,  7 May 2026 07:33:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=54.92.39.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778139211; cv=none; b=sXSk3Qkq/TDNRy1xVRtbnuczLuiP2MJurNBn7anVoqvrE1MroS5BOa/qCTrrMwNRRiSU16QNjS69u99SsSIlHH7sYBzY+IVuVugX8/aTVQfOhN9bBEmvHMw3rCTwX2Lpsr4SUHwYtCEIgo2oOAJ2KBuOCBwunLVB89c0EHqoQlk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778139211; c=relaxed/simple;
	bh=WCbZ8iopcLSLXkEHIgHHSSkd2u1qQfx30P4JpAz6ZKw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=TPIP8gQ05136d4NCp7vXwLwPawI9aWZBMu8ASTZGPhbm5V9tZHf5ZNVxvzy51BrhjL3ntCQQqLVfFryoCyDt1YozEGUdHz744F+7W6CcKFnSp8xzUFVUeJiBtd7G3wnK+JNn3tbdHzt67hYHMfyG6gcClpM6v3keeKcsFkul1O8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.spacemit.com; spf=none smtp.mailfrom=linux.spacemit.com; dkim=pass (1024-bit key) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.b=kCuHmDj2; arc=none smtp.client-ip=54.92.39.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.spacemit.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.spacemit.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.b="kCuHmDj2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1778139204;
	bh=TmI0UH8/e3iTldNLhwHi7B9I6Rl5C/JYONWEHU21eJ8=;
	h=From:Date:Subject:MIME-Version:Message-Id:To;
	b=kCuHmDj2Se3ExRlUhZp9eIlFE7ja9VfLVWxosjTc/0lwkCAofCfC8KTSxySd0J4z0
	 ivkBpaznEBJCwzqG1jwQsxi3VFODV7WwFj+x+g7FSCatykv49RnNwBIdsfIq/VeSj4
	 QdkbTW4bZvP33ZSyAFsUmSTS8E1wkFljD3RjSiOw=
X-QQ-mid: esmtpsz10t1778139199t214e8fcb
X-QQ-Originating-IP: uRFn5Pt4sifnfhp5pLw+QVV3Q0soJuo0yK/D2S4v8Pg=
Received: from = ( [120.237.158.181])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Thu, 07 May 2026 15:33:16 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 2117957216347348895
EX-QQ-RecipientCnt: 15
From: Troy Mitchell <troy.mitchell@linux.spacemit.com>
Date: Thu, 07 May 2026 15:33:09 +0800
Subject: [PATCH v2 1/2] ASoC: dt-bindings: add SpacemiT K3 SoC compatible
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260507-k3-i2s-v2-1-9cdbf95b7533@linux.spacemit.com>
References: <20260507-k3-i2s-v2-0-9cdbf95b7533@linux.spacemit.com>
In-Reply-To: <20260507-k3-i2s-v2-0-9cdbf95b7533@linux.spacemit.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1778139191; l=2349;
 i=troy.mitchell@linux.spacemit.com; s=20250710; h=from:subject:message-id;
 bh=WCbZ8iopcLSLXkEHIgHHSSkd2u1qQfx30P4JpAz6ZKw=;
 b=PHU5vuDOslLdTy4s2nXnGFwbJj3d2hTEOIUWwPjfywaGpkYeNcfRDPkElTDuR50U4TaqEXiEn
 Lb5w9D9jKw+DmrDfijJOyiuBYffqMlUaMQGZzuGyePdc2PPZB9BTG0a
X-Developer-Key: i=troy.mitchell@linux.spacemit.com; a=ed25519;
 pk=lQa7BzLrq8DfZnChqmwJ5qQk8fP2USmY/4xZ2/MSsXc=
X-QQ-SENDSIZE: 520
Feedback-ID: esmtpsz:linux.spacemit.com:qybglogicsvrgz:qybglogicsvrgz3a-0
X-QQ-XMAILINFO: MoLdYB8q3DRXzO23bdnFfKwJmUEaJlwc2naxHVP78Sqsa3lsSxC2+vVg
	txLC7sm85hDqtC4pZNsVwBz5B9liKcYgEMv56I4Bs7NW3ns+xis15hmpE9fCK/Bl3lESwH6
	EA6MPgWk0rMUoFID3svCL6hER5RZdodcNqRivl/RMHw/iRwIAUupzlnBooHBA1yPPD06T4K
	lktDU36VGD5+ul76w+vz5Wb+bc+sxnlXd6HrIJ+N0NTIJiODsjezXDeIFv4o1OlHy608zTy
	3EcLMWe7QxA6K5wLSRMrlY+1lphjvdEJhFIGdG/l9ZiwoWKT/Pjwuj2Z2Ig1NAeiGNjNaIu
	d9KLoljiAnq5PyyoC3Gprds9oTiR77bQY4btwGMlMAv2IGOD4nqCKcmj6EU6CHQ80AQHG7e
	/1i451v2JESDZKq+zDaN98u1QG1cM1QeGWX7d6EavhbaA3R2KKN7wEWtljWEd2XT+8kuPxi
	dq0ee5I9Hy7CFHTyJHChuK7sJmqVRk1NaSGCMaDMQHzLRKpPl4lk+7xxoPAaBChkWscsFWS
	ECZOFsWl6XR91e5FM8EkBihhfPnIe/rR9w9Y3PfgRoWyl/tIaxztl6Rd15QFHJX1qJF/cny
	5fJROMpv92pczk6SVeIsamOO+bQnf0uz8l4qO8gCZNTYjyZIGoA3HadliuAFLmX6z/OK72O
	DAk+TLvW2JA1UykLZq/IPoVJEK5B0vduCks+lnzCA02HMWLGlSj4lqd0fzfiYD2uhh5wSiJ
	TYHNjnhp2HrlZMwpVWNxmM4M7obKnHnStFMG5vUTYUVeT2fpgbHPkuzniezjzRzwnSAJp8r
	w9hUeso3CNFo4NJZ0sPpcshJUPd6RsZvKBeJvDBpJCyB22bi3uozUrTmH9N1hsjmC9NKRLC
	6uKGkXAfgRIo1lRULE1pngOtre7/SiqJ5367ItL2OLmI9GmAxo/1cvsVZnAtl4PeraI0vuM
	h2HzGs6ANHqnoxJsjTpc6OtWlGjY/RGiB05Tcpxk3FK+9NIGwCw+BfTTwChGvctTaCgDW38
	FvbptixVo6M/Ykf+Ggw1OAC1yy0CEpbzsIpd67h9+LHg6VocYsSJjpReeC77BOPjd5ZON6a
	vzLa4qwL6ULjRPCz6B5urPYupWwCeskZCglC9NadngGupHuFHLN9xvkfd4JAtwex4+wcv1q
	MtdY/eJ/oOIv8o3e2O0SlT79Q9N8zCkZf6Y16MkR0OYc8q8=
X-QQ-XMRINFO: OD9hHCdaPRBwH5bRRRw8tsiH4UAatJqXfg==
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

