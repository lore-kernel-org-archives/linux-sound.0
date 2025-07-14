Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9129623DEB6
	for <linux-sound@vger.kernel.org>; Mon, 14 Jul 2025 09:15:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752484507; cv=none; b=SuSorPd64O9WsmrdZVQ2tlMHG4Jd+gAjCuQlaGPrSbm61q+OHSXDI5mr9LTSBOlxRBH7B+/C0lmmbw2FgsCtUbGwHORrNpbvlEGjU963tZs9w70BjbNI8xnjLFeIgwIMRZ4NhufU9Sr0s9eh7txxynei8AvceomrRyNfO7l/224=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752484507; c=relaxed/simple;
	bh=Cs93saxA1eN8NLvDNnWVv5a9xrWzBEkvZKMLxRMG1vs=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=KaTjup9kGrNNiel0ifzfNSxNtXZudP7+LgcpDu8nDqcwQ7JBD/iTmC1VJWs+5FEy7BnIv5HfItzyS2mh0v5mgwAh1ON9IRYiFCXOV0t/5/d2enmKZYtRyaIBu87wRkk87x5hCxYow+ULH/BW19exUjT3+pnJG6ASj4ax7EfLbkk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=GmPUi2mQ; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=ssxFgQZx; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=GmPUi2mQ; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=ssxFgQZx; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="GmPUi2mQ";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="ssxFgQZx";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="GmPUi2mQ";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="ssxFgQZx"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 6C5DB1F7B6;
	Mon, 14 Jul 2025 09:15:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1752484503; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=NSuKpWSMa8jRXfFew9x8UHqu3AZ+mcMSutU/3DuckVs=;
	b=GmPUi2mQjwq+/jEcpOg1zI6kf6xki6i1CaYMN5vIRlCp7Rvy69QIrj8yY53WMEmXaYgzcw
	S+IArFlxck7UoC+BEwfj93kCYNzc+cAQ2oaO1z1Ga66hMS0aGsz1DA4F6z4iguJT6thBCp
	FXzZk0hMqW8n3krOI7b9YedzwRtYZK4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1752484503;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=NSuKpWSMa8jRXfFew9x8UHqu3AZ+mcMSutU/3DuckVs=;
	b=ssxFgQZxyqwPVneqjm5N7S/7EQG+mdWXF8J5hrRjom5kvVdIG5jyfaRwHe1aOcsVudnGTQ
	TgnR/ZUF4nAcscBg==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=GmPUi2mQ;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=ssxFgQZx
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1752484503; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=NSuKpWSMa8jRXfFew9x8UHqu3AZ+mcMSutU/3DuckVs=;
	b=GmPUi2mQjwq+/jEcpOg1zI6kf6xki6i1CaYMN5vIRlCp7Rvy69QIrj8yY53WMEmXaYgzcw
	S+IArFlxck7UoC+BEwfj93kCYNzc+cAQ2oaO1z1Ga66hMS0aGsz1DA4F6z4iguJT6thBCp
	FXzZk0hMqW8n3krOI7b9YedzwRtYZK4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1752484503;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=NSuKpWSMa8jRXfFew9x8UHqu3AZ+mcMSutU/3DuckVs=;
	b=ssxFgQZxyqwPVneqjm5N7S/7EQG+mdWXF8J5hrRjom5kvVdIG5jyfaRwHe1aOcsVudnGTQ
	TgnR/ZUF4nAcscBg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 2866A138A1;
	Mon, 14 Jul 2025 09:15:03 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id s1V+CJfKdGgVPQAAD6G6ig
	(envelope-from <tiwai@suse.de>); Mon, 14 Jul 2025 09:15:03 +0000
Date: Mon, 14 Jul 2025 11:15:02 +0200
Message-ID: <87ikjv876x.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Cezary Rojewski <cezary.rojewski@intel.com>
Cc: Takashi Iwai <tiwai@suse.de>,<linux-sound@vger.kernel.org>,	Richard
 Fitzgerald <rf@opensource.cirrus.com>,	Kailang <kailang@realtek.com>,	Kai
 Vehmanen <kai.vehmanen@linux.intel.com>,	Amadeusz =?ISO-8859-2?Q?S=B3awi?=
 =?ISO-8859-2?Q?=F1ski?=
 <amadeuszx.slawinski@linux.intel.com>,<patches@opensource.cirrus.com>,
	Baojun Xu <baojun.xu@ti.com>,	bo liu <bo.liu@senarytech.com>
Subject: Re: [PATCH 06/27] ALSA: hda: Move codec drivers into sound/hda/codecs directory
In-Reply-To: <b10d1812-85cb-4958-a493-185701dcdd0d@intel.com>
References: <20250709160434.1859-1-tiwai@suse.de>
	<20250709160434.1859-7-tiwai@suse.de>
	<b6ecdfd3-f5c0-4ca1-b38d-e16dc5ca2855@intel.com>
	<87h5zfqh1k.wl-tiwai@suse.de>
	<b10d1812-85cb-4958-a493-185701dcdd0d@intel.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spam-Level: 
X-Spam-Flag: NO
X-Rspamd-Queue-Id: 6C5DB1F7B6
X-Rspamd-Action: no action
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spamd-Result: default: False [-3.51 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	RCVD_TLS_ALL(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	DNSWL_BLOCKED(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	MIME_TRACE(0.00)[0:+];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo,suse.de:dkim,suse.de:mid];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	DKIM_TRACE(0.00)[suse.de:+]
X-Spam-Score: -3.51

On Mon, 14 Jul 2025 11:08:01 +0200,
Cezary Rojewski wrote:
> 
> On 2025-07-14 11:04 AM, Takashi Iwai wrote:
> > On Mon, 14 Jul 2025 10:57:59 +0200,
> > Cezary Rojewski wrote:
> >> 
> >> On 2025-07-09 6:04 PM, Takashi Iwai wrote:
> >>> Now move the all remaining codec drivers from sound/pci/hda to
> >>> sound/hda/codecs subdirectory.  Some drivers are put under the further
> >>> vendor subdirectory, and the vendor helper code (*_helper.c) are put
> >>> under helpers subdirectory.  Also the sub-codec drivers are moved under
> >>> a different subdirectory, sound/hda/codecs/sub-codecs, for
> >>> distinguishing from the main HD-audio codec drivers.
> >>> 
> >>> The prefix patch_ and hda_ as well as the suffix _helper are dropped
> >>> from file names as they are mostly superfluous.
> >>> 
> >>> No functional changes but just file path shuffling.
> >>> 
> >> 
> >> Path: codecs/side-codecs/ looks wierd. My suggestion is to avoid the
> >> repeat and stay with codecs/side/.
> > 
> > Sorry, too late, I already merged the stuff.  (And IMO codecs/side
> > doesn't sound intuitive.)
> > 
> > Since the directory names are more or less understandable, and Cirrus
> > people seem OK with it, so let's leave as is.
> 
> Oh, didn't notice. The series is large and I wasn't expecting it to
> get merged that quickly.

There should be no much functional changes and the only matter is file
name shuffling, and no much regression reports from 0-day, so I
decided to merge for 6.17.  Then earlier, better.

Currently no further code change is planned from my side for 6.17.
Also some changes have been queued, they are post 6.17 materials.

> Guess no point in reviewing the rest then, thanks for the information!

We may still rename if something looks too worrisome, of course.
If you have something in mind, let me know.


Thanks!

Takashi
