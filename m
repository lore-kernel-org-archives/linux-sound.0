Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E072D225A3E
	for <linux-sound@vger.kernel.org>; Mon, 17 Mar 2025 09:56:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742205378; cv=none; b=gx3x9NX0sYm9SkpQo1HkEqcxFPyd+dtl69Z1lqAY52bcrbUFbgmdRqSvgKsBnklBHZYkiWRmTqAnDdt3IUjaOL4DhY3uk8FEhOl/xnvl7OUAeAp5KjqU0L7csea0qQTsrphlqvgng/wfFcuXw2crkzruPWQjw6iZzOLWTlJGu+Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742205378; c=relaxed/simple;
	bh=qo/cxWZ8DOL9q80T7Dw+Mj0r+hgPz4vNctWeuXpnOGM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=K4Zsc9sUd1d7jZsIOBdPKZBvQg425iuJeAUOOaHOh554dcJ3Epn5ZqXc5kOdGgPn/VKOr2iaE/hHEQ2iuI78lUa/hNqtzv7/h6iDnjPoW4InRcUTTRNVgQZqbLXLESOZprlLvWKDmfZDDJ/7JeV/I1zLqlgiH4t7LjLDaH7aCuE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=OcJgRc+V; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=hOb8dFT3; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=zLpHZrDC; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=wPBh6+cB; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="OcJgRc+V";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="hOb8dFT3";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="zLpHZrDC";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="wPBh6+cB"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id DB2961FDCB;
	Mon, 17 Mar 2025 09:56:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1742205373; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=nbZ7skFUIn7r77kUGbD3vP4zPqO8GCCGrXfR1kfweqo=;
	b=OcJgRc+VhLN/4yo37GCTtabbZ53cnWE7yO0pP/GLK9KiqOcwDZlmomawfVw0Y9XJzGSJAf
	YRiArswcoHJqUluRBGos+xEs1H554fRmIZ+/ObBHp9oUcb5v2wpW0IFM7gkHUDG4vZb4Y2
	bWe4Z0J6Vu+jfUv7LIToGwaYLnTMPto=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1742205373;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=nbZ7skFUIn7r77kUGbD3vP4zPqO8GCCGrXfR1kfweqo=;
	b=hOb8dFT3rNVwZ26NkC7L9q00uM96nJFFpADJNEswkn3JEeY20u8jhAA0XWXV8R5ck+KtTY
	BNvRFXPGTUOk+EBw==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1742205372; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=nbZ7skFUIn7r77kUGbD3vP4zPqO8GCCGrXfR1kfweqo=;
	b=zLpHZrDCfClYHBxjrj0ppypdx0ZQYxXEiuj2hRYuYQavE4OfiPSKn0HCMtuUa2jLjFj2zS
	5+VzsB80nwX0Hz5m6V/UuWsWSlvV10+rU5z6/9trOYB8Vrf2u/snxcA+9FhNpIFHT6/YFl
	BmMfJ/iKLeBzPQMMNjmi3lgjvXY66c4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1742205372;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=nbZ7skFUIn7r77kUGbD3vP4zPqO8GCCGrXfR1kfweqo=;
	b=wPBh6+cB/nvsCGLZyn7GZzc3Onng4wjvBlcmOAZ0PFNc4wYkDFm3zJzBKMLcdQnJJ+Cjg/
	T4RzEHN1S997beBQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id B7CAF132CF;
	Mon, 17 Mar 2025 09:56:12 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id rFSKK7zx12eaGAAAD6G6ig
	(envelope-from <tiwai@suse.de>); Mon, 17 Mar 2025 09:56:12 +0000
