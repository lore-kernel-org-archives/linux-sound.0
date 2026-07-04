Received: from cstnet.cn (smtp21.cstnet.cn [159.226.251.21])
	(using TLSv1.2 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7F8F39AD49;
	Sat,  4 Jul 2026 07:40:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.226.251.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783150824; cv=none; b=MmGil8P+/xsIYQ+EtUpghlXkC7MdwSkC8/wFZ5ivW9z4So1Vw9nhNPklW8lBK1kcC2Ts8h+tfU4Hf/C7sba7NTmn4dJmLq4Io2pokkjicivlWzS+U9pm5/Bo/5+BCvbRR/WhR9MRd7iP36BlTrmIds3mrc63shJzunS+R2qvPKI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783150824; c=relaxed/simple;
	bh=PbQr1tybjOMD6N50SqBT2rHO90wzE17ow8Edd1ClZ1o=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=RYvTmCPhJ2G9xeEuPBO8o2VAAumUMKN/qufHEp4sdNycCS0q22NZHCirfk6E/NmKGCN4yK0Hww8msXwbBVkzHbrSGBMnbX0ytnimFDV6XI2qteG33U6SQoFJpEmxGNNqve+mJ6iz6UdzIAx2/OBfD80QDiymqRJzhZ4iJ4ACWgc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn; spf=pass smtp.mailfrom=iscas.ac.cn; arc=none smtp.client-ip=159.226.251.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iscas.ac.cn
Received: from localhost.localdomain (unknown [111.196.245.140])
	by APP-01 (Coremail) with SMTP id qwCowAAnwMjSuEhqkRyhBA--.11703S2;
	Sat, 04 Jul 2026 15:40:02 +0800 (CST)
From: Pengpeng Hou <pengpeng@iscas.ac.cn>
To: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Charles Keepax <ckeepax@opensource.cirrus.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Pengpeng Hou <pengpeng@iscas.ac.cn>
Subject: [PATCH] ASoC: codecs: max98363: Propagate regcache_sync() errors
Date: Sat,  4 Jul 2026 15:40:00 +0800
Message-ID: <20260704074000.42578-1-pengpeng@iscas.ac.cn>
X-Mailer: git-send-email 2.50.1
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:qwCowAAnwMjSuEhqkRyhBA--.11703S2
X-Coremail-Antispam: 1UD129KBjvdXoW7Jw15Kr18CrWkGFy3trWxXrb_yoWDGFg_Wa
	48uw1YgF45Grn7u3yUtryjy397ua4IyFy7KrnFg3y7C348JF1ayry8Cr1akw4UXr18CF13
	Grn29r1fAa4qkjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUIcSsGvfJTRUUUb4kFF20E14v26r4j6ryUM7CY07I20VC2zVCF04k26cxKx2IYs7xG
	6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8w
	A2z4x0Y4vE2Ix0cI8IcVAFwI0_Gr0_Xr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Cr0_
	Gr1UM28EF7xvwVC2z280aVAFwI0_Cr1j6rxdM28EF7xvwVC2z280aVCY1x0267AKxVW0oV
	Cq3wAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0
	I7IYx2IY67AKxVWUAVWUtwAv7VC2z280aVAFwI0_Gr0_Cr1lOx8S6xCaFVCjc4AY6r1j6r
	4UM4x0Y48IcxkI7VAKI48JM4x0x7Aq67IIx4CEVc8vx2IErcIFxwCY1x0262kKe7AKxVWU
	tVW8ZwCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E14
	v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_Jw0_GFylIxkG
	c2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUCVW8JwCI42IY6xIIjxv20xvEc7CjxVAFwI
	0_Cr0_Gr1UMIIF0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVW8JVWx
	JwCI42IY6I8E87Iv6xkF7I0E14v26F4UJVW0obIYCTnIWIevJa73UjIFyTuYvjfU5dgADU
	UUU
X-CM-SenderInfo: pshqw1xhqjqxpvfd2hldfou0/

max98363_resume() waits for SoundWire initialization, leaves cache-only
mode, and replays cached register state. It currently ignores
regcache_sync() failures and returns success.

Propagate the error and restore cache-only/dirty state on failure.

Signed-off-by: Pengpeng Hou <pengpeng@iscas.ac.cn>
---
 sound/soc/codecs/max98363.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/sound/soc/codecs/max98363.c b/sound/soc/codecs/max98363.c
index 099dc5bf6195..0e32b7a94cb0 100644
--- a/sound/soc/codecs/max98363.c
+++ b/sound/soc/codecs/max98363.c
@@ -100,7 +100,12 @@ static int max98363_resume(struct device *dev)
 		return ret;
 
 	regcache_cache_only(max98363->regmap, false);
-	regcache_sync(max98363->regmap);
+	ret = regcache_sync(max98363->regmap);
+	if (ret) {
+		regcache_cache_only(max98363->regmap, true);
+		regcache_mark_dirty(max98363->regmap);
+		return ret;
+	}
 
 	return 0;
 }
-- 
2.43.0

