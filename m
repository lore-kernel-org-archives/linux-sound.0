Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31E2C3E3DBE
	for <linux-sound@vger.kernel.org>; Fri, 15 May 2026 09:23:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778837005; cv=none; b=BgjSfU6gbAbTh1qOmlGkhOuA/rvUKWzkiZDIYclicPXaxIOHAkbPSe/OhdUJH0AuhOc6auWH5wn+iYgC8fmvWydor29nga7p8mtJS57nc8AV6Dn09txx3PPkan2+9Qzc7g4MDFTXAObwNwNnivulbfQ0ya2xqTP47fHmThzwRGg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778837005; c=relaxed/simple;
	bh=jk4SivL5NyLChnpsNKgk5wo2TNTULMt+InfGuCviOYk=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=j5c6V1GT1bsR614t9do2eMp7B/IhS169Bk9J+eGgojqMdwVGH7hM0N88kBFWcgC9IECIOfUi++2IJpmnEjbytP4Kikut5RrUK7czY+MmL5wY7RjPiZE3+z0UxCn02iCafdjSt2kyj5QaUBRU4HZV8inArxHlK4KW6fXGysh3gB0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=MoLB+OD2; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=+dMuRtUX; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=MoLB+OD2; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=+dMuRtUX; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="MoLB+OD2";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="+dMuRtUX";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="MoLB+OD2";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="+dMuRtUX"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 251DC5E9FF;
	Fri, 15 May 2026 09:23:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1778837002; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=D5kjJXZLJ9Tj1AI3227jvSbxpgzphGtg9MGxzk4SdBI=;
	b=MoLB+OD2W5OVfKqArZB50nMqlhKaWhZy8FcntvnXC4NT6AzoiYk5d2IDNAjbqBLlKCLjpC
	QwwTBpCVQfcQ+CV0wYJwrXHHOS1GTTp2/GVJQ9JRRxTUbdU1escBTwyCpP6xQhhyDdZmbC
	D2eMfarpufsjNPHUp4lfv7yLyMlOTac=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1778837002;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=D5kjJXZLJ9Tj1AI3227jvSbxpgzphGtg9MGxzk4SdBI=;
	b=+dMuRtUXJf5piH+Rk/+zJLoJR/kCOourh8EyTo4NkPERaruldH5ipZoUJmJjUcF5AN+rW5
	SKoCRN+0O8p/LhDg==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=MoLB+OD2;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=+dMuRtUX
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1778837002; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=D5kjJXZLJ9Tj1AI3227jvSbxpgzphGtg9MGxzk4SdBI=;
	b=MoLB+OD2W5OVfKqArZB50nMqlhKaWhZy8FcntvnXC4NT6AzoiYk5d2IDNAjbqBLlKCLjpC
	QwwTBpCVQfcQ+CV0wYJwrXHHOS1GTTp2/GVJQ9JRRxTUbdU1escBTwyCpP6xQhhyDdZmbC
	D2eMfarpufsjNPHUp4lfv7yLyMlOTac=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1778837002;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=D5kjJXZLJ9Tj1AI3227jvSbxpgzphGtg9MGxzk4SdBI=;
	b=+dMuRtUXJf5piH+Rk/+zJLoJR/kCOourh8EyTo4NkPERaruldH5ipZoUJmJjUcF5AN+rW5
	SKoCRN+0O8p/LhDg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 0142E593A9;
	Fri, 15 May 2026 09:23:21 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id GeppOgnmBmovagAAD6G6ig
	(envelope-from <tiwai@suse.de>); Fri, 15 May 2026 09:23:21 +0000
Date: Fri, 15 May 2026 11:23:21 +0200
Message-ID: <87fr3tt4ae.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Sergio Boglione <sboglione@gmail.com>
Cc: linux-sound@vger.kernel.org,
	tiwai@suse.de
Subject: Re: [PATCH v2] ALSA: hda/realtek: Add quirk for HP 250 G10 (103c:8b34)
In-Reply-To: <CABuY3nGSONJn1bxoUVKScwKDc5npcYQTa8ktD=v0gZRV2-x04Q@mail.gmail.com>
References: <CABuY3nGSONJn1bxoUVKScwKDc5npcYQTa8ktD=v0gZRV2-x04Q@mail.gmail.com>
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
	RCPT_COUNT_THREE(0.00)[3];
	RCVD_TLS_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid,suse.de:dkim,imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DKIM_TRACE(0.00)[suse.de:+]
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Rspamd-Queue-Id: 251DC5E9FF
X-Spam-Level: 

On Thu, 07 May 2026 15:03:46 +0200,
Sergio Boglione wrote:
> 
> 
> HP 250 15.6 inch G10 Notebook PC uses the same ALC236 codec
> as the HP 255 15.6 inch G10 (103c:8b2f) and requires the same
> fixup to enable the internal speaker EAPD and microphone routing.
> 
> Signed-off-by: Sergio Boglione <sboglione@gmail.com>

The patch isn't applicable via git-am due to the broken spaces.
Please try to fix your mailer setup and resubmit.


thanks,

Takashi
