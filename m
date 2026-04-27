Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 785673B6343
	for <linux-sound@vger.kernel.org>; Mon, 27 Apr 2026 12:22:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777292534; cv=none; b=TSf+gZvihmQSJnKxqA1MPGP7IEtk+g36dfHMhCa//f+tp+pQ8fCjnCPmPfU/GBwkr8yVsetH2gxBSoZPGG0LoDf//NTAZBr1QotKbMcj84q/IQsSbTPT21HA6CRmHcbD+dC7nEqmfLvKPXI9q0ShEYIqc67cWNhzgRPBPMoJgO0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777292534; c=relaxed/simple;
	bh=QG8GubXGKYPk2YdskIbRmTiitCMvsfmAfiFp2u+cu2s=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=EEtgxNUb7cMQTeoiRmAKJK8p2wBKcp+oVi4Z1tWyagYVbpAqg0HXSJCHE0pssTY13MLVaxiBhA45NAA9d1+kCgcDGtz/A/FXzP32eedm5yCDzof6MZAHEVHSA5KMxP7L55et7Htd2/JGBe1uKpgc/j0Kjhz+z6rmxYch8cM00O4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=xypFgYF4; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=Lu5ti9Bb; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=xypFgYF4; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=Lu5ti9Bb; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="xypFgYF4";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="Lu5ti9Bb";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="xypFgYF4";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="Lu5ti9Bb"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id BF4C16A824;
	Mon, 27 Apr 2026 12:22:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1777292530; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=ghDwOhRR36Uc/GQElVvdbbHDBs5qGYqV12Qb/2XUhz4=;
	b=xypFgYF45sUE7CYV3JA75hhFrqDGoOUAlzE1yFsnheUnhLu4MzyNynWS7u27w+4qr0Eddb
	IEKBZQpkEVkUOXZZxc9xR7dHjQIuA+3RirZgU/w/SY25iRXFIa8G3iFJgZgp8og835yXSC
	Rb1zrpyxiaTpiZ4oQjkUbsqNpw0zDDw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1777292530;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=ghDwOhRR36Uc/GQElVvdbbHDBs5qGYqV12Qb/2XUhz4=;
	b=Lu5ti9BbvjCViuxbMgCAZaGg+5Qp7xlAeFnmKu+xm/1b4QWjqaXT+XN3aqe8grr+c8l0ch
	reqMPkwqFwTnxyCg==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1777292530; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=ghDwOhRR36Uc/GQElVvdbbHDBs5qGYqV12Qb/2XUhz4=;
	b=xypFgYF45sUE7CYV3JA75hhFrqDGoOUAlzE1yFsnheUnhLu4MzyNynWS7u27w+4qr0Eddb
	IEKBZQpkEVkUOXZZxc9xR7dHjQIuA+3RirZgU/w/SY25iRXFIa8G3iFJgZgp8og835yXSC
	Rb1zrpyxiaTpiZ4oQjkUbsqNpw0zDDw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1777292530;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=ghDwOhRR36Uc/GQElVvdbbHDBs5qGYqV12Qb/2XUhz4=;
	b=Lu5ti9BbvjCViuxbMgCAZaGg+5Qp7xlAeFnmKu+xm/1b4QWjqaXT+XN3aqe8grr+c8l0ch
	reqMPkwqFwTnxyCg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 9C93C593B0;
	Mon, 27 Apr 2026 12:22:10 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id IojzJPJU72m9EgAAD6G6ig
	(envelope-from <tiwai@suse.de>); Mon, 27 Apr 2026 12:22:10 +0000
Date: Mon, 27 Apr 2026 14:22:10 +0200
Message-ID: <87bjf4zj7x.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: "Geoffrey D. Bennett" <g@b4.vu>
Cc: Takashi Iwai <tiwai@suse.de>,
	Takashi Iwai <tiwai@suse.com>,
	linux-sound@vger.kernel.org
Subject: Re: [PATCH 0/2] ALSA: scarlett2: Gen 4 firmware 2417 follow-up
In-Reply-To: <cover.1777153011.git.g@b4.vu>
References: <cover.1777153011.git.g@b4.vu>
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
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ARC_NA(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
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

On Sat, 25 Apr 2026 23:39:45 +0200,
Geoffrey D. Bennett wrote:
> 
> Hi Takashi,
> 
> This is a small follow-up to the "Fix 2i2 Gen 4 direct monitor on
> firmware 2417" series, exposing two features added by that firmware:
> a new autogain exit code, and the front-panel brightness/sleep
> controls.
> 
> Depends on the prior series for the config_sets[] machinery.
> 
> Tested on Scarlett 4th Gen Solo, 2i2, and 4i4 with firmware 2417.
> 
> Regards,
> Geoffrey
> 
> Geoffrey D. Bennett (2):
>   ALSA: scarlett2: Add Gen 4 firmware 2417 autogain status text
>   ALSA: scarlett2: Add Gen 4 firmware 2417 front-panel controls

Applied to for-next branch.  Thanks.


Takashi
