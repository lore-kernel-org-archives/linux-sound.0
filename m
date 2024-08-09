Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5EF16191F65
	for <linux-sound@vger.kernel.org>; Fri,  9 Aug 2024 09:12:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723194760; cv=none; b=fBpm+mV4Fru9QkaP9XrMdPhpd9Y1/IB5nL8wHe7exrOUjzzbNNI2cgYfMpC77lV8bQ1bR+23zuwNOFO0sqmG3ffuTDbOoukJi+ORpztOSMw/MZW8VDEt6rvbCTLUO4tOQfCS9vaCdZ5JS1iyxRV7c3U3VZZXZJAzeTpPpy50yco=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723194760; c=relaxed/simple;
	bh=iLzGfAYReosnIhXCk1VOcUKl/i0/LVKCJemQ52zsYcY=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:From:To:Cc:
	 References:In-Reply-To; b=cN2d6pMT9gxKoeceqW6od1cTACfSaVIaVIjATJ2h7ttuSl771IrPw/8ZycGsFvZwX6vTADErQVlchCRCnkJq7DWUhZA9OCMmLA1MzcjHMBDlXE6Q7OZMH1fPlHfEnGRmebE//vPga/mH3Doe2SDIq7oGC/rRhtdWuWuxW+Ebyh8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=TTD+G6Sg; arc=none smtp.client-ip=209.85.208.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="TTD+G6Sg"
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-5bb8e62570fso2226721a12.1
        for <linux-sound@vger.kernel.org>; Fri, 09 Aug 2024 02:12:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1723194757; x=1723799557; darn=vger.kernel.org;
        h=in-reply-to:references:cc:to:from:subject:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/g1EWdSRyPvJJ8eyFtdobneAEkMnKZn9VHRowDdqkMs=;
        b=TTD+G6Sg3RkVbYTiP0xWzcz2Umah3VWczSIWqQrpWtNGpvN4Q42O1oVtNdE0DBoEIV
         WE5eMozONdAzBkHVl+DXF6agpKGNuX6CyTKhEcWsqenYUAEj+3RQxY3yIaeGuLu9NBjK
         d4IKcB5k+FIKEEN1CJxrR/iovo8J4+3BMmB/q43tjPl+D1iye4ub1B+fU1Q+dwtUfdbw
         G5L2GwsXPNBHfN/DO7IOX2wZCE3BXr9qsWgmJ40hIKr6G5rGTACyb6TRBGmV38cLfI6H
         mNUHnbWtLLU6XIAhQowqM26wNjY8TZelBdS/MO0DVjwXhROSYjc0Rri3VA7L1vjGg3Fd
         qBqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723194757; x=1723799557;
        h=in-reply-to:references:cc:to:from:subject:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=/g1EWdSRyPvJJ8eyFtdobneAEkMnKZn9VHRowDdqkMs=;
        b=YTi6pgNkf5pQX+GdCs6drv8FHE3G5ugk8v4L28PLtAUFl6rPncuqwNeZWnzQL9ITui
         89UpRNBhnA5QAyB1hngTuwypsE1X/Zh7TiznnW/8Y5zq/G8PIdJVVgpeim8efoiGDLZ5
         ECwQKJVlJfd3+R+7tbdKLb3nvIPJZ8DHgVvFy2lbHvc9Vq5zdi7h5130q+MVb/oAUJI7
         +Rm0rnTzcdjNXdw3jMQ1q3Icu7V1R7YChhswBhjc+9xNdz1r4TSyO4tDCLbI3qSdWlVf
         xNLbZWQzweKVZGICBsRdb0ew1drI5BtFJKiAA8AUPHlb7SkwJkmbHZqaMHvecMgzRUxg
         dxtw==
X-Forwarded-Encrypted: i=1; AJvYcCWripX7Wm1sTQW0pA06+dSts6WWPPNSOithyIgm86wlxeq1TWmF2Bp1Abga4cubadHyUh6VTiYFaWXy5ST0dsFdFbwIJtpYhCcG4es=
X-Gm-Message-State: AOJu0YyhZ74FqURMkPs55IEDlWnLB6Hw2OSVnL9DkEcm3cS/7yvo9J2l
	azvoUhbwkdV+VfY/CAxQTDBz5H29HEfYpG+zTeyhHvVchh27jX5sS+Hz/1moi1s=
