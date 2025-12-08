Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F24B32EBDE3
	for <linux-sound@vger.kernel.org>; Mon,  8 Dec 2025 12:12:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765195960; cv=none; b=SwZOkVv1gSVmUllTqRJC25SfRgZ4AIDRPvzSFFV3l0UTMD2k64ZnDGS6YpnFqRdTVpW0rijIdeftIdFbGNAEFBMlRXBnbbJKjNkK6ZpW0wLa+0NR6SKnmzb86ZZqLxuEF3eqe8FmQZJIGEnMeVuAQBvnxdd8/h5umCD3YBzFPs8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765195960; c=relaxed/simple;
	bh=CIBJrO0qKtO/JGxi2WPrbl+L6qDPE0mze7oIJ78+/bk=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=A0FzgYwy9SU0v69zY5fsFWjyrWqW+dIlU82AuXc8mMLelGAlrEh53F6wbX14v6JQ9LoYZHUQavhDPdLOCnelfzzhlqcNDjyaa46paCtfFZqQtDBKBqxn1m1EbK2etJASZNEfE0jijldTUeA/P4iY0HJFTgv4ZxzbhS4ElN8Abec=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=OdYBi9br; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=Ob8G0Lp2; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=cj3cl6ej; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=7Gf3yeZS; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="OdYBi9br";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="Ob8G0Lp2";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="cj3cl6ej";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="7Gf3yeZS"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id CBB19338D4;
	Mon,  8 Dec 2025 12:12:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1765195957; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=XCibVvL2venM52f6lbMR6IGyAS3yynkS+hCrPnafJyU=;
	b=OdYBi9brQn2xfSxdg2btHpiR6iWBnEmrD40O22k1Youf3a9lvC3jNSUIoqRicMEF3l7Z3r
	CM7DH5PdcBzw/KY8XW6UN65eZAfVhd3x2zzjOR2mRy2eFcZmBiGOt5oT0VWxz9ccSZmKud
	kiMx59VXjwKu6ZQwX83joVpgQ4L27v0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1765195957;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=XCibVvL2venM52f6lbMR6IGyAS3yynkS+hCrPnafJyU=;
	b=Ob8G0Lp2WAAbZpqkiMwx4ux6LNpNRUCn1KcTxdxRLoIPJKUYg28cCT/cx5ueCbDzl0dnUZ
	fTVezmzjyKioORDw==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=cj3cl6ej;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=7Gf3yeZS
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1765195955; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=XCibVvL2venM52f6lbMR6IGyAS3yynkS+hCrPnafJyU=;
	b=cj3cl6ej/oOlHnGxnQspSdCm6PqKRKEgTp2BvjA3fwQXLQvj/ahgj2EGE841c1hFbLJ6zZ
	gJ0iK82p6Ox4S1tG21PVk4dE0vgp4CiY0+Ann9iP2lVHvjQzWA0iCu2WwYChnN+PFd1Wpm
	cC86129ppfp+m+XmSTxF5CwT8FdQf+g=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1765195955;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=XCibVvL2venM52f6lbMR6IGyAS3yynkS+hCrPnafJyU=;
	b=7Gf3yeZS2CWiMnaQN814AtYcphgkq+X0u3fydtZDN05lfBtuoKAp5fMlki8yqMIepvd5YD
	tJ/EYjL0JGKWRKBQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 767D83EA63;
	Mon,  8 Dec 2025 12:12:35 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id g3pBG7PANmkINwAAD6G6ig
	(envelope-from <tiwai@suse.de>); Mon, 08 Dec 2025 12:12:35 +0000
Date: Mon, 08 Dec 2025 13:12:35 +0100
Message-ID: <874iq1uq8c.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Junrui Luo <moonafterrain@outlook.com>
Cc: Clemens Ladisch <clemens@ladisch.de>,
	Takashi Sakamoto <o-takashi@sakamocchi.jp>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Takashi Iwai <tiwai@suse.de>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Yuhao Jiang <danisjiang@gmail.com>
Subject: Re: [PATCH v2] ALSA: firewire-motu: fix buffer overflow in hwdep read for DSP events
In-Reply-To: <SYBPR01MB7881452C84016B3F21975947AFA2A@SYBPR01MB7881.ausprd01.prod.outlook.com>
References: <SYBPR01MB7881452C84016B3F21975947AFA2A@SYBPR01MB7881.ausprd01.prod.outlook.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/30.1 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spamd-Result: default: False [-3.51 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	URIBL_BLOCKED(0.00)[outlook.com:email,imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns,suse.de:dkim,suse.de:mid];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FREEMAIL_TO(0.00)[outlook.com];
	ARC_NA(0.00)[];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FREEMAIL_ENVRCPT(0.00)[gmail.com,outlook.com];
	FREEMAIL_CC(0.00)[ladisch.de,sakamocchi.jp,perex.cz,suse.com,suse.de,vger.kernel.org,gmail.com];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	RCPT_COUNT_SEVEN(0.00)[9];
	DKIM_TRACE(0.00)[suse.de:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:dkim,suse.de:mid,outlook.com:email,imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns]
X-Rspamd-Action: no action
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Spam-Level: 
X-Rspamd-Queue-Id: CBB19338D4
X-Spam-Flag: NO
X-Spam-Score: -3.51

On Mon, 08 Dec 2025 13:09:09 +0100,
Junrui Luo wrote:
> 
> The DSP event handling code in hwdep_read() could write more bytes to
> the user buffer than requested, when a user provides a buffer smaller
> than the event header size (8 bytes).
> 
> In the put_user() loop that copies event data, when the user buffer
> size is not aligned to 4 bytes, it could overwrite beyond the buffer
> boundary.
> 
> Fix by:
> - using min_t() to clamp the copy size
> - Adding a bounds check before put_user()
> 
> This ensures we never write more than the user requested.
> 
> Fixes: 634ec0b2906e ("ALSA: firewire-motu: notify event for parameter change in register DSP model")
> Signed-off-by: Junrui Luo <moonafterrain@outlook.com>
> ---
> Changes in v2:
> - Also fix the similar issue in the put_user() loop suggested by Takashi Iwai
> - Link to v1: https://lore.kernel.org/all/SYBPR01MB78810656377E79E58350D951AFD9A@SYBPR01MB7881.ausprd01.prod.outlook.com/T/#u

v1 was already merged.  Please submit an incremental fix on top of
sound.git tree for-linus branch.


thanks,

Takashi
