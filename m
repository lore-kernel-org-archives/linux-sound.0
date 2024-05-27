Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55CE017E90F
	for <linux-sound@vger.kernel.org>; Mon, 27 May 2024 15:18:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716823123; cv=none; b=SDVTuiQ6jN2MKbqZssFT3Ptb8VFW1ojaUN2hAzBuMo7EJtH70Q2NYK0UPB/rgNFrztUMqDJqc104LLvKPzvBZJwgYtEltVgzeyIBNiYinW9T/fCH0gfnz3Lr684uMtS06Qqc8jtLc+Pei0j3qtkY+4xjeHxHJW6y6/7QvrPZ+jw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716823123; c=relaxed/simple;
	bh=kNtbNHRpEjBThcLJCFmDLjBqNoZXVuUTcW9NDXn/Bns=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=g/ZIxGXfoIW+jPFyDbsXPa93s44R4WrbmL4xJTPGVOi89ywkDmSmIBinBLphI4SF8BNlxppKn3+TQwYNkEtcUPoVkWmYTE2oBoIBd+dAG80yFEaA8LHpPbhDrdsGrWKfrNUmvQRhInN0/LmxCQ3MV0EtpKtV50KMLYiTdeH3TMI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=tjFard3L; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=nYtC7VDD; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=tjFard3L; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=nYtC7VDD; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="tjFard3L";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="nYtC7VDD";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="tjFard3L";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="nYtC7VDD"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 697D81FDFB;
	Mon, 27 May 2024 15:18:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1716823119; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=2uLzNl/q27aN8GmiDX1jUv+biTtLzlPlZYSbsxwLSvE=;
	b=tjFard3LCbqGYqM4cBXYPFjBx03OkFJSwJyxHOWnZTp/UPWTMKmATOtSp2+Q6NRbE2JGJT
	lVoQUoBYFsiZJRkdNYjdEJNqecNKipOIT7ncLO5rejRL5A5HGm3w4iMLjEWmEhZw+W/rLj
	5D8kGuqcXQnVXHzSemg77DxPkkYV0dk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1716823119;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=2uLzNl/q27aN8GmiDX1jUv+biTtLzlPlZYSbsxwLSvE=;
	b=nYtC7VDDXENYSM6nBRW5Pv/ixgoxaZGJLP1vDgKnvZdZKpuaLcPj389wgsoEO/rGh1pGOL
	PYfOZybiDaLTmUCQ==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1716823119; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=2uLzNl/q27aN8GmiDX1jUv+biTtLzlPlZYSbsxwLSvE=;
	b=tjFard3LCbqGYqM4cBXYPFjBx03OkFJSwJyxHOWnZTp/UPWTMKmATOtSp2+Q6NRbE2JGJT
	lVoQUoBYFsiZJRkdNYjdEJNqecNKipOIT7ncLO5rejRL5A5HGm3w4iMLjEWmEhZw+W/rLj
	5D8kGuqcXQnVXHzSemg77DxPkkYV0dk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1716823119;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=2uLzNl/q27aN8GmiDX1jUv+biTtLzlPlZYSbsxwLSvE=;
	b=nYtC7VDDXENYSM6nBRW5Pv/ixgoxaZGJLP1vDgKnvZdZKpuaLcPj389wgsoEO/rGh1pGOL
	PYfOZybiDaLTmUCQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 4F7B313A87;
	Mon, 27 May 2024 15:18:39 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id KJ+pEU+kVGZWPwAAD6G6ig
	(envelope-from <tiwai@suse.de>); Mon, 27 May 2024 15:18:39 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Subject: [PATCH 2/2] ALSA: seq: Don't clear bank selection at event -> UMP MIDI2 conversion
Date: Mon, 27 May 2024 17:18:50 +0200
Message-ID: <20240527151852.29036-2-tiwai@suse.de>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240527151852.29036-1-tiwai@suse.de>
References: <20240527151852.29036-1-tiwai@suse.de>
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
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	NEURAL_HAM_SHORT(-0.20)[-0.999];
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
X-Spam-Score: -2.80
X-Spam-Flag: NO

The current code to convert from a legacy sequencer event to UMP MIDI2
clears the bank selection at each time the program change is
submitted.  This is confusing and may lead to incorrect bank values
tranmitted to the destination in the end.

Drop the line to clear the bank info and keep the provided values.

Fixes: e9e02819a98a ("ALSA: seq: Automatic conversion of UMP events")
Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/core/seq/seq_ump_convert.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/sound/core/seq/seq_ump_convert.c b/sound/core/seq/seq_ump_convert.c
index c21be87f5da9..f5d22dd00842 100644
--- a/sound/core/seq/seq_ump_convert.c
+++ b/sound/core/seq/seq_ump_convert.c
@@ -892,7 +892,6 @@ static int pgm_ev_to_ump_midi2(const struct snd_seq_event *event,
 		data->pg.bank_msb = cc->cc_bank_msb;
 		data->pg.bank_lsb = cc->cc_bank_lsb;
 		cc->bank_set = 0;
-		cc->cc_bank_msb = cc->cc_bank_lsb = 0;
 	}
 	return 1;
 }
-- 
2.43.0

