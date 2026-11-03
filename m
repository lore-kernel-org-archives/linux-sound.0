Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793694462;
	b=qiRID4lp97Xp42KzeJpEp6rfRShSw/p3JTzyLkafnh9Lr4f8cgqLwJlpk+uP8OjwUQ/w
	 pcc+vMHkPQgWEuZKGSJKC5dWvrqh+5hSxyoH23s/krZ2kfUSMjtzdH8TaMNAH3bR+FR5o
	 4KuC4wcx1WEjlkv9yq/rSV0wouPI4TG+pfN6qDvHJhbnTkMVsneE34D/xnR2IWK5tFrJA
	 omYcWzcPsdE5T+XQfVab1IE1Rp44oulWGSNtzf6prxYpRROfI25sDAs3EKkeukSSynnPs
	 9ssBGUCyP0AxPvjqgQlZZe7Cy68Sfq2ZIq1R1s4CnXrEeLhpYn8RYC/wTCsP3NTQ/OA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793694462;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Subject:From:To:
	 Cc:In-Reply-To:References:Date:Message-Id:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=E6pq6ak40PnPg7rzCuFYJAL64PxLZCXIE6ht0rHomGY=;
	b=Q/m4lMAmcinwjiVM0t/z2ttp5YlGPXQ0xVjtwQtsStsxGfrtGccq4XmnlQxa46uQ9McU
	 g8rUIV+B32pTf6eZyAhOamVaC/gb++WiAtV7sMX4rHApPAAfJACBBwgGmBpJYo1cMSqt4
	 xq9erk4v+K0tjHR3Q8MB3esER04kuFNsTAN2OkMwKDXyYsAWqr8KhDTcHooCcBQ5l4kU3
	 jZQw3/Flb+Mycr8ftERyUu3xiPIPf5I8nhKUXJVMUXfBs0UdK32q5yKalvUMAR7wY4e9g
	 qL/lPYpu1KvBTfZMHPFhvHADzGP3Lql52TUGjSSO/fTktughp+CT8H72RtrqTNDJs8A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=baylibre.com;
	spf=pass smtp.mailfrom=baylibre.com;
	dkim=pass header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=Y9BrtkBa;
	arc=none smtp.remote-ip=209.85.221.53
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7AB4C606A326
	for <linux-sound@vger.kernel.org>; Tue,  3 Nov 2026 08:27:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7AB4C606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=Y9BrtkBa
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-48e00eee27dso1946452f8f.0
        for <linux-sound@vger.kernel.org>; Tue, 03 Nov 2026 00:27:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1793694460; x=1794299260; darn=vger.kernel.org;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=E6pq6ak40PnPg7rzCuFYJAL64PxLZCXIE6ht0rHomGY=;
        b=Y9BrtkBaP+bm4/LU+6qfRuvD653GVyhcZQpqSTn5q9ZshvGXKKFU57Lt+9493dEEG8
         2tZpPGFIaRPef/sWCz7O5O4HbkvsE0xDiiMyHTnG2XUn7wEv9J4PncagAzSLPjcnafQb
         0mG2UYIDzBdloFkfOHSAiXPb1gCAmaHgeIxNLEH6jIvaBwaQpxwJHcb0h0rvlWmP1WXG
         ZVY8BE1fCDt3QK3qKSXKxJJIoHoW/G1E2Xlbhl6tnzNVInpAOEZLHPemel6r4iMeNfIU
         keKQsTVs520f04nyLQgTzi7zyIBYDhFLApAjcz/tQQA1KcvsNwZ1yCwDG4hWXsXiDXea
         abpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793694460; x=1794299260;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=E6pq6ak40PnPg7rzCuFYJAL64PxLZCXIE6ht0rHomGY=;
        b=bCzXSiSYC7+jCWpXPvGrOnijkKVlgAcuYvIuHG9FCjb7XoI0DIU68u6/TWyKfG+J1x
         4Aq87TQRfPW20pVXi16qzEDaV+qWQ9BLmH2mqyCa8fB6FbbAcAXdRgeYkxz6OrfxdXf+
         RK3g+fWBbIKWyd+wtDBEbU9GbsKuu+NOwvxm/E+VMBE0QauHtxhZ6QpvXBe7UlrAlu9j
         iOoH7IF2VIiXF43ojhoYwqI6xRPtAxC6k+WXB2gMh0js+ebhPRQVYwzzYKlc0Z8O73u7
         5twPm7YBpbbsiG7LMRFBAdmo6nSc6JIzpCIAXAgNrfgg6kRSWUlKBInA3lneY1LOQ4mS
         +LmA==
