Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.222.180
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794525841;
	b=kUNkp+Zp6bl6qZy1eiDgI+1Wdo1NdQha5NhmptUYqmExbdxrLfx/ryC7VKG1n9pnl/5b
	 A1fA3ENjUMAdNAu8pQk/DkK2DvM/Mb4LC+YhxFpLQ3ox5/rhWA2tVeOQRzwX7Ma5fNiDQ
	 6rwy7/gCFHm97++7hOrWj/5ko3k8vglYIcLnGn61aVc5yaPQ6+wME8FNXAEt3/wmRxVcR
	 KL8cbi2pQ+LjKaJCgwOKxm8XECAQPHKZzTOogRNv+YUT50uIMw39eJkQ/t1xU78eDmOJ5
	 VpziXeCACxbGNhT7vVUYkL4J33CRfgS6t3BgLFyAzdA3soU97LmwkGxFygrSKBKgHlA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794525841;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=drls+PXlcGZoLfnoPObObwbc1/HPzgky5rGb/FCeY3w=;
	b=h1Y7BqoywNn6uaUsEqcDom46gU10jewk8sRXIWAlmNjsM94B0Xjv0iUWmoGXu+4q1Pim
	 +BALGEHHkHElvUIsRdSPATyFMnxiYvRIAkNy6UpfD2BKR2G1QLdTsfQQO8UytOVuAOuWe
	 XA2zTXJGdyAlimImTcwuVCRpTKW9oGOmG0YP1FZFIGP93R9yqBemhRksg3c48mJ7VCGbT
	 1BRcmCXIjr/u5fyZDJpzLipjwIMJI6JY2ZsevkXzGXlP+t5uN+pYmXejnz7No2ohxHaI1
	 8rC42Ftpnqgf6aq0OW6FQ24a2TXAeMlN7cHILCyyV1ZPbNosYUlErP/yoCl8YkYmqIg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=ausil.us;
	spf=pass smtp.mailfrom=gilmore.net.au;
	dkim=pass header.d=ausil.us header.i=@ausil.us header.a=rsa-sha256 header.s=google header.b=focqTQf7;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.222.180
