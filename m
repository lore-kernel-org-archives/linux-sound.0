Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 095E0351C03
	for <linux-sound@vger.kernel.org>; Tue, 21 Apr 2026 19:32:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776799964; cv=pass; b=fBKgh2nt6FIruivJvdEqV7F6PN1UFrTSJvVdUB2/Lk3l8BfHT2t2IWW4FXoZY1FFE7+402w3Q21vqSMi7P59/EgW3h3C1+dwKJlWYRa8FqyUByL/KUwr8NR0S2vrZOqVlx6cnmjGWJxJRHJxfAwSTxowQ4KaYrDJraYtnvte/5k=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776799964; c=relaxed/simple;
	bh=8rAcJsOtW4DKD45tYEB520aiSA9byMlCQPJXjvwG7nA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ZU/F7gG+yJvZrZQJeXu2Q9wHX3fOslK80PktwJpWpxuOeqsEuzMRj+Or5Su4MCdj8uBrUGwYbkhtsg3yS81ilxZ7W1KPvPM9FUQ+rPcyPaNOs4Vcqx8msLttr+/G4dyS0PgDTnXBYZkJg46mlaN3icEV9uWkdXxGym+kEHpdZLM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=U0KCOWfe; arc=pass smtp.client-ip=209.85.167.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="U0KCOWfe"
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-59e4a04f059so5220722e87.2
        for <linux-sound@vger.kernel.org>; Tue, 21 Apr 2026 12:32:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1776799961; cv=none;
        d=google.com; s=arc-20240605;
        b=lqVK0s+SEX62+Li5Ayd2mcLUQ+vct6Ji32dmNy+dEu6CYpnmZ1YFTP2JiNctgi18X4
         7tzM25FePrll8GVLp/4vG5C3FgLqgUzSOrloojr2dgXckhweSZcRx5NMGzpyf+9KcGGO
         eEm4U0HakeSzosTaqqcWIIk5PJb/mt/fna6redN0Vyft0ZBMNh4fQIXbxffZcDiNYrZ7
         RZN26e5BUR5X6pDFbH4/dEzYKymlJt07kOAMSMz78s1M9bZMorQeGM7m/Zy0BlUrjOIO
         YLfVm0sqbS+W57Rjg2AI+vipOcU/KMa2z9ghrhhh+NfY2RQQfj7YuDPMB8rtyg9uDFgb
         p5yA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Lp5MwWSsbki+8BWZZD+t7QmXkch16LZxPn5fqnVKkr4=;
        fh=ctGeNtL2MZymNTbXd/0qzaCHM+VSr7H0OKEwQOhLXvE=;
        b=fivA43+y+75/9WyHSbHqSmR8jCSxiKHB277Ff+urZSwCOf3gu2G0xfuJxZkPz49D5I
         TM5udgL62sK12gEbD20UPPnHFPCA2V1AZFayrXEMrxN6OWAYijWBNgn9hZ+F9Q4ewDkC
         ++DylWrDm/ZXh3giBZlppmfQ3u/bHTFWgU9F4vRj1LxnJRdErZHfYaA3MadFHvfD09gh
         1CXMw4XcRolL1X3YLoLJPmTmutcDuVoSOFXD4YJoPeZ2S651F93NHkylFVJxYO4G5vU6
         ryW1bFnXk4nrteqvZwhaBN0PBhSqK/chC+SHD4ZPbRgA+x35TQ0Cbg1KjJoCks4MTBOQ
         MPDA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776799961; x=1777404761; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Lp5MwWSsbki+8BWZZD+t7QmXkch16LZxPn5fqnVKkr4=;
        b=U0KCOWfef/qBQrkyOJSDmmpcjmo7arG2hPWTEiyPs2yT//CHKCf1ZIMagH2A6u6+mb
         tgPOt/HEIfV3Eesx/70f2MDJ2fMlGbaqEHhTPdrQbrhEO/bggpGbR+exmIjmuHVCBWxC
         HiAXA4lHem2UthqT2kUUY01Mn92A50aeytCNWiX+NMWwsem8VtvyiAXGU5+QNFjnrYQB
         wQVnTkcGXS0Oe33ClkWXuqBTHWIOhACIX3izkzKzQ9/YUe1Lpodpd72FNCV8p5y5f3WS
         W+ihiyTMY6F9XUxhrw2iI7ugRUFmgDRLHv2pK70K2ay0S9DmGZyWvl+z2VjNp6yrgHYC
         ZgQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776799961; x=1777404761;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Lp5MwWSsbki+8BWZZD+t7QmXkch16LZxPn5fqnVKkr4=;
        b=UXUloP7xFwO9IJevM6bisL94GsslRdaxkOG+j+8BrDoaLPSy8oaJD62H0hI9bSVkLk
         iM9zRVjAsNPLcihErCJtmgfJ+xblxMxopCamids83kTsZgkjL15mQHp2UEjtL6dy9hBv
         jjUjNHP/7ffgggxk55Z4+Bzo0ItKLll9zZmkCJ59WjhRdCcfvAdhRZvfvMOvBAdovE+7
         B8d+isDvC5CB3zOAWs+2+11F30Th/Vc+TZvpwZakLFHPU2bW4dT64VLiGypBZvHdYjkP
         x7Y6WOko0pYEkB2oR+Or3nnJcIVnL/HJBQ4DIMRR5e/njvM5ppE/l8HRKL0LqKfMkxkf
         FqSg==
