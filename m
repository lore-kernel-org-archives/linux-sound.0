Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CD7B2557A
	for <linux-sound@vger.kernel.org>; Wed,  9 Jul 2025 16:05:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752077150; cv=none; b=kEWaMS45+4vgJKi24ybODo9Ut4BlMgOV/irJ96WTiL04qrf3I9D+eIppZB0+tm90u/4dDXHLMjTDD1CO1dhRuL/Yv8h4eJMXybezKhPjtGuuXULCaB91Uq2o4XSw91WwWFOv0H41rAhYdpajurUcJ4RxdW6phl46wKCsfHrKY4M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752077150; c=relaxed/simple;
	bh=kp1s91jbQ5zTiOAtiegQ2LtpR933vK+6rPN/VlP9aPI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=XtpKx0ma/oucwbs1RaCzLEh4kY1cQTW+TPlfrabvld4+mF1DcTe/PWFGs3WleJp7bwzy5HNFfjQL4FqfmQ6STAkDPat+HtK7ET+mReoQIakQJZsZu2g5md/4ZyQ9BwdYyMwsJcEH3Z0o1wNBjwsjfhoiE70IRrQwj/uBY+Qgcw4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=W289Aa4C; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=uUBJ11XR; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=W289Aa4C; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=uUBJ11XR; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="W289Aa4C";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="uUBJ11XR";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="W289Aa4C";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="uUBJ11XR"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 786F91F385;
	Wed,  9 Jul 2025 16:04:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1752077088; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=N93T/oCML8bpR3jPQqZJ8rpPJRUZWtaqCHI3g48Qhe4=;
	b=W289Aa4C4o3EutLN/AhJenKPxoGJhPJpiyHJELBHuRwjusJPSHLxbQT9Z9+vWifpgj6DVo
	fWGAaJ/2ohGrPQvvKMD/NWwtT1LdtavBFQHHXWzD60kW3M72irHnxeBDVEuws34HFCXpcU
	hUnS2BE41+qMO+Is18v97oIs63dOIdk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1752077088;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=N93T/oCML8bpR3jPQqZJ8rpPJRUZWtaqCHI3g48Qhe4=;
	b=uUBJ11XR+SrJ+a2cEpQZ+/LpcawTNWfnGkUdoQWDs7iQVZ1WyLoPg/ZX9vt/bsuQq1ZpqR
	jq3yd1Wg3Q44JdAA==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=W289Aa4C;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=uUBJ11XR
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1752077088; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=N93T/oCML8bpR3jPQqZJ8rpPJRUZWtaqCHI3g48Qhe4=;
	b=W289Aa4C4o3EutLN/AhJenKPxoGJhPJpiyHJELBHuRwjusJPSHLxbQT9Z9+vWifpgj6DVo
	fWGAaJ/2ohGrPQvvKMD/NWwtT1LdtavBFQHHXWzD60kW3M72irHnxeBDVEuws34HFCXpcU
	hUnS2BE41+qMO+Is18v97oIs63dOIdk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1752077088;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=N93T/oCML8bpR3jPQqZJ8rpPJRUZWtaqCHI3g48Qhe4=;
	b=uUBJ11XR+SrJ+a2cEpQZ+/LpcawTNWfnGkUdoQWDs7iQVZ1WyLoPg/ZX9vt/bsuQq1ZpqR
	jq3yd1Wg3Q44JdAA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 2BC86136DC;
	Wed,  9 Jul 2025 16:04:48 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id iEx8CSCTbmhDEAAAD6G6ig
	(envelope-from <tiwai@suse.de>); Wed, 09 Jul 2025 16:04:48 +0000
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
Subject: [PATCH 06/27] ALSA: hda: Move codec drivers into sound/hda/codecs directory
Date: Wed,  9 Jul 2025 18:04:09 +0200
Message-ID: <20250709160434.1859-7-tiwai@suse.de>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <20250709160434.1859-1-tiwai@suse.de>
References: <20250709160434.1859-1-tiwai@suse.de>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Level: 
X-Spam-Flag: NO
X-Rspamd-Queue-Id: 786F91F385
X-Rspamd-Action: no action
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spamd-Result: default: False [-3.01 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo,suse.de:dkim,suse.de:mid,suse.de:email];
	ARC_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	RCPT_COUNT_SEVEN(0.00)[9];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_EQ_ENVFROM(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	RCVD_TLS_ALL(0.00)[];
	R_RATELIMIT(0.00)[to_ip_from(RL53w3f6h5bdz1qypc3i64rty7)];
	DKIM_TRACE(0.00)[suse.de:+]
X-Spam-Score: -3.01

Now move the all remaining codec drivers from sound/pci/hda to
sound/hda/codecs subdirectory.  Some drivers are put under the further
vendor subdirectory, and the vendor helper code (*_helper.c) are put
under helpers subdirectory.  Also the sub-codec drivers are moved under
a different subdirectory, sound/hda/codecs/sub-codecs, for
distinguishing from the main HD-audio codec drivers.

The prefix patch_ and hda_ as well as the suffix _helper are dropped
from file names as they are mostly superfluous.

No functional changes but just file path shuffling.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/hda/Kconfig                             |   1 +
 sound/hda/Makefile                            |   1 +
 sound/{pci/hda => hda/codecs}/Kconfig         | 158 +-----------------
 sound/hda/codecs/Makefile                     |  31 ++++
 .../patch_analog.c => hda/codecs/analog.c}    |   2 +-
 .../patch_ca0110.c => hda/codecs/ca0110.c}    |   2 +-
 .../patch_ca0132.c => hda/codecs/ca0132.c}    |   2 +-
 sound/{pci/hda => hda/codecs}/ca0132_regs.h   |   0
 sound/hda/codecs/cirrus/Kconfig               |  21 +++
 sound/hda/codecs/cirrus/Makefile              |   8 +
 .../codecs/cirrus/cirrus.c}                   |   2 +-
 .../codecs/cirrus/cs8409-tables.c}            |   4 +-
 .../codecs/cirrus/cs8409.c}                   |   2 +-
 .../codecs/cirrus/cs8409.h}                   |   2 +-
 .../patch_cmedia.c => hda/codecs/cmedia.c}    |   2 +-
 .../codecs/conexant.c}                        |   6 +-
 .../hda_generic.c => hda/codecs/generic.c}    |   2 +-
 .../hda_generic.h => hda/codecs/generic.h}    |   0
 sound/hda/codecs/hdmi/Makefile                |   6 +
 .../hda/hda_eld.c => hda/codecs/hdmi/eld.c}   |   0
 .../patch_hdmi.c => hda/codecs/hdmi/hdmi.c}   |   2 +-
 .../codecs/helpers/hp_x360.c}                 |   0
 .../codecs/helpers/ideapad_hotkey_led.c}      |   0
 .../codecs/helpers/ideapad_s740.c}            |   0
 .../codecs/helpers/thinkpad.c}                |   0
 .../patch_realtek.c => hda/codecs/realtek.c}  |  12 +-
 .../codecs/senarytech.c}                      |   4 +-
 .../patch_si3054.c => hda/codecs/si3054.c}    |   0
 sound/hda/codecs/side-codecs/Kconfig          | 128 ++++++++++++++
 sound/hda/codecs/side-codecs/Makefile         |  28 ++++
 .../codecs/side-codecs}/cirrus_scodec.c       |   0
 .../codecs/side-codecs}/cirrus_scodec.h       |   0
 .../codecs/side-codecs}/cirrus_scodec_test.c  |   0
 .../codecs/side-codecs}/cs35l41_hda.c         |   2 +-
 .../codecs/side-codecs}/cs35l41_hda.h         |   0
 .../codecs/side-codecs}/cs35l41_hda_i2c.c     |   0
 .../side-codecs}/cs35l41_hda_property.c       |   0
 .../side-codecs}/cs35l41_hda_property.h       |   0
 .../codecs/side-codecs}/cs35l41_hda_spi.c     |   0
 .../codecs/side-codecs}/cs35l56_hda.c         |   2 +-
 .../codecs/side-codecs}/cs35l56_hda.h         |   0
 .../codecs/side-codecs}/cs35l56_hda_i2c.c     |   0
 .../codecs/side-codecs}/cs35l56_hda_spi.c     |   0
 .../codecs/side-codecs}/hda_component.c       |   0
 .../codecs/side-codecs}/hda_component.h       |   0
 .../codecs/side-codecs}/tas2781_hda.c         |   0
 .../codecs/side-codecs}/tas2781_hda.h         |   0
 .../codecs/side-codecs}/tas2781_hda_i2c.c     |   2 +-
 .../codecs/side-codecs}/tas2781_hda_spi.c     |   2 +-
 .../codecs/sigmatel.c}                        |   4 +-
 .../{pci/hda/patch_via.c => hda/codecs/via.c} |   2 +-
 sound/pci/Kconfig                             |   2 -
 sound/pci/Makefile                            |   1 -
 sound/pci/hda/Makefile                        |  61 -------
 54 files changed, 257 insertions(+), 247 deletions(-)
 rename sound/{pci/hda => hda/codecs}/Kconfig (55%)
 create mode 100644 sound/hda/codecs/Makefile
 rename sound/{pci/hda/patch_analog.c => hda/codecs/analog.c} (99%)
 rename sound/{pci/hda/patch_ca0110.c => hda/codecs/ca0110.c} (98%)
 rename sound/{pci/hda/patch_ca0132.c => hda/codecs/ca0132.c} (99%)
 rename sound/{pci/hda => hda/codecs}/ca0132_regs.h (100%)
 create mode 100644 sound/hda/codecs/cirrus/Kconfig
 create mode 100644 sound/hda/codecs/cirrus/Makefile
 rename sound/{pci/hda/patch_cirrus.c => hda/codecs/cirrus/cirrus.c} (99%)
 rename sound/{pci/hda/patch_cs8409-tables.c => hda/codecs/cirrus/cs8409-tables.c} (99%)
 rename sound/{pci/hda/patch_cs8409.c => hda/codecs/cirrus/cs8409.c} (99%)
 rename sound/{pci/hda/patch_cs8409.h => hda/codecs/cirrus/cs8409.h} (99%)
 rename sound/{pci/hda/patch_cmedia.c => hda/codecs/cmedia.c} (99%)
 rename sound/{pci/hda/patch_conexant.c => hda/codecs/conexant.c} (99%)
 rename sound/{pci/hda/hda_generic.c => hda/codecs/generic.c} (99%)
 rename sound/{pci/hda/hda_generic.h => hda/codecs/generic.h} (100%)
 create mode 100644 sound/hda/codecs/hdmi/Makefile
 rename sound/{pci/hda/hda_eld.c => hda/codecs/hdmi/eld.c} (100%)
 rename sound/{pci/hda/patch_hdmi.c => hda/codecs/hdmi/hdmi.c} (99%)
 rename sound/{pci/hda/hp_x360_helper.c => hda/codecs/helpers/hp_x360.c} (100%)
 rename sound/{pci/hda/ideapad_hotkey_led_helper.c => hda/codecs/helpers/ideapad_hotkey_led.c} (100%)
 rename sound/{pci/hda/ideapad_s740_helper.c => hda/codecs/helpers/ideapad_s740.c} (100%)
 rename sound/{pci/hda/thinkpad_helper.c => hda/codecs/helpers/thinkpad.c} (100%)
 rename sound/{pci/hda/patch_realtek.c => hda/codecs/realtek.c} (99%)
 rename sound/{pci/hda/patch_senarytech.c => hda/codecs/senarytech.c} (98%)
 rename sound/{pci/hda/patch_si3054.c => hda/codecs/si3054.c} (100%)
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
 rename sound/{pci/hda/patch_sigmatel.c => hda/codecs/sigmatel.c} (99%)
 rename sound/{pci/hda/patch_via.c => hda/codecs/via.c} (99%)
 delete mode 100644 sound/pci/hda/Makefile

