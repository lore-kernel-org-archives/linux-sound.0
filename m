Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com [209.85.215.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40CE92DF13A
	for <linux-sound@vger.kernel.org>; Sun, 26 Apr 2026 23:40:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.215.172
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777246850; cv=pass; b=QD/xT9uqNTxIe1QTRpn0fi0yVublrWKEQxsCwGy0rL7nEWLOiDvqZOeD3ppUqUlxlb8wGOuz7zhcPtUMyjsq9+kjPWx430TVK6p8qrmfSA9XX5gA7my8Ik5WdegjjTSSXnwC6dwWWgPKBAK16bnga/XJeB7bRTFoCcQto6P5o9s=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777246850; c=relaxed/simple;
	bh=X0R+smGYEcUcLNPqU5xk6J7XACJYnkvYN5xGy2f4apQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=a1wahi1BiRaySr+WgkvY1JRVI1okQJEDyTa9XQNV69xPzOa/CEV6wAR1ngf/ftx/z+cZkszLqGP4+u0c46aiHn21xAEe4bCAX7iAiZBlHlEWjstJeiYjzLLSZUkAbQQFiaph0g1Tlp8q33/9ASnw2VmY3X3fsINOrrNG7AZ6i+k=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=qmTRfpii; arc=pass smtp.client-ip=209.85.215.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="qmTRfpii"
Received: by mail-pg1-f172.google.com with SMTP id 41be03b00d2f7-c70f91776fcso3643271a12.0
        for <linux-sound@vger.kernel.org>; Sun, 26 Apr 2026 16:40:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1777246848; cv=none;
        d=google.com; s=arc-20240605;
        b=Jx5K/7QQVm+d/eqPrAk1en7r83iOs5K3ByKTYSVKG+PuxFUG4XrWFsaHfoRA3TYGsy
         tq+DI/+TqjC+JGAQNVw5TapKpNS8EQ9+DOUFJLOW+1Fh8e9pa9imcV25sofisKySUiVw
         qT0K5aQU9f/kPu8k9F2uRssPg0tzVYNLCTUw4rpEdTUGzbZdX/PJgj1mCqxlCXplqXp/
         KD0j2HX5G7ul55F7dZXI6VkeUDa6t0s5NW3dU5PfZghPaB6GTuzjHzJtY08Y6GNiKY6k
         qJuZlDmiWSE8T6QAoaG2laLO1VJrBQPXBDYqeY/Dd9UKIWGrz4rcl0dSF9xAjMs5Jqbg
         Lnag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Y0mG82ZqnbNgU5UbwCZHANJfxcxBs7X3CB8+aFRbO3g=;
        fh=Fbj1Z6rSBmsv7ZOTa0IdF7k9Pt63xf1Gg/nrB+dxgkg=;
        b=DArp7LuETr1U/v0NdSCxU70GyW0wzydiRFriZqCrR+wJeI+yyEzRLx+VMQD0iGu9hM
         B9Kh5KAIj6dJM0qyW7KJWZwKRwhRm6iZRg+IcWmieFWRSOyCsqgpnbw6Igp3EPU12C6a
         ux0DPKHG4aGb2vxZ/vWzP9aCmFhYREbe6i0wv/m+ftSsHzKcp8t2dMrhity0i/7NPR/x
         F5HfjbxG3889eugP7pLb38djGwXKCq8oJcCjtPW6s/EhPb0pva9ZN61CNDSasUHIXk5R
         iGcRUnvwlihZvi8KXjMPN7DMv1JNJvGgaCQyed4utpm61fwur+CLiXa1k5susxX9R9M/
         c/Tg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777246848; x=1777851648; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Y0mG82ZqnbNgU5UbwCZHANJfxcxBs7X3CB8+aFRbO3g=;
        b=qmTRfpiin/w29+GB+htBgs3zJWgka1CUu8RvQ+P4tiRy0g85vfg0LR3aBVTm7ISu2e
         0YWl/ZHyH059cSZkWkSrUl/OSn04GuRxsfDwPiOMrvD6oYY4V3Fu6TTqDRw5bWp20/5s
         K8DLoki6sFLlWCLfdg+02vR697XlzPai6WFfrU7TMFUbMNNk6cJgUc9SHtbb8voIxzXM
         6GPbi4wOrZPboxBmOazvjnO6htFPSSHwRhTnS8w742sVAvflCOaiFVmTpJpdWexokKcO
         iYUkCpcYlsSkkPG6zjv36MZMMnRPBEcUwht8b4Ah+qQpfCJzATn6UHbEcraB97+iLI/t
         FQqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777246848; x=1777851648;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Y0mG82ZqnbNgU5UbwCZHANJfxcxBs7X3CB8+aFRbO3g=;
        b=iWfBH+v9kSS+w2EvcBlTYOWKz1mR7h1lJjRQd0djp2WKkLgBuK+6BAesGCEceU/0Jr
         2cGyH6cdhAdmHoRowtSQqfV6wURdcWmd02g7QJfIFe9xYzw/4ho8FyGVJRrwLW+CecX4
         p0jXdN60piSrPoBWAux++zdRHRNwi7sykla3JGACqyoziT7eRlML1e07SFrFonCyR8Ok
         uv2JWlc9Kqr49dM8ZsLnTWSTyKHMkDi96Q6AM58rcIk8pjMRncxMXj7aXVUgDUb52O75
         S3yJCFBkqvkJBX01oHKhEaixOSvk2sJa6N1waPFH3lc9dTX6Q8TnVpDGemMe8I3mHimN
         y8RA==
X-Forwarded-Encrypted: i=1; AFNElJ8BYGHgS2GN4lTo3wTO3hq2HTaT7uDr2oMn+wTudZhLu+t2AUKhKDsdqA3j+5IAQWzGFgYPe0+7vT11WA==@vger.kernel.org
X-Gm-Message-State: AOJu0YyQNFKHxJLXTQ9i84y6hfW5CwigoHTyO+xSAEsD8rZoaNniBjEK
	wxoGy0y+JXuDOQRvuzm1OTe6tgxu3wUezBwMAotcrrmVXiXWP/AXwXdT1OJ+/1VcMLeU3GxeJtD
	BxjOz1RHZ5m0JYpQXHF4QV5stHi5bfxTdFrNq
X-Gm-Gg: AeBDiet2SbT96aQ05l7ixtBy45PsD2+Mw7glGYRPcbYDFxk1/J5UVrobvWVgkLkEFXl
	raLE4kDZcpAtAbQ0ymSxr3zL8ShWruMSZ0BttP05sJ3UHyqiO4aFJxrY+Oa7qAtwFKG4kgFxf+F
	E2qoZ5FoVB+UFxvtVXgED1Lsi2IrvUeW+GHfuEIEU0GJ6wWPhLu2NWo38K2aQN5WuyGkqzK258o
	TP+Dsk7p0Rs4T5Z7JaJY2h7eZwfOxh9wMB+JnU4XN34f2h0Yxb+L27mBomPkhU26f1kjnnR0pNa
	w/QxK4SEjAXI/1qVuZUv1ebib/3xUgt1cmPx1lf5qGuztjo=
X-Received: by 2002:a05:6300:6d8f:20b0:398:8870:b531 with SMTP id
 adf61e73a8af0-3a08d70a1famr25303284637.14.1777246848558; Sun, 26 Apr 2026
 16:40:48 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260423042831.21114-1-phucduc.bui@gmail.com> <20260423042831.21114-2-phucduc.bui@gmail.com>
 <20260423-ingenious-psychedelic-jaybird-40bb4d@quoll>
In-Reply-To: <20260423-ingenious-psychedelic-jaybird-40bb4d@quoll>
From: Bui Duc Phuc <phucduc.bui@gmail.com>
Date: Mon, 27 Apr 2026 06:40:31 +0700
X-Gm-Features: AQROBzALmqPDt_24g1IGVKGMMWkAGDfkR70trABOv_7t1jBQYK1ibQPH5H_P7bg
Message-ID: <CAABR9nGH4yZcgyzm=wNYVHB2vLhojZJSHKOC6dSeQPm0rbh4KQ@mail.gmail.com>
Subject: Re: [PATCH 2/2] ASoC: dt-bindings: drop redundant wakeup-source definitions
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Lee Jones <lee@kernel.org>, Mark Brown <broonie@kernel.org>, 
	Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Heiko Stuebner <heiko@sntech.de>, Joseph Chen <chenjh@rock-chips.com>, 
	Chris Zhong <zyw@rock-chips.com>, Zhang Qing <zhangqing@rock-chips.com>, 
	David Rau <David.Rau.opensource@dm.renesas.com>, 
	Animesh Agarwal <animeshagarwal28@gmail.com>, devicetree@vger.kernel.org, 
	linux-sound@vger.kernel.org, linux-rockchip@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

> > The 'wakeup-source' property already has its type defined in the core


> TYPES. It is plural.


Thank you for pointing that out. That was a mistake in my wording.
Regarding the two data types, I=E2=80=99m already aware of this and have
discussed it in a previous patch.

https://lore.kernel.org/all/CAABR9nH3hr+Y5ksD0cn3Gd9XUvmb07X7zJw0b4k_yVbnAu=
z9=3Dw@mail.gmail.com/

> > -  wakeup-source:

> > -    type: boolean

> > -    description:

> > -      Flag to indicate this device can wake system (suspend/resume).

> > +  wakeup-source: true

>

> That's wrong. Commit msg is making here false statements that it is

> redundant. I checked (and you should too!) and driver does clearly

> device_property_read_bool() thus the property CANNOT be the second type.

I think Device Tree bindings should describe the hardware capability.
If the hardware supports wakeup functionality,
referencing the core schema is sufficient. Hardware description should
not be constrained by the current driver implementation
( e.g. the use of device_property_read_bool() ).
Bindings should remain stable and generic, while drivers can evolve over ti=
me.

Re-defining the type locally duplicates the core definition. If the
core schema evolves,
this approach would require touching many bindings instead of updating
one central place.

This follows the recent cleanups suggested by Rob

https://lore.kernel.org/all/177628888260.592110.11727813820499601669.robh@k=
ernel.org/
https://lore.kernel.org/all/177679687272.1458365.1328485324673928433.robh@k=
ernel.org/

Best regards,
Phuc
