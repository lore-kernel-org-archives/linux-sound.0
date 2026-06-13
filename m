Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05D431E9906;
	Sat, 13 Jun 2026 18:15:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781374559; cv=none; b=nrz7SDe6xS+YkVdMS+xmaPFpt/UHVvizk0Al+HL6JGyVQF74fIGYHEkjxNGjQ6GWLQTSnPQtBrlRBPLuoPyrv96yc4nri0PkVdDMZaXRn2d4g2xoRd3q9vWquvZIvqzXa28V2o42JVl8gmZZMWiffslyQ8K7wEasGmJCzbXTZqo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781374559; c=relaxed/simple;
	bh=+7OjaP4SWdnp721MUCLg0CMeGC0SD9xLt4aCa/xTSiY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jPDaTlP8nfV6TqMipD0WuqlTLmJDZTUbazOVbqz6y2+BaIeRXLBqpQmDHQPC0ztdVvVFtYu/bWJ9IVWCjRvDffgrzf3xO08E9iNWVUc+hKHxgz+aGzr775uYZj15KhoI2zpzDvlp3NoVnJcAt6g9sj5eI4fdQxpdTO1HQDq/8lY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LsOYQ20q; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LsOYQ20q"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C2F011F000E9;
	Sat, 13 Jun 2026 18:15:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781374557;
	bh=So4K0Rr1X/6YKAAgjkwiNjXqZDXapqmVOzkvSi/LWh0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=LsOYQ20qPAKDXZ8q9IHK0cWm8IXvlzVDbiXdDPSILMwlgqHPXRxw0J36xSPAyJITS
	 89dSPqVdP99baGcTWJK2tkY/mRrsy1WtKbd8+dPerKIWCvwy7LlZyy/0yOoXflE7BD
	 TlL6Q10NjjKAAW6tHdPP/g0x091WBxRMU+076XFDoKlUFGeqTm7mKgE37Dc8FG7EBm
	 ynkY7oD13UKLyZ/nCVz/nayfCLU4m3y0/MOXflUXmXzw/kZp8a2/HXURC+FH37XESh
	 7mJksxPBRiIS0/dCJKat/J4lhIcHGuDW5QuHgynLsrECgi3akXthe43zfKn0DAlVIf
	 Wc+3z8g2OyFdQ==
Date: Sat, 13 Jun 2026 23:45:53 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Charles Keepax <ckeepax@opensource.cirrus.com>
Cc: pierre-louis.bossart@linux.dev, yung-chuan.liao@linux.intel.com,
	julian.haarmann@student.kit.edu, linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org, patches@opensource.cirrus.com
Subject: Re: [PATCH] soundwire: dmi-quirks: Disable ghost device on Lenovo
 Yoga 9i
Message-ID: <ai2eWeTlhFtNWpr9@vaman>
References: <20260608160203.151943-1-ckeepax@opensource.cirrus.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260608160203.151943-1-ckeepax@opensource.cirrus.com>

On 08-06-26, 17:02, Charles Keepax wrote:
> There is also a "non-pro" version of the Lenovo Yoga 9i (83SE) which
> also needs a quirk to disable a non-existent Realtek device. Add this
> missing quirk.
> 
> Co-developed-by: Julian Haarmann <julian.haarmann@student.kit.edu>

Need sob by Julian.

 - Co-developed-by: states that the patch was co-created by several developers;
   it is a used to give attribution to co-authors (in addition to the author
   attributed by the From: tag) when multiple people work on a single patch.
   Every Co-developed-by: must be immediately followed by a Signed-off-by: of
   the associated co-author.


> Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
> ---
>  drivers/soundwire/dmi-quirks.c | 7 +++++++
>  1 file changed, 7 insertions(+)
> 
> diff --git a/drivers/soundwire/dmi-quirks.c b/drivers/soundwire/dmi-quirks.c
> index 32a46a2d90f7c..c7e50873c8739 100644
> --- a/drivers/soundwire/dmi-quirks.c
> +++ b/drivers/soundwire/dmi-quirks.c
> @@ -192,6 +192,13 @@ static const struct dmi_system_id adr_remap_quirk_table[] = {
>  		},
>  		.driver_data = (void *)ghost_realtek,
>  	},
> +	{
> +		.matches = {
> +			DMI_MATCH(DMI_SYS_VENDOR, "LENOVO"),
> +			DMI_MATCH(DMI_PRODUCT_NAME, "83SE"),
> +		},
> +		.driver_data = (void *)ghost_realtek,
> +	},
>  	{
>  		.matches = {
>  			DMI_MATCH(DMI_SYS_VENDOR, "LENOVO"),
> -- 
> 2.47.3

-- 
~Vinod
