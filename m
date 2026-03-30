Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F28B3A1CE3
	for <linux-sound@vger.kernel.org>; Mon, 30 Mar 2026 07:36:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774856189; cv=none; b=tfwNAEnC8hGox/G6vVRmXJvAO9dKWCTf45x8GamRzLij1dNdtrDWFihN3y2UQKWNe8MRkko/0xTol/+3m9/n0WIOewAb3BuDp2nOeEveh7mOW+WbnxTWbfMDH7xt4x9fFlG8EmjS34pf+smT+16UpJy+12/2vK0ZeMRTqX1wFqE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774856189; c=relaxed/simple;
	bh=Ke/o+Q9bQvtNMDDALbbIFWFvrpI8D41nq6zTfuieJ6w=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=dVuLJW5kp8lQtND3iQDFB8P+M2sQAhgPi/BXyMoEH4gGFPpYLExit7hkzy7RvtG32j0C+49eBGB1hZpOnJUJW2mo8gOkuBhOgnc2N/QIbhhpObT28BsppAlXdGGTn4wkT8vCl9pbf4XmH1z4CeuJGEkNuPorP1V39cHSr5cKy8I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=2YkWa7ta; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=oCbPaxCI; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=Q9ylU2Ra; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=HHYrvATc; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="2YkWa7ta";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="oCbPaxCI";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="Q9ylU2Ra";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="HHYrvATc"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 210045BE85;
	Mon, 30 Mar 2026 07:36:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1774856181; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=rrMnCznqNgri+NjrieBtsBBOPjrP13zJo0LHVEjqXgg=;
	b=2YkWa7taW/14fNONVbgTmYca2TdvpOZ180cJXbSoIaxUAjVQulC4+kWOuBkysTuKHnnzIe
	jRXYjT5XNBjbrZ6CV/jqOYgaOdRMiH+H+iBHhiS+jwI0m7tcgCo4uFnawdM0smBy2KbrFD
	QIFBMTG+LrRqP12P9/LiDbbp0ZMXfaw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1774856181;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=rrMnCznqNgri+NjrieBtsBBOPjrP13zJo0LHVEjqXgg=;
	b=oCbPaxCI3NKXEjbd0F0HX/af3nAlPk/DSi+3U7m/dT3iQHe8V1iVKDqLkJsmjo6c2G8ppf
	gnX/vp8aOAvU/2Ag==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1774856180; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=rrMnCznqNgri+NjrieBtsBBOPjrP13zJo0LHVEjqXgg=;
	b=Q9ylU2RaADVGsYJiaCg792mXhv89cIQ2IpVUq3AmUz8QUXYwHkRinvWpdjS5agJoV8Mvyu
	zGXZZhc1g/I3dSx1AtP7Jbu3yebggLzZJ2si5lgWD4BB6aKu1u+aE4lYE53snqNuMhUpeV
	dpG8cP6GO5sFYZ0592P4VfIBDfXcD4Q=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1774856180;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=rrMnCznqNgri+NjrieBtsBBOPjrP13zJo0LHVEjqXgg=;
	b=HHYrvATcnDzLbS8y7ZaPV0MbM9VOHpc9c18J2RyXPXbx0PogjR7JlAM3ea0KaoiHbdzT3G
	6E4NFSpnRMu6kpCg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id D5F6B4A0A2;
	Mon, 30 Mar 2026 07:36:19 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id /I33MvMnymkaKAAAD6G6ig
	(envelope-from <tiwai@suse.de>); Mon, 30 Mar 2026 07:36:19 +0000
Date: Mon, 30 Mar 2026 09:36:19 +0200
Message-ID: <87o6k5u5u4.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: =?ISO-8859-1?Q?C=E1ssio?= Gabriel <cassiogabrielcontato@gmail.com>
Cc: Johannes Berg <johannes@sipsolutions.net>,
	Takashi Iwai <tiwai@suse.com>,
	Jaroslav Kysela <perex@perex.cz>,
	linuxppc-dev@lists.ozlabs.org,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: Re: [PATCH] ALSA: aoa: i2sbus: fix OF node lifetime handling
In-Reply-To: <20260330-aoa-i2sbus-ofnode-lifetime-v1-1-51c309f4ff06@gmail.com>
References: <20260330-aoa-i2sbus-ofnode-lifetime-v1-1-51c309f4ff06@gmail.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/30.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-7.30 / 50.00];
	REPLY(-4.00)[];
	BAYES_HAM(-3.00)[99.99%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[gmail.com];
	ARC_NA(0.00)[];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	RCPT_COUNT_SEVEN(0.00)[8];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,suse.de:mid]
X-Spam-Flag: NO
X-Spam-Score: -7.30
X-Spam-Level: 

On Mon, 30 Mar 2026 06:00:34 +0200,
Cássio Gabriel wrote:
> 
> i2sbus_add_dev() keeps the matched "sound" child pointer after
> for_each_child_of_node() has dropped the iterator reference. Take an
> extra reference before saving that node and drop it after the
> layout-id/device-id lookup is complete.
> 
> The function also stores np in dev->sound.ofdev.dev.of_node without
> taking a reference for the embedded soundbus device. Since i2sbus
> overrides the embedded platform device release callback, balance that
> reference explicitly in the local error path and in i2sbus_release_dev().
> 
> Fixes: f3d9478b2ce4 ("[ALSA] snd-aoa: add snd-aoa")
> Cc: stable@vger.kernel.org
> Signed-off-by: Cássio Gabriel <cassiogabrielcontato@gmail.com>

Applied to for-next branch now.  Thanks.


Takashi
