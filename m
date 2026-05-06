Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D2843DE42C
	for <linux-sound@vger.kernel.org>; Wed,  6 May 2026 07:57:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778054249; cv=none; b=ZKmcf6Vbub7LypgIkOpLfJ3317d56T8hP1327x+h39zbYzWs21zCkWdTqy+J4ckzz8adOJ3jb4iOn0HvJ29ypoPLa9ldsWRtvscPJ+zVd72LsScPjNMcpz9kTHGUQBMEv2ZkYWddNUh1+9IjLyM8jWO1/xY3FJSKXMNwbda6luU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778054249; c=relaxed/simple;
	bh=+4rMlMnAeQiawkruVO6udzT6RFeb1t/Jnokuo6RBkgc=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Vrc1TkbVAkg4TVS+CYIdedPBiK7UBXVNcblOn20MuqbypbxQlrLZTL1NxZ9AREm/95+ojZmPDM3f7w43MjP+3Mhs3KFlBWr2XYCdlgw1Qrq5+xRCptRRm54UJ+sf1vh8XY6XJN6gK7FgmWln5U1mdVMcql98k0cv6LN7nwcW8dc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=TjqOMWbF; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=FuTHgeqO; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=eo+gMNq8; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=IO8qH1k8; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="TjqOMWbF";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="FuTHgeqO";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="eo+gMNq8";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="IO8qH1k8"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 5E9855C12D;
	Wed,  6 May 2026 07:57:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1778054246; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=X9CDHrcD4WbnljOwo9rsyC3aE/a1ZRwMsaHYTDJs/k8=;
	b=TjqOMWbFKAQxNsK9qRX3ljBjSzxQZOfKSPBhxy8c3wnMKtMVG2851l/YR+TS0EZNZiXitp
	61pFuy5Gb9aIju93zUgR5F1PvkV51rcW7y9inK9zBnETQf9nw1gMG9tVt0ps/iH0+EQds/
	gvrPpUIxSs3mlabQaiIxZNwsvwUP9Xw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1778054246;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=X9CDHrcD4WbnljOwo9rsyC3aE/a1ZRwMsaHYTDJs/k8=;
	b=FuTHgeqO/SjzL/LjVagI6v1Qlrm0hQ2CZN5pnXyLISu6qotdE7iKgqLL+on++KgJpLDIxg
	mDS5GAFj1xp2iMBQ==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=eo+gMNq8;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=IO8qH1k8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1778054245; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=X9CDHrcD4WbnljOwo9rsyC3aE/a1ZRwMsaHYTDJs/k8=;
	b=eo+gMNq8ls7U8f3F09RuQqq67ZzbjcSv03Ez8mJDteMR5Qlt7FafmQ1dDpSVUObE+AM7Yf
	66boI0cdAV2K41thYu1wNKErkBAq4y8r8rC7PuCol8AE3+q3E24iOjqYc+3yRQ68fNILA7
	Whv8zD76PaakQyTxmNiSXFQNFLJOFSM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1778054245;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=X9CDHrcD4WbnljOwo9rsyC3aE/a1ZRwMsaHYTDJs/k8=;
	b=IO8qH1k8sUTENF8Ml20oDnDGbrSbzOQ3DgWMmUBFVAFN97TK9jnxke3nz9kNxWBy4XDnPo
	Q5eF1bxqcp74FEBg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 2BECF593A3;
	Wed,  6 May 2026 07:57:25 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id Kh5kCWX0+mkpIgAAD6G6ig
	(envelope-from <tiwai@suse.de>); Wed, 06 May 2026 07:57:25 +0000
Date: Wed, 06 May 2026 09:57:24 +0200
Message-ID: <877bpht1gb.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: =?ISO-8859-1?Q?C=E1ssio?= Gabriel <cassiogabrielcontato@gmail.com>
Cc: Takashi Iwai <tiwai@suse.com>,
	Jaroslav Kysela <perex@perex.cz>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: Re: [PATCH] ALSA: seq: Fix UMP group 16 filtering
In-Reply-To: <20260506-alsa-seq-ump-group16-filter-v1-1-b75160bf6993@gmail.com>
References: <20260506-alsa-seq-ump-group16-filter-v1-1-b75160bf6993@gmail.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/30.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 8bit
X-Spam-Flag: NO
X-Spam-Score: -3.51
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-3.51 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[gmail.com];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	ARC_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	DNSWL_BLOCKED(0.00)[2a07:de40:b281:104:10:150:64:97:from,2a07:de40:b281:106:10:150:64:167:received];
	RCVD_TLS_ALL(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid,suse.de:dkim];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	DKIM_TRACE(0.00)[suse.de:+]
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Rspamd-Queue-Id: 5E9855C12D
X-Spam-Level: 

On Wed, 06 May 2026 05:15:48 +0200,
Cássio Gabriel wrote:
> 
> The sequencer UAPI defines group_filter as an unsigned int bitmap.
> Bit 0 filters groupless messages and bits 1-16 filter UMP groups 1-16.
> 
> The internal snd_seq_client storage is only unsigned short, so bit 16
> is truncated when userspace sets the filter. The same truncation affects
> the automatic UMP client filter used to avoid delivery to inactive
> groups, so events for group 16 cannot be filtered.
> 
> Store the internal bitmap as unsigned int and keep both userspace-provided
> and automatically generated values limited to the defined UAPI bits.
> 
> Fixes: d2b706077792 ("ALSA: seq: Add UMP group filter")
> Cc: stable@vger.kernel.org
> Signed-off-by: Cássio Gabriel <cassiogabrielcontato@gmail.com>

A good catch!  Applied now.


thanks,

Takashi
