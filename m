Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CAE3253B4E
	for <linux-sound@vger.kernel.org>; Wed, 19 Mar 2025 11:36:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742384210; cv=none; b=KIw/sFYIxHOgjgp6nPCT3KnFGxb61ifCu5Vu4yK5LCqCBFiPTWdTO/twbROuVo9bYZJCXlZfyIrZwTA1iDSF8BGuPEc/oj4My1ms/4m8cFTbTS3rrMU/2a5c0vnts11syIkSbuQ+MwQPRKFSm1oAP0We4pjtWWaVWVzpwp+vRj0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742384210; c=relaxed/simple;
	bh=/I74AjAibVq/jFefYRozA1+rXjBi9dMBhxx+QalfiA4=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=hkeJBA6mHgCzCNBk5kpZ9uyvAt2A+olcp+p5Z2NvPhV7QfH3HGJ71lofHRxtXeId2C9GjrSyCYFfvCkYFANM39F5sehtspE6JG4it6WuZi5SUB4nwGpX3wurrc/p9oo4MIbvGnzHMBNL0CLQE0omGGJZ6FZzbFPB4uoX5T4oD9o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=ATCUOkah; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=WYR8kugo; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=ATCUOkah; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=WYR8kugo; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="ATCUOkah";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="WYR8kugo";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="ATCUOkah";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="WYR8kugo"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id B790D21C19;
	Wed, 19 Mar 2025 11:36:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1742384200; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=LHTUfmg6r5Dk1BYCeL/SVQSch2xgp8LlySvmYCX4ys0=;
	b=ATCUOkahQeWOZS8x1Z7HX/U19OjmZrJLGS859Fjllz4/jp8/aapeqzV98R++pK7ASLlmL+
	24eSUEXxELGokqYCK0xPvP98aOLnnvDl4qTp6+sT8NAHFfEh1+maE/B46z0ksolgIDmc70
	AkgbfQklGHzOOBT5suHmciYAYXUvExk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1742384200;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=LHTUfmg6r5Dk1BYCeL/SVQSch2xgp8LlySvmYCX4ys0=;
	b=WYR8kugoBVicfhtqunWR1V0MnSCZ8ZDChzt+3oqRbr1hFXCGIaMWtlOSY20qsP3cwyy63T
	/CSM3NzDonWknJAQ==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=ATCUOkah;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=WYR8kugo
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1742384200; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=LHTUfmg6r5Dk1BYCeL/SVQSch2xgp8LlySvmYCX4ys0=;
	b=ATCUOkahQeWOZS8x1Z7HX/U19OjmZrJLGS859Fjllz4/jp8/aapeqzV98R++pK7ASLlmL+
	24eSUEXxELGokqYCK0xPvP98aOLnnvDl4qTp6+sT8NAHFfEh1+maE/B46z0ksolgIDmc70
	AkgbfQklGHzOOBT5suHmciYAYXUvExk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1742384200;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=LHTUfmg6r5Dk1BYCeL/SVQSch2xgp8LlySvmYCX4ys0=;
	b=WYR8kugoBVicfhtqunWR1V0MnSCZ8ZDChzt+3oqRbr1hFXCGIaMWtlOSY20qsP3cwyy63T
	/CSM3NzDonWknJAQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 7EB3A13726;
	Wed, 19 Mar 2025 11:36:40 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id ImajHUis2mfhdwAAD6G6ig
	(envelope-from <tiwai@suse.de>); Wed, 19 Mar 2025 11:36:40 +0000
Date: Wed, 19 Mar 2025 12:36:40 +0100
Message-ID: <87ldt1z1yv.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Andres Urian Florez <andres.emb.sys@gmail.com>
Cc: perex@perex.cz,
	tiwai@suse.com,
	skhan@linuxfoundation.org,
	linux-sound@vger.kernel.org
Subject: Re: [PATCH] ALSA: echoaudio: remove unused variable
In-Reply-To: <20250319020515.22150-1-andres.emb.sys@gmail.com>
References: <20250319020515.22150-1-andres.emb.sys@gmail.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Rspamd-Queue-Id: B790D21C19
X-Spam-Score: -2.01
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.01 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	SUSPICIOUS_RECIPS(1.50)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_CONTAINS_FROM(1.00)[];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-0.998];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	TAGGED_RCPT(0.00)[];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	ARC_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[gmail.com];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	RCVD_TLS_ALL(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid,suse.de:dkim];
	RCVD_COUNT_TWO(0.00)[2];
	DKIM_TRACE(0.00)[suse.de:+]
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spam-Flag: NO
X-Spam-Level: 

On Wed, 19 Mar 2025 03:05:10 +0100,
Andres Urian Florez wrote:
> 
> This patch cleans up the code in the __snd_echo_probe function of the
> echoaudio.c driver by removing the unused variable i and moving the
> declaration of the loop variable i inside the foor loops where it is
> used
> 
> 
> Signed-off-by: Andres Urian Florez <andres.emb.sys@gmail.com>

Thanks, applied.


Takashi
