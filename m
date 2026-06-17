Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 733AE3822A5
	for <linux-sound@vger.kernel.org>; Wed, 17 Jun 2026 09:05:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781687138; cv=none; b=IpSo/26pTdi+H1XQ6WMaKF4D21kAj0pDgR2YyvhzNMWGqYwHEQIqJHvo8Vejm8ubL+kffrHkXhVg4lZ7qLMexyrZrsNXro1mz3KS9SZg7zf8fpz7BZ0Samu9ZZE5QoDd1+jUOLmxdUL1VHlJfaUTRTA02KIuLKcVA/nB8s+56fQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781687138; c=relaxed/simple;
	bh=vAFzL37eMSRJEILqWnFtQcNqBdTd8ECRdsHQdWSRgeQ=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=OpmbPJNbgZmkIp/HSVqJ1ESdHSsiWRkWoD3jVIkZeZp+ot+1NV/dVSslRZE6vlX45A3TpSFKIMKK1vsOVcoug5Jj2oDvb1YueJyGQIEa/w9EIiW0cw5EoWXU16MXVi25RH/i10b4UEyiapeezGSXJyfH98iGPbmz2Mblxl2aiBI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=bPxHm8oC; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=4Bnwo3vx; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=bPxHm8oC; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=4Bnwo3vx; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="bPxHm8oC";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="4Bnwo3vx";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="bPxHm8oC";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="4Bnwo3vx"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 9196E75C37;
	Wed, 17 Jun 2026 09:05:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1781687135; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=/MNkqAFfNaWS9LuY9yhgdhKsQyA0aHiDKiqmyyBk3T0=;
	b=bPxHm8oC34u8iFogQDP/yQSKAL1m2D0nLrLIgX0ybXNPvjXTonLVx3MKOQ0zyiH044kOCC
	ma/tFuPfQBHLJwJIM58kb6c36wugMdvl5L5KCaMSeFGq2dSUpyYu9LoMGJGJ7vfkNQEXmc
	vqdOmdpZJ1ydbH0iMsFubtlqB/SGTOQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1781687135;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=/MNkqAFfNaWS9LuY9yhgdhKsQyA0aHiDKiqmyyBk3T0=;
	b=4Bnwo3vxErOJulUz9W6nshf9wCrGVj360uaA9lhonc5J5x4NTDzASi/huI+BmQDLudJdSm
	kZ2tlMe5YNVfJEAg==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1781687135; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=/MNkqAFfNaWS9LuY9yhgdhKsQyA0aHiDKiqmyyBk3T0=;
	b=bPxHm8oC34u8iFogQDP/yQSKAL1m2D0nLrLIgX0ybXNPvjXTonLVx3MKOQ0zyiH044kOCC
	ma/tFuPfQBHLJwJIM58kb6c36wugMdvl5L5KCaMSeFGq2dSUpyYu9LoMGJGJ7vfkNQEXmc
	vqdOmdpZJ1ydbH0iMsFubtlqB/SGTOQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1781687135;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=/MNkqAFfNaWS9LuY9yhgdhKsQyA0aHiDKiqmyyBk3T0=;
	b=4Bnwo3vxErOJulUz9W6nshf9wCrGVj360uaA9lhonc5J5x4NTDzASi/huI+BmQDLudJdSm
	kZ2tlMe5YNVfJEAg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 3A00C779AB;
	Wed, 17 Jun 2026 09:05:35 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id v8PrDF9jMmoDUgAAD6G6ig
	(envelope-from <tiwai@suse.de>); Wed, 17 Jun 2026 09:05:35 +0000
Date: Wed, 17 Jun 2026 11:05:34 +0200
Message-ID: <87pl1ppme9.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: raoxu <raoxu@uniontech.com>
Cc: perex@perex.cz,
	tiwai@suse.com,
	kees@kernel.org,
	mathias.nyman@linux.intel.com,
	gregkh@linuxfoundation.org,
	harshit.m.mogalapalli@oracle.com,
	daniel.lezcano@oss.qualcomm.com,
	karanja99erick@gmail.com,
	cassiogabrielcontato@gmail.com,
	guanyulin@google.com,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ALSA: usb-audio: qcom: Free sideband sg_table objects
In-Reply-To: <90B353283AA150C4+20260616115916.1222915-1-raoxu@uniontech.com>
References: <90B353283AA150C4+20260616115916.1222915-1-raoxu@uniontech.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/30.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spam-Flag: NO
X-Spam-Score: -3.30
X-Spamd-Result: default: False [-3.30 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MIME_TRACE(0.00)[0:+];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	ARC_NA(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	RCPT_COUNT_TWELVE(0.00)[13];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	FREEMAIL_CC(0.00)[perex.cz,suse.com,kernel.org,linux.intel.com,linuxfoundation.org,oracle.com,oss.qualcomm.com,gmail.com,google.com,vger.kernel.org];
	RCVD_TLS_ALL(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	DBL_BLOCKED_OPENRESOLVER(0.00)[uniontech.com:email,suse.de:mid,imap1.dmz-prg2.suse.org:helo]
X-Spam-Level: 

On Tue, 16 Jun 2026 13:59:16 +0200,
raoxu wrote:
> 
> From: Xu Rao <raoxu@uniontech.com>
> 
> The Qualcomm USB audio offload driver obtains an endpoint transfer-ring
> table by calling xhci_sideband_get_endpoint_buffer(). This getter passes
> the endpoint ring to xhci_ring_to_sgtable(), which allocates the outer
> struct sg_table with kzalloc_obj(*sgt). The event-ring path is
> equivalent: xhci_sideband_get_event_buffer() also returns the result of
> xhci_ring_to_sgtable().
> 
> Inside xhci_ring_to_sgtable(), sg_alloc_table_from_pages() separately
> allocates the scatterlist storage referenced by sgt->sgl. The returned
> object therefore has two allocation layers: the outer struct sg_table
> and its internal scatterlist storage.
> 
> The Qualcomm caller only invokes sg_free_table(sgt). sg_free_table()
> releases the scatterlist storage owned by the table, but it does not
> free the separately allocated outer struct sg_table. The local sgt
> pointer is then discarded, so every successful endpoint or event-ring
> query leaks the outer object.
> 
> Call kfree(sgt) after sg_free_table(sgt) in both setup paths, after the
> required page and DMA addresses have been copied out.
> 
> Fixes: 326bbc348298 ("ALSA: usb-audio: qcom: Introduce QC USB SND offloading support")
> Signed-off-by: Xu Rao <raoxu@uniontech.com>

Applied now.  Thanks.


Takashi
