Received: from smtpbgeu1.qq.com (smtpbgeu1.qq.com [52.59.177.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68BA810F2;
	Wed, 29 Apr 2026 01:39:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=52.59.177.22
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777426765; cv=none; b=gpRyqmpMpTS2K8qFjlGBOSaBtCo/ZPVafGysBBfaUon18vyKWsQKJLy+GEBB2dbVQ2bD38kiTvD1/k8NxxDrgMFGuzJJ3GYFnBbdGPMdRUfcPWvEmIgHIufxRaFP+qFhIqrVkRVb6pNUCERvzPF2ISd+3ka6EVbBSy0ZEi/sVfc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777426765; c=relaxed/simple;
	bh=NAgZL6RRaKXXih+6ACD5ImpEXa86qDP16TxAOhPDHIQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=EDTPqvZD3dWzIC2/8Fb2UHdUUrIUXaV6Olo1fGrmStYr5jElXOPXmdhJ2u9KDQXPE2DFb/br46MEQOCUlyD1hYYrbCdeV+GQkhYpxLf3c4IInbOX2lfJ09H4iOamDu4HjQRjIRqZa7vSAKqdrfnIokcxMnVfY4JRD+6R3udYFHM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.spacemit.com; spf=none smtp.mailfrom=linux.spacemit.com; dkim=pass (1024-bit key) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.b=f2RHNbWz; arc=none smtp.client-ip=52.59.177.22
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.spacemit.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.spacemit.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.b="f2RHNbWz"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1777426759;
	bh=FI4ajARcW5357tLN5/I0ua9TZkOJrFRVAlMis1T0b2M=;
	h=From:Date:Subject:MIME-Version:Message-Id:To;
	b=f2RHNbWza+D8n4xRFvCFEbb10aFrEYaiMIqi/OS40cLEzbm/qww1Zcj+29BHr1/4+
	 NVSyLMCAjiS7Ih6HAQxNfVsaOXV/cStJWdXygfIwVHNM4xBu6TvbNGi+odiL58l0bI
	 ANNsJBqnft1DE+MoS3Qojpavsivug5fz5fzD8/7o=
X-QQ-mid: esmtpgz12t1777426755t013c7bfe
X-QQ-Originating-IP: xdBdhRDl77xch4NsM0af+nFog4tII5MZi881pdQy8Kw=
Received: from = ( [120.237.158.181])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Wed, 29 Apr 2026 09:39:12 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 7627828452192065809
EX-QQ-RecipientCnt: 15
From: Troy Mitchell <troy.mitchell@linux.spacemit.com>
Date: Wed, 29 Apr 2026 09:38:50 +0800
Subject: [PATCH 5/7] ASoC: dt-bindings: add fixed-sample-rate property for
 SpacemiT K1/K3
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260429-k3-i2s-v1-5-2fe99db11ecb@linux.spacemit.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1777426731; l=1270;
 i=troy.mitchell@linux.spacemit.com; s=20250710; h=from:subject:message-id;
 bh=NAgZL6RRaKXXih+6ACD5ImpEXa86qDP16TxAOhPDHIQ=;
 b=TusiHIciXUEkTyZdF0agxDOszJih+9MIoUSFVA68HIDOa8vi2cUesDBfQe6f4l4R+9H2D8znc
 iEXn6JQBHR1DS1pO8ZQIdzSeDXsQeMaCRPGheSGBpUYrD6BmdWQTB97
X-Developer-Key: i=troy.mitchell@linux.spacemit.com; a=ed25519;
 pk=lQa7BzLrq8DfZnChqmwJ5qQk8fP2USmY/4xZ2/MSsXc=
X-QQ-SENDSIZE: 520
Feedback-ID: esmtpgz:linux.spacemit.com:qybglogicsvrgz:qybglogicsvrgz3a-0
X-QQ-XMAILINFO: NV33GuG3VJ0ZMZyi/YYYHy5b1IYD3h2lu4bAGgv6aLCmLSi/OTtZwO79
	8WlrHfVyuI1CP68DHGbyaGFgE0az28ZQwwmwKGzll8nP1wWkMd6Oy0PWZYjqsQZEJhAdDHl
	5J9UqsVmNw9W4eYiJaDwuan05x4vWc/zznAETMUaDVLOeIv4SxjL+pVC4bkbKi0dptHUUHy
	EAKI4yclmXKN9azte1EHOkfbUK0CBpP//kjIdW4MZLRH8Qcia2a32ioEIQFf2VP/v1v+IVx
	BgEQfBNj7MzjcI+q4eStpil3r7+GXM48IwQOHdU9xZEHNTr5jnZAD70NmEX+XPuaFQ3Io16
	Vaapzktmrno5gCucjVB0mn5t1EBPm+uO7Zu7ohqMbF+ND8LgJSME5ycft9f9JrJgnE0GY/o
	AzMmm9vyyJWOSi8TTzSD2k6BiBBqD4ebm0II17F0IgTMXjol+Ot7q6Rf4JvsTmtWwcksRGv
	oD7C194ZzcZEyVfEeV7t+2YIQpaUYOWxaFll6psycENAbPRapU3q4nDvkYGFj/ZzCdvKHCV
	Rzf4ygqEgmXnIyLBoMc6fKdWElwVkUoh4/d2+h/mtXvt5HNMJytClwSCvS01Mymadttu8os
	TNQGCmb8R8mgCNnlncabD3Yzi2yiTmH7oTB4aSJB1CQxbAxwmF4n15afqDHs4x0t82hcXYu
	fcXu+y9A6Yp6RQFRKV74DcvnnCnXK2BmSu+ywpSJRBYZfIOqgwDdkplNaa+G87FYTaFvwRv
	14XiOOkTO2y0RIApJzpYmJUHt4qrjHl6nkmxPIjoWzRr7A7iqYxpnxnCMPuLdqRuhxIfR0y
	84V2sCyGXKfnpfoVD3YOnjq/+bfxvSj+mMe3lMo7SNq6tGBodPA0EoAdDIj2c1QlY7+KO52
	OclItZDKYsleLLZDd05/Y5iZvkxqMMEHu5YJhUecUmMligFhVlO+7H7pUDhXSaK3Jbj7Ovj
	PrESz7JKrdgo0UdNuz+SfHkmspMUtENpGLfJ+HXdnCmPj4BqQ0/9n3TfP9QTwP+TVY63nuO
	XHAqzxM2lNFBJrx4UQe/IZGtIV/mp7CJHIyCmxldxG3K7Uwq7cmo9PcnZToxpB9FpgziUcP
	dJOCkY+WPM5koUFgFYZbMfoI/Ckz57lGb3YyAH9KOriWUhGXYrp13Rc3LdHwPGtLNsq2HQJ
	aZDwF3cdO9sy/e+ND4HNtanwpQ==
X-QQ-XMRINFO: NI4Ajvh11aEjEMj13RCX7UuhPEoou2bs1g==
X-QQ-RECHKSPAM: 0

Add the optional spacemit,fixed-sample-rate property. When multiple I2S
controllers share a common bclk, this property constrains all
controllers to the same sample rate. This applies to both K1 and K3
SoCs and is only needed when two or more I2S controllers are active
simultaneously.

Signed-off-by: Troy Mitchell <troy.mitchell@linux.spacemit.com>
---
 Documentation/devicetree/bindings/sound/spacemit,k1-i2s.yaml | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/Documentation/devicetree/bindings/sound/spacemit,k1-i2s.yaml b/Documentation/devicetree/bindings/sound/spacemit,k1-i2s.yaml
index 240d90402e4f..137070ad9eba 100644
--- a/Documentation/devicetree/bindings/sound/spacemit,k1-i2s.yaml
+++ b/Documentation/devicetree/bindings/sound/spacemit,k1-i2s.yaml
@@ -84,6 +84,14 @@ properties:
   "#sound-dai-cells":
     const: 0
 
+  spacemit,fixed-sample-rate:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description:
+      Fixed sample rate in Hz. When multiple I2S controllers share a
+      common bclk, this property constrains all controllers to the same
+      sample rate. Only needed when two or more I2S controllers are
+      active simultaneously.
+
 required:
   - compatible
   - reg

-- 
2.54.0

