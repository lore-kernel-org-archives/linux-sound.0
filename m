Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com [209.85.208.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0EF2D2BE033
	for <linux-sound@vger.kernel.org>; Mon, 25 Aug 2025 09:10:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756113030; cv=none; b=spXFT/M9H1jOPCkzOSCfAOQBxZ6F3k7Y85iw53jQCz/NmHp0vrZ0wqEAlsnR0nmxG89KW98igvey9BLSLCovnAjjb93+YlINT+9qJ4LyKE1mzoeaBfWCZ1Gu1t/bp1jZ/wD1UtVcciIgzpeCbLKi7y+l8NMBJ83QBOvibTCWCqc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756113030; c=relaxed/simple;
	bh=K6PyU0GsbatkF2Dnw0veoFSf+BGczxcVhhUScrXAiLc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=pm+Kpub2qG9wpOD4ej2KIJc7jpS2ntuVJBTlXvRQU7DngG6uPs0dtMsUGyjVNLaDiXLCAwzGTx8swCvCO37LdMQWQMtknk76u+VMq8tpASF65PSBTKXQLjCmBP/IqGOr0pt4pHILn30i4m2cjBxTqdsd5/u5M/h/oRx0NN8APCY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=NqwNVgAU; arc=none smtp.client-ip=209.85.208.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="NqwNVgAU"
Received: by mail-lj1-f180.google.com with SMTP id 38308e7fff4ca-333f901b2d2so32219801fa.2
        for <linux-sound@vger.kernel.org>; Mon, 25 Aug 2025 02:10:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1756113027; x=1756717827; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=S9+ip/B1cOdz45Ch9sh9CoC/HT80R58+cTC3VtE9YsY=;
        b=NqwNVgAUAs6RxU/7KvsowSaqE8na0dasiBxgEKRdgRogMWjbM8sWcYUj1su99UZQCK
         ZTqD/H8PzI0E/g49Z7O3qRqXXfjk0EpIQ7sqF2m5uzKQoXrEl0vKqjgh/gxpXTC3hG1t
         4reeeyxng4ZwvSnrJ4BwaP/m08LvLotWD4xLpqs4WvQmqxPGcbdMEa6oMUElMmeKl/7o
         VjruiJqUQwSa8IQta3UVnFAX5JOIDQreuskXdWkJHR6WQ0X9yshI1DZ2OGScgu/EUHHr
         2y4tn7KoUqIeQxXhpd6djpkQz1v3Zru+63hdfKtFovj6QXrBFqDSKtndwkjrhZjXi09Q
         jVvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756113027; x=1756717827;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=S9+ip/B1cOdz45Ch9sh9CoC/HT80R58+cTC3VtE9YsY=;
        b=EKJOaqHMG3MURS1nJGKEkWeNQ5TN+t6dMTMCx+KlyL4HqSI0ik7sPIkLKBoyD76lUx
         noHZItn8WRnrpwXn/NEV0rJ5NMS8EfcRVOt/Wz6NA3RXPTlE2t7iA2cbhc9GaIcjIiR0
         5MlOrFy99HGYzQVc0nvhjEKI4C+DLwAS77cjGPZYKsAw+3xUZIjcQ9+RZb+6UgWXwzR3
         7cA7f2PlysgtGwlZFrOv8vqi2fa7+YFvA33C5gztaI9UOB0jrH4wbXyC5Ot0/HBEiW6E
         umFhmJDDSecTQC7fNYFpDeQq4nEnc/b4Hg8TwavYOZxkO30QGE+uuHPJ0P5WdblHy/8c
         OFaA==
X-Forwarded-Encrypted: i=1; AJvYcCULqVxcoMEODHH1UiFnmJM8WuEa2S/O8hDpEjtA77brTaKwnpLBDK6RqJ737TAuw3Qj9L9Lrgsb7aAmrA==@vger.kernel.org
X-Gm-Message-State: AOJu0YwWVbTTYsdv81X6/1YIMQL1Ef6niSSIyl2BwkuIdm1v85aP7W6Z
	h7M1j+d9BlHLdx7V1AhDbFuN4r48zJyaL8IUwuSM236BUPIMXcmFX4Ry7dNr55EK/9tYjC+VwxJ
	pgLRla2mSOGP3h2dtmTmeVJud3HBKDEOvC8ml0VqVjw==
X-Gm-Gg: ASbGncuUWWSzGSZUfB3wZhL3cnFYnAo05CzIK/yT+plYfXkxeV8QEt975FPM4PNloXL
	uTPoOKnAqqbgHWoDRttn4kBObNEywSwSDz3uFdeTjCr7drhB30kJjRQHLEQg1TZY4gMSI2UtX03
	5b0KBEnmqgHlJFU2m5i5ypiS2yYVtS7kCNxJ3hzbQb/TYq056Eyfkqr1sfVoteDxn7ivg3mkugw
	sGi3Gs=
X-Google-Smtp-Source: AGHT+IHDpAZbDBO+P1KWHMFH2puuWSDWYfqPFdD8RvYPD2rHyprBhEUNN62NBhXGRZs8RUFrVFKwGRZe7oYI+GC3DWY=
X-Received: by 2002:a05:651c:31d5:b0:32c:ab57:b03 with SMTP id
 38308e7fff4ca-33650de911dmr32208511fa.3.1756113027149; Mon, 25 Aug 2025
 02:10:27 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250821044914.710044-1-quic_pkumpatl@quicinc.com>
 <CACRpkdYEzbM33HBAhHEmAg9f4Zpi=2WvqPdZ35=M2eVCqcTTFg@mail.gmail.com> <c81019f3-3570-4437-a10a-d49cabc4952d@quicinc.com>
In-Reply-To: <c81019f3-3570-4437-a10a-d49cabc4952d@quicinc.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Mon, 25 Aug 2025 11:10:15 +0200
X-Gm-Features: Ac12FXyjszIfUK2JZwcA6e7nLVD1sdGnLR4S34aGz88q5xxgv2NTEWTCwRbER78
Message-ID: <CACRpkdY0tva_Ss+GhAA99g8tMWhbFVJh0fbYakMh4AZG1K=c1A@mail.gmail.com>
Subject: Re: [PATCH v8 0/9] Enable audio on qcs6490-RB3Gen2 and qcm6490-idp boards
To: Prasad Kumpatla <quic_pkumpatl@quicinc.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Srinivas Kandagatla <srini@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, cros-qcom-dts-watchers@chromium.org, 
	linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-sound@vger.kernel.org, kernel@oss.qualcomm.com, 
	Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Aug 22, 2025 at 7:33=E2=80=AFPM Prasad Kumpatla
<quic_pkumpatl@quicinc.com> wrote:
> On 8/21/2025 7:04 PM, Linus Walleij wrote:
> > On Thu, Aug 21, 2025 at 6:49=E2=80=AFAM Prasad Kumpatla
> > <quic_pkumpatl@quicinc.com> wrote:
> >
> >> Mohammad Rafi Shaik (9):
> >>    dt-bindings: pinctrl: qcom,sc7280-lpass-lpi-pinctrl: Document the
> >>      clock property
> >
> > Can I just apply this one patch to the pinctrl tree?
>
> yes, please go ahead.

Patch 2 applied!

Yours,
Linus Walleij
