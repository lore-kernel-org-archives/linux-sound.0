Received: from mail-qv1-f67.google.com (mail-qv1-f67.google.com [209.85.219.67])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5C4A19067C
	for <linux-sound@vger.kernel.org>; Sun, 10 May 2026 05:47:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.219.67
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778392050; cv=pass; b=Ndvx08n8tJ8bQ163fE1MrDk7iflA1lJwkbiZAbXEMXPtW2Rp55550DF5ZbyXcq5Cz314NSqkjLTfkMqSedQwicLBXJW3PdElpFQ4bW9OPYYlwCuM36P/GvvMRS/iZdv8zXya5DaNBFWjVP2Fv5p1fZopwPtrWvDVGSdreWyeIaY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778392050; c=relaxed/simple;
	bh=NlyRJhvnlDjrc8/I3HZl/0CriWkgCPSLWWeusGUqgvA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=avUL/ENwVAkZu54AyK4tL7g8aIO2ObWJ4MfJLkdeifFT/5eyHP95e92mMIY7ZM3Oy/jivwsz7vOG85kmW+e3mbTgaTLfWyMhe93Y31CO60k9Wc44Zpl/Fm0b24iVnL2KG63c+U/t1NGTmd2JM1j94OYmi8rpAsvamIwRirwRX8A=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=qKGfaxGJ; arc=pass smtp.client-ip=209.85.219.67
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="qKGfaxGJ"
Received: by mail-qv1-f67.google.com with SMTP id 6a1803df08f44-8acae26e564so33340736d6.2
        for <linux-sound@vger.kernel.org>; Sat, 09 May 2026 22:47:29 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778392049; cv=none;
        d=google.com; s=arc-20240605;
        b=EmpPfIuSlw8myTT/eXmGk4zztMyZhw5nsJz14vSpT9A2bOr1/BQ60Erjmz4ZnEopYW
         aCISiaAVYtGdEnaPU+HIAwve117eIr+FEtxHYNFikqEAzFHHBu3mfo2VP/bVaeMea5Gh
         DTk4vMTSzcUXUMtFhJ/4v+lpFIWNIrISc/isgngf+mtXRv2DlMIEoqXnrn9BltFhpEGD
         xUV68+hhvTnx00GYVtwMHxOVWK26SqL4E5gCTvjdU3S0tu7T21OAVy9G65RLlwcn/mXA
         qbh/P8LeRUZMpmG9UCMKgYUzXi075+VIYOGKlmCKMGOvpJil0XZP4nmxpYCk8S9CQ64W
         ki/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=NlyRJhvnlDjrc8/I3HZl/0CriWkgCPSLWWeusGUqgvA=;
        fh=D7MctzwHgxBLtrypVViG7VAHARC4grjTo2W1ezs1BJo=;
        b=eeWPVouqEWjZgEcvU0ZcmGcOSXNy6HdTbk9H41uf1p25ahOH4T5zFxjk9HBP0p653w
         mBXTXyUmrMA033/aD4+fytEpaEPyyheZt08edg8MSspjQipBDDFmFDULro+rZoqEYZ8S
         /nbEeZYOglUPQbmmaVb536M2e5DQvAzN+dFiYuw43uwyIjQwQsv+5t/CYmIPjj0vBixV
         iJo1t4fCZpQUb4+N2k1zjoSkYl/9A+dW/luiorEWK1z06BnUhffcxER4W/MBDgsFteVi
         hRLdFVt6Y9hytYYPJgr+7wTMQHT4Uw6ycirkSIQ7w/8dM8xUUPgYei06w93gx9+Ydha4
         1MEQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778392049; x=1778996849; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NlyRJhvnlDjrc8/I3HZl/0CriWkgCPSLWWeusGUqgvA=;
        b=qKGfaxGJbhYs0S5lEnejaL3hohYH49KKOmbLlM2TzCeRllI1GuvOi2dSQy3wS5OAUQ
         GPBJ2znnSy9KYesJDmUTxhCiOk9r1b2NAUTtcXcv5PfUCx/8oud7RnIgappmuQL9/kSe
         2QNZM2ENExnnXj7thy1qsaOVm4KuiPiO/FNgLaVVdB4eYA0QOgqJBkexVGjADSe+YP7L
         durLKqzyJuaAPPIvG3QPvOg6nc4R6tzjVeoIA9mOzY7t1iMnyzh3opAyNWgdH5F5dXSn
         vvirg36h1V8oYs6DzxLOPAMEV9/fz0I50iC8drhWwLnRe6u9x1Ie4maq2JgcqTmLSGL8
         Mx5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778392049; x=1778996849;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=NlyRJhvnlDjrc8/I3HZl/0CriWkgCPSLWWeusGUqgvA=;
        b=CMvjpNoU11UeiwSqBojKdUvvgNONiBXOG2+PexHgZm1IhjORoiXFr2BuwURLE1kEaH
         gqfmxZCpGPrZEBUfsw9Tvk0hiRtqIoTugmqVOWb2L8BJi6MBn9EHRyi2UfWH3D5f+7yc
         V83dQt31frb0clDR59AaqVCrrZ1yE1oTueWgAw8hT0gMXmf+8yEXheAZGCZqwSZ2ezWq
         C6PT1xH6Byqf5lB8ACwgY8+7UCYbC+T2aYiW9yhtAFR0Vo5BEAB/Wvwgsd4OvKoIC7ZU
         wGtLB6iSsSUjfGZ+eGb8mDmfXqVSrnvFLG6rWN0TYvxYtQ1RGLret00OX9uyPhZWyHqD
         u9Jw==
