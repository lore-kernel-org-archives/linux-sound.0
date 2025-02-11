Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3093D2641C4;
	Tue, 11 Feb 2025 21:05:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739307954; cv=none; b=CMoEL5NXmciVwEn7B7HcNM8qYvJ6TzSlxVOAibYbDQAGqvfeR8imDHohIwn3CGglnfz7ndHJghWGhuG3jzDTSwOfeaE+uqCN90kb93w4ysq/cfbH4rl/B8wZjeu5d3fhhg/GhJq2qEB774f6prhecb5eDMcCLO7h4s5McPGKy7M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739307954; c=relaxed/simple;
	bh=F3M7/vdEchhlxBmMPU2kECuy/0/n1nc42/4z338w5lU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=gmY2ghWb976yYbbQsW3sVxgJr3xdhn6Wk9tFcO89E+ecZ5pejHnEJBLQicCjmyxcQdkJIkkMT+pNMVRJqz6RQLQO08ENYHHyE5bxPO1Cnlixw56g0uMsJ0K9RtFL8ulUXGguT6B93EjDFf3bJNF6peduVJ7/F6Dsn+khc12Rlc4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Bbjttmu3; arc=none smtp.client-ip=209.85.208.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Bbjttmu3"
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-5de4f4b0e31so7697545a12.0;
        Tue, 11 Feb 2025 13:05:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739307950; x=1739912750; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=FJXKo1rnLuFl+cPx44PrgMfGxNwkvUIiAKY29YBOxLs=;
        b=Bbjttmu3WWgofjQ7XSRxCyr3Ng2C/z6rAb/t/DR7yegg1ZFET/NrGUANveLyglqpps
         e43oJK7XdGm4+JRbxt2G8Hb/EbYe5+2xRl7l4oxFh/N4G5YRgkUXryDeLqWaYkwIe4OW
         u0LgfhhSStYk58doAedPd4nsLzsL+BpgVv6rkhz+bfvs/87Jyu8cnwVTj8RiKxdiZfoL
         mGrSIM0nt35bGXicY/joE6hRjYlgsrLHiSavXW2NheOZtKTnBn04XLx4nd2q5rUQyrf4
         xgy5lh2hoL5AR2jZaK25RiGYpjmo9flKzuZu9m9Q/HN8xOo1/kMEHz20s7y73mePThWH
         53Jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739307950; x=1739912750;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=FJXKo1rnLuFl+cPx44PrgMfGxNwkvUIiAKY29YBOxLs=;
        b=F79hA8bYRjkU66Dj/elLQWyedZiJw0NdyaI6EytSqfKb4bY98Yn7ezI/WfUwqDbE2F
         nlJoFgjs9Vhnd2hd1LUIoHRE3YuP9IsjED6WTBxwfaDPt3ZquWkDPS+7eb8hLyu3Qy6p
         e5eOJDv6eJ3gDYkbnUoD06BXDZbckvjmcyJnhYskrmJbPYEJPahSahy/5tdfqUe3qBYT
         uoJ11oyEW7bkIfGIz/tCllv+tP8TXvsK86Ao1hZE7YXWg9oSJnUrfnRk8JsJ8JQnIBk0
         /453/xtafxn0fBHhklZRLw7uCXWbZn2//ydrm5vVj9Shw2Ux4Own7qKIUcgiy+IY3OHp
         Om8g==
X-Forwarded-Encrypted: i=1; AJvYcCVfdk0LFIDz5eVTsfYlH9oPAdtHfm/E63uVDn9sl9aaoQIYTiBmNj1+2xZAHEGJC9thiJFLs/RCex2c@vger.kernel.org
X-Gm-Message-State: AOJu0YysT2yyOA//0hjpmJzpg8VvD4sJYAXq4mzLqASqQ8oa/w1s/eMj
	ek2nPKZr7HSAeWDq9KwEWfsvr2YyQNdmQribQQ1n1eQQUqOZmEnrVsNtJpT+Fg8=
