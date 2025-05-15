Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64A2953363
	for <linux-sound@vger.kernel.org>; Thu, 15 May 2025 14:54:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747320870; cv=none; b=pma4jVNHg4dX+B/NyLncPMcZCd29A1Z5f2cY4wJwEMn/uoHVr8MesjUh3U+64jzR7e62kUDPhMwEoXn0lkcW0tx4ZYS3wsCAYYd29/c3cJIxTLkKKuAORbXvym72+mPy31jo/G1sCIszAVgeEYXABv/N3SwRONeU/a6I/+Wjrbs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747320870; c=relaxed/simple;
	bh=uyqwWJDIQTsJ14IRS/a3ifW1FJp1hlKp536TcC9T2zI=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=SvKSEECvku/jGpk24IS72cyb/q66kPGoJ5DJZCYjwhD9JVO5fNJs+W5EgA6oOGfbSEHyi9NLnzi09cuoZc/ulnK0SBEDuHcdxqUHoQh14jdwY3ny+479YS2dq1FSV1Cs83iU2j+CUA5URCs46rr8lktCkzSn2SGHn5+/T5f0rFs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=fOyFv0NZ; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=33HUf1OX; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=fOyFv0NZ; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=33HUf1OX; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="fOyFv0NZ";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="33HUf1OX";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="fOyFv0NZ";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="33HUf1OX"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 60A2C1F38A;
	Thu, 15 May 2025 14:54:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1747320866; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=FwL1reXHdHZjSREOVtVTZ/qVqdMuPZgc3IfRvtkiZVY=;
	b=fOyFv0NZiBIgJEE44CNky3NazmgxN7pJWkdJCucCofgssfjZFsQU16UQkJdawX9YXwcMy+
	LY8O16SpBapnc5wEq6zhUneA/WZ3Dz4WfyzjDRVYlVhHuvbkdi9J2YugR0+zKO+wZHWsxT
	nl55bylzTo6ZibLNZCJRl6h2fLxa/kU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1747320866;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=FwL1reXHdHZjSREOVtVTZ/qVqdMuPZgc3IfRvtkiZVY=;
	b=33HUf1OXX+1+bo+MM6WQmjvZvyCNstoGbkrdlDYBfY6LHQtpvAKzUZohVyZlid5sHXsEHs
	BQNKMcBTVYj2TaDw==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=fOyFv0NZ;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=33HUf1OX
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1747320866; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=FwL1reXHdHZjSREOVtVTZ/qVqdMuPZgc3IfRvtkiZVY=;
	b=fOyFv0NZiBIgJEE44CNky3NazmgxN7pJWkdJCucCofgssfjZFsQU16UQkJdawX9YXwcMy+
	LY8O16SpBapnc5wEq6zhUneA/WZ3Dz4WfyzjDRVYlVhHuvbkdi9J2YugR0+zKO+wZHWsxT
	nl55bylzTo6ZibLNZCJRl6h2fLxa/kU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1747320866;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=FwL1reXHdHZjSREOVtVTZ/qVqdMuPZgc3IfRvtkiZVY=;
	b=33HUf1OXX+1+bo+MM6WQmjvZvyCNstoGbkrdlDYBfY6LHQtpvAKzUZohVyZlid5sHXsEHs
	BQNKMcBTVYj2TaDw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 36FE9139D0;
	Thu, 15 May 2025 14:54:26 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id fEhdDCIAJmgoOwAAD6G6ig
	(envelope-from <tiwai@suse.de>); Thu, 15 May 2025 14:54:26 +0000
Date: Thu, 15 May 2025 16:54:25 +0200
Message-ID: <87o6vtylem.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Daniel Dadap <ddadap@nvidia.com>
Cc: alsa-devel@alsa-project.org,
	linux-sound@vger.kernel.org
Subject: Re: [PATCH] ALSA: hda - Add new driver for HDA controllers listed via ACPI
In-Reply-To: <87r00qx78f.wl-tiwai@suse.de>
References: <aCXswg1gr6cufyzp@ddadap-lakeline.nvidia.com>
	<87r00qx78f.wl-tiwai@suse.de>
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
X-Rspamd-Queue-Id: 60A2C1F38A
X-Rspamd-Action: no action
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Spamd-Result: default: False [-3.51 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_CONTAINS_FROM(1.00)[];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ARC_NA(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	RCPT_COUNT_THREE(0.00)[3];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns,nvidia.com:email];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DNSWL_BLOCKED(0.00)[2a07:de40:b281:106:10:150:64:167:received,2a07:de40:b281:104:10:150:64:97:from];
	DKIM_TRACE(0.00)[suse.de:+]
X-Spam-Score: -3.51

On Thu, 15 May 2025 16:45:52 +0200,
Takashi Iwai wrote:
> 
> On Thu, 15 May 2025 15:31:46 +0200,
> Daniel Dadap wrote:
> > 
> > Some systems expose HD-Audio controllers via objects in the ACPI tables
> > which encapsulate the controller's interrupt and the base address for the
> > HDA registers in an ACPI _CRS object, for example, as listed in this ACPI
> > table dump excerpt:
> > 
> >         Device (HDA0)
> >         {
> >             Name (_HID, "NVDA2014")  // _HID: Hardware ID
> >             ...
> >             Name (_CRS, ResourceTemplate ()  // _CRS: Current Resource Settings
> >             {
> >                 Memory32Fixed (ReadWrite,
> >                     0x36078000,         // Address Base
> >                     0x00008000,         // Address Length
> >                     )
> >                 Interrupt (ResourceConsumer, Level, ActiveHigh, Exclusive, ,, )
> >                 {
> >                     0x0000021E,
> >                 }
> >             })
> >         }
> > 
> > Add support for HDA controllers discovered through ACPI, including support
> > for some platforms which expose such HDA controllers on NVIDIA SoCs. This
> > is done with a new driver which uses existing infrastructure for extracting
> > resource information from _CRS objects and plumbs the parsed resource
> > information through to the existing HDA infrastructure to enable HD-Audio
> > functionality on such devices.
> > 
> > Although this driver is in the sound/pci/hda/ directory, it targets devices
> > which are not actually enumerated on the PCI bus. This is because it depends
> > upon the Intel "Azalia" infrastructure which has traditionally been used for
> > PCI-based devices.
> > 
> > Signed-off-by: Daniel Dadap <ddadap@nvidia.com>
> 
> Thanks for the patch.
> The code looks fine.  Just a nitpicking:
> 
> > +static int __maybe_unused hda_acpi_suspend(struct device *dev)
> ....
> > +static int __maybe_unused hda_acpi_resume(struct device *dev)
> 
> The __maybe_unused is superfluous when you set up
> SYSTEM_SLEEP_PM_OPS() macro instead in the below:
> 
> > +static const struct dev_pm_ops hda_acpi_pm = {
> > +	SET_SYSTEM_SLEEP_PM_OPS(hda_acpi_suspend, hda_acpi_resume)

Also, at the next time, please put the maintainer (me) to Cc.


thanks,

Takashi
