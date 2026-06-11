Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D09873EFFAD;
	Thu, 11 Jun 2026 13:23:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781184200; cv=none; b=et/gV2Svc76aZ5oDCUJl8pAQaYKyMXXv6IDpHRQhi+TdUFKu4mNkWbi7QlIdrLXfIr4207F5QXyIY34fBUnWeVfdyO9gLp3cGYEB9ynqInR9BT6Y14VTB7hv1ylMDe7MMLTLiL1lSikOhG6t/ZtyziA5VrHtMGBkI4hxRgAuOtQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781184200; c=relaxed/simple;
	bh=D1hXhBEL/psnqd6aaLsjnBeLlNyaGtJizRT25Vif9i8=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=imPP5sZZigvvGAArt4B9L6Kf1E46ses7wK5BsMiU90vldshOIn3xG/+mUgXmGRczpjMt5uV0RfwEz7eOHOfosf5ZH6CGyak9r9QQmC6MD/8y6v276+i6Ba1jTSKF39bY4sIpgEi8CEadWenikJ5KuE/EYNP7Hh/2cbP3iHah48U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RQ+BE1m+; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RQ+BE1m+"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D2DE01F00893;
	Thu, 11 Jun 2026 13:23:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781184197;
	bh=1txuOoVuF6tM9GYG9L9uTeyxGGrQb9Al74UzBGoF2qA=;
	h=From:To:Cc:Subject:Date;
	b=RQ+BE1m+iw1SnXYmvbK3cq8wITDV4cOZMi98v2Kt7HaIVtTQo4k0nUR/9RElpzrFu
	 xC27PC6K5iMQUszICQIfegj7NdWnKqe3vfsvVovb7ax6erJa0sOB2z3m3Uufon5Jg8
	 pQZuaZq4mtJWB416JXiBFYhdlrBd3115N388zybRXIPOx7wSiCkZnUCxA7vNFaqZxc
	 xFwUoaF6A1k8Ce/PJRsUA2b/wTpj7G8pVrD1D2znjcA1J6fqF/klFLuPWnbUYqaY4c
	 cemG+1y2t3CW1ncaP7JyBdg8n/D6hht704VjEugH4usZiJr9L/P3dt3/QFdHBGIR+L
	 Q990kmfjG2KqQ==
From: Arnd Bergmann <arnd@kernel.org>
To: Liam Girdwood <lgirdwood@gmail.com>,
	Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	Daniel Baluta <daniel.baluta@nxp.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>
Cc: Arnd Bergmann <arnd@arndb.de>,
	Kai Vehmanen <kai.vehmanen@linux.intel.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
	sound-open-firmware@alsa-project.org,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/2] ASoC: SOF: Intel: select SND_SOC_SDW_UTILS=y from SND_SOC_SOF_HDA_GENERIC=y
Date: Thu, 11 Jun 2026 15:23:05 +0200
Message-Id: <20260611132310.137688-1-arnd@kernel.org>
X-Mailer: git-send-email 2.39.5
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Arnd Bergmann <arnd@arndb.de>

When SND_SOC_SOF_HDA_GENERIC=y but SND_SOC_SOF_INTEL_SOUNDWIRE=m, the
SND_SOC_SDW_UTILS is also set to =m even though there is a direct link
dependency from the hda.c:

aarch64-linux-ld: sound/soc/sof/intel/hda.o: in function `hda_machine_select':
hda.c:(.text+0x21ac): undefined reference to `codec_info_list'
hda.c:(.text+0x241c): undefined reference to `asoc_sdw_get_dai_type'
hda.c:(.text+0x25b4): undefined reference to `asoc_sdw_get_codec_info_list_count'
hda.c:(.text+0x25d8): undefined reference to `asoc_sdw_get_codec_info_list_count'

Change this the same way as the other related 'select' statements
to allow linking against it.

Fixes: 2b4d53eb5cf3 ("ASoC: SOF: Intel: select SND_SOC_SDW_UTILS in SND_SOC_SOF_HDA_GENERIC")
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 sound/soc/sof/intel/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/sof/intel/Kconfig b/sound/soc/sof/intel/Kconfig
index 0e52225bddae..e499bdd43f45 100644
--- a/sound/soc/sof/intel/Kconfig
+++ b/sound/soc/sof/intel/Kconfig
@@ -335,7 +335,7 @@ config SND_SOC_SOF_HDA_GENERIC
 	select SND_INTEL_DSP_CONFIG
 	select SND_SOC_SOF_HDA_LINK_BASELINE
 	select SND_SOC_SOF_HDA_PROBES
-	select SND_SOC_SDW_UTILS if SND_SOC_SOF_INTEL_SOUNDWIRE
+	select SND_SOC_SDW_UTILS if SND_SOC_SOF_INTEL_SOUNDWIRE !=n
 	select SND_SOC_SOF_HDA_MLINK if SND_SOC_SOF_HDA_LINK
 	help
 	  This option is not user-selectable but automagically handled by
-- 
2.39.5

