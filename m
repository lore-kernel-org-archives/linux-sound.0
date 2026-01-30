Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76D77256C8D
	for <linux-sound@vger.kernel.org>; Fri, 30 Jan 2026 15:14:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769786056; cv=none; b=sSzUe38hlmMLP/WeldsX0UPyjLvi678tM9mDsAwEFyZJlJyrGmn/X3FBaelhoK4tGz/gIdy0UsFMzuvxOft+LdXSqMBuknqiVZvK+9xSrp3BGtSHeh7WNXPBsC+lZFDyTk7dNREr3rGJ/+dQ1D7gQBzm6l+TwQZu6qrYlIhvqaM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769786056; c=relaxed/simple;
	bh=zHnbRYndnnKUopvDzRHhTVTk4yrWoyrikLbXqWva73g=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=P22BNp/MFBC8YHpf6oH/Q3OVSynaRBzV2kv6Va3GDyLCN0bJXEsQfDuP81ugSQxtfUgc2cciVRCGf85qSXi6tM2RE8u9r0Ug3FYo7KQ4VkcNFkZfDWdxQQ70lO0hgfZyG6834xq/40v3itbz1OPO2z7AHE32SZONc/bWM3yQdhU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=zVyGg5iX; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=N2yIntTg; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=zVyGg5iX; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=N2yIntTg; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="zVyGg5iX";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="N2yIntTg";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="zVyGg5iX";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="N2yIntTg"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id AE8EE5BCF4;
	Fri, 30 Jan 2026 15:14:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1769786053; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=0jVSviXuYgTzqEbnc58J6EIvtfgxlUJwcYoTn9FIm3U=;
	b=zVyGg5iXcb/WgiBLK3GZcJuXmFWt4QO7aL5epSff8XI2Tb1PDE+sgGQc3npfDFyuH6iFMt
	w6CMYSFKSiiD+igyMfpbHjuPJz4Ij9iSb9kL2Qi4CMcpqmx5WSYTaLFq7AX3x474DrlaO4
	ORZGhtAvC7rPZnPFspkjtHf3DD4VYbU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1769786053;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=0jVSviXuYgTzqEbnc58J6EIvtfgxlUJwcYoTn9FIm3U=;
	b=N2yIntTgY8kHi5mGe4/MSgFmTu5r1aReaFtPGG28gMjmyCmphgCEfdMzDzJSFkbL6h8oKJ
	VoBwp/mqgFQxNbDA==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1769786053; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=0jVSviXuYgTzqEbnc58J6EIvtfgxlUJwcYoTn9FIm3U=;
	b=zVyGg5iXcb/WgiBLK3GZcJuXmFWt4QO7aL5epSff8XI2Tb1PDE+sgGQc3npfDFyuH6iFMt
	w6CMYSFKSiiD+igyMfpbHjuPJz4Ij9iSb9kL2Qi4CMcpqmx5WSYTaLFq7AX3x474DrlaO4
	ORZGhtAvC7rPZnPFspkjtHf3DD4VYbU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1769786053;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=0jVSviXuYgTzqEbnc58J6EIvtfgxlUJwcYoTn9FIm3U=;
	b=N2yIntTgY8kHi5mGe4/MSgFmTu5r1aReaFtPGG28gMjmyCmphgCEfdMzDzJSFkbL6h8oKJ
	VoBwp/mqgFQxNbDA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 6890E3EA61;
	Fri, 30 Jan 2026 15:14:13 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id 9FdJGMXKfGmnfAAAD6G6ig
	(envelope-from <tiwai@suse.de>); Fri, 30 Jan 2026 15:14:13 +0000
Date: Fri, 30 Jan 2026 16:14:13 +0100
Message-ID: <87ecn7xhdm.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Cezary Rojewski <cezary.rojewski@intel.com>
Cc: Takashi Iwai <tiwai@suse.de>,
	Mark Brown <broonie@kernel.org>,
	<tiwai@suse.com>,
	<perex@perex.cz>,
	<amade@asmblr.net>,
	<kuninori.morimoto.gx@renesas.com>,
	<linux-sound@vger.kernel.org>
Subject: Re: [PATCH] ALSA: control: Verify put() result when in debug mode
In-Reply-To: <2d5852c1-f754-4b5a-8a01-962a4ba14b68@intel.com>
References: <20260130135541.115574-1-cezary.rojewski@intel.com>
	<60f477d0-ea1f-435a-bd8c-4e7e06a1802b@sirena.org.uk>
	<87ikcjxjgr.wl-tiwai@suse.de>
	<2d5852c1-f754-4b5a-8a01-962a4ba14b68@intel.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/30.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spamd-Result: default: False [-3.30 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-0.998];
	MIME_GOOD(-0.10)[text/plain];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid,imap1.dmz-prg2.suse.org:helo]
X-Spam-Flag: NO
X-Spam-Score: -3.30
X-Spam-Level: 

On Fri, 30 Jan 2026 16:00:10 +0100,
Cezary Rojewski wrote:
> 
> On 2026-01-30 3:29 PM, Takashi Iwai wrote:
> > On Fri, 30 Jan 2026 15:12:58 +0100,
> > Mark Brown wrote:
> >>> +	struct snd_ctl_elem_value original;
> >> 
> >>> +	ret = kctl->get(kctl, &original);
> >>> +	if (ret)
> >>> +		return ret;
> >> 
> >>> +	retcmp = memcmp(&original.value.bytes.data[0], &control->value.bytes.data[0],
> >>> +			sizeof(original.value.bytes.data[0]));
> >>> +	if (retcmp)
> >>> +		retcmp = 1;
> >> 
> >> original was just allocated from the stack so who knows what values it
> >> had originally, and the get() is only going to write the part of the
> >> value that has data since the normal get() path has a memset() in the
> >> core.  Similarly with the new value coming in from userspace there's no
> >> requirement for userspace to set anything that isn't part of the value
> >> being written to any particular value.  This means we're liable to get
> >> spurious mismatches.
> > 
> > Yes, and if I understand correctly, the above memcmpy() just compare
> > the single byte from original and the result?  Then it'll lead to
> > false-positive outputs.
> > 
> > We'll need to query the control info and check the relevant values
> > for each info->type and count.
> 
> Wouldn't memset(0) as a preparation-step solve the issue? That is,
> each element - instance of struct snd_ctl_elem_value - has up to 512
> bytes of data, regardless of type. Not seeing usefulness of ->info()
> here. Perhaps I'm missing something.

Well, you're calling memcmp with sizeof(original.value.bytes.data[0]),
and this size is just one byte, no?

And, if you need to compare the full data, the remaining space has to
be initialized, yes.  For the variable original, you can do memset(),
but for control->value, there is no guarantee of initialization of
remaining space because it's a copy from user-space.


Takashi
