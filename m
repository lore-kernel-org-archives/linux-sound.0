Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0440630DEC9
	for <linux-sound@vger.kernel.org>; Fri, 12 Sep 2025 14:03:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757685799; cv=none; b=LGPYmAxm3gMbkZW6StSV52oZHoZDy6/IyMvkQC0jXGgNrvOQJ59WRD3bq8tKahoB/YkgWUQ/H2sI6QB69xHMCDQMKjC90BvgmU2FaNpopr+hz2P9kxeb/ij6hjAiGnYbt8vUN/ff5ojFDXe1c7+9Bd3AKJF0JV/I90uqJL8D4vE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757685799; c=relaxed/simple;
	bh=aAY1g8zOPqBn5miZfFbCjKlL6xfEQPFSG95Zowlpqzg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=aqs78687O1G3k9+DHM+sA08QIZKpsRbBs9uQnZjmvPOBktnmpeTMSJqJgpfrL960F2nHizhlelhA2DDdRfvjVnp/ao0rDTTs/sfFoKWc+ShS971mxgmKLleyzlmXWziXaSflNq6O7IP4hCH6KXTVLUjNgCQcFIxb2m5gzAH+Tu0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=joRavizD; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="joRavizD"
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-3c68ac7e18aso1322686f8f.2
        for <linux-sound@vger.kernel.org>; Fri, 12 Sep 2025 07:03:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757685795; x=1758290595; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=uH+YHXFVH2K1mzrQAHIZiTdd0wND2UdYXw5OhP6ad/I=;
        b=joRavizDgeqwMPy2GO941dAZlnGDdgRFCcQAhvfu2jv8w7yf/aXrXuDdGSuNACmW7Y
         gB+0fQTN4KAsXe9t3n4U+FNJWhQRsRElye6MB21w7YIztFYBDdJqe5IrHdnWT+4pqKSh
         x2nZWF8ZFh3+trITdOudXMlhPEgPmSkCGPO+1syKjs8PEjB7JYvgSjIlS71wadFYaH4/
         Tp7Vj6Y7jPVCclyvCoO6F5BZUPO7uXTeAKtL2I7bDhb6fIzuVfqp/XXt/fipVI2BCHI0
         jiJ/20AWbgFs6Y8m/eBuu+Wgrhc6pORzGXZjs90vHOmWPx7s/26nhVTDshQrNjZsYra3
         4Gxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757685795; x=1758290595;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uH+YHXFVH2K1mzrQAHIZiTdd0wND2UdYXw5OhP6ad/I=;
        b=YHhOVNWKStM6AeeD1yhPLF3Hw1+bsudJku2cjAFyAFpS6p4G4v/xjOaatcBiRvINea
         YLpHnzmx+CC57cnDq5DE34IRRbiLtSZ3Xjz82vYWk7dJ8jAy0/RoNsmqL6zjxp8ydgnT
         bFy5rJPtmqAWOkV+ZjERKOaHALeAcFi+T7Oku6SVY4nRaC95sn/ZI1toBZW7yhd5zQJX
         ULbbFigDxdYD5NoxAMLSA/wX8TsIN30PF+Tl8K6WplgtgiKSV7CowS3qCR6Kb33e1Q9W
         LMJTwxE3Lj+d9M/clkGH5wmr8fJ8pV/iv5SAPueVBc30xKRzARAGTGZWiR/c8l31p+Ob
         0wSA==
X-Forwarded-Encrypted: i=1; AJvYcCU1hU1I/W+ukVK5ofRBPlw7jluPNIsqO8B46VuH6G6jiCpG65p2sJO6hmBZ6YZodSi3cnK2YGFBga+bUg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx68Nv9VdZfx2+ZFE+Re0Sx9jzsDV65Z+mUL8vR6VqOcVTYRt+s
	QUe63YxpZrds/edbmTl71Ua+JS+g1dDrFftm/rG7gzckNXuY2f2NXXxu
X-Gm-Gg: ASbGncuYmvO71Tqrv4AsDBqqKHQU3zBC/oBlIchZmMlmYFz5i/nYRP03cm43qyTnppQ
	nfAY6F6iW4gO+mPnEKOrSmmSsaAUiE0F6L9ziljLydpNVXeMwKQdFd4R7QAOEBI3VO2o9crzK4e
	eLHQn2zHCtZjA8MZGpmpEi/TqTVvij6mbT6S+3pxK/eWvAkg+rFpbjzT5rG3T4gY2Tqnhstg8D8
	AZ4Ai8HsRWxi6xi0Rq6y/WQYjCwGXCYbmOgXvnUun3s+bK8J5PBRooKWfFZ0S0GUoYymADdUUo2
	YCCux2Fmkgg0YqK2wgQlcOCI7jxUQkVkupcoSmDys0D/dxwzNSHK9dBHBN3YuRradTuRP+l2UuF
	6JJ7W2TGxrwreGR987r+ySdRx48x4vigFYhdWWFhXwBPNY64JpwBb
