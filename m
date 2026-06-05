Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A46D47ECF5
	for <linux-sound@vger.kernel.org>; Fri,  5 Jun 2026 11:14:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780658096; cv=none; b=iCdv8lPBrwB9Fh74nJcvVTXtiQ6p6xAH9kEtVhdKincjIo45Dda1UwsncjKuA7QMPyZBbfOX/p/DgffAoj7xc9KgFU+0HppkSjZCHdKAm7j++b6T/B3Uq2HCqdDomFHOD/s3j7A1e2OYWn5bTrUBSzSfprSQ/grb38r1OArhkBQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780658096; c=relaxed/simple;
	bh=EmAxi0dy8XN2ZS2UaSQ6lFm5syiiZ9+VWwhsuIG79/M=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=B4WL3BGJhuA6IeP1sDpHRxXBux/UpjCtHLGwdPX9YdJVccEh/ubDOG27c+A3zUqQ+6XwILNtG4kZfEXOTIcKwsNucSptJov4G+E+ZKmvsyZHm5thecksUSEItfjGn8uMSaHnZvy4paYeA/HPQgZ18RYx3O2vgGbigIQ9GIKvyik=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=RGuj9ZHm; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=tiGIt6cA; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=RGuj9ZHm; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=tiGIt6cA; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="RGuj9ZHm";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="tiGIt6cA";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="RGuj9ZHm";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="tiGIt6cA"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 88EF76B24D;
	Fri,  5 Jun 2026 11:14:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1780658093; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=3YCdUF9pUzumwZW8AJ7mjfGIGEUiBosrt854yz49E8Y=;
	b=RGuj9ZHmIlkR3TMiOmmE5YZF7cVk8A+ZcHqmBCiY+s7A9MzJGjyTL5OqUSEY0vWNVm75I1
	uLT3It5UeRMmAgGVOS4EtBDDMx3gcfqA4QgsdmMLzJRXInYM7xD2BZxxkQtcx/PA9GAnnw
	RSZ6/zj3Hhm50WMuVbDNuNvMz4MI8Rg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1780658093;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=3YCdUF9pUzumwZW8AJ7mjfGIGEUiBosrt854yz49E8Y=;
	b=tiGIt6cAIrlZUH/S21Hkbd1A8ujW8hTAE/iyXZKkCipEJa983kJCxwWoplKyoPHHkhVCJH
	uwG+uwPinZwjnBCQ==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1780658093; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=3YCdUF9pUzumwZW8AJ7mjfGIGEUiBosrt854yz49E8Y=;
	b=RGuj9ZHmIlkR3TMiOmmE5YZF7cVk8A+ZcHqmBCiY+s7A9MzJGjyTL5OqUSEY0vWNVm75I1
	uLT3It5UeRMmAgGVOS4EtBDDMx3gcfqA4QgsdmMLzJRXInYM7xD2BZxxkQtcx/PA9GAnnw
	RSZ6/zj3Hhm50WMuVbDNuNvMz4MI8Rg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1780658093;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=3YCdUF9pUzumwZW8AJ7mjfGIGEUiBosrt854yz49E8Y=;
	b=tiGIt6cAIrlZUH/S21Hkbd1A8ujW8hTAE/iyXZKkCipEJa983kJCxwWoplKyoPHHkhVCJH
	uwG+uwPinZwjnBCQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 49541779A9;
	Fri,  5 Jun 2026 11:14:53 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id dUGuEK2vImoUDwAAD6G6ig
	(envelope-from <tiwai@suse.de>); Fri, 05 Jun 2026 11:14:53 +0000
Date: Fri, 05 Jun 2026 13:14:52 +0200
Message-ID: <87y0gttf0z.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: =?ISO-8859-1?Q?C=E1ssio?= Gabriel <cassiogabrielcontato@gmail.com>
Cc: Takashi Iwai <tiwai@suse.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Wesley Cheng <quic_wcheng@quicinc.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	notify@kernel.org
Subject: Re: [PATCH] ALSA: usb-audio: qcom: Initialize offload control return value
In-Reply-To: <20260605-alsa-usb-qcom-offload-ret-init-v1-1-dc72fcc4bd3b@gmail.com>
References: <20260605-alsa-usb-qcom-offload-ret-init-v1-1-dc72fcc4bd3b@gmail.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/30.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 8bit
X-Spam-Flag: NO
X-Spam-Score: -3.30
X-Spamd-Result: default: False [-3.30 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	ARC_NA(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[gmail.com];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	RCVD_TLS_ALL(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_COUNT_TWO(0.00)[2];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,suse.de:mid]
X-Spam-Level: 

On Fri, 05 Jun 2026 06:14:40 +0200,
Cássio Gabriel wrote:
> 
> snd_usb_offload_create_ctl() returns ret after walking the USB PCM list,
> but ret is only assigned after a playback stream passes the endpoint and
> PCM-index filters.
> 
> If all playback streams are skipped, for example because there is no
> playback endpoint or because all PCM indexes exceed the 0xff control
> range, the function returns an uninitialized stack value.
> 
> Initialize ret to 0 so the no-control-created path returns deterministic
> success, while preserving the existing negative error return when
> snd_ctl_add() fails.
> 
> Fixes: a67656f011d1 ("ALSA: usb-audio: qcom: Add USB offload route kcontrol")
> Signed-off-by: Cássio Gabriel <cassiogabrielcontato@gmail.com>

Applied to for-next branch now.  Thanks.


Takashi
