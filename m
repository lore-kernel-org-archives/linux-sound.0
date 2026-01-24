Received: from m.b4.vu (m.b4.vu [203.16.231.148])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E21521B191
	for <linux-sound@vger.kernel.org>; Sat, 24 Jan 2026 16:30:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.16.231.148
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769272255; cv=none; b=dTx9cF0nT8JQPJAyH7y/IuiHSTrhRnRMcMhthA0kW8cSPo96HhJm1BXZZDdJdr+vNN2UT02ksQJaaXhOLDsFm2yUmoGtcVSzR/ER+leUkCrTYe44JbWD+WPtoesnJAD2u6atMYwcESZ/oC9ge4x2JP2kCnP0t96AeVZ+6kHtvkY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769272255; c=relaxed/simple;
	bh=tTK8cSUnHJOA+WFXH+rEq8dAaDkgNj/OInYTC1HPotw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ea2Ok5H7yGbup+bUI2UZERNORqO+BkND74hWHAmAFmy6/TcD15wAcG4NG22g97HIyqZ2TdFjqKANl0/eGGVlCYNFMK2SIbETVV2Zg+GTBaf0F6F7Ak1nPw3moFUCyeC8l8DCOIDwDExD1yf/1QVy+mgtAQ0eVfDWTDkXOlRXxco=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=b4.vu; spf=pass smtp.mailfrom=b4.vu; dkim=pass (2048-bit key) header.d=b4.vu header.i=@b4.vu header.b=U17mU9J5; arc=none smtp.client-ip=203.16.231.148
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=b4.vu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=b4.vu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=b4.vu header.i=@b4.vu header.b="U17mU9J5"
Received: by m.b4.vu (Postfix, from userid 1000)
	id 7BCA8676AE25; Sun, 25 Jan 2026 02:54:07 +1030 (ACDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 m.b4.vu 7BCA8676AE25
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=b4.vu; s=m1;
	t=1769271847; bh=LV0FXqWsvaXTyUgbQZ6JQYXCgFHUm3aDQkBt3/RVgeM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=U17mU9J5YDDNNFrvbx0Nq1hW72SyeeyqvhKO/sebLzH90nJnAIDYpo3JmT0xTkJkk
	 cbVDKRR0bdaMy9OP3eD8W5s3t1n1A3KzWGWqp1Jp4k1r5ujRr7wsaCksWzQuErB0A2
	 Lz1XUTuRm1meaWULuqEOnEpHjmav+Dtz1yyDvT2XyvQ+S0mb/L+cjFtQuDpsiNg0V4
	 XPNlDyztE0dq069LVVBNcaNGu+LdL0gCen02Ey8rxKinHlhypucm5OjMjLL4eN7Tau
	 KPA52BK4M1I1JbJ6UjbntUFvWwGbc+1I7wUtRg3psQYczn10mjGFnCtRUw87qcwY8/
	 Q11CTeLLT7W2w==
Date: Sun, 25 Jan 2026 02:54:07 +1030
From: "Geoffrey D. Bennett" <g@b4.vu>
To: Ruslan Garynin <ufurifkf@gmail.com>
Cc: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	linux-sound@vger.kernel.org
Subject: Re: Scarlett 16i16 4th Gen: I/O error on kernel 6.19-rc6 (works on
 6.18)
Message-ID: <aXTyJ10uiFoKJ5Tr@m.b4.vu>
References: <CAF7epbtx7YDwa2NBDZY+9NuxCEirY90jNonY58KgWfx8pq6QyQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAF7epbtx7YDwa2NBDZY+9NuxCEirY90jNonY58KgWfx8pq6QyQ@mail.gmail.com>

Hi Ruslan,

Audio playback for Focusrite USB interfaces is handled by the generic
USB audio driver (snd-usb-audio); the FCP driver I maintain only
handles the control protocol (mixer, routing, etc.) over a separate
USB endpoint — it's not involved in the actual audio data transfer.

I've CC'd the ALSA maintainers and linux-sound list to continue the
discussion there.

Regards,
Geoffrey.

On Sat, Jan 24, 2026 at 08:56:38PM +0500, Ruslan Garynin wrote:
>    Hi Geoffrey,
> 
>    I found a regression affecting Scarlett 16i16 4th Gen playback on kernel
>    6.19-rc6.
> 
>    Summary:
>    - Working: 6.18.6-zen1-1-zen
>    - Broken: 6.19.0-rc6-1-mainline
>    - Issue: I/O error on USB audio playback
>    - HDA/HDMI audio works fine on 6.19-rc6, so it's USB audio specific
> 
>    Test:
>      systemctl --user stop pipewire pipewire-pulse wireplumber
>      speaker-test -D hw:3 -c 18 -t sine -F S32_LE
> 
>    On 6.18 (works):
>      0 - Front Left
>      1 - Front Right
>      ...
>      15 - Channel 16
>      (sound plays)
> 
>    On 6.19-rc6 (fails):
>      0 - Front Left
>      Write error: -5,Input/output error
> 
>    Device info:
>      USB ID: 1235:821b
>      FCP driver loads OK: "Focusrite Control Protocol Driver ready"
>      Implicit Feedback Mode: Yes
>      No errors in dmesg
> 
>    /proc/asound/card3/stream0:
>      Format: S32_LE
>      Channels: 18
>      Endpoint: 0x01 (1 OUT) (ASYNC)
>      Rates: 44100, 48000
>      Sync Endpoint: 0x81 (1 IN)
>      Implicit Feedback Mode: Yes
> 
>    Note: This might get fixed on its own when mainline is updated further
>    before
>    the stable 6.19 release. I'm just reporting this in case it doesn't, so
>    you're
>    aware of a potential issue that could affect users when 6.19 changes
>    eventually
>    land in stable kernels.
> 
>    Let me know if you need any additional info or testing.
> 
>    Thanks for maintaining the Scarlett driver!
> 
>    Best regards,
>    Ruslan Garynin
