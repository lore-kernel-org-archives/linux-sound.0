Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30E8957CBB
	for <linux-sound@vger.kernel.org>; Sat, 27 Jul 2024 10:55:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722077745; cv=none; b=fDStFW6cWSw3dKSrw95BxRaYWM/c3sR0jHCaL2ryJFVTB/8+DcAJJguWANspWlSER+l1yfyULinxS4VrgW9lmmPrUnvN6PLAbOxEz9SeFwWNg2cJl9d3bwbJZb6UkOLsedtbNyrJMjyHH2LTMMPj+b1Hvj9hDVA5XbtOEwhew0A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722077745; c=relaxed/simple;
	bh=68s/AGh0KdHaOGVbq3ybeiL3/h7OccMgD2M7Qinek94=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AuRBCISJHgr/JqIy8DksuPloWHweOsfjOKNwsUAEq6T9ZmUeoCPX1ljRv9m6m8HsMsY2ZKC9Se9NR3zgn0eq8dQ7W+6oF5FjaFitG/DMitemij+EgRhKINhxY5PfmIRd1jqyZ4DPS1ECSj+ofnHDG4WD7w4B9XmC8Jq8o9kYL/g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=VwzcvJgh; arc=none smtp.client-ip=209.85.167.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="VwzcvJgh"
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-52f00ad303aso3103445e87.2
        for <linux-sound@vger.kernel.org>; Sat, 27 Jul 2024 03:55:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1722077742; x=1722682542; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=eSQLqxhvdwaXYSfWwT/zXs0MzmxstO7ywTlJURA+QUQ=;
        b=VwzcvJghIPwvE0gB7qZ8B/pN2jJyT1ouDFx9RBLvnzNWPMJMcVzed/8rl9bTsXpmv9
         NRPdRVp6q4lyzZCWQ0nkWvmRf47Uoqx0qVFcGoCcZw3pqvHCvhZsycc4g0Hi8eoFKQLz
         VO3VM1aOdV+xrBtDRM5KkLtQQC5B6qb/O4XuDRf0k606K1KAxqQcJ9ZP1cdA6RmXXoL5
         KyJ2jC6g625GULPyHxiZU1ZtHIS1QHE8TlT5UhUOebtKWJBUgejWR60znEMV65hBZd0y
         52xGCBJvgZ5peI0BszR+OUfzUZzSBJvOfN4X07n60UcFH1k42UtZGj5NrCY+YciMpM1w
         6LNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722077742; x=1722682542;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eSQLqxhvdwaXYSfWwT/zXs0MzmxstO7ywTlJURA+QUQ=;
        b=L0VnVOJZJ3IvF0lQiuhtMTpVBfD3U7qZ6hVwryk/LPs1M6eWDEXtO7oQDSUu+Byy/X
         O2GHvSIdk7PbZLy2EEMs0rBXXNiRDB8NDOms3b6B2wBYYDWlNdrAqeWWUcfhw5kyi76S
         eAMXw8BONO26lKRLfezfhNUNXQdpeWySWacOkM7L+jl0JlT6jwVdt5P23h/b1dTCRUJg
         8/rBrUocMOwqR334wK1NMqaTcAhSyyf8Yxkwaq9I/2DuYN0lucA/YNAQ6mv7lqc1U+Lx
         8Ob6n+DxsZA4yDUPtrzeXD4x3MoXcsHbYPUGU4yo8hNvdfLNaezwm9HJE4Tw1pkeWHsA
         O1Cg==
X-Forwarded-Encrypted: i=1; AJvYcCVkuhe2PhH9UBEh2dAQ8KdIv3zRO9S3amyEUKC95WYdiOKjUQScis7UBkhdZzWq27mzn94OUg4cKnFgOVvVB/vU5HT+Z6vJgevIYAg=
X-Gm-Message-State: AOJu0YyK9vciXc42JHI5yoIODCl06xdsVCC2+4apghNxrrMXrELqUc66
	UoYKTrzG6pWZLUrhs95yaWj/jQv7gFy/86eyFxNEddYfeybn0lCYIFMgyhFIsts=
X-Google-Smtp-Source: AGHT+IG/g89VE0vaiUQwCJYmJWWSqhFEML1N3eYG2UploJkfiYPufIYQVcfURtGME0TkGEoamzZuAg==
X-Received: by 2002:a05:6512:2513:b0:52c:b479:902d with SMTP id 2adb3069b0e04-5309b259c26mr1773343e87.4.1722077742260;
        Sat, 27 Jul 2024 03:55:42 -0700 (PDT)
Received: from eriador.lumag.spb.ru (dzdbxzyyyyyyyyyyybrhy-3.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-52fd5c081ddsm736621e87.132.2024.07.27.03.55.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 27 Jul 2024 03:55:41 -0700 (PDT)
Date: Sat, 27 Jul 2024 13:55:40 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
	Mohammad Rafi Shaik <quic_mohs@quicinc.com>, Prasad Kumpatla <quic_pkumpatl@quicinc.com>, 
	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Banajit Goswami <bgoswami@quicinc.com>, Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>, 
	linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org, alsa-devel@alsa-project.org, 
	linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH 0/6] ASoC: codecs: wcd93xx/wsa88xx: Correct Soundwire
 ports mask
Message-ID: <kggm3zlkevqw3lelxukz5lyfch3vd4uxta3gi7kcidacpo7uz2@hlqq73saz27c>
References: <20240726-asoc-wcd-wsa-swr-ports-genmask-v1-0-d4d7a8b56f05@linaro.org>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240726-asoc-wcd-wsa-swr-ports-genmask-v1-0-d4d7a8b56f05@linaro.org>

On Fri, Jul 26, 2024 at 04:10:40PM GMT, Krzysztof Kozlowski wrote:
> Hi,
> 
> Incorrect mask of Soundwire ports - one bit too long/big - was passed.
> 
> Theoretically, too wide mask could cause an out of bounds read in
> sdw_get_slave_dpn_prop() in stream.c, however only in the case of buggy
> driver, e.g. adding incorrect number of ports via
> sdw_stream_add_slave().

Well, granted that sdw_stream_add_slave() crashes on RB3, we know that
the driver is buggy.

> Not adding Cc-stable because I don't think the issue can lead to real
> out-of-bounds read.

-- 
With best wishes
Dmitry
