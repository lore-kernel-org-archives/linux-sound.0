Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 190F715ECF3
	for <linux-sound@vger.kernel.org>; Tue,  7 May 2024 13:55:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715090115; cv=none; b=Lvx0urmRhfOfr0YPl22LNNh2QSEN4x8zrWS2kakmgeSnIPy4YdVPjbf/RKWuwFNzG+YAb7hCsTlihQUhP1GBir3w31pnbq7vnbjUn5cTTSfxNRkp0ovgyuo9sba5fwRimqOKoWJGGdaSm0K53JcAvn5BSedbuKWJ7SfOghLgn5A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715090115; c=relaxed/simple;
	bh=TbK9PPP4xvP5R1S4xeUk8wy+CMUsH2OXxT8Jxa/umYg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Jkkq6INjq1fHoA8t8pmzAdSzRrpfXSPq+QT0k8aYUFUlvLMeo4COAbiRN0WAew6KBWyyVbyOsKML3CIM+MM46vXz0nY5pOPzm/PwP6ZG78qrpQvW12Gt7/Qx91eK+RYdC4gBzOsz3MdgGQgI1dHmWtfPOCIwYgxemKlYI67bvUE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=oz3rTkFW; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=BeRyxlI3; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=sXHv9VzE; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=BB2tnm92; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="oz3rTkFW";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="BeRyxlI3";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="sXHv9VzE";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="BB2tnm92"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id EB4EC33FBA;
	Tue,  7 May 2024 13:55:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1715090109; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=xh4U1gO1qKFVR3wi5eLh5pO+JbBEgWQbfeXBUsdpONk=;
	b=oz3rTkFW/GRcZ4VKtQ8JkSUzZBs3A6oTgdnyN5t9/rO8owwCfPsm97kIwFRpMlJ2O4WUhH
	9sSHQqNcAnyBrf0A+wUv4eee95XChdlzbz4wdoi8mO+qOOz2CIznQFdS0CatX1l8oFZ1/W
	9l+VJcxnJ2NuF3QS5wJGRgFQH/hJ7Jw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1715090109;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=xh4U1gO1qKFVR3wi5eLh5pO+JbBEgWQbfeXBUsdpONk=;
	b=BeRyxlI36WSIETUx1Mjfe5ugrKwXtzJ+LKsNrkn1PtozUsDfknzCdWgSg9kL26lQmkEDKt
	TGNq6VmLLi/39cCg==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1715090108; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=xh4U1gO1qKFVR3wi5eLh5pO+JbBEgWQbfeXBUsdpONk=;
	b=sXHv9VzEcCf3hX2/+Z5PRj0Dk73iwjPKjnwTrO6b26Lt8JgpBMIi0aYZ+bikDJm0hKPdSV
	qY5g1EYrp/CRnWW+hQkU8n03LYSMUsiyXTcnrL0Q3JLGKXPU7xYPv/Qr2/FehhPIb4YcB+
	pV3w/g7LcGbVEta73zGaoDbUXATKluU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1715090108;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=xh4U1gO1qKFVR3wi5eLh5pO+JbBEgWQbfeXBUsdpONk=;
	b=BB2tnm92jdHg6akfJft8a3MEWO1nbiYNcJ2KDrVgJiNDhPvbumxIfCaeupp7OPyazts7BC
	7ygJs+zgpPIaudCQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id D883813A2D;
	Tue,  7 May 2024 13:55:08 +0000 (UTC)
Received: from dovecot-director2.suse.de ([10.150.64.162])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id 8PVONLwyOmagMgAAD6G6ig
	(envelope-from <tiwai@suse.de>); Tue, 07 May 2024 13:55:08 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Takashi Iwai <tiwai@suse.de>,
	Takashi Sakamoto <o-takashi@sakamocchi.jp>
