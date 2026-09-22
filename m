Received: from mail-pj2-f43.google.com (mail-pj2-f43.google.com [74.125.227.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C18530568B
	for <linux-sound@vger.kernel.org>; Tue, 22 Sep 2026 06:01:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790056917; cv=none; b=cQTR/Iz/554HvlPL+x11n+xwlBdwmcm7flbG7uGfK25MO/zkFpxACk2kUIYnMxHARtefXqPKODUG63LPmVl4iMBZdd/yMNL3i7I1MOxvvPsGHVh+wHkHed3Jhn+8ybBjZUwmPnwyZpwCA6yYEdIPNhJ33IwYlhV1jYmvaN/e7wY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790056917; c=relaxed/simple;
	bh=sDdKrJmvs5QWB2mO+IddhtMXz6qcKGamXBsMMe9RzFc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=DQDtawnFDpXpvrdOyP7xj+4ye4e5jPKbkn+dnYH1mATP/PnweLycgg5N2k68gln45BdH7UDbKFAlgz8+9zr1P+z9RmXPzAgfqGyVwpDVh7EKMOzv2x8XfMBmjASKSIUdRsImxDrill8qUiktbjfRjeKL9srgAjNDMCtU9zM3HUA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fhJnvQJA; arc=none smtp.client-ip=74.125.227.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fhJnvQJA"
Received: by mail-pj2-f43.google.com with SMTP id 98e67ed59e1d1-398a1676000so2915606a91.2
        for <linux-sound@vger.kernel.org>; Mon, 21 Sep 2026 23:01:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790056915; x=1790661715; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=37Eexq0zFYxGYgBaFUWATikMtDj/TkGR7YrZ6T7c8q8=;
        b=fhJnvQJAHSiVbBZJWpejnHZ15mqHkOwtCOlvpAqWhbklWNe3zVTwiV1Ir7jT0AB7RW
         eLb3xugrmsvbBlp7DewfrfmWqapmA68wJWuZjez4H1q7jKi42sWZ15aTXLk/WbY0sIQV
         /dE2fB02jlWZDMZTdBP/XZV7g8ZKNu3GBt9HZu5nUPdhIJJMqiMVf20QhHnXDg3qhYi7
         M3i5qWS6Q84F1/IrDe+hFmd9/agCA3sax0sCdcxMv5lj4vhjNEBnHb+pJfNqqFy9tF4A
         eOfmVm6QC7yO82giPpXtomNou0Ueui02s4oiAmrxOW49YFsEhaRjb4/BNmofWIoyZLzR
         BFDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790056915; x=1790661715;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=37Eexq0zFYxGYgBaFUWATikMtDj/TkGR7YrZ6T7c8q8=;
        b=gAr9zEy65qm4usdLouqKTQ3O976xORKR9I0FYq+qKlFIAxeX5zRcWh+5D10m700drY
         SQymHFG76mHSq3XifWcUBb8t9kT59eWb1j7snlynfBDZjIhOa8n4ksuOFONgOEn1CKqu
         LH6phDZn0paUE4eerbrAcnANqfu6ZyT0vpQEturVH6ctDohJU1tPbtgFzDLfNUPXay3K
         0RiJyOtbePZ2VCWn+JLgt58eGVpS27ltbiUoQuRMTKgD8xMpU/asvab7mQndKD9NGSFS
         D9gMmErppl2hVo4LbhmCU0pRKu/ab9U04mhqJkeomiXvFKQf9z5rRkDYQU7kF917sJbM
         ISjg==
X-Forwarded-Encrypted: i=1; AKwUvByuKZqoog+XQGU0Poocw9+HVnYOzzyR1yKgQJylMtrk4pmSjGVDbcr5kpcvECrSf5GWv0tnyI/RrO1l2Q==@vger.kernel.org
X-Gm-Message-State: AFuF++moiD+Zxe6OOl1vD+haugdHl9ZyKAn8DMSdZHgItuFwA4d9ATnu
	lzVyeNAsO9Jd4Gpi4NQMJq+x1wLoVayLsTiwASsoeBKTfDU/EFyZVhDC
X-Gm-Gg: AYBFou33hOf5D5oc2GI0cWCX1UEu27vW+4b5hozJ1lthSXsuSWj15FB4oPVklTImcJu
	Qk8BRgJJZcyl6W5FUK4asLV0iNhVdpn0PvR7lTe1UFXE8hSFHJQQza4Y3s8kWXPeLU7vnACqOCF
	lkOhd2aQncjb6J6SpdVTHLUtPwAHqqCBK/noUek/GdHiA+accTvdGdYCJO+J+mkSo2tI3hrp6du
	gnfKmK9uXICv2FlGKFjLLHS/ApfdCR/jEwqiUbvHCvUWMeLh9vQY1xvBobSx+aqbB00Ea+20UO+
	IzVsTguAt6B1E0g+GzdOBsHwpVFGm/OfzZ9uhuQco72wRccj/U7MLbyZQ3/J51IsN0MqRCLkGMx
	2W8fgj6Sj2fF6ll8Aj4eH3HpO2vK//L4SitUAhbkmrQToZ1+4d44iQib8PmnnN0fEn12Z69vn7z
	vKJO5x/LZ8vPnGvfl/DxxcsDSVxWS4FKjLKSTthQv/G5BCZBp+XOEVm6D4tyDbjAGuWWqomsTuB
	bDFlUP2r0MssSCDuCo=
X-Received: by 2002:a17:90b:558d:b0:39e:1ec8:ee7b with SMTP id 98e67ed59e1d1-3a07309f897mr123698a91.7.1790056915456;
        Mon, 21 Sep 2026 23:01:55 -0700 (PDT)
Received: from [10.25.133.25] ([165.85.205.162])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33e610e8439sm2788903eec.3.2026.09.21.23.01.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Sep 2026 23:01:54 -0700 (PDT)
Message-ID: <878dc90c-3a4c-45fb-bfbb-2ba802bfc14c@gmail.com>
Date: Tue, 22 Sep 2026 14:01:46 +0800
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RESEND PATCH v5 4/5] ASoC: fsl_asrc: expose individual DAIs per
 conversion path
To: shengjiu.wang@oss.nxp.com, lgirdwood@gmail.com, broonie@kernel.org,
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, Frank.Li@nxp.com,
 s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com,
 shawnguo@kernel.org, linux-sound@vger.kernel.org,
 devicetree@vger.kernel.org, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 shengjiu.wang@gmail.com, Xiubo.Lee@gmail.com, nicoleotsuka@gmail.com,
 perex@perex.cz, tiwai@suse.com, linuxppc-dev@lists.ozlabs.org
Cc: Shengjiu Wang <shengjiu.wang@nxp.com>
References: <20260922033428.1690822-1-shengjiu.wang@oss.nxp.com>
 <20260922033428.1690822-5-shengjiu.wang@oss.nxp.com>
Content-Language: en-US
From: Chancel Liu <chancel.liu@gmail.com>
In-Reply-To: <20260922033428.1690822-5-shengjiu.wang@oss.nxp.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 9/22/2026 11:34 AM, shengjiu.wang@oss.nxp.com wrote:
> From: Shengjiu Wang <shengjiu.wang@nxp.com>
> 
> The i.MX ASRC hardware supports three independent conversion pairs
> (A, B, C). The driver previously registered a single DAI with generic
> stream names "ASRC-Playback" and "ASRC-Capture", which prevents
> multiple independent conversion paths from being used simultaneously.
> 
> Replace the single fsl_asrc_dai instance with an array of three DAI
> drivers to allow up to three independent conversion paths to be active
> at the same time:
> 
>   asrc-0 -- ASRC-Playback / ASRC-Capture (backward compatible)
>   asrc-1 -- ASRC1-Playback / ASRC1-Capture
>   asrc-2 -- ASRC2-Playback / ASRC2-Capture
> 
> asrc-0 retains the original generic stream names to preserve backward
> compatibility with existing machine drivers and board configurations.
> Each DAI retains the same channel, rate and format capabilities as the
> original. Update the devm_snd_soc_register_component() call to register
> all three DAIs.
> 
> Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>

Reviewed-by: Chancel Liu <chancel.liu@gmail.com>

Regards,
Chancel Liu

