Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B56614F70
	for <linux-sound@vger.kernel.org>; Tue, 13 May 2025 13:15:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747142157; cv=none; b=N/YqfqPJK0sA3QMYa2qImLzhdXfAoNWDqIiqKE6ruJKTUs8U8C7TjNhMUw80GUsXQXq1RzgyYdl7RH87+twxYq/L5+5KRtCxDlZ/Ihb06U+MqmfqpVXME8xEoOH9wtiLAy0xHk2L9mQ3Hu/Q1ep2gctT5a+lyDxuKBWWRcYpHk4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747142157; c=relaxed/simple;
	bh=hRylyn1PcQVlg10HiqmNfXqVxRHV0X3JGOuwCnjPmdk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=SsXdheUaPmjPcgGDzsP54kNarUSLKxMg0/pAQMIX7LKwnuFZBAs7kjd0B5JfTX+dIskqpscit0A120u+8uD5vW1zwYf+BeYSftv+BxmDUsT0pHKPdL5orbI6hhAc/SgnYuarl6pTzaI/8Ym5eu+2rW7ZGEh7AOiEwSk2Ugk0RDg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=gVvTLMBh; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="gVvTLMBh"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-43cf3192f3bso59903535e9.1
        for <linux-sound@vger.kernel.org>; Tue, 13 May 2025 06:15:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1747142154; x=1747746954; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TPY3rRdUVBrXW+v2nzRIA0l1VDmPMKxlLUGaAoh0kXU=;
        b=gVvTLMBhVx0qH1Q2Q2Sb8T+pCzhIs/kLhJBXKz0vcE+A+kmDWiiBBksdfjS1emlogH
         oOdWHfhYxNPoUPzsohIFLd07d2jKKabNbzlYOXVplos4h4R7Cix+sfZTqA64hyvEaTf/
         KA1wzHq7uwBMgLejo/bMyRQtgLN7UJOnPp6sNSsuWj2NyMkKAGLB0KkNIViv0MM/a9bb
         DNZILVi9RM7qrFntEIBUTnIhzq83y4+yvFPOV8N62TUytq4pWtJXUenzf7Uc37vQLrmj
         7T9HOxiacvbX9q+fIGDzJaHhgINnRzFku0zE7DouSqMGc9Rl6phfNY3xFAB82+lJIxiR
         VxZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747142154; x=1747746954;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TPY3rRdUVBrXW+v2nzRIA0l1VDmPMKxlLUGaAoh0kXU=;
        b=Z52iAvKsnwCHZzof1FhrWv9vjfEx67l/XkszJBiojsLmyeOLCHyGvKTBd5hUXqcUTb
         DOE3axxk260ZAfiIa12z9rFXJdy5TdcRQEWTlmgWOBosWr8y7fkzyIM/Q5VTI+/dew9e
         dxcziU6o7kAXX31wk/fpPHjrgmA3NJ96wFBLnT9vsWzX5QOX0dvo8aKELl16pAURKQlR
         9pRu29P8ZIx2lDbVf6pH/ok4GfSOHZ1KTTjzrnt6NKd17ZYe/kB81UZ1uAJ/bYJwq1z0
         4xj32yd1R/QRkLP9TIvmV0cN9WIYh8a6DtiW5lNZ3u/bcQ6qWyBl0i0Yx9zJLJy4Y3PM
         Unrg==
X-Forwarded-Encrypted: i=1; AJvYcCWy5OY4+hmfFNyO186HEWUxDLbU+lekLVpkUaDlh2B+ZfaRgPFWwsRfY1d9pFpa/j2foZqACBvBF+gQTg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw6FQtO+I+ks5jIVj6ExzpJTJYBQ6ghUHje35/sd6lEWZrSivRR
	15vYiX0oXUk9YUv8J06gsYfekxi6XWroTpFLj8uxYAtGIyIL7DXZbA4xCreIxMc=
X-Gm-Gg: ASbGncsZjixuibpu6+ZJ2VwHMtFjHUZHQxo4mLaTb18aDZcChsFvAcd1C8vA75GCaqd
	qWFAX82z4HyOBSaMe6P0q/6gZ9tLC5oEQ+rIj/dpm1DsWN4OW7z253Cb0v2Dyf9WyruPbCHWKyq
	VN/X0CEv7oQpVKF4FQsV0NIhm8rTDFyY03izJ4OmODuJJqO1nIpN6eIG+KbYAKGATswZbY1VR6/
	NdzRS8VgJHC0+s+26oSSr+SoRI9Fz/f0aUBmzxj7MNcdzanw9p2cl2I8XzNvrntGv5wj/6uWb3h
	LyKP8IBmHJIKlZe6pJls2G0Rbxx51ccr32mV4ZPNffC/0MhF+d1U5yCLvMmUOvVy2dhq9wWTblw
	RJnD/0izfa6AVnOSjni9i0PAj
