Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2EC4C346797
	for <linux-sound@vger.kernel.org>; Tue, 17 Mar 2026 17:22:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773768138; cv=none; b=GU+t91ez1+JC0yu/EaCyLEPfMqYbHH3yB2aCxS6mz26tN7fCtDXxtrctYEkZh1KLVdR7qTMYZ0wNlnz9TKdnO4ViUFfx7EBEaOFsZbTLmDVOnMwwqlhsQPjVsduPWgf1Jd7gDQU2fAA420F+RF/eFfsEjcrci1T8ymMFnViuF9M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773768138; c=relaxed/simple;
	bh=iY/ms5fgpsXkVpoSgZDHvYfJ7W0iaIau/itMj6PGUSI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=sCxQw/tmyGpFBH5wy+GOmht+W0hBSQR1MQhQxGyeQ2weBehWH1J1pJeG6C+1bkuUyxZ1ssUobWGLF69DNWoBzD4/UeerjezoFoKLVSZXXdGSpIsVNlestlaUQBfn+YYRMZd8PXAC3YxPJjGATWgUiFAPbgOIujNEswFT6W4HNhQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PMRccKeM; arc=none smtp.client-ip=209.85.210.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PMRccKeM"
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-82a646c96bdso470545b3a.2
        for <linux-sound@vger.kernel.org>; Tue, 17 Mar 2026 10:22:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773768136; x=1774372936; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iY/ms5fgpsXkVpoSgZDHvYfJ7W0iaIau/itMj6PGUSI=;
        b=PMRccKeMP6SHpO8bK2lI8GEbp5s/95Ept50Od1ulLF+Ot8Y5M7l/KES2yA1/PfhyMb
         Hd5hukL+lI5NEjE370QCSvwKtut15cDDSZ8iRA4xmnIoFbx/Vg1t0426lvKWaNOAPv1C
         KitGxeVrRpW5olbRUj5f1CZ34jQxhALWK+M8JViUsdxoMEifQPI1IZ/eM+fBI403UzhE
         gZ4pWcD6F8t7+OY7RdbqAt0tiXILUgOiJVDFimd6tAL1O2uq2cH5CTU8DxrmLMQ5Xu4/
         hjlExcPy5AHqis6xaGH/5yoVwXxASugE4yIJnsVzbJhmECYFBc4JzPvsroYB2TA9592T
         FbAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773768136; x=1774372936;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=iY/ms5fgpsXkVpoSgZDHvYfJ7W0iaIau/itMj6PGUSI=;
        b=MLW+wdK4lt7ULgsXRS/2qFlNEV1fSRrOwoQW69QwD0Z5BgOvTaAdGqQdCMsy7kHE4E
         DfahFVxTVQ+YNdtL2dJck7KIDEZGl1PXWbvv+zYz5GH8PsTyBVJsWM8ry9u23szB3RsW
         f8VDrwY6A66bHQc96/iyWfC2xtgIl/qUG8oLI966eaeEGAOjTLOS3hUqkArHq437+bg7
         zI6ZLQWSv/cRXj6rwIDOhPH2oSpkkoc2H2cGSaTdNwsFcHwwLGd53NCksHBIhGDnzz/h
         M8cDEkQ2vN6wTvUDwm9E83haaeTMMwdFNks78dsDpPpyBLmH1MEqvZ++kmqZZbX8nBWG
         3KUw==
X-Forwarded-Encrypted: i=1; AJvYcCUooitd1cVJYcbINAq3MZ9NuHhgepX0zhvBIbJyKrnnoP4n8j1Frpy5Um+C5TNvh1Sp3vCByhv/cfYpvg==@vger.kernel.org
X-Gm-Message-State: AOJu0YzRnX7wQss1w+ObgwYAeW6t1HIFljUY+Z4PBa0Vp/XCX+N9N2c9
	RL1MGloX7ANfFOm5AKbBCtsgvAJLoWvnHq0lpyYMh+WgXio5cSPej5wE
X-Gm-Gg: ATEYQzxFStw+sy4vnAZcRcHJMeMtMHXWEQoCetDbpShklfOIjx1h79W2vmumvLkiuf/
	goW4tXEXFfjuha72Px2XyJE1xTpPn0X1ZQkDY7xmlKadM1RTyDkX3hWNlWbWGkbGCYkAFExtyWJ
	xf+Vs9BQPPygTLYeSWyqcHp0HzhMFowTonpfQQ5Fu24QvIMk48ThHGhd8KYOSlSQX1gAka3g8Ml
	IMRIO57CX+hRcmW33JAM2allugx6YQejuMbIRMunzEhb2IDQPBa6J8js9Xpil7E4fNy0KgeqSO/
	Kj5o3HF1vYxaZNuJfUtVMEK4mpWdxNUgQdLvNuMJB9/B0gsap7L88jzY2u2QzHLgX3mdIr9RjzT
	2g3juutJ/N5Wvz7qlQxK+6S0RVfm4ehjq4SOkQAdOZTbSiOk4xebmUEqq8c3mUJ37TdPMlau3RY
	vlowg1B0gaG19ZQA==
X-Received: by 2002:a05:6a00:9099:b0:829:9527:e16d with SMTP id d2e1a72fcca58-82a6ac7ae9amr153182b3a.8.1773768136431;
        Tue, 17 Mar 2026 10:22:16 -0700 (PDT)
Received: from px13 ([218.155.71.249])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82a6b532155sm43805b3a.7.2026.03.17.10.22.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Mar 2026 10:22:16 -0700 (PDT)
From: Hasun Park <hasunpark@gmail.com>
To: vijendar.mukunda@amd.com
Cc: Richard.Gong@amd.com,
	Sunil-kumar.Dommati@amd.com,
	broonie@kernel.org,
	hasunpark@gmail.com,
	lgirdwood@gmail.com,
	linux-kernel@vger.kernel.org,
	linux-sound@vger.kernel.org,
	mario.limonciello@amd.com,
	perex@perex.cz,
	tiwai@suse.com,
	venkataprasad.potturu@amd.com
Subject: Re: [PATCH 3/3] ASoC: amd: acp: add ASUS HN7306EA quirk for legacy SDW machine
Date: Wed, 18 Mar 2026 02:22:09 +0900
Message-ID: <20260317172209.16128-1-hasunpark@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <7850d480-a1c2-4b18-8d40-883064d75ad9@amd.com>
References: <7850d480-a1c2-4b18-8d40-883064d75ad9@amd.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Sorry I'm late. I was just about to start working on your request.
Is there anything else you need me to check? Let me know if there's anything else.

Best Regards.
