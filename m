Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44042258CDF
	for <linux-sound@vger.kernel.org>; Mon,  9 Feb 2026 09:34:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770629656; cv=none; b=enSpVno/eVCZihL5E5Bwh8k+PovFFuiDmFlKY4mHPcw5UBuy0PluqKFre65xUZ5GbfHYWxBi0MEiFk/ZKawreIq+mQ4tRqkxz8q6TqTx0YJWTSP8m3oUvK1qHCdbWd6JUMtcvjT8rjjHS0Itg+6JHrVD+4Nh9KvxCsrRVqTy0hk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770629656; c=relaxed/simple;
	bh=xjEZgoQ0P5cJu8ZwNBSPo5B5YNHcN86gvLKM0xvGiTA=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=pCYEjK4v+w+AQePsKPvVbkSJlKLoircO4AIJ8tWshdJMDXax7yA96n9mrQ9t3GkjX8GHrV+iAvjAXbzbKJ4SxzmG1fu95SJEC6aqv1xTQeToeWZB7jZuV8tQ7UlBvfjB7TL7RIL7NzbE+BBSzM+f8NBqdOZ/31A9eWRG/2D7WN8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=0tMd72zO; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=u07oE9tB; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=0tMd72zO; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=u07oE9tB; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="0tMd72zO";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="u07oE9tB";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="0tMd72zO";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="u07oE9tB"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 72D945BCD8;
	Mon,  9 Feb 2026 09:34:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1770629654; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=FkdplWRpryYO+Hf2JmaySCVOLnzudvMpFVL+PhxRUw8=;
	b=0tMd72zO3WRtmYYIGMJZQTWYYyVCTN8BYKUknlcLQOoF+X2U78QU7qal7u9fwkxxaMaZF7
	1RmUAnApNexE7OVbA54baygM2XDY2RfxwQo8U/fXySadBsFIbptXQRzeaplNy6Efgrbjuo
	rpodDFsvuwg9tyY60IdQNxkivkj0BtY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1770629654;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=FkdplWRpryYO+Hf2JmaySCVOLnzudvMpFVL+PhxRUw8=;
	b=u07oE9tBhSGEBDgtHhdEtauY8EgpgTIaQaALxTOM9SOwRDaV5StHT1HgiuwT5Nf8Y3MBhX
	1xbwpQCgr7++q+Cw==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=0tMd72zO;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=u07oE9tB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1770629654; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=FkdplWRpryYO+Hf2JmaySCVOLnzudvMpFVL+PhxRUw8=;
	b=0tMd72zO3WRtmYYIGMJZQTWYYyVCTN8BYKUknlcLQOoF+X2U78QU7qal7u9fwkxxaMaZF7
	1RmUAnApNexE7OVbA54baygM2XDY2RfxwQo8U/fXySadBsFIbptXQRzeaplNy6Efgrbjuo
	rpodDFsvuwg9tyY60IdQNxkivkj0BtY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1770629654;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=FkdplWRpryYO+Hf2JmaySCVOLnzudvMpFVL+PhxRUw8=;
	b=u07oE9tBhSGEBDgtHhdEtauY8EgpgTIaQaALxTOM9SOwRDaV5StHT1HgiuwT5Nf8Y3MBhX
	1xbwpQCgr7++q+Cw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 3B0EA3EA63;
	Mon,  9 Feb 2026 09:34:14 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id AoUwDRaqiWmJQwAAD6G6ig
	(envelope-from <tiwai@suse.de>); Mon, 09 Feb 2026 09:34:14 +0000
Date: Mon, 09 Feb 2026 10:34:13 +0100
Message-ID: <87ecmu2rca.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Soham Kute <officialsohamkute@gmail.com>
Cc: tiwai@suse.com,
	perex@perex.cz,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	syzbot+16b2b67ae905feb8a289@syzkaller.appspotmail.com
Subject: Re: [PATCH] ALSA: pcm: prevent snd_pcm_action after substream detach
In-Reply-To: <20260208185340.8379-1-officialsohamkute@gmail.com>
References: <20260208185340.8379-1-officialsohamkute@gmail.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/30.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spamd-Result: default: False [-2.01 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	TO_DN_SOME(0.00)[];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	ARC_NA(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[gmail.com];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	RCPT_COUNT_FIVE(0.00)[6];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[16b2b67ae905feb8a289];
	RCVD_TLS_ALL(0.00)[];
	DKIM_TRACE(0.00)[suse.de:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:dkim,suse.de:mid,imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns]
X-Spam-Flag: NO
X-Spam-Score: -2.01
X-Rspamd-Queue-Id: 72D945BCD8
X-Rspamd-Action: no action
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Spam-Level: 

On Sun, 08 Feb 2026 19:53:40 +0100,
Soham Kute wrote:
> 
> syzbot reported a slab use-after-free in snd_pcm_post_stop() caused by
> snd_pcm_action() being invoked after snd_pcm_detach_substream() has
> already freed the PCM runtime.
> 
> The previous approach attempted to guard against NULL runtime access in
> the post-action callback, which only masked the symptom.  As pointed out
> in review, this does not address the underlying lifetime issue.
> 
> Fix the root cause by preventing snd_pcm_action() from running once the
> substream runtime has been detached, ensuring that no PCM actions are
> executed after teardown.
> 
> Reported-by: syzbot+16b2b67ae905feb8a289@syzkaller.appspotmail.com
> 
> Signed-off-by: Soham Kute <officialsohamkute@gmail.com>

Thanks for the revised patch.  This patch puts the check at a better
place than the previous patch, but it's still misleading; this doesn't
address the root cause at all.  It's just plugging a hole at a middle
point of the code path.

I guess you're trying to fix the UAF report for aloop driver, and this
was already addressed by the recent patch (included in 6.19).
Please check whether you still see the problem with 6.19 release.


thanks,

Takashi
