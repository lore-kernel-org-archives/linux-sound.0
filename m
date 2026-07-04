Received: from cstnet.cn (smtp21.cstnet.cn [159.226.251.21])
	(using TLSv1.2 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A7BE3921D5;
	Sat,  4 Jul 2026 07:18:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.226.251.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783149549; cv=none; b=mlXJbT3uASnFyinvsiTAZytd5FZQKB0uKSVZBWoiNu4lpFOz2CgX/12DVWrg8y46oqWczQoBOX1XyFjRbVnjEScRMXh/KqQX+w/UeXgvzFKfsvCIPbMt0+4j3YZGFWHRWyvtFKHkGRJHKkaoIydNO2lUolei7n+EKKCtUZ81PLg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783149549; c=relaxed/simple;
	bh=Q9mbv9MSkQ1Fucq6MSdxmOqzAV4/n3R3jrnHvXvd/Mo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=cnG1+pFQu1E8ofBXbI6tZd0+Fl2s1dza7poaBF6BCH6uXv/xGcRlkR1v8pGV7ehFTHzkYKvZw9g4NEkqnHRkjW3zSm2S6HXluPVNJ6sANZFTQo/f7+Ov+0vosXW1quYkmop016ULjeXv0kPDxkV0+11cRTkfkppIzSDicwlfrhg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn; spf=pass smtp.mailfrom=iscas.ac.cn; arc=none smtp.client-ip=159.226.251.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iscas.ac.cn
Received: from localhost.localdomain (unknown [111.196.245.140])
	by APP-01 (Coremail) with SMTP id qwCowABnBc7Zs0hqjrCgBA--.11513S2;
	Sat, 04 Jul 2026 15:18:50 +0800 (CST)
From: Pengpeng Hou <pengpeng@iscas.ac.cn>
To: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Charles Keepax <ckeepax@opensource.cirrus.com>,
	Linus Walleij <linusw@kernel.org>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig=20=28The=20Capable=20Hub=29?= <u.kleine-koenig@baylibre.com>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Pengpeng Hou <pengpeng@iscas.ac.cn>
Subject: [PATCH] ASoC: codecs: max98927: Propagate regcache_sync() errors
Date: Sat,  4 Jul 2026 15:18:48 +0800
Message-ID: <20260704071848.47928-1-pengpeng@iscas.ac.cn>
X-Mailer: git-send-email 2.50.1
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:qwCowABnBc7Zs0hqjrCgBA--.11513S2
X-Coremail-Antispam: 1UD129KBjvdXoWrtF15uryrGFy5CrWkCrWfKrg_yoWkZFXEg3
	47u34jgw45WF4xCa4DGr1jy3ykXFWIya4xKrn2qF47K34UJF1qyryUCrnxC3yUXr1kC3W5
	GrnI9r1rCa4vkjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUIcSsGvfJTRUUUba8FF20E14v26r4j6ryUM7CY07I20VC2zVCF04k26cxKx2IYs7xG
	6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8w
	A2z4x0Y4vE2Ix0cI8IcVAFwI0_Gr0_Xr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Cr0_
	Gr1UM28EF7xvwVC2z280aVAFwI0_Gr1j6F4UJwA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_Gc
	CE3s1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E
	2Ix0cI8IcVAFwI0_JF0_Jw1lYx0Ex4A2jsIE14v26r4j6F4UMcvjeVCFs4IE7xkEbVWUJV
	W8JwACjcxG0xvY0x0EwIxGrwACjI8F5VA0II8E6IAqYI8I648v4I1lFIxGxcIEc7CjxVA2
	Y2ka0xkIwI1lc7CjxVAaw2AFwI0_Jw0_GFyl42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x
	0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2
	zVAF1VAY17CE14v26r1q6r43MIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF
	4lIxAIcVC0I7IYx2IY6xkF7I0E14v26F4j6r4UJwCI42IY6xAIw20EY4v20xvaj40_Jr0_
	JF4lIxAIcVC2z280aVAFwI0_Gr0_Cr1lIxAIcVC2z280aVCY1x0267AKxVWxJr0_GcJvcS
	sGvfC2KfnxnUUI43ZEXa7VUbo5l5UUUUU==
X-CM-SenderInfo: pshqw1xhqjqxpvfd2hldfou0/

max98927_resume() leaves cache-only mode and replays cached register
state into the device. It currently ignores regcache_sync() failures and
returns success.

Propagate the error and restore cache-only/dirty state on failure.

Signed-off-by: Pengpeng Hou <pengpeng@iscas.ac.cn>
---
 sound/soc/codecs/max98927.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/sound/soc/codecs/max98927.c b/sound/soc/codecs/max98927.c
index 65e6fdb30eec..524300d8fb0b 100644
--- a/sound/soc/codecs/max98927.c
+++ b/sound/soc/codecs/max98927.c
@@ -742,11 +742,17 @@ static int max98927_suspend(struct device *dev)
 static int max98927_resume(struct device *dev)
 {
 	struct max98927_priv *max98927 = dev_get_drvdata(dev);
+	int ret;
 
 	regmap_write(max98927->regmap, MAX98927_R0100_SOFT_RESET,
 		     MAX98927_SOFT_RESET);
 	regcache_cache_only(max98927->regmap, false);
-	regcache_sync(max98927->regmap);
+	ret = regcache_sync(max98927->regmap);
+	if (ret) {
+		regcache_cache_only(max98927->regmap, true);
+		regcache_mark_dirty(max98927->regmap);
+		return ret;
+	}
 	return 0;
 }
 
-- 
2.43.0

