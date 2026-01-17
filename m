Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1589830E0F3;
	Sat, 17 Jan 2026 11:39:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768649961; cv=none; b=FhxguCWQlwgljrbkSBog4kXP7M0ay00PB5jOXc6Li0sEVs/IyZX6WfnN1VecKrG2eJIJeCkuENWPpbeq+nXoHvgLHNka6jlM4nnGbdmaRG8c13PMQHDlilGfRBtMoAfklRxzrQGt93aEETPKZ3IY1TLWN1J7H1Bm8DGQzmwh+BI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768649961; c=relaxed/simple;
	bh=HxngOV78ddxxS+00WSbR1QEVp3Lc0xr806x171VNQxw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MSmNvw3IOQZJEP+wbQWuqCOnXAZxB2UipkD2yh5M83r/6TYyAmg+eSmn61PB6cllZaEQgxxQUyuaIrgeHgYBbgsxTmea7xbQHeeGdIn0tKmFmAheTHBSQRNIX4EBQ9tQ9dE3dbHZEwLwxTVeCsLyXrRKuYIBgQdd84a10Cy0cqg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=oJ8HAX/Y; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="oJ8HAX/Y"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1BC81C4CEF7;
	Sat, 17 Jan 2026 11:39:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768649960;
	bh=HxngOV78ddxxS+00WSbR1QEVp3Lc0xr806x171VNQxw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=oJ8HAX/YpNzNTwAtFM3OH/HM47H9ljIlYTcwhUap2KmrIUI2+U2GWOl0cXALo5vTd
	 w6lJ3/DbWdEVDxxvi2TnJzL4eu9Vj5yeiTjDWF3pbEq2aFG2YraUZY16u6+6+3OJo2
	 JC3YK4U4e1M0s4aWVHXhFQ90tgSUFi1lB+tQgk43490I/7y7LxrqO44Cq7lV1QVTwx
	 CMDenP+bK9205CUUmAs7NEd1075a1Dl+/y9FfILPaBc6Nu0HEiPuD818K4bd7P4Tar
	 Qdl/6GLsJlrBMiVnWV7eErYqAc5KPazbmocd64Yr6yHhXp++YDVI0ILJF+4T5LpKiV
	 wUfYB+3pd9a6w==
Date: Sat, 17 Jan 2026 12:39:18 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Maciej Strozek <mstrozek@opensource.cirrus.com>
Cc: Mark Brown <broonie@kernel.org>, Takashi Iwai <tiwai@suse.com>, 
	Lee Jones <lee@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Jaroslav Kysela <perex@perex.cz>, Bard Liao <yung-chuan.liao@linux.intel.com>, 
	Peter Ujfalusi <peter.ujfalusi@linux.intel.com>, linux-kernel@vger.kernel.org, linux-sound@vger.kernel.org, 
	patches@opensource.cirrus.com, devicetree@vger.kernel.org
Subject: Re: [PATCH v2 2/4] ASoC: dt-bindings: cirrus,cs42l43: Add CS42L43B
 variant
Message-ID: <20260117-infrared-partridge-of-improvement-dd292c@quoll>
References: <20260116152054.85990-1-mstrozek@opensource.cirrus.com>
 <20260116152054.85990-3-mstrozek@opensource.cirrus.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260116152054.85990-3-mstrozek@opensource.cirrus.com>

On Fri, Jan 16, 2026 at 03:20:41PM +0000, Maciej Strozek wrote:
> CS42L43B variant adds dedicated PDM interface, SoundWire Clock Gearing
> support and more decimators to ISRCs.
> 
> Signed-off-by: Maciej Strozek <mstrozek@opensource.cirrus.com>
> ---
>  Documentation/devicetree/bindings/sound/cirrus,cs42l43.yaml | 3 +++
>  1 file changed, 3 insertions(+)

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof

