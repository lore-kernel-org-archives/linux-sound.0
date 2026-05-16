Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com [209.85.215.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB7261E7C23
	for <linux-sound@vger.kernel.org>; Sat, 16 May 2026 23:50:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.215.172
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778975426; cv=pass; b=Zn8zmzJs1UIq/FEVTXE/9jU42zuLCmB2DvYgK9kN6Xkf2yuIzsXa5iVRiugZRqp3K3tKlXw0N0YFwaAJtjUlGLWfyrooARzwbn/WrJlR14vkRFb7rsUvVPIl6TMah8WVLp5a6FEde4Ti1Q4UBU7wjHINtulHNN/0DkH1uYEiPyU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778975426; c=relaxed/simple;
	bh=Ls8MgqgcsH4l0RhCEuS7VvenDTm2U2W/j/zfAviF4qw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=tuviai4UNgSMUqREVmMeitHyhRpdEOJcL7go3HRT983mqFheIrpNrIfRZCTDpyU3zSfcsac5ecucEWoYD+xGJj6AJD0LOSn51XQGnS3cUlKVQwV+pufukSpeV1PiXXiZE0FxofFezdhfxbk/ChtNIJtP3zgdsA0RFJK6qC0b18U=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=blZ51ey4; arc=pass smtp.client-ip=209.85.215.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="blZ51ey4"
Received: by mail-pg1-f172.google.com with SMTP id 41be03b00d2f7-c7980c060cfso391666a12.2
        for <linux-sound@vger.kernel.org>; Sat, 16 May 2026 16:50:24 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778975424; cv=none;
        d=google.com; s=arc-20240605;
        b=K6mE6QttRR3lA80Zdo4sge0M9dlPKIRuVkPtmBXThc9qNc5P47bVgTWFI3OJGgHJ36
         k1HnfMQnMNaB9N+gQEPtilbDI4ImMjOsA5JMRdkLMYo/GSyOXX9Ia731XRERimMOK4g8
         Jey6XJou2YU6wRrnQvS7ZsOdXlIemDbF79XYiJGR9FxHkF9XUK+1U6vGSD8LxQcB/gyj
         tbtU/AMSQILgdHKG5SjTq/xdOvLiTCj2yp/StNSENmfdep3aawYkg/XlyAUQ/+b/DjA0
         A+Tkqd8B3Y60lpoxeIRA7TVX4DFB+aSNf4wBrRxR7/MgEhdZYJ9DCkyaF2xGoZklJhV0
         fhiw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=aaUVd+PrR+MWOhU16AHCI1f+AVuqzEpKha/ErWOe6+g=;
        fh=kVxfE7bAnIhm0E0Umeb4AgusPDvdG2z9bMqs0h8NKQA=;
        b=ERVZBLojaCMca/ZA+aNxJz+QEwhWn/M4hiOXU2hBQwI0Sc+OBELU9k+EWqsig6RDL+
         2QTv1nZC8SrD/PBqaiYc9t9P0QXS9sF1guFWFcuiaC4kbzynAH4RNpHq0AOtykIrmYf3
         880T9DjuitfkAfF0YNtCUqeVBwMSrHCHQxxD3o6w5i8jqr0+/cZpocXHpf1WBfMlSQEk
         RDDaEDFmOKGikrTOv9zZ/MmYGpaRVe+yJuu3uxYZaTjV1BjOhMHrIxDxOInn4TlSR9Mn
         o1faHTkhs6h22AhUEtNCVFfyrg5FZtH78K3IAxN33R7pZJx4QzNpBJzN7lRHCO3eWnbJ
         0s7g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778975424; x=1779580224; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=aaUVd+PrR+MWOhU16AHCI1f+AVuqzEpKha/ErWOe6+g=;
        b=blZ51ey41foYop8cuhUOqMwS7vc/U3NOwBEHyJoiJZiC+lWaVORHZN0QloWdgtfVTb
         D/7bKUQKeH4Jieh6LZSjWsG/i6crcoqr39WaP6J9XnqKoHL/pcY3ubCaDjqlTg3btV4W
         aNSVWu+32QpaWqHqvbWyCDBD0jL83UCqDqaHOyChRsxi6pHFPTaevQsj1mLDkSSlrr4i
         3X+B8kJ2Atrr2AN4EgtkXbuuSmRyOiz+o5hgcKnX7kldqzcYS7R8KgRVCOymmcHFzrD7
         ta2r5WHziwoTIN6bmkOtZITxz2qrQz+YOwN5gVsGF4HOEVD/6+Ad80jfBLWvqp1Yv9A5
         MyTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778975424; x=1779580224;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aaUVd+PrR+MWOhU16AHCI1f+AVuqzEpKha/ErWOe6+g=;
        b=f8qOhDL1eioHkUpk9vVPohfqmU7I4KIUtu/Asin8QiNST3a9u9tAyTqyqbHktmazAe
         mwW9qF5RCAIT5sCvXsGkfzrzP6YQwTN4PECvRXIeJZbd17J7jXcleigF7MKKzXXivq9J
         CHIRqkK9I8plZLDzHGmKVRxOw1YgL5hX8CRqEnXE7FdHUISqCi5uI2UGwlhHN2UqCph0
         m9GwwdmhZrTOTfl+H/bkNSV11IVP0mNB+YU0NCuIPbHdJLk/i0kwGWYFy7IWz2xmsZyk
         jiYdZa/sU1shS28h3N7qIVDETuDXKnAXSKorEpoy15ggpUihk2bj9y4iQl/DcppQeWMh
         Fj4A==
X-Forwarded-Encrypted: i=1; AFNElJ+xvIOnkBP1maImONGstgnPq++byj72fynv6R11DbTMu+IUNxHDDVvKdydOUcNrKE3VmJfayvLYPWRJpA==@vger.kernel.org
X-Gm-Message-State: AOJu0YzZ4+TlnhggHmMEiPd37khZsGBz4J06lODJbrnBcTx/P8ds1W4L
	KgZWbfai57cTmArMTxWLr834bgYLdTzVFl+deKRXXj5dTI6XwdKctFjj0yynSEVpQ0svjwY7ipY
	FXSFIYkHubejeQxrJ9BIiDhgZl1fr05U=
X-Gm-Gg: Acq92OH2yX3tCwh6fWzLfmQXqsVJSeclXjmhSjP0CBKT5ux8jll4enR+WkKZfEHAO+g
	sZkgzEjH6ZusNXL2yTCS3FyZGWEgIjQzWpQAHkJvDU69RbJw/eYzOU86B04SwDtrp8lcU/3TFIc
	fi0ctamqhDLw2y8Udot63dfYAHG64nVvG9U4K8zUwLrPhZoAbd+CTpxvNDmhOXybP8wy60Vgc1f
	ju6QWFsz1iTp1erZSggoypPm1a1C2nVJU4UITG2IDNwDV4Oc2sWPaavAC1FjkMntggfRHTmV1MJ
	88t89LjyNTcrhdDjYPGx9pevmMGZdSob8dG0EAEy
X-Received: by 2002:a05:6a00:3928:b0:837:fe75:104e with SMTP id
 d2e1a72fcca58-83f33bae7d8mr10282417b3a.5.1778975424205; Sat, 16 May 2026
 16:50:24 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260513105003.81880-1-phucduc.bui@gmail.com> <20260514043314.62222C2BCB7@smtp.kernel.org>
 <CAABR9nGhwtBu9Yhbn-BTD1Scykp2h6eQbtQtT13DcnekUdum1A@mail.gmail.com> <CAABR9nGZM3Bnb3DnObdp2nOJmW6ezmXqRSBtgS00Ps2ve4zsbg@mail.gmail.com>
In-Reply-To: <CAABR9nGZM3Bnb3DnObdp2nOJmW6ezmXqRSBtgS00Ps2ve4zsbg@mail.gmail.com>
From: Bui Duc Phuc <phucduc.bui@gmail.com>
Date: Sun, 17 May 2026 06:50:13 +0700
X-Gm-Features: AVHnY4IsUkQfn46YMLJeefxvMG0oEQBhPAdzpdl8m066r_PvU5WUFTx-_5lbq4I
Message-ID: <CAABR9nGsb_zvH1w6GFDqGFNCYjThCGuQ+RC91Bpkwu=h9ypcJg@mail.gmail.com>
Subject: Re: [PATCH] ASoC: sun4i-spdif: Use guard() for spin locks
To: sashiko-reviews@lists.linux.dev, Mark Brown <broonie@kernel.org>
Cc: linux-sunxi@lists.linux.dev, Liam Girdwood <lgirdwood@gmail.com>, 
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, Chen-Yu Tsai <wens@kernel.org>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, 
	Marcus Cooper <codekipper@gmail.com>, Chen Ni <nichen@iscas.ac.cn>, linux-sound@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi all

I would like to make a small correction to my previous email, and
also confirm one additional point before preparing another patch.

Correction:

> However, I also looked at a similar case in the
> micfil_rate_set() function from the fsl_micfil driver:
> https://elixir.bootlin.com/linux/v7.1-rc3/source/sound/soc/fsl/fsl_micfil.c

In my previous email, I referred to the function as
micfil_rate_set(), but the correct name is
micfil_range_set().

Additional point for confirmation:

Currently, in sun4i_spdif_runtime_suspend(), the clocks are
disabled in the following order:

clk_disable_unprepare(host->spdif_clk);
clk_disable_unprepare(host->apb_clk);

Meanwhile, in sun4i_spdif_runtime_resume(), the clocks are
enabled in this order:

clk_prepare_enable(host->spdif_clk);
ret = clk_prepare_enable(host->apb_clk);

I checked the binding documentation here:

https://elixir.bootlin.com/linux/v7.1-rc3/source/Documentation/devicetree/bindings/sound/allwinner,sun4i-a10-spdif.yaml

It describes the clocks as:

properties:
  clocks:
    items:
      - description: Bus Clock
      - description: Module Clock

  clock-names:
    items:
      - const: apb
      - const: spdif

From my understanding, apb_clk is the bus clock, while
spdif_clk is the module clock.

If that understanding is correct, then the suspend path seems
reasonable since the module clock is disabled before the bus
clock.

However, in the resume path, the module clock is currently
enabled before the bus clock. It may make more sense to enable
the bus clock first, followed by the module clock.

If my understanding is correct, I would like to prepare an
additional patch to reorder the clock enable sequence.

Please let me know if this interpretation makes sense.

Best Regard,
Phuc
