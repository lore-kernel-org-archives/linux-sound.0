Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.3])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A04F149C7B;
	Tue,  3 Mar 2026 05:43:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.31.3
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772516599; cv=none; b=O1iH6U0vndLNNDrTU6L4ZAleueinmTaBLQBg/FAVt12zlClT/xgaVT49uF4szNYeoM8/zukZB/YyHfuJ5ucAaZASohbQemN2GNLg9Ge2jtJhuTzGT8mSE1odFxw0Ow4Hfh9mBI0EDIejnlfwbY52KwKx7rSFvFeD7oq7oKn8Z1k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772516599; c=relaxed/simple;
	bh=hddjEOrA8LM7Fp2TsJU4IG+DY8E5QGfylBh+TXR6uU0=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=LYhR0R2hsRi1/orZiBz3PQ5RNLxPZ9ITtH+zy4bVQL78b/fX53jXf2LRfgKe+bxOk2UDxVco5T7qdvWBFOGX+YxGuYlUK7Md3TOBf5bBWn/DoRjHQdeOVbYK5DFWdAdu3BTzDEc8irh6woArCQFOISd6NH50WyDEvZ8QXBSlGnM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=glwyLNeF; arc=none smtp.client-ip=220.197.31.3
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="glwyLNeF"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version; bh=rW
	aBBMNj8cNyZWVwW4ZEHWxGjv8yC9zAIQ/cINUycfk=; b=glwyLNeFN20czT7SCS
	bWiYg8aTZNOvKKUsn8PY3jFz1A8OWeJA+dhhsjU+Us/umasYtKC9vbulpWes6YFa
	i6yuJYGjHtkZRdSYIQuVQFwWfeeyZIuQ5I0PNVy41Ir34zli6SU7U35JxAW9G0q7
	n4rwJkPAMxqzLw5HxHWvhZJmk=
Received: from localhost.localdomain (unknown [])
	by gzga-smtp-mtada-g1-4 (Coremail) with SMTP id _____wAXhOXVdKZp0Ev8OQ--.5264S2;
	Tue, 03 Mar 2026 13:42:47 +0800 (CST)
From: wangdich9700@163.com
To: bo.liu@senarytech.com,
	perex@perex.cz,
	tiwai@suse.com
Cc: linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	wangdicheng <wangdicheng@kylinos.cn>
Subject: [PATCH] ALSA: hda/senary: Use codec->core.afg for GPIO access
Date: Tue,  3 Mar 2026 13:42:42 +0800
Message-Id: <20260303054242.318062-1-wangdich9700@163.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:_____wAXhOXVdKZp0Ev8OQ--.5264S2
X-Coremail-Antispam: 1Uf129KBjvJXoW7KFyfKr4UCr4rtrWUXF1rtFb_yoW8XF17pF
	nYya4rKrZ3Jr10yr18J3yrua45Gas8WF43K3y2gw15JF1vkrykJ3W8Xr9Iq3W8Ar9Fg3Wa
	vrWIv34UGryqyaUanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07UGg4DUUUUU=
X-CM-SenderInfo: pzdqwv5lfkmliqq6il2tof0z/xtbCwBdWpWmmdNf6jgAA38

From: wangdicheng <wangdicheng@kylinos.cn>

Replace the hardcoded GPIO node ID (0x01) with codec->core.afg.
This follows the standard HDA driver practice and makes the driver
more robust against different hardware configurations.

Signed-off-by: wangdicheng <wangdicheng@kylinos.cn>
---
 sound/hda/codecs/senarytech.c | 9 +++------
 1 file changed, 3 insertions(+), 6 deletions(-)

diff --git a/sound/hda/codecs/senarytech.c b/sound/hda/codecs/senarytech.c
index 3a50d4b3a064..8822d4dc5e36 100644
--- a/sound/hda/codecs/senarytech.c
+++ b/sound/hda/codecs/senarytech.c
@@ -19,9 +19,6 @@
 #include "hda_jack.h"
 #include "generic.h"
 
-/* GPIO node ID */
-#define SENARY_GPIO_NODE	0x01
-
 struct senary_spec {
 	struct hda_gen_spec gen;
 
@@ -123,11 +120,11 @@ static void senary_init_gpio_led(struct hda_codec *codec)
 	unsigned int mask = spec->gpio_mute_led_mask | spec->gpio_mic_led_mask;
 
 	if (mask) {
-		snd_hda_codec_write(codec, SENARY_GPIO_NODE, 0, AC_VERB_SET_GPIO_MASK,
+		snd_hda_codec_write(codec, codec->core.afg, 0, AC_VERB_SET_GPIO_MASK,
 				    mask);
-		snd_hda_codec_write(codec, SENARY_GPIO_NODE, 0, AC_VERB_SET_GPIO_DIRECTION,
+		snd_hda_codec_write(codec, codec->core.afg, 0, AC_VERB_SET_GPIO_DIRECTION,
 				    mask);
-		snd_hda_codec_write(codec, SENARY_GPIO_NODE, 0, AC_VERB_SET_GPIO_DATA,
+		snd_hda_codec_write(codec, codec->core.afg, 0, AC_VERB_SET_GPIO_DATA,
 				    spec->gpio_led);
 	}
 }
-- 
2.25.1

