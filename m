Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BB152EB5B8;
	Mon, 10 Aug 2026 13:37:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786369044; cv=none; b=ZEtSQ1ZWShysR13dtQVTSzw1pOsJTB1attjjcQBHqE3o4GEEtzTkW1K4TKCHD5tuuA1CvpkWfHZmXhPoJjbm4UxwZkwCHuyBLzx0aYWytK5BfjiHllNa9TAR2BC6/FLjjoMzORSY8EXjjaYBnkxwtoG+S/oGAPZREvgKuc0eaIQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786369044; c=relaxed/simple;
	bh=LiDZUv2onDvjcWtvULNEqXT6KPhULDRqHje8r/SJqJA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=AE7V5GpEVf4mUiCqwizRFtQEky+iehERaCklH/uFTLq8kC7AbiJ3Pq59qtQ5J83Iu659PqxMQ8+vCfSpYweaigMtsouuTgCglNdxN9tiOoIGiJl2EaRdfqckq+M4ts6uxtv1zyb8BiLLQTwXIQXwVnGLRnX7THGuuX/5u/+604U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=xhZ3BKbr; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=uoLtlKqj; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=DNZW3+SY; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=ZryOppjx; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="xhZ3BKbr";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="uoLtlKqj";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="DNZW3+SY";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="ZryOppjx"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id D5E363E07;
	Mon, 10 Aug 2026 13:37:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1786369037; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=9+KAHjOMpwq+xsK9LYENv1g33HNlT10L9pvzzpneQjU=;
	b=xhZ3BKbruFrM2BcPDOvFOmp9aLCrQ2k0VoqfaOz7hEBQkyGEEWUBPie/1SZ9B+301IgsbY
	kZIQqvTlLg+DQ88CV2bwp5in7uJQVIv5OHSuEtyIHN4uy3wHyoTENq6cpj1/JIfY+kYWID
	Li/+unVWIzrHNm7o+Y1mPj1SHv1Jm5o=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1786369037;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=9+KAHjOMpwq+xsK9LYENv1g33HNlT10L9pvzzpneQjU=;
	b=uoLtlKqjIzA4W92Zr+f4wFT87tsZbSQ6T8GhLcZEJy42vNDpCDGQnyRNNxpIN8MtKciRNL
	RzVfSAR7+b5DALCQ==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1786369032; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=9+KAHjOMpwq+xsK9LYENv1g33HNlT10L9pvzzpneQjU=;
	b=DNZW3+SYGBn9a1i9b+cIbG0xfcwvHr1/kjFC9cpQlNdHYg+fZmA3PSYpnICakw5hciiW0g
	5lLunpplxVQ2oM43O4/pNVuaJ+p2uihYIHvuAaabdCzKZdaAESIeEfbwE/mxB57VKdi0WI
	LUvoOyXK2JQYy5qrL3wdflqQq75N31A=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1786369032;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=9+KAHjOMpwq+xsK9LYENv1g33HNlT10L9pvzzpneQjU=;
	b=ZryOppjxu3iQmk2oj+gJRtuLUatEm1kC4udXDuWyj+gXEyqv1PmCF53XBmtUj6Yl8Y/1/O
	zRYCq6yGeic/C7DA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id B3A18779B2;
	Mon, 10 Aug 2026 13:37:12 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id iNsOKgjUeWq3HwAAD6G6ig
	(envelope-from <tiwai@suse.de>); Mon, 10 Aug 2026 13:37:12 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Subject: [PATCH 0/5] ALSA: seq: Optimization with RCU
Date: Mon, 10 Aug 2026 15:37:01 +0200
Message-ID: <20260810133711.42483-1-tiwai@suse.de>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-2.80 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_MISSING_CHARSET(0.50)[];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	RCPT_COUNT_TWO(0.00)[2];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ARC_NA(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid,imap1.dmz-prg2.suse.org:helo];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_EQ_ENVFROM(0.00)[];
	TO_DN_NONE(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	RCVD_TLS_ALL(0.00)[]
X-Spam-Flag: NO
X-Spam-Score: -2.80
X-Spam-Level: 

Hi,

here are a set of (rather small) patches for optimizing lockings in
ALSA sequencer core by replacing with RCU.  Most of changes are
straight-forward conversions from read-lock to RCU, or a simple
pointer assignment.


Takashi

===

Takashi Iwai (5):
  ALSA: seq: Use RCU for the port subscriber list
  ALSA: seq: Use RCU for the client port list
  ALSA: seq: Use RCU for the client table
  ALSA: seq: Use RCU for the virmidi file list
  ALSA: seq: Use RCU for the UMP client output substream

 include/sound/seq_virmidi.h     |   1 -
 sound/core/seq/seq_clientmgr.c  |  69 +++++++++++++--------
 sound/core/seq/seq_clientmgr.h  |   1 -
 sound/core/seq/seq_ports.c      | 103 +++++++++++++++-----------------
 sound/core/seq/seq_ports.h      |   8 +--
 sound/core/seq/seq_ump_client.c |  38 +++++++-----
 sound/core/seq/seq_virmidi.c    |  19 +++---
 7 files changed, 127 insertions(+), 112 deletions(-)

-- 
2.55.0

