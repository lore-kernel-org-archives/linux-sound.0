Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.214.182
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794372240;
	b=sQNmtV03h9kTUvoV6XugWJszoRwyaF8gbF6s14f6hRhoBdaaIFIyI1Uvmn84PcnffABz
	 2HSaF5F1kS5Ik0ZB3kFeyIsCESNb3SZDSaNc7dHjmALX9LegZadsYI6r+LsJ9pM2yhjB8
	 PgY4n1vUYiKSzVdvv+rwd94zx/fw9c/V3b41/JC/IS4T0lK5RDQq4uZYRcHiuynzlh4i6
	 EKRF/cC4jHPvRGW1y/maLxAwun0b6zR/SbGvPEckZ/v1cLgJjG8OgSHv3D6SJtDnKIOfB
	 XDucmiOldE/73JSKDqftAtCNt3bUdWtc0BGPZbQ8VTDb/KIL/JhMIKZb6bPFbviHO+w==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794372240;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:MIME-Version:References:
	 In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:Cc:
	 Content-Type;
	bh=p31hRBuZ5v29aEoLLlgdY/9GGUqvzL1veqJRdGoKp7E=;
	b=A/nOzKjQFbn7twwrraF+jEr8QW5XxZovRzVItOdq7BOJURm26NjSRI81YA7Er9INeOMN
	 KKKp95BNdbl+pdfcKqxBVIu1nkzc6BIlGzrhfL1B9WEMni3UXsoryUJ77SKDNvZsmh2ZL
	 NfRRd/ImRxfKT56+sNqe5nKhTm8lAt3uUCcTnXiulaNdeWc2/dG6ILknIx7fXpp4ydLrs
	 CQ6YpC03EHWWbBOMhB9166T7RKd4B3HTXkCI9XzOVoSWUhx9eXG9wFMTga8MPqoCFIoz/
	 BwQYqZEif4ig03YqUT5JfYNHSd6Ccy9RhgTm/wQMqjZOgErZbWRomSJI69YXco3LAsg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=FsIEuoOn;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.214.182
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2A10606A320
	for <linux-sound@vger.kernel.org>; Wed, 11 Nov 2026 04:43:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A2A10606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=FsIEuoOn
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-2e9d7791b00so23963395ad.0
        for <linux-sound@vger.kernel.org>; Tue, 10 Nov 2026 20:43:59 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794372239; cv=none;
        d=google.com; s=arc-20260327;
        b=RzTeEjPBUwbphP56ktv3MynkvQni4STraSakk3mLC9sviamQvwVLtbBBCQFn87KyTP
         w+3pwqZF8kzZbtgCO/9uTYwZIMUl9KIkiNID4PHvCsoAJzukz10uLi4XdVTfHeBkaQEM
         Q4/j8F/r+dyJxS4ip+tUEbgiQGagFIJm8kiGHwR2am6n+QnPi6iXkT+r4Qoxx2RXiUY+
         O3eE4XFa1C/mFTvz9rzMua2uFkBlESS3ehPL8KDXT3ByaZpEN+GKW1jxESgQdt7jIVyl
         pyfS4TQhJK+7qZCfVvLcE6HOc2N9bsjnCj+n5vTH5bHZHbg0x22/n+8FCNMvsslRCN2E
         vTsg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=p31hRBuZ5v29aEoLLlgdY/9GGUqvzL1veqJRdGoKp7E=;
        fh=j7qE0RlvzNR5Qm6xA4ehUDBqPqcz09gsE3Wa6zaxdUU=;
        b=SG3TZfPn0lojyj+kixvAY4Ertq/g+sNuuuJ+VK2LG4FNt50Y4Yju0n9GoLMypKGxFy
         LianTiS5kdLjn35diFl/clehMG4Fi9nHTGKWaGarE23G6fgRsvp/q7nsdR+fdUqbJVjp
         WbMazcpcj50divowU4nw8+RR+RL+OOFLs8UO3+LgDMU/bdfA1IhZ3f44FgcAB5u1BXdf
         dabK0JPuNMlvIu6GDAe4xr+8Y12/9F9fugkKHkkvfSNqewxsbAZQ2JTmnplOVXyilk6w
         5c4XzDPcLL2TlNCeKgvLlLOC+NuYu7l7KFNPm3EZnld5rmeAMtsWBzaV6w/qGY8USc5x
         X3aQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794372239; x=1794977039; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=p31hRBuZ5v29aEoLLlgdY/9GGUqvzL1veqJRdGoKp7E=;
        b=FsIEuoOnDSUCqULtdTJ6+sZddsmip3qAkfiQ+93+ZUyBDEPDCotdaxXoWxAUjSINrm
         amiy7KmjSAyD+dOXrrncvQM0wWQnO/+tQXA5OMxelcVMrrhy61RLypXB0eROvAYBiW+k
         zdKyOnQoNYazoG+LkRPEdv/97Kcn7kIGpnnvcPm8h4sxFx50bZ95ZITRJOvF+WFP5shq
         9EFX0Bh+Klw5zi277oFU4TCNwKRQD6P+luOTDjF3nCROVPcqmJW64NbtFUkPtfpB1pHZ
         QOA0iKmJP0WRu0GWwVhVlUQetfOwJjq8lxnNkzdM2tU1YaYhY9y1O7dNquJmz4qx1sJC
         m6Ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794372239; x=1794977039;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=p31hRBuZ5v29aEoLLlgdY/9GGUqvzL1veqJRdGoKp7E=;
        b=iNrJTsEU9qssc/TnnRijPkekwsL2r/pfcnYxMSfPgzhS1odvomcbI8yOcHuorbzYMp
         lj5aesA6SRiKXnVIxLHsp/iX9WdYARoiL9uCuvUrDfrk47LvEEcpsTMwocPIweRDjZOw
         MIPeWFbyzDODShTQoxfIeX7Oe4Om77ht9jSXoEpLD3WP2jKcz0L52vRx2RHSWkAjgUg2
         Iu1y8kyBHs0Q7Th5h6gkB6Q4Ur8aMnlP/GBt/fiqQl6diAEMm2L5XunJ1o3cgavdK/8C
         Ew3I5b7Pcgn3JvdSemp27QVtbu1iPgZsbvzPaRcea/KwYxr1GgZ0Fb4s4v2gpGAhmRAi
         iWMg==
X-Gm-Message-State: APuU4Z8KMaBs+FznnAbykC4zfTxF5HidPl1eqCU1/EYLkVcmTwqdwrs2
	oi5VFA1AwmY1JcYgsMpE5R/yRXsqkIzyEfxl4oQoHmNmLbAZhSe3QWn6fe3S+C3QP7SlV/amQOc
	yDhrI6RIX28dGIHl+VAhZi75arEbnwVY=
X-Gm-Gg: AYBFou187ZyVW9ZOVdgLNa6GrIuwIY4oVNzorwwvxqYlf3Zidm4x4QypgtZup4r8ABW
	dwYUPzJTaN0LAk+JxURutyn+7jPxWabq3ULQ2SnU60x8E7OVcbSIfNdFScTNfPJcUbF7pDbHS+z
	tdu1ZznOF/PiHzpXTXS+2k5+jJtcwR2CpqYol7QmmwieY+9lqx1TP+Gl+F9zWWWHe5fnhstb3jK
	4po2Lm3u4nxv920uLXkGy8G/9TY9Rj/b94g9ICpcwIPFDDsLOyC1lcIQuXzSNJwd1a8UoLIL9Jb
	J+HGObEi0RN8Y3/5x/yhk9zd0MqZldblBX0bhNIMmJolzGBAvbfObPmtedbCamffFUoqOBlfxWj
	ypMqZRCe/O6Zm0FxYK1zIzAq9epOLHoEMLxT9MshSChZgZ9WLtC940r4s/KrR/3zErqBXS6lg5+
	EMSf9m6a8aYcp21v4TSs+CWIRZ8FAjyB7F/AcmhH5CWkvvgBIJBz5ViCx4CHIWkEAkwkV9Fw==
X-Received: by 2002:a17:903:22ce:b0:2e9:6790:213a with SMTP id
 d9443c01a7336-2edd7b397e8mr15511145ad.27.1794372239006; Tue, 10 Nov 2026
 20:43:59 -0800 (PST)
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Post: <mailto:linux-sound@vger.kernel.org>
List-Help: <mailto:linux-sound+help@vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-sound+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261111042746.14714-1-phucduc.bui@gmail.com> <sashiko-outbox-208300@kernel.org>
In-Reply-To: <sashiko-outbox-208300@kernel.org>
From: Bui Duc Phuc <phucduc.bui@gmail.com>
Date: Wed, 11 Nov 2026 11:43:47 +0700
X-Gm-Features: AclHuK9ir-MmdyEJwmsH7iSiqbs8LV1rrQVMYa6Y6nx83eIH1wY1eDCqtmpPl3I
Message-ID: <CAABR9nH9P5jOJ=Q8oxR9QMOKmttDh=-=jHsqnFR_szqzONgysQ@mail.gmail.com>
Subject: Re: [PATCH] ASoC: atmel-i2s: Use devm_clk_get_enabled() for pclk
To: sashiko-reviews@lists.linux.dev
Cc: linux-sound@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

> [Severity: Medium]
> Can enabling dev->pclk here cause atmel_i2s_interrupt() to dereference a
> NULL dev->regmap or access registers while dev->pclk is disabled during
> teardown?
>

This scenario is unlikely, but it is possible.
To be safe, I'll move the devm_request_irq() call below the clock
initialization
and dev->regmap setup.
