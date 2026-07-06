Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7C7641A77C
	for <linux-sound@vger.kernel.org>; Mon,  6 Jul 2026 13:26:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783344399; cv=none; b=mRPRgwok4fVa/e6XB0w0W9JbgM4/ZAECilJPj52ZU4De4rH7O+ZODi4Y9JAoZ22SD7hG50SnuN4ZYppYInvXc/J8lRTCQ6/+FodnSqR3nG8nadLJSAfhPLsiJlt+J5CqCzCg0QSLqDbh6/iycLDgo33aU3XrEL1KaYN/BT5ywVs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783344399; c=relaxed/simple;
	bh=tFbGF4l9CkBOrH75aI4ANYiJs5RYc9eYCYmocFqnURQ=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=DROxFCbxnCtJ2rv6aSUN+lZ4Ohb9SnuSxsvl3HJQv8pSd4XyRr6wve7IgQMHejS1hlrjEpevGTaUBsie9IrbdLW0k/uqol65I+G8NT628L7L0QqcX86VIDVjOHMqARonUBtqEKMHgHdIU5ImHrCm7BJ3Lcl/7hVCGejpluZnkn4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=ZWUU7ze3; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=zwrEMc58; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=ZWUU7ze3; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=zwrEMc58; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="ZWUU7ze3";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="zwrEMc58";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="ZWUU7ze3";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="zwrEMc58"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 4505C75786;
	Mon,  6 Jul 2026 13:26:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1783344394; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Z0p4RX+eaUBEmcOc3ua1tOf/FIeNF/0ytgVmxaYGatk=;
	b=ZWUU7ze3r3hWI0snx9d9dBxDYvEv54oKoGxi8bT/3eZOGFYfSCNKwy5r3G1KFrMzd/ruiE
	QiE7+9+IDHVe23OmYNLlX6/5jWgA2tBeK+OClAUGSeP63PE8bxNlxgDAckm5luan1btrJ7
	gdIM+uawHJ+m0tcrG2OQM0lyZtm/ceg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1783344394;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Z0p4RX+eaUBEmcOc3ua1tOf/FIeNF/0ytgVmxaYGatk=;
	b=zwrEMc58ZBQ7sY04w/Eu4wBBrWmHumfKpmKScV5SnCiGmZ+dgWDovepKb6D1I5knrstO14
	CwXfeTiUAmHEhGBw==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1783344394; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Z0p4RX+eaUBEmcOc3ua1tOf/FIeNF/0ytgVmxaYGatk=;
	b=ZWUU7ze3r3hWI0snx9d9dBxDYvEv54oKoGxi8bT/3eZOGFYfSCNKwy5r3G1KFrMzd/ruiE
	QiE7+9+IDHVe23OmYNLlX6/5jWgA2tBeK+OClAUGSeP63PE8bxNlxgDAckm5luan1btrJ7
	gdIM+uawHJ+m0tcrG2OQM0lyZtm/ceg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1783344394;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Z0p4RX+eaUBEmcOc3ua1tOf/FIeNF/0ytgVmxaYGatk=;
	b=zwrEMc58ZBQ7sY04w/Eu4wBBrWmHumfKpmKScV5SnCiGmZ+dgWDovepKb6D1I5knrstO14
	CwXfeTiUAmHEhGBw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id D6224779AA;
	Mon,  6 Jul 2026 13:26:33 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id bKYqMQmtS2pqSQAAD6G6ig
	(envelope-from <tiwai@suse.de>); Mon, 06 Jul 2026 13:26:33 +0000
Date: Mon, 06 Jul 2026 15:26:33 +0200
Message-ID: <87jyr88d12.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Cezary Rojewski <cezary.rojewski@intel.com>
Cc: Bui Duc Phuc <phucduc.bui@gmail.com>,
	Kees Cook <kees@kernel.org>,
	Dan Carpenter <error27@gmail.com>,
	Cen Zhang
	<zzzccc427@gmail.com>,
	Len Bao <len.bao@gmx.us>,
	Mehul Rao
	<mehulrao@gmail.com>,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
	<linux-sound@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>,
	"Jaroslav Kysela" <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	<cassiogabrielcontato@gmail.com>
Subject: Re: [PATCH 0/6] Return -ENODEV instead of -EFAULT on module-get failure
In-Reply-To: <83d2a230-71e8-4a24-9dce-363e1b230b54@intel.com>
References: <20260706084950.49331-1-phucduc.bui@gmail.com>
	<703ea25d-6c74-495f-8d0b-e48e5868a96e@intel.com>
	<CAABR9nH09_u3qNKaN3_epnYXk9rErQ_=Jy7dcn0_mWj+gfb0Kg@mail.gmail.com>
	<83d2a230-71e8-4a24-9dce-363e1b230b54@intel.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/30.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spam-Flag: NO
X-Spam-Score: -1.80
X-Spamd-Result: default: False [-1.80 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	SUSPICIOUS_RECIPS(1.50)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	RCPT_COUNT_TWELVE(0.00)[13];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_ENVRCPT(0.00)[gmail.com,gmx.us];
	TO_DN_SOME(0.00)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com,kernel.org,gmx.us,linutronix.de,vger.kernel.org,perex.cz,suse.com];
	RCVD_TLS_ALL(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid]
X-Spam-Level: 

On Mon, 06 Jul 2026 15:13:15 +0200,
Cezary Rojewski wrote:
> 
> On 7/6/2026 2:31 PM, Bui Duc Phuc wrote:
> 
> >> Now, there is a benefit of having a different error code in
> >> try_module_get() case: easier to find the offending bit when viewing
> >> logs.  All the functions in the area have rather low log-coverage so
> >> distinct error codes help.
> >> 
> >> Regardless, as you mentioned, -EFAULT isn't exactly the right return
> >> code either so the direction of the patchset is good.
> > 
> > Should I also add dev_err() at these paths, or is the distinct error
> > code enough for now?
> Nah, typically I prefer not to mix the changes, let them remain
> atomic. Distinct error code is enough.
> 
> In regard to the specific constant, I'd ask Takashi and Jaroslav
> what's their view on the subject.  Perhaps -EPERM or -ENOENT are good
> candidates.

A quick grep showed the statics like:
     85 ENODEV
     41 EINVAL
     17 EBUSY
     16 EFAULT
     14 ENOENT
     10 EPROBE
      8 EIO
      6 ENXIO
      3 EPROTONOSUPPORT
      3 EAGAIN
      3 EACCES
      2 EXPORT
      2 EPERM
      2 ENOLCK
      1 EPROTO
      1 EOPNOTSUPP
      1 ENOSYS
      1 ENOPROTOOPT
      1 EAFNOSUPPORT

So -ENODEV looks fine.


thanks,

Takashi
