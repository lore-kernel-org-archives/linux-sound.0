Received: from mail-lj1-f181.google.com (mail-lj1-f181.google.com [209.85.208.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D164B143749
	for <linux-sound@vger.kernel.org>; Fri, 28 Jun 2024 07:45:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719560736; cv=none; b=eM9THeufXPiHvYKiej/Cdm25Vw3GUqaLZFRb/b+jV4xYxJXXxAh6Yx8T/sEyiytlEC8CFDlInp+E/eOIYF+YgbgGiN3Gkr0+R78R1h+3uYQv5CX6JVeMpGuE9gZ2rwHVva5G7MEjuWh4I/Sp7fZAUqCUMbS2KAwUc4t4fyq4fiE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719560736; c=relaxed/simple;
	bh=TIn3dSD9Y/O5J9F3VJziLjzKGSBP8XVxfPmWbVXuIdg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tYijNpdBSernaLs7qqx/Ni0CcoXDcjjJaSWgDpa6W7AEnOmvCAo/rNlkY+tx6khOQ3agy41cD+8mJ8fTlJz7ggG+rEzvRnIJUijBAvN3Aj4+ZiyOlVekYp+eJJ40d66P47f29R5IvzCR3pKPPU8o8ryZaIltqCY23uQVzqXtJoU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ZKxRiur2; arc=none smtp.client-ip=209.85.208.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ZKxRiur2"
Received: by mail-lj1-f181.google.com with SMTP id 38308e7fff4ca-2eabd22d3f4so2612361fa.1
        for <linux-sound@vger.kernel.org>; Fri, 28 Jun 2024 00:45:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1719560732; x=1720165532; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ta6pOQl7Ba5DSAPgv+iFZZAffaH8uQvfzLUSjfY48d8=;
        b=ZKxRiur2uw+Ob41YMzaY+MPU0HMX/paXToRlgrM2EhGXcaJMFkR1TXlkW+dEjskXEi
         pIu1jl60kAOodXrv2fWITfEQJyVZG1cT8LkVnweKmYYh5tyI+90dce0ZDARHIWsiWv8q
         sSQKTO4005xNTZGqs9bMsNTrqalXQRKp9liFFty5jMsRHZ3op0G0pshgpj0C/fCVTCli
         Vc6TY6pu0RScd2KBfQ6S6rsHIzLYfjE1FGWDys/FAdHKgJEGG/YzRYoVgNLbZ61RYW4S
         1HVBCA00AtehjpYta1O0c7USQFcJ4gc2sE/ElVuxOAfka7kcLfqwEDY0lpIvq98rmkOk
         c5Aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719560732; x=1720165532;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ta6pOQl7Ba5DSAPgv+iFZZAffaH8uQvfzLUSjfY48d8=;
        b=q0eDkGRxVl7lDA0c0BK8FPkYHdFfsPJZbwaGT/k9tdp9KF3OS7gUXmVeCwQxu7qDQx
         x+vxNTeOmFfbLbS29012qqrPzSCdabj00lQn41EgHWQwwXkxbp2F6+8b18CaM2fjrUi9
         V8XQDHjCJSYKsQXTIsc2cExwabmi8xMhV1JHxhJ4vtaV6zNN9TAQ0BA1MFHTgu3yeyRU
         9CbN5J0n0OaAF6TnKxplWAtS4VL7a/BUmUAGg/yYHoN7ZGjXxqELW/NR69auo8cZ2Vvl
         vFbEgboGGmC/jtJXHi/JnFzrenxpPscLetbPbTISJ/TcEIJUAbnjMklASXU0ORuMvBIC
         HMRA==
X-Gm-Message-State: AOJu0Yw0IkDwUZLGNsTKym/dY/tVRLHfws3n/6KAbrsCIZA9WgPBjnLG
	HTk3vjHiKAGJ67IWRAn29ZGrxignOt+1Vz0KEZA9yx0A+LyEUX1nLip6WVrb0Sac5a/nsbNGxcm
	FcX5jQw==
X-Google-Smtp-Source: AGHT+IHqmAR6Aan/s3t39wcFt4NqZCBUJkjEf/RYG6yrSKTVA4mH3xmpTPmcNJL1Afj2I7QNcp83Kw==
X-Received: by 2002:a05:651c:1046:b0:2ec:6756:e3ea with SMTP id 38308e7fff4ca-2ec6756e4d7mr71538561fa.43.1719560732156;
        Fri, 28 Jun 2024 00:45:32 -0700 (PDT)
Received: from eriador.lumag.spb.ru (dzdbxzyyyyyyyyyyybrhy-3.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-2ee51680450sm2017551fa.76.2024.06.28.00.45.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Jun 2024 00:45:31 -0700 (PDT)
Date: Fri, 28 Jun 2024 10:45:30 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Alexey Klimov <alexey.klimov@linaro.org>
Cc: linux-sound@vger.kernel.org, srinivas.kandagatla@linaro.org, 
	bgoswami@quicinc.com, lgirdwood@gmail.com, broonie@kernel.org, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, andersson@kernel.org, 
	konrad.dybcio@linaro.org, perex@perex.cz, tiwai@suse.com, linux-arm-msm@vger.kernel.org, 
	alsa-devel@alsa-project.org, devicetree@vger.kernel.org, elder@linaro.org, 
	krzysztof.kozlowski@linaro.org, caleb.connolly@linaro.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 6/7] arm64: dts: qcom: sm6115: add description of
 lpi_i2s2 pins
Message-ID: <qe62q5k7r3wwlceqkapwntdwhpngbwtvpwhq5wxwslhke3h6lt@kaveepinffka>
References: <20240628010715.438471-1-alexey.klimov@linaro.org>
 <20240628010715.438471-7-alexey.klimov@linaro.org>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240628010715.438471-7-alexey.klimov@linaro.org>

On Fri, Jun 28, 2024 at 02:07:14AM GMT, Alexey Klimov wrote:
> This is required to enable to HDMI audio playback on
> QRB4210 RB2 board.

Are they SoC-specific or board-specific? In the latter case it might be
more suitable to move them to the board DT file.

> 
> Signed-off-by: Alexey Klimov <alexey.klimov@linaro.org>
> ---
>  arch/arm64/boot/dts/qcom/sm6115.dtsi | 34 ++++++++++++++++++++++++++++
>  1 file changed, 34 insertions(+)
> 


-- 
With best wishes
Dmitry
