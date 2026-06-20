Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE1A5371D04
	for <linux-sound@vger.kernel.org>; Sat, 20 Jun 2026 14:31:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.214.170
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781965908; cv=pass; b=ByxaV96V6PlCJKZO+MG+KHeAjnXa+O54BRDtTmFfCNwSaaYARWk4O0B4KGoKBLrYhvDM/ARHLnLSMxX+jxrSIzxvdTZ8BlfgywRgZ+mLLUriJusJW1Inz8brD6+pT9BtDqWPrgKGJKX6Jt0KEg8pqqSC3CWt+wtwSyz5ywPRAgY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781965908; c=relaxed/simple;
	bh=wuw9iRRPLEm93Drmsp59C6lLObU7hu/HqKhoKxWsquk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=qeNQMQ9Jgk63NqaymzUou74lInRzwkj88Fh9zYPEHDhwDuy0PtL1A4h2uxw8UR5OVUsVIB7jODqndZG11TjDiEj6yJXPHXLmA17hglOt0nbxui3ULe5bCy4QVu66d0adqjuj1iDdkWLte9/d0GIaGCU9BBhdLxUFVRTCNnV6q0w=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Hgpzl+hm; arc=pass smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Hgpzl+hm"
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-2c6bdb8a8bdso15636375ad.1
        for <linux-sound@vger.kernel.org>; Sat, 20 Jun 2026 07:31:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781965907; cv=none;
        d=google.com; s=arc-20240605;
        b=AfqcXUr49BJTYvDJ3Lba0a+5nCXvlVrR50HGhIzTogdzN6eSxwpc6PKcmmnaiJgAXP
         9b9n/vFrjCoRttQM3Tlayw/h2/RU6v3LXQrdozySvPb+4Mp+i7O5DX9MbIBOFtAX9BXv
         iE6iwvG1qZXzc0HJijAi/eGdEDtKcwtds8e2RqPzoDjfGBD6XLhTCOXNUfpwDWmRDQLy
         IKwfoH21re5HnQMs2Qoc/UZkZBLj9Mn3shuloGp0RffGCFVS0rOyIpbOWM+fwDnw7vAa
         MpVaW0W2FvLenkUVZ8iFhnGwwOZRSDiENNMLDUhrrJeOlES9yG5BwXEhtYPOEaGEyUma
         L2VA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=yoAOMy3f2Itr67+DkmQlpGnqzcUNVVNmM/LFKYJbM+k=;
        fh=lGOOpiC2vd2ME97UWiufgLQ4+Loa/Dax+ITCSopAPIc=;
        b=RYstdN2kQNIwqC7eGGYS1QDA5yXsYb9gSeWT7B/DTWq3rZX/hUIoK2I6SsbpwODfwo
         7D+P6YbnU7ZIhKStM39eV2sqQd/HuJaOCYvjgQFG7v4BQsE4Huee8QREwbe8BPGxtmuo
         O1UNWzpwMZT+6pbxYqLuhwLnTHUE+NKHKL+QBb29tZhhFnH9cSoJw/OJ1DvCn0cBXcvU
         /ig1oeOk1oyj4K6XPyXgDxKSjjestWzcBiq+YGI9fNx/Qs/sQSHgpw8rYn4w7KPziylO
         Qe2WGIjOiuGYG6Wr0xhAW57wNp+2Z1/qCM1U0laUt0J5eJQ96kfV0YZIaW0BtqyFPBfh
         cp/w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781965907; x=1782570707; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yoAOMy3f2Itr67+DkmQlpGnqzcUNVVNmM/LFKYJbM+k=;
        b=Hgpzl+hmkAd9PE6RkAQMcORHGDcILvPnTKjDdtKuAsFuVeH/CdHJaq+8dqUC54HKng
         nMQ2EqToqmfRaWzsZy0y1ngwOoPzbySIzTD2c8ZtHgG2hOwJW08P36E+lNGv69hVluhc
         VRMriCIMJjcc5TKyboyWczT0eyCxncPfOX7MldfU57kyLEW1WaZnT9iFJEaFzLabjGWk
         xW/SSPj/UDIk8/Q51DE88zBuI9YRvIByKY9ynqytOy4tbDMK0Rg8NQ9o6dTEUD8R9a3S
         0dMXv6bKlKjtCUGZYY8/EKUBLE95PVfZZtqUdKv67h1tVULtTepl6347kyszEQU8Sy9z
         MjUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781965907; x=1782570707;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=yoAOMy3f2Itr67+DkmQlpGnqzcUNVVNmM/LFKYJbM+k=;
        b=l4IZIJwpgNX44cZ1mIi/Ssq3aJoz9mZ5ue+GqhA/danNCtrBbtLHODA3kjz9fLebk4
         F2R+tuRISK4FTtT9phT3+rPhBd5ZcMhYKBu95zd1EuE5dTdZWrljqdUB80741gVW8kti
         F9W9RNxDNzawMI5l5wPv0jcT89sGZY124PSJ82RHYST3t/K2kQQiyjYarhSvEl4kN2J/
         kg4gv1VvlcYsaMwFVQEXVlpOffUBw52QKA0/FevFLF8HRjZ8ty/PurOcf3/8q8U84XRU
         cDYLoQk3D/CbXXEc1b0XQXhROOiGWhMfTXeXKBTvHPOMpf+QjBvM3maH5ICzPYIJ5ivk
         i4cw==
