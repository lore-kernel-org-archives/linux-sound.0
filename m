Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B9AC315D51
	for <linux-sound@vger.kernel.org>; Tue,  3 Mar 2026 10:48:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772534932; cv=none; b=EbyTCqDMmH8olr6gZaByAjQK4tpV6GQO6g5WWxBoyReFe7I0pIsqyxIoQuFJk77dQtsyIM+Re+e5R817aguW2ksxhQBSsi7j3LEVsuRJ9YomGXcKLfTBOFrqc37PYpQx+FHmSL3jf/XL52rMYawGY9K16wskesjY9qO1qCSX7GA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772534932; c=relaxed/simple;
	bh=RcDBHB1cBCUqWQwJffiN+rIQwzk7CFFnp93yY6/LYEY=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=QanxyI+B8tn/z25zAiRDYPTOAT7KtS5uhZipCG9UVjKVF+yzv8g8t6z58t7rt4YGWn4YkR+/ZNMtCrkrT6T0KtKNXuneO57r8QUkbXmO1yUwuEddrPUALU+mIMGIzW+/6XTlheULfatCBsMe6C9tC6FL6doD2SsxhSDAxzNL86c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=Om1t0fHK; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=aXHezoTJ; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=Om1t0fHK; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=aXHezoTJ; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="Om1t0fHK";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="aXHezoTJ";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="Om1t0fHK";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="aXHezoTJ"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 7C5B63F8FB;
	Tue,  3 Mar 2026 10:48:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1772534929; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=SL5Gd6eW4dngTWCyYkSL3Dk9ef89AROcSQLW1H5MZnE=;
	b=Om1t0fHKJC2mEmAwIXFYTnZUFOc7IOj93nYAamGPRVjUoMRsD3asPsUrZBStFwLO/ilLrK
	WPfQJ3XRljkLgR/rbHgAVz6XRe5YkUN2I2Gl6Ace+a8uz16IdLObEfCbrTxU3jwsFNdof4
	LgN6y9K8HdJKoMQZrhiKN8INWZeMdlE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1772534929;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=SL5Gd6eW4dngTWCyYkSL3Dk9ef89AROcSQLW1H5MZnE=;
	b=aXHezoTJc80L7gO8pa4Tdf2HD8UEZpN9ArF+Q+EvgN2uz6NS0DdAPwTd1n3lESdjkTC6QM
	2V1TbVG1VAI8Z/CA==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1772534929; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=SL5Gd6eW4dngTWCyYkSL3Dk9ef89AROcSQLW1H5MZnE=;
	b=Om1t0fHKJC2mEmAwIXFYTnZUFOc7IOj93nYAamGPRVjUoMRsD3asPsUrZBStFwLO/ilLrK
	WPfQJ3XRljkLgR/rbHgAVz6XRe5YkUN2I2Gl6Ace+a8uz16IdLObEfCbrTxU3jwsFNdof4
	LgN6y9K8HdJKoMQZrhiKN8INWZeMdlE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1772534929;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=SL5Gd6eW4dngTWCyYkSL3Dk9ef89AROcSQLW1H5MZnE=;
	b=aXHezoTJc80L7gO8pa4Tdf2HD8UEZpN9ArF+Q+EvgN2uz6NS0DdAPwTd1n3lESdjkTC6QM
	2V1TbVG1VAI8Z/CA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 6AC773EA6C;
	Tue,  3 Mar 2026 10:48:49 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id BdpkGZG8pmkIJQAAD6G6ig
	(envelope-from <tiwai@suse.de>); Tue, 03 Mar 2026 10:48:49 +0000
Date: Tue, 03 Mar 2026 11:48:49 +0100
Message-ID: <87ecm1jii6.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Gilberto Ferreira <gilberto.nunes32@gmail.com>
Cc: Takashi Iwai <tiwai@suse.de>,
	linux-sound@vger.kernel.org
Subject: Re: No HDMI audio with Linux Kernel 7 rc1 or rc2...
In-Reply-To: <CAOKSTBtQi6ZmLmy6u5mP9_gLKZTZHmbb9S36hO99xSsk_EEbcA@mail.gmail.com>
References: <CAOKSTBs1VNBdjRZe3M2v-nC+pLZZ0-KQtRUZUj6ACqb4Xe7LDg@mail.gmail.com>
	<87qzq2kxrc.wl-tiwai@suse.de>
	<CAOKSTBtpqPEnihFhopocV_RC8VR_RribXctUayEkUCav3omr3g@mail.gmail.com>
	<87ldgakvsc.wl-tiwai@suse.de>
	<CAOKSTBvbopXOuOfstmasijZgUnT9_qW_dsaeMcHUXhyjj3iRmw@mail.gmail.com>
	<CAOKSTBsWiwwwrmBt3dshrYYo3fQN9eF-gi2Z7BoX6c-Nb3ZoHg@mail.gmail.com>
	<CAOKSTBvND=d4Fq7mt=36p2Y+hKr6aDUbJ6zA4wDOWASwcWjmNQ@mail.gmail.com>
	<87h5qxl8tj.wl-tiwai@suse.de>
	<CAOKSTBtQi6ZmLmy6u5mP9_gLKZTZHmbb9S36hO99xSsk_EEbcA@mail.gmail.com>
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
	NEURAL_HAM_SHORT(-0.20)[-0.999];
	MIME_GOOD(-0.10)[text/plain];
	TAGGED_RCPT(0.00)[];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[gmail.com];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_THREE(0.00)[3];
	RCVD_TLS_ALL(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,suse.de:mid]
X-Spam-Flag: NO

On Tue, 03 Mar 2026 11:27:24 +0100,
Gilberto Ferreira wrote:
> 
> Sorry... I am not an expert on this stuff.
> I just like to compile the kernel...
> 
> >> You need to *compare* between two kernel logs.  You can strip the time
> >> prefix, and check which lines appear and which disappear in the new
> >> kernel log.
> How can I do that?
> Via journalctl -xe -p3? journalctl -r -b?

You can run "dmesg > dmesg.log" on the running kernel.  And you can
get two outputs.  You can strip the time prefix from there by some
script for easier comparison.

> >> And, have you tested the revert?
> I don't know how to do that.
> 
> If you can point me to some doc, it would be nice.

Have you ever built a kernel by yourself?  If yes, it should be just a
git revert of the suggested commit and rebuild / retest.
If not, which (distro) kernel are you using?  Usually you can ask
distro people to build a test kernel.

In general, please be more specific about your system and
configuration.


Takashi
