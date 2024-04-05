Received: from mail-yb1-f176.google.com (mail-yb1-f176.google.com [209.85.219.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 058E113A416
	for <linux-sound@vger.kernel.org>; Fri,  5 Apr 2024 10:46:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712313980; cv=none; b=GO0GqyaEGHH0au7t9vqDxTZWnikchJ/DnNFGxl+TBfdumKXDYgCdRi9W8GRPDTdU7oLyn4J1zkfZKSSmwsm/RdCa7cdu3bsTYQekxw7oa6H/larwERf9Efna71shNQpJjZt+06qMjE2j9oBXbCs3bSarXMlCvn+bEJaCmisQdS4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712313980; c=relaxed/simple;
	bh=L4E8p/GV0Ds3nAyTGC7XhelVlzhjjV+Qy3Ty0PI9xhc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Z6P2/4RLCwZijuWdMjuaFRRyS4wQCLJ0y0A876QSdduuVI0fkkJDp+XblAxF+dZy3q6oofrgEdkevTTTm388Q7WSeFasVJn/h44XZlt9TDyW9gKLhtP5zJr7jdaSSTCnV/pJkrEXJGFQ6MDYug7+jeGCDsDy6fHrPBG1YHmZNAI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=GGWwebyO; arc=none smtp.client-ip=209.85.219.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="GGWwebyO"
Received: by mail-yb1-f176.google.com with SMTP id 3f1490d57ef6-dc74435c428so2025716276.2
        for <linux-sound@vger.kernel.org>; Fri, 05 Apr 2024 03:46:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1712313978; x=1712918778; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=q464s0pydIE+zRv4fDUf6M5jc7NXRIaMdUPXgVeAtAQ=;
        b=GGWwebyODwX1q83KcA6XibR/TAUUryUs9RAXB6qHCP44ebWZzZS5aIXNPQWAxE1AO7
         gYKsazdPwfBfDJvbTpgXc68DiPMoCz+dqMq9Q0M1hIaJnwpCyA9SrtkIubiAXlCAMcsS
         78goY38sLNRvBNY95rZKbN0OHqZytgDZd+TFDwzZvnl6+F9Nvu3hDdFSvn/ovsPPgNkm
         OI6GYMzBW4EXmaee6BavjZ9WetJnuyyzm1Hm4oXdkWhqAlr93wPkIbuAb8bvH9ofV9qt
         gpwBNontvPPV6cDagbQqe7sMvoItWqAjbq/YWvIHiu5HYF6PabV77Yavag1P+VUnamnX
         Hadw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712313978; x=1712918778;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=q464s0pydIE+zRv4fDUf6M5jc7NXRIaMdUPXgVeAtAQ=;
        b=NoBHjIkA+tq3REgnZ9L43i9Jidg6lITnJ0f7X9ro5NdtYYtHN3qRXm+iQ4QqsIs/JD
         xBpYTLyu4a1JaSUTuYQo0g0Lzjc+lA5WnGio+044LenJ6yCVKcjIyaduKQNAIg9y9guY
         wbqOFFvzB7l1Ia3dLdk+GK4xU651tPuMrGL9+t7h7wD7o/qTiWQ27yBegCZArvyqOv2V
         p5/QSaZLNGBcqnzQkXr4Qol9pvLE1tiUD7ZVcP8ixZXjgu/tcxxXS+aibGSehVw8cMrh
         R8eNGp7Bp5UkTt9X3P81mJizJ7RJbAst4SEtovAO78ff9rbluYUGESCReUBbWYeAMNTu
         h1yQ==
X-Forwarded-Encrypted: i=1; AJvYcCVmkswVJI072A33sBazHwjX+rmhGEpE3WlAv0hgu937BxnWvriVF/oi/H5R8QwdiNAv9cGekMRhz1Ju/qBoMrdkWTll70uPFs9LHw4=
X-Gm-Message-State: AOJu0YyGiQ+Zih9i+I7nraHBJW4Yqiux9eWpSRq1f0YDB16yxAVz3nX3
	7qZmnukdMc9J3+onswdarnRWr2UT8lW5Jpyd/Q15rlwwv97TtQ9eQVaLGiRi0+ApcEpwJ3wfmAt
	qHCTPbu9jVvGV/98uRyfxrk6wmspNufyY6FpCaA==
X-Google-Smtp-Source: AGHT+IFD4lOAA6OE545MWaALDTv8kewFB0UhOTHwNBgdOdA/c4Xh5GLbUDrWS+o4QO2az8mbVpwytUQzz3UDkLFdfw8=
X-Received: by 2002:a25:bc85:0:b0:dcc:44d7:5c7f with SMTP id
 e5-20020a25bc85000000b00dcc44d75c7fmr782319ybk.62.1712313978067; Fri, 05 Apr
 2024 03:46:18 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240404084631.417779-1-quic_mohs@quicinc.com>
 <20240404084631.417779-2-quic_mohs@quicinc.com> <CAA8EJpqWaYhzPKgTREtJnfdNZ4oSFZaRFM7Jhg+qd3AqadGOkA@mail.gmail.com>
 <797d67b9-9e09-8b84-9abc-dd4a4a2a40f5@quicinc.com>
In-Reply-To: <797d67b9-9e09-8b84-9abc-dd4a4a2a40f5@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Fri, 5 Apr 2024 13:46:07 +0300
Message-ID: <CAA8EJpo2__vcpqq1zofyyZ6UwPPn7Ed0R=TPcMZ25+JHwRExwg@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] ASoC: dt-bindings: qcom,sm8250: Add QCM6490 snd
 QCS6490 sound card
To: Mohammad Rafi Shaik <quic_mohs@quicinc.com>
Cc: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, Banajit Goswami <bgoswami@quicinc.com>, 
	Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, linux-arm-msm@vger.kernel.org, 
	alsa-devel@alsa-project.org, linux-sound@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	quic_rohkumar@quicinc.com
Content-Type: text/plain; charset="UTF-8"

On Fri, 5 Apr 2024 at 08:56, Mohammad Rafi Shaik <quic_mohs@quicinc.com> wrote:
>
> On 4/4/2024 2:23 PM, Dmitry Baryshkov wrote:
> > On Thu, 4 Apr 2024 at 11:48, Mohammad Rafi Shaik <quic_mohs@quicinc.com> wrote:
> >>
> >> Document the bindings for the Qualcomm QCM6490 IDP and QCS6490 RB3Gen2
> >> soc platforms sound card.
> >>
> >> The bindings are the same as for other newer Qualcomm ADSP sound cards,
> >> thus keep them in existing qcom,sm8250.yaml file, even though Linux driver
> >> is separate.
> >>
> >> Signed-off-by: Mohammad Rafi Shaik <quic_mohs@quicinc.com>
> >> ---
> >>   Documentation/devicetree/bindings/sound/qcom,sm8250.yaml | 2 ++
> >>   1 file changed, 2 insertions(+)
> >>
> >> diff --git a/Documentation/devicetree/bindings/sound/qcom,sm8250.yaml b/Documentation/devicetree/bindings/sound/qcom,sm8250.yaml
> >> index 2ab6871e89e5..ff1a27f26bc2 100644
> >> --- a/Documentation/devicetree/bindings/sound/qcom,sm8250.yaml
> >> +++ b/Documentation/devicetree/bindings/sound/qcom,sm8250.yaml
> >> @@ -29,6 +29,8 @@ properties:
> >>         - enum:
> >>             - qcom,apq8016-sbc-sndcard
> >>             - qcom,msm8916-qdsp6-sndcard
> >> +          - qcom,qcm6490-sndcard
> >> +          - qcom,qcs6490-rb3gen2-sndcard
> >
> > My 2c: you are adding one soundcard for the SoC family (qcm6490) and
> > another one for the particular board kind (qcs6490-rb3gen2). That
> > doesn't seem logical.
>
> The qcm6490-sndcard compatible for enabling soundcard on
> qcm6490 IDP boards.
>
> Will change compatible name as qcom,qcm6490-idp-sndcard.

Any consistent way is fine with me.


-- 
With best wishes
Dmitry
