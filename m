Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD3B632E13B;
	Thu,  5 Mar 2026 07:52:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772697134; cv=none; b=sEOegwQLWkkBMtRofo3QOBoIQAaVv7XJx9VMgXEupvLnRwvB4vZRDCXqA5a6WQJKplgvfw+srK7VxvdZ71jpUcn9C4RKd4yDsgJW1XUxKy79wo577dKVu0RybVNx1HFo+LWC1nQr7k4qqgkerMPbWIDEH+9OmbkOEpsow4xvOHk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772697134; c=relaxed/simple;
	bh=ZRCtK6qCF/Be5tXlzNbermHu3xpIHaAxypQ6qSPZX6I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CT9Bm+YROWivX577452Yd3LjIs3EZQJqTth0cBbVAY2MksVaOVxkwAqykiJknV+7DLVlb/fpEMWsqfVB+mXig0otSnmUf42MB50RwY2wOlsM8dM1kJwf+XnawujfgSDXZg4S6MmfJ6xyBlPRLfmrttR6H71kQWVkRDXkPK3a72k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HRqlSywy; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HRqlSywy"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D4D86C116C6;
	Thu,  5 Mar 2026 07:52:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772697134;
	bh=ZRCtK6qCF/Be5tXlzNbermHu3xpIHaAxypQ6qSPZX6I=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=HRqlSywy60ZckAEZw5E8NXmPql5rnUDNRXcnE/O126CjfAmjMXiE4eakFykABrCCI
	 GdWlbvDBenIbRZOJrKLsql9zLjAnSiaVFStGIitlTRJDQt0CrL4LuuMNZh60iz9u2d
	 YniVshBlXa2O7BP6U9gU8A7UnM2lcuB0fPAVrYwNCU+uOVQTHb1LMqFZ1JUA2nTFPH
	 S1Rregai26x6eo12uwZT4lJ3Qd5WdOjO02XQ7RPgvfTeKGONjPlHlD9/BCnZvG9iXC
	 prWnNpeA9OuPqJO8vZlFi4efiMAPO5TPAULlJv2r5hKh217klPnPuVsxRIpfo8zifu
	 dAh8DxIDTYN3g==
Date: Thu, 5 Mar 2026 08:52:11 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Richard Acayan <mailingradian@gmail.com>
Cc: Srinivas Kandagatla <srini@kernel.org>, 
	Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
	Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org, linux-sound@vger.kernel.org, 
	devicetree@vger.kernel.org, Nickolay Goppen <setotau@mainlining.org>, 
	Wesley Cheng <quic_wcheng@quicinc.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Johan Hovold <johan@kernel.org>, Kees Cook <kees@kernel.org>, 
	Charles Keepax <ckeepax@opensource.cirrus.com>, Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: Re: [PATCH v2 01/11] ASoC: dt-bindings: qcom,sm8250: add compatible
 for sdm660
Message-ID: <20260305-giga-salmon-of-superiority-fc0bb8@quoll>
References: <20260304195815.52347-1-mailingradian@gmail.com>
 <20260304195815.52347-2-mailingradian@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260304195815.52347-2-mailingradian@gmail.com>

On Wed, Mar 04, 2026 at 02:58:05PM -0500, Richard Acayan wrote:
> From: Nickolay Goppen <setotau@mainlining.org>
> 
> Add compatibles for sdm660 based soundcards.
> 
> Signed-off-by: Nickolay Goppen <setotau@mainlining.org>

Incomplete DCO.

Best regards,
Krzysztof

