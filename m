Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB9173C01
	for <linux-sound@vger.kernel.org>; Tue,  8 Jul 2025 17:56:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751997407; cv=none; b=sCLpocIQfmTZo9rY5m3fYM3hCKg1dzFoaX8nnGxYAhijb459+uDXSrgWmFZiPixYf0g/cWR1IZJvvLKrzyLKlP4YL3d7+r8GzwGurnfd9sf9d0jxfo0h1MAjF4Fk4HyqRfBjd+jODq6GfRmDOnsZe1kDVDenU9vxIpWutTu+fsI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751997407; c=relaxed/simple;
	bh=POdUrRfmEqSV9wiDLteLAYXMg3BT7qxYRo45/FLOitY=;
	h=Date:Subject:In-Reply-To:CC:From:To:Message-ID:Mime-Version:
	 Content-Type; b=SoiwOuTpYIMcnqoxHE00Zisa7RqWBG1Rmxy3HhnK58NKzT62uhfPBLqzR/VzgoYRUE1orxmUrvTv3bM3WbIo/xLVtBy4h8jM5iqwvtK5icGttiGDAQl2ewVYnFouxu/Sm5tIAtWFL7bJYfcHE7hkdW8vx1O9rnqPziq+vrtgQds=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=dabbelt.com; spf=pass smtp.mailfrom=dabbelt.com; dkim=pass (2048-bit key) header.d=dabbelt-com.20230601.gappssmtp.com header.i=@dabbelt-com.20230601.gappssmtp.com header.b=PaAQDhTo; arc=none smtp.client-ip=209.85.210.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=dabbelt.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=dabbelt.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=dabbelt-com.20230601.gappssmtp.com header.i=@dabbelt-com.20230601.gappssmtp.com header.b="PaAQDhTo"
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-74b52bf417cso3064674b3a.0
        for <linux-sound@vger.kernel.org>; Tue, 08 Jul 2025 10:56:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dabbelt-com.20230601.gappssmtp.com; s=20230601; t=1751997405; x=1752602205; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=H+o8LqvaZ6CvfMSgYZPXGDVqAB0BYYQNmg6xijiaWbU=;
        b=PaAQDhToM+ozC8DfHA1i/1vuEVGlnsgHMh39J3tn1OSZMeQUeAGFqv33gqHtqqGao0
         RuP+/f9IlhKxgWGYVhDFiz2uvKbdFqj4yWfBfv0yBJtapYOVzf5q45xkfZh6QV3VlhWV
         1nq9Q/CIQNxdhnUug/IdxAnQwo2GU7fW0cC5w6Iv7f5GGCT2ysUfgxOINiY3S4gpTpyB
         xWDDG8qqfOAfOZD3ZkNnZlIhm6BMgvLUW0pzlW2CH+5FbRoDs0IfIdR/eHWcn0MXcJBy
         WguVYEnoSA/AV+pAr8IXdFNwwM9sXfXBbIkhTUr0OVxQgJ/VHyZnBvdviLnYowg7aN9T
         Jcwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751997405; x=1752602205;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=H+o8LqvaZ6CvfMSgYZPXGDVqAB0BYYQNmg6xijiaWbU=;
        b=n7d6UaHQkZzegnpbTAJIppGK/s1f4IHQGWutrqI2JTshNB0GeO9shDa4Kb/b2bkgp1
         F17mKhNFqkfSbBbA/TU/K7d1lXyG7e+sTG/3tDPyLB0LCu3Q6vys0yclIBKveMDWITxr
         bBwh9Cc6MVU6822xrWQI81lREokzNAxssqLUNpAxohvCWtMgNLMJEIKC84K1n70QuCtz
         jj6px9jeuH1l+nxZL+TvG2dU7Z2MuHUzrdijoJdtoYyY+WflW7bLJfvxgEO13En9yOOZ
         iTXNUlTMNiK3NJQPOGjM+zJSRThXFan+3vozg/G4kKuBheHlMEUI1qJQ4Y1X4Kehidww
         KgNg==
X-Forwarded-Encrypted: i=1; AJvYcCURv59Jh/B5OGzGH/x/CvWxRXDlUdEkn1YyBBRuBNB1moLXsOGSyEunclFEBIIc+3zbnhRF9h4MtJXynw==@vger.kernel.org
X-Gm-Message-State: AOJu0YyItg9GgWHOSb2kHc+kL0h+sVGUg5I5NXtQz0xajiDMcqpUyH1Z
	FRn7IsQp94TR+hNjgj9BQKnDqVtYy+SoPfS4HxMCWTkFsxG+lpeQgR3335cQTNhO6dk=
