Received: from mail-ot1-f47.google.com (mail-ot1-f47.google.com [209.85.210.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB6462DAFA4
	for <linux-sound@vger.kernel.org>; Tue,  7 Oct 2025 13:48:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759844906; cv=none; b=HfLkQAgje94aX8/la43Gn6SogqoOkfvRZHiBDbtE/tx1m2dYehGGUPr+aAj00O3s/6ncj9+ih9TTpJnjylVdpefMN4lmkx/ZzVBT9I9XcVLYm5nyqBem/4FZZf5q4oCy+7aXqnEr0UXEqjQ+cVJcGdW401f5NeaYP4gcrubXdKw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759844906; c=relaxed/simple;
	bh=rsARsWWtlGU4XyQksyiHzqbzUOCSEtmZNn2PlInaawY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=rPPOMP8z9b7zyfxwPT02ku9wSqwDiFKVyU+YpR1LQKFcw2/2RIQYPfytizhdiypHH876p3F5WOI2ZCcAXmZxxvAiaZiRdl6Tgwsk7F1WmbsAFVeup+rFjIjbexNb/uYhuXKOyDllSK+E0Srj1JSrjFtiWcvfH0pFINytzL91ZNc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WeNNZsp+; arc=none smtp.client-ip=209.85.210.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WeNNZsp+"
Received: by mail-ot1-f47.google.com with SMTP id 46e09a7af769-7b4f7a856acso2152462a34.3
        for <linux-sound@vger.kernel.org>; Tue, 07 Oct 2025 06:48:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759844904; x=1760449704; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mFY1uUNizKMiaaPFdu2T3xmpk7VyNh1kZqPZtyxqkW8=;
        b=WeNNZsp+hcKklqPPz0kENmunDlBOv7VsTP4DKUeNLnGQV0xVboPZETSu/7HuSMRhmM
         QGBcKHoCIxN8XApxVD9Jg2mMkOhtN/6nTtjSZIfmgaYnDhYU+KGSvYQfxt6UZud4tfND
         9V2eAd7/FdNnyC6uqe97lKPL22uyz/EXM2wwtPQkuFfocfnmlJdoRwH8ACJTWxdLbtKO
         lPzWkhSRveSteeTZXcjiWTgFcj8KPqb8N3lMMum/Hr6KxUsCtnfwVq0FwsjPSQbyfhXi
         /BMpJsdMflEeFMfgU02OjlKlUGIZjIakxOLO32168DalWZ9Lu9BK05nrDOmG6vgm0RRJ
         v/mA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759844904; x=1760449704;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mFY1uUNizKMiaaPFdu2T3xmpk7VyNh1kZqPZtyxqkW8=;
        b=njmgvfZlwTRlKbBZJ6vXOM6Vnp4NVSXrMsUo3CV9zZtjnWC1G2HY50r8fKzM/ygG77
         tgOd8NmpNhSBvZ2K82YQA3SVj7kT+sBsCiF6Sl9XeIY706Ui6nY75mPNrzzAbB8uKxMw
         mRJPBapiTgLSuicLdU0bYStmENHAuMukiWVMgpCitNcaE0gCpx/oqJsY1rFbHHMf2hc1
         H21txIGFiPr7MdZOtB83FuGOHmQEoe3clAxWRmWFnEnML+/d9DkEWJ+bKFFG9aHSZ7wY
         Vi+PCqPKVDEh7agNoZOXRBc+09mkS3ZK/Nqz9jnKwrJEG3hWBT0fliqFiZ5HthT7M28f
         GlKQ==
X-Forwarded-Encrypted: i=1; AJvYcCWXg/yrua/kwKOOHdZFgAldGJP9LiRwLCm1HpfggkXo0vo+I5Wf4M+Cs7yh46DwLeBUqHPcaUevhrycdw==@vger.kernel.org
X-Gm-Message-State: AOJu0YyuVx0Cf6J/AoW/6ox1j2fMoE98v08OAiy3weG93YfIAMmoOTmL
	1z7j3a0kfi23ROYRVZ6V9igCDi1eVP/o4zolhSjQJ3sVoMRUvpLnOtd7AGGIbXRmoJHlibSpuw5
	/BhGJzKUh0wFGpNk9LG4uiGkvb6D53M/m80xBjt0=
X-Gm-Gg: ASbGncue3WbZT8gZcIajud1Qe48WMxRHMbenIMCh//cGQuH4sdG/3F7iZIX6SPu6yNf
	03oqme6zdVGAqthj9hc2yu7WtDnM2UfZdQbm5DM2vUxgPbC5dxxAc2FCqjTyhqb+6V0XogqZ0v/
	CmMlyVcl3gXHVPzP/81uuSl0Yf0Srsiu8wD4bz8iY0So/bSWAvlFr+WMrBz0rLmepFDbSqDy5co
	gpqPfrIAuy60WyU5vm0tK4af+ce5kM=
X-Google-Smtp-Source: AGHT+IH2OCYyjWdyJ9wdIBU+t7KzCDmW3XtaulzyT2fBtb2ExHxKBeX9LBNJfVyerS1qt1ZstGFV9V//J5FkbSG6MxQ=
X-Received: by 2002:a9d:7754:0:b0:7bd:8995:843a with SMTP id
 46e09a7af769-7bf772a5df2mr6783128a34.21.1759844903863; Tue, 07 Oct 2025
 06:48:23 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251003091304.3686-1-briansune@gmail.com> <20251007113305.1337-1-briansune@gmail.com>
 <5a71fdac-f6cf-4557-9bc8-d416a033263e@sirena.org.uk> <CAN7C2SCHirxurUA0n2VZKEEiYCt-NUKgspGFfZLNurHhACZkBQ@mail.gmail.com>
 <3266559a-8403-4a26-bbd9-c54e27fc59f8@sirena.org.uk> <CAN7C2SC96jZYYGP=DFrSKgtEfxy+MYpM7=-iW8YKhDG81ufw+Q@mail.gmail.com>
 <6963ab04-d0d2-42ee-9fc3-19f9c298849b@sirena.org.uk> <CAN7C2SBAPMG1-0huf+3NcUAULZmHTM4idcytShNDs-iiseZm5g@mail.gmail.com>
 <200e3d65-ffa5-40d1-86a9-974fbaae24d5@sirena.org.uk>
In-Reply-To: <200e3d65-ffa5-40d1-86a9-974fbaae24d5@sirena.org.uk>
From: Sune Brian <briansune@gmail.com>
Date: Tue, 7 Oct 2025 21:48:12 +0800
X-Gm-Features: AS18NWCTeDg9-o5Vg5Ezxcumq6wgIbm12pCTthF8BsvCcSZjH71LOkvmYzUw3d0
Message-ID: <CAN7C2SA8PQY_XgCav+FgZPpogeCYBVT-KU9-EWTPcaRADG42qA@mail.gmail.com>
Subject: Re: [PATCH v2] ASoC: wm8978: add missing BCLK divider setup
To: Mark Brown <broonie@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>, 
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, linux-sound@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Charles Keepax <ckeepax@opensource.cirrus.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Mark Brown <broonie@kernel.org> =E6=96=BC 2025=E5=B9=B410=E6=9C=887=E6=97=
=A5 =E9=80=B1=E4=BA=8C =E4=B8=8B=E5=8D=889:15=E5=AF=AB=E9=81=93=EF=BC=9A
> Please don't top post, reply in line with needed context.  This allows
> readers to readily follow the flow of conversation and understand what
> you are talking about and also helps ensure that everything in the
> discussion is being addressed.

Understood crop previous reply to the content that this is mail replying.
Will soon repatch another version on Charles comments.
Thank you
