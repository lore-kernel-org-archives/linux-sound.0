Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94E4617D372
	for <linux-sound@vger.kernel.org>; Tue, 10 Sep 2024 08:29:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725956980; cv=none; b=jt1ro2gjAZBJAd5/LHxm+bFXQFS0w40f7XJwvtdguDghEZ7JRTss393adC12XEY9/Axi01TbSAVJJ4C60BMCBcmpgfdKbYfs6+QrmUz45dW2W0egHa8kwBpRPrWmQ0J7frm9n99Aopo6l3hWNIp5WbdtTYOhDB1XU//cDvdqWgY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725956980; c=relaxed/simple;
	bh=cWXcRjpgLTnROsfZaPIxJxU2cYU/3VqCKhYMHrMmOiA=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=e280dHv9LA6U8NO+XTPH5HIsw+koBxTeZYAbB2Npycyg4R8S1IfqVlYLbIvw3rYubgjyPstU7jt3maXk2oXlxnjaa3c4V+X/vAMy0YYvLXi92MUN9cHrqwCVO28FCUFqt1MllWxW7t9KbkkdHazRe/Fv/clyYDlpubC1zIhx+Fs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=pw2UUn7y; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=5sA4kGdy; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=pw2UUn7y; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=5sA4kGdy; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="pw2UUn7y";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="5sA4kGdy";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="pw2UUn7y";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="5sA4kGdy"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id BF8EA1F455;
	Tue, 10 Sep 2024 08:29:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1725956976; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=lzECwgPSlKAuBK4N3zXOaFg9BVmjpcrjOKGa3eBn48Y=;
	b=pw2UUn7yIiQCa0dYvbzc5ZQ0SMi+qGJwIzoSxmqteQGVW3EiKyjMjmN/QaEv2i/wVhKYrj
	50DDbg/w6TFP7jxMPPQ8FR5VfDuVag1pxgBL9NlSJ6dMC0TtdCI8EOOPp3QnQktMQPmEbm
	zMpQl4qRw8sWLBfT7QeMRfECX4JR9H0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1725956976;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=lzECwgPSlKAuBK4N3zXOaFg9BVmjpcrjOKGa3eBn48Y=;
	b=5sA4kGdylzrKSQtX+m3Q7v8QvqxmbVhD9381PPkZIQ7CoLG5e+lh3s53eaCbcI0bKyyqHd
	H7gmiwqn33bSC0Dw==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=pw2UUn7y;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=5sA4kGdy
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1725956976; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=lzECwgPSlKAuBK4N3zXOaFg9BVmjpcrjOKGa3eBn48Y=;
	b=pw2UUn7yIiQCa0dYvbzc5ZQ0SMi+qGJwIzoSxmqteQGVW3EiKyjMjmN/QaEv2i/wVhKYrj
	50DDbg/w6TFP7jxMPPQ8FR5VfDuVag1pxgBL9NlSJ6dMC0TtdCI8EOOPp3QnQktMQPmEbm
	zMpQl4qRw8sWLBfT7QeMRfECX4JR9H0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1725956976;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=lzECwgPSlKAuBK4N3zXOaFg9BVmjpcrjOKGa3eBn48Y=;
	b=5sA4kGdylzrKSQtX+m3Q7v8QvqxmbVhD9381PPkZIQ7CoLG5e+lh3s53eaCbcI0bKyyqHd
	H7gmiwqn33bSC0Dw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 99175132CB;
	Tue, 10 Sep 2024 08:29:36 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id K773I3AD4GY5OgAAD6G6ig
	(envelope-from <tiwai@suse.de>); Tue, 10 Sep 2024 08:29:36 +0000
Date: Tue, 10 Sep 2024 10:30:25 +0200
Message-ID: <87ldzz7vxa.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Joshua Grisham <josh@joshuagrisham.com>
Cc: tiwai@suse.com,
	perex@perex.cz,
	linux-sound@vger.kernel.org
Subject: Re: [PATCH] ALSA: hda/realtek: Refactor and simplify Samsung Galaxy Book init
In-Reply-To: <20240909193000.838815-1-josh@joshuagrisham.com>
References: <20240909193000.838815-1-josh@joshuagrisham.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Rspamd-Queue-Id: BF8EA1F455
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
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	RCVD_TLS_ALL(0.00)[];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	TO_DN_SOME(0.00)[];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	DWL_DNSWL_BLOCKED(0.00)[suse.de:dkim];
	RCPT_COUNT_THREE(0.00)[4];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid,suse.de:dkim,imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	DKIM_TRACE(0.00)[suse.de:+]
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spam-Flag: NO
X-Spam-Level: 

On Mon, 09 Sep 2024 21:30:00 +0200,
Joshua Grisham wrote:
> 
> I have done a lot of analysis for these type of devices and collaborated
> quite a bit with Nick Weihs (author of the first patch submitted for this
> including adding samsung_helper.c). More information can be found in the
> issue on Github [1] including additional rationale and testing.
> 
> The existing implementation includes a large number of equalizer coef
> values that are not necessary to actually init and enable the speaker
> amps, as well as create a somewhat worse sound profile. Users have
> reported "muffled" or "muddy" sound; more information about this including
> my analysis of the differences can be found in the linked Github issue.
> 
> This patch refactors the "v2" version of ALC298_FIXUP_SAMSUNG_AMP to a much
> simpler implementation which removes the new samsung_helper.c, reuses more
> of the existing patch_realtek.c, and sends significantly fewer unnecessary
> coef values (including removing all of these EQ-specific coef values).
> 
> A pcm_playback_hook is used to dynamically enable and disable the speaker
> amps only when there will be audio playback; this is to match the behavior
> of how the driver for these devices is working in Windows, and is
> suspected but not yet tested or confirmed to help with power consumption.
> 
> Support for models with 2 speaker amps vs 4 speaker amps is controlled by
> a specific quirk name for both types. A new int num_speaker_amps has been
> added to alc_spec so that the hooks can know how many speaker amps to
> enable or disable. This design was chosen to limit the number of places
> that subsystem ids will need to be maintained: like this, they can be
> maintained only once in the quirk table and there will not be another
> separate list of subsystem ids to maintain elsewhere in the code.
> 
> Also updated the quirk name from ALC298_FIXUP_SAMSUNG_AMP2 to
> ALC298_FIXUP_SAMSUNG_AMP_V2_.. as this is not a quirk for "Amp #2" on
> ALC298 but is instead a different version of how to handle it.
> 
> More devices have been added (see Github issue for testing confirmation),
> as well as a small cleanup to existing names.
> 
> [1]: https://github.com/thesofproject/linux/issues/4055#issuecomment-2323411911
> 
> Signed-off-by: Joshua Grisham <josh@joshuagrisham.com>

This looks like a nice cleanup.
Applied now.  Thanks.


Takashi
