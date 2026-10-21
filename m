Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792595306;
	b=IAkP31HbSnU2dUhsdqqqvTYjAnuElepi9tsxZGPUxzDEgDHIuwQfrw8HluJim0tCGYZl
	 uv/6m0pvlGFg78j4SlHqnrJFHgdsu2jUI7U+ZaYqN1NN8QHtAwgEpvcStsLWyA3Vj2kaP
	 z3tHHTkS0f+rmj89gMJInKewK3tLUNktlOc7US4Ech3oVLyPJsAFMtFghjKjL8os9sJDg
	 hMjLZ/CYHXtbL4F+9RD2r43QDqhKcbYt2T+1mQN+nead0zHKtONvlNGL0SL+bi/ZGxEZ6
	 EWEylYZATTNuWy7YJss+nOmaHKloniL7vJf+TjWfpPN6RxNifgdUkA4RyDQUXMLouaw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792595306;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Subject:From:To:
	 Cc:In-Reply-To:References:Date:Message-Id:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=8OE6HZ58afzSrCKfxYeVUqdKEpFKAmKlQXDzm52PrLw=;
	b=gFWWU9jGUst6Ghs0L3gcM5O99bAAo2kjnC7N4aQSv5GYQHM7WJr6CKkQ7fEyn9nPQLC1
	 +cB11EP8mBFmAqx8+Pp73QU5PTJV/e1maHtcfio+8Hc1lb9pgc7+NhYkYJWsgk/XFSCIM
	 OYzL0PL8XHr7W6yf3ATsaBVef5IFAl/UqdH0XdOE/decYpLQVev4HD7vXyG9TxMHRK1Cb
	 S702uCgpkU7xTLyeYXi7+LzObH4y4WbNfipJ43J7twxovaPX3M/p+kAnSbD1gPqi6whlQ
	 D43g1ypabzHf2FdDii8MHkTHMoRzkVa4QW2AK2Zbo7nBLQ0oxRZToXDToBUhdFu8XEQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=baylibre.com;
	spf=pass smtp.mailfrom=baylibre.com;
	dkim=pass header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=E4CktCv5;
	arc=none smtp.remote-ip=209.85.221.42
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48179606A327
	for <linux-sound@vger.kernel.org>; Wed, 21 Oct 2026 15:08:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 48179606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=E4CktCv5
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-48afcd7ba9bso610271f8f.3
        for <linux-sound@vger.kernel.org>; Wed, 21 Oct 2026 08:08:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1792595304; x=1793200104; darn=vger.kernel.org;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=8OE6HZ58afzSrCKfxYeVUqdKEpFKAmKlQXDzm52PrLw=;
        b=E4CktCv5h0hOVeKThNfg46aGgszaxRwECAc2I3tpILFrPSImd6lGT9a3P2moZLgdr7
         0HwCFIoyG01DsFY3uPKjnlxB3nGwCyvqJq05+5eYshsQOvcNvjEOSWS1IVQLTOpCIPxB
         fo1QbrAMTW+11fpucmzpkRDZVYVc/ZXZL236LLhg54V8VKGuZZacIbSFaC9/kuibrSyW
         PJvwnsy2VBej/dT2v9maweVVgkK8eYZGpCngOaHvS1/ZvReZUwyN72N/9irPv5FJbCuR
         Zbf+tOHaJDlgSyz9F0FUNojSu8RLGIktGCgAxhYyYmkUfL1773lELmkzen4rKW5mp1wK
         +z8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792595304; x=1793200104;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8OE6HZ58afzSrCKfxYeVUqdKEpFKAmKlQXDzm52PrLw=;
        b=nWDu9h+3FZxMBXNK/3BKqC6kiavyRv+7g/MBgYA99/hpZ6oCG8+K49VfMQQ5UbAvQ1
         FfPiwMme7iJuCESlw81atn+FCZ/EcaqAsIHzF/GL0PPwZEZE5ZWeHMbp/f93YsEbuL9q
         kU740lSNkZznkr7mAyKYM38JDzWggHLJT5rSsJiDuq3cP94gm53YGNS3jys16fh5l8Ir
         tOOwuSrt5zm0UFAVYGZ2oi4KOu7iG28inamJN90lyflPbiGjy3D6vw8v0aBhKAFCANeE
         p6ryhGLiZR3B6/uwPci/uEONz3aNtuGgpjuZuh7IvZlOG4nq1h4RWHLgvaJ0VjCXBriH
         Qwzw==
