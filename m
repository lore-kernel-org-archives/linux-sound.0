Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60B682E764E
	for <linux-sound@vger.kernel.org>; Mon, 27 Oct 2025 08:59:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761555586; cv=none; b=KV76a0g383Xq/M4oCfoMHoVtm8pbt5jP7YT00VmeGT19VZQzhxX/v31lfXMQ6Kddng1ZHN9Ec8QLy0ch1q/GX5Qo33LHlZyPyzgvSLhpfXhydRNalJWusss1Ig34LyDKneiK4ykUW4rClMb5DtLk+0keynqplSuPLKXm+CwVXNM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761555586; c=relaxed/simple;
	bh=Fr3Ih41NdZI3LuYaEBjLrhu63HXbYQ+0pYu8mLZtKyQ=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=lxYora73zYLng2VUllCL5RFqU0WcDhmecK5F5OUTb+Jdz0Vy6Lw3VfVZzhKImbOpWOieV7WBZ6LHcb8MW21qeHQfV87/K06qp/t4J/NuVyBOOloeNMPAfxtgnpVR2bpyf+XnxQC+dLQF8Gin0IhQ+P0dZCVWEusXnHOwPfzdPOI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=dydpZv/w; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=s9POk/3+; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=dydpZv/w; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=s9POk/3+; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="dydpZv/w";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="s9POk/3+";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="dydpZv/w";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="s9POk/3+"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 8BE7221A57;
	Mon, 27 Oct 2025 08:59:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1761555583; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=olfN+gz3xIXVKmQ5nKu1A+e0BKiORLWSARZVd6xBzfM=;
	b=dydpZv/wAv/7MMJk3r9Jg/a72TQwPja/VAG3qGj0U5zW3Nu+FmVCewcO9MI9FM1DmbI+O0
	2G87NRtLjtfS9cSEDPcOKs2ypPWr+UldFwiTF4OOMcRQlZkRjJLbS6zCgUmToWym3xftG4
	pyKdDlzwC5nIfXCeb4Z3TcJkylhzHSg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1761555583;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=olfN+gz3xIXVKmQ5nKu1A+e0BKiORLWSARZVd6xBzfM=;
	b=s9POk/3+z2hqEv8uzlpuFFVfdYnwcHkPVaCqin01hpnBeP5NLz/N0ka9Hb1RtYHP2adPAk
	6ZJf4ZPtiw3wseCA==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b="dydpZv/w";
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b="s9POk/3+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1761555583; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=olfN+gz3xIXVKmQ5nKu1A+e0BKiORLWSARZVd6xBzfM=;
	b=dydpZv/wAv/7MMJk3r9Jg/a72TQwPja/VAG3qGj0U5zW3Nu+FmVCewcO9MI9FM1DmbI+O0
	2G87NRtLjtfS9cSEDPcOKs2ypPWr+UldFwiTF4OOMcRQlZkRjJLbS6zCgUmToWym3xftG4
	pyKdDlzwC5nIfXCeb4Z3TcJkylhzHSg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1761555583;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=olfN+gz3xIXVKmQ5nKu1A+e0BKiORLWSARZVd6xBzfM=;
	b=s9POk/3+z2hqEv8uzlpuFFVfdYnwcHkPVaCqin01hpnBeP5NLz/N0ka9Hb1RtYHP2adPAk
	6ZJf4ZPtiw3wseCA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 683A0136CF;
	Mon, 27 Oct 2025 08:59:43 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id RAQqGH80/2hHPwAAD6G6ig
	(envelope-from <tiwai@suse.de>); Mon, 27 Oct 2025 08:59:43 +0000
Date: Mon, 27 Oct 2025 09:59:42 +0100
Message-ID: <87ldkw3ekh.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Roy Vegard Ovesen <roy.vegard.ovesen@gmail.com>
Cc: linux-sound@vger.kernel.org,
	Takashi Iwai <tiwai@suse.com>,
	Xj <xj@wp.pl>
Subject: Re: [PATCH] ALSA: usb-audio: don't log messages meant for 1810c when initializing 1824c
In-Reply-To: <aPaYTP7ceuABf8c7@ark>
References: <aPaYTP7ceuABf8c7@ark>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spam-Level: 
X-Spam-Flag: NO
X-Rspamd-Queue-Id: 8BE7221A57
X-Rspamd-Action: no action
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spamd-Result: default: False [-2.01 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	SUSPICIOUS_RECIPS(1.50)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_CONTAINS_FROM(1.00)[];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	FREEMAIL_TO(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FREEMAIL_ENVRCPT(0.00)[gmail.com,wp.pl];
	FREEMAIL_CC(0.00)[vger.kernel.org,suse.com,wp.pl];
	RCVD_TLS_ALL(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	TAGGED_RCPT(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DKIM_TRACE(0.00)[suse.de:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo,suse.de:dkim,suse.de:mid]
X-Spam-Score: -2.01

On Mon, 20 Oct 2025 22:15:08 +0200,
Roy Vegard Ovesen wrote:
> 
> The log messages for the PreSonus STUDIO 1810c about
> device_setup are not applicable to the 1824c, and should
> not be logged when 1824c initializes.
> 
> Refactor from if statement to switch statement as there
> might be more STUDIO series devices added later.
> 
> Fixes: 080564558eb1 ("ALSA: usb-audio: enable support for Presonus Studio 1824c within 1810c file")
> Signed-off-by: Roy Vegard Ovesen <roy.vegard.ovesen@gmail.com>

Applied now.  Thanks.


Takashi
