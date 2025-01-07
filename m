Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFF1ADF71
	for <linux-sound@vger.kernel.org>; Tue,  7 Jan 2025 05:03:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736226205; cv=none; b=q3pHpGooCwSvTLChpw97VOtMDZiYhp5ERaM38osiIyZGhyFF64skK5KNr4YolZKy1zsnVsOcHF+jQ+2d+2R58sAkhvFY/z5tRKtvK68mk52rfLa5iJ5qH5iNisKYyUe/2iFL/nKlpSipOBhBzkx1CEQSpU6d2sYYegPRceq6LoU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736226205; c=relaxed/simple;
	bh=nN0lRksmDFKZISiBGi8hRmAFVLg4YdOG1FA9q9J+JD0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=jtBD3qvR88e0LHoCoAesDvdCL4RlUb0kf96nyHJvwzsKhYuVp+GRoIelPPCcjlpzJf7fTn6HiCRYL+WnAmuWcw3HF21jJYfJSbNmXXwuKhOYUQ3MfyZqFplkf4hZ6mEDovo2eSsucEOMJ8ZvFyySyhWoQ83l8lPZtOkZE1NhVEw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=XIAliHxT; arc=none smtp.client-ip=209.85.167.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="XIAliHxT"
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-54026562221so16218216e87.1
        for <linux-sound@vger.kernel.org>; Mon, 06 Jan 2025 21:03:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1736226200; x=1736831000; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=l96aDxgtPyGtmhQmKxg5Ir9C+VzTtQ4ciP6aZGSnXTA=;
        b=XIAliHxTrEEqcbgovug+ZH3BoYLszBMsL3tfM4s6lqVqQ/a1JV+Oue8UrZQabKpZ9A
         Q7g8zD/1haYAiI1HSqWpanu+U4Gy33c5EvP420v+vTWuQTI/kopnFYTseB4J965o4cR6
         LiVQH7DVJ78mv8nP65f7ebpbX7gqSXmumEpLQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736226200; x=1736831000;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=l96aDxgtPyGtmhQmKxg5Ir9C+VzTtQ4ciP6aZGSnXTA=;
        b=vDnazB7BhqfUxvl8dZvcLNo78rIV+mxqCmLm37dk/XP31Cujt34RpTPrJkNu/jhsDX
         4LwEs9eRkMj2GkvTCoXFndWYQJiCqc/OY9aF4Zkcji4f8kng6CqNkqICQfCvFht/GyCj
         rtrYlSlOUrS4XERTJ0xeW4Mf/JG9javKZ2Xrc0uQ0kUapiBOTmJemRZP1hThUIntAw3Z
         vmRBDAKVlYnd6CyZ/WoXxxzN9Hiw27FqaFsmu9fK2RZup4amAY4egpF/ebzvyBbqMwZM
         4kMD7roDD0HzoCL5/I2Bn4B+9PFlGnNpC5nWDFVsttzc8XOqbUIbr6Dt60Ke2ee9OBGX
         KGMw==
X-Forwarded-Encrypted: i=1; AJvYcCVJ0gkSlHXzMxUuAurb2C1Rz0aQ9K6OLGWUjODe/wPYrnR40PvbTT83U9C7PyiUTAWiIGHGQaiL63ZmFw==@vger.kernel.org
X-Gm-Message-State: AOJu0YxiuuVz2kduBRAZ01u3hBrqOIIERftCpVDIrZfaXvBCALupVq83
	gIAojHHLdkSCzjo6399D/A4CDfuobUFCfUtoyYnyA5hMKjHKTS8kVliI+o/kKefbCFSg5VligI7
	N/LMTGAQMC7/tQuHl1fB2hyNgFgRCLcgDKeKf
X-Gm-Gg: ASbGnct5m6RnxmNA7DIPpWqB6jvY+uC38tQOyu0iITfDVoXz8rl6DprXXqBrA846Nv7
	3QW2c/MeiDjAdsmz70Y8A7072qungYYrlldYV+XcrL8CTEbFeXIYr7V6v5nbp/5Ny
