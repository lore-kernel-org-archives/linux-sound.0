Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48FC02FE074;
	Sun,  3 May 2026 12:08:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777810108; cv=none; b=EpH8sNi9vQRi7+vIDmJZiTx02Hrtr2a6qQo6HP5LLV+UC2e5okjD7cMa39PYaVk2HjUqH2JsJSVw11QhSJsoTYxsm7Mz+dFTAFlSyJ8zsdjsxixFFc8ANjUqIng/pEPeLuNhHoHfhsLU1dBUxsrzJwBoXF9VZJYbLxd8Kn6FMhg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777810108; c=relaxed/simple;
	bh=l9PXnkKYaVgSz850AzcyTAfZ4ROe6rEwNEfMLfuGbcE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XOgStyyOt2qSoJeyysAAyNPEthRba0w0aoXMC4sFMRbFnEt3cgW9AcEO5kMrMJCe8XGhmrN4uAdowc1FsD9fpOmC4knOKIdHTwWxX/RR1ywKVhEU8RakSqvK5p85h+DMIioIy/xSxF/2c2tVTT/jdmcpXb4eWfHo3GcKa///FM0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jKhrNJSi; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jKhrNJSi"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6E3B5C2BCB4;
	Sun,  3 May 2026 12:08:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777810108;
	bh=l9PXnkKYaVgSz850AzcyTAfZ4ROe6rEwNEfMLfuGbcE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=jKhrNJSiC9c0LXovON17tgjM8qq/rJl0SPhX5OOLBFZoUIwWOx+s4DG1NL0OFviFt
	 fCM842e+gucwegdsVhhsTeSkVGLc0/73t/6xh5gmd/rgWqlQDXYJNftLczZXDu3muj
	 /BBM1rmvIAkIAw3dCfHSeFFsn5KTQ6IlQxvIupGJ1ue5dhecAbgf6x/4bMPhjzy6FJ
	 ZLbKg1+UUYSnogin8X9d3KgKxG+nmqmzIZ38TLk7zerFONatPH/mj/pshUzYgDjAC9
	 f5Lfp6CrIrWadvZvlK7rhPsTHmXwgDqxv1WVVbDAfhtc+GKKBigxLLidhoVJ4dyTo5
	 GHTBuCsNkstbQ==
Date: Sun, 3 May 2026 14:08:25 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Richard Acayan <mailingradian@gmail.com>
Cc: Srinivas Kandagatla <srini@kernel.org>, 
	Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
	Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>, Konrad Dybcio <konradybcio@kernel.org>, 
	linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
	Nickolay Goppen <setotau@mainlining.org>, Adam Skladowski <a39.skl@gmail.com>, 
	Vladimir Lypak <vladimir.lypak@gmail.com>, Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
	Wesley Cheng <quic_wcheng@quicinc.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Johan Hovold <johan@kernel.org>, Kees Cook <kees@kernel.org>, 
	Charles Keepax <ckeepax@opensource.cirrus.com>, Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: Re: [PATCH v4 01/15] ASoC: dt-bindings: qcom,sm8250: add compatible
 for sdm660
Message-ID: <20260503-loyal-fat-rooster-aaabfe@quoll>
References: <20260501153128.8152-1-mailingradian@gmail.com>
 <20260501153128.8152-2-mailingradian@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260501153128.8152-2-mailingradian@gmail.com>

On Fri, May 01, 2026 at 11:31:14AM -0400, Richard Acayan wrote:
> From: Nickolay Goppen <setotau@mainlining.org>
> 
> Add compatibles for sdm660 based soundcards.
> 
> Signed-off-by: Nickolay Goppen <setotau@mainlining.org>
> Signed-off-by: Richard Acayan <mailingradian@gmail.com>
> ---
>  Documentation/devicetree/bindings/sound/qcom,sm8250.yaml | 1 +
>  1 file changed, 1 insertion(+)

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof

