Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE2322163A1
	for <linux-sound@vger.kernel.org>; Mon,  9 Dec 2024 09:56:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733738168; cv=none; b=CSewMHG8QJo/gWQoIOjnLV1HIPD+JOZFK98v6SFwqb6c1+CVPX897lqXnN7jfE25c7aeyEJwNBL1BN4Nq0TI3dolz30R6RVU8JPK7s3yfGG5+yvW+/m9+Zpk+NaeVKiotOdskai+WLJm1cbG3iHsJhZx2Jd733ShlhUUSZSnOeQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733738168; c=relaxed/simple;
	bh=HoQLK/JuIV850LSUmTXCMCIPBEILUvjDCBpnxrf/qV4=;
	h=Date:Message-ID:From:To:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=VveNjuNz/foLYEiPtv50BV2oSYvp569l9rPcxdD0D96MD5Nkht6nR6lP84VbtRcs/y2WTOxME5URMBgrfYTcRIz8N46U04oQKkQ7diryd3syylzwBXk/RfQbyN9ARah7+8Gm2mJLMUehgAbVeFPs+Hka6ZHvgJ4A62k6aOvWJ4M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=HTHw6IJ7; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=INOTFQfB; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=qDVa6AMz; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=t4yUZJsp; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="HTHw6IJ7";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="INOTFQfB";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="qDVa6AMz";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="t4yUZJsp"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 2FA8A21161
	for <linux-sound@vger.kernel.org>; Mon,  9 Dec 2024 09:56:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1733738164; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=yWLxVZRNBT1GPlQpoZmtkVRwWv7d/CrPzg/7/4Vqpy8=;
	b=HTHw6IJ7KrGwjCbwijT0Oz0ZE8oC57wo66wu+mpspcTwyKPdr2U6ZYqrkbAoxgMESBwa+h
	fHg/jKgoAV2h6MJoFoNBpTqafz3T9Gvu+9DG+CwwNHcWrUJr0MGIrATXdBV5/Ptjxs/MFT
	/PjN3EMImaX7gRZJO6MtslZKIEm3wcY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1733738164;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=yWLxVZRNBT1GPlQpoZmtkVRwWv7d/CrPzg/7/4Vqpy8=;
	b=INOTFQfBipDZwya0Ocy2pZHv26iFLFqB1xFUWFzwoTz9u5DQ4pXGiFHdUJVFo5wppjDOAi
	C6R1W/e3MK2fQmBA==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1733738163; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=yWLxVZRNBT1GPlQpoZmtkVRwWv7d/CrPzg/7/4Vqpy8=;
	b=qDVa6AMzCfNG2OKsWZpuBPj1sNab5Ksr/H7FDIHEUzRwGDY3Mo4OboLGbqc++lP8RESK8O
	YDL+wlwbwIVK6OWyQufEp/zGFhIVKBaKY/VoIU0FXgIIkZ0lFYCySuUVh6xftGNcFzHAn6
	PmsSNumXiMRpOkHeXYRpstujlYH2gg4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1733738163;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=yWLxVZRNBT1GPlQpoZmtkVRwWv7d/CrPzg/7/4Vqpy8=;
	b=t4yUZJspue9/2j/7VQqTORXx/CElLNjqlu53l2A9LI05PApszbQKt/JWHrZBFkgTwrHFcX
	SPow+0iaslR2doBw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 0F717138D2
	for <linux-sound@vger.kernel.org>; Mon,  9 Dec 2024 09:56:03 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id Tl2yAbO+VmfUKQAAD6G6ig
	(envelope-from <tiwai@suse.de>)
	for <linux-sound@vger.kernel.org>; Mon, 09 Dec 2024 09:56:03 +0000
Date: Mon, 09 Dec 2024 10:56:02 +0100
Message-ID: <87wmg95gel.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Subject: Re: [PATCH] ALSA: control: Avoid WARN() for symlink errors
In-Reply-To: <20241209083928.30941-1-tiwai@suse.de>
References: <20241209083928.30941-1-tiwai@suse.de>
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
	RCVD_TLS_ALL(0.00)[];
	ARC_NA(0.00)[];
	RCPT_COUNT_ONE(0.00)[1];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	PREVIOUSLY_DELIVERED(0.00)[linux-sound@vger.kernel.org];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	TO_DN_NONE(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid,imap1.dmz-prg2.suse.org:helo]
X-Spam-Flag: NO
X-Spam-Level: 

On Mon, 09 Dec 2024 09:39:25 +0100,
Takashi Iwai wrote:
> 
> Using WARN() for showing the error of symlink creations don't give
> more information than telling that something goes wrong, since the
> usual code path is a lregister callback from each control element
> creation.  More badly, the use of WARN() rather confuses fuzzer as if
> it were serious issues.
> 
> This patch downgrades the warning messages to use the normal pr_warn()
> instead of WARN().

There is no reason to stick with the warning level.  It'd be better
with the normal dev_err().  Will resubmit v2.


Takashi
