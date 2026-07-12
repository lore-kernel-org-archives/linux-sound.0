Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF97DAD24
	for <linux-sound@vger.kernel.org>; Sun, 12 Jul 2026 21:02:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783890125; cv=none; b=KsNC8jXMpBDiEbt4M1HgMNh3CNRPCuxw8WNSnXqA0ORTYWioR8cwp1NHs6W+wvsi59aIiesMzFapF+RRTjqz5EMWCmHVrT47+fJGcuQjeXn5w1yDJrvdNfX6HDTdZOJFfVf+ci8d9HETGh6YpBsD/E7DqfKyxqW0f+8HOtJ1Sp0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783890125; c=relaxed/simple;
	bh=T28gBk8PpRiPyrUVn/AV0hFvwxFNY2+cfEko7TjUCSs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=B2iy7WNVmqvUiQ61z7Vzu+NafwpznvMw2eDmKFR9YBEeKxjQzniyFTq4z/rttX68M/uBflsq4vfiEUwo6WPY01nRZlfZH/PxqNPrLyYheKRLQFJOybMHXNWqpRTFL/2Q8lpwNvI/aFfwNqoQNfUFEMsRDcYPhTCmye2GmwiIMC8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cy7/dwwz; arc=none smtp.client-ip=209.85.208.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cy7/dwwz"
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-698aa7ba3e6so4380776a12.1
        for <linux-sound@vger.kernel.org>; Sun, 12 Jul 2026 14:02:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783890122; x=1784494922; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=MkOwj6BpgCPRb3iQcJNzYz3de1+iZ+z6XiAk9dzhA/Y=;
        b=cy7/dwwzPxMTtlw3cBF0h3Ax4cpmgx13Y4zYoURprm6Vn+kMsOqWR5DLnF/jU4rff4
         XIb9iYtiQGGTaupApt5f5lKejuobSckjqZyCkD0SuN6QrnzsYTvm8OUxxydcVZuGK9mR
         SMrqzQ/0P2P4ah+Qaz1SFwBLWH4g8r8zVb5D3PWBG7EfEjzVA4DK6xJlNYGGxwCTCa6y
         JzvUpSIkvL2e1g7xfJa6nwWQPktjQsn2dcnuYW8RHHp6TDgdb+PhL9sYausaitTDW1Eg
         Nz45wNUS6w8NQJNg0pLVeFfT+1rf6Gx2St+AzM6lawzWe83LhZoEhNZyPM7wsg3eWNvJ
         61Nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783890122; x=1784494922;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=MkOwj6BpgCPRb3iQcJNzYz3de1+iZ+z6XiAk9dzhA/Y=;
        b=hxjAG+Ri0Z8bUlPehzLKYvDimGDNPfgTOwnacElDPKqitk1ZD+ztmfdfUlRMoKAefl
         AowwbK9tLNdN4za/VCoD8v37RmH2MCwWSwhdt+WoTfUiewFWn46uaPg+/wFinVrzS44z
         f+lSUi+BJIapsFrNYaHfPjn6IcDCq2+y/TByzh8VeH7EY5Bwu6L+ajc0DWNw/Bsaw6kW
         uoEUy1avogRAFGQa16rPjav6ChPnYU3rqInMAozEJyaFJLIuUKI2zJ8az3agpdv6jLbg
         a/8GL8RyoOe0IT770eRCj6PyXs+wieXTwXY3POhrswraAxYSIndhXztKNw+4Sqmb2KDC
         ttpQ==
X-Forwarded-Encrypted: i=1; AHgh+Rp30SUwWv9kGOVCkbReVTTDwzuHlOUnPxoAs/qYyvC9XvtZ+uwwug/djuGTWDBD0vG7BVqkfKlpdOZ7pQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz+s2ztz9D6LCKfGezUL/uvrzQx3ppAgtx4SPA1EE8rNRHancNY
	48vwZHVKSWT9cwQ68JIIHJwmv+/bNQqsYxHQB+/HNIpEmkCqlnURGyfQwve4p0Sii+0=
X-Gm-Gg: AfdE7clvDKZIaCi8SyHg6OwlY48rkCiWkIsD6sZv5eRayZxqzxKfZt6Tgi9DMLpkcgC
	g9tW70nLse17/FxIQMaNjT50sRn9bAhMhPBkGsDABnylG5qUlDg+qrtBtT0I7fM4fmMUrsW2kwX
	GQ7wv2Fn8rkmRgcfFGu9M5x96DdePhMeUofuV37ENq+iFOGClYexWXYzIVPrYb/6Kf9V7SMIle/
	1Pdk+kQ1bqYd7ZhNcY9KgHTEsyPQ7G2yh4YvYDMsnrLMbtSuux+HvEqiggamLO31vNm8W+0wdYS
	YlTKVY9r5feCJxdMizI30EAs/O0MRm7PgqavBg/PmtG09kdqz8BzNdVjJcJTO1RubwjzlNExFax
	CtfSaBolVr6Cgz3pcS1WQVj7y5FDqggRbC/ynKTaQE/evsNZ8Kh0sPcT3y9psVqToLRZTdMgd/n
	5nYLmz4jKqWnF8ZxwXKeaXaRsadtivQA==
X-Received: by 2002:a17:907:bc87:b0:c16:e54:9cbb with SMTP id a640c23a62f3a-c161ea62321mr271109066b.25.1783890122065;
        Sun, 12 Jul 2026 14:02:02 -0700 (PDT)
Received: from unknown.tail46804.ts.net ([2a02:b027:14:a57f:d586:c83b:e719:c2ed])
        by smtp.googlemail.com with ESMTPSA id a640c23a62f3a-c15cd42b336sm721045266b.38.2026.07.12.14.01.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Jul 2026 14:02:01 -0700 (PDT)
From: Gianluca Boiano <morf3089@gmail.com>
To: "Krzysztof Kozlowski" <krzk@kernel.org>
Cc: Gianluca Boiano <morf3089@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Shenghao Ding <shenghao-ding@ti.com>,
	Kevin Lu <kevin-lu@ti.com>,
	Baojun Xu <baojun.xu@ti.com>,
	"Wang, Sen" <sen@ti.com>,
	linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/2] dt-bindings: sound: add Texas Instruments TAS2557
Date: Sun, 12 Jul 2026 23:01:47 +0200
Message-ID: <20260712210148.384870-1-morf3089@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260712-cyber-gorilla-of-acumen-19070e@quoll>
References: <20260712-cyber-gorilla-of-acumen-19070e@quoll>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

> +  ti,channel:
>
> ti,audio-channel
>
> Most speakers do not need such property, especially that what do you do
> in 4-speaker configuration? I found only two references: awinic,aw87390
> and awinic,aw88395.yaml.

Dropped in v3. A node now takes a `reg` array of 1 or 2 addresses;
the device at each index applies that half (DEV_A/DEV_B) of the
stereo firmware. Device order is the only configuration needed - no
property. This matches tas2781.c/tas2781-fmwlib.c's architecture for
the same firmware toolchain.

`reg` is capped at two because the firmware container itself only
defines two device types (DEV_A/DEV_B). A 4-speaker board would need
two independent stereo pairs on two nodes, same as with tas2781.

> +    $ref: /schemas/types.yaml#/definitions/string
>
> Wrong type - there is basically no syntax like that (except a few
> left-overs which I remove now), so please kindly do not upstrem some old
> code. Drop.
>
> You need maxItems.

Fixed in v3: maxItems: 1.

Gianluca
