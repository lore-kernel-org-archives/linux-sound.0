Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 46CDD2D29C8;
	Thu,  4 Jun 2026 02:11:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.242.206.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780539120; cv=none; b=kl58QS1Xh3oUcHgBf0QOBNUEsw77kalSHYQM9RoB/czNM6bKftw2fGrKu/ex6F68aC6+xDdlYuXuC0E+LFLsHtizylWxY9181U4EGnGvvJSzkx3EUk+M0RWTjXxw+bZgosjt/hp2zlkMtEshc1m7hoRyBxmpPh3m5pGHIjOtXik=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780539120; c=relaxed/simple;
	bh=03bR+bPmsUeBEDJCyINnwc2HjTRGn1UZkRBFn17UGgo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=BKNpJwHZHNrXYECRBoUeue+LZ4jzfLf29ConH+aTp02EeryqqLOPkiT+Ojh1jQm7Iesz+rXQZb2CEf96ifXuEmRIfN+l0LXz6yz1/2tbpVPjBnIy5XMzR8/TB5Sh5L0Va2Lup7cdw75Z6mj4LMycF6sMXfqoyALycTz5t+NvkHo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn; spf=pass smtp.mailfrom=loongson.cn; arc=none smtp.client-ip=114.242.206.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [223.64.68.59])
	by gateway (Coremail) with SMTP id _____8Cx4ert3iBqTGEQAA--.45673S3;
	Thu, 04 Jun 2026 10:11:57 +0800 (CST)
Received: from kernelserver (unknown [223.64.68.59])
	by front1 (Coremail) with SMTP id qMiowJCxGODr3iBq5EabAA--.32358S2;
	Thu, 04 Jun 2026 10:11:56 +0800 (CST)
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
Subject: [PATCH v2 4/7] ASoC: dt-bindings: loongson,ls-audio-card: Add ctcisz forever pi compatible
Date: Thu,  4 Jun 2026 10:11:44 +0800
Message-ID: <4f74b6d809bffb849f6df8f956f063a052cd288c.1780538113.git.zhoubinbin@loongson.cn>
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
X-CM-TRANSID:qMiowJCxGODr3iBq5EabAA--.32358S2
X-CM-SenderInfo: p2kr3uplqex0o6or00hjvr0hdfq/1tbiAgEICGofwi0ZbgAAsu
X-Coremail-Antispam: 1Uk129KBj93XoW7Jry7CF48ZF1xJrW5GF4kuFX_yoW8Jr1xpr
	s7CasrKFWxK3W7uwn8XFyfAw4rZ3s3tan7AF47Xw1xGF98tw15W3y5K3WjvF4akryDJFW7
	XFyFkr4rWFyYywcCm3ZEXasCq-sJn29KB7ZKAUJUUUU7529EdanIXcx71UUUUU7KY7ZEXa
	sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
	0xBIdaVrnRJUUUBab4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
	IYs7xG6rWj6s0DM7CIcVAFz4kK6r1Y6r17M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
	e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Ar0_tr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
	0_Cr0_Gr1UM28EF7xvwVC2z280aVAFwI0_Cr0_Gr1UM28EF7xvwVC2z280aVCY1x0267AK
	xVW8Jr0_Cr1UM2kKe7AKxVWUXVWUAwAS0I0E0xvYzxvE52x082IY62kv0487Mc804VCY07
	AIYIkI8VC2zVCFFI0UMc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0I7IYx2IY67AKxVWr
	XVW3AwAv7VC2z280aVAFwI0_Gr0_Cr1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcxkI7V
	AKI48JMxkF7I0En4kS14v26r126r1DMxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY
	6r1j6r4UMxCIbckI1I0E14v26r1Y6r17MI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7
	xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUtVW8ZwCIc40Y0x0EwIxGrwCI42IY6xII
	jxv20xvE14v26ryj6F1UMIIF0xvE2Ix0cI8IcVCY1x0267AKxVWxJVW8Jr1lIxAIcVCF04
	k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r4j6F4UMIIF0xvEx4A2jsIEc7Cj
	xVAFwI0_Gr0_Gr1UYxBIdaVFxhVjvjDU0xZFpf9x07jqRRiUUUUU=

Add a new compatible string `loongson,ls2k0300-ctcisz-audio-card` for
the audio card on Loongson-2K0300 ctcisz forever pi SoC. It uses a
different DAI format compared to existing Loongson platforms.

The existing "loongson,ls-audio-card" remains valid for LS7A,
Loongson-2K1000 and Loongson-2K2000.

Signed-off-by: Binbin Zhou <zhoubinbin@loongson.cn>
---
 .../devicetree/bindings/sound/loongson,ls-audio-card.yaml     | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/sound/loongson,ls-audio-card.yaml b/Documentation/devicetree/bindings/sound/loongson,ls-audio-card.yaml
index e1b7445a8b22..8c214e5d04b1 100644
--- a/Documentation/devicetree/bindings/sound/loongson,ls-audio-card.yaml
+++ b/Documentation/devicetree/bindings/sound/loongson,ls-audio-card.yaml
@@ -20,7 +20,9 @@ allOf:
 
 properties:
   compatible:
-    const: loongson,ls-audio-card
+    enum:
+      - loongson,ls-audio-card  # Loongson-2K1000/Loongson-2K2000/LS7A
+      - loongson,ls2k0300-forever-pi-audio-card # CTCISZ Forever Pi
 
   mclk-fs:
     $ref: simple-card.yaml#/definitions/mclk-fs
-- 
2.52.0

