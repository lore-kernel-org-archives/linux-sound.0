Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E767533A9D3
	for <linux-sound@vger.kernel.org>; Mon, 16 Mar 2026 18:36:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773686186; cv=none; b=hLomVea4m411AONMDzr5Qg2nqMXJVT8eqZ4fp7zMYdjeYrOJZgaCOkAPNa5B/joZ7NSQN+LgX4XvhsHnc/NTW/zJrLQWYcchpFGi+Gp1fqY05rdw2tJkACpcr5S8RYoDYdST31BkX5MPNvY6BKbQJ3Wa7dyV8tW+pODhemCrYWc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773686186; c=relaxed/simple;
	bh=VjRfAG9E/XjivOd68a8aaoje+/byN0jELlTqyvUs764=;
	h=Content-Type:From:Mime-Version:Subject:Date:Message-Id:References:
	 Cc:In-Reply-To:To; b=FnGDOiFjOUa+74ykoiaRFUzA5QJHlEcy0XJ+3Zf9V5iLhpuSidG+VkI9bgXok/aZhXcVsbuAfidX42rZzp3U+UL9qnbIwiiA9Th8zCGZ7Ko/refIZ2cG1V9RwkEjM5wXcYxenh2Rj7DtziBNuz3fn/jWkVZwBeuUCXhyodZcXWo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=starlabs.systems; spf=pass smtp.mailfrom=starlabs.systems; dkim=pass (2048-bit key) header.d=starlabs-systems.20230601.gappssmtp.com header.i=@starlabs-systems.20230601.gappssmtp.com header.b=gtxoqkW4; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=starlabs.systems
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=starlabs.systems
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=starlabs-systems.20230601.gappssmtp.com header.i=@starlabs-systems.20230601.gappssmtp.com header.b="gtxoqkW4"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4852afd42ceso43016835e9.2
        for <linux-sound@vger.kernel.org>; Mon, 16 Mar 2026 11:36:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=starlabs-systems.20230601.gappssmtp.com; s=20230601; t=1773686183; x=1774290983; darn=vger.kernel.org;
        h=to:in-reply-to:cc:references:message-id:date:subject:mime-version
         :from:content-transfer-encoding:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WDaJpDMQGYpC1K67RS5ibvHDLxfngW5BSq1vlvxAT5g=;
        b=gtxoqkW4LKiwuRxKrUj1Exmdl0k9vl10FiQu8/RwevPrA1BMuNzAo4g6mznnfa101q
         0os0HVSFxBIpNFTUby7jgvilvKAA7kShkJKmSEecUiN8IMNvFFhodI+ab4m+CdY7byAw
         F9uQ3BqV3lGHNSiGW5vniriRPSG88DMl3o8GT9pAVh1irf2ibMnWZhZbhQ4JNEdKErUV
         6sfEUIVrfqiQ9GL8e2wqzsgVdj+Dgeqwrjc8g4vnm66m/LqSfR2tTBJ/K4kSla2nAE86
         ZMfdEWTpjopfEaYordX25o22e7roV3OG7UuiDEYMIyZ0T9cQcLmwIU6JRZVTiYG1jT25
         aKgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773686183; x=1774290983;
        h=to:in-reply-to:cc:references:message-id:date:subject:mime-version
         :from:content-transfer-encoding:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=WDaJpDMQGYpC1K67RS5ibvHDLxfngW5BSq1vlvxAT5g=;
        b=I0I87NtGLc0M69ua/GwBDg4EFtXKKgFHYHifGROIZ0TQrR3R3fFu2ftPXGYkstou2D
         XocfP6kvC6+2xVxKL9ixvB7EYVd6CRZHuQ3yN/sYltsU32iw7BpkoXti+6XlHFPZawOc
         5tlD0nOde4Wnpn5TiB5zdJgqUaUNZ2GEnCYvUhlns8BQkg5yQRTMXx7PvSPc+EY7HBgC
         uCtFbVboClFZB8N4vg+cp95C2FqgT10z7bHQXbfzEnUNXW2LvUgB1uorEM10fWbpWr0N
         NIsO2VnUzshOcRV5f37GB/wR/fuoMnP7QVpRRHZIKRrfg/sFYHk/aUOtffP1T6vw/Bxu
         sQgA==
X-Forwarded-Encrypted: i=1; AJvYcCWwFPJh2kb+yv/x0AjsYyuc25p5GFihpgySFCqOAaeiitJe8Ne6adnBKENcjQ3YWRU1mZymvarqgmmg0Q==@vger.kernel.org
X-Gm-Message-State: AOJu0YyNIzT6HNRLHQTTwdXhG/XKOI435Hm41wyu/pwh4jnbfmfc4EyO
	6ZzuNlgB2UfI1n+h23LnGV+WJjIylUeW+ElpPimcd0elj2pO4o1MsnDBAyY/mte3QIwKI23mVrL
	15Yz6y42c
