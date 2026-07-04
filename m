Received: from cstnet.cn (smtp25.cstnet.cn [159.226.251.25])
	(using TLSv1.2 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33255381B0E;
	Sat,  4 Jul 2026 03:58:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.226.251.25
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783137500; cv=none; b=hrGq3Qzit+dzyDXt8EvNzqtqKcj+KIMbgJnIKhH+newVlc2Ye8E2Dqq2oKfliRfVICH5vnQ4s02O4SRQJr6Ml6DgQ8uh4vai6eEsKB0cT3aYBz/RdUUrbPUkeMhlK9Y38E+b2tYIihwNeWd/P99oiPuD1GfY+lhmvWUfiS5kOLs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783137500; c=relaxed/simple;
	bh=Auf6qtyj6k/uHsygF/rawR7ADLZYzd3BWzMZzckW6/w=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=JzwbFYYxQvJgi76s5aOIgROw0Mwe4z3afWE349Qfs/PXVuiivaZjL8xWbBjEpDIOGJxdFq0O7u7WhE5KnBkNncodHaJQtDZSTnE/3Xd0/0M1lT4DCw8+05Ik8l43GUg1QoIKZv7yfM3MiLszMImL6xEtJiBHOhs+LBtwqJ0HZTU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn; spf=pass smtp.mailfrom=iscas.ac.cn; arc=none smtp.client-ip=159.226.251.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iscas.ac.cn
Received: from localhost.localdomain (unknown [111.196.245.140])
	by APP-05 (Coremail) with SMTP id zQCowAAnoPO8hEhq0ibJFg--.61722S2;
	Sat, 04 Jul 2026 11:57:48 +0800 (CST)
From: Pengpeng Hou <pengpeng@iscas.ac.cn>
To: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>
Cc: Srinivas Kandagatla <srini@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	linux-sound@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Oder Chiou <oder_chiou@realtek.com>,
	Shenghao Ding <shenghao-ding@ti.com>,
	Kevin Lu <kevin-lu@ti.com>,
	Baojun Xu <baojun.xu@ti.com>,
	David Rhodes <david.rhodes@cirrus.com>,
	Richard Fitzgerald <rf@opensource.cirrus.com>,
	patches@opensource.cirrus.com,
	Bartosz Golaszewski <brgl@kernel.org>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	Charles Keepax <ckeepax@opensource.cirrus.com>,
	Sebastian Krzyszkowiak <sebastian.krzyszkowiak@puri.sm>,
	Shengjiu Wang <shengjiu.wang@nxp.com>,
	Sharique Mohammad <sharq0406@gmail.com>,
	Pengpeng Hou <pengpeng@iscas.ac.cn>
Subject: [PATCH 09/19] ASoC: codecs: tas2783-sdw: Propagate regcache_sync() errors
Date: Sat,  4 Jul 2026 11:57:46 +0800
Message-ID: <20260704035746.82560-1-pengpeng@iscas.ac.cn>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260704034845.14291-1-pengpeng@iscas.ac.cn>
References: <20260704034845.14291-1-pengpeng@iscas.ac.cn>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:zQCowAAnoPO8hEhq0ibJFg--.61722S2
X-Coremail-Antispam: 1UD129KBjvJXoW7uFyxXFWkurWktFWkWry7GFg_yoW8AF1fp3
	s3CFWrJ3yxWr1xArn3Ar1xJF4Sgr92ya1ak34Yyw4fCrn8Jw1jgry5Ar1UZrZ5XFW8KF47
	ZayUtayDCF15WaUanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUU9q14x267AKxVW5JVWrJwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
	1l84ACjcxK6xIIjxv20xvE14v26r4j6ryUM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4U
	JVWxJr1l84ACjcxK6I8E87Iv67AKxVW8Jr0_Cr1UM28EF7xvwVC2z280aVCY1x0267AKxV
	WxJr0_GcWle2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IEw4CE5I8CrVC2j2Wl
	Yx0E2Ix0cI8IcVAFwI0_Jw0_WrylYx0Ex4A2jsIE14v26r4j6F4UMcvjeVCFs4IE7xkEbV
	WUJVW8JwACjcxG0xvY0x0EwIxGrwACjI8F5VA0II8E6IAqYI8I648v4I1lFIxGxcIEc7Cj
	xVA2Y2ka0xkIwI1lc7CjxVAaw2AFwI0_GFv_Wryl42xK82IYc2Ij64vIr41l4I8I3I0E4I
	kC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWU
	WwC2zVAF1VAY17CE14v26r4a6rW5MIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_JF
	I_Gr1lIxAIcVC0I7IYx2IY6xkF7I0E14v26r4UJVWxJr1lIxAIcVCF04k26cxKx2IYs7xG
	6r1j6r1xMIIF0xvEx4A2jsIE14v26r4j6F4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Gr1j6F
	4UJbIYCTnIWIevJa73UjIFyTuYvjTRABMKDUUUU
X-CM-SenderInfo: pshqw1xhqjqxpvfd2hldfou0/

regcache_sync() can fail while replaying cached register state after
SoundWire resume or attach handling. tas2783 currently ignores that
failure.

Propagate the error and restore cache-only/dirty state on failure.

Signed-off-by: Pengpeng Hou <pengpeng@iscas.ac.cn>
---
 sound/soc/codecs/tas2783-sdw.c | 16 ++++++++++++++--
 1 file changed, 14 insertions(+), 2 deletions(-)

diff --git a/sound/soc/codecs/tas2783-sdw.c b/sound/soc/codecs/tas2783-sdw.c
index 3d0b116544cc..db58c50e8a83 100644
--- a/sound/soc/codecs/tas2783-sdw.c
+++ b/sound/soc/codecs/tas2783-sdw.c
@@ -1099,7 +1099,13 @@ static s32 tas2783_sdca_dev_resume(struct device *dev)
 	}
 
 	regcache_cache_only(tas_dev->regmap, false);
-	regcache_sync(tas_dev->regmap);
+	ret = regcache_sync(tas_dev->regmap);
+	if (ret) {
+		regcache_cache_only(tas_dev->regmap, true);
+		regcache_mark_dirty(tas_dev->regmap);
+		return ret;
+	}
+
 	return 0;
 }
 
@@ -1210,6 +1216,7 @@ static s32 tas_update_status(struct sdw_slave *slave,
 {
 	struct tas2783_prv *tas_dev = dev_get_drvdata(&slave->dev);
 	struct device *dev = &slave->dev;
+	int ret;
 
 	dev_dbg(dev, "Peripheral status = %s",
 		status == SDW_SLAVE_UNATTACHED ? "unattached" :
@@ -1227,7 +1234,12 @@ static s32 tas_update_status(struct sdw_slave *slave,
 
 	/* updated the cache data to device */
 	regcache_cache_only(tas_dev->regmap, false);
-	regcache_sync(tas_dev->regmap);
+	ret = regcache_sync(tas_dev->regmap);
+	if (ret) {
+		regcache_cache_only(tas_dev->regmap, true);
+		regcache_mark_dirty(tas_dev->regmap);
+		return ret;
+	}
 
 	/* perform I/O transfers required for Slave initialization */
 	return tas_io_init(&slave->dev, slave);
-- 
2.43.0

