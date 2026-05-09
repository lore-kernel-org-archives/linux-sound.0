Received: from mail-qv1-f67.google.com (mail-qv1-f67.google.com [209.85.219.67])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53FAA2F9C37
	for <linux-sound@vger.kernel.org>; Sat,  9 May 2026 16:39:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.219.67
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778344757; cv=pass; b=QGd3voiFOY9E1ssS3CYQo5aR8Tq4x9I/tPHRI/HNi1sCnUJ3VGlYlEdqgH/8ITxrGMc/TElPq4s1UwmoZQSLwTOCB67Ctwz0lHTFuByaxnlgUXJpzdryBr8BGwHL5crXPlEC+78R+r8g/G8fTnpGcQ0lDFIjKvoLki0dNQ+apQs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778344757; c=relaxed/simple;
	bh=OjvQAKtsddCwvtPj5IUL1zdvC6FgIzquAG4/cEYySIc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=lH4wdjMDDnFa3NAcFtdD+Xm2baSGaiKucDBl8DvRHfjYt+mRKZMYu0zVyjQirNXDaY/3Ly3ltlANzquudi97QHkf91Cfj9rjX42tYYR05qwYh0y5V6Rm1TrfZv789IpfqK9E/4NcQnXZ3Iu+HNGLO1n3AWEXLcnF+hbucwdO000=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=O9+dmCMW; arc=pass smtp.client-ip=209.85.219.67
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="O9+dmCMW"
Received: by mail-qv1-f67.google.com with SMTP id 6a1803df08f44-8b8e98fd885so26643966d6.0
        for <linux-sound@vger.kernel.org>; Sat, 09 May 2026 09:39:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778344755; cv=none;
        d=google.com; s=arc-20240605;
        b=X9nGdk67gSq/0RwiQ1K4FvAjWOeqzD/auAVKpnEvrRkSB+g+0AZcRDFRcAZNOs2dZy
         BIf7JWi+9jSr7VP2FfD+h6rolCuLFxrS9OBhV2WO7rozjjkPZcf2R/Z/VY9hk0EsxJrL
         b1YoH28RzMaqHoPiWWsTFd3+yBnmNSs9Vtbipu/NHQ/U2O9fHOy01WWlhfpmRMmkrTLF
         9D4UZb6eyljiVyyzXyh9EMdeZ5xrErXWep8xRfX+xvpUeciXIaRyaFNsX4ZXcxnOcs83
         9v6ygflr3y0JAHr9Pc+NLlwFTwl+YyYfyYIYURLUoO1bDOfginhwWy3YqUucWthTPVL/
         XZgw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=OjvQAKtsddCwvtPj5IUL1zdvC6FgIzquAG4/cEYySIc=;
        fh=+UwY1DK9yzY+CoQljDoK9NLGRSgL04dTB/U45BDqZic=;
        b=bziWZdSC8vABLOvD6oxl/2+sPJ6f4yPeXb1PgVgNWoGEYcNt4ZrTN2cHY07AShMNik
         bNOTbmTWmiXi/yyXYHqpbpGIta/g7HensXbH+TuHVWU/vsfmlA6si2AnG/OhVGOhfhwY
         o3abzPRQ/ORhGlk8vLRp6OE0h2MAjBbJDN4a87viJNS2igB3J7tvFr0i9P17T3poKVkf
         CN5oXQCn+mHJ8BVfkK9RsdXPNA2yBXT9tUzhPTwS+dEM7y8d6xWkyhMNl2pGg/yeoUg/
         RVUtyFeRMXepNjVY2GMIYpmJJYTtKQWAfkjc8rwtHM28MykVyYs6WAn247wBN9lJ5Ldx
         rvfQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778344755; x=1778949555; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OjvQAKtsddCwvtPj5IUL1zdvC6FgIzquAG4/cEYySIc=;
        b=O9+dmCMWxa/R8950KMHl7MdFG6lJJc58j1zYIyOdxEIMPxTQB9PFckiEp6FcceQZiR
         1Ec/QMXo9OBxb65byqyfzUcFlNChgNBYfr7uwfjRb5Reiqo0D26R/WzPN8PqQ3j7y/yq
         SM01v2IBwd4Df0t0Wwdv1IP/IRatwwWSdSZ+1cM2f4tsF7K55FRN9I8VrwYS0ROHfnhc
         f+M9KR1gWxraPi3+PLL1Fk1YOanrBprJRF1E3kVPkQ21f1wkoHjcW26G7e4ms9B3QB4K
         0vCZpOgkJeRBQsExAko3KnSE2ye/1vE5ZjXT/L9hoVc/VKaoJ9CZ44//QddCQEHDdKlU
         GpBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778344755; x=1778949555;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=OjvQAKtsddCwvtPj5IUL1zdvC6FgIzquAG4/cEYySIc=;
        b=tQhhlqqKzT7G+BYloCahn9wo0x/Zar/XD8P34MIQ+v7+/zv2sfPAqBttngDC/T7B18
         7IqEs87OTvkQqUTc1K6esncnlJopQJeBOVK6kZGEXdQS6OsKXkk3QpkCC3zcaMjUPpud
         FejQSYm8MoKf1YdoAVnEzPt0p37IyFNorhcqBHPegcwiS2HaeYc6YY7whQpOksFi/ghl
         aoqDvCHaX1SFB8Wp4dKceJvA4JybM8u10rZAXoOSyYzxFKL4NpREWEzbsjEDlDNLuaV0
         CF4AdewMOZg/M0b+4BtCHNl8mQ1y8Qup6I+PS7bu3mJHlgDSSlAFufF1CbmHlpOOH8Bs
         CLsg==
