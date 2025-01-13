Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13CCB3C1F;
	Mon, 13 Jan 2025 07:47:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736754437; cv=none; b=gcoOUQwcVRaUXk8BomiuC7Yryz9dDKCTWSCLg9ynnisDmyiesQvPULW+iXiGpzOjCe5ten7b0MST5GjEsSPUhsFXDFzRlSIa8EJFJ47eeZGlx4cekx/Qc10Yk1QTR20VVpa4zz44VrRgKYikxG44yiOGx8hSKTFY/hfUICjJXoc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736754437; c=relaxed/simple;
	bh=AIfmDf8D9NJz4NJc1zYT3jVwqLbDET0CFn6I3+Fn2bM=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=W/TswkcG4TQmRM6xWyGHsH9y7y8v1AJbpczd8BXM0DWz7+nbbzedI7D0sHQB4XsmPekKcaCV+zZkfe2u8EgYftZWOKHEn3gP/GZzkH5FL3nfYVqfvZaw5AEwPqqJfDV27rmVNF9PjZ54m94tP0GwxCVBecczupE23jBHv0V6rng=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=naTkfRWR; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=ZIV65bIM; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=naTkfRWR; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=ZIV65bIM; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="naTkfRWR";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="ZIV65bIM";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="naTkfRWR";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="ZIV65bIM"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 0451A21175;
	Mon, 13 Jan 2025 07:47:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1736754433; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=z/EQOF1+61kv5e32o3JG7oTiAGUcUEaXdeUdhhtsp90=;
	b=naTkfRWR155rv6a8JPL36vXStqYH9h5Mvt8TofBFtA2/FgjMashiSd0c1f+5MHox5DRmov
	GwdsoODK8Vz1Bi4Fkiy0GAUUL/RK8mMwauIIUehHYJz6zi58Oqj23CJw3/rDl5lrMDGdAc
	QxEfbLZt8YIuDOallrzAmAKlqHS3cxk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1736754433;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=z/EQOF1+61kv5e32o3JG7oTiAGUcUEaXdeUdhhtsp90=;
	b=ZIV65bIM/u8IX7081ishY6r8Tl752VD2TWnahmT/T7pmkjziiboJd38HLfcBBWGEquxVk0
	WFVLPAxQEv5yVlCA==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=naTkfRWR;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=ZIV65bIM
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1736754433; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=z/EQOF1+61kv5e32o3JG7oTiAGUcUEaXdeUdhhtsp90=;
	b=naTkfRWR155rv6a8JPL36vXStqYH9h5Mvt8TofBFtA2/FgjMashiSd0c1f+5MHox5DRmov
	GwdsoODK8Vz1Bi4Fkiy0GAUUL/RK8mMwauIIUehHYJz6zi58Oqj23CJw3/rDl5lrMDGdAc
	QxEfbLZt8YIuDOallrzAmAKlqHS3cxk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1736754433;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=z/EQOF1+61kv5e32o3JG7oTiAGUcUEaXdeUdhhtsp90=;
	b=ZIV65bIM/u8IX7081ishY6r8Tl752VD2TWnahmT/T7pmkjziiboJd38HLfcBBWGEquxVk0
	WFVLPAxQEv5yVlCA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 8061E13310;
	Mon, 13 Jan 2025 07:47:12 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id 1FKnHQDFhGfrNAAAD6G6ig
	(envelope-from <tiwai@suse.de>); Mon, 13 Jan 2025 07:47:12 +0000
Date: Mon, 13 Jan 2025 08:47:12 +0100
Message-ID: <87ldvf2m0v.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: "Xu, Baojun" <baojun.xu@ti.com>
Cc: Takashi Iwai <tiwai@suse.de>,
	"robh+dt@kernel.org" <robh+dt@kernel.org>,
	"andriy.shevchenko@linux.intel.com" <andriy.shevchenko@linux.intel.com>,
	"lgirdwood@gmail.com" <lgirdwood@gmail.com>,
	"perex@perex.cz"
	<perex@perex.cz>,
	"Ding, Shenghao" <shenghao-ding@ti.com>,
	"Navada Kanyana, Mukund" <navada@ti.com>,
	"13916275206@139.com" <13916275206@139.com>,
	"Hampiholi, Vallabha" <v-hampiholi@ti.com>,
	"P O, Vijeth" <v-po@ti.com>,
	"linux-sound@vger.kernel.org" <linux-sound@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"liam.r.girdwood@intel.com" <liam.r.girdwood@intel.com>,
	"yung-chuan.liao@linux.intel.com" <yung-chuan.liao@linux.intel.com>,
	"broonie@kernel.org" <broonie@kernel.org>,
	"antheas.dk@gmail.com"
	<antheas.dk@gmail.com>,
	"stuart.a.hayhurst@gmail.com"
	<stuart.a.hayhurst@gmail.com>,
	"dan.carpenter@linaro.org"
	<dan.carpenter@linaro.org>
Subject: Re: [EXTERNAL] Re: [PATCH v1] ALSA: hda/tas2781: Ignore SUBSYS_ID not found for tas2563 projects
In-Reply-To: <311e99af8c6d4041ac2c19b115a8c0ab@ti.com>
References: <20250111095728.1232-1-baojun.xu@ti.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 0451A21175
X-Spam-Score: -2.01
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.01 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[19];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FREEMAIL_ENVRCPT(0.00)[139.com,gmail.com];
	FREEMAIL_CC(0.00)[suse.de,kernel.org,linux.intel.com,gmail.com,perex.cz,ti.com,139.com,vger.kernel.org,intel.com,linaro.org];
	RCVD_TLS_ALL(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	TAGGED_RCPT(0.00)[dt];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	REDIRECTOR_URL(0.00)[proofpoint.com];
	DKIM_TRACE(0.00)[suse.de:+];
	ASN(0.00)[asn:25478, ipnet:::/0, country:RU];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo]
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spam-Flag: NO
X-Spam-Level: 

On Mon, 13 Jan 2025 07:41:02 +0100,
Xu, Baojun wrote:
> 
> > ________________________________________
> > From: Takashi Iwai <tiwai@suse.de>
> > Sent: 12 January 2025 16:26
> > To: Xu, Baojun
> > Cc: tiwai@suse.de; robh+dt@kernel.org; andriy.shevchenko@linux.intel.com; lgirdwood@gmail.com; perex@perex.cz; Ding, Shenghao; Navada Kanyana, Mukund; 13916275206@139.com; Hampiholi, Vallabha; P O, Vijeth; linux-sound@vger.kernel.org; linux-kernel@vger.kernel.org; liam.r.girdwood@intel.com; yung-chuan.liao@linux.intel.com; broonie@kernel.org; antheas.dk@gmail.com; stuart.a.hayhurst@gmail.com; dan.carpenter@linaro.org
> > Subject: [EXTERNAL] Re: [PATCH v1] ALSA: hda/tas2781: Ignore SUBSYS_ID not found for tas2563 projects
> > 
> > On Sat, 11 Jan 2025 10: 57: 28 +0100, Baojun Xu wrote: > > Driver will return error if no SUBSYS_ID found in BIOS(acpi). > It will cause error in tas2563 projects, which have no SUBSYS_ID. > Change strncmp to strcmp to avoid warning
> > ZjQcmQRYFpfptBannerStart
> > This message was sent from outside of Texas Instruments.
> > Do not click links or open attachments unless you recognize the source of this email and know the content is safe.
> > <https://us-phishalarm-ewt.proofpoint.com/EWT/v1/G3vK!vxdrHfwF_qfzogYE_xtoX7lTozH70XOKA0HRu-ioBvUvCv8QNkmAsR1WurvR9Zlh7GmU7A$>
> > Report Suspicious
> > 
> > ZjQcmQRYFpfptBannerEnd
> > 
> > On Sat, 11 Jan 2025 10:57:28 +0100,
> > Baojun Xu wrote:
> > >
> > > Driver will return error if no SUBSYS_ID found in BIOS(acpi).
> > > It will cause error in tas2563 projects, which have no SUBSYS_ID.
> > > Change strncmp to strcmp to avoid warning for weird length.
> > 
> > I don't understand the logic.
> > The use of strncmp() there already matches only with the exact string
> > "INT8866", not the substring, because you use sizeof("INT8866") which
> > is 8 including the NUL-terminator.
> > The only merit of strncmp() in this case is that it can be used for an
> > unterminated char array.
> > 
> > In which situation do you see the problem and how does your patch
> > improve / fix it?  Please give a more concrete example.
> > 
> 
> Because it will have Smatch Static Checker warning:
> 
> 	sound/pci/hda/tas2781_hda_i2c.c:146 tas2781_read_acpi()
> 	warn: strncmp() with weird length: 7 vs 8
> 
> sound/pci/hda/tas2781_hda_i2c.c
>     144         if (IS_ERR(sub)) {
>     145                 /* No subsys id in older tas2563 projects. */
> --> 146                 if (!strncmp(hid, "INT8866", sizeof("INT8866")))
> 
> This patch will avoid this warning, and this hid will be a null terminated
> "INT8866", so have no different when this code was go through.

Ah, so your change is only about the last line in the sentence.
The former two lines describe what the current driver already does.

As the driver behavior won't change, your current patch subject and
description are way too confusing.  Please rephrase them and
resubmit.  It's nothing but just a code refactoring that eventually
shuts up the Smatch warning, after all.


thanks,

Takashi
