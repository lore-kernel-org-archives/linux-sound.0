Received: from mail-oo1-f54.google.com (mail-oo1-f54.google.com [209.85.161.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B51A68060A
	for <linux-sound@vger.kernel.org>; Wed, 21 Feb 2024 15:38:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708529886; cv=none; b=G4O6ILgqm6Vn1yQuZmcGHg8Yu1sNMpNsxcgxdw4YOJzkbBGef+Xwg7v+4Gyi9e00nIcAEetW5IsPaGIZN7Jfs4m+l27c/hvGen6RFVcnoRzE+UOLuhtv+JwymxcmbopR2IsiStrKf31w4IW1IrQK8JgNQLlrVl1HJk9x+iM13pg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708529886; c=relaxed/simple;
	bh=grCOSi8XLFLNaMwkvCBLU81kgrXCuEK7+6nsE0tIJwM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=mLZl/hFbQDvbsDHkapyZFrMt5hTmWrXLgGDJWHVhbyEh2vauBQx1Gh7eZiDh7hvADukJASipyGCSw1UhOaBMDyAh/KmIYxNzQeSptvX/3EeCDNBgmiLeLWsMBXSomkqgpt1kod8tFWZ5PhbUysXMuzL/7NVrUvF6BwkLb45D9AM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=EnMRUP10; arc=none smtp.client-ip=209.85.161.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="EnMRUP10"
Received: by mail-oo1-f54.google.com with SMTP id 006d021491bc7-59fe5b77c0cso391943eaf.0
        for <linux-sound@vger.kernel.org>; Wed, 21 Feb 2024 07:38:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1708529884; x=1709134684; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NEHN5AeQw8GvEzpiKivhi/yJeQapwymDAxDl0UXRrHY=;
        b=EnMRUP10tj4gX39sl5/sdn49FmzXvoX2UP0BbEP0GMvc9LCGsBlilOaTp0aoKcujqZ
         FqLNxXj/GmXhlUh13/wNZpsFCXCyp8aNCuUE6GBE2In26ltDatXBYJ7AVOa5F9ZOA1SU
         jCVYztHu6ij7bLLNEsylbmk1BgEwtSpr7J9UE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708529884; x=1709134684;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NEHN5AeQw8GvEzpiKivhi/yJeQapwymDAxDl0UXRrHY=;
        b=FKc9hpnyNpjrnxLZ7OE4wzalcE3EQR8f/d7iQPC0bcmt/eB462J/Tnf1U6UiwGlku8
         O4B6rrEAwluJkysxvXqAYLlLMbw00QZtBsDFME70y8wNt/7b49FUe/B7EZuItGilCRQH
         mUEftE0o3pttb2/pogBoQ9NA8dAJKocaxLfeIVhTdJCz9duYNZJzTuiOLX+/sx2a2T3l
         QkszhPmAezKzWhj43OSJ/KvuICEHyPcMXrdfke+zKZnqK+0d4tNR0Cjoswcc3Pa+wc3S
         0EAKZKTa7bMVqZhVCx6/bbRgSlqWjje6kflQr5iNoAuU4uoawlCekIk3vupJJZwGS5JU
         ITJw==
X-Forwarded-Encrypted: i=1; AJvYcCVeTEKKzx1Vt4o3e/0VnJDoI02mKTKpM7p+SeL9HhVQXGcuXkfi8DMasq8bMgl3AZHzSsSMh7sFEXVGGOFfSUqnwbA1gGI78OBVTyM=
X-Gm-Message-State: AOJu0YxLx5RsfmikvM0QUpqYle8IcxSpEIVYkddnTOCRMR28rbc0T5qY
	DhqNU4szy18LinBBq2GbP9A7sTaXWo5NM4EFMpr4yBFAZaVKOOayCJMdCaqOqRQ+jokmo114Cic
	hMK7cwC+HP7pfl99956d+4AtZTWiv6RoP2jZG
X-Google-Smtp-Source: AGHT+IEChvW8BSTbCSiTLMx41zznTkN+GvBMzZXbANOmOD7tZt6WMkfBtn5etm2aIN7Reqjdjh6UJ1h4VL7WfSOjNEc=
X-Received: by 2002:a4a:b78b:0:b0:59f:8466:5748 with SMTP id
 a11-20020a4ab78b000000b0059f84665748mr16124819oop.0.1708529883981; Wed, 21
 Feb 2024 07:38:03 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240214170720.v1.1.Ic3de2566a7fd3de8501b2f18afa9f94eadb2df0a@changeid>
 <87jzn0ofdb.wl-tiwai@suse.de> <235ab5aa-90a4-4dd7-b2c6-70469605bcfb@suse.cz>
 <CAG-rBihs_xMKb3wrMO1+-+p4fowP9oy1pa_OTkfxBzPUVOZF+g@mail.gmail.com> <87le7e6um3.wl-tiwai@suse.de>
In-Reply-To: <87le7e6um3.wl-tiwai@suse.de>
From: Sven van Ashbrook <svenva@chromium.org>
Date: Wed, 21 Feb 2024 10:37:53 -0500
Message-ID: <CAG-rBigASZpsxEpjUnCWYpfmjuyJTQ44AXBr90fYbQWvit_YXA@mail.gmail.com>
Subject: Re: Stall at page allocations with __GFP_RETRY_MAYFAIL (Re: [PATCH
 v1] ALSA: memalloc: Fix indefinite hang in non-iommu case)
To: Takashi Iwai <tiwai@suse.de>
Cc: Vlastimil Babka <vbabka@suse.cz>, Karthikeyan Ramasubramanian <kramasub@chromium.org>, 
	LKML <linux-kernel@vger.kernel.org>, Brian Geffon <bgeffon@google.com>, 
	stable@vger.kernel.org, Curtis Malainey <cujomalainey@chromium.org>, 
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, linux-sound@vger.kernel.org, 
	linux-mm@kvack.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Takashi,

On Wed, Feb 21, 2024 at 4:21=E2=80=AFAM Takashi Iwai <tiwai@suse.de> wrote:
>
> Both look like the code path via async PM resume.
> Were both from the runtime PM resume? Or the system resume?

The large firmware allocation that triggers the stall happens in
runtime resume.

This means runtime resume and system resume are affected.

Due to the way runtime PM works, the system suspend path is also affected.
Because system suspend first wakes up any runtime suspended devices,
before executing their system suspend callback.

So we get:
system active, SOF runtime suspended (audio not active)
  -> system suspend request
    -> calls SOF runtime resume callback (stall happens here)
    -> calls SOF system suspend callback
