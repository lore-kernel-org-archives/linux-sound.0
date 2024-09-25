Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDCFE15B135;
	Wed, 25 Sep 2024 08:45:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727253917; cv=none; b=JzW6+INKTojjAqsRBzURWqO5IUXRLBw5aa1exaN9OvL7AOD2GSvlwq/eaHTNJMp15yY01gNSyhgwFuPIALUp8x/fU/NuM70doSNoNCy4ams7sCylpD1dFjffJowc8dkQmoSFFEHGk+ynA9/MgIL0GK8s2l4MpDc+r77tirC6gvI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727253917; c=relaxed/simple;
	bh=mP7Uq00AVwR3Zp5r1zKaElCF0y2R9K7EPxhbb9x/wn0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=kGfF+/ihx6xMzzGih07wYiIQvA5Po9hPAK4AtBdAT0+udoJEa4LZSI7NmUHcCTc5rr+l5cAfQztkOOlw+yj7qFf8Lrq0AMciCfyg6JRZe+5A4SmX2nsgs2lcq/Sff8vF+i20S4ufXKOH0qKXtcOLLC4Fn47XtJ8M10Iv9CaETLk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RBBTQkFR; arc=none smtp.client-ip=209.85.218.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RBBTQkFR"
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-a8d29b7edc2so942590366b.1;
        Wed, 25 Sep 2024 01:45:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1727253914; x=1727858714; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/s0lV7K7xGqyp7HGObiTsi5felYAY5nYIVCT3Xgv5ag=;
        b=RBBTQkFR3Uuxg3l3E5FE4SHc6PNgjIILgD3hQLnvdeqr/lYdSYrgnHYLFzhE8jBAwf
         2GwEYjDPRuhw4ysbTclcxBVs54vd0uISvPYoX0oE+8/J7YWK2QuwMlGtOZeN0pUXZgq5
         ky/K7mLQWNRw3UWP8ucnulho3u0Q5qoxdc7bzUhGIJ2kZKTbmLQ/t2+5r4//9uMyPyax
         Twj9CdAmMc6VNlMc0PJqYkZlr6yVRrn3ndbHnw6sWwgGXBvMNWWsHETDio5Z0HgdYAYO
         6yDcdrZE+pbvv6mPP+E7bm+LSQQLYuYNVuuBfbmWjbsIz8kJGxCsdGKrIi6dSUaIQs1S
         qclA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727253914; x=1727858714;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/s0lV7K7xGqyp7HGObiTsi5felYAY5nYIVCT3Xgv5ag=;
        b=q+t3HXJV1x9D1xh4RbQwdOlYg6yrHeLDDfqxgqgfL15SsEK+8DPowXjVyzN/eJoRCj
         OrosuczAvqUoL60u0dHazmwtnMxO/05ezrvas+Z6GVMnGeu/8TO4s1DT2Rr/PXIlnxTT
         fJtF0uhdCNrWpfLsPNpgMmmciNnwR8iy7la1hSpUCNHGQ9+ia3KOMoakGLTgfzQh4nmU
         Q7PQP685ofsWEFey3FK4ovrWnzeXI6SFAjdZZeTQnKS83HVwiyQGsRaKAIfHcD3lpGTQ
         82O3/XMTM6G1Yq4fa6/uSII1di++LUNNhhtflzcmM7NUiUr9zS0QM4xzNUtRDKKZ8ZcA
         DC1g==
