Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D2A313F450
	for <linux-sound@vger.kernel.org>; Fri, 28 Jun 2024 07:47:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719560833; cv=none; b=gqIYOAbbkYtb9BkfroKBgiXIxc4YV/nju0nQtdLTG4Ukgsw0UnBGEGokvO2WGstXGZGhA1RmuD5LU+0f8y/IgrmJm22LjR+7Graz64T0S6aZmDehPy/9ThHI4+/nwOfPeh11v4AXayxBa4YBhRO/YV+/6Oy8qAEGLAk7NDGc/WA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719560833; c=relaxed/simple;
	bh=X1XDg4CWqLekR5BIvTtoObyb6G/m6s5Hzu4qSPrR74o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qjXqNc0ReJbxuj2Jzl2M3qZiozvMeV69gIq4mQl4jfxartSB641KEeSzg1v98E63uLLKiRoNGnMEe3HGMd1eQZpKklPihgAz8dUhwznHEn0G2w2fjAt7Dcfxhhqekeij9jl12AP9WekmQvX0ap2nSIYOsaLqVq+1izxvFOW2ztI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=D1vi+bni; arc=none smtp.client-ip=209.85.167.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="D1vi+bni"
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-52cdcd26d61so302469e87.2
        for <linux-sound@vger.kernel.org>; Fri, 28 Jun 2024 00:47:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1719560830; x=1720165630; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Nc4Qf7GLtkVCveBTGX7EpUl9LATF5aggezB8l/JLORQ=;
        b=D1vi+bniCua+mbHIjXYINUB/IsSvMoAof0vyXF95cZLQgPuCD9lKewEs5JyP39YNiL
         qRaoUPXFsnH6F21OmWSqbLXNlnfu1qj7QiyMJKEuN56U5XZN2TV8ss7Q0z0Qes85FC5X
         yGtVVwN4QerUNqzU02zuMC0zmjEa+rR7NbXvGjizGKfe1H6IN3L+QMNgSmWmLLPhFKJn
         QSrDvN1kZ0iiApkSHGp84qe2ka584xJzXqKYbeUkaJoauqhQP0rVihkDp5Dq6L0fACGa
         Ua0WbnfFxqCeLroQcPw/ZKykcHqtRUrgOX+22+wlXd8fMTKP/ssDFpBt+aZR98k+TYo9
         xPpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719560830; x=1720165630;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Nc4Qf7GLtkVCveBTGX7EpUl9LATF5aggezB8l/JLORQ=;
        b=MQqV+OYOX2fan6tp1TYg3spIHDoXEwBhsdSX8EJ5rFrwvxXWCSt6lUc5MEDZzDTefc
         XSzhrQXFqA8gBk6or/+ntZ2cX4NMx6bQ8+2umFkao5t7tD1VWACMOMaRf3uF828OX1NF
         knclM8D7KBAZWzrfCVcFHQrtDXZYp+VeVzJhcXztyLkkDN5xMl02V32+UgusH5KzxibR
         ASjrDGd4kVpgEfwPch03v9TzCH6RQBCAzuZ7EuY8wTXvXbsEu5aUsHkImUqLEd5Uwd5i
         RFd4saXPSei+6uSFanbFric22becUQAbzPgDTNGPityh3ukyGAzhUGjHmw1bcxvoq9gH
         l9Bg==
X-Gm-Message-State: AOJu0YzztIRf+qBK/k26c6kYEf9fAPLJHqoW9zPcfqwTvp0xOUW475w1
	u1V9B9aTWFsHQdZdK3GTvH+y9Lk00kktlA0fC2lXpPixJP3pPucxCd2mTZUit+M=
X-Google-Smtp-Source: AGHT+IEDr3s7URgwk4byM1UEJod82amd+japUT2kSdheEtNmdtI5YyE+4VmV/k4KdQ5AmSQUb0CC7w==
X-Received: by 2002:a05:6512:6c7:b0:52e:6d6e:577e with SMTP id 2adb3069b0e04-52e6d6e5833mr4844105e87.2.1719560830271;
        Fri, 28 Jun 2024 00:47:10 -0700 (PDT)
Received: from eriador.lumag.spb.ru (dzdbxzyyyyyyyyyyybrhy-3.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-52e7ab278edsm193556e87.173.2024.06.28.00.47.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Jun 2024 00:47:09 -0700 (PDT)
Date: Fri, 28 Jun 2024 10:47:08 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Alexey Klimov <alexey.klimov@linaro.org>
Cc: linux-sound@vger.kernel.org, srinivas.kandagatla@linaro.org, 
	bgoswami@quicinc.com, lgirdwood@gmail.com, broonie@kernel.org, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, andersson@kernel.org, 
	konrad.dybcio@linaro.org, perex@perex.cz, tiwai@suse.com, linux-arm-msm@vger.kernel.org, 
	alsa-devel@alsa-project.org, devicetree@vger.kernel.org, elder@linaro.org, 
	krzysztof.kozlowski@linaro.org, caleb.connolly@linaro.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 7/7] arm64: dts: qcom: qrb4210-rb2: add HDMI audio
 playback support
Message-ID: <tqjjrkpdrqjobg5fp5jml5pj23ollc4yolln46lb533kwsgncf@tfzaxwydqhht>
References: <20240628010715.438471-1-alexey.klimov@linaro.org>
 <20240628010715.438471-8-alexey.klimov@linaro.org>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240628010715.438471-8-alexey.klimov@linaro.org>

On Fri, Jun 28, 2024 at 02:07:15AM GMT, Alexey Klimov wrote:
> Add sound node, dsp-related pieces and LPASS pinctrl to enable
> HDMI audio support on Qualcomm QRB4210 RB2 board. That is the
> only sound output supported for now.

I see that you have also added the MultiMedia DAIs, which don't seem to
be used with this patch.

> 
> Signed-off-by: Alexey Klimov <alexey.klimov@linaro.org>
> ---
>  arch/arm64/boot/dts/qcom/qrb4210-rb2.dts | 73 ++++++++++++++++++++++++
>  1 file changed, 73 insertions(+)
> 
> +&sound {
> +	compatible = "qcom,qrb4210-rb2-sndcard";
> +	pinctrl-0 = <&lpi_i2s2_active>;
> +	pinctrl-names = "default";
> +	model = "Qualcomm-RB2-WSA8815-Speakers-DMIC0";
> +	audio-routing = "MM_DL1",  "MultiMedia1 Playback",
> +			"MM_DL2",  "MultiMedia2 Playback";
> +
> +	mm1-dai-link {
> +		link-name = "MultiMedia1";
> +		cpu {
> +			sound-dai = <&q6asmdai  MSM_FRONTEND_DAI_MULTIMEDIA1>;
> +		};
> +	};
> +
> +	mm2-dai-link {
> +		link-name = "MultiMedia2";
> +		cpu {
> +			sound-dai = <&q6asmdai  MSM_FRONTEND_DAI_MULTIMEDIA2>;
> +		};
> +	};
> +
> +	mm3-dai-link {
> +		link-name = "MultiMedia3";
> +		cpu {
> +			sound-dai = <&q6asmdai  MSM_FRONTEND_DAI_MULTIMEDIA3>;
> +		};
> +	};
> +
> +	hdmi-dai-link {
> +		link-name = "HDMI Playback";
> +		cpu {
> +			sound-dai = <&q6afedai SECONDARY_MI2S_RX>;
> +		};
> +
> +		platform {
> +			sound-dai = <&q6routing>;
> +		};
> +
> +		codec {
> +			sound-dai = <&lt9611_codec 0>;
> +		};
> +	};
> +};
> +
>  &tlmm {
>  	gpio-reserved-ranges = <43 2>, <49 1>, <54 1>,
>  			       <56 3>, <61 2>, <64 1>,
> -- 
> 2.45.2
> 

-- 
With best wishes
Dmitry
