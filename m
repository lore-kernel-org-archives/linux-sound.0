Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 196FF1F8AD3;
	Wed,  8 Jan 2025 11:41:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736336470; cv=none; b=uUXkIIJYwLf2XZlFPjZrpE1DvivQulPu0SrUyQ0weH/CkvYDnkjPr2wFdIf5qg0tJQKXmUIJRM9atttV/Q97qJ/TNpzLkFlJo97ir55xTXHdCRjty4uhOlqbQZ4UUo9NpgUbhgl2iZO96KAkB3WV2/DgBtoHW0vfRNhZt4DGfZQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736336470; c=relaxed/simple;
	bh=CsEFc6QCURCqv6tzj9PnSyeNyyn2t4toianYtfHXa4Q=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=elo1h1l7DSCfxzup0UW8I3BhtarOOIlhdeWZuY9QZBx1Lcm3/Iumr5lTgyf38q7h/MLV7clhzzrB6j05pS8kOvxX3JFg6IbUpH27Z3o4y3B9BMo+kxP/JP/1ex+N0FlDsvOljkP0rqSmEEhwN5QXYiwS4W5ZhfqtZS1ssf8ACeI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ByF+elKm; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ByF+elKm"
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-3862a921123so11215575f8f.3;
        Wed, 08 Jan 2025 03:41:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736336467; x=1736941267; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=h6S/HfA2Jq7a1HhJuKKdJo8XxHgRM/1ZMu2JHAvQIhQ=;
        b=ByF+elKmEsCaL5YMcCJaMYWRDSriaOtB3zl7LiEG8dDW33C8x4AIC+Vj+8ycISb74X
         gYHAkJgZBUylTCNT+060lJaDjcfR8rFmsHiNr1GFTApLwGq0Wg6UVmhdGoDm/nOxi15+
         snhcfm9qhh6I8d+fOQ+hSSD1r35Xr44LQVhzk/0INVM8tkyguUxq/lpv0YEfm6/Jinx3
         J8ZXSwiW+hffs7w4G8Zq0LJD5C/MXOpy5c2g/Xr05Woc67vyfg6rChX4189AU+LqNNC5
         4BLWV+pNnL9DmQjF7v0tUIzVo42WhP21+bC9K2FiGDRlAfl6clEg9GfCnbDyhIyPRY1/
         Qolw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736336467; x=1736941267;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=h6S/HfA2Jq7a1HhJuKKdJo8XxHgRM/1ZMu2JHAvQIhQ=;
        b=OQ3A8rL7v7XMbINfnxuzjebOxJQu3g4Df4E7i9caBIJCLR+lJqd5oBhY2/3iogFxhS
         RM9rA3afjg3HEMq5EK0WaHsZbRHXieCFsG2ygfkri1p2RH+N9AaIS84RnEvsYPIMc17q
         xBjvdAxnjv2pdToiUXOs+La8w46Yz6ZftAavAbMLObBRbDOUPKLH0ECQ8yzSlD7v51jN
         G8J/9+viZ7JHv51p+rwz8vpNeIxbPgkgsRdyD04RYmnijPVbQfqd1La+z2PTiI6kL2pH
         E1U9MKH4bFME7/l/tMeITfLkQRS8koTOd/GXP9etT4+nnqCzFs7YqyLPni4FpDaJnI2b
         Fx8g==
X-Forwarded-Encrypted: i=1; AJvYcCUtw7g2nmDM6PH8hjdvC81RyiDmMGYq1wiOMYIN3qDXfje2BlQZZqHVrl3ZPcr/WFI4h8O1hj8KE1fy2kRK@vger.kernel.org, AJvYcCWnpCcswVPPS1/XHqsx2+lWj0qC/irYZfwToqEISAv9Et8kysNwMkuGtw6hignuSdiEhhJunqm/tP58@vger.kernel.org, AJvYcCXPJquaTVFt1aUYaNRX/YWPyfZrOilwqRTdrfKiXwCr4cxZzWQZ8bX7AWujJLOMCU/mwDT0L7ySEjS41Dg=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyg+V6uoLlCf56oN0PjSEcgveUPm4SwbD7npN6tfzNFl9y5eg7F
	b4I/7NoJ94Vh8JkSXZkkKPLPtC0oZVVEGN3sNh0Y9eCVzWLYDuDE
X-Gm-Gg: ASbGncvH0oN5u6/pNDXLsKdkTKQjiR+OAcuWJbcDDbOeOh+XzIO2ecFjinvfFY//Mtq
	wvzLDR/pFHX1SkFH0K89XP5VMvLZNOMFHlTnkGT6ZzrGYIm4a4odbuBJUNKL9drgi4NYw2vHLdj
	3PuETJ+cOt82TF9PJCsbXyQ0r5bBODnM3to3Cr88oaH7cFh2/zRYA9/EX7q+IC+2X4iVTpQpQJJ
	YdsK8teL2/Ix2JcrWjBroB9nJcb00Xkb5nw/9QLjfTYHCKGOyCkNHVjEFpopGy1zn92NfxnzOZc
	ZQiLLg==
X-Google-Smtp-Source: AGHT+IGZNzJ0gmJc5uMS8tMi5FavbgJj915mjJboHd4V9ATd3VnrztacUeJqVQLao2ZkraSSlltGUA==
X-Received: by 2002:a5d:64cc:0:b0:385:e8ce:7483 with SMTP id ffacd0b85a97d-38a872faf34mr1961390f8f.4.1736336467305;
        Wed, 08 Jan 2025 03:41:07 -0800 (PST)
Received: from [192.168.4.226] ([92.120.5.1])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38a1c828f8fsm51961774f8f.12.2025.01.08.03.41.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 08 Jan 2025 03:41:06 -0800 (PST)
Message-ID: <8605a282-c43a-4792-8750-f56a7370f355@gmail.com>
Date: Wed, 8 Jan 2025 13:41:04 +0200
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/5] ASoC: dt-bindings: add common binding for NXP
 audio processors
To: Frank Li <Frank.li@nxp.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Shawn Guo <shawnguo@kernel.org>, Daniel Baluta <daniel.baluta@nxp.com>,
 Mark Brown <broonie@kernel.org>,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 Takashi Iwai <tiwai@suse.com>, Bard Liao <yung-chuan.liao@linux.intel.com>,
 Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
 Jaroslav Kysela <perex@perex.cz>, linux-arm-kernel@lists.infradead.org,
 devicetree@vger.kernel.org, linux-sound@vger.kernel.org,
 imx@lists.linux.dev, linux-kernel@vger.kernel.org
References: <20241216145039.3074-1-laurentiumihalcea111@gmail.com>
 <20241216145039.3074-2-laurentiumihalcea111@gmail.com>
 <Z2BYcw6x3zyeBwvE@lizhi-Precision-Tower-5810>
Content-Language: en-US
From: Laurentiu Mihalcea <laurentiumihalcea111@gmail.com>
In-Reply-To: <Z2BYcw6x3zyeBwvE@lizhi-Precision-Tower-5810>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit




On 12/16/2024 6:42 PM, Frank Li wrote:
> On Mon, Dec 16, 2024 at 09:50:35AM -0500, Laurentiu Mihalcea wrote:
>> From: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
>>
>> Add common binding for NXP audio processors with Sound Open Firmware
>> (SOF) support.
>>
>> Signed-off-by: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
>> ---
>>  .../bindings/sound/fsl,sof-cpu.yaml           | 35 +++++++++++++++++++
>>  1 file changed, 35 insertions(+)
>>  create mode 100644 Documentation/devicetree/bindings/sound/fsl,sof-cpu.yaml
> You create common file, could you please change existed binding yaml to
> use it also?
>
> Frank
Plan was to do this incrementally to keep this series as small as possible. If required though, I
can also include the other bindings in this series.
