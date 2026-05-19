Received: from mail-qt1-f196.google.com (mail-qt1-f196.google.com [209.85.160.196])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E5993B4E98
	for <linux-sound@vger.kernel.org>; Tue, 19 May 2026 19:13:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.196
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779218021; cv=pass; b=b1Y8bpM3n+SNHJFt6jCbgLwTYmTRUsfmIXjzK8yZBttupvXOCy7eU02TE0RYG/YsQrXhkn7DV3DexvcE1k7a4VzKnQk7veeHMWS+B/m2bGNVMr7mYduEyvgUz0BsKZjUxz5ywqKlK4P4IOtqyb15wl6ybg4x7iBYxuc9hgLKMMc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779218021; c=relaxed/simple;
	bh=TvTeZUpq26IRZS8BDum62nrvWawBVSt0lU+Pynl8zxQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=V/kSZICrFSVIwuBer/5RESg8EE7o6yORvArABFfqLdZj3MUIe6FJOSJsoh7AkLQIOJFVYTuWODu8WQQ4z0eF3yVcmAmdcL4gz7JT9q5oSlzwHLLW7jsPHvgqqr0eaI3UjjtxtDdfVVIN8bq91eb0qhG3IBO+3gaTVJt2R+Q9Pos=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Olwyl7Px; arc=pass smtp.client-ip=209.85.160.196
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Olwyl7Px"
Received: by mail-qt1-f196.google.com with SMTP id d75a77b69052e-514ae601e01so41883301cf.1
        for <linux-sound@vger.kernel.org>; Tue, 19 May 2026 12:13:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779218019; cv=none;
        d=google.com; s=arc-20240605;
        b=Iq1vdgAiP8DqA/YW366cxrTbNmpjaVvO/XZt5QKVrPV5eFEk3dP+SLlr+I7E+D3A6i
         2O7iKynCybxFNwiUD8ChQuEsvt4+88iOUrgf1f4LlLLt4JYEsjFt+6WnNNyLLwXx/XSj
         Q8Z67Ph6UfApJMX2q+mYpOHdsiBCjMni/3Ks92ZsRySyaacR0uXxQvmCekVoZBQ9wSEw
         DC9UqNe1LWM2F0OaLtV2U8FMRUnog7yEG22hZx7NOOoA+j1WqplHoMLbZo6CuXOsWEqY
         EYM2aaoTqCICipRXLW2fPDpryDLHWd4v1Yq0xqqjqAKg2VeLIm82NlUc2cVs1GlYc7RS
         dLgA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=wwdx7K8MgGQcUZ76dZ1xm1ruXQr6bDMCCuKQcB9ixn4=;
        fh=K69IKseKOp56bMSz2pv9gO3JM15Cvvua9ISiuz7cy/s=;
        b=MINosntL+gTdwTKLcLwHNWcSRN1/qQbq0YWi/sTG17cEp1EF1YUcQhVBuab6Ah4L0d
         ODhy6L434TdVbppsThr9kuLSZfVijtVaHvR8XIqApLAKdg4HuI+o48UIJ2vj2toxwbhB
         H5C0krn04tVDKvZ1Jd1+cYl1qoTzLhzaGWUjqAoPZJnpP2NyZfzmPA69Tg4334GhTAaN
         TjAb2we0wHFVxBmIYcieuQLet3Jp+o1XjBuHtHhkI99K+o1ovtzfHM79UlwzMdzfiie9
         uTBLoPZJTuZhf+FzS01Itv5rGKQuWlXT/DV8oMt71juRIuGiQ9CXlRRFkbqB9EFbvI7A
         mI6Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779218019; x=1779822819; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wwdx7K8MgGQcUZ76dZ1xm1ruXQr6bDMCCuKQcB9ixn4=;
        b=Olwyl7PxR2qlw45XALYcq4MebmMn/K5sl8yhVlzavmbI+80/HTgP9BuYJNhDiu6dEh
         xZTgSf+BtGp7btOh5i3MTYOJXX/loCgWaYu1w0QqlN9VASsMV9Od1kp/R4f+4fRd3Jpa
         urvol4bj1lsyRRk6wTWgduk8Vuh3jW+NDXJeeCkv+Qvxp7PSLAvK6hrasOgLJO/fhsUd
         RheHz18DSBC709RU2y04CTyFbSuMM2d0V5eBIwbQvfvFsGur206flgBg33/psQQ1TaQN
         red1q+t7Bo2g0YBA/IcaeoH9KiD8K6gGTubrDJ6DChTU2te4ZQrCscttJy6gw38q0JJZ
         U/9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779218019; x=1779822819;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=wwdx7K8MgGQcUZ76dZ1xm1ruXQr6bDMCCuKQcB9ixn4=;
        b=brNnzsocoB92G1ViGdOn04uXrI19G+HvVbpRmhUsTO1crZwJte2OQVX/tPhWIerjGp
         rkyuyS5NHHpMNNTJlp7x2HoL9Hn+BC2ix7B+Tj436kNdtIC5Qxfu9ud6lscedIdoaM8G
         xFXFkRkMgy1z+JjtFs9RZE0DMOI28V9k6iFPq07uXy/lQS1N7FhT8BoxVBj8Pd4ilkw2
         aX5JMOYlZXHZEh1aVqv/bbdKJkBpLjk/BbzFXYFH2t+ZVpruwQ6urJdJezNWsRFBP3Ky
         lftJAb0jxDlMByUIRnKKGwwu1fF0T8guQ9jI3Rtc12wvYA2jTkk0taYcdR2dXOb+PI+I
         gijg==
