Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00EEE3EC6B9
	for <linux-sound@vger.kernel.org>; Wed, 23 Sep 2026 17:28:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790184492; cv=none; b=nrYeg0Tg9LhhIdqdu186dwr99XmS8WpQH4CgD4xsZglo3rJ3DqTJfwp1Jj4rnjQvX765h7tZrQFNOKAu8s76k0rvdmHnyYDeV8qbQjQMj0REj1XTh9AhKboF81OcGfqKZ0eQupOWJ8UrY/GflJMwLR5wwFcoS1YTfWfcoOkqGt4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790184492; c=relaxed/simple;
	bh=Cc+kmMQpFSYKCu+YbHyMQJivl+pk5zH2psxS0LqXXyI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Q+hui/UYr7SyNPC1GwwdvAlrH+fVpgItSde5E4HWwYYHt64n0/Xv/g08VbYL7BnRPCBgWHUKxuAYYEiMhB/m+JZu5RBNgVHW3kWVV21IL9lzyzP6zQyGANw8ZwG0jDvU5/f/ShFobMtRRv71MpVmBU/c3h3ps4Aq7GZ+vGxoenk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kjR1f9n7; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kjR1f9n7"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 928AE1F0089B
	for <linux-sound@vger.kernel.org>; Wed, 23 Sep 2026 17:28:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790184490;
	bh=Cc+kmMQpFSYKCu+YbHyMQJivl+pk5zH2psxS0LqXXyI=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=kjR1f9n7Bnbpwah7NKquK/z3KO0YjB6mEhI7NuwSq8Ys+Ltz+qau7l2eKLB6WH8rW
	 apnLloQsPeIV8MalvygclXsageLvIZ/FHCDScYdppYsGw2QIqewHfQBJmLMDCLUkf3
	 8hjDhFSvjb4ykJO82FiyJVEop+jbZ4tLZhqFCCnk7SlOd4w1c6x8c714qd5D9ncwIm
	 R5TPSnLW2n6NsbNdvLmxaDOWvU9g3VFMc7hyupHT8bdcyfXxy1+BXKe3H2eX9Fb/HO
	 aeaVp8YLS21DnK1BCOkQ4sAm0XxI8iB2/pTl8sJHr/J4jDGHQv4VUiN0L1ak85uRfL
	 q73G4DL3mn5hQ==
Received: by mail-lf2-f12.google.com with SMTP id 2adb3069b0e04-5b5e4f13d77so1336876e87.0
        for <linux-sound@vger.kernel.org>; Wed, 23 Sep 2026 10:28:10 -0700 (PDT)
X-Gm-Message-State: AFuF++llLE2Y/866i3QnjWEV4PJa2zZiNWm40+CMYjxR2omPTTQTr50z
	XJIMYmeXAovzOi1iiacnv9S1WjmfT6yABJXnYRsgMPbxMh7RCRgH3QV6pnVbfXONvrt8PU+xw8g
	Q2IKDOLCXrjEETI4FPHaLTvbX2UH3B74=
X-Received: by 2002:a05:6512:3d0d:b0:5b8:b419:c8ad with SMTP id
 2adb3069b0e04-5b8d8979194mr1060604e87.17.1790184489272; Wed, 23 Sep 2026
 10:28:09 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260918-ux500-simple-sound-v2-0-88d29416e3c3@kernel.org> <20260918-ux500-simple-sound-v2-6-88d29416e3c3@kernel.org>
In-Reply-To: <20260918-ux500-simple-sound-v2-6-88d29416e3c3@kernel.org>
From: Linus Walleij <linusw@kernel.org>
Date: Wed, 23 Sep 2026 19:27:55 +0200
X-Gmail-Original-Message-ID: <CAD++jL=yLFiYcWsRF6eR4a8o=27wcmj4nxa8jirDaOfR3JBHkw@mail.gmail.com>
X-Gm-Features: AclHuK_-UVmPGIePjUjF3dX8xYRAyOgnfC7Kt7jTimuuvtdsVniy9gpSsWuCuCg
Message-ID: <CAD++jL=yLFiYcWsRF6eR4a8o=27wcmj4nxa8jirDaOfR3JBHkw@mail.gmail.com>
Subject: Re: [PATCH v2 6/9] ARM: dts: ux500: Add sound DAI provider cells
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Lee Jones <lee@kernel.org>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Cc: linux-sound@vger.kernel.org, devicetree@vger.kernel.org, 
	mfd@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 18, 2026 at 12:51=E2=80=AFAM Linus Walleij <linusw@kernel.org> =
wrote:

> Describe each MSP as a single-DAI provider and the AB8500 codec as a
> two-DAI provider. This lets audio graph endpoints resolve the MSP DAI
> and select the codec playback or capture interface by port number.
>
> Assisted-by: LLM
> Signed-off-by: Linus Walleij <linusw@kernel.org>

Assuming Lee will apply the ACKed binding patch so I applied this and
the rest of the DTS patches to the ux500 DTS branch for v7.4.

Yours,
Linus Walleij
