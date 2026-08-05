Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6DFF46AA94
	for <linux-sound@vger.kernel.org>; Wed,  5 Aug 2026 16:07:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785946075; cv=none; b=qwknQ7YgGh32tW1lTCBJf5QFGywi4AnyK7af2jllFeNRKCJRTnDTKJdpbEjRYOmA3XY+M/tS7Sdkcl+tJ+6mFZaXeGrb9H7Mc0wTCYezAlZ2t0FS1RUE10NzFLkrvalGA3hQhKaKyZDMIBJi3JxUOk/c6JvGQ8ZNcsIWPvMQjS0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785946075; c=relaxed/simple;
	bh=BnEANtUR2SjXIFDOIuxVrqT1LGyLKFQwn8PHbB/NFgQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=eZv26WDTDYBQyaoE5bfA85oKHySpZCSqHYNsZULWGMKFSUVIJkTSR4ByR4dYxQV7OQS/p5GZw4QUwBweamcbYKQkMo9sj+plIovpbkE6VjFrt77/dcklJnRbkKWTB21YoisQzViC/8SKRogFaw9MYS90TtPvvskFlqjF2l7H9o8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FuH5yGy0; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FuH5yGy0"
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-47f84023916so1035911f8f.3
        for <linux-sound@vger.kernel.org>; Wed, 05 Aug 2026 09:07:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785946069; x=1786550869; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Q3B2eNwzuKPiNSGjcCI7cvCpJ6KrF8a/aGTTGYucHSI=;
        b=FuH5yGy0GBeEk7ptZ2US6FOWoAht3Va3AQiCCQV48pQAaHlGd4DP7NqUuul7NzsoCl
         5dNPvI4U8tRca+2vTJKtISaNYS3jmZ2SZxBzyQoIb6AFybWJ9m4pYwBTla/4DS523S02
         +WofYGlz2EtswNebvPtDomV4XsKu8QeCUm4GhuVUO2scbz5t3XQVNJMsHvtuqico4iBZ
         9nAGhf2bxjJ16cytwf6AjmvBsFgcmF2lCorsnlfZZOjEG7lM360keYGZuPqveM6PuhKY
         GivIo4FvouoanyN/9N5QnXdJVInapEvshQiddn6AE1GIa90AxQhRzKzdaECYyRxr8P6j
         80og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785946069; x=1786550869;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=Q3B2eNwzuKPiNSGjcCI7cvCpJ6KrF8a/aGTTGYucHSI=;
        b=P+R2fYkZY3nd7nePbbSRir65r6xxT1YwhRcd3P4tWxD58joPuPtsltuVatwifTlRlj
         AJMrU7xGYwkDLu4G9vPTjrVFwrjbAfxt3CyBRUNfdW2+SJjCh4xdRn7yeYI1HYHHJV7X
         ZoUP0LsJCgFG434BXIMS10POgrbpSF0vgab+U+F+A8Eq1qNfv3uu5AoReirx+WSbfMIv
         gmKcM9RogRO01VYhEMQs9WLvc8eygIJkdVM64LFcPMqer+cXGmMlbU/x8U01fr4y3Iuj
         7nfLKQyttC57sCiX34ppE/N8mJy0pQbLorQE0dHtDJ15vXOuG9S5uHKGUOBYIrMSGtuz
         +ttg==
X-Forwarded-Encrypted: i=1; AHgh+Roca8k/dc/FCuSZEOm7aWMP3pfUk6ffbcxTVb5+ktjHx7kXs7uzrOkWB9gnA1uiBSagtKACGzV/GXNTdg==@vger.kernel.org
X-Gm-Message-State: AOJu0YxSVihCLqMA9vJ1ATEKKDI07g9XDyx3JhZMdK2UsViQly9kgo5m
	4lr4LXNRY6V1MvDkEnio5vpoDm53kmhqPd9LEOt2H559VUVN6CHo16ZN
X-Gm-Gg: AR+sD103eghEC/wXMcneu4Yq2XlMPAsYWakGTp/033pUup2699zqHM4CamBxIdBEwJW
	9kphTlNr9Ymun9zmoBced1UrAOGuHR8d12Qcee2YNRSOAq68qkbiCopoPV4JgXOAzkcnwjxFgX7
	N1/SufSlSUwYJOmumMuZs8H4+Wv2DmjVB5UE2CgqCglyQa/gIP5F5yPV+pF7tPermaFdFFxHv8t
	Hx+YI25Z/MrstXayPslqcLPusinUDt3ZLgNFAMB2TWu1EG8wL3HbFqpADFsdT9wGKcfa97GPWHE
	eyBolMt/8cd7lJilqQFWH5/Lk2RQpPaZYhFwCbKY2o7DPPkbLa6D6+rex4ZU+XqVsp7nNYevNy7
	Yp2/iQ+4kJpPJUOl0hKb3PYJZyJI2JIPZFN3YNLccKrL8oDKShV4Tk9mMWCVFK9Dxt2z0C0DwzY
	AUMPUvQ5XBhN4UswDySwGbYJNNGkEL4+MC6XtuirVcJ8rI9hp+6yon
