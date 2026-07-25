Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F38B305699;
	Sat, 25 Jul 2026 16:23:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784996622; cv=none; b=XQao5Kj7kk/smLMkjBsA1RsXc7lnuurp0X/oL019Vcivb7BdkBK/cr+Xt8iA7x63gHxzpzhrQ5+f1Bwvb8pRkaV/cypbl7mQh/IFRTv27f3G6Mut/MlxtmVF8M9zy+oX9sLyPcA2JhKPfTC/3zKenqMKWz7icHCsOZXsywXRvuI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784996622; c=relaxed/simple;
	bh=kc2YJhCWZErAQWs9U3A4sgsBGc1tXaDgBW3VfQzzIsI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Fq0DzozFzSTCHA5B1a0hfgkb+AQi6pTCr91hb7bNNQjoXlh8WCwY3WwLTW1w4kShwVvIhjjoNGgeQJ8KKDIywc1MLeiICudBjYHKQ084//qn2ELrFCiy2rDGtziQXZNqzpu3YA4F0R/mQe6kz6iNZlyrJlHS1v7RN091/Supd3k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=D2u+eidr; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="D2u+eidr"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EAFE71F000E9;
	Sat, 25 Jul 2026 16:23:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784996620;
	bh=+dOiHHolIYpyMbxWHc1/ZOI+xNevlHnGzJJFSLakjG4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=D2u+eidryLxeV/iFLcxQfafTI07+ooiIq7CD3zIOPuMNA9AWofpWPUTA/T+tV9qgc
	 DU/GUmvHMNQxiTZi/NVRPbn+KY7T2U6ccdkrijlbEvUrdrDJoyr0//L2Ezu8FjFHFH
	 DUNnrbIWCb+/GstGVMMkuNp/oSarSLp9fyp6Zg2VNziFWaO/xeadRWN7weK2p4hWnw
	 hctZeWUBjZ1e/WHf9EYTl3xYasJFjVrOZP8Hmy21PCE1W0NdWdKK4/JsuTYtTsEKQe
	 mFC4KqFUGDWMO9D9osAiniXyi9njwaVeznsDHVpikQxdqvaqWN/qYaTUzMyeRueU60
	 V5fV0AgiuiWMg==
Date: Sat, 25 Jul 2026 18:23:36 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
Cc: Srinivas Kandagatla <srini@kernel.org>, 
	Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, linux-arm-msm@vger.kernel.org, 
	linux-sound@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Subject: Re: [PATCH v7 1/3] ASoC: dt-bindings: qcom,q6apm-lpass-dais:
 Document DAI subnode
Message-ID: <20260725-curvy-fiery-jaguar-448569@quoll>
References: <20260724182446.1484894-1-mohammad.rafi.shaik@oss.qualcomm.com>
 <20260724182446.1484894-2-mohammad.rafi.shaik@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260724182446.1484894-2-mohammad.rafi.shaik@oss.qualcomm.com>

On Fri, Jul 24, 2026 at 11:54:44PM +0530, Mohammad Rafi Shaik wrote:
> Extend the qcom,q6apm-lpass-dais device tree binding to explicitly
> describe Digital Audio Interface (DAI) child nodes.
> 
> Add #address-cells and #size-cells to allow representation of multiple
> DAI instances as child nodes, and define a dai@<id> pattern to document
> per-DAI properties such as the interface ID and associated clocks.
> 
> On platforms such as Monaco and Lemans, third-party codecs are hardware
> wired to the SoC and do not always have an in-tree codec driver to manage
> their clocks. For these designs, clock line enablement must be driven
> from the platform side, and this series provides the necessary support
> for that.
> 
> On QAIF-based platforms such as Shikra and Hawi, responsibility for voting
> I2S MCLK and BCLK has moved from the DSP to the kernel. This series
> introduces the required device tree binding support to represent and
> vote for these clocks from the kernel.
> 
> Co-developed-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
> Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
> Signed-off-by: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
> ---
>  .../bindings/sound/qcom,q6apm-lpass-dais.yaml | 50 +++++++++++++++++++
>  1 file changed, 50 insertions(+)

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof

