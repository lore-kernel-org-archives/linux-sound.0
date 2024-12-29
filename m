Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BC662594AD;
	Sun, 29 Dec 2024 09:10:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735463413; cv=none; b=d1556Pn+gSCwS4TpmlqfozwzlubXnp1EeYSuKig5BErm86Rk24VGk4UqJyR4q1iCPdJOrmhD6i8bnjI+br1Qq7oxVdL6HApLDIaQCJTyARwgbvUiGTW/eOBFBu5OvgThn4DKWXXDbGh+5kLNGYmjz6CvuOjBPKZwtwvlgD6ibgM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735463413; c=relaxed/simple;
	bh=xx9KSE4j05coPZqicnwPKVi38IyYoe6L5XB7RwxCjQk=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=t3yI00ii8N8VZ1uJrM3QTohu9V//6s29q86uIsMyt3nTHJtU+83SQ6QCKLLueSNGbrhML+3UExOAAceJgc92Y9WkNWuA0iRdDLT8BtyjXKgjhTrUAl02dHz38u3vYfkFkyPbrtH1SU5k2ffivmgFvHLNpECOlNHLsR15c75gAv8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=gNDXbG9w; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=q+MA7G+X; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=gNDXbG9w; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=q+MA7G+X; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="gNDXbG9w";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="q+MA7G+X";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="gNDXbG9w";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="q+MA7G+X"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 142A7337AB;
	Sun, 29 Dec 2024 09:10:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1735463410; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=s5Fpr9pv5ompAy7+cOpPrZ7NDqJ1knVbASUTf0R1Po4=;
	b=gNDXbG9w/cXOx3PwNfhmYCrnZnqukxjjfqgqVPma21nazZBdYCv/rdYWgrg2RnuKjsAoHT
	iFEGFM4slvRt8UyiCx0dWGEF4iQf5Ayh+59KjLNoaftgJbz0KcKkbZngB6Pi88/YM5E+Sr
	JqmDkLtVE7RDqKM/8vVSwcvOM2IXCF0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1735463410;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=s5Fpr9pv5ompAy7+cOpPrZ7NDqJ1knVbASUTf0R1Po4=;
	b=q+MA7G+X3bw+9vwrqzgfJoZslf4tQ5TTpFxOJnka8Sz0Kug1+SC0A4rl/afDe8aep6VeV/
	GumvGrc4fd4awxCg==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=gNDXbG9w;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=q+MA7G+X
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1735463410; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=s5Fpr9pv5ompAy7+cOpPrZ7NDqJ1knVbASUTf0R1Po4=;
	b=gNDXbG9w/cXOx3PwNfhmYCrnZnqukxjjfqgqVPma21nazZBdYCv/rdYWgrg2RnuKjsAoHT
	iFEGFM4slvRt8UyiCx0dWGEF4iQf5Ayh+59KjLNoaftgJbz0KcKkbZngB6Pi88/YM5E+Sr
	JqmDkLtVE7RDqKM/8vVSwcvOM2IXCF0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1735463410;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=s5Fpr9pv5ompAy7+cOpPrZ7NDqJ1knVbASUTf0R1Po4=;
	b=q+MA7G+X3bw+9vwrqzgfJoZslf4tQ5TTpFxOJnka8Sz0Kug1+SC0A4rl/afDe8aep6VeV/
	GumvGrc4fd4awxCg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id C8C9A13A30;
	Sun, 29 Dec 2024 09:10:09 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id e25eL/ERcWcbSgAAD6G6ig
	(envelope-from <tiwai@suse.de>); Sun, 29 Dec 2024 09:10:09 +0000
Date: Sun, 29 Dec 2024 10:10:09 +0100
Message-ID: <87frm6dfda.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: David Laight <david.laight.linux@gmail.com>
Cc: Ethan Carter Edwards <ethan@ethancedwards.com>,
	"wychay@ctl.creative.com" <wychay@ctl.creative.com>,
	"ryan_richards@creativelabs.com" <ryan_richards@creativelabs.com>,
	"tiwai@suse.de" <tiwai@suse.de>,
	"linux-sound@vger.kernel.org"
 <linux-sound@vger.kernel.org>,
	"linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>
Subject: Re: sound/pci/ctxfi/ctdaio.c: duplicate function removal question
In-Reply-To: <20241229090228.75f8a3ba@dsl-u17-10>
References: <NyKCr2VHK_xCQDwNxFKKx2LVd2d_AC2f2j4eAvnD9uRPtb50i2AruCLOp6mHxsGiyYJ0Tgd3Z50Oy1JTi5gPhjd2WQM2skrv7asp3fLl8HU=@ethancedwards.com>
	<20241229090228.75f8a3ba@dsl-u17-10>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Rspamd-Queue-Id: 142A7337AB
X-Spam-Level: 
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
	FUZZY_BLOCKED(0.00)[rspamd.com];
	FREEMAIL_TO(0.00)[gmail.com];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	MIME_TRACE(0.00)[0:+];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	RCVD_TLS_ALL(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	RCPT_COUNT_SEVEN(0.00)[7];
	TAGGED_RCPT(0.00)[];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	DKIM_TRACE(0.00)[suse.de:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns,suse.de:dkim,suse.de:mid]
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Action: no action
X-Spam-Score: -2.01
X-Spam-Flag: NO

On Sun, 29 Dec 2024 10:02:28 +0100,
David Laight wrote:
> 
> On Tue, 24 Dec 2024 23:16:17 +0000
> Ethan Carter Edwards <ethan@ethancedwards.com> wrote:
> 
> > Hello all,
> > 
> > First of all, happy holidays. 
> > 
> > I was browsing the ctdaio.c code and I noticed a lot of 
> > duplicate code and functions, specifically:
> > 
> > dao_set_{right,left}_input and
> > dao_clear_{right,left}_input functions.
> > 
> > The functions are pretty much identical. They only 
> > differ in the side (left, right). What was the original
> > idea in doing this? Wouldn't it make more since to just
> > have an ENUM (left, right) as an argument that would 
> > determine the side and just reduce the function to 
> > dao_set_input and dao_clear_input.
> 
> Hmmm... you'd have a lot of conditionals inside the function.
> 
> They also look like a memory leak just waiting to happen.
> I guess that an earlier implementation used a separate kmalloc()
> for each imappers[].
> 
> Why is imappers[] an array of pointers not an array of the items?
> Each is just 8 bytes plus a 'list_head' (2 pointers?).

AFAIUC, it's a setup of a chained element, so no leak there as of
now.

I agree with that the code is unnecessarily complex, though.


thanks,

Takashi
