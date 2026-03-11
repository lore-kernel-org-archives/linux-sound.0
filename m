Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7A11636DA15;
	Wed, 11 Mar 2026 06:37:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.242.206.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773211082; cv=none; b=SVzbSYvM3EWmvNkVvQCvoQ6vVrMI3qhzZUJ9EEFCuy37f5ZLvDeKeQG815Lz15nx9byaUqE3CFFxa1Cr+cc2OEybu5eaqVIf5blIe295wHS55ypFQAHxySKqZ2CYhv0tlLCjruZ47sW4quem0tG8/1svANgEslu6IVHeZJoVoF8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773211082; c=relaxed/simple;
	bh=jgJw/Ju6ZklgY4hxVhoIHT3WmvusG3+Vg63EiE9zVOY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=BvNB6AYBp8T9uGVJFLDnhXpD1mr7yHsQBa5fDTfENM9TgTmyNKMp6hmTslQxyucHvJ1AloCvjkNVSicBoydnjg+XnSkRQ6p277q25QnCpP5ZNmcr3VgyzxjmIJ9kvUwOLDNwTYXeRsslKJrQxxVwy+uQrYtjv6Pcc3dClDcsTqo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn; spf=pass smtp.mailfrom=loongson.cn; arc=none smtp.client-ip=114.242.206.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [223.64.68.227])
	by gateway (Coremail) with SMTP id _____8Dx88DFDbFpBNMZAA--.16639S3;
	Wed, 11 Mar 2026 14:37:57 +0800 (CST)
Received: from kernelserver (unknown [223.64.68.227])
	by front1 (Coremail) with SMTP id qMiowJCx_8LCDbFp2clSAA--.26807S3;
	Wed, 11 Mar 2026 14:37:56 +0800 (CST)
From: Binbin Zhou <zhoubinbin@loongson.cn>
To: Binbin Zhou <zhoubb.aaron@gmail.com>,
	Huacai Chen <chenhuacai@loongson.cn>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>
Cc: Huacai Chen <chenhuacai@kernel.org>,
	Xuerui Wang <kernel@xen0n.name>,
	loongarch@lists.linux.dev,
	devicetree@vger.kernel.org,
	linux-sound@vger.kernel.org,
	Binbin Zhou <zhoubinbin@loongson.cn>
Subject: [PATCH 5/6] ASoC: dt-bindings: loongson,ls2k1000-i2s: Document Loongson-2K0300 compatible
Date: Wed, 11 Mar 2026 14:37:47 +0800
Message-ID: <600bfea91c1f14f089b2f7677578cd8690412fac.1773107475.git.zhoubinbin@loongson.cn>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <cover.1773107475.git.zhoubinbin@loongson.cn>
References: <cover.1773107475.git.zhoubinbin@loongson.cn>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:qMiowJCx_8LCDbFp2clSAA--.26807S3
X-CM-SenderInfo: p2kr3uplqex0o6or00hjvr0hdfq/1tbiAQEDCGmxBEIApwAAsy
X-Coremail-Antispam: 1Uk129KBj93XoW7Ww4kGrWrXryrCw4kJFy7Jwc_yoW8WFy5pF
	sxua17Gry0qF17u398ta48Cw15u3s3A3ZrCF47Jw1qkwn8J3yFvw13KF4Yqa13urW0vrW5
	ury8Kr45Gay3CrcCm3ZEXasCq-sJn29KB7ZKAUJUUUU7529EdanIXcx71UUUUU7KY7ZEXa
	sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
	0xBIdaVrnRJUUUBSb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
	IYs7xG6rWj6s0DM7CIcVAFz4kK6r126r13M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
	e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Ar0_tr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
	0_Cr0_Gr1UM28EF7xvwVC2z280aVAFwI0_Gr1j6F4UJwA2z4x0Y4vEx4A2jsIEc7CjxVAF
	wI0_Gr1j6F4UJwAaw2AFwI0_Jrv_JF1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqjxCEc2
	xF0cIa020Ex4CE44I27wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_
	Wrv_ZF1lYx0Ex4A2jsIE14v26r4j6F4UMcvjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvY0x
	0EwIxGrwCY1x0262kKe7AKxVWUAVWUtwCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkE
	bVWUJVW8JwCFI7km07C267AKxVWUXVWUAwC20s026c02F40E14v26r1j6r18MI8I3I0E74
	80Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_Jw0_GFylIxkGc2Ij64vIr41lIxAIcVC0
	I7IYx2IY67AKxVW5JVW7JwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Cr0_Gr1UMIIF0xvE42
	xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVW8JVWxJwCI42IY6I8E87Iv6xkF
	7I0E14v26r4j6r4UJbIYCTnIWIevJa73UjIFyTuYvjxUVCJPDUUUU

Add "loongson,ls2k0300-i2s" dedicated compatible to represent the I2S
interface of the Loongson-2K0300 chip.

The hardware integration of the Loongson-2K0300 I2S interface differs
significantly from that of the Loongson-2K1000. Specifically, while both
utilize external DMA controllers, the Loongson-2K0300 configures DMA
channel routing via the `dmas` property, whereas the Loongson-2K1000
requires additional register.

Signed-off-by: Binbin Zhou <zhoubinbin@loongson.cn>
---
 .../bindings/sound/loongson,ls2k1000-i2s.yaml | 22 ++++++++++++++++++-
 1 file changed, 21 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/sound/loongson,ls2k1000-i2s.yaml b/Documentation/devicetree/bindings/sound/loongson,ls2k1000-i2s.yaml
index da79510bb2d9..51e23c189f7a 100644
--- a/Documentation/devicetree/bindings/sound/loongson,ls2k1000-i2s.yaml
+++ b/Documentation/devicetree/bindings/sound/loongson,ls2k1000-i2s.yaml
@@ -14,9 +14,12 @@ allOf:
 
 properties:
   compatible:
-    const: loongson,ls2k1000-i2s
+    enum:
+      - loongson,ls2k0300-i2s
+      - loongson,ls2k1000-i2s
 
   reg:
+    minItems: 1
     items:
       - description: Loongson I2S controller Registers.
       - description: APB DMA config register for Loongson I2S controller.
@@ -49,6 +52,23 @@ required:
 
 unevaluatedProperties: false
 
+if:
+  properties:
+    compatible:
+      contains:
+        enum:
+          - loongson,ls2k1000-i2s
+
+then:
+  properties:
+    reg:
+      minItems: 2
+
+else:
+  properties:
+    reg:
+      maxItems: 1
+
 examples:
   - |
     #include <dt-bindings/clock/loongson,ls2k-clk.h>
-- 
2.52.0

