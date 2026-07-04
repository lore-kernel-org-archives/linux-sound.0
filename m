Received: from cstnet.cn (smtp21.cstnet.cn [159.226.251.21])
	(using TLSv1.2 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7C5338331B;
	Sat,  4 Jul 2026 07:44:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.226.251.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783151052; cv=none; b=CfGh9BHX7sY2g9Z4r4HeQZbEYs4uC3ZnuUU2+Y/RzKxJs5d4BnqRtEn170CiM+xgp21gzzW3MKqh7gBE/qAUdIfhTeSQAYcquM+uPCzky+ThOgv5j02i2IyRoqDFpMQPXpin0J+kL4jtO1Jiedlbfdx2/UguSfwAZBuFHA9D4Yk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783151052; c=relaxed/simple;
	bh=jCAAnlwuGq1aHIsAINbDPrDN0PiS+KqkBL9y9OGUcGg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=b2H4U+nuxisdAKelGFg1RPrRpV4b3nkKiD6gSUW7r3VzDfQPGTuVE4tAUOTDAuTCWdTkuE82wJL/itrRPNWcLpenNEWkzkx5lQEA0EJJVCcIn+Wc+my9lZjLxXoYl7wvrH14GcN7WK9mYd7VqkXr58lOANBuejzWBzwS+OQSMOQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn; spf=pass smtp.mailfrom=iscas.ac.cn; arc=none smtp.client-ip=159.226.251.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iscas.ac.cn
Received: from localhost.localdomain (unknown [111.196.245.140])
	by APP-01 (Coremail) with SMTP id qwCowAB3FM23uUhqmjGhBA--.11887S2;
	Sat, 04 Jul 2026 15:43:52 +0800 (CST)
From: Pengpeng Hou <pengpeng@iscas.ac.cn>
To: Oder Chiou <oder_chiou@realtek.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Pengpeng Hou <pengpeng@iscas.ac.cn>
Subject: [PATCH] ASoC: codecs: rt722-sdca-sdw: Propagate regcache_sync() errors
Date: Sat,  4 Jul 2026 15:43:50 +0800
Message-ID: <20260704074350.53023-1-pengpeng@iscas.ac.cn>
X-Mailer: git-send-email 2.50.1
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:qwCowAB3FM23uUhqmjGhBA--.11887S2
X-Coremail-Antispam: 1UD129KBjvdXoW7Jw15Kr18CrWkGw4kGw1xKrg_yoWDWFg_Xa
	4xu348Wa1rJr47Gry5JryqyFZ2qFZruF9rtFnrKFsrt3y5Cr12qrW8AF13Cr15Wrn7C3Wx
	GFnF9ryxGFyYkjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
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

rt722_sdca_dev_resume() waits for SoundWire initialization, leaves
cache-only mode, and replays cached register state. It currently ignores
regcache_sync() failures and returns success.

Propagate the error and restore cache-only/dirty state on failure.

Signed-off-by: Pengpeng Hou <pengpeng@iscas.ac.cn>
---
 sound/soc/codecs/rt722-sdca-sdw.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/sound/soc/codecs/rt722-sdca-sdw.c b/sound/soc/codecs/rt722-sdca-sdw.c
index e68aa0350a5b..d2db33b4f684 100644
--- a/sound/soc/codecs/rt722-sdca-sdw.c
+++ b/sound/soc/codecs/rt722-sdca-sdw.c
@@ -557,7 +557,13 @@ static int rt722_sdca_dev_resume(struct device *dev)
 	}
 
 	regcache_cache_only(rt722->regmap, false);
-	regcache_sync(rt722->regmap);
+	ret = regcache_sync(rt722->regmap);
+	if (ret) {
+		regcache_cache_only(rt722->regmap, true);
+		regcache_mark_dirty(rt722->regmap);
+		return ret;
+	}
+
 	return 0;
 }
 
-- 
2.43.0

