Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.210.178
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795170403;
	b=P/BAUZb5s0m/F1TdlABonYHcvtXcCKtunxXec2YZIrgiVRgry57Ry6lDHniQ3OcpvOfY
	 GuxAjeCpyPbEPCk0Rx2XjEwsydPKpDDQmcLAcpOvT7Z3zIJEZ6HXbl8rebrkfOglfqj3a
	 PMY+0fHVbUjbAiM8iF9z2wmO1ZOBTHmn9JTQomrXcsVetdcATedrf9k8EjdzNH0D6fpEU
	 Or49SNetprTbis8zWTK9V7Q1nDRMfSY+XwDigF1Y1pg45B6+KhgxBqLtwDUKta/G4kJHB
	 OhI658xtPkVlRTnwE57IaBWlsD67XYS3HVo0LahdKlk15j01T85VEViSuJwFgIghm9w==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795170403;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:MIME-Version:References:
	 In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:Cc:
	 Content-Type:Content-Transfer-Encoding;
	bh=LF2/f7qLTUBrb9c2xXcASr++BpW6e38apQYvPO24BK8=;
	b=uq71wAabIa0cfs7UkEx79Lv9TtxcHrLzJIc18caYNW0QXxNx8AEex2UklM1ZPlX/swaF
	 IDFm0Q+Z5EpFVwriAUM/NKAq8pPX3j3oUjK3HcUN9cTktoRFhPcM2i+RJGE3Nh0LPlZSs
	 XE3YSNN0N06mgttM0KFR3fd2Av7eSUeRMP/2aO3Yowfgop9qR4zO17/imCI7iWgghZa9c
	 VtzsrGssQT9BEUL+p3hIyz//p17zEsSrpOToyV9TitkEM1Y+9DKadiSFhUVlCFa92Wwtk
	 KhRHscpsHKlk6TLcMyvHE/rx+QMacCgX+sUgo48XoYhlyNZSMk2EnoYNY3IjtlE3ZeQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=rbvNTSC0;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.210.178
Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E193606A325
	for <linux-sound@vger.kernel.org>; Fri, 20 Nov 2026 10:26:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3E193606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=rbvNTSC0
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-8b6a88e4341so346109b3a.1
        for <linux-sound@vger.kernel.org>; Fri, 20 Nov 2026 02:26:43 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795170402; cv=none;
        d=google.com; s=arc-20260327;
        b=fbdK5h2GlI+DeCsLSIPR7a9R4k+kn3Xbg3b0dtvEXNtoW168+ZRudyjHJM34LUtnnH
         azVljDalZubnOwf5yrLvibefd3nAAgslkDvQIDhIuim/PFeP8ea1g48xWyQXIOkrDyVb
         cCN9kFIHjIE4s4fyBy0BjShTOEf0PQ1zpL2vwnXJrnzq9oMMAMkE1Ho1D9QH1rpde/Li
         4XBM/6cgNeYvD81baBjDcz/sdyDL6QwCLGZfz7+/k90z1w3piZsX0wTgFJQzw7qzSmA4
         KajwPiT6pLBQbSASmYlaO81NIUzjwMstNVlv6D6p2xbk2PiumjDWPfo9CDnD35korm5L
         Lvdg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=LF2/f7qLTUBrb9c2xXcASr++BpW6e38apQYvPO24BK8=;
        fh=j7qE0RlvzNR5Qm6xA4ehUDBqPqcz09gsE3Wa6zaxdUU=;
        b=QuiY00KVZttzCnryS6979v2pJ/sl9yErWiShfhPqsLyYt02Zn3H1APCK3fhVMIirZn
         LniI1hPOGSuz6I4M/n7MY6STyWnSlrlJSQcJ/11GH/WDvOT1KttbnhZ2bcg/55ZuiRvv
         iFH+90/G0kzCMDZYsy3PSNcBVJcChryp0/KghRANsWxZD1EkRHdjOfOcJZ+YwP/cbecp
         XwFEGsKDSWYokcWVo98wWITMJabUAANd7bkXnpDLBtqdTmTrg7f32cT2Ei2APv8MXZ0O
         0FgvioPrZcf5yt1aXoOZmEpXLvkzUZJw+I0K9gy2Al1BXob1ZbHUE7dfgK8ie+VpI4L5
         jU5w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795170402; x=1795775202; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=LF2/f7qLTUBrb9c2xXcASr++BpW6e38apQYvPO24BK8=;
        b=rbvNTSC0nf09Fh5hmJe3kZ7dYIEvmvKLr5KIqv+yICEkSSCr7mS4L+zARwi2VkQppf
         LK/2BS2hv6i6dd4KKeFnOAtlnSObfyehd6gC22aNopNERk+mGscqLkLIcHNzJHvzNfZ0
         rpykhsdYgVhiDdPDjERqh+SdPQ8OnV2wjaXva1c71crN4vdbOyk7Zp7bZJFltaMQwvKL
         Ulgy0fpwufr2TCqdboPXgnRIHxr6aEhoQHz6C2NxyWbd/rO+75pp64kQ21FA5tHM90OD
         o+Oz7KA/4DhXFDZsEQPB5Javjq4pm/hSdMH737WnP0wBeO0f/zXL6zi79TeB2RoTJSe0
         ZEgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795170402; x=1795775202;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LF2/f7qLTUBrb9c2xXcASr++BpW6e38apQYvPO24BK8=;
        b=tqsde2TU5S8zZktx5DyhNEY/qdvJmwRS7F3S2Jm+DpF/Mi5G1jcxjZ5IsM2pf10DG6
         ch92w/h4Rjvrakf4f4kCm/02C+9zDuOKAvKLTKp77tiKmTqdGccHPW0CBGSc8w7hdAId
         FoIPW9IKgLF+VIJhXBjnYXY4bD3P/dFapnzKo2nbzlgLl0aEqYkR68EtSi6KQPoL/+th
         6KyEk9QLfxpVduVkGN6if/2ds2dOtMveoT+p7BWdQKb2mqLKz1tK89SSpAT1cBQgCXJg
         JWMmk5G+znEHTJ4X5IyfefI1ZlE+qPSYYJzzHo7s4MAyUT0uSeSQvkSUR6HsCfJ7V81+
         +jpA==