X-Forwarded-Encrypted: i=1; AFNElJ/LZW3m5WmR9vN9ZstF4i0xXgQAnHKiCrIIq/YukRuJscuGemF2Gvn6h9X+rs8LU8Rz7yLm3OdNSoBzdA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yyw7DV4snUuZU+KXoLF+qX4SE+prXJ7+/FhewAZdHdj7Ay8wpW9
	fkFNwyRhT9GUQ+kfn6O92KWij4+3i8vGqA8F5KwohXdplqV/C/S6A5l9+55l1vOt7MzUkmU27yy
	OqdqjksWaLCblx/kRMvYNJBHODBJgGtc=
X-Gm-Gg: AfdE7cm9RIILKBFskLqJGcNoYeVon2AHwI3FWdzUfFF3eEBZo5tU6bCiO322ImdiZmJ
	CmFgnMF/fw4hCbq+ufMjTNpCmvOxvZ1JhrI0DOpUXGXlZJ1Qd5e1jyTt/uBq1gnLYq1hJioq6Cb
	WXv8UEidYl7JTUUCvc8qhIyDimKI5psnh+514ufwRHW37nS4Q3nmAvtZ0wJF4icGj4cEWTDUMt3
	i9cDMMQRQODR30sjebl/x8qTWntnerS498HmkSs0d5FALaqYvWM4dRNfUSz2FqKUIJ8byFfnFkY
	zCyolm/EVuGaYztx0m3NfQGn0tMPXTCdsqocHR2U5mPtxldl6K0Vw6F7ONZCKQ==
X-Received: by 2002:a17:902:c40f:b0:2b2:4d36:7ba with SMTP id
 d9443c01a7336-2c7252a8057mr74037005ad.0.1781965906891; Sat, 20 Jun 2026
 07:31:46 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260617103235.449609-1-phucduc.bui@gmail.com>
 <20260617103235.449609-16-phucduc.bui@gmail.com> <ajJ9rbHTspXHo6Ou@opensource.cirrus.com>
 <20260617140209.3f89706c@pumpkin> <CAABR9nG+6gOj4KnWmTyykgGN93xy6jKQh+-_f8Xxn=Jkv28vBA@mail.gmail.com>
 <20260619101346.2ec49087@pumpkin> <ajUcTfG3vSGz3n3d@opensource.cirrus.com>
 <CAABR9nGRCZ1zv0cyBGc3yuM8MeFNqBB1MkGUL7bTbtC_LcKKzA@mail.gmail.com> <871pe2kcif.wl-tiwai@suse.de>
In-Reply-To: <871pe2kcif.wl-tiwai@suse.de>
From: Bui Duc Phuc <phucduc.bui@gmail.com>
Date: Sat, 20 Jun 2026 21:31:34 +0700
X-Gm-Features: AVVi8CdmzIZOlmsJ02kZGuh_kzjdhPUos4g5dG2tFnwGhCYx2Sp6G_przK0DiY8
Message-ID: <CAABR9nEdHwXpg8+6J5L9Af1PvybGt3KSfRy=LnMHXSQSHnd25w@mail.gmail.com>
Subject: Re: [PATCH 15/78] ASoC: codecs: cs42l43: Use guard() for mutex locks
To: Takashi Iwai <tiwai@suse.de>
Cc: Charles Keepax <ckeepax@opensource.cirrus.com>, 
	David Laight <david.laight.linux@gmail.com>, Mark Brown <broonie@kernel.org>, 
	Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
	Cheng-Yi Chiang <cychiang@chromium.org>, Tzung-Bi Shih <tzungbi@kernel.org>, 
	Guenter Roeck <groeck@chromium.org>, Benson Leung <bleung@chromium.org>, 
	David Rhodes <david.rhodes@cirrus.com>, Richard Fitzgerald <rf@opensource.cirrus.com>, 
	povik+lin@cutebit.org, Support Opensource <support.opensource@diasemi.com>, 
	Nick Li <nick.li@foursemi.com>, Herve Codina <herve.codina@bootlin.com>, 
	Srinivas Kandagatla <srini@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Shenghao Ding <shenghao-ding@ti.com>, Kevin Lu <kevin-lu@ti.com>, Baojun Xu <baojun.xu@ti.com>, 
	Sen Wang <sen@ti.com>, Oder Chiou <oder_chiou@realtek.com>, 
	Lars-Peter Clausen <lars@metafoo.de>, nuno.sa@analog.com, 
	Steven Eckhoff <steven.eckhoff.opensource@gmail.com>, patches@opensource.cirrus.com, 
	chrome-platform@lists.linux.dev, asahi@lists.linux.dev, 
	linux-arm-msm@vger.kernel.org, linux-sound@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jun 19, 2026 at 6:14=E2=80=AFPM Takashi Iwai <tiwai@suse.de> wrote:
