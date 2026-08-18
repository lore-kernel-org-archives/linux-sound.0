Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23D2C383C86;
	Tue, 18 Aug 2026 09:41:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787046084; cv=none; b=H3brHN+00lYT2XcWvhAmlHKgvTzZsGnlpFU8ALusFympYvSVFGaN/KgCSHJHCDdCG3rdECJ411fpvYwPft16f4yVjQLNaxFN7HK6Qq3Q7cfEA22YUKC24Jg1yOMpHgBB8pcDRR4F/xVFpK2HaMl8bMPdeOunAne1JyeLLHPqc7s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787046084; c=relaxed/simple;
	bh=//1KUuK4ZfFGNUCdHPDgR7RX/uGJvZRmxwzb7YFaYo4=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=sfMq/5UV5igQ/8Oe51cuacakXXU8Wuu2+6Oz2H95V1r27SVO39eNbBznHQKYDisbP/g8lYGaobWnTK7dOymTZhb9ojTVIAPGww4FA23uBZjJHHpnum5H1wfUpQfoGTPuAiliLCjp6M9RhETZ02sr3respAGHEsoi7zYG2OveKUM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=HlHXxPT7; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=aQMkfZDY; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=vfBXI8ae; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=le1njt6X; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="HlHXxPT7";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="aQMkfZDY";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="vfBXI8ae";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="le1njt6X"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id EEF7E842F6;
	Tue, 18 Aug 2026 09:41:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1787046077; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=gOjxV3cLBNQAEEWgWJMisx3Xp5MdXA7sNwbbBFbqrD8=;
	b=HlHXxPT7nG8uWI+aa5gSnY4+Yis/F1/N5qmvzHUru+Vtud9NG/kjYw4MDUfSalfm/rVM0H
	WXk7i9yv7EW8eM60DlAXxJD+zdrNWrs95QjzOMPEd0OTVmi8lNNVh9wUOV6VDfercNuCvD
	ZeEfjbiRdNGaBd/lrKZTtLbsAlYyTf8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1787046077;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=gOjxV3cLBNQAEEWgWJMisx3Xp5MdXA7sNwbbBFbqrD8=;
	b=aQMkfZDY1LMxD54bnqFT7BxxIVun7otmW45xN9MwpZI5/lrFywQ2e39AspFbktKn2vQYIU
	SckDv7qGERZ+lcBw==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=vfBXI8ae;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=le1njt6X
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1787046072; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=gOjxV3cLBNQAEEWgWJMisx3Xp5MdXA7sNwbbBFbqrD8=;
	b=vfBXI8aeYBQDU2HfmOWlyNByeX4ml+Fqji5sSiBW2xBowH0Y8BJO9XtIqRXXEoHV2DejQO
	is/nk7fqi6SELYE26Qmh+T/6oWQg4HG7ZeXLgilg91T5Cg/vnAi7+jc7LayhsSRyeJ1mk3
	l2ARyZ0FQI+8PHGwERylJfH0V8/oYzo=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1787046072;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=gOjxV3cLBNQAEEWgWJMisx3Xp5MdXA7sNwbbBFbqrD8=;
	b=le1njt6Xmip0/IY32doXS3yyd0yYJUPgMRioXGPCCvBgbys0EWB9/KJJ1ZA4W8Hfyj2tRw
	CKOC0TM/wtoDyJCg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id C91FB22BA;
	Tue, 18 Aug 2026 09:41:12 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id 3PFrMLgohGrhZAAAD6G6ig
	(envelope-from <tiwai@suse.de>); Tue, 18 Aug 2026 09:41:12 +0000
Date: Tue, 18 Aug 2026 11:41:12 +0200
Message-ID: <87ecfvrcjr.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: raoxu <raoxu@uniontech.com>
Cc: perex@perex.cz,
	tiwai@suse.com,
	kees@kernel.org,
	cassiogabrielcontato@gmail.com,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ALSA: hda: Fix connection list comparison in proc output
In-Reply-To: <7B802A4E225CC808+20260818083808.2735120-1-raoxu@uniontech.com>
References: <7B802A4E225CC808+20260818083808.2735120-1-raoxu@uniontech.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/30.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spam-Score: -3.51
X-Spam-Level: 
X-Rspamd-Action: no action
X-Rspamd-Queue-Id: EEF7E842F6
X-Spamd-Result: default: False [-3.51 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	RCPT_COUNT_SEVEN(0.00)[7];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[perex.cz,suse.com,kernel.org,gmail.com,vger.kernel.org];
	TO_DN_SOME(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[uniontech.com:email,imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns,suse.de:mid,suse.de:dkim];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DKIM_TRACE(0.00)[suse.de:+]
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spam-Flag: NO

On Tue, 18 Aug 2026 10:38:08 +0200,
raoxu wrote:
> 
> From: Xu Rao <raoxu@uniontech.com>
> 
> print_conn_list() compares the raw hardware connection list with the
> connection list cached by the HDA driver.  When they differ, it prints an
> additional "In-driver Connection" line so that /proc/asound/card*/codec#*
> shows the topology actually used by the driver.
> 
> The comparison currently passes conn_len directly to memcmp().  However,
> conn_len is a number of connection-list entries, while memcmp() expects a
> size in bytes.  Both list and conn are arrays of hda_nid_t, which is u16,
> so only half of the connection data is compared.
> 
> For example, for two-entry lists such as:
> 
>   hardware: 0x0c 0x0d
>   cached:   0x0c 0x0e
> 
> conn_len is 2, and the current comparison checks only the first hda_nid_t.
> The lists are therefore incorrectly treated as identical even though the
> second connection differs.
> 
> This can happen legitimately when codec fixups replace a cached connection
> list with snd_hda_override_conn_list().  The codec routing used by the
> driver is not affected, but the proc output can hide the overridden
> driver-visible routing and provide misleading topology information during
> codec debugging.
> 
> Convert the entry count to a byte size so that memcmp() covers the
> complete connection list.
> 
> Fixes: 8b2c7a5c404d ("ALSA: hda - Add In-driver connection info")
> Signed-off-by: Xu Rao <raoxu@uniontech.com>

Thanks, applied now.


Takashi