X-Received: by 2002:a05:6000:4022:b0:47f:6fbc:dad5 with SMTP id ffacd0b85a97d-47fec62ee69mr10878966f8f.26.1785946068985;
        Wed, 05 Aug 2026 09:07:48 -0700 (PDT)
Received: from nsa ([148.63.225.166])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47fec232328sm10342546f8f.24.2026.08.05.09.07.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Aug 2026 09:07:48 -0700 (PDT)
Date: Wed, 5 Aug 2026 17:08:59 +0100
From: Nuno =?utf-8?B?U8Oh?= <noname.nuno@gmail.com>
To: Takashi Iwai <tiwai@suse.de>
Cc: Mark Brown <broonie@kernel.org>, linux-sound@vger.kernel.org, 
	Lars-Peter Clausen <lars@metafoo.de>, Nuno =?utf-8?B?U8Oh?= <nuno.sa@analog.com>
Subject: Re: [PATCH 17/31] ASoC: sigmadsp: se auto-cleanup for firmware
 loading
Message-ID: <anNgBxpLVkydoqII@nsa>
References: <20260805135247.670693-1-tiwai@suse.de>
 <20260805135247.670693-18-tiwai@suse.de>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260805135247.670693-18-tiwai@suse.de>

On Wed, Aug 05, 2026 at 03:52:18PM +0200, Takashi Iwai wrote:
> Simplify the code to manage the firmware loading with __free(firmware)
> auto-cleanup.
> 
> Cc: Lars-Peter Clausen <lars@metafoo.de>
> Cc: Nuno Sá <nuno.sa@analog.com>
> Signed-off-by: Takashi Iwai <tiwai@suse.de>
> ---

Acked-by: Nuno Sá <nuno.sa@analog.com>

>  sound/soc/codecs/sigmadsp.c | 13 +++++--------
>  1 file changed, 5 insertions(+), 8 deletions(-)
> 
> diff --git a/sound/soc/codecs/sigmadsp.c b/sound/soc/codecs/sigmadsp.c
> index b7dbeb237447..4ecbbac93258 100644
> --- a/sound/soc/codecs/sigmadsp.c
> +++ b/sound/soc/codecs/sigmadsp.c
> @@ -484,7 +484,7 @@ static void devm_sigmadsp_release(struct device *dev, void *res)
>  static int sigmadsp_firmware_load(struct sigmadsp *sigmadsp, const char *name)
>  {
>  	const struct sigma_firmware_header *ssfw_head;
> -	const struct firmware *fw;
> +	const struct firmware *fw __free(firmware) = NULL;
>  	int ret;
>  	u32 crc;
>  
> @@ -492,7 +492,7 @@ static int sigmadsp_firmware_load(struct sigmadsp *sigmadsp, const char *name)
>  	ret = request_firmware(&fw, name, sigmadsp->dev);
>  	if (ret) {
>  		pr_debug("%s: request_firmware() failed with %i\n", __func__, ret);
> -		goto done;
> +		return ret;
>  	}
>  
>  	/* then verify the header */
> @@ -506,13 +506,13 @@ static int sigmadsp_firmware_load(struct sigmadsp *sigmadsp, const char *name)
>  	 */
>  	if (fw->size < sizeof(*ssfw_head) || fw->size >= 0x4000000) {
>  		dev_err(sigmadsp->dev, "Failed to load firmware: Invalid size\n");
> -		goto done;
> +		return -EINVAL;
>  	}
>  
>  	ssfw_head = (void *)fw->data;
>  	if (memcmp(ssfw_head->magic, SIGMA_MAGIC, ARRAY_SIZE(ssfw_head->magic))) {
>  		dev_err(sigmadsp->dev, "Failed to load firmware: Invalid magic\n");
> -		goto done;
> +		return -EINVAL;
>  	}
>  
>  	crc = crc32(0, fw->data + sizeof(*ssfw_head),
> @@ -521,7 +521,7 @@ static int sigmadsp_firmware_load(struct sigmadsp *sigmadsp, const char *name)
>  	if (crc != le32_to_cpu(ssfw_head->crc)) {
>  		dev_err(sigmadsp->dev, "Failed to load firmware: Wrong crc checksum: expected %x got %x\n",
>  			le32_to_cpu(ssfw_head->crc), crc);
> -		goto done;
> +		return -EINVAL;
>  	}
>  
>  	switch (ssfw_head->version) {
> @@ -542,9 +542,6 @@ static int sigmadsp_firmware_load(struct sigmadsp *sigmadsp, const char *name)
>  	if (ret)
>  		sigmadsp_firmware_release(sigmadsp);
>  
> -done:
> -	release_firmware(fw);
> -
>  	return ret;
>  }
>  
> -- 
> 2.55.0
> 
