Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34DD13E63B7;
	Thu, 11 Jun 2026 13:23:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781184213; cv=none; b=owLOhyXsOwnKvxJ7SxGq7h1V00HXugWVMan5d/zS7Mlr0/XC1Vq8IU1onVshpXSkkkfgFIkYd7ebmGu+I1zRWexF51LemrY4ssIokl15+3qeonGUmY/MjRPkQx7763qU0h5U2u5scJYepGjklR/Fhuoak6kLj5uzA5uhz4H+/SQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781184213; c=relaxed/simple;
	bh=3oY7YusajTpIeyRJMwNpm9A7YAeBiEL5nk6p/ENOWDk=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=kPTmEODY02GUSz6+NjRTfUrP3g+vDpCqFqg8Lui4j4vZFmuVm2c2LtlSEIqxXyn16KWsuBAhp5nyrMHnEhlhiG/brY5mZPSqqc1r0uo1DxsZRdF+EvKZ6ow1SgQR0+dD3AbqgFOw5+DQiif5izNE5LEMv30NgH/+Gsar0cMfVQ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XZvhpY3K; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XZvhpY3K"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4DB3F1F00893;
	Thu, 11 Jun 2026 13:23:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781184210;
	bh=N2cZ3b8IT/m6NHhB520WDpfiHXJR38DG/QNe/ib8QUY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=XZvhpY3KdMTOl0O00HFF3qNFXNEfz46t6vBAJsDaIPAmm9vVre9p0axfvYwpd7dcR
	 ZEvkVBFgrlv6GahxETBC3QwUIbrUVpRYuy8hTK36KG5gUt6pVX04dc1xzo+FF0m9hG
	 bbByii2Eh1Z8l2BGD7Cw6ODUhe7EeSjiZKPOda6yWz6gKlThvRpzs0D67P9M4ZF2su
	 vQ8j4WtNumNhdzMKKp4tVdSAapk3qEpejMP93eLEL+yJYQp5sQzbcuX3bM3KS0TzoR
	 Qbu5w2mlJRi4cdL2H7evki1yG6+j1zmua5PtTLK83996UQxeJfp0ZsKOMYKa2NC3Es
	 D8cIplmtRKbcQ==
From: Arnd Bergmann <arnd@kernel.org>
To: Liam Girdwood <lgirdwood@gmail.com>,
	Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	Daniel Baluta <daniel.baluta@nxp.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Arnd Bergmann <arnd@arndb.de>
Cc: Kai Vehmanen <kai.vehmanen@linux.intel.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
	sound-open-firmware@alsa-project.org,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 2/2] ASoC: SOF: Intel: hda-sdw-bpt: select SND_SOF_SOF_HDA_SDW_BPT properly
Date: Thu, 11 Jun 2026 15:23:06 +0200
Message-Id: <20260611132310.137688-2-arnd@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20260611132310.137688-1-arnd@kernel.org>
References: <20260611132310.137688-1-arnd@kernel.org>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Arnd Bergmann <arnd@arndb.de>

When SND_SOC_SOF_INTEL_LNL is set, SND_SOF_SOF_HDA_SDW_BPT must also
be enabled, in order to let the soundwire support call into it.

However, there are configurations with SND_SOF_SOF_HDA_SDW_BPT=m
and SND_SOF_SOF_HDA_SDW_BPT=m but SOUNDWIRE_INTEL=y, which still
lead to a link failure:

aarch64-linux-ld: drivers/soundwire/intel_ace2x.o: in function `intel_ace2x_bpt_wait':
intel_ace2x.c:(.text+0xfc8): undefined reference to `hda_sdw_bpt_wait'
aarch64-linux-ld: drivers/soundwire/intel_ace2x.o: in function `intel_ace2x_bpt_send_async':
intel_ace2x.c:(.text+0x1ff8): undefined reference to `hda_sdw_bpt_get_buf_size_alignment'

Address this by moving the 'select SND_SOF_SOF_HDA_SDW_BPT' into
SND_SOC_SOF_HDA_GENERIC.

Fixes: 614d416dd8ae ("ASoC: SOF: Intel: hda-sdw-bpt: fix SND_SOF_SOF_HDA_SDW_BPT dependencies")
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 sound/soc/sof/intel/Kconfig | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/soc/sof/intel/Kconfig b/sound/soc/sof/intel/Kconfig
index e499bdd43f45..f78c3e9e3965 100644
--- a/sound/soc/sof/intel/Kconfig
+++ b/sound/soc/sof/intel/Kconfig
@@ -272,10 +272,8 @@ config SND_SOC_SOF_METEORLAKE
 
 config SND_SOC_SOF_INTEL_LNL
 	tristate
-	select SOUNDWIRE_INTEL if SND_SOC_SOF_INTEL_SOUNDWIRE != n
 	select SND_SOC_SOF_HDA_GENERIC
 	select SND_SOC_SOF_INTEL_SOUNDWIRE_LINK_BASELINE
-	select SND_SOF_SOF_HDA_SDW_BPT if SND_SOC_SOF_INTEL_SOUNDWIRE != n
 	select SND_SOC_SOF_IPC4
 	select SND_SOC_SOF_INTEL_MTL
 
@@ -337,6 +335,8 @@ config SND_SOC_SOF_HDA_GENERIC
 	select SND_SOC_SOF_HDA_PROBES
 	select SND_SOC_SDW_UTILS if SND_SOC_SOF_INTEL_SOUNDWIRE !=n
 	select SND_SOC_SOF_HDA_MLINK if SND_SOC_SOF_HDA_LINK
+	select SND_SOF_SOF_HDA_SDW_BPT if SND_SOC_SOF_INTEL_LNL != n && \
+					  SND_SOC_SOF_INTEL_SOUNDWIRE !=n
 	help
 	  This option is not user-selectable but automagically handled by
 	  'select' statements at a higher level.
-- 
2.39.5

