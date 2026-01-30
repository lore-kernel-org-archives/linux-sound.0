Received: from cstnet.cn (smtp21.cstnet.cn [159.226.251.21])
	(using TLSv1.2 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 743BA34DCD6;
	Fri, 30 Jan 2026 09:20:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.226.251.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769764827; cv=none; b=lePlal7P4pOBqkyED2Lxlz3QIDAeqYMfWqEi0TpmkJX1qo0/9wCuPGRMf/Sx5wnJVLf8RkM7RiQvkRAyhTgbyPKEIXmzWcU13rQ1TNXIeE+Kx8XwcsucqOMast1BKvh5BPOGOerl+a3kLh1iEV7RcX+C3NA0Oc3MMD0emqmCU6Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769764827; c=relaxed/simple;
	bh=ljBjmXp6VOTgUtfAwQ9HVbD41ugLlXth3FnCNDxWPVg=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=ApZyXouvXF8d0G0RPvStKPZ59Ud2EC8M6I2XFeEFbr/8A7sxiMQco6krIFYnsgsyqRGL+5CPLsrbnSDM/P+dtAibQPb3uNPfgBcpviGMduY0w6xiyhqROEP1lXiBUqhX0glS7YGyWqRrjc44UhCvjTpBAXhYEbIMO/i9kyaJgnE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn; spf=pass smtp.mailfrom=iscas.ac.cn; arc=none smtp.client-ip=159.226.251.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iscas.ac.cn
Received: from localhost (unknown [124.16.138.129])
	by APP-01 (Coremail) with SMTP id qwCowADXfGjEd3xprBu7Bg--.60530S2;
	Fri, 30 Jan 2026 17:20:04 +0800 (CST)
From: Chen Ni <nichen@iscas.ac.cn>
To: lgirdwood@gmail.com,
	broonie@kernel.org,
	perex@perex.cz,
	tiwai@suse.com,
	ckeepax@opensource.cirrus.com,
	kuninori.morimoto.gx@renesas.com,
	srinivas.kandagatla@oss.qualcomm.com,
	krzk@kernel.org
Cc: linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Chen Ni <nichen@iscas.ac.cn>
Subject: [PATCH] ASoC: codecs: max98390: Check return value of devm_gpiod_get_optional() in max98390_i2c_probe()
Date: Fri, 30 Jan 2026 17:19:04 +0800
Message-Id: <20260130091904.3426149-1-nichen@iscas.ac.cn>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:qwCowADXfGjEd3xprBu7Bg--.60530S2
X-Coremail-Antispam: 1UD129KBjvdXoWruw4DXrW3Xr4UJF15tFy5Jwb_yoWDtFX_Cw
	18ur90vw4UGrn2vrWYk3yIyayv9rnrCryxGw4qgr17K34UCFs8AFyktr9xZF1kXF4S9F98
	ZF13Cr13uw12kjkaLaAFLSUrUUUUbb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUIcSsGvfJTRUUUbTAFF20E14v26r4j6ryUM7CY07I20VC2zVCF04k26cxKx2IYs7xG
	6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8w
	A2z4x0Y4vE2Ix0cI8IcVAFwI0_Xr0_Ar1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Gr1j
	6F4UJwA2z4x0Y4vEx4A2jsIE14v26rxl6s0DM28EF7xvwVC2z280aVCY1x0267AKxVW0oV
	Cq3wAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0
	I7IYx2IY67AKxVWUGVWUXwAv7VC2z280aVAFwI0_Gr0_Cr1lOx8S6xCaFVCjc4AY6r1j6r
	4UM4x0Y48IcxkI7VAKI48JM4x0x7Aq67IIx4CEVc8vx2IErcIFxwACI402YVCY1x02628v
	n2kIc2xKxwCY1x0262kKe7AKxVWUtVW8ZwCY02Avz4vE14v_GFWl42xK82IYc2Ij64vIr4
	1l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8GjcxK
	67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r1q6r43MIIYrxkI7VAKI48JMIIF0xvE2Ix0cI
	8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E14v26r4j6F4UMIIF0xvE42xK8VAv
	wI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVW8JVWxJwCI42IY6I8E87Iv6xkF7I0E14
	v26r4j6r4UJbIYCTnIWIevJa73UjIFyTuYvjfUe2-eDUUUU
X-CM-SenderInfo: xqlfxv3q6l2u1dvotugofq/

The devm_gpiod_get_optional() function may return an error pointer
(ERR_PTR) in case of a genuine failure during GPIO acquisition,
not just NULL which indicates the legitimate absence of an optional
GPIO.

Add an IS_ERR() check after the function call to catch such errors and
propagate them to the probe function, ensuring the driver fails to load
safely rather than proceeding with an invalid pointer.

Signed-off-by: Chen Ni <nichen@iscas.ac.cn>
---
 sound/soc/codecs/max98390.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/sound/soc/codecs/max98390.c b/sound/soc/codecs/max98390.c
index 3dd4dd94bc37..ff58805e97d1 100644
--- a/sound/soc/codecs/max98390.c
+++ b/sound/soc/codecs/max98390.c
@@ -1067,6 +1067,9 @@ static int max98390_i2c_probe(struct i2c_client *i2c)
 
 	reset_gpio = devm_gpiod_get_optional(&i2c->dev,
 					     "reset", GPIOD_OUT_HIGH);
+	if (IS_ERR(reset_gpio))
+		return dev_err_probe(&i2c->dev, PTR_ERR(reset_gpio),
+				     "Failed to get reset gpio\n");
 
 	/* Power on device */
 	if (reset_gpio) {
-- 
2.25.1