X-Forwarded-Encrypted: i=1; AKwUvBw5TVowE6Qe4NaPYzC+yZy3js7HoYw18N1Gsmp7MfruvCl3wlMpq0h12LEHUCZRwR31U5kEeXql4Vxn3A==@vger.kernel.org
X-Gm-Message-State: APuU4Z8YV7zvkRrw2NdFY/nZ4v1diw7lIaGiUEb2ULojne8fION8qXui
	NWP3moLFReRWdFMe9xaswoi/JPf/8775PxE1mAba5QzK+svezP0W3L0yPX7Nb2U/ctI=
X-Gm-Gg: AYBFou1jcurWnWgPmFuW2WqSZVvDuPHrMPp8Jy4K4dSI5IFMeo+iVI0BLjEeUDAvq1o
	Qv32M27ePC72QZTVOhEvwu+KZLssMLPHZrvNZzmoALOJOzSI1261YBKnDfLdXtkC+Rt5omIiH8x
	yICa9hYeybZIUQN8sOlpEsABeWku7cac7UJeyJbg2LFVLqXeMO6gjDGfwryasLqV7H/ulvfJGXK
	H4tN/ELOzt0ijB48FgWplrUKSzn4ydBpJj9rF4dIF9dPIBMkMD+SoTTBVE5Qz1CBHgA2DyMEns7
	aMbd8aEsjMbEIC9kZtuvzcgbRoXQ87YoGaHKVfzUUpT7op2LkHZed5Nkbl7NshekEyud9cOaj4T
	UBVEvUBSy5SumojR9CaJW/lnE98W4TJZkEZEd8ahZZguLYVl+HKhKgtwdXsTCN7NJ0T17P7ZGhL
	Kh0Xeg8QBrTWuTKTmY9a4dzQIMg+L3Mex7jnkFtiR3Xc8ovDC8Q5+Bx3WcJftYyiEXrmimXtVfG
	JejgZ19149ZXanayRRvIA2qVp+4ln/Dy3pXgsWGtV7lMyRKK/aZy7mwZAjSHxdkym0z0jnYlkJi
	dN39gHlTxwLb4tdzWu7bBh6iRXQ=
X-Received: by 2002:a5d:6f0b:0:b0:48d:ed30:f863 with SMTP id ffacd0b85a97d-48e6e304aaemr28242503f8f.30.1793694459888;
        Tue, 03 Nov 2026 00:27:39 -0800 (PST)
Received: from [127.0.1.1] ([151.61.248.197])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e86a06078sm7666552f8f.54.2026.11.03.00.27.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 00:27:39 -0800 (PST)
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
Subject: Re: [PATCH] ASoC: meson: axg-fifo: request the irq with the clock
 enabled
From: Valerio Setti <vsetti@baylibre.com>
To: Jerome Brunet <jbrunet@baylibre.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 linux-sound@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Sashiko <sashiko-bot@kernel.org>
In-Reply-To: <20261030-asoc-axg-fifo-irq-clock-v1-1-f8c170ac8b0d@baylibre.com>
References: <20261030-asoc-axg-fifo-irq-clock-v1-1-f8c170ac8b0d@baylibre.com>
Date: Tue, 03 Nov 2026 09:27:33 +0100
Message-Id: <179369445362.97387.1853118570427796429.b4-review@b4>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=384; i=vsetti@baylibre.com;
 h=from:subject:message-id; bh=w36hV1IUYMxpRRFJ0VIcI3DKJb88rpzFhmqT04FnZko=;
 b=owGbwMvMwCV2z3ty7kUrRgbG02pJDFkvZ303F1f/kVIiF3xAbXN2+m1Do7+9s9VvKp1ZdKF+1
 e4U/gusHaUsDGJcDLJiiiws0+/9LihVe2iccLIAZg4rE8gQBi5OAZjIhDaG/wGCL4X0gr64XVnW
 4nnGLO0fd4zAeeE/ikezsz4f/fVOVIfhv5uquuzhF+1N62ce/CKqYaxpXFAh8qIu6No+Nr+z96+
 HcQIA
X-Developer-Key: i=vsetti@baylibre.com; a=openpgp;
 fpr=0497DEFB707526E13360C970DE4B936DD13A0100

> The fifo irq handler accesses registers which need pclk, but the irq is
> requested before pclk is enabled on open and freed after it is disabled
> on close.
> 
> Request the irq after enabling pclk and masking the fifo irqs.
> Free it before disabling pclk.

Looks good to me.

Reviewed-by: Valerio Setti <vsetti@baylibre.com>

-- 
Valerio Setti <vsetti@baylibre.com>
