Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2C07373BF5
	for <linux-sound@vger.kernel.org>; Thu,  5 Mar 2026 10:07:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772705272; cv=none; b=GMvlB3cpmGNZ7E4lbU0yrlPQ0EK55AY8eax+9vFrox92o7W1mbgQ8HVAuQ+3UtMR+ysbLzTXtifj8C7CVyLpYsKngHLgsW4n4g/9naz9XYKPZKEhvgSoZY7tFoFUkDvdJJGVKNZbQ2PBdiPjT2ckNt6HMab1Jw886QsXmhGMvPo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772705272; c=relaxed/simple;
	bh=5E/DrpkixQ4gF4PhrEHz6o0m1Ts94BJPHeqX66PrFAU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=eDML1uNYHxDbNg17GBoPQlcg6dBaBuz/7cth38mKlrD5rOlHk/aDLh1dI1EweccUprJhzaMMvKnlq8c7oOTtU2CW6eGjv7vU08kJnPWSWUkEN7biMzceVx3j2T+kGYwUiAHpdTSaiIhrscLdI88wbwdwsyxqA969X8pXDIHgISE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=VgXgDFd4; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="VgXgDFd4"
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-439b73f4ab4so4690287f8f.1
        for <linux-sound@vger.kernel.org>; Thu, 05 Mar 2026 02:07:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1772705269; x=1773310069; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=cvdX/eNl5nD2MErDTD0kyGmc9AWzS3XjIck/Jl/7K2M=;
        b=VgXgDFd48UrHM9XgormHHx5ryrK90oORBXumwnkqsXbDVJDsPt8lepzXm/Fz5jexn7
         8ICvTZn5NGWn9KmAJtWb4FqAw1lLHl/OENOPEXmjfGRAUi7UOghs8uB7iBuC6iLOKofC
         1/8IvJ4f4wKBai4xvRQUxQX8ytuDKMybanhVHzZAp6M0nN07rj1Zr1TQWMXkIIIaGC+j
         tV9pi9DAlC5Gq/CK/0V2xcAgbOquNgrvY0CXqcIfq7XQveZ6CrPgjR4IWwHlh8a1uvsV
         VALnPJ9hDSNpkItymQbZMDSSHwp/GnGIx32i7ehYM8SkfGI4XY7jGI8WiZyzC+l0pByM
         eBgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772705269; x=1773310069;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cvdX/eNl5nD2MErDTD0kyGmc9AWzS3XjIck/Jl/7K2M=;
        b=dF/e6VSc4BtUoCWn6Sg9ENnu1nrBqD+8KjQTedqnGUjvBEB8nHKSs8z/AaY8/c2WY/
         SGzrnrNaOtuYxaZ7K9H4QnFa2QO8rZ1tDGBEmPJbYR6NlFmdQJEWb9TCuiFvwGv3MrbN
         TPFzUJEDSPdBsmAjJ3F4jEZ7iM+ODo27kov7LppJYkQiXVmMPKUJ/j4GxCLawJ1/9Xvf
         LgpigiM64rAxtnxZhFFP7mnMaqEO7gMEyFHH9Nznyq0zThsCoW54VEPFt42kDas7058I
         S5c47pxivEwH4+vwducpZEMI2DcSHKu+UnhxxkOl3k+mWrGtp5I9YU6JQzcwVjIaa6Rw
         otPA==
X-Forwarded-Encrypted: i=1; AJvYcCVdYcDCoGBgeNy2vcaDrzvRfy/XBg4AvW2p1GgwpNR4xHLHacLmGmajoEzQvi/W8JFQyH0KlkE43BEP0Q==@vger.kernel.org
X-Gm-Message-State: AOJu0YxBvqhqIeuSEWOLJGSGFFGKBwBhrBpXdNSKk6j1+eGu/cuBeofn
	TDxfCPVt1HR33jB4UrIyuq5eUpAzmnzOC0pAecS9jq97H6M/Nn7rG2I+zoMipLao2d8=
X-Gm-Gg: ATEYQzww930/NTdJqntXEaIeRaNvB2zEDJ1Zu19IEddXhktii3iLPrMl7aWnrYVPjDj
	XbNusHwIQemo6sQ+grJF31HwU+AIzqlUuHYRAXw1nWHzDp78dz45TJn5FP/ZMVOGO45etW1Lntn
	Lp6XdNA1ycWrJV48oxkTFqjIyu0gljLzDlOg5bqhtgCQVaefZgckwbuo5d+qMZ2AK2D3WKRIGzq
	0stZtmbJxKqHCipujw8OGFd/YUsyt+kAf+s8d5H4plqJCQWhBWnTopBYxExFx9P6CXN39wXSDF8
	uqs7o3q5Tijxz1bS/qxYE0yBb+hud/wh2qDMGEERTg6n0aYCcK73co05hZ3AlpjeuVKUOdVC5cz
	Env51J+s/UZK2SpbKwanG5eROBQgL9zTr18I+0T6op+sd+u/sxjwxPk+EThxqqyd/aNWDHtz1MI
	PpVcz5J7xUjtOUufOKWNIVy2cmWArc8ZRDI2JmcHA=
X-Received: by 2002:a5d:64c8:0:b0:439:bdd7:425f with SMTP id ffacd0b85a97d-439c80088f0mr9728183f8f.35.1772705269355;
        Thu, 05 Mar 2026 02:07:49 -0800 (PST)
Received: from linaro.org ([77.64.146.193])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-439abdf5430sm38580943f8f.5.2026.03.05.02.07.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Mar 2026 02:07:48 -0800 (PST)
Date: Thu, 5 Mar 2026 11:07:33 +0100
From: Stephan Gerhold <stephan.gerhold@linaro.org>
To: Richard Acayan <mailingradian@gmail.com>
Cc: Srinivas Kandagatla <srini@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	Konrad Dybcio <konradybcio@kernel.org>,
	linux-arm-msm@vger.kernel.org, linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org,
	Nickolay Goppen <setotau@mainlining.org>,
	Wesley Cheng <quic_wcheng@quicinc.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Johan Hovold <johan@kernel.org>, Kees Cook <kees@kernel.org>,
	Charles Keepax <ckeepax@opensource.cirrus.com>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: Re: [PATCH v2 11/11] ASoC: msm8916-wcd-analog: add quirk for cajon
 2.0
Message-ID: <aalV5dBloD1BmwzZ@linaro.org>
References: <20260304195815.52347-1-mailingradian@gmail.com>
 <20260304195815.52347-12-mailingradian@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260304195815.52347-12-mailingradian@gmail.com>

On Wed, Mar 04, 2026 at 02:58:15PM -0500, Richard Acayan wrote:
> The codec version CAJON_2_0 on the Snapdragon 670 requires touching the
> HPH test registers. Add the quirk so this driver can also support
> SDM670.
> 
> Signed-off-by: Richard Acayan <mailingradian@gmail.com>
> ---
>  sound/soc/codecs/msm8916-wcd-analog.c | 63 ++++++++++++++++++++++++++-
>  1 file changed, 61 insertions(+), 2 deletions(-)
> 

I think you need some more changes in this driver to support CAJON_2_0
properly. Specifically, the initial register settings are different from
what is currently in the driver (wcd_reg_defaults_2_0). There was a
patch for this [1] (later [2]), but it doesn't look like it was
merged/finished up.

[1]: https://lore.kernel.org/linux-arm-msm/20240727182031.35069-3-a39.skl@gmail.com/
[2]: https://lore.kernel.org/linux-arm-msm/20240731-msm8953-msm8976-asoc-v3-4-163f23c3a28d@gmail.com/

Thanks,
Stephan
