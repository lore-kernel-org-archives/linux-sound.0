Received: from cstnet.cn (smtp21.cstnet.cn [159.226.251.21])
	(using TLSv1.2 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2E002116F4;
	Sat,  4 Jul 2026 07:38:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.226.251.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783150695; cv=none; b=NWBtEihxLUPr3eorRi0mumW6F4q3F7x9sQhzGHzonbs0u11L9uhErDPaDqz4JbA2eEQc+LwuGcYW4TBOEvoU60NFlfD/FPhJtT71e7FnUcag/membZFrbNkbkqAejnHiisOaSfP3T57oW7lZoitUUZXJJ9J7TZm2rB1Y3MCflRU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783150695; c=relaxed/simple;
	bh=8hFAiB+nq0MZvRAZJqXY8Nk3A9hyndUXm1Sml/NFAho=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=dLXyNcB6V6J9mQjCQh3mwOQyn9tE5+ry9DvPdZJo4gKMqQrVGhlkjFN+7NfS5mNTaqnJBB1anhtVr4z18gf1EBC2BuMtQschYbrAxlGkAwSmo8ejA06oSzbMLMXlAudjPLY4LAdVVG9wzvAowYrEZBLXzZIwGkFQeGZKVAvxuhA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn; spf=pass smtp.mailfrom=iscas.ac.cn; arc=none smtp.client-ip=159.226.251.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iscas.ac.cn
Received: from localhost.localdomain (unknown [111.196.245.140])
	by APP-01 (Coremail) with SMTP id qwCowADHYMlYuEhqXRChBA--.10226S2;
	Sat, 04 Jul 2026 15:38:00 +0800 (CST)
From: Pengpeng Hou <pengpeng@iscas.ac.cn>
To: Oder Chiou <oder_chiou@realtek.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Pengpeng Hou <pengpeng@iscas.ac.cn>
Subject: [PATCH] ASoC: codecs: rt721-sdca-sdw: Propagate regcache_sync() errors
Date: Sat,  4 Jul 2026 15:37:58 +0800
Message-ID: <20260704073758.37156-1-pengpeng@iscas.ac.cn>
X-Mailer: git-send-email 2.50.1
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:qwCowADHYMlYuEhqXRChBA--.10226S2
X-Coremail-Antispam: 1UD129KBjvJXoW7ZrWUXw1DAF4DGw4rZFW3trb_yoW8Xr45p3
	sxAF98Ww4xWr1xArWaqF17J3Z5K3saqF4ayw12kw4Svwn5X3WUC3WrCF17ZFyYgFWUCFW7
	Cr4jyay5GF43JaDanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUkK14x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
	1l84ACjcxK6xIIjxv20xvE14v26r4j6ryUM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26F4j
	6r4UJwA2z4x0Y4vEx4A2jsIE14v26F4UJVW0owA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_Gc
	CE3s1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E
	2Ix0cI8IcVAFwI0_JF0_Jw1lYx0Ex4A2jsIE14v26r4j6F4UMcvjeVCFs4IE7xkEbVWUJV
	W8JwACjcxG0xvY0x0EwIxGrwACjI8F5VA0II8E6IAqYI8I648v4I1lc7CjxVAaw2AFwI0_
	JF0_Jw1l42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67
	AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r1q6r43MIIY
	rxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_JFI_Gr1lIxAIcVC0I7IYx2IY6xkF7I0E14
	v26F4j6r4UJwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Gr0_
	Cr1lIxAIcVC2z280aVCY1x0267AKxVWxJr0_GcJvcSsGvfC2KfnxnUUI43ZEXa7VUjZNVP
	UUUUU==
X-CM-SenderInfo: pshqw1xhqjqxpvfd2hldfou0/

rt721_sdca_dev_resume() clears cache-only mode for both regmaps and
replays cached register state. Both regcache_sync() calls currently
ignore their return values.

Check both sync operations, return the first error, and restore both
regmaps to cache-only/dirty state on failure.

Signed-off-by: Pengpeng Hou <pengpeng@iscas.ac.cn>
---
 sound/soc/codecs/rt721-sdca-sdw.c | 19 ++++++++++++++++---
 1 file changed, 16 insertions(+), 3 deletions(-)

diff --git a/sound/soc/codecs/rt721-sdca-sdw.c b/sound/soc/codecs/rt721-sdca-sdw.c
index 041b381e582b..4f3d6f8d9b81 100644
--- a/sound/soc/codecs/rt721-sdca-sdw.c
+++ b/sound/soc/codecs/rt721-sdca-sdw.c
@@ -509,11 +509,24 @@ static int rt721_sdca_dev_resume(struct device *dev)
 		return ret;
 	}
 
-	regcache_cache_only(rt721->regmap, false);
-	regcache_sync(rt721->regmap);
+	regcache_cache_only(rt721->regmap, false);
+	ret = regcache_sync(rt721->regmap);
+	if (ret)
+		goto err_sync;
+
 	regcache_cache_only(rt721->mbq_regmap, false);
-	regcache_sync(rt721->mbq_regmap);
+	ret = regcache_sync(rt721->mbq_regmap);
+	if (ret)
+		goto err_sync;
+
 	return 0;
+
+err_sync:
+	regcache_cache_only(rt721->regmap, true);
+	regcache_cache_only(rt721->mbq_regmap, true);
+	regcache_mark_dirty(rt721->regmap);
+	regcache_mark_dirty(rt721->mbq_regmap);
+	return ret;
 }
 
 static const struct dev_pm_ops rt721_sdca_pm = {
-- 
2.43.0

