Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 460043F23BD
	for <linux-sound@vger.kernel.org>; Mon, 27 Jul 2026 09:55:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785146155; cv=none; b=GBqFG+EyS1SEjeqUyVPQwOB0Eo5fcSIbKkstab/nylz0RlCb4JVp43g3/Q36tDW9xBQoQg3Ouya3RsS5PnIMBe1wB8tPwSK5kTlTCood3KIVHiAXz132N9jVFW66c0/s3WFHib7spjwlvTTjb1X5flOLYU43Vqk9/9Bcs52U/RM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785146155; c=relaxed/simple;
	bh=ZmkLH0W/VP/nnRRhA/e+hyNpxbu1kt8CpJOBQUfKSkg=;
	h=Date:Message-ID:From:Subject:In-Reply-To:References:To:Cc; b=S1z3poJobwAuIDsL+pC4f/Kpk6uli+znobF5hDyMBB/jJ32G/BWCTzirGMT5PcvIh1bz9puF1u7rkrRHZZzTuzf5/DtQ3dtesLS0Pwsvdij2CTube8WM3tOXV5F3xxxp/8uHBjO1paczHXwOE64HX3L84gUPWa7SEIKn+Jyyutw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Tua2tvJr; arc=none smtp.client-ip=209.85.167.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Tua2tvJr"
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-5b2aa3be376so1921154e87.0
        for <linux-sound@vger.kernel.org>; Mon, 27 Jul 2026 02:55:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785146150; x=1785750950; darn=vger.kernel.org;
        h=cc:to:references:in-reply-to:subject:from:message-id:date:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=ZmkLH0W/VP/nnRRhA/e+hyNpxbu1kt8CpJOBQUfKSkg=;
        b=Tua2tvJrMD015rIqe0SSQ5Y29EHsTWm9iHcTSgHxrOkGHjFHHAc5ueUlF9TlVPdvMq
         63qBUBbYras+HFYDxh+WNLTXT0dlRFREom4g4E3roEN3OleLo2lxk90JQlWbn0a8H/bL
         rOlyTadWfZxalB7e+ddIGzDnc03rbdYeEb542fCqfZl98qIeuRX7vzi26NxCJgDRSiPx
         Y3f1g5yzyQoeREfM79/XxNupGTE3+lNEHBYGxIhGfWF8vvLzhPTqAGdxN1W7j91NymKI
         c5JRA8vHKyDJQFm4GjQBiq/vDWs3baxFaGRoud+4M3oTQbU3RPf/f5pbw7IU2VjKmbhJ
         YMkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785146150; x=1785750950;
        h=cc:to:references:in-reply-to:subject:from:message-id:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ZmkLH0W/VP/nnRRhA/e+hyNpxbu1kt8CpJOBQUfKSkg=;
        b=K1j3lPw+n6aq5Qx34FHj7e/q8iLZZXBzRJHJFwFOnvJXjBTu83UVovxB921fUMk2Fr
         zHAUNQsgaVap09Cb0EkJyiR+yVJCvA/RG3FRdP2AK8dJGTG1KBwmerzBGkDSvJCtqBDt
         O3h/OGm+AjzG6aSJtDLHhwOOE/8YmHIcFu0HCPlRmC/w454dFlCnf4S2Sopkwlo9QrBP
         EO+lzT4yhirueQX3NvPXYvK0yIhStkNKlEfc10GL5+LpzaUhxCt/x1J6sOTZ9pyW1jGu
         vybfR4IF+HHz8S3+wsRN3ovHyW3XSqyuU98BGQhk34Dgw4bfEci3kgrol2zp1n4gHEjF
         KlcQ==
X-Forwarded-Encrypted: i=1; AHgh+RpP+gasQzVNxmTyb7TFW6YJ6bVGEqUOVDD3EcKTH94UC40cqjqvS9QN4gTX5K15bV5n+vFRF8f0mk5K3g==@vger.kernel.org
X-Gm-Message-State: AOJu0YyEJWLrIkbc6FkKJdl6pA7O44bdx/OkTNz1qFggBpsrGjp8TvAG
	TRIBptfZ/DhzX8EUXT6LdfyG8t/zLoRFqxp5xJjq3cKmWy+pDoBYO33tOPwGyl6EnIihHg==
