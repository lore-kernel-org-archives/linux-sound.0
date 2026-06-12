Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66EBA3E7BBC
	for <linux-sound@vger.kernel.org>; Fri, 12 Jun 2026 11:33:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781264004; cv=none; b=uYrqztn7YQzI/MHmkjg11JS4cfFflG9oIveyKf8d1YzkiN2zftE39WQranMxsuSZZkNK5MqF6+rG9c0cEnU6ZJZws0GNKwTp/7N12O0XnoUgHJDe+B0XOKtZW0ieMz5GHvddAl96P8CxBPhNBiSco0+k4fztPMPq8/Ee3QmRdYI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781264004; c=relaxed/simple;
	bh=R578yBn2O6k18cIC3y1hQc62mo80zsddjCN4mCtOh80=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=tgDf9OTeN0fibb+LtVGzGEodua2RqGR7ra0fxfgeqZ9BiMXLYhemsxmwY3bMLzyR23+MBiJlNRiPO+Xlx+LSZGR3lCV6d5ThwvaBs+Gwz5dOmadUaIXcNc8eir70xhctYYxVT7pO8W/A21t6EUt2JEnMt5GhpOMy1EI+wkaMfO8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=tvPTvcJw; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=GVdfPmPo; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=tvPTvcJw; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=GVdfPmPo; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="tvPTvcJw";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="GVdfPmPo";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="tvPTvcJw";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="GVdfPmPo"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 8BFD46B6D5;
	Fri, 12 Jun 2026 11:33:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1781263996; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=MLpGTXgk5/yjoyg359rjfvNFwZbVq2RwvWhLIDJ7BmA=;
	b=tvPTvcJwiXVPPg6cbgQaXWqTCHuLJ7Vq6lMX9hxj5qNICK7DSzsSRgi8+QQfGwLBppaw/u
	llDBBqze499hTITTpKlHh9GaUCO7QPP7I1O9ENs2R35Vb/EzCdVjOrmfqYMWlQuPIJLFDn
	VEYOTtOotZoBK6sjO5ku3snFC3HJ3jc=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1781263996;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=MLpGTXgk5/yjoyg359rjfvNFwZbVq2RwvWhLIDJ7BmA=;
	b=GVdfPmPogWIbuJe/nJvZHDTYEZsF/1kRk9lWWWITODjJQYMGPO1LOh/ojrP05Jf7z4+fLX
	f/E91813SFPYDzAg==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1781263996; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=MLpGTXgk5/yjoyg359rjfvNFwZbVq2RwvWhLIDJ7BmA=;
	b=tvPTvcJwiXVPPg6cbgQaXWqTCHuLJ7Vq6lMX9hxj5qNICK7DSzsSRgi8+QQfGwLBppaw/u
	llDBBqze499hTITTpKlHh9GaUCO7QPP7I1O9ENs2R35Vb/EzCdVjOrmfqYMWlQuPIJLFDn
	VEYOTtOotZoBK6sjO5ku3snFC3HJ3jc=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1781263996;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=MLpGTXgk5/yjoyg359rjfvNFwZbVq2RwvWhLIDJ7BmA=;
	b=GVdfPmPogWIbuJe/nJvZHDTYEZsF/1kRk9lWWWITODjJQYMGPO1LOh/ojrP05Jf7z4+fLX
	f/E91813SFPYDzAg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 649F7779A7;
	Fri, 12 Jun 2026 11:33:16 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id sBdVFnzuK2rUeAAAD6G6ig
	(envelope-from <tiwai@suse.de>); Fri, 12 Jun 2026 11:33:16 +0000
Date: Fri, 12 Jun 2026 13:33:15 +0200
Message-ID: <877bo4hu2s.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: HanQuan <eilaimemedsnaimel@gmail.com>
Cc: linux-sound@vger.kernel.org,
	tiwai@suse.de,
	perex@perex.cz
Subject: Re: [PATCH] ALSA: seq: Fix kernel heap address leak in bounce_error_event()
In-Reply-To: <20260612103222.2528305-1-eilaimemedsnaimel@gmail.com>
References: <20260612103222.2528305-1-eilaimemedsnaimel@gmail.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/30.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spam-Flag: NO
X-Spamd-Result: default: False [-3.30 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	FROM_EQ_ENVFROM(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	RCVD_TLS_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid,imap1.dmz-prg2.suse.org:helo]
X-Spam-Level: 
X-Spam-Score: -3.30

On Fri, 12 Jun 2026 12:32:22 +0200,
HanQuan wrote:
> 
> The comment above bounce_error_event() documents that user clients
> should receive SNDRV_SEQ_EVENT_BOUNCE with the original event embedded
> as variable-length data, while kernel clients should receive
> SNDRV_SEQ_EVENT_KERNEL_ERROR with a quoted kernel pointer.
> 
> However, the implementation unconditionally uses
> SNDRV_SEQ_EVENT_KERNEL_ERROR with data.quote.event set to the raw
> struct snd_seq_event pointer for all clients.  When a bounce error
> event is delivered to a USER_CLIENT via snd_seq_read(), the kernel
> heap address in data.quote.event is exposed to userspace through
> copy_to_user() in the fixed-length branch.
> 
> This is a distinct leak path from the one addressed by commit
> 705dd6dcbc0e ("ALSA: seq: Clear variable event pointer on read"),
> which sanitizes data.ext.ptr in the variable-length branch of
> snd_seq_read().  The bounce_error_event() leak uses fixed-length
> events that take the else branch where no sanitization occurs.
> 
> Differentiate the bounce event by client type.  For USER_CLIENT,
> send SNDRV_SEQ_EVENT_BOUNCE with SNDRV_SEQ_EVENT_LENGTH_VARIABLE
> and data.ext pointing to the original event.  The variable-length
> path in snd_seq_event_dup() copies the event data into chained
> cells, and snd_seq_expand_var_event() copies only the content --
> never the pointer -- to userspace.  For KERNEL_CLIENT, keep the
> existing SNDRV_SEQ_EVENT_KERNEL_ERROR behavior with the quoted
> pointer.
> 
> Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2")
> Signed-off-by: HanQuan <eilaimemedsnaimel@gmail.com>

Applied to for-next branch now.  Thanks.


Takashi
