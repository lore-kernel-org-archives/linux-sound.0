Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.175
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794978559;
	b=iG7xZFfpBfsfA3HdLB3eDIkSmhycyutVlJdU/OiWMLaWyEb/PryAHGlmCfifpyjZUwMc
	 H4CxG/clfN8ZLP85iOPB15Z9Thm3coBDOgIsPG+pDr7OxqkzL0Wrb9SIkKZ9pSjsx/Z0o
	 yYZ1v96WiPJLcbmMEVqljC8HLRWMx0tpn2qpqK7N0LU70AxN8XomXeNtdG9XF1VekooJA
	 0cz9J1s7MjWESCWleOqrbS++3FAxFrgeeOuid2SLpQqqWWx/ruqXl/VqJxX/Ch0Z04TfT
	 B1vKgsnPrlS6EOd67zZC3RuozZ4i7aS1G3JJnMq32095UGkuDOD52z00brgewLr3dIw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794978559;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Received:
	 X-Forwarded-Encrypted:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type;
	bh=GDWt7Xx8f2hrTHrvXOUqAMcvT8tyJ1b4aUv40Hj2kOI=;
	b=IdxdtElRtA2znrNlB5iuMzS2pZgWdYSxWsG6xveiKuKzXKXHRfu3h2/2xs1dpad9gLtI
	 0MtX6q8ODDOXfGXj0twTCwnfxbQZsJGSckpYkjON/CWcbUbHqD2NKwI1Ym5hiYiuEPLCt
	 wi/i5OU2aGfh7yLDRr9c/u5830aLpUOO8nV4UYydi3ocDAeip/oeFG3zRx9qILEPpAq6n
	 KIFOa8I6lcMvl4EHhR6QZTiI0y1R2MyG6riY9YoboTi48VCGBGt5k7FBKImNpcyOSzUnU
	 M61dsSb+EhlNPTKeytLerQBMDg2lNHuzKgZWXK51vLnRm3e9u2E2A1G0iqFE5Fp+MkA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=telaak.dev;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=209.85.215.175
Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com [209.85.215.175])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 384C0606A334
	for <linux-sound@vger.kernel.org>; Wed, 18 Nov 2026 05:09:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 384C0606A334
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=telaak.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f175.google.com with SMTP id 41be03b00d2f7-cdb1199bfd8so321288a12.1
        for <linux-sound@vger.kernel.org>; Tue, 17 Nov 2026 21:09:19 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794978558; x=1795583358;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=GDWt7Xx8f2hrTHrvXOUqAMcvT8tyJ1b4aUv40Hj2kOI=;
        b=nE1xMeuigYBln2bmibqVN65jk9D263RFCIzzTAY2E7IdUY0ikDE11i7V/OhvoVzmR8
         FHzD8+igfmS/cwXMgjvcbv+vXq+Rx13Np2UcNrQa82WcmHc1h6n/gzwU8Co1TGgSjNKN
         qv7fdl3nfCOjRRtFtQER+Ngbm9n9K3ujOXLPNEoKM0K2yErHiAVvhiGPgume+shKLUPa
         qiz4/nZ1YIgzjpl6HGrinhnYycrVCf7X2q8qlw/W8N0btD7HyCICulrE89DGK7UCzC39
         hzDWYoC2cd4ZYUaE7lwmWm/6AseoGVlBzrX16KujhzyTCu3oNSwrCUpU4tf6WQkuteGB
         /nYA==
X-Forwarded-Encrypted: i=1; AL+hErGeshWHh5oFImLTaN314kQiPGXZBxdSjtMZ6WV80kMblIoXAUe8bA457o0ClCTGgDh/5vYXO2DrtGbKew==@vger.kernel.org
X-Gm-Message-State: APuU4Z+/aRxl3XgdGZBvfpkoGdIjufNA/6fzfwqgyrrpxFq+NWVWrkw8
	GKXDAoKnhrDOY/IME4dhFeFCWScAgMntmTU6qj7wUIO3A0vRnPUJomg7QfYVYOl6