X-Google-Smtp-Source: AGHT+IHkpXgL67su2eP0NWVxDv0gnk9lbCDXLQlAVKtF0IvH2Kl70osZH/zbwKbUjcuxvdmzPdw9Pw==
X-Received: by 2002:a05:6000:61e:b0:3e7:4414:794b with SMTP id ffacd0b85a97d-3e765a018a5mr2537897f8f.50.1757685794754;
        Fri, 12 Sep 2025 07:03:14 -0700 (PDT)
Received: from [192.168.2.177] ([91.116.220.47])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3e774a3fb5bsm2033837f8f.58.2025.09.12.07.03.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 12 Sep 2025 07:03:13 -0700 (PDT)
Message-ID: <7765f224-60b2-4c92-a597-58c1c6bc5580@gmail.com>
Date: Fri, 12 Sep 2025 16:03:08 +0200
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 19/38] arm64: dts: mediatek: mt6795: Add mediatek,infracfg
 to iommu node
To: Fei Shao <fshao@chromium.org>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: linux-mediatek@lists.infradead.org, robh@kernel.org,
 daniel.lezcano@linaro.org, mwalle@kernel.org, devicetree@vger.kernel.org,
 linus.walleij@linaro.org, linux-remoteproc@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 olivia.wen@mediatek.com, shane.chien@mediatek.com,
 linux-gpio@vger.kernel.org, linux-phy@lists.infradead.org,
 airlied@gmail.com, simona@ffwll.ch, herbert@gondor.apana.org.au,
 jassisinghbrar@gmail.com, jiaxin.yu@mediatek.com, andy.teng@mediatek.com,
 chunfeng.yun@mediatek.com, jieyy.yang@mediatek.com, chunkuang.hu@kernel.org,
 conor+dt@kernel.org, jitao.shi@mediatek.com, p.zabel@pengutronix.de,
 arnd@arndb.de, kishon@kernel.org, kyrie.wu@mediatek.corp-partner.google.com,
 maarten.lankhorst@linux.intel.com, tinghan.shen@mediatek.com,
 mripard@kernel.org, ck.hu@mediatek.com, broonie@kernel.org,
 eugen.hristev@linaro.org, houlong.wei@mediatek.com, tglx@linutronix.de,
 mchehab@kernel.org, linux-arm-kernel@lists.infradead.org,
 granquet@baylibre.com, sam.shih@mediatek.com, mathieu.poirier@linaro.org,
 fparent@baylibre.com, andersson@kernel.org, sean.wang@kernel.org,
 linux-sound@vger.kernel.org, lgirdwood@gmail.com, vkoul@kernel.org,
 linux-crypto@vger.kernel.org, tzimmermann@suse.de, atenart@kernel.org,
 krzk+dt@kernel.org, linux-media@vger.kernel.org, davem@davemloft.net
References: <20250724083914.61351-1-angelogioacchino.delregno@collabora.com>
 <20250724083914.61351-20-angelogioacchino.delregno@collabora.com>
 <CAC=S1nguRWyG3ubmSFE95_zgsCjjq4dxGWr5ErV9-Yu2+mTmpw@mail.gmail.com>
Content-Language: en-US, ca-ES, es-ES
From: Matthias Brugger <matthias.bgg@gmail.com>
Autocrypt: addr=matthias.bgg@gmail.com; keydata=
 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
In-Reply-To: <CAC=S1nguRWyG3ubmSFE95_zgsCjjq4dxGWr5ErV9-Yu2+mTmpw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



On 25/07/2025 12:52, Fei Shao wrote:
> On Thu, Jul 24, 2025 at 5:49 PM AngeloGioacchino Del Regno
> <angelogioacchino.delregno@collabora.com> wrote:
>>
>> The "M4U" IOMMU requires a handle to the infracfg to switch to
>> the 4gb/pae addressing mode: add it.
>>
>> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> 
> Reviewed-by: Fei Shao <fshao@chromium.org>

Applied thanks

> 
>> ---
>>   arch/arm64/boot/dts/mediatek/mt6795.dtsi | 1 +
>>   1 file changed, 1 insertion(+)
>>
>> diff --git a/arch/arm64/boot/dts/mediatek/mt6795.dtsi b/arch/arm64/boot/dts/mediatek/mt6795.dtsi
>> index e5e269a660b1..38f65aad2802 100644
>> --- a/arch/arm64/boot/dts/mediatek/mt6795.dtsi
>> +++ b/arch/arm64/boot/dts/mediatek/mt6795.dtsi
>> @@ -427,6 +427,7 @@ iommu: iommu@10205000 {
>>                          clocks = <&infracfg CLK_INFRA_M4U>;
>>                          clock-names = "bclk";
>>                          interrupts = <GIC_SPI 146 IRQ_TYPE_LEVEL_LOW>;
>> +                       mediatek,infracfg = <&infracfg>;
>>                          mediatek,larbs = <&larb0 &larb1 &larb2 &larb3>;
>>                          power-domains = <&spm MT6795_POWER_DOMAIN_MM>;
>>                          #iommu-cells = <1>;
>> --
>> 2.50.1
>>
>>

