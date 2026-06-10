Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB24D5FDA7
	for <linux-sound@vger.kernel.org>; Wed, 10 Jun 2026 00:29:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.44
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781051364; cv=pass; b=EkT2kSc/sI1OHqjdhpkj682oS7v60k0yvIfZjbQp1WKZNlaOFd6VYhC7yOO6zfzGOIzeccaq/FM/IGfHlTF2k2LjtGoSqol1SCXtTtR+VMC04rmmzsxOMD16R0Im1tiLs15eoj0dJDaJbX3YrnLZo5yGYA/sWxCq91MzZOFdMhc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781051364; c=relaxed/simple;
	bh=zq++n8TeS+9Zc519ABbH6wxCJJwbul+UQ5LYPLmTaZE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=OUXcWeMLA2oZdUZKHw6oPpvoB6VV4Xc6sbb99vcY92ZshSSuC+uTCf66eB9bFhLsSb9eEl+g1dQXZcK/kSLunGI5UZKA4UoK5ILd50U8z2ZmVJBo92KmFhlOs3qV0A06HvRpKFNf6fydoAujCdBX0RA/SYC+HkDZFEXc0sLA/J8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GSnms140; arc=pass smtp.client-ip=209.85.208.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GSnms140"
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-69165354c87so4406331a12.3
        for <linux-sound@vger.kernel.org>; Tue, 09 Jun 2026 17:29:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781051361; cv=none;
        d=google.com; s=arc-20240605;
        b=Rr0FCsWKFf2gAUaQWPy2qJ5cFMEND4JYuCEq++3T7GZVOSY64JpZLfUbjUeCzMwxYZ
         55ch2E6aGFl8u3IQYSUGR/svYlCnvgWwZ/30WvJTma1Yvt7JYdfDqqJG+kODtzT/93kZ
         M4hW886vGEs4Sgpqljo3nZxmGQ0xxGYgEoeFgRDfxppmdt4nXk2BDdkN2cmkojOPHXqG
         7dgsz9Xu5UeQ6F+uFb2h+DxMbU5COCQmk7pjX0gia4PFyV7FUaz1/y9j1yxudtqp0kPp
         GH/i0lV/HLmg+m0W/SMuMxL+Y8Yg0cdVz+6my/dH7IuiyHWaJgNn3yezOSgtNzgOH7kd
         nViw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=zq++n8TeS+9Zc519ABbH6wxCJJwbul+UQ5LYPLmTaZE=;
        fh=BnpHl01GuIm2JwC/u2Adpv5hyElpUUspkiHIbTCeo/k=;
        b=Q2lGgYaFu4vHjy273bLrckeP54sNwtmL3N/Mg9PqS/HDFo+TkkbCPRE7AoLOG223ql
         Ruq2S2hluJIWeL5McB/iFzRmlWJWfrE85CdyC54uq7yfVKSV3T15LZAI/x2w9h3kTWtL
         t7zcPliEIC3T5Vlae3OXesAanqPbaPTO65kxfT+LY+gH2S1XCikdVJaJAjemD1xajIeM
         3UByig4n7QAPmQZqVLpw0LLGcKAjLGKgivx2Gf6R24uLMLhXFelzkXe/5vYyZmhUO3IE
         UCYMsHano5zCvGEJxzaYGfNnhXhTICnyamSih2HxsochEs1k9oFUlIODP579YMADhf54
         R75Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781051361; x=1781656161; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zq++n8TeS+9Zc519ABbH6wxCJJwbul+UQ5LYPLmTaZE=;
        b=GSnms140KnB4PECOIqlukKO1/HWVJDBjOHKk3GCYZQEEAwswqoYY4gtkPd19PmBWKe
         w2MJnF6msgQ7wp+hHtJZEb5Ee769qQwjQrnN68KBWkucsXTvL0CCZNmKYOOUkIBts3DX
         X4XWyE75Uej8YARt1ZrD/J70mXZLeJM7rfW5ZOngbp0AokjDlaTU72nA8jEoFWB9fJi9
         98wSNJVi6RrWghMZEGo3wcQ1BXtos6OBfoeH6am4RPVBg8X2SpjPWsiQDkaviglCygR1
         XojYGFRAYs3cniCixGUofg77mHifeK7BosiofduFTPigQaSaVe8ucRLz+XV4955dD4ro
         7nkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781051361; x=1781656161;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=zq++n8TeS+9Zc519ABbH6wxCJJwbul+UQ5LYPLmTaZE=;
        b=Vv+sFUG7qgblyRi+Jdb408WLMVShzSV9aFLNCi1VVsXkIDzLyMGla+CRUrAHh1hs7o
         jfTYoFKmVW9Af6s1H/wu3EZ5QfNs+ENrxeK05hEy7mw8YI/BQ0xqAskKLquDIv7RZoBk
         vS+wa1r/3ks8HCkB8xyvB5tMPA9839ra8iozEaO8D6sg/N1P4DR4XrFz0pwH7k+20cHR
         ezvzYFILuiS/Igwnhmdc+8UC1gnVUd4hciym24l3SDLHcXnAIHt/xyH2oDokB4uc/oKf
         k8esv9dKZmJU8BXdpeCN/bgc72vKvGzC7ookXpsXEAsDgLG06sDpWGDjL7ibBzDg11+H
         sAcw==
