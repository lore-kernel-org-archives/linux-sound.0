Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E41BE23507B
	for <linux-sound@vger.kernel.org>; Thu, 20 Nov 2025 14:26:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763648779; cv=none; b=NLVzFWzHtre2YqGRqWG/O1TJDg4FkL+wJbwZfSaJYDLqYChsFVyatK0aHmdqkJ99wEAlg22zzjJ3orhQVbYTiRYrpU+ysaMbRFwXax4qcRft6kPsjQDfEwbcURbWtwizS+3MoRj0Jzjyk8b8/LcPyVrSj3xzLsL77OFCmzFaMkI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763648779; c=relaxed/simple;
	bh=ydL5QwBhJ7tgFc6gj5GTA68T8MV43cxWGByOJ07wfjo=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=llQmZLio8YI9dDOZ7rZ+dhX8kAx1mXEEVqNWfO+nr6ph2gAaCbw2yjEoqNqaoClBYqvRg/NNvTsKWHIUDxpgAYUCAqQk1ouRRqHq7vOpccEkMOS3y2XAwSMlO3cTDI+q7c2Jxxv+RV1w/DayfXNRHt9JwK7V8eXoKyrYp07Bz0k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=E0Kb/W1U; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=Rng+NZCJ; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=AIJbt65V; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=2iTKcoPZ; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="E0Kb/W1U";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="Rng+NZCJ";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="AIJbt65V";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="2iTKcoPZ"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id D6BA721265;
	Thu, 20 Nov 2025 14:26:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1763648776; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=VpFWa06gzSsbXi3ddaza1ARLPGFkdwaQy5Q/JoauHNk=;
	b=E0Kb/W1UGjmL1381/oryIyQbSn3A0FT6kq/3YiFbrsQh2T7Y7smXLSp+cBKc9rGaSfWwPY
	zDpfG8OVNWdzqw5eYLsWouqXPNx4sFTDN4nTI3ZTpm3eAT2pusx00R+RW4KVte0I3Za9aI
	PeMa3/ArCz3YSDNEKXsWOUeIHJeQIG0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1763648776;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=VpFWa06gzSsbXi3ddaza1ARLPGFkdwaQy5Q/JoauHNk=;
	b=Rng+NZCJAgS15Fr8/ufwomZ3koVSEpx7HsAmn/0W7IZm5sMqIOa+g08a4By5kmkA9CB8UK
	z3qQnRtmFFo+/VAg==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1763648775; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=VpFWa06gzSsbXi3ddaza1ARLPGFkdwaQy5Q/JoauHNk=;
	b=AIJbt65VM8bBhOxO9qLCA1+3/eIvV2dyeVc1ckrdyNk9Vqn9jtQ6ZMwrpMoKRxHUPtGOuG
	cHFgJvF7qMGHebmypLoxbIs5EVOjp0mx7UZUmfInyWtoAsq8fcRi1c/TLLzDgjjyq1GZye
	+Jyv6rcafHgKG95rmG8hvMxB2kXcKsw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1763648775;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=VpFWa06gzSsbXi3ddaza1ARLPGFkdwaQy5Q/JoauHNk=;
	b=2iTKcoPZOSV2/Ct4MTWW8Fkj1vKJ49tMUHEUKbMts/BIAslhcM/ZF/i2+7lpX4GOxYe4LP
	tLNtn0j1UWKkDCAQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id A8EA13EA61;
	Thu, 20 Nov 2025 14:26:15 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id y18XKAclH2kTRgAAD6G6ig
	(envelope-from <tiwai@suse.de>); Thu, 20 Nov 2025 14:26:15 +0000
Date: Thu, 20 Nov 2025 15:26:15 +0100
Message-ID: <87zf8g4w6w.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: =?ISO-8859-1?Q?Ren=E9?= Rebe <rene@exactco.de>
Cc: linux-sound@vger.kernel.org,
	Takashi Iwai <tiwai@suse.com>,
	Kailang Yang <kailang@realtek.com>
Subject: Re: [PATCH V2] ALSA: realtek/alc288 fix headphone for MS Surface 2/3
In-Reply-To: <20251120.124240.139462482701146043.rene@exactco.de>
References: <20251120.124240.139462482701146043.rene@exactco.de>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/30.1 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 8bit
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:email,suse.de:mid]
X-Spam-Flag: NO
X-Spam-Score: -3.30
X-Spam-Level: 

On Thu, 20 Nov 2025 12:42:40 +0100,
René Rebe wrote:
> 
> The Surface Pro 2 and 3 have a strange headphone frequency response
> and miss most of the bass. I discovered connecting the HP out to the
> main DAC fixes this. Maybe the other is mono or intentionally filtered
> signal for the built-in speakers? (At least the Lenovo Ideapad 720S
> (AMD) (0x17aa, 0x3812) exhibited the same problem, but I don't have it
> anymore for testing V2 changes.)
> 
> Signed-off-by: René Rebe <rene@exactco.de>
> Co-developed-by: Takashi Iwai <tiwai@suse.com>
> ---
> V2: use preferred_pairs instead of directly writing verbs

Applied now.  Thanks.


Takashi