diff --git a/sound/hda/Kconfig b/sound/hda/Kconfig
index d360c884bd6d..7797f44b3d0c 100644
--- a/sound/hda/Kconfig
+++ b/sound/hda/Kconfig
@@ -3,6 +3,7 @@ menu "HD-Audio"
 
 source "sound/hda/common/Kconfig"
 source "sound/hda/controllers/Kconfig"
+source "sound/hda/codecs/Kconfig"
 source "sound/hda/core/Kconfig"
 
 endmenu
diff --git a/sound/hda/Makefile b/sound/hda/Makefile
index fc76086a1f5e..31b9fbedaa77 100644
--- a/sound/hda/Makefile
+++ b/sound/hda/Makefile
@@ -1,6 +1,7 @@
 # SPDX-License-Identifier: GPL-2.0
 obj-y += core/
 obj-$(CONFIG_SND_HDA) += common/
+obj-$(CONFIG_SND_HDA) += codecs/
 # this must be the last entry after codec drivers;
 # otherwise the codec patches won't be hooked before the PCI probe
 # when built in kernel
diff --git a/sound/pci/hda/Kconfig b/sound/hda/codecs/Kconfig
similarity index 55%
rename from sound/pci/hda/Kconfig
rename to sound/hda/codecs/Kconfig
index a5d345514cf3..bac19a664be0 100644
--- a/sound/pci/hda/Kconfig
+++ b/sound/hda/codecs/Kconfig
@@ -1,140 +1,9 @@
 # SPDX-License-Identifier: GPL-2.0-only
-menu "HD-Audio"
+if SND_HDA
 
 config SND_HDA_GENERIC_LEDS
        bool
 
