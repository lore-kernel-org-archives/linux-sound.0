Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.137.202.133
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795365916;
	b=0hTWNGrt0G8jKCnn5mzDuAHHsshKwO94CZe3NxMFC4qOMbEHCGPTgodr7h2nq/1Z1jJR
	 CPrF+r/c3zDOOKeqHDrCBVo/ikp3TvkWcdo7+/7lXwpBWJichK1FBJ1UUANiUzD5lzOp2
	 E3ZOiOMEm6ewsh/JqofN42QHvD/otn7qg9cBWDPb+OTuS/ddhD5G/bmdiYLcXlkXqQrTN
	 ZV1X33ojTbxyRrVI+CvWsEP2eFKUqac+b5qY2YPqmmM1RwAvnJkn3tAyPCCbsTtBhnrbR
	 jkr2kKoEXfiULU+BI3oDJSbssdsZWBsPbIomAC3h38keQYtciwFVapkzWT8rzg9x/xA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795365916;
	h=DMARC-Filter:DKIM-Signature:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding;
	bh=CRz1D33QZ0Q/LTUTY1Fyb+WdD7iUmbFhD/VOw8KoS/Y=;
	b=kbAD08e0Y2/2LIbu49ujez/E4QGEdhkrePnHU2VMnqIZ3oqOQMeb3zz6npn9ItJCREDZ
	 iffqfoh0Op3FUif2YsitmziqppvtnZ37ASrU4QV/ko0tmyqhcY5mi6XIu+4vPu7SopFMh
	 UiyV9cBxcrxr9CRa32W1LwVS/pDGb3bfePaiCksFXzXT67Y5T8Jd5j+G0K/M3tgjrKI+M
	 +jXktTn5k8FRHM+9V3TA0NXnPp+oGHH06i7UYe2p6SYabHQ19VbZnm8ruLm+m08TUCc3e
	 wEAOwOVfJX9DwWjFc4eEZKIskrKJsVUZqGAj6hfsgJLs51Y8xK8rV6Q2SnYrKMUMaGQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=infradead.org;
	spf=pass smtp.mailfrom=infradead.org;
	dkim=pass header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=YssTh1rB;
	arc=none smtp.remote-ip=198.137.202.133
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5D00606A32C;
	Sun, 22 Nov 2026 16:45:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E5D00606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=YssTh1rB
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Sender:Reply-To:Content-ID:Content-Description;
	bh=CRz1D33QZ0Q/LTUTY1Fyb+WdD7iUmbFhD/VOw8KoS/Y=; b=YssTh1rB3mh8de/WKUwfb1gkJk
	unJ+ieQbovW9LcQZB5PI+MZprDBkXr4p5hmNJEdZv08tAVDOXfn3HDp9f6sI4JuZe2/TM+uHSaxov
	31MyrX+lkmVQtmSjWheadNtq0ZcraFHt2v3U1S8lggvhiMMv3lOsSKiT+7jtGdIxxMPtCM40czk1+
	z+ui5JTjopdVojxOd05nhXmaFia97hlWvzuZsd8B3d6lg+xXM273hFaMeYqraD/pm4fci81ilGt/h
	U8EMoeRUjsaURmlRHHZ6v0GAAjhR/Pm7u3L9APDAnNrwCqRPWiqlqB6/wTEQK8WeGN0Nf+aFiicS7
	qcu4FE2w==;
Received: from [50.53.43.113] (helo=[192.168.254.34])
	by bombadil.infradead.org with esmtpsa (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVAgj-00000001NkY-16cZ;
	Sun, 22 Nov 2026 16:45:13 +0000
Message-ID: <326066b5-6198-402d-bd5f-e1dfb02b305e@infradead.org>
Date: Sun, 22 Nov 2026 08:45:12 -0800
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Post: <mailto:linux-sound@vger.kernel.org>
List-Help: <mailto:linux-sound+help@vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-sound+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4] ASoC: doc: Fix bracket
To: Manuel Ebner <manuelebnerli@mailbox.org>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>
Cc: linux-sound@vger.kernel.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20261122090640.1475222-2-manuelebnerli@mailbox.org>
Content-Language: en-US
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <20261122090640.1475222-2-manuelebnerli@mailbox.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 11/22/26 1:06 AM, Manuel Ebner wrote:
> Add missng  '};'.
> 
> Signed-off-by: Manuel Ebner <manuelebnerli@mailbox.org>

Acked-by: Randy Dunlap <rdunlap@infradead.org>

> ---
> [v4]
>  Instead of remove {, add };
> 
> [v3]
>  https://lore.kernel.org/all/20260916113524.304863-2-manuelebnerli@mailbox.org/
>  - removed the change of the placeholder
> 
> [v2]
>  https://lore.kernel.org/all/20260904120737.758809-2-manuelebnerli@mailbox.org/
>  - rearrange lines in diff
>  - fix commit message
> 
> [v1]
>  https://lore.kernel.org/all/20260902150510.706055-2-manuelebnerli@mailbox.org/
> ---
> ---
>  Documentation/sound/soc/dpcm.rst | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/Documentation/sound/soc/dpcm.rst b/Documentation/sound/soc/dpcm.rst
> index 7b6aeab3c2..3b145e8ba1 100644
> --- a/Documentation/sound/soc/dpcm.rst
> +++ b/Documentation/sound/soc/dpcm.rst
> @@ -370,6 +370,7 @@ The machine driver sets some additional parameters to the DAI link i.e.
>  		.num_c2c_params = 1,
>  	}
>  	< ... more DAI links here ... >
> +  };
>  
>  These parameters are used to configure the DAI hw_params() when DAPM detects a
>  valid path and then calls the PCM operations to start the link. DAPM will also

-- 
~Randy
