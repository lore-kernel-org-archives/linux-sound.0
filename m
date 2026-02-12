Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 806C82F1FD2;
	Thu, 12 Feb 2026 11:20:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770895209; cv=none; b=XGc7QKtwsCD8vLQy1zqomZQqrE5Egk/5VlUOtR8xOwhqI979wOLXyiq7w70vNwt9WkRgU0V0kpWTvgtlt5i1o8yQ4kh0PbUUShbA0qcjnNQF7aot0hhALx2eyfzoLVfBXkSK3BcXKrezPwhAYFlVl+bUgBMhwZC+1JRwvDfQCy8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770895209; c=relaxed/simple;
	bh=8ZsmmEv1jnjikI2QQRW09RVhJdSJUUx43DcYOBqVLCs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=H0hWZQ47mTLcrhqKujVr6U8nHwOvHRMSp2kNgRKmJQUWQFS2dBOOZhg9SGWi26oZTdahljKZV5/gZtjajbZBionWpl6CSlMcvqerJZhkOHUAoPusAHKH5OKFXpZfllFHYnuUpclEDaBj6E7RSxqCuUsoNvfxu4hCIoDrQGlT+E8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nPx1QTTr; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nPx1QTTr"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7F5B2C4CEF7;
	Thu, 12 Feb 2026 11:20:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770895209;
	bh=8ZsmmEv1jnjikI2QQRW09RVhJdSJUUx43DcYOBqVLCs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=nPx1QTTrjtyVo3j+vE5JKAgIjPfvhpfsbnn92ZckFi3uOBMkJU8HlaULSt1aYjKf6
	 iiEQQrnZTYSY38Mzz/vL2YPQsYKdkefEcVnLvdyXhW4l0Dm0qU3CyxhD/8QhLEFx+V
	 YnYcG3NnVCiUpf0Ohfii3b9bfcqE5c7yVt3VioMFh5Y18yqRhnDhX8ScKE2TwtJs9b
	 IlFg7TLgNFcrqRw54fhKvr9x1ayMLbxo473bnPbvDj7JJVydvi2ahzzBXrKzFwhP1Q
	 4dy9QOw5VYTFyQY8CNghP7osCp5QgLpAu+SXIMHz7xhFCoSOsfcDMH7nDuXa0n+48a
	 GY+Lmtouop3bw==
Date: Thu, 12 Feb 2026 12:20:06 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Shengjiu Wang <shengjiu.wang@nxp.com>
Cc: lgirdwood@gmail.com, broonie@kernel.org, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, linux-sound@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, perex@perex.cz, tiwai@suse.com, 
	ckeepax@opensource.cirrus.com, andriy.shevchenko@linux.intel.com, nichen@iscas.ac.cn, 
	kuninori.morimoto.gx@renesas.com
Subject: Re: [PATCH v2 2/3] ASoC: dt-bindings: asahi-kasei,ak4458: Fix the
 supply names
Message-ID: <20260212-resourceful-lyrical-cassowary-6f8bde@quoll>
References: <20260212021829.3244736-1-shengjiu.wang@nxp.com>
 <20260212021829.3244736-3-shengjiu.wang@nxp.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260212021829.3244736-3-shengjiu.wang@nxp.com>

On Thu, Feb 12, 2026 at 10:18:28AM +0800, Shengjiu Wang wrote:
> In the original txt format binding document ak4458.txt, the supply names
> are 'AVDD-supply', 'DVDD-supply', and they are also used in driver. But in
> the commit converting to yaml format, they are changed to 'avdd-supply',
> 'dvdd-supply'. After search all the dts file, these names 'AVDD-supply',
> 'DVDD-supply', 'avdd-supply', 'dvdd-supply' are not used in any dts
> file. So it is safe to fix this yaml binding document.
> 
> Fixes: 009e83b591dd ("ASoC: dt-bindings: ak4458: Convert to dtschema")
> Cc: stable@vger.kernel.org
> Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof

