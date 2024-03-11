Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 332E411C92
	for <linux-sound@vger.kernel.org>; Mon, 11 Mar 2024 08:44:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710146695; cv=none; b=nzfQvMEThZy2jeROC/olWmVjiZ2ZIUYoO2TJBZzs7egcdiv3Xn8KDmbJBtzHVGs9gE+034XnDL1uF1ZEsjCtTDDXDFlfy6QLsn+rw5PKeDC9VxWQSBn4Uw9N1TNp3EBN5iGQoEI5zl9Y7P07gt8cuamJeGROPeL0PFhM4N82ics=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710146695; c=relaxed/simple;
	bh=5k6Taxj1VqrQXXkwprl2em9yuTims4/1BDmFbROPRvI=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=nnOCoR3bgmQfLwbea0msOeVG65jX0pHRWYw3nLskzHuHqEWzQebbNie6bScK2VSb0CtNrA1VVhr7DpKdKEb4lGHzMgEcET/VcynHd5aWNLVikhhO8+jzDisBqlv/0wfAlLZGSlt2GcepsbAK0NjTgHN5t6L1n/V99a1YHwevK0g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=vMD4Nr6s; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=2NdGxol3; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=vMD4Nr6s; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=2NdGxol3; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="vMD4Nr6s";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="2NdGxol3";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="vMD4Nr6s";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="2NdGxol3"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 7B8E85C428;
	Mon, 11 Mar 2024 08:44:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1710146692; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=t3tAOB1S2XwVH4kMLQ3PZnX5+bOJXf7TDAkYcqTTQNA=;
	b=vMD4Nr6snRWf4I5wxoIpUHaOg3gMYEoHQ3twJfa4AJOqm+8mZzOArXj8ypHbdic+E/265a
	eN37NUkUVKM40blOohilPWjibGKNo/eItJOKpG1+fjq8j9ORkOq8N8P1bxS9tM3EdOaCQp
	EM8B7GjoB9xSOb6XZFiME/6cist7hNk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1710146692;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=t3tAOB1S2XwVH4kMLQ3PZnX5+bOJXf7TDAkYcqTTQNA=;
	b=2NdGxol3VL/Ky/XIo6cYyYQrdCI9wceilCIQluri+Pl0bwpL+u75vzA7qWVGNGpRrHUzBN
	hmSlAmTbp1v6UUBQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1710146692; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=t3tAOB1S2XwVH4kMLQ3PZnX5+bOJXf7TDAkYcqTTQNA=;
	b=vMD4Nr6snRWf4I5wxoIpUHaOg3gMYEoHQ3twJfa4AJOqm+8mZzOArXj8ypHbdic+E/265a
	eN37NUkUVKM40blOohilPWjibGKNo/eItJOKpG1+fjq8j9ORkOq8N8P1bxS9tM3EdOaCQp
	EM8B7GjoB9xSOb6XZFiME/6cist7hNk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1710146692;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=t3tAOB1S2XwVH4kMLQ3PZnX5+bOJXf7TDAkYcqTTQNA=;
	b=2NdGxol3VL/Ky/XIo6cYyYQrdCI9wceilCIQluri+Pl0bwpL+u75vzA7qWVGNGpRrHUzBN
	hmSlAmTbp1v6UUBQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 5833613695;
	Mon, 11 Mar 2024 08:44:52 +0000 (UTC)
Received: from dovecot-director2.suse.de ([10.150.64.162])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id TIZdFITE7mVBcwAAD6G6ig
	(envelope-from <tiwai@suse.de>); Mon, 11 Mar 2024 08:44:52 +0000
Date: Mon, 11 Mar 2024 09:44:51 +0100
Message-ID: <87h6hdb1j0.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: "Geoffrey D. Bennett" <g@b4.vu>
Cc: Takashi Iwai <tiwai@suse.de>,
	Takashi Iwai <tiwai@suse.com>,
	linux-sound@vger.kernel.org
Subject: Re: [PATCH 0/3] ALSA: scarlett2: Scarlett 4th Gen fixes for 6.8
In-Reply-To: <Ze7D+gD+2DxgbSGY@m.b4.vu>
References: <cover.1710047969.git.g@b4.vu>
	<87o7blb2uz.wl-tiwai@suse.de>
	<Ze7D+gD+2DxgbSGY@m.b4.vu>
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
X-Spam-Level: 
X-Spam-Score: -3.07
X-Spamd-Result: default: False [-3.07 / 50.00];
	 ARC_NA(0.00)[];
	 RCVD_VIA_SMTP_AUTH(0.00)[];
	 FROM_HAS_DN(0.00)[];
	 RCPT_COUNT_THREE(0.00)[4];
	 TO_DN_SOME(0.00)[];
	 TO_MATCH_ENVRCPT_ALL(0.00)[];
	 MIME_GOOD(-0.10)[text/plain];
	 NEURAL_HAM_LONG(-1.00)[-1.000];
	 RCVD_COUNT_THREE(0.00)[3];
	 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	 NEURAL_HAM_SHORT(-0.20)[-0.999];
	 MID_CONTAINS_FROM(1.00)[];
	 FUZZY_BLOCKED(0.00)[rspamd.com];
	 FROM_EQ_ENVFROM(0.00)[];
	 MIME_TRACE(0.00)[0:+];
	 RCVD_TLS_ALL(0.00)[];
	 BAYES_HAM(-2.77)[99.00%]
X-Spam-Flag: NO

On Mon, 11 Mar 2024 09:42:34 +0100,
Geoffrey D. Bennett wrote:
> 
> On Mon, Mar 11, 2024 at 09:16:04AM +0100, Takashi Iwai wrote:
> > On Sun, 10 Mar 2024 11:34:09 +0100,
> > Geoffrey D. Bennett wrote:
> > > 
> > > Hi Takashi,
> > > 
> > > I have three minor fixes for the Scarlett 4th Gen driver in 6.8:
> > > - The low-voltage indication is now being read from the correct offset
> > > - The autogain status values are now all correctly interpreted
> > > - The input gain range is now correct
> > > 
> > > Regards,
> > > Geoffrey.
> > > 
> > > Geoffrey D. Bennett (3):
> > >   ALSA: scarlett2: Fix Scarlett 4th Gen 4i4 low-voltage detection
> > >   ALSA: scarlett2: Fix Scarlett 4th Gen autogain status values
> > >   ALSA: scarlett2: Fix Scarlett 4th Gen input gain range
> > 
> > Applied all patches now.  Thanks.
> 
> Hi Takashi,
> 
> Sorry for the inconvience, I have a v2 of the 3rd patch "Fix Scarlett
> 4th Gen input gain range" which I will send in a moment. Please let me
> know if you prefer a patch on top of the above rather than a
> replacement patch.

Yes, please send an incremental fix.
You can get the commits in for-linus branch of sound.git tree.


thanks,

Takashi