X-Gm-Message-State: AOJu0YznHAjrk5ASoUKjgVUvTuherN7CinsJGBeky+XhOhVG60CrxSTi
	cIgIwvmbyEYY+m3Ai9YpOTpYykNnak203TQLmjmlvV9wK8DGfD5Sd/po/qkn83jwhVnZ10NvH9L
	9RQFZ2vDpm+key8rA32eDCDRfkj41QvP4JQXEBfo=
X-Gm-Gg: Acq92OGw53qeEBhepkzK1K97tHE/3chi5I5oH/9nnlUIBVb4wYEI8F2P8lG/aWSrar9
	nQKRDhGuo+GPsI1vT8hJYQ1uLlnz9tyY0yT3tO89kxZfESB30vz4j2t4e/2lRD1d87BXaUXKGwU
	kMwumTewlmbobFkwCABHD2jkI5Lv0ShPVvPdluBMc5OLjJCbsb+uH0JWYNDDW8pRoVdGWK6V9Qj
	T5Yl1sJT8OEnwbe0cKcm282oh8eIBOzeJSA67wMXPvBu0U5jo3tZdaOTU5S3AtDR4UyJa4+ZxKE
	Ml6Z/Gl4WeERuD/e4lolKASHri1irIO6qzkoHDm/+hAMuleAmMQ+HRKqts1d2E2lCjOy
X-Received: by 2002:a05:6214:4a86:b0:8ba:b3b3:971 with SMTP id
 6a1803df08f44-8c1aef0ba80mr77016986d6.32.1778392048684; Sat, 09 May 2026
 22:47:28 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260510053939.564314-1-enelsonmoore@gmail.com> <20260510053939.564314-3-enelsonmoore@gmail.com>
In-Reply-To: <20260510053939.564314-3-enelsonmoore@gmail.com>
From: Ethan Nelson-Moore <enelsonmoore@gmail.com>
Date: Sat, 9 May 2026 22:47:17 -0700
X-Gm-Features: AVHnY4IBeUYn8NsHGeLm2DVNzKo78AU7QjDZBO_n8D3LQ2xwfQvtglASS8pqEw0
Message-ID: <CADkSEUi0U1oKsxZ9YmgG6wh8rc=RK37wUgq-bmA5XUn3aYSuAA@mail.gmail.com>
Subject: Re: [PATCH v2] ASoC: ti: omap3pandora: update board check to use DT compatible
To: linux-sound@vger.kernel.org, linux-omap@vger.kernel.org
Cc: Peter Ujfalusi <peter.ujfalusi@gmail.com>, Jarkko Nikula <jarkko.nikula@bitmer.com>, 
	Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, May 9, 2026 at 10:40=E2=80=AFPM Ethan Nelson-Moore
<enelsonmoore@gmail.com> wrote:
> ---
> Changes from v1: Fix mistake in commit message and remove Fixes tags -
> machine ID checks still work with DT booting if the bootloader passes
> the ID
>
> Signed-off-by: Ethan Nelson-Moore <enelsonmoore@gmail.com>
> ---

I forgot to move my changelog below the --- generated by git
format-patch. Sorry. Could whoever merges this fix that, or should I
resend this patch tomorrow?
