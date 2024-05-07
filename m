Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C98CC165FB3
	for <linux-sound@vger.kernel.org>; Tue,  7 May 2024 13:55:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715090115; cv=none; b=JCC2fR2oBhCaOIclCcTuooaqq02Q6MRRPe+uPIAJW7bML7NoMIpMIQ9Lt45lgJDAmQXumM01wHTxs2dY0JAt9lBNKu94H+uOX47W83VG90zSphNMrvnVLQ6o63GjJ4m437lsMUDDNwugl4DtqAtt6nIIOMbylVn/jwbNCDAtMtc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715090115; c=relaxed/simple;
	bh=RgGfXJRcX9di6wYuszvPxNJOUfLnVt2cR86PD90i4lw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=R5FUpgoV3sLhgxEooZk0sU8STNiQPKInPgDUclp0Jqa1zS9YmkCVzh27Lju8uip0RDpYrggbasN9osix/4GzkwHcHVm5qSqy+n0percOIlw0IS992BpcpTQSMRxW5SNXuECO1dOguHkNo0uFgrsxGVqzGRZ0E8CLwPl8l/lSMOM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 0682933FBB;
	Tue,  7 May 2024 13:55:09 +0000 (UTC)
Authentication-Results: smtp-out1.suse.de;
	none
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id EB29013A3A;
	Tue,  7 May 2024 13:55:08 +0000 (UTC)
Received: from dovecot-director2.suse.de ([10.150.64.162])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id qILdOLwyOmagMgAAD6G6ig
	(envelope-from <tiwai@suse.de>); Tue, 07 May 2024 13:55:08 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Takashi Iwai <tiwai@suse.de>
Subject: [PATCH 8/9] ALSA: aoa: Use *-y instead of *-objs in Makefile
Date: Tue,  7 May 2024 15:55:08 +0200
Message-ID: <20240507135513.14919-9-tiwai@suse.de>
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
X-Rspamd-Queue-Id: 0682933FBB

*-objs suffix is reserved rather for (user-space) host programs while
usually *-y suffix is used for kernel drivers (although *-objs works
for that purpose for now).

Let's correct the old usages of *-objs in Makefiles.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/aoa/codecs/Makefile          | 6 +++---
 sound/aoa/core/Makefile            | 2 +-
 sound/aoa/fabrics/Makefile         | 2 +-
 sound/aoa/soundbus/Makefile        | 2 +-
 sound/aoa/soundbus/i2sbus/Makefile | 2 +-
 5 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/sound/aoa/codecs/Makefile b/sound/aoa/codecs/Makefile
index 95f4c3849d55..8feedc771bd9 100644
--- a/sound/aoa/codecs/Makefile
+++ b/sound/aoa/codecs/Makefile
@@ -1,7 +1,7 @@
 # SPDX-License-Identifier: GPL-2.0
-snd-aoa-codec-onyx-objs := onyx.o
-snd-aoa-codec-tas-objs := tas.o
-snd-aoa-codec-toonie-objs := toonie.o
+snd-aoa-codec-onyx-y := onyx.o
+snd-aoa-codec-tas-y := tas.o
+snd-aoa-codec-toonie-y := toonie.o
 
 obj-$(CONFIG_SND_AOA_ONYX) += snd-aoa-codec-onyx.o
 obj-$(CONFIG_SND_AOA_TAS) += snd-aoa-codec-tas.o
diff --git a/sound/aoa/core/Makefile b/sound/aoa/core/Makefile
index 056d69683b1e..f586c340fe12 100644
--- a/sound/aoa/core/Makefile
+++ b/sound/aoa/core/Makefile
@@ -1,6 +1,6 @@
 # SPDX-License-Identifier: GPL-2.0
 obj-$(CONFIG_SND_AOA) += snd-aoa.o
-snd-aoa-objs := core.o \
+snd-aoa-y := core.o \
 		alsa.o \
 		gpio-pmf.o \
 		gpio-feature.o
diff --git a/sound/aoa/fabrics/Makefile b/sound/aoa/fabrics/Makefile
index 3f1d55f3f1fc..2c3bee6cfa2c 100644
--- a/sound/aoa/fabrics/Makefile
+++ b/sound/aoa/fabrics/Makefile
@@ -1,4 +1,4 @@
 # SPDX-License-Identifier: GPL-2.0-only
-snd-aoa-fabric-layout-objs += layout.o
+snd-aoa-fabric-layout-y += layout.o
 
 obj-$(CONFIG_SND_AOA_FABRIC_LAYOUT) += snd-aoa-fabric-layout.o
diff --git a/sound/aoa/soundbus/Makefile b/sound/aoa/soundbus/Makefile
index e0b61cf5518e..a10b102daf81 100644
--- a/sound/aoa/soundbus/Makefile
+++ b/sound/aoa/soundbus/Makefile
@@ -1,4 +1,4 @@
 # SPDX-License-Identifier: GPL-2.0-only
 obj-$(CONFIG_SND_AOA_SOUNDBUS) += snd-aoa-soundbus.o
-snd-aoa-soundbus-objs := core.o sysfs.o
+snd-aoa-soundbus-y := core.o sysfs.o
 obj-$(CONFIG_SND_AOA_SOUNDBUS_I2S) += i2sbus/
diff --git a/sound/aoa/soundbus/i2sbus/Makefile b/sound/aoa/soundbus/i2sbus/Makefile
index 1b38c87fef09..1ddaa0e17d67 100644
--- a/sound/aoa/soundbus/i2sbus/Makefile
+++ b/sound/aoa/soundbus/i2sbus/Makefile
@@ -1,3 +1,3 @@
 # SPDX-License-Identifier: GPL-2.0-only
 obj-$(CONFIG_SND_AOA_SOUNDBUS_I2S) += snd-aoa-i2sbus.o
-snd-aoa-i2sbus-objs := core.o pcm.o control.o
+snd-aoa-i2sbus-y := core.o pcm.o control.o
-- 
2.43.0

