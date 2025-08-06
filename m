Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CE5929B8DB
	for <linux-sound@vger.kernel.org>; Wed,  6 Aug 2025 19:25:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754508355; cv=none; b=VpAJDh85J3G++YZyzetKLqCwnfqbIvc3/ps2R43z6RgNQUHkBHdJHWop1pSj1obiC94W0mpVxf4DVFZr9OgFXBQ7D0z2VxV8vj5a2fx8VnK1vwuzy6X8nlIBahSmZdxZAP8nhSV64oM45ewTFok5aKrQo8sfFVBc36b0Hcict6c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754508355; c=relaxed/simple;
	bh=mIg5aHa9qqqfj9M/hwrgLELmfdAHWxH1xrTklJuDil0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=GaCQgUNopQo8U8vqLIj1oCIpczYZgQ4X2a4Dxwvy0okbvWj+3vh8Q+KszTJNNf/nIZLU03Whlc8fIHwriRTwvZe2hcSSRRLPJX3o33C/kJa1MMpXUNMZOIVYyWR3ov783SjKJT+0BEmp0BVrz4lAzL5jQKEu0JcZJW+lyZamqNo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=pcbtgc1R; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=1nR9J10w; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=pcbtgc1R; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=1nR9J10w; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="pcbtgc1R";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="1nR9J10w";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="pcbtgc1R";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="1nR9J10w"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id D8CC122D1B;
	Wed,  6 Aug 2025 19:25:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1754508345; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=6gkDZ/8X3WUpph98ZaLNacc6s2ZuKE7BZZzTooGNUq4=;
	b=pcbtgc1RGM6QRJlWEES422jPd0/kEOnXlUkgftzPDLIH1kylvSGx/1wxpI1ts7ljILx0nU
	Ipg2Sz4Xmvu4egjuqq0Sya7LeKuShUe8OFsTcRvKRrrJBvdBIDx1GOYtRfOk5P0rBFxfrn
	Q2uJoUZ7FYKbnm4XKPuEGr/q55Fw+54=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1754508345;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=6gkDZ/8X3WUpph98ZaLNacc6s2ZuKE7BZZzTooGNUq4=;
	b=1nR9J10wwgsYzbuMweaoH+DxyW/PcdNoiuZy1eCc3xM26HhvqESF/SzVgfjMgKTjhOqeTs
	HO3tIe74L8RQBTCQ==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1754508345; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=6gkDZ/8X3WUpph98ZaLNacc6s2ZuKE7BZZzTooGNUq4=;
	b=pcbtgc1RGM6QRJlWEES422jPd0/kEOnXlUkgftzPDLIH1kylvSGx/1wxpI1ts7ljILx0nU
	Ipg2Sz4Xmvu4egjuqq0Sya7LeKuShUe8OFsTcRvKRrrJBvdBIDx1GOYtRfOk5P0rBFxfrn
	Q2uJoUZ7FYKbnm4XKPuEGr/q55Fw+54=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1754508345;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=6gkDZ/8X3WUpph98ZaLNacc6s2ZuKE7BZZzTooGNUq4=;
	b=1nR9J10wwgsYzbuMweaoH+DxyW/PcdNoiuZy1eCc3xM26HhvqESF/SzVgfjMgKTjhOqeTs
	HO3tIe74L8RQBTCQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id B77BE13ABE;
	Wed,  6 Aug 2025 19:25:45 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id EOmoKzmsk2i0WAAAD6G6ig
	(envelope-from <tiwai@suse.de>); Wed, 06 Aug 2025 19:25:45 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Cc: Paul Menzel <pmenzel@molgen.mpg.de>,
	Hans de Goede <hansg@kernel.org>
Subject: [PATCH 3/3] ALSA: hda/cirrus: Restrict prompt only for CONFIG_EXPERT
Date: Wed,  6 Aug 2025 21:25:39 +0200
Message-ID: <20250806192541.21949-4-tiwai@suse.de>
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

The split of Cirrus HD-audio codec driver may confuse users when
migrating from the previous kernel configs and leave the needed
drivers disabled.  Although we've already set y as default, it's still
safer to paper over the wrong choices.

This patch marks the prompt of split CS420x and CS421x codec drivers
with CONFIG_EXPERT, so that they are all enabled when the top-level
CONFIG_SND_HDA_CODEC_CIRRUS is set.

For users who really care about the minimalistic configuration, they
can turn each driver on/off individually after setting
CONFIG_EXPERT=y.

This patch adds the missing help text to the top-level
CONFIG_SND_HDA_CIRRUS_CODEC together with the explanation of
individual choices, and corrects the help texts that don't fit well
nowadays, too.

Fixes: 1cb8744a36c7 ("ALSA: hda/cirrus: Split to cs420x and cs421x drivers")
Link: https://lore.kernel.org/10172c80-daec-4e20-ab57-a483cf1afc02@molgen.mpg.de
Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/hda/codecs/cirrus/Kconfig | 20 ++++++++++++--------
 1 file changed, 12 insertions(+), 8 deletions(-)

diff --git a/sound/hda/codecs/cirrus/Kconfig b/sound/hda/codecs/cirrus/Kconfig
index 33cfe52713bc..ec6cbcaf64f0 100644
--- a/sound/hda/codecs/cirrus/Kconfig
+++ b/sound/hda/codecs/cirrus/Kconfig
@@ -2,27 +2,31 @@
 
 menuconfig SND_HDA_CODEC_CIRRUS
 	tristate "Cirrus Logic HD-audio codec support"
+	help
+	  Say Y or M here to include Cirrus Logic HD-audio codec support.
+
+	  This will enable both CS420x and CS421x HD-audio codec drivers
+	  as default, but you can enable/disable each codec driver
+	  individually, too (only when CONFIG_EXPERT is set).
 
 if SND_HDA_CODEC_CIRRUS
 
 config SND_HDA_CODEC_CS420X
-	tristate "Build Cirrus Logic CS420x codec support"
+	tristate "Build Cirrus Logic CS420x codec support" if EXPERT
 	select SND_HDA_GENERIC
 	default y
 	help
-	  Say Y or M here to include Cirrus Logic CS420x codec support in
-	  snd-hda-intel driver
+	  Say Y or M here to include Cirrus Logic CS420x codec support
 
 comment "Set to Y if you want auto-loading the codec driver"
 	depends on SND_HDA=y && SND_HDA_CODEC_CS420X=m
 
 config SND_HDA_CODEC_CS421X
-	tristate "Build Cirrus Logic CS421x codec support"
+	tristate "Build Cirrus Logic CS421x codec support" if EXPERT
 	select SND_HDA_GENERIC
 	default y
 	help
-	  Say Y or M here to include Cirrus Logic CS421x codec support in
-	  snd-hda-intel driver
+	  Say Y or M here to include Cirrus Logic CS421x codec support
 
 comment "Set to Y if you want auto-loading the codec driver"
 	depends on SND_HDA=y && SND_HDA_CODEC_CS421X=m
@@ -31,8 +35,8 @@ config SND_HDA_CODEC_CS8409
 	tristate "Build Cirrus Logic HDA bridge support"
 	select SND_HDA_GENERIC
 	help
-	  Say Y or M here to include Cirrus Logic HDA bridge support in
-	  snd-hda-intel driver, such as CS8409.
+	  Say Y or M here to include Cirrus Logic HDA bridge support
+	  such as CS8409.
 
 comment "Set to Y if you want auto-loading the codec driver"
 	depends on SND_HDA=y && SND_HDA_CODEC_CS8409=m
-- 
2.50.1

