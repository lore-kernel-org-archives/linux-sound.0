Received: from cstnet.cn (smtp21.cstnet.cn [159.226.251.21])
	(using TLSv1.2 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D2A82ECD3A;
	Sat,  4 Jul 2026 07:21:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.226.251.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783149712; cv=none; b=MwJRI74APP04+RsLcTwKK0q8zPZIF14OcM+mLbFptaRj4lnrnAbdFtTWPsjlzEgsjR7EvNxFRq6bAgrnxszf/0oR6G0ugXMhYcY2+dNJuXuI6SZU8r84/j6sGnmUVrOYfLHRqEo+yJcTEu3OHCpFXJXjf1TY/DjsE4s3n1x1CKc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783149712; c=relaxed/simple;
	bh=+qbVSy8le6Ms9Bz3QzUvgO14TBpe8S53CTvJh4GrKvI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=MFJGhELKvxS28QCAs4OVuh68t4gUvVC1WqPZoxsnDJlj5pg8X9Ykd8XPiaFXlpb7K+ec1aJndcLekDSv70cJZ6MGb80hv0QGomaNLF424NTclkO4+O+RtQgSbE4mDq8Klz4TgZWF2qfXDmuhDq62Pvqr7qCKij++arXsCURl4os=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn; spf=pass smtp.mailfrom=iscas.ac.cn; arc=none smtp.client-ip=159.226.251.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iscas.ac.cn
Received: from localhost.localdomain (unknown [111.196.245.140])
	by APP-01 (Coremail) with SMTP id qwCowACHLdaGtEhqYMGgBA--.10462S2;
	Sat, 04 Jul 2026 15:21:42 +0800 (CST)
From: Pengpeng Hou <pengpeng@iscas.ac.cn>
To: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Linus Walleij <linusw@kernel.org>,
	Charles Keepax <ckeepax@opensource.cirrus.com>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig=20=28The=20Capable=20Hub=29?= <u.kleine-koenig@baylibre.com>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Pengpeng Hou <pengpeng@iscas.ac.cn>
Subject: [PATCH] ASoC: codecs: uda1342: Leave cache-only mode before syncing
Date: Sat,  4 Jul 2026 15:21:40 +0800
Message-ID: <20260704072140.67222-1-pengpeng@iscas.ac.cn>
X-Mailer: git-send-email 2.50.1
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:qwCowACHLdaGtEhqYMGgBA--.10462S2
X-Coremail-Antispam: 1UD129KBjvdXoWrtw1xXw4rXFWrAFy3Gw4kJFb_yoWkuFX_Wa
	47uaykWrW5WF4fuF1Dtr1rArZ7XFs3CFy7t3sxKr47J348tr1YyrWUJry3Cw18K34xu3W3
	CF1qvF1fJry5KjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUIcSsGvfJTRUUUba8FF20E14v26r4j6ryUM7CY07I20VC2zVCF04k26cxKx2IYs7xG
	6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8w
	A2z4x0Y4vE2Ix0cI8IcVAFwI0_Gr0_Xr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Cr0_
	Gr1UM28EF7xvwVC2z280aVAFwI0_Gr1j6F4UJwA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_Gc
	CE3s1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E
	2Ix0cI8IcVAFwI0_JF0_Jw1lYx0Ex4A2jsIE14v26r4j6F4UMcvjeVCFs4IE7xkEbVWUJV
	W8JwACjcxG0xvY0x0EwIxGrwACjI8F5VA0II8E6IAqYI8I648v4I1lFIxGxcIEc7CjxVA2
	Y2ka0xkIwI1lc7CjxVAaw2AFwI0_Jw0_GFyl42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x
	0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2
	zVAF1VAY17CE14v26r1q6r43MIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_JFI_Gr
	1lIxAIcVC0I7IYx2IY6xkF7I0E14v26F4j6r4UJwCI42IY6xAIw20EY4v20xvaj40_Jr0_
	JF4lIxAIcVC2z280aVAFwI0_Gr0_Cr1lIxAIcVC2z280aVCY1x0267AKxVWxJr0_GcJvcS
	sGvfC2KfnxnUUI43ZEXa7VUbo5l5UUUUU==
X-CM-SenderInfo: pshqw1xhqjqxpvfd2hldfou0/

uda1342_suspend() puts the regmap into cache-only mode. uda1342_resume()
marks the cache dirty and syncs it, but does not first leave cache-only
mode and ignores sync failures.

Leave cache-only mode before syncing the dirty cache, propagate sync
failures, and restore cache-only/dirty state on failure.

Signed-off-by: Pengpeng Hou <pengpeng@iscas.ac.cn>
---
 sound/soc/codecs/uda1342.c | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/sound/soc/codecs/uda1342.c b/sound/soc/codecs/uda1342.c
index 12f5757f4210..4e2d6240a869 100644
--- a/sound/soc/codecs/uda1342.c
+++ b/sound/soc/codecs/uda1342.c
@@ -308,9 +308,16 @@ static int uda1342_suspend(struct device *dev)
 static int uda1342_resume(struct device *dev)
 {
 	struct uda1342_priv *uda1342 = dev_get_drvdata(dev);
+	int ret;
 
+	regcache_cache_only(uda1342->regmap, false);
 	regcache_mark_dirty(uda1342->regmap);
-	regcache_sync(uda1342->regmap);
+	ret = regcache_sync(uda1342->regmap);
+	if (ret) {
+		regcache_cache_only(uda1342->regmap, true);
+		regcache_mark_dirty(uda1342->regmap);
+		return ret;
+	}
 
 	return 0;
 }
-- 
2.43.0

