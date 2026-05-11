Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB3803D4138
	for <linux-sound@vger.kernel.org>; Mon, 11 May 2026 10:21:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.214.174
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778494896; cv=pass; b=Ln5Ma9WzXRMEeY1jgVsX+4wU7zglJSX5OKNRKBKibZTT7dbGQ8SJ21w7Ts/z8zSjSGAcTjQh8H2t1GblQ49fnnGwTMxAX2OjwCIaqeQzBhPZQ+XueSM471c9dyeBuuNd75DSTMWySP4PH9hSsXeZx10cHjnvLwjABBXD9Y5Zkfo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778494896; c=relaxed/simple;
	bh=dkEb+Wt3jNZ7JLdXZ5Wg/1bN5QqwrP516+C9eqWt/hA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=kI32wzDQK2h0bPUvj/qLCRONMiEaDKzVq39K/e0AbFchXu2qQDZbyV6OQE7n5pPUnGw7MZoyk/aSPe3CqLXTi5hYYNcqCXOfwPgCGwenIywG87S48bVT3RUpFpI9nJiakVETPfraDwQvX4uU/ow+C4MhoZBvh3daOR0XWb3DxKI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TKlubvpx; arc=pass smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TKlubvpx"
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-2ba0714574fso22332675ad.2
        for <linux-sound@vger.kernel.org>; Mon, 11 May 2026 03:21:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778494889; cv=none;
        d=google.com; s=arc-20240605;
        b=Eok8N1yQ0z78Y8FtCF8Bpt+vB7RhFpVWmS9208Geumcxi/w0EHzRH17azb0uNPzOlL
         9LbhNeGVKJEr0Otki6Ex+gaxFXh7He+MjgkdD9o7p1z5G9y8Vh+kbJ1NpOWJE/935MQE
         kCgwfU+AEQrH0FRnCUXjmI42X7rsB66ysoCLM7V2CUjJBVS9rUtHbo7y3P7qOQ35GpYP
         WbP29mhznnkfg2yixA8/46dDSC2hZbLBNAwx6y285+ClpXd/Zw8YCzFxLDH1NWI8cGcQ
         /cdYqUobpd3ZsZcBEvwglGhxO0axZImQw8Cyz50JYMwc2I99F7n3kaA3QqerHtiTp2Pe
         vGcQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=WSLz63MUrqkuJwhVPfOGrb+NpbYDw8jzgq+4u8aoMKg=;
        fh=17x3tHblP6rVeExCTA5jjWdrhM0PIz/pgjahvouBtpY=;
        b=TYaJDZAehr8xdIK7dxkqIPAY6XkwCTaZgEr71HbGEzQOBVzID0l30UMesa4fKXGjYt
         HuWi0np+fftQOchpFXaOE9zBfsV+FQtkSje+Gyzs8ZPu6pIFsnH5TIEXDxYO4OjXZykg
         Wg+aarkxRKzMSptOrUf5HODk0et+D28XfZRvX35JtjcDwWRsUR9qmNyrelmwIoqsCnMs
         xid8fkKhCPam3zl9MbtAW/zQ8SGubNPDBR6xk+6m/BzzM9OGlnoQ6tlub1Yn821BZWkk
         pqPscyAZULV7vVyzL+scHetaYnLNTMm9tx0uE18gVVRpJ8V4Unft4mcPz3T8+k6F7rTI
         760w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778494889; x=1779099689; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=WSLz63MUrqkuJwhVPfOGrb+NpbYDw8jzgq+4u8aoMKg=;
        b=TKlubvpxaacU4fCHJVBKa3ddo/C14LWWPTkXz0YQ1WZv0ZfDtbn1Nzl2OG9reivtVy
         NQe90vTscyd+Mai28pboELuuGMc33sGakLDnItGb8JNi8r9RU5ISHpKZwGFZNR2wzoB9
         yMfPu0CMMTZTn+eN36JC+T+Y+O4VrD0pnYl/ivXE+qxOCqXnUxiF5coTp4KmGKKfBBT5
         Z0j7giizMjPtvDi0NaCK7E1NQH4yRFIjfv8dnkrpZexAlgGpN8bSVp9LnKSS5RlzVDMn
         K5YbUhSrWUubD3lrBziMvQ+0O+beKBCJEoo25BccFP1CyoKd1IZOoCObfP7ZKYghitqa
         WRow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778494889; x=1779099689;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WSLz63MUrqkuJwhVPfOGrb+NpbYDw8jzgq+4u8aoMKg=;
        b=WzYCGmK2v4TrMQneSTHXk60t64Lqcm3+RjjCxkcByWOnByEN8HMqlPSooHPPcrlabp
         ZVv687mTYfrZBB7F5fRZmYNFXnfsa13vEQjFkn8Shuldr4e5WkodqEFqeiieFafrxSlC
         0D+ZZc4v1v34E62OFNIJePFZeWNT65VVzH6QILrIa9vQAfZomn3Vz4dhCSmtazWUJ+vu
         8ajxH2E5bZEZIcY5thPkt+ac4eXRFV42G8HOQqOsE3xrj/JWxYlnMywB40pfuJzl6Re/
         M+kW8jBGaA7qQXaksRowzbiG/qB//gqUVIXozZv8SHBTC+NQ6MC9NaAi4lEso7ewqIuV
         BNHg==
