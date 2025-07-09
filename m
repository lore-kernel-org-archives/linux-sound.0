Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 980151E5B78
	for <linux-sound@vger.kernel.org>; Wed,  9 Jul 2025 16:04:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752077085; cv=none; b=db1SCThEQ8n4iufchChsDQg6ZpOgmgcwMSRvDbMtVXW9rppl97y1u7r8FvrrggTvdQvPYCjCbMN+FEOYtc0A76s48WsGlyLaOED0KBwavUBivDqVJe6sIieJGy/wKixqxDDeYQbAk9f0EW7gkPj67UqHTjSgHz8Iv3J5gYXt9+8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752077085; c=relaxed/simple;
	bh=OdosZQZxY37ZEQwtwct34hChzlb0M7TWfRONs1JlRHo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=gDLMTX2ls2lpfuYBKGqcGkZ72A2PZ9I3UBLDCokk02HclR6T4nxC4OR9LVberb2hgcLXGA/YNnQOAVXu89t5Fvp3boaKC8Dv5sClk9lTBQid/GVdZnvRCQ2KfLEq76lhx/S22cYXt216Gug1om3dlqvG2wbv6oUgICR0Cc3OLRo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=c32QBxIe; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=QPEEYate; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=c32QBxIe; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=QPEEYate; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="c32QBxIe";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="QPEEYate";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="c32QBxIe";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="QPEEYate"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id C22ED1F385;
	Wed,  9 Jul 2025 16:04:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1752077080; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=ym2NbO1+MxxdiLwYdw1gGLmZXh92aZPVR0a2fy1uefs=;
	b=c32QBxIe3Bdam0kC/ZnXfegPSIiJZpyRMgtFcOBl90zteSugFE0ZrVw7ugw1lPn7EE03Mn
	sjKSjbki5t2U596EP8zM3zUlQKi6iV7aHaM4WotN4fTBXe42zpzs7ZqxcITr3Bh0TmbxNK
	LERLrJRlXyEZzbmghqPlTpRBMrVCx48=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1752077080;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=ym2NbO1+MxxdiLwYdw1gGLmZXh92aZPVR0a2fy1uefs=;
	b=QPEEYate3fdY0QUAQmQf18J2MCsieUKVb93EQgsuYZzN/2ex/Pqnj73WaUSY69vEovpdzF
	2ymSMeTHFqJubNCw==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1752077080; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=ym2NbO1+MxxdiLwYdw1gGLmZXh92aZPVR0a2fy1uefs=;
	b=c32QBxIe3Bdam0kC/ZnXfegPSIiJZpyRMgtFcOBl90zteSugFE0ZrVw7ugw1lPn7EE03Mn
	sjKSjbki5t2U596EP8zM3zUlQKi6iV7aHaM4WotN4fTBXe42zpzs7ZqxcITr3Bh0TmbxNK
	LERLrJRlXyEZzbmghqPlTpRBMrVCx48=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1752077080;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=ym2NbO1+MxxdiLwYdw1gGLmZXh92aZPVR0a2fy1uefs=;
	b=QPEEYate3fdY0QUAQmQf18J2MCsieUKVb93EQgsuYZzN/2ex/Pqnj73WaUSY69vEovpdzF
	2ymSMeTHFqJubNCw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 717CD136DC;
	Wed,  9 Jul 2025 16:04:40 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id 8S9rGhiTbmhDEAAAD6G6ig
	(envelope-from <tiwai@suse.de>); Wed, 09 Jul 2025 16:04:40 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Cc: Richard Fitzgerald <rf@opensource.cirrus.com>,
	Kailang <kailang@realtek.com>,
	Kai Vehmanen <kai.vehmanen@linux.intel.com>,
	Cezary Rojewski <cezary.rojewski@intel.com>,
	=?UTF-8?q?Amadeusz=20S=C5=82awi=C5=84ski?= <amadeuszx.slawinski@linux.intel.com>,
	patches@opensource.cirrus.com,
	Baojun Xu <baojun.xu@ti.com>,
	bo liu <bo.liu@senarytech.com>
