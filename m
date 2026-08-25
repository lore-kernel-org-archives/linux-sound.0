Received: from cstnet.cn (smtp25.cstnet.cn [159.226.251.25])
	(using TLSv1.2 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D2773E0758;
	Tue, 25 Aug 2026 08:52:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.226.251.25
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787647979; cv=none; b=mzR0H7et80IW8T9797oq+hQl8eBXYdLzw+0MWmGwDqoglu8lbLlIzkGt4iUk+sby6JvbiZsUbRkh0Z4r6vlTgxUgzgoA9CGc/7/hSGFMM3JtDFjF0nlupUIReL9POZTN6P4yMEDwEX8Zg76eTZZEZqphQvEdQCo7q7ca0DrmR+I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787647979; c=relaxed/simple;
	bh=fskzp6vhBRT87tct0AUJrpoxYXqG8afQaligPqhfQgw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=lnRKl1FmxuKnBOr0rpClvOV6XrjWyPUenRM2Ptn4M4LiwMxZac0Hj6R8NSrTxEhgIskt1DTyG9XLTG+M/P37tvyN69MOx8O6p22+m9K3xQMB/x6nMRO+t4lr93+IzmGXUkY21ft6G6NDsZpy9zpus/w0vV0TL0q8nC6N64LVfPU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn; spf=pass smtp.mailfrom=iscas.ac.cn; arc=none smtp.client-ip=159.226.251.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iscas.ac.cn
Received: from localhost.localdomain (unknown [111.196.241.250])
	by APP-05 (Coremail) with SMTP id zQCowACXATzXV41q9auhBg--.12400S2;
	Tue, 25 Aug 2026 16:52:39 +0800 (CST)
From: Pengpeng Hou <pengpeng@iscas.ac.cn>
To: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>
Cc: Pengpeng Hou <pengpeng@iscas.ac.cn>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [RFC PATCH v2] ASoC: report component resume callback errors
Date: Tue, 25 Aug 2026 16:52:39 +0800
Message-ID: <20260825085239.82282-1-pengpeng@iscas.ac.cn>
X-Mailer: git-send-email 2.50.1
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:zQCowACXATzXV41q9auhBg--.12400S2
X-Coremail-Antispam: 1UD129KBjvJXoWxXr1xJw15tr1fAFyxWrWDtwb_yoW5Gw13pF
	4ktrs8Ary8uF1rZ3y2yrW0va4UXws5CF4UA343K3sxAr1DJrykCryUtr10vFyDGF45G34q
	vr48ta1UJ3ZYkaUanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUkG14x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
	1l84ACjcxK6xIIjxv20xvE14v26ryj6F1UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4j
	6F4UM28EF7xvwVC2z280aVAFwI0_Cr1j6rxdM28EF7xvwVC2z280aVCY1x0267AKxVW0oV
	Cq3wAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0
	I7IYx2IY67AKxVWUJVWUGwAv7VC2z280aVAFwI0_Jr0_Gr1lOx8S6xCaFVCjc4AY6r1j6r
	4UM4x0Y48IcxkI7VAKI48JM4x0x7Aq67IIx4CEVc8vx2IErcIFxwCY1x0262kKe7AKxVWU
	AVWUtwCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E14
	v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_Jw0_GFylIxkG
	c2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7CjxVAFwI
	0_Jr0_Gr1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r1j6r4U
	MIIF0xvEx4A2jsIEc7CjxVAFwI0_Gr0_Gr1UYxBIdaVFxhVjvjDU0xZFpf9x0JUBVbkUUU
	UU=
X-CM-SenderInfo: pshqw1xhqjqxpvfd2hldfou0/

snd_soc_component_driver::resume() returns an int, but
snd_soc_component_resume() discards it. In the deferred resume path,
snd_soc_resume() has already returned success to the PM core, so an error
cannot be propagated back to that caller.

Pass the callback result through the existing ASoC component error helper.
This reports negative results with component context while preserving the
established best-effort behavior: the component is still marked resumed
and the worker continues DAPM resume, digital unmute and card power
publication.

There are existing callbacks, including tas2562_resume() and
atmel_classd_component_resume(), which directly return regcache_sync()
errors. Those errors currently disappear at the component wrapper.

This only makes errors already returned by component callbacks observable.
It does not expose operations that individual callbacks ignore, and it
does not add rollback or retry semantics. Callbacks which already report
an error may retain their driver-specific message in addition to the
common ASoC component context, as with other ASoC component wrappers.

This is an RFC to confirm that reporting and continuing is the intended
contract for deferred component resume failures.

Signed-off-by: Pengpeng Hou <pengpeng@iscas.ac.cn>
---
Changes since the RFC:
- provide a concrete core patch instead of only asking a policy question
- select centralized reporting while retaining asynchronous best-effort
  resume and all existing state transitions
- use the existing ASoC component error helper
- keep driver-local restore transactions out of scope; the 33 sites listed
  previously remain an audit population, not 33 claimed fixes

Previous RFC:
https://lore.kernel.org/all/20260721055807.85110-1-pengpeng@iscas.ac.cn/

 sound/soc/soc-component.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/sound/soc/soc-component.c b/sound/soc/soc-component.c
index dc7d203cb76af..463ea227cac81 100644
--- a/sound/soc/soc-component.c
+++ b/sound/soc/soc-component.c
@@ -315,8 +315,12 @@ void snd_soc_component_suspend(struct snd_soc_component *component)
 
 void snd_soc_component_resume(struct snd_soc_component *component)
 {
-	if (component->driver->resume)
-		component->driver->resume(component);
+	int ret;
+
+	if (component->driver->resume) {
+		ret = component->driver->resume(component);
+		soc_component_ret(component, ret);
+	}
 	component->suspended = 0;
 }
 

base-commit: 2be02a7c996aa733bb36e29e07715621b0de9736
-- 
2.50.1 (Apple Git-155)

