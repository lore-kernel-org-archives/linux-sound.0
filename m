Received: from m.b4.vu (m.b4.vu [203.16.231.148])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7A92358372
	for <linux-sound@vger.kernel.org>; Tue, 26 May 2026 05:42:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.16.231.148
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779774143; cv=none; b=M7T7eQxzthYzk4Al7MTGCuep/DnAZyEo6PNfhaRYyylj46kcffXxTYwct5ai88X8YXDi2B1s0jPvjLiGK+971L9drwVpKEtB92V4QdJF/PNdnOviXlt8f5t/JMTHk7WomwfL4VxDm2Kdgx/UiAkGS8uVh5gTul6hQswR2TC8eCs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779774143; c=relaxed/simple;
	bh=wzBWuPlozynZPiWZMYsq7pac79tVktriOCr8M4gqK6c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Rs1IwOjOqJwSxN/jbtJZA0GAL1gx+ZouI71ji1xaljlv4oksbzjZybYhz26aZnPVzo9DlrY1cFUdSjmNk6endk1LtN9vm+e3FFoyScsGaDJYp1VKqmxHbTuLkjqzC0DqXmHAh7w+UwMN7TuszryDu6PXNqKubXf9dGI7t44E2bE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=b4.vu; spf=pass smtp.mailfrom=b4.vu; dkim=pass (2048-bit key) header.d=b4.vu header.i=@b4.vu header.b=UBEJwcq1; arc=none smtp.client-ip=203.16.231.148
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=b4.vu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=b4.vu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=b4.vu header.i=@b4.vu header.b="UBEJwcq1"
Received: by m.b4.vu (Postfix, from userid 1000)
	id 068E867D84B2; Tue, 26 May 2026 15:12:13 +0930 (ACST)
DKIM-Filter: OpenDKIM Filter v2.11.0 m.b4.vu 068E867D84B2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=b4.vu; s=m1;
	t=1779774133; bh=FGDE8GhEvYCiC29gJWSIWyQ2E8oyErC7iRCW7dvX9bE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=UBEJwcq1Yzo1kVUbQpmwtGfp/KDhpWnyNHVllBpvqx26gMUJU49psU+iXr40oo5iC
	 7rPT0lTa9XVbSNatbg2mBThgDOKc8lu0npBqyZEE0N968swlgSNIfEuvg5fqwDe2cI
	 wM+kTejkrSBzalijhBXi16ZreCr6F2muEMaJmv/QcujGVB7+PO/foeEDLv5aYSsokg
	 q4BLAp8SdY6nNBVXfmPkQkd89REw028jh0Q1ct7V413DIxSS40SZEGZNaWAKWJI6eK
	 S41eqKuHlXFEvtW0xtBHqd5IgIK5hSfUTyx3xBdfybmoOmV3xUVXARbO3bNZgH84y9
	 8P3jnByOpcuyA==
Date: Tue, 26 May 2026 15:12:12 +0930
From: "Geoffrey D. Bennett" <g@b4.vu>
To: Takashi Iwai <tiwai@suse.de>
Cc: Takashi Iwai <tiwai@suse.com>, linux-sound@vger.kernel.org
Subject: Re: [PATCH] ALSA: scarlett2: Fix 2i2 Gen 4 direct monitor gain on
 firmware 2417
Message-ID: <ahUytAir51SvJjd7@m.b4.vu>
References: <ahIWTueUlWA5xiV+@m.b4.vu>
 <87a4togd7d.wl-tiwai@suse.de>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87a4togd7d.wl-tiwai@suse.de>

On Mon, May 25, 2026 at 09:28:38AM +0200, Takashi Iwai wrote:
> On Sat, 23 May 2026 23:04:14 +0200,
> Geoffrey D. Bennett wrote:
> > 
> > Firmware 2417 for the Scarlett 4th Gen 2i2 moved the direct monitor
> > gain parameter by 4 bytes, from offset 0x2a0 to 0x2a4, breaking the
> > "Direct Monitor X Mix Y" controls.
> > 
> > Special-case the offset in the get/set config helpers when the
> > running firmware is 2417 or later.
> > 
> > Fixes: 4e809a299677 ("ALSA: scarlett2: Add support for Solo, 2i2, and 4i4 Gen 4")
> > Cc: <stable@vger.kernel.org>
> > Signed-off-by: Geoffrey D. Bennett <g@b4.vu>
> > ---
> > Tested on a Scarlett 2i2 4th Gen by writing to "Direct Monitor 1
> > Mix A Input 01" and observing the USB traffic with usbmon:
> > 
> > - Firmware 2417, unpatched driver: write targets offset 0x2A0 (bug)
> > - Firmware 2417, patched driver:   write targets offset 0x2A4
> > - Firmware 2128, patched driver:   write targets offset 0x2A0
> 
> Applied now to for-linus branch.
> 
> It seems that this can be merged without conflict to for-next that
> contains already your previous series.  Let me know if any adjustment
> is needed at merging this with the previous one.

Thanks. Although they don't conflict, they are equivalent, so no need
for both. I think my previous series is the better way long term, so
can you drop the new patch when you merge to for-next? Or should I
send a revert? Or do you have a different preference?

Regards,
Geoffrey.
