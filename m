Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794909405;
	b=Qk8xvDwIV+0KWwodrhVe8RrN6yULHBO+Zn7T9x9cls90jbKtgX1yEfSG/hA0aQQ08NVf
	 /zfuaupIvoBn0KQS04UHFGq4hHReyeBabP+Dixxrfjp1aXIVjNH6PYBI1F8Qx4pXchk1t
	 eKgskWE4Uxo6enhgDvHwQpW+hXCqJJE7miKuPOLBowbJgruJJ09E+twewYRzQmzFuNtpO
	 FQ9Sgp8x0lxkUzXeAjs+kwt5HhOmLkEdNppvkV4xsvguPLo7lYx7UPQywO7Eo8Kmpjcln
	 q97PQmV8QoCAnVUekcRH6l29uhuxy1j4XxW4pcx6/EtOaCxufzlMHQ/5GT7JEHuq0mg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794909405;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=uzJ7zdzUB3cdGIuk2i9Y+NNhABXVFT8DILTBgFlRwyA=;
	b=oM+1Trhw+wrkaEd7ykWgxZ9gzbNqdjDNOBrGT3X1TtE3sja1yOo8MEEOHI4wevkRSbW8
	 scyTAFEkv9UdXF8bbkzeSRPeplJp4vGf4LZ2/0dDOPs5RcU8aFr9ZAopXOicHHc/vcxIl
	 fPqTHgnbCGbwV6a9Kke+Hq7tvaJkJWngfb31jZ4Rf+3Z9sMN+q8sQxI470PEENvdGM54e
	 a/dSjjt4eKBWjIZxxrcrYe3mclAUOmjAa+ILgu1NIRR8ewIeQFhaxBr1TBmBOdtV/KpZV
	 S1uCF+vxudJnh23419Ygu0xMLdXeC6CD+AJt3TWZUE5pXehNtAhHHj2l8ANwJWhma2Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=nMsTG+Xm;
	arc=none smtp.remote-ip=209.85.216.48
Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3D27606A323
	for <linux-sound@vger.kernel.org>; Tue, 17 Nov 2026 09:56:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D3D27606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=nMsTG+Xm
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-3ae1da332bcso1498264a91.2
        for <linux-sound@vger.kernel.org>; Tue, 17 Nov 2026 01:56:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794909404; x=1795514204; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=uzJ7zdzUB3cdGIuk2i9Y+NNhABXVFT8DILTBgFlRwyA=;
        b=nMsTG+XmerQhGlQnp0vHT8btzgQIbwUp3Rw5mEQHvhwvaWn/s23nUpFRaZtgySEUed
         pVeZup08T1ee7EhJPsiC5GvMzI+ceZtR8wa8mkaobHQkt7bitoVgYZ4qsQ0Ok0PYMzCm
         dHADgOGDzpi1zp/yZU9Sn0kHEYkwyLfHjcGlN22u7lFxDuc3PJMidTUUE/DqOXofdfB4
         Jbp1/z4N729Kh+mDUK8EveWG9xyULBbE1dg26d0x++yRKUK63PufGQ40/annughbpp11
         UeATTFGxHHKaVhAl5ncHn69XLdY1iLje9fvtWVLEuzy+PP6wZuu3HddXTwPZQorQThE5
         LlXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794909404; x=1795514204;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=uzJ7zdzUB3cdGIuk2i9Y+NNhABXVFT8DILTBgFlRwyA=;
        b=0xN11oULy6OtVHvjgB3tDUYvlgKkul8W7gMGFBjNfMTQCWCPy9Bn+jYOc4lrZ+/W41
         H3z3Car9LY0RDNmN7A9RvCluZRN3KQJbY4zmz9wnPYYAzasvwNwwcV0dBr7tZv1I6CT3
         ZNmH43/3alyaHSuTlrhZrmFPLzmo9tfllFP3DgHbbAW3vCi7h++m+zBk/uHP9mabapJN
         gUrsoVtSgKgRJ5YFXe/c2XjrT28xTaSsA0wsMVboSymH4Fr8DUWbKDkwVbyJMirRkqIg
         6xa1W2HFk+jWkwu+EKcX8DfOAJ5ZdK2ks9sAVcmYxp8K6rq/rL55ROZINuohga44p6UV
         XDGw==
X-Forwarded-Encrypted: i=1; AL+hErFC+2ECrcCNpbCwfr9VzmwXnty1hfyc+He9qQMjCgZGt3xqvR7tHbPhzDXL4gNdl6o6ewbFtMBOk5N1vg==@vger.kernel.org
X-Gm-Message-State: APuU4Z+coEW3F9fWdkhWzvrZgapHYxwiY6keVPs/fZW/y1KhOFkUoBsE
	l78EDXl0VewkN6msrpoolDgZObMIiKH6j4IexrFqTTt8S36GsamolZPY
