Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB9F7405FB
	for <linux-sound@vger.kernel.org>; Wed, 13 Mar 2024 13:35:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710336936; cv=none; b=WBMV9/nHTAu9lvQVfjpbUOqlQ8Rgty6AlsPLRFs0NYNdPGPt/bopPp1r8FxwybKOa5io/F4oR69hkbdNmaKXkW/idn+UClKVKsd+yGaIcpwPohY+C+B9tEddQ9sGqIgTDNrpDtm3rrxau6DKyDARrxwg9OKx7ISO5ZW6EchGU74=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710336936; c=relaxed/simple;
	bh=CokjGX//cJFbw44r1bS0dENKpCmRyQvr8ZbTBnc8CsU=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=oDXoCsfemBXV5sYMkQjnfqTyF+aKrlr0JiRdbw61TvGa5M4fvBmF4AeXajeuX41/nxYnDxlS833mItbo35iD9Q6IxtR5A2n0ZwNxcvaPo8u7IxnqsK7+NUQNwfhjnhtbK78z8r3j7vamwAaLTrJgWjZTg4eSMnWT7l9jhAHcvYo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=xX0ltKuo; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=p0x0WeL5; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=IQbl+Ji2; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=UGYgGKjx; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="xX0ltKuo";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="p0x0WeL5";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="IQbl+Ji2";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="UGYgGKjx"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id BF86321C90;
	Wed, 13 Mar 2024 13:35:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1710336932; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=9D0ufr8Z37MM8x6WOeVfHqDwfgTiJim497v+kgweWOU=;
	b=xX0ltKuovcL4/sPO+4q5CCYaDULCDwKdgL/vRomfLh3cUGyKvdFYP8VC1qWb4e0+hOWXtK
	7uvkKDnyHkadVCQ2tcEr0pc4CgWk6VBXOfWrEMNKRmXOSR3mFXb/RS13JktNIxOX+L5etK
	/yr21bZ9aC7z+N+6btEB0c3IWjk6/gI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1710336932;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=9D0ufr8Z37MM8x6WOeVfHqDwfgTiJim497v+kgweWOU=;
	b=p0x0WeL57uHRsRZkJaf9yCbJOh2KyA/4XLBx4GOP77VH7gV8vjGCZcf9aXUv/BV2MJJqqA
	7Yk6CuGNNOlzLeAw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1710336931; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=9D0ufr8Z37MM8x6WOeVfHqDwfgTiJim497v+kgweWOU=;
	b=IQbl+Ji2/bQizWZNy+9jcoSe8IYbh1WftLUfl5OrNaIqIRzr/JkT/lLrvAkLYaUGf0/oPf
	6kXZe9F7KfcRV4IbYsP+6sqaWnkyua3BjXO3yeEDQ1NzNs2DGB7bYWOq+/8+0sEkGHIzCy
	zLpYEzZVGMY1uOZu8gxl9YO5pb1wlF4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1710336931;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=9D0ufr8Z37MM8x6WOeVfHqDwfgTiJim497v+kgweWOU=;
	b=UGYgGKjxZEXvLZyTctKl9KiVw9qp3CSTUE0gKWoVjkr1JQ1pgOKGHS4rveD76OLw3PsAJU
	mgaejSyXJTjbhWDw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 8E5061397F;
	Wed, 13 Mar 2024 13:35:31 +0000 (UTC)
Received: from dovecot-director2.suse.de ([10.150.64.162])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id GlfUIKOr8WWWTQAAD6G6ig
	(envelope-from <tiwai@suse.de>); Wed, 13 Mar 2024 13:35:31 +0000
Date: Wed, 13 Mar 2024 14:35:31 +0100
Message-ID: <87y1amntjw.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Johan Carlsson <johan.carlsson@teenage.engineering>
Cc: tiwai@suse.com,
	linux-sound@vger.kernel.org
Subject: Re: [PATCH v2] ALSA: usb-audio: Stop parsing channels bits when all channels are found.
In-Reply-To: <20240313081509.9801-1-johan.carlsson@teenage.engineering>
References: <20240313081509.9801-1-johan.carlsson@teenage.engineering>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
Authentication-Results: smtp-out1.suse.de;
	none
X-Spam-Level: 
X-Spam-Score: -2.56
X-Spamd-Result: default: False [-2.56 / 50.00];
	 ARC_NA(0.00)[];
	 RCVD_VIA_SMTP_AUTH(0.00)[];
	 FROM_HAS_DN(0.00)[];
	 RCPT_COUNT_THREE(0.00)[3];
	 TO_DN_SOME(0.00)[];
	 TO_MATCH_ENVRCPT_ALL(0.00)[];
	 MIME_GOOD(-0.10)[text/plain];
	 NEURAL_HAM_LONG(-1.00)[-1.000];
	 RCVD_COUNT_THREE(0.00)[3];
	 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	 NEURAL_HAM_SHORT(-0.20)[-1.000];
	 MID_CONTAINS_FROM(1.00)[];
	 DBL_BLOCKED_OPENRESOLVER(0.00)[teenage.engineering:email];
	 FUZZY_BLOCKED(0.00)[rspamd.com];
	 FROM_EQ_ENVFROM(0.00)[];
	 MIME_TRACE(0.00)[0:+];
	 RCVD_TLS_ALL(0.00)[];
	 BAYES_HAM(-2.26)[96.50%]
X-Spam-Flag: NO

On Wed, 13 Mar 2024 09:15:09 +0100,
Johan Carlsson wrote:
> 
> If a usb audio device sets more bits than the amount of channels
> it could write outside of the map array.
> 
> Signed-off-by: Johan Carlsson <johan.carlsson@teenage.engineering>

Applied now.  Thanks.


Takashi
