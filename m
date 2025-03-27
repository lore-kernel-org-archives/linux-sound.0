Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95DB21E868
	for <linux-sound@vger.kernel.org>; Thu, 27 Mar 2025 15:58:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743091095; cv=none; b=V6zGhPU684Kp9GxqqC07+ROhxlE5+7lwoqm7NxS3PWXadK4m0wclrBHAa5pq0cHcGXawFJnILzkza8kvFXcQBuM9QjaaVPNbZZMQEnxseaEVjo/hI6HQ9r0+XcRGJJsr9wJOaIrmT2qNKmmzzHnqkhnXOeGzFtXzmywaz6hCbpE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743091095; c=relaxed/simple;
	bh=ctDG+Ubym0P/UGoEunElt5X0BirM4fMA0ADWOyJOvNY=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=RipTsvQJOD1KRABaSWpL5egNv405nLQDdSFTVoiHxFpyBM5Pzr/s4EUGDLHAAEluevNB9s9tamzJLbs3MvcDo7qz1W7oLYLalJZQRZpF39mlz0pn7JRnGRN0l8yWfmsi3O067R5BcpOWGsfmrW/qMG47PSSKwTRkbLxdcX1E0l8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=U/vibkv5; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=1iBVea+3; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=U/vibkv5; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=1iBVea+3; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="U/vibkv5";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="1iBVea+3";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="U/vibkv5";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="1iBVea+3"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 447531F388;
	Thu, 27 Mar 2025 15:58:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1743091086; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=3VVMCsrJuyX7T+WIl0cZG3xqfr826GMPSB+aEfZrnJY=;
	b=U/vibkv56T4E9mgmCLpyq8MI3ctThlmNT4NUwXN73R/RY7MUbu8fNL9jcS2wvlSga+eCnw
	ye/gHhkND2hcLcuS5NB8nR2Npvabs5Z/f4KsUcYnbozvSgZ8SDAmtBiA8qfKm3uD/jj97s
	BziqP/gN10LPDXmqc7lTWb88K7VZ0LQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1743091086;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=3VVMCsrJuyX7T+WIl0cZG3xqfr826GMPSB+aEfZrnJY=;
	b=1iBVea+3kgMnRjsAA6QFU++Mk4eOh9of0eK3s+qvOX3NlLsWirJhnzoIATejv8aoesaV3M
	/aeyz9vmhdWBPOCA==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1743091086; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=3VVMCsrJuyX7T+WIl0cZG3xqfr826GMPSB+aEfZrnJY=;
	b=U/vibkv56T4E9mgmCLpyq8MI3ctThlmNT4NUwXN73R/RY7MUbu8fNL9jcS2wvlSga+eCnw
	ye/gHhkND2hcLcuS5NB8nR2Npvabs5Z/f4KsUcYnbozvSgZ8SDAmtBiA8qfKm3uD/jj97s
	BziqP/gN10LPDXmqc7lTWb88K7VZ0LQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1743091086;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=3VVMCsrJuyX7T+WIl0cZG3xqfr826GMPSB+aEfZrnJY=;
	b=1iBVea+3kgMnRjsAA6QFU++Mk4eOh9of0eK3s+qvOX3NlLsWirJhnzoIATejv8aoesaV3M
	/aeyz9vmhdWBPOCA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 18CE0139D4;
	Thu, 27 Mar 2025 15:58:06 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id kRnTBI515WeqfgAAD6G6ig
	(envelope-from <tiwai@suse.de>); Thu, 27 Mar 2025 15:58:06 +0000
Date: Thu, 27 Mar 2025 16:58:05 +0100
Message-ID: <878qoqfotu.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Benjamin Berg <benjamin@sipsolutions.net>
Cc: Takashi Iwai <tiwai@suse.de>,
	linux-sound@vger.kernel.org,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi
 Iwai	 <tiwai@suse.com>
