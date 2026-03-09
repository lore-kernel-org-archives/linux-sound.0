Received: from cstnet.cn (smtp25.cstnet.cn [159.226.251.25])
	(using TLSv1.2 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C25036CDE5;
	Mon,  9 Mar 2026 08:28:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.226.251.25
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773044916; cv=none; b=f8Kl9ewXCMdKitmPZKouNMAH08nKJPEbYIHh+eYbYmaGTbYt1UgLNIiif+LY0cFTc+mj5N9UnwqpD3ArgzWb3irNdOfqwrZp+5ZUuw2pfHnqANDOFk97rVpxu0BZcrjTYNPQTtSnEs5Aeyq1zJgNIz8xokd7NLZyZB6d5i6J/2Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773044916; c=relaxed/simple;
	bh=lyww92yMoAnlrC3Qf5SoiaN9czveLaJMQmFhcl7njg4=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=Vgp4S/xr9jgjTmG48fj8VA8KNR9usttaWpJnZFznwpzzbt5j3TwLxHwtlpuBhl74UgWeE5QL8aHJ6enWHjF8GBsm4EFeyAGWRgFpVKbc6QyAf7n8HL8HNz7P4lzCqe76++3yaUWyegxgPDXWVS9rxRr9+3acpumiOyG2YO8Fbo8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=isrc.iscas.ac.cn; spf=pass smtp.mailfrom=isrc.iscas.ac.cn; arc=none smtp.client-ip=159.226.251.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=isrc.iscas.ac.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=isrc.iscas.ac.cn
Received: from localhost.localdomain (unknown [210.73.43.101])
	by APP-05 (Coremail) with SMTP id zQCowAAXpgmrhK5pMCHxCQ--.20883S2;
	Mon, 09 Mar 2026 16:28:28 +0800 (CST)
From: Pengpeng Hou <pengpeng.hou@isrc.iscas.ac.cn>
To: lgirdwood@gmail.com,
	broonie@kernel.org,
	perex@perex.cz,
	tiwai@suse.com
Cc: linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	18291782795@163.com,
	pengpeng.hou@isrc.iscas.ac.cn,
	pengpeng@iscas.ac.cn
Subject: [PATCH] ASoC: da7219: scope AAD suspend and resume helpers to CONFIG_PM
Date: Mon,  9 Mar 2026 08:28:24 +0000
Message-Id: <20260309082824.717012-1-pengpeng.hou@isrc.iscas.ac.cn>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:zQCowAAXpgmrhK5pMCHxCQ--.20883S2
X-Coremail-Antispam: 1UD129KBjvJXoW7Zr48GryrJFy8tF48Aw17GFg_yoW8AF4rpF
	n5trZ3Xw1DZa1Y9rWYvr1rZF12g34rCF47JasFg3y7Xr15AF1xCr18tr1ruFy8GFW3GFnF
	vry2934UKFnYga7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUvv14x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
	1l84ACjcxK6xIIjxv20xvE14v26r1j6r1xM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r1j
	6r4UM28EF7xvwVC2z280aVAFwI0_Jr0_Gr1l84ACjcxK6I8E87Iv6xkF7I0E14v26r4j6r
	4UJwAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0
	I7IYx2IY67AKxVWUGVWUXwAv7VC2z280aVAFwI0_Gr0_Cr1lOx8S6xCaFVCjc4AY6r1j6r
	4UM4x0Y48IcxkI7VAKI48JM4x0x7Aq67IIx4CEVc8vx2IErcIFxwCY1x0262kKe7AKxVWU
	tVW8ZwCY02Avz4vE14v_GFyl42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr
	1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE
	14v26r1q6r43MIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7
	IYx2IY6xkF7I0E14v26r1j6r4UMIIF0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E
	87Iv67AKxVWUJVW8JwCI42IY6I8E87Iv6xkF7I0E14v26r4j6r4UJbIYCTnIWIevJa73Uj
	IFyTuYvjfUeFApDUUUU
X-CM-SenderInfo: pshqw1hhqjhx1rx6x21ufox2xfdvhtffof0/

From: pengpeng.hou@isrc.iscas.ac.cn

In current linux.git (1954c4f01220), da7219_aad_suspend() and
da7219_aad_resume() are defined and declared unconditionally. However,
their only in-tree callers are the component PM callbacks in da7219.c,
which are already guarded by #ifdef CONFIG_PM.

This inconsistency leads to unnecessary code inclusion and potential
compiler warnings when CONFIG_PM is disabled. Match the helper
declarations and definitions to the callers' scope and provide no-op
!CONFIG_PM stubs in the header.

Signed-off-by: pengpeng@iscas.ac.cn
---
diff --git a/sound/soc/codecs/da7219-aad.c b/sound/soc/codecs/da7219-aad.c
--- a/sound/soc/codecs/da7219-aad.c
+++ b/sound/soc/codecs/da7219-aad.c
@@
 /*
  * Suspend/Resume
  */
 
+#ifdef CONFIG_PM
 void da7219_aad_suspend(struct snd_soc_component *component)
 {
 	struct da7219_priv *da7219 = snd_soc_component_get_drvdata(component);
@@
 			da7219_aad->micbias_resume_enable = false;
 		}
 	}
 }
+#endif
 
 /*
  * Init/Exit
  */
diff --git a/sound/soc/codecs/da7219-aad.h b/sound/soc/codecs/da7219-aad.h
--- a/sound/soc/codecs/da7219-aad.h
+++ b/sound/soc/codecs/da7219-aad.h
@@
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

