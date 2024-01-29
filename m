Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 844C653801
	for <linux-sound@vger.kernel.org>; Mon, 29 Jan 2024 08:06:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706515586; cv=none; b=Kx9/5rFZOCvV8q/oWQyx7AiAirguVCjvEwNAKHN0d2AZz0iUCkKn3LUDe5NvFzmt3c+SzrYAKyNDNticy+IICQDFXoSj+RXiwjQhsfD+/CdLOloRHSHZK1UbmxJveKiMFKNkpmGESNQJGfg/nP3GyY7QFJMuXeY4g8WrTpkrCeM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706515586; c=relaxed/simple;
	bh=eLnHlNQCTabSovyFAty4+4kU2dSjZiltt6eo3Dq2hYg=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ldSArVEadW5gCNpX14gEMf6IPzZcrFEmFxQ2p7+lir6FgLbpFL2498bpPJ2V3CCtErF9+5Ar/WLXVyIBLBWUdh7wg/6Y8zL2aTc2uOSnmcOtpoiYH6JSevMv+N6Tcf6BSMbzBhFDSo50/aQXPJW4UkQjcNxUaKxmfVRVR0BBUIY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=kuBenNe2; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=ubhXF8BK; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=kuBenNe2; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=ubhXF8BK; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="kuBenNe2";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="ubhXF8BK";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="kuBenNe2";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="ubhXF8BK"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 8FCD11FCF0;
	Mon, 29 Jan 2024 08:06:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1706515581; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=UkpMHUCPiSHUXT8Rd0J4WyNNCLXedpeh1w8EiwDFSgs=;
	b=kuBenNe2JqQCj6+gbDgIWp0zmH3VQCtRYTBeLgok14/yWKCTgZKp90SrsZ5O1zZ40LrNbT
	M0fLxl2DIYFTD9p1GA+5k9Z6wY1ppMqyYz6XK7qrxH150qXabECeuoqnmVOGXTOAR3rtGQ
	1Mbpw/oWm7+arP5s8jMY04sihCS9/is=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1706515581;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=UkpMHUCPiSHUXT8Rd0J4WyNNCLXedpeh1w8EiwDFSgs=;
	b=ubhXF8BKPKDlMKybC9qOfb10XvGSWM80w6iJvkKTNWryGIlQz6JZ9b2QwI+hLPQzXsnbfX
	PLxKKHxxywlmzRCQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1706515581; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=UkpMHUCPiSHUXT8Rd0J4WyNNCLXedpeh1w8EiwDFSgs=;
	b=kuBenNe2JqQCj6+gbDgIWp0zmH3VQCtRYTBeLgok14/yWKCTgZKp90SrsZ5O1zZ40LrNbT
	M0fLxl2DIYFTD9p1GA+5k9Z6wY1ppMqyYz6XK7qrxH150qXabECeuoqnmVOGXTOAR3rtGQ
	1Mbpw/oWm7+arP5s8jMY04sihCS9/is=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1706515581;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=UkpMHUCPiSHUXT8Rd0J4WyNNCLXedpeh1w8EiwDFSgs=;
	b=ubhXF8BKPKDlMKybC9qOfb10XvGSWM80w6iJvkKTNWryGIlQz6JZ9b2QwI+hLPQzXsnbfX
	PLxKKHxxywlmzRCQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 6A23312FF7;
	Mon, 29 Jan 2024 08:06:21 +0000 (UTC)
Received: from dovecot-director2.suse.de ([10.150.64.162])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id OTRXGH1ct2W6WwAAD6G6ig
	(envelope-from <tiwai@suse.de>); Mon, 29 Jan 2024 08:06:21 +0000
Date: Mon, 29 Jan 2024 09:06:21 +0100
Message-ID: <87plxkmuma.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: David Senoner <seda18@rolmail.net>
Cc: tiwai@suse.com,
	perex@perex.cz,
	linux-sound@vger.kernel.org
Subject: Re: [PATCH] ALSA: hda/realtek: Fix the external mic not being recognised for Acer Swift 1 SF114-32
In-Reply-To: <20240126155626.2304465-1-seda18@rolmail.net>
References: <20240126155626.2304465-1-seda18@rolmail.net>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
Authentication-Results: smtp-out2.suse.de;
	none
X-Spam-Level: 
X-Spam-Score: -2.37
X-Spamd-Result: default: False [-2.37 / 50.00];
	 ARC_NA(0.00)[];
	 RCVD_VIA_SMTP_AUTH(0.00)[];
	 FROM_HAS_DN(0.00)[];
	 RCPT_COUNT_THREE(0.00)[4];
	 TO_DN_SOME(0.00)[];
	 TO_MATCH_ENVRCPT_ALL(0.00)[];
	 MIME_GOOD(-0.10)[text/plain];
	 NEURAL_HAM_LONG(-0.94)[-0.944];
	 RCVD_COUNT_THREE(0.00)[3];
	 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	 NEURAL_HAM_SHORT(-0.20)[-1.000];
	 MID_CONTAINS_FROM(1.00)[];
	 FUZZY_BLOCKED(0.00)[rspamd.com];
	 FROM_EQ_ENVFROM(0.00)[];
	 MIME_TRACE(0.00)[0:+];
	 RCVD_TLS_ALL(0.00)[];
	 BAYES_HAM(-2.12)[95.76%]
X-Spam-Flag: NO

On Fri, 26 Jan 2024 16:56:26 +0100,
David Senoner wrote:
> 
> If you connect an external headset/microphone to the 3.5mm jack on the
>   Acer Swift 1 SF114-32 it does not recognize the microphone. This fixes
>   that and gives the user the ability to choose between internal and
>   headset mic.
> 
> Signed-off-by: David Senoner <seda18@rolmail.net>

Thanks, applied now.


Takashi
