Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDE14331EBB;
	Tue, 11 Aug 2026 17:58:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786471096; cv=none; b=MqdZhy00JGeudK6yt6YVj2V5nq0EROf6Twqrw4R82BM9FY8ST9wzx272xPSVehR96nXNvr1kT0uwUMHoqVG3phvAxoPVl9+jWM+K7XW996+RoGqlAxTgPVJvExTd/bMIfUuAAphLyqHSGJ5W82NO2R+qjmsuLCuVDv72zQxenB4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786471096; c=relaxed/simple;
	bh=/Tm4OwaiGeOzW0IqQ4nXj7puCO7Zc5srpLpot2dGt/E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=S9jJUFp0z6RzeGpYqlFMDLSUmx+ZaOuAC+F/1hXcfacXFrirPd5puWhgn1dfaoy4Sheld4dGTkIey4FnLovmz1WQHzEiMVOQfhG47CrvUvPpnvGop0pkbD18C0ysTPeNXuZDqqcXU/dmuKvrJqf1rJF7TLd1cXVIUVUN5mU1NA8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Xm31Y58Q; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Xm31Y58Q"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 254B51F000E9;
	Tue, 11 Aug 2026 17:58:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786471095;
	bh=gcoPgdvOBNHq10EuvaC/N67fSr8UgjQ7nVXeYNiEVEE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Xm31Y58QecN39Xw6iCmbWkiIUBYRSVZCc9UCPVq0Nq3HjIxYzs1nUxl1YNo4IrEwb
	 WMY561OFOrewJWKtn5VasyxZSMiKFMvOue7loWcrTHtX/WBJCfxm/qXHwinoD4AdYy
	 pWMA/1jkQHT7DdMv7akAJSJ2xW6hEVLsZ+DuNiDuT84DTih6rmxCXT6FukMYst+rYQ
	 Kp/g1KNmtS1V372Q5OK+kYxT5bPoBro5AeM5/Txj4srYxHaCzdzvpdT68UDZqCduCr
	 aSq9Cg2m8R9ekXMPxa3fqE8JP6X6AhgnSBmOdCU/QVFUTQspPAS9wOA8yK8HjNA1FL
	 Vr7TtQQ4vSyiw==
Date: Tue, 11 Aug 2026 12:58:14 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Eduard Bostina <egbostina@gmail.com>
Cc: linux-sound@vger.kernel.org, simona.toaca@nxp.com,
	Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org,
	m-chawdhry@ti.com, Mark Brown <broonie@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>, daniel.baluta@nxp.com,
	linux-kernel@vger.kernel.org, Liam Girdwood <lgirdwood@gmail.com>,
	goledhruva@gmail.com
Subject: Re: [PATCH] dt-bindings: sound: Convert TI DA830 EVM audio to DT
 schema
Message-ID: <178647109367.2749219.4235268546509173023.robh@kernel.org>
References: <20260811091703.685487-1-egbostina@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260811091703.685487-1-egbostina@gmail.com>


On Tue, 11 Aug 2026 09:17:03 +0000, Eduard Bostina wrote:
> Convert the Texas Instruments DA830 EVM audio complex bindings
> to DT schema.
> 
> Signed-off-by: Eduard Bostina <egbostina@gmail.com>
> ---
>  .../bindings/sound/davinci-evm-audio.txt      | 49 -----------
>  .../bindings/sound/ti,da830-evm-audio.yaml    | 83 +++++++++++++++++++
>  2 files changed, 83 insertions(+), 49 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/sound/davinci-evm-audio.txt
>  create mode 100644 Documentation/devicetree/bindings/sound/ti,da830-evm-audio.yaml
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>

