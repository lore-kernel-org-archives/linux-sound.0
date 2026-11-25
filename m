Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=195.135.223.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795604898;
	b=5V/dniXYvkAcTb9c+Wvuha0V61CItSbFfsYgWijW5QIJHseEg/I4ksX9c3xc5miDGMHP
	 ixvdmnn5qumicFhTLLLlQaXB6SeYA3RaYI1jXRHT6L0s+vQSCx764Ucmk+ym0em0Ml6mk
	 3pUlkBknGPBOVH6nn8UO2c0pSTpozeebpLwos7HUaPEhdL3l3dX9Q9ozYQOVAyympGQ73
	 e/2O/7DFRX6anC9ItLArzjgmCsNzWSGm5igXoha+ec5zygR6GZUm/gLcC+f6cG7nfP6Dw
	 JJcMmFDHsiwNgHTxK25qSlAbYyKjhABk8TnFw8hJohTv6yRtHymwk6gJf8Jto01J13A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795604898;
	h=DMARC-Filter:Received:DKIM-Signature:DKIM-Signature:DKIM-Signature:
	 DKIM-Signature:Received:Received:Date:Message-ID:From:To:Cc:Subject:
	 In-Reply-To:References:User-Agent:MIME-Version:Content-Type:
	 X-Spam-Flag:X-Spam-Level:X-Spamd-Result:X-Spam-Score;
	bh=ND7WwaYbRIfYP+h2ge9PhMkJcLl1sjxZXItQ03ZSjwk=;
	b=22eV9FxrxCoIedGFuHE8Rmz98SOc5PXeOntm634xA33kRIJLeE6/s/CBmzuc+ClAlP8q
	 2PSbktCT5aBfcb8Lh9A1z7IivMldmIWqRiev7Lqx2R3W2KQsXDXbU3v6IQfi9JbKyM0Dk
	 6sbHN8NOJudT/RCUluD7Y0rJPEY9h9N5XQLqLIoYhTJJ3/eDBKh+w4HHTkq09wHhTS5L9
	 m0cCJ+sHTfPMBekAEkWI4c0SeXY4OCrgNwj461gxn4qWfBNbTk6dgdhLBgirbRnSWwhcG
	 vRCTn40UlqjZfy8gS4DKSkzQuN0FaaEsJMoP4v8lgYTPzY4gg7qFiHqFjwEsSaD5/fQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.de;
	spf=pass smtp.mailfrom=suse.de;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=lBqEH3p3;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b="MJZmDW7/";
	dkim=pass header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=lBqEH3p3;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b="MJZmDW7/";
	arc=none smtp.remote-ip=195.135.223.131
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89E9D606A31E
	for <linux-sound@vger.kernel.org>; Wed, 25 Nov 2026 11:08:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 89E9D606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=lBqEH3p3;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=MJZmDW7/;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=lBqEH3p3;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=MJZmDW7/
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id CBE7C1F7A2;
	Wed, 25 Nov 2026 11:08:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1795604895; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=ND7WwaYbRIfYP+h2ge9PhMkJcLl1sjxZXItQ03ZSjwk=;
	b=lBqEH3p3WA0vv1BDpA7XW1r1Rb6p2Sge7l+lhgJvCqSroIX70vqps+r+sCf3eDab27mRHa
	A4LrMPe+451qp5jW4lrMT93N+jFJsQcR3t5ERgR8LTYFhomb/WUQXe4JeAcqSxecIjrj8g
	raRMd92cMIAF/aFWZEOrgrNubECA+mo=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1795604895;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=ND7WwaYbRIfYP+h2ge9PhMkJcLl1sjxZXItQ03ZSjwk=;
	b=MJZmDW7/DQQr8rPdIC5NPknKfIS82eZh35M4YZ8oRnjO9tm8KBhIOcIAv3PisIyJOxs+I+
	t1+U4Ed7dTcENFBw==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1795604895; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=ND7WwaYbRIfYP+h2ge9PhMkJcLl1sjxZXItQ03ZSjwk=;
	b=lBqEH3p3WA0vv1BDpA7XW1r1Rb6p2Sge7l+lhgJvCqSroIX70vqps+r+sCf3eDab27mRHa
	A4LrMPe+451qp5jW4lrMT93N+jFJsQcR3t5ERgR8LTYFhomb/WUQXe4JeAcqSxecIjrj8g
	raRMd92cMIAF/aFWZEOrgrNubECA+mo=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1795604895;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=ND7WwaYbRIfYP+h2ge9PhMkJcLl1sjxZXItQ03ZSjwk=;
	b=MJZmDW7/DQQr8rPdIC5NPknKfIS82eZh35M4YZ8oRnjO9tm8KBhIOcIAv3PisIyJOxs+I+
	t1+U4Ed7dTcENFBw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 7D132134CA;
	Wed, 25 Nov 2026 11:08:15 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id LyQiFZ/BBmtfEQAAD6G6ig
	(envelope-from <tiwai@suse.de>); Wed, 25 Nov 2026 11:08:15 +0000
Date: Wed, 25 Nov 2026 12:08:15 +0100
Message-ID: <87a4mx88yo.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Miloslav Brada <email@miloslavbrada.cz>
Cc: Takashi Iwai <tiwai@suse.de>,
	Takashi Iwai <tiwai@suse.com>,
	Jaroslav Kysela <perex@perex.cz>,
	linux-sound@vger.kernel.org,
	Nguyen Ngoc Thang <ngocthang2710.1999@gmail.com>
Subject: Re: [BUG] ALSA: usb-audio: list_add corruption in push_back_to_ready_list() on 7.3.4
In-Reply-To: <awa-EWZ3tvDyOumt@genesis.transkript.cz>
References: <awZs88beIhMcOchv@genesis.transkript.cz>
	<87tsl58js4.wl-tiwai@suse.de>
	<awa-EWZ3tvDyOumt@genesis.transkript.cz>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/30.2 Mule/6.0
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Post: <mailto:linux-sound@vger.kernel.org>
List-Help: <mailto:linux-sound+help@vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-sound+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spam-Flag: NO
X-Spam-Level: 
X-Spamd-Result: default: False [-10.80 / 50.00];
	SUSE_INTERNAL_BYPASS(-9.00)[];
	BAYES_HAM(-3.00)[100.00%];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	RCPT_COUNT_FIVE(0.00)[6];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[suse.de,suse.com,perex.cz,vger.kernel.org,gmail.com];
	RCVD_TLS_ALL(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo]
X-Spam-Score: -10.80

On Wed, 25 Nov 2026 11:53:05 +0100,
Miloslav Brada wrote:
> 
> On Wed, 25 Nov 2026 08:14:35 +0100,
> Takashi Iwai wrote:
> > Yes, this should cover in your particular case, and that'll be likely
> > the easiest fix for now.  Could you check the below?
> 
> Thanks! I'm running your patch since today (7.3.4, lowlatency=Y).
> Given the crash interval of weeks to months, I'll report back in
> ~4 weeks, or immediately if it crashes again.

OK, then I'd rather put this fix for the upstream before I get your
answer :)  It's a quick fix and should be fairly harmless.


thanks,

Takashi
