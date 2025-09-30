Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21F40246348
	for <linux-sound@vger.kernel.org>; Tue, 30 Sep 2025 07:08:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759216123; cv=none; b=UwQ66iZ4ev5W3oGM5g1iY3bPINVAzjIkcnsUzsS+jDZi2QDaKalygWELmspRZ7A4EKwyeW0qYWv4TKfU1yzq+HcHLTdZAB4Otgd7swpjGXFfhSygug4l7QHceAvtIERZ26ombN9FgXg7KzGW/iqKKB+mKzUkC1HROf2UZoo/0To=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759216123; c=relaxed/simple;
	bh=qWQPUUkCkkV19zNqrK2WGTgoeDTRNbYXHAJ/vA9PTP0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=n9td2pm+V1P+64yBXhac+XakkLqgUOc41wSb4D/v8egNBNA1NvXLNdXIevQWBhk3QZWOtgTze1nvVXUjuJYZWzNJ3EJW8PbdiUqnNsqOfXvm0XQLYUXwfW4FdVQ2Vyf70EQSBvrGf/d3EgBC+bkoDRsPY8GoDyDSWFFScMuA24w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=fRkfoK5V; arc=none smtp.client-ip=209.85.167.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="fRkfoK5V"
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-57bf912cbf6so6323309e87.3
        for <linux-sound@vger.kernel.org>; Tue, 30 Sep 2025 00:08:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1759216119; x=1759820919; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uwe+uVVGDXkZSpUyoeD3Xi/i6aYh8K/CqmdbPD2pAxw=;
        b=fRkfoK5VoJp4UP9RnZqEqMpiy7SfeKib5tBwwPDGVLaY7mmxWKRcgTyHXWqrg8WQ2X
         +ubIkcZLy/h0pgIgt/oF2mXuhxoWyiq534BIy19nfgh9BsWIUVC+wDVFIsEGNbhZMlvs
         /KZ+4V9GWdaoR2pIwx2Vi26hK8wtMXFQkoMUHAx4dY9jRNRkc20n/kn+R9KE1ClTSJ7K
         +ArRD6Q2LFYx7631lMZ9Q8a73r4A90Sy4CK6FswGblIgdK6Vb1avr3nOB8Iqvh/c12fQ
         6rq13OJgt3Gm1wuX2sk5aGvlZWzLC51JvNJWSafVOAQgKEAojjdLiSlLyt3x0wh13W5H
         XOJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759216119; x=1759820919;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uwe+uVVGDXkZSpUyoeD3Xi/i6aYh8K/CqmdbPD2pAxw=;
        b=bfFS3wXvz5ohjOKqtuUD9nWTl33sOEb214zp12L2qDfUGe/MExa8/49eNvUBN5Oo8o
         JTh6Z3Q5XD0e0JyuPdUoP58iauXF7sS4gt/CiOjS9IcRsXDpBhrxYcUZ9ZAN/YOA/Vtm
         gDGo1Exq/Wv7DuGAqS8sccmbd5DHVeiHNv3nEru5//GsWIg6I9YWPC4im1RNcoOkOS6U
         54LapR0Y3jFHK9TUvDf6o3nuKoqZEdb54140wcf5ER+x3uCrHk6zQR+zoYZqd6tvWzmx
         g7/ALy5SmL/MMGgR8O3DMsewERE8dbZddCHPI/HZcSE742EuBtEIOgW+wfk7TLMvSJrJ
         Mcww==
X-Forwarded-Encrypted: i=1; AJvYcCUhta5UGNYAd214X/D+eqwHkJ3J/jtGjAWuImp5MoXuUylD0qtHDNBru4AicMugaHPfvYP8Jq8y6Sfn2g==@vger.kernel.org
X-Gm-Message-State: AOJu0YydhM2IorgXoU3YHFP0x73V+sh9rY5svMr0xZJT9vjxA6bSKl//
	z800c3WHBKhYjdZmuQIdJOECGH9vCMoKn/W2t72FSJY7nVNC2I1ldMpwXbf8B7Jo3g3RGcK+6DX
	FRYzH2m/S2DDS0saTbKjloD3LRZJAdjj91VPQdT3/Fw==
X-Gm-Gg: ASbGnctLdS4wmC/SyeTlLmCtRX2ZpI1PZJbfrmb5oSS0tcgV1c7wbu1auC0QxmaYCpP
	LyxW5I1VmdWZIHbX8Hsh0sMcVXxSDjH8M3RNxQY2Jj6Vcz2k86CNGwG6hLhP8O8jZnJ2XSLziVG
	lz1vvPhuzJOCo+XjXQnBzrmaTWhFnNI2Cqp29mfpY5k/S27+fo4xmTpVTLl4Sdpbue2MW8gDePM
	1LYy1reiZTvYgP6WLrr6BEooeF/ONUuGSmi5avI8Wjp9PdYgdw3LBKXzRgI4tpOh+KYRaPHgNQ=
X-Google-Smtp-Source: AGHT+IEn57+ZfFiQKbnwjnObh+24OGeSBpRxA1r0P3grMEzlyYxifukqiainmfdrIL7O0642sRpYNy5aojA3GcSdeKU=
X-Received: by 2002:a05:6512:2249:b0:571:8fad:ecee with SMTP id
 2adb3069b0e04-582d12ff836mr5326325e87.21.1759216119310; Tue, 30 Sep 2025
 00:08:39 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250929155053.400342-1-marco.crivellari@suse.com> <aNq6pObNPCihWON4@finisterre.sirena.org.uk>
In-Reply-To: <aNq6pObNPCihWON4@finisterre.sirena.org.uk>
From: Marco Crivellari <marco.crivellari@suse.com>
Date: Tue, 30 Sep 2025 09:08:27 +0200
X-Gm-Features: AS18NWCtgfS6naUd5qaJZRE6qoUqnuVcPTzv2MtJ9EdtIxWfiNalcErVrgI-DOQ
Message-ID: <CAAofZF69Lcuv9hL29eNKVAYAqsOWdeAd=2_4PXocTd0rX-11cA@mail.gmail.com>
Subject: Re: [PATCH v2 0/1] ASoC: change system_wq with system_dfl_wq
To: Mark Brown <broonie@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-sound@vger.kernel.org, 
	Tejun Heo <tj@kernel.org>, Lai Jiangshan <jiangshanlai@gmail.com>, 
	Frederic Weisbecker <frederic@kernel.org>, Sebastian Andrzej Siewior <bigeasy@linutronix.de>, 
	Michal Hocko <mhocko@suse.com>, Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>, 
	Takashi Iwai <tiwai@suse.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 29, 2025 at 6:58=E2=80=AFPM Mark Brown <broonie@kernel.org> wro=
te:
> Please don't send cover letters for single patches, if there is anything
> that needs saying put it in the changelog of the patch or after the ---
> if it's administrative stuff.  This reduces mail volume and ensures that
> any important information is recorded in the changelog rather than being
> lost.

Ok Mark, thank you. The changelog already contains all the information.

Noted for the next time.

--=20

Marco Crivellari

L3 Support Engineer, Technology & Product