>
> On Fri, 19 Jun 2026 12:57:57 +0200,
> Bui Duc Phuc wrote:
> >
> > Hi Charles, David,
> >
> >
> >
> > > > > > > I believe you have to use scoped_guard here, as there is a re=
turn
> > > > > > > from the function above, if memory serves it attempts to rele=
ase
> > > > > > > the mutex on that path despite it being above the guard.
> > > > > >
> > > > > > Indeed.
> > > > > > I believe clang will complain.
> > > > > > That makes these mechanical conversions of existing code danger=
ous churn.
> > > > > >
> > > > > > While using guard() (etc) can make it easier to ensure the lock=
 is released
> > > > > > when functions have multiple error exits, I'm not convinced it =
makes the
> > > > > > code any easier to read (other people may disagree).
> > > > >
> > > > > I built the code with both GCC and Clang and didn't see any warni=
ngs.
> > > > >
> > > > > My understanding was that the early return exits the function bef=
ore
> > > > > the guard is instantiated, so it should not affect the guard's cl=
eanup
> > > > > handling.
> > > >
> > > > When a variable is defined (and initialised) part way down a block =
the
> > > > compiler moves the definition to the top of the block but doesn't i=
nitialise
> > > > it at all, the first assignment happens where the code contains the
> > > > definition.
> > > >
> > > > However the destructor is always called at the end of the block.
> > > > So if you return from a function before the definition the destruct=
or
> > > > is called with an uninitialised argument.
> > >
> > > My understanding was exactly as your David, but it seems that isn't
> > > the whole story and indeed I had to fix a bug in our SDCA code
> > > that hit this.  However testing this out, results in some things I
> > > find very hard to explain.
> > >
> > > It seems as far as I have managed to test, the code below works
> > > fine as Phuc suggests. It does not appear to run the mutex_unlock
> > > on the error path.
> > >
> > > int function()
> > > {
> > >         if (error)
> > >                 return;
> > >
> > >         guard(mutex)(&mutex);
> > >
> > >         stuff();
> > >
> > >         return;
> > > }
> > >
> >
> > Thanks both for the clarification.
> >
> > > The situation I hit this in before that doesn't work was actually
> > > this:
> > >
> > > int function()
> > > {
> > >         if (error)
> > >                 goto error_label;
> > >
> > >         guard(mutex)(&mutex);
> > >
> > >         stuff();
> > >
> > > error_label;
> > >         return;
> > > }
> > >
> > > Which in this case it does run the mutex_unlock and NULL pointer.
> > > Will try to find sometime to look at the generated assembly, but
> > > this basically totally blows my mind. Very unclear as to if this
> > > is supposed to work this way or just does by pure luck.
> > >
> >
> > As stated in cleanup.h, mixing goto-based cleanup and scope-based
> > cleanup helpers in the same function is not expected, so I think
> > we should keep a consistent approach here.
>
> Right, and IIRC, clang would complain the mixed goto case at least
> with W=3D1.
>
>
> Takashi

Thank you all.

In fact, I have only been using GCC for building and testing. It was
only after David mentioned Clang that I decided to give it a try, and
this is actually the first time I have used it.

Also, thanks to Takashi-san for adding the W=3D1 build option. It helped
me catch and address warnings more easily.

I will send a v2 to address a few remaining goto cases that slipped through=
.
In addition, I will switch to using guards for PM runtime to reduce
indentation and improve code readability.

Best regards,
Phuc
