Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCC1C3C01
	for <linux-sound@vger.kernel.org>; Wed,  6 Aug 2025 19:25:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754508355; cv=none; b=FUynPNYcoF4Mxxi7GyVITA+Ut6h1LOyxO3bh1lgQVOFYcYNzXbfl8eHGKBo2S0m3ZQXckXkMBeqjdV2EK4hoOiAxKV0/9aiy21Q95CVwsgCOmj8I1BeqZml9X8+zcdIYMV4Txh7yV92yGX6pf9Y6eAKBf0RtgXcFeUIQpwxaQTw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754508355; c=relaxed/simple;
	bh=AfEDC6Ap1iI1vHs1L6VP5ivywfZ1WqarXRI0NZU3tRA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=jvGTFCovzRHO/9040EZffZhmWD56l0wxSugM+99xa5KwTeNb6qcfyhhpWa3J4lPHucBQYyWikY4U1hOJF8kkiEc4znEcXbyEOGkRG9rpXp9A7sblzYlGs9vptQowqY4QkMIqVwTRHhA6LSuxD6f1vmyXCANCKDuClVgjQWfmhoA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=OHMDv40K; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=w2UrCRuL; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=OHMDv40K; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=w2UrCRuL; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="OHMDv40K";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="w2UrCRuL";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="OHMDv40K";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="w2UrCRuL"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 8DE70207E2;
	Wed,  6 Aug 2025 19:25:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1754508345; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=cZtlvirmX9WlYR74RGSCnooP1eODGGjr3GYkfPVkNJg=;
	b=OHMDv40K+4qtUOwgktrFcr9r6+MSn4MUv1T03wgOoGD60aVLdVs2hClgtLlLX25EP9ieZR
	yVUDXGPfouE/TQNRzEumCQjCU84YKlWBCmMg05M4YOTW0+LbYIXsC7lsN+/17E3qmY86g5
	/Yo14dOpZ/Ug1mgr0bPtpeBUlgK6xus=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1754508345;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=cZtlvirmX9WlYR74RGSCnooP1eODGGjr3GYkfPVkNJg=;
	b=w2UrCRuLW8UhC0yJhwHfnwMkDwOE4+cChADu+fPW52Diqld09nDCfN/O/NtzcUob+dIvXT
	jPgtyFgfxsnScMCQ==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1754508345; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=cZtlvirmX9WlYR74RGSCnooP1eODGGjr3GYkfPVkNJg=;
	b=OHMDv40K+4qtUOwgktrFcr9r6+MSn4MUv1T03wgOoGD60aVLdVs2hClgtLlLX25EP9ieZR
	yVUDXGPfouE/TQNRzEumCQjCU84YKlWBCmMg05M4YOTW0+LbYIXsC7lsN+/17E3qmY86g5
	/Yo14dOpZ/Ug1mgr0bPtpeBUlgK6xus=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1754508345;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=cZtlvirmX9WlYR74RGSCnooP1eODGGjr3GYkfPVkNJg=;
	b=w2UrCRuLW8UhC0yJhwHfnwMkDwOE4+cChADu+fPW52Diqld09nDCfN/O/NtzcUob+dIvXT
	jPgtyFgfxsnScMCQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 67E5D13AFB;
	Wed,  6 Aug 2025 19:25:45 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id eNcuGDmsk2i0WAAAD6G6ig
	(envelope-from <tiwai@suse.de>); Wed, 06 Aug 2025 19:25:45 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Cc: Paul Menzel <pmenzel@molgen.mpg.de>,
	Hans de Goede <hansg@kernel.org>
Subject: [PATCH 1/3] ALSA: hda/realtek: Restrict prompt only for CONFIG_EXPERT
Date: Wed,  6 Aug 2025 21:25:37 +0200
Message-ID: <20250806192541.21949-2-tiwai@suse.de>
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
X-Spamd-Result: default: False [-2.80 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	NEURAL_HAM_SHORT(-0.20)[-0.999];
	MIME_GOOD(-0.10)[text/plain];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FROM_HAS_DN(0.00)[];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid,suse.de:email];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	RCPT_COUNT_THREE(0.00)[3];
	RCVD_TLS_ALL(0.00)[]
X-Spam-Flag: NO
X-Spam-Level: 
X-Spam-Score: -2.80

The split of Realtek HD-audio codec driver may cause confusions
especially when migrating from the previous kernel configurations
because it's hard to know which driver to be enabled.
Although we've already set default=y for those codec drivers, it may
still make people changing the stuff unnecessarily without knowing its
side effect.

This patch is for avoiding such pitfalls by marking the prompt of each
Realtek codec driver with CONFIG_EXPERT.  For "normal" users (that is,
unless CONFIG_EXPERT is set), all Realtek HD-audio codecs are enabled
together with CONFIG_SND_HDA_CODEC_REALTEK; this is the very same
situation like the previous kernels, after all.

For users who really care about the minimalistic configuration, they
can turn each driver on/off individually after setting
CONFIG_EXPERT=y.

The patch also adds the missing help text to the top-level
CONFIG_SND_HDA_CODEC_REALTEK together with the explanation of
individual choices, too.

Fixes: aeeb85f26c3b ("ALSA: hda: Split Realtek HD-audio codec driver")
Link: https://lore.kernel.org/10172c80-daec-4e20-ab57-a483cf1afc02@molgen.mpg.de
Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/hda/codecs/realtek/Kconfig | 28 ++++++++++++++++------------
 1 file changed, 16 insertions(+), 12 deletions(-)

