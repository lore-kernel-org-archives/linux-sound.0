Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E14A1EA7FF
	for <linux-sound@vger.kernel.org>; Wed, 30 Jul 2025 06:46:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753858006; cv=none; b=Qyy1/EqTwQGSSLD4Urd6Nt2bKcsQ4mfKbX+hN/v6KNDZ6trbr1AudSKk9ipk6495ytSF2CQMEn04VuX1nJbUGKj29wdKvDkSsdK0NSZLoj+LnIPgW9FJZ2v12fnZVdxDGIXf+kRgjce5QGV1RA7Od9yGbM8HBTEvHo/5zkbcCPA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753858006; c=relaxed/simple;
	bh=V5aMwiz2H55tiGh3yxR5kwyOWycisugSltG1viAYZuk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=pwal7G+sYZac91Xu/y1t4xZcVZsFsGMJRXKk4BGZZnus1Pl8b7QlsSHfWDEU7PlfT/DIxB0DoS4LxBohJbuhegWvi75tcrLZUaEBhWKy6xFD33kvjYqwdkOMYE7ho+/NYVeEC4PfhLDXkbTsBYv9klwiAFIYmaXYkKksDl/VUTQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=QWO8Oj9d; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=3onNRZUl; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=QWO8Oj9d; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=3onNRZUl; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="QWO8Oj9d";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="3onNRZUl";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="QWO8Oj9d";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="3onNRZUl"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id A37E321A9B;
	Wed, 30 Jul 2025 06:46:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1753858002; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=CYUT27qEi3y1JLfYNY3qDeOgooKY1SN8heOoXafF1s4=;
	b=QWO8Oj9dMqBZiPvUEaUCxvZzfe/zIXUIAJ6Anf2XUGfm8oCGD8TleqaPvo2O3UyNal0C6y
	LcOLOUYcy8T5hCNmKoC+U6GPuoQbd+GPzPTZHChpkOJTnNH2CWVdG6yr2VoKolOlqrKkOk
	pa9xYjW1Y7J8k2efD32LCY5uoKBk/Kk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1753858002;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=CYUT27qEi3y1JLfYNY3qDeOgooKY1SN8heOoXafF1s4=;
	b=3onNRZUl+WRtvaD9I/13jOb1eoV6fSucpPc5hv2iPPGHmy1CRo5yEQlnq3Uhdq9DpoQVV9
	f3nlWVq4XgkvszDA==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=QWO8Oj9d;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=3onNRZUl
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1753858002; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=CYUT27qEi3y1JLfYNY3qDeOgooKY1SN8heOoXafF1s4=;
	b=QWO8Oj9dMqBZiPvUEaUCxvZzfe/zIXUIAJ6Anf2XUGfm8oCGD8TleqaPvo2O3UyNal0C6y
	LcOLOUYcy8T5hCNmKoC+U6GPuoQbd+GPzPTZHChpkOJTnNH2CWVdG6yr2VoKolOlqrKkOk
	pa9xYjW1Y7J8k2efD32LCY5uoKBk/Kk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1753858002;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=CYUT27qEi3y1JLfYNY3qDeOgooKY1SN8heOoXafF1s4=;
	b=3onNRZUl+WRtvaD9I/13jOb1eoV6fSucpPc5hv2iPPGHmy1CRo5yEQlnq3Uhdq9DpoQVV9
	f3nlWVq4XgkvszDA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 86F3113A50;
	Wed, 30 Jul 2025 06:46:42 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id qADiH9K/iWigOAAAD6G6ig
	(envelope-from <tiwai@suse.de>); Wed, 30 Jul 2025 06:46:42 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Cc: Linus Torvalds <torvalds@linux-foundation.org>
Subject: [PATCH 1/3] ALSA: hda/realtek: Enable drivers as default
Date: Wed, 30 Jul 2025 08:46:33 +0200
Message-ID: <20250730064639.25617-2-tiwai@suse.de>
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
X-Spam-Flag: NO
X-Rspamd-Queue-Id: A37E321A9B
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
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	RCPT_COUNT_TWO(0.00)[2];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:dkim,suse.de:mid,suse.de:email,imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DKIM_TRACE(0.00)[suse.de:+]
X-Spam-Score: -3.01

The recent split of Realtek HD-audio driver forced users to choose the
right Kconfigs, but most users have no idea which ones to enable.
Although the distros tend to enable all of them, individual users may
have their own favorites and miss something needed via the version
upgrade.

For smoother upgrade path from the previous kernel configuration, now
we take the following changes:

- CONFIG_SND_HDA_CODEC_REALTEK (which is a menuconfig) is changed from
  bool to tristate again, so that it can take over from the previous
  config gracefully.
