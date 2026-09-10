Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6152049BD83
	for <linux-sound@vger.kernel.org>; Thu, 10 Sep 2026 14:33:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789050793; cv=none; b=eoyD9ehjGMNae74RhDFfgOUthoyAFtaw71D1N6sZ3qvJCNdMXXHREcGyLzB/x+3Re4xGaSIxqcalbVeeawYUfvkQU47lj2spxN8yMz16L4X73y/SG2Qu/dJtc0UhKwH4Hp7va3G8NuqImOYR1YbAuYkgxeJTkn+daihtQGMxCfU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789050793; c=relaxed/simple;
	bh=SUENRTJhLPbN4I6eA/VBHUJ0VY/0q4ahijBhdl2mxuc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bGT2eYskZnGgZMSBIwYjAHp1AMyViFKRFsT33sRqa7U3zhSKR4aIBRoxGiDs8kT/nMQMjiG/a/r9KPG26AIGPu4IjCNFyHi6xe18xRUunMqlHoGMwr2EUwD9yMezfc1UAPkUBrTNjnA+gZq/g630DNQWcahyyjT8eSRPykPAtDg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AabnWLk2; arc=none smtp.client-ip=209.85.218.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AabnWLk2"
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-c294183384fso279640466b.1
        for <linux-sound@vger.kernel.org>; Thu, 10 Sep 2026 07:33:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789050789; x=1789655589; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=DzU6DG6XG594yeHbl3kw8jAUPKuarqka9GmRxsQr0QE=;
        b=AabnWLk2P9RrsSp++QSRAF/Om8PorYUupva24Zf4M7HPdW9jPbRPQ3itPg2sx+xF2M
         BETWJimrVrcDYaC6eJqbAJaBUfoqMTfHLf8TZC430BZ6APbbYyatbNE1GubkTNF5mNGi
         5kLIQvhYotB+Tx8MpMZ2Id3E/lMnaYcASA8qEXxCP1Zc3rA9FJa5SOK7Vc5V9Rxhlb3l
         OwuIVfc3CXtMXOzMDIOmebDd+pWdh9CuKC7l0EdVd5LevmOK2p7yjMbR+91mLjCGb7xn
         9HTN35O+KV/KHM8GhaJvlOeExYfC9mm/ce30ZBPqjgMnc3HWWjUmqXUP2xiLEoOoNd+q
         IDeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789050789; x=1789655589;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=DzU6DG6XG594yeHbl3kw8jAUPKuarqka9GmRxsQr0QE=;
        b=fWfXCnlcdhd5NXVueeYaSaV85e3FwLUkX+kICxarDtLs3Zou9X8j/w8iUW+RFT+7hh
         FOiV5cmDjbxqdWSvKwuhNrSYi2nkTcCGAtSozsJ5mmDlZBhYktvRskY1yQ9BuuvodTxM
         NplHTuqumnq5Izq+GyezrnL6cGnQ/vyH+dfKYqlU4hTqwJgYONoD347D6pgxBpAypzcT
         DL2eHQlO3FGyA5WcPkQrlC2fs1L/WQRw8X7TcXqVy9LE2J+Ab/RA/iUQfZCNUnyql+E+
         giHRFiNXggdYNkqd+IpVAUktA3gt1Gtg7PvnCOHjz2FyjLFoxleQI2FWTWiqL3JqwsZb
         IdtA==
X-Forwarded-Encrypted: i=1; AKwUvBwfBkoOIOlX7kv0z0WTroi4g//VqKZcnVQI/eLnmHCnLdov6rjPObGjJCWL/iZSdbEm7pqmgMexd+hOXg==@vger.kernel.org
X-Gm-Message-State: AFuF++mapc9Hgt2PvcMu89CK2UJhu9JTD+duh6MZKc5ChOYLbMVlVAdp
	vIXlSp+3ex97CDklxGZGQJCL38dote/345wD1cDzVxDTlRk3ekWnJP3l
