Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60C1769D2B
	for <linux-sound@vger.kernel.org>; Wed, 31 Jul 2024 06:29:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722407381; cv=none; b=mXZWrUNWjg7FPpDF+7dCQ2tLKCSxp/xnUPdRI0Fitwzys+ghnsVk95xeUD+BzaDdkeVBzNX0Y9r3cWpE8QuVAMfFuVQUi4hjVXsFNr1ao92BFV53L8VBav96xP9c2wJkBhvRfwYsKKDcZ8dzkNDCAHDToZ+t2qu79S+rhVo4wFc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722407381; c=relaxed/simple;
	bh=zWham1aABvcAldH3nct2+vbbOh2hf1v2UxqVMc38JGg=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=pc7fUnxhT7mASKkT7+ff5r9rBO27ZrBp+83uPEgTIA9maL8YiOPSAXM1d9yUorwYUkRDsgFYLOVJeCJ5z/I4xarD+9ct+2RznzdwZ9kIiI1WYcnEEqhXPhhfC/Dit53c5RYrA2NHe96Mb0d6rxBWz9rl0swWvea/pjN/T8m+XWg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=fyD+HcQ+; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=YkwH1zXV; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=fyD+HcQ+; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=YkwH1zXV; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="fyD+HcQ+";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="YkwH1zXV";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="fyD+HcQ+";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="YkwH1zXV"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id DF10F21F31;
	Wed, 31 Jul 2024 06:29:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1722407378; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=65ZU/IcMBSto9GQ0aMYtNo8USn2FhslmqvAzK8F26c4=;
	b=fyD+HcQ+2NO4uszbAfcS641Qs/6beK5kWuypwH3NvXp3e6colH0gCAJrLWDXNQAweUsF/o
	IMMtm/r8hNRszqiHns2Xo19dzJRfh7zjpaUz2EhzI6EXQHayIVDbMfQVZ79AGpUtEMv3nt
	QKnTZFPotvcU+vYvXQ2C6ifcUEj0Dzg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1722407378;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=65ZU/IcMBSto9GQ0aMYtNo8USn2FhslmqvAzK8F26c4=;
	b=YkwH1zXVvXzwoU/9X0FLbFDYpKrXgpcsKWH9vCjF6ThShYFQ2vs1GvDDgZMIKHfSuM9B4U
	2qBcZkQ1I7MsW2AQ==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1722407378; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=65ZU/IcMBSto9GQ0aMYtNo8USn2FhslmqvAzK8F26c4=;
	b=fyD+HcQ+2NO4uszbAfcS641Qs/6beK5kWuypwH3NvXp3e6colH0gCAJrLWDXNQAweUsF/o
	IMMtm/r8hNRszqiHns2Xo19dzJRfh7zjpaUz2EhzI6EXQHayIVDbMfQVZ79AGpUtEMv3nt
	QKnTZFPotvcU+vYvXQ2C6ifcUEj0Dzg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1722407378;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=65ZU/IcMBSto9GQ0aMYtNo8USn2FhslmqvAzK8F26c4=;
	b=YkwH1zXVvXzwoU/9X0FLbFDYpKrXgpcsKWH9vCjF6ThShYFQ2vs1GvDDgZMIKHfSuM9B4U
	2qBcZkQ1I7MsW2AQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 9D15513297;
	Wed, 31 Jul 2024 06:29:38 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id yKwFJdLZqWYXZwAAD6G6ig
	(envelope-from <tiwai@suse.de>); Wed, 31 Jul 2024 06:29:38 +0000
Date: Wed, 31 Jul 2024 08:30:15 +0200
Message-ID: <87ikwmoyyw.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Mark Brown <broonie@kernel.org>
Cc: Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.de>,
	Charles Keepax <ckeepax@opensource.cirrus.com>,
	lgirdwood@gmail.com,
	linux-sound@vger.kernel.org,
	patches@opensource.cirrus.com
Subject: Re: [PATCH] ASoC: cs42l43: Move shutter IRQ handling into a worker thread
In-Reply-To: <c555e200-af4a-4b71-9e04-d03f3f10c8d7@sirena.org.uk>
References: <20240729155932.3054632-1-ckeepax@opensource.cirrus.com>
	<87plqw9no5.wl-tiwai@suse.de>
	<ZqfHC7IodobTlVT4@opensource.cirrus.com>
	<87ikwo9etj.wl-tiwai@suse.de>
	<ZqinleaAqikxdQGr@opensource.cirrus.com>
	<87ikwn3vqf.wl-tiwai@suse.de>
	<81eb73d0-60e6-4a77-a3c6-f9d7355119d0@perex.cz>
	<f7503750-d751-42e7-88de-061f6263e4b6@sirena.org.uk>
	<3615b393-64cc-4983-960a-44bd2b0773fe@perex.cz>
	<c555e200-af4a-4b71-9e04-d03f3f10c8d7@sirena.org.uk>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spam-Level: 
X-Spamd-Result: default: False [-0.10 / 50.00];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_TLS_ALL(0.00)[];
	ARC_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[perex.cz,suse.de,opensource.cirrus.com,gmail.com,vger.kernel.org];
	TO_DN_SOME(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo]
X-Spam-Flag: NO
X-Spam-Score: -0.10

On Wed, 31 Jul 2024 01:20:40 +0200,
Mark Brown wrote:
> 
> On Tue, Jul 30, 2024 at 11:47:48PM +0200, Jaroslav Kysela wrote:
> > On 30. 07. 24 16:44, Mark Brown wrote:
> 
> > > With some of these slower buses it's not immediately obvious that it's
> > > worth the bother of caching - the overhead of doing the lookup is
> > > negligable in the overall context of handling the interrupt.
> 
> > I don't buy that argument. We should always try to write an optimal code.
> > Every CPU tick counts.
> 
> So do the bytes of memory you'd use caching the pointers!

Adding two more works would be even more wastes, that's the beginning
of the discussion :)

The problem is the order of ASoC component initialization, though;
AFAIUC, the kcontrols aren't instantiated at the point of component
probe, hence you can't get kcontrol objects there.


Takashi
