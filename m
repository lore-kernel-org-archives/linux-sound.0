Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B35DE355034;
	Thu, 22 Jan 2026 11:59:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769083180; cv=none; b=M6xukjQd1gSSccaFz+D5vwsqhjLusSipAuVvxZ5McFCoy85Houkq6HKYkYTUjJDVmyn2CLRIb34F/ZS/tYOoBWk8hXKtr9r9jwF0Zig+hVwh2UloYL2QYGHB6nzwHOlyg17w34T7IX57wQ36yfYPmqZIpgO72sjo4kfumSTCAeY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769083180; c=relaxed/simple;
	bh=EQgdWx197QI/6fLxXkoUQ+2mrAD+7KX9H5dmawNEuVA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RnnAuTU+KQlS4eB1JyIyQaYoOgf4sEGOR4mShXiS+XsKoh8PheKxgDI749WWA4Inql6eOKjlLLz+EUNC5tSoSCKE1BNLmA5IOOWRPrcjRu4z8hJfdE9I9WtQruxQtud4snF8/Ywu5a/z4gDbaaGiRbwTKo+gs7QrhzMP0Ys7wD8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=sp+V5uqW; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="sp+V5uqW"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A757EC116C6;
	Thu, 22 Jan 2026 11:59:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769083180;
	bh=EQgdWx197QI/6fLxXkoUQ+2mrAD+7KX9H5dmawNEuVA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=sp+V5uqWJQa4lvzb2q6qHas4QhiZm3gYQa+UhnIDR654PT2XIEUMc1oPIUHbaIzzY
	 vJWZN/5Oiuaj3UzhxanPu9+uLF+ylO7jv9IaVvJ1/YvV4ZvkBOaToDW3ySN7SmLR7g
	 Oe0Vb4hCoPj+RdjCdFpSJdg/Aif7Q6lL0JxIbvVhVic3gHVfxrIwN5M4XwakEvwfjo
	 7yjKGij6c+VKCVOJHE/ZpvP9Q2IIZVEXJjBsFsJctMXbtworG6h2JquRnq1peM/xta
	 KJff4Z6NsMMN1PTnex9tT7C53JkxrlireDFKySF8gAFP0S0/ZQNlgzEIYQROhehYqK
	 ui8Apgu8Ub23w==
Date: Thu, 22 Jan 2026 11:59:34 +0000
From: Lee Jones <lee@kernel.org>
To: Maciej Strozek <mstrozek@opensource.cirrus.com>
Cc: Mark Brown <broonie@kernel.org>, Takashi Iwai <tiwai@suse.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
	linux-kernel@vger.kernel.org, linux-sound@vger.kernel.org,
	patches@opensource.cirrus.com, devicetree@vger.kernel.org
Subject: Re: [PATCH v2 3/4] mfd: cs42l43: Add support for the B variant
Message-ID: <20260122115934.GG3831112@google.com>
References: <20260116152054.85990-1-mstrozek@opensource.cirrus.com>
 <20260116152054.85990-4-mstrozek@opensource.cirrus.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260116152054.85990-4-mstrozek@opensource.cirrus.com>

On Fri, 16 Jan 2026, Maciej Strozek wrote:

> Introducing CS42L43B codec, a variant of CS42L43 which can be driven by
> the same driver.
> 
> Changes in CS42L43 driver specific for CS42L43B:
> - Decimator 1 and 2 are dedicated to ADC, can't be selected for PDM
> - Decimators 3 and 4 are connected to PDM1
> - Added Decimator 5 and 6 for PDM2
> - Supports SoundWire Clock Gearing
> - Updated ROM requiring no patching
> - Reduced RAM space
> - Each ISRC has 4 decimators now
> 
> Signed-off-by: Maciej Strozek <mstrozek@opensource.cirrus.com>
> ---
> Changes in v2:
>  - Rework the mechanism to identify the new variant along with some
>    error handling improvements.
>  - Added some comments in cs42l43_readable_register() for clarity.
>  - Add handling of the I2C path for the B variant
> ---
>  drivers/mfd/cs42l43-i2c.c        |  7 ++-
>  drivers/mfd/cs42l43-sdw.c        |  4 +-
>  drivers/mfd/cs42l43.c            | 93 +++++++++++++++++++++++++++-----
>  drivers/mfd/cs42l43.h            |  2 +-
>  include/linux/mfd/cs42l43-regs.h | 76 ++++++++++++++++++++++++++
>  include/linux/mfd/cs42l43.h      |  1 +
>  6 files changed, 166 insertions(+), 17 deletions(-)
> 
> diff --git a/drivers/mfd/cs42l43-i2c.c b/drivers/mfd/cs42l43-i2c.c
> index a2ab001a600a..0a0ab5e549a5 100644
> --- a/drivers/mfd/cs42l43-i2c.c
> +++ b/drivers/mfd/cs42l43-i2c.c
> @@ -47,6 +47,7 @@ static int cs42l43_i2c_probe(struct i2c_client *i2c)
>  	cs42l43->irq = i2c->irq;
>  	/* A device on an I2C is always attached by definition. */
>  	cs42l43->attached = true;
> +	cs42l43->variant_id = (long)device_get_match_data(cs42l43->dev);

[...]

> diff --git a/include/linux/mfd/cs42l43.h b/include/linux/mfd/cs42l43.h
> index 2239d8585e78..8313f9e8c722 100644
> --- a/include/linux/mfd/cs42l43.h
> +++ b/include/linux/mfd/cs42l43.h
> @@ -98,6 +98,7 @@ struct cs42l43 {
>  	bool sdw_pll_active;
>  	bool attached;
>  	bool hw_lock;
> +	int variant_id;
>  };

long != int

-- 
Lee Jones [李琼斯]