X-Gm-Message-State: APuU4Z+kMPKHvdgKy7X7icnJfQjp7YQPPCnfuYZyf/X7GlJh75IpVUEW
	3Gf0Gf+3eBEj9eZ2VDp3itvuAdb6BeCk/Nepyyf1wVs6UQ7bFNDgIjyda1EydJpnh9vJDr8K6tn
	Y6UnTnlsCcKJPqfgbfd61mz8zkeI8CEA=
X-Gm-Gg: AYBFou0Dc/nO7IesJJT5DQ7OZNDGMZKLg3m3lcWtYF/mcxK4OMaLXZLpiQP3bzBaJfs
	JNylJbeNaSSBagYBTN5a8kkovEzkvzdjggRJfeAKNX2RFaBbFO/ikGw+B6q3Ur6IUqrRIJKVr9/
	QEZ12++Ofuzhy0RhxPzWnygp6eVen62CnCK3YtTpo2xVDpNJEet4HM+8FIYBtusWDnp8kH478T4
	I2FFRafyG5zB+X8dLuiAEU5i25/+NrPt4JOSdD9NJSxra2HE4MluI8+OACI90Yer35S7vnK5wNa
	fHlDejvi+JizKbSeWGEhiQEgWSeGiBfxus7YpObV3FJcpuhSWTQ8t6ASRoxdTvNRFOQota6bakc
	QDxgO0Nsp2mbGCZp57VNs5ks/sv78E2LC8sMcXXIHmon40oukwV7K0CuzF+lnucjZJWMR2/dWGW
	yLUz3Zo7IzOLVmyAvZexQe/NLghv26xIl7EQ1wTutJbDjvXidq
X-Received: by 2002:a05:6a21:3b8f:b0:3f8:e16d:c9b1 with SMTP id
 adf61e73a8af0-4014e254f09mr3223108637.45.1795170402519; Fri, 20 Nov 2026
 02:26:42 -0800 (PST)
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Post: <mailto:linux-sound@vger.kernel.org>
List-Help: <mailto:linux-sound+help@vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-sound+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261120100408.8053-1-phucduc.bui@gmail.com> <20261120100408.8053-3-phucduc.bui@gmail.com>
 <sashiko-outbox-224911@kernel.org> <CAABR9nEJ3Jgva3iTo2GVacHXRp_FVrqVxQ-VCdGg41vLbh4htQ@mail.gmail.com>
In-Reply-To: <CAABR9nEJ3Jgva3iTo2GVacHXRp_FVrqVxQ-VCdGg41vLbh4htQ@mail.gmail.com>
From: Bui Duc Phuc <phucduc.bui@gmail.com>
Date: Fri, 20 Nov 2026 17:26:30 +0700
X-Gm-Features: AclHuK8GZnsfv_ewo_R90J5NHdMDIeazjGuJGm3zsdOP0C8Jt5X981fvDU5EK6o
Message-ID: <CAABR9nEVZp4-3xws7qm0N2gCnDXsh=kRF-UcHDeme7ZTbs10sA@mail.gmail.com>
Subject: Re: [PATCH 2/2] ASoC: atmel: mchp-spdiftx: Mark interrupt registers
 as volatile
To: sashiko-reviews@lists.linux.dev
Cc: linux-sound@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 20, 2026 at 5:22=E2=80=AFPM Bui Duc Phuc <phucduc.bui@gmail.com=
> wrote:
>
> > [Severity: Low]
> > In commit 06ca24e98e6b ("ASoC: mchp-spdiftx: add driver for S/PDIF TX
> > Controller"), mchp_spdiftx_regmap_config left .cache_type unset
> > (REGCACHE_NONE), so regmap_read() read SPDIFTX_ISR and SPDIFTX_IMR
> > directly from hardware.  Regmap caching was enabled later in commit
> > 4bf54ca60f99 ("ASoC: mchp-spdiftx: add runtime pm support"), which adde=
d
> > .cache_type =3D REGCACHE_FLAT without a .volatile_reg callback.
> >
> > Should the Fixes tag reference that commit instead?
> >
> >   Fixes: 4bf54ca60f99 ("ASoC: mchp-spdiftx: add runtime pm support")
>
> Commit 06ca24e98e6b already fixes 4bf54ca60f99, so I included both
> commits in the Fixes tags.
> I don't think this is a critical issue, so I'll wait for the
> maintainer's opinion.


Sorry, I got that wrong. You're right. I'll update the Fixes tag to:

> Fixes: 4bf54ca60f99 ("ASoC: mchp-spdiftx: add runtime pm support")