From: Takashi Iwai <tiwai@suse.de>
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org
Subject: [PATCH v2 00/88] ASoC: Convert to modern PM macros
Date: Mon, 17 Mar 2025 10:54:22 +0100
Message-ID: <20250317095603.20073-1-tiwai@suse.de>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Score: -2.80
X-Spamd-Result: default: False [-2.80 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_MISSING_CHARSET(0.50)[];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	RCPT_COUNT_TWO(0.00)[2];
	ARC_NA(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	MIME_TRACE(0.00)[0:+];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,suse.de:mid]
X-Spam-Flag: NO
X-Spam-Level: 

This is a revised series of small and trivial patches to convert to
the newer PM macros, e.g. from SET_RUNTIME_PM_OPS() to
RUNTIME_PM_OPS().

The conversions are systematic, and we could reduce messy
__maybe_unused and ifdefs with those changes.

Merely code refactoring, and shouldn't change the actual driver
behavior.

v1: https://lore.kernel.org/20250313174139.29942-1-tiwai@suse.de

v1->v2:
* Fix typos in comments and some macro usages
* Fix incorrect strings for EXPORT_NS_*()
* Drop cs35l56 patch that may break builds


Takashi

===

Takashi Iwai (88):
  ASoC: au1x: Convert to DEFINE_SIMPLE_DEV_PM_OPS()
  ASoC: ak4375: Convert to RUNTIME_PM_OPS() & co
  ASoC: ak4458: Convert to RUNTIME_PM_OPS() & co
  ASoC: ak5558: Convert to RUNTIME_PM_OPS() & co
  ASoC: cs35l32: Convert to RUNTIME_PM_OPS()
  ASoC: cs35l33: Convert to RUNTIME_PM_OPS()
  ASoC: cs35l34: Convert to RUNTIME_PM_OPS()
  ASoC: cs4234: Convert to RUNTIME_PM_OPS()
  ASoC: cs42l42: Convert to RUNTIME_PM_OPS() & co
  ASoC: cs42l51: Convert to SYSTEM_SLEEP_PM_OPS()
  ASoC: cs42l83: Convert to SYSTEM_SLEEP_PM_OPS()
  ASoC: cs42xx8: Convert to EXPORT_GPL_DEV_PM_OPS()
  ASoC: cs43130: Convert to RUNTIME_PM_OPS()
  ASoC: cs4349: Convert to RUNTIME_PM_OPS()
  ASoC: cs53l30: Convert to RUNTIME_PM_OPS()
  ASoC: cx2072x: Convert to RUNTIME_PM_OPS() & co
  ASoC: da7213: Convert to RUNTIME_PM_OPS() & co
  ASoC: hdac_hdmi: Convert to RUNTIME_PM_OPS() & co
  ASoC: lpass: Convert to RUNTIME_PM_OPS()
  ASoC: max98090: Convert to RUNTIME_PM_OPS() & co
  ASoC: max98373: Convert to RUNTIME_PM_OPS() & co
  ASoC: max98390: Convert to SYSTEM_SLEEP_PM_OPS()
  ASoC: max98396: Convert to SYSTEM_SLEEP_PM_OPS()
  ASoC: max98520: Convert to SYSTEM_SLEEP_PM_OPS()
  ASoC: max9860: Convert to RUNTIME_PM_OPS()
  ASoC: max98927: Convert to SYSTEM_SLEEP_PM_OPS()
  ASoC: mt6660: Convert to RUNTIME_PM_OPS()
  ASoC: pcm512x: Convert to EXPORT_GPL_DEV_PM_OPS()
  ASoC: rt1017-sdca-sdw: Convert to RUNTIME_PM_OPS() & co
  ASoC: rt1308-sdw: Convert to RUNTIME_PM_OPS() & co
  ASoC: rt1316-sdw: Convert to RUNTIME_PM_OPS() & co
  ASoC: rt1318-sdw: Convert to RUNTIME_PM_OPS() & co
  ASoC: rt1320-sdw: Convert to RUNTIME_PM_OPS() & co
  ASoC: rt5514: Convert to SYSTEM_SLEEP_PM_OPS()
  ASoC: rt5645: Convert to SYSTEM_SLEEP_PM_OPS()
  ASoC: rt5682-sdw: Convert to RUNTIME_PM_OPS() & co
  ASoC: rt700-sdw: Convert to RUNTIME_PM_OPS() & co
  ASoC: rt711: Convert to RUNTIME_PM_OPS() & co
  ASoC: rt712: Convert to RUNTIME_PM_OPS() & co
  ASoC: rt715: Convert to RUNTIME_PM_OPS() & co
  ASoC: rt721: Convert to RUNTIME_PM_OPS() & co
  ASoC: rt722: Convert to RUNTIME_PM_OPS() & co
  ASoC: rt9120: Convert to RUNTIME_PM_OPS()
  ASoC: rtq9128: Convert to RUNTIME_PM_OPS()
  ASoC: tas2552: Convert to RUNTIME_PM_OPS()
  ASoC: ts3a227e: Convert to SYSTEM_SLEEP_PM_OPS()
  ASoC: wcd937x: Convert to RUNTIME_PM_OPS()
  ASoC: wcd938x: Convert to RUNTIME_PM_OPS()
  ASoC: wcd939x: Convert to RUNTIME_PM_OPS()
  ASoC: wm2200: Convert to RUNTIME_PM_OPS()
  ASoC: wm5100: Convert to RUNTIME_PM_OPS()
  ASoC: wm8804: Convert to EXPORT_GPL_DEV_PM_OPS()
  ASoC: wm8962: Convert to RUNTIME_PM_OPS() & co
  ASoC: wm8994: Convert to SYSTEM_SLEEP_PM_OPS()
  ASoC: wsa881x: Convert to RUNTIME_PM_OPS()
  ASoC: wsa883x: Convert to RUNTIME_PM_OPS()
  ASoC: wsa884x: Convert to RUNTIME_PM_OPS()
  ASoC: dwc: Convert to RUNTIME_PM_OPS()
  ASoC: fsl: Convert to RUNTIME_PM_OPS() and co
  ASoC: img: Convert to RUNTIME_PM_OPS() and co
  ASoC: intel: avs: Convert to RUNTIME_PM_OPS()
  ASoC: intel: catpt: Convert to RUNTIME_PM_OPS() & co
  ASoC: mediatek: mt2701: Convert to RUNTIME_PM_OPS()
  ASoC: mediatek: mt6797: Convert to RUNTIME_PM_OPS()
  ASoC: mediatek: mt7986: Convert to RUNTIME_PM_OPS()
  ASoC: mediatek: mt8173: Convert to RUNTIME_PM_OPS()
  ASoC: mediatek: mt8183: Convert to RUNTIME_PM_OPS()
  ASoC: mediatek: mt8186: Convert to RUNTIME_PM_OPS()
  ASoC: mediatek: mt8188: Convert to RUNTIME_PM_OPS()
  ASoC: mediatek: mt8192: Convert to RUNTIME_PM_OPS()
  ASoC: mediatek: mt8195: Convert to RUNTIME_PM_OPS()
  ASoC: mediatek: mt8365: Convert to RUNTIME_PM_OPS() & co
  ASoC: qcom: Convert to SYSTEM_SLEEP_PM_OPS()
  ASoC: rcar: Convert to SYSTEM_SLEEP_PM_OPS()
  ASoC: rockchip: Convert to RUNTIME_PM_OPS() & co
  ASoC: samsung: Convert to RUNTIME_PM_OPS() & co
  ASoC: SOF: acpi: Convert to EXPORT_NS_DEV_PM_OPS()
  ASoC: SOF: pci: Convert to EXPORT_NS_DEV_PM_OPS()
  ASoC: SOF: of: Convert to EXPORT_DEV_PM_OPS()
  ASoC: stm: Convert to SYSTEM_SLEEP_PM_OPS()
  ASoC: sunxi: Convert to RUNTIME_PM_OPS()
  ASoC: tegra186: Convert to RUNTIME_PM_OPS() & co
  ASoC: tegra210: Convert to RUNTIME_PM_OPS() & co
  ASoC: tegra20: Convert to RUNTIME_PM_OPS() & co
  ASoC: tegra30: Convert to RUNTIME_PM_OPS() & co
  ASoC: xtensa: Convert to RUNTIME_PM_OPS()
  ASoC: amd: Convert to RUNTIME_PM_OPS() & co
  ASoC: pcm3168a: Convert to EXPORT_GPL_DEV_PM_OPS()

 sound/soc/amd/acp/acp-pci.c                | 10 ++++-----
 sound/soc/amd/acp/acp-rembrandt.c          |  6 +++---
 sound/soc/amd/acp/acp-renoir.c             |  6 +++---
 sound/soc/amd/acp/acp63.c                  |  6 +++---
 sound/soc/amd/acp/acp70.c                  |  6 +++---
 sound/soc/amd/ps/pci-ps.c                  | 12 +++++------
 sound/soc/amd/ps/ps-pdm-dma.c              | 12 +++++------
 sound/soc/amd/ps/ps-sdw-dma.c              |  6 +++---
 sound/soc/amd/rpl/rpl-pci-acp6x.c          | 10 ++++-----
 sound/soc/amd/vangogh/acp5x-pcm-dma.c      | 11 +++++-----
 sound/soc/amd/yc/acp6x-pdm-dma.c           | 12 +++++------
 sound/soc/amd/yc/pci-acp6x.c               | 10 ++++-----
 sound/soc/au1x/i2sc.c                      | 17 +++------------
 sound/soc/au1x/psc-ac97.c                  | 17 +++------------
 sound/soc/au1x/psc-i2s.c                   | 17 +++------------
 sound/soc/codecs/ak4375.c                  | 11 +++++-----
 sound/soc/codecs/ak4458.c                  | 13 +++++-------
 sound/soc/codecs/ak5558.c                  | 11 +++++-----
 sound/soc/codecs/cs35l32.c                 |  7 ++-----
 sound/soc/codecs/cs35l33.c                 | 10 ++++-----
 sound/soc/codecs/cs35l34.c                 | 10 ++++-----
 sound/soc/codecs/cs4234.c                  |  8 ++++----
 sound/soc/codecs/cs42l42-i2c.c             |  6 +++---
 sound/soc/codecs/cs42l42-sdw.c             | 16 +++++++--------
 sound/soc/codecs/cs42l51-i2c.c             |  2 +-
 sound/soc/codecs/cs42l51.c                 |  4 ++--
 sound/soc/codecs/cs42l83-i2c.c             |  6 +++---
 sound/soc/codecs/cs42xx8-i2c.c             |  2 +-
 sound/soc/codecs/cs42xx8.c                 | 10 +++------
 sound/soc/codecs/cs43130.c                 |  9 ++++----
 sound/soc/codecs/cs4349.c                  |  7 ++-----
 sound/soc/codecs/cs53l30.c                 |  7 ++-----
 sound/soc/codecs/cx2072x.c                 | 12 +++++------
 sound/soc/codecs/da7213.c                  | 10 ++++-----
 sound/soc/codecs/hdac_hdmi.c               | 15 +++-----------
 sound/soc/codecs/lpass-rx-macro.c          |  8 ++++----
 sound/soc/codecs/lpass-tx-macro.c          |  8 ++++----
 sound/soc/codecs/lpass-va-macro.c          |  8 ++++----
 sound/soc/codecs/lpass-wsa-macro.c         |  8 ++++----
 sound/soc/codecs/max98090.c                | 11 +++-------
 sound/soc/codecs/max98373-i2c.c            |  6 ++----
 sound/soc/codecs/max98373-sdw.c            | 10 ++++-----
 sound/soc/codecs/max98390.c                |  6 ++----
 sound/soc/codecs/max98396.c                |  6 ++----
 sound/soc/codecs/max98520.c                |  8 ++++----
 sound/soc/codecs/max9860.c                 |  6 ++----
 sound/soc/codecs/max98927.c                |  6 ++----
 sound/soc/codecs/mt6660.c                  |  9 ++++----
 sound/soc/codecs/pcm3168a-i2c.c            |  2 +-
 sound/soc/codecs/pcm3168a-spi.c            |  2 +-
 sound/soc/codecs/pcm3168a.c                |  7 ++-----
 sound/soc/codecs/pcm512x-i2c.c             |  2 +-
 sound/soc/codecs/pcm512x-spi.c             |  2 +-
 sound/soc/codecs/pcm512x.c                 |  7 ++-----
 sound/soc/codecs/rt1017-sdca-sdw.c         | 10 ++++-----
 sound/soc/codecs/rt1308-sdw.c              | 10 ++++-----
 sound/soc/codecs/rt1316-sdw.c              | 10 ++++-----
 sound/soc/codecs/rt1318-sdw.c              | 10 ++++-----
 sound/soc/codecs/rt1320-sdw.c              | 10 ++++-----
 sound/soc/codecs/rt5514-spi.c              |  8 ++++----
 sound/soc/codecs/rt5514.c                  |  6 +++---
 sound/soc/codecs/rt5645.c                  |  8 ++++----
 sound/soc/codecs/rt5682-sdw.c              | 12 +++++------
 sound/soc/codecs/rt700-sdw.c               | 12 +++++------
 sound/soc/codecs/rt711-sdca-sdw.c          | 12 +++++------
 sound/soc/codecs/rt711-sdw.c               | 12 +++++------
 sound/soc/codecs/rt712-sdca-dmic.c         | 12 +++++------
 sound/soc/codecs/rt712-sdca-sdw.c          | 12 +++++------
 sound/soc/codecs/rt715-sdca-sdw.c          | 10 ++++-----
 sound/soc/codecs/rt715-sdw.c               | 10 ++++-----
 sound/soc/codecs/rt721-sdca-sdw.c          | 12 +++++------
 sound/soc/codecs/rt722-sdca-sdw.c          | 12 +++++------
 sound/soc/codecs/rt9120.c                  |  8 ++++----
 sound/soc/codecs/rtq9128.c                 |  8 ++++----
 sound/soc/codecs/tas2552.c                 |  9 ++------
 sound/soc/codecs/ts3a227e.c                |  6 ++----
 sound/soc/codecs/wcd937x-sdw.c             |  8 ++++----
 sound/soc/codecs/wcd938x-sdw.c             |  8 ++++----
 sound/soc/codecs/wcd939x-sdw.c             |  8 ++++----
 sound/soc/codecs/wm2200.c                  |  7 ++-----
 sound/soc/codecs/wm5100.c                  |  7 ++-----
 sound/soc/codecs/wm8804-i2c.c              |  2 +-
 sound/soc/codecs/wm8804-spi.c              |  2 +-
 sound/soc/codecs/wm8804.c                  |  7 ++-----
 sound/soc/codecs/wm8962.c                  |  8 +++-----
 sound/soc/codecs/wm8994.c                  |  6 ++----
 sound/soc/codecs/wsa881x.c                 |  8 ++++----
 sound/soc/codecs/wsa883x.c                 |  8 ++++----
 sound/soc/codecs/wsa884x.c                 |  8 ++++----
 sound/soc/dwc/dwc-i2s.c                    |  6 +++---
 sound/soc/fsl/fsl_aud2htx.c                |  3 +--
 sound/soc/fsl/fsl_esai.c                   |  9 +++-----
 sound/soc/fsl/fsl_micfil.c                 |  9 +++-----
 sound/soc/fsl/fsl_sai.c                    |  8 +++-----
 sound/soc/fsl/fsl_xcvr.c                   |  3 +--
 sound/soc/img/img-i2s-in.c                 |  9 +++-----
 sound/soc/img/img-i2s-out.c                |  9 +++-----
 sound/soc/img/img-parallel-out.c           |  5 ++---
 sound/soc/img/img-spdif-in.c               |  9 +++-----
 sound/soc/img/img-spdif-out.c              | 10 ++++-----
 sound/soc/img/pistachio-internal-dac.c     |  8 +++-----
 sound/soc/intel/avs/core.c                 | 24 +++++++++++-----------
 sound/soc/intel/catpt/device.c             | 14 ++++++-------
 sound/soc/mediatek/mt2701/mt2701-afe-pcm.c |  6 +++---
 sound/soc/mediatek/mt6797/mt6797-afe-pcm.c |  6 +++---
 sound/soc/mediatek/mt7986/mt7986-afe-pcm.c |  6 +++---
 sound/soc/mediatek/mt8173/mt8173-afe-pcm.c |  6 +++---
 sound/soc/mediatek/mt8183/mt8183-afe-pcm.c |  6 +++---
 sound/soc/mediatek/mt8186/mt8186-afe-pcm.c |  6 +++---
 sound/soc/mediatek/mt8188/mt8188-afe-pcm.c |  6 +++---
 sound/soc/mediatek/mt8192/mt8192-afe-pcm.c |  6 +++---
 sound/soc/mediatek/mt8195/mt8195-afe-pcm.c |  6 +++---
 sound/soc/mediatek/mt8365/mt8365-afe-pcm.c | 19 ++++++++---------
 sound/soc/qcom/lpass-sc7180.c              |  8 ++++----
 sound/soc/qcom/lpass-sc7280.c              |  8 ++++----
 sound/soc/renesas/rcar/core.c              |  8 ++++----
 sound/soc/rockchip/rockchip_i2s.c          |  5 ++---
 sound/soc/rockchip/rockchip_i2s_tdm.c      | 16 +++++++--------
 sound/soc/rockchip/rockchip_pdm.c          | 10 ++++-----
 sound/soc/rockchip/rockchip_spdif.c        |  9 ++++----
 sound/soc/samsung/i2s.c                    | 10 +++------
 sound/soc/sof/amd/pci-acp63.c              |  2 +-
 sound/soc/sof/amd/pci-acp70.c              |  2 +-
 sound/soc/sof/amd/pci-rn.c                 |  2 +-
 sound/soc/sof/amd/pci-vangogh.c            |  2 +-
 sound/soc/sof/imx/imx8.c                   |  2 +-
 sound/soc/sof/imx/imx9.c                   |  2 +-
 sound/soc/sof/intel/bdw.c                  |  2 +-
 sound/soc/sof/intel/byt.c                  |  2 +-
 sound/soc/sof/intel/pci-apl.c              |  2 +-
 sound/soc/sof/intel/pci-cnl.c              |  2 +-
 sound/soc/sof/intel/pci-icl.c              |  2 +-
 sound/soc/sof/intel/pci-lnl.c              |  2 +-
 sound/soc/sof/intel/pci-mtl.c              |  2 +-
 sound/soc/sof/intel/pci-ptl.c              |  2 +-
 sound/soc/sof/intel/pci-skl.c              |  2 +-
 sound/soc/sof/intel/pci-tgl.c              |  2 +-
 sound/soc/sof/intel/pci-tng.c              |  2 +-
 sound/soc/sof/mediatek/mt8186/mt8186.c     |  2 +-
 sound/soc/sof/mediatek/mt8195/mt8195.c     |  2 +-
 sound/soc/sof/sof-acpi-dev.c               |  9 ++++----
 sound/soc/sof/sof-of-dev.c                 |  8 +++-----
 sound/soc/sof/sof-pci-dev.c                |  9 ++++----
 sound/soc/stm/stm32_i2s.c                  |  6 ++----
 sound/soc/stm/stm32_sai.c                  |  6 ++----
 sound/soc/stm/stm32_sai_sub.c              |  6 ++----
 sound/soc/stm/stm32_spdifrx.c              |  6 ++----
 sound/soc/sunxi/sun4i-spdif.c              |  6 +++---
 sound/soc/sunxi/sun50i-dmic.c              |  6 +++---
 sound/soc/sunxi/sun8i-codec.c              |  6 +++---
 sound/soc/tegra/tegra186_asrc.c            | 13 ++++++------
 sound/soc/tegra/tegra186_dspk.c            | 13 ++++++------
 sound/soc/tegra/tegra20_i2s.c              | 13 ++++++------
 sound/soc/tegra/tegra20_spdif.c            | 13 ++++++------
 sound/soc/tegra/tegra210_admaif.c          | 13 ++++++------
 sound/soc/tegra/tegra210_adx.c             | 13 ++++++------
 sound/soc/tegra/tegra210_ahub.c            | 13 ++++++------
 sound/soc/tegra/tegra210_amx.c             | 13 ++++++------
 sound/soc/tegra/tegra210_dmic.c            | 13 ++++++------
 sound/soc/tegra/tegra210_i2s.c             | 13 ++++++------
 sound/soc/tegra/tegra210_mixer.c           | 13 ++++++------
 sound/soc/tegra/tegra210_mvc.c             | 13 ++++++------
 sound/soc/tegra/tegra210_ope.c             | 13 ++++++------
 sound/soc/tegra/tegra210_sfc.c             | 13 ++++++------
 sound/soc/tegra/tegra30_ahub.c             | 13 ++++++------
 sound/soc/tegra/tegra30_i2s.c              | 13 ++++++------
 sound/soc/xtensa/xtfpga-i2s.c              |  6 +++---
 167 files changed, 591 insertions(+), 764 deletions(-)

-- 
2.43.0

