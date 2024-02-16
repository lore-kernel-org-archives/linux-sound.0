Received: from mail-oo1-f43.google.com (mail-oo1-f43.google.com [209.85.161.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DD1878B5C
	for <linux-sound@vger.kernel.org>; Fri, 16 Feb 2024 16:22:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708100578; cv=none; b=pzG9bEMEVPTWO/meAwV78h+yMj8oLQaYn8elvhWMMWtPRKGqBxSzChmce0hH67ll6zclb+Wrq23TdCi7OY0ah1hiYIJoIDf1knP8Ujljp0lorFi2+xy75WvjJXr2UY/RMiKJKQt3kwO+STIfZDziaEyFtdiaRCVbbbBGmKTMnvQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708100578; c=relaxed/simple;
	bh=eeq/n7ab4GkpbGp/WWvm8JcwaMcM0G2mRvEUmj4AOy4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=dEHwCIoD9/mi8HjYCOEB3l8hIZR/5+dMt2uIuXxhOJK68SO3LxurBT7rZz2o51Q2IwHU5eJL6sW/gPon1FzkAMNVhtydDu/R7Lb3Tw/75KGXfmb1+qnj1KpxVGjNRZ7NOL7tY6BMAIPkd0a3c7KJnfwhRjfh2YUYw8RnEUvTRe4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=Y7L/QiUU; arc=none smtp.client-ip=209.85.161.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="Y7L/QiUU"
Received: by mail-oo1-f43.google.com with SMTP id 006d021491bc7-59a27fbe832so254133eaf.3
        for <linux-sound@vger.kernel.org>; Fri, 16 Feb 2024 08:22:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1708100576; x=1708705376; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GrYF1dWTlGPpRhl6DLPo/DaiRb2f0DtkTQYkYyH+8NM=;
        b=Y7L/QiUU080UnUcG17MaXalaaoHJ8DpuQEExZGY37keyn3m1a+UftzBAehThBNjYbc
         MG2sVwp19QH4M6d9VMKChtwlIhMqFw0n20TfExnPvFj+t4ahcL1fQkdrCHt4v/+Mo/+k
         iHGkrAG/B6dlzRNW/+sCvq73/+uU+jzUiY0DM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708100576; x=1708705376;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GrYF1dWTlGPpRhl6DLPo/DaiRb2f0DtkTQYkYyH+8NM=;
        b=W2Kahwho1YR/nojhZW1HNP4toD6PRnAQKouNFICBCQSEsylyLO7F5gRkUtOtarTD07
         9sTlPk3mX8jAEu3IJKNCQcj2JJDWTLAJcWCore6sIuD3Uci//SE7l4lP30vSKcv6dvmL
         pN+Xcxa4SAqtAzKt9ulAOtG3TvHzJb0bIdpglIPF6lWZWLwdVDo4Gm23sinw0zN3RvkV
         Jd4UISSKdxqMLY1KhHCJiXcD64+BFK2CFpi+MnH5FT6jJcC3ppXMjYU0sBZF/6F9Qpk9
         V0F8mFZ+DeQbC1G0pcBGjzAEBirXlLa0ZCVthogJb8qWtc2AswSZpCmxzG9PuYOs+7l0
         ozuQ==
X-Forwarded-Encrypted: i=1; AJvYcCVUvxzSQF8hj34LCW2nQOYTgH+7KA9BbhdQ0n2fjiixZjO+j3gxMDPScML1O80b3eay9tqKYCvXcfXehsgtQx5YHJ5Nu9FYjTME5G0=
X-Gm-Message-State: AOJu0YzQ0GKmImQe4oA+5Srl6jnnDyiQ/n46u0V2oblll9cKHyiwbggR
	pN+0p1YtHw+GkXvs/9z4NnVrJWAm8UCF8dUiNYJiymS/oEhi4QSo6+VlK8K9FW118kANyCnF4Xj
	b0Z+OTxYjZkAWrJmtwzoHQtKi6kWGto2p/X8V
X-Google-Smtp-Source: AGHT+IF/HaeJ00MK09lOTpQMbcqMziF1EhDarfJMGzP6U/HexEYaF0Uupxk/41NmdwWb7qolLglZCwqIkfPGCZPn9Nk=
X-Received: by 2002:a4a:6245:0:b0:59d:c3a:d6a0 with SMTP id
 y5-20020a4a6245000000b0059d0c3ad6a0mr5661582oog.4.1708100576157; Fri, 16 Feb
 2024 08:22:56 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240214170720.v1.1.Ic3de2566a7fd3de8501b2f18afa9f94eadb2df0a@changeid>
 <20240215034528.240-1-hdanton@sina.com> <87h6iaf7di.wl-tiwai@suse.de>
 <CAG-rBigFG-U-sKY77CvzghGzs+1Xm3YXzBF6N4ti0+h6UdAb8Q@mail.gmail.com>
 <875xypk6d6.wl-tiwai@suse.de> <20240216043426.1218-1-hdanton@sina.com>
 <87plwwiz6z.wl-tiwai@suse.de> <87frxsiueo.wl-tiwai@suse.de>
 <alpine.DEB.2.22.394.2402161246520.14041@eliteleevi.tm.intel.com> <87zfw0h3lu.wl-tiwai@suse.de>
In-Reply-To: <87zfw0h3lu.wl-tiwai@suse.de>
From: Sven van Ashbrook <svenva@chromium.org>
Date: Fri, 16 Feb 2024 11:22:45 -0500
Message-ID: <CAG-rBihE31G1q0pXbdR22bHKNboiADTUHx0JMnDKBg_sua+0RA@mail.gmail.com>
Subject: Re: [PATCH v1] ALSA: memalloc: Fix indefinite hang in non-iommu case
To: Takashi Iwai <tiwai@suse.de>
Cc: Kai Vehmanen <kai.vehmanen@linux.intel.com>, Hillf Danton <hdanton@sina.com>, 
	Karthikeyan Ramasubramanian <kramasub@chromium.org>, LKML <linux-kernel@vger.kernel.org>, 
	Brian Geffon <bgeffon@google.com>, linux-sound@vger.kernel.org, 
	"Arava, Jairaj" <jairaj.arava@intel.com>, Curtis Malainey <cujomalainey@chromium.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Feb 16, 2024 at 9:43=E2=80=AFAM Takashi Iwai <tiwai@suse.de> wrote:
>
> OK, then how about the one like below?
>
> This changes:
> - Back to __GFP_NORETRY as default
> - Use __GFP_RETRY_MAYFAIL for SNDRV_DMA_TYPE_NONCONTIG with IOMMU;
>   this should cover the commit a61c7d88d38c
> - Also use __GFP_RETRY_MAYFAIL for the SG-fallback allocations of the
>   minimal order, just like IOMMU allocator does.
>
> This should be less destructive, while still allowing more aggressive
> allocations for SG buffers.

This one looks like it would keep the SOF firmware allocation issue at bay,
in both iommu and non-iommu cases.

If there is no further discussion in this thread, we'll stress test this
on iommu and non-iommu Chromebooks.