X-Gm-Gg: AZFdTZf7dejVlaICrAAkLHRW6HvI5TRk5XeWqPBuzi9GjfI/1W1nKvX6DBmNq5P7I/X
	ATAvbN8+Ano8m+U2ZKhA7yHWggmrWNDuYN/h2BiXZsRMk4BmctSrnGos9SjDF6YaFHN5+7H0BJb
	NzDBcYo5C0iDwqDKDFk0f7kyNIbL2gnSJKXhlnIQ9z5daeW8tmX50X2Ylg3Hwg+AiphzHk6f/Pu
	+fRIX4atRoAkZB/rGRDgbh2JwO6lNpKHbb5RJSPFxFfeu6x94ADIiv69TghADFvbO3ETlATQ541
	18UQjz48Gp5lVaocAnapX1ca1p2oouQk9Ne3FQI1oQPTfheYcN9OlIA5iTTfTRJzfUHYVvOEC0i
	zA8Zo90Lo/knDjErw2ESyqT/+DJTlJkrxmzEREXG0t6EMj/HnaRj27+Cvt/sgqVh2A2RETeOgy5
	DGDXR753oEmsIOJrAmEjcUa7ky1MyntF0bA0ozj1JGKr/hEpcIvT/rxzwQhYOGYeVRG6LzfTSXh
	1vTQQFqOSp1RHjT0eAJrGxWqa0A5xjgEQR2A5ll+amRzxI+eb2EvNONCsfTah3Sx5tZaN2i65qh
	qF9NKW2zP1fMNs8907aZe51iqau+QUniNNYsp/L2kOLbJ7B9z5gG/3rizvtETzvd1mBafmLADJB
	oX4CF3quiHmzh6XjRudhYaSVe5H0F4nc50LYiOaTPijS+
X-Received: by 2002:a17:90b:3c83:b0:3ae:898e:a123 with SMTP id 98e67ed59e1d1-3b3d074cb2cmr1626052a91.14.1794978558432;
        Tue, 17 Nov 2026 21:09:18 -0800 (PST)
Received: from mail-dy1-f175.google.com (mail-dy1-f175.google.com. [74.125.82.175])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b3d1c03e04sm2130894a91.15.2026.11.17.21.09.17
        for <linux-sound@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 Nov 2026 21:09:17 -0800 (PST)
Received: by mail-dy1-f175.google.com with SMTP id 5a478bee46e88-36eb1cb7aabso932926eec.0
        for <linux-sound@vger.kernel.org>; Tue, 17 Nov 2026 21:09:17 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErETFDi7r4Zg4xJ3JZExVXMVdRO719HqOPr5VG0BnJqnEpYFrXS/IVbk7XEIH+n68XVE8wdbkByQvzfcCA==@vger.kernel.org
X-Received: by 2002:a05:7301:710e:b0:36c:3b8a:8090 with SMTP id
 5a478bee46e88-3827db0e75bmr1699348eec.2.1794978557201; Tue, 17 Nov 2026
 21:09:17 -0800 (PST)
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Post: <mailto:linux-sound@vger.kernel.org>
List-Help: <mailto:linux-sound+help@vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-sound+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261116-omap-mcbsp-tdm-slot-v1-0-6c9f7aa45a29@telaak.dev>
 <20261116-omap-mcbsp-tdm-slot-v1-2-6c9f7aa45a29@telaak.dev> <179495350668.2707353.9603940609466130588.b4-review@b4>
In-Reply-To: <179495350668.2707353.9603940609466130588.b4-review@b4>
From: Joseph Telaak <joseph@telaak.dev>
Date: Wed, 18 Nov 2026 00:09:05 -0500
X-Gmail-Original-Message-ID: <CAPY4CJ4QAvENNYMNz0vfjhwGPi8HMUJO8M3G0zBcxn6nBd1SrQ@mail.gmail.com>
X-Gm-Features: Aa3M54rshe7OANZPuVP9PlNMTTXkt0PN_Sfmm0dIkeYRICbDlqlKakJADXPsyNc
Message-ID: <CAPY4CJ4QAvENNYMNz0vfjhwGPi8HMUJO8M3G0zBcxn6nBd1SrQ@mail.gmail.com>
Subject: Re: [PATCH 2/2] ASoC: ti: omap-mcbsp: Implement set_tdm_slot
To: Mark Brown <broonie@kernel.org>
Cc: Jarkko Nikula <jarkko.nikula@bitmer.com>, Sen Wang <sen@ti.com>, 
	Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
	linux-sound@vger.kernel.org, linux-omap@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

> Will this do the right thing with a card like simple card that sets
> the sysclk dynamically?

No. A sysclk of 0 at open fails startup(), and later opens keep the
last stream's rates. In v2 I'll only limit rates at open for a sysclk
set outside a stream, as simple-audio-card does at init, and check the
rest in hw_params().

> it'd be good to validate the params against the current slot
> configuration

Will do. hw_params() will check the channels, width and rate against
the slots and sysclk, and against the other direction, since both
share the sample rate generator.
