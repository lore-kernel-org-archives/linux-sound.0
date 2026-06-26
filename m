Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BC67B2F8E8B;
	Fri, 26 Jun 2026 02:27:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.242.206.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782440846; cv=none; b=jr0P2YuKFuOcddboIFBA7/yyD9qpDxgjWbU82DvPm/q/HfVUVnjVZ07m6arbw6H5u8iVAtHaZYz1ay6gx1LRk8BrKp7jvGDuGxw4bq5zy0bT62qFH/E1ujOCom3p6N8RSIG62NrslpJbNV4ZPkCkU7tm5TCcIGnf/hA60sy2Yfo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782440846; c=relaxed/simple;
	bh=cnNgj9pJvi1Jaw/xuqtn5898J8vGRaR5GE1xKTSfKG4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=DmfLPUp3JSe+dx9IzQpDw6wkrhYJyG7keAOOE7Zdiq7Ujpf+tUJu9wXM1NfTf8RJbH9Ha+HvRAYxWf6A8lDt5gG6pkc+dUkGnY4cI7LBSF3N/cwClDlopMDYWVJPrJ/VYbx0i1C/EfszvxCk/1xYk9PovJqy4WPm3pMBIRlQJMo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn; spf=pass smtp.mailfrom=loongson.cn; arc=none smtp.client-ip=114.242.206.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [223.64.68.155])
	by gateway (Coremail) with SMTP id _____8CxhniK4z1qzDAYAA--.37404S3;
	Fri, 26 Jun 2026 10:27:22 +0800 (CST)
Received: from kernelserver (unknown [223.64.68.155])
	by front1 (Coremail) with SMTP id qMiowJBxSeCC4z1qim2zAA--.12873S4;
	Fri, 26 Jun 2026 10:27:21 +0800 (CST)
From: Binbin Zhou <zhoubinbin@loongson.cn>
To: Binbin Zhou <zhoubb.aaron@gmail.com>,
	Huacai Chen <chenhuacai@loongson.cn>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Keguang Zhang <keguang.zhang@gmail.com>
Cc: Huacai Chen <chenhuacai@kernel.org>,
	Xuerui Wang <kernel@xen0n.name>,
	loongarch@lists.linux.dev,
	devicetree@vger.kernel.org,
	linux-sound@vger.kernel.org,
	Binbin Zhou <zhoubinbin@loongson.cn>,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH v3 2/9] ASoC: dt-bindings: loongson,ls2k1000-i2s: Document Loongson-2K0300 compatible
Date: Fri, 26 Jun 2026 10:27:04 +0800
Message-ID: <af092f9eabdc170c3d7951b29eee6512f748eb48.1782439646.git.zhoubinbin@loongson.cn>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <cover.1782439646.git.zhoubinbin@loongson.cn>
References: <cover.1782439646.git.zhoubinbin@loongson.cn>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:qMiowJBxSeCC4z1qim2zAA--.12873S4
X-CM-SenderInfo: p2kr3uplqex0o6or00hjvr0hdfq/1tbiAQEKCGo8w2QalwAAs+
X-Coremail-Antispam: 1Uk129KBj93XoW7KFWxGr1UAr13Kr4Dtry3Jrc_yoW8Xw4UpF
	sxCa17GryIqF13C398ta48Cw1rZ3s3AanrJF47Gr17Kwn0q3y0vw13Kr1Yqa13urWxXrW3
	uFy8Kr45GayUCwcCm3ZEXasCq-sJn29KB7ZKAUJUUUUx529EdanIXcx71UUUUU7KY7ZEXa
	sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
	0xBIdaVrnRJUUUBFb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
	IYs7xG6rWj6s0DM7CIcVAFz4kK6r1Y6r17M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
	e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Xr0_Ar1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
	0_Gr0_Cr1l84ACjcxK6I8E87Iv67AKxVWxJVW8Jr1l84ACjcxK6I8E87Iv6xkF7I0E14v2
	6r4j6r4UJwAaw2AFwI0_JF0_Jw1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqjxCEc2xF0c
	Ia020Ex4CE44I27wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_Jw0_
	WrylYx0Ex4A2jsIE14v26r4j6F4UMcvjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvY0x0EwI
	xGrwCY1x0262kKe7AKxVWUtVW8ZwCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWU
	JVW8JwCFI7km07C267AKxVWUAVWUtwC20s026c02F40E14v26r1j6r18MI8I3I0E7480Y4
	vE14v26r106r1rMI8E67AF67kF1VAFwI0_GFv_WrylIxkGc2Ij64vIr41lIxAIcVC0I7IY
	x2IY67AKxVW8JVW5JwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Gr0_Cr1lIxAIcVCF04k26c
	xKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r4j6F4UMIIF0xvEx4A2jsIEc7CjxVAF
	wI0_Gr0_Gr1UYxBIdaVFxhVjvjDU0xZFpf9x07jr9NsUUUUU=

Add a new compatible string `loongson,ls2k0300-i2s` for the I2S
controller found on Loongson-2K0300 SoC.

Unlike Loongson-2K1000, Loongson-2K0300 does not require the second
register region for APB DMA configuration, so update the binding to
allow a single reg entry.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
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

