Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A467201111;
	Tue, 29 Oct 2024 07:35:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730187328; cv=none; b=pFnLQOPQnutT77v60QyGG9QaqnEq/0+I9yXPWIFkiszFAIvlOs+Qlmxh8hpTP1JbDg1WRkVGKjFDSQuqBkcYP8U2AdOG6iJ3us7SKnawdElYnA1uTQHyw/QP3K6hwJTqSjsty/x4YwJTYASZ6s9OqvnU2JhLEEkB6rESH0PjSBE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730187328; c=relaxed/simple;
	bh=FsShKQx2cCPX9q1T6wPApEFnn7orbhdTIJbBFXsJ6rc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WfN1odivCWJo89Ebrwy5sogJIRQt+pKhHLzuPFI6sGaUNocxpp92HWfQFwSyuQPsQasFxrlvw18CWR6cWBTm4yp+K14DPx9GwLfa+FLAcsd1FIwcZX0b0k95UhoIh9Mb52WlGC4ZxAuuC4KC3NkUnvn/+rNGB0NbwnirpzukWgU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=S3ME9thv; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="S3ME9thv"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 76139C4CECD;
	Tue, 29 Oct 2024 07:35:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730187328;
	bh=FsShKQx2cCPX9q1T6wPApEFnn7orbhdTIJbBFXsJ6rc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=S3ME9thvmaifcTyRwV4A6rV19cG8y2eROk/hf/1EW++VX999bOZ3vrDtBy4dIzh8y
	 pQy7fXhw/ko2QLBcWAt6EENST7rPAPBUt8kltoRkLH6U3KrkXvEWZAKZEFQ6d44v0Q
	 0Ias/dm/jiB1XyEEukasqwc2mY8pnCTu8iDSBzQvqzO2GVBvt+7JMhZDTQdFUq7qZp
	 cJBi2FZJ5BAjf19KrhlRnxwxhzTXm4PcTH1pg4E/p9bknS/oR7WA6MSsaBoPji+ZyJ
	 KInXlP3oIrg6QpS/Rj1ou1GCAPHdKwai8H6QFyxn7hcYAOdj8TwE9yL9qqRLb2Koko
	 q+F1qDv+gNNSQ==
Date: Tue, 29 Oct 2024 08:35:24 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Nuno Sa <nuno.sa@analog.com>
Cc: linux-sound@vger.kernel.org, devicetree@vger.kernel.org, 
	Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
	Lars-Peter Clausen <lars@metafoo.de>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Subject: Re: [PATCH v2 2/4] ASoC: dt-bindings: document the adau1373 Codec
Message-ID: <qqtb75ss6v4z32p5whcdflpiclxqpau7igutqlqp62sgoxdzr3@e7pemxwcltuf>
References: <20241028-adau1373-shutdown-v2-0-647f56bbd182@analog.com>
 <20241028-adau1373-shutdown-v2-2-647f56bbd182@analog.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20241028-adau1373-shutdown-v2-2-647f56bbd182@analog.com>

On Mon, Oct 28, 2024 at 04:43:39PM +0100, Nuno Sa wrote:
> Describe the adau1373 Low Power Codec with Speaker and
> Headphone Amplifier.
> 
> While at it, properly add a MAINTAINERS entry for ADI sound bindings.
> 
> Signed-off-by: Nuno Sa <nuno.sa@analog.com>
> ---
>  .../devicetree/bindings/sound/adi,adau1373.yaml    | 111 +++++++++++++++++++++
>  MAINTAINERS                                        |   1 +
>  2 files changed, 112 insertions(+)

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

