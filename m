Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B303E3914F5;
	Wed, 12 Aug 2026 05:30:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786512607; cv=none; b=ijks7IGNzVZxOPtpWhzXkEvo8WGHseofYOD+UrfXGsfW8KRISFftv1r1jChx/ty8nZNQyOmCS6g/mmRevl7NwRUbdRxPP6AsS97m5j5yYnnd4YMtkV44ndTxRKcZEjj1HQIacBEqFSdl6ZHLaizmh8nCBYx/RoGWegL3hEz87qM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786512607; c=relaxed/simple;
	bh=blanq1ygDzO/1zTEykBRJ71KkrvBf/g7SnSRB+atPa4=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=HgRFoaoBEig83B0tjNXPAFmC27qJnI7SP8BHm+xuuPHXd29CLCumGyZxitw1ydhLAFpQ2hsfSpB3YEQ+Eyms7iUyWHODJc0OATGQkm336KfH/GqST8XzP+wZn2k+FVSUfwTGteruY3CqwZezDuOZiiIAecrCzdVFuPuZNuJyHqs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=LHz9XfHG; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=/1Z3Xc7s; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=TQdYONHS; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=4sF3PNtV; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="LHz9XfHG";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="/1Z3Xc7s";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="TQdYONHS";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="4sF3PNtV"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 972AF820B4;
	Wed, 12 Aug 2026 05:29:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1786512599; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=LwnN6ANK8tlsQFQlCQvQ9rWiLs0/1uQ2g8ZO0azs3r8=;
	b=LHz9XfHG7nQ0MIFSWcHGjl827jfe9Re0EX9tc0XicO+8u8pjQOsbK8/yj+MJ3Qga/CtlVv
	o0uFCu4rI9oZVzu7hj7rPCj4zxMsM47cM/C+kEgoKjHXsXvgyKRGkVciAND8TCcByGaujW
	C9nSEnfadRU4Bs8YdHp3LPZFD7/T6i8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1786512599;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=LwnN6ANK8tlsQFQlCQvQ9rWiLs0/1uQ2g8ZO0azs3r8=;
	b=/1Z3Xc7sDQQMuHc9Ew6j/0hLT40b+W2R2XIGBBoRA9EX6PPi6DbGpnwhR/nBaLzvNmZPhb
	FE6U/VtQskZi7mDQ==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=TQdYONHS;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=4sF3PNtV
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1786512595; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=LwnN6ANK8tlsQFQlCQvQ9rWiLs0/1uQ2g8ZO0azs3r8=;
	b=TQdYONHSC2xx5TCb5vfWDd3mkRBVI00rkUvhBPbgGyuQTGqNNZt/dD+Dy9q1321NsNrxfE
	Q+hzN8DrYTS1OoLDkPagepulLvUSmT1A5/xs5WBhhWOksjm1smyPwd678H/2w0QrdnO8Gh
	RBoO8kEsRDo7Of96kHu6VykULlJD9q8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1786512595;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=LwnN6ANK8tlsQFQlCQvQ9rWiLs0/1uQ2g8ZO0azs3r8=;
	b=4sF3PNtVSgdY2G0t5N3mAmukXSOiIvNvX+rHVlz9VmKkxvUciVprwJ8bZazLaDkiXWhJTp
	zCQd3lflB066DvAQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 6F286779B1;
	Wed, 12 Aug 2026 05:29:55 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id AiHmGdMEfGq4bgAAD6G6ig
	(envelope-from <tiwai@suse.de>); Wed, 12 Aug 2026 05:29:55 +0000
Date: Wed, 12 Aug 2026 07:29:55 +0200
Message-ID: <87mrur29f0.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: songxiebing <songxiebing@kylinos.cn>
Cc: tiwai@suse.com,
	perex@perex.cz,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ALSA: hda: simplify match functions and remove unreachable return
In-Reply-To: <20260812033007.633564-1-songxiebing@kylinos.cn>
References: <20260812033007.633564-1-songxiebing@kylinos.cn>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/30.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spamd-Result: default: False [-3.51 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_CONTAINS_FROM(1.00)[];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MIME_TRACE(0.00)[0:+];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	TO_DN_SOME(0.00)[];
	ARC_NA(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid,suse.de:dkim,kylinos.cn:email,imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo];
	DKIM_TRACE(0.00)[suse.de:+]
X-Spam-Flag: NO
X-Spam-Score: -3.51
X-Spam-Level: 
X-Rspamd-Queue-Id: 972AF820B4
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Action: no action

On Wed, 12 Aug 2026 05:30:07 +0200,
songxiebing wrote:
> 
> From: Bob Song <songxiebing@kylinos.cn>
> 
> hda_bus_match() has an unreachable 'return 1' after an if/else that
> covers both branches.  Remove the superfluous return and simplify the
> control flow by dropping the else branch.
> 
> hdac_codec_match() uses a redundant if/else to return 1 or 0.
> Simplify to a single return statement.
> 
> Signed-off-by: Bob Song <songxiebing@kylinos.cn>

Applied to for-next branch.  Thanks.


Takashi
