Received: from mail-oi1-f172.google.com (mail-oi1-f172.google.com [209.85.167.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A67822EBB86
	for <linux-sound@vger.kernel.org>; Thu,  9 Oct 2025 15:03:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760022192; cv=none; b=UJZPiTevyv9UZFPKy3V6f2HDHUrlS5GHk0LjaaYUqZV8gIPhAIG/nhIoNjmQNm/+BgIvuqpyKZqzel84UpSyXXpEaqXzfenbJE2lyZnrP4rmr2o/thQ+JsCOdM2eaBzSEnzr01ScWfhTPggOCTSoS7eCeDpsDNRJRygglvtleu4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760022192; c=relaxed/simple;
	bh=4BYiBUJA2xuVMrn0owdsZSPlnr1Hd4TIlmp7Db9dIiY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=EF0LfZbERhgJV5kgliZd91eYg+J83PWRBzvaYnJ2s6okxuHA17eF3M0WIKyvieurzwo+PSkBpjHsECnqYyWIL7nuQbDjdBu3Y+6MNZZVKrOZ2NMMpSP1bJatyPnRjYOqCMAcQO6OPxLB9Km/gumCnrC9MUa4Bb+Bzrs1VugTIuc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gAH4+PGM; arc=none smtp.client-ip=209.85.167.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gAH4+PGM"
Received: by mail-oi1-f172.google.com with SMTP id 5614622812f47-43feeae5e8eso675693b6e.3
        for <linux-sound@vger.kernel.org>; Thu, 09 Oct 2025 08:03:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760022190; x=1760626990; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4BYiBUJA2xuVMrn0owdsZSPlnr1Hd4TIlmp7Db9dIiY=;
        b=gAH4+PGMXGHwPF8DW+4WJFvtMtAZG+jIB4M4B2XGl5BjLtPtNJm9J6E7kqk7CbVhI7
         NbOvmYiq04evywZOkG2aJNvG69+01NVlkljxMSQ6QDK6eprrv8GQEqRB2uHTLZOgWVl6
         Z2lrNLiu7EBsn/KpWGD/BciGooYBrCG6CyqoK1d/p5n6jE4XtdnmU6Nt6J/vwezMCtHT
         dpVrBhJQH2jBERwXM7gjkOpfVSbiChLwn3sjqG05MWrpAPYSQURC96fgZLeTDLNjtqg6
         tA/TcRU90cxB7ppBMA3xvtSxsov2mB00YfpBPCig1JVHtgqFba/WCK2sN9tY6LEyvrjI
         UlQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760022190; x=1760626990;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4BYiBUJA2xuVMrn0owdsZSPlnr1Hd4TIlmp7Db9dIiY=;
        b=OVFOgWFyXvIhWW1ABW176J/8qL9c55DHjDi4AQRLMDx+QWaJHJTouZ+RPpcFlUlZWb
         ldRPobTh1z2b4gesapUSe0QZaquRgNIlBkHHxdmJ37BM1ypBO8s5gyqK3iXkbglGkhqc
         wfeMp7g8M6rIYhjKncitrooSHJTvH43pKyxdvWvSZjiQr1P2+p/y5DgPencCHFx2L2QI
         YtyDbvpYlxplPrqvAu+Umu+9d3DvpJ+gNGR98YBqJixl28MQvm8sdInBJr0nOH7kyPPN
         qC/5XTSWqDM+CRDc7Ns128HtMgbnPJ6KsPSKuWadNQ9DPBIcMhFI0nu3/S+d2SQ389Cq
         lAmQ==
X-Forwarded-Encrypted: i=1; AJvYcCXb3TWLa8k4pF4nwIopNzjyeTkuScONbXcIRFgxgd7yQJf685M8KcRIFg2Pv3/+QiNNqFIOe4eBepETJQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YwK8WoM73F7zCrnv+/MU3/Sldclamv3y4HDgxjkSDbikQ1RLpwR
	0RFCSGawTDY17TQWlZA7uM/TZOK0XLaDSsgynM/RQIJVOmIxhL5yJw4JHbFG38+HPAI7B7AWDd0
	JVAizPWE7ZcYrDQuAR4z+K5JHL80b+TY=
X-Gm-Gg: ASbGncvBGksRIuiE90DHfI4m13u5EnkDCdnaLzem3nyirKn7liUbe+au4FX3t9vZDX/
	pvBRogkBMaRfOygmaAfUptELC0kPBsznwQt8RuwO3sjfyHw/6hPfRSDQZFDJnGr83CRC0nBD/z4
	Cv1EzSITnS3DWdvuDN+5Xi+0ItWJo/AyAmvmHjDHabh0ucCl+KiW8aN6Bo65Nqbn/g0M97a/+Oc
	szUznFrEn2RN6zVo8GIw1jSqA5rmw5u2YsbySA0vw==
X-Google-Smtp-Source: AGHT+IFE+53ZwFZzygjApNRRk5IEXCWznQkiRJ3RFYsMZB+Snff4Qd2QBaS8PE2SAmylXqZYXSTkseD3wSbRcGsymC8=
X-Received: by 2002:a05:6808:1a08:b0:43f:57cb:7fa0 with SMTP id
 5614622812f47-4417b3e74dbmr3269515b6e.46.1760022189283; Thu, 09 Oct 2025
 08:03:09 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251008205207.1781-1-briansune@gmail.com> <aOd9yUj9H4L4fbtc@opensource.cirrus.com>
In-Reply-To: <aOd9yUj9H4L4fbtc@opensource.cirrus.com>
From: Sune Brian <briansune@gmail.com>
Date: Thu, 9 Oct 2025 23:02:57 +0800
X-Gm-Features: AS18NWDmwyXy1cfw3926lFmS_Pq4UdpsOBDp743TG8q62eoh-RX9vdnszMNCTZc
Message-ID: <CAN7C2SBd8tDXG8OkjRt0sDw1OmtrLgtuStEfr=f=JHZMRvjq9w@mail.gmail.com>
Subject: Re: [PATCH v6] ASoC: wm8978: add missing BCLK divider setup
To: Charles Keepax <ckeepax@opensource.cirrus.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, linux-sound@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Charles Keepax <ckeepax@opensource.cirrus.com> =E6=96=BC 2025=E5=B9=B410=E6=
=9C=889=E6=97=A5 =E9=80=B1=E5=9B=9B =E4=B8=8B=E5=8D=885:18=E5=AF=AB=E9=81=
=93=EF=BC=9A

> Reviewed-by: Charles Keepax <ckeepax@opensource.cirrus.com>
>
> Thanks,
> Charles

Any documentations are required?
i.e. .rst file or similar?

Brian