X-Gm-Message-State: AOJu0Yz6yhch3B2iBOoWYDQUDmocVEFqxiY3dXkztyxVsbkm/HOoH7wp
	bH/TeJJve1sYdSaFPhWImKkXlmXuycXIXtr1m3RN+zG2WB1nErwGYl6pUyw4LBypVWxQGq+112Y
	u4hLPY5SCIpeZD3QNC3Qlg5RtZOH4UgQ5+EPl
X-Gm-Gg: Acq92OHWS3DQ5+OebmUaOmfNvaUZu8Cz9JvcopSSzOTKIMeKxF/08Elf97XE6jeHw3l
	0qhxneqvGZOlIP+LtqigG1KOXcZHSzITTTkByPNVM5Tp1R1Zh6xNJ5gXGYaq+D8e61EXBf1bFo5
	+CsbVCr/b527Vr2ycEgs2XgEvVhIA53t721FGZeWLK9dkcGjk//c32y/Ejti8z5QX3xZjWO79BF
	99NZwKYlVTKAjCNtLHLTKht75l/XpRD5vwia/IayBCnhErGHBiR8Mit8kMBkPLQjSXngNFGyqmd
	nQSg44juFexSL96INRSQapuqwtxTZEhn7X+a/3EHrK2JeDuh5p8+/UJlWxcN/dK3TTdvw7H/D/r
	rhYPMY7B5ux7ZpJ48KLb2KLgc2rMinAQM/Cu64qGSFRyS9r1tZJQimIzqiv9Y3rgc1g11
X-Received: by 2002:a05:6402:210e:b0:68d:d511:4a9f with SMTP id
 4fb4d7f45d1cf-68fa514d599mr10709103a12.18.1781051361272; Tue, 09 Jun 2026
 17:29:21 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260609215212.28713-1-rosenp@gmail.com> <aiihFWIOxS9XjZyK@sirena.co.uk>
In-Reply-To: <aiihFWIOxS9XjZyK@sirena.co.uk>
From: Rosen Penev <rosenp@gmail.com>
Date: Tue, 9 Jun 2026 17:29:10 -0700
X-Gm-Features: AVVi8CeXHnZ48nC0iB-355qY9GxnerdjkKXmVgm30Am14UTRbOSbLWx57QWpfrI
Message-ID: <CAKxU2N-Y8kd_2iaVcuR5ypXsu4su7gOqK8zuChEp4DZ8Tj+pjw@mail.gmail.com>
Subject: Re: [PATCH] ASoC: fsl: remove Efika audio fabric driver
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org, Liam Girdwood <lgirdwood@gmail.com>, 
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
	open list <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 9, 2026 at 4:26=E2=80=AFPM Mark Brown <broonie@kernel.org> wrot=
e:
>
> On Tue, Jun 09, 2026 at 02:52:12PM -0700, Rosen Penev wrote:
> > The Efika 5K2 is an OpenFirmware-based PowerPC board from ~2006.
> > The platform code (PPC_EFIKA) and its sound driver have no in-tree
> > DTB references and the hardware is long obsolete. Remove the driver.
>
> Is this solving an actual problem, and was the DT ever distributed with
> the kernel?
No and I don't think so.

The only reason for the removal is that everything else old seems to
be getting removed.
