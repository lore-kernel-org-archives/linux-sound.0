Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA3C12D6403
	for <linux-sound@vger.kernel.org>; Thu, 10 Jul 2025 10:11:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752142296; cv=none; b=EBSKwvqpocEgkCiwCpX5D1K3X3hAlj1MLTsx9n5CRCfZtiMBcp0v84Pv7B2B14Lvu+qW7qkz7Ik6pL8G/MacnGzpJaPpbQycRPD1HlgyZ6MFHqcq1IQuQtDItKF1yGK2R3WIyXZ+ohPWnBSe9dDxyWwQfGytLPJXvE2JRCIqh5o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752142296; c=relaxed/simple;
	bh=xsgv57N7NNzxMuBKzp9m/F9uqnWrHcPR7s3B+3vjlfU=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=fijSDU3on8RFwx8nmr8UBHN4Ysi2vm4ymQ7Q8ENOlz00H2JXSgRQOs3b1OZHVu60aRW6z4+E1Ix02Wv5+MYFFYWusDLZG4ZA/cQoERm8pyHkifIxjfXn5h8TcofEGJAtE/QLzqpYtY7WJnQ19SxPB6F5iTEQiObnsM9RDmR70fM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=q4o1YppR; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=Y6euUnwr; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=q4o1YppR; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=Y6euUnwr; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="q4o1YppR";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="Y6euUnwr";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="q4o1YppR";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="Y6euUnwr"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id CBBA2211A6;
	Thu, 10 Jul 2025 10:07:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1752142064; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Uh6Zv7I+C4dRXPR67v4+3VFJ8VXocZQdAw2vDnCqJQ4=;
	b=q4o1YppRc4wZJrMyAgzi0MwFK8Ziaxpfek4NaJSUnNYH+QHytEfk1YYSB2NeRguUoYQTB2
	c50PEZXhatrWsYGvR5qLaPdHIKHCmgDivrZWSUuJDldG0XgAOWvMx4xHsyX0/2dD8W6LgM
	7qd/8/cvmjhfLcZiHwU8l6kY+a5BH98=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1752142064;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Uh6Zv7I+C4dRXPR67v4+3VFJ8VXocZQdAw2vDnCqJQ4=;
	b=Y6euUnwrbgZRNeGAxz87sFORxubdkif9kTaIvw86VS7egLSv10csVqFQEoHvrQ2sQaXhZ+
	hOWYp2sJjpxPq8AA==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1752142064; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Uh6Zv7I+C4dRXPR67v4+3VFJ8VXocZQdAw2vDnCqJQ4=;
	b=q4o1YppRc4wZJrMyAgzi0MwFK8Ziaxpfek4NaJSUnNYH+QHytEfk1YYSB2NeRguUoYQTB2
	c50PEZXhatrWsYGvR5qLaPdHIKHCmgDivrZWSUuJDldG0XgAOWvMx4xHsyX0/2dD8W6LgM
	7qd/8/cvmjhfLcZiHwU8l6kY+a5BH98=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1752142064;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Uh6Zv7I+C4dRXPR67v4+3VFJ8VXocZQdAw2vDnCqJQ4=;
	b=Y6euUnwrbgZRNeGAxz87sFORxubdkif9kTaIvw86VS7egLSv10csVqFQEoHvrQ2sQaXhZ+
	hOWYp2sJjpxPq8AA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id A6C3A136DC;
	Thu, 10 Jul 2025 10:07:44 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id +IVpJ/CQb2jZWQAAD6G6ig
	(envelope-from <tiwai@suse.de>); Thu, 10 Jul 2025 10:07:44 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Subject: [PATCH 060/103] ALSA: echoaudio: Use safer strscpy() instead of strcpy()
Date: Thu, 10 Jul 2025 12:06:42 +0200
Message-ID: <20250710100727.22653-61-tiwai@suse.de>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <20250710100727.22653-1-tiwai@suse.de>
References: <20250710100727.22653-1-tiwai@suse.de>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Level: 
X-Spamd-Result: default: False [-2.80 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_MISSING_CHARSET(0.50)[];
	NEURAL_HAM_SHORT(-0.20)[-0.999];
	MIME_GOOD(-0.10)[text/plain];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCPT_COUNT_ONE(0.00)[1];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,suse.de:email,suse.de:mid];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	R_RATELIMIT(0.00)[to_ip_from(RLsqo7dymd5dgmoaprf5rep8is)];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	TO_DN_NONE(0.00)[];
	RCVD_TLS_ALL(0.00)[]
X-Spam-Flag: NO
X-Spam-Score: -2.80

Use a safer function strscpy() instead of strcpy() for copying to
arrays.

Only idiomatic code replacement, and no functional changes.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/pci/echoaudio/midi.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/pci/echoaudio/midi.c b/sound/pci/echoaudio/midi.c
index c3f3c9129561..4ee230794b4e 100644
--- a/sound/pci/echoaudio/midi.c
+++ b/sound/pci/echoaudio/midi.c
@@ -311,7 +311,7 @@ static int snd_echo_midi_create(struct snd_card *card,
 	if (err < 0)
 		return err;
 
-	strcpy(chip->rmidi->name, card->shortname);
+	strscpy(chip->rmidi->name, card->shortname);
 	chip->rmidi->private_data = chip;
 
 	snd_rawmidi_set_ops(chip->rmidi, SNDRV_RAWMIDI_STREAM_INPUT,
-- 
2.50.0

