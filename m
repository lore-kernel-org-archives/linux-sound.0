Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C69B40910F;
	Tue, 11 Aug 2026 06:46:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786430774; cv=none; b=hEJqAwxwLa0y5lUmTjbULguiQxl9T8khHIsWeEE55+eA+4ILzJvFYP7R/ZVSJj8smNROSeNLrzIgs78EzXD36DYIEWlDnl0FMjj8FxmLgGPcTHdxBk3lU0o7SP0mPDdvPxFZoxUY7Z7BeNdVKxf+4W1mTe8imI7i4iEcLlqQSy4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786430774; c=relaxed/simple;
	bh=k9y1KFjcmpbi0T/+kQYRnW6rUivltXqz0ri4nq2CQfU=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=d0h5y0hL0sEHEYJ4bnOeD5JcjjwFirdDTB0np/qmlII7tUbOTEwX8BTx+aGu5y6CmR5m9cUt5jUtTikP3kd3jS3UqWvNPs6mKrp6bR9FoaCcupfR8TW1qnNdCByd3TIovJDM/LNpRO+xkxo3nstQDAG4AKZfy1qW8NrLAzo8mss=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=o8Ri+Vkx; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=LLNujMID; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=k7uTarWA; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=jeXOd7Io; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="o8Ri+Vkx";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="LLNujMID";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="k7uTarWA";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="jeXOd7Io"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id A3DF1818FF;
	Tue, 11 Aug 2026 06:45:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1786430762; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=+Cr3aHzjJU6KIVlFcJcF8zvJcaLyw5cP4E1nlJPKBN0=;
	b=o8Ri+VkxdTlGQev6upDAVo/DXsinxI9bAmRHd1HOE/b2YhDogFtXQX+PBQimMCxMsFqmDs
	m0BABqgEGnjR9fTQsH0FVg4cRXsM62npGFk6D1pBa8CNWCPpJxHXSQ/dKvtYG8KZzw86wt
	omlm2jbv7E5iyHalwMKq9cfsaiHInBI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1786430762;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=+Cr3aHzjJU6KIVlFcJcF8zvJcaLyw5cP4E1nlJPKBN0=;
	b=LLNujMIDHI+eEsslp8JuxEvovtpprfUIwG+hdruuJQ/y01m5rMSP+3rhHNgxbCA/XbR9bY
	iYaQhHGXAyRq+RDw==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=k7uTarWA;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=jeXOd7Io
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1786430758; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=+Cr3aHzjJU6KIVlFcJcF8zvJcaLyw5cP4E1nlJPKBN0=;
	b=k7uTarWASFeq+5wlKwboBx7YdJ7vbZSQqdcnc1MrN8a5lz4NqrfwEaP6dTFHQskK+/YJLa
	kzvoG4oAIJZq/K36IB5q3unXbghkWOPdOjRBMgf10aZR4bCEkkLArakDG8xEbXkVDXxenR
	NKBa2NnBprpe7SjbImzCJkpbNGKIIvU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1786430758;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=+Cr3aHzjJU6KIVlFcJcF8zvJcaLyw5cP4E1nlJPKBN0=;
	b=jeXOd7Io2jq8NcPijKP7XSLLu+yLTzeV+4xuHjvfrZ6xEd10UyeCdEhFcPNZOddMCtqZII
	EwGJjrNZDdo6h0Cw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 6DBC8779B6;
	Tue, 11 Aug 2026 06:45:58 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id 0il5GSbFemrtXQAAD6G6ig
	(envelope-from <tiwai@suse.de>); Tue, 11 Aug 2026 06:45:58 +0000
Date: Tue, 11 Aug 2026 08:45:58 +0200
Message-ID: <874ih1b1eh.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Zhang Heng <zhangheng@kylinos.cn>
Cc: tiwai@suse.de,
	linux-kernel@vger.kernel.org,
	linux-sound@vger.kernel.org,
	perex@perex.cz,
	Branislav Klocok <branislav.klocok@orava.sk>
Subject: Re: [PATCH v2] ALSA: hda/realtek: Rename Line Out control to Headphone on ThinkPad X1 Carbon 6th
In-Reply-To: <20260811062734.400512-1-zhangheng@kylinos.cn>
References: <87fr0lb2yg.wl-tiwai@suse.de>
	<20260811062734.400512-1-zhangheng@kylinos.cn>
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
	TO_DN_SOME(0.00)[];
	ARC_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MIME_TRACE(0.00)[0:+];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	RCVD_TLS_ALL(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	DNSWL_BLOCKED(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[orava.sk:email,imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo,kylinos.cn:email,suse.de:mid,suse.de:dkim];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	DKIM_TRACE(0.00)[suse.de:+]
X-Spam-Flag: NO
X-Spam-Score: -3.51
X-Spam-Level: 
X-Rspamd-Queue-Id: A3DF1818FF
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Action: no action

On Tue, 11 Aug 2026 08:27:34 +0200,
Zhang Heng wrote:
> 
> The ThinkPad X1 Carbon 6th Gen (ALC285, SSID 17aa:225c) has no physical
> Line Out jack. The 3.5mm headphone jack is wired to the headphone DAC,
> but the ALSA HDA driver names the corresponding control as
> "Line Out Playback Volume" (node 0x02).
> 
> PipeWire's ALSA Card Profile (ACP) silences "Line Out" when headphones
> are activated, which incorrectly mutes the headphone output.
> 
> Add a quirk to rename the control to "Headphone Playback Volume" via
> alc285_lenovo_dac_rename().
> 
> Tested on openSUSE Tumbleweed (kernel 7.1.5):
> - Control renamed successfully, no name collision with "Headphone Playback Switch"
> - Headphone output works across multiple PipeWire/WirePlumber restarts
>   and port switches
> 
> Closes: https://bugzilla.kernel.org/show_bug.cgi?id=221522
> Signed-off-by: Zhang Heng <zhangheng@kylinos.cn>
> Tested-by: Branislav Klocok <branislav.klocok@orava.sk>

Applied now to for-next branch.  Thanks.


Takashi
