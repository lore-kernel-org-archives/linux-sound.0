Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com [209.85.215.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E11031B82B
	for <linux-sound@vger.kernel.org>; Fri, 17 Apr 2026 05:06:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.215.182
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776402392; cv=pass; b=hlnjZnZPh/6Bs6CUqS5qoF86NJ6YVxPTKVTOV8iKHgkBaoke780PiHtsg8iXcKkboJaP1CUOlcIRRy4EIX6x4aKz/VOkbGM6Sce7Ff5h7DnAVFcTZfutExu84TMnBthkxeE12BgwFa7D6eYjJBx/odrna6VXPzSNcdbSWiz8VWo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776402392; c=relaxed/simple;
	bh=cGpcP7poEsGLGthFXBvfo5NNBMVcBhH+NFqPvNbFjjw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=k3eKUPUwO1f/D8lIk3lrBLC06L0+2PdXBHVklHjOyTdy4F5zoJV8z1MHpNkOJcQWdA8L7vNLbPJQro8nOchPjH2EWQ3TIhvXOuSLuka/eO8vT6pMEHzljkhd/mwrXz95F9oZldgX8spgg+Gp0O0rmXxSF8TWi6gTU7ma1JPVBNo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=tJRlLXKm; arc=pass smtp.client-ip=209.85.215.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="tJRlLXKm"
Received: by mail-pg1-f182.google.com with SMTP id 41be03b00d2f7-c70fb6aa323so85428a12.3
        for <linux-sound@vger.kernel.org>; Thu, 16 Apr 2026 22:06:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1776402391; cv=none;
        d=google.com; s=arc-20240605;
        b=ggfNVjJEF6xmbHIpJ6zln9Fm5ctySMKMdOfOlvUhhmvz3QmUSH/LsjQUAiQGcjB4bc
         X2e/TC9OinufEYLAhIX5tc/JBvBv9pKI8nAapLajBVDTwFJSbhdD77biw9LQo6TAEa8Y
         3bKdqM9JJFcXW++GvB8Lbm/lEw5sOvBIFTTngCFyDSs0g3D4chwtzLR3InbFybrUK7fR
         CcTlmxK44LDCP/z9EOvS8qAthZ02dtXAD0N9/KSF+gsowngSmcqTCfB/8qM5ZlqyXGtV
         4vs2nuqtdREF4bX/DNHybQ0iWYkB5OPlWH1VBOJPsvP3/OsAG5yVi+BbmHvd9jZNDwby
         tp4w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=4l2YkIki7u4jk2tOd6Zkab62D8yPBgbCmDn20o+e7AU=;
        fh=rcl4MZmDeAOp4ti3eZPKC8Jd6VFwloSdCpHKMyl9P3E=;
        b=A8c0ic8woTHg1Bkcyw0NAC08E0vq5mNYzG9uu/0haZaNJfuIUtiU43KcD03LtlKi4J
         6yZLWhJLgLUMP+AxSVCKz3XbjDnV0XM06Z5nk9RQrdFTTaZaaST9FHKCkxDQyPouPz+X
         0T9lfokX9HrMlgc73WBFcKJh7KEL+JLHCLDVZA/ocHDKBbsiLcHrQ2IyRVYyDt8Rgc/J
         nkjr9CSPOKIPWcfwyfT3VzEPEvzcc61w9KVAPmXqdodWuqTIwRtsFyHDgj/DzIeHJYpT
         DMYsOJxkQO9esT2KMof+Fs+TNL8Jof6gfyCIJ/+Mnpe8kQ/H5nMRtKNMnb5YiKdZBrKS
         ZtpA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776402391; x=1777007191; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=4l2YkIki7u4jk2tOd6Zkab62D8yPBgbCmDn20o+e7AU=;
        b=tJRlLXKmLfJU5pgAp72tDQed2JtBHWTxObrAjcxcor2Tpy7bgFnwgrBEilArSq2lau
         qB9xsakeplDoUiW5izs54hubxnoA7ZKs3c2wmCVd/fZ6UmUXQtMZ4AQs6qntq6JFhBNX
         O0UlpWNyE1G8VbB3kawN5AORbBoQfvSe2/EUCUFOgpmdFKEAQVx2aZOrq1Bg5fhSCTrG
         WXZD9BvydEyH6sbHzBMDZiaCaHG3VCzSGKHbE+CDLj3v6raVMWLyiRY85xriBPkUg8SB
         Qhdjn8pAOd66vULxU/S9Tx5TDPTuwyYdDRe4p+57WTCH/5yrOXqXmaE13WrYdRltQL6v
         R1Vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776402391; x=1777007191;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4l2YkIki7u4jk2tOd6Zkab62D8yPBgbCmDn20o+e7AU=;
        b=hDI1wrvCvXoLyZlLFWNKEyzeXYo7xVt//1LBqFcbVTzmgAJJ51ZMQOYPBKgn2VcbeF
         AcH/QT+d+oqvaO2ExQqoFK5KoIvlkQAL/QSpRxq0uowTpqRfHokSQdbH87M20MAMy5mf
         1GAAUVH0l8LSMDse68mkq8GObiLb6RY4u2/muXjpgEUjF7n4ngqpxWr55jZBEzHJN4HU
         VAetVh+HVPHKAaq9xaYwJ5XmOH0znTuC7zYXWohp0mFrOZoT62p0RNPoHz3sH+66QIDR
         6L2IkUBJwjeCQvXeR5sv9V/dtkqYCGPk160JNqSriZYtclFFM7eO2gXIpEITkblaixC4
         EPTA==
X-Forwarded-Encrypted: i=1; AFNElJ+dJT6DFsWNeY+vgEoiWmoFHPwzuFiznceX0T9UGEKPTILUxGBDcF+WLtdaawjYDYTUJ9PxCPdm3Cayzw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yxrhc3hxVMyRgRNC7Sa0zvCr5vgl33x84yWSQEydLP+w5t0E3pb
	Xoq5OTjYAx/5jPR3zrIghJWBnh0bulnbqu4wTmv+stjfnxwDVe81Fliw0yiqAmnJJ33pRAmWHsh
	eCw9uLx/G74pClyHGT8zB7JUiGW+Oq2Q=
X-Gm-Gg: AeBDievoh2Vj4BUDY20lG5IigXe+nYtYlGPSshWwiWUxpn1Td+urVw9DAUvI8TGLDHq
	C8E1w9az64kk/LOlD/tPtIhZWpnGw91C4w3gh4bpl5usdUF4Tz6+enYWPAd+aiT0pJ9N9vhNbvG
	kDY2chedCC+iNF+tPP15mvXy/1q2fWk+7g8g7id6AkNTCbTjBKNXkGWAuN2dqHeukXCkXtjQRiw
	ogky5imCzpUJ62ekmLqVg02LK76NJePitqStQtibgl9d19tDo1mCR1IKCb5AY/c3KCpb3/qJDG+
	xQyW2wSmdwcMIYaedj4atbMRvbcLvUf20jKyTu1T89E4q5Jc
X-Received: by 2002:a05:6a20:2591:b0:398:9ae9:7110 with SMTP id
 adf61e73a8af0-3a08d6f1419mr1420155637.11.1776402390758; Thu, 16 Apr 2026
 22:06:30 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260413100700.30995-1-phucduc.bui@gmail.com> <20260413100700.30995-7-phucduc.bui@gmail.com>
 <20260414-funky-sincere-polecat-20b0bf@quoll> <CAABR9nEKGSRNp=eK=ZHf6-MNsj=6cDCy1YdbzSPrHyuc3Ux0Ow@mail.gmail.com>
 <CAMuHMdVPbcz4rF8ojEcvxp1NaM2mbQ2o+HZLwnnjNnX8uHf4HA@mail.gmail.com> <CAABR9nF131G3K3-vUdaDwHuQ7MCCLd-VO5syLApE_qsn+J49kA@mail.gmail.com>
In-Reply-To: <CAABR9nF131G3K3-vUdaDwHuQ7MCCLd-VO5syLApE_qsn+J49kA@mail.gmail.com>
From: Bui Duc Phuc <phucduc.bui@gmail.com>
Date: Fri, 17 Apr 2026 12:06:19 +0700
X-Gm-Features: AQROBzDu280nT-xrC2OOG5fsst3QzaCGzF7yDjhZKFyOB_YIxODbhFQoQv65pgQ
Message-ID: <CAABR9nHhYOhMnHwrqK9oRE50jyC6kq9UFpxBdG-Tum6Ajtf3Xg@mail.gmail.com>
Subject: Re: [PATCH v2 6/6] ASoC: dt-bindings: renesas,fsi: add support for
 multiple clocks
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, kuninori.morimoto.gx@renesas.com, broonie@kernel.org, 
	lgirdwood@gmail.com, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	geert+renesas@glider.be, magnus.damm@gmail.com, perex@perex.cz, 
	tiwai@suse.com, linux-sound@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Geert,

Thanks you for your review and suggestion.

I think this approach looks very good.
>     clock-names:
>       minItems: 1
>       maxItems: 8
>       items:
>        - fck # Main FSI module clock
>         - spu # optional SPU bus/bridge clock [...]
>         - icka # optional CPG DIV6 functional clocks for FSI port A
>         - ickb # optional CPG DIV6 functional clocks for FSI port B
>          [...]

Just to confirm: using this approach with a fixed order and optional
entries as described would not be
considered "flexible" in the sense that Krzysztof objected to, right?

Best regards,
Phuc
