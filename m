Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D83B1E47A8
	for <linux-sound@vger.kernel.org>; Mon, 14 Jul 2025 10:17:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752488250; cv=none; b=tgK3fTFzZPPLROm6q9RUTwRLpySAyFDdNWGaeFjyAVMXSks2foNop5wm1dmCfg828nrzk20Es6FZT4AbNZ+owFSST4WSC0mh83MdNGOFSR0kreH39qL1eU6Wbsdx8JmpfADOj4SmWLAzXZi4He/KeGwsyiRe5x+hIA8LhkivyHQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752488250; c=relaxed/simple;
	bh=JekIyXfByFLfuklTGn+U+fim1XJ58PGQmoEmvXNqIwg=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=gNat2VIAZoRhq7Nyv7//vUanKBFBdLclcMPQP5dGi/GIJpt360AkreSupMolJ7MsRao+7b8uwQ91ww/cXBE+6yLfQDS3YtrfW3wJ419kLKjAIGfF+uBeFN0nZG7oIReA3XhpyjvTRrIsWnYV9xxwq6iXgXbwrP43kms5hJudMAg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=IxhC6HbZ; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=/rIHL4wI; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=rKhaVgqj; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=PJN7zZc/; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="IxhC6HbZ";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="/rIHL4wI";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="rKhaVgqj";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="PJN7zZc/"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 4816C2123C;
	Mon, 14 Jul 2025 10:17:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1752488246; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=XIOhZm8/ngogTygivv+nFHcrti3Am5wrmXWCVUUSxik=;
	b=IxhC6HbZRw8fdqOyTAngzaOr28g7s8dQRyS8xJ7AAaLgm8QvOPAW9+grViQpGKylk10WkB
	fP7zsVtunsQhGfgGws37a1uCznz/iZErJ/Z3gjzs4iXLMTh2gqmS1anHrB3X0wjgyqzb7S
	d6frScxz/wYoFK01+WprAwFz/ekpvi0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1752488246;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=XIOhZm8/ngogTygivv+nFHcrti3Am5wrmXWCVUUSxik=;
	b=/rIHL4wIQLB1ivEOFE0E6fvteir3yHHQRhyoOCEoi3me+uYLZAPMxe4hGHe9khDqxAbasb
	1Gl0wA7uA9kDwDBw==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=rKhaVgqj;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b="PJN7zZc/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1752488245; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=XIOhZm8/ngogTygivv+nFHcrti3Am5wrmXWCVUUSxik=;
	b=rKhaVgqju5lFswNviijw5mQK7jbtU4VZh+L3UL8K985pytkPTRgvQYyWHVDs4Sq92fSGYi
	UWOZzG0BHCCGOsFUtzK0fx98mFmb/dbvQjaDYVQ+y0pG4GaQf+IkDH+LDg/imqbVf8ahta
	hod2zDOzpP9qJz3Vor7j1g+6MhEq7dA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1752488245;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=XIOhZm8/ngogTygivv+nFHcrti3Am5wrmXWCVUUSxik=;
	b=PJN7zZc/MKiV9zxJeiZ0f/YPf7qB03eshazkVG1MoxRUuNPNN9M3YX7c4PbOXFOX7cwr9q
	n5xIpDWOOcS8gxAA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id EEED613306;
	Mon, 14 Jul 2025 10:17:24 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id XSJfNzTZdGgCUQAAD6G6ig
	(envelope-from <tiwai@suse.de>); Mon, 14 Jul 2025 10:17:24 +0000
Date: Mon, 14 Jul 2025 12:17:24 +0200
Message-ID: <87bjpn84az.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Cezary Rojewski <cezary.rojewski@intel.com>
Cc: Takashi Iwai <tiwai@suse.de>,<linux-sound@vger.kernel.org>,	Richard
 Fitzgerald <rf@opensource.cirrus.com>,	Kailang <kailang@realtek.com>,	Kai
 Vehmanen <kai.vehmanen@linux.intel.com>,	Amadeusz =?ISO-8859-2?Q?S=B3awi?=
 =?ISO-8859-2?Q?=F1ski?=
 <amadeuszx.slawinski@linux.intel.com>,<patches@opensource.cirrus.com>,
	Baojun Xu <baojun.xu@ti.com>,	bo liu <bo.liu@senarytech.com>
