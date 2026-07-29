Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8760127D786
	for <linux-sound@vger.kernel.org>; Wed, 29 Jul 2026 01:33:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785288804; cv=none; b=UeYOkRJuyuBlbY90AKRowXNPfGZWLiJbbZs5fBfIIAhwA7NoUzObdCm4csw3BCzQhVGXcdD1wlFKUmUkXGYEhu9i+gqPNP/Jk70qToTkUB13NnniScQvQ0SOvSZwtdFrVI/YrYeuv8V0R7bKGEZP9OdWFg5NI7+NybeZSAFYcvM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785288804; c=relaxed/simple;
	bh=SkCx3j5OWK8cRKkNE4gK2DCWeBt/zckisJ2qwGPjxMk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VOiuvH5bIKzAUh8jSi1C7Uvuq3cak9ObO4dOUir/sFMenkTkOge+BxTr49Bc4vyM+7lVDU/7VMn00eC/JVd+UysuGVTtzPp0WI9Mh8KEq62zv64uwfiqAvRhL70v26Tneqmwb+16yM6BdDnAB3gWNEpK8UmcBKnwarCgdFgv/pg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=P0RU8niB; arc=none smtp.client-ip=209.85.210.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="P0RU8niB"
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-84864086bfeso426281b3a.1
        for <linux-sound@vger.kernel.org>; Tue, 28 Jul 2026 18:33:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785288803; x=1785893603; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=GM5L/RCtIKftte5HNn5DkACBL6uoAu93LpRcVTfZgFA=;
        b=P0RU8niBVJLrmNNUl3MxrSttUYHeHQc6IBYRZaDh/WT4IPh8zmeagumUiYVVFo4fWn
         MAclb43tUZML5OUsy9ftHRf8RbInuciqHO/4VFxjaCQN5o4uhJQ4BJyKsT3+YLgsRycH
         hd0Tut9bBdHRuLGRQ+WWusXL9SMS2l3U5hSGWhIkjvCW1Ish95HeLFPTU7n0vqbVGrXM
         sTN+VbG4pd+WtZr7BMjpNUl07NDo6CbLSPYOUb3y5HKfQSbYEGOhYv4oAObXFON5eFsy
         0gJcKm3y8Q6DknRtbBsIIc2mzHRsFoIKcXlH/HcN2aCVuhYUCYMgt8VLlUTazKgS9xZd
         3lHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785288803; x=1785893603;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GM5L/RCtIKftte5HNn5DkACBL6uoAu93LpRcVTfZgFA=;
        b=mp9c4paJpHSTbFcDefdDzJ9V1TBDu6R5pdyO7cCnsE7H2YdYMA1bw0T/DyLwP+bi0M
         ZghYRVVcl4zItdbf7rZBms8hPOGd9QXi6WPaJxSVvUeU2sW6TSdJgZ8UCwi7+3pExUB+
         tYUG3930Ro3wIEgt2F7GR1rBpLNfhQ5HkpsgZZMIeqlvKSy5mgyddLZ6ErFS6x63JvRj
         1+em4U71Iaccvp2xHX0ld/46RFR8O0XblH6LGsyidr45DzTodB/4N0kdtYg0Ow74TXD4
         Zt8d6y/TzI3+tPjNg50V8RTuvxtBV9RcULhO02J8OQP7WIdLXPB1B4kECxUbXSRKi2VF
         8nyA==
X-Forwarded-Encrypted: i=1; AHgh+RqTeuazSGJmLzQM25PYGQYS/5FgdP0hccyuPNnh08Pn+95Et1cnV8HpYei7M3oLxs/STUrJzEwfKbXxwA==@vger.kernel.org
X-Gm-Message-State: AOJu0YyudZZicSqGqkdGMkheO5zeE9VJPOmL0YmdXxWYWVIAJ3+hkO2D
	WDtYWLXsyM2b0B2OeSmudwyo0uyKlD719jbGDtp6F+XO9exEKyj66sWJ
