Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58E0661FFE
	for <linux-sound@vger.kernel.org>; Wed, 13 Aug 2025 09:00:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755075644; cv=none; b=G9jhlpy3vNcaGYLeXWhSztOW9y/W8DVRB8QHGNdoV/31VBYB5AQF3TXn+67K1NY4/azVn0zgeNsGzCaj8M8gOVNVFbHAziSLTuZLzfsRjB+S/8IhcwvW6wBGnsoGq9Nvs1dU3IBWEeUlgfvGeM6VOrGQEiXeq4yTzsrHqXBCjbk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755075644; c=relaxed/simple;
	bh=/5H2NPHUt56nf2zH+XSXVU8uEeDj9+ct24o0kNUEZ74=;
	h=From:To:Subject:Date:Message-ID:MIME-Version; b=Blrbb200ck5AmPwBB7nAKYuEgpcKmEs3XB635wHn6dopj7Bikz09biPE+jT8aOSXgQdJaH73kcT98sZWfWUCzWmcxLlJAu/x3Vi/z5m43cMor4k37/NrXhhH9B2YFUGqvPZVVQjb8Z1zxauA5G/QXq9h8GILmpsRSQZ/qaeiwz8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=CbhEffZV; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=K5LqOrQz; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=CbhEffZV; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=K5LqOrQz; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="CbhEffZV";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="K5LqOrQz";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="CbhEffZV";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="K5LqOrQz"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 5E56021A58;
	Wed, 13 Aug 2025 09:00:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1755075640; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=MJGTjGfS1HqAheXn/QlT0r3tBE+ShRuk2MULC6byNJA=;
	b=CbhEffZV6R41Edw39sPLZRMmpUG+7MIfN89EZSPcQpiG7NH+kgk9IKvWFS5Tad85MCaezi
	8sVZbYnqUEq1WydWHarUQE0r/ABL11j02OF1i4Fwhx7zNGMAWlnqdic+6FlfGKNH1AkHpE
	Zg6RbWx0MlGNZx6lSrjofnu8/1K+unI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1755075640;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=MJGTjGfS1HqAheXn/QlT0r3tBE+ShRuk2MULC6byNJA=;
	b=K5LqOrQzGswzGAYgd4dqOOlTFT7bFLZTK6U7MG8NnaJcneBt8gSZJTm16m7Xhxehx0RPyb
	eqbU8kjJs1tlX7Ag==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1755075640; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=MJGTjGfS1HqAheXn/QlT0r3tBE+ShRuk2MULC6byNJA=;
	b=CbhEffZV6R41Edw39sPLZRMmpUG+7MIfN89EZSPcQpiG7NH+kgk9IKvWFS5Tad85MCaezi
	8sVZbYnqUEq1WydWHarUQE0r/ABL11j02OF1i4Fwhx7zNGMAWlnqdic+6FlfGKNH1AkHpE
	Zg6RbWx0MlGNZx6lSrjofnu8/1K+unI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1755075640;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=MJGTjGfS1HqAheXn/QlT0r3tBE+ShRuk2MULC6byNJA=;
	b=K5LqOrQzGswzGAYgd4dqOOlTFT7bFLZTK6U7MG8NnaJcneBt8gSZJTm16m7Xhxehx0RPyb
	eqbU8kjJs1tlX7Ag==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 42D2513479;
	Wed, 13 Aug 2025 09:00:40 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id l1b7DjhUnGigEgAAD6G6ig
	(envelope-from <tiwai@suse.de>); Wed, 13 Aug 2025 09:00:40 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Subject: [PATCH] ALSA: hda/ca0132: Fix compile error with CLASS() after label
Date: Wed, 13 Aug 2025 11:00:38 +0200
Message-ID: <20250813090039.20064-1-tiwai@suse.de>
X-Mailer: git-send-email 2.50.1
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
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCPT_COUNT_ONE(0.00)[1];
	ARC_NA(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid,suse.de:email,imap1.dmz-prg2.suse.org:helo,intel.com:email];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	TO_DN_NONE(0.00)[];
	RCVD_TLS_ALL(0.00)[]
X-Spam-Flag: NO
X-Spam-Level: 
X-Spam-Score: -2.80

By some reason, the use of CLASS() right after the goto label caused a
build error with clang and hexagon arch.
As a fix and a further cleanup, just move the code into the if block
instead of the goto, and drop the unnecessary variable initialization,
too.

Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202508131651.BZD3v2Bq-lkp@intel.com/
Fixes: 8d0843bcdd00 ("ALSA: hda/ca0132: Use cleanup macros for PM controls")
Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/hda/codecs/ca0132.c | 21 ++++++++++-----------
 1 file changed, 10 insertions(+), 11 deletions(-)

diff --git a/sound/hda/codecs/ca0132.c b/sound/hda/codecs/ca0132.c
index 197365901fef..dd054aedd501 100644
--- a/sound/hda/codecs/ca0132.c
+++ b/sound/hda/codecs/ca0132.c
@@ -4211,20 +4211,19 @@ static const unsigned int equalizer_vals_lookup[] = {
 static int tuning_ctl_set(struct hda_codec *codec, hda_nid_t nid,
 			  const unsigned int *lookup, int idx)
 {
-	int i = 0;
+	int i;
 
-	for (i = 0; i < TUNING_CTLS_COUNT; i++)
-		if (nid == ca0132_tuning_ctls[i].nid)
-			goto found;
+	for (i = 0; i < TUNING_CTLS_COUNT; i++) {
+		if (nid == ca0132_tuning_ctls[i].nid) {
+			CLASS(snd_hda_power, pm)(codec);
+			dspio_set_param(codec, ca0132_tuning_ctls[i].mid, 0x20,
+					ca0132_tuning_ctls[i].req,
+					&(lookup[idx]), sizeof(unsigned int));
+			return 1;
+		}
+	}
 
 	return -EINVAL;
-found:
-	CLASS(snd_hda_power, pm)(codec);
-	dspio_set_param(codec, ca0132_tuning_ctls[i].mid, 0x20,
-			ca0132_tuning_ctls[i].req,
-			&(lookup[idx]), sizeof(unsigned int));
-
-	return 1;
 }
 
 static int tuning_ctl_get(struct snd_kcontrol *kcontrol,
-- 
2.50.1

