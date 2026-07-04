Received: from cstnet.cn (smtp21.cstnet.cn [159.226.251.21])
	(using TLSv1.2 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CC2B386C3B;
	Sat,  4 Jul 2026 07:27:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.226.251.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783150050; cv=none; b=Jlu2XRvk3scVdqbunBetYKl/vh2hzI9uZw+mbaWF+ZRe8nawC19TOWnE2xe+P1d+4Dstpen476OBuHuLk621hxaNFkhXLHvR0UVfb3cc+HwvGNOnr4trfShPf24a2UA1rGMRcVlkQ9oh6KGodTyXTbegjBqGEpEYMuKdlGg19/w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783150050; c=relaxed/simple;
	bh=gX4+5nCcAT7hUKQj1yv94ZIkvOgYMjPgJDneh2RUzf0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=XTf1NVG0VEG0hOmeIfJf69djoxvG14Mab8ATOwtzKUm20IwkeVpWNQGnoeVbFmo3FTKK0kRBo/4J5y6G50vCPeQ6/cJGnAzuXm7awiGpyaKGEpQDMOWV+9NypBg7i8X9FOTDCf9oQ/fGNO/sigtFCrNtSINxqoZgIpRg1ci3iSk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn; spf=pass smtp.mailfrom=iscas.ac.cn; arc=none smtp.client-ip=159.226.251.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iscas.ac.cn
Received: from localhost.localdomain (unknown [111.196.245.140])
	by APP-01 (Coremail) with SMTP id qwCowADHZc7StUhqZNigBA--.11656S2;
	Sat, 04 Jul 2026 15:27:14 +0800 (CST)
From: Pengpeng Hou <pengpeng@iscas.ac.cn>
To: David Rhodes <david.rhodes@cirrus.com>,
	Richard Fitzgerald <rf@opensource.cirrus.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	linux-sound@vger.kernel.org,
	patches@opensource.cirrus.com,
	linux-kernel@vger.kernel.org
Cc: Pengpeng Hou <pengpeng@iscas.ac.cn>
Subject: [PATCH] ASoC: codecs: cs42l42-sdw: Propagate regcache_sync() errors
Date: Sat,  4 Jul 2026 15:27:12 +0800
Message-ID: <20260704072712.91035-1-pengpeng@iscas.ac.cn>
X-Mailer: git-send-email 2.50.1
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:qwCowADHZc7StUhqZNigBA--.11656S2
X-Coremail-Antispam: 1UD129KBjvJXoW7CryfGw17WF4fCw1UJr1rtFb_yoW8GFykpF
	W3WFWkJrW8Xw4xCr90yw1UX3Wrt34Ika12y342y3WxAwn8Ja4aqF45JF17XF9rXFyjka9r
	ur1Utay8Cr15Jw7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUU9a14x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
	1l84ACjcxK6xIIjxv20xvE14v26ryj6F1UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4U
	JVWxJr1l84ACjcxK6I8E87Iv67AKxVW8Jr0_Cr1UM28EF7xvwVC2z280aVCY1x0267AKxV
	W0oVCq3wAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv
	7VC0I7IYx2IY67AKxVWUtVWrXwAv7VC2z280aVAFwI0_Gr0_Cr1lOx8S6xCaFVCjc4AY6r
	1j6r4UM4x0Y48IcxkI7VAKI48JM4x0x7Aq67IIx4CEVc8vx2IErcIFxwACI402YVCY1x02
	628vn2kIc2xKxwCY1x0262kKe7AKxVWUtVW8ZwCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4
	IE7xkEbVWUJVW8JwC20s026c02F40E14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1r
	MI8E67AF67kF1VAFwI0_Jw0_GFylIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVW8JV
	W5JwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Gr1j6F4UJwCI42IY6xAIw20EY4v20xvaj40_
	Jr0_JF4lIxAIcVC2z280aVAFwI0_Gr0_Cr1lIxAIcVC2z280aVCY1x0267AKxVWxJr0_Gc
	JvcSsGvfC2KfnxnUUI43ZEXa7VUbUPEDUUUUU==
X-CM-SenderInfo: pshqw1xhqjqxpvfd2hldfou0/

cs42l42_sdw_runtime_resume() first syncs LATCH_TO_VP and then syncs the
full regmap, but currently ignores both return values and can report
success after a failed replay.

Check both sync operations, return the first error, and restore cache-
only/dirty state on failure.

Signed-off-by: Pengpeng Hou <pengpeng@iscas.ac.cn>
---
 sound/soc/codecs/cs42l42-sdw.c | 14 ++++++++++++--
 1 file changed, 12 insertions(+), 2 deletions(-)

diff --git a/sound/soc/codecs/cs42l42-sdw.c b/sound/soc/codecs/cs42l42-sdw.c
index ad1256910a18..b61ca74dcf0b 100644
--- a/sound/soc/codecs/cs42l42-sdw.c
+++ b/sound/soc/codecs/cs42l42-sdw.c
@@ -481,10 +481,20 @@ static int cs42l42_sdw_runtime_resume(struct device *dev)
 	regcache_cache_only(cs42l42->regmap, false);
 
 	/* Sync LATCH_TO_VP first so the VP domain registers sync correctly */
-	regcache_sync_region(cs42l42->regmap, CS42L42_MIC_DET_CTL1, CS42L42_MIC_DET_CTL1);
-	regcache_sync(cs42l42->regmap);
+	ret = regcache_sync_region(cs42l42->regmap, CS42L42_MIC_DET_CTL1, CS42L42_MIC_DET_CTL1);
+	if (ret)
+		goto err_sync;
+
+	ret = regcache_sync(cs42l42->regmap);
+	if (ret)
+		goto err_sync;
 
 	return 0;
+
+err_sync:
+	regcache_cache_only(cs42l42->regmap, true);
+	regcache_mark_dirty(cs42l42->regmap);
+	return ret;
 }
 
 static int cs42l42_sdw_resume(struct device *dev)
-- 
2.43.0

