Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=195.135.223.130
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795614902;
	b=gnzbGZZ2bgZ1j5Fz0nEwywjvbayjnZUuewyVDgxNzY1OYgOf6ZEIc/YaUZO1sgAt72ch
	 9bbDrWh2wKMd4+9pImhcQRaWxRMmDu4Udvr91p0F08tiXS0Mdpokj8tN7jwnVwPoYw72q
	 zKK2a1w/70Nru5qUZ1qPTcHMLpNdtFGHkX8Cjr8ofQV9KPn/auOcmePUxyH8FZP3ZsAjd
	 P5K9IvGSk82muICDxC5KiikEhQpElsFBwz2fIUO1fSvTdaQdnnGZAPveHqcJu8wH5ZJBe
	 dWeGilPibVd6R7K7IH9HpOEwR6V//9Kt14byXD0M8m3wATCyDaH2kfPbaLtZOcAetkQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795614902;
	h=DMARC-Filter:Received:DKIM-Signature:DKIM-Signature:DKIM-Signature:
	 DKIM-Signature:Received:Received:From:To:Subject:Date:Message-ID:
	 X-Mailer:MIME-Version:Content-Transfer-Encoding:X-Spamd-Result:
	 X-Spam-Score:X-Spam-Level:X-Spam-Flag;
	bh=MMlMKO3dWuu4qaNyTUy0YHJ/ENS65Lu1XZ/j1NliVxY=;
	b=glhwVU1yEG6O8UFPUyVImnzAt8aUKc2ek2TBDGoHL4k48fu9+TOQ4TB/ChMaViQ6ByCZ
	 +cJxrR4PZEd+8BogcIoMASM8VLImVhqBdUGQ4uFvOuTaGTKq6Dp+pNPBE7WmDJwjhMAY1
	 t+ymxkGhnGG90JFJc92cW1JYs7d9mE4KBouQI1yKT5JomAo+RnpYBurvht0t3oTWgnq0E
	 9UvkqZa+XdxGswBRHkYDw0yauXnhKeE2iK+ZD1hOmy12nT+VXYZz0MiGn3GO4mYs8H2Qd
	 9pfL6SkmMnEAHCMFLb7E/BNKItkKzBwPnNnhtgpEFPp2cUpzdxzJ9LQ3HxGTqgERbcQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.de;
	spf=pass smtp.mailfrom=suse.de;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=SvAHDkdQ;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=wGoyELXN;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=SvAHDkdQ;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=wGoyELXN;
	arc=none smtp.remote-ip=195.135.223.130
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D292606A31E
	for <linux-sound@vger.kernel.org>; Wed, 25 Nov 2026 13:55:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6D292606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=SvAHDkdQ;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=wGoyELXN;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=SvAHDkdQ;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=wGoyELXN
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 7C58522003;
	Wed, 25 Nov 2026 13:54:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1795614899; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=MMlMKO3dWuu4qaNyTUy0YHJ/ENS65Lu1XZ/j1NliVxY=;
	b=SvAHDkdQibajX+Abi9aU3S8mb3zOYPg5WN8hMqrJm8Zc3qdzLgjYwNjorxXgSwoJ75ZoMm
	HmqS13TaiUaHuIkjAZXBwsA4xKr8eaTlXs0xWb1PJswGu02ON42riQqJH2Bt+zzhWTGp/3
	tTXjeECueG+FwCX9m3ut4H9y0BYF0xU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1795614899;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=MMlMKO3dWuu4qaNyTUy0YHJ/ENS65Lu1XZ/j1NliVxY=;
	b=wGoyELXN3Sj0arECqPRK6Y4QqituuUaJYn+IMzskuTUyS4YZmsCSOnVDfNOKpjRHB389wE
	8wFg+sHsIhSkgRAw==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1795614899; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=MMlMKO3dWuu4qaNyTUy0YHJ/ENS65Lu1XZ/j1NliVxY=;
	b=SvAHDkdQibajX+Abi9aU3S8mb3zOYPg5WN8hMqrJm8Zc3qdzLgjYwNjorxXgSwoJ75ZoMm
	HmqS13TaiUaHuIkjAZXBwsA4xKr8eaTlXs0xWb1PJswGu02ON42riQqJH2Bt+zzhWTGp/3
	tTXjeECueG+FwCX9m3ut4H9y0BYF0xU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1795614899;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=MMlMKO3dWuu4qaNyTUy0YHJ/ENS65Lu1XZ/j1NliVxY=;
	b=wGoyELXN3Sj0arECqPRK6Y4QqituuUaJYn+IMzskuTUyS4YZmsCSOnVDfNOKpjRHB389wE
	8wFg+sHsIhSkgRAw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 4483C1339F;
	Wed, 25 Nov 2026 13:54:59 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id LZyHCbPoBmsSQgAAD6G6ig
	(envelope-from <tiwai@suse.de>); Wed, 25 Nov 2026 13:54:59 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Subject: [PATCH] ALSA: oss: Fix deadlock at unregistering (again)
