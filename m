Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16482451992
	for <linux-sound@vger.kernel.org>; Wed,  7 Oct 2026 08:34:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791362060; cv=none; b=H15up8n0opBXSnqWEnrc0Nnzzijs/ARWDtVZu0YgiOpgPIcW+lTdpv98KKi+x8vT4e1uH57CkOAmVXrLJMoJ+vDmvDkDATc53yl+A5Xs9oJj+14gWJbE7Su1W98vczvcS/6ZE+SPoINmPgvSdiIpphDUoQF7q8fgYPPQiMKL53Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791362060; c=relaxed/simple;
	bh=k2LWVlEbO4mtlO7zkAsTCCHDAZ0eNseSbBPcM0qvM7c=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=on7hdF3qaE1wF67gsRnvoBv/qNiZ1mUsAS+VuyJd9UysQpfuA8VCSv0lZuzW+WxUFyZUyd+8CW/kwUpr/luqc9GS8Cv1T8camrkw03x9NfG6n7Y0HInP6pnRrZs1pGOaAic4eR5soWrD8fFiSiH5e/AfQlII9vN3En0biUeteDA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=YuRYmcJB; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="YuRYmcJB"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4a0286c981dso34167125e9.2
        for <linux-sound@vger.kernel.org>; Wed, 07 Oct 2026 01:34:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1791362055; x=1791966855; darn=vger.kernel.org;
        h=content-type:mime-version:message-id:date:references:in-reply-to
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=k2LWVlEbO4mtlO7zkAsTCCHDAZ0eNseSbBPcM0qvM7c=;
        b=YuRYmcJBr7bRkIHW5cS3rRVHhMcU6eQfGY3vA4mJPU/9owTwr85YhgGKF+5JAu5HpS
         xbuTq9lDL+M2NNPwbBk555eHYcgF1GoYK6Kj9vHyCRh+LioCEHbs4yHXsXrHxREIr8Qp
         iVo7ACndj6rnzfKagReUmKm66RSfYp3ne5w5S7qEfGVRk1DQZC3JlIIpEXVXQL1BHQDR
         K04RGFGdPRijH8kio7I7NmBHvOrWDINDmmexWQ9O0SqdfLoy8cG/mK/ccnfrOz47VC93
         M18VY7Xz0Mde9r2oGW+C5MLlCif6wezSfBHjGIgSu/dTa4r0nqhs1LF03Y15Rz0rmWwS
         Z6yA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791362055; x=1791966855;
        h=content-type:mime-version:message-id:date:references:in-reply-to
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=k2LWVlEbO4mtlO7zkAsTCCHDAZ0eNseSbBPcM0qvM7c=;
        b=PYuWf5utN0OsxQKFO956JC9BYw+doDuAss7nVazoW5HG2cKfv1YxmUWoYx3R69mLxo
         x5fj875S10XX0ESs/6WfiV5KTBxDhUd0o6dETUygL46shnpQoFyERycdBtKQoqfqUrf1
         jY1iZofYg4DdhRPcpdHUrXONRqQiX9gTYH3rrGXSLUb20mXdm9xEti06AioVF+373xsa
         xOyJU5D/Qgt+hvREo0KEUu+6pvMuTmVhiOflt7/OvH83kHw1J0OdjtsabS6S3zv/Wapj
         VOgqgmeB3SEP4rTK7Zxyhn2d3YJoZJ6VNCyVJpO4ftCrPWLkYC0MGbV+oqeub6ulZGgh
         z1dg==
X-Gm-Message-State: AFuF++nq/6iUB2uP3qZSnJW57hUKon2Kypzs4s+Ql/Vc8YwjMpzXog0g
	cLXTkdVoVjCo7EKryZSOXRwmApMdiEOP102xd2w+6aGwRhQcDIFM+Fh3kM7xGwf0JoI=
X-Gm-Gg: AYBFou22dtdOItoqr0z3dLxRLQ30c3gWjDvWgdyCCY2yD1PoWKe4wujPjbJ7oMN1qr9
	w+t6JJu3WPTqE+jE20xakWR3AX/4ytpZ1ljbgoMSYisIF0Ns8Dr2c0IsAe559i+PW5f38rCK3HD
	JJ7zEtpnuRrPBUJlTEebgIhe5T65sUKGjCQ0pgcMt30M79r6Z0mIZ6C6w9lDMTMQvKo9IcQK48s
	KhoC4iXtiS0R5XUelK/e/T+BHVR8rN+Df3M/nkYZxRHdn86cYfh0jUY//yr0FAxh3RkzmPPRD1M
	Z03l9NL+ZGA+63DJB5cjTzFgNdPtRAdsQBSyKjhdMSwe1bwWlF4woBjqrRxJYeVH1jzHe6rBZse
	nH9kDhIuzSe8J0rZv+g5jjWDfgc4IrCfPDQndT0JRYCxLy1+gkxQMm9jpvrmIxsi7RNZ+mJF4PR
	8F/X9VbcKPNQXaasC6Y2c3BGNSU6AFhL59wh8ZVf3rJ7WgOPJDJKBxEM89bJd8Uc0TmWtkeRGee
	Dk8a/WLJ8E1/tX/bXBO9yugtg==
X-Received: by 2002:a05:600c:5254:b0:49f:c1a1:5222 with SMTP id 5b1f17b1804b1-4a180679d9dmr19886705e9.33.1791362055220;
        Wed, 07 Oct 2026 01:34:15 -0700 (PDT)
Received: from localhost (90-182-211-1.rcp.o2.cz. [90.182.211.1])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a17f493761sm79454375e9.2.2026.10.07.01.34.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Oct 2026 01:34:14 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Valerio Setti <vsetti@baylibre.com>, Liam Girdwood
 <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Rob Herring
 <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>, Kevin
 Hilman <khilman@baylibre.com>, Martin Blumenstingl
 <martin.blumenstingl@googlemail.com>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>
Cc: linux-sound@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org, Valerio Setti <vsetti@baylibre.com>
Subject: Re: [PATCH v4 2/7] ASoC: meson: build gx-formatter as a separate
 module
In-Reply-To: <20261001-audin-v4-2-2476646118b5@baylibre.com>
References: <20261001-audin-v4-0-2476646118b5@baylibre.com>
 <20261001-audin-v4-2-2476646118b5@baylibre.com>
Date: Wed, 07 Oct 2026 10:34:14 +0200
Message-ID: <1j8q49zz7d.fsf@starbuckisacylon.baylibre.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

On Thu 01 Oct 2026 at 18:06, Valerio Setti <vsetti@baylibre.com> wrote:

> Instead of including it in 'snd-soc-meson-aiu', create a separate module
> for it. This way it can be independently selected by either AIU or the
> (upcoming) AUDIN.
>
> Signed-off-by: Valerio Setti <vsetti@baylibre.com>

Reviewed-by: Jerome Brunet <jbrunet@baylibre.com>
