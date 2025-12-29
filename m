Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2135618C31
	for <linux-sound@vger.kernel.org>; Mon, 29 Dec 2025 14:45:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767019557; cv=none; b=IKc+eQGo2SCQumjIkXsFm0ZsdlMrYPveEkyU2y38Nv5IVx9MgK8/Ztd+RA8gm9HiVog91UnkCHXPRHwSRdeWBEP3OK7XF6v8MMUV/9dwoPtwznMrL3i9KFLRtJb2ZLKxIuBhN7RFuvV19dVJx4Lb4/PueTDglBt362vVKDgFY8Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767019557; c=relaxed/simple;
	bh=qFM4LiFAiwTwuk6OWDA+Tu6Kw/kHsgmaHaZvNHkvbFA=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=nAzsZ+5KrldFA1wJzmCLPTAjymZlzGKI883PtDeLnTRCgaye/RhPB3eVSWpObO28BXXidWEQ88Fyu2fFmgz6pN3ED/GlNwGxPGaFPxWBkE+sm/GAHrSbQ73g7pwaXMz2DSl7aVdkxbls28mSZqSkDmSHOroNzit3YMYF+AE5bqs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=P2dWVdnN; arc=none smtp.client-ip=209.85.218.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="P2dWVdnN"
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-b7697e8b01aso1665962566b.2
        for <linux-sound@vger.kernel.org>; Mon, 29 Dec 2025 06:45:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767019554; x=1767624354; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3tId5XV5kYSQY/kLmA9NWqwvSnJZ5ff10lBlcCOD+Ow=;
        b=P2dWVdnNH4DfRFKwMJ32m+Bn1OnSvPQz8C7W3TiPo1RUd8VKLVrN4VHl+HVrsxiQfU
         rIZyBf3RGNeHA+YLRVoLrjNDrO68ydeo3DGkhDlgoyq115NUnXhmP9X7REohzWpMD08y
         etucYe+5m8sd4n5gKSBTBd837LH67xi4Zglod+fM/sCcqJXLa2vUx/fvz7X9zXqdTBfJ
         Xjebt9zxAIDy1gFLmVYcJG6RvQgNLXkbz4IPUMqO4mrU/s0HNXROPxqws9lcUy68ldj5
         cxCOy7KNdoIlGaqDuml5bou0vVClkDJsb6bW3IqmrplbNeNnnUbLwqQ82Ly8sn2Gvu1Y
         gm/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767019554; x=1767624354;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=3tId5XV5kYSQY/kLmA9NWqwvSnJZ5ff10lBlcCOD+Ow=;
        b=szIMXuev8Oqed60w954LiSlRQnQPh9K62XBaRiMLcwLbEpr1fPazhS3xFmnNh5M6KK
         yoSlNoO7ECbA02/DGEYgMbc7kpRCek/7XfhOdrTT9/0ZaAhCXf6JxjiccPk+R7V/Lmly
         iP+VCh113ngHDlchqKkeYkaEgZ4LcAtmP5kYHy6AIcYJynpN2QIWZ6DoQXwZ1UdESsic
         JMdtcJANW/+SGdQXMAdWUgSWw2g6csmnxEhpjCkFLmb3ZiOdI08HbcibW5fqKFHxe2dq
         WHq4DX1W0ySJvxj/SgVrtkEur42rgsWmxveU3P5e/rYMx2gPHEWsAVW0JecEmVwEIL6q
         HkGA==
X-Forwarded-Encrypted: i=1; AJvYcCX4cG61SyVQBA7pX/TxziAVz/ZwPG5ZQ1YL+ioRc8ou+iZiP4KLKqJdEP0SUJgpOHBcftYNmYKvyvtI1w==@vger.kernel.org
X-Gm-Message-State: AOJu0YyE23l14miLFxdD5TA3J37fz9kFGE0Ndn0Ll9EbUh1z2rZgtZ25
	c4gVIUxSTy+BB64aRNIaqJU25XdVCrTw4kYKctUpAC7sIBmSJ4qSPzbWw+Ihbw==
