Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18F323B47EE
	for <linux-sound@vger.kernel.org>; Sat,  8 Aug 2026 20:10:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786219820; cv=none; b=i48K/S5WZONX1AZgcUClmYyqZ4lCebuXfpjGuEdZnF6cOXaNrOWYVW7tj+G4PUFqKtSvcgpZlfBvyNJuzNMSIkBuqDHrkM1otcgLae/zgwnkQ08uyPBMTqArCTFlJxjvacYdCke1M1+hptyTakSD83iK0Lz88FJwHvbjSvaMICc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786219820; c=relaxed/simple;
	bh=csw+hblTjHl/l4tmXlY6LSzUrVPRTn98tg2ybLhvA+0=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=b6j72cUESaaq+QgGFTzTDrE04pbU5a5URHj98+JMbhdhTFwu1f3Bhq0nAA0ptehx1208EvOaGN7dnSmMa5O6cCVFetBSMR9CsAjo5GhSx6OWNPzD42CHXs4iZ8o4Q9mL4y//OAUSwarpzMY7z1R19a0QYIsDa3Xmz0jt5Dag1OQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iOSst8UU; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iOSst8UU"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4980dc26022so5927465e9.1
        for <linux-sound@vger.kernel.org>; Sat, 08 Aug 2026 13:10:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786219817; x=1786824617; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=zT/CAbwf/5So6z7AVxDgkbE1hgDoJ/Ab/Fh1X9cZhdc=;
        b=iOSst8UUQ5dXd9QlF/3nEJ26rKWxnMBZa6Zy8JxTcdIJPaCAs0hOKs7kLAJLc/egS3
         Nnhdu4Evry+WRJT+04Rp/HBSjchTW2uve7VdBnqJzaF5jWpld4VM5fndLjH2Tl/LtV/W
         jaib00YdCpOJQOCdWcaG0ENNInKVTOoiK6OXV7jr/4DZ3/TBrZbWY3X3eheVpCSqm+hu
         sDJKBfvl5d0mLVbFUrjCBVdjikCLMchQTRyszk1x18km0+/3MicBVpeAsNaRbLEvtyYd
         sjEjK2O7M43vQoXiF09Xng5fTuexpfOQo9VSLVr+u+2VXCPesepQLOThb6dB2KFFAuYy
         vCHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786219817; x=1786824617;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=zT/CAbwf/5So6z7AVxDgkbE1hgDoJ/Ab/Fh1X9cZhdc=;
        b=nSphD0XFUgZI5VjRxGz1VpNPcoFOx9Xn2vtEcT/Yt5/W8XabtDW0HiXHxpeREi5zIu
         bUiOEWrTnLswHWiu61KtdtVTEgCSxijqkVRPl3Us5Xw1pjXVEagu4j78D9ysld3EI74y
         VwzFPg7QLR9AIQfkt6A2HSVgb6yaAdtZk2reG/EMT4Ijyyi6SFaPum/5VLOhVS1HsM8z
         MzAIhlg8MkIzwDV8AZ1al6DwaATGea57BwR9d/HNGdY/xRQHANHe90uaBFYBm3kIuNp2
         3ebYWig4kCxottE5Q58ZcRfxuFbX/xb/ElrQ5wLKUDED7zrhnRlgg7fy5nr9omstYIWy
         ltuw==
X-Forwarded-Encrypted: i=1; AHgh+RoWNA8LBH7Pfyr4PYFE+/yHE4KsbgQ+y2RiHyLtGn6xJmscc6/VwU3P4U7dMCK3jYwn/DBeyEeITbb0aw==@vger.kernel.org
X-Gm-Message-State: AOJu0YywSlSafAAOp7auSNldFLWyHovTtBw5k1kzQYxZQ185wRYZDLvd
	BgS8UnW8MtJGJ9tkErYnBVnh/g8iRsgGF78OOajUeWNZEPtJCbR0rYblFzJPOg==