X-Gm-Gg: ATEYQzzpw3kSic5BuZJG0LgUv5qpO02TGFVI7+DGgPqytHqAnzniTzzTstOrfTYalJx
	NM37KEwcZP3FrSKOMgyDPYVCcJz9r17olEteYo1TStMlE+X6W+BOaErEo/h2wdpv3rUpet6Q1uH
	ppN7MLA8ECCa8kW1l1NB6SbRxejYHYXIORTcjzpptN5H+JwAA0XqQbIW/Qw0a0JwRVa6IoNxaiS
	CdN8xYw13ZhQhpGHzq0Qsw+eLpucHNyJBjO12gsWVcV8AqdriWM+gaOMkuo74QVxkLV5LRCdIbU
	GenAzWt4ZVK8mCITXoR5NH2FfKcMZC5AzsAIMQqSvDvDH/XwLyg3zJdzWpVdhCC2DOnQLm6Bqb9
	i9a3KYCoKy+L1tPLqe2zTHmuvCJjcGog7/sTrdluvRg0XNWYO6EWopFLSW7GHAMnooYKKpqG2Gs
	pjFmvQabBPcIjyAYh5sB32uRhFe0qTKETyWInwN+4CTA+154bYPKV0g+YW0VpgIC0tz8bLvY4NK
	NMv
X-Received: by 2002:a05:600c:a4a:b0:477:76bf:e1fb with SMTP id 5b1f17b1804b1-485566f7bd0mr232100585e9.16.1773686182720;
        Mon, 16 Mar 2026 11:36:22 -0700 (PDT)
Received: from smtpclient.apple ([217.155.46.38])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4856ea9c340sm10871955e9.7.2026.03.16.11.36.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Mar 2026 11:36:21 -0700 (PDT)
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
From: Sean Rhodes <sean@starlabs.systems>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
Mime-Version: 1.0 (1.0)
Subject: Re: [PATCH v4] ALSA: hda/realtek: Sequence GPIO2 on Star Labs StarFighter
Date: Mon, 16 Mar 2026 18:36:11 +0000
Message-Id: <74E05B68-09D8-4A09-864B-06A4893F1838@starlabs.systems>
References: <87ms077lif.wl-tiwai@suse.de>
Cc: linux-kernel@vger.kernel.org, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>, Chris Chiu <chris.chiu@canonical.com>,
 Kailang Yang <kailang@realtek.com>,
 Stefan Binding <sbinding@opensource.cirrus.com>,
 Edip Hazuri <edip@medip.dev>, Heng Zhang <zhangheng@kylinos.cn>,
 linux-sound@vger.kernel.org
In-Reply-To: <87ms077lif.wl-tiwai@suse.de>
To: Takashi Iwai <tiwai@suse.de>
X-Mailer: iPhone Mail (23D8133)

Thank you :)

> On 16 Mar 2026, at 17:05, Takashi Iwai <tiwai@suse.de> wrote:
>=20
> =EF=BB=BFOn Sun, 15 Mar 2026 21:11:27 +0100,
> Sean Rhodes wrote:
>>=20
>> The initial StarFighter quirk fixed the runtime suspend pop by muting
>> speakers in the shutup callback before power-down. Further hardware
>> validation showed that the speaker path is controlled directly by LINE2
>> EAPD on NID 0x1b together with GPIO2 for the external amplifier.
>>=20
>> Replace the shutup-delay workaround with explicit sequencing of those
>> controls at playback start and stop:
>> - assert LINE2 EAPD and drive GPIO2 high on PREPARE
>> - deassert LINE2 EAPD and drive GPIO2 low on CLEANUP
>>=20
>> This avoids the runtime suspend pop without a sleep, and also fixes pops
>> around G3 entry and display-manager start that the original workaround
>> did not cover.
>>=20
>> Fixes: 1cb3c20688fc ("ALSA: hda/realtek: Fix speaker pop on Star Labs Sta=
rFighter")
>> Cc: Jaroslav Kysela <perex@perex.cz>
>> Cc: Takashi Iwai <tiwai@suse.com>
>> Cc: Stefan Binding <sbinding@opensource.cirrus.com>
>> Cc: Kailang Yang <kailang@realtek.com>
>> Cc: Chris Chiu <chris.chiu@canonical.com>
>> Cc: Edip Hazuri <edip@medip.dev>
>> Cc: linux-sound@vger.kernel.org
>> Cc: linux-kernel@vger.kernel.org
>> Tested-by: Sean Rhodes <sean@starlabs.systems>
>> Signed-off-by: Sean Rhodes <sean@starlabs.systems>
>=20
> Applied now.  Thanks.
>=20
>=20
> Takashi
