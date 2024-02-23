Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C527060DD1
	for <linux-sound@vger.kernel.org>; Fri, 23 Feb 2024 14:52:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708699941; cv=none; b=WuJxA5DtcI7zLCPFWAK4YguukeGvCh/zs8hM46OAsgOmZl/iESDSohvFxTLaCXYglwa5ASvxHRU/CzxUY3CjrS/Begamf+i4a4XRNKt0Jz+q7Vrfdx/dvhAJ1Me88cvUkXCfyrtfWWnFEZkC2nS45FXaaX9+NgG2oaxdLeVJA5E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708699941; c=relaxed/simple;
	bh=J/Kh4UtVtXhc+bajthUcdKyuEGYlvN5+uE4K/npxcHY=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=fEukxtp7GBhMVgu83ruoQvPUR6h4zT3ih/mBcGGtzqai3iaeMVnR5kX7AS1aLWu6cJDciYVaCtvFgSei9roOSmB+MXGJtFBcQWKE/c1vZ00MhIIVobm2vI5aUUXZkwaLYHF1fnrEoq2lBpRePYTYr94KZbsIFjzXuZB9b6SvFtw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=u8l4nPsX; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=bNg3bM7f; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=u8l4nPsX; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=bNg3bM7f; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="u8l4nPsX";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="bNg3bM7f";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="u8l4nPsX";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="bNg3bM7f"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id DE68F1FC0C;
	Fri, 23 Feb 2024 14:52:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1708699937; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=jAQRbMU5f4T82x1S4nkbfaux8n+LSQ2VUTwamqQhVZk=;
	b=u8l4nPsXSUxQi0togr1G0vcR7BGbtD6RecSZFUjjyK+cYXaE4dFMjESzaSUOwtCyEnujOb
	0EdaT0y563YN6d9gbXEKsYGAnd99JrowQEVu4nPF8mHMiA4qGnap11v34k++A+DudqSmIO
	6QnBrQFRWV7+jMje0OC1DtSzVn3WIiY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1708699937;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=jAQRbMU5f4T82x1S4nkbfaux8n+LSQ2VUTwamqQhVZk=;
	b=bNg3bM7fyhdXDLMLTpu8njqSDICXubLniwi/oMxjdXL6pu68eYkVKc4MtC8LNAz74NG3zX
	PgKygM2gD8Q/kvDA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1708699937; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=jAQRbMU5f4T82x1S4nkbfaux8n+LSQ2VUTwamqQhVZk=;
	b=u8l4nPsXSUxQi0togr1G0vcR7BGbtD6RecSZFUjjyK+cYXaE4dFMjESzaSUOwtCyEnujOb
	0EdaT0y563YN6d9gbXEKsYGAnd99JrowQEVu4nPF8mHMiA4qGnap11v34k++A+DudqSmIO
	6QnBrQFRWV7+jMje0OC1DtSzVn3WIiY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1708699937;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=jAQRbMU5f4T82x1S4nkbfaux8n+LSQ2VUTwamqQhVZk=;
	b=bNg3bM7fyhdXDLMLTpu8njqSDICXubLniwi/oMxjdXL6pu68eYkVKc4MtC8LNAz74NG3zX
	PgKygM2gD8Q/kvDA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id B578B133DC;
	Fri, 23 Feb 2024 14:52:17 +0000 (UTC)
Received: from dovecot-director2.suse.de ([10.150.64.162])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id FjsgKyGx2GWmGQAAD6G6ig
	(envelope-from <tiwai@suse.de>); Fri, 23 Feb 2024 14:52:17 +0000
Date: Fri, 23 Feb 2024 15:52:17 +0100
Message-ID: <87le7b2py6.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Willian Wang <kernel@willian.wang>
Cc: alsa-devel@alsa-project.org,
	linux-sound@vger.kernel.org,
	soyer@irl.hu
Subject: Re: PCI SSID and Codec SSID collision?
In-Reply-To: <170869932581.7.612391552809015627.273152461@willian.wang>
References: <170869932581.7.612391552809015627.273152461@willian.wang>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
Authentication-Results: smtp-out2.suse.de;
	none
X-Spamd-Result: default: False [0.85 / 50.00];
	 ARC_NA(0.00)[];
	 RCVD_VIA_SMTP_AUTH(0.00)[];
	 FROM_HAS_DN(0.00)[];
	 RCPT_COUNT_THREE(0.00)[4];
	 TO_DN_SOME(0.00)[];
	 TO_MATCH_ENVRCPT_ALL(0.00)[];
	 MIME_GOOD(-0.10)[text/plain];
	 RCVD_COUNT_THREE(0.00)[3];
	 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	 MID_CONTAINS_FROM(1.00)[];
	 FUZZY_BLOCKED(0.00)[rspamd.com];
	 FROM_EQ_ENVFROM(0.00)[];
	 MIME_TRACE(0.00)[0:+];
	 SUBJECT_ENDS_QUESTION(1.00)[];
	 RCVD_TLS_ALL(0.00)[];
	 BAYES_HAM(-1.05)[87.73%]
X-Spam-Level: 
X-Spam-Flag: NO
X-Spam-Score: 0.85

On Fri, 23 Feb 2024 15:41:26 +0100,
Willian Wang wrote:
> 
> Hi, I'm curious about the reasons for the fixup table to be the same
> for PCI and Codec SSIDs and if the PCI SSID is usually more important
> for it to be checked before the Codec.

Sometimes the manufacturers are lazy and didn't check the conflict in
their own products :-<

> Anyway, would a simple
> conditional statement to match these exact PCI and Codec SSID to set
> the fixup manually be enough? There seems to already exist a manual
> fix for TX300 and ROG Strix G17 there (not the same kind of fix and
> with a FIXME comment, though). I have this exact laptop model and
> would like to try to contribute to the code if it's not too
> complicated.

Yes, that's my suggestion.  I don't have the data of the other
17aa:3802, but I guess it should have a different codec SSID.


thanks,

Takashi
