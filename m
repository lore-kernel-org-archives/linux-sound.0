Received: from mail-vk1-f173.google.com (mail-vk1-f173.google.com [209.85.221.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C274037C0FD
	for <linux-sound@vger.kernel.org>; Wed, 27 May 2026 15:51:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779897095; cv=none; b=oiP5GVyL5hwimGP5Xc0CVukVNSo7VXoSkiBe1//7zbFwyePfCKa79VMlTfvNZUrvvRVeR0SpbvwklK99xm8Erc0FW3NCDXB0J0EoP+ob+x0ZaaTlE7gnpX+c+0GUeZawy5C/VT6fdCDofDFLDBkxtZKC+S85kwLQFuMm1ZyYjPE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779897095; c=relaxed/simple;
	bh=qKbkZMJtkt73q6MVdq9NtMxASPvqyv84AwgiiThd+7k=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=pwukxSUyM2/V1iBLGsh5KQz9vWU9M8SN7dCrkKTx0KSl2Pa2TffliaLQIi6Lv8JFYv8etwDt9JK4C3siPqC1Liv/1LFsX2lGmKdOBcBGPhdsSmrnG0Xa+V8g8XLv3p6+lUGNRMVtedlVt1suCvxA/FtXaqbSsByv9BnX/MhuCz4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f173.google.com with SMTP id 71dfb90a1353d-57524e52a3dso9815486e0c.2
        for <linux-sound@vger.kernel.org>; Wed, 27 May 2026 08:51:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779897093; x=1780501893;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=2bh+b2FSQ4S9tWiMljtZE1x8DvPABI/MvIYcGMABymU=;
        b=oGrqcJPd3WGmkcC0qzInCOETP64x7BpGB678r9HvTLFasvHC1UdpmU8bIVopHXjKdX
         C+iblorcoa/uJhEOiUTJh/zwMhAW0BYk6UdqaY3rjP0vB/WNla1DSfhZCPZb08iVqUn4
         1BcsyTon2YYhp2rENIx/WJfTXrtXau8PEH42205ylDHzRZVbe9NcyAzRTfsVDdSd/JCg
         +g2fGksmEjzkSkoHc6TJ00ysA/WvUQsGZgiX7/VYHCMbWmln9eqTd13XzYCi4MUqDqc8
         MVehAbg0K1yyOLo1pkC/AKVXlUfUbRsK35314hOsayO1YE6GBdFCsmWcaUBP62Fzobbh
         MnVA==
X-Forwarded-Encrypted: i=1; AFNElJ9u1Xwsqyfa5PUv2Dp2f5RTRJkOzARrbWJNRWY7InyC20cb3Sr4QDssVDFYWQRjAscv1DzyIbLQ+mJGfQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yyw+mhSR+wuMgikmoaHIhASV28avbx1atFc4+Gd5bDw3+BayrNi
	63mgsOTR0TvYHPPQwpl3Ekm+hIslgiSsu2Pt5W6yUAG4XXK1TFZxP9Uh8JDancE8hR8=
X-Gm-Gg: Acq92OHCbE5PUmQnE+1If/YxpmVXEsbaMW+t/yghIY8y3rdo25Q56i40xnnWQqs9AVY
	8I0YjlbVcGjLpgEWoGE1GSLimecTAJ1G8hhr0MSofWRGeP6EvCPTon7nOVILsuWT2e05KaU0m7e
	li2+hV1Svi2LhKQprZHL2pgR/dXvZROxO8IRjEiQpQbAp9Nub0GLs8HgXocMlLxuPhG4MGfmlbR
	ftZMtNUAlWB7hy7x74H18YIcaX0Ab9iAAiGCH+3Lr173a+VOIHbGGUUppS8es87bVqh1991WjJ3
	RgBGcUwJadVq3rUC1QvabbfQPwf5WEI0nIMKCn2ovYM9mF9M36g1pFE61lr9de74RDIbsL3fRCr
	aHSXduMEir7tP5KXbSQZ3YV0jdAmdR9d6Ntj3q7sUzsjPtD4XOjA410R4Y98n0R4Gl0pdYyIA+p
	10dB9dHMo6OTyd5eKIvBv3GC8hPLdJKP7bdZlCIVygBuyMC8nbbqCldXk6BxE+
X-Received: by 2002:a05:6122:c93:b0:56b:579c:82e with SMTP id 71dfb90a1353d-586606b79a4mr12717085e0c.5.1779897092660;
        Wed, 27 May 2026 08:51:32 -0700 (PDT)
Received: from mail-vs1-f49.google.com (mail-vs1-f49.google.com. [209.85.217.49])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-586ec46c8ddsm21345982e0c.0.2026.05.27.08.51.31
        for <linux-sound@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 27 May 2026 08:51:31 -0700 (PDT)
Received: by mail-vs1-f49.google.com with SMTP id ada2fe7eead31-6313b7e3d03so7803466137.3
        for <linux-sound@vger.kernel.org>; Wed, 27 May 2026 08:51:31 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ9BG4nMGTPoklYKSec+SbGK72n5oz9fzCQSZiD8+DCuBfHWqaC5MiJ8rDO8uc35+QPhNtO5T9Xvt+R1OA==@vger.kernel.org
X-Received: by 2002:a05:6102:1494:b0:633:34c6:6ace with SMTP id
 ada2fe7eead31-67c8293fb73mr13015180137.26.1779897091174; Wed, 27 May 2026
 08:51:31 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1779896151.git.u.kleine-koenig@baylibre.com> <fbe2d29f785798b3e0b7c1b5707e917035a0b442.1779896151.git.u.kleine-koenig@baylibre.com>
In-Reply-To: <fbe2d29f785798b3e0b7c1b5707e917035a0b442.1779896151.git.u.kleine-koenig@baylibre.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 27 May 2026 17:51:20 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWkYhoaN80b2xXvNLqwMdFgJV7cfPj_SPUea39Ft-AnqA@mail.gmail.com>
X-Gm-Features: AVHnY4JpYSaPlViJEZLn2urWPttxXKooTYEBn-cJQAbGcaWZK9sJWm1CqYq_4bU
Message-ID: <CAMuHMdWkYhoaN80b2xXvNLqwMdFgJV7cfPj_SPUea39Ft-AnqA@mail.gmail.com>
Subject: Re: [PATCH v1 1/2] pinctrl: Use named initializers for
 platform_device_id arrays
To: =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig_=28The_Capable_Hub=29?= <u.kleine-koenig@baylibre.com>
Cc: Linus Walleij <linusw@kernel.org>, David Rhodes <david.rhodes@cirrus.com>, 
	Richard Fitzgerald <rf@opensource.cirrus.com>, Charles Keepax <ckeepax@opensource.cirrus.com>, 
	Mika Westerberg <mika.westerberg@linux.intel.com>, Andy Shevchenko <andy@kernel.org>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, linux-sound@vger.kernel.org, 
	patches@opensource.cirrus.com, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, 27 May 2026 at 17:43, Uwe Kleine-K=C3=B6nig (The Capable Hub)
<u.kleine-koenig@baylibre.com> wrote:
> Named initializers are better readable and more robust to changes of the
> struct definition. This robustness is relevant for a planned change to
> struct platform_device_id replacing .driver_data by an anonymous unit.
>
> While touching these arrays unify spacing and usage of commas.
>
> Signed-off-by: Uwe Kleine-K=C3=B6nig (The Capable Hub) <u.kleine-koenig@b=
aylibre.com>

>  drivers/pinctrl/renesas/core.c            | 24 +++++++++++------------

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be> # renesas
Acked-by: Geert Uytterhoeven <geert+renesas@glider.be> # renesas

Gr{oetje,eeting}s,

                        Geert

--=20
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds
