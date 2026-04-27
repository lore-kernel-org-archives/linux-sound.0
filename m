Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8AB443195FC;
	Mon, 27 Apr 2026 14:47:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777301252; cv=none; b=KEg51ill2EiiRhWD7L/VWAuraZrjwyCpx9F2lXJjtSw+iBqOWvBUJSXgcGj1WXAqv9vvpLbYgkLvZ2FBPuR1sTCJj34p2I4iWyxu52oNyRQr99V1bVNr5rT6KvLleQK6KBVtWHlIFZal4zf9onDBaLCyUziRVFVGg0VYCflBwWo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777301252; c=relaxed/simple;
	bh=Z483jaq0PLbsnfulejve6EMRSqLX8gYSbFxJJPyN+J8=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Sj2wqnItBF8k+4aYBlDx3kF9GlvN2dZkDPCOXkPohMstAmoby5iPmDF7vKjyosLZf/Qk3NMbR++Di8XMfqWu7kyS8twOMHXeWC65h1+R5gybLTblBk06JzJrXZizl19gPtpOJdqxAFEFaEQh2+3CLNFpGfcekYVnTV91AKqSEJU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=eGE/TAFG; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="eGE/TAFG"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C7A6BC2BCB4;
	Mon, 27 Apr 2026 14:47:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777301252;
	bh=Z483jaq0PLbsnfulejve6EMRSqLX8gYSbFxJJPyN+J8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=eGE/TAFGP3EM1iSaHiXOvAVrROZj0Wr7WKrXXtoP4nNEi9T+nHTZBN7vnwD0wp8Zi
	 qdvWsLRkfev7pSaALiZ2bbElfC1CBn8eTFeu0w9RZBhxMwRIaz40BKA4+e4zyHc/nG
	 FFkLaeSVx32p1R0Uz92O3pHxsgKmLbRPf2K3aaEm9RwPMtdmCWQ4sgg9VtHV/mn97Y
	 Ly3OVFNae0eHxq/hsIEGHkMFBltJSRsQgRq7TaACqDFD7QQ3sYY3ynNmagm4PaBjGS
	 MJNqkJdv4+3Jd3kVkANI54Txbe+2HW1vTPRy0fHjUi2B38V2rgjRJ1dl0mbS5/ntzZ
	 r+U8fuliu6TnA==
From: Arnd Bergmann <arnd@kernel.org>
To: Daniel Mack <daniel@zonque.org>,
	Haojian Zhuang <haojian.zhuang@gmail.com>,
	Robert Jarzmik <robert.jarzmik@free.fr>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>
Cc: Arnd Bergmann <arnd@arndb.de>,
	Thierry Reding <treding@nvidia.com>,
	Mark Brown <broonie@kernel.org>,
	Andy Shevchenko <andriy.shevchenko@intel.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-sound@vger.kernel.org
Subject: [PATCH 2/3] ASoC: pxa2xx: push gpio usage into arch code
Date: Mon, 27 Apr 2026 16:46:30 +0200
Message-Id: <20260427144658.3609647-2-arnd@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20260427144658.3609647-1-arnd@kernel.org>
References: <20260427144658.3609647-1-arnd@kernel.org>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Arnd Bergmann <arnd@arndb.de>

There are no remaining static platform_device users of pxa2xx ac97,
so the rest of that code path can go away as well.

Since nothing in the driver uses the gpio number now, constrain the use
of the legacy gpio interface to the architecture specific code.

Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 arch/arm/mach-pxa/pxa27x.c             |  9 ++++++++-
 include/linux/platform_data/asoc-pxa.h |  2 +-
 sound/arm/pxa2xx-ac97-lib.c            | 25 ++++++-------------------
 3 files changed, 15 insertions(+), 21 deletions(-)

diff --git a/arch/arm/mach-pxa/pxa27x.c b/arch/arm/mach-pxa/pxa27x.c
index ff6361979038..c588eeea1485 100644
--- a/arch/arm/mach-pxa/pxa27x.c
+++ b/arch/arm/mach-pxa/pxa27x.c
@@ -58,8 +58,15 @@ static unsigned long ac97_reset_config[] = {
 	GPIO95_AC97_nRESET,
 };
 