X-Forwarded-Encrypted: i=1; AFNElJ/HIqrfu/vExU9I6vjMz2ouqWvQx8NIavcAXc2VcBy7uv2/VMbVXzVFoDChLTqTxWngOmpmodWtlA3Nvw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx0LTR/IT9JGCMDbSQa1/6TCXF/WLGE4220SlyptxsA79c7yt5v
	X3igDqrR/wHDaaeo3OVlGIQj9Ke6yMkeC6unEyx6hBNBF3t+2YPDkamzVlJOc6iQjdlbxY+hXkM
	FaArZLcNxoxLXYLSLozv0tMmpobXgrE3orWhRynQ=
X-Gm-Gg: Acq92OHGCJE21VQnSitaacdoREyxyKMYLlJSKD2uUpLhh0APyATzi6A6pN21zGZYFsG
	h+S1LzMy7DSl0NkBThWew6zX6trE2RhocdjT/T3DtMmhFvoI3KCJpPjqkVk8vQEiGPtwfIOlCnU
	Gh2MIzVAtYhxhLc83isTPqDx5QKI0Cftw7gXCF4i7Aab9rxH3JeYp6aj1lozY6QaFwMXpbVEOx3
	QyDewThjrbcTDdR7eLYjuj2WVFklVd6Elg8NFzsLkSUd4/pA1IrlTw6GQ2Ay916SaMsAMPXBErz
	Jg1wkCKE5f4OVIK3k4m4kQJBps0gR4j1Zz4pxpAC+nFc0p6ufBE7uO2ATzzzUGf7ZoDTz6LZav0
	3OIJkmzrslr35hw==
X-Received: by 2002:a05:6214:310c:b0:8bd:de6d:c344 with SMTP id
 6a1803df08f44-8bdde6dc669mr190711176d6.20.1778344755322; Sat, 09 May 2026
 09:39:15 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260509012247.14990-1-enelsonmoore@gmail.com> <21e1eeaf-5c8c-488e-89a5-123fc2cc7b1d@bitmer.com>
In-Reply-To: <21e1eeaf-5c8c-488e-89a5-123fc2cc7b1d@bitmer.com>
From: Ethan Nelson-Moore <enelsonmoore@gmail.com>
Date: Sat, 9 May 2026 09:39:03 -0700
X-Gm-Features: AVHnY4KwbterUhlugcW_6pZ2ileRIcVWTQ4UTQB6XTT_Ceh7o1QHPSSaCQg7jZ0
Message-ID: <CADkSEUiMKAQkRKek1fRpb=RtC99AzZm25emGbC75RzQYDct-1g@mail.gmail.com>
Subject: Re: [PATCH] sound: soc: ti: rx51: remove stale reference to machine_is_nokia_rx51()
To: Jarkko Nikula <jarkko.nikula@bitmer.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-sound@vger.kernel.org, 
	linux-omap@vger.kernel.org, Russell King <linux@armlinux.org.uk>, 
	Peter Ujfalusi <peter.ujfalusi@gmail.com>, Liam Girdwood <lgirdwood@gmail.com>, 
	Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi, Jarkko,

On Sat, May 9, 2026 at 6:07=E2=80=AFAM Jarkko Nikula <jarkko.nikula@bitmer.=
com> wrote:
> Not fully true since machine_is_nokia_rx51() still returns true on RX51
> (N900) and driver loads successfully both before and after your patch.

Thank you for testing the patch and pointing this out. I didn't know
the kernel still considered the machine ID passed by the bootloader
when booting with FDT.

> But true you may remove this test so please update the commit log and
> you may add my tested by tag:
>
> Tested-by: Jarkko Nikula <jarkko.nikula@bitmer.com>

Okay. I'll resend the patch with your tag and a fixed commit message
after the 24-hour deadline.

Ethan
