Received: from mail-qv1-f47.google.com (mail-qv1-f47.google.com [209.85.219.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24FF51802CF
	for <linux-sound@vger.kernel.org>; Fri, 14 Jun 2024 16:25:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718382305; cv=none; b=q/mMqVSlX5t0MOIEPd20lTtjnEPiXcfn1MjD0HjBOm7C2LWvmETRzVyBKMtRBwvW3It+Z5EYxpWucYqeP7/JLCo8cbXZoXGSfm7/FJ1BBo38XZI1FvT/Kidy6NVTyE6S4D2F7XfWX9Jc/Hv7jidcHFdSK7Kxxe2NuRikDh66qgI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718382305; c=relaxed/simple;
	bh=QCq79d13E0tz2njJOcLY9mxviKHMKKd7mCV9RIVP2Sg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=NAcMtApCB3AAn6rw5aYRCby2+QqbSKCLhKdqeSoDpBQ1k38Bn091WTXikdeH2aHGAuuMfEzej8dvbWXtfD1jQJROraLV+mTI5jIEdXFB4b5Zd69J5LnpMJhmBgLtb8V7FXEJbIeBtAvsuuNrcWWyr9MC61x88q9WRy46d9k5j9A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=timesys.com; spf=pass smtp.mailfrom=timesys.com; dkim=pass (2048-bit key) header.d=timesys-com.20230601.gappssmtp.com header.i=@timesys-com.20230601.gappssmtp.com header.b=VyFdOtOu; arc=none smtp.client-ip=209.85.219.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=timesys.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=timesys.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=timesys-com.20230601.gappssmtp.com header.i=@timesys-com.20230601.gappssmtp.com header.b="VyFdOtOu"
Received: by mail-qv1-f47.google.com with SMTP id 6a1803df08f44-6afbf9c9bc0so14197926d6.3
        for <linux-sound@vger.kernel.org>; Fri, 14 Jun 2024 09:25:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=timesys-com.20230601.gappssmtp.com; s=20230601; t=1718382302; x=1718987102; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AJ9BKcjtQxEX9HY4AyHldVS/pYAF0bNjL6ygRqtnenQ=;
        b=VyFdOtOu7HA7/xZDSbmFbiLFOlmquoiVqCS3U2oG70jkZS43lJ1l+iq66js25wNcBo
         xX62Y5m+KNFNhILXK2xh0hmANUtaoEdRnMFvEsYEkhlvWFBXdZKTyYRKep79xo8V2hNX
         cNFDwsBOHFlTm8yFjZrzdu7+IM511w3KIqWi3Ef0+pxJ6i5Iv+ZD6fb2TJzfXbFSK3aF
         g9XlUeIsVMRGgN0RhumBCZyu+801SL5gj73Kj5n0nyTET/l3hMjuVgT5nfkNePPr1hrs
         tEU1jXCW2wpzzgnX3wJmZSDgnde2eY5IB/mSOrTzZhIAzkrQH2FIHCOfrm62lV+T5RZ6
         qhZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718382302; x=1718987102;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AJ9BKcjtQxEX9HY4AyHldVS/pYAF0bNjL6ygRqtnenQ=;
        b=ZCMi6lHxs0eob21wl852Mhjh+lTwno8TcKn1TjazjUAam14DmtKmSrRkJzqQ2B8dgu
         ZdQNCh1GO04aJt2nutBLPj3+hn1QuNGW4HxIwBIvO07lCt8kWI57eWYxCshZff+RlzSA
         xUrXuuH8hB5yq+AchpGRMToouCLTmVjnckZ277OffLySW7tKsGCg1bJzEBXpzfbmlu+2
         8v8mTFyK1GsXBX2LrjeG8Oc0XeZWXeLQhh27BDLWu16t8Qlvn4wWJi5pz9v6hgncAeaW
         gdXd1KyMAwOqxSKA97efeucBy2zPnHzXidAhj3rM9H6RHpfGzoOnw4C5ErvBHHG2Re95
         2EHA==
X-Forwarded-Encrypted: i=1; AJvYcCWNXw2cVfsL6QxSniBybj6dYtDI+AgtIbWmyPvGLAVR/JsnrszJhYaZpCZdSbni/ALYOxC8/j17c/upd+XXsg8pZa57Kz32SmdZQIU=
X-Gm-Message-State: AOJu0YxwB543zF0khck4psfPCT0t4xolZx+03Z5+/gYQCQiEr6PQER4a
	w97mK8QeBGM3l467GzLYOOtDfFwij7ZNjuS8pqF1zd4zFzZseKbzYMnSxE8s8zuj5FFLset2t3L
	Tki/cQ2DyFHBPa13i3SgHVCakdllPFsBJO38LjA==
X-Google-Smtp-Source: AGHT+IFxjsSmHmfjxcdx9LWJjlcnDzbmg6MTEjpCpU1mp7pLjF7m25ZdRpimxrXWgRWc3HiQ8GE0JCG3qf8CO/aq5Sg=
X-Received: by 2002:ad4:448e:0:b0:6b0:820c:2d50 with SMTP id
 6a1803df08f44-6b2afc722c8mr36483566d6.1.1718382302054; Fri, 14 Jun 2024
 09:25:02 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240611094810.27475-1-piotr.wojtaszczyk@timesys.com> <Zmgor8accyAiUkUO@finisterre.sirena.org.uk>
In-Reply-To: <Zmgor8accyAiUkUO@finisterre.sirena.org.uk>
From: Piotr Wojtaszczyk <piotr.wojtaszczyk@timesys.com>
Date: Fri, 14 Jun 2024 18:24:50 +0200
Message-ID: <CAG+cZ06B+AexqvwZtNP5FX50AmghAFLa=1ebxmKLvMoyVJ529w@mail.gmail.com>
Subject: Re: [Patch v2 1/2] ASoC: fsl: Add i2s and pcm drivers for LPC32xx CPUs
To: Mark Brown <broonie@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Vladimir Zapolskiy <vz@mleia.com>, Russell King <linux@armlinux.org.uk>, Jaroslav Kysela <perex@perex.cz>, 
	Takashi Iwai <tiwai@suse.com>, Chancel Liu <chancel.liu@nxp.com>, Arnd Bergmann <arnd@arndb.de>, 
	Michael Ellerman <mpe@ellerman.id.au>, linux-sound@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, alsa-devel@alsa-project.org, 
	linuxppc-dev@lists.ozlabs.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 11, 2024 at 12:36=E2=80=AFPM Mark Brown <broonie@kernel.org> wr=
ote:
> > +config SND_SOC_FSL_LPC3XXX
> > +     tristate "SoC Audio for NXP LPC32XX CPUs"
> > +     depends on ARCH_LPC32XX && SND_SOC
>
> On a quick scan I can't see any architecture dependency for build,
> please add an || COMPILE_TEST for improved coverage.  As for all the
> other things enabled in this Kconfig file there is no need to explicitly
> depend on SND_SOC.
Ok. Later I will add a sound card driver to phytec3250 board which uses
arch/arm/configs/lpc32xx_defconfig config file so that the COMPILE_TEST
won't be needed.

--
Piotr Wojtaszczyk
Timesys
