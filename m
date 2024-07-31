Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBBE41B29C2
	for <linux-sound@vger.kernel.org>; Wed, 31 Jul 2024 14:19:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722435589; cv=none; b=ANyMNmGco5hB+Gl53vjXUcHt7Gb7lja51Fb+zWy/Nt3w9XURJC/14GinzKRMn8zbZCUJzsqtKZUJ2fW74nE9UQxhk5FfPa68jfWdkz9CaHNQBYTsB4r6WEBLSsgghzvQ+Bix+2MHYjeEJ+iJG9GclzPWWwwIsmiyMjfkejMvBZc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722435589; c=relaxed/simple;
	bh=i60xgZydneLdOwSLzxSxD+d7zf4DFWk6haDraAeOv/I=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=OXHmSqqBfqcNjTQmoy8IvYv0wKstzdEDXO0TPGN2+i6KYV1PzlqvTxD9jEPcJzekRJ1Kzs6pbpsAZYR0nbr2zgW1nKV93smYTm7LlxVFK+PKvQLrWpw6T3GrlDhIKAlfHpUW9W1IEKXJpke937ymJ8rr5t44Z3Xtceb4phYpRnA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=jQsJvAyO; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=UjBQvJSw; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=jQsJvAyO; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=UjBQvJSw; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="jQsJvAyO";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="UjBQvJSw";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="jQsJvAyO";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="UjBQvJSw"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id B93D721A42;
	Wed, 31 Jul 2024 14:19:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1722435584; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=DpBpKvN2sj1j4eJG/wWFUuqXB+Im3jVd95MU+bfWV6Q=;
	b=jQsJvAyOAE9x0+QKz6nbNFJNwWDFvq+g/ZUtHVGHymUmOWqdb4FMB+COMClg1Eh6+68a1u
	CZMs0CM0RcsM8SGw+ukKEqORuNkwew6HiODMdoILXY0ewm1DUzFJVbXWH0/cSvnNsf2ysX
	iUGAY+Fy+JPufB0K36d+tNaFv3ONVZo=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1722435584;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=DpBpKvN2sj1j4eJG/wWFUuqXB+Im3jVd95MU+bfWV6Q=;
	b=UjBQvJSw1HFDDWAkcYcE05kxCFCPnEgRsWpnhV+gTBXr+vqYonM4QGe8F/TktEub7cxygE
	glE9Mju+bSFVQDDg==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1722435584; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=DpBpKvN2sj1j4eJG/wWFUuqXB+Im3jVd95MU+bfWV6Q=;
	b=jQsJvAyOAE9x0+QKz6nbNFJNwWDFvq+g/ZUtHVGHymUmOWqdb4FMB+COMClg1Eh6+68a1u
	CZMs0CM0RcsM8SGw+ukKEqORuNkwew6HiODMdoILXY0ewm1DUzFJVbXWH0/cSvnNsf2ysX
	iUGAY+Fy+JPufB0K36d+tNaFv3ONVZo=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1722435584;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=DpBpKvN2sj1j4eJG/wWFUuqXB+Im3jVd95MU+bfWV6Q=;
	b=UjBQvJSw1HFDDWAkcYcE05kxCFCPnEgRsWpnhV+gTBXr+vqYonM4QGe8F/TktEub7cxygE
	glE9Mju+bSFVQDDg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 9C4D813297;
	Wed, 31 Jul 2024 14:19:44 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id Z5P3JABIqmZfcQAAD6G6ig
	(envelope-from <tiwai@suse.de>); Wed, 31 Jul 2024 14:19:44 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Cc: Sylvain BERTRAND <sylvain.bertrand@legeek.net>
Subject: [PATCH] ALSA: usb-audio: Correct surround channels in UAC1 channel map
Date: Wed, 31 Jul 2024 16:19:41 +0200
Message-ID: <20240731142018.24750-1-tiwai@suse.de>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-2.60 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_MISSING_CHARSET(0.50)[];
	MIME_GOOD(-0.10)[text/plain];
	RCPT_COUNT_TWO(0.00)[2];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:email];
	RCVD_COUNT_TWO(0.00)[2];
	RCVD_TLS_ALL(0.00)[]
X-Spam-Level: 
X-Spam-Flag: NO
X-Spam-Score: -2.60

USB-audio driver puts SNDRV_CHMAP_SL and _SR as left and right
surround channels for UAC1 channel map, respectively.  But they should
have been SNDRV_CHMAP_RL and _RR; the current value *_SL and _SR are
rather "side" channels, not "surround".  I guess I took those
mistakenly when I read the spec mentioning "surround left".

This patch corrects those entries to be the right channels.

Suggested-by: Sylvain BERTRAND <sylvain.bertrand@legeek.net>
Closes: https://lore.kernel.orgZ/qIyJD8lhd8hFhlC@freedom
Fixes: 04324ccc75f9 ("ALSA: usb-audio: add channel map support")
Cc: <stable@vger.kernel.org>
Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/usb/stream.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/usb/stream.c b/sound/usb/stream.c
index d5409f387945..e14c725acebf 100644
--- a/sound/usb/stream.c
+++ b/sound/usb/stream.c
@@ -244,8 +244,8 @@ static struct snd_pcm_chmap_elem *convert_chmap(int channels, unsigned int bits,
 		SNDRV_CHMAP_FR,		/* right front */
 		SNDRV_CHMAP_FC,		/* center front */
 		SNDRV_CHMAP_LFE,	/* LFE */
-		SNDRV_CHMAP_SL,		/* left surround */
-		SNDRV_CHMAP_SR,		/* right surround */
+		SNDRV_CHMAP_RL,		/* left surround */
+		SNDRV_CHMAP_RR,		/* right surround */
 		SNDRV_CHMAP_FLC,	/* left of center */
 		SNDRV_CHMAP_FRC,	/* right of center */
 		SNDRV_CHMAP_RC,		/* surround */
-- 
2.43.0

