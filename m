Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DE7825D527
	for <linux-sound@vger.kernel.org>; Tue, 19 May 2026 05:35:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779168950; cv=none; b=K4sbTqdbXYuw2eTD1c6bVR8TdhDV2EN6XUu939nk0672lHXEzerW1Nc/hqQZA3UeQqpeoQhJHfw2IYiDK2MvqbdQ2SDHH6vSORaFhwrlzM3l3QR+R6upfMzJ5b/KB63YWJ4iRALwZ/KuWaSLuKSTqyQQMluC+POtGKVL1B31B6w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779168950; c=relaxed/simple;
	bh=iHK+3ABUT3A3XFgdlwIRt+WFjZ9Vh1AwfPQEKl7plEs=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=rXaehhmpz+MX49Z53GAtaYL8ReUQPvZa7pcPu9vZ5lAek+9jwvc+577eTWm0RCoaDdLjs5grNVV2HfMIu2YVD7lDY/XvC5q2G9WfCRtoWVwb2wT1WoC4YWcqcSbVE/szROzJg611mbd1LRkLwh44OdYwkzZf8pjZa7BuQ4ElHuc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=oeBu4Ovz; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=7oIlBDE5; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=oeBu4Ovz; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=7oIlBDE5; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="oeBu4Ovz";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="7oIlBDE5";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="oeBu4Ovz";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="7oIlBDE5"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 16FFF6C0D2;
	Tue, 19 May 2026 05:35:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1779168947; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=bKgFgz3u6T8iVfiWH6U4Rhca8YewnRRFOqnYTVC5PSo=;
	b=oeBu4OvzOyfNhDlWt+b+GjXj+QX5nEsKVrCvwAN852gNYy5akfkVUAGIGtXMiOeVrRkhgH
	P/cXzQcNaeDg7UR8jXLUHJyPtiOa8OlkIUBNIph7ecslT94h2k8rtDBPzzYCas4aAC8GqJ
	NOUuRsKyBguwAAyhlwcnTVZXwr6DUCE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1779168947;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=bKgFgz3u6T8iVfiWH6U4Rhca8YewnRRFOqnYTVC5PSo=;
	b=7oIlBDE56CQzKsP64fnz95Xt2vReCdYJQmYqPdZXe8DyuF4RUIv9reyWnpCH35pwyl66pN
	3JqZYINWzf6NUdBQ==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=oeBu4Ovz;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=7oIlBDE5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1779168947; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=bKgFgz3u6T8iVfiWH6U4Rhca8YewnRRFOqnYTVC5PSo=;
	b=oeBu4OvzOyfNhDlWt+b+GjXj+QX5nEsKVrCvwAN852gNYy5akfkVUAGIGtXMiOeVrRkhgH
	P/cXzQcNaeDg7UR8jXLUHJyPtiOa8OlkIUBNIph7ecslT94h2k8rtDBPzzYCas4aAC8GqJ
	NOUuRsKyBguwAAyhlwcnTVZXwr6DUCE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1779168947;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=bKgFgz3u6T8iVfiWH6U4Rhca8YewnRRFOqnYTVC5PSo=;
	b=7oIlBDE56CQzKsP64fnz95Xt2vReCdYJQmYqPdZXe8DyuF4RUIv9reyWnpCH35pwyl66pN
	3JqZYINWzf6NUdBQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 00DE6593A8;
	Tue, 19 May 2026 05:35:46 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id KKwHO7L2C2qAYQAAD6G6ig
	(envelope-from <tiwai@suse.de>); Tue, 19 May 2026 05:35:46 +0000
Date: Tue, 19 May 2026 07:35:46 +0200
Message-ID: <87h5o43qrx.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: "eziogale@gmail.com" <eziogale@gmail.com>
Cc: Jaroslav Kysela ` <perex@perex.cz>,
	linux-sound@vger.kernel.org,
	alsa-devel@alsa-project.org
Subject: Re: [PATCH] ALSA: hda/ca0132: add QUIRK_GENERIC path for Gigabyte, GA-Z170X-Gaming G1
In-Reply-To: <0c0b781f-1595-4595-921a-66d83cf5930b@gmail.com>
References: <a1dd5dfd-8678-4dd9-b6af-68a1e078168a@gmail.com>
	<87tss7xyj5.wl-tiwai@suse.de>
	<2f45fd6e-0a5b-4f47-9f2b-75d8b323ced8@gmail.com>
	<87h5o5ersn.wl-tiwai@suse.de>
	<0c0b781f-1595-4595-921a-66d83cf5930b@gmail.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/30.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spam-Flag: NO
X-Spam-Score: -3.51
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-3.51 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	FREEMAIL_TO(0.00)[gmail.com];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	RCVD_TLS_ALL(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	DNSWL_BLOCKED(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	RCPT_COUNT_THREE(0.00)[4];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DKIM_TRACE(0.00)[suse.de:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid,suse.de:dkim,imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo]
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Rspamd-Queue-Id: 16FFF6C0D2
X-Spam-Level: 

On Mon, 18 May 2026 11:23:25 +0200,
eziogale@gmail.com wrote:
> 
> Sorry, with gmail and OAUTH2 it's a bit complicated. I'v to make an
> attachmant.
> Tanks for the patience.
> 
> From 6411be653404246e661d6bcf418345abf866e098 Mon Sep 17 00:00:00 2001
> From: Ezio Galeazzi <eziogale@gmail.com>
> Date: Sun, 17 May 2026 17:42:36 +0200
> Subject: [PATCH] ALSA: hda/ca0132: add QUIRK_GENERIC path for Gigabyte
>  GA-Z170X-Gaming G1
> 
> Some CA0132 implementations (e.g. Gigabyte GA-Z170X-Gaming G1) produce white noise when using the DSP firmware path. Add a QUIRK_GENERIC path that uses the standard HDA generic parser instead, with custom pin configs.
> This patch applies against v6.18.24.
> 
> Signed-off-by: Ezio Galeazzi <eziogale@gmail.com>

Thanks, applied to for-next branch now.


Takashi
