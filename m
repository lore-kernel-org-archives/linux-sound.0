Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07BC229BDB3
	for <linux-sound@vger.kernel.org>; Mon, 20 Oct 2025 17:58:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760983122; cv=none; b=VQMCprRwuy/mzDVzbzMkOTKOn9wMoozHBFUDA0ArwBY++Jr7GCyYcVe2AKKAB41VQlGGiCJ5Fta3J65yM8rxnKFtuPLGgsVBK+yqUxKyJqNJFSrO79YXWpbOjkQ6kg0LS2YoTBCSe2jvhyCgV67sEVPzqLVRldQ744/ZWLJBEr8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760983122; c=relaxed/simple;
	bh=V0ywM16huaA6vxoSrQo9VcxXEvOPk2Rt5CdRZIoeNHY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=JJewvLQeltLw2lWdoMjJNOhM1IBofXrLb4qPRisQQwv6iigZjNn+RVthkinTcmlFaGLpUGeJVnsQGb7KcongMkOxyYeOwQ7/uAvWYY76nFFfBW2JnYvpzlN80NPuy/GiYiBntl8894Ak2hIGZ8rOQVdRM2MqZPbkTwZE/G5+5To=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=c3yeKzs9; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="c3yeKzs9"
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-4283be7df63so1239229f8f.1
        for <linux-sound@vger.kernel.org>; Mon, 20 Oct 2025 10:58:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760983119; x=1761587919; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=V0ywM16huaA6vxoSrQo9VcxXEvOPk2Rt5CdRZIoeNHY=;
        b=c3yeKzs9FPBDpm8NfVTZjIYNE6HCojwEl7itqNZrHDIWTKGQXhd2ltwrRkFF8QCtQD
         Ny9+scbR1rdywhRHMBiNfWPOQzcqGGadc2c+aHUcB43siKJXSuLZyUBYOzZ36lTOxwnj
         ibGvhkO4KHt6Wgi7t56hlv/L877HrL3iq220+uWlidFv6c8QZEzaCv0/O/SdWbvtYuk9
         tv09hFo9/cjPwzt+UEzVwEWeWPdOH3Bx2HPjCIEb89ZOSZ6Htrjr+vnlHpwy8FcnTNyB
         WuHdhsRb3qMjs3lH2jtsmBPiCxoqZLJ6xH4OHZh/7TodH0DycyKrwd7fMJSJuOPVz8M4
         sfXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760983119; x=1761587919;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=V0ywM16huaA6vxoSrQo9VcxXEvOPk2Rt5CdRZIoeNHY=;
        b=mKiV43im63qoe0ezlG66N30WPtMi1q/rpYvR8Ah4lWFL+FNSQ6tFqnpw58SPMOuhE3
         Kjrsk203Ks+LXozy1j3DyLLItXilUnIVZRFrMm62WjlEF3WCKExUphqGvUcY/LVfCIsF
         JMkSvfYkdQH9C9febYX1A9fBwtmVwD3IWOajbCti1LgRpHDoxFBYsVOC9jL3M+wdFQc/
         JgXnowXExSNJL/S7tZSBU+hWmz7v5d6ptVhlydeVnoLKtxOeu1FcbKUfsjBBcHAmalOI
         heAeLCvOTlgBZm7rNfWFgFzO1n9n8fkgsHd9Ijshv+VOHaqgj5FyX9ZPVqX+/85tcdWm
         mk+g==
X-Forwarded-Encrypted: i=1; AJvYcCWBTGKXmzobsuwSJoz7sGx8xVai28lz8aRtdCuUKyBOu4andoXPqPwUmIgkUWrfdZIWB7i/e7EJhzqDHQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw5voX9OqRXUpI/hiSYzSRNxPtdoK1nMJyHo1YC5qHixkfTMf4F
	3p7Bp8l6Z9ea+tOTAFEL1RXN2Jmipt/eiSa1KUNY+NiOhJbBcpDNQzNU
X-Gm-Gg: ASbGncvzRMtIgbmGhoMDBuC916rBjhNaTKMcQI7V/gViOHqrwYp/yxxSlngGw/MDmZ5
	bNLuENgpHFBtb2faAOFq5VTRogBeN3Q+1bj4HVler71r9gpEvhzt9Mw6bXE2+/f4LZIOl6NnjWo
	ajGyLWBJV8a/z8om+RVT7emCAyvTWpQU4b4KjFFj5H0tr0UUh4ideLy9VPLkBtcSQqKqU03JCuK
	xiv/ggTrrSE7IYZTQuhue/EjEcmfPJaF+nE6St5J0vGpGFOOp/r7VaXkdP45X7otkzSdr/TPcf8
	yRyYgqnYysd334A2m77dLt0poBJJsaRIjlRmhqB7JjtGIGxGiArJp+xFqOnUxa0sQFUDEa3kwyd
	4zZ5d8nkaC5gY94Yv1YdXzjTWp1QqSaSrOVeZC0uL9FGBGpRzpK97y87CfBrSbqOKEBQXJOuj6N
	gWorvU0gwvPZ4Fi1ZgrPEJagDlxc/6ptudQPUQlwOrP1h7xqGHxPOQRQpUC1pmpO2MyypNYguCt
	a6tKA==
X-Google-Smtp-Source: AGHT+IFevLoNtuerBsIw1VuRArXCqqtvXfnOs340pTPBnyLhuRUJ7DD12vxDIIoA4Zumvg8MBc0QBg==
X-Received: by 2002:a05:6000:2406:b0:427:a27:3a6c with SMTP id ffacd0b85a97d-4270a273c43mr7686143f8f.63.1760983119338;
        Mon, 20 Oct 2025 10:58:39 -0700 (PDT)
Received: from jernej-laptop.localnet (178-79-73-218.dynamic.telemach.net. [178.79.73.218])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-427ea5a0f7dsm16168108f8f.4.2025.10.20.10.58.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Oct 2025 10:58:39 -0700 (PDT)
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
 Re: [PATCH 08/11] arm64: dts: allwinner: a523: Add device node for SPDIF
 block
Date: Mon, 20 Oct 2025 19:58:37 +0200
Message-ID: <22871360.EfDdHjke4D@jernej-laptop>
In-Reply-To: <20251020171059.2786070-9-wens@kernel.org>
References:
 <20251020171059.2786070-1-wens@kernel.org>
 <20251020171059.2786070-9-wens@kernel.org>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"

Dne ponedeljek, 20. oktober 2025 ob 19:10:54 Srednjeevropski poletni =C4=8D=
as je Chen-Yu Tsai napisal(a):
> The A523 has a SPDIF interface that is capable of both playback and
> capture.
>=20
> Add a node for it.
>=20
> Signed-off-by: Chen-Yu Tsai <wens@kernel.org>

Acked-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Best regards,
Jernej


