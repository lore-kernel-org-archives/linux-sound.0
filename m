Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79F8614F70
	for <linux-sound@vger.kernel.org>; Wed, 30 Jul 2025 06:46:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753858013; cv=none; b=VTd9YSuTTIyvpP7fAcKSrnbFnb1bLnCO0eftyDSr39MZgHC39PNdk6PeTkZ6AY9K/EjOzWlMqWbPCiZixyxzoreibQYAqDaT+TmKnZ5FaznMkgyQEhih4kfStNGgQB14+WO/8FNLjHVbIZ5/TJbWuB9yzV1ESCCUzESEjt95iQw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753858013; c=relaxed/simple;
	bh=0tNLrZmbLjA7nbn1pT0AUtj7UEExNKDXNyLKH7LeCK4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ZPcRs8JoC72q/oaPW+Vngy8BkmBpoBWq9ZV0LlCJ6nO+gYplxISfRJhlCYAQHCrITSjlBUzEh4a3JWapGdrO+PJmTLRfkhS8W1YVfZWHM+tRxByE7ExZtdvtGUneigUuqJzB8Ugrh7qKjl4IbqdM7JEqzsIfcJ8+OSmvTForAao=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=nuV16azX; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=c4dAxAnP; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=0yLaBEDS; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=zokWpKck; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="nuV16azX";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="c4dAxAnP";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="0yLaBEDS";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="zokWpKck"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id E942221A9C;
	Wed, 30 Jul 2025 06:46:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1753858003; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=LvLmCraCDap+tqzlHKguj6md24avnVVineLwcqLGu+0=;
	b=nuV16azXZVvZxVi1CGyAEqblMQDcW3hnOWCZ2O3NdMusyxfR7FAE/w1DHqpoO/qn2mywGJ
	YaKxGWB1GHtFnXJD3w+FBU/iwISVDZHAo+v919xE4K3idcG4uihxxLsund9RNHZoissn81
	xm3MNqtJBAQmBSLdQBG8ktIe0vsbs0g=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1753858003;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=LvLmCraCDap+tqzlHKguj6md24avnVVineLwcqLGu+0=;
	b=c4dAxAnPMtZAAZs9kBf69yDmzsmS5XVnVDg/gGL+auEKEjCjjy4dQWUYAgVyfXzSP5+knK
	mZ2cqp3JDpClFdDg==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1753858002; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=LvLmCraCDap+tqzlHKguj6md24avnVVineLwcqLGu+0=;
	b=0yLaBEDSUkEJHIMy7ugYznxh0RuENaDYOHof+QpmwbW2qwkaeo0RjNAT7oI894b36Hg6KW
	WaiaYvpYJXS8PfZF0ZAyLEMMQR/vQkEdIc5qpnlnajwtV3+SokXogYaMAoDPK4tqGGgzPP
	xRtlUZTOSBgL6fKE68FZ+KTYIS6XUrI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1753858002;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=LvLmCraCDap+tqzlHKguj6md24avnVVineLwcqLGu+0=;
	b=zokWpKckbL1RUjQ4sqrfmWUbMh/f3czf67hLHLG599SR+P63B+hvyZmtYtEu94mMVblEeR
	hcBqNN2njI6Wf/BA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id CAFBF13A9F;
	Wed, 30 Jul 2025 06:46:42 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id qM1FMNK/iWigOAAAD6G6ig
	(envelope-from <tiwai@suse.de>); Wed, 30 Jul 2025 06:46:42 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Cc: Linus Torvalds <torvalds@linux-foundation.org>
Subject: [PATCH 3/3] ALSA: hda/hdmi: Enable drivers as default
Date: Wed, 30 Jul 2025 08:46:35 +0200
Message-ID: <20250730064639.25617-4-tiwai@suse.de>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250730064639.25617-1-tiwai@suse.de>
References: <20250730064639.25617-1-tiwai@suse.de>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Level: 
X-Spamd-Result: default: False [-2.80 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	NEURAL_HAM_SHORT(-0.20)[-0.999];
	MIME_GOOD(-0.10)[text/plain];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	ARC_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,suse.de:email,suse.de:mid];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	RCPT_COUNT_TWO(0.00)[2];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_ALL(0.00)[]
X-Spam-Flag: NO
X-Spam-Score: -2.80

Like other HD-audio codec drivers, HD-audio HDMI codec driver was
split to multiple drivers, and now users are forced to choose the
right kconfig items.

For smoother upgrade path, keep the previous CONFIG_SND_HDA_CODEC_HDMI
as the meuconfig, so that the kconfig can be taken over from the
previous config.  The all belonging HDMI codec drivers are enabled as
default as long as CONFIG_SND_HDA_CODEC_HDMI is set.

This is only about the default config, and each driver can be still
disabled if user wants to reduce the size, too.

The kconfig for the generic HDMI driver is changed to
CONFIG_SND_HDA_CODEC_HDMI_GENERIC along with this action.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/hda/codecs/hdmi/Kconfig  | 24 +++++++++++++++++++-----
 sound/hda/codecs/hdmi/Makefile |  2 +-
 2 files changed, 20 insertions(+), 6 deletions(-)

diff --git a/sound/hda/codecs/hdmi/Kconfig b/sound/hda/codecs/hdmi/Kconfig
index 498000d2c6ae..973ca4ca077b 100644
--- a/sound/hda/codecs/hdmi/Kconfig
+++ b/sound/hda/codecs/hdmi/Kconfig
@@ -1,9 +1,15 @@
 # SPDX-License-Identifier: GPL-2.0-only
 
-config SND_HDA_CODEC_HDMI
+menuconfig SND_HDA_CODEC_HDMI
+	tristate "HD-audio HDMI codec support"
+
+if SND_HDA_CODEC_HDMI
+
+config SND_HDA_CODEC_HDMI_GENERIC
 	tristate "Generic HDMI/DisplayPort HD-audio codec support"
 	select SND_DYNAMIC_MINORS
 	select SND_PCM_ELD
+	default y
 	help
 	  Say Y or M here to include Generic HDMI and DisplayPort HD-audio
 	  codec support.
@@ -13,13 +19,15 @@ config SND_HDA_CODEC_HDMI
 
 config SND_HDA_CODEC_HDMI_SIMPLE
 	tristate "Simple HDMI/DisplayPort HD-audio codec support"
+	default y
 	help
 	  Say Y or M here to include Simple HDMI and DisplayPort HD-audio
 	  codec support for VIA and other codecs.
 
 config SND_HDA_CODEC_HDMI_INTEL
 	tristate "Intel HDMI/DisplayPort HD-audio codec support"
-	select SND_HDA_CODEC_HDMI
+	select SND_HDA_CODEC_HDMI_GENERIC
+	default y
 	help
 	  Say Y or M here to include Intel graphics HDMI and DisplayPort
 	  HD-audio codec support.
@@ -41,14 +49,16 @@ config SND_HDA_INTEL_HDMI_SILENT_STREAM
 
 config SND_HDA_CODEC_HDMI_ATI
 	tristate "AMD/ATI HDMI/DisplayPort HD-audio codec support"
-	select SND_HDA_CODEC_HDMI
+	select SND_HDA_CODEC_HDMI_GENERIC
+	default y
 	help
 	  Say Y or M here to include AMD/ATI graphics HDMI and DisplayPort
 	  HD-audio codec support.
 
 config SND_HDA_CODEC_HDMI_NVIDIA
 	tristate "Nvidia HDMI/DisplayPort HD-audio codec support"
-	select SND_HDA_CODEC_HDMI
+	select SND_HDA_CODEC_HDMI_GENERIC
+	default y
 	help
 	  Say Y or M here to include HDMI and DisplayPort HD-audio codec
 	  support for the recent Nvidia graphics cards.
@@ -56,13 +66,17 @@ config SND_HDA_CODEC_HDMI_NVIDIA
 config SND_HDA_CODEC_HDMI_NVIDIA_MCP
 	tristate "Legacy Nvidia HDMI/DisplayPort HD-audio codec support"
 	select SND_HDA_CODEC_HDMI_SIMPLE
+	default y
 	help
 	  Say Y or M here to include HDMI and DisplayPort HD-audio codec
 	  support for the legacy Nvidia graphics like MCP73, MCP67, MCP77/78.
 
 config SND_HDA_CODEC_HDMI_TEGRA
 	tristate "Nvidia Tegra HDMI/DisplayPort HD-audio codec support"
-	select SND_HDA_CODEC_HDMI
+	select SND_HDA_CODEC_HDMI_GENERIC
+	default y
 	help
 	  Say Y or M here to include HDMI and DisplayPort HD-audio codec
 	  support for Nvidia Tegra.
+
+endif
diff --git a/sound/hda/codecs/hdmi/Makefile b/sound/hda/codecs/hdmi/Makefile
index c07a0a71b64f..0e49a9421e3b 100644
--- a/sound/hda/codecs/hdmi/Makefile
+++ b/sound/hda/codecs/hdmi/Makefile
@@ -9,7 +9,7 @@ snd-hda-codec-nvhdmi-y :=	nvhdmi.o
 snd-hda-codec-nvhdmi-mcp-y :=	nvhdmi-mcp.o
 snd-hda-codec-tegrahdmi-y :=	tegrahdmi.o
 
-obj-$(CONFIG_SND_HDA_CODEC_HDMI) += snd-hda-codec-hdmi.o
+obj-$(CONFIG_SND_HDA_CODEC_HDMI_GENERIC) += snd-hda-codec-hdmi.o
 obj-$(CONFIG_SND_HDA_CODEC_HDMI_SIMPLE) += snd-hda-codec-simplehdmi.o
 obj-$(CONFIG_SND_HDA_CODEC_HDMI_INTEL) += snd-hda-codec-intelhdmi.o
 obj-$(CONFIG_SND_HDA_CODEC_HDMI_ATI) += snd-hda-codec-atihdmi.o
-- 
2.50.1

