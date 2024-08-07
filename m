Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25F3B1EB4AB
	for <linux-sound@vger.kernel.org>; Wed,  7 Aug 2024 13:34:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723037668; cv=none; b=tvkcep/VdtTOjX1v3matwaPrdvvJvyYUhOo0lnW2pcBmC7EJ9ziaF4dNgvYM0hXt54OLoF3GxcV6NYlnSMwRA+zBdrvQF4vV2eWOadgyYtEVpaz3n1FrhmPS5+lXr6+4Xea8Z81Tb6/72XG1Akkd9do6jkWEdCM+jncmht/zzYY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723037668; c=relaxed/simple;
	bh=NrGLQ7TWtXVu/DMSmRZDh7W6J3HrohnXlhsVDChTRLs=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=n044mcCQzO+CwsZtXSf4k/rt4+FuChRWbWfIvLyjcAM1o490P19S1mJE2LtuiwDqBVEk9rZAYE2s9DdGRi1x3cFpaAeN1UpYSq+98pc0S5piSCNjmfx81XU/Y2ViImQ1ry6QZs9vp6Lz/djWdRWAYsS4K3MPeb9zuHHrf+4kuxs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=Qyg9QcwQ; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=hfIhq/Uz; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=Qyg9QcwQ; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=hfIhq/Uz; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="Qyg9QcwQ";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="hfIhq/Uz";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="Qyg9QcwQ";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="hfIhq/Uz"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id AE4B321D19;
	Wed,  7 Aug 2024 13:34:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1723037663; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=iOxvU/7ufIQfDJkb6/eVx/QVPX3bbrbOEXtFxEcSReQ=;
	b=Qyg9QcwQLy3BwTefL/qDCSCnfJ70bcqkgzG8wAhb9xcl62QpufKForPTp9A2vBrpmGJaB9
	ZytTSJbHUKDHeZOlPiDe2DQ8Cv7L4WB9z7s5fD/qKyZv7ui0l16uEfzHKPjVBLwnaxJO+S
	PckOLNzDbU2ymJiIonRSYoCcdQ3IZtk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1723037663;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=iOxvU/7ufIQfDJkb6/eVx/QVPX3bbrbOEXtFxEcSReQ=;
	b=hfIhq/UzoJMuU0VTBcFthNizEUafKC9+R/Ffx10YOKZOn+OQMFJ15i5LHoQ9QtRIIswji3
	X8Az7jRqTqXAXXBA==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1723037663; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=iOxvU/7ufIQfDJkb6/eVx/QVPX3bbrbOEXtFxEcSReQ=;
	b=Qyg9QcwQLy3BwTefL/qDCSCnfJ70bcqkgzG8wAhb9xcl62QpufKForPTp9A2vBrpmGJaB9
	ZytTSJbHUKDHeZOlPiDe2DQ8Cv7L4WB9z7s5fD/qKyZv7ui0l16uEfzHKPjVBLwnaxJO+S
	PckOLNzDbU2ymJiIonRSYoCcdQ3IZtk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1723037663;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=iOxvU/7ufIQfDJkb6/eVx/QVPX3bbrbOEXtFxEcSReQ=;
	b=hfIhq/UzoJMuU0VTBcFthNizEUafKC9+R/Ffx10YOKZOn+OQMFJ15i5LHoQ9QtRIIswji3
	X8Az7jRqTqXAXXBA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 93A9F13A7D;
	Wed,  7 Aug 2024 13:34:23 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id 4MDmIt93s2ZpVgAAD6G6ig
	(envelope-from <tiwai@suse.de>); Wed, 07 Aug 2024 13:34:23 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Subject: [PATCH 53/54] ALSA: docs: Drop snd_print*() stuff
Date: Wed,  7 Aug 2024 15:34:43 +0200
Message-ID: <20240807133452.9424-54-tiwai@suse.de>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240807133452.9424-1-tiwai@suse.de>
References: <20240807133452.9424-1-tiwai@suse.de>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-2.79 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_MISSING_CHARSET(0.50)[];
	NEURAL_HAM_SHORT(-0.19)[-0.952];
	MIME_GOOD(-0.10)[text/plain];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCPT_COUNT_ONE(0.00)[1];
	ARC_NA(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,suse.de:email];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	TO_DN_NONE(0.00)[];
	RCVD_TLS_ALL(0.00)[]
X-Spam-Score: -2.79
X-Spam-Flag: NO
X-Spam-Level: 

The legacy snd_print*() helpers will be dropped now.  Clean up the
corresponding documentation, too.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 Documentation/sound/hd-audio/notes.rst        |  6 -----
 .../kernel-api/writing-an-alsa-driver.rst     | 25 -------------------
 2 files changed, 31 deletions(-)

diff --git a/Documentation/sound/hd-audio/notes.rst b/Documentation/sound/hd-audio/notes.rst
index ef6a4513cce7..e199131bf5ab 100644
--- a/Documentation/sound/hd-audio/notes.rst
+++ b/Documentation/sound/hd-audio/notes.rst
@@ -321,12 +321,6 @@ Kernel Configuration
 --------------------
 In general, I recommend you to enable the sound debug option,
 ``CONFIG_SND_DEBUG=y``, no matter whether you are debugging or not.
-This enables snd_printd() macro and others, and you'll get additional
-kernel messages at probing.
-
-In addition, you can enable ``CONFIG_SND_DEBUG_VERBOSE=y``.  But this
-will give you far more messages.  Thus turn this on only when you are
-sure to want it.
 
 Don't forget to turn on the appropriate ``CONFIG_SND_HDA_CODEC_*``
 options.  Note that each of them corresponds to the codec chip, not
diff --git a/Documentation/sound/kernel-api/writing-an-alsa-driver.rst b/Documentation/sound/kernel-api/writing-an-alsa-driver.rst
index 801b0bb57e97..895752cbcedd 100644
--- a/Documentation/sound/kernel-api/writing-an-alsa-driver.rst
+++ b/Documentation/sound/kernel-api/writing-an-alsa-driver.rst
@@ -4030,31 +4030,6 @@ located in the new subdirectory, sound/pci/xyz.
 Useful Functions
 ================
 
-:c:func:`snd_printk()` and friends
-----------------------------------
-
-.. note:: This subsection describes a few helper functions for
-   decorating a bit more on the standard :c:func:`printk()` & co.
-   However, in general, the use of such helpers is no longer recommended.
-   If possible, try to stick with the standard functions like
-   :c:func:`dev_err()` or :c:func:`pr_err()`.
-
-ALSA provides a verbose version of the :c:func:`printk()` function.
-If a kernel config ``CONFIG_SND_VERBOSE_PRINTK`` is set, this function
-prints the given message together with the file name and the line of the
-caller. The ``KERN_XXX`` prefix is processed as well as the original
-:c:func:`printk()` does, so it's recommended to add this prefix,
-e.g. snd_printk(KERN_ERR "Oh my, sorry, it's extremely bad!\\n");
-
-There are also :c:func:`printk()`'s for debugging.
-:c:func:`snd_printd()` can be used for general debugging purposes.
-If ``CONFIG_SND_DEBUG`` is set, this function is compiled, and works
-just like :c:func:`snd_printk()`. If the ALSA is compiled without
-the debugging flag, it's ignored.
-
-:c:func:`snd_printdd()` is compiled in only when
-``CONFIG_SND_DEBUG_VERBOSE`` is set.
-
 :c:func:`snd_BUG()`
 -------------------
 
-- 
2.43.0

