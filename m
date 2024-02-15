Received: from mail-oo1-f41.google.com (mail-oo1-f41.google.com [209.85.161.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 663E71369B2
	for <linux-sound@vger.kernel.org>; Thu, 15 Feb 2024 16:07:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708013271; cv=none; b=OtMDQ4AW9DF0tR+m/P2itMDanWD0gtWjelC4R+LTL1l4UZc4RZ5ETUWxsK0pehqfZLkP2LuFSPSFzUnT/Z1EEVz2H3fgZ4UyiibgvEf0mqvqj4SvHB2qNvIdBwvDc+o1f1oQOyLB96lS7Xq8teDxmrO/UbwtNIBfsxZCP+ITWm4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708013271; c=relaxed/simple;
	bh=WyVHiG7SNjPtocRHyKZ3iRHU1kqrdd9Sm6OgjUgJq08=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=n8qSi9nimKaor1fnURFnteSbVrIe5Fdwa2IGBzm173JRqMcrz7zN031GkTM248NAXMG0AQNLJqQ5gGdt8GZx4/3JMFMFdJfqPEM4OWd56dtj7dkVDmnsh5SeRfCcekZaHR9FGz6h7rcm3YD+LAk1quxPhrCmY275OlI59fyHrwU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=PRL/Ort+; arc=none smtp.client-ip=209.85.161.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="PRL/Ort+"
Received: by mail-oo1-f41.google.com with SMTP id 006d021491bc7-5961a2726aaso555340eaf.0
        for <linux-sound@vger.kernel.org>; Thu, 15 Feb 2024 08:07:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1708013269; x=1708618069; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xvsN+oW6w+v+3YWUT8f18I44TCeWB8omp1IZ3VxOyQU=;
        b=PRL/Ort+vVnP6rqIFy60C1jznCufQCkQsKKLYxOnD2N8WoSwCy0yf5fVTs434oQeXY
         Vjq896mImErS+2TpYDv1mlvQjCmko65K+YkJblnjk+ncddPZA/1fTckDZZR0ICwIY5aU
         5jx3eDhQfn9n2/iZ4ccPqm0fEcy1l6GilPY4Y=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708013269; x=1708618069;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xvsN+oW6w+v+3YWUT8f18I44TCeWB8omp1IZ3VxOyQU=;
        b=RHkkhpTrP4EAFNBufy3nYmkSb63q1fZ7Tj14iIrWmBX8BHyOFxeYfOpLrUB5rkh9ec
         gIXM5BmGvQR7k03eKYAh8l8IUz4i3jFV7OgiVQQD4B3fED6g1bBKvdd+09dDUxv7Hk09
         MZpN1Zfgj9OAdy3FAISRCub5wpQnhsjy76tH789CcnvWtN/S0PykLuHicLh0hi1i6VmD
         rUlzPMYTPhhQcZm69ZToyHNqOCZOpImNeRkRX2JLf/smoY7HZCtiGzByvNZYQtTB7g+s
         VaNeqNgsjN6aiv7axHd1dKGUODsSpp7qrzjRc4hOnoQiNST/25lb3613s4+2PrVtY14M
         nJ8w==
X-Forwarded-Encrypted: i=1; AJvYcCX01IEDo0x5hswdQfrPtaxCj02UM2EaEpWWys7K+jfb84/1LKe0GTFkLh5SSUVGKBOkqlmPik3qGIEYTBNigBYM9f9uWe8zuPrkwss=
X-Gm-Message-State: AOJu0YzHFLVOf83/8KNzdYFVd6CxLvace0Ub8jreAqyYw2HJ1XY7QH+/
	LareW/It9KWtJ05Yv7+vhGbXEpU2Qe2uA4vi0nM8eG0aYRb3ioDh00VVt9KgHVCHMVcGM2iWbHd
	Li9SP+iM6fZxkcWWdF/7Ha64taXDqV9oqYHS4
X-Google-Smtp-Source: AGHT+IGYs9rjNiqGuCyTcpQJFZHsomTYuyM9rFlZCgqnradG7m5ZDI1cWSBqXR459I1Q5ycQk0myVk/vlnDys/0kkGU=
X-Received: by 2002:a4a:314d:0:b0:59d:638e:bab3 with SMTP id
 v13-20020a4a314d000000b0059d638ebab3mr2080220oog.2.1708013269431; Thu, 15 Feb
 2024 08:07:49 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240214170720.v1.1.Ic3de2566a7fd3de8501b2f18afa9f94eadb2df0a@changeid>
 <20240215034528.240-1-hdanton@sina.com> <87h6iaf7di.wl-tiwai@suse.de>
In-Reply-To: <87h6iaf7di.wl-tiwai@suse.de>
From: Sven van Ashbrook <svenva@chromium.org>
Date: Thu, 15 Feb 2024 11:07:38 -0500
Message-ID: <CAG-rBigFG-U-sKY77CvzghGzs+1Xm3YXzBF6N4ti0+h6UdAb8Q@mail.gmail.com>
Subject: Re: [PATCH v1] ALSA: memalloc: Fix indefinite hang in non-iommu case
To: Takashi Iwai <tiwai@suse.de>
Cc: Hillf Danton <hdanton@sina.com>, Karthikeyan Ramasubramanian <kramasub@chromium.org>, 
	LKML <linux-kernel@vger.kernel.org>, Brian Geffon <bgeffon@google.com>, 
	linux-sound@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Takashi,

On Thu, Feb 15, 2024 at 3:40=E2=80=AFAM Takashi Iwai <tiwai@suse.de> wrote:
>
> Yes, the main problem is the indefinite hang from
> dma_alloc_noncontiguous().

We have a publicly-visible test [1] which readily triggers the
indefinite hang on non-iommu Intel SoCs such as JasperLake.
As noted in the commit message, iommu SoCs are not currently
affected.

> So, is the behavior more or less same even if you pass
> __GFP_RETRY_MAYFAIL to dma_alloc_noncontiguous()?  Or is this flag
> already implicitly set somewhere in the middle?  It shouldn't hang
> indefinitely, but the other impact to the system like OOM-killer
> kickoff may be seen.

My incomplete understanding:

Alsa specifies __GFP_RETRY_MAYFAIL because it wants to prevent triggering
the OOM killer. This was __GFP_NORETRY in the not-too-distant past [2],
but that failed too quickly, which resulted in permanent loss of audio due
to failed firmware dma sg allocations.

In the iommu case, dma_alloc_noncontiguous() implements a backoff [3] loop
which ORs in __GFP_NORETRY except for minimum order allocations. We observe
experimentally that __GFP_RETRY_MAYFAIL does not get "stuck" on minimum ord=
er
allocations. So the iommu case is not affected.

In the non-iommu case however, dma_alloc_noncontiguous() actually becomes a
contiguous allocator, with no backoff loop. The commit introducing it [4]
states "This API is only properly implemented for dma-iommu and will simply
return a contigious chunk as a fallback." In this case we observe the indef=
inite
hang.

The alsa fallback allocator is also not affected by the problem, as it does
not specify __GFP_RETRY_MAYFAIL. Except in the XENPV case.

Sven

[1] https://source.chromium.org/chromiumos/chromiumos/codesearch/+/main:src=
/third_party/autotest/files/client/site_tests/power_LowMemorySuspend/contro=
l

[2] a61c7d8 ("ALSA: memalloc: use __GFP_RETRY_MAYFAIL for DMA mem allocs")

[3] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree=
/drivers/iommu/dma-iommu.c?h=3Dv6.8-rc4#n903

[4] 7d5b573 ("dma-mapping: add a dma_alloc_noncontiguous API")
