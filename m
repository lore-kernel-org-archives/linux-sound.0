Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E752182B4
	for <linux-sound@vger.kernel.org>; Fri, 20 Dec 2024 11:44:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734695070; cv=none; b=SRe5dfeq0tOF2pluyYyqTVG+OC1doZfJKy2JcgBUBO0r/lfSQ/n/le623a+0LU4F0q1p81zrCsbHujzKgwnnYij7yoLnPnWCDMfo/091Qv7US4i6Kv3JSaGSInkJvMw59qKAvbfmo6zLX5MUqUbQhoGEx2ctbsc9//tFV0kaF4E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734695070; c=relaxed/simple;
	bh=CXN9A5x1vz77Gs9rXewjyeu0cfr74weifBSPy0LnlCg=;
	h=From:To:Subject:Date:Message-ID:MIME-Version; b=k4HAki208gEOtYDgo0mDIySg1X/5XFQ6XgSluIN6O1qywOXdVLRA8AZlTHoeSWG03Qfm5szzD712EBw8KsCL2P5N05hetFQS9/tN2BJHXv/DH7B/RfpaAyEJIFzKH8vJFmukYW57S5WjkuXP4RwJ0cDWun3yOGoot+u4y9VVY7E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=hnSypgvv; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=hBMakp7q; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=Y2VSp8pq; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=B/znuULj; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="hnSypgvv";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="hBMakp7q";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="Y2VSp8pq";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="B/znuULj"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 7BA031F794;
	Fri, 20 Dec 2024 11:44:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1734695066; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=4V6E5KYM0GyakEt2RqG8mYgE23lMdJAwqMmhUF49Wtw=;
	b=hnSypgvvHvNk8XoL91PTJQ1tR736IUySj/AsUITgVdTWwZzcZukvfHrW4DZGIraMVxa1gS
	Aa2Fn3hjGsYhMhCKGbEfgzB1IPV1S/DD61phzN9eI18Pn86AMY84wHvGdtg6hFp6LUH4LB
	F8xr/GbsHV0l168XU4+w2p08t+UBe2I=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1734695066;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=4V6E5KYM0GyakEt2RqG8mYgE23lMdJAwqMmhUF49Wtw=;
	b=hBMakp7qNlIo2V/s8Ic5JPmkVRVrnqLgSciNUfj1fS9juwwOMxCl89wgAQm9wMnz8dY+UI
	F67gQARoR3fWp1Ag==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1734695065; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=4V6E5KYM0GyakEt2RqG8mYgE23lMdJAwqMmhUF49Wtw=;
	b=Y2VSp8pqaUKCHRIiv6m9zyKGxf+mjCdqLdxooNguF9JdA3N2idXH6+TlpFj8G4pPVR02YY
	K6YAFAnx31EoJZdruixJSKJv9M/uYGTRbxYzNGyV2VRVF+Yq+QkNrFG2Dabcl2Kr4mPg+v
	jBFk9oyVUzaKesXXZPLEQWK+Y/xM3TE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1734695065;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=4V6E5KYM0GyakEt2RqG8mYgE23lMdJAwqMmhUF49Wtw=;
	b=B/znuULjIAaWIPvYG7fJRSFsTYkgTvFYB7VAZ7zKuClG1ByN6KR1QgVEw9cC2mJTF1hh5R
	moDDrUE8fYq3dXCQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 3C6C213A32;
	Fri, 20 Dec 2024 11:44:25 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id e/32CplYZWfUGwAAD6G6ig
	(envelope-from <tiwai@suse.de>); Fri, 20 Dec 2024 11:44:25 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Subject: [PATCH] ALSA: sh: Fix wrong argument order for copy_from_iter()
Date: Fri, 20 Dec 2024 12:44:16 +0100
Message-ID: <20241220114417.5898-1-tiwai@suse.de>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Score: -2.80
X-Spamd-Result: default: False [-2.80 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_MISSING_CHARSET(0.50)[];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCPT_COUNT_ONE(0.00)[1];
	ARC_NA(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,intel.com:email,suse.de:mid,suse.de:email];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	TO_DN_NONE(0.00)[];
	RCVD_TLS_ALL(0.00)[]
X-Spam-Flag: NO
X-Spam-Level: 

Fix a brown paper bag bug I introduced at converting to the standard
iter helper; the arguments were wrongly passed and have to be
swapped.

Fixes: 9b5f8ee43e48 ("ALSA: sh: Use standard helper for buffer accesses")
Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202412140019.jat5Dofr-lkp@intel.com/
Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/sh/sh_dac_audio.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/sh/sh_dac_audio.c b/sound/sh/sh_dac_audio.c
index a4d07438ad64..3f5422145c5e 100644
--- a/sound/sh/sh_dac_audio.c
+++ b/sound/sh/sh_dac_audio.c
@@ -163,7 +163,7 @@ static int snd_sh_dac_pcm_copy(struct snd_pcm_substream *substream,
 	/* channel is not used (interleaved data) */
 	struct snd_sh_dac *chip = snd_pcm_substream_chip(substream);
 
-	if (copy_from_iter(chip->data_buffer + pos, src, count) != count)
+	if (copy_from_iter(chip->data_buffer + pos, count, src) != count)
 		return -EFAULT;
 	chip->buffer_end = chip->data_buffer + pos + count;
 
-- 
2.43.0

