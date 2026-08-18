Received: from mail-vk1-f172.google.com (mail-vk1-f172.google.com [209.85.221.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45F813BBFD3
	for <linux-sound@vger.kernel.org>; Tue, 18 Aug 2026 03:53:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.172
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787025206; cv=pass; b=J7bcTT4D8zjlFz2kv28q5P4iHhBEzBHbgRxcXxzl5Nhc0BMtqznfKpD4risHwV9yqu29gmpNIlspNpRCIbatkKzaw7KmhKjiCQsaxP0opsALaTvtXb7ZVp0CNG0zzzXu4XTtCO5Lgs77F2JhoHKdlIdnHWfr2UsV3jG1Ncm/PeU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787025206; c=relaxed/simple;
	bh=5ApQF9JGXuOrNcA/CKAIzYTXIKz43S7YMUFq1W9icjA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=gLTSboIc09NT7gp07hkwOBq6hH7HUfEPD5COfo4dyHZv1ICL2xAOcbGqjYgOnAXUZwERiFSqAks6gJPYlMSIIufGJObiFnOTtn8noasF/+UQs2UCWczkVfHtCAfZ/9uqZLMTEHsW7XqlnysCYjUMz1IEjhuufCopBdRJV5sQkm4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZJyVmKLz; arc=pass smtp.client-ip=209.85.221.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZJyVmKLz"
Received: by mail-vk1-f172.google.com with SMTP id 71dfb90a1353d-59b074ec7ceso1926814e0c.1
        for <linux-sound@vger.kernel.org>; Mon, 17 Aug 2026 20:53:25 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787025204; cv=none;
        d=google.com; s=arc-20260327;
        b=M0jfOY4n0Y8xafpWZN4Ti8inP6gOZjgwhVS9shhrJ4np6RLOC1HaSk2gVAyRikIC0G
         HL0BaN7wKMdoVT1KyM21ccdOzpzaveFRCJ80AFmU9ROGzJ4erNNJtWzAIt5pOeaS4Qzm
         uoAg1s8CxSO1KX7ZDt4FgVpFX3QuKI+C6NE/uahpH0zZNXk3wzF4lkWJNva1bPsq22Bo
         jpTuCxkP65ZHaM2YIFn8NUcrF0Bf2NXqgm7+noupe7jxMQIOTC6s0wIm2sE3HXyR58R4
         P06r/9tmBUjrFgmPVggH7Ajt56uaWP902xNvaTCQ5xsZshwe//o9w4qClwjDpdWz+2rF
         og8g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=fPwvmJivLge6Jlihesal6lvx4jWAEz2HrZedh/JNwd0=;
        fh=cpvKgDpEYafozIoQOdGQkbUJFIp5cKePpuua+/JoidI=;
        b=N3GWGwkh4caAQFW9ygCy5JCeYeGk3CmtkMQu8Aj7b7fQPiqvCaZHupNIkyrmSFfnnx
         vxA05bbUxNax0hbquxFJsh1DcTyS8U/5q6WKXA0FCvp6NOzEhmI28AJC4A5SO4ZJhMdK
         sI91MwdrpojrF6dHhd6r2OVljhbgLtIHdR6X0+uTV35YcrUgR3Z121NOn3qF+jxKJvtZ
         e0gmJbEx4IUh0RhHPn/BnKD7PDW6ah18DU3uXTR41+RCSfyyfjpg5HaBjPC20w2l12ot
         Ifb/zhamwXGbdfDDMUSwPbkn7pUSr2nXVQlyB76mU9d0UhCKsoeem3nr5AtvWs6v3GBV
         YnuA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787025204; x=1787630004; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=fPwvmJivLge6Jlihesal6lvx4jWAEz2HrZedh/JNwd0=;
        b=ZJyVmKLzmL+igr4KYcuzXgkSepowC2u7/ElMs+EVH2w0SXeBObMQeET5GTp4wFQTLR
         jpnxLhzBdBGyZbGwzzcPjst/UhG15UjD92zzDlK3+A/XaTnAqb3ZHSDTEcTad0ofNRRm
         GPuE+yZdi1kHkSIDHKcPvbFZLL8fqeurnLv3DFaTo+ZlGbgnuBVlZB5AsWfoED6n4mRI
         SrPZduTXaae8Drmh8eL8riqj2vknHOTEyy9j8u2i1tvjoN+QFFPVECztxTNfAqJoVBmn
         JGuAII9nW8ePuZbykRCrRVi/kT5GDc+pDw8GakOmDt7GZXh+Ft+EOnjUJQZOqmA3Nc76
         E2qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787025204; x=1787630004;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fPwvmJivLge6Jlihesal6lvx4jWAEz2HrZedh/JNwd0=;
        b=ko341p9BKlvFQKXfcikKs/I4D4r04HTlJT+bTWM5rsSgMURj3+Rc9HV2Wj8UuwIODU
         US9FUrLOzgzHK7rZM2lwlE6r4IaPFJuqJ5Eyxudw3+mmvjNF73x0tVyKXaagfupLCGkF
         mv+V0fcH+88qFFi0sajqOeMRhbBhtH0hd6A4kFm7Zr30IfhGVf8eMZgIkYZxAYsJtgtt
         nxWCyd8ZUG2+e3D7Ui+4WfNaLKfxtjTpAi1OkXbD/6QQUVBTsZF/LU/J/y5ECRyca25J
         lSwFqktx8xtHd09CUsPtPnBmod6WnIrB88iz/29nGjAEQSe8HV4qRqSVTSdk0e/S+QKK
         SuuA==
X-Forwarded-Encrypted: i=1; AHgh+Rqz5/jVVyniA11hi5Q343p1+Egmu06mr71h3Z3goqR/i3pUDzJbn7tDfKkziIDbU/9OlAfVqxraWCOspA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxllcAsrymu4HXUYI8d/7JqcQeTCvME6+um/2tK/0C30+n6yvIA
	wgFHCf0Lj2lB/5mT6UarfUffaMqN8BXbD0HMKLsFNWKDc8CCkILbjyA61MWlpawdWLuLQWDnlyV
	mgW1Adm9x5EBw/fB+i4JtvI9jqbEe8GM=
X-Gm-Gg: AR+sD110nbSfSu2b22YEFooZCS1/dT17RrDgHYXybZgWv2LQxrwHmOVtF/xUpuOnuSs
	Sbvixyhf+7RQLN/4lAZZKMWr1iDheYT3jEFGI9BLaGoVeG3jfkm3kxrY7afySODVRFoe0U/fhs1
	Drkocta34qeLAcNfRcGhI9XHfiGCORa9czWpVUjvOprS5y1JkJg3n2V7vR5e2gDTlR4nmX5L2/O
	KMgbGsFkom7kRaTJyhR9/OFaVzwb+XG/AWUgN/MnYD8mp2/TxL42mhYiM3JP1Y99jai8oaUQzyi
	QoGv+JGLqpEF31rOSoNQ0kCiohrMR4RwuTGReIB9p0SKhpwlcGLdr7u69coQ6bZ/V5zRGBRmgMH
	REY0kVhq7j9ZQLhSCOEhPo7tmHbuLf7kG
X-Received: by 2002:a05:6123:2ca:b0:5bd:aba5:3830 with SMTP id
 71dfb90a1353d-5c5ce61aa6fmr1340864e0c.0.1787025204016; Mon, 17 Aug 2026
 20:53:24 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260815182747.8913-1-excursively@gmail.com> <c75806b8-7dd1-4cac-b4ba-e457d8aacce4@sirena.org.uk>
In-Reply-To: <c75806b8-7dd1-4cac-b4ba-e457d8aacce4@sirena.org.uk>
From: Sataporn Saijai <excursively@gmail.com>
Date: Tue, 18 Aug 2026 10:53:12 +0700
X-Gm-Features: AcwNN1Xwabfjgi992l06Eq2BNq_XN7AiJyHVt_CGY02YPANA4pTTZqmeK1F3emA
Message-ID: <CAHgGaxwrLQ3+gKSSxnOBYMYFRgcbQG9eHc6xy-i0DsKhVY7zTQ@mail.gmail.com>
Subject: Re: [PATCH] ASoC: Intel: soc-acpi-intel-ptl-match: add rt721_l3_rt1320_l3
To: Mark Brown <broonie@kernel.org>
Cc: Bard Liao <yung-chuan.liao@linux.intel.com>, 
	Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>, 
	Peter Ujfalusi <peter.ujfalusi@linux.intel.com>, linux-sound@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 17, 2026 at 10:56=E2=80=AFPM Mark Brown <broonie@kernel.org> wr=
ote:

> Will this match on other systems that have additional components, or
> more SDCA functions active?

Yes, it is loose. snd_soc_acpi_sdw_link_slaves_found() only checks
specific device IDs (like part_id, mfg_id, sdw_version, and link_id)
and ignores any other peripheral hardware.

I tested this by adding a temporary
ptl_sdw_rt721_l3_rt722_l3_rt1320_l3 entry above the
ptl_sdw_rt721_l3_rt1320_l3 entry. I kept the same kernel, only
changing the dmi-quirks.c:

  with the quirk: spk:rt721+rt1320 no errors, audio works properly.
  without the quirk: spk:rt721+rt722+rt1320 hs:rt722 mic:rt722, the
system fails at prepare with -61 and there is no audio.

This is because an entry covering all three parts would match this
machine on the ghost RT722, even though it never attaches. The failure
is silent, the card registers and aplay reports success.

I could not test the cross-link case, this machine only has link 3 populate=
d.

For the SDCA functions, I will use jack_amp_g1_dmic_endpoints for the
RT721 instead of amp only. This machine only declares the amp and the
codec driver skips the other two, so any board wiring the jack and
DMICs gets those links as well:

  rt721-sdca sdw:0:3:025d:0721:01: SDCA device function for DAI type 0
not supported, skip endpoint
  rt721-sdca sdw:0:3:025d:0721:01: SDCA device function for DAI type 2
not supported, skip endpoint

Initially, I looked into updating the match table. But then I figured
out it isn't needed, just adding the quirk is enough.

  No SoundWire machine driver found for the ACPI-reported configuration:
  link 3 mfg_id 0x025d part_id 0x0721 version 0x3
  link 3 mfg_id 0x025d part_id 0x1320 version 0x3
  Use SoundWire default machine driver with function topologies

The default machine driver builds the same configuration once the
ghost is removed, so the match entry is not required on this machine.

By the way, I noticed ptl_rt721_l0 and ptl_rt721_l3 were dropped in
7.2 (they were there in 6.18). Was that removed on purpose to use the
default machine driver? If so I will just send the DMI quirk.
