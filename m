Received: from mail-ej1-f67.google.com (mail-ej1-f67.google.com [209.85.218.67])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9735F19F115
	for <linux-sound@vger.kernel.org>; Wed, 17 Sep 2025 13:59:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.67
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758117599; cv=none; b=VRxGeKcaSf9g0jnp8UFSJtZvRzaVWgFNy5rH0n6/yb3vkqw/h0mtmbCtSIUUU94NPUtA0i6JgT+mloGxPVrhYFR3prK+L/yv+FqST+6wFEZbWKdtDXhQ2w/aIt+Eu3GMhmpWCLA4dOPJ420iV2eiNQXG793aK9QkgJQva23gbtc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758117599; c=relaxed/simple;
	bh=HlsOgoJMDiPmGZJ/m+0CIAOip4+dnf62vlXnIwPb0pk=;
	h=Mime-Version:Content-Type:Date:Message-Id:From:To:Cc:Subject:
	 References:In-Reply-To; b=fvm5GkMBwSm9VGxkxXDb1CXDWwHJfM8rN7lqeSzkMTUwLyVqSUMW4iqyPkifgsaoHRdriXHLEqZnxp722V4ezN2XRXW+n0tNrvN6b5q45CmdaLHqg3RZfpFqxRjiYcrFoOX05+roIpCAEBp1DHxuwlrghQC3FZsdogknUguPQmU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=qHPP+gtf; arc=none smtp.client-ip=209.85.218.67
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="qHPP+gtf"
Received: by mail-ej1-f67.google.com with SMTP id a640c23a62f3a-b00a9989633so213284166b.0
        for <linux-sound@vger.kernel.org>; Wed, 17 Sep 2025 06:59:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1758117596; x=1758722396; darn=vger.kernel.org;
        h=in-reply-to:references:subject:cc:to:from:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gZ9rs3FYgxiBqHA5bToxvQlS5tlMrcogmGb69UagQr4=;
        b=qHPP+gtfpXR5xeOZ6IL2fS8PLhKilpKAi/Wlg4jPwt/l+oSBp4oMB+3OVo+SLzX2nZ
         U3W1rMK+57Dpfc8IARzBYt6/IHmMIsp+/+CW5uKqmIv/Hw40RyWn4WCP3wMpz9bqn5pk
         LBjN08Le3/Z6jfLllAsWRa0vn5NBMugb7HHeHUYcvNxayhev56D4RKj5ZvQahU9W+9By
         xME+iqgfpiOxFhZGCvmsDlWvwmQTIX8QpgkBXkU4oP5wjgFog71DF7b5E4qaVn8RFHyM
         J2kZW0CdtWgqZh+YkACGE45J+47az/iX9B4AdE9WQQc7p59Dwg5exvA/530ZXLPNkLW+
         eG3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758117596; x=1758722396;
        h=in-reply-to:references:subject:cc:to:from:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=gZ9rs3FYgxiBqHA5bToxvQlS5tlMrcogmGb69UagQr4=;
        b=wJTYgnj6RZdzVB0GD6oGdmmzS+lD1qLC4EFuAVyr2i4LJ7sPZgZCRYR0mtnmNIX0a9
         tpFev73Jqpf1eQRTEP5w3LQufU03wDkEMhwLxE51bo6/QKrPv7cWSZ6jw0dZzRAn6qlI
         IQPhJoO6Xi02OAhICYtoKxg3SbPTNCxRPLjoXp9WfaFf+4iIE7vy58FeAFprzd2VpvEr
         pdlvovEIt98eNyuYxM+3mXV+TWVmp0sNT1cMLAnSkL5X7e15KjReTYFRyOjfCNQEFeOV
         hv1g702qLdz+y2whNQxCJSm+nhH25m2Kvk/e0pmmNKvKPEb0YUF8FN1mP42BIhvKDk30
         BHZQ==
X-Forwarded-Encrypted: i=1; AJvYcCVitXDw/zan2j9WDWXJNs7UGOjzM2DLErNs7hRVQMDzfI3Py1WrjqSMCb8TWuYzFbttLswfN+aoy2sykA==@vger.kernel.org
X-Gm-Message-State: AOJu0YyHTpGu5cEOQ88V/6kWmaMTezCmha3b9S9gN5pP9WvsT7WgeOrJ
	Nfi8nwF+bPvSGUQo+Xl//4Ax4mNYSZVovdvLlryc7TNd7LJQ+p+QOdVpzhSjQXzP5AM=
