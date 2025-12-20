Received: from cstnet.cn (smtp84.cstnet.cn [159.226.251.84])
	(using TLSv1.2 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 326BA2EF65C;
	Sat, 20 Dec 2025 17:05:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.226.251.84
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766250345; cv=none; b=iJfrLNHIriqk/ngOJxaianu9clVsxfgTesuEh1nuKTdtXeI/EMgDBxyfWvuaUPpln3M6W3BsPH3j0mS2yeO+dZU0UIuUQExMuQVZRSliar/r6W0oLipHAhjZUUq0isWJb31gAudAvCzgyLoQm5MfJyZ59o1OQ+SfvdE/pdZAJ/w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766250345; c=relaxed/simple;
	bh=M2zY+ORks0cZb9fQOPCAtCkb/gOnoNoTpekU/t+OfFI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=E9VGaAVN5K1Atwe8K3JJrMltT26E2PsTZRccOxX/PukqSMHz7XufMAeMcXdAB9S7W6qLRiJk0bRbyFieVZjWOt8E9m1gXgnNiKO5S1fHgfaFr6x67hGMGyPzN2R4JWdv2CEJiN94Yc0zUckrRGNssAko+OWVf3HdBydugzBhNLY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn; spf=pass smtp.mailfrom=iscas.ac.cn; arc=none smtp.client-ip=159.226.251.84
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iscas.ac.cn
Received: from localhost.localdomain (unknown [223.166.92.103])
	by APP-05 (Coremail) with SMTP id zQCowADneQ1E10ZpEbtTAQ--.25750S2;
	Sun, 21 Dec 2025 01:05:19 +0800 (CST)
From: Han Gao <gaohan@iscas.ac.cn>
To: Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Kai Vehmanen <kai.vehmanen@linux.intel.com>,
	Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
	Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	Maxim Mikityanskiy <maxtram95@gmail.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
	Stuart Hayhurst <stuart.a.hayhurst@gmail.com>,
	linux-sound@vger.kernel.org
Cc: Han Gao <rabenda.cn@gmail.com>,
	linux-riscv@lists.infradead.org,
	sophgo@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Han Gao <gaohan@iscas.ac.cn>
Subject: [PATCH] ALSA: hda: intel: Introduce msi64 parameter to override 64-bit MSI restriction
Date: Sun, 21 Dec 2025 01:05:01 +0800
Message-ID: <20251220170501.3972438-1-gaohan@iscas.ac.cn>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:zQCowADneQ1E10ZpEbtTAQ--.25750S2
X-Coremail-Antispam: 1UD129KBjvJXoW7uw4rAw18uw4DAF1UXr1kKrg_yoW8WFW3pa
	1UCFW7tFsIqFZxGa1UKF48WFnaga93C343Ga95K34fX3Za9340q3W7KryfJFyxGFW8GryY
	9F1UZFy8Ww43Aa7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUU9014x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
	1l84ACjcxK6xIIjxv20xvE14v26r4j6ryUM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4j
	6F4UM28EF7xvwVC2z280aVAFwI0_Gr0_Cr1l84ACjcxK6I8E87Iv6xkF7I0E14v26r4j6r
	4UJwAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0
	I7IYx2IY67AKxVWUJVWUGwAv7VC2z280aVAFwI0_Jr0_Gr1lOx8S6xCaFVCjc4AY6r1j6r
	4UM4x0Y48IcxkI7VAKI48JM4x0x7Aq67IIx4CEVc8vx2IErcIFxwACI402YVCY1x02628v
	n2kIc2xKxwCY1x0262kKe7AKxVWUtVW8ZwCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7x
	kEbVWUJVW8JwC20s026c02F40E14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E
	67AF67kF1VAFwI0_Jw0_GFylIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCw
	CI42IY6xIIjxv20xvEc7CjxVAFwI0_Gr0_Cr1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r1x
	MIIF0xvEx4A2jsIE14v26r1j6r4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Gr0_Gr1UYxBIda
	VFxhVjvjDU0xZFpf9x0JUd-B_UUUUU=
X-CM-SenderInfo: xjdrxt3q6l2u1dvotugofq/1tbiBwoCDGlGu0YipgAAsV

Sophgo SG2042 MSI driver does not support 32-bit MSI.
Introduce an 'msi64' kernel parameter to bypass NO_MSI64 for ATI/HDMI.

Signed-off-by: Han Gao <gaohan@iscas.ac.cn>
---
 sound/hda/controllers/intel.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/sound/hda/controllers/intel.c b/sound/hda/controllers/intel.c
index 1e8e3d61291a..b4bad9e65235 100644
--- a/sound/hda/controllers/intel.c
+++ b/sound/hda/controllers/intel.c
@@ -121,6 +121,7 @@ static bool beep_mode[SNDRV_CARDS] = {[0 ... (SNDRV_CARDS-1)] =
 #endif
 static bool dmic_detect = 1;
 static bool ctl_dev_id = IS_ENABLED(CONFIG_SND_HDA_CTL_DEV_ID) ? 1 : 0;
+static bool msi64;
 
 module_param_array(index, int, NULL, 0444);
 MODULE_PARM_DESC(index, "Index value for Intel HD audio interface.");
@@ -161,6 +162,8 @@ MODULE_PARM_DESC(dmic_detect, "Allow DSP driver selection (bypass this driver) "
 		 "deprecated, use snd-intel-dspcfg.dsp_driver option instead");
 module_param(ctl_dev_id, bool, 0444);
 MODULE_PARM_DESC(ctl_dev_id, "Use control device identifier (based on codec address).");
+module_param(msi64, bool, 0444);
+MODULE_PARM_DESC(msi64, "Force use msi 64bit.");
 
 #ifdef CONFIG_PM
 static int param_set_xint(const char *val, const struct kernel_param *kp);
@@ -1903,7 +1906,7 @@ static int azx_first_init(struct azx *chip)
 		chip->gts_present = true;
 #endif
 
-	if (chip->msi && chip->driver_caps & AZX_DCAPS_NO_MSI64) {
+	if (chip->msi && chip->driver_caps & AZX_DCAPS_NO_MSI64 && !msi64) {
 		dev_dbg(card->dev, "Disabling 64bit MSI\n");
 		pci->no_64bit_msi = true;
 	}
-- 
2.47.3

