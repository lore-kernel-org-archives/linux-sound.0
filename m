Received: from m.b4.vu (m.b4.vu [203.16.231.148])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C98134388F
	for <linux-sound@vger.kernel.org>; Sat, 23 May 2026 21:01:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.16.231.148
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779570069; cv=none; b=SCC2fKs1lrkiP2rpu2JT57iIHJQd3wXf7ZiaKdbZRlJjMHmGxzq2+tfesMKNUlupTAFEuVKtCw2dLCCy/bDkhXHCe3sYNPpDiylY6/JRg8vdOC+jlExGC49dyHNiRRIddijWn4QShXqGLiZj0f6g2S04qCEmHgiWDoZJTQ/Rr8c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779570069; c=relaxed/simple;
	bh=6pp+nvKpZzkH+kGXBVunsGYLT6xDG9VJN0E321Vu0+4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XX4XWn3/mdBhw9rH34HEfahi39CwQBdGMFCnPbmSnGNfwyfFvCRoLe3RX7nKHbQPDcfWcHTlY7jXoBrohcJIK2BoM7rrFPuEzxQmcGtDXLCQ/hJMf8aNtqKufZtgvMWJGu8F1gGHFQHKEojXF3AORE9S7isN8iP1c0r9SlkWBP8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=b4.vu; spf=pass smtp.mailfrom=b4.vu; dkim=pass (2048-bit key) header.d=b4.vu header.i=@b4.vu header.b=ikIcgwYh; arc=none smtp.client-ip=203.16.231.148
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=b4.vu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=b4.vu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=b4.vu header.i=@b4.vu header.b="ikIcgwYh"
Received: by m.b4.vu (Postfix, from userid 1000)
	id 731E467D31AB; Sun, 24 May 2026 06:30:58 +0930 (ACST)
DKIM-Filter: OpenDKIM Filter v2.11.0 m.b4.vu 731E467D31AB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=b4.vu; s=m1;
	t=1779570058; bh=ThoeZggNtJAWGWxWl0PPoCO0qYjnY+LQcQeSTbZUi4A=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ikIcgwYhRtWmR3g1sugVdWyRV9pd0g+YAXMA8IaN3mINx26ttq5izfSmCJ2mGgQoq
	 J8v6vDNKUZLsQ2Dr93RJtpKTdE4ZYvRkoxt4ZzejI6yp1E1GB/GPEt8FGtRRXf6LCm
	 eJZfG1x1zpyRNB/Lua5v8cm9RwZRp1vWDoM2nYtxDSdwx/vcMskaOky816PN36GO11
	 kztnWOd94S8LPRTkY99NCqbfiR0VU9TD9Hmg/ac+zQOhoEORdlAuJ9W7suYQzLzwD8
	 /uOHXEJAfmATYK+TsOC2EEI4cWcI7viY6ljUfNzZm1TRqFzE3CEQ+fTiA2FmWscAK/
	 9eAoiy5SUcvAw==
Date: Sun, 24 May 2026 06:30:58 +0930
From: "Geoffrey D. Bennett" <g@b4.vu>
To: Takashi Iwai <tiwai@suse.de>
Cc: Takashi Iwai <tiwai@suse.com>, linux-sound@vger.kernel.org
Subject: Re: [PATCH 0/3] ALSA: scarlett2: Fix 2i2 Gen 4 direct monitor on
 firmware 2417
Message-ID: <ahIVig0OIfW0rueS@m.b4.vu>
References: <ae0tEsi8dKm1akJd@m.b4.vu>
 <87cxzkzja7.wl-tiwai@suse.de>
 <ag4ZKLl6t+7NBHyw@m.b4.vu>
 <87ldddk87x.wl-tiwai@suse.de>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87ldddk87x.wl-tiwai@suse.de>

On Thu, May 21, 2026 at 12:49:06AM +0200, Takashi Iwai wrote:
> On Wed, 20 May 2026 22:27:20 +0200,
> Geoffrey D. Bennett wrote:
> > 
> > On Mon, Apr 27, 2026 at 02:20:48PM +0200, Takashi Iwai wrote:
> > > On Sat, 25 Apr 2026 23:07:30 +0200,
> > > Geoffrey D. Bennett wrote:
> > > > 
> > > > Hi Takashi,
> > > > 
> > > > Firmware 2417 for the Scarlett 4th Gen 2i2 moved the direct monitor
> > > > gain parameters, breaking that control's functionality.
> > > > 
> > > > The driver already has per-device scarlett2_config_set tables
> > > > describing each parameter's offset, but only one table per device, so
> > > > there was no way to express "this offset changed at firmware version
> > > > N". This series adds that capability and uses it to fix the 2i2 Gen 4.
> > > > 
> > > > Patches
> > > > -------
> > > > 
> > > > 1/3: Replace the device info's single config_set pointer with a
> > > > config_sets array of {from_firmware_version, config_set} entries, and
> > > > resolve the running config_set at probe time once the firmware version
> > > > has been read. Each device gets a single entry matching its previous
> > > > min_firmware_version (or 0), so this is a no-op preparation step.
> > > > 
> > > > 2/3: Drop the now-redundant min_firmware_version field from
> > > > scarlett2_device_info; config_sets[0].from_firmware_version carries
> > > > the same meaning. No functional change.
> > > > 
> > > > 3/3: Add a second 2i2 Gen 4 config_set with DIRECT_MONITOR_GAIN at the
> > > > new offset, gated on firmware >= 2417. All other offsets are
> > > > unchanged.
> > > > 
> > > > Patch 1 is a prerequisite for patch 3. Patch 2 isn't a strict
> > > > dependency, but it removes a now-redundant field, so patch 3's Cc:
> > > > stable trailer names both 1 and 2 as prereqs by subject (please
> > > > substitute SHAs at apply time). Patch 2 can be dropped from the stable
> > > > backport if you'd prefer.
> > > > 
> > > > Tested
> > > > ------
> > > > 
> > > > Verified on a Scarlett 2i2 4th Gen by writing to Monitor 1 Mix A Input
> > > > 01 and observing with usbmon:
> > > > 
> > > > - Firmware 2128, patched driver:   write targets offset 0x2A0
> > > > - Firmware 2417, patched driver:   write targets offset 0x2A4
> > > > - Firmware 2417, unpatched driver: write targets offset 0x2A0 (bug)
> > > > 
> > > > Regards,
> > > > Geoffrey
> > > > 
> > > > Geoffrey D. Bennett (3):
> > > >   ALSA: scarlett2: Allow selecting config_set by firmware version
> > > >   ALSA: scarlett2: Fold min_firmware_version into config_sets
> > > >   ALSA: scarlett2: Update offsets for 2i2 Gen 4 firmware 2417
> > > 
> > > Applied all to for-next branch now.  Thanks.
> > > 
> > > 
> > > Takashi
> > 
> > Hi Takashi,
> > 
> > This commit is currently queued for 7.2:
> > 
> >   3ca15754b561 ALSA: scarlett2: Update offsets for 2i2 Gen 4 firmware 2417
> > 
> > Users updating to firmware 2417 are hitting broken direct monitor gain
> > controls, so I wanted to ask if there's any chance of it (and its two
> > prerequisite commits) making 7.1 & stable now rather than waiting for
> > the next merge window?
> 
> The changes are simply too large as a fix for *-rc.
> If you can work on a reduced simpler fix, I can merge it for 7.1-rc,
> though.

Thanks, done. I will submit a reduced fix (+29/-4, single commit) in a
moment.

I'm not sure if anything needs to be done wrt the existing fix in
for-next? Do I need to submit a revert of the reduced fix for 7.2? It
doesn't look like it conflicts, but only one is needed.

Regards,
Geoffrey.
