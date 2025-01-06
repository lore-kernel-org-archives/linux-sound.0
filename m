Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 338091DDC2C;
	Mon,  6 Jan 2025 13:38:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736170721; cv=none; b=r39qsEsoW+ojWnZD7Z5in2mEU2j2IJwWxN+wclhTMjGeEGTi+JpCP76brIt7DmpNreXpByMJTZ/q7GSN/Vibo8ew18RpVZsTtuW7UoIeIYG5SFQob14x2eWdQ3yR5Iq3E97/iwetm84aqnknZyPC63i85bhPsypvDfDTpaBGaQ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736170721; c=relaxed/simple;
	bh=Wu/duhkbgGlNJWz7ztxoYWw979ezogxfVeEKKcsMTTk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Va0zTJALIgzWxPga2YRAskWmrVcBlmAJ1lM1rBHw3NvV9RfyGbrZgQX201sG3ieAkEHyEjHKRw3zIWg+dT8EDEpgmKCSCfZwUrdI5LGG76qE5aCYaDRXazNuzTPGFu+Zpb4ykH0xlJ8bZ7RH+aFLSR6yKduEpuxMbnGe921yv4s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=googlemail.com; spf=pass smtp.mailfrom=googlemail.com; dkim=pass (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b=dPf72K8S; arc=none smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=googlemail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b="dPf72K8S"
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-2165cb60719so209342725ad.0;
        Mon, 06 Jan 2025 05:38:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20230601; t=1736170719; x=1736775519; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Wu/duhkbgGlNJWz7ztxoYWw979ezogxfVeEKKcsMTTk=;
        b=dPf72K8SMDjKqZAaSk4ULAqzdo27uravAFiPmRmdYJaZsndM8yWgPZMKYoA1ADZJCj
         ffl6Q+Yxm90Kvfz+8YBDUSUG+Ic2eGYs73Pj4loOcB17c9jUpfaV76imCnKspGPMvY9Q
         RiZDa+cltcv8ZbNCCH5Vx67wkGU5tvk9zOqsR1+uhqS09jnod2OG/SS0cTig5J3Q9fY6
         dooa88qdFAOqD1m//w2ED8eR+MsTmM7K7qk+T3EnTxO8pGBJ+9ott36jLBSNtBZ0GSuk
         bzVIylFIVHISCHgDolY1q8qXOz/YZCPLtt9w/SPz/sksV86GNypIYUSHpjm9wCYlKdWk
         djIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736170719; x=1736775519;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Wu/duhkbgGlNJWz7ztxoYWw979ezogxfVeEKKcsMTTk=;
        b=FpxLlTKtq0ARtSh4L20XzlP9rERc2fwTeb06EohZFMJhS92on5Hwh6l8DHrx2lckIy
         Gr2L0YqBc5ecmc92DIJVLhMI1fNjJOMOgS00nhSLoDDtQ42Z6BSrWkrFAQAn7USpTEsq
         9x3CIck2+LySGLx4jI84vQK1/2rkBHCEYx9LoobBYrNbqdZJd8RgtcSXJ3l4Bqe0iJD3
         AEWgdOBk9UaCvivcY1M6yNlpzwJ0roF0aca4rhMIm5KoXnCGy+4rGGNgnX2wPP54GAaM
         7BQnFqQoj6Tb0TESvlVfa9ZqJ1uXv9SCTZXPSmnOSQgYIC/krZbT0B4rTHQ1+2Ay5MfL
         wOGQ==
X-Forwarded-Encrypted: i=1; AJvYcCW6wLW6MxXqHAxS22MmNOoeI02ZGiWe6PbIuDjaOiyRztzcwPTt7y/Gy05NE+6C5k6TbciPuphcPKXa+hs=@vger.kernel.org, AJvYcCXqVAkBz9N9cX3G2CjigrFv8/KiYJVvL3fkoIymJTE3e4YnoFK+k5kByrVFDXFegjNkAglvyKIWG59PzuU=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy6S7xaMpCfV8pV6q055gRYap5oIzRnSChWGyqMwgG6nwvejivD
	ZxkM3q5JboOhpRnVtjzmFBOIK/VKa7qKGGHdltU3LnaGRKkDaSIwxopC9SDBOUNxks1wHHtTZ/2
	m+4Blpr11PkDGp+pXH3m22cbCygA=
X-Gm-Gg: ASbGncsnVKBTy5rwRNY3eFuvyv5L1o5JasiIIQstRZ43Tejr3rs+geU9o5IEBCHiDSF
	xUDGI8Skt/TU/JOKpNHaqZSDZuGyOwOdwa3i+gbKGmBJIa+kzsyN9
X-Google-Smtp-Source: AGHT+IHCpyL2RoYltN/Son8caT8kY8aAmajpToxCZK8DLZGGKoPJGKURhGVgsvMDpcmla3l7r6gwPZ0/44HMzZ5UWKg=
X-Received: by 2002:a17:903:98e:b0:215:9bc2:42ec with SMTP id
 d9443c01a7336-219e6f24eecmr837678925ad.47.1736170719510; Mon, 06 Jan 2025
 05:38:39 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAFBinCDdiJ3UNVUcShjq=7U2=oUwT3ciYdKSuZ5TdcrikxFBpg@mail.gmail.com>
 <1ja5c4b4rt.fsf@starbuckisacylon.baylibre.com> <CAFBinCCAAZHqrKHyfwHPqk9Ki9nDeGFFQfj34ZF58wj+6AjH-g@mail.gmail.com>
 <1j4j2caxds.fsf@starbuckisacylon.baylibre.com>
In-Reply-To: <1j4j2caxds.fsf@starbuckisacylon.baylibre.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Mon, 6 Jan 2025 14:38:28 +0100
Message-ID: <CAFBinCA2pz+ZeWr2hA-QRwZ5gC70qp=2iqemX5MpyM75cAbJwg@mail.gmail.com>
Subject: Re: meson-aiu: HDMI codec .prepare() callback not called
To: Jerome Brunet <jbrunet@baylibre.com>
Cc: linux-amlogic@lists.infradead.org, linux-sound@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	dmitry.baryshkov@linaro.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Jerome,

On Mon, Jan 6, 2025 at 2:24=E2=80=AFPM Jerome Brunet <jbrunet@baylibre.com>=
 wrote:
>
> On Mon 06 Jan 2025 at 13:49, Martin Blumenstingl <martin.blumenstingl@goo=
glemail.com> wrote:
>
> > Hi Jerome,
> >
> > On Mon, Jan 6, 2025 at 11:44=E2=80=AFAM Jerome Brunet <jbrunet@baylibre=
.com> wrote:
> > [...]
> >> > I have further verified that the gx-card parsing does find the HDMi
> >> > controller and links it correctly.
> >> > To me it's odd that only the .prepare() callback is not called, all
> >> > others (as mentioned above: .hw_params, .startup, ...) are working
> >> > fine.
> >>
> >> I think the problem you are seeing comes from the quirk of
> >> codec-to-codec links. The hdmi codec link is such a link on Amlogic
> >> because further digital routing is required after the backend.
> >>
> >> Those type of links are not used much beside some
> >> CPU offloading on Samsung and Amlogic, as far as I know.
> >> It is possible, even likely, that things are still missing there.
> >>
> >> So those C2C links are operated by the DAPM events, not the regualar
> >> ASoC code. You can start here:
> >> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tre=
e/sound/soc/soc-dapm.c#n3995
> > Thank you - that is indeed the root cause!
> >
> >> You'll see that .prepare() is not called, same as .trigger()
> >> That should propably be fixed :/
> > Since I'm still very much clueless about all of this I just came up
> > with an experimental patch. Any feedback on it is welcome (I can send
> > it as RFC patch - but prepare for me needing support).
>
> It is probably a good idea to send it to get more feedback, yes.
Sure, I'll do that later and keep you Cc'ed.

> > With the attached patch I now see hdmi-codec's .prepare callback being =
called:
>
> Looks like a good start :)
>
> Couples of nitpicks:
>
> You might want to check the stream validity in
> the function you've introduced, like in soc_dai_trigger()
snd_soc_dai_hw_params() doesn't check it either but snd_soc_dai_startup() d=
oes.

> It may also be nice to update snd_soc_pcm_dai_prepare() with the
> introduced function.
Ah, this one is also checking for substream validity. That explains
your previous suggestion :-)


Best regards,
Martin
