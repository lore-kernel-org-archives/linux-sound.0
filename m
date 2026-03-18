Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F15AC2D0C92
	for <linux-sound@vger.kernel.org>; Wed, 18 Mar 2026 16:52:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773852750; cv=pass; b=MUL2E6ugGc1gRT6yQWfBFI4iB7fKQRYSBcSsq5FM4BqHZRuCS0/9Qiw8S8F3ZzTnxbgEyRhmdNWGqzZyBH3XJ0nfVheOR1vmHCvpjxyodzpS4GsnuQM7rejCDUheph3SgLuw/60pPmPtIZjq97zgOCTTK6PFjjXyKQER+OJMRwc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773852750; c=relaxed/simple;
	bh=jGowpM+0EvpqYpl5UHEdMeQ1VB2eHq1JlfVrJ/Var+g=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=YSA9v2SYLYboQp05gBgFvIHjv6y1CEGPIeUqIr4pfygPUTkA1kZgwc788oltZB+5wBvpok4tvsp4lD0LtdFDBnRvIkR6WbpX+hwuwgiL39pmDXCAS3cO7Rv/xa1DgVdS3qHdAsiliCHP8D1/qbIT3YtimJzTOpjvqo5/Bpn8vag=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=flipper.net; spf=pass smtp.mailfrom=flipper.net; dkim=pass (2048-bit key) header.d=flipper.net header.i=@flipper.net header.b=C6juc63A; arc=pass smtp.client-ip=209.85.218.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=flipper.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flipper.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=flipper.net header.i=@flipper.net header.b="C6juc63A"
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-b97b30fa5e5so2568266b.3
        for <linux-sound@vger.kernel.org>; Wed, 18 Mar 2026 09:52:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773852747; cv=none;
        d=google.com; s=arc-20240605;
        b=EpiqV7LVT3qjlssPmqnd169RqTyeViqvwAfXGbyQUcQ35vViPGVso7rNgNcLHSiRX0
         6pJUs+BGdJZX8NE4foL7cCkHFshy6iiDnds7sgduYT2k1GTM8QpFPE4jhVyMkgoQmEMY
         oljazrqkugYT8WqrMCEfTRzX8u3ibVzt/e6QqKsRHQrvogveEududis9KuMUgWov+LFi
         prap3P2bzj0EZqJ7DJWiWGnvoeonpWXIAX9Gx+lxT9qrMuXGmAuwb6UTW9LsvluNJbq8
         K0N/4h04BC2kFUG70UmcH/u8Nv81iKsk5lVkhuQ+LrAVRfbb+tLwMf+xD5yU2WhlvR+D
         lDlA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=n8s0iyx5Up+axNLd5N4vYWUUxP+7s5+5idq+mXMf/gI=;
        fh=emBPTwLZ1ALVmTFdovwm5YNN0/kg3N98fF0C7NUj22w=;
        b=kz9jy7KzCdlCb3xx2E1Uyr/4ZzO6D/o80CVN5g1nFQiyHZg1550CYulaB+21EVgmVj
         ZUeVsgFxJpFKq/vXcNTSAnyVVqGFYf466Jkxxq114R46VqrkjMJymym5MXamC/v4R0uu
         RAFB/bdgl7BXXEcp4YzssKZpMw8cGEtkMxGG2Ju56ZMEPmnU0SVw913I3DJlrACgp8q2
         vOgel8ZFYG1OC99MHhTQMqBFbeSnhY9Pmjq3QXfe0GhVZHaqWpWy8TOmeQUNe2zLgr0B
         bKjL79Zo3Zuiihi0VtCb+s7P2HD9L+fqZNBDHtCGUBBcX6HJBRW+qaEafRVtKS3jU2hK
         jm5w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=flipper.net; s=google; t=1773852747; x=1774457547; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=n8s0iyx5Up+axNLd5N4vYWUUxP+7s5+5idq+mXMf/gI=;
        b=C6juc63ARTReATuT6G1kJ3mD7qR9kgQB0xE/i/sidGITsV/FoP6iGtYq33ZUrDiQYo
         GFL0urc2gst3J3vLvoQb4ns1eqeuHuhyw7r1+ZL6txeGItONt8dAtm1fP3zKMBBbR4b+
         WRvvaTHF1J/RKZziKy33lAnWKL+4AZgEUuhMUaOfDCPZFvlsqJuSl+A9o4xPSWNMf5ya
         H+D8Wd2hu50j4C3sJXmZ29j2ZnksbVTiF5N7nsjELgitHpenAM/goHuMlj4LQpl+SHYT
         JwZoKE2Db5S+P3JEVRFViKe9Pf5ubwllePXS2qe933FCswnBHFqXxMXpG77w/HV1V657
         eyOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773852747; x=1774457547;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=n8s0iyx5Up+axNLd5N4vYWUUxP+7s5+5idq+mXMf/gI=;
        b=sLurTmizztMd83CC3VSTepXUe2DAExXdGCVRgyC3dRxlxNLv6ZN2Qx76A8A8k9nDG5
         k0ic050umeLyBbhELm6S605m6jeHDslpDdsPkXO1OYx74Gc8QKVdpSl6I70SC1l/KP87
         oaYA6ZcM8+K0R5jh8HJ7Uk7JiGj8yssrbnPE9Z/JrJaSdR7r0SfWzLOcznnpi0vIzsaw
         qrxlR3WX5YrTModmxeJZ2oKvr4MprTAeOjeSSskCl/bqDc+4/VvGabwhosAT9tK0UCGs
         9krfyv9XGRZ5OQ5x0Vsor299j8bKr6AIby8stSZMlrgLLH6QlSKwopV/mrUcrgTnxD+H
         Bvyw==
