Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6D092AE86;
	Sun, 29 Dec 2024 08:27:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735460881; cv=none; b=kDVWPmHAHQeat/04NzVumXK/c1NycZBhp2GnRm0cqkRijzq3YapWBI+Bo67dkYAiTs3lWEbAt667E3de9tJiRETvDVyiFVf3Qtd/GJN8ocRhamZyFpwEttv8jyOBJC1Pwe1KbT5XoSqH5kbVm6AL+8uexHVN0vidG2vX/l86/lw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735460881; c=relaxed/simple;
	bh=jKuYcP9Y7MqeNSBRn9B2BXt5tU15fSlWpZfNUZybc8s=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=SaqLh34X/aT1VlTbJGodw4bb5+3m7cwqurPdkN00SEhvUQPt2Gj+MqCCLBwnn+GRPNqlEv0kgx30F/Cxr4Oq0bbyk3VJs+1NUKQqhd4XnPDMdKP/EIecnznDeuMLJnq/S7j7/CGZBinIN1pJmnQDTjyY43Wl4OWP8+ttnT7zIzo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=1gPaqQRJ; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=4NrMWJZA; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=Ah+fLONl; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=IzzF7bDl; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="1gPaqQRJ";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="4NrMWJZA";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="Ah+fLONl";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="IzzF7bDl"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id F002A336E2;
	Sun, 29 Dec 2024 08:27:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1735460878; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=5W+UKV8qb3yj6M2vaNnrU5Z39zv5kHvGAyiK9yKLIm4=;
	b=1gPaqQRJTVoNRmvIYehvYIqICqTCnzUstPBPwhUeJw+4kOjC+tTV/FBtVYnYW8+DvZe5Nc
	0bgnA63wRDgDicQkXPVJneIeEJaLkvRAAahzUqBBWbfHRmxLvYIeCo2BZ+Yf7W0tCzPCIL
	+QHv505QBZV9QuA4CDj4bWAdwfBG3vQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1735460878;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=5W+UKV8qb3yj6M2vaNnrU5Z39zv5kHvGAyiK9yKLIm4=;
	b=4NrMWJZADO7JppwAcr645pe2oUOBi6xtsUPllDaEpaqxfFnsfBqgjt/kHUWn5Hc1xe2ybh
	iqwfXzszBENCGGDw==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1735460877; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=5W+UKV8qb3yj6M2vaNnrU5Z39zv5kHvGAyiK9yKLIm4=;
	b=Ah+fLONlfh++Cd410SzqJghRlkKmua8Thnrnt91DNy9JJUFahaouvsoRPyPkn13PoAe47Y
	1PqcTBhWpbw07iUvCS9Va9isGMmKWKGr3qz3OScYSqOyoHqLJ9+TNkiHD/b1gB/A+vLldI
	1rm6Cy8EbQndPqTAaMIja2FU9UaeBUo=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1735460877;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=5W+UKV8qb3yj6M2vaNnrU5Z39zv5kHvGAyiK9yKLIm4=;
	b=IzzF7bDltjrCjTC1Fd8cvnGbdgdlwn4F2mIINnQUgh02T+Sce1MW932pF5BdW50Zfwq5h6
	rxB1DBNObyOypzBQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id A7D27139D0;
	Sun, 29 Dec 2024 08:27:57 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id 0hsiJw0IcWcaQQAAD6G6ig
	(envelope-from <tiwai@suse.de>); Sun, 29 Dec 2024 08:27:57 +0000
Date: Sun, 29 Dec 2024 09:27:57 +0100
Message-ID: <87r05qdhbm.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Tanya Agarwal <tanyaagarwal25699@gmail.com>
Cc: perex@perex.cz,
	tiwai@suse.com,
	onkel@paraair.de,
	Markus.Elfring@web.de,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	skhan@linuxfoundation.org,
	anupnewsmail@gmail.com
Subject: Re: [PATCH V2] ALSA: usb-audio: US16x08: Initialize array before use
In-Reply-To: <20241229060240.1642-1-tanyaagarwal25699@gmail.com>
References: <20241229060240.1642-1-tanyaagarwal25699@gmail.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spam-Score: -3.30
X-Spamd-Result: default: False [-3.30 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	FREEMAIL_TO(0.00)[gmail.com];
	RCPT_COUNT_SEVEN(0.00)[9];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	ARC_NA(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FREEMAIL_ENVRCPT(0.00)[gmail.com,web.de];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[perex.cz,suse.com,paraair.de,web.de,vger.kernel.org,linuxfoundation.org,gmail.com];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_EQ_ENVFROM(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid]
X-Spam-Flag: NO
X-Spam-Level: 

On Sun, 29 Dec 2024 07:02:42 +0100,
Tanya Agarwal wrote:
> 
> From: Tanya Agarwal <tanyaagarwal25699@gmail.com>
> 
> Initialize meter_urb array before use in mixer_us16x08.c.
> 
> CID 1410197: (#1 of 1): Uninitialized scalar variable (UNINIT)
> uninit_use_in_call: Using uninitialized value *meter_urb when
> calling get_meter_levels_from_urb.
> 
> Coverity Link:
> https://scan7.scan.coverity.com/#/project-view/52849/11354?selectedIssue=1410197
> 
> Fixes: d2bb390a2081 ("ALSA: usb-audio: Tascam US-16x08 DSP mixer quirk")
> Signed-off-by: Tanya Agarwal <tanyaagarwal25699@gmail.com>

Applied now.  Thanks.


Takashi
