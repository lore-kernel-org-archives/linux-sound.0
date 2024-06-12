Received: from mail-qv1-f45.google.com (mail-qv1-f45.google.com [209.85.219.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6F2538382
	for <linux-sound@vger.kernel.org>; Wed, 12 Jun 2024 08:06:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718179585; cv=none; b=fJ6JV01CzQ/+yo1hQBMcj/U1H0wQ5v7MLa8NREz82PN9o2vGX7fr+S7kUFPaBVc+vlKMFUT9xvbPMp5Z1cSNoR2n77ScuU7pDFKE1RGu01ir9YYMA9SilaSaj/V4ddjoTvBPbeE/ukfpR+E6JyG4DsTEFX6Ank2cxyf/qaAuEMY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718179585; c=relaxed/simple;
	bh=jU0s9gEKbGXmqfGEflzcwnbnMDxLuaH6EgnphUim8yM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=gXXlq0I/Psx5t4VejWwZUzztTu912FoRK/G4JtzvA9HZkP1/SJQj8zcTnvVem9NKAVctHnrd1nJu7nZ8cxsdp6eAczzuLh8JxUUZxcusk3GvN86vI2F98V5fz7NuIqEB5uOeSIsW4OQAl2aOwnYNLxy44rlECrbYfAdgvz0kIaM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=timesys.com; spf=pass smtp.mailfrom=timesys.com; dkim=pass (2048-bit key) header.d=timesys-com.20230601.gappssmtp.com header.i=@timesys-com.20230601.gappssmtp.com header.b=aE7ueDgd; arc=none smtp.client-ip=209.85.219.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=timesys.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=timesys.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=timesys-com.20230601.gappssmtp.com header.i=@timesys-com.20230601.gappssmtp.com header.b="aE7ueDgd"
Received: by mail-qv1-f45.google.com with SMTP id 6a1803df08f44-6ae259b1c87so5933276d6.1
        for <linux-sound@vger.kernel.org>; Wed, 12 Jun 2024 01:06:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=timesys-com.20230601.gappssmtp.com; s=20230601; t=1718179583; x=1718784383; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jU0s9gEKbGXmqfGEflzcwnbnMDxLuaH6EgnphUim8yM=;
        b=aE7ueDgd63j9DsQ5S/8r1j9nf7EPyMqv69K4YvVtXd3L8udGkjMgXHWmWsqqsOSDsu
         J8n7gJ2UhmLTtTNemmPgSxgFUVwoaywIiUURZcRICeU95rtW1u/ogVF5WAN36ttMw/I6
         6tGu7S6+BuD8PZUgnno+WvYrgq4mFtkD6tKsHMIOyb2sahAPZ8wfI8yQzRvg7YwKg7c8
         I90al8oevBCLHoemos/kzMkAkIgnk/1WOVcOEMxTeP62zEGVRSYm8JWm/UsHc4J/r8KN
         COPAputChhverY4EMy4hTG9Z+QkMGLcXJPP2TJxFXjyzPh/T5SXyaSN/4rYeo5fUdPxd
         LEkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718179583; x=1718784383;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jU0s9gEKbGXmqfGEflzcwnbnMDxLuaH6EgnphUim8yM=;
        b=LERgZNJh2/co/1DuokwgSqYiJyk0FsKN3mzQeNeRJxSAM4P6sByO3LaA/yCg2UE/Ma
         1rXgs4BWwXG22VY26iVSICrgpbBUMJu3IABVFYsvDK0SfzvyOs9H8SD/rIDULaHCKlgH
         +6iry+Hpv6+CuczAwITvmBvhDd+uZB4cz/uI2bYH4h6Ak8EkCZWulAmtRWXf4uL8+Vd2
         ovQoQNBvSDjbhxmBMJr9hGlfgCYxfhWllwnhSlm0r55dQUypoTG4lGoCSmjvQq2wW3YP
         mEgJTpCu2QUjsCCHR6uuYGOysDIxwDoQz9YduDmoO8/W8fbi8FYjn8sCfk+jQHB9rcAk
         BjBw==
X-Forwarded-Encrypted: i=1; AJvYcCW9aDOBiu5koqqpGza2ShqLO2/FY5nOqcLqjVWltE11dSdsMm34IrzwiEBByPNbaiw8hYNFeecnJr4NzEz1r+GJRYWGcRTeZr3H6SY=
X-Gm-Message-State: AOJu0YyGqddm2YrBZz76Jv6cGOIR2tn0SG6gxMxEmZnZLttuLY3TY7/B
	z/AIBLqyEbG5F0UoM3zZ8tkR/PrXIxliLG9bbHo6b8V/PzjCHirRFyzEnbTmaogN/2QHPxF+dAN
	eTSgYlsuuBWdVlT3H4WGwMqFFrWMoyo9sepHnEw==
X-Google-Smtp-Source: AGHT+IG1/F1xQpU9EkBs57YWAqg59A4uhPeAz2DU+7fqEukJUGW0HybNnc7pOII0nGwuizPlb618ysTlXm0ZvIeJ3Yo=
X-Received: by 2002:ad4:5d4d:0:b0:6ad:752d:1530 with SMTP id
 6a1803df08f44-6b08a0780damr78312956d6.27.1718179582619; Wed, 12 Jun 2024
 01:06:22 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240611094810.27475-1-piotr.wojtaszczyk@timesys.com>
 <20240611094810.27475-2-piotr.wojtaszczyk@timesys.com> <51eeec03-47da-44b5-a21e-f280d0c4b47c@kernel.org>
In-Reply-To: <51eeec03-47da-44b5-a21e-f280d0c4b47c@kernel.org>
From: Piotr Wojtaszczyk <piotr.wojtaszczyk@timesys.com>
Date: Wed, 12 Jun 2024 10:06:11 +0200
Message-ID: <CAG+cZ06EN4Uw7Cy+kwsiPzu16Kp7tsF19Oit6oN6GUcSe464JQ@mail.gmail.com>
Subject: Re: [Patch v2 2/2] ASoC: dt-bindings: lpc32xx: Add lpc32xx i2s DT binding
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Vladimir Zapolskiy <vz@mleia.com>, Russell King <linux@armlinux.org.uk>, Jaroslav Kysela <perex@perex.cz>, 
	Takashi Iwai <tiwai@suse.com>, Arnd Bergmann <arnd@arndb.de>, Chancel Liu <chancel.liu@nxp.com>, 
	Michael Ellerman <mpe@ellerman.id.au>, linux-sound@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, alsa-devel@alsa-project.org, 
	linuxppc-dev@lists.ozlabs.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 11, 2024 at 12:45=E2=80=AFPM Krzysztof Kozlowski <krzk@kernel.o=
rg> wrote:
> > Changes for v2:
> > - Added maintainers field
> > - Dropped clock-names
> > - Dropped unused unneded interrupts field
>
> Does the device has interrupts or not? This should justify decision, not
> current usage by drivers.
Yes the device has interrupts but feeding data FIFOs is handled by DMA
(amba-pl08x.c).
Should I declare interrupts despite they are not used in the compatible dri=
ver?

--=20
Piotr Wojtaszczyk
Timesys
