Received: from mail-dl1-f43.google.com (mail-dl1-f43.google.com [74.125.82.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F8B63C8721
	for <linux-sound@vger.kernel.org>; Fri, 10 Apr 2026 13:57:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775829430; cv=none; b=hD2LmMz7V65esnwTZ6wsJnhGAUcOgLE0Di3Vm3DO+PbVDE9JEjQKbqdCEcv1n7uRTn0dpbKp/LPsa7yDE1Dlc9Tr9ePfDp1PPlfMXz6NyzJjAMQY9RUvqWPAheigSi4WGXmX+bMWewhlI8hH0ds5P+iykewBpzNePfR2RRDqNZY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775829430; c=relaxed/simple;
	bh=5krFrZc2j2nQUa+LXsB2gtCPXXyFJolWkY9QS8kGw2s=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=GAa1+dRRCKOWIm/G/QsHntGbirgS1hQ8XHi7TDwFFnY30s/x35aw7sRwD65KAP+q3nSJ8YX5vgltmCLxDbNCf80q/l+qkW8uC1Ice8MOC/BqNOkUtlZNhVi1bKisahFUdUS8nmJBxgv7nZES+mTkZ6GnXaPoD51Bb3GGWsPkSj0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kp7lskRo; arc=none smtp.client-ip=74.125.82.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kp7lskRo"
Received: by mail-dl1-f43.google.com with SMTP id a92af1059eb24-12c0433a4b9so4253024c88.1
        for <linux-sound@vger.kernel.org>; Fri, 10 Apr 2026 06:57:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775829429; x=1776434229; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Xsdmh34jdW7d8HN4ibrkIXX29On17rToZw+rgRkjNVQ=;
        b=kp7lskRoVTevxio71ihwPkmCJPtqiUNhDDuWG6IkmOY7Fto6LM9U7ikb3w8VsEWgXc
         IJYXepj/WRHwpZetlnETx1ulP+UBZFF61I/pp/vqTzC0GzUpPw/owuQVShN0ZSOX7LfX
         JCChL4AGchfKWI6ivtB40XVFOeVabG1+hbjg+xViAlArrYcs20b041f1FLIQX1XD3frJ
         g9z+3eH4Kf7Jyf5D5BLEQ2djNk6mlFci/1DuvmquuHYAQocmnVI+GmXFB8n8O23anUB3
         DvpKce/AIx9/0AbYHSAJqQ7NFAKUixTO6v6ly3eh30Y+Oxm9r6pP6z0l7ARtZ/iapxeN
         ErzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775829429; x=1776434229;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Xsdmh34jdW7d8HN4ibrkIXX29On17rToZw+rgRkjNVQ=;
        b=I3bpyS4j68Nx99ymYbp7jwtPYZl4gPUzoStQZpGwe1shGksethebaz5dNAam4QG2oE
         ILmHwmuZhUXmhagfDLEXCkVtvUnrG9C63gl0qwifjdcu4IFXf5XtxQl8Mks/m0741Gbg
         an9jPmoR5Ylf9r0U1qVUoEG6IbaOHrkKcKZWn/vdyU/pc2Y5P7WIfan8WbLj9bJBqFwr
         aGt0REAe4cWkVN/q+4F3qCep8XfmhqHzb813HhKjAarPRHu4A5nPIxhuaZpDm19BAE7R
         O5BLJ0EmvZY1c8nv2B30L9K3mSLX2zAhhl8Udc7vjNmDnAWetYaV7mqJ2kAx+SrFSO0h
         T7ug==
X-Gm-Message-State: AOJu0Yxg8yd96MfLoeqvd5Uu8HcUmPXCHeTX4mELc1C/CfgEgBiWFZpV
	et8Sa2C4FWi3G7L7DZEVu4erMSkmP6v+vDyc1QsGV+uAkgyvvU5NP1bN
X-Gm-Gg: AeBDievR8OkcL1P+I+FBT7j3P05soOeTQLuYynoVXg3vePPx96Uwkiu/HvcTAbEdSVv
	9kBwBNqiB1MPBbqujmLavs05hTtfZnz4eT71KUrh6bIihHCteFeNna/FFz86e0tv+KJ0MCd5XFa
	ojf6uWWXgDZ1pLssviPQmjaIbSOh/zURVH1naiyUbHtSAcOjy5wUIJp+FqsMzx2mzCHc/9qY4+Q
	zg7ZrseZ3Ug3zEVOyCIyly6yAx9scr7tCNb7hw1EA/zmC2JB4JWovSHJ4nkcZ1h77HYROm3GUkE
	OBx/+p69LtotsL9KU/HQd/L/Ndh0J0Uh9A9EO9Ocam9fl0ADAhOQtSDjh5lz7jXUfNrbNlEC5qm
	9vzB4IXCCH7GvpNBQyly9ANIxCQaw2rXugsG8YDR2jJG1wkZUcn7ahSguQ+7iSwYO5p6qH8G9dh
	yiKOw97pS987Mi5PzpZTij7HeoeV3RDz0kVjJHVGtth/paWZJW7kpCum2q2LrgWS+QS68mMJVrW
	S9h
X-Received: by 2002:a05:7022:f92:b0:128:bae0:e043 with SMTP id a92af1059eb24-12c34f14057mr1938968c88.31.1775829428427;
        Fri, 10 Apr 2026 06:57:08 -0700 (PDT)
Received: from [192.168.1.18] (177-4-160-195.user3p.v-tal.net.br. [177.4.160.195])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-12c345a96f0sm3405159c88.5.2026.04.10.06.56.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Apr 2026 06:57:07 -0700 (PDT)
From: =?utf-8?q?C=C3=A1ssio_Gabriel?= <cassiogabrielcontato@gmail.com>
Date: Fri, 10 Apr 2026 10:56:52 -0300
Subject: [PATCH] ALSA: interwave: guard PM-only restore helpers with
 CONFIG_PM
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260410-alsa-interwave-pm-warning-fix-v1-1-434d14c9c262@gmail.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXMQQ6CQAxA0auQrm0yA4wxXsW4qEPFGq2kRSAh3
 N1Rl+8v/grOJuxwrFYwnsTlpQVxV0G+kfaM0hVDHep9aGNAejih6Mg208Q4PHEmU9Eer7Jgpia
 lLh5SkxnKYzAu+fc/nf/29+XOefxOYds+GQeHAYEAAAA=
X-Change-ID: 20260410-alsa-interwave-pm-warning-fix-ca355d1853ce
To: Takashi Iwai <tiwai@suse.com>, Jaroslav Kysela <perex@perex.cz>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org, 
 kernel test robot <lkp@intel.com>, 
 =?utf-8?q?C=C3=A1ssio_Gabriel?= <cassiogabrielcontato@gmail.com>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=3731;
 i=cassiogabrielcontato@gmail.com; h=from:subject:message-id;
 bh=5krFrZc2j2nQUa+LXsB2gtCPXXyFJolWkY9QS8kGw2s=;
 b=owGbwMvMwCV2IdZeKur/u2bG02pJDJk3GVclOzX/4k+NESwKls2Ndgw4Y5jh2R7+qmxXvNzj3
 XHBmR4dpSwMYlwMsmKKLKuTFlnu6XpwtT5uhQfMHFYmkCEMXJwCMBGPV4wM36QTsv8JzTjk+cNH
 UripOFSwJ06yu/L6GT5fPZNIvdZ0RoZPM6q0E07HVHh0BX8+F8WcGsHpuNHRvOzMOW+VnZFiOrw A
X-Developer-Key: i=cassiogabrielcontato@gmail.com; a=openpgp;
 fpr=AB62A239BC8AE0D57F5EA848D05D3F1A5AFFEE83

The InterWave PM patch added snd_interwave_restore_regs() and
snd_interwave_restore_memory() as static helpers, but both are used only
from the resume path under CONFIG_PM.

On configurations without CONFIG_PM, such as alpha allyesconfig, this
leaves both helpers unused and triggers -Wunused-function warnings with
W=1.

Move the PM-only helpers into the existing CONFIG_PM section. Keep
__snd_interwave_restore_regs() outside the guard because it is also used
during probe-time initialization.

Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202604101958.x16oNkfo-lkp@intel.com/
Signed-off-by: Cássio Gabriel <cassiogabrielcontato@gmail.com>
---
 sound/isa/gus/interwave.c | 76 +++++++++++++++++++++++------------------------
 1 file changed, 38 insertions(+), 38 deletions(-)

diff --git a/sound/isa/gus/interwave.c b/sound/isa/gus/interwave.c
index 616c11e51a2f..6c3a2977dcb3 100644
--- a/sound/isa/gus/interwave.c
+++ b/sound/isa/gus/interwave.c
@@ -480,44 +480,6 @@ static void __snd_interwave_restore_regs(struct snd_gus_card *gus)
 	snd_gf1_write8(gus, SNDRV_GF1_GB_EMULATION_IRQ, 0x00);
 }
 
-static void snd_interwave_restore_regs(struct snd_gus_card *gus)
-{
-	scoped_guard(spinlock_irqsave, &gus->reg_lock)
-		__snd_interwave_restore_regs(gus);
-}
-
-static void snd_interwave_restore_memory(struct snd_gus_card *gus)
-{
-	unsigned short mem_cfg;
-	unsigned int lmct = 0;
-	int i, lmc_cfg;
-
-	if (!gus->gf1.memory)
-		return;
-
-	for (i = 0; i < 4; i++)
-		lmct |= (gus->gf1.mem_alloc.banks_16[i].size >> 18) << (i * 8);
-
-	lmc_cfg = snd_interwave_find_memory_config(lmct);
-	if (lmc_cfg < 0) {
-		if (!gus->gf1.enh_mode) {
-			lmc_cfg = 2;
-		} else {
-			dev_warn(gus->card->dev,
-				 "cannot restore InterWave memory layout 0x%08x\n",
-				 lmct);
-			return;
-		}
-	}
-
-	scoped_guard(spinlock_irqsave, &gus->reg_lock) {
-		mem_cfg = snd_gf1_look16(gus, SNDRV_GF1_GW_MEMORY_CONFIG);
-		mem_cfg = (mem_cfg & 0xfff0) | lmc_cfg;
-		mem_cfg = (mem_cfg & 0xff1f) | (4 << 5);
-		snd_gf1_write16(gus, SNDRV_GF1_GW_MEMORY_CONFIG, mem_cfg);
-	}
-}
-
 static void snd_interwave_init(int dev, struct snd_gus_card *gus)
 {
 	/* Probe-time setup also clears the timer control register. */
@@ -888,6 +850,44 @@ static int snd_interwave_isa_probe(struct device *pdev,
 }
 
 #ifdef CONFIG_PM
+static void snd_interwave_restore_regs(struct snd_gus_card *gus)
+{
+	scoped_guard(spinlock_irqsave, &gus->reg_lock)
+		__snd_interwave_restore_regs(gus);
+}
+
+static void snd_interwave_restore_memory(struct snd_gus_card *gus)
+{
+	unsigned short mem_cfg;
+	unsigned int lmct = 0;
+	int i, lmc_cfg;
+
+	if (!gus->gf1.memory)
+		return;
+
+	for (i = 0; i < 4; i++)
+		lmct |= (gus->gf1.mem_alloc.banks_16[i].size >> 18) << (i * 8);
+
+	lmc_cfg = snd_interwave_find_memory_config(lmct);
+	if (lmc_cfg < 0) {
+		if (!gus->gf1.enh_mode) {
+			lmc_cfg = 2;
+		} else {
+			dev_warn(gus->card->dev,
+				 "cannot restore InterWave memory layout 0x%08x\n",
+				 lmct);
+			return;
+		}
+	}
+
+	scoped_guard(spinlock_irqsave, &gus->reg_lock) {
+		mem_cfg = snd_gf1_look16(gus, SNDRV_GF1_GW_MEMORY_CONFIG);
+		mem_cfg = (mem_cfg & 0xfff0) | lmc_cfg;
+		mem_cfg = (mem_cfg & 0xff1f) | (4 << 5);
+		snd_gf1_write16(gus, SNDRV_GF1_GW_MEMORY_CONFIG, mem_cfg);
+	}
+}
+
 static int snd_interwave_card_suspend(struct snd_card *card)
 {
 	struct snd_interwave *iwcard = card->private_data;

---
base-commit: 80cdbd09760cdfe3c643ef43c1ff2d798babb28a
change-id: 20260410-alsa-interwave-pm-warning-fix-ca355d1853ce

Best regards,
--  
Cássio Gabriel <cassiogabrielcontato@gmail.com>

