Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F8C23090F4
	for <linux-sound@vger.kernel.org>; Mon,  3 Aug 2026 07:06:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785740766; cv=none; b=leuNj+JMOsWz6lr1v0lqyaFoEWtVHQsTE1uQJJKMXxZn+jKtzY+Ciimnzt76CX8II34bgxsK32SoPXMwFPO7Uqy8bPhuWLiQcAXsVG4MYe3noU8JPCax3xei40TYQAl4Bv/fTvuouu33ofD3AjqXyTQ0+Df+QTu8x/N6dPNqyuE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785740766; c=relaxed/simple;
	bh=EYlFZNGn/Ox7pazaZyEHINNzVOoZAozLFE80aauTWr0=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=erPYjrra5BhTlPp5FlOpq5wVY89lgCC8Ygc4CNVY65DViR9N2Nsm09mnS1q5Df+C31dZ4DmmHTVriCjUZmEp104T04ujvxvjY20lPizojjakc9GxyAdiHoRtDtyCqyC0S1m3wGq5uU4WC/cQ4ivOShWMYXzvL6pxcrm4wQtGfcg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=djzjz6lX; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=k0OPv4gR; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=ZKnY3sLH; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=kYEP4rTB; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="djzjz6lX";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="k0OPv4gR";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="ZKnY3sLH";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="kYEP4rTB"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 0C7C741B6;
	Mon,  3 Aug 2026 07:05:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1785740759; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=nuN2YQE5qCcF5Q5+zsiTbsczM8qM/sTJva6Uivh/kso=;
	b=djzjz6lXOPXtHOukVQdYMkm/yFezVh3fFQDcBDimy1Bk2Ss2g4Cn0wzYUUWNj/PhXH0X4L
	dmo/3xNEvHE1/guM9VnLcTmDDFxI0nj7v1uaoVXqwXvQgHM9tjCRVMS5F9EcfCAr6ejFHM
	Au7GceUtn3QnAJsAyKK6xRWdCpqif2o=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1785740759;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=nuN2YQE5qCcF5Q5+zsiTbsczM8qM/sTJva6Uivh/kso=;
	b=k0OPv4gRgW9iyO1tWSsprhQX7sSWl/JtALbiO5FhWpD+GYF+Hs76Ea8sFMQuVWJmB3MOXs
	lmAJI9gkj8N4giCg==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1785740755; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=nuN2YQE5qCcF5Q5+zsiTbsczM8qM/sTJva6Uivh/kso=;
	b=ZKnY3sLHVDmgYet/YGruOs2uN9bvHKPtKbyJA57vtLeTPgP3xev4NO1NxpnzNOz8SKPKEs
	Qu0HWkv0yELaqoxcpHJJLukOnQNuPx7DPKYNOImpzCNRhjZ49fu7hrWv6msBni2kQYIklO
	M27qJ3kgPwRqmF/C06unqgMsdSprD7M=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1785740755;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=nuN2YQE5qCcF5Q5+zsiTbsczM8qM/sTJva6Uivh/kso=;
	b=kYEP4rTB7KOaMC5tS7j0yXeqSnwhN4A+ZXH5hMiy29dIkeMyHSZRNi+sj29ICuaRcvRITr
	I7f0tkKp2uWOiqCQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id D908C779A1;
	Mon,  3 Aug 2026 07:05:54 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id gSOaM9I9cGpTDgAAD6G6ig
	(envelope-from <tiwai@suse.de>); Mon, 03 Aug 2026 07:05:54 +0000
Date: Mon, 03 Aug 2026 09:05:54 +0200
Message-ID: <874ihbbs4t.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: =?EUC-KR?B?uvuzqrTCyLK80g==?= <safenine@gmail.com>
Cc: linux-sound@vger.kernel.org,
	alsa-devel@alsa-project.org,
	Aaron Fan <aaronfan404@gmail.com>
Subject: Re: [PATCH] ALSA: hda/realtek: Add quirk for LG Gram 17ZD90R-EX79K
In-Reply-To: <878q6nbsb1.wl-tiwai@suse.de>
References: <CAJ79ZrGy5F0LwQ=xZBmZi+MnTybiATPg2FGbS-7NaMWvb_6syQ@mail.gmail.com>
	<878q6nbsb1.wl-tiwai@suse.de>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/30.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=EUC-KR
Content-Transfer-Encoding: 8bit
X-Spam-Score: -3.28
X-Spam-Level: 
X-Spam-Flag: NO
X-Spamd-Result: default: False [-3.28 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.18)[-0.917];
	MIME_GOOD(-0.10)[text/plain];
	ARC_NA(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	URIBL_BLOCKED(0.00)[suse.de:mid,imap1.dmz-prg2.suse.org:helo];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	FREEMAIL_CC(0.00)[vger.kernel.org,alsa-project.org,gmail.com];
	RCVD_TLS_ALL(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	RCPT_COUNT_THREE(0.00)[4];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid,imap1.dmz-prg2.suse.org:helo]

On Mon, 03 Aug 2026 09:02:10 +0200,
Takashi Iwai wrote:
> 
> On Thu, 30 Jul 2026 06:20:09 +0200,
> ºû³ª´ÂÈ²¼Ò wrote:
> > 
> > From: Jabong Koo <safenine@gmail.com>
> > 
> > The internal speakers on the LG Gram 17ZD90R-EX79K remain silent,
> > while headphone output works normally.
> > 
> > The machine uses a Realtek ALC298 codec with PCI subsystem ID
> > 1854:048b. Existing LG Gram subsystem IDs 1854:0488, 1854:0489 and
> > 1854:048a use ALC298_FIXUP_SAMSUNG_AMP_V2_4_AMPS, but 1854:048b is
> > missing from the quirk table.
> > 
> > Add the matching quirk for subsystem ID 1854:048b.
> > 
> > Tested successfully on Ubuntu HWE kernels 6.17.0-41-generic and
> > 7.0.0-28-generic.
> > 
> > Signed-off-by: Jabong Koo <safenine@gmail.com>
> > ---
> >  sound/hda/codecs/realtek/alc269.c | 1 +
> >  1 file changed, 1 insertion(+)
> > 
> > diff --git a/sound/hda/codecs/realtek/alc269.c
> > b/sound/hda/codecs/realtek/alc269.c
> > --- a/sound/hda/codecs/realtek/alc269.c
> > +++ b/sound/hda/codecs/realtek/alc269.c
> > @@ -7752,6 +7752,7 @@ static const struct snd_pci_quirk alc269_fixup_tbl[] = {
> >  	SND_PCI_QUIRK(0x1854, 0x0488, "LG gram 16 (16Z90R)",
> > ALC298_FIXUP_SAMSUNG_AMP_V2_4_AMPS),
> >  	SND_PCI_QUIRK(0x1854, 0x0489, "LG gram 16 (16Z90R-A)",
> > ALC298_FIXUP_SAMSUNG_AMP_V2_4_AMPS),
> >  	SND_PCI_QUIRK(0x1854, 0x048a, "LG gram 17 (17ZD90R)",
> > ALC298_FIXUP_SAMSUNG_AMP_V2_4_AMPS),
> > +	SND_PCI_QUIRK(0x1854, 0x048b, "LG gram 17 (17ZD90R-EX79K)",
> > ALC298_FIXUP_SAMSUNG_AMP_V2_4_AMPS),
> >  	SND_PCI_QUIRK(0x1854, 0x05bf, "LG gram 17ZD90S",
> > ALC298_FIXUP_SAMSUNG_AMP_V2_4_AMPS),
> >  	SND_PCI_QUIRK(0x1854, 0x05c0, "LG gram 16Z90S",
> > ALC298_FIXUP_SAMSUNG_AMP_V2_4_AMPS),
> >  	SND_PCI_QUIRK(0x1854, 0x05c1, "LG gram 14Z90S",
> > ALC298_FIXUP_SAMSUNG_AMP_V2_4_AMPS),
> 
> The patch looks malformed (with wrong spaces), likely due to your
> mailer, so it can't be applied cleanly via git-am.
> Please fix your mailer setup, and resubmit the fix.

Never mind, I see that there was another fix submission by Aaron for
the very same device with the same quirk, and it was applied now.


thanks,

Takashi
