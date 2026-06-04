Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29C3C3314AC
	for <linux-sound@vger.kernel.org>; Thu,  4 Jun 2026 15:19:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780586372; cv=none; b=HTHUsDMpMCFCvkvfkfSNH9kWhDKqlM14qTDqYJqQ8SMqn85C1EGHt2P12PDCUMbD7Nng2xiYMTHilLeS9U0qLJhoy6XyViu/vallvDz13Lk2CC+JPea77n0n8Yt42wbIW1eQbYxmSLkt+C0Ec8jfR2Jv1caxuKp2H2CMeu/asQU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780586372; c=relaxed/simple;
	bh=QVFkeDIlii/8bbsD3aHYTYsZil9etk4OJnJsC5uGfX4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=jD5JXu54vLkGMxTlp3f8neOqaQn8nqaCHuvYwiIzcRRhhojJrBTlUBduDXMOxQXlEViSJhtzDymycTDrW2jSh8TFWnAeg/p0ifozvocudUS2TJXEp1BlZwZkheWv6CkKUaqis2OcprzzGESqnkXyUpiY7jki+6Baldl2ZBq2OE4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=oU8R7ivk; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=fV/p1kp5; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=oU8R7ivk; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=fV/p1kp5; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="oU8R7ivk";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="fV/p1kp5";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="oU8R7ivk";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="fV/p1kp5"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 7860D683FA;
	Thu,  4 Jun 2026 15:19:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1780586369; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=2mqFuFC3xzWUimh3a+SukYgSKhjX4fISHm3ZCCJnGD4=;
	b=oU8R7ivkAdPH/DmAs4LjBbRU7JAy9o0ZAY9dcwUuetJuMVjBe+zzEnbXeDX9o8Pa5h8yt4
	uokN3Hgp4F4oQAYTFwvl6pbLEVoFwMTuF8rKaJgUf7jte9B5UGUcie7TYTYAYuA/SfasRC
	1ShHp5MaAXivmNZz6ON2wOsxGEuctms=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1780586369;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=2mqFuFC3xzWUimh3a+SukYgSKhjX4fISHm3ZCCJnGD4=;
	b=fV/p1kp5+4D+ZTvAZ53Bg1Mv9TRA4DA007SdwkCe1NevuJksHR4YA//HPvMqn0iMKeCEeF
	4X21U8pyW9Cm0SBw==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1780586369; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=2mqFuFC3xzWUimh3a+SukYgSKhjX4fISHm3ZCCJnGD4=;
	b=oU8R7ivkAdPH/DmAs4LjBbRU7JAy9o0ZAY9dcwUuetJuMVjBe+zzEnbXeDX9o8Pa5h8yt4
	uokN3Hgp4F4oQAYTFwvl6pbLEVoFwMTuF8rKaJgUf7jte9B5UGUcie7TYTYAYuA/SfasRC
	1ShHp5MaAXivmNZz6ON2wOsxGEuctms=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1780586369;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=2mqFuFC3xzWUimh3a+SukYgSKhjX4fISHm3ZCCJnGD4=;
	b=fV/p1kp5+4D+ZTvAZ53Bg1Mv9TRA4DA007SdwkCe1NevuJksHR4YA//HPvMqn0iMKeCEeF
	4X21U8pyW9Cm0SBw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 54F3F779A8;
	Thu,  4 Jun 2026 15:19:29 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id scdzE4GXIWpoIAAAD6G6ig
	(envelope-from <tiwai@suse.de>); Thu, 04 Jun 2026 15:19:29 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Cc: wangdicheng <wangdicheng@kylinos.cn>,
	Mark Brown <broonie@kernel.org>
Subject: [PATCH] ALSA: usb-audio: Drop unused variables
Date: Thu,  4 Jun 2026 17:19:17 +0200
Message-ID: <20260604151927.1227105-1-tiwai@suse.de>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Flag: NO
X-Spamd-Result: default: False [-2.80 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_MISSING_CHARSET(0.50)[];
	NEURAL_HAM_SHORT(-0.20)[-0.997];
	MIME_GOOD(-0.10)[text/plain];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FROM_HAS_DN(0.00)[];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,suse.de:email,suse.de:mid];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	RCPT_COUNT_THREE(0.00)[3];
	RCVD_TLS_ALL(0.00)[]
X-Spam-Level: 
X-Spam-Score: -2.80

Forgot to clean up the unused variables after the code refactoring,
which leads to compile warnings.

Reported-by: Mark Brown <broonie@kernel.org>
Closes: https://lore.kernel.org/aiGUoChmVKE-xwvC@sirena.org.uk
Fixes: f1f16e1809c8 ("ALSA: usb-audio: qcom: Use PAGE_ALIGN macro for buffer size calculation")
Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/usb/qcom/qc_audio_offload.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/sound/usb/qcom/qc_audio_offload.c b/sound/usb/qcom/qc_audio_offload.c
index 32982318fbed..b2b719238b0b 100644
--- a/sound/usb/qcom/qc_audio_offload.c
+++ b/sound/usb/qcom/qc_audio_offload.c
@@ -1042,8 +1042,6 @@ static int uaudio_transfer_buffer_setup(struct snd_usb_substream *subs,
 	u32 len = xfer_buf_len;
 	bool dma_coherent;
 	dma_addr_t xfer_buf_dma_sysdev;
-	u32 remainder;
-	u32 mult;
 	int ret;
 
 	dma_coherent = dev_is_dma_coherent(subs->dev->bus->sysdev);
-- 
2.54.0