Date: Wed, 25 Nov 2026 14:54:52 +0100
Message-ID: <20261125135453.2088984-1-tiwai@suse.de>
X-Mailer: git-send-email 2.53.0
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Post: <mailto:linux-sound@vger.kernel.org>
List-Help: <mailto:linux-sound+help@vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-sound+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-11.80 / 50.00];
	SUSE_INTERNAL_BYPASS(-9.00)[];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_MISSING_CHARSET(0.50)[];
	NEURAL_HAM_SHORT(-0.20)[-0.995];
	MIME_GOOD(-0.10)[text/plain];
	RCPT_COUNT_ONE(0.00)[1];
	RCVD_VIA_SMTP_AUTH(0.00)[];
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
X-Spam-Score: -11.80
X-Spam-Level: 
X-Spam-Flag: NO

The recent code refactoring using guard() re-introduced a potential
deadlock at unregistering OSS device that had been fixed onceby the
commit 97d917879d7f ("ALSA: oss: Fix potential deadlock at
unregistration").  The unregister_sound_special() call must be done
outside the sound_oss_mutex.

Fix the regression by changing guard() with scoped_guard() to limit
the range.

Fixes: 742ecf3ce1ac ("ALSA: core: Use guard() for locking")
Cc: <stable@vger.kernel.org>
Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/core/sound_oss.c | 35 ++++++++++++++++++-----------------
 1 file changed, 18 insertions(+), 17 deletions(-)

diff --git a/sound/core/sound_oss.c b/sound/core/sound_oss.c
index 2f0bc481a46d..c1439f9d34cb 100644
--- a/sound/core/sound_oss.c
+++ b/sound/core/sound_oss.c
@@ -174,24 +174,25 @@ int snd_unregister_oss_device(int type, struct snd_card *card, int dev)
 		return 0;
 	if (minor < 0)
 		return minor;
-	guard(mutex)(&sound_oss_mutex);
-	mptr = snd_oss_minors[minor];
-	if (mptr == NULL)
-		return -ENOENT;
-	switch (SNDRV_MINOR_OSS_DEVICE(minor)) {
-	case SNDRV_MINOR_OSS_PCM:
-		track2 = SNDRV_MINOR_OSS(cidx, SNDRV_MINOR_OSS_AUDIO);
-		break;
-	case SNDRV_MINOR_OSS_MIDI:
-		track2 = SNDRV_MINOR_OSS(cidx, SNDRV_MINOR_OSS_DMMIDI);
-		break;
-	case SNDRV_MINOR_OSS_MIDI1:
-		track2 = SNDRV_MINOR_OSS(cidx, SNDRV_MINOR_OSS_DMMIDI1);
-		break;
+	scoped_guard(mutex, &sound_oss_mutex) {
+		mptr = snd_oss_minors[minor];
+		if (mptr == NULL)
+			return -ENOENT;
+		switch (SNDRV_MINOR_OSS_DEVICE(minor)) {
+		case SNDRV_MINOR_OSS_PCM:
+			track2 = SNDRV_MINOR_OSS(cidx, SNDRV_MINOR_OSS_AUDIO);
+			break;
+		case SNDRV_MINOR_OSS_MIDI:
+			track2 = SNDRV_MINOR_OSS(cidx, SNDRV_MINOR_OSS_DMMIDI);
+			break;
+		case SNDRV_MINOR_OSS_MIDI1:
+			track2 = SNDRV_MINOR_OSS(cidx, SNDRV_MINOR_OSS_DMMIDI1);
+			break;
+		}
+		if (track2 >= 0)
+			snd_oss_minors[track2] = NULL;
+		snd_oss_minors[minor] = NULL;
 	}
-	if (track2 >= 0)
-		snd_oss_minors[track2] = NULL;
-	snd_oss_minors[minor] = NULL;
 
 	/* call unregister_sound_special() outside sound_oss_mutex;
 	 * otherwise may deadlock, as it can trigger the release of a card
-- 
2.53.0

