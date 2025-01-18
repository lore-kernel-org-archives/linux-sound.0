Received: from m.b4.vu (m.b4.vu [203.16.231.148])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0E5A136327
	for <linux-sound@vger.kernel.org>; Sat, 18 Jan 2025 18:39:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.16.231.148
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737225599; cv=none; b=Nhapkj0fN7H8ZBcNQHJp0/cWz3wCFyW6G/Obh3bncXtsJds66b5eGGTMsDg5Ac3g2D8yx2q2s90e78fUu5oTgVrO6Sq13lpxgaipauH+sNdZXbBf6mAp8JfE9yLGpMtdRHBbEFjF2XK/Uzzlzt36Nzv0EGd8ZRRJ0kWwoGMGSuo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737225599; c=relaxed/simple;
	bh=Ggca2+Tg3pKHjcH3r90WFHfwexNZm9GOJhHaccsReSU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HUJrlSAYzzq5z/fkxQ9W+kBzk0Nhz6zhj3XbLeNFikhQJVsp+cYT2xSbROsjfpqVD/5Rtk2mCpCF7hTc8rz2a068WbhmXT7m0f5NHxD/6peCZVnNUQIJVNclww0wD8Zc4QMybBLycowt2gQhKOZUgPEi6f1+QFU5h/zYaWETES0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=b4.vu; spf=pass smtp.mailfrom=b4.vu; dkim=pass (2048-bit key) header.d=b4.vu header.i=@b4.vu header.b=nlt9lLt0; arc=none smtp.client-ip=203.16.231.148
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=b4.vu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=b4.vu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=b4.vu header.i=@b4.vu header.b="nlt9lLt0"
Received: by m.b4.vu (Postfix, from userid 1000)
	id 2407064A2AED; Sun, 19 Jan 2025 05:09:47 +1030 (ACDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 m.b4.vu 2407064A2AED
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=b4.vu; s=m1;
	t=1737225587; bh=8aKlUvul/SKDzM5tE3XvXjZZp8rquwf2pIi9zyonGsc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=nlt9lLt0K0zm33k3dFGH7GzqfHpjX8iYQj4oRbmDAwzqEwISHGiSyG/KcVJ9jZPIJ
	 AkSQrsD06wq3wZWNfO72M9CAm2Mo6Uxdq6R5mQfyGc4Z9/aJgji+87jBzo21PX+rMk
	 bscGtdg3Q3iqvaox+VLZIujNWR0K+KRekqUmMHaZ4eus8goRPjhm29ZebZEkM0MgGG
	 RWoPK9w3MJua31bK60+cI0P+vWrNCEBp8aBbO08CVCjYv7JLA38Eh+bTtSLc/ixJTu
	 mAITcjNUlXkBf1BWPCyb7xt3s7LIbQgV5r7JpW6wR3C06JusayENZUV+QmUNnGrv60
	 0rbk7kgspWlMw==
Date: Sun, 19 Jan 2025 05:09:47 +1030
From: "Geoffrey D. Bennett" <g@b4.vu>
To: Takashi Iwai <tiwai@suse.de>
Cc: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	linux-sound@vger.kernel.org
Subject: Re: [PATCH v8 0/2] ALSA: Add driver for big Scarlett 4th Gen
 interfaces
Message-ID: <Z4v1c8rjaRdXLWuQ@m.b4.vu>
References: <cover.1737048528.git.g@b4.vu>
 <87ed10qt1u.wl-tiwai@suse.de>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87ed10qt1u.wl-tiwai@suse.de>

On Sat, Jan 18, 2025 at 12:07:25PM +0100, Takashi Iwai wrote:
> On Thu, 16 Jan 2025 18:47:07 +0100,
> Geoffrey D. Bennett wrote:
> > 
> > Hi Takashi,
> > 
> > Thanks again! All changes from your feedback on v7 incorporated in v8.
> 
> Now applied to for-next branch.

Hi Takashi,

Thank you for all your time and patience in reviewing the patches
through eight versions!

For the pull request notes, would you consider mentioning the specific
new hardware support? Something like "Add support for Focusrite
Scarlett 4th Gen 16i16, 18i16, and 18i20 interfaces via new FCP
driver" would help users discover this functionality.

Thanks again,
Geoffrey.
