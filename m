Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92E5815F32E
	for <linux-sound@vger.kernel.org>; Tue,  7 May 2024 13:55:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715090114; cv=none; b=sjyrQXAlHtEdyhmtyGIDh25DsGfLdiQbDyQaYRFJwnBugrKw6CkZo9LI4/+mfd6Af8v+sTtcSl1PPQEAmFliXBE1fTF595lROul6hp5jJ/1d+h6U9XRlqkUTstsrTP3cH8s7tEQj3M6qWdYvcxdg6jokNCTLfjFZmu+wJu2gXQk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715090114; c=relaxed/simple;
	bh=y5Gai643MMpxC5h2Vjwq6EcooruT66EtsVktgjM7938=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ncvAriEoM/rExWhFZhpOfsNHx8P51rxyYH/WguH4FCIaWyfZ9Zg2NwzEdbPS79e/+ki2uTuJs6vtDMekCucDVSLXWgT5gUc7KhFz0r9PoUawdlAMzI5lGUqtes96Ynjjec5moprEJiXeB8+BMHbyNH7U/guZPsSudqyfmTaSUgY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id A7CB933FB7;
	Tue,  7 May 2024 13:55:08 +0000 (UTC)
Authentication-Results: smtp-out1.suse.de;
	none
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 97C5A13A2D;
	Tue,  7 May 2024 13:55:08 +0000 (UTC)
Received: from dovecot-director2.suse.de ([10.150.64.162])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id UAx/JLwyOmagMgAAD6G6ig
	(envelope-from <tiwai@suse.de>); Tue, 07 May 2024 13:55:08 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Takashi Iwai <tiwai@suse.de>
Subject: [PATCH 3/9] ALSA: hda: Use *-y instead of *-objs in Makefile
Date: Tue,  7 May 2024 15:55:03 +0200
Message-ID: <20240507135513.14919-4-tiwai@suse.de>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240507135513.14919-1-tiwai@suse.de>
References: <20240507135513.14919-1-tiwai@suse.de>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Pre-Result: action=no action;
	module=replies;
	Message is reply to one we originated
X-Rspamd-Pre-Result: action=no action;
	module=replies;
	Message is reply to one we originated
X-Rspamd-Action: no action
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spam-Level: 
X-Spamd-Result: default: False [-4.00 / 50.00];
	REPLY(-4.00)[]
X-Spam-Flag: NO
X-Spam-Score: -4.00
X-Rspamd-Queue-Id: A7CB933FB7

*-objs suffix is reserved rather for (user-space) host programs while
usually *-y suffix is used for kernel drivers (although *-objs works
for that purpose for now).

Let's correct the old usages of *-objs in Makefiles.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/hda/Makefile     | 8 ++++----
 sound/hda/ext/Makefile | 2 +-
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/sound/hda/Makefile b/sound/hda/Makefile
index 78f487a635f8..83cceafe0d4c 100644
--- a/sound/hda/Makefile
+++ b/sound/hda/Makefile
@@ -1,8 +1,8 @@
 # SPDX-License-Identifier: GPL-2.0
-snd-hda-core-objs := hda_bus_type.o hdac_bus.o hdac_device.o hdac_sysfs.o \
+snd-hda-core-y := hda_bus_type.o hdac_bus.o hdac_device.o hdac_sysfs.o \
 	hdac_regmap.o hdac_controller.o hdac_stream.o array.o hdmi_chmap.o
 
-snd-hda-core-objs += trace.o
+snd-hda-core-y += trace.o
 CFLAGS_trace.o := -I$(src)
 
 # for sync with i915 gfx driver
@@ -14,9 +14,9 @@ obj-$(CONFIG_SND_HDA_CORE) += snd-hda-core.o
 #extended hda
 obj-$(CONFIG_SND_HDA_EXT_CORE) += ext/
 
-snd-intel-dspcfg-objs := intel-dsp-config.o
+snd-intel-dspcfg-y := intel-dsp-config.o
 snd-intel-dspcfg-$(CONFIG_SND_INTEL_NHLT) += intel-nhlt.o
 obj-$(CONFIG_SND_INTEL_DSP_CONFIG) += snd-intel-dspcfg.o
 
-snd-intel-sdw-acpi-objs := intel-sdw-acpi.o
+snd-intel-sdw-acpi-y := intel-sdw-acpi.o
 obj-$(CONFIG_SND_INTEL_SOUNDWIRE_ACPI) += snd-intel-sdw-acpi.o
diff --git a/sound/hda/ext/Makefile b/sound/hda/ext/Makefile
index 154779bdc0ba..05883fb28d28 100644
--- a/sound/hda/ext/Makefile
+++ b/sound/hda/ext/Makefile
@@ -1,4 +1,4 @@
 # SPDX-License-Identifier: GPL-2.0-only
-snd-hda-ext-core-objs := hdac_ext_bus.o hdac_ext_controller.o hdac_ext_stream.o
+snd-hda-ext-core-y := hdac_ext_bus.o hdac_ext_controller.o hdac_ext_stream.o
 
 obj-$(CONFIG_SND_HDA_EXT_CORE) += snd-hda-ext-core.o
-- 
2.43.0

