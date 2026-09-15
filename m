Received: from mail-wr2-f12.google.com (mail-wr2-f12.google.com [74.125.225.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D99453B1022
	for <linux-sound@vger.kernel.org>; Tue, 15 Sep 2026 14:16:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789481771; cv=none; b=nrOM938+xi3XREpJlNunRSsGXwiTbPK0zx0hm4C5sow3I05ylRTi9dp3CZg8vJb7iuBroZVPwF4ZhAU8OAFfqTxuWa/FpHyG282OjmZdu7Dbh51aqt2QVX1zedgepQuQUtyLup/scWr5HrOyVzjuSXGFxmLJfxAV2MqM22g+wWM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789481771; c=relaxed/simple;
	bh=cQUpihWQioTqstYxEXwVnyTIzezJVnL2wsOroTfdHY4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Kc44+arqHJi3ATT5S1myA4fvcmm+vpTqp368Mi1bBMgLNxGOzZBmXkIiqklp1v12cf57Hr+rSpsK927tbtAdHa+8ZbMUyfOPpJn3OKRRvad1k5VDwxEgb8V5rl9g4pmBm6QtNu2FrhqrtnXm0nngbUoZcXp09dxniEwm/hHgQvk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JIMg5q6p; arc=none smtp.client-ip=74.125.225.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JIMg5q6p"
Received: by mail-wr2-f12.google.com with SMTP id ffacd0b85a97d-482f63546c5so274955f8f.2
        for <linux-sound@vger.kernel.org>; Tue, 15 Sep 2026 07:16:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789481768; x=1790086568; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=c6nXn9QszvDuxbC4bOSKyL0/hzlZ75yA+JSfjiylQcQ=;
        b=JIMg5q6prxl7f9V8AmVU//Et9nhxOQ/KsomRNTlxLGqdaZyTZxw4U6VBTHvk4XH0BV
         R8nXfRqvjgLdxEzyN3LXb+Bgxtsqi0bdCuemI3yK39pIE+5EqkpgW0paKoTPGp0g78oU
         4jZuSfO4WJ+DcCgzVd0kKKivYLKuU9t+lCH/xnNZUZ9cEroFW5kPYQX3dK0SVYnMJ5uw
         m+tJI9dSJNhegNiFD3vuIFrMzaSSo+Lr5zlZR2Rdqgg/WAAo9ee0jYbKmfApi/n5vQPR
         nmpIivN4crg1eD9EhUKBJWMso28EdLEonRNFJDzpr9fPeu+oW+b2pVnv2IBLiYE3Ghba
         sXCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789481768; x=1790086568;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=c6nXn9QszvDuxbC4bOSKyL0/hzlZ75yA+JSfjiylQcQ=;
        b=lVCxV2Hx6HYdm/H/eLwOlhIXCd+6PWBGg6Q/Uy1nbhEFzKzq/9mCFuerPjuPiZIH84
         gvNqMLdlm6S5jTU7JeJnJuw6crQ90IuDxGUx0oYUFnh1H36mwWMPLfCshG0V0qgDfM/e
         XUqmFTyYgjGqGZck1vDe2BWTkGXQmsXsZPHF329fV3l4z0TIuG6EW3D2hRt0GletM4kW
         8g2xtN9xTSANmxExzGAljzw+Xc7NUuho9sWjhsXWnbUGi/egCeaxif92yACvPDXoASM3
         8j/e7F4cdb+AuyzEdWGfjOUR9EnTPoy8lxuaj68R0OFZ70thqe93CMRTgQA2gYOhSS3Z
         80XA==
X-Forwarded-Encrypted: i=1; AKwUvBzbCO8H3zwglKePeva7GMKMlG6n3Z5+QTPtUIbA0riQbH/prN+W7iLxXQKakgltbM6KTHcDfj4MCslFeg==@vger.kernel.org
X-Gm-Message-State: AFuF++l6+jkdWox6wTTvOG6+2AbfkJdY5p0MZ5PtrI/LO8gdUsOIQynx
	5VzuU3b19vwbzBwKUEAblNTCOznOn3X7a2QMxEHI9NSWyOyVIgHS/O+n
X-Gm-Gg: AYBFou2zixXuqymXKAA2AqT+yigmBKpzFEgpCxIU6/qfZkUQ5HVgTFmrD97oMS1vK1Q
	jqVFX6R7bOTytUkbrq9kByrI5clMQP9ecg/dB0yaNcxUtuvwQ/BNt+zcVMSsUR/A8VNHk/9B+3U
	f0HmW9lh3NUKUXZT8LuQ+Dl3TqTjXS2zmO1IlNnxxwUG1BnnGjSA2NzgQ/KQ0GbSDpj5bjPj8fY
	arWprgLkOKyjjLYxz2wMq1eWLFzXcXy2NYdKilDIv+l1+ZKaNJzCuDksKjD0JqnXmOwBt3iq1OA
	2yQ8ETgUdrvBTInj9a6ckDZUdyMhAwf25zxVcdBvOWIbwcSWkbkmFE2t2XjyAGNQUSGKQ/giwj7
	rf/hMDlL8VFQeUSzeQR2VK7L4L9vlhaWOfXBIyQ3aKuugEo6fkao5nOB9bHAtRnYSvdaECOMs5n
	0Gn6166uzs4UwwjkKcEZTBS8pwBAk1qbeWU3Trdm+NDUK1AN2sxAT0Q5lgB5kVKV9ArZCrvVGWp
	WSYKBdgideA/aEp3V16lx0s
X-Received: by 2002:a05:6000:188b:b0:487:73c:3f9 with SMTP id ffacd0b85a97d-4870a99c862mr1258242f8f.22.1789481767808;
        Tue, 15 Sep 2026 07:16:07 -0700 (PDT)
Received: from egonzo (82-64-73-52.subs.proxad.net. [82.64.73.52])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-486eb357288sm35209776f8f.29.2026.09.15.07.16.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Sep 2026 07:16:07 -0700 (PDT)
Date: Tue, 15 Sep 2026 16:16:05 +0200
From: Dave Penkler <dpenkler@gmail.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Frank Li <Frank.Li@nxp.com>, Mark Brown <broonie@kernel.org>,
	Shengjiu Wang <shengjiu.wang@nxp.com>,
	bui duc phuc <phucduc.bui@gmail.com>,
	Tianchu Chen <flynnnchen@tencent.com>, linux-kernel@vger.kernel.org,
	dmaengine@vger.kernel.org, linux-sound@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>,
	Shengjiu Wang <shengjiu.wang@gmail.com>,
	Xiubo Li <Xiubo.Lee@gmail.com>, Fabio Estevam <festevam@gmail.com>,
	Nicolin Chen <nicoleotsuka@gmail.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	Daniel Mack <daniel@zonque.org>,
	Haojian Zhuang <haojian.zhuang@gmail.com>,
	Robert Jarzmik <robert.jarzmik@free.fr>,
	Lars-Peter Clausen <lars@metafoo.de>,
	Orson Zhai <orsonzhai@gmail.com>,
	Baolin Wang <baolin.wang@linux.alibaba.com>,
	Chunyan Zhang <zhang.lyra@gmail.com>,
	Olivier Moysan <olivier.moysan@foss.st.com>,
	Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>
Subject: Re: [PATCH v1 6/7] gpib: fmh_gpib: Replace
 dma_request_slave_channel() by dma_request_chan()
Message-ID: <aqlTJcVHi5CXTyjy@egonzo>
References: <20260915100931.3593242-1-andriy.shevchenko@linux.intel.com>
 <20260915100931.3593242-7-andriy.shevchenko@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260915100931.3593242-7-andriy.shevchenko@linux.intel.com>

On Tue, Sep 15, 2026 at 12:04:27PM +0200, Andy Shevchenko wrote:
> Replace dma_request_slave_channel() by dma_request_chan() as suggested
> since the former is deprecated.
> 
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> ---
>  drivers/gpib/fmh_gpib/fmh_gpib.c | 7 ++++---
>  1 file changed, 4 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpib/fmh_gpib/fmh_gpib.c b/drivers/gpib/fmh_gpib/fmh_gpib.c
> index 5e10e9353fed..3fdcc673ec8b 100644
> --- a/drivers/gpib/fmh_gpib/fmh_gpib.c
> +++ b/drivers/gpib/fmh_gpib/fmh_gpib.c
> @@ -1458,10 +1458,11 @@ static int fmh_gpib_attach_impl(struct gpib_board *board, const struct gpib_boar
>  	e_priv->irq = irq;
>  
>  	if (acquire_dma) {
> -		e_priv->dma_channel = dma_request_slave_channel(board->dev, "rxtx");
> -		if (!e_priv->dma_channel) {
> +		e_priv->dma_channel = dma_request_chan(board->dev, "rxtx");
> +		retval = PTR_ERR_OR_ZERO(e_priv->dma_channel);
> +		if (retval) {
>  			dev_err(board->dev, "failed to acquire dma channel \"rxtx\".\n");
> -			return -EIO;
> +			return retval;
>  		}
>  	}

Reviewed-by: Dave Penkler <dpenkler@gmail.com>
