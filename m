Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95980440656
	for <linux-sound@vger.kernel.org>; Fri, 11 Sep 2026 08:36:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789115810; cv=none; b=k3KeOKafubCErdXjLGCUTcTyHZhf9e8xN6SGd+AMMvuc6rrKs8d0fm/qiM1zITajqt3nyXcJ2NSmptwupQrtwUv39k2jT/hhR41V3pbaaoRVm7gg2Zt5XOESMkpl0VaQaR6AZ2982YbbrUnMIjLlVwsGbLtr2h36lhXzdtfZ30s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789115810; c=relaxed/simple;
	bh=27Ah1A7+YGbheg32CazNcC3Me9fuuX9iJpxCNFvuRVs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=P64FQI/AiLT3csD0k2C4eZg3SujOA03xl5I/MSFf0ZB9Bx7jzIkIoHuf6Gyz1hvrS0iMziZAVJ6H5tgBGjWz4hLkEhBTGi96bCXQSHbHbbrhn3Poejb8Wsw9ZoA4K6Byn58mRpRI0SzxMCObyAxbxCv2irhXXB8UFqVuc9mrf34=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=A1XXHFV+; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="A1XXHFV+"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 778021F0089F
	for <linux-sound@vger.kernel.org>; Fri, 11 Sep 2026 08:36:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789115807;
	bh=27Ah1A7+YGbheg32CazNcC3Me9fuuX9iJpxCNFvuRVs=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=A1XXHFV+BPRZif5b3sNhMuQHnREkbb5nB7Q9AYCqm1EjaoC6FZQjddizrmoCx42YB
	 JmzVuQowjQJAtPuZsQ3CtKB0vpHzt1QDJEJNaN5eFB2SPobhj80UZTuvDDN4XMkrFi
	 s5nd0PCRkdyN/SPP//ZgydDNEQI4iTX1sYJM84hNHm3gf86ppC4cN4clK2tA1eZynf
	 YOQy5J2HYCXB/uZAZb0/Uq2luak/fxqJprCuWBWe34acLXMZScRYhs0erRQCm4AyrK
	 Ccn00mVJjgeRVJ1dVeIlmZIrrE7TQF+kz8PV3qKLV3GXOSd0CbuwpleiMW2F8uGfkU
	 sziXyzpssYKuw==
Received: by mail-lf2-f12.google.com with SMTP id 2adb3069b0e04-5b74e0c2e4dso796928e87.0
        for <linux-sound@vger.kernel.org>; Fri, 11 Sep 2026 01:36:47 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBxtIDHWal7DBMkYJgAVT/EkUj6LIOuQDPLIgqJJ3b0f26plfOGmfuXU7Cr2Dj3rBznjh8L2KSLH/pKE3g==@vger.kernel.org
X-Gm-Message-State: AFuF++nqYr+7snY4Etlmx/h55ryO4aSWeii+n7eZW78aoVzwHTKpIdUb
	kPLYEHX+cjYsk+594i45gEE+OxeZlhOab7f6wOCX5GAEwy83gTyil9/lRgN9WDecF3iQeLvbdmW
	m7VsiC+bMUdi6gPytZ5WTga/uS0iZtPk=
X-Received: by 2002:a05:6512:2204:b0:5b4:7d9d:16d7 with SMTP id
 2adb3069b0e04-5b8a02df777mr1274704e87.11.1789115806176; Fri, 11 Sep 2026
 01:36:46 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260911-ux500-simple-sound-v1-0-6771ac714e82@kernel.org> <621688e1-0c18-460e-b48d-581fbd3ef5dd@sirena.org.uk>
In-Reply-To: <621688e1-0c18-460e-b48d-581fbd3ef5dd@sirena.org.uk>
From: Linus Walleij <linusw@kernel.org>
Date: Fri, 11 Sep 2026 10:36:34 +0200
X-Gmail-Original-Message-ID: <CAD++jLnsecR99S95qfqBnBkHRNV=Na_OPizuPN4aneMdAL33vg@mail.gmail.com>
X-Gm-Features: AcwNN1V5zJYngX4zb79GBa_GbR3Ci7WBCeWHBlSjl-hmvsmlAMBJlpPFbpvchAA
Message-ID: <CAD++jLnsecR99S95qfqBnBkHRNV=Na_OPizuPN4aneMdAL33vg@mail.gmail.com>
Subject: Re: [PATCH 0/9] ASoC: ux500: Migrate HREF and Samsung audio to simple-card
To: Mark Brown <broonie@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Lee Jones <lee@kernel.org>, 
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, linux-sound@vger.kernel.org, 
	devicetree@vger.kernel.org, mfd@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 11, 2026 at 1:10=E2=80=AFAM Mark Brown <broonie@kernel.org> wro=
te:

> The modern thing is to use audio-graph-card2 (which scales down to the
> use cases that simple- handles with a more flexible binding).

OK I will take a look and see if I can phase over to that thing.

> What's your thinking on merge strategy here?

First finalize the bindings and have them approved, Lee want to merge
the MFD binding change in his tree, when that is done all ASoC
things can go in and the DTS changes in parallel through the SoC
tree.

(I have the similar idea with the regulator set that is floating.)

Yours,
Linus Walleij
