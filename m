Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8AB77331205
	for <linux-sound@vger.kernel.org>; Thu, 26 Mar 2026 09:31:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774517471; cv=none; b=FHS+mk++BuRVqV4vkyOk0GDu9HQbZoB4mXf5a+9NIsjjkmGVQG7sOs8P55RvsnFws5zBD2SAkA6PyNiKNcdtlTjVleyyjJ4SUVZD9oHn0UijYvXcC81K8WoMoIqH1ZE5FKu42U0eCoWwch5ZKk7khvQC/vL4ZGIE1U30uoKmnpU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774517471; c=relaxed/simple;
	bh=pwN5FRRxqmIQfiRU5lLTXT3FDrbmu23OTSn70Ln03V8=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=N/Ve16CjWioJzBRB0HuECCRge71INIXHf2p2sw2i2e9qWmOIDk7+fwZxHmXxdh3jp2PxUZ2lY7lvVFzjQwzDtqn/wP+4B79BOhwyQgBKqn9yrTmaT8kA6tNEg6tZ4S03D7DhcrAbjP1gVyuSDYmTSAz7I93xdWjh7jjwRE5nKJQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=qyJqC1Dk; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="qyJqC1Dk"
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-439bcec8613so482693f8f.3
        for <linux-sound@vger.kernel.org>; Thu, 26 Mar 2026 02:31:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774517467; x=1775122267; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=pwN5FRRxqmIQfiRU5lLTXT3FDrbmu23OTSn70Ln03V8=;
        b=qyJqC1DkNP2jB4kt/uE0j/v01TVqMT6qlv0bkSz7tbTy9K0x1S7hpgfTPRmSbdXNZ4
         sPC3Qm+4ISkZt978k4KD76GvZiDLPHqlIRsYw6rjeoBK2IbbJuuweiVvgI0IB/ILQuaF
         MO5IHT6HTzgjO6ZkIpQ5Y1WrM/6u5BXfKjjzYXKnVssVAUAxxonoHV5+J1fTWR9811eh
         0YjZqD4t9QXXW1nWu8H5SnCQjOVDgP5Ap4foWbJzAAUSFKfuIBY9isHGwCYVe7fF+77E
         SPQEay9EN9ENIQQnOk40FAFg+DAV0EcqdPlc+V2oz1NaYuSy2jv3G0qqdNskWRyuf7UP
         vv5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774517467; x=1775122267;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=pwN5FRRxqmIQfiRU5lLTXT3FDrbmu23OTSn70Ln03V8=;
        b=Sw6u8OQjJbroxDxzI8Q/WdFjff8Oc3MpfNo4aI7nZ99K49ffsiZoZDsNBsaMn7gwa8
         FPUhTbVRj7kq8xdfPl5DuVc+v9xs5EHQMZuRN1rRZVTZs8vrEscCvQkpFkrDuG+9FDmT
         jKfOysr3RhzdU0nHkBTunP3N73I+qK97bAF1zH8DOaPfqu5o96JpGRa4YluvqM16UVlF
         VPOTC35fTzpWnB+vJmpfj4VlOvm/Cqld8ya60gFLbFWMzQZ3aMknVQmNvnGTL5SqCX9o
         zi11PC/7rGgNKaH3pZZ/NPVYPARY5SXE9VI5q1VCDzml37g97jHEwqFsFWb6cNuZzmaT
         vSFw==
X-Forwarded-Encrypted: i=1; AJvYcCVty7LJHdYR0a/gEFSsP9ghkuM+XlLb5z+QUBWV+7xObPPfBzPpkatzf00tO0ppMSDnLB3JP0617rLWaw==@vger.kernel.org
X-Gm-Message-State: AOJu0YzeqnjOd/apl915rH9EKID7eMo1n81yi4S+92wPg5m2CwwA+5dW
	rpjG4NgGC3NfeSLObkwWck+LRbesSiLYkX8vvelz9PVAYUNmb1UB8tqn