- CONFIG_SND_HDA_CODEC_ALC* receive "default y", so that they are
  enabled as default as long as CONFIG_SND_HDA_CODEC_REALTEK is set.
  Those can be still disabled if users want to reduce the size, too.

At least this allows users to run "make oldconfig" and push RETURN
blindly.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/hda/codecs/realtek/Kconfig | 12 +++++++++++-
 1 file changed, 11 insertions(+), 1 deletion(-)

diff --git a/sound/hda/codecs/realtek/Kconfig b/sound/hda/codecs/realtek/Kconfig
index 4b3ab28203b4..20899f3fc051 100644
--- a/sound/hda/codecs/realtek/Kconfig
+++ b/sound/hda/codecs/realtek/Kconfig
@@ -1,7 +1,7 @@
 # SPDX-License-Identifier: GPL-2.0-only
 
 menuconfig SND_HDA_CODEC_REALTEK
-	bool "Realtek HD-audio codec support"
+	tristate "Realtek HD-audio codec support"
 
 if SND_HDA_CODEC_REALTEK
 
@@ -15,6 +15,7 @@ config SND_HDA_CODEC_ALC260
 	tristate "Build Realtek ALC260 HD-audio codec support"
 	depends on INPUT
 	select SND_HDA_CODEC_REALTEK_LIB
+	default y
 	help
 	  Say Y or M here to include Realtek ALC260 HD-audio codec support
 
@@ -22,6 +23,7 @@ config SND_HDA_CODEC_ALC262
 	tristate "Build Realtek ALC262 HD-audio codec support"
 	depends on INPUT
 	select SND_HDA_CODEC_REALTEK_LIB
+	default y
 	help
 	  Say Y or M here to include Realtek ALC262 HD-audio codec support
 
@@ -29,6 +31,7 @@ config SND_HDA_CODEC_ALC268
 	tristate "Build Realtek ALC268 HD-audio codec support"
 	depends on INPUT
 	select SND_HDA_CODEC_REALTEK_LIB
+	default y
 	help
 	  Say Y or M here to include Realtek ALC268 and compatible HD-audio
 	  codec support
@@ -37,6 +40,7 @@ config SND_HDA_CODEC_ALC269
 	tristate "Build Realtek ALC269 HD-audio codecs support"
 	depends on INPUT
 	select SND_HDA_CODEC_REALTEK_LIB
+	default y
 	help
 	  Say Y or M here to include Realtek ALC269 and compatible HD-audio
 	  codec support
@@ -45,6 +49,7 @@ config SND_HDA_CODEC_ALC662
 	tristate "Build Realtek ALC662 HD-audio codecs support"
 	depends on INPUT
 	select SND_HDA_CODEC_REALTEK_LIB
+	default y
 	help
 	  Say Y or M here to include Realtek ALC662 and compatible HD-audio
 	  codec support
@@ -53,6 +58,7 @@ config SND_HDA_CODEC_ALC680
 	tristate "Build Realtek ALC680 HD-audio codecs support"
 	depends on INPUT
 	select SND_HDA_CODEC_REALTEK_LIB
+	default y
 	help
 	  Say Y or M here to include Realtek ALC680 HD-audio codec support
 
@@ -60,6 +66,7 @@ config SND_HDA_CODEC_ALC861
 	tristate "Build Realtek ALC861 HD-audio codecs support"
 	depends on INPUT
 	select SND_HDA_CODEC_REALTEK_LIB
+	default y
 	help
 	  Say Y or M here to include Realtek ALC861 HD-audio codec support
 
@@ -67,6 +74,7 @@ config SND_HDA_CODEC_ALC861VD
 	tristate "Build Realtek ALC861-VD HD-audio codecs support"
 	depends on INPUT
 	select SND_HDA_CODEC_REALTEK_LIB
+	default y
 	help
 	  Say Y or M here to include Realtek ALC861-VD HD-audio codec support
 
@@ -74,6 +82,7 @@ config SND_HDA_CODEC_ALC880
 	tristate "Build Realtek ALC880 HD-audio codecs support"
 	depends on INPUT
 	select SND_HDA_CODEC_REALTEK_LIB
+	default y
 	help
 	  Say Y or M here to include Realtek ALC880 HD-audio codec support
 
@@ -81,6 +90,7 @@ config SND_HDA_CODEC_ALC882
 	tristate "Build Realtek ALC882 HD-audio codecs support"
 	depends on INPUT
 	select SND_HDA_CODEC_REALTEK_LIB
+	default y
 	help
 	  Say Y or M here to include Realtek ALC882 and compatible HD-audio
 	  codec support
-- 
2.50.1

