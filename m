Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2D1722C21D8;
	Wed, 11 Mar 2026 06:37:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.242.206.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773211063; cv=none; b=tBtsS9+3HgbMZ9Syj0IryHOV7RRWXz8u20/eEXKUO6FA0+UXCEMnLVwhDS0huQ/o4/I11ze8qUVAIFcRMPxa83VwZQpDuDkt2A1OXmKvjiUEXnXrNEeiXNh2cbl/fPsG1XbmQMR1/2nJiHxloH3huemkEen/aEq+3sc5XwZjIPg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773211063; c=relaxed/simple;
	bh=AFCUectqbA8Af1dbOY4v/g2LlIJPj6wRTwoVCBgoyGg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=qPo6CngHRMS0GF4cosUZDiffwgTJXcXfq0mlKifJYJwZGmn2JWx+ViiNm5Er6Yp0UcfZeQDbNFSPVLjQ97jFCcbiauZ12WNtXbVVL/mUt+jKnxZYEO15wrWsQDEmIbiB9KnKZ22CCpkWK6P96YD+imJOdzGiW97TTDhZVdRyElM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn; spf=pass smtp.mailfrom=loongson.cn; arc=none smtp.client-ip=114.242.206.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [223.64.68.227])
	by gateway (Coremail) with SMTP id _____8AxjsOzDbFpydIZAA--.10624S3;
	Wed, 11 Mar 2026 14:37:39 +0800 (CST)
Received: from kernelserver (unknown [223.64.68.227])
	by front1 (Coremail) with SMTP id qMiowJCx_8KoDbFpqclSAA--.26805S4;
	Wed, 11 Mar 2026 14:37:30 +0800 (CST)
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
Subject: [PATCH 2/6] ASoC: loongson: Combined regmap definitions
Date: Wed, 11 Mar 2026 14:37:17 +0800
Message-ID: <8fc0f9483b0ef0ff52ac5588f029f329098f45fc.1773107475.git.zhoubinbin@loongson.cn>
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
X-CM-TRANSID:qMiowJCx_8KoDbFpqclSAA--.26805S4
X-CM-SenderInfo: p2kr3uplqex0o6or00hjvr0hdfq/1tbiAgEDCGmxBCIAlwAAsh
X-Coremail-Antispam: 1Uk129KBj93XoW3GF13uw17XFWDWF1xKry3GFX_yoW7GFW7pr
	nxAa93WrW5Jr4ayanIyry8JFy5Cry3Cr93CF47Jw17Wr9rCw1UuF4rtF15Aw43CryDGryI
	vFy8GrW8Ga45G3XCm3ZEXasCq-sJn29KB7ZKAUJUUUU7529EdanIXcx71UUUUU7KY7ZEXa
	sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
	0xBIdaVrnRJUUUBIb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
	IYs7xG6rWj6s0DM7CIcVAFz4kK6r1Y6r17M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
	e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Xr0_Ar1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
	0_Cr0_Gr1UM28EF7xvwVC2z280aVAFwI0_Cr0_Gr1UM28EF7xvwVC2z280aVCY1x0267AK
	xVW8Jr0_Cr1UM2kKe7AKxVWUXVWUAwAS0I0E0xvYzxvE52x082IY62kv0487Mc804VCY07
	AIYIkI8VC2zVCFFI0UMc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0I7IYx2IY67AKxVWU
	tVWrXwAv7VC2z280aVAFwI0_Gr0_Cr1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcxkI7V
	AKI48JMxkF7I0En4kS14v26r126r1DMxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY
	6r1j6r4UMxCIbckI1I0E14v26r1Y6r17MI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7
	xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUtVW8ZwCIc40Y0x0EwIxGrwCI42IY6xII
	jxv20xvE14v26r4j6ryUMIIF0xvE2Ix0cI8IcVCY1x0267AKxVW8JVWxJwCI42IY6xAIw2
	0EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Gr0_Cr1lIxAIcVC2z280aVCY1x02
	67AKxVW8JVW8JrUvcSsGvfC2KfnxnUUI43ZEXa7IU0epB3UUUUU==

For Loongson I2S, the difference between i2s_plat and i2s_pci is more in
the external interface, the internal registers are accessed in the same
way, so the regmap definitions can be united to simplify the code.

Also, the following warning for the i2s_plat driver will be eliminated:

loongson-i2s-plat loongson-i2s: using zero-initialized flat cache, this may cause unexpected behavior.

Signed-off-by: Binbin Zhou <zhoubinbin@loongson.cn>
---
 sound/soc/loongson/loongson_i2s.c      | 55 ++++++++++++++++++++++++++
 sound/soc/loongson/loongson_i2s.h      |  1 +
 sound/soc/loongson/loongson_i2s_pci.c  | 54 -------------------------
 sound/soc/loongson/loongson_i2s_plat.c |  8 ----
 4 files changed, 56 insertions(+), 62 deletions(-)

diff --git a/sound/soc/loongson/loongson_i2s.c b/sound/soc/loongson/loongson_i2s.c
index e336656e13eb..09ccab0c535e 100644
--- a/sound/soc/loongson/loongson_i2s.c
+++ b/sound/soc/loongson/loongson_i2s.c
@@ -272,5 +272,60 @@ const struct dev_pm_ops loongson_i2s_pm = {
 };
 EXPORT_SYMBOL_GPL(loongson_i2s_pm);
 
