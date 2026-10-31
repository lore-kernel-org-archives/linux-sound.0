Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793418091;
	b=YE3qPYRQwmVBwAuIIYidSPZi9xez79biITeVCVwgpRLAWmRMAK8j1VUCMxHj1A4F4NAQ
	 dyE8ci5Kg9gknFJFlTXpzCX7F4/dGNIBFMGwmxAPzI5jhNrJeAuBFk6f7gHRY3nyXnuN7
	 Lmgx/xOKK/kirF+4oqbrznuh4A54YCYzf0Y70XLoplGXkYIkGgs2le4vxpBqOgQieb45P
	 uKLRIRdl5hVbXYl1sJxudF2wrj2nGSRev28Q/o+BUxYpn0c25V5aiQbTvihitVQR3SxdY
	 E0xD5AFhOTlJkiv4j1a9ziCxYq+ua2NospOyshHHuEU3jjyV1dmeyFawQE0OuDCFBHA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793418091;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:Content-Type;
	bh=wZvy9SzN1+/ZQllAihZB3y4rVnQ1u74CJPCb15ddjFY=;
	b=RSsBysCjDQ9/jzAnQnEEGJFIr2K4ux3FapOZOtpZ9NuKwN39sYqD/hwmUKyNcF3tAi9m
	 dYmF6c/xPvyJwKo9EYgCFA6o3Z4RRS/XHXNEB8GuvIIYza+1ivQMOfzxOCZAoTzGIBsz/
	 hPr5myoSTTuS5V3oP2JqMuf8S4brDUo+D4B9JOL5VqQxL0sSHE+SFdgoLXfZIOP5CGKgD
	 l8WF/8Awtj3ZforrWYyQmtOK/gQwou55rkkT3qJaUlg7g+cRcVF2ucojHWbMjS+0yutXt
	 WnNx1xV6FiFS+mr7O57125mHWugZcwPnoGxCGYp8H+P69k3avvCz1LJ+2rHDGb2hJzw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="VKYK/BoK";
	arc=none smtp.remote-ip=74.125.82.53
