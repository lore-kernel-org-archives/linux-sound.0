Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 161B92D8DD6
	for <linux-sound@vger.kernel.org>; Mon, 11 May 2026 04:22:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.214.170
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778473336; cv=pass; b=Bd+ZKJIDPlqKbymJPsnoBTvM5E6+uYujUqIpsF4POSWriXxpfGgb6mnJGACGpJkn/ZiNeUcTPmVOjMLRctvcoooXNOG9/QbmyTGM6O06wqZ0aSuTirZmpXAUAAuaJVYkUAsJUXVU1OSGB9rKV+J6Xiu4wtwPNuAadU15ZuJ+kpk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778473336; c=relaxed/simple;
	bh=OeHacbZXrsMU4ngrgTltuf0nP+fevY8eP/EXHUfGj+Q=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=OW6GH7QPF2mQdTKk5145C69lgrlhABC2Iw25smRosZzk86C0Qnj3HszObJ+iBLv19ovHlEHFFaPoy3NBg9LgNMQCIvsQkK/INyrRHAgyvlpVjHyNws4V+EqT9xYDtkn5DXg/o8Fl5mUBswIU9hBTk6ThR4QJCxpTc1YX1IKXL+k=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=a6u+AOg6; arc=pass smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="a6u+AOg6"
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-2ad9a9be502so23397045ad.0
        for <linux-sound@vger.kernel.org>; Sun, 10 May 2026 21:22:15 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778473334; cv=none;
        d=google.com; s=arc-20240605;
        b=gCGOi7DxCyGs/n9AHe0SvCqyzaDGhe4qwrScOCAlbLOMxplhMbfOLstj7o/OXj5yQA
         uKzlkv4ZWSkeDrciVAkR6KpBLjNUx81qSPUWzWsAQdXGn6GtWTqx53xXuxEm5l8vQCDR
         08diDOEoSNWp/A8z2PvuSQl8ugNjypkGkYpkUsvxiF+wsIrCPJ8sykD3aaKCV77GiHFr
         4NEUjp7sYUkPheu1FyM5x93lVBJqsypQSvaAGzge2S61mR+FLiuPXJjkH0fUkE53oRdM
         2MJhAPdmMhK6cd8PIb+hIA1qxlRfMk6jpb1IkYM2xZ6UTugozReXo5EY2RFZNOiTJNPS
         RGDA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=OeHacbZXrsMU4ngrgTltuf0nP+fevY8eP/EXHUfGj+Q=;
        fh=ZkkPrdjkixGQCZ9gwN3RekZJjPc6qVMBBBtSUCHsCZE=;
        b=Ef7vhqlAXjWqYRduK1ut39goLDOxAOm38Zc54ehiwbTn6ikuqou/H+2KGQ7/NHq1d5
         5FZ9/UooksEshgEQUI6Foiq3R5bvRqyw/t6ODF5CPGJnW3UArDJAO9gVEfMnSPQ8P7zx
         5zzgt3VLM1Ypz6Yo5rUJ3GMgkS8r0UYLpK79Mu/gEe/EtxkZXScC+zeht3VIhlYXnxzv
         PWZKo6uVX3NBFeL7w5fiOSb+vIyYQbIePKONyl10B31jiyaeU8M9DqwpHlPYW8X0oThb
         Tnn9I3e55uq+9sx97YJdsrA727uX/ZFMi2yi2FAiqhvQPCzvI3vj4gwczLfohzuTFSZ1
         JArw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778473334; x=1779078134; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OeHacbZXrsMU4ngrgTltuf0nP+fevY8eP/EXHUfGj+Q=;
        b=a6u+AOg6ryqMldY2LRUux9/1qorKERpjRkIZxjg7rDFY4GhXDD51OXd7JzVJ3/J93F
         5dw4Rjo6rBMa5KJH77oYlXuwpdYt7xsSF2LO9MddUZKzr9roG4P+t1FdDyB7+EnwkhX5
         xQVU9ON5K5SFgBQYueY8596R1H2+b/K3l3vWeUQx9kPaTsMIInFYxY0g4DxNKlImBFOA
         6uEVPdFTyQA9jHnnuNthxXC5GjXijtRbn5ScBm1TkUt6og68eFukiAb03B2TBkTwTvlN
         wsxaYz2ZLuUB+8MNgPPVEjpyUieNhQJylhexe2GPVBagqODc3zChPMKxGM9xkrQtcSbq
         ERAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778473334; x=1779078134;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=OeHacbZXrsMU4ngrgTltuf0nP+fevY8eP/EXHUfGj+Q=;
        b=eF2cByliuNP/oE9WCX/J1UbQA000gd2Fpq31tXFy8IMvAluaMdcOxgAXQ4bxaJYqyT
         D37PlsNEE4qy9CaN+Vgio1mu5M2bzwNIprMTjWdT+C8zEcfplSnhepTwbQAt0KdhgZvK
         3vD0pv1qTCH5t3uKRlHp8H72jWgP8H6Dg5P+vodJvhu2opaHgYeb3N/l0DTnR09qfRuY
         7Cdc8mBoUXCtDyT17kEvwbxbD7DutzgdiHaZxRSFYtQkKqjM5ipTcb1YOgkC5xUCVQ8w
         bkNwmBW81T0V5oxiKFBaUjc5hWZFsS709rO/aEsjpeBtheUSSfLMJHgHAHc+kSNw0mhh
         6qHQ==
X-Forwarded-Encrypted: i=1; AFNElJ8bGaIYZ8lRo/eVa/e2tJZU8B8lXdD1F9VIT5I1KNIUQPeUn7CMsYOV8igOxEap4wXlT/Cg4mXuFMi04A==@vger.kernel.org
X-Gm-Message-State: AOJu0YyBXaMuGL7VYK6t1oU/l3NWfAB+CAPXv847hQMJyCdjGafiPsdk
	cl2jpGio0cCqvFWqNk0vP/09YXoK/0nwW1rQ3+9Nabg3V2agWN26ERzajBQUljrwmw+dapp/nXl
	VWFTTp+XO3qRxX1bPlzfHO+pd7Mq3mbw=
X-Gm-Gg: Acq92OFEozHtg9LqSeuDbgMWPSt1BTpIWJ8GMyxrd/J6+hlVYpORxeNwiFafObf7TLf
	7w7n8Z3ATd63KYwlZqtHNV0F5ztvtMms1kY7fT4P0RlkxmNI02qJmhYTQdUrNuMFri1b5eMpthm
	hDQG0W+BmfSkwkzao9UwiCgjHRKiR6QMj84WPZUdjvnuZPjwgoHUGD6xRXFvmONfP7hIR+tYo5l
	WgzqHi356mqz+bHkmSXUb5Rn4oaRuWuJxJabic+/EaTsHMxnWl+3Bjgaab4D+3JsBIAwHPGEizp
	Hg+2/ow0wrR6tgxMkMjk+vhXW0+VKMlIpkN6IWxxHEGhby+0u0Cpgazd2AI=
X-Received: by 2002:a17:903:13ce:b0:2b4:62bd:ee3 with SMTP id
 d9443c01a7336-2ba79c2cfffmr234513675ad.33.1778473334534; Sun, 10 May 2026
 21:22:14 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260423042831.21114-1-phucduc.bui@gmail.com> <20260423042831.21114-2-phucduc.bui@gmail.com>
 <20260423-ingenious-psychedelic-jaybird-40bb4d@quoll> <CAABR9nGH4yZcgyzm=wNYVHB2vLhojZJSHKOC6dSeQPm0rbh4KQ@mail.gmail.com>
 <ce219aa2-0bb1-4a74-b40d-bd753f1a22dd@kernel.org> <CAABR9nHaGBU9KAWJZrnBy8HO0Waccp8CCGmBdKJ3QOEb8WZsXA@mail.gmail.com>
 <20260505211006.GA3875657-robh@kernel.org>
In-Reply-To: <20260505211006.GA3875657-robh@kernel.org>
From: Bui Duc Phuc <phucduc.bui@gmail.com>
Date: Mon, 11 May 2026 11:22:00 +0700
X-Gm-Features: AVHnY4Ilmsly8mVMu2VKK2pF9rv7AIJO9kq9XO5ctET-fhRje978uj2nKP4vMgU
Message-ID: <CAABR9nHEVsS_Tf6Y7AXnLJwsDahwn+o1vS5dd27m4QLQAixL_A@mail.gmail.com>
Subject: Re: [PATCH 2/2] ASoC: dt-bindings: drop redundant wakeup-source definitions
To: Rob Herring <robh@kernel.org>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, Lee Jones <lee@kernel.org>, Mark Brown <broonie@kernel.org>, 
	Liam Girdwood <lgirdwood@gmail.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>, 
	Joseph Chen <chenjh@rock-chips.com>, Chris Zhong <zyw@rock-chips.com>, 
	Zhang Qing <zhangqing@rock-chips.com>, David Rau <David.Rau.opensource@dm.renesas.com>, 
	Animesh Agarwal <animeshagarwal28@gmail.com>, devicetree@vger.kernel.org, 
	linux-sound@vger.kernel.org, linux-rockchip@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Rob, Krzysztof,

On Wed, May 6, 2026 at 4:10=E2=80=AFAM Rob Herring <robh@kernel.org> wrote:
>
> If this was a problem, then it probably would have been fixed already
> because it generates a warning. An I2C device probably isn't all that
> coupled to SoC power states, so boolean is probably always going to be
> used here. But maybe not.
>
> If we do any cleanup here, I think that should have exactly 1 location
> that reads this property instead of 77. Perhaps the driver core can just
> handle everything and drivers don't have to deal with it.
>

Yes, the I2C core already handles the 'wakeup-source' property centrally;
therefore, individual device drivers do not need to implement their
own handling.

While no I2C devices currently utilize the 'phandle-array' type for
this property,
we should ensure the infrastructure is future-proof. In cases where a
phandle is used,
additional firmware-level handling might be required depending on the
SoC architecture,
similar to how the m_can driver operates on TI SoCs.

References for that implementation can be found here:
Firmware: https://elixir.bootlin.com/linux/v7.1-rc2/source/drivers/firmware=
/ti_sci.c
DTS: https://elixir.bootlin.com/linux/v7.1-rc2/source/arch/arm64/boot/dts/t=
i/k3-am62a7-sk.dts

To address this and align the code with the core schema, I have
previously submitted patches
to transition the I2C core and clean up the m_can driver:

I2C core patch:
https://lore.kernel.org/all/20260505043145.33284-1-phucduc.bui@gmail.com/
m_can patch: https://lore.kernel.org/all/20260504050702.34013-1-phucduc.bui=
@gmail.com/


> It's really outside the scope of a device binding what is used for
> wakeup-source as that depends on the platform. So I think just
> 'wakeup-source: true' in device bindings is fine. I don't think we have
> to change all the existing cases either, but the patches are already
> written so I don't have an issue applying them.

Understood. I will update the commit message wording in the next
version.

Best regards,
Phuc
