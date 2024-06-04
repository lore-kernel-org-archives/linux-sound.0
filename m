Received: from mail-lj1-f181.google.com (mail-lj1-f181.google.com [209.85.208.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E3AA51C3E
	for <linux-sound@vger.kernel.org>; Tue,  4 Jun 2024 14:46:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717512382; cv=none; b=Z5bMBRDmTngWEvnS0WxWchR6a4VE+DLrQW2L5i0Hq8EZS6b+Ao07l0ISrEKMg/X9JaNiOjUkjwYIScLamn7P5gGzQdqQi6BdfKpWXZ17eGfY6/txlpIy/VY8rt8Zn51FerAYBfSq9tryzHZYhXC06G96kpW/NFVWG0q9PAa7ZO8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717512382; c=relaxed/simple;
	bh=6p0sp9pgFRo1PqbzlDQMsuyY3COLLatNjO1bz6AsYto=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ccsnZFVrnjpoZvZZjAUs/43IVB+mORxzHNvOjjshcTmxi0V1zl1j0yp+KPRXfbaiHIHgOnZ9IvrhyGDaQ20ZtWwwHHA7OubrbqZDf8m0aqThQBMEgoWoWlrEnRZKV/BChnRx+6OuO4q2+6zlq/TVMgKBWtkkbwbgNgZI38EYSiM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=OnFEoM76; arc=none smtp.client-ip=209.85.208.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="OnFEoM76"
Received: by mail-lj1-f181.google.com with SMTP id 38308e7fff4ca-2e72224c395so50289831fa.3
        for <linux-sound@vger.kernel.org>; Tue, 04 Jun 2024 07:46:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1717512379; x=1718117179; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=3fWM9RazXmkrrcf7cVm+FJhwHBnlPawdSsHuisHuA/0=;
        b=OnFEoM76/ZmXM8SuDUkkn8piPsXCy6og/EPQ+XgUV/6rDrspml4LShHfeNgjpv3hZC
         eBihZQ2fF8SMMtn+pbUgIEEol9MjCcXgjH8t7PBMfbULNxpStHDFGTk3f3BQ3odF69Pj
         ICMlhrGHOXlgTz1Zq+Wa3QJkOnIUDWOZ0VSxmeR3gA5sDnYamnupNTXnZYZ0p8xB2W6L
         H+mS1xaoLfm5SySt4ieCresd14e0k/CeA8WCCs/wj8qGw8+Ld14HjEx0z53Ajy+07ANd
         /YWJkepUN0jQnNgof/YyxMtiHJ2X8tFL24bZnhUVRhZP3vCVMT+slqdAKAHUhhpJY1by
         zyRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717512379; x=1718117179;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3fWM9RazXmkrrcf7cVm+FJhwHBnlPawdSsHuisHuA/0=;
        b=a4ZEfD6ElIij4oO0yopnECd7x94qtwe40CnoxlEKd0Nqj2WcprHAryjNZiVUiiT8bQ
         xDI0A/FMQ/bOLvUSytWEA/PFPOpLKeAZfP+Z617XkOQ2AeQsdAic16Hm8AZA4pghCG37
         mDLCiecXVViZP3z+me3+KHMD0/eqErHL7GDNGAY9Am1EFcPE+x1IxNT5lvLLjkNFciiY
         hdJ8Zrd8DGioIJH5jBTHouh5381AYBwH38N+IK70jFYMzDarg3jqvuUtZRzpfTc0H1Ix
         B0MkzleA974RNbloXo7W7hqhJubrF5LP95LDZykrj+5rLTQfnFuytzJEZBoBFmInnvPW
         pU+w==
X-Forwarded-Encrypted: i=1; AJvYcCU9hVW7PY9TsTWCXAzonaU/V0WMhQPqmDqwVhtcymudNhYYmE34wl9T7+bbshb/fE/jGTjrBqGN/Q4hnBPFvq3zjqveDBKH9cCOxEQ=
X-Gm-Message-State: AOJu0Yz8VSNOk8gfmKkFlFr42Sd6bZw2Ug/1cweFJMmoHLwbViw0xqlU
	t3m2yGZWGw5lThB47ECOKdVi1qqXJLvqHWhwNXdjLwUm1oXWcJQxBdNC/R9co3Y=
X-Google-Smtp-Source: AGHT+IERd+pOKeaU4WAUxdb915FWhHyou0aFSqNLEgCX/8v3BAB2Hl1Vqes5cCRKx30uO5efQiei6w==
X-Received: by 2002:a2e:6804:0:b0:2e9:81f2:ce03 with SMTP id 38308e7fff4ca-2ea950f70c0mr70279431fa.20.1717512379323;
        Tue, 04 Jun 2024 07:46:19 -0700 (PDT)
Received: from localhost ([102.222.70.76])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-57a31be4df2sm7465219a12.47.2024.06.04.07.46.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Jun 2024 07:46:18 -0700 (PDT)
Date: Tue, 4 Jun 2024 17:46:14 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Mark Brown <broonie@kernel.org>
Cc: Jeff Johnson <quic_jjohnson@quicinc.com>,
	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
	Banajit Goswami <bgoswami@quicinc.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	alsa-devel@alsa-project.org, linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org,
	kernel@quicinc.com
Subject: Re: [PATCH] ASoC: qcom: add missing MODULE_DESCRIPTION() macro
Message-ID: <7a0cde5c-db6f-4de1-9dc2-aa2c21fd0210@moroto.mountain>
References: <20240603-md-snd-soc-qcom-sdw-v1-1-101ea8bcdd38@quicinc.com>
 <0bd0a518-4d85-4251-9bf9-d056dc3d7b08@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <0bd0a518-4d85-4251-9bf9-d056dc3d7b08@sirena.org.uk>

On Tue, Jun 04, 2024 at 12:56:09PM +0100, Mark Brown wrote:
> On Mon, Jun 03, 2024 at 05:16:07PM -0700, Jeff Johnson wrote:
> > make allmodconfig && make W=1 C=1 reports:
> > WARNING: modpost: missing MODULE_DESCRIPTION() in sound/soc/qcom/snd-soc-qcom-sdw.o
> 
> Is anyone getting any value from these MODULE_DESCRIPTION()s?  This all
> just seems like a huge amount of noise and I'm having trouble thinking
> of a use case.

The missing MODULE_DESCRIPTION() warnings are very annoying.  We
recently missed a link error issue because the warning was drowned out
in MODULE_DESCRIPTION() warnings.
https://lore.kernel.org/all/202405182038.ncf1mL7Z-lkp@intel.com/

regards,
dan carpenter
