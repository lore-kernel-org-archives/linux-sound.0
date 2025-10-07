Received: from mail-ot1-f45.google.com (mail-ot1-f45.google.com [209.85.210.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BB2D2D543E
	for <linux-sound@vger.kernel.org>; Tue,  7 Oct 2025 13:54:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759845263; cv=none; b=k+5W0Cjb0T9JsqtcitOagVN4wUhTMKl1WM1yTj0yWrufz5L5afueVbTHSzRL9x40LPbIHoLxVh31hNpXeVSvoviUOUzOu+pt184OPNwepS8EEhHv3Mx3T1Ww48RLmv7oXXuuo9BUQWHt+0Ii5N9db+etS+yPLK72ocoAluCydUI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759845263; c=relaxed/simple;
	bh=vf59koAABmVbZBe/hUaFDl6E6fe91cihfXLQj2xT9e8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ESJjYTzx6rHbgWJhsNSSHuA519KUkpAgDf6C9WSY0AfmyS3A7/DMVyp1nbSM44Jt/To0bPvMQfhWIrkZaKYRJfmtMBFDXfIhl9kZQLsmcjWFUTKln5urFDR7Ymkq/2AimzqPRw5YzChFvS9aaGVu1ePPjPe7gdL+Bla7GA5kiVI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mSta4o3n; arc=none smtp.client-ip=209.85.210.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mSta4o3n"
Received: by mail-ot1-f45.google.com with SMTP id 46e09a7af769-7b7325d8fb5so3985034a34.1
        for <linux-sound@vger.kernel.org>; Tue, 07 Oct 2025 06:54:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759845261; x=1760450061; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lj5qPTUijM2gjb5NFrsVh6G3WhkeDqY9h3Myh+7WqrY=;
        b=mSta4o3ncg3ZT92kogj2S/Bmp3+TRe4fV1ztfsSNQEgDVojzaK0YtbdeZiHwrqhyKU
         1KDp2vki34xRlCRuIO/ze05p4jTwhM27kyKOL5PszEq55TYDLb7l13NE5TKeMEuiOz0u
         qTuNpJixdeTZ9muqqBIZvU0A0NmdudV0RaH4a3j0Oh1PSjM5Z6xA5wgyYanB0A8D9lLE
         dQOdvVwSJP4WIllxenyMvDZBXr+Jf4L3xbG4ReoylrP/jD3K+xYXomrxjZPYVfzz1EEC
         PAzFlOn/c+tuNTsfrqLr0+Aidas0ZRWgRQErdSsK/AFZr9w6uXZ3XD4M3/KtL5tYUBAL
         rG9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759845261; x=1760450061;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lj5qPTUijM2gjb5NFrsVh6G3WhkeDqY9h3Myh+7WqrY=;
        b=HKeIOPDkVIbFvFOLh8OrchCo+Jp5Kg6secDH3f2IMgkRDrNlhUs40gIFXdn1edH1UN
         c4DcYzhA+JHoC873w3EtdiUX540TsR4xJZfzUigwTfOtesEHqRdtK/6t+46LT0mEha+J
         vYhfKnL0/1bOo0bK2/9k3PMMWX4I0cs69P2MkubWEMi+uouPojDkb7S0FcMjK5WgeJwx
         HHkSXbdkgjsnH2wFAwr3ubei4YvKdc2ebBGvU4CC3o8XKbQUPZSYzAn4rRa0vs5BCpq/
         7SQli/A4k/j9Mq0sLnw07UWbTJz55GOmUKqRzz70aqkfA1qejLQDF2pz1Ad+tPyzNSeZ
         BBhQ==
X-Forwarded-Encrypted: i=1; AJvYcCVFxzLW0ji47IKgstAwTT3dDrwnnBOaMLkLy/vK7ngOCqLE4emJMtXvfpOE2iU7Q0LtYS4ECITmTFsupQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy5INqGrpmVLrH7iwmd6NeIhajA7XWtWfFGXO+qG3TC117El3S/
	YwC9UucHzjkPyJg8XDGSb4xioDC25L2ARkVfaozd7og5cxbzNBx15eDTixI3uEUabYEG/22U3i3
	qK2MKGRG3C5nAwfvu7p4cwtWfm2z8hSc=
X-Gm-Gg: ASbGnct6Eijb3uuETu+C9JaPH5sL/WC6KyCLjEj1HN3N+u4h4q+zNd2XBuqcjIWExy7
	6RTy7MlP8+0NUXBtE3KZl04r8I3OBN0laFNZQuRd+hnUyL1uK3fe/L3nn++l4tJMQCMniHUWYIi
	I9atieVLPo+pIVSIIY7umFNJSMDxGBCCiBMt4ax/rv1VesJ5u0vtZVIlt33TMceQGpSoAp1DSqh
	QenZ+jBk7EdaFtRgq5dj6cR+2YXn6w=
X-Google-Smtp-Source: AGHT+IH6tuzEtZI7hftSKa+QFUw1/pHTzmiLR7CoMSVsF1rPzF4p9xQJd29NPy9raZQY/6d5/tcK/ig9INj79WHU1B0=
X-Received: by 2002:a05:6830:6d1b:b0:743:9758:113c with SMTP id
 46e09a7af769-7bf77231323mr10991399a34.12.1759845261014; Tue, 07 Oct 2025
 06:54:21 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251003091304.3686-1-briansune@gmail.com> <aOTrsYllMst3oR03@opensource.cirrus.com>
 <CAN7C2SB5Re35yGYsqr14hGXde3nTKLX2Aa3ZbuJ9xuT0m07uxg@mail.gmail.com>
 <aOUDbF/i4+9PXc1j@opensource.cirrus.com> <CAN7C2SBsFQJ2qNe0HLfpG+6cuONtpChBnq6fuFkd_CGkLt2c5g@mail.gmail.com>
 <aOUSZ2pnxRfxEPi4@opensource.cirrus.com> <CAN7C2SBDC2LrWpUTe3zZakHCrmUy1nQ-WiguLQKVK1CyOPb9zw@mail.gmail.com>
 <ec917317-4240-47ff-bb9a-6f2fe9068c19@sirena.org.uk>
In-Reply-To: <ec917317-4240-47ff-bb9a-6f2fe9068c19@sirena.org.uk>
From: Sune Brian <briansune@gmail.com>
Date: Tue, 7 Oct 2025 21:54:09 +0800
X-Gm-Features: AS18NWCV5lrnrbFo_4lVDU4yxu34LvHJd-Kcg0G86bt4H5pl8RkbNJNEE2CW3GM
Message-ID: <CAN7C2SCrHwrNjYG6SG_bgGhm4Vuw6z5WeTSO0L0D=yD_GcHuSw@mail.gmail.com>
Subject: Re: [PATCH] sound/soc/codecs/wm8978: add missing BCLK divider setup
To: Mark Brown <broonie@kernel.org>
Cc: Charles Keepax <ckeepax@opensource.cirrus.com>, Liam Girdwood <lgirdwood@gmail.com>, 
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, linux-sound@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Mark Brown <broonie@kernel.org> =E6=96=BC 2025=E5=B9=B410=E6=9C=887=E6=97=
=A5 =E9=80=B1=E4=BA=8C =E4=B8=8B=E5=8D=889:48=E5=AF=AB=E9=81=93=EF=BC=9A

> Systems doing this are using a machine driver written for that specific
> machine and will know exactly which CODEC and other components they are
> dealing with.

With such idea, this is not CODEC controlled from first place to
restrict the possible configurations.
This could introduce many possible hazard, but not this patch trying
to fix from first place.

As for Charles, I will try to patch with option 2 unless it is too
tedious to do so.

I think you have two options:

1) Remove WM8978_BCLKDIV from wm8978_set_dai_clkdiv. There are no
   upstream users that I can see, so this should be fine. This
   would mean an out of tree user of snd_soc_dai_set_clkdiv would
   now get an error so they know they need to fix something.
2) Only run your dynamic BCLK code if wm8978_set_dai_clkdiv
   hasn't been called. This would mean any out of tree users of
   snd_soc_dai_set_clkdiv would have no problems everything would
   keep working as before, but at the cost of a little complexity
   in the code.
