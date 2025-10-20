Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D7313328EB
	for <linux-sound@vger.kernel.org>; Mon, 20 Oct 2025 18:00:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760983214; cv=none; b=Q86qONHJjySJ6BXyopl/8sLBRDwcfhIaw7tj8qQHhA88gZ3nVMmLonrsZLNpBHem+3RpE381c2FWTw6Libl2O/ihaxfPlM0sZ6vku+l3fOdr3b73+eHAwHgapHypeGb+syQC+j5hNI0lKphesyjXbSUFEhIiInzh1MXVugXTm4c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760983214; c=relaxed/simple;
	bh=l0zP/IswWls5tUEjRW4gHHMAJEe54gk5KhQpTRSbZKo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=i3zT6KujqLC+xGCJnB8lhYIeReHgLkN/+VtSd3p2xB1GWeae4y5t0nkwerit1jSQkVUB21fUxJ41G2PwoW584GkIbNtUdPKjYAyEXMDgJcmPB9HsESOj1f0aW2yEkg5xFr2/yNKeW0ywUEqJVivtOe1vZUVbsGRQWUC7jF52AFE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YRlIXWdp; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YRlIXWdp"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-47106fc51faso54788025e9.0
        for <linux-sound@vger.kernel.org>; Mon, 20 Oct 2025 11:00:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760983211; x=1761588011; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=l0zP/IswWls5tUEjRW4gHHMAJEe54gk5KhQpTRSbZKo=;
        b=YRlIXWdpXZZky1S+VQYFWxgAgiquk2WWTh/sda9oeCfMLuXyqlS+0yqkVULqXq1cPV
         HXdf5ySp//CweUuNbjJpvU/jD5Tick/tuagMhLeLRIEh7Gy+x3EKRK6fnHmc2VcHxlbk
         /axAyceLgkAZRBrVLX0FSSH73ctUd6tNZvBEP6UiA9ULz6ipykI5qNINmnLS2slp243G
         BwvmlA8qv1C8Ow5JumRFcs8RuMr9exUZZnVrWZdd6IEBtiOXvAqUJ/iO+DAXFQ0g05Od
         NCwHy9Y1aR8STwfPfi/u9PNn91Wujmm2u2mWfCsdXRhf/fJuZIZamXkYtsE1TDTS2Kw/
         8v6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760983211; x=1761588011;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=l0zP/IswWls5tUEjRW4gHHMAJEe54gk5KhQpTRSbZKo=;
        b=gPTH5RWxpXrHhjYfsluj4hPLkH3Cp6fAE9JG5fZHUu9B6LyxjmR3Yyxe1KwIaskYDw
         hnMaleLZHLTvO5FJNqCOVDcXY4oFf4+j9yZvbvcTtlaarQy3oi6fn6atUC/9L7OI96A6
         EGQBDFuTZNFkBnHw9SeZPfExkBYavLhEhGrWRfGAxddPb0kqQ9R6uZ2id1HHU5nZj4xc
         P/1lCUXCEkMoSva6teUFIcpEZ1MsSPxwvNtF1k0+cCecsqB52dGVzs5/CWIwfkPwT1H8
         emW67nErBZiznFE30gERbfsdoiNNkaP5eWaNNRDj6t7aVxqrTPP8n07yfyWFM83tyK/u
         qqBQ==
X-Forwarded-Encrypted: i=1; AJvYcCXp5KUliZEe7fjLNcw6zI/n0J4bFyHrCNMYzhjhL5Y8OrmI6qI51zzQqdGjXVAHXSsrxoArmwcubvweAw==@vger.kernel.org
X-Gm-Message-State: AOJu0YzhClo6EBKOP3itI9lLtf5qN8ccfsXT3oD1LHDvF7d1WgljhBBp
	kg+saC1tZu65XxUp9Y4Rn+5t0wZz13vEC6bsRoCE7tEF2E7SrxV6uDgJ
X-Gm-Gg: ASbGncu70xJIO9acoN4b89cMcW/cQQwHtXC9D8zzFz5rUUdUoNYRd3ZzkXza8Ao1zk9
	7NuohL4MqVjyQ4C59KAv06PxYzQV2g2wmoMWmmofrwhtnaUgnZ9c6O6jiRZXjfZcvH0Tr7nHDDn
	wlNvO7a7j/kGlI588Xn2BVsmy7TVCdvUhl9S8PXZi3VBDGSrO8iwv7RH2hzFGZpEWrQ/Yfk01XD
	qRK9/ABmqVPNvVZX1mKoAXq6m3a/VjHTibkJlav8jgebXVJxzmy17ViWoiluDkzxVVPvgpHDbKK
	+I8bOCTpzFC7MPKfhadzkqhAgQ4fF72Bpr5uGHdLnLTbk+4clCiqBb4d1ydbcc34OGLQhAour5v
	0g9kSzGbiN5PsaD6MSDNUiriSSQAgiEY74/lwMNrZplXCp/yS0QHW0qzAtDEpPjF4VgmQ/hBg5j
	m/tjJFT2/Gv5AbsEKlOnfDIeGn2jruefRwPyICkrVJ6F50Ah+Kah5alOp5uc6g0Kh+iBA=
X-Google-Smtp-Source: AGHT+IGVeYcgA+CwUr1r7hUy/8iCaT15cDHaEmoGMtDm9YvbEjOd+dz5rkW55YdwDONL4X5PTcG3yg==
X-Received: by 2002:a05:600c:3b8d:b0:46d:27b7:e7e5 with SMTP id 5b1f17b1804b1-47117917572mr126637915e9.32.1760983210516;
        Mon, 20 Oct 2025 11:00:10 -0700 (PDT)
Received: from jernej-laptop.localnet (178-79-73-218.dynamic.telemach.net. [178.79.73.218])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-471144238easm248496085e9.4.2025.10.20.11.00.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Oct 2025 11:00:10 -0700 (PDT)
From: Jernej =?UTF-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Chen-Yu Tsai <wens@kernel.org>, Jernej Skrabec <jernej@kernel.org>,
 Samuel Holland <samuel@sholland.org>, Mark Brown <broonie@kernel.org>,
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Vinod Koul <vkoul@kernel.org>, Chen-Yu Tsai <wens@kernel.org>
Cc: linux-sunxi@lists.linux.dev, linux-sound@vger.kernel.org,
 linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 devicetree@vger.kernel.org, dmaengine@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject:
 Re: [PATCH 10/11] arm64: dts: allwinner: a523: Add I2S2 pins on PI pin group
Date: Mon, 20 Oct 2025 20:00:08 +0200
Message-ID: <9520278.CDJkKcVGEf@jernej-laptop>
In-Reply-To: <20251020171059.2786070-11-wens@kernel.org>
References:
 <20251020171059.2786070-1-wens@kernel.org>
 <20251020171059.2786070-11-wens@kernel.org>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"

Dne ponedeljek, 20. oktober 2025 ob 19:10:56 Srednjeevropski poletni =C4=8D=
as je Chen-Yu Tsai napisal(a):
> The Radxa Cubie A5E exposes I2S2 through the PI pin group on the 40-pin
> GPIO header.
>=20
> Add a pinmux setting for it so potential users can directly reference
> it.
>=20
> Signed-off-by: Chen-Yu Tsai <wens@kernel.org>

Acked-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Best regards,
Jernej


