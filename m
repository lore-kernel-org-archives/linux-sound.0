Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.215.175
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795170551;
	b=lOiUMzSlPROBJ0PRoSA1ocOh5gTzKE6kVJjKnJ7yaN36MuSPMXRmyPxS7FGziEQIvHfI
	 cXH9HUbC+xjVrhq1Lkl5q+NhdXEJRYoRHNLOcu1hJxJVu/PPFvKcIYKea94a2URIvv+rE
	 ilqYHfXsXqXSQYD2nglAumu15RiVx/loV8AzYJQui0iQ6rpTRoZzBJ/leHzwxez7uqufF
	 Beb4Z1XLvxNUoyUHjYtzPNfFD63Aslknfn17L1cvuMgAbNWumTlswleCNENJCTk2jEjCG
	 Ts1QB2+oSyBSuD/FiJA/ASNvB9QFTya1e/xDAVFfjq9If9TsyoPHrO7urFaXPTM75wQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795170551;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:MIME-Version:References:
	 In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:Cc:
	 Content-Type;
	bh=uVsgtw9AnWofNH90qnHhiYcpUjxrPNJEDFOgQ0n6Gqw=;
	b=z6GDSMn+CLtV0pg96Z5UlBwRd/6dSRNZiMe+/Tqm6N3NrRwL2SPSqnLI0lafnEyGQ+6s
	 ASb+PAHyRAEWHL5BRChTpIDLC+sBjBzgm4ojOHwOjF501C4/eWfzD/xntv1F3hwoqdxkS
	 ZoGoYRuU8wCUlLOs1vVJVUViprlvAq4u6WIidzhf0moRRW5E60syc+QoF+NIrae02UH1o
	 OxVesBICvWj8BLqg4fFZtnMyDMeZ48dF5EVBI+lL7LfPqyfirz375mHH7YCIA1yTGCYN2
	 Zv0x56mMhm4MVAYYW0nMZoHxao66iSQiOfJb7kkl+rBsaxKPinISpNrC3eKlzRGXERQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=fEONgvy7;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.215.175
Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com [209.85.215.175])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41DDA606A32A
	for <linux-sound@vger.kernel.org>; Fri, 20 Nov 2026 10:29:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 41DDA606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=fEONgvy7
Received: by mail-pg1-f175.google.com with SMTP id 41be03b00d2f7-cde5a7d7849so344500a12.0
        for <linux-sound@vger.kernel.org>; Fri, 20 Nov 2026 02:29:11 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795170550; cv=none;
        d=google.com; s=arc-20260327;
        b=KjQiMQWmPpHpj7s9N16inslcuIYoqjLBiWB2RpU9u49lmWJTTh3f56L9HtwXayToFu
         Y4Dqtu1N8q+zZ924aBhrfLSL+VlH8KughLVfQrrX4AjEZboBXPJMJ9X+XvaXnuIjjPLW
         JvibiQ++2ja2YzHrjPWikNwaw5UJoWi86WiDiUg5RPVwMVoa/UpzNegeezhooyS8The1
         Xap6BDufC7bArteuqcUfO/vZkuaznol65qnMnyn+b8+BE+PxosRLxz8z7neXeuseDHxY
         WhDcgAktVvmNAk9IZ7I9aZtPj8dwlFAGuWpb8P9BTQAP5ek/7s+h1bbrAMQZKEsJDiRp
         qBgg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=uVsgtw9AnWofNH90qnHhiYcpUjxrPNJEDFOgQ0n6Gqw=;
        fh=j7qE0RlvzNR5Qm6xA4ehUDBqPqcz09gsE3Wa6zaxdUU=;
        b=KOrbEt2U7w70lJY8yYCiElRPvCf3J8vLj1xa/+uVB3KZmE/yTOX0K1MBiY6FEmYj2b
         nVbKAV/REIiohMN79VrnbftLC2EeErqnf8X1h6SO/sDAjfdIknk7JA2i4011ocrc02V/
         MAwM8H5kPMYy/mSvKKXIYNi9KV9sCH71Xd/zWU/qtmB5tmMepR+1rHxwR9rmdm5KnGdm
         lPFPLIBZN/zbFPdSJA4SSLzzZ5RJ71pljVzbp7DDeXv2ZCMMmWxhkiyV02XIqVaApmZL
         fPGWYPQjT34N30lufqyYJ3JfvBJKNw7ikm9G61hT3VYE3B7YwUr5piNbOQ5hGz0EJSSu
         3F2g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795170550; x=1795775350; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=uVsgtw9AnWofNH90qnHhiYcpUjxrPNJEDFOgQ0n6Gqw=;
        b=fEONgvy7NGk4o8B3tjmL+gnvv5zENAENpxW2J99tzu30WJ6ewxGQZYN/kwTUeruIEt
         tJxBM1Cwb7exLEeJ07rF/B15AXXLhIPZajOaz65qIbFz7Hg6uUBnAPh8Ywbk5Q3TX/SE
         f/WzfaDL3E85WisVtSsqM83+QrZ3NthvnzFLBavObDOWybqLezpDhNHDObVREeYRtxAZ
         FAUIBNELI4zguhHeKuOD3eUWLbInLuuRamAVCvWxaj2af5TPzy1T7rYJriLRwKFfeDKF
         PspHhVgMdTksH89YTXsam1D2yN88ZcqhP1vCN4nrwa6Bk2+WAKGcq7u4/abCMqZbPOFI
         AZ8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795170550; x=1795775350;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=uVsgtw9AnWofNH90qnHhiYcpUjxrPNJEDFOgQ0n6Gqw=;
        b=gVrAKmhLcoUZY42Vo3gGSa+7ND7yAv8WVUg1BDVHvgEztHFTjCBhciDjfUaVPIvb/p
         vfS9tR3Hw1n94VH2iLvHay/nrm17O0MXxP554g7esMfKThrn/e4pFsCpnCQoiEk9a+qy
         kPQkAL1WSj22R4ql1akMM44tE8/JX3fRGE/nqIW04Kpu5ZPcWDBp53Y2qsejs5UxUfyp
         URIKzLlehp/0H1Bpa8UGOYqBy0OmUoYqZAlSUFV1WQKoZt7KOuu4RY0RfDrKpZqrcVwa
         4UjNkNwqM6oK+FkPoCg8aUHyEH+5Iscvsid2OWRGPDX2EqXooQsuDVyqXZXqW/gjVUeC
         bxHg==
