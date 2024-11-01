Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 314CF1CB529;
	Fri,  1 Nov 2024 16:53:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730480014; cv=none; b=YqjfILw+I7EUnjo0Ms459hgBMQ/7pZTF/7EEd7x9jPLZyz7D/Azp0GSE6wBQi+4STfpEBGazDx76oGc416PDdcvCV5Gys2QcIjc9ZzWMfl3NPcZcs/KWwC0QYRB/Pgv0HbaD6/9lHb3O4vJrJH0AEabPv2rGuQIp9kNGu40T3Ew=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730480014; c=relaxed/simple;
	bh=V4CnOx5jrQQ1B6f1Prwd9LL0u7ecmxN1OzfHarF4C98=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sxkMBYuULjI/8IDAF4MYAeG2ke7Kn9IvgobhsvTd7/fW8g/SpIeFCldKvQFFues3ttD1G6hv4e164HTQS69WmHpgQOzNhoi1dpCVTkLEHi4OqIoMIF35YosVE8DdsXg0v3YJfCXO3HAOKH3guLkbU53N55kAOWaOSbGuAuzj1IU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ChZKUSMO; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ChZKUSMO"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 67629C4CECD;
	Fri,  1 Nov 2024 16:53:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730480013;
	bh=V4CnOx5jrQQ1B6f1Prwd9LL0u7ecmxN1OzfHarF4C98=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ChZKUSMO2OHCM8YhPyLcFJwzeGF6HboOWKoF0ioGIbGy8MAk+Hj/BENgreJG988AO
	 KB9L517AvVjvAyJTHGS35fyiUhVhV+3eIoe1/tFK/6rA30uBLJav8lfbK/o4JneGaK
	 vuQKgHFo49qtDjvwjbJGMgc0QAxdGkKTE/WoNM4dSk4fTjCYlAL9KYKQI9saysc+bL
	 dfwzcYVVb1jM1iORxBaxfbm73pTQmA8LSGNJIOdmCZO8Q10fdzooZ67B87TkYIuzx6
	 bb6MwsMl+XSvdjWDoB9QLhf6rloVulfH4SVq2sy/mlcug9Sv7pjPsP/c6v3BfwoYuI
	 FddSLS0ySi0mA==
Date: Fri, 1 Nov 2024 11:53:31 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Fabio Estevam <festevam@gmail.com>
Cc: krzk+dt@kernel.org, linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org, broonie@kernel.org,
	Fabio Estevam <festevam@denx.de>, shengjiu.wang@nxp.com,
	conor+dt@kernel.org
Subject: Re: [PATCH v2] ASoC: dt-bindings: fsl_spdif: Document imx6sl/sx
 compatible fallback
Message-ID: <173048001114.3616503.2323563679263505622.robh@kernel.org>
References: <20241028020749.36972-1-festevam@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241028020749.36972-1-festevam@gmail.com>


On Sun, 27 Oct 2024 23:07:49 -0300, Fabio Estevam wrote:
> From: Fabio Estevam <festevam@denx.de>
> 
> i.MX6SL and i.MX6SX SPDIF blocks are compatible with i.MX35.
> 
> Document 'fsl,imx35-spdif' as a fallback compatible for these two
> chip variants.
> 
> This fixes the following dt-schema warnings:
> 
> compatible: ['fsl,imx6sl-spdif', 'fsl,imx35-spdif'] is too long
> compatible: ['fsl,imx6sx-spdif', 'fsl,imx35-spdif'] is too long
> 
> Signed-off-by: Fabio Estevam <festevam@denx.de>
> ---
> Changes since v1:
> - Keep the entries as one enum. (Rob)
> 
>  .../devicetree/bindings/sound/fsl,spdif.yaml  | 27 ++++++++++++-------
>  1 file changed, 17 insertions(+), 10 deletions(-)
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>

