Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com [209.85.208.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB5C6165F13
	for <linux-sound@vger.kernel.org>; Sun,  6 Oct 2024 20:31:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728246681; cv=none; b=jiz9lqUDWUJMS1rlUX+I/XTr7XMb6lFbfPrtn/3KrH4e1Gk4Rck36tlbz2gv4FgYYOgwzpi2l2OpP8Jqdks9rEztz68oaSRf53YQaxt2hFOsplsJ8bgQasYT+xRWBOw+wXO+Cgb31URo+mfhNEuagEKT9EKEoAEuzKPnYaPxTuM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728246681; c=relaxed/simple;
	bh=j0wHohpCPzzDKqxtrAk20/ENTrWHOfp9eS77ZWfWBvA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fwqj68zk0pY993mOiR26rGxG44MCKdeSko86mVZNEefuvtIRhvylt0Dza4aqkdnpSk3PxTUVGxHT1oILjKoPNiOpOhRQ0+T2xd2kYGymHZWDOIk7clnRldKoWt3FTrD1WIfdmObk1RVWLntEO6ajT/+UqXY15H5vRpQztTC0x6Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Ojc/X/ku; arc=none smtp.client-ip=209.85.208.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Ojc/X/ku"
Received: by mail-lj1-f179.google.com with SMTP id 38308e7fff4ca-2fad8337aa4so41087071fa.0
        for <linux-sound@vger.kernel.org>; Sun, 06 Oct 2024 13:31:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1728246678; x=1728851478; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=wnDB2fW7Uiplt22brqA1RNzhLsSLQ6D5krSMR8PbvZ4=;
        b=Ojc/X/kutWamSbbdMEd+RLGTsZxWmGVItxTfIJgi3xGA3eR9LbrCBexieHPsmqOEeT
         uBHB6siptLbPbT/hBHgh4o/0Ixad15fKuiQThktSPBmfEc/6LmjQm7E+UT+yKNz0tSAL
         WeGFc3PSIpAFK6E9Hb7kzh4A5XYOu4QO5bgl2hFpODLbmisPHbRkYkaHNY0dSBBvNfI5
         fAtw2uaygUyjm7GrsTRbBJUmW0ETFnoaLP3s6TZK/RYPE3/w6Yd8lKhpOTwNAzoN5gBT
         8dD1nwK/fdk41IaNtq+TA51zQ7pAddJVvmOZ3JT3YX3ulEYMX70rlP/oez01WRVMsfX7
         VMfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728246678; x=1728851478;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wnDB2fW7Uiplt22brqA1RNzhLsSLQ6D5krSMR8PbvZ4=;
        b=d8yB4EscS4EKrhU2QE1h5GaQroTVGcEoo0/CEyNS1FRn+bdtDdtj5EWbcvkdOaMKg/
         lnn9kUcj+0MDIzu9YF/oP0toNUajxc0z1gy5zySv+8w4DUY/MzPI6xdW7OSOzX0dcgMG
         GZ2Nqm9pCaAUWwQ53gjJcWatyP4zFfjxUNdErbKP5yCZ7mjh1c1ezckqhmF2AMwH16Cn
         6VdtqNKUSZ5UH05tejnuPhQQGhEdzo3NY3Rb6ytNo1xMQE1GymcZyEqgK9VmMBGVC88Z
         5v/JnNqEUDhanKIPmjyKVitPfo/v03/KvB4XcRtHcj8306HOKM+71akjl0QxSqrJhUce
         Zmaw==
X-Gm-Message-State: AOJu0YyZbqXtKZuL5uE/ha+2lizWSM6lFPcV4oWh/+8RZJfZWeUInIwG
	ClXostss3C95gAToEPnIZGLVriOTATWE0PXRiPOIgRYNSVkHDDN63qf3rnczeAE=
X-Google-Smtp-Source: AGHT+IFub05WOwLbe6F5w7k7wYQXANrXi+2huDuX4RyxzjTbcyafo7jRZJALI7WYI52WZaiVBQ3qhg==
X-Received: by 2002:a05:651c:b0d:b0:2f6:1d35:1491 with SMTP id 38308e7fff4ca-2faf3c136dbmr45471801fa.15.1728246677803;
        Sun, 06 Oct 2024 13:31:17 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00-89ea-67f6-92cd-b49.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:89ea:67f6:92cd:b49])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-2faf9b32e1dsm5814791fa.107.2024.10.06.13.31.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Oct 2024 13:31:16 -0700 (PDT)
Date: Sun, 6 Oct 2024 23:31:14 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Alexey Klimov <alexey.klimov@linaro.org>
Cc: linux-sound@vger.kernel.org, srinivas.kandagatla@linaro.org, 
	bgoswami@quicinc.com, lgirdwood@gmail.com, broonie@kernel.org, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, andersson@kernel.org, 
	konrad.dybcio@linaro.org, perex@perex.cz, tiwai@suse.com, linux-arm-msm@vger.kernel.org, 
	alsa-devel@alsa-project.org, devicetree@vger.kernel.org, elder@linaro.org, 
	krzysztof.kozlowski@linaro.org, caleb.connolly@linaro.org, linux-kernel@vger.kernel.org, 
	a39.skl@gmail.com
Subject: Re: [PATCH v2 3/7] ASoC: qcom: sm8250: add handling of secondary
 MI2S clock
Message-ID: <67b42rl2czgaunfhfgojbb7na5n7hnvdb2pmz3zqaard3zuujg@te2lgjzscw6f>
References: <20241002022015.867031-1-alexey.klimov@linaro.org>
 <20241002022015.867031-4-alexey.klimov@linaro.org>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241002022015.867031-4-alexey.klimov@linaro.org>

On Wed, Oct 02, 2024 at 03:20:11AM GMT, Alexey Klimov wrote:
> Add handling of clock related to secondary MI2S_RX in
> sm8250_snd_startup().
> 
> Signed-off-by: Alexey Klimov <alexey.klimov@linaro.org>
> ---
>  sound/soc/qcom/sm8250.c | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry
