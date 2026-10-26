Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.178
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792984453;
	b=1Wy1VbeQQynK97k+uAP6duZsEHCjl5dxh29dc9ZRg76jdbU9F/nkc3U07D1pLgFSSEKJ
	 fvp8GzGTe85/S5P0zk8l9ozjE6vDTmhLYVq9bWf4oYGUmzm0Q7VO7meU3UdCygL704aLC
	 cY/+790Kxbv8U716T8/CL512ScvPmxmP2XE25mUiN49pzlxHF+Y/UEdcU9Kf7x8JQRdW0
	 BpUYuwwTs7YveImHVfVAyRCA/KK12b5xHMx6i78t9almUvxHjS9xYEwvcREDUJSOHnuhN
	 gS/7KKmNXFbFPermDOAXhomoGglP9KKvoh57+GRbPvXrnuxXIynwjcWukeMUN1M4BGw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792984453;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=xAr6MEVadIg3S8TLJcAv9yg2n8JxT6a3cXmk1cHLf90=;
	b=2w02+I6jh0YhEeu1Vj7KryYK2NjC07a84uBBDui0bmdJhQAD9FdACLW4KZmniB+6W1Lh
	 KYcG3+08ZiD2vneVWYuWjHjWOekQ+/0IUTQkl1s/En25rtXypDkEALe9XzIbjOCiZFaZp
	 9Kcd7wh/KouJoWiu/mwxPfguvcLyTyQtp2cdiv7bVHbzXB9Z7QyFank5+t8TD4PkxdoQb
	 iNxaBlq4erivhurhoxaF29hlvWXBCmV/xgnzddGUPphOVrA2ZXcJLYp1iTNwrvhYXWOPx
	 j41SnBTZA9l7haJaQqvaIuOmEFkAKgLbYkt/yq6zBfkZSSKhAJJ4hUnXVKh3Yp8n4Rg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=FRFvDmPW;
	arc=none smtp.remote-ip=74.125.82.178
