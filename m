Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DFD23BB114
	for <linux-sound@vger.kernel.org>; Wed, 29 Jul 2026 07:45:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785311168; cv=none; b=dKwPQpxgtKHfDqmAhvEX9YWlSqFddFhpAcavGfrQA5hg9JV8gaQnj+H7Iln0jl3hzNphIcbn0IaqCoxhLd2fIumtTvKf8MM/iubG5XWkQ94GweMR9eNdldVK9cFRlux5nHvB9zpfzwwX/MompT1Ht5gjcQt8AVjcJNFK8X0rbXU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785311168; c=relaxed/simple;
	bh=0KI5YEeeEHGBNg3vNOPaNSwP3fBS3z7GXL71Tj7lRhk=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=M0XvY12ovgVXHpjJ9ac6G2/q2toWjt5b5J7JMLMUzQAIBbUWjtxQtP6MDiTzavQadBrtoaka1SFcZLEIdkuMSWNGyAvnOK+O87tK55qNB8owx5RLHne2W6mJxmSl3m3yIFBWpB8qGcG9GisaZN/mwVATgFzghc7t2eJDwvPM9nc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=PRkFhbWf; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=O2ru/Yx/; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=hbdrYwlr; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=ATyBaB3n; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="PRkFhbWf";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="O2ru/Yx/";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="hbdrYwlr";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="ATyBaB3n"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 0BB157C975;
	Wed, 29 Jul 2026 07:45:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1785311134; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=3xEg6jAEOi7O+WEG1p8ktLfgIvUogAB/nRU3ezw1oA0=;
	b=PRkFhbWfEo4HFnIIZ89tM70FfRYDRpjPa2X3vScOXb7Ek2Yk68bx5ULNdDJMz0RX7Q7tM3
	JpHdsBQIphqTXBpVYB5hjauvlMhOn/nBcq52cVKUoAoecgpfLEOgg0skek4epBApCJy9dx
	VlBjw3fQFTk4f0Y5xqvFJM1Sa9RvBL8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1785311134;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=3xEg6jAEOi7O+WEG1p8ktLfgIvUogAB/nRU3ezw1oA0=;
	b=O2ru/Yx/o32PYpUSEX53j5j51Edj7l1VEWb6LBuo1iSuWIpaJNEDwy2feoE9JMer7AfXj8
	bUhoD2R2Ymko54DQ==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1785311130; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=3xEg6jAEOi7O+WEG1p8ktLfgIvUogAB/nRU3ezw1oA0=;
	b=hbdrYwlr2z98y37PDqaTLsSvSf5rKC5x9A6ScfyrYXprUxZlvLGB7l5Er153xSOjVj9p1N
	vhBj50jOLDcUD+beIa9IM7eilje7aVZSDgGXpCoivEMIq8+cddfwfZTIU0C9hgM4TxylfD
	pnAIXkTcvjDu/p6qDLrO+j8ENSa0rJQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1785311130;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=3xEg6jAEOi7O+WEG1p8ktLfgIvUogAB/nRU3ezw1oA0=;
	b=ATyBaB3nA0jdSF0bCzdTad7BQG6gxbn5jzsibXvJ3/C888nSHjaZNvaC/7NfSGTJsTGywX
	QngRgloI6H5hHDCw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 1E827779C1;
	Wed, 29 Jul 2026 07:45:26 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id QKlCBpavaWolJAAAD6G6ig
	(envelope-from <tiwai@suse.de>); Wed, 29 Jul 2026 07:45:26 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Subject: [PATCH 3/3] ALSA: usb-audio: Make some quirk-string helpers local
Date: Wed, 29 Jul 2026 09:45:18 +0200
Message-ID: <20260729074523.92761-4-tiwai@suse.de>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260729074523.92761-1-tiwai@suse.de>
References: <20260729074523.92761-1-tiwai@suse.de>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-2.80 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-0.999];
	R_MISSING_CHARSET(0.50)[];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	ARC_NA(0.00)[];
	RCPT_COUNT_ONE(0.00)[1];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,suse.de:mid,suse.de:email];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_EQ_ENVFROM(0.00)[];
	TO_DN_NONE(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	RCVD_TLS_ALL(0.00)[]
X-Spam-Flag: NO
X-Spam-Score: -2.80
X-Spam-Level: 

As snd_usb_quirk_flags_from_name() is used only locally, make it
local.  Also, drop the unused snd_usb_quirk_flag_find_name(), too.

Only a code cleanup, no functional changes.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/usb/quirks.c | 10 +---------
 sound/usb/quirks.h |  3 ---
 2 files changed, 1 insertion(+), 12 deletions(-)

diff --git a/sound/usb/quirks.c b/sound/usb/quirks.c
index 77adefe4f9cb..3c1343da45b4 100644
--- a/sound/usb/quirks.c
+++ b/sound/usb/quirks.c
@@ -2630,15 +2630,7 @@ static const char *const snd_usb_audio_quirk_flag_names[] = {
 	NULL
 };
 
-const char *snd_usb_quirk_flag_find_name(unsigned long index)
-{
-	if (index >= ARRAY_SIZE(snd_usb_audio_quirk_flag_names))
-		return NULL;
-
-	return snd_usb_audio_quirk_flag_names[index];
-}
-
-u64 snd_usb_quirk_flags_from_name(const char *name)
+static u64 snd_usb_quirk_flags_from_name(const char *name)
 {
 	int i;
 
diff --git a/sound/usb/quirks.h b/sound/usb/quirks.h
index 54f4cca8d7af..0a723c266bb4 100644
--- a/sound/usb/quirks.h
+++ b/sound/usb/quirks.h
@@ -56,7 +56,4 @@ void snd_usb_init_quirk_flags_table(struct snd_usb_audio *chip);
 void snd_usb_init_quirk_flags_parse_string(struct snd_usb_audio *chip,
 					   const char *str);
 
-const char *snd_usb_quirk_flag_find_name(unsigned long flag);
-u64 snd_usb_quirk_flags_from_name(const char *name);
-
 #endif /* __USBAUDIO_QUIRKS_H */
-- 
2.55.0

