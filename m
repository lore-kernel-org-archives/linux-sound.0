Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18A3328504D
	for <linux-sound@vger.kernel.org>; Fri,  1 May 2026 01:15:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.50
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777598113; cv=pass; b=E3ZqqweXhWfuoJ8L+r8fuyMkwoGj7xNj8W8Kl1hk9ZMD7e4TW8ILKUYXx0eLSBW09ABCSUbBo2fjH1Mun+BypFVdUah8LYYn2RKeNRcOeZGUDB27EkQksLpIpX65jmaiSVrJ/K5QIm1zUJ80LEYMRMvCtqrHEDTcbngbLcCCV8E=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777598113; c=relaxed/simple;
	bh=hgpPYo94hdwn1yG+kirVjaUTavU5lOmf9ey6YZWV9Z4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=FLFoDcoppG7Cdx2ZT08sMqHjWyH7t5b5YWWdTqJD7zOvo6lNlCBhJvyTTJEVyg8cEHJ0dwkY2E1wItGnPDdc8OtqqM7/OdB2JUDDxClXJUzJcP0dJyXFhJGsw4IYmkJQHnE3u2e1o17zn8DiRlr4Y+rflSneA9cxaw4B6P+tDfs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=W1kE6gNP; arc=pass smtp.client-ip=209.85.167.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="W1kE6gNP"
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-5a0faa0d15cso1462232e87.0
        for <linux-sound@vger.kernel.org>; Thu, 30 Apr 2026 18:15:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1777598110; cv=none;
        d=google.com; s=arc-20240605;
        b=L+b1D3UeB4t9pZ5uI7UHHNER4HAwkt4LIYq3RvlT/tXZO/8n/6dtegX8DjDBeR7p6T
         xW+2Gf81TgvtkqKOAJRAB8zl+4kiJObkTi1qoog8kAU8pB38Ve3d23q7pdupeK7iiDT3
         d4LXjqur0SLp5x0ypTUtmQMvr4KbN38vKVTK5qIqNBPm54Qr+Cz0nWJXyX9scRD2G56M
         9X7JgtluVsKvDvSRqrJCjvGrdNjzjJ5uLlU/qsy8TYKm3BkfK+iNZjHARAILk3qh1KZW
         ETz02VXRvRHCPnzBSgrsHCifV6nIzX4d8+NL9JGCQ0T6KDumNEsKn2uBtGEAoL4c1ulq
         kGrg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=hgpPYo94hdwn1yG+kirVjaUTavU5lOmf9ey6YZWV9Z4=;
        fh=FnpWQFVe24AmBeWcGvcuYuXsDs0A8UuuXXnlcZPaWsU=;
        b=KzW4gzXgmkykZboAhjpk5thyVFU2ccjODQIa/Lncqe5yZ7jKJ/AGfxAHuPkJY/VDdq
         xuwTGn2AAdc3p9rivzil1ZFLm7TErfHfvB7ioNv3jJNCq4Fe8C5yxy7/pIdMMWDlj2JN
         srtl/9naHeE0AxIzolqYk4zuvrAsWB5MVewtRL5bc/wrKqnYoG4OSHETKanFbEOeviAx
         P1R1m5aYTH6Q4tAon5UWLexzcHOB2KN9WIxMuEt8SqqIPmYX0TvCSxNrp7jcnRuE3jaC
         pLoh3wGL8LWRmcs3jRxHnuJMQTT2JxrApnO0Z6VX+e1ckQCXILE37ArofhrPomTJy2zD
         4QJQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777598110; x=1778202910; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hgpPYo94hdwn1yG+kirVjaUTavU5lOmf9ey6YZWV9Z4=;
        b=W1kE6gNPfxldCrlmNXJIeRm8HLJD342OSQO1lH6nKgDEPFNx1SkTWX5uYeHSEV3I3P
         evcLiY70NRrNztoHbuNJthUzlZJ5gJvqXQ5C0jciSfPFNxwNGwlMxMjhUYSIOEdcIVLv
         8yIbidvU3KaoLFw+U/NvcKmmMu65rNfPKa232pJDNOxzBQUM2Jev+UcaIGskswXtCWR8
         Ve6vX3wbc34obpbl1eOwa6OQBZ+hQg63WGp5QRAvP4CPaj/mSv4roELupkProxedoRwQ
         0DfyG+826zTwXO7Ivh0JiImrTSYZobbwRpmBS7G5MEeNvPaBj+rdJ7wNN9TiQY8zuRsM
         PltQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777598110; x=1778202910;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=hgpPYo94hdwn1yG+kirVjaUTavU5lOmf9ey6YZWV9Z4=;
        b=PoPBSR+j4K0RpZaPL/LAkI2jTQdSfamVB5fMtg42nQ5zxdnsqr0yAPeRwZoi3r3xcb
         q+jmZ9z7B7ZdghmyRE1uIljIzBMM+vdiRlMfAkPXs65jcbVHLvaKdT60/Cd8luCNSkDg
         voq3xTAYtVkb6xYsJoVPfneTTwr0lc+Jn6VUdx0xZjpOB52A+uvap3TgmiQjpNI8gGxj
         NcCXDd5+9EZ76qLcWnPyMQqeiJ484UKZOOPXYDJbIdsp/zMygoO8diy1lizzRVaidkwq
         iCAAW0+73DPdv+ArcR98XLkTdh39UuIhKdA0o28Qhc4TGsZ6xZDNVFZ8iSzjg9VQyH18
         Uzuw==
X-Gm-Message-State: AOJu0YwIWWH8An00kDA23b3xtVFAkYZ8F5O2gUHK5KN3DD4EZ3u5P8qQ
	CLkp4DW1lKmB3wtXmML/ye9XYaylwRKX4eMXSeyQEoBd1JG6CPDmfSdQmF0NTgwR9steBFjtgr1
	7xaN9drXN6XjSfKXC+5uI4I74KUgO1v8=
X-Gm-Gg: AeBDiesefrRR0R6g2Bp9x8eo3KjTK4oJiikqQczzsylCZb4fSu1rRbGe0CJWS2V21Ys
	wGEgwArkYXGr6/p0kPK7Gjkp1ShNPwkiHK4cnw4YnXowxGu/fiVf/eK+Twxt/H0PvGEexHDvHX6
	clc7Op/EJuawK5KiB2rAE4Fb2+Pc90FCgbA1b/A9MpVpS+jLItRRRz97p/Cm225TGe2ZRCIKK4f
	YNbUV7QvNoEtBtfRS6HIozGnRiPYJxYOipj+XvbG2bd9vhPYqkgwPqqY6uR0fyn7EKyhbFUOite
	nfZtjkbx+SsMCjZ/qn4J014nCpo+4FpkCCR+ERbSaPRMXQeXne2LjBTUxAHOEynFk606q0+c591
	+PU7N5q0YhGfdnI4QblQXfPfdoxVNUTvEvHVlzXjQfyedb7+95zonJrxHSF4/p3IJSbOZ
X-Received: by 2002:a05:6512:3b13:b0:5a2:b90d:9bb5 with SMTP id
 2adb3069b0e04-5a8522d8199mr2150167e87.29.1777598110255; Thu, 30 Apr 2026
 18:15:10 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260430214202.58405-1-rosenp@gmail.com> <afP6ayAbxtTq6xaJ@sirena.co.uk>
In-Reply-To: <afP6ayAbxtTq6xaJ@sirena.co.uk>
From: Rosen Penev <rosenp@gmail.com>
Date: Thu, 30 Apr 2026 18:14:57 -0700
X-Gm-Features: AVHnY4KJj_PPFx_XiTlTc5dud7Z3CoLFk_oPTNDVX6T1HaAb2jGtfETjZDPhn6U
Message-ID: <CAKxU2N_FDFnp=i2Ur70jHbs1hOUMPAkWNXuuju==P8+wwfsHUA@mail.gmail.com>
Subject: Re: [PATCH] ASoC: tegra: ADMAIF: allocate with a single kzalloc
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org, Liam Girdwood <lgirdwood@gmail.com>, 
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
	Thierry Reding <thierry.reding@kernel.org>, Jonathan Hunter <jonathanh@nvidia.com>, 
	"open list:TEGRA ARCHITECTURE SUPPORT" <linux-tegra@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 30, 2026 at 5:57=E2=80=AFPM Mark Brown <broonie@kernel.org> wro=
te:
>
> On Thu, Apr 30, 2026 at 02:42:02PM -0700, Rosen Penev wrote:
> > Signed-off-by: Rosen Penev <rosenp@gmail.com>
> > ---
> > Consolidate the allocations for capture_dma_data and playback_dma_data
> > into a single kzalloc by using a flexible array member at the end of
> > the tegra_admaif struct. This reduces the number of allocations from
> > three to one, simplifies error handling, and improves memory locality.
> >
>
> Why is the changelog for this included after the --- as something to be
> removed from the commit?
Me being careless. That is, it was written after git format-patch. Will res=
end.
