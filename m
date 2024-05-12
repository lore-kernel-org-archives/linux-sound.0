Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 780321865C
	for <linux-sound@vger.kernel.org>; Sun, 12 May 2024 09:43:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715507017; cv=none; b=L+vfmwcK9JyryQXJaElaPcGU+8Yrjb0wWdG+bi5sEmxG//qpizMZxFlfX8/IYd89ZIEQtEwS4tTnUpwVVZ0KSriDU6hJi/SZrNx8exRzDDaYeaet/uFFmrgJPQLghBsAjY6IwomV+ALwG3BmKBDqPUtoxA9DaFn8Z6W1xAwwACY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715507017; c=relaxed/simple;
	bh=oJDyDXRR8KhHad/WwubeNfup5jJ+AevPqlwusHrgqWQ=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=bpDFo7JpdiRy/xIjNX0Z/1nLZd5wHht+Y/TI9eMuleB1j9sNUFWHsqVVc/qxQFMhC8RY6yYq4BrAWW3vs4jqNZOL318SAePdlJ4HXCzFLuNlQztkgN1p4xWMHICVhzF+BxunB/V+7bp4WVE0MLisfddLFExuuXgdhevaqF8bEQU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=zY9lv/YB; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=7omfVB7R; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=zY9lv/YB; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=7omfVB7R; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="zY9lv/YB";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="7omfVB7R";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="zY9lv/YB";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="7omfVB7R"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id AB5223747E;
	Sun, 12 May 2024 09:43:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1715507013; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=OOLa9LdLux2SuxaxXhkIVydP21O7Ds2kOlnZB3Z5Pt8=;
	b=zY9lv/YBx757kguiQjKyR88vhCFcLhnLLGiV2c73UoNw1gH5hTQllUfa+yjdrpk/kzU2p9
	8iUMsPhDEIbzZPvgcf2IK4u1Gr2PhHKg2GcMmiT/rVgwce9uNTCnvo2i7vef5soshemRl/
	gBPQ5pdV58SNeHPiQ0NO7Dul954oZtY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1715507013;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=OOLa9LdLux2SuxaxXhkIVydP21O7Ds2kOlnZB3Z5Pt8=;
	b=7omfVB7RHzenltdHRvPhVmTyS+DVI39Tlsu8vO/Fp11fzsNT5Re5GaYkBv1GPuUYp508tU
	0adUuvomMJbqeGBg==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1715507013; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=OOLa9LdLux2SuxaxXhkIVydP21O7Ds2kOlnZB3Z5Pt8=;
	b=zY9lv/YBx757kguiQjKyR88vhCFcLhnLLGiV2c73UoNw1gH5hTQllUfa+yjdrpk/kzU2p9
	8iUMsPhDEIbzZPvgcf2IK4u1Gr2PhHKg2GcMmiT/rVgwce9uNTCnvo2i7vef5soshemRl/
	gBPQ5pdV58SNeHPiQ0NO7Dul954oZtY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1715507013;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=OOLa9LdLux2SuxaxXhkIVydP21O7Ds2kOlnZB3Z5Pt8=;
	b=7omfVB7RHzenltdHRvPhVmTyS+DVI39Tlsu8vO/Fp11fzsNT5Re5GaYkBv1GPuUYp508tU
	0adUuvomMJbqeGBg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 85DCB13A3A;
	Sun, 12 May 2024 09:43:33 +0000 (UTC)
Received: from dovecot-director2.suse.de ([10.150.64.162])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id JzZlH0WPQGYiLQAAD6G6ig
	(envelope-from <tiwai@suse.de>); Sun, 12 May 2024 09:43:33 +0000
Date: Sun, 12 May 2024 11:43:49 +0200
Message-ID: <87r0e7gyay.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: "Geoffrey D. Bennett" <g@b4.vu>
Cc: Takashi Iwai <tiwai@suse.de>,
	Takashi Iwai <tiwai@suse.com>,
	linux-sound@vger.kernel.org
Subject: Re: [PATCH] ALSA: scarlett2: Increase mixer range to +12dB
In-Reply-To: <Zj+gYT4F2XeKTD93@m.b4.vu>
References: <Zj+gYT4F2XeKTD93@m.b4.vu>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spam-Flag: NO
X-Spam-Score: -3.10
X-Spam-Level: 
X-Spamd-Result: default: False [-3.10 / 50.00];
	BAYES_HAM(-2.80)[99.15%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MIME_TRACE(0.00)[0:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	ARC_NA(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	RCPT_COUNT_THREE(0.00)[4];
	FROM_HAS_DN(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_EQ_ENVFROM(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns,b4.vu:email]

On Sat, 11 May 2024 18:44:17 +0200,
Geoffrey D. Bennett wrote:
> 
> The values loaded into the mixer are 16-bit values, with 8192
> representing 0dB, going up to a current maximum of 16345 (+6dB). All
> supported interfaces have no problem going up to 32612 (+12dB), so
> update SCARLETT2_MIXER_MAX_DB and scarlett2_mixer_values[] to allow
> for this.
> 
> Tested with:
> - Scarlett 2nd Gen 6i6, 18i8, 18i20
> - Scarlett 3rd Gen 4i4, 8i6, 18i8, 18i20
> - Scarlett 4th Gen Solo, 2i2, 4i4
> - Clarett+ 2Pre, 4Pre, 8Pre
> - Vocaster One and Two
> 
> Signed-off-by: Geoffrey D. Bennett <g@b4.vu>

Applied now.  Thanks.


Takashi
