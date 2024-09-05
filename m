Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7F5B6188A24;
	Thu,  5 Sep 2024 07:02:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.242.206.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725519771; cv=none; b=p0xLAepXK8MvCgz6QcrhDCMPTZYkQ8H8I5fDn6R+QJQRPd5ON2MzS4HJ7JUxSpjga1ExbrTcUrdeYOA3bbPS4RZXhyEmgUJmmuK4rp/2yDvDUhaRyG7OrhI9XN0SsxuPvrBCd31zR+P+pYZOGG/TfkTRHYUHMlc3/lWCoILdI04=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725519771; c=relaxed/simple;
	bh=lbf9ue3aAcGlXfxXdOu+9hB4qTEZWT5b/au2Tydd/jo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=sRc9KWBYIV2G92HvfqASbnRZ2d+sXPSQ98FAK8o17EnSr7g0bwOENCy4DdEU7PKHY7ohkBTBkKi5qcKpZFiSLhXJjUPoN0UEsM+S3u5tyOWgKUDesuvdqlNxb+VxWMt8eUBv/rnRUtMJYxE/A3DGrGRGjMCSfGnWzTrnuIgY4gg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn; spf=pass smtp.mailfrom=loongson.cn; arc=none smtp.client-ip=114.242.206.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [223.64.68.71])
	by gateway (Coremail) with SMTP id _____8Cxd+mWV9lmkRkrAA--.16477S3;
	Thu, 05 Sep 2024 15:02:46 +0800 (CST)
Received: from localhost.localdomain (unknown [223.64.68.71])
	by front1 (Coremail) with SMTP id qMiowMAxXNyJV9lm38IEAA--.21058S3;
	Thu, 05 Sep 2024 15:02:44 +0800 (CST)
From: Binbin Zhou <zhoubinbin@loongson.cn>
To: Binbin Zhou <zhoubb.aaron@gmail.com>,
	Huacai Chen <chenhuacai@loongson.cn>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>
Cc: Huacai Chen <chenhuacai@kernel.org>,
	devicetree@vger.kernel.org,
	linux-sound@vger.kernel.org,
	Xuerui Wang <kernel@xen0n.name>,
	loongarch@lists.linux.dev,
	Binbin Zhou <zhoubinbin@loongson.cn>
Subject: [PATCH v1 01/10] ASoC: dt-bindings: Add Everest ES8323 Codec
Date: Thu,  5 Sep 2024 15:02:14 +0800
Message-ID: <e987b0beabba169577c8923557690984f226b29b.1725518229.git.zhoubinbin@loongson.cn>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <cover.1725518229.git.zhoubinbin@loongson.cn>
References: <cover.1725518229.git.zhoubinbin@loongson.cn>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:qMiowMAxXNyJV9lm38IEAA--.21058S3
X-CM-SenderInfo: p2kr3uplqex0o6or00hjvr0hdfq/
X-Coremail-Antispam: 1Uk129KBj93XoW7Cw4xZF1Dury5Gw15Ar4rtFc_yoW8XFWUpF
	s3Cr95trySgF17A39xJFy8Cr1rJ395AF4YqFnrtwn3t3s8Xa4Fqws0krn8Z3ZrAFyxKay3
	XFW7uw1rK3W8AabCm3ZEXasCq-sJn29KB7ZKAUJUUUUx529EdanIXcx71UUUUU7KY7ZEXa
	sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
	0xBIdaVrnRJUUUBIb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
	IYs7xG6rWj6s0DM7CIcVAFz4kK6r1Y6r17M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
	e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Xr0_Ar1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
	0_Gr0_Cr1l84ACjcxK6I8E87Iv67AKxVW8Jr0_Cr1UM28EF7xvwVC2z280aVCY1x0267AK
	xVW8Jr0_Cr1UM2kKe7AKxVWUAVWUtwAS0I0E0xvYzxvE52x082IY62kv0487Mc804VCY07
	AIYIkI8VC2zVCFFI0UMc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0I7IYx2IY67AKxVWU
	tVWrXwAv7VC2z280aVAFwI0_Gr0_Cr1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcxkI7V
	AKI48JMxkF7I0En4kS14v26r126r1DMxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY
	6r1j6r4UMxCIbckI1I0E14v26r126r1DMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7
	xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUtVW8ZwCIc40Y0x0EwIxGrwCI42IY6xII
	jxv20xvE14v26r4j6ryUMIIF0xvE2Ix0cI8IcVCY1x0267AKxVW8JVWxJwCI42IY6xAIw2
	0EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Gr0_Cr1lIxAIcVC2z280aVCY1x02
	67AKxVW8JVW8JrUvcSsGvfC2KfnxnUUI43ZEXa7IU8_gA5UUUUU==

Add Everest Semiconductor ES8316 low power audio CODEC binding with DT
schema format using json-schema.

Signed-off-by: Binbin Zhou <zhoubinbin@loongson.cn>
---
 .../bindings/sound/everest,es8323.yaml        | 49 +++++++++++++++++++
 1 file changed, 49 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/sound/everest,es8323.yaml

diff --git a/Documentation/devicetree/bindings/sound/everest,es8323.yaml b/Documentation/devicetree/bindings/sound/everest,es8323.yaml
new file mode 100644
index 000000000000..0450d0f49d03
--- /dev/null
+++ b/Documentation/devicetree/bindings/sound/everest,es8323.yaml
@@ -0,0 +1,49 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/sound/everest,es8323.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Everest ES8323 audio CODECs
+
+maintainers:
+  - Binbin Zhou <zhoubinbin@loongson.cn>
+
+allOf:
+  - $ref: dai-common.yaml#
+
+properties:
+  compatible:
+    const: everest,es8323
+
+  reg:
+    maxItems: 1
+
+  clocks:
+    description: clock for master clock (MCLK)
+    maxItems: 1
+
+  clock-names:
+    const: mclk
+
+  '#sound-dai-cells':
+    const: 0
+
+required:
+  - compatible
+  - reg
+  - '#sound-dai-cells'
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    i2c {
+      #address-cells = <1>;
+      #size-cells = <0>;
+      codec@10 {
+        compatible = "everest,es8323";
+        reg = <0x10>;
+        #sound-dai-cells = <0>;
+      };
+    };
-- 
2.43.5