X-Gm-Gg: AR+sD12+D6vT4Tur4zc+a+HiBJt23pXDghsiIMGJqFq/3brCk52qJz9AtQrGMih3R6/
	kS2k+weq75ekB1JONPPcp1Y5jvqZtAOKYqRBvxtJatA7we69XMNTiDclAH9I2lZkzvU6VomC7/T
	VpoTuWdLvAi/9hBK2+NWFjpkPa+kVnZV1NWwENoNekmhseGTWzVyyobzjW5h2/Eg6omh1RhJp98
	O+UFqkeffdfUNt6wBGuFy/TOAgHy8upUw9nxr1PDpzqjriEEsDH5Zd8O1wr9O2rJKMItkEIgJ9d
	umy/GPAnE3hCBIseEXk+IQmmpK0TjNJzDxBGiNm/o9OFKTo7OosyNOhADgnJkWUMebw/Ix5DBiK
	Esjvg5Xio2o2myjUpP/cZeOhAiw76WPvQro3/F1y9990uQY7TOPv8YyPIYiSSHKV904dHZPjDso
	eZ9HENMSVQ47ap0mFzjNHjYw0JAIRvaLtrwIM/6dBPVa4VFdOlX/Hpt5qXnjo=
X-Received: by 2002:a05:6a00:999:b0:848:411f:3969 with SMTP id d2e1a72fcca58-84e931595b6mr4900316b3a.20.1785288802849;
        Tue, 28 Jul 2026 18:33:22 -0700 (PDT)
Received: from localhost ([2001:19f0:8000:3e6e:5400:6ff:fe38:3d01])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84ea03d3f16sm582845b3a.59.2026.07.28.18.33.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Jul 2026 18:33:22 -0700 (PDT)
Date: Wed, 29 Jul 2026 09:33:11 +0800
From: Inochi Amaoto <inochiama@gmail.com>
To: kr494167@gmail.com, broonie@kernel.org, lgirdwood@gmail.com
Cc: stavinsky@gmail.com, chen.wang@linux.dev, inochiama@gmail.com, 
	linux-sound@vger.kernel.org, sophgo@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ASoC: sophgo: return 1 on volume change in
 cv1800b_adc_volume_set()
Message-ID: <amlX65QfQGty0E-q@inochi.infowork>
References: <20260727053804.25599-1-kr494167@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260727053804.25599-1-kr494167@gmail.com>

On Mon, Jul 27, 2026 at 11:08:04AM +0530, kr494167@gmail.com wrote:
> From: Surendra Singh Chouhan <kr494167@gmail.com>
> 
> cv1800b_adc_volume_set() serves as the .put callback for the "Internal
> I2S Capture Volume" control.
> 
> ALSA mixer control callbacks must return 1 when the register value is
> modified, 0 if unchanged, or a negative error code on failure. Returning
> 0 unconditionally causes ALSA core to assume the value was unchanged,
> suppressing SNDRV_CTL_EVENT_MASK_VALUE change notifications to userspace
> sound servers (e.g. PipeWire/PulseAudio).
> 
> Fix this by comparing the new register value with the existing register
> value. If unchanged, return 0; otherwise, write the updated value and
> return 1.
> 
> Fixes: 4cf8752a03e6 ("ASoC: sophgo: add CV1800B internal ADC codec driver")
> Signed-off-by: Surendra Singh Chouhan <kr494167@gmail.com>
> ---

LGTM

Reviewed-by: Inochi Amaoto <inochiama@gmail.com>

>  sound/soc/sophgo/cv1800b-sound-adc.c | 10 ++++++++--
>  1 file changed, 8 insertions(+), 2 deletions(-)
> 
> diff --git a/sound/soc/sophgo/cv1800b-sound-adc.c b/sound/soc/sophgo/cv1800b-sound-adc.c
> index b66761156b99..bd93e261bdd1 100644
> --- a/sound/soc/sophgo/cv1800b-sound-adc.c
> +++ b/sound/soc/sophgo/cv1800b-sound-adc.c
> @@ -251,16 +251,22 @@ static int cv1800b_adc_volume_set(struct snd_kcontrol *kcontrol,
>  
>  	u32 v_left = clamp_t(u32, ucontrol->value.integer.value[0], 0, 24);
>  	u32 v_right = clamp_t(u32, ucontrol->value.integer.value[1], 0, 24);
> -	u32 val;
> +	u32 val, old_val;
>  
>  	val = readl(priv->regs + CV1800B_RXADC_ANA0);
> +	old_val = val;
> +
>  	val = u32_replace_bits(val, cv1800b_gains[v_left],
>  			       REG_COMB_LEFT_VOLUME);
>  	val = u32_replace_bits(val, cv1800b_gains[v_right],
>  			       REG_COMB_RIGHT_VOLUME);
> +
> +	if (val == old_val)
> +		return 0;
> +
>  	writel(val, priv->regs + CV1800B_RXADC_ANA0);
>  
> -	return 0;
> +	return 1;
>  }
>  
>  static DECLARE_TLV_DB_SCALE(cv1800b_volume_tlv, 0, 200, 0);
> -- 
> 2.55.0
> 
