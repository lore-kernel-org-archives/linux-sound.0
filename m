Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C5A036DA03
	for <linux-sound@vger.kernel.org>; Mon,  1 Jun 2026 19:34:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780342494; cv=none; b=Gy32NMiQACssdDr1n4lxkxAm6RoSgSRzC8dliAGHe5kB1jWPA9aQ/pwWQTrcxM0EzlCyxr0L/7DHatGw8AwzPOtwqujnNE6HjIIcdOFGOrYA4KggvmsQhbdStzaxapaiZGyKwriGWHDgq6IhWjuoZkqojYc1c5GZFx1gv9iEVug=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780342494; c=relaxed/simple;
	bh=t+3KyG8pCDhVdlfVWBFAG3kdKO865GQnsGyyRWxzxso=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=WKIf3DS67U6nCALbqf2rc9ajKoHacRm8hNTsFGH0eOG1QyIeXBx4MBGnkVtiZ24iW6h+ZdzuTpQtjC2BA0QVgYEmi1hL/Y9l//4JHpz1KD3d5bc9kUruz57757Sp1lbsZBU0I9HVDsucAhFhIkI4Hy91PInoK433tYdnsM2xXkM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WeGfiX9Y; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WeGfiX9Y"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4C65B1F0089A
	for <linux-sound@vger.kernel.org>; Mon,  1 Jun 2026 19:34:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780342493;
	bh=3mEbYDN6uV8d8+c0kcVqzrcwGQmdKSW+XwVT8wh+fP4=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=WeGfiX9YN/6GtIQDh5P9rTbDwakrNfFrbnZBoyRm0THeFk9acRx3+i75xbue41+G5
	 nQyqUmyhXjk+DrY0rPfyNTWeAAbtxvMDRpqnRg4lTP1STj6NQX8txOxm7dcgOB/m3r
	 lHv8omZOggxOR+KVYJ5OSaSt+DR1o64ER7kXyLgLLb71kxo5nO1D47qJEK4t6A4pY8
	 NYGnC+A7vB2QrTPtUwN9MqYPJcNK0RLD91tbNyt0u42+hIIf3cwDDJ0JWCOnuM+vIj
	 eoNkY5Nl2O1d1d/90cZyRzkJ+Drt9AIjSNilT7gt6lMwaMvgf8RFLRR568m1NZV6jo
	 3GI+5ztKhrEEQ==
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-68bfcf11050so6026165a12.0
        for <linux-sound@vger.kernel.org>; Mon, 01 Jun 2026 12:34:53 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ/muWSF+CnyxPBE8Nv0J8hKkwH2K/8Xbe0Iuw39DvztJCglTnBVBwpNKKcZyn6odSb57LdGtEo7BDZ0RA==@vger.kernel.org
X-Gm-Message-State: AOJu0YzmSuCfX4HzUEGXTfyvT3/GjlsEZ5s9wdc58TRerSA2Nuz+XUrM
	zitYbPXolKQ/KLyLLvIPxipDrsq213RYLLqe9Q6IiOefycViqBzrCbjccYth4Bg/ZSluyuXe+BC
	G5i0rJEuGnhSb7VW5+8UYuKr8mZXj0Q==
X-Received: by 2002:a17:906:4583:b0:bef:12f:347e with SMTP id
 a640c23a62f3a-bef012f3d6fmr37363366b.24.1780342491972; Mon, 01 Jun 2026
 12:34:51 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260530021642.64059-1-joakim.zhang@cixtech.com> <20260530021642.64059-7-joakim.zhang@cixtech.com>
In-Reply-To: <20260530021642.64059-7-joakim.zhang@cixtech.com>
From: Rob Herring <robh@kernel.org>
Date: Mon, 1 Jun 2026 14:34:40 -0500
X-Gmail-Original-Message-ID: <CAL_JsqKWzgTqC66z9YvHSLiZqSy_7Dh1J7_M1dE50O_+J1SCbw@mail.gmail.com>
X-Gm-Features: AVHnY4IqR8_R8OFQm7c_UOl7assWM7m9ME4VddbK5GtTsmCRe5dVh9ykj4FgMI4
Message-ID: <CAL_JsqKWzgTqC66z9YvHSLiZqSy_7Dh1J7_M1dE50O_+J1SCbw@mail.gmail.com>
Subject: Re: [PATCH v1 6/7] dt-bindings: sound: cix,sky1-ipbloq-hda: add hda
 dma memory-region
To: joakim.zhang@cixtech.com
Cc: mturquette@baylibre.com, sboyd@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, p.zabel@pengutronix.de, lgirdwood@gmail.com, 
	broonie@kernel.org, cix-kernel-upstream@cixtech.com, 
	linux-clk@vger.kernel.org, linux-sound@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, May 29, 2026 at 9:16=E2=80=AFPM <joakim.zhang@cixtech.com> wrote:
>
> From: Joakim Zhang <joakim.zhang@cixtech.com>
>
> Document the reserved memory region used for IPBLOQ HDA DMA buffers and
> require it in board DTS.
>
> Signed-off-by: Joakim Zhang <joakim.zhang@cixtech.com>
> ---
>  .../devicetree/bindings/sound/cix,sky1-ipbloq-hda.yaml      | 6 ++++++
>  1 file changed, 6 insertions(+)

Resend this to the DT list if you want it reviewed.

Rob