X-Forwarded-Encrypted: i=1; AFNElJ9l7CoY97/dVS/KlzhK+lSDy2FGxSih77uwyDoGd+Z095JAuTV/yClboV/GMtrpxToCNlaUPbV23QCQKA==@vger.kernel.org
X-Gm-Message-State: AOJu0YyqV6kMvA1EpBXmTAFnCs30Iv33nsd01DYzBfY7IMokVSXertqV
	iwDK8zYIxUmCbcb90f14fWInqVm5zw7JpVRN3wDiYxjzzM7rNSTESrogicHYgfN9a5hibsH91Xb
	mMqwaNUDn8+DhQmOuJ6H55ppLqd2wF+M=
X-Gm-Gg: AeBDievLdOZbCPslCwFm5rtTPixjhqSTRIwDwK7Dl4S8Dzgevp1ChkwWZ/KBVfkzEk7
	BXhzYQ6z82X4TxS+ajawRcEFY7GsBAAh4/Io/vnwfJ1XOtYNtD7+88jlQonT+F3uilgKFJGKsQJ
	xDBw8k27ZTlWG2VMDPBQSJ2KKvkB48z6g3sZkMvjo0Dmy7l0zFbzagC5Mpd/cJx+1gEgffXt5sL
	isow9ouFt5ZsGMq1Cuzr0Erh54svTsi/wvEz200OPUxtjcG8uA/6Ep5sEgRmWy98s2/V6MbORhW
	fia9KHWrNdCfpe19bu8s5sDkvJe0euAJQ2lwMrzWNwSsFuBGaS0f
X-Received: by 2002:a05:6512:39d3:b0:5a3:6734:48ae with SMTP id
 2adb3069b0e04-5a4172ebef7mr6518200e87.40.1776799960988; Tue, 21 Apr 2026
 12:32:40 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260327121919.603768-1-padmashreess2006@gmail.com>
 <20260414034854.461661-1-padmashreess2006@gmail.com> <20260414-tentacled-mantis-of-control-cb08f3@quoll>
 <CAEjBr-bdNvgBWjHei4K8LLH6QjkgHXCwtmW5qGoeh_36Vy8kWA@mail.gmail.com> <5cd2b36b-de7d-c51d-f495-6ce78fe5a8d4@gmail.com>
In-Reply-To: <5cd2b36b-de7d-c51d-f495-6ce78fe5a8d4@gmail.com>
From: Padmashree S S <padmashreess2006@gmail.com>
Date: Wed, 22 Apr 2026 01:02:27 +0530
X-Gm-Features: AQROBzAkL16A_ScsBRTcdIvJEzKEVKZiM7-iIGei2JZekFMz9TeDEu_VrJvpYJ4
Message-ID: <CAEjBr-YQte6QpjX+AR9woJ-tf2n7s+8hVuTMJP7Ne6tFLMEMBg@mail.gmail.com>
Subject: Re: [PATCH v4] ASoC: dt-bindings: ti,pcm3060: add descriptions and
 rename binding
To: Kirill Marinushkin <k.marinushkin@gmail.com>
Cc: lgirdwood@gmail.com, broonie@kernel.org, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, linux-sound@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Krzysztof Kozlowski <krzk@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Thank you for the review. I will add the reg description and squash the pat=
ch!

On Wed, Apr 15, 2026 at 12:46=E2=80=AFAM Kirill Marinushkin
<k.marinushkin@gmail.com> wrote:
>
> Hello Padmashree,
>
>
> Allow me to once more propose this description, which
>
> was in the original .txt, and you included into the patch v1, but
> removed for v3:
>
>
>  > + reg:
>
>  > + maxItems: 1
>
>  > + description: The I2C address of the device or SPI chip select number=
.
>
>
> You also probably would like to squash patch v4 with the previous patch v=
3
>
>
> Best regards,
>
> Kirill
>
>
> On 4/14/26 3:22 PM, Padmashree S S wrote:
> > On Tue, Apr 14, 2026 at 12:09=E2=80=AFPM Krzysztof Kozlowski <krzk@kern=
el.org> wrote:
> >> On Tue, Apr 14, 2026 at 09:18:54AM +0530, Padmashree S S wrote:
> >>> Add description to reg property and overall binding mentioning that t=
his
> >>> driver supports both I2C and SPI. Rename binding to match compatible
> >>> naming convention.
> >>>
> >>> Signed-off-by: Padmashree S S <padmashreess2006@gmail.com>
> >>> ---
> >>> Changes in v4:
> >>>    - Rename binding from pcm3060 to ti,pcm3060
> >>>    - Add binding description
> >>>    - Add description to 'reg' property
> >>>    - Remove unused label in example
> >>>
> >>> Changes in v3:
> >>>    - Remove description from 'reg' property
> >>> ---
> >>>   .../bindings/sound/{pcm3060.yaml =3D> ti,pcm3060.yaml}   | 10 +++++=
-----
> >> What v4 is that of? There is no such file.
> >>
> >> Do not attach (thread) your patchsets to some other threads (unrelated
> >> or older versions). This buries them deep in the mailbox and might
> >> interfere with applying entire sets. See also:
> >> https://elixir.bootlin.com/linux/v6.16-rc2/source/Documentation/proces=
s/submitting-patches.rst#L830
> >>
> >> Best regards,
> >> Krzysztof
> >>
> > Thanks for pointing this out.
> >
> > Since this is a DT binding patch for the same pcm3060 device, I linked
> > it to the previous version. However, I realize the subject changed
> > significantly, which made the threading confusing.
> >
> > I=E2=80=99m planning to resend it as a new patch in a separate thread. =
Please
> > let me know if that works.
