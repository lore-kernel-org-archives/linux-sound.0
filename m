Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com [209.85.208.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E59943DDDB3
	for <linux-sound@vger.kernel.org>; Wed, 11 Mar 2026 16:41:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.174
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773247306; cv=pass; b=Aagyo+fzAv2j57XuYjvsfZDScWHes0o55+dKt5jFjFrwOc5eqFIUddl7zhjzj+l8yq+J6yMZK+i2awz7wMjJbvwHMiZnWZTZWZvL8YE+U3hUQjtBkDfY877eDys8nR9kGmg5UgoY+myDln+N4S1F+rZHOTtGUX82szlLZHJ6R9E=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773247306; c=relaxed/simple;
	bh=m0G/sD4v1ogCGWlbxFqi1VwA3Rmg33FNecLzp+BqRxU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=gXwOh7xcS18OpTqdVqItkTFg3r+X+vRmTIIUe0eLMQ3BAxbaWKgqkevK7dDb1JACq7S7+zI0+EAbCQ25lDAkL+ek+bHBpDiYdxNYf43d5lDGinuDTO4KRBc9lun/0d1n3EQedc+CwMpr5tBOOYDNpogdhvvQMyHfhfDlMLd8PaQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=P187cT+0; arc=pass smtp.client-ip=209.85.208.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="P187cT+0"
Received: by mail-lj1-f174.google.com with SMTP id 38308e7fff4ca-38a3990e87fso926391fa.3
        for <linux-sound@vger.kernel.org>; Wed, 11 Mar 2026 09:41:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773247303; cv=none;
        d=google.com; s=arc-20240605;
        b=RGXxXqhzreLvmT9j8XCjFfMVyaRHyBlVKVDTrGmgJMSIg+Vujovt4P0CYkzJj8UU6i
         wMgzNgxaKTorb58o0oQ+fIMU/94q8O4wkoG8fdTyPrYPS9ZW9TFr54C/ogziIT4VVU6F
         uCr1nqluy9xfd7B1G8tHyP2iEzl1A9vjYNkSrBvuvmKi6b1DV+oUgEsTCWN3w2XWAUXi
         JyvpN4oS6uoop242baAkQ9V2Vb4+Y3YewchthWzCehqv53cO91LDAptbL14O82iwuYhy
         9PzCYSyLpGfGJCqReqNWH0s1utCAz5U3j9jPNFSiTeHU3DXgBoKDeIvZnRs1iZvzQM+d
         Xjng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=m0G/sD4v1ogCGWlbxFqi1VwA3Rmg33FNecLzp+BqRxU=;
        fh=N8lAXMqayGYxgFao6vlCzqHlycoSOduQ7kDeyuFkkmc=;
        b=TXID+UpsF3S7pdbnFvxPfwb+6D9BQFBwJKfakxfwhrweJcQhGvuQCuU6MMeTMZw8Zo
         q58KPsUgXobJbeStgBomSTuJGHUjKjnSMmBgfWM0r/ocsyj06d4JTNGyB20md1mKGUXq
         pzRflLaCl992slaJ8E3h2SFD82VRNR7ZU5jV5UlgTUb3Jbj0yeyeLwmph2rex78Wnfga
         9c1BKGa5iJ4YKkRRjAiXJTsNzd6jl62r2k+L7TVfGMZLPMJYTT/J91XNdLGTpaqQcXWU
         /cBwkeL/eHIX6dFXkLISFRh3LHq1CvEIRvOdcA1D+aIp5DpU5gFUciOczyUCSpeHNBTA
         9REQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773247303; x=1773852103; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=m0G/sD4v1ogCGWlbxFqi1VwA3Rmg33FNecLzp+BqRxU=;
        b=P187cT+0ZL6chGMM30YheSeyRyUbwnw/TryXEKlusA1ZcmtBcTyhsW1kqvVMz8rNXr
         qPMESoAkND+D51Rj5zk/Hcn59owrSeROvZgul36U52p3GbZyrG3V3r+5LeoyDOb88PPT
         8rkEsz6cGHMhGNcHnFShPKNwwjup0JlFx0YPyZnHVSNC3Tie6XpSQFGT7bY3sUhAX3Pu
         oQRu+0xEx7/dqADmQx7RKd6NRBGlflkU1GBdb4382bI+LyvAQAeLOlxxK9lN9DJxS+p4
         jzg2f34R+qpDSj6Ilhy0n+b/yJGqM+WEkZ8uUxzWCf5RF3vG4/cjnssFhSr1j7M9BJo9
         U97A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773247303; x=1773852103;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=m0G/sD4v1ogCGWlbxFqi1VwA3Rmg33FNecLzp+BqRxU=;
        b=kQL8blcWhLxQU8pGqb/IxnowqBi2b2JNhIvRSCwqDuOKD0BgLnoetr+0yPPWRIbcvZ
         PrGzBJVIb442e0QXTCwhsFytM3QB3GiwRrOuBEHaAZHuG9T3+FWrTgHMT+g2IWkudHB8
         1ge0kN0LR6wzICT8b6xqSv9vw02jwb9jmUCFFQrhtZSD6lrUNCifs/erbF/nDce3+SM1
         8zKryvErniXFld0ucPXD8JK2/cOJJNkY5cZZJ3av9fWwSMPEd3yuYbaCDdnrK9gErsXy
         tBcvNTqxwpdsYkXANSFOC8lb5Iqp05Bai2YDIlrSFqusJOldo4c7KLYi0AlKTq1WqIyD
         KBJg==
X-Forwarded-Encrypted: i=1; AJvYcCWBoGqyA7xtFWZzz5mIV1nMdmNVIqQ23dNdeLmqTKb4ghaDYaF4pmZAx4i0/FB5u9c5KDi/HAxMO6r0lQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxL9hhjV0+QBDECLZhIlz+o3MNxQvHTUtroXKcrX2VAuXUHMdKd
	yaHW8hNFWClBV+B3G8fTv3NRTRXIqqlFxVZRVEyNSmVIcxp6qRpp/rDxDeLWnMvQGJHNjxxKFM6
	IoSTGa5NwldBMJaUXdYrminud1NQ+TEw=
X-Gm-Gg: ATEYQzx77uMfpL4VV+xC3K9gyYGuetsdmBbKPZHCZKZRqXIQqJbugQmg1TKLawYKJ0X
	H9fAr1LuGaRSVock5cMoTl+ux/5uqMfvAiiGw+2Z2yV2RESO1YhLpaZstIpXGVqEjWtmwVFFhHK
	zlf4wQVG4JyxkDCdt5qX+c/op40bSqRViqRTRqmmgLhPfAwnN+VBjldsqyaFHIJYou8cZWZD2hz
	f7GN0vTn8/RtRiVaxqMV3qNXoSJ4PsbM10ylxnQNnsWr5yBhZi8drMyPhsaaZCaAtbu2wf58HTb
	7looLrkyhzx1TcSTCPPm/NyuiQMt3eafo5PQpaERXt852hK3JkqN0BDT/1epNtlp8JuK
X-Received: by 2002:a05:651c:324f:b0:38a:4dd3:6a58 with SMTP id
 38308e7fff4ca-38a67e5452emr12085921fa.21.1773247302963; Wed, 11 Mar 2026
 09:41:42 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260310-aw88166-fw-v1-0-2777563bb673@gmail.com>
 <20260310-aw88166-fw-v1-2-2777563bb673@gmail.com> <20260311-glittering-elastic-deer-a2fa58@quoll>
 <CALHNRZ-KxT0B1zpPD1N7ba6185cqh6q-z-WMxbpU68FRuGJXEA@mail.gmail.com> <1c068ae5-66aa-4892-879b-875c9209dee9@sirena.org.uk>
In-Reply-To: <1c068ae5-66aa-4892-879b-875c9209dee9@sirena.org.uk>
From: Aaron Kling <webgeek1234@gmail.com>
Date: Wed, 11 Mar 2026 11:41:30 -0500
X-Gm-Features: AaiRm52kl08XiJjCIYuZXgszd4TGRjK8P9abGkjPMl1OYNUBCpHJm9xcVnUSqWc
Message-ID: <CALHNRZ_ZHmA3M6mooq6+NMf=Fmd84SxveMEQnucLAC-uwJqp-g@mail.gmail.com>
Subject: Re: [PATCH 2/2] ASoC: codecs: aw88166: Support device specific firmware
To: Mark Brown <broonie@kernel.org>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Weidong Wang <wangweidong.a@awinic.com>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
	linux-sound@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Teguh Sobirin <teguh@sobir.in>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 11, 2026 at 11:33=E2=80=AFAM Mark Brown <broonie@kernel.org> wr=
ote:
>
> On Wed, Mar 11, 2026 at 11:30:34AM -0500, Aaron Kling wrote:
> > On Wed, Mar 11, 2026 at 8:15=E2=80=AFAM Krzysztof Kozlowski <krzk@kerne=
l.org> wrote:
>
> > > > Signed-off-by: Teguh Sobirin <teguh@sobir.in>
> > > > Co-authored-by: Aaron Kling <webgeek1234@gmail.com>
>
> > > There is no such tag.
>
> > What do you mean? This tag is used all [0] over [1] the kernel [2].
> > How else is one supposed to indicate that that notable changes have
> > been made since the original author touched it?
>
> Co-developed-by is more standard and is what's in submitting-patches.rst.

Alright, thank you for giving the correct tag. I will update and send
a new revision.

Aaron
