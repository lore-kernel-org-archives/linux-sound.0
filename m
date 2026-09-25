Received: from mail-lr2-f35.google.com (mail-lr2-f35.google.com [74.125.230.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FC8E4A1E11
	for <linux-sound@vger.kernel.org>; Fri, 25 Sep 2026 16:25:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.230.99
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790353522; cv=pass; b=h5uRr/oNiDi/QcT3OFAIMvPHxvFDtEtVHOaw2cIk3jp/5kFT5BwDnj0t2zfg4dcDIQNNsBPyYxo4JqPTb71NAxATbdVzvBXCRsLAd5ONixoC+6HA3NXMGIucgyKdCaABFILiQsYgrKAUzZd2Z5nY4hn2bgOZlM3yEzKz0BvKtMI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790353522; c=relaxed/simple;
	bh=8zm7M4OxoFSvQ+TgH5PpjZhe1RxAkkquoTyQXaliDfY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=jx4Us41s5ONFxDzNysc5mY81muTw0g4xclxTOmOxrvLOkONjr2tlfSX7TCEVIWOdnMATPJSmvc7+wIcMktDTxe5nyO+NQuyxeY15B+ep0OC5gEf4LBpdbaPqlOhY+is4gR3WRF6IQJQNab1tbS1r497j+p8kNbU6O3QZPe6VNe0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HeWQ8mVY; arc=pass smtp.client-ip=74.125.230.99
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HeWQ8mVY"
Received: by mail-lr2-f35.google.com with SMTP id 38308e7fff4ca-3a49c068e85so7765501fa.2
        for <linux-sound@vger.kernel.org>; Fri, 25 Sep 2026 09:25:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790353518; cv=none;
        d=google.com; s=arc-20260327;
        b=POk8XhEj9F8QCYW8uvJZYScX2YSgppWxxAApdpZQ7lawkFBWc2z2py8fJmDZgXPOiy
         yuQD3dowHWFbYlCMLLZC2CUF9Cr1oyzDov3KZPR3Jh2gh19lXTRk2DSPXMXTGpavzQe9
         Z0eurI/h72rhydZYe8UEpmOdDlXzbJHdKiZjQ10wB89CVggHzfXAwj6vV0/0qlXgnNE2
         DUkExOfbXZgQwwCb2Le94sxDjsmVs8/xlCoMHolCwvLcJLawV7POCopXrykxgVRkMhtJ
         DNMD9/a7fhvq8tDDLdr4UFRooejWZ9oRc6nW8sGH+rlM/ZugpXQEX3l64MYCj/Ozexhl
         6alw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=iLeLfpbYpsHoDt+ljmKBY+6pn+0K/uh1JAal5HfsYCY=;
        fh=LZj9G8jW/IFFqAO21kYZmDwPUOxR0PyQQVXAM8XrHEc=;
        b=BixKgsj0FTnhV1qOhTsYxnL2mFHqP2/tXSmNuShHLFB0/EWfOAdluXjH+sCZ3oVz4Q
         qeIlwUaWiGdnG9eKVoGqtwlakrSQmiFK+I6kT4wraaksOIgbBukENM5ekIiWPfmVA+0a
         CRS1W2X5hZnesjWbZLO8Irblg1WzjCCass4XFjBWItIloIhYrmGjsEeHAea/Mm2Fezv6
         zLCAM8jUarjqezKpWRe9gKApTE8teJn40SChfez9PMXji3OcU6ppU5meCbAV9yIdrytV
         mjmJRxXctNuQDaWz3NdvJVXiDcpLkeB6i9yk1LGodtZDFR8kQUWJpAfEaQ1GDm+37hUv
         Pb2A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790353518; x=1790958318; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=iLeLfpbYpsHoDt+ljmKBY+6pn+0K/uh1JAal5HfsYCY=;
        b=HeWQ8mVY1pQirJU9xHFq4lCkQi1F7yZ6JBXYKyWRvFkCn1eylZNitxk2Mo/CNLt3hX
         ziSRkNV6ffihFnkYD2Xcgr9O2EpMTL2d99kJyq5hSGxiapuS2ewnqiOI+qXdXIYc7tFF
         6Fo+zMm08FXTqXEvxbqNxPnvQjiFT1PJjsOGmipZwHLPwbi8h+CEMCNhcfxtDvWSKuTr
         Bq1DGVh8xRW29FaR43WVmKyTBX05UHCUwru4CpxLPRqBGNOFlci8XfjjRJIFEpeRXNZU
         J8ZxjS6+sCO4EA7zZvHbZDQACugAh81WPByRmGWQIXc7DrAPbUD/WtCVHI7YCOVppxP1
         VZqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790353518; x=1790958318;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=iLeLfpbYpsHoDt+ljmKBY+6pn+0K/uh1JAal5HfsYCY=;
        b=DPoFK3bBjOaKsqUThMNphJQ6O5cl3l4/tAWttsUaa0wQIUWOqxq0FP8e/D8O1idOUR
         rwbAF8io5G6a09ht9nA8xpkZN40AsgWsvFofYp7OAKy4wn3MMXBH/S3eYri2SeEUE9S8
         72c1dO4HSV2gfjmhH0jIjAZzliWdnyoz5Lo//+ciWmjU4+PyJQlYTbdwylBNa9PdjBk+
         7STBLllIJr9BCCs9gzhLAS51IuHsdTIUk0gBWuLyWyDjWeJzgGw7bUbgI0a7jBcIO129
         25jsEniiHSrYk2YynuEYP+tFf5LmRhWxD1EwAmPUZpieAjScn/3o+EFhWxx6SJwY6bo1
         UJ6A==
X-Forwarded-Encrypted: i=1; AKwUvBwDzLbP6vZqyiBOPtoh6bXbb+r/Iw2Q3/n527c5UDLUTV39ZpX7V5rA6IHGbQjhwuCSZww7zf0iA6Rfng==@vger.kernel.org
X-Gm-Message-State: AFuF++lwmZZlpQtt/Jx1gXdpGXnHpnusta+zuO7KqTHqm6kNKIAB8doh
	l8IkCwG47/dtJ6rhOJ8XyjlF+qJV6PMZA6lgTQ2ltV4VNtoU4Lrt2p6eYVwgjCgx1Bmr8YArpiC
	iKVhhoqS43i4J9ELPYmzDFMkFLeAS/XY=
X-Gm-Gg: AYBFou1D4r3MgZRGppUE5iWDDGIGmDYppz4aeKjfDd0/IJDnUqf9Ah7M8aRLYZcVXEO
	Z53kQl9z9EvkHoEWVVL0Tfh34Q1sRBMoW5mawS6h9M1bfL1wLx9OMZQmLcVm3BabHnD8xYSM5L8
	uAvHvKAinXQ+vnNAbW1phZiw2qhfUG44Tzpc8mqoQpLTD76bFI1CBjXToEtKa9UKboiTmn2NMTM
	ZXev4IOr6SuzedlYyyAajAWMMAACCOSyG7qyK5aqL0oqV/LTCaIdk88rp+RjTunx3+kF7YeIdIf
	wusTsMcM1/ryvifnUMIgRxgDZYytvxUHY5bChlKfwCpkdPX798eQ4c5kvayEQTFtkii4FaCCLSA
	L3c4kt939O+0wQKiZglFaVoMk0OfGwdDSEFAAFVknF0k=
X-Received: by 2002:a2e:bc1e:0:b0:3a5:b187:c7a1 with SMTP id
 38308e7fff4ca-3a63bf4fb7cmr16159921fa.9.1790353518313; Fri, 25 Sep 2026
 09:25:18 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260925-aw88166-cleanup-v1-0-11f74cb5fe28@gmail.com>
 <20260925-aw88166-cleanup-v1-6-11f74cb5fe28@gmail.com> <721467a7-6b7e-4234-8321-660eb43f1f9c@sirena.org.uk>
 <CALHNRZ-ofi9J6SZpKih5pogtH4aL_HDy3WmUQJ=w_nVd=YskTw@mail.gmail.com> <d11d2b20-74ec-408c-bd06-765ccdea1504@sirena.org.uk>
In-Reply-To: <d11d2b20-74ec-408c-bd06-765ccdea1504@sirena.org.uk>
From: Aaron Kling <webgeek1234@gmail.com>
Date: Fri, 25 Sep 2026 11:25:06 -0500
X-Gm-Features: AclHuK8p1YRovjIsB1rIwKZPdfnnCz8fE1woFYGlsyQTwiHN-svfCGDW5y0jElY
Message-ID: <CALHNRZ_GTEsbAr6Byo_DtHG2VMqS+daJMM4=a+icbnu=h1Bj-w@mail.gmail.com>
Subject: Re: [PATCH 6/6] ASoC: codecs: aw88166: make volume control usable
To: Mark Brown <broonie@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
	Weidong Wang <wangweidong.a@awinic.com>, linux-sound@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Val Packett <val@packett.cool>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 25, 2026 at 11:18=E2=80=AFAM Mark Brown <broonie@kernel.org> wr=
ote:
>
> On Fri, Sep 25, 2026 at 11:05:42AM -0500, Aaron Kling wrote:
> > On Fri, Sep 25, 2026 at 9:18=E2=80=AFAM Mark Brown <broonie@kernel.org>=
 wrote:
> > > On Fri, Sep 25, 2026 at 02:47:34AM -0500, Aaron Kling via B4 Relay wr=
ote:
>
> > > > - Invert the value to match userspace expectations (in the hardware=
,
> > > >   positive numbers represent negative dB attenuation)
>
> > > That's a very bad compatibility break, if anyone has a profile saved
> > > they might get excessively loud volume from their existing configurat=
ion
> > > which could be distressing.  It might be better to rename the control=
.
>
> > Mmm. At the risk of sounding like a broken record, is this any
> > different from the accepted aw88261 change? I wouldn't be specifically
> > opposed to a new control as my use case, Android, is very tightly
> > controlled and I can just update the audio config I ship. But more
> > standard Linux use cases that rely on a standardize control name would
> > be stuck with a non-standard inverted control forever.
>
> Why would renaming the control do that?

I might be misunderstanding something, but I thought there were
standardized names, like this "PCM Playback Volume" that tools and os
handling expect and will use if found. Which would cause a second
control with a different name to not get used. Is there something I'm
missing to where a new control would get used without manual
intervention?

Aaron