X-Google-Smtp-Source: AGHT+IFuVqIzLmO0Yramox//ee4/O3h23KsvSyQuha2+kpZxvOtrGLzpdtD8WFdSLs2fPfAPih1M9PDh71qbUvNQtpc=
X-Received: by 2002:ac2:4c50:0:b0:542:28dc:a2b3 with SMTP id
 2adb3069b0e04-54229530148mr21627152e87.22.1736226199865; Mon, 06 Jan 2025
 21:03:19 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241203-mt8188-6359-unhardcode-dmic-v1-1-346e3e5cbe6d@collabora.com>
 <CAGXv+5EG8LbgaWc-Lp_KQc8Yf+m_4TRo8R7B0S7-rXYpnak+7g@mail.gmail.com> <f60f4242-9e4e-4846-b1f0-949daf68f6f5@notapiano>
In-Reply-To: <f60f4242-9e4e-4846-b1f0-949daf68f6f5@notapiano>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Tue, 7 Jan 2025 13:03:08 +0800
X-Gm-Features: AbW1kva84os3VCZ6M58WLraDevj5vJ7ZZRyOV-JzVdUbyuXDzp4hplu0A48ga_8
Message-ID: <CAGXv+5E5L5nNCT54O+LW6DdaWifLuA46pXcRNpSw1okGUp+JFQ@mail.gmail.com>
Subject: Re: [PATCH] ASoC: mediatek: mt8188-mt6359: Remove hardcoded dmic codec
To: =?UTF-8?B?TsOtY29sYXMgRi4gUi4gQS4gUHJhZG8=?= <nfraprado@collabora.com>
Cc: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
	Matthias Brugger <matthias.bgg@gmail.com>, Trevor Wu <trevor.wu@mediatek.com>, kernel@collabora.com, 
	linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	Fei Shao <fshao@chromium.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 7, 2025 at 1:33=E2=80=AFAM N=C3=ADcolas F. R. A. Prado
<nfraprado@collabora.com> wrote:
>
> On Thu, Dec 26, 2024 at 04:30:17PM +0800, Chen-Yu Tsai wrote:
> > Hi,
> >
> > On Wed, Dec 4, 2024 at 3:22=E2=80=AFAM N=C3=ADcolas F. R. A. Prado
> > <nfraprado@collabora.com> wrote:
> > >
> > > Remove hardcoded dmic codec from the UL_SRC dai link to avoid requiri=
ng
> > > a dmic codec to be present for the driver to probe, as not every
> > > MT8188-based platform might need a dmic codec. The codec can be assig=
ned
> > > to the dai link through the dai-link property in Devicetree on the
> > > platforms where it is needed.
> >
> > A followup question about this. The DMICs on the Chromebooks are attach=
ed
> > to the PMIC codec's input side, which then converts the signals to stan=
dard
> > I2S and passes them out to the SoC through its AIF1. So the original co=
de
> > was somewhat incorrect, though it works.
> >
> > How should we describe such a connection, given that the MediaTek sound
> > bindings aren't a full graph?
>
> What you're describing is that the hardware topology looks like this:
>
> --------------------      --------------------
> |    SoC           |      |   MT6359 PMIC    |
> |        UL_SRC BE | <--- | AIF1   AIN0_DMIC | <-- DMic
> --------------------      --------------------

Correct.

> But that the dailink definition in the machine driver had the DMic codec
> connected directly to the UL_SRC BE instead, alongside the connection to =
the
> PMIC, unlike the topology above.
>
> My understanding is that the dmic codec was added simply to allow the usa=
ge of
> the wakeup-delays. From [1] it appears that DAI connections between two c=
odecs
> are possible, though rare. So the PMIC -> DMic connection description mig=
ht be
> possible in that way, although I'm not sure it brings any benefits beside=
s
> closer resembling the hardware topology.

I suspect we would want to keep the wakeup delays though. AFAICT they aren'=
t
the same number across the board (no pun intended), but actually differ
between devices, perhaps due to differences in the actual DMIC used.

If we don't want the full description, maybe we add the wakeup delay to
the PMIC codec then?

AFAICT [1] is basically hardcoding in the dmic-codec in a different way,
so basically reverting your original patch.

ChenYu

> [1] https://www.kernel.org/doc/html/latest/sound/soc/codec-to-codec.html
>
> >
> > > No Devicetree currently relies on it so it is safe to remove without
> > > worrying about backward compatibility.
> >
> > Removing it didn't seem to cause any issues for the Chromebooks that
> > do actually have DMICs. I suspect the only difference would be that
> > the wakeup-delays no longer apply correctly.
>
> That's my guess too.
>
> Thanks,
> N=C3=ADcolas