Subject: [PATCH 00/27] ALSA: Reorganize HD-audio driver code
Date: Wed,  9 Jul 2025 18:04:03 +0200
Message-ID: <20250709160434.1859-1-tiwai@suse.de>
X-Mailer: git-send-email 2.50.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-2.80 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_MISSING_CHARSET(0.50)[];
	NEURAL_HAM_SHORT(-0.20)[-0.999];
	MIME_GOOD(-0.10)[text/plain];
	ARC_NA(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	RCVD_TLS_ALL(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_COUNT_TWO(0.00)[2];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,suse.de:mid]
X-Spam-Flag: NO
X-Spam-Level: 
X-Spam-Score: -2.80

HD-audio driver is known to be quite messy in both file structures and
its design, but until now I haven't touched its files paths so much
because I set a higher priority for the easiness of backport to stable
kernels.  But, you can't leave garbages forever, it's been already
high time for a large clean up -- so here it is.

The basic idea is to move the code from sound/pci/hda/* into different
subdirectories in sound/hda/ per functionality, as most of the stuff
are independent from PCI, but rather HD-audio bus specific.

So, now the all HD-audio driver code are moved under sound/hda:

  % ls sound/hda 
  codecs/  common/  controllers/  core/  Kconfig  Makefile

* The former hda core code is found in sound/hda/core.
* The former snd-hda-codec code is found in sound/hda/common.
* The former snd-hda-intel, tegra and acpi are put in
  sound/hda/controllers.
* The former patch_* and co are put to sound/hda/codecs.
* Realtek codec driver is split to several modules as
  sound/hda/codecs/realtek/alc*.
* Cirrus codec driver is split to cs420x and cs421x, put under
  sound/hda/codecs/cirrus together with cs8409.
* HDMI codec driver is split to several modules under
  sound/hda/codecs/hdmi
* Cirrus and TI sub-codecs are put under sound/hda/codecs/side-codecs

Also, the probe of the HD-audio codec driver is moved into the
driver's ops instead of the ugly patch_ops embedded in hda_codec
object. (As of now, hda_codec_driver.ops is a pointer, but it can be
embedded later, too.)

This change required some code to be modified without the dynamic
override of callbacks.

In future, we may convert the runtime PM handling to use the standard
pm_ops, too.  This was raised some time ago during the discussion with
Realtek devs.

The tree applying those patches is found in topic/hda-reorg branch of
sound git tree:
  https://git.kernel.org/pub/scm/linux/kernel/git/tiwai/sound.git/log/?h=topic/hda-reorg


Takashi

===

Takashi Iwai (27):
  ALSA: hda: Move widget capability macros into hdaudio.h
  ALSA: hda: Move HD-audio core stuff into sound/hda/core
  ALSA: hda: Move common codec driver into sound/hda/common directory
  ALSA: hda: Move CONFIG_SND_HDA_PREALLOC_SIZE into sound/hda/common
  ALSA: hda: Move controller drivers into sound/hda/controllers
    directory
  ALSA: hda: Move codec drivers into sound/hda/codecs directory
  ALSA: hda: Split Realtek HD-audio codec driver
  ALSA: hda/hdmi: Split vendor codec drivers
  ALSA: hda: Introduce hda_codec_driver ops
  ALSA: hda/generic: Rewrite to new probe method
  ALSA: hda/realtek: Rewrite to new probe method
  ALSA: hda/cmedia: Rewrite to new probe method
  ALSA: hda/analog: Rewrite to new probe method
  ALSA: hda/ca0110: Rewrite to new probe method
  ALSA: hda/cirrus: Split to cs420x and cs421x drivers
  ALSA: hda/cs8409: Rewrite to new probe method
  ALSA: hda/conexant: Rewrite to new probe method
  ALSA: hda/senary: Rewrite to new probe method
  ALSA: hda/si3054: Rewrite to new probe method
  ALSA: hda/via: Rewrite to new probe method
  ALSA: hda/sigmatel: Rewrite to new probe method
  ALSA: hda/ca0132: Rewrite to new probe method
  ALSA: hda/hdmi: Rewrite to new probe method
  ALSA: hda: Drop old codec binding method
  ALSA: hda: Drop superfluous driver->ops NULL checks
  MAINTAINERS: Adjust to the new HD-audio driver paths
  ALSA: hda: Return the codec init error properly at
    snd_hda_codec_build_controls()

 MAINTAINERS                                   |   10 +-
 include/sound/hda_codec.h                     |   40 +-
 include/sound/hdaudio.h                       |   24 +
 sound/hda/Kconfig                             |   70 +-
 sound/hda/Makefile                            |   28 +-
 sound/hda/codecs/Kconfig                      |  137 +
 sound/hda/codecs/Makefile                     |   34 +
 .../patch_analog.c => hda/codecs/analog.c}    |  223 +-
 .../patch_ca0110.c => hda/codecs/ca0110.c}    |   37 +-
 .../patch_ca0132.c => hda/codecs/ca0132.c}    |  105 +-
 sound/{pci/hda => hda/codecs}/ca0132_regs.h   |    2 +-
 sound/hda/codecs/cirrus/Kconfig               |   31 +
 sound/hda/codecs/cirrus/Makefile              |   10 +
 .../codecs/cirrus/cs420x.c}                   |  528 +-
 sound/hda/codecs/cirrus/cs421x.c              |  590 ++
 .../codecs/cirrus/cs8409-tables.c}            |    4 +-
 .../codecs/cirrus/cs8409.c}                   |   57 +-
 .../codecs/cirrus/cs8409.h}                   |    6 +-
 .../patch_cmedia.c => hda/codecs/cm9825.c}    |  140 +-
 sound/hda/codecs/cmedia.c                     |  106 +
 .../codecs/conexant.c}                        |  110 +-
 .../hda_generic.c => hda/codecs/generic.c}    |   57 +-
 .../hda_generic.h => hda/codecs/generic.h}    |    2 +-
 sound/hda/codecs/hdmi/Kconfig                 |   68 +
 sound/hda/codecs/hdmi/Makefile                |   18 +
 sound/hda/codecs/hdmi/atihdmi.c               |  615 ++
 .../hda/hda_eld.c => hda/codecs/hdmi/eld.c}   |  172 -
 sound/hda/codecs/hdmi/hdmi.c                  | 2416 +++++++
 sound/hda/codecs/hdmi/hdmi_local.h            |  302 +
 sound/hda/codecs/hdmi/intelhdmi.c             |  811 +++
 sound/hda/codecs/hdmi/nvhdmi-mcp.c            |  384 ++
 sound/hda/codecs/hdmi/nvhdmi.c                |  223 +
 sound/hda/codecs/hdmi/simplehdmi.c            |  251 +
 sound/hda/codecs/hdmi/tegrahdmi.c             |  316 +
 .../codecs/helpers/hp_x360.c}                 |    0
 .../codecs/helpers/ideapad_hotkey_led.c}      |    0
 .../codecs/helpers/ideapad_s740.c}            |    0
 .../codecs/helpers/thinkpad.c}                |    0
 sound/hda/codecs/realtek/Kconfig              |   90 +
 sound/hda/codecs/realtek/Makefile             |   26 +
 sound/hda/codecs/realtek/alc260.c             |  290 +
 sound/hda/codecs/realtek/alc262.c             |  213 +
 sound/hda/codecs/realtek/alc268.c             |  190 +
 .../codecs/realtek/alc269.c}                  | 5828 +----------------
 sound/hda/codecs/realtek/alc662.c             | 1116 ++++
 sound/hda/codecs/realtek/alc680.c             |   67 +
 sound/hda/codecs/realtek/alc861.c             |  163 +
 sound/hda/codecs/realtek/alc861vd.c           |  137 +
 sound/hda/codecs/realtek/alc880.c             |  509 ++
 sound/hda/codecs/realtek/alc882.c             |  861 +++
 sound/hda/codecs/realtek/realtek.c            | 2299 +++++++
 sound/hda/codecs/realtek/realtek.h            |  298 +
 .../codecs/senarytech.c}                      |   50 +-
 .../patch_si3054.c => hda/codecs/si3054.c}    |   53 +-
 sound/hda/codecs/side-codecs/Kconfig          |  128 +
 sound/hda/codecs/side-codecs/Makefile         |   28 +
 .../codecs/side-codecs}/cirrus_scodec.c       |    0
 .../codecs/side-codecs}/cirrus_scodec.h       |    0
 .../codecs/side-codecs}/cirrus_scodec_test.c  |    0
 .../codecs/side-codecs}/cs35l41_hda.c         |    2 +-
 .../codecs/side-codecs}/cs35l41_hda.h         |    0
 .../codecs/side-codecs}/cs35l41_hda_i2c.c     |    0
 .../side-codecs}/cs35l41_hda_property.c       |    0
 .../side-codecs}/cs35l41_hda_property.h       |    0
 .../codecs/side-codecs}/cs35l41_hda_spi.c     |    0
 .../codecs/side-codecs}/cs35l56_hda.c         |    2 +-
 .../codecs/side-codecs}/cs35l56_hda.h         |    0
 .../codecs/side-codecs}/cs35l56_hda_i2c.c     |    0
 .../codecs/side-codecs}/cs35l56_hda_spi.c     |    0
 .../codecs/side-codecs}/hda_component.c       |    0
 .../codecs/side-codecs}/hda_component.h       |    0
 .../codecs/side-codecs}/tas2781_hda.c         |    0
 .../codecs/side-codecs}/tas2781_hda.h         |    0
 .../codecs/side-codecs}/tas2781_hda_i2c.c     |    2 +-
 .../codecs/side-codecs}/tas2781_hda_spi.c     |    2 +-
 .../codecs/sigmatel.c}                        |  402 +-
 .../{pci/hda/patch_via.c => hda/codecs/via.c} |  447 +-
 sound/hda/common/Kconfig                      |   97 +
 sound/hda/common/Makefile                     |   13 +
 .../common/auto_parser.c}                     |    0
 .../{pci/hda/hda_beep.c => hda/common/beep.c} |    0
 .../{pci/hda/hda_bind.c => hda/common/bind.c} |   29 +-
 .../hda/hda_codec.c => hda/common/codec.c}    |   57 +-
 .../common/controller.c}                      |    2 +-
 .../common/controller_trace.h}                |    2 +-
 .../{pci/hda => hda/common}/hda_auto_parser.h |    0
 sound/{pci/hda => hda/common}/hda_beep.h      |    0
 .../{pci/hda => hda/common}/hda_controller.h  |    0
 sound/{pci/hda => hda/common}/hda_jack.h      |    0
 sound/{pci/hda => hda/common}/hda_local.h     |   13 +-
 .../hda/hda_hwdep.c => hda/common/hwdep.c}    |    0
 .../{pci/hda/hda_jack.c => hda/common/jack.c} |    0
 .../{pci/hda/hda_proc.c => hda/common/proc.c} |    0
 .../hda/hda_sysfs.c => hda/common/sysfs.c}    |    0
 sound/hda/controllers/Kconfig                 |   42 +
 sound/hda/controllers/Makefile                |   13 +
 .../hda/hda_acpi.c => hda/controllers/acpi.c} |    0
 .../hda_intel.c => hda/controllers/intel.c}   |    5 +-
 .../hda_intel.h => hda/controllers/intel.h}   |    0
 .../controllers/intel_trace.h}                |    2 +-
 .../hda_tegra.c => hda/controllers/tegra.c}   |    0
 sound/hda/core/Kconfig                        |   51 +
 sound/hda/core/Makefile                       |   22 +
 sound/hda/{ => core}/array.c                  |    0
 sound/hda/{hdac_bus.c => core/bus.c}          |    0
 .../{hdac_component.c => core/component.c}    |    0
 .../{hdac_controller.c => core/controller.c}  |    0
 sound/hda/{hdac_device.c => core/device.c}    |    8 +-
 sound/hda/{ => core}/ext/Makefile             |    2 +-
 .../{ext/hdac_ext_bus.c => core/ext/bus.c}    |    0
 .../ext/controller.c}                         |    0
 .../hdac_ext_stream.c => core/ext/stream.c}   |    0
 sound/hda/{ => core}/hda_bus_type.c           |    0
 sound/hda/{ => core}/hdmi_chmap.c             |    0
 sound/hda/{hdac_i915.c => core/i915.c}        |    0
 sound/hda/{ => core}/intel-dsp-config.c       |    0
 sound/hda/{ => core}/intel-nhlt.c             |    0
 sound/hda/{ => core}/intel-sdw-acpi.c         |    0
 sound/hda/{ => core}/local.h                  |   21 -
 sound/hda/{hdac_regmap.c => core/regmap.c}    |    0
 sound/hda/{hdac_stream.c => core/stream.c}    |    0
 sound/hda/{hdac_sysfs.c => core/sysfs.c}      |   14 +-
 sound/hda/{ => core}/trace.c                  |    0
 sound/hda/{ => core}/trace.h                  |    0
 sound/pci/Kconfig                             |    2 -
 sound/pci/Makefile                            |    1 -
 sound/pci/hda/Kconfig                         |  436 --
 sound/pci/hda/Makefile                        |   84 -
 sound/pci/hda/patch_hdmi.c                    | 4695 -------------
 sound/soc/codecs/hda.c                        |   17 +-
 sound/soc/codecs/hdac_hda.c                   |   29 +-
 sound/soc/codecs/hdac_hdmi.c                  |   21 +-
 132 files changed, 14057 insertions(+), 12751 deletions(-)
 create mode 100644 sound/hda/codecs/Kconfig
 create mode 100644 sound/hda/codecs/Makefile
 rename sound/{pci/hda/patch_analog.c => hda/codecs/analog.c} (90%)
 rename sound/{pci/hda/patch_ca0110.c => hda/codecs/ca0110.c} (75%)
 rename sound/{pci/hda/patch_ca0132.c => hda/codecs/ca0132.c} (99%)
 rename sound/{pci/hda => hda/codecs}/ca0132_regs.h (99%)
 create mode 100644 sound/hda/codecs/cirrus/Kconfig
 create mode 100644 sound/hda/codecs/cirrus/Makefile
 rename sound/{pci/hda/patch_cirrus.c => hda/codecs/cirrus/cs420x.c} (61%)
 create mode 100644 sound/hda/codecs/cirrus/cs421x.c
 rename sound/{pci/hda/patch_cs8409-tables.c => hda/codecs/cirrus/cs8409-tables.c} (99%)
 rename sound/{pci/hda/patch_cs8409.c => hda/codecs/cirrus/cs8409.c} (98%)
 rename sound/{pci/hda/patch_cs8409.h => hda/codecs/cirrus/cs8409.h} (98%)
 rename sound/{pci/hda/patch_cmedia.c => hda/codecs/cm9825.c} (73%)
 create mode 100644 sound/hda/codecs/cmedia.c
 rename sound/{pci/hda/patch_conexant.c => hda/codecs/conexant.c} (93%)
 rename sound/{pci/hda/hda_generic.c => hda/codecs/generic.c} (99%)
 rename sound/{pci/hda/hda_generic.h => hda/codecs/generic.h} (99%)
 create mode 100644 sound/hda/codecs/hdmi/Kconfig
 create mode 100644 sound/hda/codecs/hdmi/Makefile
 create mode 100644 sound/hda/codecs/hdmi/atihdmi.c
 rename sound/{pci/hda/hda_eld.c => hda/codecs/hdmi/eld.c} (51%)
 create mode 100644 sound/hda/codecs/hdmi/hdmi.c
 create mode 100644 sound/hda/codecs/hdmi/hdmi_local.h
 create mode 100644 sound/hda/codecs/hdmi/intelhdmi.c
 create mode 100644 sound/hda/codecs/hdmi/nvhdmi-mcp.c
 create mode 100644 sound/hda/codecs/hdmi/nvhdmi.c
 create mode 100644 sound/hda/codecs/hdmi/simplehdmi.c
 create mode 100644 sound/hda/codecs/hdmi/tegrahdmi.c
 rename sound/{pci/hda/hp_x360_helper.c => hda/codecs/helpers/hp_x360.c} (100%)
 rename sound/{pci/hda/ideapad_hotkey_led_helper.c => hda/codecs/helpers/ideapad_hotkey_led.c} (100%)
 rename sound/{pci/hda/ideapad_s740_helper.c => hda/codecs/helpers/ideapad_s740.c} (100%)
 rename sound/{pci/hda/thinkpad_helper.c => hda/codecs/helpers/thinkpad.c} (100%)
 create mode 100644 sound/hda/codecs/realtek/Kconfig
 create mode 100644 sound/hda/codecs/realtek/Makefile
 create mode 100644 sound/hda/codecs/realtek/alc260.c
 create mode 100644 sound/hda/codecs/realtek/alc262.c
 create mode 100644 sound/hda/codecs/realtek/alc268.c
 rename sound/{pci/hda/patch_realtek.c => hda/codecs/realtek/alc269.c} (63%)
 create mode 100644 sound/hda/codecs/realtek/alc662.c
 create mode 100644 sound/hda/codecs/realtek/alc680.c
 create mode 100644 sound/hda/codecs/realtek/alc861.c
 create mode 100644 sound/hda/codecs/realtek/alc861vd.c
 create mode 100644 sound/hda/codecs/realtek/alc880.c
 create mode 100644 sound/hda/codecs/realtek/alc882.c
 create mode 100644 sound/hda/codecs/realtek/realtek.c
 create mode 100644 sound/hda/codecs/realtek/realtek.h
 rename sound/{pci/hda/patch_senarytech.c => hda/codecs/senarytech.c} (87%)
 rename sound/{pci/hda/patch_si3054.c => hda/codecs/si3054.c} (88%)
 create mode 100644 sound/hda/codecs/side-codecs/Kconfig
 create mode 100644 sound/hda/codecs/side-codecs/Makefile
 rename sound/{pci/hda => hda/codecs/side-codecs}/cirrus_scodec.c (100%)
 rename sound/{pci/hda => hda/codecs/side-codecs}/cirrus_scodec.h (100%)
 rename sound/{pci/hda => hda/codecs/side-codecs}/cirrus_scodec_test.c (100%)
 rename sound/{pci/hda => hda/codecs/side-codecs}/cs35l41_hda.c (99%)
 rename sound/{pci/hda => hda/codecs/side-codecs}/cs35l41_hda.h (100%)
 rename sound/{pci/hda => hda/codecs/side-codecs}/cs35l41_hda_i2c.c (100%)
 rename sound/{pci/hda => hda/codecs/side-codecs}/cs35l41_hda_property.c (100%)
 rename sound/{pci/hda => hda/codecs/side-codecs}/cs35l41_hda_property.h (100%)
 rename sound/{pci/hda => hda/codecs/side-codecs}/cs35l41_hda_spi.c (100%)
 rename sound/{pci/hda => hda/codecs/side-codecs}/cs35l56_hda.c (99%)
 rename sound/{pci/hda => hda/codecs/side-codecs}/cs35l56_hda.h (100%)
 rename sound/{pci/hda => hda/codecs/side-codecs}/cs35l56_hda_i2c.c (100%)
 rename sound/{pci/hda => hda/codecs/side-codecs}/cs35l56_hda_spi.c (100%)
 rename sound/{pci/hda => hda/codecs/side-codecs}/hda_component.c (100%)
 rename sound/{pci/hda => hda/codecs/side-codecs}/hda_component.h (100%)
 rename sound/{pci/hda => hda/codecs/side-codecs}/tas2781_hda.c (100%)
 rename sound/{pci/hda => hda/codecs/side-codecs}/tas2781_hda.h (100%)
 rename sound/{pci/hda => hda/codecs/side-codecs}/tas2781_hda_i2c.c (99%)
 rename sound/{pci/hda => hda/codecs/side-codecs}/tas2781_hda_spi.c (99%)
 rename sound/{pci/hda/patch_sigmatel.c => hda/codecs/sigmatel.c} (94%)
 rename sound/{pci/hda/patch_via.c => hda/codecs/via.c} (78%)
 create mode 100644 sound/hda/common/Kconfig
 create mode 100644 sound/hda/common/Makefile
 rename sound/{pci/hda/hda_auto_parser.c => hda/common/auto_parser.c} (100%)
 rename sound/{pci/hda/hda_beep.c => hda/common/beep.c} (100%)
 rename sound/{pci/hda/hda_bind.c => hda/common/bind.c} (93%)
 rename sound/{pci/hda/hda_codec.c => hda/common/codec.c} (98%)
 rename sound/{pci/hda/hda_controller.c => hda/common/controller.c} (99%)
 rename sound/{pci/hda/hda_controller_trace.h => hda/common/controller_trace.h} (97%)
 rename sound/{pci/hda => hda/common}/hda_auto_parser.h (100%)
 rename sound/{pci/hda => hda/common}/hda_beep.h (100%)
 rename sound/{pci/hda => hda/common}/hda_controller.h (100%)
 rename sound/{pci/hda => hda/common}/hda_jack.h (100%)
 rename sound/{pci/hda => hda/common}/hda_local.h (99%)
 rename sound/{pci/hda/hda_hwdep.c => hda/common/hwdep.c} (100%)
 rename sound/{pci/hda/hda_jack.c => hda/common/jack.c} (100%)
 rename sound/{pci/hda/hda_proc.c => hda/common/proc.c} (100%)
 rename sound/{pci/hda/hda_sysfs.c => hda/common/sysfs.c} (100%)
 create mode 100644 sound/hda/controllers/Kconfig
 create mode 100644 sound/hda/controllers/Makefile
 rename sound/{pci/hda/hda_acpi.c => hda/controllers/acpi.c} (100%)
 rename sound/{pci/hda/hda_intel.c => hda/controllers/intel.c} (99%)
 rename sound/{pci/hda/hda_intel.h => hda/controllers/intel.h} (100%)
 rename sound/{pci/hda/hda_intel_trace.h => hda/controllers/intel_trace.h} (95%)
 rename sound/{pci/hda/hda_tegra.c => hda/controllers/tegra.c} (100%)
 create mode 100644 sound/hda/core/Kconfig
 create mode 100644 sound/hda/core/Makefile
 rename sound/hda/{ => core}/array.c (100%)
 rename sound/hda/{hdac_bus.c => core/bus.c} (100%)
 rename sound/hda/{hdac_component.c => core/component.c} (100%)
 rename sound/hda/{hdac_controller.c => core/controller.c} (100%)
 rename sound/hda/{hdac_device.c => core/device.c} (99%)
 rename sound/hda/{ => core}/ext/Makefile (54%)
 rename sound/hda/{ext/hdac_ext_bus.c => core/ext/bus.c} (100%)
 rename sound/hda/{ext/hdac_ext_controller.c => core/ext/controller.c} (100%)
 rename sound/hda/{ext/hdac_ext_stream.c => core/ext/stream.c} (100%)
 rename sound/hda/{ => core}/hda_bus_type.c (100%)
 rename sound/hda/{ => core}/hdmi_chmap.c (100%)
 rename sound/hda/{hdac_i915.c => core/i915.c} (100%)
 rename sound/hda/{ => core}/intel-dsp-config.c (100%)
 rename sound/hda/{ => core}/intel-nhlt.c (100%)
 rename sound/hda/{ => core}/intel-sdw-acpi.c (100%)
 rename sound/hda/{ => core}/local.h (66%)
 rename sound/hda/{hdac_regmap.c => core/regmap.c} (100%)
 rename sound/hda/{hdac_stream.c => core/stream.c} (100%)
 rename sound/hda/{hdac_sysfs.c => core/sysfs.c} (95%)
 rename sound/hda/{ => core}/trace.c (100%)
 rename sound/hda/{ => core}/trace.h (100%)
 delete mode 100644 sound/pci/hda/Kconfig
 delete mode 100644 sound/pci/hda/Makefile
 delete mode 100644 sound/pci/hda/patch_hdmi.c

-- 
2.50.0

