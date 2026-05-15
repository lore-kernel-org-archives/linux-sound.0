Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1445377EAB
	for <linux-sound@vger.kernel.org>; Fri, 15 May 2026 06:37:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778827080; cv=none; b=MH68ve7iml5zhuLppi7B6JfK3S6ZUHNx+xrlpNeO1p6rlgbCRtZKYVtg/Xr0V/UDOKybyOpL6TVmDc7eLph3E7H2PcKqwK4SRgROJvIH/fDKsGuSIs5WTGcknLje5RTi6fOq7A77bbcoZE9y8GNIVPAANN5IzBjBU+r2xgiWUlw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778827080; c=relaxed/simple;
	bh=lE4JxQ8pBD5o67gV3ksYbhmL/Eh9D679zsjdlRaHsKg=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=gwEi4r4CmFPXdV+FZ5E6Y+374aRGLlg1+p8Asog+d5GgJwptMBImcx35KVliBmk3cQ6vJhJa1rkPNfcmHVZJ+khMsib6FDAkT44C0onjnpw9Gi1bS2kyxSlqFXaZUZp3bda6km39JijbSnBa9Iy1m2u6SMnmvDIEVTN93Q5yDQE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=0Cdu+ZcF; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=kbWiMCDZ; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=0Cdu+ZcF; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=kbWiMCDZ; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="0Cdu+ZcF";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="kbWiMCDZ";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="0Cdu+ZcF";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="kbWiMCDZ"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 71ADF67660;
	Fri, 15 May 2026 06:37:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1778827077; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=PRfPXjsAfYWPDCQfhr0/a057u3yl234uz3/SKwfbglg=;
	b=0Cdu+ZcFiNHbM7k77z8ew2xigcN68hhSJmcpbMl8ARTtrbHfSNqCbN6R9ibfC+Wf7rrFQi
	NrmQTDWs168Nyv0do+bWrCiH7eIT/JzEU2Gz29J4VOkSkKHZCUqfBOebZkpfcnJtDu1hdj
	x8HUWzbFDIzzmdfDRq0t0EP7NZKbl7k=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1778827077;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=PRfPXjsAfYWPDCQfhr0/a057u3yl234uz3/SKwfbglg=;
	b=kbWiMCDZtwUmzT9M5h1uoeMW6negJws9vH27MXPbegbUFjUi1eCy+8+On2tPgpIfu00VVp
	nicg2dXvaJOgu4AQ==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1778827077; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=PRfPXjsAfYWPDCQfhr0/a057u3yl234uz3/SKwfbglg=;
	b=0Cdu+ZcFiNHbM7k77z8ew2xigcN68hhSJmcpbMl8ARTtrbHfSNqCbN6R9ibfC+Wf7rrFQi
	NrmQTDWs168Nyv0do+bWrCiH7eIT/JzEU2Gz29J4VOkSkKHZCUqfBOebZkpfcnJtDu1hdj
	x8HUWzbFDIzzmdfDRq0t0EP7NZKbl7k=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1778827077;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=PRfPXjsAfYWPDCQfhr0/a057u3yl234uz3/SKwfbglg=;
	b=kbWiMCDZtwUmzT9M5h1uoeMW6negJws9vH27MXPbegbUFjUi1eCy+8+On2tPgpIfu00VVp
	nicg2dXvaJOgu4AQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 3C745593A9;
	Fri, 15 May 2026 06:37:57 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id IGlsDUW/BmorQgAAD6G6ig
	(envelope-from <tiwai@suse.de>); Fri, 15 May 2026 06:37:57 +0000
Date: Fri, 15 May 2026 08:37:56 +0200
Message-ID: <87jyt5uqij.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Nicholas Bonello <hadobedo@gmail.com>
Cc: perex@perex.cz,
	tiwai@suse.com,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: Re: [PATCH] ALSA: hda/realtek: Fix Legion 7 16ITHG6 speaker amp binding
In-Reply-To: <20260508225507.47667-1-hadobedo@gmail.com>
References: <20260508225507.47667-1-hadobedo@gmail.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/30.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spam-Flag: NO
X-Spam-Score: -3.30
X-Spamd-Result: default: False [-3.30 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	FROM_EQ_ENVFROM(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	RCVD_TLS_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid,imap1.dmz-prg2.suse.org:helo]
X-Spam-Level: 

On Sat, 09 May 2026 00:55:07 +0200,
Nicholas Bonello wrote:
> 
> The Lenovo Legion 7 16ITHG6 uses codec SSID 17aa:3855, but its PCI
> SSID is 17aa:3811.  The latter is now also used by the Legion S7 15IMH05
> quirk, which is matched before codec SSID fallback and incorrectly
> routes Legion 7 16ITHG6 machines to ALC287_FIXUP_LEGION_15IMHG05_SPEAKERS.
> 
> That fixup does not bind the CLSA0101 CS35L41 companion amplifiers,
> making the built-in speakers silent even though playback appears to be
> active.
> 
> Add a codec SSID quirk for 17aa:3855 before the conflicting PCI SSID
> quirk so that the Legion 7 16ITHG6 uses ALC287_FIXUP_LEGION_16ITHG6.
> This restores CS35L41 firmware loading and binds both speaker
> amplifiers.
> 
> Fixes: 67f4c61a73e9 ("ALSA: hda/realtek: Add quirk for Legion S7 15IMH")
> Cc: stable@vger.kernel.org
> Tested-by: Nicholas Bonello <hadobedo@gmail.com>
> Assisted-by: Codex:GPT-5
> Signed-off-by: Nicholas Bonello <hadobedo@gmail.com>

Thanks, applied now.


Takashi
