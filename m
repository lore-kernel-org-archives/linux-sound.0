Received: from mail-ot1-f43.google.com (mail-ot1-f43.google.com [209.85.210.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C3CC2E11C8
	for <linux-sound@vger.kernel.org>; Tue,  7 Oct 2025 13:40:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759844412; cv=none; b=F2zXUAoNtGx9oLhXl4w3gPTm7qw2EiUPmE2OFh820aDsKqFzJGiEjjvS/M9/ERutKWeeARKKuwYR5KY9V3K3pW2xGm6v8WjywuHJmwYT7jNtoTdefVYoqPLVFf+WynF/VzbyAorFZMk19et9+/gaEbUDWGSPiDDrgdoeNhRVCYE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759844412; c=relaxed/simple;
	bh=B5zJo6+e9mfBQxyG03vxeQAF4XuA277T13ti7Xburds=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=i0F4gF7dRSAYx3WddBeBZUYcqokQdxnmPWS0YXI73xVSVoDmGpEMTvnsrzvCHHfHz4dv2wKwMLa5iF1eKY86Vrv96hsPjAeSUqpDkrbt2Gpa701GjOMHBrXVJYS33xA1DoxJ5e16WK5cwvTnNjomrHkzsc9bpwfNlCEZp4trsD0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SccgwECQ; arc=none smtp.client-ip=209.85.210.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SccgwECQ"
Received: by mail-ot1-f43.google.com with SMTP id 46e09a7af769-7a76561c291so3899796a34.1
        for <linux-sound@vger.kernel.org>; Tue, 07 Oct 2025 06:40:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759844410; x=1760449210; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vCQTFpOCLXGsaDGm5R3fay+Aj7gDLjtHX2II8z9luO4=;
        b=SccgwECQKdlHJtKHZTALExpUyJA1W2HAOQBisHi/IGW9k5Wo7/DZQAIh5LfVEtU/l+
         8EBnUmjayBl98gNHztXYG+UkJ2hTx8AIqZiCE5n7OToOWbEPIq884L2CnaOmFB91nioB
         9xNG5JkPpuYfawY+KY4AHR3gjLhuysUIwjJudDMKcEqeSntjeYVX9DNjbGIC9WydnIoo
         GuWFW4hgSGf2vx/Tz84C4lWiQqqd2Rd9aYgj1zSTSricBtRC4SqRx3+4sICZZJuJAXg3
         kEt8+rTp+1UNb2H2/qJ0YQKDU1UlsEoDkkAUri1wuRqtpSzZQ1PmqEtn0R5I7VEiyrEY
         E4tQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759844410; x=1760449210;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vCQTFpOCLXGsaDGm5R3fay+Aj7gDLjtHX2II8z9luO4=;
        b=hZXxWi1m26vV1xXapamiFEvw2kobeivvvhCBK2VJm/hMkhrT8V4dt/G0AOZthudIwE
         g+yfUe4crTYGttw7Fz0fBNZacRBqtnVFIvjisFa0xb36iF3Gtgybcql3akUnTXtzzVQ1
         NGsZE1YbhRGS/WiXiT8sQD7wjwNpfnCqHvjBSIiMnO75ImB8mkcZRbUAZjfm+n/qCGO5
         1626W/XrTewhcZeqYYzY8cKezkDiofE16I+2OX80rDrGnR1KbrDv0Ur/SIEBW0AMVyRr
         +ZWtnU35r2sri2Sa57CA4DKGyeZA8HDg6hm5CdlpUOipwjKmHw7bPsCKUw4CChnt5KLX
         CNvw==
X-Forwarded-Encrypted: i=1; AJvYcCXbe0T3o8Ye4UpQ0CDjEmTeYf9Y5P0yrRXATAkIR2k99nxiZ9x4v93nT6c2L/4aeN9lcQfIiyR62Gb3ww==@vger.kernel.org
X-Gm-Message-State: AOJu0YyCEUq32S1jxFlLg+poil2cvypQMzD7tTPi1JlMW4g6EVRzqhrd
	kiO4yfKjUzfD/cxhPNumzJpbWb1VcmDrLXQRB5FwJEILQSXYtBGKcntAbOuJjWTF/+ad9QQUJRH
	PJ7Z4vrPtPCbv28uEX+NCJdyfujEnI2c=
X-Gm-Gg: ASbGnctJFnzlgIDARDJYQrt4XuI+rKwcpSP9FmEXf4qUYJSqmGTmyduFdy9vu0//Se1
	o4Ww96n4tvGMy5yGr4PsK3QVEyCRCiA0KpUpX99JUmP+x1MhdP6021VNgpCsIlUEwW5yuDcHUyz
	c/WF62bHknYh0dqxXep7OeHgm1oZq+qp/Pt3u0TUbgNEbwu6g/Sb5ph1/6ymVKfckn0LULrM6as
	zK6478isqi0D1Fpxe0uqPzTHvhd2+A=
X-Google-Smtp-Source: AGHT+IFaX/eNzGSX/0xQ94MkT4x6GcjLTrj7/eYCQtsj7JxcgVbmL9x7FOv9ascQlxHmQ5isdD+BlSAOUJF4t34ed2Q=
X-Received: by 2002:a05:6830:67d9:b0:771:5ae2:fcde with SMTP id
 46e09a7af769-7bf772db651mr7720312a34.2.1759844410206; Tue, 07 Oct 2025
 06:40:10 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251003091304.3686-1-briansune@gmail.com> <aOTrsYllMst3oR03@opensource.cirrus.com>
 <CAN7C2SB5Re35yGYsqr14hGXde3nTKLX2Aa3ZbuJ9xuT0m07uxg@mail.gmail.com>
 <aOUDbF/i4+9PXc1j@opensource.cirrus.com> <CAN7C2SBsFQJ2qNe0HLfpG+6cuONtpChBnq6fuFkd_CGkLt2c5g@mail.gmail.com>
 <aOUSZ2pnxRfxEPi4@opensource.cirrus.com>
In-Reply-To: <aOUSZ2pnxRfxEPi4@opensource.cirrus.com>
From: Sune Brian <briansune@gmail.com>
Date: Tue, 7 Oct 2025 21:39:59 +0800
X-Gm-Features: AS18NWCJzGH3rZLWEXtfYgf2RrERANUmm3tsSEcxJkdLTt4vNPLp_FNxuVYAWqU
Message-ID: <CAN7C2SBDC2LrWpUTe3zZakHCrmUy1nQ-WiguLQKVK1CyOPb9zw@mail.gmail.com>
Subject: Re: [PATCH] sound/soc/codecs/wm8978: add missing BCLK divider setup
To: Charles Keepax <ckeepax@opensource.cirrus.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, linux-sound@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Charles Keepax <ckeepax@opensource.cirrus.com> =E6=96=BC 2025=E5=B9=B410=E6=
=9C=887=E6=97=A5 =E9=80=B1=E4=BA=8C =E4=B8=8B=E5=8D=889:15=E5=AF=AB=E9=81=
=93=EF=BC=9A
>
> On Tue, Oct 07, 2025 at 08:48:40PM +0800, Sune Brian wrote:
> > Charles Keepax <ckeepax@opensource.cirrus.com> =E6=96=BC 2025=E5=B9=B41=
0=E6=9C=887=E6=97=A5 =E9=80=B1=E4=BA=8C =E4=B8=8B=E5=8D=888:11=E5=AF=AB=E9=
=81=93=EF=BC=9A
> > > On Tue, Oct 07, 2025 at 07:22:10PM +0800, Sune Brian wrote:
> > > > Charles Keepax <ckeepax@opensource.cirrus.com> =E6=96=BC 2025=E5=B9=
=B410=E6=9C=887=E6=97=A5 =E9=80=B1=E4=BA=8C =E4=B8=8B=E5=8D=886:30=E5=AF=AB=
=E9=81=93=EF=BC=9A
> > > > > On Fri, Oct 03, 2025 at 05:13:04PM +0800, Brian Sune wrote:
> > > > > > The original WM8978 codec driver did not set the BCLK (bit cloc=
k)
> > > Its not missing its right there. That said your way is probably
> > > slightly more standard these days, but we should take care of the
> > > interaction between the two.
> >
> > What my missing meant is if run with DEBUG flag on that case had never
> > behave as expected.
> > MCLK and LRCLK both is correctly outputted. While the current
> > unpatched version will generate
> > wrong BCLK complete break the codec. As such I proposed the BCLK patch.
> > I had not investigate deep why it never calls but the "int div" is
> > loaded and computed by where is a bit puzzling.
> > And the loaded it simply with div on actual mclk/2/bit_per_channel is
> > also incorrect.
> > As mentioned in previous explanations, the clock register is a fix
> > table on dividing # that is a LUT with restricted # allowed.
>
> Yeah the existing code expects the machine driver to call
> snd_soc_dai_set_clkdiv. I am guessing you are using something
> like simple card that doesn't do this.
>
> To be clear the bulk of your patch is good, updating this in
> hw_params is probably more normal these days. But we need to
> make sure the two paths don't interfere with each other. Think
> of a system that is already calling snd_soc_dai_set_clkdiv() to
> set BCLKDIV, after your patch BCLKDIV will be set twice
> potentially to two different values and would generate no error
> messages.

Before the below action started. I need more background, if possible.
If my understand is correct on your ideas. Do you mean the default driver c=
alls
the bclkdiv on other places? But how could that bclkdiv # be correct
from first place?
As I had mentioned the div # ifself like this codec is a LUT rather
than the actual divided #?
For example /32 from LUT is a 3b101?
For example what if MCLK is set higher than /64 could even out of the
LUT from first place.
The external div # passed in, how to ensure it is codec LUT compatible
from first place?

>
> I think you have two options:
>
> 1) Remove WM8978_BCLKDIV from wm8978_set_dai_clkdiv. There are no
>    upstream users that I can see, so this should be fine. This
>    would mean an out of tree user of snd_soc_dai_set_clkdiv would
>    now get an error so they know they need to fix something.
> 2) Only run your dynamic BCLK code if wm8978_set_dai_clkdiv
>    hasn't been called. This would mean any out of tree users of
>    snd_soc_dai_set_clkdiv would have no problems everything would
>    keep working as before, but at the cost of a little complexity
>    in the code.
>
> I am happy with either approach so which ever you prefer is fine
> with me.
>
> Thanks,
> Charles