diff --git a/sound/hda/codecs/realtek/Kconfig b/sound/hda/codecs/realtek/Kconfig
index 20899f3fc051..cdc6d9509a01 100644
--- a/sound/hda/codecs/realtek/Kconfig
+++ b/sound/hda/codecs/realtek/Kconfig
@@ -2,6 +2,12 @@
 
 menuconfig SND_HDA_CODEC_REALTEK
 	tristate "Realtek HD-audio codec support"
+	help
+	  Say Y or M here to include Realtek HD-audio codec support.
+
+	  This will enable all Realtek HD-audio codec drivers as default,
+	  but you can enable/disable each codec driver individually, too
+	  (only when CONFIG_EXPERT is set).
 
 if SND_HDA_CODEC_REALTEK
 
@@ -12,7 +18,7 @@ config SND_HDA_CODEC_REALTEK_LIB
 	select SND_HDA_SCODEC_COMPONENT
 
 config SND_HDA_CODEC_ALC260
-	tristate "Build Realtek ALC260 HD-audio codec support"
+	tristate "Build Realtek ALC260 HD-audio codec support" if EXPERT
 	depends on INPUT
 	select SND_HDA_CODEC_REALTEK_LIB
 	default y
@@ -20,7 +26,7 @@ config SND_HDA_CODEC_ALC260
 	  Say Y or M here to include Realtek ALC260 HD-audio codec support
 
 config SND_HDA_CODEC_ALC262
-	tristate "Build Realtek ALC262 HD-audio codec support"
+	tristate "Build Realtek ALC262 HD-audio codec support" if EXPERT
 	depends on INPUT
 	select SND_HDA_CODEC_REALTEK_LIB
 	default y
@@ -28,7 +34,7 @@ config SND_HDA_CODEC_ALC262
 	  Say Y or M here to include Realtek ALC262 HD-audio codec support
 
 config SND_HDA_CODEC_ALC268
-	tristate "Build Realtek ALC268 HD-audio codec support"
+	tristate "Build Realtek ALC268 HD-audio codec support" if EXPERT
 	depends on INPUT
 	select SND_HDA_CODEC_REALTEK_LIB
 	default y
@@ -37,7 +43,7 @@ config SND_HDA_CODEC_ALC268
 	  codec support
 
 config SND_HDA_CODEC_ALC269
-	tristate "Build Realtek ALC269 HD-audio codecs support"
+	tristate "Build Realtek ALC269 HD-audio codecs support" if EXPERT
 	depends on INPUT
 	select SND_HDA_CODEC_REALTEK_LIB
 	default y
@@ -46,7 +52,7 @@ config SND_HDA_CODEC_ALC269
 	  codec support
 
 config SND_HDA_CODEC_ALC662
-	tristate "Build Realtek ALC662 HD-audio codecs support"
+	tristate "Build Realtek ALC662 HD-audio codecs support" if EXPERT
 	depends on INPUT
 	select SND_HDA_CODEC_REALTEK_LIB
 	default y
@@ -55,7 +61,7 @@ config SND_HDA_CODEC_ALC662
 	  codec support
 
 config SND_HDA_CODEC_ALC680
-	tristate "Build Realtek ALC680 HD-audio codecs support"
+	tristate "Build Realtek ALC680 HD-audio codecs support" if EXPERT
 	depends on INPUT
 	select SND_HDA_CODEC_REALTEK_LIB
 	default y
@@ -63,7 +69,7 @@ config SND_HDA_CODEC_ALC680
 	  Say Y or M here to include Realtek ALC680 HD-audio codec support
 
 config SND_HDA_CODEC_ALC861
-	tristate "Build Realtek ALC861 HD-audio codecs support"
+	tristate "Build Realtek ALC861 HD-audio codecs support" if EXPERT
 	depends on INPUT
 	select SND_HDA_CODEC_REALTEK_LIB
 	default y
@@ -71,7 +77,7 @@ config SND_HDA_CODEC_ALC861
 	  Say Y or M here to include Realtek ALC861 HD-audio codec support
 
 config SND_HDA_CODEC_ALC861VD
-	tristate "Build Realtek ALC861-VD HD-audio codecs support"
+	tristate "Build Realtek ALC861-VD HD-audio codecs support" if EXPERT
 	depends on INPUT
 	select SND_HDA_CODEC_REALTEK_LIB
 	default y
@@ -79,7 +85,7 @@ config SND_HDA_CODEC_ALC861VD
 	  Say Y or M here to include Realtek ALC861-VD HD-audio codec support
 
 config SND_HDA_CODEC_ALC880
-	tristate "Build Realtek ALC880 HD-audio codecs support"
+	tristate "Build Realtek ALC880 HD-audio codecs support" if EXPERT
 	depends on INPUT
 	select SND_HDA_CODEC_REALTEK_LIB
 	default y
@@ -87,7 +93,7 @@ config SND_HDA_CODEC_ALC880
 	  Say Y or M here to include Realtek ALC880 HD-audio codec support
 
 config SND_HDA_CODEC_ALC882
-	tristate "Build Realtek ALC882 HD-audio codecs support"
+	tristate "Build Realtek ALC882 HD-audio codecs support" if EXPERT
 	depends on INPUT
 	select SND_HDA_CODEC_REALTEK_LIB
 	default y
@@ -96,5 +102,3 @@ config SND_HDA_CODEC_ALC882
 	  codec support
 
 endif
-
-
-- 
2.50.1

