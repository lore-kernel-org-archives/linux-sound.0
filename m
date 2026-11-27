Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=195.135.223.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795800676;
	b=14+3L5EWTljtK4g33bQVGCaDaXxcTkhKts6yPQwTVU8pO5bf+LrTMOpydl8EUyq3vd5A
	 7c1O7TMoMlAib4qIpsFaXnhui1oyIGCdYRGN2mEfcTBUR0fPU29m+pCh+oBLIGjZpm+Vc
	 Twd9QN52wZqfhfFjHVa5gacta1r7RPjWQEvOKRJ3mv4eNwlEhj0dr59pQN4IGDocKy4GB
	 wkuJGLK7aIZkVRuNU+qqPq6rG2DXQSWwD9WpCr9LEfzJ0+wjp78pOS6lcCiXpR2jjsXDL
	 lV+Vbr1R2HkGufyLq+hZXFDb4gMxesaEfre6VdWx7VyVJ6GA426cSMHEAwwyk1Isf7w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795800676;
	h=DMARC-Filter:Received:DKIM-Signature:DKIM-Signature:DKIM-Signature:
	 DKIM-Signature:Received:Received:Date:Message-ID:From:To:Cc:Subject:
	 In-Reply-To:References:User-Agent:MIME-Version:Content-Type:
	 X-Spamd-Result:X-Spam-Score:X-Spam-Level:X-Spam-Flag;
	bh=uE8aUQ/G8XIrC9XgxsU/2hzRVqd7wp0m+POv41DuWtM=;
	b=C7rexc7sIbZHhm53S/ih51IV0C+NXwlacI+CusRBy0+2+cRfINKi2ZW2iPc7OdedpMRI
	 gVnVWvbVjzbF7MFoITwjOIX8Llc9Ripg98s194+FZUMs5evFHmrcZBGGr70NAt2oYT+bT
	 pZYnU9kb9mGcSPixVljTBG63gD5V/SdMTuOrzYwRa7aJPJEgVFultcG42LAexi0yxW0jz
	 Ole2OPDxr3tIWA5qhTdM35FVx+MhxGn6X5mjUR9Xz71kHeNoVNshWCn8+oiNr5BL6ERpn
	 EIWIzgMhPo5noCxmgA6Hl/GdNpyVqTrdD3bhZKEI0wVHMufzC1wA8H+JhCkiyDWqWTA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.de;
	spf=pass smtp.mailfrom=suse.de;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=wlicdtYx;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=YK408Gcz;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=wlicdtYx;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=YK408Gcz;
	arc=none smtp.remote-ip=195.135.223.131
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FDF8606A31C;
	Fri, 27 Nov 2026 17:31:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5FDF8606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=wlicdtYx;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=YK408Gcz;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=wlicdtYx;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=YK408Gcz
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 920241F46E;
	Fri, 27 Nov 2026 17:31:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1795800674; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=uE8aUQ/G8XIrC9XgxsU/2hzRVqd7wp0m+POv41DuWtM=;
	b=wlicdtYxS6fCgvPU5IQzmkQQxiz8MuvnTeCJLeau/SKqBizT5tJBMTWJrI/vKu90WGpOV3
	ILloM/Ajuo+LUuYCkLA+oC4G/Tv9tnzjcg9K777A1/S2gXAj9tA3Ln5BHIHV2+yMWJx37F
	Rw+K6LBB/VAiWcrQY9YB6/czp0BuA3k=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1795800674;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=uE8aUQ/G8XIrC9XgxsU/2hzRVqd7wp0m+POv41DuWtM=;
	b=YK408GczRGp8Xom7A2WxDkCjtUOjNkt2sNPpEi+YpnqrVbeiQA8OdNsKknpcrbBHIISRIq
	jb5zbaUeOqcSVFBQ==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1795800674; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=uE8aUQ/G8XIrC9XgxsU/2hzRVqd7wp0m+POv41DuWtM=;
	b=wlicdtYxS6fCgvPU5IQzmkQQxiz8MuvnTeCJLeau/SKqBizT5tJBMTWJrI/vKu90WGpOV3
	ILloM/Ajuo+LUuYCkLA+oC4G/Tv9tnzjcg9K777A1/S2gXAj9tA3Ln5BHIHV2+yMWJx37F
	Rw+K6LBB/VAiWcrQY9YB6/czp0BuA3k=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1795800674;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=uE8aUQ/G8XIrC9XgxsU/2hzRVqd7wp0m+POv41DuWtM=;
	b=YK408GczRGp8Xom7A2WxDkCjtUOjNkt2sNPpEi+YpnqrVbeiQA8OdNsKknpcrbBHIISRIq
	jb5zbaUeOqcSVFBQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 4991C134E8;
	Fri, 27 Nov 2026 17:31:14 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id At69CGK+CWvsDwAAD6G6ig
	(envelope-from <tiwai@suse.de>); Fri, 27 Nov 2026 17:31:14 +0000
Date: Fri, 27 Nov 2026 18:31:13 +0100
Message-ID: <87h5h2mba6.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Sreeraj S Kurup <sreekuttan2156239@gmail.com>
Cc: perex@perex.cz,
	tiwai@suse.de,
	linux-kernel@vger.kernel.org,
	linux-sound@vger.kernel.org
Subject: Re: [PATCH] ALSA: vmaster: Check follower callback errors
In-Reply-To: <20261126065310.3451-1-sreekuttan2156239@gmail.com>
References: <20261126065310.3451-1-sreekuttan2156239@gmail.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/30.2 Mule/6.0
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Post: <mailto:linux-sound@vger.kernel.org>
List-Help: <mailto:linux-sound+help@vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-sound+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spamd-Result: default: False [-12.30 / 50.00];
	SUSE_INTERNAL_BYPASS(-9.00)[];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	FROM_EQ_ENVFROM(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	RCVD_TLS_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo]
X-Spam-Score: -12.30
X-Spam-Level: 
X-Spam-Flag: NO

On Thu, 26 Nov 2026 07:53:10 +0100,
Sreeraj S Kurup wrote:
> 
> Check the return values of follower_get_val() and
> follower_put_val() in sync_followers().
> 
> Stop synchronization and return the error when either
> callback fails.
> 
> Signed-off-by: Sreeraj S Kurup <sreekuttan2156239@gmail.com>

Applied to for-next branch now.  Thanks.


Takashi