Received: from mail-qk1-f180.google.com (mail-qk1-f180.google.com [209.85.222.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40802606A327
	for <linux-sound@vger.kernel.org>; Thu, 12 Nov 2026 23:24:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 40802606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ausil.us
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gilmore.net.au
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ausil.us header.i=@ausil.us header.a=rsa-sha256 header.s=google header.b=focqTQf7
Received: by mail-qk1-f180.google.com with SMTP id af79cd13be357-93e6eb77f0bso46360285a.3
        for <linux-sound@vger.kernel.org>; Thu, 12 Nov 2026 15:24:01 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794525840; cv=none;
        d=google.com; s=arc-20260327;
        b=GlDRKG7ygq9l3eRLgoLC/68qt1K6JRxYhWQymjlM//k5lSCBO3ngPaDlDbs522SFOb
         UQGrMBTLl2hmdd0gse2Zx5yIFiLSUif1LCeAlTYfrHIjFEFGSkK6bZG8GCKMTfu4rzwf
         E2dfAfuMlvGJACmNCrpDrWDE4pQEb4goG5yC/Jk1K+9kKZ8ippJLMnjA4TQdY8kn05hi
         kMIC1Y3fE4rqpq4A0N6wLVqJVSFbxXCJme9146+gIWENeYO7ynkD0GLXAwbgXQ8oapMW
         qOVkAiZrL0tnwjDlY1iQkNyEX9V1PqIjLN8cvPqvU7YHpcTwZSt1DMcHcxKELfb4JrWx
         NulA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=drls+PXlcGZoLfnoPObObwbc1/HPzgky5rGb/FCeY3w=;
        fh=OQPLY/F62930Xuuo+KMAZKEWiEkJBI3QqQpLmooyIu0=;
        b=SPwyauNVh1d7yS2M8WRPeFVbtO1lgANgdJitYNtc1FkG3TmAe9PpMPF39ovFEsTYwB
         n+JccoZjxyoIPGzIbYPL4aHpbn38fzFMw1Lv+EksOu7lpLjp3oT26MoDbO9HsiYzGTEB
         l9I4tvokYT23rvLCt+631tCjCyqAhXdmfRyM3sQc4TO4LdnRxWVOQ8QM+ARLoe0FCFJn
         RH7G+cT9H3F93WOKO2Rbuvjcxqg7uzaF48U7gjpWSFUvwJw9/Wtx+jHF3q4eN87/FWps
         Ga8pMuowPHqcJe3VIwSu9TTWhjI5K+UaAj20XTDp66Ez1+7c3gPXSWHUwG9skivnsD/p
         QZQw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ausil.us; s=google; t=1794525840; x=1795130640; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=drls+PXlcGZoLfnoPObObwbc1/HPzgky5rGb/FCeY3w=;
        b=focqTQf7naFVCGV/My2d+xpcLS+yKtintmrypuRzht8YS8h99AlJDL/3AsFgqMzzSq
         LiYGDn8kpDU+Vupp3Eklu4tet98WA+Gg98hsss9HKVRYsSKcuOWLgCqfGsfC9WtJjhFv
         LVwgrg9eok9OlzpqlzH2V2tb6xEKnyNGK9EIbw7aYhPvoo9CRZELkbf0uLrIc2cGVhxU
         6S4QL30WvyiEW8bbRF9PJYgUnokd8ZbLUVvW9iSO395H8jdjvkvbCelBuukjOeNCOIvm
         Fgkyz48jdUU8emc2E0zd2TfHJq+ABdg8by9UYtuG/i481sA94eZ4XT8IFqFFLbKcla+Y
         4srQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794525840; x=1795130640;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=drls+PXlcGZoLfnoPObObwbc1/HPzgky5rGb/FCeY3w=;
        b=HrH7Gs9cY9OUorSaYiHvDdXt1UPdwIs7Hjpad/S5IYlpYSic3zbixqvjH1z2ShTi/x
         YMg9D7KXq8H2nHdtvPsg+GOJv85A3J5lDM0kbJvI9j4GnBl07nbF7KfoOuE8FXWL/sWe
         aOHLD3ieefDP6yp0tkp+UUHjH7JmFerwfef84GfwWWZ0JYHyYsexluF5mvvDyeza6MHf
         0+DVOZTxNi5LdedXed0qdCUrzRPCrUTgWLIS/5aMvKWuuDkmElyzeQ/5oAWpK6DOUEUs
         MCW8l4fWIbKC7igeDmPlI/4Rk+/X/o4ULCcICGYFriSz3Lm5pHzcPjT+10fIykBwCuvN
         qJFw==
X-Forwarded-Encrypted: i=1; AL+hErGIHIcz5hIyASz7gD8yx4NrJwMkgdFSl+ZoB9W+K3lz7EBFTF5iEokoPrBMFpH3HsoHcQZzJO3jxarwDQ==@vger.kernel.org
X-Gm-Message-State: APuU4Z/dCbr0GuxHRgobFkraSSo+GYyZ4rw0brYZO1kYrG58/XeDn1I5
	njNaxeNAouyWfFaiMdfQIq9ZxKLHYFXchVG7+w6IkFhhnute/ZWpSye0vzYatz1iiZHIwNNiC5L
	KJQS8uDH7c4UqWPxnQxUeZyC7Ahxl1BvMMPQU9vhuRA==
X-Gm-Gg: AYBFou2ClnTLggw7CnYaxA1Ryn4b9JXesIbZ36yxQ2B3nU+J1DSITxHtmlMGPsUbSgx
	5m8o9xI0+TbdtV5lUC/SUPSGCa+a7In++ax3PKeYGgSLBRYQRu/Ecww8eXZUcUO4Q5rBRX5f3nj
	jjsfhrhm3qVerqQOU30zCQjh3URgD5PlvxZ5kRu3JaHOdkN57QVBX7AqJriyXcsrOlTJigVg86L
	O6CcKkrpZHXiUNVVuzjcRc1rSnXA6t3m5VHx0OfjtwL9U9a+Y6HysBgKCFR+/bYyRzpTnPkaADj
	p2wjAtwBPiBsEmpbWEOkf6eqrWtBLEqlceN3lm3pKWg98Q/skjPomspxlmj9JiBTkpYyZk8Pfs/
	wkLFlyuieLKciZaYTCPBCbr+f7fX3qNHcJt1ADpsW7AGhP4nZF05MGcQnSh/rFAfbx6zCw8lZam
	s1Mk6+harKf6+kuAfdwm7IZzxS
X-Received: by 2002:a05:620a:371b:b0:93f:43a4:a48c with SMTP id
 af79cd13be357-9494bc3a400mr175911185a.45.1794525840268; Thu, 12 Nov 2026
 15:24:00 -0800 (PST)
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Post: <mailto:linux-sound@vger.kernel.org>
List-Help: <mailto:linux-sound+help@vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-sound+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261112025252.71375-1-dennis@ausil.us> <179448342405.66517.5463730214277229760.b4-review@b4>
In-Reply-To: <179448342405.66517.5463730214277229760.b4-review@b4>
From: Dennis Gilmore <dennis@ausil.us>
Date: Thu, 12 Nov 2026 17:23:47 -0600
X-Gm-Features: AclHuK84GnsbCUnbGFWAfzcRIsf9sLCdYOCcLTFaLBRnNzS4e4KBe3sc65us-XE
Message-ID: <CAABkxwsn9bkx37C1oEuMC1o+5Jtf+EnJgw5o7pso8hGxxJx34w@mail.gmail.com>
Subject: Re: [PATCH] ASoC: soc-core: start rtd->num_components at zero
To: Mark Brown <broonie@kernel.org>
Cc: lgirdwood@gmail.com, perex@perex.cz, tiwai@suse.com, kees@kernel.org, 
	gustavoars@kernel.org, linux-sound@vger.kernel.org, 
	linux-hardening@vger.kernel.org, linux-kernel@vger.kernel.org, 
	michael.hennerich@analog.com, nuno.sa@analog.com, dlechner@baylibre.com, 
	linux-spi@vger.kernel.org, miriam.rachel.korenblit@intel.com, 
	linux-wireless@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 12, 2026 at 5:37=E2=80=AFAM Mark Brown <broonie@kernel.org> wro=
te:
>
> > Since the conversion to devm_kzalloc_flex(), the allocator sets the
> > __counted_by() counter num_components to the allocated length
> > (num_cpus + num_codecs + num_platforms). This only happens when the
> > compiler supports __builtin_counted_by_ref() (GCC 16 here). With
> > older compilers the counter stays zero, as before.
>
> This doesn't apply against current code, I think this is an issue that
> was already fixed.  Please check and resend if it's still needed.

Looks like it was already fixed in
https://lore.kernel.org/all/20261109102536.357134-1-ghidoliemanuele@gmail.c=
om/
I missed that when looking.

> --
> Mark Brown <broonie@kernel.org>