Subject: [PATCH 7/9] ALSA: firewire: Use *-y instead of *-objs in Makefile
Date: Tue,  7 May 2024 15:55:07 +0200
Message-ID: <20240507135513.14919-8-tiwai@suse.de>
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
X-Spam-Flag: NO
X-Spam-Score: -6.80
X-Spam-Level: 
X-Spamd-Result: default: False [-6.80 / 50.00];
	REPLY(-4.00)[];
	BAYES_HAM(-3.00)[100.00%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ARC_NA(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:email];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	RCVD_TLS_ALL(0.00)[]

*-objs suffix is reserved rather for (user-space) host programs while
usually *-y suffix is used for kernel drivers (although *-objs works
for that purpose for now).

Let's correct the old usages of *-objs in Makefiles.

Cc: Takashi Sakamoto <o-takashi@sakamocchi.jp>
Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/firewire/Makefile           | 4 ++--
 sound/firewire/bebob/Makefile     | 2 +-
 sound/firewire/dice/Makefile      | 2 +-
 sound/firewire/digi00x/Makefile   | 2 +-
 sound/firewire/fireface/Makefile  | 2 +-
 sound/firewire/fireworks/Makefile | 2 +-
 sound/firewire/motu/Makefile      | 2 +-
 sound/firewire/oxfw/Makefile      | 2 +-
 sound/firewire/tascam/Makefile    | 2 +-
 9 files changed, 10 insertions(+), 10 deletions(-)

diff --git a/sound/firewire/Makefile b/sound/firewire/Makefile
index 44a7b510b75b..45018a5c224f 100644
--- a/sound/firewire/Makefile
+++ b/sound/firewire/Makefile
@@ -2,9 +2,9 @@
 # To find a header included by define_trace.h.
 CFLAGS_amdtp-stream.o	:= -I$(src)
 
-snd-firewire-lib-objs := lib.o iso-resources.o packets-buffer.o \
+snd-firewire-lib-y := lib.o iso-resources.o packets-buffer.o \
 			 fcp.o cmp.o amdtp-stream.o amdtp-am824.o
-snd-isight-objs := isight.o
+snd-isight-y := isight.o
 
 obj-$(CONFIG_SND_FIREWIRE_LIB) += snd-firewire-lib.o
 obj-$(CONFIG_SND_DICE) += dice/
diff --git a/sound/firewire/bebob/Makefile b/sound/firewire/bebob/Makefile
index 14bc84c51ef5..b913e805bd7a 100644
--- a/sound/firewire/bebob/Makefile
+++ b/sound/firewire/bebob/Makefile
@@ -1,5 +1,5 @@
 # SPDX-License-Identifier: GPL-2.0
-snd-bebob-objs := bebob_command.o bebob_stream.o bebob_proc.o bebob_midi.o \
+snd-bebob-y := bebob_command.o bebob_stream.o bebob_proc.o bebob_midi.o \
 		  bebob_pcm.o bebob_hwdep.o bebob_terratec.o \
 		  bebob_yamaha_terratec.o bebob_focusrite.o bebob_maudio.o \
 		  bebob.o
diff --git a/sound/firewire/dice/Makefile b/sound/firewire/dice/Makefile
index bac8712f9014..36e25a3cf3c6 100644
--- a/sound/firewire/dice/Makefile
+++ b/sound/firewire/dice/Makefile
@@ -1,5 +1,5 @@
 # SPDX-License-Identifier: GPL-2.0-only
-snd-dice-objs := dice-transaction.o dice-stream.o dice-proc.o dice-midi.o \
+snd-dice-y := dice-transaction.o dice-stream.o dice-proc.o dice-midi.o \
 		 dice-pcm.o dice-hwdep.o dice.o dice-tcelectronic.o \
 		 dice-alesis.o dice-extension.o dice-mytek.o dice-presonus.o \
 		 dice-harman.o dice-focusrite.o dice-weiss.o
diff --git a/sound/firewire/digi00x/Makefile b/sound/firewire/digi00x/Makefile
index 8add0cd9af3a..6dc18bd2e186 100644
--- a/sound/firewire/digi00x/Makefile
+++ b/sound/firewire/digi00x/Makefile
@@ -1,5 +1,5 @@
 # SPDX-License-Identifier: GPL-2.0-only
-snd-firewire-digi00x-objs := amdtp-dot.o digi00x-stream.o digi00x-proc.o \
+snd-firewire-digi00x-y := amdtp-dot.o digi00x-stream.o digi00x-proc.o \
 			     digi00x-pcm.o digi00x-hwdep.o \
 			     digi00x-transaction.o digi00x-midi.o digi00x.o
 obj-$(CONFIG_SND_FIREWIRE_DIGI00X) += snd-firewire-digi00x.o
diff --git a/sound/firewire/fireface/Makefile b/sound/firewire/fireface/Makefile
index 3aef221ce4b0..b397d95877a0 100644
--- a/sound/firewire/fireface/Makefile
+++ b/sound/firewire/fireface/Makefile
@@ -1,5 +1,5 @@
 # SPDX-License-Identifier: GPL-2.0-only
-snd-fireface-objs := ff.o ff-transaction.o ff-midi.o ff-proc.o amdtp-ff.o \
+snd-fireface-y := ff.o ff-transaction.o ff-midi.o ff-proc.o amdtp-ff.o \
 		     ff-stream.o ff-pcm.o ff-hwdep.o ff-protocol-former.o \
 		     ff-protocol-latter.o
 obj-$(CONFIG_SND_FIREFACE) += snd-fireface.o
diff --git a/sound/firewire/fireworks/Makefile b/sound/firewire/fireworks/Makefile
index 3386121b2a04..baaf3066c9b1 100644
--- a/sound/firewire/fireworks/Makefile
+++ b/sound/firewire/fireworks/Makefile
@@ -1,5 +1,5 @@
 # SPDX-License-Identifier: GPL-2.0-only
-snd-fireworks-objs := fireworks_transaction.o fireworks_command.o \
+snd-fireworks-y := fireworks_transaction.o fireworks_command.o \
 		      fireworks_stream.o fireworks_proc.o fireworks_midi.o \
 		      fireworks_pcm.o fireworks_hwdep.o fireworks.o
 obj-$(CONFIG_SND_FIREWORKS) += snd-fireworks.o
diff --git a/sound/firewire/motu/Makefile b/sound/firewire/motu/Makefile
index 3bef2a0b1e2e..df0fe886dbc0 100644
--- a/sound/firewire/motu/Makefile
+++ b/sound/firewire/motu/Makefile
@@ -1,7 +1,7 @@
 # SPDX-License-Identifier: GPL-2.0
 CFLAGS_amdtp-motu.o	:= -I$(src)
 
-snd-firewire-motu-objs := motu.o amdtp-motu.o motu-transaction.o motu-stream.o \
+snd-firewire-motu-y := motu.o amdtp-motu.o motu-transaction.o motu-stream.o \
 			  motu-proc.o motu-pcm.o motu-midi.o motu-hwdep.o \
 			  motu-protocol-v2.o motu-protocol-v3.o \
 			  motu-protocol-v1.o motu-register-dsp-message-parser.o \
diff --git a/sound/firewire/oxfw/Makefile b/sound/firewire/oxfw/Makefile
index 669d1e8238df..9ac8893a926f 100644
--- a/sound/firewire/oxfw/Makefile
+++ b/sound/firewire/oxfw/Makefile
@@ -1,4 +1,4 @@
 # SPDX-License-Identifier: GPL-2.0-only
-snd-oxfw-objs := oxfw-command.o oxfw-stream.o oxfw-pcm.o oxfw-proc.o \
+snd-oxfw-y := oxfw-command.o oxfw-stream.o oxfw-pcm.o oxfw-proc.o \
 		 oxfw-midi.o oxfw-hwdep.o oxfw-spkr.o oxfw-scs1x.o oxfw.o
 obj-$(CONFIG_SND_OXFW) += snd-oxfw.o
diff --git a/sound/firewire/tascam/Makefile b/sound/firewire/tascam/Makefile
index a1d21f244d64..43fed14cf172 100644
--- a/sound/firewire/tascam/Makefile
+++ b/sound/firewire/tascam/Makefile
@@ -1,5 +1,5 @@
 # SPDX-License-Identifier: GPL-2.0-only
-snd-firewire-tascam-objs := tascam-proc.o amdtp-tascam.o tascam-stream.o \
+snd-firewire-tascam-y := tascam-proc.o amdtp-tascam.o tascam-stream.o \
 			    tascam-pcm.o tascam-hwdep.o tascam-transaction.o \
 			    tascam-midi.o tascam.o
 obj-$(CONFIG_SND_FIREWIRE_TASCAM) += snd-firewire-tascam.o
-- 
2.43.0

