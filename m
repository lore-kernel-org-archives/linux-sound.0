Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C128616DEB1;
	Fri,  6 Feb 2026 08:03:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770365015; cv=none; b=NvX9WhgkSpPESQPZ2bWFyqPzvDrZC6xki+dVIz+c7ngjJZ4JqHyzkqJqTY1nQTGWMtFILQFdRujZcHBkUJIKPTQ8DBAzzHtZzvzQEset+omKZe1kCfp3RmIrri7o9IlhM34F7NX7CkaK3m1Ok2nymx/UyVOcNfGrKjLkB1s1KTA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770365015; c=relaxed/simple;
	bh=c6QFWwpCfDSDuqoYDs1+erWqQ5RB5XejkVMjVYpSHMo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Vbm43LW1qOXIyCuZ7LlWeStCSAA0ZnTbsMt7h8ACJl/QrVmlkfnVufc6xzpvTrkfGFPgCNx3YMx9B9Z/QhM/HXCNKJWsaG6Y/ClMCYa+pDgjT5s1+JLPIM1v41Ykw7rFibvRltb8EX7J5OB7yYOt2jbChTIca1eKEnoZeLlkkxY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VE/bTezM; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VE/bTezM"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CA60FC116C6;
	Fri,  6 Feb 2026 08:03:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770365015;
	bh=c6QFWwpCfDSDuqoYDs1+erWqQ5RB5XejkVMjVYpSHMo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=VE/bTezMBfL+VglVlZqRcjPcfSoZghe5DSI9izb0Toz4hMRl2CRt+dA1p08F2b3xT
	 PLf0YxqsSmRbX7bIi+9AJDpH/r3D2ny1W+SzKicn5j9lwzaffOv5nGmUSRZlSQTbGw
	 quyJy6ulRRrpPGkRkRYWT5EyWxDp3xYdHrjSbAVZ5NagFSV6Z+EkCDmXTZXFeuEVTI
	 N/DHijCjiM7fRK+TzgMt2mM3DbucOZU/k2tZBgciZOcVUMkJOWONX0p9+x6T9EcVX0
	 T8cm1SQJbQudO3zX0UqgYd6C44MkuP8D441D79oMjxhiA9Y7q4KhkUG+Tk+JXOLYpm
	 KgQdK5b0qORvw==
Date: Fri, 6 Feb 2026 09:03:32 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Cc: broonie@kernel.org, lgirdwood@gmail.com, robh@kernel.org, 
	krzk+dt@kernel.org, srini@kernel.org, perex@perex.cz, tiwai@suse.com, 
	alexey.klimov@linaro.org, mohammad.rafi.shaik@oss.qualcomm.com, quic_wcheng@quicinc.com, 
	johan@kernel.org, dmitry.baryshkov@oss.qualcomm.com, 
	konrad.dybcio@oss.qualcomm.com, linux-arm-msm@vger.kernel.org, linux-sound@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 06/10] ASoC: dt-bindings: qcom,q6dsp-lpass-ports: Add
 Senary MI2S port
Message-ID: <20260206-smoky-owl-of-tempering-9eddbf@quoll>
References: <20260205171411.34908-1-srinivas.kandagatla@oss.qualcomm.com>
 <20260205171411.34908-7-srinivas.kandagatla@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260205171411.34908-7-srinivas.kandagatla@oss.qualcomm.com>

On Thu, Feb 05, 2026 at 12:14:07PM -0500, Srinivas Kandagatla wrote:
> From: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
> 
> Qualcomm platforms support the Senary MI2S interface for audio playback
> and capture. Add a new definitions for the Senary MI2S RX and TX ports,
> which are required for boards that utilize the Senary MI2S interface
> for audio routing.
> 
> Signed-off-by: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
> Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
> ---
>  include/dt-bindings/sound/qcom,q6dsp-lpass-ports.h | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/include/dt-bindings/sound/qcom,q6dsp-lpass-ports.h b/include/dt-bindings/sound/qcom,q6dsp-lpass-ports.h
> index 0febc641f351..715bcf1bccdd 100644
> --- a/include/dt-bindings/sound/qcom,q6dsp-lpass-ports.h
> +++ b/include/dt-bindings/sound/qcom,q6dsp-lpass-ports.h
> @@ -150,7 +150,9 @@
>  #define	LPI_MI2S_TX_3		144
>  #define	LPI_MI2S_RX_4		145
>  #define	LPI_MI2S_TX_4		146
> -#define	LPASS_MAX_PORT		(LPI_MI2S_TX_4 + 1)

You just added it in previous patch. It makes absolutely no sense to
add a line and then change it IMMEDIATELY and then change it again.

It's the same patchset!

And again I cannot send it because of typo in your address and I must
correct it by hand.

NAK

Best regards,
Krzysztof

