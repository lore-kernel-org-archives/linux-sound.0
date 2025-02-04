Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C581418B494
	for <linux-sound@vger.kernel.org>; Tue,  4 Feb 2025 07:52:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738655542; cv=none; b=H7ZoJ6TnvIfN3rYrq4m3Qonkazv8mHmdIab267JRTOEDLmruR2fPT8qCQ//Tm5DfoJBM5SyeOjkSma5zy4ZV/ZXS5D3rNsiYZlamPgSv1jFXWzawozzxSYadkbKWUz89s4/IzwWUpFOwfokMTSZnkUWFQmseJGsOSWbINWUl4/0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738655542; c=relaxed/simple;
	bh=YALXhFB/bnAOZ+D+zaVyqSzuX+6mw6+NdsFaznUl5Yw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=UxuVEZrCQIP3L2u80DgsAPJlrUXKtF7PFH3+yLRwhOpRf+W0MOhrWnQyEEszmLVxmKbwNaDDKhnNrWigEXygTOnFeCRd2dz3CpeUJtk1xX1z/QORpC/bSu37V0kz3BghpVCBcfzSJ+HiSZ5fODFsv7uyC/T37wvK5gRi8ECzXfQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GcPjhF35; arc=none smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GcPjhF35"
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-216728b1836so89241595ad.0
        for <linux-sound@vger.kernel.org>; Mon, 03 Feb 2025 23:52:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738655538; x=1739260338; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zE75lecawo8A6zAFMaW4h7NnKaU4Qon24MvY041OO74=;
        b=GcPjhF359TRCCe22koypW13/puBjfU/yTOh5jR8lNzEWSz+9F4lr6Xeg/Dcq5vmVov
         Stbc2e5kXi11Aq5uFLSRZnWXrxlMQj24L1nic6xpZjylJh6sA+p6ezUDrDWwB9JEnage
         i2cka1qgpVWE4x2r6AerTImoKVBkp4Kkmc7zeTduf0O07NNONFardCqc8JzGUgmtICOf
         3JlLjMPW655whNj2EQMJNda6TePlpEmAiqmZMxumWsRh+jN2BSat3yDradtZKU+7GVqC
         SjTlrCxyEvDnQ7ofAn30C5iYMfoaZLavtA2twNHZwcjWJ8XYHIDsSll8b1MoETdur89m
         HZfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738655538; x=1739260338;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zE75lecawo8A6zAFMaW4h7NnKaU4Qon24MvY041OO74=;
        b=vWXydGMCb9lph8NuJo6Tpg+0LRAurWRKPW7crattRTbYEYwKBp9yxVF/PgrM4Gkel3
         PZ+8X6yPX915Cn7f7WSF750lrptoKfglSEvrBHNiIMnSn1Kj0fyZAg4Qdpdoqkg/awHt
         luE+9emdSBF3xihEMVdIMYmsvmRYZ6j+bcE3uLwUAYSQzZLHxlgdFGfwveuchbr+Qpug
         RWkYRUtCWNQ5zR4c8DJGTyHcwk2hbM0l9jFHE80O4UbnWjyGcqbx+yUyQwZVpu3NcWe9
         pVkak1mfNYDLzk8Gue4a1p6ooKHzU67gN0w6BOTF0Smv/oaRZNFmJk+F7II0aGKeYcT0
         q5Gg==
X-Forwarded-Encrypted: i=1; AJvYcCVBSG50V1Y4amtlPOvMyqdwufoyjZBLWeh/bi3ssRY0sC3Na+tT4gPqAmOoeQzlXuB3OEsV1Vb5HGhH/A==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx1biJjFCB9pFKfOg3zHi3404Fke1ThOQM2uLCi4Q8JGokRgysi
	61GXXjiF4ZUchVP3mJL5ub+I0kjbfI23E5ud9Bv+poiaKp32QYayPKAy6yRQm9Y85HpGSHu95l9
	CrBW2L5EpJiGU0VJCFZdVJ4XryyI=
X-Gm-Gg: ASbGncswpxCo2H96eOt/ZfD8oNYabYjmeNlYW96vubavlpKlkWfsNIMyaWMx+sZg9GB
	o6xtnmWszpZo0pHqHbRXvfnM8QyrBt+QcBxiG1QRjV3hxIOT7aviAkOdo5ZLSgmVe9tAoyw==
X-Google-Smtp-Source: AGHT+IE3VaZHjmz7skQkN/UKH3UTO7MFfjdxqQc1JdjbW9uM7R9T3sz9X9x9sieQkNDg8roILef65JQHo94ZB80ujPg=
X-Received: by 2002:a17:902:e74b:b0:216:7c33:8994 with SMTP id
 d9443c01a7336-21dd7de6d49mr443560065ad.53.1738655538002; Mon, 03 Feb 2025
 23:52:18 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <87ikpq2rui.wl-kuninori.morimoto.gx@renesas.com>
In-Reply-To: <87ikpq2rui.wl-kuninori.morimoto.gx@renesas.com>
From: Daniel Baluta <daniel.baluta@gmail.com>
Date: Tue, 4 Feb 2025 09:53:50 +0200
X-Gm-Features: AWEUYZnstrWaHecJe5fCAjiveoSASdGfG5rgypZQgA-650JZj5PGjADAhtcBKc0
Message-ID: <CAEnQRZDFCBLzF59_h0jZ+ZR99igFO8ZezwFtp_HCC=TE0vyUzQ@mail.gmail.com>
Subject: Re: [PATCH] ASoC: simple-card-utils.c: add missing dlc->of_node
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: Mark Brown <broonie@kernel.org>, linux-sound@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 4, 2025 at 7:37=E2=80=AFAM Kuninori Morimoto
<kuninori.morimoto.gx@renesas.com> wrote:
>
> commit 90de551c1bf ("ASoC: simple-card-utils.c: enable multi Component
> support") added muiti Component support, but was missing to add
> dlc->of_node. Because of it, Sound device list will indicates strange
> name if it was DPCM connection and driver supports dai->driver->dai_args,
> like below
>
>         > aplay -l
>         card X: sndulcbmix [xxxx], device 0: fe.(null).rsnd-dai.0 (*) []
>         ...                                     ^^^^^^
>
> It will be fixed by this patch
>
>         > aplay -l
>         card X: sndulcbmix [xxxx], device 0: fe.sound@ec500000.rsnd-dai.0=
 (*) []
>         ...                                     ^^^^^^^^^^^^^^
>
> Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>

Reviewed-by: Daniel Baluta <daniel.baluta@nxp.com>
