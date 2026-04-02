Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34F9B31F9A4;
	Thu,  2 Apr 2026 07:54:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775116479; cv=none; b=Yo1To5rZWQH/4GW7yDs3a1h72obDG/ouJl4syQockyreAb0ldXrUl5ltyXNtKLZgtiUnjMuRsFr2EMlH+5ZEubqXDJ320+potT/Xyx/QBcjffPxGI1zJgxHyhvIAQfUhNJ5tCrnW+taMsFEbPD6ci6q5HK7KoFpQYUQu/LgPJG4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775116479; c=relaxed/simple;
	bh=yXV6i0CL0I215a59ZFoO7hKU8QSfjUiamRtwBT/qvfg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=vEkgxSV/TsR1JA4qhp2toGOtgXxnYZATdRyxSvJM5HiVEIa9GVvo1qLz8Z37nsXpK5TS4K7eoiogW3te0w+ewETAmlorcDzLzmYEXPE3HxTLrSpkeviMXYtFn/D/Q7j9bHUnKQ93vzkGhtfrk7SHeNWXqhtOebS5TAvyhsDPh8Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QMKPOnr+; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QMKPOnr+"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 476F0C19423;
	Thu,  2 Apr 2026 07:54:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775116478;
	bh=yXV6i0CL0I215a59ZFoO7hKU8QSfjUiamRtwBT/qvfg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=QMKPOnr+WHZsKX8oPneDuTUwD/dldExVM8H3Fyi/bHiYpvAyetfxWRu+NxbNB3TcO
	 0P+dwGMU/F5bP0GN8mBTWU3HyKK2AIKh275Evv02sZ0Mzlm/fLdYmbPdQYgSDe1tAY
	 N9pa6gIg7swDkp7myGrff2vN/24hyPs3qgILdJpRA4VLanLjdr7sonklY+N2Tzpgxq
	 C8NlYHwCzDt18KUsnR/+WK1I8xHU1plAlLO6dhcE7azQmJ4sXOkKkZkZkwecnL+3wa
	 o5/oT9GIF/q6hAS4PVshYGsOD6PHsHDiB4gmh+c1psXCSZStjX7oqSrIG9y1NEYHA7
	 fwjlDwxnAW5pg==
Date: Thu, 2 Apr 2026 09:54:36 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Sen Wang <sen@ti.com>
Cc: linux-sound@vger.kernel.org, broonie@kernel.org, lgirdwood@gmail.com, 
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	devicetree@vger.kernel.org, perex@perex.cz, tiwai@suse.com, shenghao-ding@ti.com, 
	kevin-lu@ti.com, baojun.xu@ti.com, niranjan.hy@ti.com, l-badrinarayanan@ti.com, 
	devarsht@ti.com, v-singh1@ti.com, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/4] ASoC: codecs: Add TAS675x quad-channel audio
 amplifier driver
Message-ID: <20260402-righteous-gifted-kestrel-0ae70e@quoll>
References: <message-id-of-your-RFC-cover-letter>
 <20260401223239.1638881-1-sen@ti.com>
 <20260401223239.1638881-3-sen@ti.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260401223239.1638881-3-sen@ti.com>

On Wed, Apr 01, 2026 at 05:28:43PM -0500, Sen Wang wrote:
> +
> +static const struct dev_pm_ops tas675x_pm_ops = {
> +	SYSTEM_SLEEP_PM_OPS(tas675x_system_suspend, tas675x_system_resume)
> +	RUNTIME_PM_OPS(tas675x_runtime_suspend, tas675x_runtime_resume, NULL)
> +};
> +
> +static const struct of_device_id tas675x_of_match[] = {
> +	{ .compatible = "ti,tas6754",  .data = (void *)TAS6754 },
> +	{ .compatible = "ti,tas67524", .data = (void *)TAS6754 },

I did not look detailed, but this ^^^

> +	{ }
> +};
> +MODULE_DEVICE_TABLE(of, tas675x_of_match);
> +
> +static const struct i2c_device_id tas675x_i2c_id[] = {
> +	{ "tas6754",  TAS6754 },
> +	{ "tas67524", TAS6754 },

... and this ^^^ clearly states devices are compatible, unlike your
binding is stating

> +	{ }

Best regards,
Krzysztof