X-Gm-Gg: ASbGnctQkK0iCHI0SWugu+CGLZKzsXH9emx242nFtztirV2yv0nABZLboJ+GL5BzYsi
	ndcRMlcBT2h6qIEyPSzFroG65Og2OK8EmzZYxsksES/tzMze+g4H7+kZaxZ+pScCFwayv7cMm4L
	kAfFTvp/eDje+C2GeJZmQGV6aclU8fncMLiqMDWxDMmxCrMsYKghpwWayY+7nfgNRzEBW5Ms/0o
	AIbm/PQjGc5A0PPgbFJhhUlAb0hxGcRsyCeHmfd4kXXqRg/5tYq5oKVRhxvt0VFFleRbvtAzLVW
	NcRIGBM6Qs/pYwQ9BhFht8fDur8pkJuTAkRnh0Umd98t9mieHeHGCaa8BHTNiUyAagMChUk=
X-Google-Smtp-Source: AGHT+IEU0OGusFweO0Bn3dONzwFwwEsX3SLeg726DSpXWtqxvbUi12Aqjr5gGs+m1NJ8BybtUxeI3w==
X-Received: by 2002:a05:6a00:10c2:b0:748:6a1f:6d3b with SMTP id d2e1a72fcca58-74ea49591a2mr1758b3a.19.1751997405070;
        Tue, 08 Jul 2025 10:56:45 -0700 (PDT)
Received: from localhost ([2620:10d:c090:500::7:a219])
        by smtp.gmail.com with UTF8SMTPSA id d2e1a72fcca58-74ce359e9a3sm12499347b3a.35.2025.07.08.10.56.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Jul 2025 10:56:44 -0700 (PDT)
Date: Tue, 08 Jul 2025 10:56:44 -0700 (PDT)
X-Google-Original-Date: Tue, 08 Jul 2025 10:56:42 PDT (-0700)
Subject:     Re: [PATCH] riscv: defconfig: Remove CONFIG_SND_SOC_STARFIVE=m
In-Reply-To: <20250708-jubilant-abruptly-8ff77f7986ca@spud>
CC: broonie@kernel.org, kuninori.morimoto.gx@renesas.com, lgirdwood@gmail.com,
  perex@perex.cz, tiwai@suse.com, hal.feng@starfivetech.com, xingyu.wu@starfivetech.com,
  walker.chen@starfivetech.com, Paul Walmsley <paul.walmsley@sifive.com>, aou@eecs.berkeley.edu,
  Alexandre Ghiti <alex@ghiti.fr>, geert+renesas@glider.be, Conor Dooley <conor@kernel.org>,
  Conor Dooley <conor.dooley@microchip.com>, linux-riscv@lists.infradead.org, linux-sound@vger.kernel.org,
  linux-kernel@vger.kernel.org
From: Palmer Dabbelt <palmer@dabbelt.com>
To: Conor Dooley <conor@kernel.org>
Message-ID: <mhng-CB566446-2A1F-4269-B064-9B2ECC847DAF@palmerdabbelt-mac>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
Mime-Version: 1.0 (MHng)
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit

On Tue, 08 Jul 2025 09:48:27 PDT (-0700), Conor Dooley wrote:
> From: Conor Dooley <conor.dooley@microchip.com>
>
> On Tue, 08 Jul 2025 17:36:48 +0200, Geert Uytterhoeven wrote:
>> The SND_SOC_STARFIVE Kconfig symbol was removed, but it is still enabled
>> in the RISC-V defconfig.  Just remove it, as it is no longer needed.
>>
>>
>
> As I mentioned to Palmer a few mins ago, I'll grab this along with a
> couple other soc-related defconfig patches I have. (Apologies if this
> goes out twice, I got a warning last time about a timeout, so ending again)
>
> [1/1] riscv: defconfig: Remove CONFIG_SND_SOC_STARFIVE=m
>       https://git.kernel.org/conor/c/493e9b085299
>
> Thanks,
> Conor.

Ya, I think it's easiest to just keep these together.  So

Acked-by: Palmer Dabbelt <palmer@dabbelt.com>

in case anyone cares (I don't really care if it makes it to the commit).

Thanks!
