Received: from bout3.ijzerbout.nl (bout3.ijzerbout.nl [136.144.140.114])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B4DFE1C2DB7
	for <linux-sound@vger.kernel.org>; Tue,  1 Oct 2024 18:55:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=136.144.140.114
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727808946; cv=none; b=Qd5HBUvQypHTW1FQijn8xJFwl5nXtGNOxszQWVDRdUBMjemBXdEdJv1oEFyqWFgKO/WBq0KYpGYxoV1wNJPcmQ6rggu1pTasdUG2SFlXA0rAXLqL6VxK1pKyye6YHtr+wT90LyjiKQQKhQlSLx1vGpalYLPHXY2vl775bztu+5k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727808946; c=relaxed/simple;
	bh=vgpNV0LJq/20YqnUxlMDjN2uxMH5I+Q7zuzDOEDA904=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=tsW1UcSt8wFpW1mDKOIlf+SFSxokvrcP2LH84m+xFIE+x5YWOQ2XRgVjDdK2nCz3SOC+jXFOFcUx+hfGH+jBWLN86Fm1rVchQoOXTYWUt94ysOInyuzxAMMIfWm/iaaOldhPuaTiDvrOc49L5Uqb6ihKVx3Vf0EyIwqoKMRx2Mw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ijzerbout.nl; spf=pass smtp.mailfrom=ijzerbout.nl; dkim=pass (4096-bit key) header.d=ijzerbout.nl header.i=@ijzerbout.nl header.b=VzEXnYez; arc=none smtp.client-ip=136.144.140.114
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ijzerbout.nl
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ijzerbout.nl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=ijzerbout.nl header.i=@ijzerbout.nl header.b="VzEXnYez"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ijzerbout.nl; s=key;
	t=1727808941; bh=vgpNV0LJq/20YqnUxlMDjN2uxMH5I+Q7zuzDOEDA904=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=VzEXnYezY0OqpdNnffWbYouGAIkMYOZSguIi1At6cMQx9mAL/BRrMjBHlMArYxXvW
	 eSvloUvC9Q00ur4wJygJkAIRj3uZUHatdAyQn0wU6g09Bg7NmOPcxqjnGBRmD0cGQ6
	 0dAYGE+/gq7YxZ/ZMSqzn/X2FY83AfHsqCkEdOdUSXRgFq0h/rQ4xwuerXxgAvth9E
	 cXwKQLAI2UGGZQtH47c3Cp65bszfGZMPJWKmsOAowjqeeR7I9A028KR3tx/vHVI5Sa
	 X1ChG6tu4YIqy/ZEqa86bT9/soYVmj35gs91hFequDqeG2wK/YohzsouL8rOdRCVvW
	 ip3V1+m0dTs6QYikT1C/XUZzeegXo+g0sj5HzH941phVfdm4X5YEByv4MTG5DSfrZZ
	 T4BMqW3KIF1DwNXiSCcA92EmpXFGzy/1rs4w//XkXB6nDO/vqF3VKhtOin5EmSGjnI
	 1EInrj5tXra9mTnyttAM4wuNUlNWjQZWleAZAmWCUjNzRFN+IyQEall/l9eR2UEPzC
	 ENRa9jhRJPd7xsTWSoZzn9wHrKOHDIwLtGm5J/t50PD4RbAUyXg1B7o68kl2VTgP6r
	 xIAN92UDJTLefeZVT6tb39G7uYNTWSoQFPN9hGVbFpku8/0L6fQ99tmZVER/15dbrk
	 u4Zxemdn2480UsTuMx6WI09k=
Received: from [IPV6:2a10:3781:99:1:1ac0:4dff:fea7:ec3a] (racer.ijzerbout.nl [IPv6:2a10:3781:99:1:1ac0:4dff:fea7:ec3a])
	by bout3.ijzerbout.nl (Postfix) with ESMTPSA id 1497C18D592;
	Tue,  1 Oct 2024 20:55:40 +0200 (CEST)
Message-ID: <216bad53-84e1-4dc8-a88e-11f0d0ddfa41@ijzerbout.nl>
Date: Tue, 1 Oct 2024 20:55:38 +0200
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] ASoC: rt1320: reads patch code from firmware file
To: shumingf@realtek.com, broonie@kernel.org, lgirdwood@gmail.com
Cc: linux-sound@vger.kernel.org, lars@metafoo.de, flove@realtek.com,
 oder_chiou@realtek.com, jack.yu@realtek.com, derek.fang@realtek.com,
 oliva@gnu.org
References: <20240914090521.2224276-1-shumingf@realtek.com>
Content-Language: en-US
From: Kees Bakker <kees@ijzerbout.nl>
In-Reply-To: <20240914090521.2224276-1-shumingf@realtek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Op 14-09-2024 om 11:05 schreef shumingf@realtek.com:
> From: Shuming Fan <shumingf@realtek.com>
>
> This patch removes many lines of the patch code and
> reads the patch code from firmware files.
>
> Signed-off-by: Shuming Fan <shumingf@realtek.com>
[...]
> +static void rt1320_load_mcu_patch(struct rt1320_sdw_priv *rt1320)
> +{
> +	struct sdw_slave *slave = rt1320->sdw_slave;
> +	const struct firmware *patch;
> +	const char *filename;
> +	unsigned int addr, val;
> +	const unsigned char *ptr;
> +	int ret, i;
> +
> +	if (rt1320->version_id <= RT1320_VB)
> +		filename = RT1320_VAB_MCU_PATCH;
> +	else
> +		filename = RT1320_VC_MCU_PATCH;
> +
> +	/* load the patch code here */
> +	ret = request_firmware(&patch, filename, &slave->dev);
> +	if (ret) {
> +		dev_err(&slave->dev, "%s: Failed to load %s firmware", __func__, filename);
> +		regmap_write(rt1320->regmap, 0xc598, 0x00);
> +		regmap_write(rt1320->regmap, 0x10007000, 0x67);
> +		regmap_write(rt1320->regmap, 0x10007001, 0x80);
> +		regmap_write(rt1320->regmap, 0x10007002, 0x00);
> +		regmap_write(rt1320->regmap, 0x10007003, 0x00);
> +	} else {
> +		ptr = (const unsigned char *)patch->data;
> +		if ((patch->size % 8) == 0) {
> +			for (i = 0; i < patch->size; i += 8) {
> +				addr = (ptr[i] & 0xff) | (ptr[i + 1] & 0xff) << 8 |
> +					(ptr[i + 2] & 0xff) << 16 | (ptr[i + 3] & 0xff) << 24;
> +				val = (ptr[i + 4] & 0xff) | (ptr[i + 5] & 0xff) << 8 |
> +					(ptr[i + 6] & 0xff) << 16 | (ptr[i + 7] & 0xff) << 24;
> +
> +				if (addr > 0x10007ffff || addr < 0x10007000) {
Oops 0x10007ffff must be 0x10007fff
> +					dev_err(&slave->dev, "%s: the address 0x%x is wrong", __func__, addr);
> +					goto _exit_;
> +				}
> +				if (val > 0xff) {
> +					dev_err(&slave->dev, "%s: the value 0x%x is wrong", __func__, val);
> +					goto _exit_;
> +				}
> +				regmap_write(rt1320->regmap, addr, val);
> +			}
> +		}
> +_exit_:
> +		release_firmware(patch);
> +	}
> +}
>
