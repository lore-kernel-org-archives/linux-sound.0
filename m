Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D97C58C0B
	for <linux-sound@vger.kernel.org>; Thu, 22 Feb 2024 16:43:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708620232; cv=none; b=nCVFhRxTAMlwwtDzb5ueFV6+Te2Oewde9kk3CjGxV8mqbdIvtD7ZApYC0AaDPCHD/keRvkAJtbENKcEDgzLsw7p9kLvtQ3rR3ZBkQJBmY4sxETPddHQ80mhI/iKLldMEn337Mko+u1tPztPVFCkdTvvaQ+SQ1GfwzZzhQLcCF0M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708620232; c=relaxed/simple;
	bh=blGXCQWbinQD12tf5lew+OFO7kdmX5WYe1FXNjbh2d4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Y0PY+WiSpGXuKDF/WZdSfu9L2KHPQcarRQvsVw729M/HotkjL2Fk7feurAGeCAEtnRg/LFBxRQLfS+TOj8LzRDqGZPemCzPRg4v7DEeqC6NnEcdcj2+w/D6kex0KFWfMREsUW6uCy+1dO/MTEHdwiDM/eSa5JW3uuK/dYdhK7UI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=iaKY3TNQ; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="iaKY3TNQ"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4128cfb6b6fso3968375e9.0
        for <linux-sound@vger.kernel.org>; Thu, 22 Feb 2024 08:43:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1708620229; x=1709225029; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=blGXCQWbinQD12tf5lew+OFO7kdmX5WYe1FXNjbh2d4=;
        b=iaKY3TNQAt1pe8rPYA6dM2vsv1TiNG446InpPbybZoeIcG/pSCkv9mVqN5A6MjViMP
         UDcZLj5NvHhziGP+ZP0sVljWuEFYRF2st4B2JdxEO8VYj9eEOundVpvPkMmiwPWxfkaC
         b9NbfuhE34bl3fu0zpuz3nOrNQbb3qjdOErU4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708620229; x=1709225029;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=blGXCQWbinQD12tf5lew+OFO7kdmX5WYe1FXNjbh2d4=;
        b=VRgekphdzYFiL04T59TNfqr+1dMV77B/GvRnRJIInWQiwfl4v6Ft5Zo9MciQjUM/TF
         /AVhCo81emYJf3YUEDHa47BFK8T+EVIivhzS1cvQ6DfcRtRG1fO7jF45gmsT3LontfMp
         CetRjT0y3rm9OJl4SKMJGZO8CgXqM3RT0xbO4sM5xbke2DgsHcpa0Ilu6hcOcU9mEGIW
         pxeSNp4EyvKh2GX+OAF09d9XyWosujtpagGeMs0PAYvqyj0BwAlWhtNJl0nHdgYH70If
         6qrTNM5OTO9m/b0qIpF5vvl+Ac/vNyV6P+1eS69mPY8W/dYnnSSUAMi/KnINY2Ze8yDX
         B7ag==
X-Forwarded-Encrypted: i=1; AJvYcCV57OONcYPG6WNQIYjuB5A1aZZjQISoAgHu9RXastha5tIx4Pn6MRZrRpGFMTmHP1c1Rc7Wcv2Z8ZsL3itW5LE1rdpg3YiIGp166ic=
X-Gm-Message-State: AOJu0YwRg1xdIwxucwxE3icTjlRoJaAU1nBoluGTBZDgBrvosXXNkHAc
	oIkmafolCrGFACvu1I8iKCwq2MbFCdSMQFtRR+lg0ahUuwQPyC22///6Ea0KK4vokVxE7UKE7dD
	7K/9K0kzu5bS3JipExnhspJ9xarNrTaai2Gqh
X-Google-Smtp-Source: AGHT+IHPeFbJSDEot8fEBJUOQpHH3P+T2gkvI8J+VDy41RkRYDYg/pUrSO1BaeS0Z3eGGdJvHPDd7UZsn6op8oO0QU4=
X-Received: by 2002:a05:600c:1391:b0:410:e41a:fc0d with SMTP id
 u17-20020a05600c139100b00410e41afc0dmr16692583wmf.24.1708620229216; Thu, 22
 Feb 2024 08:43:49 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAG-rBihs_xMKb3wrMO1+-+p4fowP9oy1pa_OTkfxBzPUVOZF+g@mail.gmail.com>
 <20240221114357.13655-2-vbabka@suse.cz> <CAG-rBihOr+aAZhO4D2VBwSx-EGg_gbgBYKN3fSBTPKCXdz9AqA@mail.gmail.com>
In-Reply-To: <CAG-rBihOr+aAZhO4D2VBwSx-EGg_gbgBYKN3fSBTPKCXdz9AqA@mail.gmail.com>
From: Karthikeyan Ramasubramanian <kramasub@chromium.org>
Date: Thu, 22 Feb 2024 09:43:38 -0700
Message-ID: <CAJZwx_nLcMjV+4vShx9LqCOVo26Bk_gDPXP6PiTp2UXdQAh2Zg@mail.gmail.com>
Subject: Re: [PATCH] mm, vmscan: prevent infinite loop for costly GFP_NOIO |
 __GFP_RETRY_MAYFAIL allocations
To: Sven van Ashbrook <svenva@chromium.org>
Cc: Vlastimil Babka <vbabka@suse.cz>, Andrew Morton <akpm@linux-foundation.org>, bgeffon@google.com, 
	cujomalainey@chromium.org, linux-kernel@vger.kernel.org, linux-mm@kvack.org, 
	linux-sound@vger.kernel.org, perex@perex.cz, stable@vger.kernel.org, 
	tiwai@suse.com, tiwai@suse.de, Michal Hocko <mhocko@kernel.org>, 
	Mel Gorman <mgorman@techsingularity.net>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

With this patch, the test results have been promising so far. After 10
hours of stress testing, we have not hit the reported problem yet. We
will keep testing and report here if we hit the problem again. Thanks
for engaging with us.

On Wed, Feb 21, 2024 at 8:53=E2=80=AFAM Sven van Ashbrook <svenva@chromium.=
org> wrote:
>
> Thanks so much ! We will stress test this on our side.
>
> We do this by exhausting memory and triggering many suspend/resume
> cycles. This reliably reproduces the problem (before this patch).
>
> Of course, as we all know, absence of evidence (no more stalls in stress =
tests)
> does not equal evidence of absence (stalls are gone in all code paths).
