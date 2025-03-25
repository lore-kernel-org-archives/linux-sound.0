Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D350269AF4
	for <linux-sound@vger.kernel.org>; Tue, 25 Mar 2025 21:39:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742938749; cv=none; b=Egh4MTfnbe71uLiM/6xU7r35nL78mX9n16u4r6N6NS+0UGSnbk56WnxCeWmyTE9RZuU8SmQa0UA2ADPbWEx1QOA6Kc3O/PyFNodEEobppEyZXW10X33VApN3nKDg9AakqvHhfSzUn3aidwlWal/GdQOJmyjIqKz3jzYVO0iD0ko=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742938749; c=relaxed/simple;
	bh=/Av7Cs+KayrhjqQVeFvAhc1FGTigGOhOF01svNTvIus=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=fTorhO/U07AttzXSP6rcV2aL6R8n1oUD5ilwQvDAczundfns+NyrcaouvjBh0MCn3VxjeOE2+01JHPYmz4d8P/BqZvlMC3j3na8i/sxB8PmUzjF4YLxwbmgu4S8H6EqqaA6p/LIvzU0ceot1iu8YzeVdxuk9ak3G8nXrqlXt3U8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=QrY6guO4; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="QrY6guO4"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-43cec5cd73bso39230145e9.3
        for <linux-sound@vger.kernel.org>; Tue, 25 Mar 2025 14:39:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1742938745; x=1743543545; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=xnMQy1sIVhjqG8H+P2Ah/U7DzsWvzK3schCpJEGDS6w=;
        b=QrY6guO4MSCbhtUAsvnLTopZBN1hnxhvumdYrSzzhufCRIld1u4Kfeqy6uLt10OewQ
         TPYAl3cQ16TAsE2qxnmpMb/aZDbBDMW0K1V7AFkvgjDSBmHMqPbulTcXck6UI4YeiyuF
         fInFIWgAHwdidLH83pEU7sht+PCrC20dNuQ9U4hOdi8fH6cm1Lo2VjoUIsEg/3LJdhcH
         ocDM6MGsUJjAO8n1k4H/xU0e6ymGApVRs+oQQ1hRsuoYkQ+XA23C119iGk9BuRYcfQ3A
         KwW0dhtfnlYSJ2bH6jQUlocQvCTRKF35qdUkODREzNdcvqMfsWhZQYl8Qp3chcb4baKU
         zsPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742938745; x=1743543545;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=xnMQy1sIVhjqG8H+P2Ah/U7DzsWvzK3schCpJEGDS6w=;
        b=jKEd5A6/hNLRaO4Liv7QzGTGG1w0dO2GS0qh+jFN+lXWr+6iI1p5pJjSYu2AzvJ5hr
         kl/p/vk7ZHUsI7Sl+KoKgb3CIEaqBqKxWe/w2fqc4A+KInrbTmSfTMcOj4k8w0n6/6kI
         pp/wRdUe1whXT5Ih02pKwwpE7rfmTYhA4wCS0i2VQMYAJC6SRN7gFdmjyYS3/0ALveVw
         YFBjLJrCAB9aLfkzq/+pLK+00PN6BNSBFS3+18HtEkK3oPLgiylWncFti3m62kfvRloq
         YLhi236ewpeNEBEmrjQhtXbpeQtEEZ+YuMBpLLXQVkI+nWaRsuJJ9Elo3BLSeoOKa/mN
         9fCg==
X-Forwarded-Encrypted: i=1; AJvYcCVMQ0JGZ/nNF94/y461xo/fiAE/V4hsmtK2OXfsiz32vnCuv16HRBsIUBNZiEW0NtznJjXuGMcCjkPrWQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw2xyGjks7mbm5ebXdTUitPgMaJh2wBtwG0v55jFqSpNrCG8lOI
	I/MiWxRZsQePJ934T8szLJlTa3rsv1Naf0TQpUIAyqJoMoEOVKF5brtuZpakx20=
