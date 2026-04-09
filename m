Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83FB839DBFC
	for <linux-sound@vger.kernel.org>; Thu,  9 Apr 2026 09:38:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775727533; cv=none; b=FVqPzg7WB8HW9rd7Kb3YORpOnKtCAB2FiJXRaLwc6d6aNIGbcxz6pL5ottM0XyJnh3cfcoG5ZyVcOa1dlJibk228i099h5rJAsyJpZgUbENUprNT1dTXGyrPenWehanQBLzR//1W1Z67OjkwsIM0B6qLl0le8wdp1EvsjIy+ZwA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775727533; c=relaxed/simple;
	bh=a8aR4JlVK9fQqAIk1Tn7x8OZf9CsVBMGq6d18xkF+1w=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=IHmes2Ir6nUZfQ9vy1paPhadiK7ASvdmcfTa9wBjYx8yDhdL75WlzYuxg8frlhvTyabfc1cH8+z0ZeEcFYml1zVpA2wrEfCSBx2iObedRIEjGyUV7mzwu56wracW39F8/Csxt8fHzYavxdRdk7FxqA5Bu8yaC2O/uMsfa2jaR+Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=M+9qHxQ/; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=om+154Yb; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=M+9qHxQ/; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=om+154Yb; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="M+9qHxQ/";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="om+154Yb";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="M+9qHxQ/";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="om+154Yb"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 055115BD26;
	Thu,  9 Apr 2026 09:38:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1775727511; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=YUFbx30bphiG1rH3SWn5ATbf27Did3x+PiVcPhp6HL8=;
	b=M+9qHxQ/WYdDAJOh222nD8SvYAFRF1ozHC6hxpJvrPDFhxard/DCC8hLCLVeUlFR7EujSH
	om+P8mbEWCosSE53yQGnOeoe/P65qVXGys0PHIlHdIo736Gla5g6XECFuMa+BaYcsFus2O
	xOhV+UlxFznFlVhJp4ieB0dxpq71Ya4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1775727511;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=YUFbx30bphiG1rH3SWn5ATbf27Did3x+PiVcPhp6HL8=;
	b=om+154YbGOxc9fwDa4IyZktA9KOBorA6MYUMrWWdtSiCM7PALDSHRnAsOvQJTxVvKDWnmy
	EYa18znU4jJ7etCw==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1775727511; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=YUFbx30bphiG1rH3SWn5ATbf27Did3x+PiVcPhp6HL8=;
	b=M+9qHxQ/WYdDAJOh222nD8SvYAFRF1ozHC6hxpJvrPDFhxard/DCC8hLCLVeUlFR7EujSH
	om+P8mbEWCosSE53yQGnOeoe/P65qVXGys0PHIlHdIo736Gla5g6XECFuMa+BaYcsFus2O
	xOhV+UlxFznFlVhJp4ieB0dxpq71Ya4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1775727511;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=YUFbx30bphiG1rH3SWn5ATbf27Did3x+PiVcPhp6HL8=;
	b=om+154YbGOxc9fwDa4IyZktA9KOBorA6MYUMrWWdtSiCM7PALDSHRnAsOvQJTxVvKDWnmy
	EYa18znU4jJ7etCw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id DB94F4A0B3;
	Thu,  9 Apr 2026 09:38:30 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id 4HNyNJZz12mdWgAAD6G6ig
	(envelope-from <tiwai@suse.de>); Thu, 09 Apr 2026 09:38:30 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Subject: [PATCH 07/10] ALSA: hda/ca0132: Clean up with the new GPIO helper
Date: Thu,  9 Apr 2026 11:38:20 +0200
Message-ID: <20260409093826.1317626-8-tiwai@suse.de>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260409093826.1317626-1-tiwai@suse.de>
References: <20260409093826.1317626-1-tiwai@suse.de>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-2.80 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_MISSING_CHARSET(0.50)[];
	NEURAL_HAM_SHORT(-0.20)[-0.999];
	MIME_GOOD(-0.10)[text/plain];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCPT_COUNT_ONE(0.00)[1];
	ARC_NA(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,suse.de:mid,suse.de:email];
	URIBL_BLOCKED(0.00)[imap1.dmz-prg2.suse.org:helo,suse.de:mid,suse.de:email];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	TO_DN_NONE(0.00)[];
	RCVD_TLS_ALL(0.00)[]
X-Spam-Flag: NO
X-Spam-Score: -2.80
X-Spam-Level: 

Use the new GPIO helper function to clean up the open code.

Merely a code refactoring, and no behavior change.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/hda/codecs/ca0132.c | 14 ++------------
 1 file changed, 2 insertions(+), 12 deletions(-)

diff --git a/sound/hda/codecs/ca0132.c b/sound/hda/codecs/ca0132.c
index a0677d7da8e2..ad533b04ab29 100644
--- a/sound/hda/codecs/ca0132.c
+++ b/sound/hda/codecs/ca0132.c
@@ -3755,22 +3755,12 @@ static void ca0132_gpio_setup(struct hda_codec *codec)
 
 	switch (ca0132_quirk(spec)) {
 	case QUIRK_SBZ:
-		snd_hda_codec_write(codec, 0x01, 0,
-				AC_VERB_SET_GPIO_DIRECTION, 0x07);
-		snd_hda_codec_write(codec, 0x01, 0,
-				AC_VERB_SET_GPIO_MASK, 0x07);
-		snd_hda_codec_write(codec, 0x01, 0,
-				AC_VERB_SET_GPIO_DATA, 0x04);
+		snd_hda_codec_set_gpio(codec, 0x07, 0x07, 0x04, 0);
 		snd_hda_codec_write(codec, 0x01, 0,
 				AC_VERB_SET_GPIO_DATA, 0x06);
 		break;
 	case QUIRK_R3DI:
-		snd_hda_codec_write(codec, 0x01, 0,
-				AC_VERB_SET_GPIO_DIRECTION, 0x1E);
-		snd_hda_codec_write(codec, 0x01, 0,
-				AC_VERB_SET_GPIO_MASK, 0x1F);
-		snd_hda_codec_write(codec, 0x01, 0,
-				AC_VERB_SET_GPIO_DATA, 0x0C);
+		snd_hda_codec_set_gpio(codec, 0x1F, 0x1E, 0x0C, 0);
 		break;
 	default:
 		break;
-- 
2.53.0

