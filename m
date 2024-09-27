Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 038DB42AAB;
	Fri, 27 Sep 2024 01:27:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727400449; cv=none; b=WGZUswb7LST02Fc/YBvvUMQM37pEGk9fpgYakke/vTT0Clhq2DMuAKgi0tAvYGT6MTD9mbkcfzVWekc2q1dbPtHSB1poyKkWzxSmO90HMGunXfTie7G4saVhik57Q7513YYc2ixhH9liAT4t7Rz1N5bumdzAj6VMiL6ZP3UqzAI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727400449; c=relaxed/simple;
	bh=qhgGQFVcz7EDccATsvoa20zSMUCCY46FyvNGoiZYRgc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=UuTmjJSI9oTQD3E415IaWe2YET3owSqS+nR7qTweOEjDpwHrd3d3ujm0p3v67U+ESbAFXPjh0YlfVQ0NmZHfDpsCm1ZaRWU6UO+ybVt8FEDxhDslmINwSzvKY+AqvvWShJZcjdYSGUUdQeEszp7n5DOw4nDS07sD3HJJMssbR14=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=P4PJ0NZf; arc=none smtp.client-ip=209.85.208.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="P4PJ0NZf"
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-5c721803a89so1829489a12.1;
        Thu, 26 Sep 2024 18:27:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1727400446; x=1728005246; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=l/74tZKXei/PQf3stuS2/+bfqua3T6SsFCgnQTSmqVk=;
        b=P4PJ0NZfdboOJDA/xL6ZnSTWleyXf4DPLswCbQm3Yi19+hq3GzQPmoteCs71FlFt2n
         aEX151TYYcT0tUWj+vYQNS9jmiHV1X4L8Qs6NMz6fpiuWhrHEpG43c+0ZRf9Txo6nn4G
         cCcXrZG4U9ID1mfvEAT25DtoMqIeU0Fp6le4zfKqHHT+6V7XGrbNYZaXWJEJSfn1XuEo
         d6Hnd+27MFwDWVkLdJr/to/BwOgrrnf5chRD4w6KdOS5bQUlKakUfcfeN9/SfckXfDKU
         WpALdurKjtQ+fsmCpL6XWI20dmRDYkT+03T0eaWkfxuX57Lay2Ap9B4BsoeyTFYgfeAN
         9p9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727400446; x=1728005246;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=l/74tZKXei/PQf3stuS2/+bfqua3T6SsFCgnQTSmqVk=;
        b=nx+9/9Y3eOuydu0qLyC9tVSsBa9kVKKLIP2w7Erzm0solsEVUv3U2KU6jrEKPPW4WY
         iGjxObWmkPCJWLs8WOJ/w9jdb+aoyWnFcv5Fy4wkjtzdi1rYf+aMoPMfAcBI2E4hx87T
         wBSFoQt6mJVdCpLbDcNC8A8eLr2btwa7mBL4vckTF3xGiJaMRtSScnHH58whz2+31YiP
         +iIGReKljOVKSlrym1XnR2O26GVFxQB3p+dhlEgY8223gdmpVNjCE2jvws9KeAu54ZoA
         EagAwNBAPYtlQijWqPhqGcGHD/uP7TiBGRTcsbmd3TeyFUqZDwp6c5m+lAgNLuj4ZE8S
         RCCg==
X-Forwarded-Encrypted: i=1; AJvYcCUII9W8NzhbM38DTj0cHIljFKSLKp9b/mgoYyjcRZkVpL7FsOKvVXCkejkXSPU6xreK9hSL4eTQPoo+OjQ=@vger.kernel.org, AJvYcCUQpJekSYmhDfGlGnykbC6mRcBKjKY3FrtbHsiIcZX7ybLRA/4exFZniOO4NEcWqHQB4bd5YvSOyArO@vger.kernel.org
X-Gm-Message-State: AOJu0YyIV6dvDfoQl+Lzm4dY3s4QN6/Basf8PPUHK7kfiDpfwEb1xCi6
	WXfpM6pbHFiW6oPUoOVyrS6sQg+ODeFpli9AFlyIhAXZsRmlaEbk7B+pwJOS1aVe51R/Up+Z2ev
	LjnZZ9gLeUVqG1jAM2LFgmuQ7wos=
X-Google-Smtp-Source: AGHT+IFqqzZ/ufqBjVvvEX1p/TYcSBM6KPMz4eSVy+RenIlKAPslIo4SXJMKwDVNx64HLS5kq7C6lCTKNfmHIAegsUo=
X-Received: by 2002:a05:6402:24a4:b0:5c8:79fa:2e3e with SMTP id
 4fb4d7f45d1cf-5c882603bd9mr1181944a12.28.1727400446082; Thu, 26 Sep 2024
 18:27:26 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1727056789.git.zhoubinbin@loongson.cn> <fd3989d15546502b47f580e6a2c3a59cb628ce93.1727056789.git.zhoubinbin@loongson.cn>
 <ZvKDBc2Kohx9kPfQ@finisterre.sirena.org.uk> <CAMpQs4+xP7wMSm4wgE97hnbmrS5oVtQTQWXNLvK=O+SkeZnEsw@mail.gmail.com>
 <ZvURC1KniEo67XKl@finisterre.sirena.org.uk>
In-Reply-To: <ZvURC1KniEo67XKl@finisterre.sirena.org.uk>
From: Binbin Zhou <zhoubb.aaron@gmail.com>
Date: Fri, 27 Sep 2024 07:27:12 +0600
Message-ID: <CAMpQs4+xxoThbEzmZ-mYsQ_3XUD=T_B0PgBj+fs9fNzVCjTDZw@mail.gmail.com>
Subject: Re: [PATCH v2 7/9] ASoC: loongson: Add I2S controller driver as
 platform device
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

On Thu, Sep 26, 2024 at 1:45=E2=80=AFPM Mark Brown <broonie@kernel.org> wro=
te:
>
> On Thu, Sep 26, 2024 at 08:03:55AM +0600, Binbin Zhou wrote:
>
> > I will rewrite the dependency between the card and the DAI driver, as f=
ollows:
>
> > config SND_SOC_LOONGSON_CARD
> >         tristate "Loongson Sound Card Driver"
> >         depends on LOONGARCH || COMPILE_TEST
> >         select SND_SOC_LOONGSON_I2S_PCI if PCI
> >         select SND_SOC_LOONGSON_I2S_PLATFORM if OF
>
> > config SND_SOC_LOONGSON_I2S_PCI
> >         tristate "Loongson I2S-PCI Device Driver"
> >         select REGMAP_MMIO
>
> > config SND_SOC_LOONGSON_I2S_PLATFORM
> >         tristate "Loongson I2S controller as platform device"
> >         select REGMAP_MMIO
> >         select SND_SOC_GENERIC_DMAENGINE_PCM
>
> That looks good apart from the PCI and platform drivers should probably
> also have a
>
>         depends on LOONGARCH || COMPILE_TEST
>
> so they're not shown on architectures where they can't be used unless
> doing testing.

OK, I will add it in the V3 patchset.

Thanks.
Binbin
