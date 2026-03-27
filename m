Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B55A53CF697
	for <linux-sound@vger.kernel.org>; Fri, 27 Mar 2026 09:09:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774602546; cv=none; b=LxlhOPopnsz8A+CsMmDNUgtQTCB5ItWrWMjJUgdkWTSJP7oHhC5QOkSOBCUgdCNchPbpo2Kxaodib6nA8iILLYkt/ZoaazSIuhgjXCMJAeUuFakQ+yEsXHtt/YnoamlyROSshDtBFSFtnmOPdaFiNkT73kkbC2YZpV0PcTiRw10=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774602546; c=relaxed/simple;
	bh=KcVIhl+/794I82jfyegthdB+WyhmbHjoDhRvJaTPpuc=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=q32LL1ot0PsETZHtBcxufjcihGCCcW2KXWXeZEJugZcckK7p/LO5ivSKez8gsAUuGEDojH7PPFMKcI8tOwy+Zp2fb/4FfT8SN5Yc7WVue7LAj60EKRhCFnMDbFpgv/eKG/s6WIovOG/U44EXFWSlh9emlBAbiq8/He0rF7JYKnk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=0/Ha+Rd4; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=M0HEnsoy; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=0/Ha+Rd4; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=M0HEnsoy; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="0/Ha+Rd4";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="M0HEnsoy";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="0/Ha+Rd4";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="M0HEnsoy"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id DC0924D1C7;
	Fri, 27 Mar 2026 09:08:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1774602537; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=7D+fgS2FGlpnlJ/ItsQ3N/NwkMpqTtZ8hX5uUdNjNPc=;
	b=0/Ha+Rd4LeRcZaDhXBT0YVb07y1qR5Tdw/3naVx4Xv0qzPmWFZWgA+effYChjIz4lUlRw8
	AZFh8vkpsMT5OM3/Wm1S8B6I+6dyobjJ7d4yN0LB2X7KwvZSKag+rY/4x6qKMQ62ASZ8HL
	Co/Qxkf2gEz3MpSy/F7VS5vhAuSb+As=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1774602537;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=7D+fgS2FGlpnlJ/ItsQ3N/NwkMpqTtZ8hX5uUdNjNPc=;
	b=M0HEnsoyiV8cwNnnUjllMP/z+QrUFUe+3OVtnojQhNDNiJOhyd5Oman4E5sol17xsV40EV
	uShBfzDGKFMMWmDw==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1774602537; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=7D+fgS2FGlpnlJ/ItsQ3N/NwkMpqTtZ8hX5uUdNjNPc=;
	b=0/Ha+Rd4LeRcZaDhXBT0YVb07y1qR5Tdw/3naVx4Xv0qzPmWFZWgA+effYChjIz4lUlRw8
	AZFh8vkpsMT5OM3/Wm1S8B6I+6dyobjJ7d4yN0LB2X7KwvZSKag+rY/4x6qKMQ62ASZ8HL
	Co/Qxkf2gEz3MpSy/F7VS5vhAuSb+As=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1774602537;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=7D+fgS2FGlpnlJ/ItsQ3N/NwkMpqTtZ8hX5uUdNjNPc=;
	b=M0HEnsoyiV8cwNnnUjllMP/z+QrUFUe+3OVtnojQhNDNiJOhyd5Oman4E5sol17xsV40EV
	uShBfzDGKFMMWmDw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id B65734A0A2;
	Fri, 27 Mar 2026 09:08:57 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id H1BDKylJxmnBCgAAD6G6ig
	(envelope-from <tiwai@suse.de>); Fri, 27 Mar 2026 09:08:57 +0000
Date: Fri, 27 Mar 2026 10:08:57 +0100
Message-ID: <87tsu1skpi.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Karsten Hohmeier <linux@hohmatik.de>
Cc: tiwai@suse.de,
	linux-kernel@vger.kernel.org,
	linux-sound@vger.kernel.org
Subject: Re: UBSAN: shift-out-of-bounds in sound/pci/ctxfi/cthw20k2.c:956:31
In-Reply-To: <20260321195621.16139-1-linux@hohmatik.de>
References: <87cy149n6k.wl-tiwai@suse.de>
	<20260321195621.16139-1-linux@hohmatik.de>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/30.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spamd-Result: default: False [-3.30 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_SHORT(-0.20)[-0.997];
	MIME_GOOD(-0.10)[text/plain];
	MIME_TRACE(0.00)[0:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	ARC_NA(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	FROM_EQ_ENVFROM(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid,imap1.dmz-prg2.suse.org:helo]
X-Spam-Flag: NO
X-Spam-Score: -3.30
X-Spam-Level: 

On Sat, 21 Mar 2026 20:56:21 +0100,
Karsten Hohmeier wrote:
> 
> Hello Takashi,
> 
> I applied your patch and uncommented the stack dumps.
> Here is what I get.
> 
> Mar 21 20:41:34 dtest kernel: XXX invalid type 9 for hw20k2

Thanks, this looks like the cause.
Could you try the following one-liner?


thanks,

Takashi

--- a/sound/pci/ctxfi/ctdaio.c
+++ b/sound/pci/ctxfi/ctdaio.c
@@ -118,6 +118,7 @@ static unsigned int daio_device_index(enum DAIOTYP type, struct hw *hw)
 		switch (type) {
 		case SPDIFOO:	return 0;
 		case SPDIFIO:	return 0;
+		case SPDIFI1:	return 1;
 		case LINEO1:	return 4;
 		case LINEO2:	return 7;
 		case LINEO3:	return 5;