-void pxa27x_configure_ac97reset(int reset_gpio, bool to_gpio)
+void pxa27x_configure_ac97reset(struct gpio_desc *gpiod, bool to_gpio)
 {
+	int reset_gpio;
+
+	if (!gpiod)
+		return;
+
+	reset_gpio = desc_to_gpio(gpiod);
+
 	/*
 	 * This helper function is used to work around a bug in the pxa27x's
 	 * ac97 controller during a warm reset.  The configuration of the
diff --git a/include/linux/platform_data/asoc-pxa.h b/include/linux/platform_data/asoc-pxa.h
index 7df78867db49..0d5eaf4b100c 100644
--- a/include/linux/platform_data/asoc-pxa.h
+++ b/include/linux/platform_data/asoc-pxa.h
@@ -6,6 +6,6 @@
 #include <sound/pcm.h>
 #include <sound/ac97_codec.h>
 
-extern void pxa27x_configure_ac97reset(int reset_gpio, bool to_gpio);
+extern void pxa27x_configure_ac97reset(struct gpio_desc *reset_gpio, bool to_gpio);
 
 #endif
diff --git a/sound/arm/pxa2xx-ac97-lib.c b/sound/arm/pxa2xx-ac97-lib.c
index 79eb557d4942..4913c8818ddf 100644
--- a/sound/arm/pxa2xx-ac97-lib.c
+++ b/sound/arm/pxa2xx-ac97-lib.c
@@ -29,7 +29,6 @@ static DECLARE_WAIT_QUEUE_HEAD(gsr_wq);
 static volatile long gsr_bits;
 static struct clk *ac97_clk;
 static struct clk *ac97conf_clk;
-static int reset_gpio;
 struct gpio_desc *rst_gpio;
 static void __iomem *ac97_reg_base;
 
@@ -140,10 +139,10 @@ static inline void pxa_ac97_warm_pxa27x(void)
 	gsr_bits = 0;
 
 	/* warm reset broken on Bulverde, so manually keep AC97 reset high */
-	pxa27x_configure_ac97reset(reset_gpio, true);
+	pxa27x_configure_ac97reset(rst_gpio, true);
 	udelay(10);
 	writel(readl(ac97_reg_base + GCR) | (GCR_WARM_RST), ac97_reg_base + GCR);
-	pxa27x_configure_ac97reset(reset_gpio, false);
+	pxa27x_configure_ac97reset(rst_gpio, false);
 	udelay(500);
 }
 
@@ -328,24 +327,12 @@ int pxa2xx_ac97_hw_probe(struct platform_device *dev)
 		return PTR_ERR(ac97_reg_base);
 	}
 
-	if (dev->dev.of_node) {
+	if (cpu_is_pxa27x()) {
 		/* Assert reset using GPIOD_OUT_HIGH, because reset is GPIO_ACTIVE_LOW */
 		rst_gpio = devm_gpiod_get(&dev->dev, "reset", GPIOD_OUT_HIGH);
-		if (IS_ERR(rst_gpio)) {
-			ret = PTR_ERR(rst_gpio);
-			if (ret == -ENOENT)
-				reset_gpio = -1;
-			else if (ret)
-				return ret;
-		} else {
-			reset_gpio = desc_to_gpio(rst_gpio);
-		}
-	} else {
-		if (cpu_is_pxa27x())
-			reset_gpio = 113;
-	}
+		if (IS_ERR(rst_gpio))
+			rst_gpio = NULL;
 
-	if (cpu_is_pxa27x()) {
 		/*
 		 * This gpio is needed for a work-around to a bug in the ac97
 		 * controller during warm reset.  The direction and level is set
@@ -353,7 +340,7 @@ int pxa2xx_ac97_hw_probe(struct platform_device *dev)
 		 * AC97_nRESET alt function to generic gpio.
 		 */
 		gpiod_set_consumer_name(rst_gpio, "pxa27x ac97 reset");
-		pxa27x_configure_ac97reset(reset_gpio, false);
+		pxa27x_configure_ac97reset(rst_gpio, false);
 
 		ac97conf_clk = clk_get(&dev->dev, "AC97CONFCLK");
 		if (IS_ERR(ac97conf_clk)) {
-- 
2.39.5

