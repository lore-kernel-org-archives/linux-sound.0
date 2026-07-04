Received: from cstnet.cn (smtp21.cstnet.cn [159.226.251.21])
	(using TLSv1.2 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15AB3324B22;
	Sat,  4 Jul 2026 07:23:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.226.251.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783149845; cv=none; b=mJYwoxgYXzdVE47QOng6W9BaGNsywTMpfIPspqPBlq0uSOdwOt7FdApSzOWEirDNL4nywpfJvg/bcgUILNIhVA3fshWDPQjlAcYwh11rlFt3Acm8c3IuujB9ZaZ1G6O9FraHatHrSeTwP5tBSksQWT8JLdMuJIyVv0AHTyRtjnw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783149845; c=relaxed/simple;
	bh=mAy3WAbFbrR/rzI/ucPkaLXGg5+CO1SFksRDofFIWpI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=gdaJh3Pbt4xnBX8jiUhMQ6PnlHoulhCt7jrZNcV4GWSj/RZbAanote2+KmmYpMOH9daMeWuCFzyyoMvajz5bYAKnAgLDKcXqegZmiV2C+a7dQO5s+PMjM+M5gMcMhDeqLSkvp8b/QsIHUHK5H8FQbYqJ228GxD1/El/sAq/EeIY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn; spf=pass smtp.mailfrom=iscas.ac.cn; arc=none smtp.client-ip=159.226.251.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iscas.ac.cn
Received: from localhost.localdomain (unknown [111.196.245.140])
	by APP-01 (Coremail) with SMTP id qwCowABH5c0FtUhqRsqgBA--.11770S2;
	Sat, 04 Jul 2026 15:23:49 +0800 (CST)
From: Pengpeng Hou <pengpeng@iscas.ac.cn>
To: Srinivas Kandagatla <srini@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	linux-sound@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Pengpeng Hou <pengpeng@iscas.ac.cn>
Subject: [PATCH] ASoC: codecs: wcd939x-sdw: Propagate regcache_sync() errors
Date: Sat,  4 Jul 2026 15:23:47 +0800
Message-ID: <20260704072347.76000-1-pengpeng@iscas.ac.cn>
X-Mailer: git-send-email 2.50.1
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:qwCowABH5c0FtUhqRsqgBA--.11770S2
X-Coremail-Antispam: 1UD129KBjvdXoWrtF1rZFy8Ww4DGF1xAryDAwb_yoWkWFgEga
	48uF4vgFs5WFsrW3yDtr4jvrZ7uFsrCa4xtwnrtF47t348tr12yFW3trnxCw15Xr1kCF15
	ur1j9w1xAryjkjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUIcSsGvfJTRUUUbx8FF20E14v26r4j6ryUM7CY07I20VC2zVCF04k26cxKx2IYs7xG
	6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8w
	A2z4x0Y4vE2Ix0cI8IcVAFwI0_Gr0_Xr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Gr1j
	6F4UJwA2z4x0Y4vEx4A2jsIE14v26r4UJVWxJr1l84ACjcxK6I8E87Iv6xkF7I0E14v26r
	xl6s0DM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj
	6xIIjxv20xvE14v26r1q6rW5McIj6I8E87Iv67AKxVW8JVWxJwAm72CE4IkC6x0Yz7v_Jr
	0_Gr1lF7xvr2IYc2Ij64vIr41lF7I21c0EjII2zVCS5cI20VAGYxC7MxkF7I0En4kS14v2
	6r1q6r43MxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrV
	AFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUtVW8ZwCI
	c40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1I6r4UMIIF0xvE2Ix0cI8IcVCY1x0267
	AKxVWxJVW8Jr1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r4j
	6F4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Cr1j6rxdYxBIdaVFxhVjvjDU0xZFpf9x0JUDOz
	3UUUUU=
X-CM-SenderInfo: pshqw1xhqjqxpvfd2hldfou0/

wcd939x_sdw_runtime_resume() leaves cache-only mode and replays cached
register state when a regmap is present. It currently ignores
regcache_sync() failures and returns success.

Propagate the error and restore cache-only/dirty state on failure.

Signed-off-by: Pengpeng Hou <pengpeng@iscas.ac.cn>
---
 sound/soc/codecs/wcd939x-sdw.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/sound/soc/codecs/wcd939x-sdw.c b/sound/soc/codecs/wcd939x-sdw.c
index 95f4be287e79..69b9b08118f0 100644
--- a/sound/soc/codecs/wcd939x-sdw.c
+++ b/sound/soc/codecs/wcd939x-sdw.c
@@ -1431,10 +1431,16 @@ static int wcd939x_sdw_runtime_suspend(struct device *dev)
 static int wcd939x_sdw_runtime_resume(struct device *dev)
 {
 	struct wcd939x_sdw_priv *wcd = dev_get_drvdata(dev);
+	int ret;
 
 	if (wcd->regmap) {
 		regcache_cache_only(wcd->regmap, false);
-		regcache_sync(wcd->regmap);
+		ret = regcache_sync(wcd->regmap);
+		if (ret) {
+			regcache_cache_only(wcd->regmap, true);
+			regcache_mark_dirty(wcd->regmap);
+			return ret;
+		}
 	}
 
 	return 0;
-- 
2.43.0