+static bool loongson_i2s_wr_reg(struct device *dev, unsigned int reg)
+{
+	switch (reg) {
+	case LS_I2S_CFG:
+	case LS_I2S_CTRL:
+	case LS_I2S_RX_DATA:
+	case LS_I2S_TX_DATA:
+	case LS_I2S_CFG1:
+		return true;
+	default:
+		return false;
+	};
+}
+
+static bool loongson_i2s_rd_reg(struct device *dev, unsigned int reg)
+{
+	switch (reg) {
+	case LS_I2S_VER:
+	case LS_I2S_CFG:
+	case LS_I2S_CTRL:
+	case LS_I2S_RX_DATA:
+	case LS_I2S_TX_DATA:
+	case LS_I2S_CFG1:
+		return true;
+	default:
+		return false;
+	};
+}
+
+static bool loongson_i2s_volatile_reg(struct device *dev, unsigned int reg)
+{
+	switch (reg) {
+	case LS_I2S_CFG:
+	case LS_I2S_CTRL:
+	case LS_I2S_RX_DATA:
+	case LS_I2S_TX_DATA:
+	case LS_I2S_CFG1:
+		return true;
+	default:
+		return false;
+	};
+}
+
+const struct regmap_config loongson_i2s_regmap_config = {
+	.reg_bits = 32,
+	.reg_stride = 4,
+	.val_bits = 32,
+	.max_register = LS_I2S_CFG1,
+	.writeable_reg = loongson_i2s_wr_reg,
+	.readable_reg = loongson_i2s_rd_reg,
+	.volatile_reg = loongson_i2s_volatile_reg,
+	.cache_type = REGCACHE_FLAT,
+};
+EXPORT_SYMBOL_GPL(loongson_i2s_regmap_config);
+
 MODULE_LICENSE("GPL");
 MODULE_DESCRIPTION("Common functions for loongson I2S controller driver");
diff --git a/sound/soc/loongson/loongson_i2s.h b/sound/soc/loongson/loongson_i2s.h
index c8052a762c1b..e73ffa954ec9 100644
--- a/sound/soc/loongson/loongson_i2s.h
+++ b/sound/soc/loongson/loongson_i2s.h
@@ -65,6 +65,7 @@ struct loongson_i2s {
 	u32 sysclk;
 };
 
+extern const struct regmap_config loongson_i2s_regmap_config;
 extern const struct dev_pm_ops loongson_i2s_pm;
 extern struct snd_soc_dai_driver loongson_i2s_dai;
 
diff --git a/sound/soc/loongson/loongson_i2s_pci.c b/sound/soc/loongson/loongson_i2s_pci.c
index 1ea5501a97f8..dea1e4ebee29 100644
--- a/sound/soc/loongson/loongson_i2s_pci.c
+++ b/sound/soc/loongson/loongson_i2s_pci.c
@@ -18,60 +18,6 @@
 
 #define DRIVER_NAME "loongson-i2s-pci"
 
-static bool loongson_i2s_wr_reg(struct device *dev, unsigned int reg)
-{
-	switch (reg) {
-	case LS_I2S_CFG:
-	case LS_I2S_CTRL:
-	case LS_I2S_RX_DATA:
-	case LS_I2S_TX_DATA:
-	case LS_I2S_CFG1:
-		return true;
-	default:
-		return false;
-	};
-}
-
-static bool loongson_i2s_rd_reg(struct device *dev, unsigned int reg)
-{
-	switch (reg) {
-	case LS_I2S_VER:
-	case LS_I2S_CFG:
-	case LS_I2S_CTRL:
-	case LS_I2S_RX_DATA:
-	case LS_I2S_TX_DATA:
-	case LS_I2S_CFG1:
-		return true;
-	default:
-		return false;
-	};
-}
-
-static bool loongson_i2s_volatile_reg(struct device *dev, unsigned int reg)
-{
-	switch (reg) {
-	case LS_I2S_CFG:
-	case LS_I2S_CTRL:
-	case LS_I2S_RX_DATA:
-	case LS_I2S_TX_DATA:
-	case LS_I2S_CFG1:
-		return true;
-	default:
-		return false;
-	};
-}
-
-static const struct regmap_config loongson_i2s_regmap_config = {
-	.reg_bits = 32,
-	.reg_stride = 4,
-	.val_bits = 32,
-	.max_register = LS_I2S_CFG1,
-	.writeable_reg = loongson_i2s_wr_reg,
-	.readable_reg = loongson_i2s_rd_reg,
-	.volatile_reg = loongson_i2s_volatile_reg,
-	.cache_type = REGCACHE_FLAT,
-};
-
 static int loongson_i2s_pci_probe(struct pci_dev *pdev,
 				  const struct pci_device_id *pid)
 {
diff --git a/sound/soc/loongson/loongson_i2s_plat.c b/sound/soc/loongson/loongson_i2s_plat.c
index fa2e450ff618..f8d7aca8b903 100644
--- a/sound/soc/loongson/loongson_i2s_plat.c
+++ b/sound/soc/loongson/loongson_i2s_plat.c
@@ -85,14 +85,6 @@ static const struct snd_soc_component_driver loongson_i2s_component_driver = {
 	.open	= loongson_pcm_open,
 };
 
-static const struct regmap_config loongson_i2s_regmap_config = {
-	.reg_bits = 32,
-	.reg_stride = 4,
-	.val_bits = 32,
-	.max_register = 0x14,
-	.cache_type = REGCACHE_FLAT,
-};
-
 static int loongson_i2s_apbdma_config(struct platform_device *pdev)
 {
 	int val;
-- 
2.52.0

