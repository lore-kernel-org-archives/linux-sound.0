Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE7512C9A
	for <linux-sound@vger.kernel.org>; Wed, 24 Jan 2024 22:30:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706135451; cv=none; b=Iod2+X+KZRRe1BPGTV4AlfXUT8AoVsknqXNjr1mIsFtIB4RwG6Iky8IXfvyOSMeYHvl7I3bv3WWouNhl8kNIv0ooUMjCqcsyt2pSBRLu42YyGoSgNg+gukcxH8t9ky+sNAJYoladXjc9mLiOKs/cWH69VJAA0mzR+HUPJPTzrZI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706135451; c=relaxed/simple;
	bh=PCrHwPg2G5V7E2X4Qce8/DylK2OW7jzKtpLHD9K/e6o=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=RpXJ/hYXCbGICRAcjbcDvHsegxmbb9xPqu5RZZlBcnvihO2AigUaFswT5T2QU7g0l2t63Qs1uiwklL1jk9mFl7odlzl6Rh9sK8VPXwRYoZi71dKvZuKPpQTgbDeMAOurLXg3C+QYfuw8jU0H+hLXrTk3khAwA2AwYM/FVKT35MY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WXtWee4j; arc=none smtp.client-ip=209.85.218.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WXtWee4j"
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-a30e445602cso30027366b.0
        for <linux-sound@vger.kernel.org>; Wed, 24 Jan 2024 14:30:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1706135448; x=1706740248; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PCrHwPg2G5V7E2X4Qce8/DylK2OW7jzKtpLHD9K/e6o=;
        b=WXtWee4j4bOPP5LiQ2AYCMudcvWLtYOSnpI+6hkMEk2yApfGOKE4f6Ximm8NUfNmPV
         0djh9zMe39DaSSctQfoK2PpM6PTsKQo6kHPS/wQMpJ3ah9HwhH/h+m9ARSkiUKVTAgrI
         FIY6FTgFUkk9O2Ig+71ZT2T+fI020FLDQ4ThBFFA7wo67BN9sSgBpyhlxfocK6/TM1UG
         eHwIHvhd8WmRSMTvg8NNdeb4k5p92x6w5yuhpFh+g4MsAOsQc2fN1Ld3nISj26iSfmfW
         5q7qsq2jCYPOD8f9+FodA5QmVpUn8yHtLJUkkx3HsqZWf9o5PmH+kG3RkVDygQh1yqDC
         cqgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706135448; x=1706740248;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PCrHwPg2G5V7E2X4Qce8/DylK2OW7jzKtpLHD9K/e6o=;
        b=nwyhj2JOizjAZT7pB5Ysv+Wq+aYKaynsj93wVMgpCKipEJ/yTKJEh3ogRi9ZhD8VRr
         TRCG68BRfjJXKaCF8OGuYaN3IVyI270F/mtx2bANplYCqrGXUCa+dGIjU1R1Aq+RuLHH
         hxqikHXLBRUAxvkVfQ/BeClR4VmWFBDmTOGmRums5Aiv4zpCXa9LNMuHbNJZ3tkI10O7
         qAKUSJJsbXoh8R96Bw2ZryLnvYJDRbSc2NrX7MY6fB2R7lKsJLI/dM6CYQXLTLdeEPV/
         bHdx8l0JMR6zqvEQOl5kJuNknex+ebUjz9zV/k8bKah6CpIsMoWczTTbZ61wpUQw/ATf
         qebw==
X-Gm-Message-State: AOJu0YyarF+wV1Dd2edTh66nEAsOX7C0G6/NMIW0gSwss8OmURGW+1wV
	t4FoRVTBMZjhAJfxgFOVlyNhQZg76HIE7EirXNwqBBIS/O8gGuoc+MkJX6zveHu/fzXmU0NCA+W
	u/rT432GOqsnYWKj1ZCUeI3Ml8ws5Ksh7pluumQ==
X-Google-Smtp-Source: AGHT+IGdsLu1owlneuqVPizU9u4+SoEDlau3fgfMISZmQkmtNqJZiH9gg2dcieUYQSVJ++3zMHn1JRijWb4RPbKARz8=
X-Received: by 2002:a17:907:7897:b0:a2d:54a8:5864 with SMTP id
 ku23-20020a170907789700b00a2d54a85864mr304717ejc.31.1706135447793; Wed, 24
 Jan 2024 14:30:47 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240124165558.1876407-1-ckeepax@opensource.cirrus.com> <20240124165558.1876407-5-ckeepax@opensource.cirrus.com>
In-Reply-To: <20240124165558.1876407-5-ckeepax@opensource.cirrus.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Thu, 25 Jan 2024 00:30:11 +0200
Message-ID: <CAHp75Ve3FDPU39oMBkTVLUeUeYDUDx6eaBnikWf6Tx-JM8PujA@mail.gmail.com>
Subject: Re: [PATCH 5/7] ASoC: cs42l43: Use USEC_PER_MSEC rather than hard coding
To: Charles Keepax <ckeepax@opensource.cirrus.com>
Cc: broonie@kernel.org, lgirdwood@gmail.com, alsa-devel@alsa-project.org, 
	patches@opensource.cirrus.com, linux-sound@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jan 24, 2024 at 6:56=E2=80=AFPM Charles Keepax
<ckeepax@opensource.cirrus.com> wrote:

Commit message?

> Suggested-by: Andy Shevchenko <andy.shevchenko@gmail.com>
> Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>

Otherwise, LGTM,

Reviewed-by: Andy Shevchenko <andy.shevchenko@gmail.com>

--=20
With Best Regards,
Andy Shevchenko
