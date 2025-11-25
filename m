Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA1201C84BD
	for <linux-sound@vger.kernel.org>; Tue, 25 Nov 2025 14:55:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764082558; cv=none; b=NeWJXMQ+zv/1mo6CusjX2gAbPCLKyZjeVKxC25VWKhXOnFRCcCoVQSSl/v9ZuOyhrQoneReUGBSR6VR9swuQFuo1GIHMF6qJIadqaXRd1C8WRTIUkX8qp7/hLwMR9kN1k8PLk1CE+ciopY/t+0tAjH8mbbNG7spMvsgcy4dbIGQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764082558; c=relaxed/simple;
	bh=uoBvePrYgrPmJfkrNvV8GsAxRALZEFztpuJ4SUEySms=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=KSbf6c0zPDuVgMkIG4LLARsZaQIfHw7kmGHhTdRM8Ziru+fvc1E+aoxh2nIy/SfCcbWp01foJcBQ/aaXWh6nlk1yRWgOft158WhDkCbwEwhntmj0JdI5kaROz5A3ACexMRI9QN00pvde++KkKDUokSGmDQXXC3oOLC72lmdVHTI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=D98M0awj; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=1ElxR4S9; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=1KBxEmNa; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=XNII3yFM; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="D98M0awj";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="1ElxR4S9";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="1KBxEmNa";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="XNII3yFM"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id C7EC75BDA2;
	Tue, 25 Nov 2025 14:55:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1764082555; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=6deIwC0coANiN1/Z8BE/dilGVhME+ByCnGoEkrLx6Mc=;
	b=D98M0awjpEU+ft6+7IEJ/ozCmG68IHFCBqFHoz4ck1DhjFUx8ryexsRY4UN/GrZQyX0y2p
	meSW7Djqay8FSLNfTs76EdS1G8AECTrVKyjNtpdgoCb4JGxBQ90RSbm567mPGNp4CFUvDk
	bbqNFSRZmP1Qlz7fXhQAR+8zXSzxhhc=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1764082555;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=6deIwC0coANiN1/Z8BE/dilGVhME+ByCnGoEkrLx6Mc=;
	b=1ElxR4S9PQ2KnrTnZuVyMZicaYTGopxiC0vNkIEUNSmtR/oMxbYVDmC01eN/k1c/RmctWJ
	sOq9VBDxWSEohBAg==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=1KBxEmNa;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=XNII3yFM
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1764082554; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=6deIwC0coANiN1/Z8BE/dilGVhME+ByCnGoEkrLx6Mc=;
	b=1KBxEmNaCCGN6W5vijKQWGKEigI+v2XOMpxVRAn6DRNAsniNeUf5syMm/iuAE8Ss9vLbl1
	WIK7q8IZlmAMa6QJb7b67bIeRpFNBhothdwl/Z0uS8khtFmdY0QJppe6726mpKris9sqvh
	0GMI6Pfm6WU4Vlv925L8jsp/9TtgsOI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1764082554;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=6deIwC0coANiN1/Z8BE/dilGVhME+ByCnGoEkrLx6Mc=;
	b=XNII3yFMd/ctAgib5sA30t0n8lq8UT5IwZHwutHsemiQzRoI2HUXtNOzY818i38KluRiCx
	/Nth7Yk23/pZUkBw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id A88CA3EA63;
	Tue, 25 Nov 2025 14:55:54 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id q/ysJ3rDJWlWAQAAD6G6ig
	(envelope-from <tiwai@suse.de>); Tue, 25 Nov 2025 14:55:54 +0000
Date: Tue, 25 Nov 2025 15:55:54 +0100
Message-ID: <874iqip3et.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: =?ISO-8859-1?Q?Ren=E9?= Rebe <rene@exactco.de>
Cc: linux-sound@vger.kernel.org,
	Takashi Iwai <tiwai@suse.com>
Subject: Re: [PATCH] ALSA: usb-audio fix uac2 clock source
In-Reply-To: <20251125.154149.1121389544970412061.rene@exactco.de>
References: <20251125.154149.1121389544970412061.rene@exactco.de>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/30.1 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 8bit
X-Spam-Level: 
X-Spam-Flag: NO
X-Rspamd-Queue-Id: C7EC75BDA2
X-Rspamd-Action: no action
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spamd-Result: default: False [-3.51 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_CONTAINS_FROM(1.00)[];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	ARC_NA(0.00)[];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_THREE(0.00)[3];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo];
	DKIM_TRACE(0.00)[suse.de:+]
X-Spam-Score: -3.51

On Tue, 25 Nov 2025 15:41:49 +0100,
René Rebe wrote:
> 
> Since 8b3a087f7f65 ("ALSA: usb-audio: Unify virtual type units type to
> UAC3 values") usb-audio is using UAC3_CLOCK_SOURCE instead of
> bDescriptorSubtype, later refactored with e0ccdef9265 ("ALSA: usb-audio:
> Clean up check_input_term()") into parse_term_uac2_clock_source().
> 
> This breaks the clock source selection for at least my
> 1397:0003 BEHRINGER International GmbH FCA610 Pro.
> 
> Fix by using UAC2_CLOCK_SOURCE in parse_term_uac2_clock_source().
> 
> Fixes: 8b3a087f7f65 ("ALSA: usb-audio: Unify virtual type units type to UAC3 values")
> Signed-off-by: René Rebe <rene@exactco.de>
> ---
> Tested and shipped since 2022-07-24 in T2/Linux.

Applied now.  Thanks.


Takashi