X-Gm-Gg: AYBFou2IZXs3bFpLVsfqgL0Jc7SXn3JKz4rdb43brI7iTdinlcX7qAUZmBUByQ1D+Hs
	hCzWb9sFGTpj/Fgv4p5bDcG74oZyxsVXM46dGYgBUCBeatGRJyrEQ85JjQkAAbS9RjelAOh99tU
	1Be1P15imyQGPv/QMRMKlZShMqMgZQKLzGB3pjN79h2kPST3wPt8fVYUhBeqnbFEys43aBEcAYF
	2lyWcoAmy9zu1Vu/miQHghhhSkP9/+wbg2ArAifIBUyPyIXi95G39QL28EkjS/Qoi7b38Fjs9ef
	BWkwOPnhNmlYnaHGtp1zPIjABdXHsHJ97V7N3VROgP1BA4fyrV8ncmombYZjEBRCwt9uD3iA6im
	DitaiW9xSXl0pcniKealv5W0/owOsh6BfquK41yyWa/bL/aoJiQ+5kTAzBBK6ZHmCJsbbpmScMQ
	HgqdJweRNbYCUQlohcMRNB58nvaL55KTI+sjIdR+yzBD06KwcUs26ZkPl1uGNBqK5tPXc=
X-Received: by 2002:a17:907:724a:b0:c29:52dd:317c with SMTP id a640c23a62f3a-c2952dd43demr140890666b.30.1789050788988;
        Thu, 10 Sep 2026 07:33:08 -0700 (PDT)
Received: from localhost ([2c0f:3d00:6be:8900:ce5e:9212:ea4b:f30])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c293d20e257sm204160566b.57.2026.09.10.07.33.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Sep 2026 07:33:08 -0700 (PDT)
Date: Thu, 10 Sep 2026 17:33:04 +0300
From: Dan Carpenter <error27@gmail.com>
To: Neo Chang <YLCHANG2@nuvoton.com>
Cc: broonie@kernel.org, lgirdwood@gmail.com, perex@perex.cz,
	robh@kernel.org, krzk+dt@kernel.org, linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
	neo.chang70@gmail.com, kchsu0@nuvoton.com, sjlin0@nuvoton.com
Subject: Re: [PATCH v10 2/2] ASoC: codecs: nau8360: Add support for NAU83G60
 amplifier
Message-ID: <aqK_oOpMAXVhxkHJ@stanley.mountain>
References: <20260825021644.1203076-1-YLCHANG2@nuvoton.com>
 <20260825021644.1203076-3-YLCHANG2@nuvoton.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260825021644.1203076-3-YLCHANG2@nuvoton.com>

On Tue, Aug 25, 2026 at 10:16:44AM +0800, Neo Chang wrote:
> +static int nau8360_dac_mux_put_enum(struct snd_kcontrol *kcontrol,
> +	struct snd_ctl_elem_value *ucontrol)
> +{
> +	struct snd_soc_dapm_context *dapm = snd_soc_dapm_kcontrol_to_dapm(kcontrol);
> +	struct snd_soc_component *component = snd_soc_dapm_to_component(dapm);
> +	struct nau8360 *nau8360 = snd_soc_component_get_drvdata(component);
> +	struct soc_enum *e = (struct soc_enum *)kcontrol->private_value;
> +	unsigned int *item = ucontrol->value.enumerated.item;
> +	int ret = 0;
> +
> +	if (snd_soc_dapm_get_bias_level(dapm) > SND_SOC_BIAS_STANDBY) {
> +		dev_warn(nau8360->dev, "changing path is not allowed during playback");
> +		return ret;

This is another case where I would prefer return 0 or return -EINVAL.

> +	}
> +
> +	mutex_lock(&nau8360->lock);
> +
> +	ret = snd_soc_dapm_put_enum_double(kcontrol, ucontrol);

Not related to your patch but the comments to snd_soc_dapm_put_enum_double()
say "Returns 0 for success." when really it returns true/false on success
where true means it changed something and false means nothing changed.

regards,
dan carpenter

> +	if (ret <= 0)
> +		goto unlock;
> +
> +	nau8360_dsp_switch(component, snd_soc_enum_item_to_val(e, item[0]));
> +
> +unlock:
> +	mutex_unlock(&nau8360->lock);
> +
> +	return ret;
> +}