X-Gm-Gg: AY/fxX77BE0dM4ysiSbPpAe5gdBITuyHXvXJqNhxxjQTXRjJk+uT716RVtiVrUdnBI5
	PJQI5mdof1Rr/+lpidi0nbL+hAwHvfyDrpJt9Y0aWlL67VyZW7NjzBICksIfCm+JKXUkQHtfR+C
	0FkUekUKZyRCh+/8D6jcrCIw9ZR0JhfcqAjgVoJ7KhT7VYyxUJj44j6D9ptF5BypDuMnNA9DNmo
	DWDX2R9MKToHqmmOBQZyfRJAXq7iKyXD5V8L8np25VrEBB9PoCF/cF/uWibYHWvIENrFs0qG1tt
	ryV59Ys5Er+MH+MmS/RxngNsiic7bhKl+pqE7Znfdd0ofBefcbu4g8xtGDtPYRcxd0xSXXZ3BLh
	eE6iDv8Dwk6j+jV8jpxGE/lQGf6vyPuKwfndjnmeVMqvuH3KjI5WJvZlX28d3rWwDKCBamXAkSo
	MJdVrPVC3QTzqqrtgYP4T6tcad+ey6SyBCY6UJY/ZV6422tAI9RR7Z
X-Google-Smtp-Source: AGHT+IFZx2XByZDcGoz6k0dVTKejmOPtpNe6KoB1/QAoZpQAFG17i3uYtYslAObNd+vt7plTaXSkLA==
X-Received: by 2002:a05:600c:c0c7:b0:47d:264e:b37d with SMTP id 5b1f17b1804b1-47d264eb725mr245790195e9.22.1767013332883;
        Mon, 29 Dec 2025 05:02:12 -0800 (PST)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47be3ad0c60sm245250335e9.5.2025.12.29.05.02.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Dec 2025 05:02:12 -0800 (PST)
Date: Mon, 29 Dec 2025 13:02:11 +0000
From: David Laight <david.laight.linux@gmail.com>
To: Shengjiu Wang <shengjiu.wang@nxp.com>
Cc: shengjiu.wang@gmail.com, Xiubo.Lee@gmail.com, festevam@gmail.com,
 nicoleotsuka@gmail.com, lgirdwood@gmail.com, broonie@kernel.org,
 perex@perex.cz, tiwai@suse.com, linux-sound@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ASoC: fsl_easrc: force cast 'val1' to u32 for do_div()
Message-ID: <20251229130211.49b169a0@pumpkin>
In-Reply-To: <20251229085919.3952347-1-shengjiu.wang@nxp.com>
References: <20251229085919.3952347-1-shengjiu.wang@nxp.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Mon, 29 Dec 2025 16:59:19 +0800
Shengjiu Wang <shengjiu.wang@nxp.com> wrote:

> Fix below cocci warnings, the real width of val1 is 32bit, so use force
> cast to avoid warning.

I just looked at the uses of 'frac_bits' in that file.
Some of the related code looks very dubious.

The 200 has:
	val = (u64)in_rate << frac_bits;
	do_div(val, out_rate);
	r = (uint32_t *)&val;
followed by uses of r[0] and r[1] - that probably isn't going to DTRT big endian
and will generate worse code LE than using val and val >> 32.

Line 2063 has:
	val <<= (frac_bits - 31);
	regmap_write(easrc->regmap, REG_EASRC_RUC(pair->index), EASRC_RSUC_RS_RM(val));
where EASRC_RSUC_RS_RM(v) is (v) << 32
That is a lot of shift lefts on an 'int'.

The code in question can shift 'val1' right and convert to 32 bits
before ctx_priv->ratio_mod is added in.

	David

> 
> cocci warnings: (new ones prefixed by >>)
> >> sound/soc/fsl/fsl_easrc.c:1999:2-8: WARNING: do_div() does a 64-by-32 division, please consider using div64_u64 instead.  
> 
> Fixes: 27147695aaf7 ("ASoC: fsl_easrc: define functions for memory to memory usage")
> Reported-by: kernel test robot <lkp@intel.com>
> Closes: https://lore.kernel.org/oe-kbuild-all/202512281902.bPsKjjkC-lkp@intel.com/
> Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
> ---
>  sound/soc/fsl/fsl_easrc.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/sound/soc/fsl/fsl_easrc.c b/sound/soc/fsl/fsl_easrc.c
> index f404a39009e1..16a45a7146e8 100644
> --- a/sound/soc/fsl/fsl_easrc.c
> +++ b/sound/soc/fsl/fsl_easrc.c
> @@ -1996,7 +1996,7 @@ static int fsl_easrc_m2m_calc_out_len(struct fsl_asrc_pair *pair, int input_buff
>  		/* right shift 12 bit to make ratio in 32bit space */
>  		val2 = (u64)in_samples << (frac_bits - 12);
>  		val1 = val1 >> 12;
> -		do_div(val2, val1);
> +		do_div(val2, (u32)val1);
>  		out_samples = val2;
>  
>  		out_length = out_samples * out_width * channels;

