Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A5FA388E72
	for <linux-sound@vger.kernel.org>; Mon, 27 Apr 2026 11:55:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777290921; cv=none; b=IV4p5Cmuaj/5zyquf6vyvWvDhZMbOEvG/wr0Wotz+6A5jpbqxc0pS8pbhtBeziGGiWry44eztdMtosdmeAjbkYu6syd358hsRqBZva5peQzn77nVtEu03MV/4LP5/7sIwlOeu6JNu4xBOIC14EBu14F8tOqZ1f+hqX/tOBrmSqc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777290921; c=relaxed/simple;
	bh=SPVrI6rASNMITAnNLSqyHmc7txEa4v5LCRL7136a0Ec=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=GVtccx//u0mic6ImgqmJEaJYL0C9nEJCma1meFkT6C7hZgN0X5LrZPYt6Vet1EJZwvO5dd7PGjQFQ/rerc4SEhpjH6DytVx1foy3LjwBqhbURLYzSCH/BuJRxEr1zNVXZM/Ae04HXJHGr0tXvhl6ux8qh9kUpzQaoYhN7TfR+Ng=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=bnAVRSIV; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=XfbVmbXK; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=bnAVRSIV; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=XfbVmbXK; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="bnAVRSIV";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="XfbVmbXK";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="bnAVRSIV";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="XfbVmbXK"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 4D0895BCD2;
	Mon, 27 Apr 2026 11:55:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1777290918; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=FxhgtNI1R3pY01ExIzKCXltfOHyaGPj6lIDRaYMYt0w=;
	b=bnAVRSIVN8Us2WNUVF63PQabH58oi3RN3xr85BdMu8i79CPoYvYjKYBgn6wco0OXqRh/Iq
	+2QFp/K+z7HTpPSdeYn2fTNgYmh2sTbcupcw7hEKPVeln9IyeYRL8N2QNhfMmPmMNYvug1
	d4fXA/eTJ05mbMQwotIoyWMHl09J0lQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1777290918;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=FxhgtNI1R3pY01ExIzKCXltfOHyaGPj6lIDRaYMYt0w=;
	b=XfbVmbXKlwXjOvGa9bLuFZXM9/qpb1eLA+NNqWN+0VsJs/K6PtjMibk4C7+8kD6/csIZQY
	HP/I0XCOlCpYj7AQ==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=bnAVRSIV;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=XfbVmbXK
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1777290918; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=FxhgtNI1R3pY01ExIzKCXltfOHyaGPj6lIDRaYMYt0w=;
	b=bnAVRSIVN8Us2WNUVF63PQabH58oi3RN3xr85BdMu8i79CPoYvYjKYBgn6wco0OXqRh/Iq
	+2QFp/K+z7HTpPSdeYn2fTNgYmh2sTbcupcw7hEKPVeln9IyeYRL8N2QNhfMmPmMNYvug1
	d4fXA/eTJ05mbMQwotIoyWMHl09J0lQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1777290918;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=FxhgtNI1R3pY01ExIzKCXltfOHyaGPj6lIDRaYMYt0w=;
	b=XfbVmbXKlwXjOvGa9bLuFZXM9/qpb1eLA+NNqWN+0VsJs/K6PtjMibk4C7+8kD6/csIZQY
	HP/I0XCOlCpYj7AQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 23920593B0;
	Mon, 27 Apr 2026 11:55:18 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id 3vpSB6ZO72m+dQAAD6G6ig
	(envelope-from <tiwai@suse.de>); Mon, 27 Apr 2026 11:55:18 +0000
Date: Mon, 27 Apr 2026 13:55:17 +0200
Message-ID: <87ik9czkgq.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Rosen Penev <rosenp@gmail.com>
Cc: linux-sound@vger.kernel.org,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	linux-kernel@vger.kernel.org (open list)
Subject: Re: [PATCH] ALSA: hda: allocate nodes with tree
In-Reply-To: <87se8gzku7.wl-tiwai@suse.de>
References: <20260425023421.476334-1-rosenp@gmail.com>
	<87se8gzku7.wl-tiwai@suse.de>
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
X-Spamd-Result: default: False [-3.51 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[gmail.com];
	ARC_NA(0.00)[];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	TO_DN_SOME(0.00)[];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	RCVD_TLS_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns,suse.de:dkim,suse.de:mid];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DKIM_TRACE(0.00)[suse.de:+]
X-Rspamd-Queue-Id: 4D0895BCD2
X-Spam-Flag: NO
X-Spam-Score: -3.51
X-Spam-Level: 

On Mon, 27 Apr 2026 13:47:12 +0200,
Takashi Iwai wrote:
> 
> On Sat, 25 Apr 2026 04:34:21 +0200,
> Rosen Penev wrote:
> > 
> > Use a flexible array member to combine allocations. Simplifies
> > allocation and freeing.
> > 
> > Signed-off-by: Rosen Penev <rosenp@gmail.com>
> 
> Applied to for-next branch now.  Thanks.

Scratch that.  I re-read the code, and noticed that it doesn't handle
the case in hda_widget_sysfs_reinit().  It can resize and reallocate
the node table, hence the embedded flex array won't work.


thanks,

Takashi
