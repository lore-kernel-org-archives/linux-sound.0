Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DB1317C7A3
	for <linux-sound@vger.kernel.org>; Thu, 30 May 2024 10:10:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717063834; cv=none; b=PISS6CdDrzboXHMUSYmySiFdk5Cv0x6lX+UnfNv+32kQtnfYhd4EhEWHE+NSrLn/QDgkOOnVFxC7T+kX56sis3vXfS4qhvZ6+k86S9dQGUZdVi0zYeqEGXMf37IkIiMrwA561fg0EDVvgg3vguxS11GFmu615AKBY1iOSrBBfmU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717063834; c=relaxed/simple;
	bh=JlugjECUQxG9bzzXXAB8WqifZRkFhRjYjHKHc964g94=;
	h=From:To:Subject:Date:Message-ID:MIME-Version; b=IJE2VCuc59Aq54CLnyaH7bUkkvQO3lmdT68YOTi+Qy2SSayZ+QjMXsG/ZC2nex5K7JeaBjxaQDzflLG/JYSLZ4gvFiqJRP1R+y5LbNbhKoMsBj4g1AXa9DKE7vcBwiUUJLMYQpCd/rlM6rBjBpiw4AZOK/Kp/NI/bG/Zk3Y6gfM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=Du3bZrtN; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=lmb71N7w; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=Du3bZrtN; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=lmb71N7w; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="Du3bZrtN";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="lmb71N7w";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="Du3bZrtN";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="lmb71N7w"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 44ABA20779;
	Thu, 30 May 2024 10:10:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1717063825; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=WZIA0jSxXlglI7OfKB6a0cdKNJH74KgwDDAe90x5KNE=;
	b=Du3bZrtNg2+fQD0uyDf/zgjHXyV5l4xNXs7Al715017T7SnujXgOK6Va8OiVAeRj3BDQrE
	+1Bq4E+2piCZb+V6K60PS7+O/IuR5/FlTV9b7lB+MmIa3SupfifK6j3l2HGANHwCL7N81Q
	B7NS06S+PjxHwG9ywzr+Q2YMxao6UB0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1717063825;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=WZIA0jSxXlglI7OfKB6a0cdKNJH74KgwDDAe90x5KNE=;
	b=lmb71N7wTAE2PYnl7eS94c0xK+S0kId/pzczKqAnfsG++dd77yEWOoFkMTHSal3FNm9KsD
	XOQ6doEsVO91iABw==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1717063825; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=WZIA0jSxXlglI7OfKB6a0cdKNJH74KgwDDAe90x5KNE=;
	b=Du3bZrtNg2+fQD0uyDf/zgjHXyV5l4xNXs7Al715017T7SnujXgOK6Va8OiVAeRj3BDQrE
	+1Bq4E+2piCZb+V6K60PS7+O/IuR5/FlTV9b7lB+MmIa3SupfifK6j3l2HGANHwCL7N81Q
	B7NS06S+PjxHwG9ywzr+Q2YMxao6UB0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1717063825;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=WZIA0jSxXlglI7OfKB6a0cdKNJH74KgwDDAe90x5KNE=;
	b=lmb71N7wTAE2PYnl7eS94c0xK+S0kId/pzczKqAnfsG++dd77yEWOoFkMTHSal3FNm9KsD
	XOQ6doEsVO91iABw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 2A13013A83;
	Thu, 30 May 2024 10:10:25 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id XoQACZFQWGYiJwAAD6G6ig
	(envelope-from <tiwai@suse.de>); Thu, 30 May 2024 10:10:25 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Subject: [PATCH] ALSA: seq: Fix yet another spot for system message conversion
Date: Thu, 30 May 2024 12:10:43 +0200
Message-ID: <20240530101044.17524-1-tiwai@suse.de>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Flag: NO
X-Spam-Score: -2.80
X-Spam-Level: 
X-Spamd-Result: default: False [-2.80 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:email];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	TO_DN_NONE(0.00)[];
	RCVD_TLS_ALL(0.00)[]

We fixed the incorrect UMP type for system messages in the recent
commit, but it missed one place in system_ev_to_ump_midi1().
Fix it now.

Fixes: e9e02819a98a ("ALSA: seq: Automatic conversion of UMP events")
Fixes: c2bb79613fed ("ALSA: seq: Fix incorrect UMP type for system messages")
Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/core/seq/seq_ump_convert.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/core/seq/seq_ump_convert.c b/sound/core/seq/seq_ump_convert.c
index add70b4c2885..f0f332017e66 100644
--- a/sound/core/seq/seq_ump_convert.c
+++ b/sound/core/seq/seq_ump_convert.c
@@ -729,6 +729,7 @@ static int system_ev_to_ump_midi1(const struct snd_seq_event *event,
 				  union snd_ump_midi1_msg *data,
 				  unsigned char status)
 {
+	data->system.type = UMP_MSG_TYPE_SYSTEM; // override
 	data->system.status = status;
 	return 1;
 }
-- 
2.43.0