-if SND_HDA
-
-config SND_HDA_CIRRUS_SCODEC
-	tristate
-
-config SND_HDA_CIRRUS_SCODEC_KUNIT_TEST
-	tristate "KUnit test for Cirrus side-codec library" if !KUNIT_ALL_TESTS
-	depends on SND_HDA_CIRRUS_SCODEC && GPIOLIB && KUNIT
-	default KUNIT_ALL_TESTS
-	help
-	  This builds KUnit tests for the cirrus side-codec library.
-	  For more information on KUnit and unit tests in general,
-	  please refer to the KUnit documentation in
-	  Documentation/dev-tools/kunit/.
-	  If in doubt, say "N".
-
-config SND_HDA_SCODEC_CS35L41
-	tristate
-	select SND_HDA_GENERIC
-	select REGMAP_IRQ
-	select FW_CS_DSP
-
-config SND_HDA_SCODEC_COMPONENT
-	tristate
-
-config SND_HDA_SCODEC_CS35L41_I2C
-	tristate "Build CS35L41 HD-audio side codec support for I2C Bus"
-	depends on I2C
-	depends on ACPI
-	depends on EFI
-	depends on SND_SOC
-	select SND_SOC_CS35L41_LIB
-	select SND_HDA_SCODEC_CS35L41
-	select SND_SOC_CS_AMP_LIB
-	help
-	  Say Y or M here to include CS35L41 I2C HD-audio side codec support
-	  in snd-hda-intel driver, such as ALC287.
-
-comment "Set to Y if you want auto-loading the side codec driver"
-	depends on SND_HDA=y && SND_HDA_SCODEC_CS35L41_I2C=m
-
-config SND_HDA_SCODEC_CS35L41_SPI
-	tristate "Build CS35L41 HD-audio codec support for SPI Bus"
-	depends on SPI_MASTER
-	depends on ACPI
-	depends on EFI
-	depends on SND_SOC
-	select SND_SOC_CS35L41_LIB
-	select SND_HDA_SCODEC_CS35L41
-	select SND_SOC_CS_AMP_LIB
-	help
-	  Say Y or M here to include CS35L41 SPI HD-audio side codec support
-	  in snd-hda-intel driver, such as ALC287.
-
-comment "Set to Y if you want auto-loading the side codec driver"
-	depends on SND_HDA=y && SND_HDA_SCODEC_CS35L41_SPI=m
-
-config SND_HDA_SCODEC_CS35L56
-	tristate
-
-config SND_HDA_SCODEC_CS35L56_I2C
-	tristate "Build CS35L56 HD-audio side codec support for I2C Bus"
-	depends on I2C
-	depends on ACPI
-	depends on SND_SOC
-	select FW_CS_DSP
-	imply SERIAL_MULTI_INSTANTIATE
-	select SND_HDA_GENERIC
-	select SND_SOC_CS35L56_SHARED
-	select SND_HDA_SCODEC_CS35L56
-	select SND_HDA_CIRRUS_SCODEC
-	select SND_SOC_CS_AMP_LIB
-	help
-	  Say Y or M here to include CS35L56 amplifier support with
-	  I2C control.
-
-config SND_HDA_SCODEC_CS35L56_SPI
-	tristate "Build CS35L56 HD-audio side codec support for SPI Bus"
-	depends on SPI_MASTER
-	depends on ACPI
-	depends on SND_SOC
-	select FW_CS_DSP
-	imply SERIAL_MULTI_INSTANTIATE
-	select SND_HDA_GENERIC
-	select SND_SOC_CS35L56_SHARED
-	select SND_HDA_SCODEC_CS35L56
-	select SND_HDA_CIRRUS_SCODEC
-	select SND_SOC_CS_AMP_LIB
-	help
-	  Say Y or M here to include CS35L56 amplifier support with
-	  SPI control.
-
-config SND_HDA_SCODEC_TAS2781
-	tristate
-	select SND_HDA_GENERIC
-
-config SND_HDA_SCODEC_TAS2781_I2C
-	tristate "Build TAS2781 HD-audio side codec support for I2C Bus"
-	depends on I2C
-	depends on ACPI
-	depends on EFI
-	depends on SND_SOC
-	select SND_HDA_SCODEC_TAS2781
-	select SND_SOC_TAS2781_COMLIB_I2C
-	select SND_SOC_TAS2781_FMWLIB
-	select CRC32
-	help
-	  Say Y or M here to include TAS2781 I2C HD-audio side codec support
-	  in snd-hda-intel driver, such as ALC287.
-
-comment "Set to Y if you want auto-loading the side codec driver"
-	depends on SND_HDA=y && SND_HDA_SCODEC_TAS2781_I2C=m
-
-config SND_HDA_SCODEC_TAS2781_SPI
-	tristate "Build TAS2781 HD-audio side codec support for SPI Bus"
-	depends on SPI_MASTER
-	depends on ACPI
-	depends on EFI
-	depends on SND_SOC
-	select SND_HDA_SCODEC_TAS2781
-	select SND_SOC_TAS2781_COMLIB
-	select SND_SOC_TAS2781_FMWLIB
-	select CRC8
-	select CRC32
-	help
-	  Say Y or M here to include TAS2781 SPI HD-audio side codec support
-	  in snd-hda-intel driver, such as ALC287.
-
-comment "Set to Y if you want auto-loading the side codec driver"
-	depends on SND_HDA=y && SND_HDA_SCODEC_TAS2781_SPI=m
-
 config SND_HDA_CODEC_REALTEK
 	tristate "Build Realtek HD-audio codec support"
 	depends on INPUT
@@ -194,26 +63,6 @@ config SND_HDA_CODEC_HDMI
 comment "Set to Y if you want auto-loading the codec driver"
 	depends on SND_HDA=y && SND_HDA_CODEC_HDMI=m
 
-config SND_HDA_CODEC_CIRRUS
-	tristate "Build Cirrus Logic codec support"
-	select SND_HDA_GENERIC
-	help
-	  Say Y or M here to include Cirrus Logic codec support in
-	  snd-hda-intel driver, such as CS4206.
-
-comment "Set to Y if you want auto-loading the codec driver"
-	depends on SND_HDA=y && SND_HDA_CODEC_CIRRUS=m
-
-config SND_HDA_CODEC_CS8409
-	tristate "Build Cirrus Logic HDA bridge support"
-	select SND_HDA_GENERIC
-	help
-	  Say Y or M here to include Cirrus Logic HDA bridge support in
-	  snd-hda-intel driver, such as CS8409.
-
-comment "Set to Y if you want auto-loading the codec driver"
-	depends on SND_HDA=y && SND_HDA_CODEC_CS8409=m
-
 config SND_HDA_CODEC_CONEXANT
 	tristate "Build Conexant HD-audio codec support"
 	select SND_HDA_GENERIC
@@ -313,6 +162,7 @@ config SND_HDA_INTEL_HDMI_SILENT_STREAM
 	  This feature can impact power consumption as resources
 	  are kept reserved both at transmitter and receiver.
 
-endif
+source "sound/hda/codecs/cirrus/Kconfig"
+source "sound/hda/codecs/side-codecs/Kconfig"
 
-endmenu
+endif # SND_HDA
diff --git a/sound/hda/codecs/Makefile b/sound/hda/codecs/Makefile
new file mode 100644
index 000000000000..205cd1373b42
--- /dev/null
+++ b/sound/hda/codecs/Makefile
@@ -0,0 +1,31 @@
+# SPDX-License-Identifier: GPL-2.0
+subdir-ccflags-y += -I$(src)/../common
+
+snd-hda-codec-generic-y :=	generic.o
+snd-hda-codec-analog-y :=	analog.o
+snd-hda-codec-ca0110-y :=	ca0110.o
+snd-hda-codec-ca0132-y :=	ca0132.o
+snd-hda-codec-cmedia-y :=	cmedia.o
+snd-hda-codec-conexant-y :=	conexant.o
+snd-hda-codec-idt-y :=		sigmatel.o
+snd-hda-codec-realtek-y :=	realtek.o
+snd-hda-codec-senarytech-y :=	senarytech.o
+snd-hda-codec-si3054-y :=	si3054.o
+snd-hda-codec-via-y :=		via.o
+
+obj-y += cirrus/
+obj-y += hdmi/
+obj-y += side-codecs/
+
+# codec drivers
+obj-$(CONFIG_SND_HDA_GENERIC) += snd-hda-codec-generic.o
+obj-$(CONFIG_SND_HDA_CODEC_ANALOG) += snd-hda-codec-analog.o
+obj-$(CONFIG_SND_HDA_CODEC_CA0110) += snd-hda-codec-ca0110.o
+obj-$(CONFIG_SND_HDA_CODEC_CA0132) += snd-hda-codec-ca0132.o
+obj-$(CONFIG_SND_HDA_CODEC_CMEDIA) += snd-hda-codec-cmedia.o
+obj-$(CONFIG_SND_HDA_CODEC_CONEXANT) += snd-hda-codec-conexant.o
+obj-$(CONFIG_SND_HDA_CODEC_SIGMATEL) += snd-hda-codec-idt.o
+obj-$(CONFIG_SND_HDA_CODEC_REALTEK) += snd-hda-codec-realtek.o
+obj-$(CONFIG_SND_HDA_CODEC_SENARYTECH) += snd-hda-codec-senarytech.o
+obj-$(CONFIG_SND_HDA_CODEC_SI3054) += snd-hda-codec-si3054.o
+obj-$(CONFIG_SND_HDA_CODEC_VIA) += snd-hda-codec-via.o
diff --git a/sound/pci/hda/patch_analog.c b/sound/hda/codecs/analog.c
similarity index 99%
rename from sound/pci/hda/patch_analog.c
rename to sound/hda/codecs/analog.c
index 56354fe060a1..3557e06c6d2b 100644
--- a/sound/pci/hda/patch_analog.c
+++ b/sound/hda/codecs/analog.c
@@ -16,7 +16,7 @@
 #include "hda_auto_parser.h"
 #include "hda_beep.h"
 #include "hda_jack.h"