X-Forwarded-Encrypted: i=1; AKwUvBxkTCZbvk48aJJFu0M22o0AnHXgsumiiuur9hcYkV1q9cYekkzvI6Tesr2CItVJjpDU8AD1IsgD9Ds0eA==@vger.kernel.org
X-Gm-Message-State: AFq9FYIhlnVgtQpFdBMyTVqw8+j6AZpTPZk2UaMNLe1S+cHO0vpbotXh
	bxUbIpEEazGARUR/HDNIP7A+h+DEU8E+sRNH5SzQfWQB4cA6C3pYwZxiYThjn9gtT/g=
X-Gm-Gg: AYBFou18csFrb29O27f6ZnFmhFZhTEhm/ARJHnScA4x8BV7h9aKBMNerByHLiKCmsQs
	KfwzIdo523DPqkGtnXVHQpfKoeeKSmXXjbUOzE9aKhP3KCb5LPZUAtQzH1nDAWQDT8cSsFk9cxK
	CHeJwKUY0bVIC6pAlvuAcxnk/3M9mYtLkXO5eVCp+PJJ0pSxNvMTmA0Q9zBRNbhYNBp+Dd68R37
	zyPKptPcFvMnid8PP7XXqsz6IXNOzAX9tMt7gQiz4r9LA2LT/KY2QJ3B5V6NO75lN2pBP08n0D+
	Pm7U6eEcjil0pA4buQAW7wl6xhkxHyUSO00hCucUvN0pg0wC0dwnlkV2DEHl1o1/BIV7SWAm53x
	/AznpMoTeNv9wUzaJx/qKDDrBnq98WWE4jul1ggTSOUIhAro0RPn0VZp0vZ5NMSTihvwPwieR4Q
	6TaTIEqMBUyTrICMOe6vK968UCcP7m2qzEsIRU5xYUfQ+1zRFJjkwqXRAmddqvRgAF6OOqq4Q5i
	DEDAaif2F/fkN2aYYAilJW7w+BxCEyi+/YPhX3dXfDX56QSi1meyWuWVONio9wno+cIoMKmIxk=
X-Received: by 2002:a05:6000:2301:b0:48d:e61d:68da with SMTP id ffacd0b85a97d-48e264ab2a1mr4944600f8f.20.1792595299491;
        Wed, 21 Oct 2026 08:08:19 -0700 (PDT)
Received: from localhost (82-67-6-57.subs.proxad.net. [82.67.6.57])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e25835404sm6652761f8f.42.2026.10.21.08.08.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Oct 2026 08:08:18 -0700 (PDT)
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Post: <mailto:linux-sound@vger.kernel.org>
List-Help: <mailto:linux-sound+help@vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-sound+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH v7 4/5] clk: meson: axg_audio: add S4 support
From: Jerome Brunet <jbrunet@baylibre.com>
To: Jiebing Chen <jiebing.chen@amlogic.com>
Cc: Jerome Brunet <jbrunet@baylibre.com>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>, Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, linux-sound@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
 linux-clk@vger.kernel.org, jian.xu@amlogic.com, shuai.li@amlogic.com, 
 zhe.wang@amlogic.com
In-Reply-To: <20261021-audio_drvier-v7-4-2b9aeae9cb8a@amlogic.com>
References: <20261021-audio_drvier-v7-0-2b9aeae9cb8a@amlogic.com>
 <20261021-audio_drvier-v7-4-2b9aeae9cb8a@amlogic.com>
Date: Wed, 21 Oct 2026 17:08:09 +0200
Message-Id: <179259528986.4070168.1199000664504589178.b4-review@b4>
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=437; i=jbrunet@baylibre.com;
 h=from:subject:message-id; bh=YqvMrgag+SS1YYwbYaYO3LQNDj+WNIZgZH/cwchSYXY=;
 b=owGbwMvMwCW2VtK+WnvWU3HG02pJDFk3rsar1wWxnVjfVDGxa747u6jg0rYvk7MLdt3qiLDcW
 xS2IKGyo5SFQYyLQVZMkaWGu1r8naTWl1nTdW7DzGFlAhnCwMUpABOJUGX4H71gnX/nHxExLkv7
 tJyUPv9053drfe9zHuE8eLKWy4RpN8P/osR9DJwFEsw8Ljx5/LkOB3vFmap3fj1ptnpub2r9YQM
 GAA==
X-Developer-Key: i=jbrunet@baylibre.com; a=openpgp;
 fpr=F29F26CF27BAE1A9719AE6BDC3C92AAF3E60AED9

On Wed, 21 Oct 2026 15:08:31 +0800, Jiebing Chen <jiebing.chen@amlogic.com> wrote:
> Add S4 support the axg audio clock controllers, Compared with the
> previous version, the selection of the audio's clock and data pad
> will be designed in the form of pinmux control. The purpose of doing
> this is to distinguish between clock control and pin control selection.

Reviewed-by: Jerome Brunet <jbrunet@baylibre.com>

-- 
Jerome

