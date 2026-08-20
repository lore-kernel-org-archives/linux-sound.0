Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBAC446EC95
	for <linux-sound@vger.kernel.org>; Thu, 20 Aug 2026 13:35:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787232907; cv=none; b=q+SYrZnYibkYEYIQUQMdb+ItsiorWy8d2B8eneBPcpU+uNhLN/gNmFmb5HcuS0Ath1Ue1IDfQIsxW0p9m5sZ/Yg9Ye3YfgEdvhTOY+NpEurfphjqqgJL2IwpC4Au7PMe3UmpUE/DJW5g22uXKNaZ6f9B8whiCj4VPyV1CF9unE4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787232907; c=relaxed/simple;
	bh=uW02AMtwc3SLb4gtwcGjHVonRpndro+M5G0OMZp2DTY=;
	h=Date:Message-ID:From:To:Cc:Subject:MIME-Version:Content-Type; b=OYqc0i4FNxzVv9oDAbzftqtcieynjCbBezscl+9yobMqlbVtA2rMfmhTLco3ThIJe+VOC0nh6I6u4CwDduDYLNO9L0lpLz727YpmX6vj4HEi7v5LHqxNiI00+xQiyKdLY12zkIoOJ6GX7Ny5KefCwB5pS/Cv8DxX3Hcji/ARx2Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=lf1GHGRo; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=vs5eZ787; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=D5V4xhrm; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=BzCuGK79; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="lf1GHGRo";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="vs5eZ787";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="D5V4xhrm";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="BzCuGK79"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 8E4053EFA;
	Thu, 20 Aug 2026 13:34:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1787232899; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type;
	bh=btRg2++bWGReS9+ODbff9nmgGTZ9x9SGBBhhwvN/hKE=;
	b=lf1GHGRo2wljvK90vG4i7Me0dlh4RmdF4gZIol8g0AJt8jXG1Istkk+x5l4bxR/snPbU5k
	0p0n8XEZcpLcNceXHXIG6BpKtLlQTeiDHoogYRAnltuPYbz6gNDdYPeTgMTr7wnLIp0FV/
	C3u55ffT7CebBBkudzqGnnC54AwrhCk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1787232899;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type;
	bh=btRg2++bWGReS9+ODbff9nmgGTZ9x9SGBBhhwvN/hKE=;
	b=vs5eZ7873bys3X0YBcUhfhPraJj3Pq+aS7E1YkMDZAEoZ0H6B1zdqcCmTZse/2Q1N4aTSM
	ULWcyKbhyq9ESMAA==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=D5V4xhrm;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=BzCuGK79
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1787232895; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type;
	bh=btRg2++bWGReS9+ODbff9nmgGTZ9x9SGBBhhwvN/hKE=;
	b=D5V4xhrm7Am1IDDjM/muf0RI+B31VyKcTDroD1YzTUB/Gwkew5WzvpoEdcNXPiMDrWH+KT
	ucwRDF5/uqMnFeG6dmhB8mN4Up3YEWsOBBkXe+9z+C9xt4cyKaftY9ncdcbNnCrS9stMZE
	/b1DkABjoBPgaXuP7iVHWa/4G5G2bdk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1787232895;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type;
	bh=btRg2++bWGReS9+ODbff9nmgGTZ9x9SGBBhhwvN/hKE=;
	b=BzCuGK79A6AYpgWhmXQGJF6mRmybz1YsQr2un4Jkfj4n1ijVmvzJaTV0JVN1j3f45J+0OL
	+ywGzv5/QdGZfuDQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 6A5F627A8;
	Thu, 20 Aug 2026 13:34:55 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id 4quaGH8Ch2oIOAAAD6G6ig
	(envelope-from <tiwai@suse.de>); Thu, 20 Aug 2026 13:34:55 +0000
Date: Thu, 20 Aug 2026 15:34:55 +0200
Message-ID: <871pbsnce8.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Cc: alsa-devel@alsa-project.org
Subject: Linux-audio BoF at Linux Plumbers Conference?
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/30.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spamd-Result: default: False [-2.51 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_CONTAINS_FROM(1.00)[];
	SUBJECT_ENDS_QUESTION(1.00)[];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-0.995];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	RCVD_TLS_ALL(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	DNSWL_BLOCKED(0.00)[2a07:de40:b281:104:10:150:64:97:from,2a07:de40:b281:106:10:150:64:167:received];
	RCPT_COUNT_TWO(0.00)[2];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo,suse.de:mid,suse.de:dkim];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	TO_DN_NONE(0.00)[];
	DKIM_TRACE(0.00)[suse.de:+]
X-Spam-Flag: NO
X-Spam-Score: -2.51
X-Spam-Level: 
X-Rspamd-Queue-Id: 8E4053EFA
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Action: no action

Hi,

a few people including Mark and me have talked about holding a small
meeting for the Linux audio stuff (finally again!) during the next
Linux Plumbers Conference (on Oct 5-7 at Prague).

Has anyone already planned to attend there and is interested to join?
If we have enough people, we can try an official BoF session.
Otherwise, we can just have an unofficial session at lunch time or
such, too.  Just let us know.


Thanks!

Takashi
