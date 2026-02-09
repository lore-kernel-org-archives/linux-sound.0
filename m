Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48C65450F2;
	Mon,  9 Feb 2026 07:09:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770620947; cv=none; b=B28axX3AGA+KQyLbDB8VEalie+oz8OWOniJkR30uCuHuQzXEVlxHtmFmRTiSzeMtwSDaPTGGw8P/mgcoJo/Ie20YscAJE2jyNKTfVoBlulDG/bwRCyN3hByD3QOUdUzl57Pqa4RzpsyF8F2R9iTlRnFpQGLkDOoQQ0cn5VLZI9Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770620947; c=relaxed/simple;
	bh=oZTyFcjFCSC6tMDJLejhO+HAC9pwUT2o8iZYaSMKDBQ=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=VKpXqXhXg31HC7B1SFVxnyPpz7DO2ZEyq053JZ6hRsT4w9GP1tWFBRiLfxyRdzuBSQxbTy1cSc6Kw1cq2d+tTqYncspWGmjK0s1PJjyGuJlmKKiy5KGByt9fmn1zncIiEiHPGy12NYqzh0O6BJn7UQsWg7cW7cHJcX/N6jC/tNE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cKZLOymg; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cKZLOymg"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D2FA2C116C6;
	Mon,  9 Feb 2026 07:09:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770620946;
	bh=oZTyFcjFCSC6tMDJLejhO+HAC9pwUT2o8iZYaSMKDBQ=;
	h=From:To:Cc:Subject:Date:From;
	b=cKZLOymgQjWgrnVE0k77dAKQ01c7Mk5mpEJtxuBd2CRBoaPVv3eEyJ0iLotAIhy+F
	 Raw/vWYL56oqYNRX6vXCny9P59t4V9L9j0zRAJkvBAzgfUm5iiDuPNHWpR0h9CJ03+
	 CWFVCawD/9N79VH8z5TPExyYRbevJwKomNpT2y0DPF+mJvRoeQ07py9cXFXqbW56yQ
	 yrCcW2YcrIkRByoX2uMOnkFUQBMExZAvQdTeCc+vGM/RPY0kaiJk0oso//dNOSQzeR
	 gW2cP6/8RH8uZMgbumXlY895hewLmQ0cuEmLyZu+skhx2wx2FlXFwd+gz70WUyAzT/
	 eqVpsSiKwGTow==
From: Arnd Bergmann <arnd@kernel.org>
To: Liam Girdwood <lgirdwood@gmail.com>,
	Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
	Daniel Baluta <daniel.baluta@nxp.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>
Cc: Arnd Bergmann <arnd@arndb.de>,
	Kai Vehmanen <kai.vehmanen@linux.intel.com>,
	sound-open-firmware@alsa-project.org,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] ASoC: SOF: Intel: select CONFIG_SND_HDA_EXT_CORE from SND_SOC_SOF_HDA_COMMON
Date: Mon,  9 Feb 2026 08:08:38 +0100
Message-Id: <20260209070901.857700-1-arnd@kernel.org>
X-Mailer: git-send-email 2.39.5
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Arnd Bergmann <arnd@arndb.de>

The _hda_dsp_stream_put() function now depends on the
snd_hdac_ext_stream_release() interface from SND_HDA_EXT_CORE:

x86_64-linux-ld: vmlinux.o: in function `_hda_dsp_stream_put':
hda-stream.c:(.text+0xfac605): undefined reference to `snd_hdac_ext_stream_release'

Select this symbol the same way the other users do.

Fixes: 89e1d632bb29 ("ASoC: SOF: Intel: add hda_dsp_stream_pair_get/put helpers")
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
---
 sound/soc/sof/intel/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/soc/sof/intel/Kconfig b/sound/soc/sof/intel/Kconfig
index 0c8acb1db662..0e52225bddae 100644
--- a/sound/soc/sof/intel/Kconfig
+++ b/sound/soc/sof/intel/Kconfig
@@ -325,6 +325,7 @@ config SND_SOC_SOF_NOVALAKE
 
 config SND_SOC_SOF_HDA_COMMON
 	tristate
+	select SND_HDA_EXT_CORE
 
 config SND_SOC_SOF_HDA_GENERIC
 	tristate
-- 
2.39.5

