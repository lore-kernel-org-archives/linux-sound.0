Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86B7B1C01
	for <linux-sound@vger.kernel.org>; Wed, 15 Apr 2026 12:29:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776256177; cv=none; b=Q4PIpycE8dU2Fj8iCRs4mXzdnWcBlGZEPvC6bCwFIMtaFQ2/tS+/xWj8ZVoHRKOks6Ly88hQT/wB/KPv4rNtqCvzIkO9PdyCSA6qkIMwcRGIOXqXMIShQVkTXNNIPDg8iN/OxmEXVL1yRDVS6SjHvBL0gCjAlDXQI4TkVs+Dc/E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776256177; c=relaxed/simple;
	bh=w8a120Kns3pO7uujqdQJj+t9laFDvuT/B/3cofFUh4M=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=fKC8Iny15DMBUNYvLmD3XsSsoIym85relqKV0baapkVuXNPBh0W72Uj09eet1L91qaLSYm8gSShTLd00b8uKOjDOKnp9MIng3WOl/iKuZ+7JAjIlJfMmW85SQdP3fiLNnqcdFeMmAwZtnaPKq/Y+n1cRB4XJ/dA6ugTgvJZ9LbM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=Es6+V9DZ; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=uwWwnV9S; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=Es6+V9DZ; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=uwWwnV9S; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="Es6+V9DZ";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="uwWwnV9S";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="Es6+V9DZ";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="uwWwnV9S"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id F37375BE0B;
	Wed, 15 Apr 2026 12:29:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1776256175; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=FR+2qVJX7eRc8ylzR7wlTeDOlz5/JTmjngaXFcebu/E=;
	b=Es6+V9DZgOAXk5UtIYuqsZzlCO0fupRcdcOj/FDB/nggV1ldsDZ6poeTadUWjEUd57XdTU
	MiA60FEiicJVY0FUFPH1ELPr716qQSraekkTwdAtPb7gxJkbgkeJe0LHdoEYejOJEn+86A
	AR4zlaac+wqlD4yGsu7oNtJLsKllBRA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1776256175;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=FR+2qVJX7eRc8ylzR7wlTeDOlz5/JTmjngaXFcebu/E=;
	b=uwWwnV9Sb48Ke0TXDYY36o/d0fWE2OikKQwaoHDD/U2hspKgoiLxC6dtvGDAwoLb2m6BUn
	SOhGMs5iI06PwlCA==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=Es6+V9DZ;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=uwWwnV9S
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1776256175; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=FR+2qVJX7eRc8ylzR7wlTeDOlz5/JTmjngaXFcebu/E=;
	b=Es6+V9DZgOAXk5UtIYuqsZzlCO0fupRcdcOj/FDB/nggV1ldsDZ6poeTadUWjEUd57XdTU
	MiA60FEiicJVY0FUFPH1ELPr716qQSraekkTwdAtPb7gxJkbgkeJe0LHdoEYejOJEn+86A
	AR4zlaac+wqlD4yGsu7oNtJLsKllBRA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1776256175;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=FR+2qVJX7eRc8ylzR7wlTeDOlz5/JTmjngaXFcebu/E=;
	b=uwWwnV9Sb48Ke0TXDYY36o/d0fWE2OikKQwaoHDD/U2hspKgoiLxC6dtvGDAwoLb2m6BUn
	SOhGMs5iI06PwlCA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id DC00C4B9E6;
	Wed, 15 Apr 2026 12:29:34 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id q1oYNa6E32mqKQAAD6G6ig
	(envelope-from <tiwai@suse.de>); Wed, 15 Apr 2026 12:29:34 +0000
Date: Wed, 15 Apr 2026 14:29:19 +0200
Message-ID: <87ldeofluo.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Timofey Tarasenko <timka.tarasen@gmail.com>
Cc: Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ALSA: hda/realtek: add quirk for HONOR MRB-XXX M1020
In-Reply-To: <20260415074657.1217862-1-timka.tarasen@gmail.com>
References: <20260415074657.1217862-1-timka.tarasen@gmail.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/30.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Rspamd-Action: no action
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Spamd-Result: default: False [-2.01 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	TO_DN_SOME(0.00)[];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	ARC_NA(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[gmail.com];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	RCPT_COUNT_FIVE(0.00)[5];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	DKIM_TRACE(0.00)[suse.de:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns,suse.de:dkim,suse.de:mid]
X-Rspamd-Queue-Id: F37375BE0B
X-Spam-Flag: NO
X-Spam-Score: -2.01
X-Spam-Level: 

On Wed, 15 Apr 2026 09:46:57 +0200,
Timofey Tarasenko wrote:
> 
> Adds pin fixups to enable subwoofer and JACK functionality
> on Honor Magicbook Art 14 2025 (HONOR MRB-XXX M1020)
> 
> Closes: https://bugzilla.kernel.org/show_bug.cgi?id=221147
> Signed-off-by: Timofey Tarasenko <timka.tarasen@gmail.com>

Applied now.  Thanks.


Takashi