Subject: Re: [PATCH 06/27] ALSA: hda: Move codec drivers into sound/hda/codecs directory
In-Reply-To: <83626aee-e2df-45ed-85a9-b81e24a895b8@intel.com>
References: <20250709160434.1859-1-tiwai@suse.de>
	<20250709160434.1859-7-tiwai@suse.de>
	<b6ecdfd3-f5c0-4ca1-b38d-e16dc5ca2855@intel.com>
	<87h5zfqh1k.wl-tiwai@suse.de>
	<b10d1812-85cb-4958-a493-185701dcdd0d@intel.com>
	<87ikjv876x.wl-tiwai@suse.de>
	<83626aee-e2df-45ed-85a9-b81e24a895b8@intel.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spamd-Result: default: False [-3.51 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	TO_DN_SOME(0.00)[];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	RCVD_TLS_ALL(0.00)[];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid,suse.de:dkim,imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	DKIM_TRACE(0.00)[suse.de:+]
X-Spam-Flag: NO
X-Spam-Level: 
X-Rspamd-Queue-Id: 4816C2123C
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Action: no action
X-Spam-Score: -3.51

On Mon, 14 Jul 2025 11:35:10 +0200,
Cezary Rojewski wrote:
> 
> On 2025-07-14 11:15 AM, Takashi Iwai wrote:
> > On Mon, 14 Jul 2025 11:08:01 +0200,
> > Cezary Rojewski wrote:
> >> 
> >> On 2025-07-14 11:04 AM, Takashi Iwai wrote:
> >>> On Mon, 14 Jul 2025 10:57:59 +0200,
> >>> Cezary Rojewski wrote:
> >>>> 
> >>>> On 2025-07-09 6:04 PM, Takashi Iwai wrote:
> >>>>> Now move the all remaining codec drivers from sound/pci/hda to
> >>>>> sound/hda/codecs subdirectory.  Some drivers are put under the further
> >>>>> vendor subdirectory, and the vendor helper code (*_helper.c) are put
> >>>>> under helpers subdirectory.  Also the sub-codec drivers are moved under
> >>>>> a different subdirectory, sound/hda/codecs/sub-codecs, for
> >>>>> distinguishing from the main HD-audio codec drivers.
> >>>>> 
> >>>>> The prefix patch_ and hda_ as well as the suffix _helper are dropped
> >>>>> from file names as they are mostly superfluous.
> >>>>> 
> >>>>> No functional changes but just file path shuffling.
> >>>>> 
> >>>> 
> >>>> Path: codecs/side-codecs/ looks wierd. My suggestion is to avoid the
> >>>> repeat and stay with codecs/side/.
> >>> 
> >>> Sorry, too late, I already merged the stuff.  (And IMO codecs/side
> >>> doesn't sound intuitive.)
> >>> 
> >>> Since the directory names are more or less understandable, and Cirrus
> >>> people seem OK with it, so let's leave as is.
> >> 
> >> Oh, didn't notice. The series is large and I wasn't expecting it to
> >> get merged that quickly.
> > 
> > There should be no much functional changes and the only matter is file
> > name shuffling, and no much regression reports from 0-day, so I
> > decided to merge for 6.17.  Then earlier, better.
> > 
> > Currently no further code change is planned from my side for 6.17.
> > Also some changes have been queued, they are post 6.17 materials.
> > 
> >> Guess no point in reviewing the rest then, thanks for the information!
> > 
> > We may still rename if something looks too worrisome, of course.
> > If you have something in mind, let me know.
> 
> Thank you. I'll update my tactic a bit - rebase onto the new hda/ and
> reply/send patches separately if anything pops up.
> 
> There is a lot to look at and, at the same time it's very encouraging
> to see major work done in hda/ area :)

Great, thanks!


Takashi
