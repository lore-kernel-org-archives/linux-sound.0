Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0AA4C3F1ACC;
	Wed,  8 Jul 2026 07:15:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783494925; cv=none; b=c+LYvdzpKSnWz08eAikLuDdCVgpBc3v+2naYHZaW0azixLbGrJ4CLc8wyX20P0KsDBYdGIQQxXlujVQD7eteWZ7ltU9hCwmBfdfhIUlc4OZyhzXX33qcnYxdDYALmh3otrCdVtAl1b31nrbSVC/T/KT9w3E9YSTAvJ9R/YWUfPU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783494925; c=relaxed/simple;
	bh=92LPYcJtL6s1IN9Of4SR/bXrT7oaeXLuqial9Ohbzv4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Tu4JysRpRXrisNQ98zGGLMG80DVPE/M1Usdjy3LiopCtUjLHMbM4oWmI4DkVWbHUmKpiCKCdqZ/forxU1S5DJ7AELoWh5D+Vi5xq4ypDbasuKvYD/mXcQLvpmQpEu/pQJK96s8CsUU57l3mTNLYFt44/T+LUBI2KpeyjxGTEows=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=N9tx2mIa; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="N9tx2mIa"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9BE6C1F000E9;
	Wed,  8 Jul 2026 07:15:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783494906;
	bh=1SdiBOoVm/OzlyqeV/kwd8oyweZKdg4Gu4ZU02hH1og=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=N9tx2mIa8W8k2BP1rQkme7u0zKobY24Pd4XqT0Rg00Tsk/1JOtZiWDM5by6epkhub
	 FDoQ7OdN7NPVaahRunnAaTk4mG7J3rq82CbeFHlf3wotNfEZ5HMDRKJy7Da6yYk3q6
	 Y6E+uGgbLyjZ1k2cffzLNp4flSLeNLwO9KefAoIIE2RlW7eWF2GPu2hcn41ZShDTLG
	 6dkU3Ni5NsdOAxvqnfO9OD52ljzAz0FbLxxcn+wxcSTiKXs0E5H+dGNyltB5UM1r2r
	 qJJMUlzC/gMG6A1dwmjFFWjxAR4qE0CP2HUYb3ZALklh7XeqawpKXRZYWk46qJRjzO
	 nFha/cYBA+ILA==
Date: Wed, 8 Jul 2026 09:15:02 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Ravi Hothi <ravi.hothi@oss.qualcomm.com>
Cc: Srinivas Kandagatla <srini@kernel.org>, 
	Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, linux-arm-msm@vger.kernel.org, 
	linux-sound@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	mohammad.rafi.shaik@oss.qualcomm.com, ajay.nandam@oss.qualcomm.com
Subject: Re: [PATCH v1 2/3] ASoC: dt-bindings: qcom,sm8250: Add Eliza sound
 card
Message-ID: <20260708-strategic-butterfly-from-wonderland-7e2b38@quoll>
References: <20260703073434.2589657-1-ravi.hothi@oss.qualcomm.com>
 <20260703073434.2589657-3-ravi.hothi@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260703073434.2589657-3-ravi.hothi@oss.qualcomm.com>

On Fri, Jul 03, 2026 at 01:04:33PM +0530, Ravi Hothi wrote:
> Add bindings for Eliza sound card, which is compatible with
> the existing SM8450.
> 
> Signed-off-by: Ravi Hothi <ravi.hothi@oss.qualcomm.com>
> ---
>  Documentation/devicetree/bindings/sound/qcom,sm8250.yaml | 1 +
>  1 file changed, 1 insertion(+)

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof

