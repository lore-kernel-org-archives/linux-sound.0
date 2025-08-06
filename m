Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DE1117A2FC
	for <linux-sound@vger.kernel.org>; Wed,  6 Aug 2025 19:25:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754508349; cv=none; b=Txm3hX55KA4pYfP0dms4K5trC+eK0k9SYc4MkZuMKnolC1fcp0PJjFz5gL6Sic21O49guiKaq9in+5a7/Im/ek2eEKBknzs1yWB3fr99CL0T8gv3TJnq86g8WBECav9Er0TUKPnBoGFzFz0ssmeAOUSR5ucRUbDT2BzwCbXN2jM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754508349; c=relaxed/simple;
	bh=cpu64rm49cvUBHOiI7QQAA5ZkibeeaCobgMQtSzlNqo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=KmnRvYyf7iGL9m4wlHOG+04Hyw0O6ktPRFLqXqv30xsddtDm6eRkDVPgfcTufRDcc/AmBz+Zu4iuMKkFEQE1CSlElhbAGwkbWmZh3eyKAzJBKSp/lCgpNMTpT1Fc1UhewXsQ2dg91MkzzJjlVD6iTGu5IYCKFq2YQ8FSYTDaYMw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=pi2dkAhJ; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=TJIrGVcM; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=pi2dkAhJ; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=TJIrGVcM; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="pi2dkAhJ";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="TJIrGVcM";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="pi2dkAhJ";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="TJIrGVcM"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id B1E3A22D05;
	Wed,  6 Aug 2025 19:25:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1754508345; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=pgtDoULKukoj4lqnjPRs2FrRGt4Weo9b/kWebDUEe6c=;
	b=pi2dkAhJqN3K1knNdQANmiLKkCfyyAMIH7L/fvHkeK/TzPa/NNGnglcxMiN+uUiQ77he5w
	pQ73yvmG3zqsseqIuPdu/Gi2apuZpu+L0q4qy+CBeiFO6p9m9Q4jeHy3SFXvejf1R5SzP9
	dW8F2Tq3+vKmD/rbKxuH75IcSXquuXA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1754508345;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=pgtDoULKukoj4lqnjPRs2FrRGt4Weo9b/kWebDUEe6c=;
	b=TJIrGVcMJZGYaYF+N80PcVikXc3+LL+Q2/sllvK4IfUajSaJYk2HmTTgvW42yUGX+WYfZl
	sQKauTMFvW/KF0AA==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=pi2dkAhJ;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=TJIrGVcM
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1754508345; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=pgtDoULKukoj4lqnjPRs2FrRGt4Weo9b/kWebDUEe6c=;
	b=pi2dkAhJqN3K1knNdQANmiLKkCfyyAMIH7L/fvHkeK/TzPa/NNGnglcxMiN+uUiQ77he5w
	pQ73yvmG3zqsseqIuPdu/Gi2apuZpu+L0q4qy+CBeiFO6p9m9Q4jeHy3SFXvejf1R5SzP9
	dW8F2Tq3+vKmD/rbKxuH75IcSXquuXA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1754508345;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=pgtDoULKukoj4lqnjPRs2FrRGt4Weo9b/kWebDUEe6c=;
	b=TJIrGVcMJZGYaYF+N80PcVikXc3+LL+Q2/sllvK4IfUajSaJYk2HmTTgvW42yUGX+WYfZl
	sQKauTMFvW/KF0AA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 904CE13AFC;
	Wed,  6 Aug 2025 19:25:45 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id KJfxITmsk2i0WAAAD6G6ig
	(envelope-from <tiwai@suse.de>); Wed, 06 Aug 2025 19:25:45 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Cc: Paul Menzel <pmenzel@molgen.mpg.de>,
	Hans de Goede <hansg@kernel.org>
Subject: [PATCH 2/3] ALSA: hda/hdmi: Restrict prompt only for CONFIG_EXPERT
Date: Wed,  6 Aug 2025 21:25:38 +0200
Message-ID: <20250806192541.21949-3-tiwai@suse.de>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250806192541.21949-1-tiwai@suse.de>
References: <20250806192541.21949-1-tiwai@suse.de>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Level: 
X-Spam-Flag: NO
X-Rspamd-Queue-Id: B1E3A22D05
X-Rspamd-Action: no action
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spamd-Result: default: False [-3.01 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:dkim,suse.de:mid,suse.de:email];
	ARC_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	RCVD_TLS_ALL(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	RCPT_COUNT_THREE(0.00)[3];
	DKIM_TRACE(0.00)[suse.de:+]
X-Spam-Score: -3.01

The split of HDMI codec driver may confuse users when migrating from
the previous kernel configs and leave some drivers disabled
unexpectedly.  Although we've already set y to all HDMI codec drivers
as default, it's still safer to paper over the wrong choices.

This patch marks the prompt of each HDMI codec driver with
CONFIG_EXPERT, so that they are all enabled when the top-level
CONFIG_SND_HDA_CODEC_HDMI is set.

For users who really care about the minimalistic configuration, they
can turn each driver on/off individually after setting
CONFIG_EXPERT=y.

The patch also adds the missing help text to the top-level
CONFIG_SND_HDA_CODEC_HDMI together with the explanation of individual
choices, too.

Fixes: 73cd0490819d ("ALSA: hda/hdmi: Split vendor codec drivers")
Link: https://lore.kernel.org/10172c80-daec-4e20-ab57-a483cf1afc02@molgen.mpg.de
Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/hda/codecs/hdmi/Kconfig | 20 +++++++++++++-------
 1 file changed, 13 insertions(+), 7 deletions(-)

diff --git a/sound/hda/codecs/hdmi/Kconfig b/sound/hda/codecs/hdmi/Kconfig
index 973ca4ca077b..6ea3553ba9f8 100644
--- a/sound/hda/codecs/hdmi/Kconfig
+++ b/sound/hda/codecs/hdmi/Kconfig
@@ -2,11 +2,17 @@
 
 menuconfig SND_HDA_CODEC_HDMI
 	tristate "HD-audio HDMI codec support"
+	help
+	  Say Y or M here to include HD-audio HDMI/DislayPort codec support.
+
+	  This will enable all HDMI/DP codec drivers as default, but you can
+	  enable/disable each codec driver individually, too (only when
+	  CONFIG_EXPERT is set).
 
 if SND_HDA_CODEC_HDMI
 
 config SND_HDA_CODEC_HDMI_GENERIC
-	tristate "Generic HDMI/DisplayPort HD-audio codec support"
+	tristate "Generic HDMI/DisplayPort HD-audio codec support" if EXPERT
 	select SND_DYNAMIC_MINORS
 	select SND_PCM_ELD
 	default y
@@ -18,14 +24,14 @@ config SND_HDA_CODEC_HDMI_GENERIC
 	  to assure the multiple streams for DP-MST support.
 
 config SND_HDA_CODEC_HDMI_SIMPLE
-	tristate "Simple HDMI/DisplayPort HD-audio codec support"
+	tristate "Simple HDMI/DisplayPort HD-audio codec support" if EXPERT
 	default y
 	help
 	  Say Y or M here to include Simple HDMI and DisplayPort HD-audio
 	  codec support for VIA and other codecs.
 
 config SND_HDA_CODEC_HDMI_INTEL
-	tristate "Intel HDMI/DisplayPort HD-audio codec support"
+	tristate "Intel HDMI/DisplayPort HD-audio codec support" if EXPERT
 	select SND_HDA_CODEC_HDMI_GENERIC
 	default y
 	help
@@ -48,7 +54,7 @@ config SND_HDA_INTEL_HDMI_SILENT_STREAM
 	  are kept reserved both at transmitter and receiver.
 
 config SND_HDA_CODEC_HDMI_ATI
-	tristate "AMD/ATI HDMI/DisplayPort HD-audio codec support"
+	tristate "AMD/ATI HDMI/DisplayPort HD-audio codec support" if EXPERT
 	select SND_HDA_CODEC_HDMI_GENERIC
 	default y
 	help
@@ -56,7 +62,7 @@ config SND_HDA_CODEC_HDMI_ATI
 	  HD-audio codec support.
 
 config SND_HDA_CODEC_HDMI_NVIDIA
-	tristate "Nvidia HDMI/DisplayPort HD-audio codec support"
+	tristate "Nvidia HDMI/DisplayPort HD-audio codec support" if EXPERT
 	select SND_HDA_CODEC_HDMI_GENERIC
 	default y
 	help
@@ -64,7 +70,7 @@ config SND_HDA_CODEC_HDMI_NVIDIA
 	  support for the recent Nvidia graphics cards.
 
 config SND_HDA_CODEC_HDMI_NVIDIA_MCP
-	tristate "Legacy Nvidia HDMI/DisplayPort HD-audio codec support"
+	tristate "Legacy Nvidia HDMI/DisplayPort HD-audio codec support" if EXPERT
 	select SND_HDA_CODEC_HDMI_SIMPLE
 	default y
 	help
@@ -72,7 +78,7 @@ config SND_HDA_CODEC_HDMI_NVIDIA_MCP
 	  support for the legacy Nvidia graphics like MCP73, MCP67, MCP77/78.
 
 config SND_HDA_CODEC_HDMI_TEGRA
-	tristate "Nvidia Tegra HDMI/DisplayPort HD-audio codec support"
+	tristate "Nvidia Tegra HDMI/DisplayPort HD-audio codec support" if EXPERT
 	select SND_HDA_CODEC_HDMI_GENERIC
 	default y
 	help
-- 
2.50.1

