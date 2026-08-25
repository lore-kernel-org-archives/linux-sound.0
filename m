Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCD293D47C8
	for <linux-sound@vger.kernel.org>; Tue, 25 Aug 2026 07:43:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787643815; cv=none; b=P/Cgvqi/kR9tgZF+Osowg0fq63txSPVfcZOueJEn2y3VoooQCSJeatAS/QYulhSD4m6/jMitZD08owMWuRvdtvLr5YIDZW/zKZfPtzoPstMwhH5LrL8/E0unwX7/GyeU/UsEJKKtm/euBY5EIkWC1hbXC/O6238ujTSiaJwreh0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787643815; c=relaxed/simple;
	bh=sLg8Ckk/hQ3NBVs8nL/RdwFJItCXw1At4jpUvXP85Gc=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=nBGwqRsAx3HVgPMB1YIZUiYw0wQfSdNWpqinjca4FRydx0nSdIpGNm46Yjb+O4hXldB0muKTBOtSzGOerbB1LJmsdMd5X9J0jpZtntVVNinS3kXe2ObLp5UIqPvxUPBJJf7aRV3T6vcAgQQ1qnswsvwpwAu/BwLTdK8NzkthWic=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gWJZ9te8; arc=none smtp.client-ip=209.85.208.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gWJZ9te8"
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-6a051904222so5378621a12.2
        for <linux-sound@vger.kernel.org>; Tue, 25 Aug 2026 00:43:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787643812; x=1788248612; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=53BGkIX3YCtdYzektyoVFu0+GpJUKht1d2NbX/XeaVI=;
        b=gWJZ9te8J4edl5o0rlinczfhmd7/K7qHnv6x2x1sG8TrApK4meazHAymh4Li+euUky
         q86pykaLRU7ZpeN5cmKXTSS+b3A32FDA24UL0nzk4vWx7KLLEwRISsWeqi7FGkVVbKE4
         l9bkwmBEhXTMv04T2ESX4s7EvwMq1L5ZwYpcOs3Tic5Jpw/ZnE4Ox/fBJ8iKw2sXnGD+
         opa/TPH60fDQNQzpMSEI4+cbjgihYFtfOIVhN9POHLImbFPz2VtHgAX4xzBcpcMp4W6e
         9LogdN+f7AdE/N0RcdawYLTporRMuFC84g8rN6X7NHceNfZWV2q+CrOlUOCKCfR/wNpi
         9cZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787643812; x=1788248612;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=53BGkIX3YCtdYzektyoVFu0+GpJUKht1d2NbX/XeaVI=;
        b=ZscscNA44HZuRqq8e21dFH2JoI3o3fdmgOGpJosAHaKzK177osAXv9REVcZ7vXWgc8
         vnTMOAm+gFvTnwFBPpJ4Eygy3jUsjFyloj6rfIImnfVtA8zBUP2CXwE8Sdu5Dl4LKxhg
         VE9m9guVRs9CgwyrqckiMmhXWRNqKIXz/aQYMjTQKKhwvITyxeKpFRLtnIgx0TGGZjQF
         I8NNmKTCvL6Tq3NrIdi+S0k7GH6uhMfQA1Nv6fB3CndU/6Un3XMwPak/ksgXRfAkuUTa
         OtAcAhQGdmB2GoCR32Op4Ua6csKHe1hzJz9sFVPiZHDqkxBa/YmbOECejL7PSfelEEcm
         OqOA==
X-Forwarded-Encrypted: i=1; AHgh+RqbO9VuCLUt0QTGBYoG4RhSEMzlszXhEbA7GNOTF6995EpKhDUSHcLpcJjOcUktM/rfgvk4VuLNR5G4gg==@vger.kernel.org
X-Gm-Message-State: AFuF++mR/ZHUSEyKdwdcne+H5KK0PO5H3PJWYYRPikYk1CihD1GCLkys
	Np1MD75KHlR+fhvyw6zGhLpQMw2XydkoNqOq8Hmic5GIEAr41X0PzkYU
