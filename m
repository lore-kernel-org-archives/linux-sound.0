Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com [209.85.208.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 075DB3CF95E
	for <linux-sound@vger.kernel.org>; Tue,  2 Jun 2026 15:04:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.182
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780412695; cv=pass; b=s/5yomiwTlsjepkwoLcpWisbNbm0/TDrEl2iNuQGd3Fvla7Ev8a7OVCqsjiuZ2nNS8VJf9Gv3AtLrRyks9V4I3g1QZycGrW/KgmU9Mnt0FYSpa3YkqcI0u/80pPhgurC2s+sZMSnsIRlI+iCnpRvlHCuwTlW7UJhbHT4qbXGBUU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780412695; c=relaxed/simple;
	bh=JIOyv1iPBE2H3Q2dpbPMzEa9V8pZVYeTaHwRqxiEo4w=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=o4W2aMqU47iAMoOUo1+ZQ8eydhhXm+ehdzuD2C7IAX5FBtyuwaAMycugd9dQg/sWRWGeLTqxpIvx7Dov6h/kzXRxPEHryQ0dWFO2jIMS9j8lXmsFYu97DkRe/eglnP6L6G/WBdujamRXrNUBsyDsarIHavES8E3nFaWSwZvWwZk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Pw1EqO4N; arc=pass smtp.client-ip=209.85.208.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Pw1EqO4N"
Received: by mail-lj1-f182.google.com with SMTP id 38308e7fff4ca-3967717c951so35265631fa.1
        for <linux-sound@vger.kernel.org>; Tue, 02 Jun 2026 08:04:53 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780412692; cv=none;
        d=google.com; s=arc-20240605;
        b=AeZLjINNhCiuWmLjYoiUGqmezo4sllmhQ8cGzp2NOG5k74I5lW4x7FmCUWw2oOjtFs
         Rlu5Wsf3EAXWCwXYOzuvTuDUDgCnXOI77jFMgRPezNC0imWUXikQtCHR3seIcrKwgpXg
         Pc/AoQ+J5YlGFY/P17kJIHu21SH6265zHMwh2XywChDyWZ/cMhuObJPu7ocw45KN7jFl
         QtjWJ6TOCpOU9FNMWFOV/t8AwaUQBN3qp1DJsWsbx6YC6Wqsc3tWuunNjuTSuTmBoUUW
         hW5Cqkt/yeyGTBKFet7qF3OyymK1EegMFbW1uGYpy47GjCqgCPC/MRLx7l+ogv4CTNuI
         0MPQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=JIOyv1iPBE2H3Q2dpbPMzEa9V8pZVYeTaHwRqxiEo4w=;
        fh=AHZlZsShPoFudTdFhaxs97QxKcW3PoFK3lT/vD1t+9U=;
        b=A0JqoMMyA9esqG9NQR0PjESOlOZ/ll3Gq1XNPbBaezNXNXg8+QxTtImtXDZ/FJi6/C
         d43Qx8kxFq0xr5PUuMAshMzzeT88MFmQUx+qNdspbPQxpxA3wf4uNSng3+jh8VKuP70d
         A4iavGMBViTJsmn7uT7lyxOYd6ZXFNgmINw+WEFKXmG0hlZsPkpnJSORmKeoCNEYTSJY
         PEz/A7lhcvO9g+K0ntRzs1Y/OWGcXmcp6jkoR5sho32LRdIY6a19usXFEoIhqMp3O92M
         3FE3YmNwNxc+fHOiQDZAEyBUZqqqDs4UXCRc7pjlvEsODe7FrQFMRbOKVU3/4958i+rn
         VtQA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780412692; x=1781017492; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JIOyv1iPBE2H3Q2dpbPMzEa9V8pZVYeTaHwRqxiEo4w=;
        b=Pw1EqO4N2d9UPRiGciwyhOQ/oB8pSt/gz8Oig8u5bfTXQ9tVxTIiuX8x7AKlbhGUM3
         rYIXp4eOTSTjZNDJAH4Kwfxe9L+H27kJcCexkcEt0iuj38RLoUCIwGkq4bdH2ej4PvWg
         VDmLynCxwG37/B1uy0HCRf6Hw+oUfeA5u4gAXa5MMM5dSaY/XijvSkeW5IHXGt+2OSfc
         sXfGwgjd6oWatyLDmSZn0syzoNfkQ2dhKzDT1fj4uhc5FlHLvJikhYmHpJFHQkHoTNXR
         wKDPC/Arrc50YgL/1ncYJ+4doaY+88wjpdWgRqsvSXwdsKjlv0aukioo589H6H/K76qm
         aNAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780412692; x=1781017492;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=JIOyv1iPBE2H3Q2dpbPMzEa9V8pZVYeTaHwRqxiEo4w=;
        b=Ylfb5PhkFMx8coUdWC+I5k3RXWhi4z/IKZBkeOkwxNyib6EM7WX9Wv5LNlr2qTGdGN
         Ce+QCGOuMyndM7RVGPzlcMu9J2kMYe4jaasOW9o2a+mlUOoacDRQtdVdDRd6dGNDcaxC
         iO369GyGZs8g3gQHnfcupPeJ9fA7mrtYNgxfx2WZeODkdLa6/UElOunUXN59Qsh8hILd
         Wr8wA4BR94eplXDHPOPfrrjGDzRc4LS6K+7Kvvffs4p/89W4igvastNMiIcPWM15sAFm
         Qw0iBjSqXCsewJyJqEtEMCL+4ZUuUIEPPbEqm61vEkcwBlGk3MFpEAr4NYJbQEUleneu
         0ClA==
X-Forwarded-Encrypted: i=1; AFNElJ/3tVVRnRqFGjStNr5mUZjF+7HHPNukRrIWkqf+e0IHzn9/A02epfV9VsRJ+IGoGhftRfRujAB6laiWqA==@vger.kernel.org
X-Gm-Message-State: AOJu0YytNSaTT9Gbswk6dVJT8F1DQLCo45v+FSlhrrV69t8/2qMClcVb
	5qschar5U7whexLRhu8v8qEXn95QILRhZguXKeCuPbGVeZoVTlMZ7E9KlBic8hxkv95laNri6Q9
	Ks88O9Gr0TytLOrKzeeOeRNCHh2K4gDQ=
X-Gm-Gg: Acq92OFx9o5aBusok8jqREHDLWz24eBTFPRLSDGn4aUBiEAl35S7RJycz434BFoy4AU
	kAWqje+VDuXOCJjVCZCzzzJO49tUTYo6YOJ6+v/HjKfClIopRCiaWPR/L1BsJjvaPsXWppIhJBQ
	2OSPtqiymWnFZRd7G/YRrClMNMS0y52/x2+KnGXfPGYIU81LvVwIePsd6AIHUkaZkgzTrUXCHwN
	HEQCwXzLDVwf01kyUyBGo7p0cfQtO0CgMD7Uri6fWswvhtG8+BXI0/7W0JR17SRcQUSrT1M5mXD
	eyXkUJG+ui3mo8jDsi8=
X-Received: by 2002:a05:6512:3185:b0:5a8:8df1:61bf with SMTP id
 2adb3069b0e04-5aa74304014mr1699884e87.21.1780412692023; Tue, 02 Jun 2026
 08:04:52 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260601145158.4113-1-jmiguel.ghp@gmail.com> <5aca8129-e930-444b-a0cd-200204c3657e@sirena.org.uk>
In-Reply-To: <5aca8129-e930-444b-a0cd-200204c3657e@sirena.org.uk>
From: Geraldo Nascimento <geraldogabriel@gmail.com>
Date: Tue, 2 Jun 2026 12:04:40 -0300
X-Gm-Features: AVHnY4I9PAAbx9PloEZx-rgFw1ifV4hULZKIcC9UYN7O-cVI00QvpUI_d_5oDPI
Message-ID: <CAEsQvctDCnfA0-Ff8jhWQ+q0jUVO58HtwWLMx00RNxCapYRdTw@mail.gmail.com>
Subject: Re: [PATCH] ASoC: amd: yc: Enable internal mic on MSI Bravo 17 C7VF
To: Mark Brown <broonie@kernel.org>
Cc: =?UTF-8?B?Sm/Do28gTWlndWVs?= <jmiguel.ghp@gmail.com>, 
	Vijendar.Mukunda@amd.com, venkataprasad.potturu@amd.com, lgirdwood@gmail.com, 
	perex@perex.cz, tiwai@suse.com, linux-sound@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Jo=C3=A3o,

On Tue, Jun 2, 2026 at 10:44=E2=80=AFAM Mark Brown <broonie@kernel.org> wro=
te:
>
> On Mon, Jun 01, 2026 at 03:51:58PM +0100, Jo=C3=A3o Miguel wrote:
> > The MSI Bravo 17 C7VF routes its internal digital microphone through
> > the ACP6x. The machine driver only enables the DMIC for boards present
> > in the DMI quirk table, so on this model the internal mic is never
> > detected and no capture device is created.
>
> This doesn't apply against current code, please check and resend.

I see your patch was already applied by Mark in the original thread.

Just a reminder for your next submissions: when resending patches
please mark them clearly as [PATCH RESEND] so that it does not
confuse the maintainers.

Thanks,
Geraldo Nascimento
