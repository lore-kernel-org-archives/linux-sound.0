Received: from cstnet.cn (smtp25.cstnet.cn [159.226.251.25])
	(using TLSv1.2 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47FE82E0B5C;
	Wed, 19 Aug 2026 12:10:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.226.251.25
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787141465; cv=none; b=ZEFu9Fsvrmm8oEa9PpDk1UPqR6yW0r1eT7xIB3wigaV9H55qhwl4mW3+b8698I0QGdgwlh1dtoNCueUkPgEPjddKUim9N6sh5/9/EQmdSZtZ7I3lqOVmCSUBUoo/IBXUko4Ps59N1j8o/eHBJfKhnfwFt1YRDQ47U867zk1JiCE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787141465; c=relaxed/simple;
	bh=6Ge+90LQGHHsL3Ue4NPpmC3hfSAt7rpE9myfA4wT5PY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Y3DMbU+vwvQVxcWuBkWJsoWLMDhJKfDbEc8vsNFG2n7/85pUk3QCsBZyWQAwwZO45PeDVlQ3bId7aX3Gm4aRYHfMmPBqqZQx50fxYn5sgS/1C4Uw3OG+1/YfcRjcV5OZevgzDK3hXyjvTH/UfnrtaLKT/VmLfZQiLsVUtZJ4UBY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn; spf=pass smtp.mailfrom=iscas.ac.cn; arc=none smtp.client-ip=159.226.251.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iscas.ac.cn
Received: from DESKTOP-L0HPE2S.localdomain (unknown [36.110.52.2])
	by APP-05 (Coremail) with SMTP id zQCowADnVD9DnYVq3mglBg--.9551S2;
	Wed, 19 Aug 2026 20:10:44 +0800 (CST)
From: Haotian Zhang <vulab@iscas.ac.cn>
To: perex@perex.cz,
	tiwai@suse.com
Cc: linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Haotian Zhang <vulab@iscas.ac.cn>
Subject: [PATCH] ALSA: ice1712: Fix missing snd_card_free() at probe error
Date: Wed, 19 Aug 2026 16:49:59 +0800
Message-ID: <20260819084959.10649-1-vulab@iscas.ac.cn>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:zQCowADnVD9DnYVq3mglBg--.9551S2
X-Coremail-Antispam: 1UD129KBjvJXoWxurykWF18XFyDtw4fKFy3Jwb_yoW5WrW5pr
	sIqr1qkr48XrWYyFn8Xw15G3ZxCw48tFy7Grs5Gw10yr4fArWDJry3K3yFkFWrKFW8Gw42
	vFWYqFyUKayftw7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUvE14x267AKxVWUJVW8JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2jI8I6cxK6x804I0_JrC_JFyl8cAvFVAK0II2c7
	xJM28CjxkF64kEwVA0rcxSw2x7M28EF7xvwVC0I7IYx2IY67AKxVW8JVW5JwA2z4x0Y4vE
	2Ix0cI8IcVCY1x0267AKxVW8JVWxJwA2z4x0Y4vEx4A2jsIE14v26rxl6s0DM28EF7xvwV
	C2z280aVCY1x0267AKxVW0oVCq3wAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC
	0VAKzVAqx4xG6I80ewAv7VC0I7IYx2IY67AKxVWUJVWUGwAv7VC2z280aVAFwI0_Gr1j6F
	4UJwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IYc2Ij64vIr41lF7I21c0EjII2zVCS5cI2
	0VAGYxC7MxkF7I0En4kS14v26r126r1DMxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4
	AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE
	17CEb7AF67AKxVWUAVWUtwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMI
	IF0xvE2Ix0cI8IcVCY1x0267AKxVWUJVW8JwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4l
	IxAIcVC2z280aVAFwI0_Jr0_Gr1lIxAIcVC2z280aVCY1x0267AKxVWUJVW8JbIYCTnIWI
	evJa73UjIFyTuYvjfU5OzVUUUUU
X-CM-SenderInfo: pyxotu46lvutnvoduhdfq/1tbiDAMEA2qFd6dvBwAAsf

snd_ice1712_probe() performs multiple initialization steps after
snd_card_new(), but directly returns on failures from later steps
without releasing the ALSA card, causing resource leaks when
probing fails.

Route all initialization failures after snd_card_new() to a
common error path and call snd_card_free() before returning
the original error code.

Fixes: ca642da4b33d ("ALSA: ice1712: Allocate resources with device-managed APIs")
Signed-off-by: Haotian Zhang <vulab@iscas.ac.cn>
---
 sound/pci/ice1712/ice1712.c | 25 ++++++++++++++-----------
 1 file changed, 14 insertions(+), 11 deletions(-)

diff --git a/sound/pci/ice1712/ice1712.c b/sound/pci/ice1712/ice1712.c
index 1e39b985bef2..745af0c7020e 100644
--- a/sound/pci/ice1712/ice1712.c
+++ b/sound/pci/ice1712/ice1712.c
@@ -2539,7 +2539,7 @@ static int snd_ice1712_probe(struct pci_dev *pci,
 	err = snd_ice1712_create(card, pci, model[dev], omni[dev],
 				 cs8427_timeout[dev], dxr_enable[dev]);
 	if (err < 0)
-		return err;
+		goto error;
 
 	for (tbl = card_tables; *tbl; tbl++) {
 		for (c = *tbl; c->subvendor; c++) {
@@ -2550,7 +2550,7 @@ static int snd_ice1712_probe(struct pci_dev *pci,
 				if (c->chip_init) {
 					err = c->chip_init(ice);
 					if (err < 0)
-						return err;
+						goto error;
 				}
 				ice->card_info = c;
 				goto __found;
@@ -2562,32 +2562,32 @@ static int snd_ice1712_probe(struct pci_dev *pci,
 
 	err = snd_ice1712_pcm_profi(ice, pcm_dev++);
 	if (err < 0)
-		return err;
+		goto error;
 
 	if (ice_has_con_ac97(ice)) {
 		err = snd_ice1712_pcm(ice, pcm_dev++);
 		if (err < 0)
-			return err;
+			goto error;
 	}
 
 	err = snd_ice1712_ac97_mixer(ice);
 	if (err < 0)
-		return err;
+		goto error;
 
 	err = snd_ice1712_build_controls(ice);
 	if (err < 0)
-		return err;
+		goto error;
 
 	if (c->build_controls) {
 		err = c->build_controls(ice);
 		if (err < 0)
-			return err;
+			goto error;
 	}
 
 	if (ice_has_con_ac97(ice)) {
 		err = snd_ice1712_pcm_ds(ice, pcm_dev++);
 		if (err < 0)
-			return err;
+			goto error;
 	}
 
 	if (!c->no_mpu401) {
@@ -2597,7 +2597,7 @@ static int snd_ice1712_probe(struct pci_dev *pci,
 			MPU401_INFO_INTEGRATED | MPU401_INFO_IRQ_HOOK,
 			-1, &ice->rmidi[0]);
 		if (err < 0)
-			return err;
+			goto error;
 		if (c->mpu401_1_name)
 			/*  Preferred name available in card_info */
 			snprintf(ice->rmidi[0]->name,
@@ -2613,7 +2613,7 @@ static int snd_ice1712_probe(struct pci_dev *pci,
 				-1, &ice->rmidi[1]);
 
 			if (err < 0)
-				return err;
+				goto error;
 			if (c->mpu401_2_name)
 				/*  Preferred name available in card_info */
 				snprintf(ice->rmidi[1]->name,
@@ -2630,10 +2630,13 @@ static int snd_ice1712_probe(struct pci_dev *pci,
 
 	err = snd_card_register(card);
 	if (err < 0)
-		return err;
+		goto error;
 	pci_set_drvdata(pci, card);
 	dev++;
 	return 0;
+error:
+	snd_card_free(card);
+	return err;
 }
 
 #ifdef CONFIG_PM_SLEEP
-- 
2.43.0

