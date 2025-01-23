Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FD7220E009
	for <linux-sound@vger.kernel.org>; Thu, 23 Jan 2025 11:07:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737630431; cv=none; b=j3MjhrPxMIDlG5kHJj6kQ8lw2FlZx8ifd44eBCLYWz5aOAe6NmCkCHiiRwZby2wVq9kRH+8QuQ52VFQqOaLnktY2T3LFLUFVkmhsRCVLtYCZZkJXiHogwuRpQMpbtDG4wj1WQ4LBF1NbehF3QMunuV5RE9yB6Zrq/MRyfxuDfaI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737630431; c=relaxed/simple;
	bh=Z/P8Xk0WYUWtkjQ0aao8VmmmuejBcjV5biBJ7cU1/S0=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=t1DCu9IQr9r7HnccmgU3/OyJtP3UHi/BXiUi/GyRD9MvP+jiHHhBeiAEPzl0HdC9kz90jp/mEyZCsPV/pNAX8TM1Cw+BPjNvpkHnIEiipfHjr6wiQ0hiOtRITg9oXTRm5bkc14W+mu42H1yca6ivZAwKaQidfjKtZALH/RQrKLU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=r8H7w/uk; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=DV2+yEXa; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=tDJVPjf9; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=ifMJWqSK; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="r8H7w/uk";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="DV2+yEXa";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="tDJVPjf9";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="ifMJWqSK"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id EB16C1F38C;
	Thu, 23 Jan 2025 11:07:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1737630422; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=LPjvTNJJVtvMqmKzJ9Ni/FhTWlMPmN4AxGNuJ3KP7Bk=;
	b=r8H7w/ukQ/cPmJcE04BaQvJdYvu7I41jZyflqPAMvXQQ5v7+GXYtjX8HNz3MNnVXEeBHwq
	avxRtajqm9WzeZQPapo33bTtVcffsaJhddco2eZPBqc0A3UpBCa6d/TETda+MUydvOTeO1
	x5Gx10CrXRQ+iRkAseqts9tIt2ynSGQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1737630422;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=LPjvTNJJVtvMqmKzJ9Ni/FhTWlMPmN4AxGNuJ3KP7Bk=;
	b=DV2+yEXafZOe/SUWfRq5YclTemHnwzGcCVES5RKd5ewW1fF2mgBenaGuq3lr1meONYlcXd
	ea1nspmefWxqfvCQ==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1737630421; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=LPjvTNJJVtvMqmKzJ9Ni/FhTWlMPmN4AxGNuJ3KP7Bk=;
	b=tDJVPjf9spvfGPO0kdRYcL4qDrR/L0xHUzm2Ld6RbatJmAMS3j0lglmYpmGeecug/Gup3p
	xyFwmDreBUA/VMjouWLBhPwfynK/GLW9M6P3Fg3Mg4161LwRupqi5sjDVT9vih4gLMBlLK
	1uYI4apK6zqXpbnc0ed0BwrG8qS5yYM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1737630421;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=LPjvTNJJVtvMqmKzJ9Ni/FhTWlMPmN4AxGNuJ3KP7Bk=;
	b=ifMJWqSKKDKT54uewX+oVg6q19ZWvjvgc5NTknkKwjZGnjDtUAIyfJ5MPW8ojaYr8KE1oa
	D5my03QXcXgE76CA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id CAC06136A1;
	Thu, 23 Jan 2025 11:07:01 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id l6gxMNUikmeCLQAAD6G6ig
	(envelope-from <tiwai@suse.de>); Thu, 23 Jan 2025 11:07:01 +0000
Date: Thu, 23 Jan 2025 12:07:01 +0100
Message-ID: <87a5bh6b6y.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Samantha Glocker <iam@anislandsomewhere.com>
Cc: Takashi Iwai <tiwai@suse.de>,
	linux-sound@vger.kernel.org
Subject: Re: possible issue with ALSA: hda/realtek: Use codec SSID matching for Lenovo devices
In-Reply-To: <CAGPQRHaDRLTRisn68TA26sBM1PKVoUcDsKSQVrCsR7MinQbSmQ@mail.gmail.com>
References: <CAGPQRHYd48U__UKYj2jJnT4+dnNNoWRBi+wj6zPRn=JpNMBUrg@mail.gmail.com>
	<87a5bj8gax.wl-tiwai@suse.de>
	<878qr38g6r.wl-tiwai@suse.de>
	<87v7u76xhl.wl-tiwai@suse.de>
	<CAGPQRHaDRLTRisn68TA26sBM1PKVoUcDsKSQVrCsR7MinQbSmQ@mail.gmail.com>
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
	MIME_TRACE(0.00)[0:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	ARC_NA(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	RCPT_COUNT_THREE(0.00)[3];
	FROM_HAS_DN(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_EQ_ENVFROM(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid]
X-Spam-Flag: NO
X-Spam-Level: 

On Thu, 23 Jan 2025 03:00:29 +0100,
Samantha Glocker wrote:
> 
> Hi Takashi,
> 
> Yes confirming it's a regression. I haven't raised it on bug tracker
> because I was pretty sure I'd located the regression as above.
> 
> Sound was working on 6.12.4, and non-working from 6.12.5 (thru 6.12.10)

What exactly do you mean as "sound was working (or non-working)"?
I suppose it's about the speaker output.  Or anything else broken?
The symptom needs to be reported more clearly -- only few people own
crystal balls.


thanks,

Takashi