X-Gm-Gg: ASbGncs4YePUhGzNN5sSk0PiF0RWPwmKRwe/5XpmSXpyd8YdvpNN7qUTCQgX8xjArLn
	4pyyu6l1URGEp2q4qGa7ut4Sm1aoBLDo9Gg6wk30md4Eu6UtoxbufpOM22guJ7gUWZQx8vcpQ2t
	vnYlH6q3iPpkXTJDfnaIb2zHu16tnM4KHp0ZPmjG93QTTASBDJ3gnZ8ZOUTKX8l0sPK2ktn8Q0R
	VUYGPch/wVDlEiY6B6cA4iL55LiAHeQrYl+4pG0JWd+EkNlJnMSVMC53rCb3GBchXafvnk0yfqZ
	ZXFUeBWxMIt0aNN1XgkTaEhmI2O+ghTx91qr3emqtBXlvtAUDMX6DttrSSwRSXBpJe4o
X-Google-Smtp-Source: AGHT+IE7TnL7jc5Iz6vTWhHrtrNij1s82deccxe7iwkiWATFIsU+z46kqSPjvpXY20QnIYGBevoc4Q==
X-Received: by 2002:a17:907:7251:b0:ab6:d7c5:124 with SMTP id a640c23a62f3a-ab7f347db92mr40005066b.43.1739307950174;
        Tue, 11 Feb 2025 13:05:50 -0800 (PST)
Received: from [192.168.1.23] (146.10-240-81.adsl-dyn.isp.belgacom.be. [81.240.10.146])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ab7bc28c58csm526166266b.135.2025.02.11.13.05.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 11 Feb 2025 13:05:49 -0800 (PST)
Message-ID: <7251062a-c665-4f09-ba47-6e890e2911d6@gmail.com>
Date: Tue, 11 Feb 2025 22:05:49 +0100
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/5] ASoC: sun4i-codec: add headphone dectection for
 Anbernic RG35XX devices
To: Ryan Walklin <ryan@testtoast.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>, Chen-Yu Tsai <wens@csie.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Samuel Holland <samuel@sholland.org>
Cc: linux-sound@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-sunxi@lists.linux.dev, devicetree@vger.kernel.org,
 Chris Morgan <macromorgan@hotmail.com>
References: <20250125070458.13822-1-ryan@testtoast.com>
Content-Language: en-US
From: Philippe Simons <simons.philippe@gmail.com>
In-Reply-To: <20250125070458.13822-1-ryan@testtoast.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Tested on Allwinner H700 devices.

Tested-by: Philippe Simons <simons.philippe@gmail.com>

On 25/01/2025 08:00, Ryan Walklin wrote:
> Hi All,
>
> V2 of this patch adding support for headphone detection on the Anbernic RG35XX series. No functional changes on this revision, patches refactored to more clearly represent a single change per individual patch, remove vendor prefixing for the device tree binding, improve documentation of the DAPM widget changes and associated UCM, and small whitespace fixes.
>
> Original message below:
>
> This series adds the required device tree bindings to describe GPIOs for jack detection in the sun4i-codec driver, adds support for jack detection to the codec machine driver, and describes the hardware configuration in the RG35XX DTS. The existing speaker amplifier GPIO pin can then be used in concert with jack detection to enable userspace sound servers (via an ALSA UCM configuration) to disable the speaker route when headphones are connected.
>
> Thanks to Chris Morgan for his assistance putting this series together.
>
> Regards,
>
> Ryan
>
> Chris Morgan (4):
>    ASoC: dt-bindings: sun4i-a10-codec: add hp-det-gpios
>    ASoC: sun4i-codec: correct dapm widgets and controls for h616
>    ASoC: sun4i-codec: support hp-det-gpios property
>    arm64: dts: allwinner: h700: Add hp-det-gpios for Anbernic RG35XX
>
> Ryan Walklin (1):
>    ASoC: sun4i-codec: change h616 card name
>
>   .../sound/allwinner,sun4i-a10-codec.yaml      |  6 ++
>   .../sun50i-h700-anbernic-rg35xx-2024.dts      |  5 +-
>   sound/soc/sunxi/sun4i-codec.c                 | 59 ++++++++++++++++++-
>   3 files changed, 67 insertions(+), 3 deletions(-)
>
