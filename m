Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECEC3346E72
	for <linux-sound@vger.kernel.org>; Fri,  3 Apr 2026 08:11:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775203898; cv=none; b=DRpXDnYSw2vzJAM+EQKiHmcUsGY8rItpkSF7yaG7F0XPhVkNbuoHt8Qmk86l2atRMZOhycoTiAacDP3UxBMDxEo++AwHuruC3MyRS6iw10YtbOd+oXccLITkp3sI426F170Qs2CAjFM4RCwTBkcAJa+j+LY1kzlozHS6Iyl0unM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775203898; c=relaxed/simple;
	bh=t+5YY80mkHaYn9PfJEzCWgN6VOKQA0QWPbAFZSWh9kQ=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Z3b9sXomKrskSUgo7J58S+jiYRTXoLiMUbw03JPuz8ugxTzDKaWLpkQa/MNpNlv2iJdnVco6dCao9DTMFgZ6Srz9d8pHAws5VCmQJDn7apsYnKMoeOE3NdnIvPY01gfZ3ACWQaWlW8ECN8bkGnX2lJbIwCKlG30DqBUQserV9mQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=uH922SRG; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=FRzV/2v3; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=uH922SRG; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=FRzV/2v3; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="uH922SRG";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="FRzV/2v3";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="uH922SRG";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="FRzV/2v3"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 400FA4D236;
	Fri,  3 Apr 2026 08:11:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1775203895; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=/VF8vCZKdVjSm3OrUa4f/PB4R+AuR2MyTOQAGQHOAH8=;
	b=uH922SRGZCClx4tEemo0w9daJgeNR1soeMPKkldBMx2yjW9pj/75S1GRejDp/LWRNc/giJ
	dGUdZ1n36CSXENmJYAl4RbfQS3HuaBOlry6XakyaxsLSMfhvxIE/Y6XedWvAat8PXYJX3A
	rViYTzO/J326XKUbVLRaWsdQ3nO9ooU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1775203895;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=/VF8vCZKdVjSm3OrUa4f/PB4R+AuR2MyTOQAGQHOAH8=;
	b=FRzV/2v3DIghCaDk0hv6C67ja2w+64JrCveRJBPb39TB2xnvw42FuaRHHIQDEh/xiwmWdH
	FSgLYjFP/ocitkCg==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1775203895; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=/VF8vCZKdVjSm3OrUa4f/PB4R+AuR2MyTOQAGQHOAH8=;
	b=uH922SRGZCClx4tEemo0w9daJgeNR1soeMPKkldBMx2yjW9pj/75S1GRejDp/LWRNc/giJ
	dGUdZ1n36CSXENmJYAl4RbfQS3HuaBOlry6XakyaxsLSMfhvxIE/Y6XedWvAat8PXYJX3A
	rViYTzO/J326XKUbVLRaWsdQ3nO9ooU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1775203895;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=/VF8vCZKdVjSm3OrUa4f/PB4R+AuR2MyTOQAGQHOAH8=;
	b=FRzV/2v3DIghCaDk0hv6C67ja2w+64JrCveRJBPb39TB2xnvw42FuaRHHIQDEh/xiwmWdH
	FSgLYjFP/ocitkCg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 0A2844A0A6;
	Fri,  3 Apr 2026 08:11:35 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id LcoxATd2z2nFbQAAD6G6ig
	(envelope-from <tiwai@suse.de>); Fri, 03 Apr 2026 08:11:35 +0000
Date: Fri, 03 Apr 2026 10:11:34 +0200
Message-ID: <87a4vkihu1.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: =?ISO-8859-1?Q?C=E1ssio?= Gabriel <cassiogabrielcontato@gmail.com>
Cc: Takashi Iwai <tiwai@suse.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Christian Brauner <brauner@kernel.org>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Takashi Iwai <tiwai@suse.de>
Subject: Re: [PATCH v3] ALSA: hda: Notify IEC958 Default PCM switch state changes
In-Reply-To: <20260403-hda-spdif-share-notify-v3-1-4eb1356b0f17@gmail.com>
References: <20260403-hda-spdif-share-notify-v3-1-4eb1356b0f17@gmail.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/30.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 8bit
X-Spam-Score: -3.30
X-Spam-Level: 
X-Spamd-Result: default: False [-3.30 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-0.999];
	MIME_GOOD(-0.10)[text/plain];
	FREEMAIL_TO(0.00)[gmail.com];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	ARC_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_SEVEN(0.00)[7];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	RCVD_TLS_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,suse.de:mid,suse.de:email]
X-Spam-Flag: NO

On Fri, 03 Apr 2026 05:21:34 +0200,
Cássio Gabriel wrote:
> 
> The "IEC958 Default PCM Playback Switch" control is backed directly by
> mout->share_spdif. The share-switch callbacks currently access that state
> without serialization, and spdif_share_sw_put() always returns 0, so
> normal userspace writes never emit the standard ALSA control value
> notification.
> 
> snd_hda_multi_out_analog_open() may also clear mout->share_spdif when the
> analog PCM capabilities and the SPDIF capabilities no longer intersect.
> That fallback is still needed to avoid creating an impossible hw
> constraint set, but it changes the mixer backing value without notifying
> subscribers.
> 
> Protect the share-switch callbacks with spdif_mutex like the other SPDIF
> control handlers, return the actual change value from spdif_share_sw_put(),
> and notify the cached control when the open path forcibly disables
> shared SPDIF mode after dropping spdif_mutex.
> 
> This keeps the existing auto-disable behavior while making switch state
> changes visible to userspace.
> 
> Fixes: 9a08160bdbe3 ("[ALSA] hda-codec - Add "IEC958 Default PCM" switch")
> Fixes: 022b466fc353 ("ALSA: hda - Avoid invalid formats and rates with shared SPDIF")
> Suggested-by: Takashi Iwai <tiwai@suse.de>
> Signed-off-by: Cássio Gabriel <cassiogabrielcontato@gmail.com>

Applied to for-next branch now.  Thanks.


Takashi
