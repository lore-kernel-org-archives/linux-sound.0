Received: from cstnet.cn (smtp81.cstnet.cn [159.226.251.81])
	(using TLSv1.2 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18F683EF0A0;
	Tue, 10 Mar 2026 08:23:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.226.251.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773131041; cv=none; b=pqiCCn10oZUXXqDBdXBwMBQxEChcukzw22JF0pNK9nT49K9hNLEN4U182/iJwR1TQOUL+0qEBv9FU2PU/O2nBQke+fdGIiAAD6gBP49MgHJsF0JP0hAfAFUca+M4xdq1afkwi6xzanX657RMpu3mvD3VWc5hqSac4sDi9XxI6mw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773131041; c=relaxed/simple;
	bh=FjUAgwjIf0+Ityy0KooSq3QAAg+uxCsubNe4RbZ7ykM=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=JoaxEam2739c/a7GpXyx03negpvt+w6Dv+dfityo1wMiJxWW+cgWDZqO5clZi1+hWsI3/kzrUGo0nfSP5V+4zhPBUZZ647SSDUX0AONKylPmBf4V1M0pkZCzdx8YXDrOpNZMgflalCIykWPmhJ5G1VIxXgFd0oDod2iFSNnx+Lo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=isrc.iscas.ac.cn; spf=pass smtp.mailfrom=isrc.iscas.ac.cn; arc=none smtp.client-ip=159.226.251.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=isrc.iscas.ac.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=isrc.iscas.ac.cn
Received: from localhost.localdomain (unknown [210.73.43.101])
	by APP-03 (Coremail) with SMTP id rQCowAA3V94V1a9pdnw7Cg--.6310S2;
	Tue, 10 Mar 2026 16:23:49 +0800 (CST)
From: Pengpeng Hou <pengpeng.hou@isrc.iscas.ac.cn>
To: Support Opensource <support.opensource@diasemi.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>
Cc: linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Pengpeng Hou <pengpeng.hou@isrc.iscas.ac.cn>
Subject: [PATCH v2] ASoC: da7219: scope AAD suspend and resume helpers to CONFIG_PM
Date: Tue, 10 Mar 2026 08:23:48 +0000
Message-Id: <20260310082348.743716-1-pengpeng.hou@isrc.iscas.ac.cn>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:rQCowAA3V94V1a9pdnw7Cg--.6310S2
X-Coremail-Antispam: 1UD129KBjvJXoW7Zr48GryrJFy8tF48Aw17GFg_yoW5Jry3pr
	s5JrZ3Ww1DZa15uryFvr48uF1ag34rCFWxJasF93yfXr15AF1xCr18tr15ZFW8GFWfGFnI
	vFy2v3yUKF1xKa7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUvm14x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
	1l84ACjcxK6xIIjxv20xvE14v26r1j6r1xM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4j
	6F4UM28EF7xvwVC2z280aVAFwI0_Gr0_Cr1l84ACjcxK6I8E87Iv6xkF7I0E14v26r4UJV
	WxJr1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E
	2Ix0cI8IcVAFwI0_JF0_Jw1lYx0Ex4A2jsIE14v26r4j6F4UMcvjeVCFs4IE7xkEbVWUJV
	W8JwACjcxG0xvY0x0EwIxGrwACjI8F5VA0II8E6IAqYI8I648v4I1lc7CjxVAaw2AFwI0_
	JF0_Jw1lc2xSY4AK67AK6r43MxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r
	4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF
	67AKxVWUtVW8ZwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMIIF0xvE2I
	x0cI8IcVCY1x0267AKxVWUJVW8JwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcVC2
	z280aVAFwI0_Jr0_Gr1lIxAIcVC2z280aVCY1x0267AKxVW8JVW8JrUvcSsGvfC2KfnxnU
	UI43ZEXa7VUUiiSJUUUUU==
X-CM-SenderInfo: pshqw1hhqjhx1rx6x21ufox2xfdvhtffof0/

In current linux.git, da7219_aad_suspend() and
da7219_aad_resume() are defined and declared unconditionally. However,
their only in-tree callers are the component PM callbacks in da7219.c,
which are already guarded by #ifdef CONFIG_PM.

This inconsistency leads to unnecessary code inclusion and potential
compiler warnings when CONFIG_PM is disabled. Match the helper
declarations and definitions to the callers' scope and provide no-op
!CONFIG_PM stubs in the header.

Signed-off-by: Pengpeng Hou <pengpeng.hou@isrc.iscas.ac.cn>
---

Hi Mark, 
I have rebased this patch against the current tree. The previous version 
failed to apply likely due to context shifts in the AAD header/source file.

Changes in v2:
- Rebased on top of the latest tree to fix application failure.
- No functional changes from v1.

 sound/soc/codecs/da7219-aad.c | 3 ++-
 sound/soc/codecs/da7219-aad.h | 5 +++++
 2 files changed, 7 insertions(+), 1 deletion(-)

diff --git a/sound/soc/codecs/da7219-aad.c b/sound/soc/codecs/da7219-aad.c
index d9d932a78b710..0b3b108aaeee5 100644
--- a/sound/soc/codecs/da7219-aad.c
+++ b/sound/soc/codecs/da7219-aad.c
@@ -924,6 +924,7 @@ static void da7219_aad_handle_gnd_switch_time(struct snd_soc_component *componen
  * Suspend/Resume
  */
 
+#ifdef CONFIG_PM
 void da7219_aad_suspend(struct snd_soc_component *component)
 {
 	struct da7219_priv *da7219 = snd_soc_component_get_drvdata(component);
@@ -981,7 +982,7 @@ void da7219_aad_resume(struct snd_soc_component *component)
 
 	enable_irq(da7219_aad->irq);
 }
-
+#endif
 
 /*
  * Init/Exit
diff --git a/sound/soc/codecs/da7219-aad.h b/sound/soc/codecs/da7219-aad.h
index fbfbf3e67918d..ea5b818192477 100644
--- a/sound/soc/codecs/da7219-aad.h
+++ b/sound/soc/codecs/da7219-aad.h
@@ -209,8 +209,13 @@ struct da7219_aad_priv {
 void da7219_aad_jack_det(struct snd_soc_component *component, struct snd_soc_jack *jack);
 
 /* Suspend/Resume */
+#ifdef CONFIG_PM
 void da7219_aad_suspend(struct snd_soc_component *component);
 void da7219_aad_resume(struct snd_soc_component *component);
+#else
+static inline void da7219_aad_suspend(struct snd_soc_component *component) { }
+static inline void da7219_aad_resume(struct snd_soc_component *component) { }
+#endif
 
 /* Init/Exit */
 int da7219_aad_init(struct snd_soc_component *component);
-- 
2.25.1