X-Forwarded-Encrypted: i=1; AJvYcCVxBhSBP2VmtrlZtHY+ojf3BbFVIlDL4BWvTLKQ2o5JfnlpeTZ/AIC4woCXbqNsARy/uwUh95chjtiK@vger.kernel.org, AJvYcCWEat08CmogHFl+rkgWaIIF9pFEpW5UQNQtCXxPIi3CO/PImVZ/JDs8BY9SW/DlVYqW8rZxFxzPKFsPJ9I=@vger.kernel.org
X-Gm-Message-State: AOJu0YzULThn7Jx71QChvsA9nfCw8QR3Gs9YBjF2KzUsW2ZPadzOfIoS
	XvZSWIM+gniZ6G41SqyKnvNB8dCy6ZqwP4hNacqXq5VJMwXjedCKVPJnrSIIMLP7qxtCEUqVDBB
	7dPv9/MDYUPH0fFLolJlB1Y6jRsz5m6QEdk4=
X-Google-Smtp-Source: AGHT+IHJ9p2T25h1DGXmt5kZkVT5WxVXm73sAkzVAymu155m5T37TOCSBpmD3N4Nbx2vxCxHdTsuLyonZ/MLSAshO7w=
X-Received: by 2002:a17:907:9487:b0:a7a:8586:d36b with SMTP id
 a640c23a62f3a-a93a03305a3mr173259766b.3.1727253913924; Wed, 25 Sep 2024
 01:45:13 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1727056789.git.zhoubinbin@loongson.cn> <df28fd5784de4d18929c03c43309f095ae4f4860.1727056789.git.zhoubinbin@loongson.cn>
 <ZvKAfZH-uaxzY0hh@finisterre.sirena.org.uk>
In-Reply-To: <ZvKAfZH-uaxzY0hh@finisterre.sirena.org.uk>
From: Binbin Zhou <zhoubb.aaron@gmail.com>
Date: Wed, 25 Sep 2024 14:44:59 +0600
Message-ID: <CAMpQs4+pEXiNknyVEWKY=POS7kk7ow7SBuuF6R+G5EcGAd42jA@mail.gmail.com>
Subject: Re: [PATCH v2 2/9] ASoC: codecs: Add support for ES8323
To: Mark Brown <broonie@kernel.org>
Cc: Binbin Zhou <zhoubinbin@loongson.cn>, Huacai Chen <chenhuacai@loongson.cn>, 
	Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
	Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Huacai Chen <chenhuacai@kernel.org>, linux-sound@vger.kernel.org, 
	devicetree@vger.kernel.org, Xuerui Wang <kernel@xen0n.name>, loongarch@lists.linux.dev, 
	Neil Armstrong <neil.armstrong@linaro.org>, 
	Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>, 
	Richard Fitzgerald <rf@opensource.cirrus.com>, Luca Ceresoli <luca.ceresoli@bootlin.com>, 
	Weidong Wang <wangweidong.a@awinic.com>, Prasad Kumpatla <quic_pkumpatl@quicinc.com>, 
	Herve Codina <herve.codina@bootlin.com>, Masahiro Yamada <masahiroy@kernel.org>, 
	Shuming Fan <shumingf@realtek.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Mark:

On Tue, Sep 24, 2024 at 3:04=E2=80=AFPM Mark Brown <broonie@kernel.org> wro=
te:
>
> On Tue, Sep 24, 2024 at 03:00:19PM +0800, Binbin Zhou wrote:
>
> > +     /* interface format */
> > +     switch (fmt & SND_SOC_DAIFMT_FORMAT_MASK) {
> > +     case SND_SOC_DAIFMT_I2S:
> > +             adciface &=3D 0xFC;
> > +             daciface &=3D 0xF9;
> > +             break;
> > +     case SND_SOC_DAIFMT_RIGHT_J:
> > +     case SND_SOC_DAIFMT_LEFT_J:
> > +     case SND_SOC_DAIFMT_DSP_A:
> > +     case SND_SOC_DAIFMT_DSP_B:
> > +             break;
>
> This results in an identical configuration for everything except I2S
> which must be buggy, these are distinct formats in ways that are visible
> on the bus.

Ok, I checked the datasheet for the ES8323 and it has set bits for
LEFT_J/RIGHT_J etc.
In the next version, I'll patch it all.

Thanks.
Binbin
