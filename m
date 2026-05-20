Received: from m.b4.vu (m.b4.vu [203.16.231.148])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 082F834572F
	for <linux-sound@vger.kernel.org>; Wed, 20 May 2026 20:34:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.16.231.148
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779309298; cv=none; b=D1Di5l3FjBq5YrZ5qXa923efRbiZQODEMRYujRuZLSPvrM+gc2eso9lfN8teJohSsLWEbGDryovCs1/VGToZmUhuHmWHNXai5FN2xAnXDe++HHSFD+nnLS7wMebNpFxGBqQ3HWxsuHyIToHWGDwTmQZySC+xoMW7qwjAxh4pQiQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779309298; c=relaxed/simple;
	bh=PSRxRI5N22xm/SAsmhBr55tpvTOykkXVwVcAj65C/xk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QwXLCHQhj9Ypg8N03QOMeqr/eLIOCypTu0ZxPa18Z0QWYfANldnYTsVs9U985ovaudOmlPh6dRfDdagUdgI4qLgKQGwZtjuui8v9eq+X+Rshw+xaK4YEfo7f1mANEouhCbJyNDnfoZlFwQPelAKmgU562BLO1BABAWjUzrcETtU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=b4.vu; spf=pass smtp.mailfrom=b4.vu; dkim=pass (2048-bit key) header.d=b4.vu header.i=@b4.vu header.b=wmVwm40u; arc=none smtp.client-ip=203.16.231.148
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=b4.vu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=b4.vu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=b4.vu header.i=@b4.vu header.b="wmVwm40u"
Received: by m.b4.vu (Postfix, from userid 1000)
	id C19CF67CEBAA; Thu, 21 May 2026 05:57:20 +0930 (ACST)
DKIM-Filter: OpenDKIM Filter v2.11.0 m.b4.vu C19CF67CEBAA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=b4.vu; s=m1;
	t=1779308840; bh=G7jTuoaUUrFihjaHcMnm5UY2zxexDb9KFWbtfSSSCUY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=wmVwm40u7GH0XU6OoHGEpjL172hcb1nfNdOqd+nUJ9r3fTTDQvm/wjvylT9pRTrPD
	 g437Hu4e0vYuIoc5wPSTCXgcgIGqjHeoTN24+OwejyhyOQwFbRqjOZ2skQqdu3SrI1
	 rzI6dMsLKJdQT+JO6Pfwnd86ChKKNg4j93BuJbhocSZnOqTmv06WeMwHLzosw8h3qb
	 Syz6IE4BwxbZIJGgPdBml/jSUBbk7LHkGI+u9Q24EBna1XVt2VEtjT46G7If6Q19qf
	 18KX9ddsEwjFuTEftXhR7jWoeGcikHWi7zbDeMDxuj0OTW0vfN1teTuy/sIh/ePFsb
	 QrrWMFnWRotKg==
Date: Thu, 21 May 2026 05:57:20 +0930
From: "Geoffrey D. Bennett" <g@b4.vu>
To: Takashi Iwai <tiwai@suse.de>
Cc: Takashi Iwai <tiwai@suse.com>, linux-sound@vger.kernel.org
Subject: Re: [PATCH 0/3] ALSA: scarlett2: Fix 2i2 Gen 4 direct monitor on
 firmware 2417
Message-ID: <ag4ZKLl6t+7NBHyw@m.b4.vu>
References: <ae0tEsi8dKm1akJd@m.b4.vu>
 <87cxzkzja7.wl-tiwai@suse.de>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87cxzkzja7.wl-tiwai@suse.de>

On Mon, Apr 27, 2026 at 02:20:48PM +0200, Takashi Iwai wrote:
> On Sat, 25 Apr 2026 23:07:30 +0200,
> Geoffrey D. Bennett wrote:
> > 
> > Hi Takashi,
> > 
> > Firmware 2417 for the Scarlett 4th Gen 2i2 moved the direct monitor
> > gain parameters, breaking that control's functionality.
> > 
> > The driver already has per-device scarlett2_config_set tables
> > describing each parameter's offset, but only one table per device, so
> > there was no way to express "this offset changed at firmware version
> > N". This series adds that capability and uses it to fix the 2i2 Gen 4.
> > 
> > Patches
> > -------
> > 
> > 1/3: Replace the device info's single config_set pointer with a
> > config_sets array of {from_firmware_version, config_set} entries, and
> > resolve the running config_set at probe time once the firmware version
> > has been read. Each device gets a single entry matching its previous
> > min_firmware_version (or 0), so this is a no-op preparation step.
> > 
> > 2/3: Drop the now-redundant min_firmware_version field from
> > scarlett2_device_info; config_sets[0].from_firmware_version carries
> > the same meaning. No functional change.
> > 
> > 3/3: Add a second 2i2 Gen 4 config_set with DIRECT_MONITOR_GAIN at the
> > new offset, gated on firmware >= 2417. All other offsets are
> > unchanged.
> > 
> > Patch 1 is a prerequisite for patch 3. Patch 2 isn't a strict
> > dependency, but it removes a now-redundant field, so patch 3's Cc:
> > stable trailer names both 1 and 2 as prereqs by subject (please
> > substitute SHAs at apply time). Patch 2 can be dropped from the stable
> > backport if you'd prefer.
> > 
> > Tested
> > ------
> > 
> > Verified on a Scarlett 2i2 4th Gen by writing to Monitor 1 Mix A Input
> > 01 and observing with usbmon:
> > 
> > - Firmware 2128, patched driver:   write targets offset 0x2A0
> > - Firmware 2417, patched driver:   write targets offset 0x2A4
> > - Firmware 2417, unpatched driver: write targets offset 0x2A0 (bug)
> > 
> > Regards,
> > Geoffrey
> > 
> > Geoffrey D. Bennett (3):
> >   ALSA: scarlett2: Allow selecting config_set by firmware version
> >   ALSA: scarlett2: Fold min_firmware_version into config_sets
> >   ALSA: scarlett2: Update offsets for 2i2 Gen 4 firmware 2417
> 
> Applied all to for-next branch now.  Thanks.
> 
> 
> Takashi

Hi Takashi,

This commit is currently queued for 7.2:

  3ca15754b561 ALSA: scarlett2: Update offsets for 2i2 Gen 4 firmware 2417

Users updating to firmware 2417 are hitting broken direct monitor gain
controls, so I wanted to ask if there's any chance of it (and its two
prerequisite commits) making 7.1 & stable now rather than waiting for
the next merge window?

Thanks,
Geoffrey.