X-Gm-Gg: AR+sD11pzD58u+ySiyYdiWxoB8nZKw//0ok9HL/t/tveAqAoqvD53Dg7AqCARKmo1Wz
	b+/PO+fgj34hZprvtxBeBR0yuPX/+9igpTvWvFzM6yxGWfvY+1SFNHTdlaQmrwaF5Z3YKiWL1YB
	8sqRizoy9IBf1R18tFtMpH+igVYFk357kpD/0NWqoZGxNdH4qLenPu0SE6NgwovM83svFXrBsm+
	I5jJZ+9Q3cvu5ZBO+RozgYa3MRHjlHp5zha6gsJ8SDLZSVDhPE7OKeNQXK0Uw6r49KTTLSJWGPL
	i75e9HYviVn9ZETsUmK6Z6MfmOk9hC90j+KRjKXsPFWCYb86XaynxOjydsnzIxxuz+Ss8krD467
	XOa65rrhfoq6RPXfIoeKElttYBf8YIZSHUEcomN5QanWVVZdHZTCmsTrY1d/UmAIR0G475kNFYi
	gHkYaluvtB1ppny8CipLP0EWs1WbQlSZo3t75IDR9MX8AnRAItEP9bveEhQO5LwaxaKQwiQ2v8
X-Received: by 2002:a05:600d:8483:b0:498:1371:6612 with SMTP id 5b1f17b1804b1-4994e7a70aemr331677165e9.6.1786219817240;
        Sat, 08 Aug 2026 13:10:17 -0700 (PDT)
Received: from foxbook (bgt135.neoplus.adsl.tpnet.pl. [83.28.83.135])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4995bb8b668sm120314805e9.0.2026.08.08.13.10.13
        (version=TLS1_2 cipher=AES128-SHA bits=128/128);
        Sat, 08 Aug 2026 13:10:16 -0700 (PDT)
Date: Sat, 8 Aug 2026 22:10:05 +0200
From: Michal Pecio <michal.pecio@gmail.com>
To: Rong Zhang <i@rong.moe>
Cc: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, Icenowy
 Zheng <uwu@icenowy.me>, linux-sound@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/3] ALSA: usb-audio: Do not expose sticky mixers
Message-ID: <20260808221005.683ab7d0.michal.pecio@gmail.com>
In-Reply-To: <a0bef09ac7160721f0826c16107082b5f5d12e74.camel@rong.moe>
References: <20260411-uac-sticky-mixer-v1-0-29d62717befd@rong.moe>
	<20260411-uac-sticky-mixer-v1-3-29d62717befd@rong.moe>
	<20260804235515.7346606e.michal.pecio@gmail.com>
	<a0bef09ac7160721f0826c16107082b5f5d12e74.camel@rong.moe>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Wed, 05 Aug 2026 22:32:00 +0800, Rong Zhang wrote:
> On Tue, 2026-08-04 at 23:55 +0200, Michal Pecio wrote:
> > My $.02 - was there no way to deal with this in userspace,
> > or to make it opt-in rather than opt-out?  
> 
> While userspace can ignore hardware mixers via some configurations,
> the current opt-out model is really about:
> 
>    When we can't distinguish between both, will the extra advantages
>    of exposing a broken GET_CUR mixer outweigh the disadvantages of
>    exposing a sticky one?
> 
> My answer is no.
> 
> A sticky hardware mixer breaks volume control completely. If a user
> doesn't know how to tell the audio stack to ignore it, it will be a
> terrible out-of-box experience.

Being able to work around it by using a different mixer control doesn't
sound like "completely broken" to me. It seems the whole issue is that
some mixer controls have no effect and you believe you can detect them
by changing the control a few times and seeing if the vaule read back
from HW changes accordingly. Of course, this also falsely catches mixer
controls which are write-only.

I'm not familiar with UAC and ALSA mixer APIs so I don't know, but as
the whole issue boils down to incluencing userspace mixer selection,
is there really no way to perform the same heuristic in userspace, move
the quirk list there as well and let users override it with a click?

Regards,
Michal  