-#include "hda_generic.h"
+#include "generic.h"
 
 
 struct ad198x_spec {
diff --git a/sound/pci/hda/patch_ca0110.c b/sound/hda/codecs/ca0110.c
similarity index 98%
rename from sound/pci/hda/patch_ca0110.c
rename to sound/hda/codecs/ca0110.c
index 1818ce67f761..0353544435b9 100644
--- a/sound/pci/hda/patch_ca0110.c
+++ b/sound/hda/codecs/ca0110.c
@@ -13,7 +13,7 @@
 #include "hda_local.h"
 #include "hda_auto_parser.h"
 #include "hda_jack.h"
-#include "hda_generic.h"
+#include "generic.h"
 
 
 static const struct hda_codec_ops ca0110_patch_ops = {
diff --git a/sound/pci/hda/patch_ca0132.c b/sound/hda/codecs/ca0132.c
similarity index 99%
rename from sound/pci/hda/patch_ca0132.c
rename to sound/hda/codecs/ca0132.c
index 686ce0947131..35a979465c75 100644
--- a/sound/pci/hda/patch_ca0132.c
+++ b/sound/hda/codecs/ca0132.c
@@ -4,7 +4,7 @@
  *
  * Copyright (c) 2011, Creative Technology Ltd.
  *
- * Based on patch_ca0110.c
+ * Based on ca0110.c
  * Copyright (c) 2008 Takashi Iwai <tiwai@suse.de>
  */
 
diff --git a/sound/pci/hda/ca0132_regs.h b/sound/hda/codecs/ca0132_regs.h
similarity index 100%
rename from sound/pci/hda/ca0132_regs.h
rename to sound/hda/codecs/ca0132_regs.h
diff --git a/sound/hda/codecs/cirrus/Kconfig b/sound/hda/codecs/cirrus/Kconfig
new file mode 100644
index 000000000000..f6cefb65c5f8
--- /dev/null
+++ b/sound/hda/codecs/cirrus/Kconfig
@@ -0,0 +1,21 @@
+# SPDX-License-Identifier: GPL-2.0-only
+
+config SND_HDA_CODEC_CIRRUS
+	tristate "Build Cirrus Logic codec support"
+	select SND_HDA_GENERIC
+	help
+	  Say Y or M here to include Cirrus Logic codec support in
+	  snd-hda-intel driver, such as CS4206.
+
+comment "Set to Y if you want auto-loading the codec driver"
+	depends on SND_HDA=y && SND_HDA_CODEC_CIRRUS=m
+
+config SND_HDA_CODEC_CS8409
+	tristate "Build Cirrus Logic HDA bridge support"
+	select SND_HDA_GENERIC
+	help
+	  Say Y or M here to include Cirrus Logic HDA bridge support in
+	  snd-hda-intel driver, such as CS8409.
+
+comment "Set to Y if you want auto-loading the codec driver"
+	depends on SND_HDA=y && SND_HDA_CODEC_CS8409=m
diff --git a/sound/hda/codecs/cirrus/Makefile b/sound/hda/codecs/cirrus/Makefile
new file mode 100644
index 000000000000..fa40c893fb09
--- /dev/null
+++ b/sound/hda/codecs/cirrus/Makefile
@@ -0,0 +1,8 @@
+# SPDX-License-Identifier: GPL-2.0
+subdir-ccflags-y += -I$(src)/../../common
+
+snd-hda-codec-cirrus-y :=	cirrus.o
+snd-hda-codec-cs8409-y :=	cs8409.o cs8409-tables.o
+
+obj-$(CONFIG_SND_HDA_CODEC_CIRRUS) += snd-hda-codec-cirrus.o
+obj-$(CONFIG_SND_HDA_CODEC_CS8409) += snd-hda-codec-cs8409.o
diff --git a/sound/pci/hda/patch_cirrus.c b/sound/hda/codecs/cirrus/cirrus.c
similarity index 99%
rename from sound/pci/hda/patch_cirrus.c
rename to sound/hda/codecs/cirrus/cirrus.c
index 06e046214a41..81ea66c4e9d3 100644
--- a/sound/pci/hda/patch_cirrus.c
+++ b/sound/hda/codecs/cirrus/cirrus.c
@@ -15,7 +15,7 @@
 #include "hda_local.h"
 #include "hda_auto_parser.h"
 #include "hda_jack.h"
-#include "hda_generic.h"
+#include "../generic.h"
 
 /*
  */
diff --git a/sound/pci/hda/patch_cs8409-tables.c b/sound/hda/codecs/cirrus/cs8409-tables.c
similarity index 99%
rename from sound/pci/hda/patch_cs8409-tables.c
rename to sound/hda/codecs/cirrus/cs8409-tables.c
index 09240138e087..5fe49f13c0da 100644
--- a/sound/pci/hda/patch_cs8409-tables.c
+++ b/sound/hda/codecs/cirrus/cs8409-tables.c
@@ -1,6 +1,6 @@
 // SPDX-License-Identifier: GPL-2.0-only
 /*
- * patch_cs8409-tables.c  --  HD audio interface patch for Cirrus Logic CS8409 HDA bridge chip
+ * cs8409-tables.c  --  HD audio interface patch for Cirrus Logic CS8409 HDA bridge chip
  *
  * Copyright (C) 2021 Cirrus Logic, Inc. and
  *                    Cirrus Logic International Semiconductor Ltd.
@@ -8,7 +8,7 @@
  * Author: Lucas Tanure <tanureal@opensource.cirrus.com>
  */
 
-#include "patch_cs8409.h"
+#include "cs8409.h"
 
 /******************************************************************************
  *                          CS42L42 Specific Data
diff --git a/sound/pci/hda/patch_cs8409.c b/sound/hda/codecs/cirrus/cs8409.c
similarity index 99%
rename from sound/pci/hda/patch_cs8409.c
rename to sound/hda/codecs/cirrus/cs8409.c
index e50006757a2c..5ec1126b2a55 100644
--- a/sound/pci/hda/patch_cs8409.c
+++ b/sound/hda/codecs/cirrus/cs8409.c
@@ -13,7 +13,7 @@
 #include <linux/mutex.h>
 #include <linux/iopoll.h>
 
-#include "patch_cs8409.h"
+#include "cs8409.h"
 
 /******************************************************************************
  *                        CS8409 Specific Functions
diff --git a/sound/pci/hda/patch_cs8409.h b/sound/hda/codecs/cirrus/cs8409.h
similarity index 99%
rename from sound/pci/hda/patch_cs8409.h
rename to sound/hda/codecs/cirrus/cs8409.h
index e4bd2e12110b..35072cd009dc 100644
--- a/sound/pci/hda/patch_cs8409.h
+++ b/sound/hda/codecs/cirrus/cs8409.h
@@ -17,7 +17,7 @@
 #include "hda_local.h"
 #include "hda_auto_parser.h"
 #include "hda_jack.h"
-#include "hda_generic.h"
+#include "../generic.h"
 
 /* CS8409 Specific Definitions */
 
diff --git a/sound/pci/hda/patch_cmedia.c b/sound/hda/codecs/cmedia.c
similarity index 99%
rename from sound/pci/hda/patch_cmedia.c
rename to sound/hda/codecs/cmedia.c
index fe946d407830..c88da2f8233e 100644
--- a/sound/pci/hda/patch_cmedia.c
+++ b/sound/hda/codecs/cmedia.c
@@ -15,7 +15,7 @@
 #include "hda_local.h"
 #include "hda_auto_parser.h"
 #include "hda_jack.h"
-#include "hda_generic.h"
+#include "generic.h"
 
 /* CM9825 Offset Definitions */
 
diff --git a/sound/pci/hda/patch_conexant.c b/sound/hda/codecs/conexant.c
similarity index 99%
rename from sound/pci/hda/patch_conexant.c
rename to sound/hda/codecs/conexant.c
index e584a7b2877d..b7710a81fd87 100644
--- a/sound/pci/hda/patch_conexant.c
+++ b/sound/hda/codecs/conexant.c
@@ -19,7 +19,7 @@
 #include "hda_auto_parser.h"
 #include "hda_beep.h"
 #include "hda_jack.h"
-#include "hda_generic.h"
+#include "generic.h"
 
 struct conexant_spec {
 	struct hda_gen_spec gen;
@@ -312,10 +312,10 @@ enum {
 };
 
 /* for hda_fixup_thinkpad_acpi() */
-#include "thinkpad_helper.c"
+#include "helpers/thinkpad.c"
 
 /* for hda_fixup_ideapad_acpi() */
-#include "ideapad_hotkey_led_helper.c"
+#include "helpers/ideapad_hotkey_led.c"
 
 static void cxt_fixup_stereo_dmic(struct hda_codec *codec,
 				  const struct hda_fixup *fix, int action)
diff --git a/sound/pci/hda/hda_generic.c b/sound/hda/codecs/generic.c
similarity index 99%
rename from sound/pci/hda/hda_generic.c
rename to sound/hda/codecs/generic.c
index 2a28c8b6ba55..873fd4b7f451 100644
--- a/sound/pci/hda/hda_generic.c
+++ b/sound/hda/codecs/generic.c
@@ -25,7 +25,7 @@
 #include "hda_auto_parser.h"
 #include "hda_jack.h"
 #include "hda_beep.h"
-#include "hda_generic.h"
+#include "generic.h"
 
 
 /**
diff --git a/sound/pci/hda/hda_generic.h b/sound/hda/codecs/generic.h
similarity index 100%
rename from sound/pci/hda/hda_generic.h
rename to sound/hda/codecs/generic.h
diff --git a/sound/hda/codecs/hdmi/Makefile b/sound/hda/codecs/hdmi/Makefile
new file mode 100644
index 000000000000..371818d4e9b2
--- /dev/null
+++ b/sound/hda/codecs/hdmi/Makefile
@@ -0,0 +1,6 @@
+# SPDX-License-Identifier: GPL-2.0
+subdir-ccflags-y += -I$(src)/../../common
+
+snd-hda-codec-hdmi-y :=		hdmi.o eld.o
+
+obj-$(CONFIG_SND_HDA_CODEC_HDMI) += snd-hda-codec-hdmi.o
diff --git a/sound/pci/hda/hda_eld.c b/sound/hda/codecs/hdmi/eld.c
similarity index 100%
rename from sound/pci/hda/hda_eld.c
rename to sound/hda/codecs/hdmi/eld.c
diff --git a/sound/pci/hda/patch_hdmi.c b/sound/hda/codecs/hdmi/hdmi.c
similarity index 99%
rename from sound/pci/hda/patch_hdmi.c
rename to sound/hda/codecs/hdmi/hdmi.c
index 9a7793eb16e9..3811eb1dc998 100644
--- a/sound/pci/hda/patch_hdmi.c
+++ b/sound/hda/codecs/hdmi/hdmi.c
@@ -1,7 +1,7 @@
 // SPDX-License-Identifier: GPL-2.0-or-later
 /*
  *
- *  patch_hdmi.c - routines for HDMI/DisplayPort codecs
+ *  hdmi.c - routines for HDMI/DisplayPort codecs
  *
  *  Copyright(c) 2008-2010 Intel Corporation
  *  Copyright (c) 2006 ATI Technologies Inc.
diff --git a/sound/pci/hda/hp_x360_helper.c b/sound/hda/codecs/helpers/hp_x360.c
similarity index 100%
rename from sound/pci/hda/hp_x360_helper.c
rename to sound/hda/codecs/helpers/hp_x360.c
diff --git a/sound/pci/hda/ideapad_hotkey_led_helper.c b/sound/hda/codecs/helpers/ideapad_hotkey_led.c
similarity index 100%
rename from sound/pci/hda/ideapad_hotkey_led_helper.c
rename to sound/hda/codecs/helpers/ideapad_hotkey_led.c
diff --git a/sound/pci/hda/ideapad_s740_helper.c b/sound/hda/codecs/helpers/ideapad_s740.c
similarity index 100%
rename from sound/pci/hda/ideapad_s740_helper.c
rename to sound/hda/codecs/helpers/ideapad_s740.c
diff --git a/sound/pci/hda/thinkpad_helper.c b/sound/hda/codecs/helpers/thinkpad.c
similarity index 100%
rename from sound/pci/hda/thinkpad_helper.c
rename to sound/hda/codecs/helpers/thinkpad.c
diff --git a/sound/pci/hda/patch_realtek.c b/sound/hda/codecs/realtek.c
similarity index 99%
rename from sound/pci/hda/patch_realtek.c
rename to sound/hda/codecs/realtek.c
index c2592e5cf70a..9c86c7bd1a90 100644
--- a/sound/pci/hda/patch_realtek.c
+++ b/sound/hda/codecs/realtek.c
@@ -30,8 +30,8 @@
 #include "hda_auto_parser.h"
 #include "hda_beep.h"
 #include "hda_jack.h"
-#include "hda_generic.h"
-#include "hda_component.h"
+#include "generic.h"
+#include "side-codecs/hda_component.h"
 
 /* keep halting ALC5505 DSP, for power saving */
 #define HALT_REALTEK_ALC5505
@@ -7120,7 +7120,7 @@ static void alc285_fixup_hp_beep(struct hda_codec *codec,
 }
 
 /* for hda_fixup_thinkpad_acpi() */
-#include "thinkpad_helper.c"
+#include "helpers/thinkpad.c"
 
 static void alc_fixup_thinkpad_acpi(struct hda_codec *codec,
 				    const struct hda_fixup *fix, int action)
@@ -7130,7 +7130,7 @@ static void alc_fixup_thinkpad_acpi(struct hda_codec *codec,
 }
 
 /* for hda_fixup_ideapad_acpi() */
-#include "ideapad_hotkey_led_helper.c"
+#include "helpers/ideapad_hotkey_led.c"
 
 static void alc_fixup_ideapad_acpi(struct hda_codec *codec,
 				   const struct hda_fixup *fix, int action)
@@ -7362,10 +7362,10 @@ static void alc256_fixup_acer_sfg16_micmute_led(struct hda_codec *codec,
 
 
 /* for alc295_fixup_hp_top_speakers */
-#include "hp_x360_helper.c"
+#include "helpers/hp_x360.c"
 
 /* for alc285_fixup_ideapad_s740_coef() */
-#include "ideapad_s740_helper.c"
+#include "helpers/ideapad_s740.c"
 
 static const struct coef_fw alc256_fixup_set_coef_defaults_coefs[] = {
 	WRITE_COEF(0x10, 0x0020), WRITE_COEF(0x24, 0x0000),
diff --git a/sound/pci/hda/patch_senarytech.c b/sound/hda/codecs/senarytech.c
similarity index 98%
rename from sound/pci/hda/patch_senarytech.c
rename to sound/hda/codecs/senarytech.c
index 0691996fa971..9a253ad19f4d 100644
--- a/sound/pci/hda/patch_senarytech.c
+++ b/sound/hda/codecs/senarytech.c
@@ -2,7 +2,7 @@
 /*
  * HD audio interface patch for Senary HDA audio codec
  *
- * Initially based on sound/pci/hda/patch_conexant.c
+ * Initially based on conexant.c
  */
 
 #include <linux/init.h>
@@ -17,7 +17,7 @@
 #include "hda_auto_parser.h"
 #include "hda_beep.h"
 #include "hda_jack.h"
-#include "hda_generic.h"
+#include "generic.h"
 
 struct senary_spec {
 	struct hda_gen_spec gen;
diff --git a/sound/pci/hda/patch_si3054.c b/sound/hda/codecs/si3054.c
similarity index 100%
rename from sound/pci/hda/patch_si3054.c
rename to sound/hda/codecs/si3054.c
diff --git a/sound/hda/codecs/side-codecs/Kconfig b/sound/hda/codecs/side-codecs/Kconfig
new file mode 100644
index 000000000000..cbf1847896bc
--- /dev/null
+++ b/sound/hda/codecs/side-codecs/Kconfig
@@ -0,0 +1,128 @@
+config SND_HDA_CIRRUS_SCODEC
+	tristate
+
+config SND_HDA_CIRRUS_SCODEC_KUNIT_TEST
+	tristate "KUnit test for Cirrus side-codec library" if !KUNIT_ALL_TESTS
+	depends on SND_HDA_CIRRUS_SCODEC && GPIOLIB && KUNIT
+	default KUNIT_ALL_TESTS
+	help
+	  This builds KUnit tests for the cirrus side-codec library.
+	  For more information on KUnit and unit tests in general,
+	  please refer to the KUnit documentation in
+	  Documentation/dev-tools/kunit/.
+	  If in doubt, say "N".
+
+config SND_HDA_SCODEC_CS35L41
+	tristate
+	select SND_HDA_GENERIC
+	select REGMAP_IRQ
+	select FW_CS_DSP
+
+config SND_HDA_SCODEC_COMPONENT
+	tristate
+
+config SND_HDA_SCODEC_CS35L41_I2C
+	tristate "Build CS35L41 HD-audio side codec support for I2C Bus"
+	depends on I2C
+	depends on ACPI
+	depends on EFI
+	depends on SND_SOC
+	select SND_SOC_CS35L41_LIB
+	select SND_HDA_SCODEC_CS35L41
+	select SND_SOC_CS_AMP_LIB
+	help
+	  Say Y or M here to include CS35L41 I2C HD-audio side codec support
+	  in snd-hda-intel driver, such as ALC287.
+
+comment "Set to Y if you want auto-loading the side codec driver"
+	depends on SND_HDA=y && SND_HDA_SCODEC_CS35L41_I2C=m
+
+config SND_HDA_SCODEC_CS35L41_SPI
+	tristate "Build CS35L41 HD-audio codec support for SPI Bus"
+	depends on SPI_MASTER
+	depends on ACPI
+	depends on EFI
+	depends on SND_SOC
+	select SND_SOC_CS35L41_LIB
+	select SND_HDA_SCODEC_CS35L41
+	select SND_SOC_CS_AMP_LIB
+	help
+	  Say Y or M here to include CS35L41 SPI HD-audio side codec support
+	  in snd-hda-intel driver, such as ALC287.
+
+comment "Set to Y if you want auto-loading the side codec driver"
+	depends on SND_HDA=y && SND_HDA_SCODEC_CS35L41_SPI=m
+
+config SND_HDA_SCODEC_CS35L56
+	tristate
+
+config SND_HDA_SCODEC_CS35L56_I2C
+	tristate "Build CS35L56 HD-audio side codec support for I2C Bus"
+	depends on I2C
+	depends on ACPI
+	depends on SND_SOC
+	select FW_CS_DSP
+	imply SERIAL_MULTI_INSTANTIATE
+	select SND_HDA_GENERIC
+	select SND_SOC_CS35L56_SHARED
+	select SND_HDA_SCODEC_CS35L56
+	select SND_HDA_CIRRUS_SCODEC
+	select SND_SOC_CS_AMP_LIB
+	help
+	  Say Y or M here to include CS35L56 amplifier support with
+	  I2C control.
+
+config SND_HDA_SCODEC_CS35L56_SPI
+	tristate "Build CS35L56 HD-audio side codec support for SPI Bus"
+	depends on SPI_MASTER
+	depends on ACPI
+	depends on SND_SOC
+	select FW_CS_DSP
+	imply SERIAL_MULTI_INSTANTIATE
+	select SND_HDA_GENERIC
+	select SND_SOC_CS35L56_SHARED
+	select SND_HDA_SCODEC_CS35L56
+	select SND_HDA_CIRRUS_SCODEC
+	select SND_SOC_CS_AMP_LIB
+	help
+	  Say Y or M here to include CS35L56 amplifier support with
+	  SPI control.
+
+config SND_HDA_SCODEC_TAS2781
+	tristate
+	select SND_HDA_GENERIC
+
+config SND_HDA_SCODEC_TAS2781_I2C
+	tristate "Build TAS2781 HD-audio side codec support for I2C Bus"
+	depends on I2C
+	depends on ACPI
+	depends on EFI
+	depends on SND_SOC
+	select SND_HDA_SCODEC_TAS2781
+	select SND_SOC_TAS2781_COMLIB_I2C
+	select SND_SOC_TAS2781_FMWLIB
+	select CRC32
+	help
+	  Say Y or M here to include TAS2781 I2C HD-audio side codec support
+	  in snd-hda-intel driver, such as ALC287.
+
+comment "Set to Y if you want auto-loading the side codec driver"
+	depends on SND_HDA=y && SND_HDA_SCODEC_TAS2781_I2C=m
+
+config SND_HDA_SCODEC_TAS2781_SPI
+	tristate "Build TAS2781 HD-audio side codec support for SPI Bus"
+	depends on SPI_MASTER
+	depends on ACPI
+	depends on EFI
+	depends on SND_SOC
+	select SND_HDA_SCODEC_TAS2781
+	select SND_SOC_TAS2781_COMLIB
+	select SND_SOC_TAS2781_FMWLIB
+	select CRC8
+	select CRC32
+	help
+	  Say Y or M here to include TAS2781 SPI HD-audio side codec support
+	  in snd-hda-intel driver, such as ALC287.
+
+comment "Set to Y if you want auto-loading the side codec driver"
+	depends on SND_HDA=y && SND_HDA_SCODEC_TAS2781_SPI=m
diff --git a/sound/hda/codecs/side-codecs/Makefile b/sound/hda/codecs/side-codecs/Makefile
new file mode 100644
index 000000000000..245e84f6a121
--- /dev/null
+++ b/sound/hda/codecs/side-codecs/Makefile
@@ -0,0 +1,28 @@
+# SPDX-License-Identifier: GPL-2.0
+subdir-ccflags-y += -I$(src)/../../common
+
+snd-hda-cirrus-scodec-y :=	cirrus_scodec.o
+snd-hda-cirrus-scodec-test-y :=	cirrus_scodec_test.o
+snd-hda-scodec-cs35l41-y :=	cs35l41_hda.o cs35l41_hda_property.o
+snd-hda-scodec-cs35l41-i2c-y :=	cs35l41_hda_i2c.o
+snd-hda-scodec-cs35l41-spi-y :=	cs35l41_hda_spi.o
+snd-hda-scodec-cs35l56-y :=	cs35l56_hda.o
+snd-hda-scodec-cs35l56-i2c-y :=	cs35l56_hda_i2c.o
+snd-hda-scodec-cs35l56-spi-y :=	cs35l56_hda_spi.o
+snd-hda-scodec-component-y :=	hda_component.o
+snd-hda-scodec-tas2781-y :=	tas2781_hda.o
+snd-hda-scodec-tas2781-i2c-y :=	tas2781_hda_i2c.o
+snd-hda-scodec-tas2781-spi-y :=	tas2781_hda_spi.o
+
+obj-$(CONFIG_SND_HDA_CIRRUS_SCODEC) += snd-hda-cirrus-scodec.o
+obj-$(CONFIG_SND_HDA_CIRRUS_SCODEC_KUNIT_TEST) += snd-hda-cirrus-scodec-test.o
+obj-$(CONFIG_SND_HDA_SCODEC_CS35L41) += snd-hda-scodec-cs35l41.o
+obj-$(CONFIG_SND_HDA_SCODEC_CS35L41_I2C) += snd-hda-scodec-cs35l41-i2c.o
+obj-$(CONFIG_SND_HDA_SCODEC_CS35L41_SPI) += snd-hda-scodec-cs35l41-spi.o
+obj-$(CONFIG_SND_HDA_SCODEC_CS35L56) += snd-hda-scodec-cs35l56.o
+obj-$(CONFIG_SND_HDA_SCODEC_CS35L56_I2C) += snd-hda-scodec-cs35l56-i2c.o
+obj-$(CONFIG_SND_HDA_SCODEC_CS35L56_SPI) += snd-hda-scodec-cs35l56-spi.o
+obj-$(CONFIG_SND_HDA_SCODEC_COMPONENT) += snd-hda-scodec-component.o
+obj-$(CONFIG_SND_HDA_SCODEC_TAS2781) += snd-hda-scodec-tas2781.o
+obj-$(CONFIG_SND_HDA_SCODEC_TAS2781_I2C) += snd-hda-scodec-tas2781-i2c.o
+obj-$(CONFIG_SND_HDA_SCODEC_TAS2781_SPI) += snd-hda-scodec-tas2781-spi.o
diff --git a/sound/pci/hda/cirrus_scodec.c b/sound/hda/codecs/side-codecs/cirrus_scodec.c
similarity index 100%
rename from sound/pci/hda/cirrus_scodec.c
rename to sound/hda/codecs/side-codecs/cirrus_scodec.c
diff --git a/sound/pci/hda/cirrus_scodec.h b/sound/hda/codecs/side-codecs/cirrus_scodec.h
similarity index 100%
rename from sound/pci/hda/cirrus_scodec.h
rename to sound/hda/codecs/side-codecs/cirrus_scodec.h
diff --git a/sound/pci/hda/cirrus_scodec_test.c b/sound/hda/codecs/side-codecs/cirrus_scodec_test.c
similarity index 100%
rename from sound/pci/hda/cirrus_scodec_test.c
rename to sound/hda/codecs/side-codecs/cirrus_scodec_test.c
diff --git a/sound/pci/hda/cs35l41_hda.c b/sound/hda/codecs/side-codecs/cs35l41_hda.c
similarity index 99%
rename from sound/pci/hda/cs35l41_hda.c
rename to sound/hda/codecs/side-codecs/cs35l41_hda.c
index 2d7ee121a7fd..37f2cdc8ce82 100644
--- a/sound/pci/hda/cs35l41_hda.c
+++ b/sound/hda/codecs/side-codecs/cs35l41_hda.c
@@ -17,7 +17,7 @@
 #include "hda_local.h"
 #include "hda_auto_parser.h"
 #include "hda_jack.h"
-#include "hda_generic.h"
+#include "../generic.h"
 #include "hda_component.h"
 #include "cs35l41_hda.h"
 #include "cs35l41_hda_property.h"
diff --git a/sound/pci/hda/cs35l41_hda.h b/sound/hda/codecs/side-codecs/cs35l41_hda.h
similarity index 100%
rename from sound/pci/hda/cs35l41_hda.h
rename to sound/hda/codecs/side-codecs/cs35l41_hda.h
diff --git a/sound/pci/hda/cs35l41_hda_i2c.c b/sound/hda/codecs/side-codecs/cs35l41_hda_i2c.c
similarity index 100%
rename from sound/pci/hda/cs35l41_hda_i2c.c
rename to sound/hda/codecs/side-codecs/cs35l41_hda_i2c.c
diff --git a/sound/pci/hda/cs35l41_hda_property.c b/sound/hda/codecs/side-codecs/cs35l41_hda_property.c
similarity index 100%
rename from sound/pci/hda/cs35l41_hda_property.c
rename to sound/hda/codecs/side-codecs/cs35l41_hda_property.c
diff --git a/sound/pci/hda/cs35l41_hda_property.h b/sound/hda/codecs/side-codecs/cs35l41_hda_property.h
similarity index 100%
rename from sound/pci/hda/cs35l41_hda_property.h
rename to sound/hda/codecs/side-codecs/cs35l41_hda_property.h
diff --git a/sound/pci/hda/cs35l41_hda_spi.c b/sound/hda/codecs/side-codecs/cs35l41_hda_spi.c
similarity index 100%
rename from sound/pci/hda/cs35l41_hda_spi.c
rename to sound/hda/codecs/side-codecs/cs35l41_hda_spi.c
diff --git a/sound/pci/hda/cs35l56_hda.c b/sound/hda/codecs/side-codecs/cs35l56_hda.c
similarity index 99%
rename from sound/pci/hda/cs35l56_hda.c
rename to sound/hda/codecs/side-codecs/cs35l56_hda.c
index e8b4995118bb..8d43119b3dd2 100644
--- a/sound/pci/hda/cs35l56_hda.c
+++ b/sound/hda/codecs/side-codecs/cs35l56_hda.c
@@ -20,7 +20,7 @@
 #include "cirrus_scodec.h"
 #include "cs35l56_hda.h"
 #include "hda_component.h"
-#include "hda_generic.h"
+#include "../generic.h"
 
  /*
   * The cs35l56_hda_dai_config[] reg sequence configures the device as
diff --git a/sound/pci/hda/cs35l56_hda.h b/sound/hda/codecs/side-codecs/cs35l56_hda.h
similarity index 100%
rename from sound/pci/hda/cs35l56_hda.h
rename to sound/hda/codecs/side-codecs/cs35l56_hda.h
diff --git a/sound/pci/hda/cs35l56_hda_i2c.c b/sound/hda/codecs/side-codecs/cs35l56_hda_i2c.c
similarity index 100%
rename from sound/pci/hda/cs35l56_hda_i2c.c
rename to sound/hda/codecs/side-codecs/cs35l56_hda_i2c.c
diff --git a/sound/pci/hda/cs35l56_hda_spi.c b/sound/hda/codecs/side-codecs/cs35l56_hda_spi.c
similarity index 100%
rename from sound/pci/hda/cs35l56_hda_spi.c
rename to sound/hda/codecs/side-codecs/cs35l56_hda_spi.c
diff --git a/sound/pci/hda/hda_component.c b/sound/hda/codecs/side-codecs/hda_component.c
similarity index 100%
rename from sound/pci/hda/hda_component.c
rename to sound/hda/codecs/side-codecs/hda_component.c
diff --git a/sound/pci/hda/hda_component.h b/sound/hda/codecs/side-codecs/hda_component.h
similarity index 100%
rename from sound/pci/hda/hda_component.h
rename to sound/hda/codecs/side-codecs/hda_component.h
diff --git a/sound/pci/hda/tas2781_hda.c b/sound/hda/codecs/side-codecs/tas2781_hda.c
similarity index 100%
rename from sound/pci/hda/tas2781_hda.c
rename to sound/hda/codecs/side-codecs/tas2781_hda.c
diff --git a/sound/pci/hda/tas2781_hda.h b/sound/hda/codecs/side-codecs/tas2781_hda.h
similarity index 100%
rename from sound/pci/hda/tas2781_hda.h
rename to sound/hda/codecs/side-codecs/tas2781_hda.h
diff --git a/sound/pci/hda/tas2781_hda_i2c.c b/sound/hda/codecs/side-codecs/tas2781_hda_i2c.c
similarity index 99%
rename from sound/pci/hda/tas2781_hda_i2c.c
rename to sound/hda/codecs/side-codecs/tas2781_hda_i2c.c
index b7ee22840d78..bacc3f6ed4bd 100644
--- a/sound/pci/hda/tas2781_hda_i2c.c
+++ b/sound/hda/codecs/side-codecs/tas2781_hda_i2c.c
@@ -30,7 +30,7 @@
 #include "hda_auto_parser.h"
 #include "hda_component.h"
 #include "hda_jack.h"
-#include "hda_generic.h"
+#include "../generic.h"
 #include "tas2781_hda.h"
 
 #define TAS2563_CAL_VAR_NAME_MAX	16
diff --git a/sound/pci/hda/tas2781_hda_spi.c b/sound/hda/codecs/side-codecs/tas2781_hda_spi.c
similarity index 99%
rename from sound/pci/hda/tas2781_hda_spi.c
rename to sound/hda/codecs/side-codecs/tas2781_hda_spi.c
index c4b9a3c1a7f0..09a5d0f131b2 100644
--- a/sound/pci/hda/tas2781_hda_spi.c
+++ b/sound/hda/codecs/side-codecs/tas2781_hda_spi.c
@@ -35,7 +35,7 @@
 #include "hda_auto_parser.h"
 #include "hda_component.h"
 #include "hda_jack.h"
-#include "hda_generic.h"
+#include "../generic.h"
 #include "tas2781_hda.h"
 
 #define TASDEVICE_RANGE_MAX_SIZE	(256 * 128)
diff --git a/sound/pci/hda/patch_sigmatel.c b/sound/hda/codecs/sigmatel.c
similarity index 99%
rename from sound/pci/hda/patch_sigmatel.c
rename to sound/hda/codecs/sigmatel.c
index bde6b7373858..56274ff49b0b 100644
--- a/sound/pci/hda/patch_sigmatel.c
+++ b/sound/hda/codecs/sigmatel.c
@@ -7,7 +7,7 @@
  * Copyright (c) 2005 Embedded Alley Solutions, Inc.
  * Matt Porter <mporter@embeddedalley.com>
  *
- * Based on patch_cmedia.c and patch_realtek.c
+ * Based on cmedia.c and realtek.c
  * Copyright (c) 2004 Takashi Iwai <tiwai@suse.de>
  */
 
@@ -24,7 +24,7 @@
 #include "hda_auto_parser.h"
 #include "hda_beep.h"
 #include "hda_jack.h"
-#include "hda_generic.h"
+#include "generic.h"
 
 enum {
 	STAC_REF,
diff --git a/sound/pci/hda/patch_via.c b/sound/hda/codecs/via.c
similarity index 99%
rename from sound/pci/hda/patch_via.c
rename to sound/hda/codecs/via.c
index d0893059b1b9..e3ce563f866b 100644
--- a/sound/pci/hda/patch_via.c
+++ b/sound/hda/codecs/via.c
@@ -43,7 +43,7 @@
 #include "hda_local.h"
 #include "hda_auto_parser.h"
 #include "hda_jack.h"
-#include "hda_generic.h"
+#include "generic.h"
 
 /* Pin Widget NID */
 #define VT1708_HP_PIN_NID	0x20
diff --git a/sound/pci/Kconfig b/sound/pci/Kconfig
index 787868c9e91b..e0996a9d90b0 100644
--- a/sound/pci/Kconfig
+++ b/sound/pci/Kconfig
@@ -933,5 +933,3 @@ config SND_YMFPCI
 	  will be called snd-ymfpci.
 
 endif	# SND_PCI
-
-source "sound/pci/hda/Kconfig"
diff --git a/sound/pci/Makefile b/sound/pci/Makefile
index 18b673018dfd..9d5e8e12ae73 100644
--- a/sound/pci/Makefile
+++ b/sound/pci/Makefile
@@ -69,7 +69,6 @@ obj-$(CONFIG_SND) += \
 	lx6464es/ \
 	echoaudio/ \
 	emu10k1/ \
-	hda/ \
 	ice1712/ \
 	korg1212/ \
 	mixart/ \
diff --git a/sound/pci/hda/Makefile b/sound/pci/hda/Makefile
deleted file mode 100644
index 79de0af71ad4..000000000000
--- a/sound/pci/hda/Makefile
+++ /dev/null
@@ -1,61 +0,0 @@
-# SPDX-License-Identifier: GPL-2.0
-subdir-ccflags-y += -I$(src)/../../hda/common
-
-snd-hda-codec-generic-y :=	hda_generic.o
-snd-hda-codec-realtek-y :=	patch_realtek.o
-snd-hda-codec-cmedia-y :=	patch_cmedia.o
-snd-hda-codec-analog-y :=	patch_analog.o
-snd-hda-codec-idt-y :=		patch_sigmatel.o
-snd-hda-codec-si3054-y :=	patch_si3054.o
-snd-hda-codec-cirrus-y :=	patch_cirrus.o
-snd-hda-codec-cs8409-y :=	patch_cs8409.o patch_cs8409-tables.o
-snd-hda-codec-ca0110-y :=	patch_ca0110.o
-snd-hda-codec-ca0132-y :=	patch_ca0132.o
-snd-hda-codec-conexant-y :=	patch_conexant.o
-snd-hda-codec-senarytech-y :=patch_senarytech.o
-snd-hda-codec-via-y :=		patch_via.o
-snd-hda-codec-hdmi-y :=		patch_hdmi.o hda_eld.o
-
-# side codecs
-snd-hda-cirrus-scodec-y :=	cirrus_scodec.o
-snd-hda-cirrus-scodec-test-y :=	cirrus_scodec_test.o
-snd-hda-scodec-cs35l41-y :=	cs35l41_hda.o cs35l41_hda_property.o
-snd-hda-scodec-cs35l41-i2c-y :=	cs35l41_hda_i2c.o
-snd-hda-scodec-cs35l41-spi-y :=	cs35l41_hda_spi.o
-snd-hda-scodec-cs35l56-y :=	cs35l56_hda.o
-snd-hda-scodec-cs35l56-i2c-y :=	cs35l56_hda_i2c.o
-snd-hda-scodec-cs35l56-spi-y :=	cs35l56_hda_spi.o
-snd-hda-scodec-component-y :=	hda_component.o
-snd-hda-scodec-tas2781-y :=	tas2781_hda.o
-snd-hda-scodec-tas2781-i2c-y :=	tas2781_hda_i2c.o
-snd-hda-scodec-tas2781-spi-y :=	tas2781_hda_spi.o
-
-# codec drivers
-obj-$(CONFIG_SND_HDA_GENERIC) += snd-hda-codec-generic.o
-obj-$(CONFIG_SND_HDA_CODEC_REALTEK) += snd-hda-codec-realtek.o
-obj-$(CONFIG_SND_HDA_CODEC_CMEDIA) += snd-hda-codec-cmedia.o
-obj-$(CONFIG_SND_HDA_CODEC_ANALOG) += snd-hda-codec-analog.o
-obj-$(CONFIG_SND_HDA_CODEC_SIGMATEL) += snd-hda-codec-idt.o
-obj-$(CONFIG_SND_HDA_CODEC_SI3054) += snd-hda-codec-si3054.o
-obj-$(CONFIG_SND_HDA_CODEC_CIRRUS) += snd-hda-codec-cirrus.o
-obj-$(CONFIG_SND_HDA_CODEC_CS8409) += snd-hda-codec-cs8409.o
-obj-$(CONFIG_SND_HDA_CODEC_CA0110) += snd-hda-codec-ca0110.o
-obj-$(CONFIG_SND_HDA_CODEC_CA0132) += snd-hda-codec-ca0132.o
-obj-$(CONFIG_SND_HDA_CODEC_CONEXANT) += snd-hda-codec-conexant.o
-obj-$(CONFIG_SND_HDA_CODEC_SENARYTECH) += snd-hda-codec-senarytech.o
-obj-$(CONFIG_SND_HDA_CODEC_VIA) += snd-hda-codec-via.o
-obj-$(CONFIG_SND_HDA_CODEC_HDMI) += snd-hda-codec-hdmi.o
-
-# side codecs
-obj-$(CONFIG_SND_HDA_CIRRUS_SCODEC) += snd-hda-cirrus-scodec.o
-obj-$(CONFIG_SND_HDA_CIRRUS_SCODEC_KUNIT_TEST) += snd-hda-cirrus-scodec-test.o
-obj-$(CONFIG_SND_HDA_SCODEC_CS35L41) += snd-hda-scodec-cs35l41.o
-obj-$(CONFIG_SND_HDA_SCODEC_CS35L41_I2C) += snd-hda-scodec-cs35l41-i2c.o
-obj-$(CONFIG_SND_HDA_SCODEC_CS35L41_SPI) += snd-hda-scodec-cs35l41-spi.o
-obj-$(CONFIG_SND_HDA_SCODEC_CS35L56) += snd-hda-scodec-cs35l56.o
-obj-$(CONFIG_SND_HDA_SCODEC_CS35L56_I2C) += snd-hda-scodec-cs35l56-i2c.o
-obj-$(CONFIG_SND_HDA_SCODEC_CS35L56_SPI) += snd-hda-scodec-cs35l56-spi.o
-obj-$(CONFIG_SND_HDA_SCODEC_COMPONENT) += snd-hda-scodec-component.o
-obj-$(CONFIG_SND_HDA_SCODEC_TAS2781) += snd-hda-scodec-tas2781.o
-obj-$(CONFIG_SND_HDA_SCODEC_TAS2781_I2C) += snd-hda-scodec-tas2781-i2c.o
-obj-$(CONFIG_SND_HDA_SCODEC_TAS2781_SPI) += snd-hda-scodec-tas2781-spi.o
-- 
2.50.0

