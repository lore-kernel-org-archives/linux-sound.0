Received: from mail-yx2-f43.google.com (mail-yx2-f43.google.com [74.125.224.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99CEF275AEB
	for <linux-sound@vger.kernel.org>; Tue, 22 Sep 2026 02:47:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.171
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790045260; cv=pass; b=hv0T+u31KowsOv03QX/FCThNGWBD5GrOflnNj09GDMkEF1FGFJsFXi3TF29ZysLrHEeX1mr0N77fFQdzI/VGh2WbCGOut6gGUZLXWHk1oBSOlMMlIguOBZrl38uE6LglFJai8zydQtFxgyHBgctVnkA9nzOuxO9BgRGjV4qpqIw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790045260; c=relaxed/simple;
	bh=/bF+2i7J9tw/SU9Y8Ch+X0ErYTFXTPP1J7KPqLHGa9U=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=IxEzut2qLjiAzCMhLuYKV7hIgARoWyWj7URELILI70Xq+qulZCNnqxzmrlYsFcDKiuqDid4wUXOBQqNVQWsYN+GgRss3t2AY0ipvWKSObgoBj3Xv8gGTU3WWlzyRAC4Lq3UrdxBXW/PtYHWLewa5csUmf8er708ttWYxp4k157E=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AuLhNOa0; arc=pass smtp.client-ip=74.125.224.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AuLhNOa0"
Received: by mail-yx2-f43.google.com with SMTP id 956f58d0204a3-671563fb8beso3460695d50.3
        for <linux-sound@vger.kernel.org>; Mon, 21 Sep 2026 19:47:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790045257; cv=none;
        d=google.com; s=arc-20260327;
        b=N1Xb0r5QgmhTejdMbanOK+uMY7xkWMVNhs4J7J9CiHXjnW6uImNiwLh1T9WLvhGodn
         QEuFMEaz+/ldfaw/+h/JfyK839MhwJ7EqKT8LgDYN0cpHTaW0YVz1YTcIbajEb2RoHtM
         FYsBW9DtxF3sCEtRVtwyNRCWdUJYIh05kERfKdvgi2ez9vBNcLkNTGYw5yVa/EsQIoYy
         owfo1GQa0RPPoENF32ZVANhzP6kk0Po+sP7vEHYYBNdptP7cDY1iL8dwrbU8tKNFX9sj
         kW9oTE+2jWvkBpXoT1JQxtix32t1/CO7zv/vYp23uqJsnC1RJfjUBmbRxPq9pY1mZSoP
         qGDQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=K/Pzgg7o0qrlVK5qFQbvKisrC2SDvw/OqmX88foRwCs=;
        fh=kihkj9h37jPKlXzfG6wQ5YFY+1u5dbyiiLn4dUDnoT0=;
        b=Zl7L7v4cVhZhdCATHdPGCTYKg2j6xTltV+cOZDgnPanLPFqLDFd/biCqDaSmoHdDVN
         to1MCtLQo4/FJWtUgHUKeOBVU2R+7DuMP5d6eWBslztqaWFcPG9bCO9/yDvgiPqIFtq1
         0v0XHSIMeSN38HpkvmxA1mIeO7SGiydNNkHwGjeTzQ0JgH8UC5asGL9I9I/Pd9LEt7av
         6AKyrsrfzXmcWm3vL098OYBmUQ73dVkQlJ50kakUOHFZjS7NdEfAXcK1N75tEv7Iuqw+
         bqy5JHVX23TUEtdgLEJxFjn8RrVewALoUSoBvaRdtztIZAL8uX5REjkDmrhOIzSX+hcv
         45HA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790045257; x=1790650057; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=K/Pzgg7o0qrlVK5qFQbvKisrC2SDvw/OqmX88foRwCs=;
        b=AuLhNOa0yPL9n4hIKdsmoKbEnxfAuuK/HKtO7P3kdusbH5x7hG67dS6slg21oqqMbg
         cDyWlzyF2x/28pOi5Fl8T/RIaFd6Rjo0MQYcMzadjD+4UENR1PxRRxs87oR+B6Qws690
         feROsiscLY5pVaXM4pP46S1YHdsoShHCTC+QhpmUTCOl30+ifYBaiosiNwHH3VuHfZAB
         nVYqcFnrEttaaf9UVTCXUDWVCgw2bfgmwhMJ31UPwTk2vBwjXgjrmYdrBC08YVpw4F69
         SURYQi6jSnhJWWINrDZnJWp1Y3YNntdOtAhJJYRmUFg6jndk4CwP9X94B6w73xvr6l14
         zZNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790045257; x=1790650057;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=K/Pzgg7o0qrlVK5qFQbvKisrC2SDvw/OqmX88foRwCs=;
        b=xtzyKb35W3+SP3i99Q9mNmb/kI61gETvi1qvl06dkkboGEpV+wTjOgzEoHLRl1DFbo
         hs5Gn2ujqmKAq3tanCu5HOcARZHdB4iPNlZ01wByIIcutjfQMZdafTMqhmpV7AeDtKvk
         qx5qlZ2/Z0VK82PrHX752I2W11rSGMwHh1PmzaFDqmP+QbOigGR6aZudjSSdFL0l0CnR
         ifyGQzK+Xj+g2DJQccAce9dz4V8UDUqju64fvKMKj8XaUYaQd/jTIaluPlh1SbuYNl4G
         /KMr7rIpWGrGF37zL4SAI0aRS7pYpaQd4FGJT5XdRuU7moK35hkXAFP7u/RaYTupAAnV
         G4Ng==
X-Forwarded-Encrypted: i=1; AKwUvBwbCgEk/QoOAYKAXVesluqEt2UQKJwizt0SyNK5CtuHiJAvYsTpuW33ZxVnWcd8OOO6fTPtFXrIUu7H3w==@vger.kernel.org
X-Gm-Message-State: AFuF++kZgYRV2cXZKr1uSHevAIExe7WyoxuN95G987h4+8Vjc6FNacz0
	867zL3kwk8F149Anqb+S6i/d1MEI+ZmSqYS8LD7Uo9bpEoeWLepVMDaVcIrC2tt/0vU//vsZ+rP
	CUJHi+51cuXALO1O6eqd9viYnb+KI5dk=
X-Gm-Gg: AYBFou3umsFh1ceQPB7jj4IbLlNv9WGI5q6fuvdsKegDkFSmHi+BU18vTETWcCoNLnR
	tQxNo/nRZvqEnYFZIQwoEI7C+ymgezi1Q2XGLf56iDTRvNcLrQplr1vlQrp3xMXNnfNtuLnlDRy
	E5vJyqUAPZavJr3aMHka8G0aWLQshn7CC+JzBz7S6INelPfxD6OoeF9RlfjItgbaNBopg43zGSO
	aTU0vynmr5dMatb+Dz+oqA3wV87WBL62nlPm0yaT0a9Jxe81T9NopF7sKylSNlDNRU888WW42ST
	BLTzVHbyF9kxRL1jiHETvZyPeQV2gChuaTGtnHf5naicdvAaxjvpfJl7Xbc=
X-Received: by 2002:a05:690e:441b:b0:66f:c1be:84e1 with SMTP id
 956f58d0204a3-672c54b6fb5mr245756d50.79.1790045257564; Mon, 21 Sep 2026
 19:47:37 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260921073847.63505-1-lgs201920130244@gmail.com> <arFH7F944RO7TUqN@quoll>
In-Reply-To: <arFH7F944RO7TUqN@quoll>
From: Guangshuo Li <lgs201920130244@gmail.com>
Date: Tue, 22 Sep 2026 10:47:24 +0800
X-Gm-Features: AcwNN1VMKLPliQEBYI3cwmxMjQMSd7JsGwSa33n2dtOWCSkj81z1Dp0OO7Y38vg
Message-ID: <CANUHTR-KMdRmJwjpqqk5tsfnQkrwRBroCqkYOr6f9o=6yVewJw@mail.gmail.com>
Subject: Re: [PATCH] ASoC: Intel: SST: fix platform device leak on probe failure
To: krzk@kernel.org
Cc: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>, linux-sound@vger.kernel.org, 
	stable@vger.kernel.org, Jaroslav Kysela <perex@perex.cz>, 
	Thorsten Blum <thorsten.blum@linux.dev>, 
	Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>, Mark Brown <broonie@kernel.org>, 
	Takashi Iwai <tiwai@suse.com>, Cezary Rojewski <cezary.rojewski@intel.com>, 
	Kai Vehmanen <kai.vehmanen@linux.intel.com>, 
	Liam Girdwood <liam.r.girdwood@linux.intel.com>, 
	Bard Liao <yung-chuan.liao@linux.intel.com>, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Krzysztof,

Thank you for your feedback.

On Mon, 21 Sept 2026 at 23:06, <krzk@kernel.org> wrote:
>
>
> On Mon, 21 Sep 2026 15:38:47 +0800, Guangshuo Li wrote:
> > sst_acpi_probe() registers platform devices for the SST platform and
> > machine drivers using platform_device_register_data(), but does not
> > unregister them when later probe steps fail.
> >
> > If machine device registration fails, the already registered SST platform
> > device is left registered. The same leak happens when
> > sst_platform_get_resources() or sst_context_init() fails after both
> > platform devices have been successfully registered.
> >
> > A registered platform device owns resources allocated by the platform
> > device core and must be released with platform_device_unregister() so
> > that the device reference is dropped and platform_device_release() can
> > free the backing platform_object.
> >
> > Unregister the created platform devices on all failure paths to restore
> > the missing cleanup.
> >
> > The issue was identified by a static analysis tool I developed and
> > confirmed by manual review.
> >
> > Fixes: caf94ed8629a ("ASoC: Intel: bytcr_rt5640: fixup DAI codec_name with HID")
> > Cc: stable@vger.kernel.org
> > Signed-off-by: Guangshuo Li <lgs201920130244@gmail.com>
> > ---
> >  sound/soc/intel/atom/sst/sst_acpi.c | 13 ++++++++++---
> >  1 file changed, 10 insertions(+), 3 deletions(-)
> >
>
>
> You sent multiple independent patches, to multiple independent
> subsystems. The amount of these patches clearly suggest this was
> AI generated and most likely not tested.
>
> More importantly, you sent all this work without properly organizing
> relevant patches into patchsets. This makes reviewing difficult
> and might cause multiple reviewers to address the same issue.
> Replying to the entire set is impossible and requires handling each
> patch independently, instead of applying or discarding the set.
> Maintainers also won't see the bigger picture of your work. Quite
> worrying.
>
> This is on the verge of hostile patch: bomb us with so many
> contributions, we won't be able to handle them in efficient manner,
> like responding ONCE to ask you to slow down.  Considering all this
> is untested and LLM generated, I have even more doubts whether this
> should be considered for review.
>
> Please read kernel documentation BEFORE posting more work. It will
> explain you how to identify subsystems, how to organize your work per
> subsystem, how to document usage of LLM and how what you should not
> do if this was posted in a good faith.
>
> Best regards,
> Krzysztof
>
>
>
I would like to clarify that these patches were manually reviewed and
audited by us; they were not simply generated and submitted by an LLM.
However, I understand why the recent submission pattern may have given
that impression. We sent too many patches in a short period of time,
and we also failed to respond to some discussions in a timely manner,
which made the situation look worse.

Many of the recent patches, especially the v2 revisions, are
corrections and improvements based on previous review feedback rather
than completely new untested changes. That said, we recognize that the
way we submitted them increased the burden on maintainers and
reviewers.

We apologize for the pressure this caused to the community. We will be
more careful about organizing patches by subsystem, preparing proper
patchsets, and following the kernel contribution guidelines before
sending future work.

Thank you again for pointing this out.

Best regards,
Guangshuo