X-Gm-Gg: AR+sD13D7I5cvT2M18IA9FAMc2f069nGTHCUO9pQ29WLxWmy+2e+qCp0qGiOjdsKCAd
	9TRyqsevvCdDANl3VkEtZHL2JHLonmpTyEJxCxhTvI87i4prQO8Oifrw/PbOpdDYzDOUcj57C1f
	pJLv9GKhA+BJO4P/4M9MSoIRfxHn5FCHPKcDgVp/r1A7oyup8b+KWpMGDNHEUpRdEUDWi8GXzHg
	wWF35upNWnOpqEGJZo89F/f5NNFMjHzo6YrDl4x2qv4CPg2/XgaQaszTERUaTiYvo2nZA5Jj5Ey
	c3s2oO6RWCCV5hOfsSipw5WxZ4bfn3yzpl8V6ZVmBgUOb0x1Wro1AMnFjvJvPNH8AotrxZ38Dkk
	lvYwDfgsrBjIAqKt6sH8/cp2MFjaJ3FN09adOGm3USMG0gMoaD+aILaV27ULCpy2a54dnl/bPSr
	UJ2imfuWPHG2GLgEeqj6qTSBysS7UWDjsD2nBNrWgJatXeq+g4/97DVsn518tV2VqIzw8=
X-Received: by 2002:a17:907:72c5:b0:c24:d6f0:1223 with SMTP id a640c23a62f3a-c24d6f20633mr953718966b.12.1787643811777;
        Tue, 25 Aug 2026 00:43:31 -0700 (PDT)
Received: from foxbook (bfk5.neoplus.adsl.tpnet.pl. [83.28.48.5])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c24966f9cbcsm1852865066b.29.2026.08.25.00.43.30
        (version=TLS1_2 cipher=AES128-SHA bits=128/128);
        Tue, 25 Aug 2026 00:43:31 -0700 (PDT)
Date: Tue, 25 Aug 2026 09:43:27 +0200
From: Michal Pecio <michal.pecio@gmail.com>
To: Wesley Cheng <wesley.cheng@oss.qualcomm.com>
Cc: Mathias Nyman <mathias.nyman@intel.com>, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>, Jaroslav Kysela <perex@perex.cz>, Takashi
 Iwai <tiwai@suse.com>, linux-usb@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-sound@vger.kernel.org
Subject: Re: [PATCH 0/2] Add larger page size support for USB audio offload
 path
Message-ID: <20260825094327.606072e9.michal.pecio@gmail.com>
In-Reply-To: <20260824-16k_offload_v1_b4-v1-0-49a6be60ca30@oss.qualcomm.com>
References: <20260824-16k_offload_v1_b4-v1-0-49a6be60ca30@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

Hi,

On Mon, 24 Aug 2026 19:06:54 -0700, Wesley Cheng wrote:
> On some environments, 16kB pages can be enabled from the Linux subsystem,
> which manages the IOMMU mappings for the audio DSP within the system.  In
> the current design, the following assumptions break when 16k pages are
> utilized:
>   1. xHCI ring size is equal to PAGE_SIZE
>   2. Ring addresses start at the beginning of a page

FYI it's worse than you think - xhci_ring_to_sgtable() returns wrong
data and uses some allocation out of bounds on these systems. Quickly
scanning through the patch I haven't noticed any changes there.

> When the USB offload driver maps the rings (w/ the audio DSP SID), it is
> set with a 16k granular, which is a problem, as several xHCI rings could
> exist on the same page.  This is because the rings are currently allocated
> from the segment_pool.  Hence, potentially mapping non USB audio related
> rings into the region accessible by the audio DSP.

If that's a security or reliability concern, perhaps each sideband
instance should create its own DMA pool, as opposed to allocating every
ring segment on a separate page?

I suppose each 'xhci_ring' could keep a pointer to its segment pool and
things would work for everyone, with very few changes.

Regards,
Michal
