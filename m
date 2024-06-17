Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0151218C326
	for <linux-sound@vger.kernel.org>; Mon, 17 Jun 2024 10:05:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718618707; cv=none; b=btCxijwPEy2uuhsT/c9ALaiPyHFuJQMXbletTW//Fi5NCqnBbJOfGJP0mC+AkqUcN4V7ocK1MOr1dChyM7oiW5S8Sd2q7uAcmvwqFqXkkLhLzRiEe7IHKNfFj0sZ8K5Hn9smXnCJoilWMwS3v0dqAdpLR7lPtVPGjKnQFfbGNoc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718618707; c=relaxed/simple;
	bh=fBTvW4BaP0eLHdkTE+5rX7v09I1EqRfKBJO50wM4Vcs=;
	h=From:To:Subject:Date:Message-ID:MIME-Version; b=ZFa82O120yLtiafKteZ1WHU22ceH70KDZXsYb3PxNS8SjvFw41irGXeMRUEtoGUjcS00Ku9hb08P3+UCR2y7851QOA4q1ca3+pgoqF5mPG+e7lDeKS6fUBYIF0a+/U1eQdEaB+oIKBzUWX4hp86HreJ9bZb6AAfDEIVreX2zRFs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=x6uxCr9C; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=t+ECcmXI; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=x6uxCr9C; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=t+ECcmXI; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="x6uxCr9C";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="t+ECcmXI";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="x6uxCr9C";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="t+ECcmXI"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 501E05FE6B;
	Mon, 17 Jun 2024 10:05:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1718618704; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=HL/Is8+kluxt61kTfA6TSnvOpFwK4JMRRIpCq8WEswA=;
	b=x6uxCr9CFTdDYKFpFTzqfpK4zCfCq/SaYTYvHdbcwCUlCldysgf6waPW0V7zzxXcpYrBYW
	uSgMe5771suV+8g002Ru5Y9lb4qiwHA3qxxYDp7WRAkq1if6S+ubsb4qdyC0Pf74OceuuD
	pmOB/USW9NvsXGkmQ3vJ7jZGSzmJ43o=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1718618704;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=HL/Is8+kluxt61kTfA6TSnvOpFwK4JMRRIpCq8WEswA=;
	b=t+ECcmXIm7IBh+MBFFeG14WQa58bf4YOwAoGgQqVhBY0CRmVBmCVOBAtsI5RpW6M5HMl9g
	fnBgmh9Gtlr3umBA==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=x6uxCr9C;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=t+ECcmXI
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1718618704; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=HL/Is8+kluxt61kTfA6TSnvOpFwK4JMRRIpCq8WEswA=;
	b=x6uxCr9CFTdDYKFpFTzqfpK4zCfCq/SaYTYvHdbcwCUlCldysgf6waPW0V7zzxXcpYrBYW
	uSgMe5771suV+8g002Ru5Y9lb4qiwHA3qxxYDp7WRAkq1if6S+ubsb4qdyC0Pf74OceuuD
	pmOB/USW9NvsXGkmQ3vJ7jZGSzmJ43o=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1718618704;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=HL/Is8+kluxt61kTfA6TSnvOpFwK4JMRRIpCq8WEswA=;
	b=t+ECcmXIm7IBh+MBFFeG14WQa58bf4YOwAoGgQqVhBY0CRmVBmCVOBAtsI5RpW6M5HMl9g
	fnBgmh9Gtlr3umBA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 36767139AB;
	Mon, 17 Jun 2024 10:05:04 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id 1REHDFAKcGYfAgAAD6G6ig
	(envelope-from <tiwai@suse.de>); Mon, 17 Jun 2024 10:05:04 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Subject: [PATCH 0/5] ALSA: Allow NULL passed to snd_ctl_remove()
Date: Mon, 17 Jun 2024 12:05:22 +0200
Message-ID: <20240617100529.6667-1-tiwai@suse.de>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 501E05FE6B
X-Spam-Score: -3.01
X-Spam-Level: 
X-Spam-Flag: NO
X-Spamd-Result: default: False [-3.01 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	TO_DN_NONE(0.00)[];
	ARC_NA(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_ONE(0.00)[1];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	RCVD_TLS_ALL(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	URIBL_BLOCKED(0.00)[imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns,suse.de:dkim];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	DNSWL_BLOCKED(0.00)[2a07:de40:b281:106:10:150:64:167:received,2a07:de40:b281:104:10:150:64:97:from];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[suse.de:+]
X-Rspamd-Action: no action
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org

This is a small series of cleanup patches for the call patterns with
snd_ctl_remove() and NULL kcontrol.
Now snd_ctl_remove() accepts the NULL argument just like free() or
kfree(), so that the callers can be cleaned up without NULL checks.

No functional changes should be introduced by this patch set.


Takashi

===

Takashi Iwai (5):
  ALSA: control: Allow NULL passed to snd_ctl_remove()
  ALSA: sb: Drop NULL check for snd_ctl_remove()
  ALSA: emu10k1:  Drop NULL check for snd_ctl_remove()
  ALSA: hda: Drop NULL check for snd_ctl_remove()
  ALSA: spi: Drop NULL check for snd_ctl_remove()

 sound/core/control.c            |  3 +++
 sound/isa/sb/emu8000.c          |  6 ++----
 sound/isa/sb/sb16_csp.c         | 12 ++++--------
 sound/pci/emu10k1/emufx.c       |  5 +----
 sound/pci/hda/hda_cs_dsp_ctl.c  |  2 +-
 sound/pci/hda/tas2781_hda_i2c.c | 13 ++++---------
 sound/spi/at73c213.c            |  8 ++------
 7 files changed, 17 insertions(+), 32 deletions(-)

-- 
2.43.0