X-Gm-Gg: AZFdTZdH/dKCbu3Ri3JlzDQN/uMf64GUFUHN87JjkGBS624WJCQBkhY5vvJL5lAaeVC
	PusjC9na2HQf3IUaitYkzbj4kD8Nxf9KaXkwWzGapKpEQwoHFGY3whI/GX0dI66bHozFpJo13L5
	p064ekdMm5DU/tVpl8/xONJrIurfdAZz+vEQQSqkuQR436Qh+BhEwx0F/rGkl05FDunfv9PC5Ch
	39tdSjPp3+hDZuoe+a9m40/iqmrrxWCgFr05vjyKP6KZGrfmQ6x1qsjUtCzhSqyOJvBEwtdU0W+
	GIdhmbtiBLRHWA7IVqglOqdg5kMqawFNScofwUwJuHjpMN0rGDmZNg+fmGgyZ10+smnHLN+GKV8
	P4KMz5s6TxCyqKRDEoaCRf5Xj05r6p4DECTedMTBAFIApHgDWgt5cQTuX2QlLsx3FEvjjUCW3aU
	xSNvpRkjwGFc7baIqR18CVOJJNc6OTGpAIou5QbGz/fOMj7HcMJdzQpjXCu3PbEXtChnaFKlWaB
	Sl/+XeaHtzroYR84iuFT9R2vouMOMYN5DPGg9CwQN4C5oCuy6Pn69clPHG9dY0dWTj094NMOBR3
	sE+qdZPxam6e58bkzZ9KNPmC0tStw6tCWsRiwbl1MGhjNQoHLqwFW8IXCW+v
X-Received: by 2002:a17:90b:17c7:b0:3ab:884b:65ab with SMTP id 98e67ed59e1d1-3b1b0ba4fd8mr14060000a91.55.1794909404192;
        Tue, 17 Nov 2026 01:56:44 -0800 (PST)
Received: from [172.20.10.2] (42-79-72-63.emome-ip.hinet.net. [42.79.72.63])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b1b39d73c9sm11164505a91.2.2026.11.17.01.56.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 Nov 2026 01:56:43 -0800 (PST)
Message-ID: <5c4ec348-e0cf-4f4e-958a-f0c86296bf83@gmail.com>
Date: Tue, 17 Nov 2026 17:54:23 +0800
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
Subject: Re: [PATCH v2 2/2] ASoC: codecs: nau8310: Add support for NAU83G10
 amplifier
To: Krzysztof Kozlowski <krzk@kernel.org>, Neo Chang <YLCHANG2@nuvoton.com>
Cc: broonie@kernel.org, lgirdwood@gmail.com, perex@perex.cz, robh@kernel.org,
 krzk+dt@kernel.org, linux-sound@vger.kernel.org, devicetree@vger.kernel.org,
 alsa-devel@alsa-project.org, kchsu0@nuvoton.com, sjlin0@nuvoton.com,
 lkp@intel.com
References: <20261109051251.471879-1-YLCHANG2@nuvoton.com>
 <20261109051251.471879-3-YLCHANG2@nuvoton.com>
 <20261109-myna-of-noble-downpour-e09d3e@quoll>
 <6d7f4ecd-bac0-44d6-a704-57cdd2877729@gmail.com>
 <9078a957-c183-42cb-84a8-0f15661fd23d@kernel.org>
Content-Language: en-US
From: YLCHANG2 <neo.chang70@gmail.com>
In-Reply-To: <9078a957-c183-42cb-84a8-0f15661fd23d@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


On 11/17/26 17:28, Krzysztof Kozlowski wrote:
> On 17/11/2026 04:38, YLCHANG2 wrote:
>>>> +static void nau8310_i2c_remove(struct i2c_client *client)
>>>> +{
>>>> +	struct nau8310 *nau8310 = i2c_get_clientdata(client);
>>>> +
>>>> +	cancel_work_sync(&nau8310->load_fw_work);
>>> This looks safe, but still error-prone and discouraged. Use same order
>>> of cleanup as order of init/allocation in probe.
>>>
>>> See also include/linux/devm-helpers.h
>> Got it. I will use devm_work_autocancel() in probe instead of manual
>> cancellation in remove().
> To clarify: use reversed order of the cleanup, obviously, to match the
> probe in a reversed way.
>
> Best regards,
> Krzysztof
Hi Krzysztof,

Thanks for the reminder. I will adjust the initialization order in probe()
so that devm_work_autocancel() is registered after the regmap 
initialization.
This ensures the cleanup follows in the proper reverse order.

Best regards,
Neo