X-Gm-Gg: ATEYQzxhmNX6ADC4ObVqAMQLyvKzzKuc7aJ4TwQ34geCV4csIsZ8+p3ebp73uKSsKu4
	vdXCBk8NXQXVGHljfcgXQZvjuMVHA7gIpufaeAvZC61PaD9fqY5ZH8spDE4Sh73wDCjgbLVRwlX
	LhOdFPFtuGQUTFHk/pRvBneUcq0NGgNLi+ZmJc0YpcmWCI+K5Ko+u2bCBDDNZotUX8xocyJyux3
	W4HIqiPBCK99miEltLvX4MBVkQbdPbAr9UXflnbUS9lDTMXGgvdBq06CvXXS3u1XRdZ1uogPJfS
	7hb3TFSVytQ0SilYbx+MM6zM6n2hQiXp/HEPC4jOHSTiGwTpv7gTiB3BUkoWowG7iZwbD27R8Aq
	Cabdyb1AA6Yz7Yyz+xfP/MkNy3Xa8PaEfnX4gPYGyWSzgDl/x+hNkZaI7kWlz1rdNA6mwt6Pp0P
	5gJ5kUafk7j9L3+WARcR5iCLg36+1dt1c=
X-Received: by 2002:a05:6000:2481:b0:439:b791:f914 with SMTP id ffacd0b85a97d-43b889a4a5fmr9755313f8f.18.1774517467372;
        Thu, 26 Mar 2026 02:31:07 -0700 (PDT)
Received: from [192.168.1.187] ([148.63.225.166])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43b91942f24sm7173306f8f.11.2026.03.26.02.31.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Mar 2026 02:31:07 -0700 (PDT)
Message-ID: <f60602d74e1e4fb5a7458ea7ff52d16933950e69.camel@gmail.com>
Subject: Re: [PATCH v2 0/2] ASoC: adau1372: Fix error handling in
 adau1372_set_power()
From: Nuno =?ISO-8859-1?Q?S=E1?= <noname.nuno@gmail.com>
To: Jihed Chaibi <jihed.chaibi.dev@gmail.com>, lars@metafoo.de, 
	nuno.sa@analog.com
Cc: lgirdwood@gmail.com, broonie@kernel.org, perex@perex.cz, tiwai@suse.com,
 	linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org
Date: Thu, 26 Mar 2026 09:31:53 +0000
In-Reply-To: <20260325210704.76847-1-jihed.chaibi.dev@gmail.com>
References: <20260325210704.76847-1-jihed.chaibi.dev@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.58.3 
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Wed, 2026-03-25 at 22:07 +0100, Jihed Chaibi wrote:
> adau1372_set_power() had two related error handling issues in its enable
> path: clk_prepare_enable() was called but its return value discarded, and
> adau1372_enable_pll() was a void function that silently swallowed lock
> failures, leaving mclk enabled and adau1372->enabled set to true despite
> the device being in a broken state.
>=20
> Patch 1 fixes the unchecked clk_prepare_enable() by making
> adau1372_set_power() return int and propagating the error.
>=20
> Patch 2 converts adau1372_enable_pll() to return int and adds a full
> unwind in adau1372_set_power() if PLL lock fails, reversing the regcache,
> GPIO power-down, and clock state.
>=20
> Changes in v2:
> - [1/2]: No changes.
> - [2/2]: Also unwind regcache and GPIO power-down state on PLL lock
> =C2=A0 failure, as noted by Mark Brown.
>=20
> Jihed Chaibi (2):
> =C2=A0 ASoC: adau1372: Fix unchecked clk_prepare_enable() return value
> =C2=A0 ASoC: adau1372: Fix clock leak on PLL lock failure
>=20
> =C2=A0sound/soc/codecs/adau1372.c | 34 ++++++++++++++++++++++-----------
> =C2=A01 file changed, 24 insertions(+), 10 deletions(-)
>=20
> --
> 2.47.3

With proper tags:

Reviewed-by: Nuno S=C3=A1 <nuno.sa@analog.com>