X-Forwarded-Encrypted: i=1; AFNElJ8vykRCQQaUb9iwGdrvktCXgWwNvpy2BZyNTaoicF29tPLa7gTZMMy3BU9+x/vXA2N4+r8teEpTy/2JOw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz6qDfQmHG2xaUnlOqzYLqwMd0FDBkdj0LRQqof8qbZSeQ1aOAm
	NzJ7MAoqKHjahuM0n/knnyFwD6W1BgBtVdSJfyrB8yPM8RItsCt0+gUXq/szERvhvSCMupQ1Qmu
	QTk2zcLBubOOAeOKoLMgTDQ1B1g9OmMw=
X-Gm-Gg: Acq92OHDHKvt7D5qAFoKzvirR+5hod04SrAg7ChVA0xF8eoIWC79eac2KC3aA77VFTE
	EeyXchY3pcGHdqZkJZfefwg/9ERj5n++tGy6/Ejz/JwT7+wLvnTk85Q2FaNxlBgX3c85sOZO+QT
	3YuZGlEty2r0iud7k9eUu7TZgMaXNo9svyS05vk/eeaVm3UwoXntwt5dE6UoYTg97fBxzk+6j84
	1AcTPONcAJJoJPcXid7etGWyjSbd0pXEdYtRCkXGpeVZp90gpN7cz85+r+qTakRNJ5Faim1rPQT
	zpbT1CDJE+qCs5W4l6uVr8goVqH9+mjJgQd12A==
X-Received: by 2002:a17:902:ef06:b0:2bc:8634:c35c with SMTP id
 d9443c01a7336-2bc8634c747mr87342615ad.21.1778494889207; Mon, 11 May 2026
 03:21:29 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260510084303.122426-1-phucduc.bui@gmail.com>
 <20260510084303.122426-8-phucduc.bui@gmail.com> <87a4u6n1tg.wl-kuninori.morimoto.gx@renesas.com>
In-Reply-To: <87a4u6n1tg.wl-kuninori.morimoto.gx@renesas.com>
From: Bui Duc Phuc <phucduc.bui@gmail.com>
Date: Mon, 11 May 2026 17:21:17 +0700
X-Gm-Features: AVHnY4J2_VlHnQNv7lKiPmK0Inw9w8zGI63uUFFjO1owsEGryveB0MVa3vPjntE
Message-ID: <CAABR9nGx0gSfL7itmG5WYiqUq_SN0GoVp85NerZ=MrbYncq76Q@mail.gmail.com>
Subject: Re: [PATCH v3 07/10] ASoC: renesas: fsi: refactor clock initialization
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: broonie@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org, 
	geert+renesas@glider.be, krzk+dt@kernel.org, lgirdwood@gmail.com, 
	linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	linux-sound@vger.kernel.org, magnus.damm@gmail.com, perex@perex.cz, 
	robh@kernel.org, tiwai@suse.com
Content-Type: text/plain; charset="UTF-8"

Hi Mark, Morimoto-san,

Thank you both for the review.

>We ignore the return value from fsi_clk_init() which means deferred
>probe won't work (as well as fatal errors).

I will update the fsi_clk_init() side as follows:

if (!master->clk_spu) {
    master->clk_spu = devm_clk_get_optional(dev, "spu");
    if (IS_ERR(master->clk_spu))
        return dev_err_probe(dev, PTR_ERR(master->clk_spu),
                     "Can't get spu clock\n");
}

The probe function will also be updated as follows:

ret = fsi_clk_init();
if (ret)
    return ret;

Do you think this approach looks okay?

>Below parts are clock->xxx cleanup code, not refactor clocks initialization ?
>Please separate it into cleanup part and refactor part.

Understood. I will split the current patch into two separate patches:

cleanup patch: includes the changes converting to devm_clk_get_optional()

refactor patch: includes the remaining changes such as updating
function arguments,
moving the function call locations, and adding handling in the
set_rate() functions, etc.

Best regards,
Phuc
