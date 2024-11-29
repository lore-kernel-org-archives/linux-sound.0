Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62D46175D47
	for <linux-sound@vger.kernel.org>; Fri, 29 Nov 2024 09:45:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732873556; cv=none; b=nSgFugbnWBcdwiGjr4RKgB5TA98qtjgsTd/LlKtz2D91pdB85YqUhd3YGjGAYRo9TH3wBfh2r3rQiYCzSdO4mxX3Js8ygZH+oj8UT/2rxcUZBSjEhKeR7zjT8rg+Zott0z2+LGl0onYaCMjbNh8LijLdYjbOhsOZBusZ7hW+Yws=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732873556; c=relaxed/simple;
	bh=QUxQphdr64d1YKK7NqleAEVcSxrGjXC8/GyqMLa6ybI=;
	h=From:To:Subject:Date:Message-ID:MIME-Version; b=kDMytBR723Ys+k+4k/7+rzdB1r5C+eB6O6Wi0QMvYXl4eKnqckrEORN15DdRjO46+sW783fw2Za7k+ZWZwwX/Vhg0oqCHkfXBBeiK65KgGfRMD+rdonCFQ1j8BIQXxM5yLPndV0yJ+XXi+HxXJi1IzC1dMelDez4RcEmcQWrYb4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=xkHEfTt5; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=pvQZ3Xc2; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=xkHEfTt5; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=pvQZ3Xc2; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="xkHEfTt5";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="pvQZ3Xc2";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="xkHEfTt5";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="pvQZ3Xc2"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 7B5121F390;
	Fri, 29 Nov 2024 09:45:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1732873552; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=0mfk9JRxl5xQXN3TlkdGagEx2P7W3QQdKZOWfjIfZFc=;
	b=xkHEfTt5hE3XaBpzFcElOq46RRBY1gRIHDwEfzuwg4nAGNkX63a2V3TyrJboL5Uo9HrxI6
	obQB+o/WMAatEpw3Gzc5bXNBwoY0gvnfptFO+7EliBGGpe6jkFUMnmeOk/CgEZBQ8qmYps
	Y7AM9xF9gctXFYmnZ5mNaHzhdP04emc=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1732873552;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=0mfk9JRxl5xQXN3TlkdGagEx2P7W3QQdKZOWfjIfZFc=;
	b=pvQZ3Xc2cl8tY6BvrRX2/5Rt8XIQzc3Sbtu0U8cvKB4Jqgc0Sq4f1ifqZ+S8p51sVpsZOs
	Y2vvis0varJCeIDg==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1732873552; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=0mfk9JRxl5xQXN3TlkdGagEx2P7W3QQdKZOWfjIfZFc=;
	b=xkHEfTt5hE3XaBpzFcElOq46RRBY1gRIHDwEfzuwg4nAGNkX63a2V3TyrJboL5Uo9HrxI6
	obQB+o/WMAatEpw3Gzc5bXNBwoY0gvnfptFO+7EliBGGpe6jkFUMnmeOk/CgEZBQ8qmYps
	Y7AM9xF9gctXFYmnZ5mNaHzhdP04emc=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1732873552;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=0mfk9JRxl5xQXN3TlkdGagEx2P7W3QQdKZOWfjIfZFc=;
	b=pvQZ3Xc2cl8tY6BvrRX2/5Rt8XIQzc3Sbtu0U8cvKB4Jqgc0Sq4f1ifqZ+S8p51sVpsZOs
	Y2vvis0varJCeIDg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 45BFA13AA5;
	Fri, 29 Nov 2024 09:45:52 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id Tk9YD1CNSWd5VgAAD6G6ig
	(envelope-from <tiwai@suse.de>); Fri, 29 Nov 2024 09:45:52 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Subject: [PATCH 0/3] ALSA: ump: Fixes for legacy rawmidi handling
Date: Fri, 29 Nov 2024 10:45:41 +0100
Message-ID: <20241129094546.32119-1-tiwai@suse.de>
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid,imap1.dmz-prg2.suse.org:helo];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	TO_DN_NONE(0.00)[];
	RCVD_TLS_ALL(0.00)[]
X-Spam-Flag: NO
X-Spam-Level: 

This is a small collection of fixes for the UMP legacy rawmidi.
Now the access to an inactive UMP Group is restricted, the substream
names show the inactive UMP Groups, and the names are updated properly
via FB Info / Nmae notifications.


Takashi

===

Takashi Iwai (3):
  ALSA: ump: Don't open legacy substream for an inactive group
  ALSA: ump: Indicate the inactive group in legacy substream names
  ALSA: ump: Update legacy substream names upon FB info update

 sound/core/ump.c | 26 ++++++++++++++++++++------
 1 file changed, 20 insertions(+), 6 deletions(-)

-- 
2.43.0

