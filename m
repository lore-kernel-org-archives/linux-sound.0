Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7F0C3C81B4
	for <linux-sound@vger.kernel.org>; Fri, 15 May 2026 06:54:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778828076; cv=none; b=LcmPVQmY0+hYPQqauWq5DRRJdTFfO8x1A5p3swYEEWiFiNaAMnGhdlHw2nyvH/7Bd0ShmUeIwKFr9O3kyZHzaPIkw3bTHMfAUjgIrTLLu3rBixjkdIb4YGjlDthu/10gTuZylJoRlo9g7sGgqhJCprwFTgLNnqpDPqbOEDFuikg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778828076; c=relaxed/simple;
	bh=NYvjSePEJTgdVu+Tu9sKsJt2Z5ftrBbv/6ug8qrKeWA=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=XsY6gHEfp7fYhyTkV9lXa7nU2l4ylZ0Ioc9xTOEzRadSrbr4Xqn4adTZGpSmTXpfNoDbAz70OZxsEcQqNtroglRtdJQIqtpE/0Jkuz0Gj7THGZqcoXbptuzBBPi8mhW5e3q21+U8JjXBvYm3cIBZlBNzQ30YjHYV28opC+Mrmo4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=w8a4BlO7; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=bbcn7TNX; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=w8a4BlO7; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=bbcn7TNX; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="w8a4BlO7";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="bbcn7TNX";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="w8a4BlO7";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="bbcn7TNX"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 318946768F;
	Fri, 15 May 2026 06:54:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1778828073; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=e9gIklfHL4Z/3HY9z7SxMfQG0J9rqIsqeUq7aiuOe3Y=;
	b=w8a4BlO7BdR4cmlhfvtR2jdo0WKDeKTooajfUFe2uWB8MLQ/Z40iTcQEU7sOiNUd6OELrn
	wQlKWWq+stGDJgfo996V7XioiuJ4XcHSO8jraWJr9X2E6cqtE7eW3XiR7xp1Ip8CH9CnV6
	/2QRB09fwwn8EHgIZEdM4daFPpezP+s=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1778828073;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=e9gIklfHL4Z/3HY9z7SxMfQG0J9rqIsqeUq7aiuOe3Y=;
	b=bbcn7TNXkKIqy+YNZpXnhBKf8E6Oa6+EQjpr+f4jHFhdGMktKrdjcOmNPnT+CqsHEeoJ3K
	cCVFhyyALkXzCpBA==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=w8a4BlO7;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=bbcn7TNX
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1778828073; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=e9gIklfHL4Z/3HY9z7SxMfQG0J9rqIsqeUq7aiuOe3Y=;
	b=w8a4BlO7BdR4cmlhfvtR2jdo0WKDeKTooajfUFe2uWB8MLQ/Z40iTcQEU7sOiNUd6OELrn
	wQlKWWq+stGDJgfo996V7XioiuJ4XcHSO8jraWJr9X2E6cqtE7eW3XiR7xp1Ip8CH9CnV6
	/2QRB09fwwn8EHgIZEdM4daFPpezP+s=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1778828073;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=e9gIklfHL4Z/3HY9z7SxMfQG0J9rqIsqeUq7aiuOe3Y=;
	b=bbcn7TNXkKIqy+YNZpXnhBKf8E6Oa6+EQjpr+f4jHFhdGMktKrdjcOmNPnT+CqsHEeoJ3K
	cCVFhyyALkXzCpBA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id E4767593A9;
	Fri, 15 May 2026 06:54:32 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id u4eUNijDBmq/UQAAD6G6ig
	(envelope-from <tiwai@suse.de>); Fri, 15 May 2026 06:54:32 +0000
Date: Fri, 15 May 2026 08:54:32 +0200
Message-ID: <87a4u1upqv.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Edson Juliano Drosdeck <edson.drosdeck@gmail.com>
Cc: tiwai@suse.com,
	perex@perex.cz,
	zhangheng@kylinos.cn,
	sbinding@opensource.cirrus.com,
	kailang@realtek.com,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ALSA: hda/realtek: Limit mic boost on Positivo DN50E
In-Reply-To: <20260511181558.670563-1-edson.drosdeck@gmail.com>
References: <20260511181558.670563-1-edson.drosdeck@gmail.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/30.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spam-Flag: NO
X-Spam-Score: -2.01
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.01 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	URIBL_BLOCKED(0.00)[suse.de:mid,suse.de:dkim,imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo];
	FREEMAIL_TO(0.00)[gmail.com];
	ARC_NA(0.00)[];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	RCVD_TLS_ALL(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[];
	DKIM_TRACE(0.00)[suse.de:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo,suse.de:mid,suse.de:dkim]
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Rspamd-Queue-Id: 318946768F
X-Spam-Level: 

On Mon, 11 May 2026 20:15:58 +0200,
Edson Juliano Drosdeck wrote:
> 
> The internal mic boost on the Positivo DN50E is too high.
> Fix this by applying the ALC269_FIXUP_LIMIT_INT_MIC_BOOST fixup to the machine
> to limit the gain.
> 
> Signed-off-by: Edson Juliano Drosdeck <edson.drosdeck@gmail.com>

Applied now.  Thanks.


Takashi
