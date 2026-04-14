Received: from mail-lj1-f173.google.com (mail-lj1-f173.google.com [209.85.208.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54BB03E63AC
	for <linux-sound@vger.kernel.org>; Tue, 14 Apr 2026 13:22:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.173
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776172965; cv=pass; b=cUiqJXWwuEb2SzIX6PzVxEY2GjFCiGIziQYn3p8HV1Z/OM8rVPiXScyG3JwX2fym1Z4Giup9MwzzaEFyqBMjk3+iPTssygYe75HiQES1yCw0Ha3JKywjRAOSJ9CIH6HvyXmoU3JOrMWMMUeukz3uR6pjCUXnY6MSOJkR1NJJZf0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776172965; c=relaxed/simple;
	bh=SWvIA2r2vaq/SfcRSpzOMqE2rP2/EKFXRofeeTjYJ8w=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=DS17leogxWzBS1poojEdcpbssNR89MJFi4ZFMKCCuL3oBpZAQnqSalO2FJIKmNT3odpLKeZ2H9jEKHI57nxviAaCCUM+SxMZNVKQPl7ywySjmpSj2YN40W/tXnvsa44TGC59Fz7Bm5iaiADpQSMQbAimEbj49BMj9TuN3g5brpY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SMOxJV5/; arc=pass smtp.client-ip=209.85.208.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SMOxJV5/"
Received: by mail-lj1-f173.google.com with SMTP id 38308e7fff4ca-38cc8708d76so44528901fa.3
        for <linux-sound@vger.kernel.org>; Tue, 14 Apr 2026 06:22:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1776172962; cv=none;
        d=google.com; s=arc-20240605;
        b=L7PlrGPZfohKCCT4it38GTElhTTrmRGSXXyEDnISx6mAjc6ftpgCkey6JwOcTcnK9u
         Foczs5dcFsUl6OJYKeaAOIgvBFkDN+crPo131e/mSh1SgfjUw5mlqF2v/V0k4dLCz+EO
         uPIEeELvDtZzPsQMPEeRhC3mqzD/Tynr36IUspyF5hv+zK6YxlujLUC1Yx01WBT24mpP
         zQaU3QoXhtQN71ORZOzIFNpSrJPXtf8oMV3IpHJQymt0QSd7XS93pyU8TNR4EYj6wqCm
         ClX84bzVeAwqmdn2WpndD8IhwhAzCfxbKz0xP56bPU6/F/NqOjeweiGd/RvMh9hnV65T
         X9Nw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=/MCSiaVpfB7ZAykqhfSgW9zD3qZr7DmUj2mgOEXKvJw=;
        fh=aU3e24udgaQJpvtmP+/HHRfkF40zSugJFrRbux8nR38=;
        b=hQF80cPwXibl18Dw31vN84EvF4ckeh2O+A8bDth+JwcpyTzluspuxeJJtC+jeHAJ29
         b5kJEOqSPmRN+tZ+yFhi/wNvcJNa3uOkYO9rV3GkmruH59HsV0ZYKRlCaXj4r/3fN1Za
         9MUnbx0dj6P6DmHMZCroUwtMwMvz6TYNRGr4mf8qbgxjs/8BXO9wc9VZ1oA31bdo0vFR
         3dZtkInAs/pc0UC8Cz3xyCQX1Jthvp8yj4VJfyEWbFWuKiI8bF42Rj7+2zOVAGIGZhiW
         MhgxwYJEYT9QAhTh1DCJXdoafy9W/jR5wJuF2alrDmHBV/aGLjoM7F34KVtOGHttpGoz
         3rLQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776172962; x=1776777762; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/MCSiaVpfB7ZAykqhfSgW9zD3qZr7DmUj2mgOEXKvJw=;
        b=SMOxJV5/48wjHJ/JGoxnQVCN8lRDiOrmH7Jqj6OJePMZjVsjhYWqqkWn22Wzj7ynbL
         pFYuvgEWCB5oS6bdIUxWUWkiBqE8wzfI/RPrlCiFz1BmfnWAp6CDzwM1A1Mavoz3zH0F
         4STAHIyxfLYjabNt0xgb5Cn1KavGI0EqPusRZiEKjvC5PdsPoknocMnvKqPjFcZkwSpq
         Q1mXf4BouMdVKkkWSKLy+G4fr26whbcgbD+O5XuQlxhASDnCjKs2fq4CsZU1MIT1TrII
         Dqf8ZCQQV5XwVs5tR3QajqRPYeJB5htObYamI0y1kw3as1SXjije+ovEBVbwrxYoyfXe
         v1mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776172962; x=1776777762;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=/MCSiaVpfB7ZAykqhfSgW9zD3qZr7DmUj2mgOEXKvJw=;
        b=c3GanXxHPfrGAw2rHDlYrRuGRwN3dchkZv5KCJuJlObWCOig1FAPG9b/82iRWEr4jF
         OHILtd71NcNhlYkm1rmw6lTCahHqvw/907cQpnMTxTzgKwy7LrboyA6mCxkVS36CwUyq
         OS4lU3MENHBmgCAaH6ZQvrLpNqLD4vnG0ggVoYOx5tSP/LN01FVGZpSjyrDpVGQc/tcH
         +Fqm5h/gTB5fRn85qXXdL8Q1D9iJ2Za+s16b2lPtzV0WbZg8t0eF4DmeeYYrLgOV9hgy
         2q/XJqpFq3keU9P9BH3KfM6enTTD0k8KhK8LsJqP9Ir9CCQ/UYWjUQA8iHtCaXQfZYsp
         O9LQ==
X-Forwarded-Encrypted: i=1; AFNElJ+V7VMV3mZdJH/dQSIDJVN07/lE6BSBQkOlwH0EtS+6PhOAyQXc6XKwKPYvuzV6mdjN2to5hxLyNyAoew==@vger.kernel.org
X-Gm-Message-State: AOJu0YzONaS5PEzSGHm19damQNtC15iIbX4Hgvsnf4+0jKSH3Rd6ZP/Y
	o0xhQyHqRmNHYVi+NVuxFAPD7FzGagAZ9smplcRc27uLqH4EQ8sRZG1RhrjsdDXHPEcvfNXCzCC
	+bz2eAY32JtzCcCVykv8XcuIh3PZR2ZQ=
X-Gm-Gg: AeBDiet7BS2qYC8wHfyTfZ/9RKldI5uxUMzetq0rKqqAHCxqIalugXuEZqu+O/0ClfN
	4AtesZBsdin91Fzi/DGi6C/kk71yG2OlljBlQWO3celgbMYlhZerQ/xPeqd65CnVuGOt8+Lcz8a
	i+Yef54BPk7xcUjWBNdQb+IohR1odaeGfHqmEFonTMACxQyUBi0rZW5K9//dTNxhSEPsK4XljPx
	VpCH6QujqUSWRgdkRhN1giCRhrcATjLM6k+YhNfFID6Gi8/SuAMlrPOnJ0Uo0GECmadR4KXp7CF
	Vw1fEbCVqw9u+n2+wCDXuutAiOyk/l8gnnM82FsPUg==
X-Received: by 2002:a05:6512:39c5:b0:5a4:4cc:7a5e with SMTP id
 2adb3069b0e04-5a404cc7ba8mr1091703e87.14.1776172961827; Tue, 14 Apr 2026
 06:22:41 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260327121919.603768-1-padmashreess2006@gmail.com>
 <20260414034854.461661-1-padmashreess2006@gmail.com> <20260414-tentacled-mantis-of-control-cb08f3@quoll>
In-Reply-To: <20260414-tentacled-mantis-of-control-cb08f3@quoll>
From: Padmashree S S <padmashreess2006@gmail.com>
Date: Tue, 14 Apr 2026 18:52:29 +0530
X-Gm-Features: AQROBzAamjBepLaGzfepWzXv5uB5hMqT-b7vwoR6-ZTaIr6csR1cziFGQxKKLFY
Message-ID: <CAEjBr-bdNvgBWjHei4K8LLH6QjkgHXCwtmW5qGoeh_36Vy8kWA@mail.gmail.com>
Subject: Re: [PATCH v4] ASoC: dt-bindings: ti,pcm3060: add descriptions and
 rename binding
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: k.marinushkin@gmail.com, lgirdwood@gmail.com, broonie@kernel.org, 
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	linux-sound@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 14, 2026 at 12:09=E2=80=AFPM Krzysztof Kozlowski <krzk@kernel.o=
rg> wrote:
>
> On Tue, Apr 14, 2026 at 09:18:54AM +0530, Padmashree S S wrote:
> > Add description to reg property and overall binding mentioning that thi=
s
> > driver supports both I2C and SPI. Rename binding to match compatible
> > naming convention.
> >
> > Signed-off-by: Padmashree S S <padmashreess2006@gmail.com>
> > ---
> > Changes in v4:
> >   - Rename binding from pcm3060 to ti,pcm3060
> >   - Add binding description
> >   - Add description to 'reg' property
> >   - Remove unused label in example
> >
> > Changes in v3:
> >   - Remove description from 'reg' property
> > ---
> >  .../bindings/sound/{pcm3060.yaml =3D> ti,pcm3060.yaml}   | 10 +++++---=
--
>
> What v4 is that of? There is no such file.
>
> Do not attach (thread) your patchsets to some other threads (unrelated
> or older versions). This buries them deep in the mailbox and might
> interfere with applying entire sets. See also:
> https://elixir.bootlin.com/linux/v6.16-rc2/source/Documentation/process/s=
ubmitting-patches.rst#L830
>
> Best regards,
> Krzysztof
>
Thanks for pointing this out.

Since this is a DT binding patch for the same pcm3060 device, I linked
it to the previous version. However, I realize the subject changed
significantly, which made the threading confusing.

I=E2=80=99m planning to resend it as a new patch in a separate thread. Plea=
se
let me know if that works.