X-Google-Smtp-Source: AGHT+IF45Z3/yPJnSPxFe0jDPVCInZwQAAhswNv4Px26NKFArlJLvwKRwbJZn6KBm6BZg6uGp+I+6Q==
X-Received: by 2002:a05:600c:3e0f:b0:442:e109:3027 with SMTP id 5b1f17b1804b1-442e1093222mr108939215e9.24.1747142153624;
        Tue, 13 May 2025 06:15:53 -0700 (PDT)
Received: from brgl-uxlite.c.hoisthospitality.com (110.8.30.213.rev.vodafone.pt. [213.30.8.110])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-442cd32f3c2sm210290765e9.15.2025.05.13.06.15.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 May 2025 06:15:53 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Linus Walleij <linus.walleij@linaro.org>,
	Vladimir Zapolskiy <vz@mleia.com>,
	Piotr Wojtaszczyk <piotr.wojtaszczyk@timesys.com>,
	Charles Keepax <ckeepax@opensource.cirrus.com>,
	Richard Fitzgerald <rf@opensource.cirrus.com>,
	Andy Shevchenko <andy@kernel.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sound@vger.kernel.org,
	patches@opensource.cirrus.com
Subject: Re: [PATCH 00/12] gpio: convert more GPIO chips to using new value setters - part 3 for v6.16
Date: Tue, 13 May 2025 15:15:51 +0200
Message-ID: <174714214927.9467.6551553602169960677.b4-ty@linaro.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250506-gpiochip-set-rv-gpio-part3-v1-0-0fbdea5a9667@linaro.org>
References: <20250506-gpiochip-set-rv-gpio-part3-v1-0-0fbdea5a9667@linaro.org>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>


On Tue, 06 May 2025 11:01:43 +0200, Bartosz Golaszewski wrote:
> Commit 98ce1eb1fd87e ("gpiolib: introduce gpio_chip setters that return
> values") added new line setter callbacks to struct gpio_chip. They allow
> to indicate failures to callers. We're in the process of converting all
> GPIO controllers to using them before removing the old ones. This series
> converts another round of GPIO controllers.
> 
> 
> [...]

Applied, thanks!

[01/12] gpio: lp873x: use new GPIO line value setter callbacks
        https://git.kernel.org/brgl/linux/c/30d15b8949828811e9df3dafc12e3d523ed6e154
[02/12] gpio: lp87565: use new GPIO line value setter callbacks
        https://git.kernel.org/brgl/linux/c/978d23c1db9a303f2fab817de28087ada5859a9a
[03/12] gpio: lpc18xx: use new GPIO line value setter callbacks
        https://git.kernel.org/brgl/linux/c/4f71abfef92d9e302c7c62744fa806076b3ba819
[04/12] gpio: lpc32xx: use new GPIO line value setter callbacks
        https://git.kernel.org/brgl/linux/c/1a7b6b536d509203325bccd88ae42499b45f5765
[05/12] gpio: madera: use new GPIO line value setter callbacks
        https://git.kernel.org/brgl/linux/c/2e6b7f5ffe08d42196b31322e6443a9874c79a03
[06/12] gpio: max3191x: remove unused callbacks
        https://git.kernel.org/brgl/linux/c/75e80b69e1367b95a98107fc38351b5b865c568c
[07/12] gpio: max730x: use new GPIO line value setter callbacks
        https://git.kernel.org/brgl/linux/c/1938913798082cd284ab59afcdf68c2bb5ba1686
[08/12] gpio: max732x: use new GPIO line value setter callbacks
        https://git.kernel.org/brgl/linux/c/66a6d0e5a77889cbec98152dadda70dd79f1678c
[09/12] gpio: max77620: use new GPIO line value setter callbacks
        https://git.kernel.org/brgl/linux/c/8f9da4401b82faa788b663402ea699ccfd756597
[10/12] gpio: mb86s7x: use new GPIO line value setter callbacks
        https://git.kernel.org/brgl/linux/c/dff5a31dcbd260eb61f0128876910809f04f1e3b
[11/12] gpio: mc33880: use new GPIO line value setter callbacks
        https://git.kernel.org/brgl/linux/c/51227589e8388b452b4315907d2de5f7d5a06e87
[12/12] gpio: ml-ioh: use new GPIO line value setter callbacks
        https://git.kernel.org/brgl/linux/c/d3f960365b8c35449d22b780383dc9b40d96203e

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
