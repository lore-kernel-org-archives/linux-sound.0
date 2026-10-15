Received: from mail-yx1-f42.google.com (mail-yx1-f42.google.com [74.125.224.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4B7E35A39D
	for <linux-sound@vger.kernel.org>; Thu, 15 Oct 2026 02:07:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792030044; cv=pass; b=REY+rrjzYytPnZmKnZAXv7rzqDuCluMqoObpyrz2OMj/V6viWgoiSbVfCWwsukUyqn0Zr3SAP5gPuCrHkb/6xdupJU/CKfIbOWNDtE2JGRULLK6OfiaGBL/nvXMHvLZ66oNKsyKAvb5hrPOUaKFDaDzAkpsuXg/b+S843PU3VQE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792030044; c=relaxed/simple;
	bh=CXQAMWX0QRbdOSiR3jJbffzmyMnknbdlIF+pRtGFT7M=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=X8nCwHtqHPRMdlti5Oogsey4jGc2fz7CN+/AKNyRZ+X8IYUX0iCCM7jxIcXik/CGxc+5dvDAgKQMEbQBb8gYNmYi0I6ngsPjmMPBMNeOiVxvzglWCThptRrp493CuiGKynKWBnsxY5ZaSv2OwKoSYFNbsG22X2wM1nQXCtXGqL4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ErsiLN9B; arc=pass smtp.client-ip=74.125.224.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ErsiLN9B"
Received: by mail-yx1-f42.google.com with SMTP id 956f58d0204a3-676858d42f8so4110886d50.2
        for <linux-sound@vger.kernel.org>; Wed, 14 Oct 2026 19:07:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792030042; cv=none;
        d=google.com; s=arc-20260327;
        b=i1/+sPVdpu/75Om05BnrlVGosme6o4f5tFGWHmhaIfLm6l2ibmchFRG6TSc+GiW65b
         fXDv1N2Zv75fKQxZNw6IdKmdRDydvIvZJc+YKbNYKSmXjtOnzZT+Y+4MuCMP4uf0oeMf
         nuq5bHiIediXmlRjR3h5Gf5ya+ary/ODr3vPcThrNMQDwyNKPW8jKlrOQ4xhOZL1p1Ze
         MOocihR9bz1j6/E8tyZIJtF9cPaFj6g14UX11f7k6dQ0YOLC/P0PVNm7IYdvBTrqwUMz
         YXh+r9WR1Gjke+vN2mjTuh/REhZqH5mOxDSjZI23wvvK6w4GsAWGMiG7ayGj7r+hgO2b
         g1Wg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=CXQAMWX0QRbdOSiR3jJbffzmyMnknbdlIF+pRtGFT7M=;
        fh=WpvFt6HJY8vMSp7bOJ9YylJK+nrEXjNdo0vDZqnRLe0=;
        b=YqUSu7DL9Zzo/L7WCcU8noriAAmnO+ivVt0cw9o0lDHlLsyZ9mcC6IhpBl88O2vQcV
         AO+i1TBQD2j6CuS2+kZGyOeO8qQgQd4Pr6P+Buof2r1g8rIFYsrOYNKDJykhianFm43p
         d+hW76yQkib9NuKB7651DtfP3Lg1g8UyH59K4I4zIzJY2o07lMheMDZ+cLBLOpbKOA16
         vHsuh6tM0Ej3SEI7YRgJJ5cpna4cFYqPWVYFzXQ9eLTHlCLUUDqzcMwdirMDSKHpkADn
         EnYNCZSeLi5WFjJ6R41d/jfeb9n6jX5/zvJThql8l8UdnPnE/p+4qKHXrWBDYclRExHl
         fXfw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792030041; x=1792634841; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CXQAMWX0QRbdOSiR3jJbffzmyMnknbdlIF+pRtGFT7M=;
        b=ErsiLN9Bulv9J+OTch2mx/Mopv1D4jB3ITplnFpMM/nCs+/rDsCvgGThoxdVuhzbSu
         7pBMBeqvDc2ny3E+20NxUXWhXygmnrlfs39ai+8BhfBeuqVXpeRWAqkWjL6WSPxC3NDG
         XtSib/RPeMNXD5dY52ilgllprWg8221qUWdojMHqYc8ri9fQXVHxVZKl83vN/L5YE3gw
         wQcXPI6UGjH2gyyMXeagbto+YznsCt0UoxIMpkQHotpr1nqbEPuW/Cq6fybyWzus7gmS
         dnjl5nK8u6V18dCZoa8+ThRKTdjPsHTUuJ33BugV/880BlUZyy0dsSM1ZRyK1p83jLCI
         AtjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792030042; x=1792634842;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=CXQAMWX0QRbdOSiR3jJbffzmyMnknbdlIF+pRtGFT7M=;
        b=KAJAEw+66Yo0+mgzy9wuks8BjNFKI9ab/+sHFyzDaxPPu6fezK35MPjkvhYa7C8VfA
         uth/WTr3OdfN2PkfvMwmLJ3nInOm9wa7w93NkRwO9Lm/kxPjLTf7KR3yX5UC9HPQ3UkU
         LbjjuU9g03XTXIPp40OCKyodQqjHp6EWGJkE4ehdfd5zQqyJs2sDDODxfVJvh2Y11G5E
         6cMyJRHlJe3ixLl5qzklM+pno3Dxewo4aJDTxsvVf+/IqijM09aFVzIwoP9rKF+R0PXm
         PpqYOsKV55N/OxQ+3X82uquHJxChV5I1xDNkO1tbri9VpQFm+NJvFFaiRbfiItuUERZI
         0nYg==
X-Forwarded-Encrypted: i=1; AKwUvBxcuKjxMGZeSoxcwS0yhJKGP3YP1MDp4PMRIh3hW7Z+3S25/oDwnwVJ+qYuJ+m3hHynaUjVV/VsGROsLw==@vger.kernel.org
X-Gm-Message-State: AFq9FYIeIiKGbrljgBSKNXawDHeS22LC6jN1ZQOh5kwlbLU8QHq+rLFk
	gEOQZQ0qmiUpfzOP2gvvaR9g4P/b7XVlmdVYQzOgF1UwFHWLLnNaE9R7oK5eoGiC1B4WpmSc/jM
	eBa3rnkvZU8HdvgoLgXXDboKYGMIzi1E=
X-Gm-Gg: AYBFou2ntPX6n8YdVtx9iVv1vOtYcFxbg+snPnqAMWopPdE4vjxy694zotfgqSvR6AR
	CK2ts2I7kLe8zrXK8+BR/CXgVzHVYX8L2TyXGsAcoTu+Scb4IIg9YSX0efpDz2Q3R/iaxXVogTw
	VDCl5vmp+MnwDdPMLC1+QM1BCWKbB3OOggSM+P5quR492g8si+xVXcIx9gItZBp87bUOTOSEPyK
	b7cHHEXglKbouGrjB4qJA/13r8yaPs+4ndB3wgiigu4pziKupwHPs5rnCfClfXxnSiRQE+KMya7
	jnqoerWLBlgio4p/dVJFwC5Lug1ia9qC+NFHaxaghLuSm35UDVHFKxjylg==
X-Received: by 2002:a05:690e:1919:b0:679:a216:7aae with SMTP id
 956f58d0204a3-679a216868amr136128d50.111.1792030041425; Wed, 14 Oct 2026
 19:07:21 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <pm-pmb-9c80f858ccc13b3de84d-v7-fcd8c7aa0e837bf0b036@gmail.com> <87zewgcuhy.wl-tiwai@suse.de>
In-Reply-To: <87zewgcuhy.wl-tiwai@suse.de>
From: Cen Zhang <zzzccc427@gmail.com>
Date: Thu, 15 Oct 2026 10:07:10 +0800
X-Gm-Features: AclHuK9kqyyn1aG_r1s3nEALXTmMSfRWju5AR6v9v-P5eTvEZQB3uiI8X8Hz4NI
Message-ID: <CAFRLqsX6Yz2dv_dV4BvV6_F-16WDWYTAk5ikC9WY7ZySkoJKUQ@mail.gmail.com>
Subject: Re: [PATCH v2] ALSA: pcm: Unlink substreams before releasing them
To: Takashi Iwai <tiwai@suse.de>
Cc: perex@perex.cz, tiwai@suse.com, phucduc.bui@gmail.com, 
	cezary.rojewski@intel.com, cassiogabrielcontato@gmail.com, 
	kees+treewide@kernel.org, yilinzhang@moonshot.ai, sammiee5311@gmail.com, 
	kees@kernel.org, thomas.weissschuh@linutronix.de, tglx@kernel.org, 
	linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org, 
	baijiaju1990@gmail.com, jjzuming@gmail.com
Content-Type: text/plain; charset="UTF-8"

Hi Takashi,

>
> Applied to for-next branch now.
>
> A problem with racy link removal Sashiko suggested is an interesting
> case to be revisited, but it's no regression and can be triggered
> independently from this change.
>
>
> Takashi

I saw that. The drain/unlink case looks like a real concurrency issue.
I'll try to
address it with a separate patch.

Best regards,
Cen Zhang
