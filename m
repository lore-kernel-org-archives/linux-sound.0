Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 558ED3C769B
	for <linux-sound@vger.kernel.org>; Fri, 12 Jun 2026 11:35:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781264131; cv=none; b=NQT9aFSCWDZZ6T7vlVXyC0MysGQLDv2aDqIaK3bUMgieUZ7hKE7dCKTKge3qGmMYy+fY8UDqsAxwfw5N3Afi/HO3rQ0lzlrJy8Bsrd1w9NHj+syZ8Dwi+CSzR/RzoHMRiM/2qJyzop46zQ2hJeHw+gKxy55nL9MOYsX7FgdzZVs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781264131; c=relaxed/simple;
	bh=FZ/BYuWnGfH6GdhZVFi8VECJpxkEhePndsaYihWd6Zk=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=EOrU7/Ghry8anHGdn6EaZagqFaJ2E6GTaJw36nR6jbvbLE+pZjOYQJninZ7OkOPXJldafeaufq9PXmacjmec1p/jo9U4mmV/6Ldxi0KN6y6W6LVL1QSOGmLAdW+8qQG//AJA4IqURxPSBbjy1cJQK318Xdxxh0EH7tKJmPh6hCg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=wMurv6E4; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=KgktL/9c; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=wMurv6E4; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=KgktL/9c; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="wMurv6E4";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="KgktL/9c";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="wMurv6E4";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="KgktL/9c"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 3FE106ADEB;
	Fri, 12 Jun 2026 11:35:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1781264127; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=keg7iF3j92jk95vEokSYoDEAY81fBW+RFnYKhf17zRo=;
	b=wMurv6E4mJ4A8S/VSeB5glTGCjJfPjnQhdVnQxsG/JfSFFFAMPa6HgRnjlwr3Vn6hpRtAP
	EHQdrtrPrOQ5TnR+4rurqpa0v2k7yeQKyvWTz3zQdQq8mmdFstUIcKxsuvAYryKoBZS0JW
	lYtk0OEKu0ZbnOeIRoaH4lL/ubcn/5M=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1781264127;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=keg7iF3j92jk95vEokSYoDEAY81fBW+RFnYKhf17zRo=;
	b=KgktL/9cTjH/eh8L70tdRBPnj8tqH5ttISRT+JghBVSHDelSqO4GL6Y4EAX0mOxrPBm3KQ
	CW6OORYI78KNarDg==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=wMurv6E4;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b="KgktL/9c"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1781264127; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=keg7iF3j92jk95vEokSYoDEAY81fBW+RFnYKhf17zRo=;
	b=wMurv6E4mJ4A8S/VSeB5glTGCjJfPjnQhdVnQxsG/JfSFFFAMPa6HgRnjlwr3Vn6hpRtAP
	EHQdrtrPrOQ5TnR+4rurqpa0v2k7yeQKyvWTz3zQdQq8mmdFstUIcKxsuvAYryKoBZS0JW
	lYtk0OEKu0ZbnOeIRoaH4lL/ubcn/5M=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1781264127;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=keg7iF3j92jk95vEokSYoDEAY81fBW+RFnYKhf17zRo=;
	b=KgktL/9cTjH/eh8L70tdRBPnj8tqH5ttISRT+JghBVSHDelSqO4GL6Y4EAX0mOxrPBm3KQ
	CW6OORYI78KNarDg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 20C53779A7;
	Fri, 12 Jun 2026 11:35:27 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id 90pXBP/uK2r/egAAD6G6ig
	(envelope-from <tiwai@suse.de>); Fri, 12 Jun 2026 11:35:27 +0000
Date: Fri, 12 Jun 2026 13:35:26 +0200
Message-ID: <874ij8htz5.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Cameron Graham <cam.graham@gmail.com>
Cc: linux-sound@vger.kernel.org,
	tiwai@suse.de
Subject: Re: [PATCH] ALSA: hda/hdmi: Add force-connect quirk for HP EliteDesk 800 G5 Mini
In-Reply-To: <20260612094601.1209845-1-cam.graham@gmail.com>
References: <20260612094601.1209845-1-cam.graham@gmail.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/30.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Rspamd-Action: no action
X-Rspamd-Queue-Id: 3FE106ADEB
X-Spam-Flag: NO
X-Spam-Score: -3.51
X-Spam-Level: 
X-Spamd-Result: default: False [-3.51 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_CONTAINS_FROM(1.00)[];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	TO_DN_SOME(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	RCVD_TLS_ALL(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[];
	DKIM_TRACE(0.00)[suse.de:+];
	RCPT_COUNT_THREE(0.00)[3];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo,suse.de:mid,suse.de:dkim]
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org

On Fri, 12 Jun 2026 11:46:01 +0200,
Cameron Graham wrote:
> 
> The HP EliteDesk 800 G5 Mini (PCI subsystem 103c:8595) uses
> Cannon Lake PCH cAVS HDA with DisplayPort audio pins 0x05 and
> 0x06 set to AC_JACK_PORT_NONE (N/A) in BIOS defaults, causing
> hdmi_add_pin() to skip them and the DP audio device to not
> appear in ALSA.
> 
> Add the board to the existing force_connect_list alongside the
> similar HP EliteDesk 800 G4 entries.
> 
> Signed-off-by: Cameron Graham <cam.graham@gmail.com>

Applied to for-next branch now.  Thanks.


Takashi
