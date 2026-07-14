Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D8764ADD93
	for <linux-sound@vger.kernel.org>; Tue, 14 Jul 2026 16:09:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784045343; cv=none; b=M+VpFHr2M8rM0nm/G3qI8NtK7znOaSFUVzXbTzKSKOtN2Ic60YLyI7Uo8hebNZRjemWVLvGEC/fNo+rcbWJPn4IVD7l3x8K8I/y1oPZUTwMtJH81uoZkiO4bTgQwa5F/xQ8Pgs5l3ku7Bt1E8KoUrQEUhrYfI3j6j40Fv2OIVRg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784045343; c=relaxed/simple;
	bh=WChOIXCXpcq0quURVEjiQP6ReSE7dcYzMBe/VviNclk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=rbvgfshFBqrL5kNWt6hJ6qqbLSFizEkivt9IJQme1Mj1eKCIr/ux+zTJ9iNf3YlTY/H1SzDnsGpiohH1afXofLVMuYjDfxgjcJ0XN+BfzQQ7vxEkzCsVNCgwoqr9tl/nrhfN+ZvXEz1PVc3MkKtMbRWt83utA7cg4sQk4c6kEws=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Sb8/iQpb; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Sb8/iQpb"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4921eed3fa2so38141245e9.0
        for <linux-sound@vger.kernel.org>; Tue, 14 Jul 2026 09:09:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784045339; x=1784650139; darn=vger.kernel.org;
        h=content-type:content-transfer-encoding:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=WChOIXCXpcq0quURVEjiQP6ReSE7dcYzMBe/VviNclk=;
        b=Sb8/iQpb81IR9LJx95ImNQ7x/i0mgzMGNgJcYTOI4DyUEPfwEPYxA/xikZJAuscv4Z
         YGziR1bMK2sA/SlOFRNhpwwUvpPgoOLIejrEj1jPEej6JvV7BXjJSZ//e4x/5/rk/0r0
         D69EANTQ1VQPAT3bo7icbD48gpsqPRLydcknqCIxTazdzTXDF4zl8lSPzNMKSSEHxOUN
         YYpBqu9d07HaFnPFnmCdHbkW+Oai3kIfcza7wYD61FrH6AL49PAemJKTkuFR40m/VEbn
         NNFveGdYzbxkz2ghps1BOVmrRL5csSfdM8ENS+6q0NB5Pc+IwZJeOUlZU12UYZiARn5N
         KxTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784045339; x=1784650139;
        h=content-type:content-transfer-encoding:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WChOIXCXpcq0quURVEjiQP6ReSE7dcYzMBe/VviNclk=;
        b=BUI3Sw8xINbL5gpyvBtAI8MRPx9AoQ/W6/JQ3AzPwbGhJh95K+y5uWNdyng0P/Xi3r
         3iD7D19Nicyvvh/jidKtCqrYQ7YWqCErVw3MkJw2nH3+otSi2L12LLjd++C1qgIKMKXM
         P791OJYoHY28Tolt/2momnHMs5gnBGq5nleO0m0fjWeKvDmXtko6x/ewtwkrOSeIbOCl
         FZNN37hd9BDIYoP95G0ViJU4st2g6nOBQIk/YUUJkwO5ivQdZPFukwJ8kAO+HoClpsrZ
         g8Y/pF0oXAYTVx+YqPiOwrfjrZaEExjnD6aRbJNxVdA//wRkdIam6GG4PG8zBmnXWSeO
         WQeA==
X-Gm-Message-State: AOJu0YxHtIKVgNbveqHfIc3KD1VuuRHan+mEAZdvMwvPcvBLCXv+bw9D
	YA5BlmBHeEi9QQRvPRf2QHImkYgVa/jpG7IXDJmGWKHDEO4gCuf02PFUI0ozoA==
X-Gm-Gg: AfdE7clKsiYa4kJUSmsV7z/MzMDLhsaPOjemnL9W5knlgK+8v2lWLzBhL7rC91Nelve
	3hcRPLRY1qwv9qEVE7IX3Y+yKDaHDdV+EU1HT1zwVQwDKsQvK14tyTOU82kW+lh36rNvfIgNinR
	Jd/HwWGmb0x5/k9dcZvELm6XNukKrYDC/5ZmVMTUiom6w4bbmEt8scppE1iOiwO8yo/d4DPzpej
	0rvUXNIM7VYgSXVETpXPTbzUVNQlbhib8G8zB0cZ6ds1ZSckOWdfAo59UB7K8g99TYgQWJsRg2H
	o+pATAlRJ1vp8zXLVpSJkIGZRTmnSkjL332mqZQxDCBv5ua+23mgaivoJMzw+mUWF5LUC/Rm7uO
	nHxTRN61eQUxnFoO9M8uVWUSMNUTfzQNlvnMJvBwzAr+NTmKSrU+sZuQjkhv2N6wUYBpw7JvExD
	H9jtWCT6C0sdY0+rz0ZzR31Vv6uYiozrJQ2tUfhkmt12vC61CvSRLpYrb3EoY26eD4kYYwFCAvK
	5h78mSRgaYBKu7nEOYXNkLNCAuDRjEnMXMa+nz9d8lFVAzMdqveBastDYhXr/VeCbhBsBefLYfk
	btorZ8xsxXi9V+eC4GcriqcBh7wF4QClNw1Up5IEd8IuiORVjvE+DDgPz4RL3V0iIieb+aFOXZf
	AXHDYem79uT8IM5+6Odtu3gMicMMlrKcANeIDkmd9K2w=
X-Received: by 2002:a05:600c:6303:b0:493:e4ce:acd0 with SMTP id 5b1f17b1804b1-49538992918mr33564445e9.1.1784045339225;
        Tue, 14 Jul 2026 09:08:59 -0700 (PDT)
Received: from jernej-laptop.localnet (213-161-4-244.dynamic.telemach.net. [213.161.4.244])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4950a2f9402sm88923595e9.13.2026.07.14.09.08.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Jul 2026 09:08:58 -0700 (PDT)
From: Jernej =?UTF-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Mark Brown <broonie@kernel.org>, Chen-Yu Tsai <wens@kernel.org>,
 Jernej Skrabec <jernej@kernel.org>, Samuel Holland <samuel@sholland.org>,
 Chen-Yu Tsai <wens@kernel.org>
Cc: linux-sound@vger.kernel.org, linux-sunxi@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject:
 Re: [PATCH] ASoC: sun4i-codec: Set quirks.playback_only for H616 codec
Date: Tue, 14 Jul 2026 18:08:57 +0200
Message-ID: <rIZ28csxRO67EN6Ja__8tQ@gmail.com>
In-Reply-To: <20260714113304.270224-1-wens@kernel.org>
References: <20260714113304.270224-1-wens@kernel.org>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"

Dne torek, 14. julij 2026 ob 13:33:03 Srednjeevropski poletni =C4=8Das je C=
hen-Yu Tsai napisal(a):
> The H616 codec does not have capture capabilities. Set the
> .playback_only quirks flag to denote this.
>=20
> This was somehow missing from the original driver patch, even though
> the patch prior to it in the series added this quirk.
>=20
> Fixes: 9155c321a1d0 ("ASoC: sun4i-codec: support allwinner H616 codec")
> Signed-off-by: Chen-Yu Tsai <wens@kernel.org>

Acked-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Best regards,
Jernej