X-Gm-Gg: ASbGnctTYv8IKaIwzGWvxySx14Kk2lePVecQ5A9bCVIhfxea3v3XeKoS54LaO/LweTS
	mcWnAzqsVcH+NJBHMYJylWpA+tHefjkLSki7k4IaeVJ1CUHyc1LzCFU1AiE+sHKdlgsCRdulVDC
	w5bxGIXXwbClSXGc+dPsjaVQiH0w7AnpUw0jSFshK7nywfoxMdMdqSX3FkVZwvzTTebeFTESpe6
	e4yQOJROaEz/DS1Euhge/unRrVvwjm4fhMcig25uyA+WbSyzLrnzpyicuctl681GDqDw51pU/LH
	GJvKFwHRkdXIhZl4QwUSU80cB6dlWQMdTs2+7HHG25UHDSsHz8laSTNDaD8o5Edp0OEm2a8mOLV
	8EZm+vENvszIPq9uidSI8Pt2Ac6SB5/BPMwFwQT/fgccEK0kGc9vFK69Jb931ZPVy0JXpDWLDCs
	sR+BSkTMlys24=
X-Google-Smtp-Source: AGHT+IE6uqG8zk5CcZdAZHV2QgIl0M9D9lZbkHeKeWQerza8j7gurxNLzuBhabljZ9UXI66L02Tr1w==
X-Received: by 2002:a17:907:3fa9:b0:b0e:d477:4978 with SMTP id a640c23a62f3a-b16836ee333mr623953266b.32.1758117595928;
        Wed, 17 Sep 2025 06:59:55 -0700 (PDT)
Received: from localhost (144-178-202-138.static.ef-service.nl. [144.178.202.138])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b07c7159e6csm1159327866b.33.2025.09.17.06.59.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 17 Sep 2025 06:59:55 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 17 Sep 2025 15:59:55 +0200
Message-Id: <DCV4O98LHJW2.1HVRG1E5C10DY@fairphone.com>
From: "Luca Weiss" <luca.weiss@fairphone.com>
To: "Takashi Iwai" <tiwai@suse.de>, <linux-sound@vger.kernel.org>
Cc: "Luca Weiss" <luca.weiss@fairphone.com>, "Arnd Bergmann"
 <arnd@kernel.org>
Subject: Re: [PATCH] ALSA: usb: qcom: Fix false-positive address space check
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20250917130909.8211-1-tiwai@suse.de>
In-Reply-To: <20250917130909.8211-1-tiwai@suse.de>

Hi Takashi,

On Wed Sep 17, 2025 at 3:09 PM CEST, Takashi Iwai wrote:
> The sanity check previously added to uaudio_transfer_buffer_setup()
> assumed the allocated buffer being linear-mapped.  But the buffer
> allocated via usb_alloc_coherent() isn't always so, rather to be used
> with (SG-)DMA API.  This leaded to a false-positive warning and the
> driver failed to work.
>
> Actually uaudio_transfer_buffer_setup() deals only with the DMA-API
> addresses for MEM_XFER_BUF type, while other callers of
> uaudio_iommu_map() are with pages with physical addresses for
> MEM_EVENT_RING and MEM_XFER_RING types.  So this patch splits the
> mapping helper function to two different ones, uaudio_iommu_map() for
> the DMA pages and uaudio_iommu_map_pa() for the latter, in order to
> handle mapping differently for each type.  Along with it, the
> unnecessary address check that caused probe error is dropped, too.

Thanks for fixing this, and Arnd for the help!

> Fixes: 3335a1bbd624 ("ALSA: qc_audio_offload: try to reduce address space=
 confusion")
> Suggested-by: Arnd Bergmann <arnd@arndb.de>
> Acked-by: Arnd Bergmann <arnd@arndb.de>
> Reported-and-tested-by: Luca Weiss <luca.weiss@fairphone.com>

I don't know if https://www.kernel.org/doc/html/latest/process/maintainer-t=
ip.html
is applicable to also sound subsystem or the whole tree but maybe
separate tags are simpler?

Reported-by: Luca Weiss <luca.weiss@fairphone.com>
Tested-by: Luca Weiss <luca.weiss@fairphone.com>

Regards
Luca

> Closes: https://lore.kernel.org/DBR2363A95M1.L9XBNC003490@fairphone.com
> Signed-off-by: Takashi Iwai <tiwai@suse.de>
> ---
>  sound/usb/qcom/qc_audio_offload.c | 92 ++++++++++++++++---------------
>  1 file changed, 48 insertions(+), 44 deletions(-)
