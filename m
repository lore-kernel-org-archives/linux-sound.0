Received: from cstnet.cn (smtp21.cstnet.cn [159.226.251.21])
	(using TLSv1.2 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 800EA2773C1;
	Thu, 18 Dec 2025 02:07:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.226.251.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766023660; cv=none; b=rTXJ4/v6fi9Up3+nYwFRXibUSDReh9N3Th5Nc7s5sTTLot+yWgKwUW1cMcNP+qvGc3mZOi6brwb9cqE3EAVaqii5ql8RZSTlRKs+n3m4vSMVxJR5fcjKCra08df/u2z5FCjf9sOB68cwKfBU8joAuYfb/igPHUeCerG3I/G661g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766023660; c=relaxed/simple;
	bh=5soEZj7gyznQRntreZeaqpNv8difHqkcqWDSIxvuOTA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=MPAnEtq/DnQWTvLsCuMmBq8y0G0A/38slVV2h+YgxOFKHp87eLRYaZ4afPaVUh3LOAEQrroGG16dep//i0mISOHiQG5Hsy1Mpb18BPxJomPFNKxjkp5zG8oy5Z1/Z1UJz4Ilg5YV9CyYTdDNs3SgUixkUe4VJJaW8a4TpHfYecM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn; spf=pass smtp.mailfrom=iscas.ac.cn; arc=none smtp.client-ip=159.226.251.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iscas.ac.cn
Received: from DESKTOP-L0HPE2S.localdomain (unknown [124.16.141.245])
	by APP-01 (Coremail) with SMTP id qwCowAC3XmreYUNpCxn3AA--.46856S2;
	Thu, 18 Dec 2025 10:07:27 +0800 (CST)
From: Haotian Zhang <vulab@iscas.ac.cn>
To: Shenghao Ding <shenghao-ding@ti.com>,
	Kevin Lu <kevin-lu@ti.com>,
	Baojun Xu <baojun.xu@ti.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>
Cc: Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Haotian Zhang <vulab@iscas.ac.cn>
Subject: [PATCH v2] ASoC: tlv320aic32x4: Fix missing error check for devm_clk_register()
Date: Thu, 18 Dec 2025 10:07:16 +0800
Message-ID: <20251218020716.1326-1-vulab@iscas.ac.cn>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251217025051.2196-1-vulab@iscas.ac.cn>
References: <20251217025051.2196-1-vulab@iscas.ac.cn>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:qwCowAC3XmreYUNpCxn3AA--.46856S2
X-Coremail-Antispam: 1UD129KBjvJXoW7tFW3CFWxWr4DtF17Cw4UJwb_yoW8AFW8pr
	n5C395t3y5ArWUur4ay3WkGF1IgFWIkF48Zw1rCw12y3ZxArWrJF47XF15XFsaka4akw12
	qr13Zay8Ca17Cr7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUU9F14x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
	1l84ACjcxK6xIIjxv20xvE14v26ryj6F1UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26F4j
	6r4UJwA2z4x0Y4vEx4A2jsIE14v26F4UJVW0owA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_Cr
	1j6rxdM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj
	6xIIjxv20xvE14v26r1j6r18McIj6I8E87Iv67AKxVWUJVW8JwAm72CE4IkC6x0Yz7v_Jr
	0_Gr1lF7xvr2IYc2Ij64vIr41lF7I21c0EjII2zVCS5cI20VAGYxC7M4IIrI8v6xkF7I0E
	8cxan2IY04v7MxkF7I0En4kS14v26r1q6r43MxAIw28IcxkI7VAKI48JMxC20s026xCaFV
	Cjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWl
	x4CE17CEb7AF67AKxVWUtVW8ZwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1j6r
	1xMIIF0xvE2Ix0cI8IcVCY1x0267AKxVW8JVWxJwCI42IY6xAIw20EY4v20xvaj40_Jr0_
	JF4lIxAIcVC2z280aVAFwI0_Jr0_Gr1lIxAIcVC2z280aVCY1x0267AKxVW8JVW8JrUvcS
	sGvfC2KfnxnUUI43ZEXa7VUbGQ6JUUUUU==
X-CM-SenderInfo: pyxotu46lvutnvoduhdfq/1tbiBwoAA2lDUZNKrQAAsB

aic32x4_register_clocks() ignores the return value of
aic32x4_register_clk(), which returns the result of
devm_clk_register(). This causes the driver to ignore
clock registration errors and return success even if
devm_clk_register() fails.

Check the return value of aic32x4_register_clk() and
return the error code if registration fails. The
aic32x4_probe() has already implemented the check for the
return value of aic32x4_register_clocks().

Fixes: 514b044cba66 ("ASoC: tlv320aic32x4: Model PLL in CCF")
Signed-off-by: Haotian Zhang <vulab@iscas.ac.cn>
---
Changes in v2:
  - Correct the missing braces{} for the loop.
---
 sound/soc/codecs/tlv320aic32x4-clk.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/sound/soc/codecs/tlv320aic32x4-clk.c b/sound/soc/codecs/tlv320aic32x4-clk.c
index 5c0a76a4a106..663b969d6af9 100644
--- a/sound/soc/codecs/tlv320aic32x4-clk.c
+++ b/sound/soc/codecs/tlv320aic32x4-clk.c
@@ -479,6 +479,7 @@ static struct clk *aic32x4_register_clk(struct device *dev,
 int aic32x4_register_clocks(struct device *dev, const char *mclk_name)
 {
 	int i;
+	struct clk *clk;
 
 	/*
 	 * These lines are here to preserve the current functionality of
@@ -491,8 +492,11 @@ int aic32x4_register_clocks(struct device *dev, const char *mclk_name)
 	aic32x4_clkdesc_array[1].parent_names =
 			(const char *[]) { mclk_name, "bclk", "gpio", "pll" };
 
-	for (i = 0; i < ARRAY_SIZE(aic32x4_clkdesc_array); ++i)
-		aic32x4_register_clk(dev, &aic32x4_clkdesc_array[i]);
+	for (i = 0; i < ARRAY_SIZE(aic32x4_clkdesc_array); ++i) {
+		clk = aic32x4_register_clk(dev, &aic32x4_clkdesc_array[i]);
+		if (IS_ERR(clk))
+			return PTR_ERR(clk);
+	}
 
 	return 0;
 }
-- 
2.43.0