X-Gm-Message-State: APuU4Z/TdAjZH6Ocl8yZYa6I4g7knPoq5Q14Gg7sflBEIgqrWGFqpPmA
	sdHC5xP5/5+vltV/i/cDZzx2KC+cO0NoM8E/PhPHIoIAbapshj5h5nr4yEIz8XoB3GGr+Buh/zz
	ESCaDRiE6Qfm16cNkysXTqVL0T8dsxJjk99iL
X-Gm-Gg: AZFdTZfrag1nO4rbcfWbbf0jZXX8GM0rjUu3JKl+57TyPPXMfTisI/kdPH0B1kTQAWD
	Ruxhm+hCvnXiVfpRmB80T0sutVBd7NaXpYxwI24ktdIWesABdC+f1GYUkETqcpwB0FUXxXnyJ33
	8jqWBjmgYHXU6Cjw2R/FCOI9lsaeNGUSHoV+Ip1eLcOtuHhD8fIARGHSSzIPGe1pQS9NPAZEcM5
	AajK59jbyu8qfe89TmVe0A7Eck+ktMPSXMxavDaki68b5fpzTYkdbXdTZ3CMPTag6WP1t71pmPq
	p/563F5bvxKqUpjPeZhgOuyYCT76ppfIqSAgXBcb1AFcziTJ5OlAVCHEXptZSkAXae4qQ29Exhw
	VAfdaqGf5jyYUlz2EmFfa32eE6PlxqYRg5dMkOIC+3imUOfiWekaqK2qzKVnHyggKiuO1eP1MVN
	dt3WnLsBFfHOSer0o+S3hMjLpsxgIUE017kvqKpb05gozv2xMI
X-Received: by 2002:a17:90b:264d:b0:3b1:bd5d:53a9 with SMTP id
 98e67ed59e1d1-3b41c9825a8mr2178054a91.63.1795170550564; Fri, 20 Nov 2026
 02:29:10 -0800 (PST)
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Post: <mailto:linux-sound@vger.kernel.org>
List-Help: <mailto:linux-sound+help@vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-sound+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261120100408.8053-1-phucduc.bui@gmail.com> <20261120100408.8053-2-phucduc.bui@gmail.com>
 <sashiko-outbox-224919@kernel.org>
In-Reply-To: <sashiko-outbox-224919@kernel.org>
From: Bui Duc Phuc <phucduc.bui@gmail.com>
Date: Fri, 20 Nov 2026 17:28:58 +0700
X-Gm-Features: AclHuK-SrE20lDTbd7YPskSVweT1_hnxLgkilNwL0_Ve5O-b4yK8MlqO-HwVMqo
Message-ID: <CAABR9nE8o6h59mCJuSY6RGKGm0fme6qLqCZj591OiRArRapcDA@mail.gmail.com>
Subject: Re: [PATCH 1/2] ASoC: atmel: mchp-pdmc: Mark IMR as volatile
To: sashiko-reviews@lists.linux.dev
Cc: linux-sound@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

>
> [Severity: Low]
> In 50291652af52 ("ASoC: atmel: mchp-pdmc: add PDMC driver"),
> mchp_pdmc_regmap_config did not enable regmap caching, so regmap_read()
> on MCHP_PDMC_IMR always read from hardware.  Regmap caching
> (.cache_type = REGCACHE_FLAT) was enabled in e8c8e9de4ee3 ("ASoC:
> mchp-pdmc: use runtime pm for clock power saving") without marking
> MCHP_PDMC_IMR volatile.
>
> Should the second Fixes: tag reference e8c8e9de4ee3 ("ASoC: mchp-pdmc:
> use runtime pm for clock power saving") instead of 50291652af52 ("ASoC:
> atmel: mchp-pdmc: add PDMC driver")?
>

Agreed. I'll update the second Fixes tag to reference `e8c8e9de4ee3`.