Subject: Re: [PATCH] ALSA: hda/realtek: Enable speakers on further Samsung Galaxy Book2 Pro
In-Reply-To: <a2de7b802e7b544a741ecf56af5c1a546509246e.camel@sipsolutions.net>
References: <20250326201953.131948-1-benjamin@sipsolutions.net>
	<87jz8a9731.wl-tiwai@suse.de>
	<3766ead24f99ba9ac7490a2066d99f0ba968df27.camel@sipsolutions.net>
	<87a5969446.wl-tiwai@suse.de>
	<a2de7b802e7b544a741ecf56af5c1a546509246e.camel@sipsolutions.net>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 8bit
X-Spam-Score: -3.30
X-Spamd-Result: default: False [-3.30 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-0.998];
	MIME_GOOD(-0.10)[text/plain];
	MIME_TRACE(0.00)[0:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	ARC_NA(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	RCPT_COUNT_FIVE(0.00)[5];
	FROM_HAS_DN(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_EQ_ENVFROM(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,suse.de:mid]
X-Spam-Flag: NO
X-Spam-Level: 

On Thu, 27 Mar 2025 11:26:20 +0100,
Benjamin Berg wrote:
> 
> On Thu, 2025-03-27 at 11:09 +0100, Takashi Iwai wrote:
> > On Thu, 27 Mar 2025 10:55:04 +0100,
> > Benjamin Berg wrote:
> > > 
> > > On Thu, 2025-03-27 at 10:05 +0100, Takashi Iwai wrote:
> > > > On Wed, 26 Mar 2025 21:19:53 +0100,
> > > > Benjamin Berg wrote:
> > > > > Note that I didn't really manage to test this directly. Trying to
> > > > > do a
> > > > > reconfigure resulted in a hang and I didn't figure out how to use
> > > > > the
> > > > > patch= option with a firmware file.
> > > > > However, the machine does work fine when configuring the two
> > > > > speakers
> > > > > from userspace, so I am confident that this patch is correct.
> > > > 
> > > > FYI, the equivalent can be achieved with model option, too.
> > > > e.g. passing model=144d:c870 will apply the same existing quirk as
> > > > SSID 144d:c870.  If your target is the secondary codec, pass like
> > > > "model=,144d:c870" instead.
> > > 
> > > Hmm, it is probably really straight forward, but I didn't grasp the
> > > documentation in Documentation/sound/hd-audio/notes.rst on a quick
> > > read.
> > 
> > It's mentioned in "Model Option" subsection of that document.
> > ```
> > A new style for the model option that was introduced since 5.15 kernel
> > is to pass the PCI or codec SSID in the form of ``model=XXXX:YYYY``
> > where XXXX and YYYY are the sub-vendor and sub-device IDs in hex
> > numbers, respectively.  This is a kind of aliasing to another device;
> > when this form is given, the driver will refer to that SSID as a
> > reference to the quirk table.  It'd be useful especially when the
> > target quirk isn't listed in the model table.  For example, passing
> > model=103c:8862 will apply the quirk for HP ProBook 445 G8 (which
> > isn't found in the model table as of writing) as long as the device is
> > handled equivalently by the same driver.
> > ```
> > 
> > > I am not sure anymore what I did (and I don't have access to the
> > > machine anymore). It might be I tried putting the model= line into a
> > > firmware file instead of just passing it on the kernel command line.
> > 
> > > How do I even know whether it is the first or second codec? Is that
> > > what the D0 in hwC0D0 is?
> > 
> > I meant the device probe order, so card#0 device#0 must be the very
> > first one :)
> 
> Right, that make sense, but wasn't obvious to me then.
> 
> Unfortunately, it seems that I messed something up and I cannot fully
> put it back together now.
> 
> I have one photo of the sysfs entries, and the subsystem_id is
> 0x144dc1ac there. So now I am not entirely certain that this is the
> correct ID, because I might have successfully overridden it to an
> incorrect value.
> Lkely, it is correct, but I do not know where I got the 0xc01d from.

144d:c01d can be PCI SSID while 144d:c1ac is the codec SSID.
Both are matched by the driver (PCI SSID is matched primarily).
In many cases the vendor sets different ID numbers.


Takashi