X-Gm-Message-State: AOJu0Yw2+CBNyrjGjt7BdldOKqpMi1NdK2JpzGYjOM+wRRFsKzDkGUxl
	Gjir31X1j4wcZrvhr6hO7Aeo2qgXws4+mpnsb4tuCnLCVyA98NCxgV2K5CS011DI9XpARrfJTjI
	MeJwvO5pRk+Fg+jTAT21fLQHWXivpSpI=
X-Gm-Gg: Acq92OHQNYF0e+irinGhU1HjOCE/EfzQ65PVaGGJgFWKyni9myv1cSrUg0H8UmkVPJ8
	iOvXe03qtAt9KpO9hAMMJdl9Vps3WT+mpM1MEVVQizvTuURs5Bsn0wu9xlSTx5w08EPK+xptYAs
	A+BPqF6p3vBJf2ZPbazHi18D8iKg1lG9k94nb7o3wgKYTTEfTjbKNX0yrCXuoHc1enzesbODkhq
	CEYKa4t2VXQt6L07SuPpnxxyGC93W5COMmp430g4F6LULwHO9oWwyoHUOFj4SSqiPXDAS0p3APV
	DO8A0p5YIIh7kbJGL+EqdRriDkw+RDocEjxdEvwxN5TaieIuAJC9dyVKJqgAwkv/0T1O
X-Received: by 2002:ac8:5f8b:0:b0:50d:5f34:9a with SMTP id d75a77b69052e-5165a0d064amr269060641cf.28.1779218019454;
 Tue, 19 May 2026 12:13:39 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260517023723.92731-3-enelsonmoore@gmail.com> <edc020fe-1615-4a11-b414-c6d4e8b7dd1f@sirena.org.uk>
In-Reply-To: <edc020fe-1615-4a11-b414-c6d4e8b7dd1f@sirena.org.uk>
From: Ethan Nelson-Moore <enelsonmoore@gmail.com>
Date: Tue, 19 May 2026 12:13:26 -0700
X-Gm-Features: AVHnY4L4Iup_ZVRORpZbBblYTYWsYcH1V4IpW670HVxLxn8cA33PmOn3c7pnxUA
Message-ID: <CADkSEUjhaU5FOmG4OSOnCQQXGbcPG46NBe=h3ZotA57E0MKTrw@mail.gmail.com>
Subject: Re: [PATCH v3] ASoC: ti: omap3pandora: update board check to use DT compatible
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org, linux-omap@vger.kernel.org, 
	Jarkko Nikula <jarkko.nikula@bitmer.com>, Peter Ujfalusi <peter.ujfalusi@gmail.com>, 
	Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, May 19, 2026 at 2:02=E2=80=AFAM Mark Brown <broonie@kernel.org> wro=
te:
> On Sat, May 16, 2026 at 07:37:22PM -0700, Ethan Nelson-Moore wrote:
> Please do not submit new versions of already applied patches, please
> submit incremental updates to the existing code.  Modifying existing
> commits creates problems for other users building on top of those
> commits so it's best practice to only change pubished git commits if
> absolutely essential.

Hi, Mark,

I didn't intend to do that - I resent the patch because I hadn't
gotten a response regarding whether it would be fixed up manually or I
should resend it. Next time that happens, I'll check to make sure it
wasn't applied first. Sorry for the confusion.

Ethan
