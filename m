Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9769C35AC2D
	for <linux-sound@vger.kernel.org>; Fri, 10 Apr 2026 06:23:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775802187; cv=none; b=JyFuoKnts6ud+O+VI5spBauUrAb4GmzrrKvqEcy8ybTagVXtFKg9L9AEf/0AJKM35fewdOclu6l5jUjSx+ye6iqOeJi77imYJXW/GeCMg2cBHwZSOy2+SBnM5nV2ERRX8SycXrG8Q1qyzMDem5IHGdtCGIAz2JwS1zKxefwXb44=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775802187; c=relaxed/simple;
	bh=8kZoJT9FR/OXQXMo2Wmf+21vYTfB01pWsf1RQ6kb2Oc=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=QEGb4Mn0zaS8JAxYOoJaevndRV+wWZUWbYB37oPoqW3n4Z8m7EGDjXZ80NZ2JMnOaHwF++8PyHWJOXHLuMrAxrOo6Qo7EHVCXCCgP6avVuVTtAPWAL2y9J1xNvqHSFDP6V6bVgU/KflkfRdNvAzBcgDiv9ua2ftAwGCDNr3/GXs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=jiZfqdv8; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=nuEZTJYG; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=jiZfqdv8; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=nuEZTJYG; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="jiZfqdv8";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="nuEZTJYG";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="jiZfqdv8";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="nuEZTJYG"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id C3EC95BCD9;
	Fri, 10 Apr 2026 06:23:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1775802184; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=ICUduvVG9N5qlh4JgC7BB8JnRw/bdRnB3DNdsj7DCa4=;
	b=jiZfqdv8/kh8HmLRzsscG4V7HaZL84+7IsaepJFWAPTiY9oy39kYlDFB4X217bgzm1ver0
	VQGlsyMZa7ko42AhZDtWPzllVBD2Qw+H4gie3fSqND95qP7x5LLVsyona+7sQFXOn4FmdY
	ghf78uZAywZbrkOtMEFalO9Cb+rfXJc=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1775802184;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=ICUduvVG9N5qlh4JgC7BB8JnRw/bdRnB3DNdsj7DCa4=;
	b=nuEZTJYGeU39vkQ5FVxvSllzDaxeT1S1ePrtoOn8jKr+h3V5fc4KzpYKCGiFWI/u9N66Qu
	t2vdRelkWFdbqwCQ==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=jiZfqdv8;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=nuEZTJYG
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1775802184; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=ICUduvVG9N5qlh4JgC7BB8JnRw/bdRnB3DNdsj7DCa4=;
	b=jiZfqdv8/kh8HmLRzsscG4V7HaZL84+7IsaepJFWAPTiY9oy39kYlDFB4X217bgzm1ver0
	VQGlsyMZa7ko42AhZDtWPzllVBD2Qw+H4gie3fSqND95qP7x5LLVsyona+7sQFXOn4FmdY
	ghf78uZAywZbrkOtMEFalO9Cb+rfXJc=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1775802184;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=ICUduvVG9N5qlh4JgC7BB8JnRw/bdRnB3DNdsj7DCa4=;
	b=nuEZTJYGeU39vkQ5FVxvSllzDaxeT1S1ePrtoOn8jKr+h3V5fc4KzpYKCGiFWI/u9N66Qu
	t2vdRelkWFdbqwCQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 52C3B4A0B2;
	Fri, 10 Apr 2026 06:23:04 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id enbXDUiX2GlgCAAAD6G6ig
	(envelope-from <tiwai@suse.de>); Fri, 10 Apr 2026 06:23:04 +0000
Date: Fri, 10 Apr 2026 08:23:03 +0200
Message-ID: <87wlyfgwqg.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Clemens Ladisch <clemens@ladisch.de>,
	Takashi Sakamoto <o-takashi@sakamocchi.jp>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	stable <stable@kernel.org>
Subject: Re: [PATCH] ALSA: fireworks: bound device-supplied status before string array lookup
In-Reply-To: <2026040953-astute-camera-1aa1@gregkh>
References: <2026040953-astute-camera-1aa1@gregkh>
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
	RCPT_COUNT_SEVEN(0.00)[8];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:dkim,suse.de:mid];
	DKIM_TRACE(0.00)[suse.de:+]
X-Rspamd-Action: no action
X-Spam-Flag: NO
X-Spam-Score: -3.51
X-Spam-Level: 
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Rspamd-Queue-Id: C3EC95BCD9

On Thu, 09 Apr 2026 16:05:54 +0200,
Greg Kroah-Hartman wrote:
> 
> The status field in an EFW response is a 32-bit value supplied by the
> firewire device.  efr_status_names[] has 17 entries so a status value
> outside that range goes off into the weeds when looking at the %s value.
> 
> Even worse, the status could return EFR_STATUS_INCOMPLETE which is
> 0x80000000, and is obviously not in that array of potential strings.
> 
> Fix this up by properly bounding the index against the array size and
> printing "unknown" if it's not recognized.
> 
> Cc: Clemens Ladisch <clemens@ladisch.de>
> Cc: Takashi Sakamoto <o-takashi@sakamocchi.jp>
> Cc: Jaroslav Kysela <perex@perex.cz>
> Cc: Takashi Iwai <tiwai@suse.com>
> Fixes: bde8a8f23bbe ("ALSA: fireworks: Add transaction and some commands")
> Cc: stable <stable@kernel.org>
> Assisted-by: gregkh_clanker_t1000
> Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

Applied now to for-next branch.  Thanks.


Takashi
