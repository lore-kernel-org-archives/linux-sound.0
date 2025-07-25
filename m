Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 174BD291C0F
	for <linux-sound@vger.kernel.org>; Fri, 25 Jul 2025 07:13:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753427623; cv=none; b=Hn/CXp712KDU4YTYBkB9pzY4RU0y7WXgnugO4ib2kUXaesUKqeQ6ir6jmHvSAWLpU8sq+pQjBPShihSFwKYwf0LRbNTK/AI7Gj0OT3NXrdgKtnoXFw74yiNjbxTIB+p11sUIKqMM/w4rYoz1EHay7w1m9OwMTfkPke4d/slvTK8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753427623; c=relaxed/simple;
	bh=/IkDkDbWAVH+ZJLhTp3vFZDgVPllBPScloI4CyVXMyY=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=KJy66Eh8YLj9N7q9ej6S+SehSqEnWi9oReGE6WPPq22N+rsBkTXA/bY3GDNsBCQP3Dpoi3QnbUtVOda1jAEHtR5DhDNq5naOflSAYa8fAwL1FReOzMh6GwYUTxML997/55LqKxnsX8tjig4xGXOrLGXZyTqsZQagsMnkr2qxN4k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=Yv9bAb8s; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=YYljWWsL; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=Yv9bAb8s; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=YYljWWsL; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="Yv9bAb8s";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="YYljWWsL";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="Yv9bAb8s";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="YYljWWsL"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 31525218E6;
	Fri, 25 Jul 2025 07:13:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1753427619; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=VEjNs39rbDw3xe1WcmCyVCH4R75euEwRyxD46VfmQAg=;
	b=Yv9bAb8sdS9G5WL5yivSMPoc1OdBgmKHxt2MYHfNmoZmPhIO8nNq8ZYUOxqvzs8szY21Gd
	W65A7nldIpbPIvlPTL0Zbjf7m4ZkWN27+brr+bemOLur/k3jtwLv6P3XreIudiK8neWuJw
	xixLT2Ra4tkct6iuUmmrmY6M7CvDxAo=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1753427619;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=VEjNs39rbDw3xe1WcmCyVCH4R75euEwRyxD46VfmQAg=;
	b=YYljWWsLde049BD53Xulfcx+E0v3cRrhdw/vYJ5tmVhItzWE4WfO4G+LlNnPZ7OCd8FA7h
	YOQAg3cjcs/prbCg==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=Yv9bAb8s;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=YYljWWsL
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1753427619; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=VEjNs39rbDw3xe1WcmCyVCH4R75euEwRyxD46VfmQAg=;
	b=Yv9bAb8sdS9G5WL5yivSMPoc1OdBgmKHxt2MYHfNmoZmPhIO8nNq8ZYUOxqvzs8szY21Gd
	W65A7nldIpbPIvlPTL0Zbjf7m4ZkWN27+brr+bemOLur/k3jtwLv6P3XreIudiK8neWuJw
	xixLT2Ra4tkct6iuUmmrmY6M7CvDxAo=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1753427619;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=VEjNs39rbDw3xe1WcmCyVCH4R75euEwRyxD46VfmQAg=;
	b=YYljWWsLde049BD53Xulfcx+E0v3cRrhdw/vYJ5tmVhItzWE4WfO4G+LlNnPZ7OCd8FA7h
	YOQAg3cjcs/prbCg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 0406B134E8;
	Fri, 25 Jul 2025 07:13:38 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id L8tvO6Iug2gERwAAD6G6ig
	(envelope-from <tiwai@suse.de>); Fri, 25 Jul 2025 07:13:38 +0000
Date: Fri, 25 Jul 2025 09:13:38 +0200
Message-ID: <87a54skajh.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: edip@medip.dev
Cc: perex@perex.cz,
	tiwai@suse.com,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: Re: [PATCH] ALSA: hda/realtek - Fix mute LED for HP Victus 16-r1xxx
In-Reply-To: <20250724210756.61453-2-edip@medip.dev>
References: <20250724210756.61453-2-edip@medip.dev>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spam-Level: 
X-Spam-Flag: NO
X-Rspamd-Queue-Id: 31525218E6
X-Rspamd-Action: no action
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spamd-Result: default: False [-3.51 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_CONTAINS_FROM(1.00)[];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	DKIM_TRACE(0.00)[suse.de:+];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	TO_DN_NONE(0.00)[];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	DNSWL_BLOCKED(0.00)[2a07:de40:b281:106:10:150:64:167:received,2a07:de40:b281:104:10:150:64:97:from];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:dkim,suse.de:mid,imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo]
X-Spam-Score: -3.51

On Thu, 24 Jul 2025 23:07:56 +0200,
edip@medip.dev wrote:
> 
> From: Edip Hazuri <edip@medip.dev>
> 
> The mute led on this laptop is using ALC245 but requires a quirk to work
> This patch enables the existing quirk for the device.
> 
> Tested on Victus 16-r1xxx Laptop. The LED behaviour works
> as intended.
> 
> Cc: <stable@vger.kernel.org>
> Signed-off-by: Edip Hazuri <edip@medip.dev>

The HD-audio code was relocated and split to different files recently
(for 6.17 kernel), e.g. this Realtek codec is now located in
sound/hda/codecs/realtek/alc269.c.

As I already closed the changes for 6.16 and it'll be put for
6.17-rc1, could you rebase on for-next branch of sound.git tree and
resubmit?


thanks,

Takashi
