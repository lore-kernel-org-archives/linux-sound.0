Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 250D4D29E;
	Sat,  7 Sep 2024 07:54:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725695653; cv=none; b=iL1HWMi+T7Tw/rMr5p7vGue6bI6xAkEIWaFkiPD690d7JEXmEeixRlzGdxE87PgS28GSeqlxqO/JkV7jsyJYsTmidzEA0pa5ey2mRy1MklvCezhceIqt8clFWphyE16fXugKyaMiEcJZgVG67qD9/qt1QCc/hd4XHYdn79c4wQs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725695653; c=relaxed/simple;
	bh=Yz/TSvkOcbi8EawEHGU5BgH6byiZVXkVjz9PR4nfGd0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ThzI3lsmIAMY8wUF8xV/9Qr88eRizXuJQlwuGnXZnLwInPOsI7EabnABcoPXcIkc/zrQjvOU/AlkSJSokgdioYoI2X8HVBFQMvhJKDubziqMwuHzMOnb6FgIwVmRVQUMTtma5snpo8bR5N9E6zCiSEFSDtLqwgG0tAUuWgMt0Rc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BQprS7O4; arc=none smtp.client-ip=209.85.218.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BQprS7O4"
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-a80eab3945eso295951266b.1;
        Sat, 07 Sep 2024 00:54:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1725695650; x=1726300450; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZInpS0DO8RREpWDAkRwr80k3sSMpCCobGvcP4yMoWqM=;
        b=BQprS7O4xOfHDLBd7hc2uOfylpWEa3fN3KqElidi9GNcIpVD+AesB9BaHLmDX5guhJ
         qs8FkYGsOTeALTs4F/QO+/sklBzcnqv9FzIPc+x/hw/H1eTNQfE95vw/oS7cbf2UlKHP
         q6jb9eRXw6yDG1lyuvnR7XJWFlm1yCL+kVVzMx4wq5Mtu+KxuFB4tOox2IIILbN5GUDb
         ciNZSENJzrHNcyUSzzVX5YEmEXT5ltPZvykUWHQl64yD2z6xw55eprruSPZHqahq9bCk
         Ao2axRMUSffecn8y1QjryXa3QwyneSjJvrgcoTB+XvoEoGQ5IV5Kr4xB+xCdgp++djfi
         UgKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725695650; x=1726300450;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZInpS0DO8RREpWDAkRwr80k3sSMpCCobGvcP4yMoWqM=;
        b=wxRoB03ov52Itl+lPcGf/2nKWcv2pGwYs4FKZKMEomGnaFTf64u2E3mnEHsUlVwAi2
         4uFXtt3fkmq2E1ZOpjsWEyh2chT3iB57cJsPzeuO8EFsADqWf5BagQFKmqYZa3YXqX9E
         FEXHXKRVyzKpo1t/n+oe9jTVPQD13SlsLGULpCga722uulxa5gW6GiGOJrcJ3CDu1AXt
         gBR/uh4qAEfbyX3J4fHJBSw6cU+fMpyM20JFFOfK6RxSU1MYtsPe+9dhselcF6up+qe/
         vXonWRo8z1zs6FvAwcBf21JhIG3DaHL6LxfxAjhWmuieoQAq+E+R+fqIiBC/E/c0Vrab
         cy0w==
X-Forwarded-Encrypted: i=1; AJvYcCUInprOXLN2KErSCQQ0zS7bDikW84fQR1D3fKbJmyuSfkEw4pyLy1YycUj+Gj2AGbkKJwA0eJYyD2V27pQ=@vger.kernel.org, AJvYcCUaM9DZG1tWcGqkXuWvbYB5dT08BPwEw1tvKCTeSpSaXEUvo2A8MgFMzOxWKmks76WhseJchh6vd4FB@vger.kernel.org
X-Gm-Message-State: AOJu0Yyd6UzYZ7krU9zPxSKK6gtntUlDMZFZBxgKeH/Ca8Z9jiccH58/
	WF23BLFpyCRs8uW0TTEPvvl89vPoqaAPe2lav/4XdiQj77liBHQJd+lcr62r2ZkAharPdyEWj/U
	CuD9mKhjvAxVAZO2wwj5/EFmDA+M=
X-Google-Smtp-Source: AGHT+IG8U2O0JlaeV3XL2hA3rYuCDHO/bv3RxpxnTOEEhuHSVTdsjEjXgklDwsovrSe8NIrNzLCVEZ/RPqQAGSwq5bs=
X-Received: by 2002:a17:907:971d:b0:a8a:715d:8739 with SMTP id
 a640c23a62f3a-a8a88856097mr336580066b.53.1725695650108; Sat, 07 Sep 2024
 00:54:10 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1725518229.git.zhoubinbin@loongson.cn> <c54fbc2582702689c005e1ba528ab2318b1adde6.1725518229.git.zhoubinbin@loongson.cn>
 <659f9214-1287-4e20-a25f-51ab3b4c8d6f@sirena.org.uk>
In-Reply-To: <659f9214-1287-4e20-a25f-51ab3b4c8d6f@sirena.org.uk>
From: Binbin Zhou <zhoubb.aaron@gmail.com>
Date: Sat, 7 Sep 2024 13:53:56 +0600
Message-ID: <CAMpQs4KdyzJwf3qJb77rMw8RR5gUgWf5zUhnTKmjWJaGUzAVGw@mail.gmail.com>
Subject: Re: [PATCH v1 05/10] ASoC: loongson: Improve code readability
To: Mark Brown <broonie@kernel.org>
Cc: Binbin Zhou <zhoubinbin@loongson.cn>, Huacai Chen <chenhuacai@loongson.cn>, 
	Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
	Huacai Chen <chenhuacai@kernel.org>, devicetree@vger.kernel.org, 
	linux-sound@vger.kernel.org, Xuerui Wang <kernel@xen0n.name>, loongarch@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 5, 2024 at 8:31=E2=80=AFPM Mark Brown <broonie@kernel.org> wrot=
e:
>
> On Thu, Sep 05, 2024 at 03:02:54PM +0800, Binbin Zhou wrote:
> > This patch attempts to clean up driver code formatting issues.
> > Mainly as follows:
> > 1. Use the BIT macro;
> > 2. Use dev_err_probe() in every error path in probe in loongson_card
> >    driver;
> > 3. Introduce loongson_card_acpi_find_device() to streamlined code.
>
> Please split these out into three separate patches to make them easier
> to review.  I see there's also some other code reordering and
> reformatting in there which should also be split out separately.  I
> think the changes are probably good overall but there's too much
> different stuff going on in one patch to check properly.

Hi Mark:

Thanks for your reply.

That was my fault, indeed this patch is too cluttered. I will try to
split them up and make them as a separate patch series.

Thanks.
Binbin