Received: from mail-dy1-f178.google.com (mail-dy1-f178.google.com [74.125.82.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A109B606A31B
	for <linux-sound@vger.kernel.org>; Mon, 26 Oct 2026 03:14:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A109B606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=FRFvDmPW
Received: by mail-dy1-f178.google.com with SMTP id 5a478bee46e88-3645f0f3fcdso4914008eec.0
        for <linux-sound@vger.kernel.org>; Sun, 25 Oct 2026 20:14:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792984452; x=1793589252; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xAr6MEVadIg3S8TLJcAv9yg2n8JxT6a3cXmk1cHLf90=;
        b=FRFvDmPW04wzLW/hmEYDZOml9v8giIyIo/0EsEXlPE+x99Gseodykgp3XmJGtkCuQP
         RA2zt9giQK2Sd+sN5ujXTydan9lujVyLr1WBFjDrrMU/AMxxsc9GZBqdjOOnCHO9kQfn
         4pT8+MpL2cMXwzv6BRD8/iyuOWQH+Tu/i9UoGihsoKEqDcmbszrHscCQnZXyoKjCOxA2
         dJk1HJyBHxZrQvT1B2xx5xczTBSGCDqSqVkr/Wp+0XvZV5oxW8pklcHFD+rMSWCAYmSV
         L3rR80TR44wDbyVmzDKMo5Tep39+bVRDzASTYEyFIl5JC3riSJdyYY83jsdEiEi+PKwJ
         wTiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792984452; x=1793589252;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=xAr6MEVadIg3S8TLJcAv9yg2n8JxT6a3cXmk1cHLf90=;
        b=ANFU9FLdSxjOBeBsjFr6jAr3ikQyNxtLAst0bAFIhCUPOe90M2YIjvlqslCH7DxuYp
         NE11RMUlGyL9SGTo1jMtAdi7fq5BJVM22+CWi5UiTdVNJlSmv9rFs1p7teFSdGxDvB7T
         xQrnu7q7OY6j/+AqW7aj4eZ2WsFVhConqnkUUYexewIAGbDDpvD3SGJr4QDsRGtnwA6D
         L8z1HLcLx9H8wqn2cpRNF0HwLMuQ+PNSMyGPtUIfz4OG4PFp6Sl/cLLpHHcYpKRbgSob
         b8rWcNjnyUWsN1RAfZNUiO0hG8kshcX46ZnwhXBlUrYiRdiHfU39To3TuU4MKsANkjZM
         RmIQ==
X-Forwarded-Encrypted: i=1; AKwUvBy0oVaLj6Vn0d/wlOcYx4iQkXnAOXP28O8EFSH32NrCbFReizwfcdLcgSD5nXyXM+c/w6cKkV+Gu8UXoQ==@vger.kernel.org
X-Gm-Message-State: AFq9FYLow6IywJHG2XBAgpeGdqDmtKAtGhUcnEyKaI5esJRAQALZIotu
	rm1MT0WwYG0RT5qrKabXz++XudqDPCLcxHrOGk8YpXueNj9pOcMaXN4b
X-Gm-Gg: AYBFou1x01NYIll2cfKmB5GmTuiOizL+TQrec2fgk3DTr2hxawQLtDd2N1Bvezm9OZJ
	7wio++f0lylCeGnwdifNPxoWJOPf+PAQdsp0MPs1TuDzbebhD6+xKe8iclL4o2oriD6XYhx5P94
	SvyhGbKxlOej/WCOeJZ0ZNQiN/laZ25yXRrgQ9ryFfZOvUWQKjPQMm0dPeaddJhL9LkPeSZF4JA
	MgTLWWbFPiYtxCPvuArcULQ4/se6LpUA+MdIZ1M5Fc7cdN52X98UoAxO9NE3Hpb/COkrovQYyow
	pAG+PUh6+8joIHoeO8vwHvl9zj6N/d+B8dMk0cn3RgeXRaRmjhv5SyRkXQY/Q2tQeloepbyxfLA
	IPqgZ0wCGMssB4uJv+sNVhxSb0TCWUF01YPUcF634i865MGk2C5RO6dVifLUguAUk8Du8IfkUgo
	H6qRTOzTHfT0g/8eCdqVvEJYIQIaS8hJkBP15RKGg2teaLvrxNgLre/EohWUBk/Sa4+dyHYd4Pv
	LcCMmvHO2CwJSlFLuziEtHwpRhG7ZzMntz9mwe7L30k0uqSIB2rIEtFxgrFxxO800BGQ3eEZN+N
	2figEpNaW7bwZHTym3JOExwWZ2icgBdJihrMo7jiZHWKzfwlgTevIvRv9crD7dWGZzk=
X-Received: by 2002:a05:7022:3c04:b0:151:2e62:fe6e with SMTP id a92af1059eb24-199363a337fmr6367699c88.19.1792984451663;
        Sun, 25 Oct 2026 20:14:11 -0700 (PDT)
Received: from nugod-NUC15CRHU5.tail9f095a.ts.net ([218.237.104.87])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-198a1bfaf25sm20829566c88.14.2026.10.25.20.14.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Oct 2026 20:14:11 -0700 (PDT)
From: HyeongJun An <sammiee5311@gmail.com>
To: zhangyi@everest-semi.com
Cc: broonie@kernel.org,
	tiwai@suse.com,
	linux-sound@vger.kernel.org,
	HyeongJun An <sammiee5311@gmail.com>
Subject: Re: [PATCH 2/2] ASoC: codecs: es*: Modify the maximum value of DMIC_GAIN
Date: Mon, 26 Oct 2026 12:14:02 +0900
Message-ID: <20261026031402.2698574-1-sammiee5311@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261023020906.28958-3-zhangyi@everest-semi.com>
References: <20261023020906.28958-3-zhangyi@everest-semi.com>
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Post: <mailto:linux-sound@vger.kernel.org>
List-Help: <mailto:linux-sound+help@vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-sound+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hello Zhang Yi,

On Fri, Oct 23, 2026 at 10:09:06AM +0800, Zhang Yi wrote:
> The Kcontrol related to DMIC_GAIN affects bits[3:2].
> However, the old code sets ES8375_DMIC_GAIN_MAX to 4, which causes the Kcontrol to
> affect bits [4:2],this is incorrect. Therefore, change ES8375_DMIC_GAIN_MAX to 3.

Thanks for the fix. With the maximum at 3, the DMIC Volume no longer
writes bit 4, which belongs to the DMIC Polarity control.

This could also have a Fixes tag:

Fixes: de2b3119f9f7 ("ASoC: codecs: add support for ES8375")

Reviewed-by: HyeongJun An <sammiee5311@gmail.com>

Best regards,
HyeongJun
