Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D6FA2FE56F
	for <linux-sound@vger.kernel.org>; Fri, 24 Oct 2025 23:32:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761348779; cv=none; b=q1l3wwBRRbrZGvlvjgcMMsX8g4m1xnlLUq/XO40ZnOE0mlbluJ4VBz/jrCQ0akiSwPHpRWFNtBTwfKY81JwPPDi1BWbFld2nE916PCaTa0w0P+7arRVSjRAwxxNrqciVTtUkNCSIZi0ihlJ2A1JzjPVME+yUvaSbvi0Q+A7eq00=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761348779; c=relaxed/simple;
	bh=uTAvhktvg0QkcPyr0Q0jFjF0psJGVFRyizayHmkabGk=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:From:To:Cc:
	 References:In-Reply-To; b=YIXCqTiqxEaNm3e8srUFWpZbqthoEfCFX6L874NFjjfo1Mna9nRby/lr0QUbjYncDNWCsb/Q2VCixIiurqAhMxbIS9S15XyxU5CkVLRBa12koVKiAFTWxs8qWPJS+4ESRde8fPjb1wCxGBG6zXdJbeJmk3Y21UtfHa7Xrm7c3VQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=g6m6IVA8; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="g6m6IVA8"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4711810948aso18783425e9.2
        for <linux-sound@vger.kernel.org>; Fri, 24 Oct 2025 16:32:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1761348776; x=1761953576; darn=vger.kernel.org;
        h=in-reply-to:references:cc:to:from:subject:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uTAvhktvg0QkcPyr0Q0jFjF0psJGVFRyizayHmkabGk=;
        b=g6m6IVA87/GJJD3ajlCcB5mbco1inUtXBb29ngwEz+UlyLtfO7o1SDUOt7KRPkUN3d
         xseovnqYPPnyZtl6eiSZsomtkBdydtDl6uW9JG9AsU8LLCs4DJdnTNyieJzPf+XQbxUg
         eb8kLwiusjAqiJKvOMnr6hThcKURx7oTGYgUAYpVc7Ninf/LBC2ZqCeyQPSOg7NpVHqv
         WtoShpKH3T/x9ThuF/6zDujqgusvu0Iw9SPjHJdePP7qugd/Lz7+gYcWUeupYzvd3LdH
         0fBpwgsj6eskwRr+v5bW72PZPZbzw6Nfj+ZuaHecOcTfu/Mm6s4IeckmDqyeCCWpcQw9
         lt7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761348776; x=1761953576;
        h=in-reply-to:references:cc:to:from:subject:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=uTAvhktvg0QkcPyr0Q0jFjF0psJGVFRyizayHmkabGk=;
        b=Pys1jj/aexTJsMVAWYWFPayegF3tceaoAvlqowQHTZ8HO/Fkvc7CxnHBOTtQa0pnqs
         ZYkJULmWw4h3pmdNLKCw6tqrAhhSrwLbFVdoSq0F3C7jKsPIaiaqnC/aAUupVVxQa/Fo
         dBf68sOrDX2bQ7QNktd7Qa8qj8kV3w/NLGhvkGsioYvPO0ko42LuZNJmn8oUFAZJXqQD
         QnhnjMRdZztaQsVF4L+a8HLZa6xePc7NGo2m8AcYRqHkvt0oz542vNAIrXnQ0hZ2PwT0
         0o0X9q1eXzU7RBhP7hvG0AN2n0a0bvA17EKa8FwwN+o4rhyk5r7aYj953OJ7mKIRkFxs
         G+Nw==
X-Forwarded-Encrypted: i=1; AJvYcCXMwhbzYzeg2KM3Rwf3q5llX91JeWMyJ7wpb4Pn8By4z1lKPGyCZml8th80sMGH594COCUQZ+PCJrxM1Q==@vger.kernel.org
X-Gm-Message-State: AOJu0YyMRrlo2vzFEBVUqqibzYXSXCDNwgGOF8bBV4YLtoFB86dUO3T9
	+6ihp/3mkPM/zIOZilu/0zR2tvvWayJ/kgLKCuKbW/YJ/hrcEnQMvH4ZdjMILHoGCR0=
