Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA9BB1548C;
	Mon, 13 Apr 2026 07:12:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776064341; cv=none; b=KtjuDKO2zrVWej5aJBJD0VT/LfADK+cXFE546U7s/WrYGR2C0zAEvudHmc1IqKmRihwnpSl8euDP7TnM5jmVt08yrP/ZPA6nCoxKSNNzjHY9Vko2nYU4XFwQWjuGcyZF3sCq0YyIcTRK1CS5UJimt1arBTzvnuA4eoqswRzRE04=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776064341; c=relaxed/simple;
	bh=TTmFDgJ1ZbtN29RF8NsJDTBUE4NteGdsFO8dvIwOqdk=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=p178l4Ww2Gu8J7B9tC9wRN1COQ3fCLe9awx1Hh48pRIFQp2bdQSKL3DbeHm+7HYnx+qxSNlZOCtTsCsrrrNK5zC0WQI5R445hOFjWRbDPoDhfqAXRLIb9lsBQ97vw5Rm4FANimlbqc2dXHfpqD7T5LHPxKSdg0+bvDn/VnvHbTY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=tODZce/r; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="tODZce/r"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 04EA9C2BCB0;
	Mon, 13 Apr 2026 07:12:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776064341;
	bh=TTmFDgJ1ZbtN29RF8NsJDTBUE4NteGdsFO8dvIwOqdk=;
	h=From:To:Cc:Subject:Date:From;
	b=tODZce/rN2UcwYdtetYlAHERP1yhOExK0LlQer6vzCTcXRW/lmlpumvkwjmF7hhD1
	 5Ce5gSJVhqTWSe8BfaSZsRzEsIaH5idkZb9Mds5x4kloIvF77aeDHoC89PCM4+aUwE
	 +/JsjWhEeDyd4zTmnEnqiaJmM+vJ3JK2NfQfpbJUzahWwha+tLSty0YmBcHd8cd+bj
	 XpgBADQj/p4P4b7rLnezqXADotwmEGv7U2phxleOXJ7gFrdjszIkB3nnpRLyuYymgR
	 smQ/8N/YGVLFfz1xcZKltX/+oj+9iMG67XrLIyqLFNd5e/v5x7vglkqCGvNIfDnf+c
	 7oHdqTNkxnC4A==
From: Arnd Bergmann <arnd@kernel.org>
To: Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	=?UTF-8?q?C=C3=A1ssio=20Gabriel?= <cassiogabrielcontato@gmail.com>
Cc: Arnd Bergmann <arnd@arndb.de>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] ALSA: interwave: fix build warnings with CONFIG_PM=n
Date: Mon, 13 Apr 2026 09:12:11 +0200
Message-Id: <20260413071217.3830320-1-arnd@kernel.org>
X-Mailer: git-send-email 2.39.5
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Arnd Bergmann <arnd@arndb.de>

Parts of the newly added power management code are identified
as unused by gcc:

sound/isa/gus/interwave.c:489:13: error: 'snd_interwave_restore_memory' defined but not used [-Werror=unused-function]
  489 | static void snd_interwave_restore_memory(struct snd_gus_card *gus)
      |             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
sound/isa/gus/interwave.c:483:13: error: 'snd_interwave_restore_regs' defined but not used [-Werror=unused-function]
  483 | static void snd_interwave_restore_regs(struct snd_gus_card *gus)
      |             ^~~~~~~~~~~~~~~~~~~~~~~~~~
In file included from sound/isa/gus/interwave-stb.c:3:
sound/isa/gus/interwave.c:489:13: error: 'snd_interwave_restore_memory' defined but not used [-Werror=unused-function]
  489 | static void snd_interwave_restore_memory(struct snd_gus_card *gus)
      |             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
sound/isa/gus/interwave.c:483:13: error: 'snd_interwave_restore_regs' defined but not used [-Werror=unused-function]
  483 | static void snd_interwave_restore_regs(struct snd_gus_card *gus)
      |             ^~~~~~~~~~~~~~~~~~~~~~~~~~

Add an #ifdef check around these to match the callers.

Fixes: 6f800c3397b7 ("ALSA: interwave: add ISA and PnP suspend and resume callbacks")
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 sound/isa/gus/interwave.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/sound/isa/gus/interwave.c b/sound/isa/gus/interwave.c
index 616c11e51a2f..bd13350038d2 100644
--- a/sound/isa/gus/interwave.c
+++ b/sound/isa/gus/interwave.c
@@ -480,6 +480,7 @@ static void __snd_interwave_restore_regs(struct snd_gus_card *gus)
 	snd_gf1_write8(gus, SNDRV_GF1_GB_EMULATION_IRQ, 0x00);
 }
 
+#ifdef CONFIG_PM
 static void snd_interwave_restore_regs(struct snd_gus_card *gus)
 {
 	scoped_guard(spinlock_irqsave, &gus->reg_lock)
@@ -517,6 +518,7 @@ static void snd_interwave_restore_memory(struct snd_gus_card *gus)
 		snd_gf1_write16(gus, SNDRV_GF1_GW_MEMORY_CONFIG, mem_cfg);
 	}
 }
+#endif
 
 static void snd_interwave_init(int dev, struct snd_gus_card *gus)
 {
-- 
2.39.5

