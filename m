Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE29E1C9ED1
	for <linux-sound@vger.kernel.org>; Wed,  7 Aug 2024 09:22:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723022550; cv=none; b=L+At+qWey9xn3jMhadpZo38i8SEacVcSVSV2A01S1qMuPkRLrg1ZSdHrQv8xNjWjBl7Km4cXKKdNMcy710nNYUnJspJ3V+b7ZcYyiVGiPbFS7+ibKBRegXcH+Iorpq6NO0DpKkRwDDEax+XKlxZbRO6qXGP3L9Ds4OXq/9z7vx4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723022550; c=relaxed/simple;
	bh=AyX15CRXEhk4b2M6mLQaryk9qFitE+KvoYhT46O9yL8=;
	h=From:To:Subject:Date:Message-ID:MIME-Version; b=ZLNWmNbu3LTROTNk4skYDEroicUJneZzAVv9wuxF1sJmYlEaJZbKOi/c/1CO4hpIxVdZFCYx7BJgfH8wDR8o4O5joifwnOUlqpLLxapxsPBM+6INabLFXyRyxX4E/j9lZRnS5fbbM/uy3Vni2MY1RLnYoFA1BCy8sQ9+p0JPRfY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=EjhDEywR; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=likjBUFr; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=NGao07Lj; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=TPX5yb4S; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="EjhDEywR";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="likjBUFr";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="NGao07Lj";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="TPX5yb4S"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id D073821B51;
	Wed,  7 Aug 2024 09:22:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1723022547; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=CndAo75PwonO7yLUbKp2OsJkcXswPclnLTsPLaIVW+c=;
	b=EjhDEywRzZNEA0nosum2DWBjqGkzABiXBLQ/VME6t1CB9+YlZchobO/Xl7fm5brc/fjRmB
	1xGhbEzuG3qbWPonSbJslmxcbqvg30dy53ZxKQTMD+jr/bZMX/+FJ3TnWXhH6Sc8W2d5Z4
	zabUOnP8LMNMJGgrKKMLFn94cjGz2XM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1723022547;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=CndAo75PwonO7yLUbKp2OsJkcXswPclnLTsPLaIVW+c=;
	b=likjBUFrST2gkMO5T3ccAeORHij9Gw0Xr0YeBqxE4O+Hy8Syx0FgEVdaWPA+A8AnukFKs5
	7Qky4k61czkk+ECQ==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=NGao07Lj;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=TPX5yb4S
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1723022546; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=CndAo75PwonO7yLUbKp2OsJkcXswPclnLTsPLaIVW+c=;
	b=NGao07Ljg6iAaKVvBSHyjmWQJmhFD/gsWwM+xyJkdAldexunm9pQ8Zh948klfZI44j0L25
	Slv7qdnLbu0/8mjWFI8XSQABkMyIzYxRwc6Y92yjHY5WDTasBiM1cUsX/F9iB5g8TbgIkb
	eNJbGY2NmtI2qY4WhThmID3WDty7e94=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1723022546;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=CndAo75PwonO7yLUbKp2OsJkcXswPclnLTsPLaIVW+c=;
	b=TPX5yb4S9UTiqwpSpaVjkPn1J43G2pqn7eKvt3ni0ZbYZzpla+s5SVuC5XU68weBzxLzPm
	3X6HPvIyn0Z+GDDw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id B690D13297;
	Wed,  7 Aug 2024 09:22:26 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id 3McPK9I8s2ZxCgAAD6G6ig
	(envelope-from <tiwai@suse.de>); Wed, 07 Aug 2024 09:22:26 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Subject: [PATCH 0/6] ALSA: Fixes for optional MIDI 1.0 port in MIDI 2.0
Date: Wed,  7 Aug 2024 11:22:55 +0200
Message-ID: <20240807092303.1935-1-tiwai@suse.de>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Level: 
X-Rspamd-Action: no action
X-Spam-Score: -3.01
X-Spam-Flag: NO
X-Rspamd-Queue-Id: D073821B51
X-Spamd-Result: default: False [-3.01 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	RCPT_COUNT_ONE(0.00)[1];
	ARC_NA(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	DKIM_TRACE(0.00)[suse.de:+];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	TO_DN_NONE(0.00)[];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	DNSWL_BLOCKED(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:dkim]
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org

Hi,

below is a series of small fixes for handling the optional MIDI 1.0
ports that are allowed in MIDI 2.0 spec.  It's rather for a rare case
such as no UMP FB Info is given but only GTB is available, so most
user won't notice, hopefully.


Takashi

===

Takashi Iwai (6):
  ALSA: ump: Choose the protocol when protocol caps are changed
  ALSA: usb-audio: Accept multiple protocols in GTBs
  ALSA: usb-audio: Set MIDI1 flag appropriately for GTB MIDI 1.0 entry
  ALSA: usb-audio: Update UMP group attributes for GTB blocks, too
  ALSA: seq: Print MIDI 1.0 specific port in proc output
  ALSA: seq: Fix missing seq port info bit return for MIDI 1.0 block

 include/sound/ump.h            |  1 +
 sound/core/seq/seq_clientmgr.c |  7 ++++++-
 sound/core/seq/seq_ports.c     |  3 +++
 sound/core/ump.c               | 31 +++++++++++++++++++----------
 sound/usb/midi2.c              | 36 ++++++++++++++++++++--------------
 5 files changed, 52 insertions(+), 26 deletions(-)

-- 
2.43.0

