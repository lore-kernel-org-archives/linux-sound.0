Received: from cstnet.cn (smtp21.cstnet.cn [159.226.251.21])
	(using TLSv1.2 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84D5C2727E2;
	Sat,  4 Jul 2026 07:42:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.226.251.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783150980; cv=none; b=bp7rAUwwmMcHw1kdYNWghI4vQpCucPhFHB5/n9qv2rZbKzDyyQppgFOD6jVqPRsNwRiDqGwhVLW01yghCfpgWaOXs4cJs4ZBoK0j4kUpbCXyYdlpBURKBBomhZnzZCTRequ0jGStSuZv0FeTN8ZcTZbSbaE8KD3z2fKFgRv7yjE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783150980; c=relaxed/simple;
	bh=fdCJPLrqBqEq565zsdYesG8uXhLLtY+f+OM2pc/8ccM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=a0NsDlWvpFFdPKQUfQYYG87jzy2hqkWR+mBdRw5Nh4NCoa3PehoroMfrpNLtJwc/CNfnMeYkv4+Gqe+CfudMGNmkzm1Vq/Cgg9eZViAAUCQKaXgyIs/+OuI5URviIHsqjMe44r6FWcadgZYliU/xsOlEjcW8CgAuHIHx8sCUunw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn; spf=pass smtp.mailfrom=iscas.ac.cn; arc=none smtp.client-ip=159.226.251.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iscas.ac.cn
Received: from localhost.localdomain (unknown [111.196.245.140])
	by APP-01 (Coremail) with SMTP id qwCowAAnzdVvuUhq2yuhBA--.11814S2;
	Sat, 04 Jul 2026 15:42:40 +0800 (CST)
From: Pengpeng Hou <pengpeng@iscas.ac.cn>
To: Oder Chiou <oder_chiou@realtek.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Pengpeng Hou <pengpeng@iscas.ac.cn>
Subject: [PATCH] ASoC: codecs: rt1316-sdw: Propagate regcache_sync() errors
Date: Sat,  4 Jul 2026 15:42:38 +0800
Message-ID: <20260704074238.50145-1-pengpeng@iscas.ac.cn>
X-Mailer: git-send-email 2.50.1
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:qwCowAAnzdVvuUhq2yuhBA--.11814S2
X-Coremail-Antispam: 1UD129KBjvdXoW7Jw15Kr18CrWkGFyfGF45ZFb_yoWDGrc_Wa
	4xu3yFgF45Jr42kry5tr4jy397Zan2kFyxtr9rKan7ta45JrnIyryUZr4fur43Wr18u3W3
	CrnF9ryfJryj9jkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUIcSsGvfJTRUUUbx8FF20E14v26r4j6ryUM7CY07I20VC2zVCF04k26cxKx2IYs7xG
	6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8w
	A2z4x0Y4vE2Ix0cI8IcVAFwI0_Gr0_Xr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Cr0_
	Gr1UM28EF7xvwVC2z280aVAFwI0_Cr1j6rxdM28EF7xvwVC2z280aVCY1x0267AKxVW0oV
	Cq3wAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0
	I7IYx2IY67AKxVWUtVWrXwAv7VC2z280aVAFwI0_Cr0_Gr1UMcvjeVCFs4IE7xkEbVWUJV
	W8JwACjcxG0xvY0x0EwIxGrwACjI8F5VA0II8E6IAqYI8I648v4I1lc7CjxVAaw2AFwI0_
	JF0_Jw1l42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67
	AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r1q6r43MIIY
	rxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_JFI_Gr1lIxAIcVC0I7IYx2IY6xkF7I0E14
	v26F4j6r4UJwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Cr0_
	Gr1UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Cr1j6rxdYxBIdaVFxhVjvjDU0xZFpf9x0JUJuc
	_UUUUU=
X-CM-SenderInfo: pshqw1xhqjqxpvfd2hldfou0/

rt1316_dev_resume() waits for SoundWire initialization, leaves cache-
only mode, and replays cached register state. It currently ignores
regcache_sync() failures and returns success.

Propagate the error and restore cache-only/dirty state on failure.

Signed-off-by: Pengpeng Hou <pengpeng@iscas.ac.cn>
---
 sound/soc/codecs/rt1316-sdw.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/sound/soc/codecs/rt1316-sdw.c b/sound/soc/codecs/rt1316-sdw.c
index ca318dbd946e..359b52ba1ef9 100644
--- a/sound/soc/codecs/rt1316-sdw.c
+++ b/sound/soc/codecs/rt1316-sdw.c
@@ -756,7 +756,12 @@ static int rt1316_dev_resume(struct device *dev)
 	}
 
 	regcache_cache_only(rt1316->regmap, false);
-	regcache_sync(rt1316->regmap);
+	ret = regcache_sync(rt1316->regmap);
+	if (ret) {
+		regcache_cache_only(rt1316->regmap, true);
+		regcache_mark_dirty(rt1316->regmap);
+		return ret;
+	}
 
 	return 0;
 }
-- 
2.43.0

