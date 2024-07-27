Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 790C84A05
	for <linux-sound@vger.kernel.org>; Sat, 27 Jul 2024 10:47:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722077265; cv=none; b=Gz0HJBPI3aDKwKz9M7yzD/xXbWjQsGkbnRF/qKlgv0vSHTO7A8wDtDb+WlymzfsKdg2884qvns88kqutNbGHUgQOITYXFwLemXGnE3d7Sl1COA4dUTFjHzM8CSlT+mN0UZiZBv+BEkmMzmF9fZr2LCNQ+hJXNeGfqDhTn6avfVU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722077265; c=relaxed/simple;
	bh=CxQCaVkPKiM+dSjOjWGM0B5dxgOP8eZ7QW6Iaue7xE0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qD0pP7+Es2xTBzqhLfcPzGXyQ+P0gL1hfPQiuAdG19MovVjN0VfK9YsfefaIqPiaJ/1zghgpRRPkqaYSWtLFwTAWsodjRmlyVKxOszttr6GiFQPdGFGUBslzzboGSnj6ZqMTqImiPYoBnoh4ORQJSHasdh1CQ2e/ZbVwPiSw+PA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Vd809/RX; arc=none smtp.client-ip=209.85.167.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Vd809/RX"
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-52f01613acbso2177000e87.1
        for <linux-sound@vger.kernel.org>; Sat, 27 Jul 2024 03:47:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1722077262; x=1722682062; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=PgZxzidyEshqEQG3bGebzLz9u8Tr8K9k35MYbayHhxk=;
        b=Vd809/RXii9JNNmHpkXbcVs43XkeOSFaw34SjtOH+6tf8YkhPlOz3LNuoqH/LNVqXP
         FX61XCh647KLtO5/mdTQ5Q6PtK6h6TSmUtyFFBlxYM+BRar2b8uvmasLbZyV0WCFe1fp
         7jyZ53fDtXokjU2AO/N8ISuebyt8k6qhT4UqIgSUnoTmQzLBTMJUCyayOhbY5CeACf9j
         za/UmYoxmxcPAj15Qt6hVFAo0/SlZ7/JCkseKBkrVYNwx9HekNhh6XYWcxqAM1sYdNIM
         dxE1Drw7PUbO5kBx5D5AnlpvqgvDw25Bry2hkCf53yy1Oq91gaQVJWd3FFk3MB3h7vfG
         XEvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722077262; x=1722682062;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PgZxzidyEshqEQG3bGebzLz9u8Tr8K9k35MYbayHhxk=;
        b=guyZDtwpkdtOK8DJYQ/D362sEymDh8g+F4PQFhRrtT2gm4lvpb3E40ycTIkCpqfpSt
         Cd5DJLGNnvA4WXkt5d0HgqWT6r7fW0OtEzlZEohpSwvTaouf+wMsnubPFmaBSwevLDHy
         pVuEDjotya9Gh8h2HV5iASdulFNx+tfrVuJhxBvaTclHCO9PVv1JusAcbzapgE/Btwna
         M0KVGXMXNj4gXDmd0L1ZQPdGH8OSzYmavL/wpTu1rYEycfIpCgml5B3L4+4H9QLszbGk
         9Q+J4aFcdljKDMPhTxUNhjrve8rAgot/oUFJXzULW8n39/mZlCEOtN/l/S8/tJCekkrS
         tLIQ==
X-Forwarded-Encrypted: i=1; AJvYcCWL0fbHzhZjJokw8k29czwiYCBKgj4nehPTzU2gLKhK1YK1V2MBL5KBjEAJYtvNapzFxop12+nD8NWKyHzqcH2+6Ycsf4nO7YT9UGw=
X-Gm-Message-State: AOJu0YzHAzZnsVOAPSNzKll8pJGWYDU2nrJU8u/kiJZ2DyKbOeIZSED5
	s2HPRq4AoVoPlVuzBgq/U/cEeS7pVzWX2u5h1aYK2HhaVcOoXjgWs1mb2eHX7ck=
X-Google-Smtp-Source: AGHT+IFinSpQ7BYm+GtIK2AR4f2kI+7iSE/VNTey3Ki9zIDB4o0fctoD8bK6ZZn9hTNYPBvsFYkIVA==
X-Received: by 2002:ac2:5e23:0:b0:52c:caf3:98ed with SMTP id 2adb3069b0e04-5309b718d49mr435661e87.24.1722077261761;
        Sat, 27 Jul 2024 03:47:41 -0700 (PDT)
Received: from eriador.lumag.spb.ru (dzdbxzyyyyyyyyyyybrhy-3.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-52fd5c19ee3sm729586e87.220.2024.07.27.03.47.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 27 Jul 2024 03:47:41 -0700 (PDT)
Date: Sat, 27 Jul 2024 13:47:39 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, 
	Banajit Goswami <bgoswami@quicinc.com>, Liam Girdwood <lgirdwood@gmail.com>, 
	Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
	alsa-devel@alsa-project.org, linux-arm-msm@vger.kernel.org, linux-sound@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 4/7] ASoC: codecs: wcd938x: Drop unused defines and enums
Message-ID: <vcufh3cp5ulm3phbgucsofqapfrv77bqgf2e26qolftviia4wj@aztjalnuxqby>
References: <20240725-asoc-wsa88xx-port-arrays-v1-0-80a03f440c72@linaro.org>
 <20240725-asoc-wsa88xx-port-arrays-v1-4-80a03f440c72@linaro.org>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240725-asoc-wsa88xx-port-arrays-v1-4-80a03f440c72@linaro.org>

On Thu, Jul 25, 2024 at 01:23:46PM GMT, Krzysztof Kozlowski wrote:
> Drop defines and enums not used in the driver.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
>  sound/soc/codecs/wcd938x.c | 18 ------------------
>  1 file changed, 18 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>


-- 
With best wishes
Dmitry