X-Forwarded-Encrypted: i=1; AJvYcCXxYIMtC8K8rd5CvMMKLE9n6ZK1G3oYsKDiHhZzwwA8XNG3zW0u0OULcnNMMntZ5DKbgn+VD8qFJ8GcxA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz6RuFKrW0uQqp4JMNLI8VwjFEX8d9h5InCHiXdofAfEPXLPa6K
	DvmPScHvTmVP9+kz+48sFyn3hvncHtvzAlEpBrrPi1O/pbkaeV1oAioSHbnfK08WVwkHEEyywv1
	nK5VwiHZtIPtsfe84jxWcApNpRh4fK1+QiGhdwLh3pA==
X-Gm-Gg: ATEYQzxcMa+n3GiNSj8Uxi7EeoIJ3YmqfcOuFtOASe7zmLZxCEsMCqMl7zG+2FZeytU
	xpxS530RDLP/r0OOvYZb3yaBfE6MGOJ+FjcYiGT2tIynU+a7B187H86q0t2PfmUj3b/2HSomoqI
	HIJXfT7i9bAJutSeplqDLnpNUbWtLFEF4Rn5veulBZuMqBIKZ3r9o+jAbqBnKYD9PaMUfct7EtT
	TB81jyzF3dmG8BghZiJOjAF3HMf7Uz6+NhswyM4dDSgXE+rPieEuhoFxR1BxaCLkN/g69g/Rj05
	DDK/lYw=
X-Received: by 2002:a17:907:268c:b0:b87:7485:b4a8 with SMTP id
 a640c23a62f3a-b97f437c5e0mr269129266b.0.1773852747057; Wed, 18 Mar 2026
 09:52:27 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260318-sai-slot-width-v1-1-1f68186f71e3@flipper.net> <339ebaa9-9642-4716-bca7-6a32a135124a@sirena.org.uk>
In-Reply-To: <339ebaa9-9642-4716-bca7-6a32a135124a@sirena.org.uk>
From: Alexey Charkov <alchark@flipper.net>
Date: Wed, 18 Mar 2026 20:52:16 +0400
X-Gm-Features: AaiRm53s1de568Rl6WcWFL_NmD36Tc9G63SkTCGabmNWoWncrHCvYMTyZ7Db36c
Message-ID: <CAKTNdwF9JRW7PjqnZwmvp_X5UjjJ023tBzFY7yCSnCJH5W6q-w@mail.gmail.com>
Subject: Re: [PATCH] ASoC: rockchip: rockchip_sai: Set slot width for non-TDM mode
To: Mark Brown <broonie@kernel.org>
Cc: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>, Liam Girdwood <lgirdwood@gmail.com>, 
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, Heiko Stuebner <heiko@sntech.de>, 
	Sugar Zhang <sugar.zhang@rock-chips.com>, linux-rockchip@lists.infradead.org, 
	linux-sound@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 18, 2026 at 8:17=E2=80=AFPM Mark Brown <broonie@kernel.org> wro=
te:
>
> On Wed, Mar 18, 2026 at 06:50:25PM +0400, Alexey Charkov wrote:
>
> >       regmap_update_bits(sai->regmap, reg, SAI_XCR_VDW_MASK | SAI_XCR_C=
SR_MASK, val);
> >
> > +     if (!sai->is_tdm)
> > +             regmap_update_bits(sai->regmap, reg, SAI_XCR_SBW_MASK,
> > +                                SAI_XCR_SBW(params_physical_width(para=
ms)));
> > +
>
> What happens if playback and capture have different widths?  I wonder if
> forcing a TDM configuration with the affected CODECs would be easier.

Playback and capture go to different "reg" each, and each has a slot
width field. The correct "reg" for the stream is selected 50 lines up
in the same function. So they shouldn't really get in each other's
way, from what I can tell.

Best regards,
Alexey
