Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=195.135.223.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795589440;
	b=ThwoNWcqQPBQPvZJSLlAy2KAP6Pozt6VCvPNHrs3uGXpnZbK6/Nbi4m26yEIKmLoaIvz
	 1WVyalZfMN4T6ENEYV1HdBpR7OanuioroiV3B8IgKKNdA3zVPbc/wt+W59Kkie/uXqS0q
	 j4JGa60AzR3tKFoPV6AqSRVysv4r1+Gy9k4EZwChFs1dkCnE5/NvRSmBpoMAq6NS8OIIX
	 SpKWtzApvLBoburBDXluEJGPoATEKOhVjHFuiMs+Vm8v2FmRu7r+nS2V+bS4o3Pmfm6sj
	 wfjS/hrrdY1DDZRUJycRcpmH82LTe3dgfSvbkFoVZiU2ouuhUja7Lxpzia6h6hTRA/g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795589440;
	h=DMARC-Filter:Received:DKIM-Signature:DKIM-Signature:DKIM-Signature:
	 DKIM-Signature:Received:Received:From:To:Subject:Date:Message-ID:
	 X-Mailer:MIME-Version:Content-Transfer-Encoding:X-Spamd-Result:
	 X-Rspamd-Server:X-Rspamd-Action:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Rspamd-Queue-Id;
	bh=tExBFy53WHcVN5AdSR+HZ4JArGcXLjuFssnhjDWnwIY=;
	b=qd6e27UDXgW8o7EfhNleU0gNNIdZ1o0hDCESP+Tgbjbti5KpE3T7nhLE9Cvaa596jZES
	 xJ1S/HoKCEklhw6EOnyM2em/1sYa0Q2Z8urIPUAlnl0iFeAroiw/oQZ9/VoAb703tpFdk
	 X3E0jrc4u5tEn7NsTEbWZGWgNz7Dm+xqBVTweDrJeBV8gvA2yqWuYWGW2U+9wHFCMD6ZU
	 jvv+HumAKRPQgYgJIBwMXJqGBNiRjJYNn2J3GUeEatwEyLO2Xx68NCjvq+KZLh51kJg4H
	 KCULje73gDECl1EFr9yPsiQMsqbEqaw0blGAb4yMN/PKQ3OGJjwXw67GIeg9fvzVqkA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.de;
	spf=pass smtp.mailfrom=suse.de;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=mDuGLj9o;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=YaVDOxwg;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=yKGR894o;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=J0lKSeza;
	arc=none smtp.remote-ip=195.135.223.131
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B916606A31E
	for <linux-sound@vger.kernel.org>; Wed, 25 Nov 2026 06:50:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3B916606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=mDuGLj9o;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=YaVDOxwg;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=yKGR894o;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=J0lKSeza
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 123181F747;
	Wed, 25 Nov 2026 06:50:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1795589438; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=tExBFy53WHcVN5AdSR+HZ4JArGcXLjuFssnhjDWnwIY=;
	b=mDuGLj9o6NcgtKct8wQBkYi4uDXt3bRCyp/uUhC/vexpvKd9/sdIt6HohpM6vKqRtg3cPq
	eCQTE/L4hvZ3fQotJG9SNaInyZC2r6HEIeN+V6arw/IX11yDiReOQ3TJHuVcJjWtnjIJwS
	qnhLu6BtxHFFmaTg37SQje/YcBFsXAo=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1795589438;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=tExBFy53WHcVN5AdSR+HZ4JArGcXLjuFssnhjDWnwIY=;
	b=YaVDOxwgcwyZj4bb3OoMp/cST0qAI5C6RdhkLYPHdTSLVGaba5tLGwyICsI+14RuF1/14O
	nXqAVlIrFSdohWDA==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=yKGR894o;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=J0lKSeza
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1795589437; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=tExBFy53WHcVN5AdSR+HZ4JArGcXLjuFssnhjDWnwIY=;
	b=yKGR894o6snat8JojPjnlt1xRNoSvtRit7qP3JOSZLRnSN2Bp2CYnnOzyJDUDKV8KNarAd
	FNAbPpUQP5d1dbijdpuj/EkZmuqHg3hdC2xiI0amBK3U/tL8BAin9moHYQDg2HME743p5u
	2ElAUCmVVX1gE/kUrPWbd9ccLo8DuSo=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1795589437;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=tExBFy53WHcVN5AdSR+HZ4JArGcXLjuFssnhjDWnwIY=;
	b=J0lKSezarmXOqKf4mz5pITfJ1c8De12O/n1YyVcPLHOvkVDRjIEjWjL7uOl0OQPSsE11C1
	13vKKlNYWqdKDqCA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 97D57134CA;
	Wed, 25 Nov 2026 06:50:36 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id c5yuGjyFBmvpBQAAD6G6ig
	(envelope-from <tiwai@suse.de>); Wed, 25 Nov 2026 06:50:36 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Subject: [PATCH 0/2] ALSA: pcm: Yet a couple of more fixes for 7.5
Date: Wed, 25 Nov 2026 07:50:30 +0100
Message-ID: <20261125065034.1470697-1-tiwai@suse.de>
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
X-Spamd-Result: default: False [-12.01 / 50.00];
	SUSE_INTERNAL_BYPASS(-9.00)[];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	TO_DN_NONE(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	ARC_NA(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_ONE(0.00)[1];
	FROM_EQ_ENVFROM(0.00)[];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo,suse.de:dkim];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	RCVD_TLS_ALL(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[suse.de:+]
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Rspamd-Action: no action
X-Spam-Flag: NO
X-Spam-Score: -12.01
X-Spam-Level: 
X-Rspamd-Queue-Id: 123181F747

This is a couple of PCM fixes for coverage of the unexpected state
changes.  As they are rather corner case issues, expected to be
included in 7.5.


Takashi

===

Takashi Iwai (2):
  ALSA: pcm: Cover buffer access gate in all read/write ioctls
  ALSA: pcm: Prevent PCM hw_params & co during mmap on OSS, too

 sound/core/pcm_compat.c | 3 +++
 sound/core/pcm_lib.c    | 6 ------
 sound/core/pcm_native.c | 5 ++++-
 3 files changed, 7 insertions(+), 7 deletions(-)


base-commit: c3c132d63840093a3ca4bd09e7434614c1bd07e3
-- 
2.53.0