X-Gm-Gg: ASbGncvoudKwGs0DnfaEIsIriDVcaBKvT5PVRk3xUYFWFoUtXlDeyRlGvgjlpZRdKd6
	KCTxj5FIhI85nQpJbuM325LKxxEoy3YHSSusKA1yv8hZeasQSwFL+f+TVoXg0aPqRQnUOYf0rXy
	y4KlsAilkTw9AJ4J8799HbpvHdP9KIhZa9OGWbHiRUeIcK4rPVXhducFpvX+0huzhLvGPnRy/h9
	nwz8zQKTNraEPgMI3MOf3fhoVJ9/S6zsNC2Yy4lPwMcquuERJd/bBq0dOyNf+Ae6Q2Vv9Z+zAtm
	MCQHwGhBwQ36ppZm3nvuIoiO7KkdIP/MRiM8X9294OLMqpE6LQ+PWTVoA8Yb8O3bwtb6K8tE+0x
	o6ujZBV3PABh9MHFOwJJ6qIlLfopeS6P6hxqH0NnGEMDrXQNfBcmHfg853x2tZX4perV4wktZq6
	vcO1q+ssXZlxy5Hy4=
X-Google-Smtp-Source: AGHT+IGpS+9bXxIYVkmYN3aYKTkh9rmryEYIUIEOWTNg7RqiVEj4YoqfyQVte/UCsJWhkp/A2ApwYQ==
X-Received: by 2002:a05:600d:630a:b0:471:1b25:fa00 with SMTP id 5b1f17b1804b1-4711b25fd7cmr148300005e9.36.1761348775627;
        Fri, 24 Oct 2025 16:32:55 -0700 (PDT)
Received: from localhost ([2a02:c7c:7259:a00:7969:1fa8:db69:6159])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-475dd47794asm6627875e9.1.2025.10.24.16.32.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 24 Oct 2025 16:32:55 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sat, 25 Oct 2025 00:32:54 +0100
Message-Id: <DDQY14HJJS8U.30QSLJ4PCYJQ@linaro.org>
Subject: Re: [PATCH v2 08/10] ASoC: wsa881x: drop
 GPIOD_FLAGS_BIT_NONEXCLUSIVE flag from GPIO lookup
From: "Alexey Klimov" <alexey.klimov@linaro.org>
To: "Bartosz Golaszewski" <brgl@bgdev.pl>
Cc: "Kees Cook" <kees@kernel.org>, "Mika Westerberg" <westeri@kernel.org>,
 "Dmitry Torokhov" <dmitry.torokhov@gmail.com>, "Andrew Morton"
 <akpm@linux-foundation.org>, "Linus Walleij" <linus.walleij@linaro.org>,
 "Manivannan Sadhasivam" <mani@kernel.org>, "Rob Herring" <robh@kernel.org>,
 "Krzysztof Kozlowski" <krzk+dt@kernel.org>, "Conor Dooley"
 <conor+dt@kernel.org>, "Saravana Kannan" <saravanak@google.com>, "Greg
 Kroah-Hartman" <gregkh@linuxfoundation.org>, "Andy Shevchenko"
 <andy@kernel.org>, "Catalin Marinas" <catalin.marinas@arm.com>, "Will
 Deacon" <will@kernel.org>, "Srinivas Kandagatla" <srini@kernel.org>, "Liam
 Girdwood" <lgirdwood@gmail.com>, "Mark Brown" <broonie@kernel.org>,
 "Jaroslav Kysela" <perex@perex.cz>, "Takashi Iwai" <tiwai@suse.com>,
 <linux-hardening@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-gpio@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-sound@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>, "Bartosz
 Golaszewski" <bartosz.golaszewski@linaro.org>
X-Mailer: aerc 0.20.0
References: <20251022-gpio-shared-v2-0-d34aa1fbdf06@linaro.org>
 <20251022-gpio-shared-v2-8-d34aa1fbdf06@linaro.org>
In-Reply-To: <20251022-gpio-shared-v2-8-d34aa1fbdf06@linaro.org>

On Wed Oct 22, 2025 at 2:10 PM BST, Bartosz Golaszewski wrote:
> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
>
> This driver is only used on Qualcomm platforms which now select
> HAVE_SHARED_GPIOS so this flag can be dropped.
>
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

I tested the whole series on db845 RB3 board, looks ok.

Reviewed-and-tested-by: Alexey Klimov <alexey.klimov@linaro.org> # RB3


Thanks,
Alexey
