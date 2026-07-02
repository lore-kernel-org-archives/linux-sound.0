Received: from cstnet.cn (smtp21.cstnet.cn [159.226.251.21])
	(using TLSv1.2 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 203F03932FC;
	Thu,  2 Jul 2026 07:29:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.226.251.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782977389; cv=none; b=lnWDgyZzvz/Nh1l2b+GDZXXLBLWo1umzVCKyRfcEJXjfrwfvRYsLqUgwePGkXKmaLLjrE2LeJR5r/hVBvsHY+5g/JH1SVWoF9xml0zHacsCdkc2g8eL+qHJbh/h7XDHjFZc7yfEYFSaIopp3TGC7tQHXcJkuWdBLoEKZpclSlfo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782977389; c=relaxed/simple;
	bh=SedCebJserP8JHREVOP5i9PXZvEJEi58OvjvTOteneU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=o6KtI2e8fpnT1+93wjjx6tK8aXyL9hKCHaYKBEEnmrJ+av0sM7+9OArCcCOttqWbdQCQHtJXDQHPmb10Z+tj+yYs24CCvgYwxP8CcRTZp6IeV/RYal3t4t6GhLhpyjId5jgKjRKquk81vzjpvo3FVehD7QcDYWlwV6eUE3OC8nk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn; spf=pass smtp.mailfrom=iscas.ac.cn; arc=none smtp.client-ip=159.226.251.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iscas.ac.cn
Received: from localhost.localdomain (unknown [111.196.245.140])
	by APP-01 (Coremail) with SMTP id qwCowABH6tJUE0ZqcRNhBA--.28447S2;
	Thu, 02 Jul 2026 15:29:24 +0800 (CST)
From: Pengpeng Hou <pengpeng@iscas.ac.cn>
To: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>
Cc: Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Charles Keepax <ckeepax@opensource.cirrus.com>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	Uwe Kleine-Koenig <u.kleine-koenig@baylibre.com>,
	Linus Walleij <linusw@kernel.org>,
	Chen Ni <nichen@iscas.ac.cn>,
	Thorsten Blum <thorsten.blum@linux.dev>,
	Pengpeng Hou <pengpeng@iscas.ac.cn>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] ASoC: codecs: max98390: Propagate regcache_sync() errors
Date: Thu,  2 Jul 2026 15:29:18 +0800
Message-ID: <20260702072918.85779-1-pengpeng@iscas.ac.cn>
X-Mailer: git-send-email 2.50.1
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:qwCowABH6tJUE0ZqcRNhBA--.28447S2
X-Coremail-Antispam: 1UD129KBjvdXoWruFyUtF45XF47Jw15CF45Wrg_yoWkGFg_Wa
	y8u39Ygw45JFn7WrWUGrWjyayvgay2kFyIgr1qga17Gw18AF1DArWUtrnxCF4UWF18C3W7
	Wr1v9r1fC34DCjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUIcSsGvfJTRUUUb3xFF20E14v26r4j6ryUM7CY07I20VC2zVCF04k26cxKx2IYs7xG
	6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8w
	A2z4x0Y4vE2Ix0cI8IcVAFwI0_Xr0_Ar1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Gr0_
	Cr1l84ACjcxK6I8E87Iv67AKxVWxJr0_GcWl84ACjcxK6I8E87Iv6xkF7I0E14v26rxl6s
	0DM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xII
	jxv20xvE14v26r1j6r18McIj6I8E87Iv67AKxVWUJVW8JwAm72CE4IkC6x0Yz7v_Jr0_Gr
	1lF7xvr2IYc2Ij64vIr41lF7I21c0EjII2zVCS5cI20VAGYxC7M4IIrI8v6xkF7I0E8cxa
	n2IY04v7MxkF7I0En4kS14v26r1q6r43MxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4
	AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE
	17CEb7AF67AKxVWUtVW8ZwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMI
	IF0xvE2Ix0cI8IcVCY1x0267AKxVW8JVWxJwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4l
	IxAIcVC2z280aVAFwI0_Jr0_Gr1lIxAIcVC2z280aVCY1x0267AKxVW8JVW8JrUvcSsGvf
	C2KfnxnUUI43ZEXa7VUbGQ6JUUUUU==
X-CM-SenderInfo: pshqw1xhqjqxpvfd2hldfou0/

regcache_sync() can fail while replaying cached register state during
resume. max98390_resume() currently ignores that failure and returns
success.

Propagate the error and restore cache-only/dirty state on failure.

Signed-off-by: Pengpeng Hou <pengpeng@iscas.ac.cn>
---
 sound/soc/codecs/max98390.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/sound/soc/codecs/max98390.c b/sound/soc/codecs/max98390.c
index 2bbedf84ee5d..66309e87fdbd 100644
--- a/sound/soc/codecs/max98390.c
+++ b/sound/soc/codecs/max98390.c
@@ -952,11 +952,17 @@ static int max98390_suspend(struct device *dev)
 static int max98390_resume(struct device *dev)
 {
 	struct max98390_priv *max98390 = dev_get_drvdata(dev);
+	int ret;
 
 	dev_dbg(dev, "%s:Enter\n", __func__);
 
 	regcache_cache_only(max98390->regmap, false);
-	regcache_sync(max98390->regmap);
+	ret = regcache_sync(max98390->regmap);
+	if (ret) {
+		regcache_cache_only(max98390->regmap, true);
+		regcache_mark_dirty(max98390->regmap);
+		return ret;
+	}
 
 	return 0;
 }
-- 
2.43.0

