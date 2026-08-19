Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E97EA346FBC;
	Wed, 19 Aug 2026 13:01:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787144473; cv=none; b=O5Up0XDiz06QBsdQDQdAE/6P2f8ePAYZ42HzMwfGyGM0d/nJZCJSAd+7HWtFrg9ITpnjcJlhLSQMlWZqcLOn8E1IGkKqcVhufg1+NC5XOycbCkTYXaLjScByEWjDFVzHS3TKrMK5agdsGYdQT191KNwOOiVNiQIMtE9XmuZ0vws=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787144473; c=relaxed/simple;
	bh=+GE4numVNTCnDDUB31givrTI7gSQlROI24djVhZco6k=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=uSKcPUEovhBZsUeQRmBBX/BxZE/63vCgxTshla2crJvFih+kNIA/kdXROAPHw6iqTkE94XP/JbVHNZ4Pa2wXdU8CFAqLt8r89p++61Bzf8QxAFtzO94DEspJ+8oAvSgxsOsRCMMt4lsTGNBo2UHySjy49nnMsHxZtIGu5KqsXOI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=pgs7T9Ae; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=k6MSigMP; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=XKoXw77n; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=gEgF+aii; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="pgs7T9Ae";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="k6MSigMP";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="XKoXw77n";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="gEgF+aii"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id BC72C3E69;
	Wed, 19 Aug 2026 13:00:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1787144430; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=QyBYS566qHAihD4tnpXxCbuxiwTgNDKq5vOa8zFjrhQ=;
	b=pgs7T9AeLRM3B8NecTA3Sj0qvpOrOOMw3WD42MGVrvOHNlBUEHJYNanDIBOU0X/pfQA6C5
	wxBENcSlM60iFjOd5u4bR9SsWySSJ2LnyOlIIUEumfiYmfFfCoJkQtreYSYxDNQe2oJGNU
	UTHSIwhqacnWFeX0niI8nbH4w/volzY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1787144430;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=QyBYS566qHAihD4tnpXxCbuxiwTgNDKq5vOa8zFjrhQ=;
	b=k6MSigMPHjqxMjkKeB+ghEW7pQMhsVkeKkmoHzSLcuLSQmr45arGtFtozqrHyB/zBySUAh
	aTN1+xhw9jqa6MAw==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1787144426; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=QyBYS566qHAihD4tnpXxCbuxiwTgNDKq5vOa8zFjrhQ=;
	b=XKoXw77nY6kFV2VVeTzIe0x0Z784SjbFZfvwbgSzRPKOzhky80z+mqnVbSgLLuSBH6hGrr
	OCovdWfCU/fJ4OhRAFfDzHRF3v8Ej3pecPuejo1HguQ7KEgugNBMufIA41NiNEYMEmDmPi
	oJirfJ/Ybg8gnWpOTcIz6uqK5KCz9eg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1787144426;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=QyBYS566qHAihD4tnpXxCbuxiwTgNDKq5vOa8zFjrhQ=;
	b=gEgF+aiiE+nf/ksx8EE6s5Lumri5JXXLMBZVpe9x6rU20exT8eFNPdJEjUlYSa1y1DA0w9
	/fOa/QfxucRI/PBA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 891582F81;
	Wed, 19 Aug 2026 13:00:26 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id TwVYIOqohWqaLgAAD6G6ig
	(envelope-from <tiwai@suse.de>); Wed, 19 Aug 2026 13:00:26 +0000
Date: Wed, 19 Aug 2026 15:00:26 +0200
Message-ID: <87cxvenu39.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Chad Talbott <chad.talbott@gmail.com>
Cc: Takashi Iwai <tiwai@suse.com>,
	Jaroslav Kysela <perex@perex.cz>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ALSA: usb-audio: Add MIN_MUTE quirk for Creative Sound Blaster Play! 3
In-Reply-To: <20260819003237.452807-1-chad.talbott@gmail.com>
References: <20260819003237.452807-1-chad.talbott@gmail.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/30.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spam-Score: -1.80
X-Spam-Level: 
X-Spam-Flag: NO
X-Spamd-Result: default: False [-1.80 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	ARC_NA(0.00)[];
	TAGGED_RCPT(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	RCPT_COUNT_FIVE(0.00)[5];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	SUBJECT_HAS_EXCLAIM(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid,imap1.dmz-prg2.suse.org:helo]

On Wed, 19 Aug 2026 02:32:37 +0200,
Chad Talbott wrote:
> 
> The Creative Sound Blaster Play! 3 (041e:324d) exposes a Feature Unit
> volume control with a range of -44.00 dB .. 0.00 dB over raw values
> 0..88, but raw value 0 is in fact a hard mute rather than -44.00 dB.
> 
> Tested on hardware.
> 
> Signed-off-by: Chad Talbott <chad.talbott@gmail.com>

Applied now.  Thanks.


Takashi
