Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com [209.85.208.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3035189BB1
	for <linux-sound@vger.kernel.org>; Sun,  6 Oct 2024 20:23:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728246235; cv=none; b=mBMVBV0l1AXCl7KPqRa+wmz4BBwF12YfUIYBpvKNvYr3z1HJ+u648/cqhEdy79VAQespTjoy8KJqoPPmVi0fjcZaOO3nu+ICKJOfkqLxbK+kcPTpIzhkU/Kv44cs11X2eselwXoJd03OMcX7kJFmeIBpOlsubVzvsDhh/UMbQ8s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728246235; c=relaxed/simple;
	bh=9/IyMAHv2eIUwA3++BDoFfJTjz9glj1kN3V5KZf62zk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XelUkw6g1AozdwWHkrWvBIEEUCY8A4VuPQQWpoq4fF9nLdiU3ySQcxERVuSrMvWQyWSQw7LT892RbHc6XKToYa9vb0ff7p99JZamWENIbJePCD/ei8IwVEkyIRhKGJ0ghGoW4RaFEcrkhl4CjrfJuc/VupjLBfAWuIP5ot022fg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=bsX7bzCN; arc=none smtp.client-ip=209.85.208.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="bsX7bzCN"
Received: by mail-lj1-f174.google.com with SMTP id 38308e7fff4ca-2facf40737eso40052721fa.0
        for <linux-sound@vger.kernel.org>; Sun, 06 Oct 2024 13:23:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1728246232; x=1728851032; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=SjmOkhGoHww5SsWhWZcZeAeLgnv0SYVUTlVXfaGN1Ts=;
        b=bsX7bzCN2dWNd5KfRJ7ThQLPoD2tF5hVQnf4P0dEJujUw2RjfZv2E17gqnQkU8aajo
         N3AgsJGceXWv8Z5SDlr8lBKvtpPvg1ALtMkKVkMyYWiEu7jfVtxSvwD7p2Nbh8HWl+ar
         BK9SJZ9kPoPQwhhHVBziGi+JToeQOveUpeYRc/RVyK4YGpwXq/05aTDPi8rmB8AvILgr
         2y4Nj+vVQqmANkbAcIF0ZyzaaQmXekzmHU8l8dXTgW0P/KbbaS8aQifIf1ACeHyB3IGn
         x5HAaC2pqWFULwD0eN+PbQ9x5M3b3q4E12fWTkBggLaZYJVRyhd9AQBe2WxFHVBlPW80
         p+Nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728246232; x=1728851032;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SjmOkhGoHww5SsWhWZcZeAeLgnv0SYVUTlVXfaGN1Ts=;
        b=XvTLs5AGzQlOV97N7NBeBIFurRJy3dsjOLynmkKtS3mjSLfcjgHRR4Rwc4beSh4UmQ
         KqF2Jh9WRzwTR4Di+ahc2YSL9jzXnS3hx7ZWahWgBUTY3EyIKAHzgx7cOixK0TFAcoI+
         HiKx7NnfvDUhIYb0UP9N3J1tPdpOkNChKcZAwRinCx779P0QvglnV423eN++QVRf1/gV
         mVigPXzVCrXc76EIV7Izr4uE25wQTXojx3Ee+9Z+3XOFeu2G0STXKkYDRBuT6RsLKyaL
         XQ6Xw1UrzpEsMS1E8TFZKafCF+GAoojleA1CznFKXXeL+dp5f0eEca2HQbj97gw/fDzT
         ADYw==
X-Forwarded-Encrypted: i=1; AJvYcCUOmEgdiXEtI9b8N5qiIHKxKJYmMkX0V8tH67kKcb6CXvCAUjX9VFV9a74Mla3c1q9EAFXEXADboMUCdQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YzNke3NPMTDsJF4yc+Y6FgauGVT/9Ig+xvUzxkbeASVV6dseoBJ
	sAfHJlj4lFQwMGu+RqT2NoyglE9W1G15G4rB3qQ8S312mDBNP1S61zCqxb/6bb8=
X-Google-Smtp-Source: AGHT+IE9Ou+NDUiMJlp5CAdop1NdXKTU8QhE3wA1kzmQkrSFmqoSvuA4HniJwQ6rP+n6zCcA1stj9w==
X-Received: by 2002:a05:6512:398b:b0:536:a695:9429 with SMTP id 2adb3069b0e04-539ab8625a4mr4460950e87.10.1728246231828;
        Sun, 06 Oct 2024 13:23:51 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00-89ea-67f6-92cd-b49.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:89ea:67f6:92cd:b49])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-539aff1d0c8sm602410e87.130.2024.10.06.13.23.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Oct 2024 13:23:51 -0700 (PDT)
Date: Sun, 6 Oct 2024 23:23:48 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Gax-c <zichenxie0106@gmail.com>
Cc: gregkh@linuxfoundation.org, broonie@kernel.org, lgirdwood@gmail.com, 
	linux-arm-msm@vger.kernel.org, linux-sound@vger.kernel.org, perex@perex.cz, tiwai@suse.com, 
	rohitkr@codeaurora.org, srinivas.kandagatla@linaro.org, stable@vger.kernel.org, 
	alsa-devel@alsa-project.org, chenyuan0y@gmail.com, zzjas98@gmail.com
Subject: Re: [PATCH] ASoC: qcom: Fix NULL Dereference in
 asoc_qcom_lpass_cpu_platform_probe()
Message-ID: <r6bumoyhuu53kz57tqlcscitpyi67tb7422d2kffifzpqyphfz@agniiovymvdw>
References: <2024100358-crewmate-headwear-164e@gregkh>
 <20241003152739.9650-1-zichenxie0106@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241003152739.9650-1-zichenxie0106@gmail.com>

On Thu, Oct 03, 2024 at 10:27:39AM GMT, Gax-c wrote:
> From: Zichen Xie <zichenxie0106@gmail.com>
> 
> A devm_kzalloc() in asoc_qcom_lpass_cpu_platform_probe() could
> possibly return NULL pointer. NULL Pointer Dereference may be
> triggerred without addtional check.
> Add a NULL check for the returned pointer.
> 
> Fixes: b5022a36d28f ("ASoC: qcom: lpass: Use regmap_field for i2sctl and dmactl registers")
> Signed-off-by: Zichen Xie <zichenxie0106@gmail.com>
> Cc: stable@vger.kernel.org

I think Fixes / Cc / Signed-off-by is more logical.

> ---
>  sound/soc/qcom/lpass-cpu.c | 2 ++
>  1 file changed, 2 insertions(+)
> 

This is version two of your patch (even though the patch contents didn't
change). Please tag your patches accordingly, provide a changelog and
don't send next iteration as a reply to the existing thread (it might
get lost or mishandled). Please send a proper v3 of your patch.

-- 
With best wishes
Dmitry
