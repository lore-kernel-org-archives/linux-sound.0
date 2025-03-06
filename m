Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC76F18C01D
	for <linux-sound@vger.kernel.org>; Thu,  6 Mar 2025 17:04:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741280698; cv=none; b=ZoyQLSUTSui9dRx0zafcravfDayxKD5I5g/pVONmssBJuLMlMmXMXcwNce3JsQqCSJYLqGgNK7qOVfka9blRCr9DM35F3UZymjJ8fGk8cNszqpzsTJolAwzN3iPeY3+KsCYj2VKyi3Jh7rFXzr6QLfhsveNQqBK1cD4Moq/IBic=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741280698; c=relaxed/simple;
	bh=5R30x4xhG8B8zMUfIGiFqFS6AcrcChLocLOkQPgCoT0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=j+mkKmZGGf0DRqIL5XFzEUVHgREq0WZV9LSNr52vuebQxEhXNGN6Gr32Or/DDosJQZPYE589oFzkbNXJ4gqwD5+aUXy7XYhyTMQteA1HOGU09bh/sj4mZ374EkirRyKSL1DZ0LRVyh+Dcdr5eRjRHxV3NlQGyGNmCyz5zDDG0n8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=zaAP5RNB; arc=none smtp.client-ip=209.85.167.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="zaAP5RNB"
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-5452c29bacfso1039815e87.3
        for <linux-sound@vger.kernel.org>; Thu, 06 Mar 2025 09:04:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741280694; x=1741885494; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=zjfqdZik8Yo6VfIh3QiCKD6S9SpHxBu1Xihobwzn8xA=;
        b=zaAP5RNB6J5GiJoFxntMrZFD88yQznhr4INF6vCgX/wyh4ilUafx42HwYwrci3u2tn
         uVQeoMPsf7s0fk9Tz67xoReOjz1aM0WdAWiwwYwOdBaceuOv60a8GOW4y0qL2I5xcoxp
         /RlRH5fS+gDMzspB/uv8rogwaHwk2aUq/vc0LhQT75GnuREF74kjSsMJlPBM2rtD2X0x
         Y8NvlgZnwOWO4zwiX/gqdst2pPgde0IjxTjn66KSnknlotXEWR41UqJD5sglMyWFgA6Y
         xIvufpUsapmHReurhGPZzb3s90G7PrNBKT+5dUhtwqovjzJB0v+wmOVW9Gdel5V0XUeg
         AjZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741280694; x=1741885494;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=zjfqdZik8Yo6VfIh3QiCKD6S9SpHxBu1Xihobwzn8xA=;
        b=f23Ek8MwpSfI3nBXwhyNmt/RXs9mwSA1YOGCDN5DUEFKeFWjz5hApgE1bUQKvm8vS2
         NxqoP/N5kboKte9B7ZHWK/JOvdb2F2z8eNNp+7oLE7/zYwBAZafb/HQzGCpDxxcb7Jfa
         SgEYskb0kDhVpzLKxTqn4dY0XDtN77ThnwcGa8L0SUbMb6ZWWXm9xnLK41hE709SNpex
         sKZSHD7e4NLtaOG3JKDocLnGGH4e6iexmy5HmyzcE7UEq3rJCsNqqXOqgJ+NXlMiD5CQ
         VtGJ9hJpqbz2IW4dYe9HKC42r6MFuBoxmm+Gb3yg5HW6OlojGwZqGm5m7IuqxRglw0cR
         lnrg==
X-Forwarded-Encrypted: i=1; AJvYcCWupzf9Ghug2schvMl3VJ9qfrcRjfWoZ8kVKn9H6aVCfk7y4laTtaSIGgeS87smCKWw9nUMqvGJ6sRUxg==@vger.kernel.org
X-Gm-Message-State: AOJu0YxmVERnX0QdoP8ztCHdM80P5vIGRMARH6hgO6GIpUXWTASnLJnU
	BRSqy2i59Y0KaKPf7wMSdOXrhwdtDaQ+wJC/hxzwU67iE3SJnUV/NezHHOop9/g=
X-Gm-Gg: ASbGncv507YVExH8E2cLoKT70vMd7+Ps45RMg1R6de/MuFULOOxYVkVv0Q4AtrFMFE4
	rwnqfXisn1WSeX6K6jAbMnqW4PIOlO6ebbJ0SJ3mlDXpoOKGaRy2E2l6OJbOS/E6YcmKh+uYgPH
	CxhLuGyH6NsuWHvKo2o6xDzSDp2895/Ioi9AnUSjAOn2sruJryo0znlsfQr3F46bhtNWx4B7H10
	GWYOS9gtbpufWGh/54yJx4JsQqUA7W8T172ytAoDP1AxiidX2RxVN2wPCUS/+qaukBfZe3c+sCm
	Ja8sz9j3sk8/tW8EiTeRrxEwIcMgPH8BFnOpeSHSsLDI+uDZ8jUWgUiRv/fQ23aZQt5a5n713CI
	GJ/wclA2avsICBhOXWp7BhAS0
X-Google-Smtp-Source: AGHT+IGb5n4nLHuJOo53o088PyCQtpwg/5P2yozwSc9CG3CJHR24aIjuY/xSZ/f5OkCiABcej8Dmzw==
X-Received: by 2002:a05:6512:158f:b0:545:576:cbd2 with SMTP id 2adb3069b0e04-5497d32f8d1mr3030521e87.10.1741280693738;
        Thu, 06 Mar 2025 09:04:53 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5498b1bc4basm230680e87.164.2025.03.06.09.04.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Mar 2025 09:04:52 -0800 (PST)
Date: Thu, 6 Mar 2025 19:04:48 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Cc: Caleb Connolly <caleb.connolly@linaro.org>, broonie@kernel.org, 
	perex@perex.cz, tiwai@suse.com, krzysztof.kozlowski@linaro.org, 
	linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	johan+linaro@kernel.org
Subject: Re: [PATCH v3 0/6] ASoC: q6apm: fix under runs and fragment sizes
Message-ID: <lim35p2lwwo7uelex6co72hvwskawmevgibzfdqk5av7cur6g7@wqyenx5jzgxb>
References: <20250304105723.10579-1-srinivas.kandagatla@linaro.org>
 <ea047098-2baf-456a-a57f-b698c0ce1b6e@linaro.org>
 <9b4fd423-a463-4d50-a597-dbda532b6b61@linaro.org>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <9b4fd423-a463-4d50-a597-dbda532b6b61@linaro.org>

On Thu, Mar 06, 2025 at 01:15:43PM +0000, Srinivas Kandagatla wrote:
> 
> 
> On 05/03/2025 22:17, Caleb Connolly wrote:
> > Hi Srini,
> > 
> > On 3/4/25 10:57, srinivas.kandagatla@linaro.org wrote:
> > > From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
> > > 
> > > On Qualcomm Audioreach setup, some of the audio artifacts are seen in
> > > both recording and playback. These patches fix issues by
> > > 1. Adjusting the fragment size that dsp can service.
> > > 2. schedule available playback buffers in time for dsp to not hit
> > > under runs
> > > 3. remove some of the manual calculations done to get hardware pointer.
> > > 
> > > With these patches, am able to see Audio quality improvements.
> > > 
> > > Any testing would be appreciated.
> > 
> > This totally breaks audio on SDM845, and often results in a hard-crash
> > to crashdump mode on my OnePlus 6.
> 
> Its not possible.. as SDM845 is Elite DSP architecture, all of these patches
> changes are very specific to Audioreach DSP architecture.
> 
> Could you please share the crash logs if you have any. It highly likely that
> something else is triggering the hard-crash that you reported.

I will try reproducing this on RB3 today in the evening.

> 
> thanks,
> Srini
> > 
> > Unfortunately I can't get UART logs right now. But I imagine this is
> > reproducible on RB3.
> > 
> > Kind regards,
> > > 
> > > thanks,
> > > Srini
> > > 
> > > Changes since v2:
> > >     - dropped patch which is causing regression with pluseaudio.
> > >     - setup period sizes only for capture path
> > >     - fix underruns/overruns in dsp pipelines.
> > >     - add fixes tag
> > >     - add patch to fix buffer alignment
> > > 
> > > Changes since v1:
> > >     - added new patches to fix the fragment size, pointer
> > >       calculations
> > >     - updated to schedule only available buffers.
> > > 
> > > Srinivas Kandagatla (6):
> > >    ASoC: q6apm-dai: schedule all available frames to avoid dsp under-runs
> > >    ASoC: q6apm: add q6apm_get_hw_pointer helper
> > >    ASoC: q6apm-dai: make use of q6apm_get_hw_pointer
> > >    ASoC: qdsp6: q6apm-dai: set correct period and buffer alignment.
> > >    ASoC: qdsp6: q6apm-dai: fix capture pipeline overruns.
> > >    ASoC: qdsp6: q6apm-dai: fix playback dsp pipeline underruns
> > > 
> > >   sound/soc/qcom/qdsp6/q6apm-dai.c | 63 +++++++++++++++++---------------
> > >   sound/soc/qcom/qdsp6/q6apm.c     | 18 ++++++++-
> > >   sound/soc/qcom/qdsp6/q6apm.h     |  3 ++
> > >   3 files changed, 53 insertions(+), 31 deletions(-)
> > > 
> > 

-- 
With best wishes
Dmitry
