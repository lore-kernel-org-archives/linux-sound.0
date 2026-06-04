Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A2CDD2D592D;
	Thu,  4 Jun 2026 02:11:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.242.206.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780539107; cv=none; b=Iw4U7sd0bcVbXPnLlWdj5EKK53l2+f13UzWY3bLlysFJ5F9/RVPgvKm9S2bq0H9vpAfmujGfQ+oLai7Yg016mPzlbwsftVnsvEp79EBrCbgBfoDieyd6ZK1IUFAyv/Bfhtd5YO8HsyKIwC385U0Lv+mOmVgXdADsL/WGGweOakI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780539107; c=relaxed/simple;
	bh=+V6AIWfyM6FTGDpl9t/525pgkKv+eOUl6q1ny8/q/KM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=KmyrKDb5go1paqkTbP/XT7MpkssMNC94RMY0zm2iJUN6avWlg6oC8HEwQw6KgbPV4QfG3F0VbTOV1/jazaY2RLdO33u1bnfeq6YgCn3oVxr9ceZB7uICEcBcyWrBmPEpMJ0dseuNJjzL0tyr59TYa7p15A6R4ldZAyjDCP3wYws=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn; spf=pass smtp.mailfrom=loongson.cn; arc=none smtp.client-ip=114.242.206.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [223.64.68.59])
	by gateway (Coremail) with SMTP id _____8BxEuvf3iBqN2EQAA--.45684S3;
	Thu, 04 Jun 2026 10:11:43 +0800 (CST)
Received: from kernelserver (unknown [223.64.68.59])
	by front1 (Coremail) with SMTP id qMiowJBx78LZ3iBq1UabAA--.33017S5;
	Thu, 04 Jun 2026 10:11:41 +0800 (CST)
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
Subject: [PATCH v2 3/7] ASoC: dt-bindings: loongson,ls-audio-card: Use common sound card
Date: Thu,  4 Jun 2026 10:11:23 +0800
Message-ID: <bbbcfd66b3b98713315f1af374c8da1065c8db68.1780538113.git.zhoubinbin@loongson.cn>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <cover.1780538113.git.zhoubinbin@loongson.cn>
References: <cover.1780538113.git.zhoubinbin@loongson.cn>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:qMiowJBx78LZ3iBq1UabAA--.33017S5
X-CM-SenderInfo: p2kr3uplqex0o6or00hjvr0hdfq/1tbiAgEICGofwi0ZagAAsq
X-Coremail-Antispam: 1Uk129KBj93XoW7ury8Ww4rtw43tFWDtF18WFX_yoW8Wr4UpF
	ZxC3srKr48t3W7Zas5ZFyxCw4Sq3sYya9rXFW2q34DJFZ0qanYqw1ak3Wjqa15CF9YqFW7
	WFyFkrn8Ga43CwcCm3ZEXasCq-sJn29KB7ZKAUJUUUU7529EdanIXcx71UUUUU7KY7ZEXa
	sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
	0xBIdaVrnRJUUUBIb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
	IYs7xG6rWj6s0DM7CIcVAFz4kK6r1Y6r17M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
	e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Ar0_tr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
	0_Cr0_Gr1UM28EF7xvwVC2z280aVAFwI0_Cr0_Gr1UM28EF7xvwVC2z280aVCY1x0267AK
	xVW8Jr0_Cr1UM2kKe7AKxVWUXVWUAwAS0I0E0xvYzxvE52x082IY62kv0487Mc804VCY07
	AIYIkI8VC2zVCFFI0UMc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0I7IYx2IY67AKxVWU
	tVWrXwAv7VC2z280aVAFwI0_Gr0_Cr1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcxkI7V
	AKI48JMxkF7I0En4kS14v26r126r1DMxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY
	6r1j6r4UMxCIbckI1I0E14v26r1Y6r17MI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7
	xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUtVW8ZwCIc40Y0x0EwIxGrwCI42IY6xII
	jxv20xvE14v26ryj6F1UMIIF0xvE2Ix0cI8IcVCY1x0267AKxVW8JVWxJwCI42IY6xAIw2
	0EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Gr0_Cr1lIxAIcVC2z280aVCY1x02
	67AKxVW8JVW8JrUvcSsGvfC2KfnxnUUI43ZEXa7IU0epB3UUUUU==

Reference the common sound card properties. This allows removing the
`model` property and directly using the common `audio-routing` property
later on.

Signed-off-by: Binbin Zhou <zhoubinbin@loongson.cn>
---
 .../bindings/sound/loongson,ls-audio-card.yaml        | 11 +++++------
 1 file changed, 5 insertions(+), 6 deletions(-)

diff --git a/Documentation/devicetree/bindings/sound/loongson,ls-audio-card.yaml b/Documentation/devicetree/bindings/sound/loongson,ls-audio-card.yaml
index 61e8babed402..e1b7445a8b22 100644
--- a/Documentation/devicetree/bindings/sound/loongson,ls-audio-card.yaml
+++ b/Documentation/devicetree/bindings/sound/loongson,ls-audio-card.yaml
@@ -8,20 +8,20 @@ title: Loongson 7axxx/2kxxx ASoC audio sound card driver
 
 maintainers:
   - Yingkun Meng <mengyingkun@loongson.cn>
+  - Binbin Zhou <zhoubinbin@loongson.cn>
 
 description:
   The binding describes the sound card present in loongson
   7axxx/2kxxx platform. The sound card is an ASoC component
   which uses Loongson I2S controller to transfer the audio data.
 
+allOf:
+  - $ref: sound-card-common.yaml#
+
 properties:
   compatible:
     const: loongson,ls-audio-card
 
-  model:
-    $ref: /schemas/types.yaml#/definitions/string
-    description: User specified audio sound card name
-
   mclk-fs:
     $ref: simple-card.yaml#/definitions/mclk-fs
 
@@ -47,12 +47,11 @@ properties:
 
 required:
   - compatible
-  - model
   - mclk-fs
   - cpu
   - codec
 
-additionalProperties: false
+unevaluatedProperties: false
 
 examples:
   - |
-- 
2.52.0

