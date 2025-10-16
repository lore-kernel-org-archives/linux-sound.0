Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 153902882CF
	for <linux-sound@vger.kernel.org>; Thu, 16 Oct 2025 19:11:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760641903; cv=none; b=XXI7OS6gH5Gx4ftpUD8wTs8zfLIZfxIqq64AR44Sg6sNTV20rqXunPgojoOxQfcd/AOqjWAJrcL3RgUK8rePxUUm+0cDDqSO6qTD+b2LGOqYUiNGarWYk/NbfAiGVGzZa6XNhlGcNtLv7nyd8kXdCU0jfpCuaI7ef3PjxX+RxI8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760641903; c=relaxed/simple;
	bh=b5co2YSgNevXKffPyHC3UnRHhuzjea7n43DSQ+3/zyo=;
	h=From:Date:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Fxf/hpO8pWZl35grcgqSdssOLjUwIU+v8KyRHU4fQQGWj/FEy8F73sGOi/ddHMdBGjZmb8b+XtvLa1NQPN/DshYTwdc5HODE4KMssYUu+5kkkgiIYFfaITNAT98dXce1CrvTzkVbVMUGae+PVYGlaLGUEsctsydHjYm7r48NFBs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Q4ghUmx8; arc=none smtp.client-ip=209.85.167.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Q4ghUmx8"
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-59052926cf9so1266887e87.1
        for <linux-sound@vger.kernel.org>; Thu, 16 Oct 2025 12:11:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760641900; x=1761246700; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=7BNCCgAaVaXbnMDgwJJYXxWMhOIDpBcVMNB8Uz37j4g=;
        b=Q4ghUmx8mXBo5Kx5yskWkzFUN6Fsu0hVkLOaPSYsJg5zKVZRf321u4dcGV8BSw/TqD
         dU0lMe1DwC9iDt3klhvOYuiXU+BBjzwsaleuj5BvxvZXx6UmYWugNbWOEVYTJ+xfCYor
         WGmY7QoCLz7hFR5hwgfbiolA1V7L4ZG548slp+xDMgVmgjrZSxVW47SiWuqpdtOSW5Pl
         /bTiA2S5PI0nQgJoQDKrv0yXX+GKs7YbqBdFeXyujLUAtq5p4+/5D3ymygm3+QjDifBQ
         RxeVBJQ4iwiZNJNEkc5iBv4E5BY0YM7LdioOfgkZgwCzuu6noTwF7XPlU2tR+BPIOvz1
         cLSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760641900; x=1761246700;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7BNCCgAaVaXbnMDgwJJYXxWMhOIDpBcVMNB8Uz37j4g=;
        b=h5KgQgNj/kwGbM/8eyBpfqx9eJ362W8bQ06PGFgvi3o6M0xr1d1zE/EddXiw4R8FWX
         +bOiify6UiFdqenyT8NlLPyn+c0Yjwdf2LmEqDrI9FjExWCwNIx3HORfHu+ezLVCSy1v
         ZEpz8/aBNIgmd/r0wH42inNpvMNgEKahjfFRoT4anPqIAvcrpTWTC1z2oyHfydt5jxM5
         dAJM3mfL8i6SjcsMLVfg2W8ktDPI/AdyakBj2+DMWm01691Dcuuvr+FqHiTW0UtxA/Ea
         KAV3MZ2TjqJhw42nQgWzuwsNvpxDIm/sV9kcCabHVDOWFiqk1dq1fFLVg1azZdPRxANr
         nLBw==
X-Forwarded-Encrypted: i=1; AJvYcCXf4wDKJq9e+chH7ubNFQD1uhv8a3j1W9Nyrk63BRWXVsjIw3goTp1XKJ6i3xTA9ZKIHRmRnFHJuzjUsQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YyEURlARwTqqxjgzZTmcAPaxtPl24o0g/uAIcUmRgjeefB/mU9N
	hVPXwMNSRZhXfUczZl7XuxpBueFe6r1WmN3GAT1aTVZ5dpuQfWvg2U5i
X-Gm-Gg: ASbGncu1lGqvW0NZUl0rQpV4g31bmdOwpan8GVRcGoQCf04dT/Dh61brxH6GkATfkV3
	XB0Yeo3ms39a85CNF5D9bNyEAqfOmkI8VNKSi74mjva7POYss5K4fXGC3b/gQyBhO687RSSbfw0
	aqGsZRAtuioNeBXXeYFe7S9fP5PxtJJDNi/hpf38wQhDRcWBZ/71Jn4SyPfiApNmm9/GIwSwPNA
	dXTAgEhOzdJHt47XOTtXXATrFgqdZEIykiOO2iBkCib8+vvc1F0KLSg9PE35pCeCJvoDWJzq2da
	oP7Vgw2F/WzCtPRpQnXAztC5VVIPDc6ciM5yhiAroZgCA/9mqDY3XO3o440autWeCK0neJHc/3+
	x35optSqExCVssyTvMxx2++ohfInpAQtP/OZuFAZ3DPgsbYA2Z2Wy
X-Google-Smtp-Source: AGHT+IENe6+s0A/FJJelFzhT4Fy/BBD4RDYP1Gh0iiWcQ/sqlw8OF/PlEfoLhO7nXhZRUZXsa0xVAQ==
X-Received: by 2002:a05:6512:3182:b0:57d:720:9ebb with SMTP id 2adb3069b0e04-591d85b1a23mr443643e87.55.1760641899791;
        Thu, 16 Oct 2025 12:11:39 -0700 (PDT)
Received: from ark ([2a01:799:8db:a400::1002])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-591bd724157sm3025555e87.87.2025.10.16.12.11.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Oct 2025 12:11:39 -0700 (PDT)
From: Roy Vegard Ovesen <roy.vegard.ovesen@gmail.com>
X-Google-Original-From: Roy Vegard Ovesen <royvegard@ark>
Date: Thu, 16 Oct 2025 21:11:36 +0200
To: Takashi Iwai <tiwai@suse.de>
Cc: Pawel / Xj <xj@wp.pl>, linux-sound <linux-sound@vger.kernel.org>,
	Roy Vegard Ovesen <roy.vegard.ovesen@gmail.com>
Subject: Re: [BUG] Presonus Studio 1824c firmware 3.11 no longer exposes
 mixer interface ("Quirk or no altset; falling back to MIDI 1.0")
Message-ID: <aPFDaEwrvK6U1x8F@ark>
References: <874irz86en.wl-tiwai@suse.de>
 <87ecr27trj.wl-tiwai@suse.de>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87ecr27trj.wl-tiwai@suse.de>

On Thu, Oct 16, 2025 at 05:26:08PM +0200, Takashi Iwai wrote:
> 
> Roy, could you check whether the recent kernel still works properly
> with S1824c?

By recent do you mean the 6.18-rc1 version? Or the version that Pawel / Xj
reported problems with 6.17.0 / 6.17.2?

-- 
Roy
