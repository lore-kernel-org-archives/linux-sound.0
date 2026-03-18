Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77EAC2F83AE
	for <linux-sound@vger.kernel.org>; Wed, 18 Mar 2026 11:37:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773833846; cv=none; b=KRflfqyH7hWHTP5zRlm3S7MQ9AYIIVrTljofUpBrQoD4hzJOBYQxTWepaJDnYzNkylB3q6gzlIDrF7Nm+fghFaors/NefEEjED4p3dEJyI7WsFrrrMncX7HjOSf/L+FKgGm+SsizVEJgsFpST7dVuD68ODzCzXgGiH6TcPePlrs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773833846; c=relaxed/simple;
	bh=kHijCpXof1AvO3vESYa0jB2sllfJpm2+/JG2z4d0a/Y=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=AN2mYM5IptS9KDBv8rHqFc7jZsMnS+JnuWyK7dr0K78Ik3I+5tIQKNBK2+B3RlFBA9rreW79mCc/gKMuqbAvL3LQ4gAbofKABHKxOxm9yy1Us/OYCca7QevJOBZX9rQABe5XzafR4bJfCY4rgdOwVWVblz7EzppZ9uaD9NZ6P2M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=ZOokMUhb; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=ISOAUM3I; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=ZOokMUhb; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=ISOAUM3I; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="ZOokMUhb";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="ISOAUM3I";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="ZOokMUhb";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="ISOAUM3I"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id CDFAC4D28E;
	Wed, 18 Mar 2026 11:37:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1773833843; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=cw+ieTXSCyEpCg040MCzcoPTVsbnDij9u2RS+kH4IAk=;
	b=ZOokMUhbqDgSelHfAWvJzr8+bXwyKaZHIU5c8z/i9QBtVhIOKmcrCYhUSAIUVmq8QmJYA3
	a/H5XJP2zIdZBSeiR5GoEQKevxOdm3QMJ/rjRnqEgYp7LX6K/XGKhzGhshy3c/7gq8+aW9
	6JnQbnX5i5pIfMRiDsxWLVssKgrtpdM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1773833843;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=cw+ieTXSCyEpCg040MCzcoPTVsbnDij9u2RS+kH4IAk=;
	b=ISOAUM3ILaZAc0tT1nBx543GqdgUigW5pp2gXcuzH4uCmbUpbY1p+GqqXJFdriOF/U5aSW
	h73iGVGzT5AEDWBA==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1773833843; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=cw+ieTXSCyEpCg040MCzcoPTVsbnDij9u2RS+kH4IAk=;
	b=ZOokMUhbqDgSelHfAWvJzr8+bXwyKaZHIU5c8z/i9QBtVhIOKmcrCYhUSAIUVmq8QmJYA3
	a/H5XJP2zIdZBSeiR5GoEQKevxOdm3QMJ/rjRnqEgYp7LX6K/XGKhzGhshy3c/7gq8+aW9
	6JnQbnX5i5pIfMRiDsxWLVssKgrtpdM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1773833843;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=cw+ieTXSCyEpCg040MCzcoPTVsbnDij9u2RS+kH4IAk=;
	b=ISOAUM3ILaZAc0tT1nBx543GqdgUigW5pp2gXcuzH4uCmbUpbY1p+GqqXJFdriOF/U5aSW
	h73iGVGzT5AEDWBA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 8AB6F4273B;
	Wed, 18 Mar 2026 11:37:23 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id EhOgIHOOummcLQAAD6G6ig
	(envelope-from <tiwai@suse.de>); Wed, 18 Mar 2026 11:37:23 +0000
Date: Wed, 18 Mar 2026 12:37:23 +0100
Message-ID: <87fr5xcqrw.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
Cc: perex@perex.cz,
	Takashi Iwai <tiwai@suse.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Arnd Bergmann <arnd@arndb.de>,
	Wesley Cheng <quic_wcheng@quicinc.com>,
	Mark Brown <broonie@kernel.org>,
	Kees Cook <kees@kernel.org>,
	linux-sound@vger.kernel.org (open list:SOUND),
	linux-kernel@vger.kernel.org (open list)
Subject: Re: [PATCH] ALSA: usb-audio: qcom: Fix the license marking
In-Reply-To: <20260317180943.3062085-1-daniel.lezcano@oss.qualcomm.com>
References: <20260317180943.3062085-1-daniel.lezcano@oss.qualcomm.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/30.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spam-Score: -3.30
X-Spam-Level: 
X-Spamd-Result: default: False [-3.30 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-0.997];
	MIME_GOOD(-0.10)[text/plain];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,suse.de:mid,qualcomm.com:email]
X-Spam-Flag: NO

On Tue, 17 Mar 2026 19:09:38 +0100,
Daniel Lezcano wrote:
> 
> The Copyright for Qualcomm changed its format and replaces the old
> Qualcomm Innovative Center by Qualcomm Technology Inc.
> 
> Signed-off-by: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>

Applied now.  Thanks.


Takashi
