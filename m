Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDDB22594AB;
	Sun, 29 Dec 2024 12:03:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735473840; cv=none; b=Or5vdlp581UiQLZSE0GInwOezYdUkGXWBWCbP2bYO+RfWbpnlGXATcJOlsR+Vd4pumPYiLg0h1dg5GEdDLSKktCQVmmeRQldf0t9l6wI96vGaCeA1MqXB0sAVcx6GO2YOYmm8Sg9lMi+ro63RJSFzBpwev9jechj8ko7tKknwqQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735473840; c=relaxed/simple;
	bh=UAID1wGrCM/RR8GjoTfqV+eE/MZzIxfJpOaFGhev3xg=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=rR75bEomi6mvDMjhu4f643KzkgyCvIxjkSGlV7pq7hJExtUsfmklI9Krp74koysjUhUR0dD5f2S7S7cMuG0hWGgwU3hVb00xHKLZLiqWtQjlfo0UD8Dqc+gJeyV3PgOfERzdjGzwOqD/2O2rQs1FaBQEIoC9+xOhbtxVYZyHnYk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=bSpZAM8P; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=6vj2Py43; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=J6imnk4R; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=8tA4WjNt; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="bSpZAM8P";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="6vj2Py43";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="J6imnk4R";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="8tA4WjNt"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id CDC171F812;
	Sun, 29 Dec 2024 12:03:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1735473837; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=DLB8wdGw4OiO35q67rb1FwDp2HWPDT9pjHFT5FAgg/g=;
	b=bSpZAM8PuWKLHG7GY4JrzgOB8csFe3zFudqIjCcNBmTkTpGEDdTfeNHZS925K/aOlc470G
	YnQE1BGSjb/nvRBayjm77IFTLww6KPD0kqEWlu79f/OPPXK3NKf8bkW+3IBBpfOeOtWp6K
	6JUgnIUA5qrBVgjpVbTQQeT6j8/6DgA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1735473837;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=DLB8wdGw4OiO35q67rb1FwDp2HWPDT9pjHFT5FAgg/g=;
	b=6vj2Py43rpHO09tWQ//IwUEAhc/V0XwWKo33dtFQQpZbnpbwEfLM0kOs3Y/mLXCLIlyFMh
	dhU5QxFq1GxCdFAw==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1735473836; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=DLB8wdGw4OiO35q67rb1FwDp2HWPDT9pjHFT5FAgg/g=;
	b=J6imnk4RGbOs+8ZQwpQr3c5QRw4YmPWo9IjuumiE3tbXUNjjgbI4hyjO4cpJHGlBdwrlOV
	hvZgN8/DTQk6/MjEQxeCbLnWj/7FIMM+8BUnEUzeMG5zwq7bU2GF7gDyM+7Ko2X6mhqYAy
	GMYWgWiyXCS6TKsQpjfKqgd4HYkkyio=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1735473836;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=DLB8wdGw4OiO35q67rb1FwDp2HWPDT9pjHFT5FAgg/g=;
	b=8tA4WjNtjhmrsYCUzIQSGldgeiaPyzoKj7AXdUCo8g7y+51RZRau6pIBTB7pSjUqWztBnE
	dQBS0Y5mOl6sFsAA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 9833A13A30;
	Sun, 29 Dec 2024 12:03:56 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id kT+2I6w6cWeJbgAAD6G6ig
	(envelope-from <tiwai@suse.de>); Sun, 29 Dec 2024 12:03:56 +0000
Date: Sun, 29 Dec 2024 13:03:56 +0100
Message-ID: <87bjwuy9ub.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: David Laight <david.laight.linux@gmail.com>
Cc: Takashi Iwai <tiwai@suse.de>,
	Ethan Carter Edwards <ethan@ethancedwards.com>,
	"wychay@ctl.creative.com" <wychay@ctl.creative.com>,
	"ryan_richards@creativelabs.com" <ryan_richards@creativelabs.com>,
	"linux-sound@vger.kernel.org" <linux-sound@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: sound/pci/ctxfi/ctdaio.c: duplicate function removal question
In-Reply-To: <20241229105722.03ada34f@dsl-u17-10>
References: <NyKCr2VHK_xCQDwNxFKKx2LVd2d_AC2f2j4eAvnD9uRPtb50i2AruCLOp6mHxsGiyYJ0Tgd3Z50Oy1JTi5gPhjd2WQM2skrv7asp3fLl8HU=@ethancedwards.com>
	<20241229090228.75f8a3ba@dsl-u17-10>
	<87frm6dfda.wl-tiwai@suse.de>
	<20241229105722.03ada34f@dsl-u17-10>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spam-Level: 
X-Spamd-Result: default: False [-1.80 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	TAGGED_RCPT(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ARC_NA(0.00)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_SEVEN(0.00)[7];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:email,suse.de:mid]
X-Spam-Score: -1.80
X-Spam-Flag: NO

On Sun, 29 Dec 2024 11:57:22 +0100,
David Laight wrote:
> 
> On Sun, 29 Dec 2024 10:10:09 +0100
> Takashi Iwai <tiwai@suse.de> wrote:
> 
> > On Sun, 29 Dec 2024 10:02:28 +0100,
> > David Laight wrote:
> > > 
> > > On Tue, 24 Dec 2024 23:16:17 +0000
> > > Ethan Carter Edwards <ethan@ethancedwards.com> wrote:
> > >   
> > > > Hello all,
> > > > 
> > > > First of all, happy holidays. 
> > > > 
> > > > I was browsing the ctdaio.c code and I noticed a lot of 
> > > > duplicate code and functions, specifically:
> > > > 
> > > > dao_set_{right,left}_input and
> > > > dao_clear_{right,left}_input functions.
> > > > 
> > > > The functions are pretty much identical. They only 
> > > > differ in the side (left, right). What was the original
> > > > idea in doing this? Wouldn't it make more since to just
> > > > have an ENUM (left, right) as an argument that would 
> > > > determine the side and just reduce the function to 
> > > > dao_set_input and dao_clear_input.  
> > > 
> > > Hmmm... you'd have a lot of conditionals inside the function.
> > > 
> > > They also look like a memory leak just waiting to happen.
> > > I guess that an earlier implementation used a separate kmalloc()
> > > for each imappers[].
> > > 
> > > Why is imappers[] an array of pointers not an array of the items?
> > > Each is just 8 bytes plus a 'list_head' (2 pointers?).  
> > 
> > AFAIUC, it's a setup of a chained element, so no leak there as of
> > now.
> 
> Unless someone calls the functions in the wrong order.
> And that seems to be outside the control of this code.

Could you elaborate?  The chain element gets released also by the
destructor, dao_rsc_uninit().  And this is no exported function to be
used by other drivers, but an internal one only for ctxfi driver.


thanks,

Takashi
