Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.175
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795436984;
	b=ovK4cyeI8e4ycEx7QMFymWRvI/36cKVucBwWoUQnUlXICPVR7pr5zX5bzAhdtv6W4eiL
	 GEEHcK7TXKrzXUF7WbOjMhhzTO2/P+g1IdGHk2yzE4NCIxTe7P/JJGf7t8klOsL9T5MdB
	 89Zn/pB99JWin/Se/GPNayZoiyubneTXc8kQN3YeZwnuaEUmXfIkM0VZ7k1+X6+dELNa1
	 MaQvdPB5/VWIyXTEC3rSnSKhhVoaPrJaUV/SFj7tBzQLnd30s2LtTrQ5RtpxBBkxLyTEf
	 NYH/kL+nVamg4Ktu7ExO1BI0lntcmclwmJMTwF7/i9hzDNjxrT03PD6pLXPH8gb3sZg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795436984;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:MIME-Version:References:
	 In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:Cc:
	 Content-Type:Content-Transfer-Encoding;
	bh=769kmgvvE4NJNYBz1ky6Ntqci2z1yIp0iuj4i3YhtVI=;
	b=sNy/XJ58LhNTeErwY6x0A40jQPiBF+TKICzB23pjhaBVvY+zIy6P449/qeZR2tS2toSO
	 FukFoD1vtD6RJzJcQwmqqi+ND9gky8z0WOSeLis540hPOFC2NFYZKEkmzC7RKwHcPz8i3
	 v9j6Lnesqre5A8wqO9ZIrfovKoLkjo6UdYOYZnrAP6ODnkfshK3o85BH8e7wHvbl4NXNC
	 yvg8cSVEeOdvEi9GkTHmpUmIwNGK7kb/Ave7WTXdYYgDXEEBeAcfAU2UAKwXF+ZkhRsXm
	 hprolZIJGN2u0XZV38SQP7KTyprMUr9F5jOfwv82MNiyuPbJK7FmKzgUAHgU1SBACYA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=BGHjuIpH;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.175
Received: from mail-dy1-f175.google.com (mail-dy1-f175.google.com [74.125.82.175])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A41CC606A31E
	for <linux-sound@vger.kernel.org>; Mon, 23 Nov 2026 12:29:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A41CC606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=BGHjuIpH
Received: by mail-dy1-f175.google.com with SMTP id 5a478bee46e88-33bf40b0c8bso6977034eec.0
        for <linux-sound@vger.kernel.org>; Mon, 23 Nov 2026 04:29:43 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795436983; cv=none;
        d=google.com; s=arc-20260327;
        b=hesBHZTVtZaj71aLB1Pmxw6M15oEkfYs9AIhg/8ywGWH6wqwF9DkgVWSXVT3MJwtNF
         4ebi26imimnYHHbk4qXbA8/2xuR+1FAvpORH7bm9wrvku9mXBDyP9RS2zT5Wwy+m5Z/l
         y/i22cIENmflhZUQkA0CUVAgzVvk8iqAK7tQB0rPVyrQVLxfh7vUEhV1UQim9Nb5yHCJ
         uR2OIvS0okI8sVjSsnfjxuWS8IDAv76JBmkGuAuY3tlQ0g946E5AomYLn5UKQOqfJ9L+
         PySBw6zlPYo56rM9U/Afp/86nl3/LEuD5vDURdqsO4K4YRuL8hMaKEnLGk2rgctPVXxt
         0BlA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=769kmgvvE4NJNYBz1ky6Ntqci2z1yIp0iuj4i3YhtVI=;
        fh=K3fCAXy537xMNskhb0Ba6Iju/Sm/sDJmQiJmX79bLkQ=;
        b=lDzcSfEPDsBfwXQ5MwgNl4LqQlXk0DIG5ERaawHSgr24XNtRrGailwgH19XSiKJ6rb
         qsGE+iJDjBH+JrVV18nNQW3bSQ+Xdmue26wuI8oQSAzpjOtzRV89sCkEs5MDY6ozHDdi
         MBayYqOgPPqrTgDG6lUMeKN36u7VvyrIPvTeGOyLqbd6xs9f/nuASohQGRwgPBiE039+
         PFGtZVBIwvCzybKFxh99v6GbrVzl2fNW804ptfmQMH6d/BWFRCiOt1l1kmoIMLSNIh6j
         7onCvr4fjVjtPG+1NCWD/MzD6QYHN+l96p/ZxCjajScj2OLmX1vy6B4Qn/kpU4iFaEFI
         kbwQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795436983; x=1796041783; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=769kmgvvE4NJNYBz1ky6Ntqci2z1yIp0iuj4i3YhtVI=;
        b=BGHjuIpHKx1HmZeK4dAx1dqiNlSjkCcoIWx2fVvjB5cchTDfvhJ912m0xoDTR2SVJx
         3sx0IyYFcmXLHbLBpSfugKiXFSDAZmn/8ccDNz0OaI9SNYR25/fIhnZsoJxS1y0cgiUl
         91FUUtgiT66UoTBLIc7l84l+bVGYYMWvomsVYXclcdTZnugp5VNVOyCs1poFTBTsPTDt
         OUEDN3njepH95rBYr/ETQoXcPjwlZGKAL1JPd5OGXB3xJV2T+tLV5pLNBn/B6PnB+aZz
         4pwkDVmP1CJH0AUcCLZAfLLFjxRqPBEAfWmGhayayLNX+HHslD+Th/QbJ+Ix0MPMIb2i
         PXfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795436983; x=1796041783;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=769kmgvvE4NJNYBz1ky6Ntqci2z1yIp0iuj4i3YhtVI=;
        b=xNZDhL55iZBKT6DEcqhzNcLs+4Hcivf/MRJDJ6yNAi70hnHEVBDQq0Fx4MOFZI9bKE
         lLauVZFVmuYI0RnPaug+f5Ff3me5aJEHnC0iGKBHrCBLosSVXBStLfm/3Qz9re6bCtYE
         NBbRNaeMjtiVUP8krkklPkO4pse23Xy48iK77VNuIowKYpzAHJx9giyvreeJ2DjjGVPN
         S/HyAlsFyl0zLRkGaySyrjP/Bg9/aKhER0yn4lWc66Kg8HEDWnnEKSLlKVuW6mpR8nfA
         g4FJCghctKwI640a6MlnmWQ9pkuPlvbKw4W/bApDukhrouIvxpEuggwcTdBxjZ4jjM1d
         z8GQ==
X-Gm-Message-State: APuU4Z/y4nRCU87eSegf6MX6td8/0lxQyCPnAwayFd2qO2FK2BpqP91X
	wBZxzsCDrJLkPriQokrfOL11SSxJpJE93q59AZBCSfENJK6vEjHdW2CFHPigYAXPCj9Nb+USLMu
	Va/dZzf4SYdGV4LeCxAY+eBoR/GqGkb0=
X-Gm-Gg: AZFdTZdEDuP/D1gUro1tKc0aTsw2N2IZVxugorlYiP2Hxg6arm/te1h5GkPEVnQ+HkY
	HDuap/J9saYOh+VRb2tcKMaky3EMUFV4B4z7r0KPUIThgA4cCZb+lvWKwhmpfUPlaWeZnua59Pw
	v+uW8iWcpgNAoxJDPWWnI7tpSoMEMQs4WfAj6rbovDmK+CajpExkAp2TzB8zTte3rUxiaSNrSB6
	IW0njnSz2IDfW6hBgb0FYe2NgUQ8b71bqVJON9uTFqybEkjSfZkZ46Xl6yQX2bZQJIMqEQqLJd1
	nfVHYkDztJjNXcdpG/cv8Y6LRsDqUIEIK+BUdQpyfLPMk2qbqZh8KKK7XyQneflj3cXH3eMRIds
	9OR6+eyqFQUir7vIUEPf2upkVixUdg7VkNeXen0UJVcQY8dZJRQMUD6hIVR6/8OoaTeFSQuZE1d
	egLzGifKiER3PKYsUR17EGCzE9TgaBUA==
X-Received: by 2002:a05:7301:416:b0:356:7ddb:2e54 with SMTP id
 5a478bee46e88-38570f27b33mr12240392eec.29.1795436982705; Mon, 23 Nov 2026
 04:29:42 -0800 (PST)
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Post: <mailto:linux-sound@vger.kernel.org>
List-Help: <mailto:linux-sound+help@vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-sound+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261123100228.77797-1-clamor95@gmail.com>
In-Reply-To: <20261123100228.77797-1-clamor95@gmail.com>
From: Svyatoslav Ryhel <clamor95@gmail.com>
Date: Mon, 23 Nov 2026 14:29:31 +0200
X-Gm-Features: Aa3M54qdKM7FZvWtT8WQZcdWMo3hSwhK3iAkQqlt8iIEs-0xQqheq2rc7TEhDHk
Message-ID: <CAPVz0n0r7NTVwhWwkWNv21Fjy_pjmWiN+N4HbC0x0++-nOxF9g@mail.gmail.com>
Subject: Re: [PATCH v1] ASoC: tegra: Add support for mono channel to
 Tegra20/Tegra30 I2S DAIs
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
	Thierry Reding <thierry.reding@kernel.org>, Jonathan Hunter <jonathanh@nvidia.com>, 
	Svyatoslav Ryhel <clamor95@gmail.com>
Cc: linux-sound@vger.kernel.org, linux-tegra@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

=D0=BF=D0=BD, 23 =D0=BB=D0=B8=D1=81=D1=82. 2026=E2=80=AF=D1=80. =D0=BE 12:0=
2 Svyatoslav Ryhel <clamor95@gmail.com> =D0=BF=D0=B8=D1=88=D0=B5:
>
> According to the TRM, both Tegra20 and Tegra30 I2S should be able to
> support a mono channel for non-DSP formats, while the number of channels
> for the DSP (FSYNC) format should remain restricted to a minimum of two
> for Tegra30+.
>
> Implement support for mono audio by adjusting the I2S clock and divider
> calculation logic for both Tegra20 and Tegra30+.
>
> Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
> ---
> I2S clock calculations were adjusted to match those found in downstream
> sources for Tegra20 up to Tegra124. This change was tested on the LG
> Optimus Vu (P895), and sound was consistent with both mono and dual
> channels, with no distortion.
> ---
>  sound/soc/tegra/tegra20_i2s.c | 21 ++++++++++++++++-----
>  sound/soc/tegra/tegra30_i2s.c | 31 +++++++++++++++++++++----------
>  2 files changed, 37 insertions(+), 15 deletions(-)
>

This seems to be unneeded, additionally, according to downstream
tegra20 i2s format does not support mono channel. Sorry for
disturbing.
