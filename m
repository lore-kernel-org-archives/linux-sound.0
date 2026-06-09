Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98C333F9298
	for <linux-sound@vger.kernel.org>; Tue,  9 Jun 2026 11:51:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781005867; cv=none; b=VJioTmohA9/zuB3XuTljmYzBf6LBQRxrYAuZx/g/2CNxsVY3whEcjpmkucjAwzcGOe2r2S0iuysig//E01YyJhOZUV+S0DpRVuuwZpYlvFvof77I8hHGTbfgMo0CD3Z3cdb/AvG/eXYQw12qLLYSljclaGNDWn8dgaou4Rn3U4M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781005867; c=relaxed/simple;
	bh=qP2cT0GgUzZ/OGtBhAMGyvRMT4X/Olmxu0HP/mhS4YE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=MpY8xFJ2SXHFxmshqzAEHpKs/Rmzp3OJXAIK9rdPPxgusbNx5Vh0IlKVTiTf2MArhav43bO7RF0LZDQ0HJX1d2h02ESWHaMkBjCSaan3Ep/yhiQRx3rnJ2YEPN4hJeI6nKfa+aRX3XQ5FK8A2tDKNRhaIfLeupMqg55RTYTfYbs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=uJoNc3rU; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=iFanOgYZ; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=uJoNc3rU; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=iFanOgYZ; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="uJoNc3rU";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="iFanOgYZ";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="uJoNc3rU";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="iFanOgYZ"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id D88FA75AF4;
	Tue,  9 Jun 2026 11:51:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1781005864; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=y+coBytkHjxmTD8nR778a0IubE0JVKAm8NMPjytHj4Y=;
	b=uJoNc3rUT7SaqLH3q+OX3Uo0bbmNCbzFaCnVNqQpyp4B8AIN2k+MRudDPuBDQxj6BdHuny
	+dQcya5XNzs+/wwVXXXthzTC9EzGXyMP1HT2qSxMV62n1Eb8pae/n4h5hvXBqThb4EziTZ
	M41fucjukcDF0GSj+hMKiKUxkEWiZnw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1781005864;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=y+coBytkHjxmTD8nR778a0IubE0JVKAm8NMPjytHj4Y=;
	b=iFanOgYZFT3u4EmbTc5Ad/MNP5XMZqtNsQEJ2MtSwIZX2RUOfLG20xPZyhlqty3k68fjd2
	tkg97Apzan+AOxCA==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=uJoNc3rU;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=iFanOgYZ
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1781005864; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=y+coBytkHjxmTD8nR778a0IubE0JVKAm8NMPjytHj4Y=;
	b=uJoNc3rUT7SaqLH3q+OX3Uo0bbmNCbzFaCnVNqQpyp4B8AIN2k+MRudDPuBDQxj6BdHuny
	+dQcya5XNzs+/wwVXXXthzTC9EzGXyMP1HT2qSxMV62n1Eb8pae/n4h5hvXBqThb4EziTZ
	M41fucjukcDF0GSj+hMKiKUxkEWiZnw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1781005864;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=y+coBytkHjxmTD8nR778a0IubE0JVKAm8NMPjytHj4Y=;
	b=iFanOgYZFT3u4EmbTc5Ad/MNP5XMZqtNsQEJ2MtSwIZX2RUOfLG20xPZyhlqty3k68fjd2
	tkg97Apzan+AOxCA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id C02C8779A7;
	Tue,  9 Jun 2026 11:51:04 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id sfxZLij+J2rvMQAAD6G6ig
	(envelope-from <tiwai@suse.de>); Tue, 09 Jun 2026 11:51:04 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	Kyle Zeng <kylebot@openai.com>
Subject: [PATCH 0/3] ALSA: more fixes for timer
Date: Tue,  9 Jun 2026 13:50:52 +0200
Message-ID: <20260609115100.806869-1-tiwai@suse.de>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Action: no action
X-Rspamd-Queue-Id: D88FA75AF4
X-Spam-Flag: NO
X-Spam-Score: -3.01
X-Spam-Level: 
X-Spamd-Result: default: False [-3.01 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	MIME_TRACE(0.00)[0:+];
	URIBL_BLOCKED(0.00)[suse.de:mid,suse.de:dkim,imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo];
	ARC_NA(0.00)[];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	RCVD_TLS_ALL(0.00)[];
	DKIM_TRACE(0.00)[suse.de:+];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	DNSWL_BLOCKED(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	RCPT_COUNT_THREE(0.00)[3];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid,suse.de:dkim,imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo]
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org

Hi,

as there are still open holes in ALSA timer code that may lead to
UAFs, here is a patch to address more drastically, by introducing the
refcounting for the timer object's lifecycle.  With this change, the
previous workaround is no longer needed, hence it's reverted in the
second patch.  And, the third one is to assure the pending work being
finished at freeing.  I don't think we've received a report about it,
but just to be sure.

This is targeted for 7.2.


Takashi

===

Takashi Iwai (3):
  ALSA: timer: Manage timer object with kref
  Revert "ALSA: timer: Fix UAF at snd_timer_user_params()"
  ALSA: timer: Disable work at freeing timer object

 include/sound/timer.h      |   6 +++
 sound/core/seq/seq_timer.c |  11 ++--
 sound/core/timer.c         | 107 +++++++++++++++++++++++++++----------
 sound/core/timer_compat.c  |   5 +-
 4 files changed, 97 insertions(+), 32 deletions(-)

-- 
2.54.0

