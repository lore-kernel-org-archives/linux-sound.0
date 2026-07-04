Received: from cstnet.cn (smtp25.cstnet.cn [159.226.251.25])
	(using TLSv1.2 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBF9A3812EA;
	Sat,  4 Jul 2026 04:07:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.226.251.25
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783138036; cv=none; b=rQYYvb3lq3djdekpFyMrDg6bqRXM0eVRbXe3Nd8qL1detJj58JOxvVP4lfEsSQj4VLWgyG6LpoQc2Tl2EikEBU0v6H5XR78YVufsGsu2rRNC+tOy8/tcbfqRCIoAHb5WKr3lYm1JNJbm9jT0fLOVo67Oa3zvMGfGt7hWxg2ET08=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783138036; c=relaxed/simple;
	bh=GkFWXLcBgoRNdy7uNBFTc17slNHY3FWQvxwu7VumNU0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ITVlJXXtF0RIsohJPp/7mHpShPoGZrM4tXo4iYoMAhMfqV1LJuEvO+4qImTFLzRnuPlDl4bawST1zNTVX++0xynHvZKhwQeYBVXiYX9nTJwDrzC+FuOx0UYTUzWBvyKkd56GmmJSGvcy2T5qdk//jBBvrdIr2pqmSVpEheL/Isc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn; spf=pass smtp.mailfrom=iscas.ac.cn; arc=none smtp.client-ip=159.226.251.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iscas.ac.cn
Received: from localhost.localdomain (unknown [111.196.245.140])
	by APP-05 (Coremail) with SMTP id zQCowABX0vXchkhqwWrJFg--.13332S2;
	Sat, 04 Jul 2026 12:06:53 +0800 (CST)
From: Pengpeng Hou <pengpeng@iscas.ac.cn>
To: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>
Cc: Srinivas Kandagatla <srini@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	linux-sound@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Oder Chiou <oder_chiou@realtek.com>,
	Shenghao Ding <shenghao-ding@ti.com>,
	Kevin Lu <kevin-lu@ti.com>,
	Baojun Xu <baojun.xu@ti.com>,
	David Rhodes <david.rhodes@cirrus.com>,
	Richard Fitzgerald <rf@opensource.cirrus.com>,
	patches@opensource.cirrus.com,
	Bartosz Golaszewski <brgl@kernel.org>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	Charles Keepax <ckeepax@opensource.cirrus.com>,
	Sebastian Krzyszkowiak <sebastian.krzyszkowiak@puri.sm>,
	Shengjiu Wang <shengjiu.wang@nxp.com>,
	Sharique Mohammad <sharq0406@gmail.com>,
	Pengpeng Hou <pengpeng@iscas.ac.cn>
Subject: [PATCH 18/19] ASoC: codecs: max98396: Unwind supplies on resume failure
Date: Sat,  4 Jul 2026 12:06:51 +0800
Message-ID: <20260704040651.47558-1-pengpeng@iscas.ac.cn>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260704034845.14291-1-pengpeng@iscas.ac.cn>
References: <20260704034845.14291-1-pengpeng@iscas.ac.cn>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:zQCowABX0vXchkhqwWrJFg--.13332S2
X-Coremail-Antispam: 1UD129KBjvJXoW7Wry3Xw4rKr4xJr4kGr4UArb_yoW8Cw48pr
	sxJrWF9rW8XrWSkrZ3Aa15J3Z5u3yft3ZxAw4UC348Zrs8GFy7tr18Jr1jvFn3Jr1xGr43
	ArZFkFWUuF1DtaUanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUU9q14x267AKxVW5JVWrJwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
	1l84ACjcxK6xIIjxv20xvE14v26ryj6F1UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4U
	JVWxJr1l84ACjcxK6I8E87Iv67AKxVW8Jr0_Cr1UM28EF7xvwVC2z280aVCY1x0267AKxV
	WxJr0_GcWle2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IEw4CE5I8CrVC2j2Wl
	Yx0E2Ix0cI8IcVAFwI0_Jw0_WrylYx0Ex4A2jsIE14v26r4j6F4UMcvjeVCFs4IE7xkEbV
	WUJVW8JwACjcxG0xvY0x0EwIxGrwACjI8F5VA0II8E6IAqYI8I648v4I1lFIxGxcIEc7Cj
	xVA2Y2ka0xkIwI1lc7CjxVAaw2AFwI0_GFv_Wryl42xK82IYc2Ij64vIr41l4I8I3I0E4I
	kC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWU
	WwC2zVAF1VAY17CE14v26r4a6rW5MIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Gr
	0_Xr1lIxAIcVC0I7IYx2IY6xkF7I0E14v26r4UJVWxJr1lIxAIcVCF04k26cxKx2IYs7xG
	6r1j6r1xMIIF0xvEx4A2jsIE14v26r4j6F4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Gr1j6F
	4UJbIYCTnIWIevJa73UjIFyTuYvjTRABMKDUUUU
X-CM-SenderInfo: pshqw1xhqjqxpvfd2hldfou0/

max98396_resume() enables the core, pvdd, and vbat supplies before
leaving cache-only mode, resetting the device, and replaying cached
register state. The function currently ignores regcache_sync() failures,
and the optional pvdd/vbat enable failures return without unwinding
supplies that were already enabled in this resume attempt.

Rework the function to use common error labels. This propagates sync
failures, restores cache-only/dirty state on failed cache replay, and
disables each supply acquired by this resume path before returning the
error.

Signed-off-by: Pengpeng Hou <pengpeng@iscas.ac.cn>
---
 sound/soc/codecs/max98396.c | 24 +++++++++++++++++++++---
 1 file changed, 21 insertions(+), 3 deletions(-)

diff --git a/sound/soc/codecs/max98396.c b/sound/soc/codecs/max98396.c
index 9c1d7213410c..e5a2fe824c03 100644
--- a/sound/soc/codecs/max98396.c
+++ b/sound/soc/codecs/max98396.c
@@ -1600,19 +1600,37 @@ static int max98396_resume(struct device *dev)
 	if (max98396->pvdd) {
 		ret = regulator_enable(max98396->pvdd);
 		if (ret < 0)
-			return ret;
+			goto err_core_supplies;
 	}
 
 	if (max98396->vbat) {
 		ret = regulator_enable(max98396->vbat);
 		if (ret < 0)
-			return ret;
+			goto err_pvdd;
 	}
 
 	regcache_cache_only(max98396->regmap, false);
 	max98396_reset(max98396, dev);
-	regcache_sync(max98396->regmap);
+	ret = regcache_sync(max98396->regmap);
+	if (ret < 0) {
+		regcache_cache_only(max98396->regmap, true);
+		regcache_mark_dirty(max98396->regmap);
+		goto err_vbat;
+	}
+
 	return 0;
+
+err_vbat:
+	if (max98396->vbat)
+		regulator_disable(max98396->vbat);
+err_pvdd:
+	if (max98396->pvdd)
+		regulator_disable(max98396->pvdd);
+err_core_supplies:
+	regulator_bulk_disable(MAX98396_NUM_CORE_SUPPLIES,
+			       max98396->core_supplies);
+
+	return ret;
 }
 
 static const struct dev_pm_ops max98396_pm = {
-- 
2.43.0

