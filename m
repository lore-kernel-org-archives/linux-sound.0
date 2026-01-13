Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05EDE389DE6
	for <linux-sound@vger.kernel.org>; Tue, 13 Jan 2026 12:25:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768307146; cv=none; b=fTusGDFtzXtiTIm8hSgWOTOfp033fWp6nV0qD0/1uPV4No1A13i8goNTWO8xSxCIdxWuOff7SMJQ1BhQFkYBzi17epjRE6QB1oOw9lqN4636NM2bcCIRcDP3NVo/LhGrm+qqavLxM1Gj38WLYFzjJk7IKtv15SyFM1zAn0JiziQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768307146; c=relaxed/simple;
	bh=lLtLL/OFfVh5LEM4h7M2dLVVuf8SsaB1/eJ/JviFZu4=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=S78YLUAOQyjMobg2BVXaS1ETo7UWstiLTni/GmOcZk7VZ9NOjKzChxEqLMHonrYAoOu56cNmz/5v5tk2lVbKJ7TvmnxUPk2Vzxg1fHe7f8dP2vyzSsR/vtHqxQHXiPdtKJypOVE2EjX17V0YjLMH/awFj+8czcPsWQQqZCRo928=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=nXpKEhg5; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=+dxCQM7l; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=nXpKEhg5; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=+dxCQM7l; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="nXpKEhg5";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="+dxCQM7l";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="nXpKEhg5";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="+dxCQM7l"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 47E633369C;
	Tue, 13 Jan 2026 12:25:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1768307143; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=jzuQSWh7XZq7cIq2nmz14axVohJrfm17M68JprOVzsk=;
	b=nXpKEhg5C7RndMfntZWCUuDMetW4YpoKWw8/zzOw8fOfyCa5HbpOuSWWIGuK61h6JbHcuX
	1vqnRWRK4G7OE9P8s0e/Vj7kzTALSRoLW+oUfVZyndMNOXqbe58L2q4iUzjH28Kl6wpwLA
	402t3tgIS0/To9kv3Rja5lRciBi3NX4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1768307143;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=jzuQSWh7XZq7cIq2nmz14axVohJrfm17M68JprOVzsk=;
	b=+dxCQM7l1xVcLTBWTfnj8TRWvpI7+eC0jPbGBXBc6CAr9uYL8z6k90AlZsjBGQdC79cjms
	7Y2cqoNAPD6dlrBA==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=nXpKEhg5;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=+dxCQM7l
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1768307143; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=jzuQSWh7XZq7cIq2nmz14axVohJrfm17M68JprOVzsk=;
	b=nXpKEhg5C7RndMfntZWCUuDMetW4YpoKWw8/zzOw8fOfyCa5HbpOuSWWIGuK61h6JbHcuX
	1vqnRWRK4G7OE9P8s0e/Vj7kzTALSRoLW+oUfVZyndMNOXqbe58L2q4iUzjH28Kl6wpwLA
	402t3tgIS0/To9kv3Rja5lRciBi3NX4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1768307143;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=jzuQSWh7XZq7cIq2nmz14axVohJrfm17M68JprOVzsk=;
	b=+dxCQM7l1xVcLTBWTfnj8TRWvpI7+eC0jPbGBXBc6CAr9uYL8z6k90AlZsjBGQdC79cjms
	7Y2cqoNAPD6dlrBA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 2F88C3EA63;
	Tue, 13 Jan 2026 12:25:43 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id WkrkCsc5ZmlNUgAAD6G6ig
	(envelope-from <tiwai@suse.de>); Tue, 13 Jan 2026 12:25:43 +0000
Date: Tue, 13 Jan 2026 13:25:42 +0100
Message-ID: <87bjixr96h.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Richard Fitzgerald <rf@opensource.cirrus.com>
Cc: tiwai@suse.com,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	patches@opensource.cirrus.com
Subject: Re: [PATCH] ALSA: hda/cs8409: Add quirk for CDB35L56-FOUR-HD
In-Reply-To: <20260112142850.243054-1-rf@opensource.cirrus.com>
References: <20260112142850.243054-1-rf@opensource.cirrus.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/30.1 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spam-Score: -3.51
X-Spamd-Result: default: False [-3.51 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	URIBL_BLOCKED(0.00)[suse.de:dkim,suse.de:mid];
	TO_DN_SOME(0.00)[];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	ARC_NA(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	MIME_TRACE(0.00)[0:+];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	DNSWL_BLOCKED(0.00)[2a07:de40:b281:106:10:150:64:167:received,2a07:de40:b281:104:10:150:64:97:from];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	DKIM_TRACE(0.00)[suse.de:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo,suse.de:dkim,suse.de:mid]
X-Spam-Level: 
X-Rspamd-Action: no action
X-Rspamd-Queue-Id: 47E633369C
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spam-Flag: NO

On Mon, 12 Jan 2026 15:28:50 +0100,
Richard Fitzgerald wrote:
> 
> From: Simon Trimmer <simont@opensource.cirrus.com>
> 
> Adds quirkiness for the Cirrus Logic CDB35L56-FOUR-HD board.
> The quirk must be forced by model name "CDB35L56-FOUR-HD"
> because there isn't a unique SSID that can be used. For example
> in /etc/modprobe.d:
> 
> options snd-hda-intel model="CDB35L56-FOUR-HD"
> 
> The CDB35L56-FOUR-HD is not a complete PC. It is an add-on audio
> board that requires a host system and replaces the normal HDA codec
> on the host. Because of this there isn't an SSID that uniquely
> identifies this configuration. Also, the usual host board is an
> Aaeon UpXtreme, which doesn't have a unique SSID.
> 
> Because of this, the quirk must be forced by a module param.
> This is acceptable because it is a development board, not an
> end-user system, so there is no need for it to be detected
> automatically.
> 
> Signed-off-by: Simon Trimmer <simont@opensource.cirrus.com>
> Co-developed-by: Richard Fitzgerald <rf@opensource.cirrus.com>
> Signed-off-by: Richard Fitzgerald <rf@opensource.cirrus.com>

Applied to for-next branch now.  Thanks.


Takashi