X-Gm-Gg: AR+sD12TB7M7fLk6GqISTRQmlKyWH0uMrM3rV5MzYyS9Z+z0wVscqkIMw1lYqf5p378
	CZBfzopIq1TOdLRr50KvuK5fh0yDHBe/rynHoxt0l789ISPqMpEI9o4CTajIQpYWzCRLQ//Kbop
	uOGvEtev88ES1Vi14DfNstOs/8JA3kLFoWmWdqT8xELx1sh5wBY1LS1N2lwrHxeNYiMHYKS75xC
	8L2Z0vdTY+Msmc4KB/aYCrgWvLvEJiSEA5qjB65bJMMPjU4D3bOObW6lEFAPdQfqZS57Txsi1m5
	xtj4hMPe3/1huux8/ySVbOTze7VaE3DAJm1iKOuzCCBL9wGeIIKJSaltVe5VrbLZ5SxV/kSJDp4
	onyU1tcxE4XE5bJdlyUAioZ8yO8wf8Yoy3nMk9xeFkksdNSZWgPHu8LFthtA+ctZANmxYDETqFZ
	c=
X-Received: by 2002:a05:6512:3b07:b0:5ae:af9c:c064 with SMTP id 2adb3069b0e04-5b2c1b6f82bmr1205194e87.60.1785146150266;
        Mon, 27 Jul 2026 02:55:50 -0700 (PDT)
Received: from localhost ([5.227.22.1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b2be1e675esm1331321e87.56.2026.07.27.02.55.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jul 2026 02:55:49 -0700 (PDT)
Date: Mon, 27 Jul 2026 12:55:47 +0300
Message-ID: <95b17762fa061f0195050f52dd02b946@gmail.com>
From: Andrey Golovko <andrey.golovko@gmail.com>
Subject: Re: ASoC: tas2783-sdw: calibration firmware not re-downloaded after s2idle resume (AMD ACP SoundWire, ASUS ProArt PX13)
In-Reply-To: <13a5a03d-8263-443b-a6ba-84d954549b2b@amd.com>
References: <c66ae00a-e878-4af0-a05a-272e9574eaa5@montane.tech>
    <13a5a03d-8263-443b-a6ba-84d954549b2b@amd.com>
To: "Mukunda,Vijendar" <vijendar.mukunda@amd.com>,
    Antoine Monnet <antoine@montane.tech>,
    linux-sound@vger.kernel.org
Cc: shenghao-ding@ti.com, kevin-lu@ti.com, baojun.xu@ti.com,
    broonie@kernel.org, lgirdwood@gmail.com,
    vkoul@kernel.org, yung-chuan.liao@linux.intel.com,
    pierre-louis.bossart@linux.dev,
    Mario Limonciello <superm1@kernel.org>,
    linux-kernel@vger.kernel.org
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>

> Could you please create Bugzilla ticket and attach dmesg logs?

Filed as https://bugzilla.kernel.org/show_bug.cgi?id=221798 and added you
to the CC list.

Attached there: the full kernel log of the boot containing the cycle, the
ACP register dumps from the silent and the working state plus their diff
(72 of 78 registers identical), the SoundWire peripheral register dumps
from both states plus their diff (the only difference being DP1
DPn_PrepareStatus 0x3 vs 0x0 on both amplifiers), and the DMA position
counter trace showing the ACP feeding the FIFO at the nominal 192000 B/s
while the speakers are silent.

Also cross-referenced there: bug 221584, which is the earlier
"peripherals stay unattached after s0i3" report on the same machine. That
one is fixed by your 5893013efabb in v7.2-rc4; it has not been picked up
for 7.1.y, where at least two more users are still hitting it.

Sorry about the duplicate copy of my previous mail - a command run twice.

Thanks,
Andrey
