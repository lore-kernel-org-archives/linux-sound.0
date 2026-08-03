Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FD6535F609
	for <linux-sound@vger.kernel.org>; Mon,  3 Aug 2026 07:38:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785742727; cv=none; b=NLEkh0GT1VdTLwTZpO75trF2Af5ef7DDfynciypxlmNEarSHleYGr37onWESw8LZTagF9yro47Hm0U/R61BlO9H1nCiQ/ryJi90Y3839lvtUVSmKai+EaWNPFCWr1T/i64gGtBe57FufLUGhPhXSXkQ44Gj7xHVddXMsaE/Dp2A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785742727; c=relaxed/simple;
	bh=wbree92oIYvr+if/FOAIsSn8gQtQ8h1sLR+8CU5E+Q8=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=eNZFqFZjU4okt+zmNSwlLCMZ/19Axv1G0mtwnEevJ8qXbGaNINy0wDOTEyz2c/GXFFTTb7qcwnzBdKqF5C03EO2dePNMhRGG91+l4KHHCipPBjgpAk7785kW3faJI7CSsjfjaLC8NVhg0XGw0zd6fkheMgO8Kr2lqqoqDxSO5A0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=VvtM8VIH; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=kgpD6LVU; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=QIs01eYM; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=JiT1SeJr; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="VvtM8VIH";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="kgpD6LVU";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="QIs01eYM";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="JiT1SeJr"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 6C60D47B2;
	Mon,  3 Aug 2026 07:38:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1785742718; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=jWQBfOFQz3tptTfVdN8IRwUDy0BirhQ5IZgkm4mF3Ko=;
	b=VvtM8VIHcQx4bpqYuem7IVY9uiGUrb4w4LIheml5uNgcc6qY0GAHK29+TI+cVhfiZD8lHc
	D7MNYZhOiWMDhvM2bIiX9B6QW6i+HGAIVFavrKZN1D/PqhYWfCZyD6gkZDEvIkjZNicmi3
	z8PUk98AvzBaAQRSviXWnzBbjHh1IVg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1785742718;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=jWQBfOFQz3tptTfVdN8IRwUDy0BirhQ5IZgkm4mF3Ko=;
	b=kgpD6LVUrrTWAic+AeBYtNXcGt6BryHTbeyL7aESMZKVSe4z3kYTBR13WBdomZTaAWYP/3
	UNUPEFc0/I/+MoBA==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1785742714; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=jWQBfOFQz3tptTfVdN8IRwUDy0BirhQ5IZgkm4mF3Ko=;
	b=QIs01eYMvet3T2rI4Fh8U7/guITv1WVg1FTCSUTpsOmxa8O70vcqbatEPHho67QY7DlIai
	g18wD92Ufw4LDJ42Mq3sISdT/v5q0TyWDT/qSNUT4UTxdaGuOffIJ0wo9/K3pSsZdSYpnn
	47d5Xa/23yo65ewhoPxbP6XAMlnWO2c=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1785742714;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=jWQBfOFQz3tptTfVdN8IRwUDy0BirhQ5IZgkm4mF3Ko=;
	b=JiT1SeJrBXPIp2EU4Z3gntxZj3JkkBMRI2Mm4gCwtmZMRU8GfQMI4lTO4VutGpUc2yLyW1
	ImBf+DxMow4hcCCA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 37608779C1;
	Mon,  3 Aug 2026 07:38:34 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id U/o8DHpFcGrPLQAAD6G6ig
	(envelope-from <tiwai@suse.de>); Mon, 03 Aug 2026 07:38:34 +0000
Date: Mon, 03 Aug 2026 09:38:33 +0200
Message-ID: <87tspbac1y.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Antheas Kapenekakis <lkml@antheas.dev>
Cc: Brian van den Berg <faxuser@proton.me>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4] ALSA: usb-audio: Add quirk for Logitech PRO X 2 LIGHTSPEED
In-Reply-To: <CAGwozwGXLu8qWQw8MwMFQ=jiWfRJX6Xs0=4mMOwH2cPJHnjigA@mail.gmail.com>
References: <20260731031253.38976-1-faxuser@proton.me>
	<CAGwozwGXLu8qWQw8MwMFQ=jiWfRJX6Xs0=4mMOwH2cPJHnjigA@mail.gmail.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/30.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spam-Score: -3.29
X-Spam-Level: 
X-Spam-Flag: NO
X-Spamd-Result: default: False [-3.29 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.19)[-0.963];
	MIME_GOOD(-0.10)[text/plain];
	MIME_TRACE(0.00)[0:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	ARC_NA(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	URIBL_BLOCKED(0.00)[imap1.dmz-prg2.suse.org:helo,suse.de:mid];
	RCPT_COUNT_FIVE(0.00)[6];
	FROM_HAS_DN(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_EQ_ENVFROM(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,suse.de:mid]

On Fri, 31 Jul 2026 17:01:50 +0200,
Antheas Kapenekakis wrote:
> 
> On Fri, 31 Jul 2026 at 05:13, Brian van den Berg <faxuser@proton.me> wrote:
> >
> > The UAC mixer of Logitech PRO X 2 LIGHTSPEED works fine except that its
> > volume GET_CUR method returns sticky values.
> >
> > Since commit 86aa1ea1f15c
> > ("ALSA: usb-audio: Do not expose sticky mixers"), the sticky check
> > considers the mixer to be sticky and unnecessarily disables the mixer.
> >
> > Add QUIRK_FLAG_MIXER_GET_CUR_BROKEN for Logitech PRO X 2 LIGHTSPEED
> > (046d:0af7) to address this.
> >
> > Compiled and tested on 7.2-rc5
> 
> There is a first time for everything. Happy to have helped with your
> first submission. The description still seems a bit vague to me as I
> do not have the mixer. Maybe there is a better way to phrase it. But I
> will leave this up to Takashi and Jaroslav. Hopefully next time you
> get most things right on the V1 ;)
> 
> Reviewed-by: Antheas Kapenekakis <lkml@antheas.dev>
> 
> > Signed-off-by: Brian van den Berg <faxuser@proton.me>

FYI, somehow this mail thread didn't reach to my inbox directly, so I
took another fix from Rong already now -- which is the very same fix.


Takashi