Received: from mail-dl1-f53.google.com (mail-dl1-f53.google.com [74.125.82.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32C7A606A31D
	for <linux-sound@vger.kernel.org>; Sat, 31 Oct 2026 03:41:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 32C7A606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=VKYK/BoK
Received: by mail-dl1-f53.google.com with SMTP id a92af1059eb24-1aefd1bf74aso120408c88.1
        for <linux-sound@vger.kernel.org>; Fri, 30 Oct 2026 20:41:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793418090; x=1794022890; darn=vger.kernel.org;
        h=content-type:content-transfer-encoding:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=wZvy9SzN1+/ZQllAihZB3y4rVnQ1u74CJPCb15ddjFY=;
        b=VKYK/BoKU5h2LLHXcYgZtRYZvABMiPirQNSKunFJInYvtkh33JziKXOktTRrIEv3D9
         SwhnAwhw9y12bwZn65GFRbietahrwxaen7g2m/zFX1ysgpRsTnOsLjihHYhGj9b457Qc
         w8d1z2jXu66QfylsCokq+hDBPkd3wRPAzwtMiMmNKvApkhupEJxe/ZuScs71zWEFlw+A
         N9PuiMdNruhDO2eetDIde3GiXdjdGdX/iM9vHQax9hOeIHxMfGi//Pw17+rOWnQCBTAl
         I9LSe8+rPC33wtqEPJerJSrY9h6/u1GNQ477htMD2Gvycjgz7duTY5peff3pw6BrX+Hi
         9Z+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793418090; x=1794022890;
        h=content-type:content-transfer-encoding:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wZvy9SzN1+/ZQllAihZB3y4rVnQ1u74CJPCb15ddjFY=;
        b=EYKqQgtQdigZFOH7O8f6EUucTgyfxTUiWxFtQmlAV/04d2LenU6kvxDhONgdQ1t83C
         vpzH0IDlCFa9+RMVRoMHUUvOgngjlg6IxFP/ofe+6JHMHyGgdRs4TjWvFcwDLcwpbR69
         EE4mUq29yy9BdU2lI/tA2VViNOUfVw+UX8NXWXSYXPzRetXPL2KUELAMWCp8avsRLG7G
         zjHG9hfu3u7X3We2boVm/QXlhvq1Pp3ORoWyuYEuEuiFO2+/EqQPLufpMOqCGUU6x6v3
         4i6xCCEokKfXcr8RtcrlL7A6gCI672P7QLMFwdIPw0PgK6iGAzAxjtEeJ3knoef+uUOa
         WVAQ==
X-Gm-Message-State: AFq9FYK4pr1BYRrgNscABPiHZxEncdDiD1WEnt5UxpShrbOASpnXO6JZ
	H8jaNQ0UPdIj+7u7bmDl2Ax7YIShO3KTG88jQ6P4OJKp1C1m3kP6P+1E
X-Gm-Gg: AYBFou2NMD2x5p6snF1JJVqvOc5HOjBTx5CVQvZMezdmAmHPrq30EzY5JkFiJ7XY8x5
	m2LXspdfZkfK979KyVRSRIpJUVDt0XzdfeOblISc7Eo7TN3nJIOE9nlNKDtmnnE67GZZaKHEA0G
	E/x4R8p9dVEQQBc+qSt1NIpSzMHLvXBbAxJvumhMksmwaiwCKoT1l9cNak7s97sCUQrsGz1oiA4
	e1KOP4z44Xj5NYvCzsDw5GBuWnhaX/y8cEdaHtPNyNvtXInBPvVt00EL0KvOSZdwhsZMGApgvX4
	iUxEVy8ascFe5pKyyoO/seoa/2eUGF26EPEJbUYylS/GNdAlhnZTRBlbtkx3RjpQur3vlw8iDEN
	0wb5exvOFWHgIzNUdTEaiQXz2T+LAn9jOZA7bu4xac+KVkk+K5FRvbsqyX6tPL/xABPqXi/wZt/
	miPsoBxCq2xgQiD9Hk+YT/4aDOE0wjUSQdAKLOdd5vsAGKJe32+W104tNhXjIoAO4uMdsh18iAK
	l14AIIENCEAbCtrba7ZGvMEKO8eapQGqUYL7QU8iZOLzq3lHXrANUcTO0OpqE+3rtlj+zUbZDI2
	ZWSXeO7x9GhGc6XAQ08ZDTMJ7hmcr11fiYjM6kSMmOSpEZ6kkQJC44IjvcqdGHbGKWiW1hxYmFB
	NEnP0bdmKca8OoSDu5G6+JbPFvpjaUWjWBXhNkmTrEKWYzHq8RVf5v7pMHbXPziJ4H3SX3WbaSU
	NPKte4yyV+OnfuCSHf/bpQH74GOA==
X-Received: by 2002:a05:701b:424e:20b0:194:e9e5:11b0 with SMTP id a92af1059eb24-1a9496c2e85mr10732429c88.14.1793418090155;
        Fri, 30 Oct 2026 20:41:30 -0700 (PDT)
Received: from minako.localnet ([2403:581e:d87e:0:739f:50a5:e171:f133])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a42952e1csm13084809eec.20.2026.10.30.20.41.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2026 20:41:29 -0700 (PDT)
From: James Calligeros <jcalligeros99@gmail.com>
To: Shenghao Ding <shenghao-ding@ti.com>, Kevin Lu <kevin-lu@ti.com>,
 Baojun Xu <baojun.xu@ti.com>, Sen Wang <sen@ti.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Frank Shi <shifu0704@thundersoft.com>,
 Martin =?UTF-8?B?UG92acWhZXI=?= <povik+lin@cutebit.org>,
 Neal Gompa <neal@gompa.dev>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
 asahi@lists.linux.dev
Subject:
 Re: [PATCH] ASoC: tas2770: Fix VISENSE at sample rates greater than 48 kHz
Date: Sat, 31 Oct 2026 13:41:24 +1000
Message-ID: <7grM17yBRo6a58q_Jnwbgw@gmail.com>
In-Reply-To: <20261031-tas2770-sdout-clkedge-v1-1-5266daf35f4c@gmail.com>
References: <20261031-tas2770-sdout-clkedge-v1-1-5266daf35f4c@gmail.com>
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Post: <mailto:linux-sound@vger.kernel.org>
List-Help: <mailto:linux-sound+help@vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-sound+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="utf-8"

Hi folks,

Please ignore this one. Will send a v2 shortly.

Sorry for the noise.

Regards,
James


