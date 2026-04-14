Received: from mail-pg1-f169.google.com (mail-pg1-f169.google.com [209.85.215.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A926324B1F
	for <linux-sound@vger.kernel.org>; Tue, 14 Apr 2026 10:54:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.215.169
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776164049; cv=pass; b=gDCAx7M5BZukwCCKsBqjpuThokI0lGAUXvV6ugAdoOOfMsLzlzlEmF7a+65A/VpoJ5DBnM8MNprVT6njw2EZHf9ZnTxVPp3l9FvkqTTv9t1uRWS+AZ6y+LyJgAwKjn26vOoOfwZdokCE17NyBsbtP2cgElOB7EnSQ+ZiEm5f/YQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776164049; c=relaxed/simple;
	bh=IJ6eZNFa4BvzEyhZzc3NkU6Mj7y0nTg/7TgB/BQzNgs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Mskbjtye4pXjSNVealTMksrw96hWQplyVY5VTGM4RLLcqq8YCayyx6aIoPUV0eVtAEyfKxzEBww5bBS1vxTq37jozuVTvQ6o/hyYev9SKrIx8gx0fXoxLVHjhiP5pLHH9HGmoPkcwm884MHLvTMvRvH/mFJ2JQBtkIajCw1KZaU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=O+bHQ/XX; arc=pass smtp.client-ip=209.85.215.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="O+bHQ/XX"
Received: by mail-pg1-f169.google.com with SMTP id 41be03b00d2f7-c70ea5e9e9dso2306303a12.1
        for <linux-sound@vger.kernel.org>; Tue, 14 Apr 2026 03:54:06 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1776164046; cv=none;
        d=google.com; s=arc-20240605;
        b=MDp39Kgs5r3uBqZJTBd1TD5qyVgiAVrBgVra2V5W221NnILhkdWgdxbmQAtnOHfDHd
         mJcfGoG+RdMh3wE+3VNFA7Dmn5Wm82bHpHSBpNSsVGo4eD5X+MVI6sJv+jnLV11gr+YI
         F5l24f2Q8c3st+Ur2kbd2v4xZef2TwQRXpaFj1Ht/9yhUjaWJ5jjntT/m5Vz2A3jzNAS
         RE26taam3TRAEbe3QN44gnLHCbNPXgk50FiVwAzbkb4aGs19cumyXedo6dJYlrvn8iZY
         czMeTWhllxfeVRYtYMD0F95b4/qhiRUDbWP+S1nmqLRcEymbQncg/6YZ3pNB0Jz8Qfug
         Sfpg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=IJ6eZNFa4BvzEyhZzc3NkU6Mj7y0nTg/7TgB/BQzNgs=;
        fh=DmHuuTGSqLxMj3lpIqTi5qmserST/Jg79oMd4PNwv4s=;
        b=UAl/slraMR0CROeyF2Z0Z33zckLud/AT7tZSnWuKiv/gJmiO6wEvObwjKzBmsveUvT
         kgc0Ur/NHHafVLYt/7UH9drFPIZN4gRqVzuluEmnufjkyxgoUl+pPwdAogx9MaKT7XXX
         YE3vvCcmpUvnaXG75nXivDaiyfBQjfZIqZJ7RFoRzdM8vcfWgAVSczPsjJF9qIAZr7yg
         OhtM9kb0tVzJ3v9H1qUhLwNDD08e5Cx9JZJleymX8hgCISbX+49Cjy3Hjm7lWPa7vtSa
         zgK8q6yCYCQDqOim+k76bnzSxrP2mQGW/YSVONH4g1Zsjy6x0wH98Hhcfh4PxI+tCSZH
         I1HA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776164046; x=1776768846; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=IJ6eZNFa4BvzEyhZzc3NkU6Mj7y0nTg/7TgB/BQzNgs=;
        b=O+bHQ/XXtMGwOQKs7GXvIf1SYUw0hn5HcY0huKkwdIYFQr+5ASKkIzPgfvjvu/SPBm
         wlrKWa7vT2KMB6lrdVmz1jXhGzaMdGt80RelWBHBV27o+OnkDaK4gtNpEY6P/mUzD3Yi
         FQhIQzuJf48ekau/E2Xt65k1WyPv/xlJNadUaPjFhGotWXGMR/7LipkbY33NXiqjF/Eg
         AqxCpCr+5GjZVaTbIZlNtBaDgQSvKnz4BnsRIwokRoomXvjWZZqUtyfJ7hNX/UwYSK2A
         PUl9tqmNgchVRx71zA4nfsGJy3nmyUCsdYffgFWeCxU5eH286nPrCl15Eb80i7HiaRvK
         1DNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776164046; x=1776768846;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IJ6eZNFa4BvzEyhZzc3NkU6Mj7y0nTg/7TgB/BQzNgs=;
        b=TWgCOm+l2bi1ykeUpfoII6PlewcelYfl+qP7WDKX1fQJmvSPavmeQthDsE5Fh7Qe4C
         dGVUoDCVQCK2RGMi0O9PUmmD6j/3UUSz4BkiduDXqvBEmdYsk2DB51rySfLiQS+5DIMf
         lbKy0UkJ7QFrvjJF7eavAkWeMBos+3oA6z9j1kghZSV7CzHeUe3yvAcxT01Js0Ik9M9X
         +AKrjR163t/t/LYx3iYKJjaRSkh7+L5EKpyEHbeCP3lZ1k9TWP5q391Csn/4DuQ+jH/e
         HGPBcV7h/2yAnDJ/aWwdXH1Yck6aTy2Abs58BY1w5bEjT9ZBMKKdJlL9Geu9mtK1q41i
         Y/Mg==
X-Forwarded-Encrypted: i=1; AFNElJ+NTUMRKVRjC97Syw4IAv0z39NsaRSva1sfVWnJbRb01qlH0JO+daCyiGUZS+nkQ9Oq0u6IcEmnbfjPgg==@vger.kernel.org
X-Gm-Message-State: AOJu0YwCdlijFXwEOqXWrfJpckUbCbkTrmbnuQ2FtiAUF7/jkrGh1I00
	+XTVskWG5SeRTY9p7yyyORzP+wtKbNvqYBWaroAAGxm+rzA63WlMhT4FSUBCVuhXixiZyZY6B8B
	eLiTHvfZRKvjLSijXHqjCqqL2SEK8Il0vxBRK
X-Gm-Gg: AeBDievyItaL13eXe4WE6ztcmBi/XjtSNLKO7c7JUUwmvyNHSBXJdzhTL8ttguG86/2
	TDk3ntVOxfEYF9UIXfaBLQDPgfenoGT2cQqWqVup3vg0ETfpZ9FXpVuIitSos4a11WzWwjFzPVp
	XDaNwM5XZ4SnHUfVWl9y1RJx/I1IzwkiLGrOy7sYdv5ERT3IO4ccL531BwTdwSDnXr6LRkBoXp6
	rY10rQABuKVcpiN0R6fCKi/ammoS10+nAojV/0Q2XnIRKBIhCznWd1fINB752cVmaWMcegMQCty
	37G+MhYKOpXsN0gGTfzpCOs3mMn5pziiW00MUw==
X-Received: by 2002:a05:6a20:6a13:b0:398:a060:a97b with SMTP id
 adf61e73a8af0-39fe3c2d507mr18527614637.1.1776164046322; Tue, 14 Apr 2026
 03:54:06 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260413100700.30995-1-phucduc.bui@gmail.com> <20260413100700.30995-2-phucduc.bui@gmail.com>
 <87v7dupfx6.wl-kuninori.morimoto.gx@renesas.com>
In-Reply-To: <87v7dupfx6.wl-kuninori.morimoto.gx@renesas.com>
From: Bui Duc Phuc <phucduc.bui@gmail.com>
Date: Tue, 14 Apr 2026 17:53:54 +0700
X-Gm-Features: AQROBzDvbXBRQEOHytM6mfwHKRF-_puUL3-UZMWiLosO-tI7eLbkJKI2mRDU4oM
Message-ID: <CAABR9nGu6HyP7HA-0RJX7t0kbufu7pAkbUq9MV9cWUAd+uzS3g@mail.gmail.com>
Subject: Re: [PATCH v2 1/6] ASoC: renesas: fsi: Add shared SPU clock support
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: broonie@kernel.org, lgirdwood@gmail.com, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, geert+renesas@glider.be, 
	magnus.damm@gmail.com, perex@perex.cz, tiwai@suse.com, 
	linux-sound@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi,

Thanks for the review and explanation.

> You added clk_spu in this patch, but not touched.
> When I checked whole patch-set, you initialize it at [4/6], but [2/6] is
> using it. Maybe it works, but is strange.

You are right, clk_spu is used before being initialized.
I was not careful with the patch ordering and only ensured the series
worked as a whole.
I understand now and will fix the ordering accordingly.

Best regards,
Phuc