X-Gm-Gg: ASbGncsUpg6r/3dmayQzT3uyZOBO/lG5ae0S3VWadS8QMveY7T9zaft0lJfVHZOULmq
	D8nZHLOE6Fuk79CJKeu45dTUjnh+cbP73A5qEzTHTf6boaXqS/D6LeEMkWi0muZVYVi7fgfS2e0
	2YuQ1MI7WKdqqrltXKi3+QC2VYTY2/gDL8BIP15R0txZjTfXP5odGrwLC65ZDsiPw/FomyUlbTb
	Fp2cxsL9Hw7K5EjLHJGjlUwA8hpL/J9SnQdKC/Nhwd4beLf1lKaYHvrXH69a2rAV46UcdS0iJb+
	LtZanAKhPxIBDNjUsjVeRBYvR5j0UqxD4mgkSgHMspSWZpqPjbk/RJZrTKLCyvY=
X-Google-Smtp-Source: AGHT+IEyyd8PC7FCDHlQIj4U+vOvGRq0sCf16YMi7BW8ixBJXbdk2VE9H7MgdgqHwWDw9UD6p4dY2Q==
X-Received: by 2002:a05:600c:1ca4:b0:43c:ec28:d301 with SMTP id 5b1f17b1804b1-43d50a3c7b5mr147764445e9.26.1742938745377;
        Tue, 25 Mar 2025 14:39:05 -0700 (PDT)
Received: from [192.168.68.117] ([5.133.47.210])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-43d43f332cfsm216861645e9.6.2025.03.25.14.39.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 25 Mar 2025 14:39:04 -0700 (PDT)
Message-ID: <b993c7a4-ff3e-4e79-bde8-2b5bdf3f2fff@linaro.org>
Date: Tue, 25 Mar 2025 21:39:04 +0000
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 5/6] ASoC: codecs: wcd938x: add mux control support for
 hp audio mux
To: Peter Rosin <peda@axentia.se>,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: broonie@kernel.org, andersson@kernel.org, krzk+dt@kernel.org,
 ivprusov@salutedevices.com, luca.ceresoli@bootlin.com,
 zhoubinbin@loongson.cn, paulha@opensource.cirrus.com, lgirdwood@gmail.com,
 robh@kernel.org, conor+dt@kernel.org, konradybcio@kernel.org,
 perex@perex.cz, tiwai@suse.com, linux-sound@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, johan+linaro@kernel.org,
 Christopher Obbard <christopher.obbard@linaro.org>
References: <20250325114058.12083-1-srinivas.kandagatla@linaro.org>
 <20250325114058.12083-6-srinivas.kandagatla@linaro.org>
 <vmhrs62ygu2xozcabc6tgy37ta5qskeyks5j3ldponzfijicl4@nudcmxonq7qj>
 <4654f21b-bf61-4b41-b073-407fab4bff6a@linaro.org>
 <14b7f2cb-6f40-f8b8-b3de-fe99080e6e40@axentia.se>
Content-Language: en-US
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
In-Reply-To: <14b7f2cb-6f40-f8b8-b3de-fe99080e6e40@axentia.se>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Thanks Peter,

On 25/03/2025 20:13, Peter Rosin wrote:
> Hi!
> 
> 2025-03-25 at 19:04, Srinivas Kandagatla wrote:
>> I wish we could be taken care in mux-core or even in the deselect api
> 
> It is not easily done. A mux is a shared resource. How can the mux core
> know if it is consumer A or consumer B that deselects the mux if both
> ignore failures when calling select? Mux select is backed by a semaphore
> and there is no guarantee that a consumer selects/deselects from the
> same thread or anything like that. The onus is on the consumer to get
> this right and only deselect when select is successful.

Should deselect fail if there was no previous mux selected?

> 
> I believe the documentation is clear on this topic: "do not call
> mux_control_deselect() if mux_control_select() fails".

True, the documentation is pretty clear about this behavior.
> 
> One thing can be done from the mux core, and that is to provide a new
> API where consumers get a mux that is exclusive so that the consumer
> can call select/deselect without involving a lock in the core. There
> need not even be a requirement to call deselect between selects in that
> case. Such an API is what many consumers want, I think, but it is of
> course not really compatible with the existing API, which is totally
> focused on the need to share a mux among multiple consumers.
> 
exclusive apis would simplify the consumer side of code for sure.

> And, of course, someone has to do it.

Yes, I can give it a go and see how it will turn out.

--srini
> 
> Cheers,
> Peter
