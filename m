Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 254981CEAC2
	for <linux-sound@vger.kernel.org>; Thu,  5 Mar 2026 16:25:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772727929; cv=none; b=okUNwgSESv7IEM9myhZ0NqAwtgD3omoKYX6J3jBh+Njy4qDCuMMDpyVk2dF5yPSGvhcy6q+41OkRUrknRlXZZCgaQHd6pd8MqoemV1FVdm/A3BoFlSBmXMMmUUonuAu/rcXwTFUPpCCrb0zPM9XTM3YAuIX5TGbUPEt73awBZl0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772727929; c=relaxed/simple;
	bh=E+xhyK1WvDvZgKyHcVKBT+4IPXK22DrvgR5QtL4WLys=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=leewvRvLuH5u5zt8W+mHKRDv4Kvjqjn2vbXHqXmJCAwkkgjEXgtmEh7vaBX9Fhg+yMfyhEfOWkWCvk0/xgZn2RjERTWLiFr2y5SU1sglubUEurLZcVTXuumZSPg6u6W2MojZP6Vj7DfNBIzFrlDxo32h01I459AZBXBITx7jM30=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=plSPaHxd; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=vllcqjh6; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=plSPaHxd; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=vllcqjh6; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="plSPaHxd";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="vllcqjh6";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="plSPaHxd";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="vllcqjh6"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 45C7F3E772;
	Thu,  5 Mar 2026 16:25:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1772727926; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=wCW80X4l814i5jqh/o4QUL7HBvpx3DQfYnnssG2SJNo=;
	b=plSPaHxdcYBkTmXOzVyoCqeT/T/xb80LGAW87JUUOcY7oZSBWjrZflKtF+dqrxPk5RfhNR
	r35pPn39NSerRcN8qb5Xv82YAG0EOzP86HN2Y/0ZqBvwxDFVQHJuwX5pPmNpXitSvXZkvQ
	aPwzM8sl9crj+AcqbapOQy2WmyzvD4U=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1772727926;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=wCW80X4l814i5jqh/o4QUL7HBvpx3DQfYnnssG2SJNo=;
	b=vllcqjh6j8Vg7ioKMeMCtUusJVDHFEmq8V7LqWlfp1JAn5jYUySR50faiMX7jr73W7jHOT
	elmV3wC1f2fI1vCw==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=plSPaHxd;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=vllcqjh6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1772727926; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=wCW80X4l814i5jqh/o4QUL7HBvpx3DQfYnnssG2SJNo=;
	b=plSPaHxdcYBkTmXOzVyoCqeT/T/xb80LGAW87JUUOcY7oZSBWjrZflKtF+dqrxPk5RfhNR
	r35pPn39NSerRcN8qb5Xv82YAG0EOzP86HN2Y/0ZqBvwxDFVQHJuwX5pPmNpXitSvXZkvQ
	aPwzM8sl9crj+AcqbapOQy2WmyzvD4U=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1772727926;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=wCW80X4l814i5jqh/o4QUL7HBvpx3DQfYnnssG2SJNo=;
	b=vllcqjh6j8Vg7ioKMeMCtUusJVDHFEmq8V7LqWlfp1JAn5jYUySR50faiMX7jr73W7jHOT
	elmV3wC1f2fI1vCw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 20B333EA68;
	Thu,  5 Mar 2026 16:25:26 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id ENOABnauqWmScAAAD6G6ig
	(envelope-from <tiwai@suse.de>); Thu, 05 Mar 2026 16:25:26 +0000
Date: Thu, 05 Mar 2026 17:25:25 +0100
Message-ID: <87h5quw8ei.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Mark Brown <broonie@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	linux-sound@vger.kernel.org,
	alsa-devel@alsa-project.org
Subject: Re: [GIT PULL] ASoC fixes for v7.0-rc2
In-Reply-To: <7ad7ff6760638a45f9d77f53a870e817@kernel.org>
References: <7ad7ff6760638a45f9d77f53a870e817@kernel.org>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/30.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spamd-Result: default: False [-3.51 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	ARC_NA(0.00)[];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	FREEMAIL_CC(0.00)[gmail.com,vger.kernel.org,alsa-project.org];
	RCVD_TLS_ALL(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	DNSWL_BLOCKED(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	DKIM_TRACE(0.00)[suse.de:+];
	RCPT_COUNT_THREE(0.00)[4];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:dkim,suse.de:mid,imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns]
X-Rspamd-Action: no action
X-Spam-Flag: NO
X-Spam-Score: -3.51
X-Spam-Level: 
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Rspamd-Queue-Id: 45C7F3E772

On Thu, 05 Mar 2026 17:08:54 +0100,
Mark Brown wrote:
> 
> The following changes since commit 11439c4635edd669ae435eec308f4ab8a0804808:
> 
>   Linux 7.0-rc2 (2026-03-01 15:39:31 -0800)
> 
> are available in the Git repository at:
> 
>   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git tags/asoc-fix-v7.0-rc2
> 
> for you to fetch changes up to 325291b20f8a6f14b9c82edbf5d12e4e71f6adaa:
> 
>   ASoC: amd: yc: Add DMI quirk for ASUS EXPERTBOOK PM1503CDA (2026-03-04 11:40:17 +0000)
> 
> ----------------------------------------------------------------
> ASoC: Fixes for v7.0
> 
> A moderately large pile of fixes, though none of them are  super major,
> plus a few new quirks and device IDs.

Pulled now.  Thanks.


Takashi
