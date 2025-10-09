Received: from mail-oi1-f172.google.com (mail-oi1-f172.google.com [209.85.167.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A961A34BA3B
	for <linux-sound@vger.kernel.org>; Thu,  9 Oct 2025 01:38:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759973927; cv=none; b=lwMwXJjmqYiBAW5BAqvapRgiAbO5mvAHxnzZqxcD9Q/xe/nsTaATTdQUniZbtLYSvrLeAd/nZPj+wfN3Bo0F6kTFJIO/d8NkbjDAyGWsvtkcllmOSvrUbAKKT2d14z/hBdcG79WadrNB3jrPNsbNvjMrvFFinzTy9W/hxvH8fj8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759973927; c=relaxed/simple;
	bh=6nrMOtELpBLmErAHhpvH82Oyr1lIyTdGtpID2+/TO4E=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=g+FAnkRcDdYsJEQ3ol6ETlZYkmJQ2dScOTA5MpWkQzW15ne3Yi1TgtgTP0HihrtS0wxjCPuTpau9xUA44nchU95wclja9nm2ORXGekdSmiv+eEb42HKjabhxpFo2R7vmq1gCv//OkJUuYyM03UYlMZExzAgquzRgR0wmyuDj7C8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NRUBcHKv; arc=none smtp.client-ip=209.85.167.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NRUBcHKv"
Received: by mail-oi1-f172.google.com with SMTP id 5614622812f47-43f696ebf8eso151253b6e.0
        for <linux-sound@vger.kernel.org>; Wed, 08 Oct 2025 18:38:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759973925; x=1760578725; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=x4OU+6d4XHNyYe2vaJ5HulojqcfOOX6yJg+zBKOwOLk=;
        b=NRUBcHKvdojRU9zvreLo6dbEvydIgO2z0lHNqHPTWnyxP5/+HnM6apXvHfnSRii//l
         J9edXS8ilHtd5VAs9nXqbSUgDnV025uucHgu66ovcBX9RHaA5v7ShhqqAsqBidrprFGV
         902LCc3SOK0Zxn0QS9yHBDnvDhwqcDqsdWfcXfuFARwkyD06ZlsBiqUURX4h2H8tG+vO
         pvc2zQA+T+mSPQA0Tv4dnBBkGHX0jmB8bFPaG+T++4DrAgwaUIHhoNE8uvu445Tcs4ts
         De8aij/HmF3M9S2f+rt3gP1lfzchSY+HJ/dtTvkPm/7UwfyNGK/6dMJT6M4mEVIM16be
         dqBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759973925; x=1760578725;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=x4OU+6d4XHNyYe2vaJ5HulojqcfOOX6yJg+zBKOwOLk=;
        b=Rai4eNSXtfCWMxVQhH75PnVIHu+9Be1HrZwLCWzOYxN957saZaBw4L7YuggTM75Hi6
         BEIn2QXjN3x6HF5dQiy0Ct3QAcHvyROdoHksgSm6U+ywOQgTVPDnPHMNrWSXglEyw11H
         MaGb70kdvMtGNMQVozJzJgt8D1+1P8sHFpXSAbGrEilqVEYXNqXEJI0pj/YWpXqrIvxd
         ol7EggNV/r4w21xSfKiFdEcZJ+RZDiam+06vr359qL+nqKcB92DsGUQECCE5FJtTCiUy
         bCGUhYiYDlb8GUsOpCInfFFk1GPYiCIgPNikt1RgK8iXgoWlMSA9xry2nohI0ZfQuAho
         mHeg==
X-Forwarded-Encrypted: i=1; AJvYcCVM4+3MbU8ZaV/NZFcGkVYxQEPs4GUAPNlJPqoKlx/+yJmr5WR6peyPoh+SJeo6lZWIrr6+AT+h71EQLw==@vger.kernel.org
X-Gm-Message-State: AOJu0YwSwk9zVlRY7cddTOy62y5qV8+NSqNdM4st+W5/bkswMDQG2Pt7
	eT+twtKyHTV0Wm58sXlcOxXrbwS9SVNqblgNRpy4QlIkjPppa7wheCRwlutN4GjJ5zQTWsK7E68
	4w/yqqE3aN2KsB0I8DHSnQJuXBrJv6SE=
X-Gm-Gg: ASbGncvY/Dq8G/eExiPbBOB3GkqtcafxXYda7DXBSI7+UeCYtvk0Lfr5xkJmTyxnCuE
	Sgyr7eaFtNjz9q8AsaWwD22wpjklvlTyuel7eAvqKEFHkW54QJjEKGbu49je7IhIt3+3Ue/ujaL
	IIecq4ZHLZ1v6n0gra6VVcZf+6km2JGYKeGDT3R+BDTm+/LQJLjpZgUeQjpO1LX8Yh0Y/oxENNg
	+4exQyKsz5uwO8xJVdGA7YVzNtvKjA=
X-Google-Smtp-Source: AGHT+IEoA4Bvx1E4ZcP6qArxORWElQD4CExZH+e7IkeOBTHua4YCh9pjvgZBR17pP7bTL1f6rCYOx0ouIUFlq8ENpj4=
X-Received: by 2002:a05:6808:1909:b0:441:8f74:e81 with SMTP id
 5614622812f47-4418f741a75mr130795b6e.59.1759973924521; Wed, 08 Oct 2025
 18:38:44 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251008162719.1829-1-briansune@gmail.com> <aOacZAiWxG9XfWLS@opensource.cirrus.com>
In-Reply-To: <aOacZAiWxG9XfWLS@opensource.cirrus.com>
From: Sune Brian <briansune@gmail.com>
Date: Thu, 9 Oct 2025 09:38:33 +0800
X-Gm-Features: AS18NWAU7au0dqPFWIf36aNFX-XQyhsxQx8vzY3DKLyxxYLexG4DEIy-dDxCkNQ
Message-ID: <CAN7C2SDa2WXKVw6XdR+2K0nAjkjy3JH6e+h7d0i9wDNyoXEyBA@mail.gmail.com>
Subject: Re: [PATCH v5] ASoC: wm8978: add missing BCLK divider setup
To: Charles Keepax <ckeepax@opensource.cirrus.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, linux-sound@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Charles Keepax <ckeepax@opensource.cirrus.com> =E6=96=BC 2025=E5=B9=B410=E6=
=9C=889=E6=97=A5 =E9=80=B1=E5=9B=9B =E4=B8=8A=E5=8D=881:16=E5=AF=AB=E9=81=
=93=EF=BC=9A

> [1] https://www.nxp.com/docs/en/user-manual/UM11732.pdf

At the end of the day. After refreshing myself a bit,
I want to cleanup what this document trying to proposed.
From beginning I am very clear on what I am understood.
Along the discussions I am been mislead  by this parties
as well.
What the standard about extra bit is ignore is not because

1: BCLK clock rate allow faster
2: BCLK is not relayed by MCLK and LRCLK

Explains

What IIS inherent design.
1: in order to form a 24 bit counter 6 flops is required.
As such then counting 32 / channel hence 64 bit.

2:To divide BCLK to form LRCLK then this 64 ticks are
ran. As such when a 24  bit data format is used, extra
8 bit is ignored as such division can form proper bounded S.R.

3: With this ignore bit method less die size power on VLSI.
Simplified 8,12,16,24,32 data format while LRCLK vs BCLK is
bounded.

4: As such, this is no the concept of overclocking
BCLK to fit all those how argue about BCLK is faster to etc.

So agree to disagree. I never accept the concept of
overclock on IIS. And this is not what bit is ignored intended!

Brian