X-Google-Smtp-Source: AGHT+IHDUZDs7bOcbUASgJVPa4IcEoa+TGubCNTDd+aHDQmy+MvrocMHlvfzwk/Wi4ksiDbfFd9BVQ==
X-Received: by 2002:a05:6402:42c6:b0:5a2:ec88:de7a with SMTP id 4fb4d7f45d1cf-5bd0a6dc52cmr695902a12.33.1723194756675;
        Fri, 09 Aug 2024 02:12:36 -0700 (PDT)
Received: from localhost (144-178-202-138.static.ef-service.nl. [144.178.202.138])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5bbb2c4b5f2sm1358221a12.45.2024.08.09.02.12.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 09 Aug 2024 02:12:36 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 09 Aug 2024 11:12:35 +0200
Message-Id: <D3B9K69AAWNT.2KIHAZRFNB8NP@fairphone.com>
Subject: Re: [PATCH 1/3] ASoC: dt-bindings: qcom,sm8250: Add generic QCM6490
 sound card
From: "Luca Weiss" <luca.weiss@fairphone.com>
To: "Krzysztof Kozlowski" <krzk@kernel.org>, "Srinivas Kandagatla"
 <srinivas.kandagatla@linaro.org>, "Banajit Goswami" <bgoswami@quicinc.com>,
 "Liam Girdwood" <lgirdwood@gmail.com>, "Mark Brown" <broonie@kernel.org>,
 "Rob Herring" <robh@kernel.org>, "Krzysztof Kozlowski"
 <krzk+dt@kernel.org>, "Conor Dooley" <conor+dt@kernel.org>, "Jaroslav
 Kysela" <perex@perex.cz>, "Takashi Iwai" <tiwai@suse.com>, "Bjorn
 Andersson" <andersson@kernel.org>, "Konrad Dybcio" <konradybcio@kernel.org>
Cc: <~postmarketos/upstreaming@lists.sr.ht>, <phone-devel@vger.kernel.org>,
 <alsa-devel@alsa-project.org>, <linux-arm-msm@vger.kernel.org>,
 <linux-sound@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>
X-Mailer: aerc 0.18.2-0-ge037c095a049
References: <20240809-fp5-dp-sound-v1-0-d7ba2c24f6b9@fairphone.com>
 <20240809-fp5-dp-sound-v1-1-d7ba2c24f6b9@fairphone.com>
 <e8a24709-de96-4d09-ba00-1e084a656c68@kernel.org>
In-Reply-To: <e8a24709-de96-4d09-ba00-1e084a656c68@kernel.org>

On Fri Aug 9, 2024 at 11:09 AM CEST, Krzysztof Kozlowski wrote:
> On 09/08/2024 10:33, Luca Weiss wrote:
> > Document the bindings for the Qualcomm QCM6490 sound card.
> >=20
> > Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
> > ---
> >  Documentation/devicetree/bindings/sound/qcom,sm8250.yaml | 1 +
> >  1 file changed, 1 insertion(+)
> >=20
> > diff --git a/Documentation/devicetree/bindings/sound/qcom,sm8250.yaml b=
/Documentation/devicetree/bindings/sound/qcom,sm8250.yaml
> > index c9076dcd44c1..0a31be6d917f 100644
> > --- a/Documentation/devicetree/bindings/sound/qcom,sm8250.yaml
> > +++ b/Documentation/devicetree/bindings/sound/qcom,sm8250.yaml
> > @@ -31,6 +31,7 @@ properties:
> >            - qcom,apq8096-sndcard
> >            - qcom,msm8916-qdsp6-sndcard
> >            - qcom,qcm6490-idp-sndcard
> > +          - qcom,qcm6490-sndcard
>
> I think it would be better to make it a board-compatible and also
> followed by qcom,qcm6490-idp-sndcard fallback, thus no need for driver
> changes.

Hi Krzysztof,

So that we get "fairphone,fp5-sndcard", "qcom,qcm6490-idp-sndcard"?

I can change it to that in v2.

Regards
Luca

>
> Best regards,
> Krzysztof

