Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 586E7181B84
	for <linux-sound@vger.kernel.org>; Fri, 14 Jun 2024 16:35:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718382919; cv=none; b=dk7Gp8iKU7Eck6y9Nar06w1ne6NtDqezX5IMxdoUf8+sen31863zUKwn+u2Vo04nsJAhd/plOjnKvPL01f4uyGymWQ9RWQXapyqx2Y08yjhlYbh65GqQEx4xu5iUu5mGU2N4zdFBDP0FfKo/aQVj4JEvtU3wTNCvxpQrZknYJLY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718382919; c=relaxed/simple;
	bh=LuXmN9tx1+9vM/aOgvWFhrlm3ooXyRad8K9vUy2MI7U=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=NB0WRP7gLV2t+8Uj5p36abzcQmVhNxYpXqou/MDjKcNZRsbmzW1iRPiOMIIt+tbsXpzVXZlpHJuRDpZIMjc4OkRtyX67KEmVQcHrJaOLeTNDzEh3DADmbI/W5/SQUFXyGSH8jCnLHslPuXxsBzaD4CtK8BrbbiK13CJARt/DgfE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=timesys.com; spf=pass smtp.mailfrom=timesys.com; dkim=pass (2048-bit key) header.d=timesys-com.20230601.gappssmtp.com header.i=@timesys-com.20230601.gappssmtp.com header.b=muRdsBAD; arc=none smtp.client-ip=209.85.208.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=timesys.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=timesys.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=timesys-com.20230601.gappssmtp.com header.i=@timesys-com.20230601.gappssmtp.com header.b="muRdsBAD"
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-57c714a1e24so2674420a12.2
        for <linux-sound@vger.kernel.org>; Fri, 14 Jun 2024 09:35:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=timesys-com.20230601.gappssmtp.com; s=20230601; t=1718382916; x=1718987716; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SYP4VucbC2/Jnuz/5Y5TpJxKEc0YEshxNGoLKrFr67Y=;
        b=muRdsBAD40yg3pIdz7aI5D2k7rPYq8ypP30XjfXYzXS5ci/sRYOzA0IbQ3+S/1qFkP
         GTRaOd9/7i1tvpIAl7AaoR7f5KSeJARSlroMnSTdwwG8gdJ5jqkgHBVW6pmiBvX0SUvN
         Z8aXuyovSKsEQPhwYBdPQId7K5lnajZ/6tOzJa7TuZBcVWEafAESHRekXYyXr459OK9b
         ej9BWggbnW76MlNccbbWFRQyslWJqLsBwGMoRoVl7uGoVb/YqTxb4gqkHlZTDk1ubA2p
         qrCZQlvzBJnVHz0N+zZEUWTSai+ZYrEzYWtU1XDErVuL82Pe9ooPk1fHNY7AnbwzgAXo
         qYcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718382916; x=1718987716;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SYP4VucbC2/Jnuz/5Y5TpJxKEc0YEshxNGoLKrFr67Y=;
        b=JK26wpNsECha0l1E1xs3cJHM7m/u5iAcXeNrrlXVv9vT3Mg+jJv5lk68kTtIiYB6aM
         TTPQGaDM/K7h2B8/puV8QoRWQ2wufb6cU20TlV0RAZnpjOTp1uWp82LlguJ6z3jA5rot
         3qp7bfvMf4cK8CBC1u3rZSacBN89xlPiIsCpOSe1rO3r8gWuWjXR5sVZHIAqYFeaf6np
         0mGfHq09I0nRs9tbw+U/His38jlOsG40/fPXKMxsTS0xqeQZWmUAMkNC9Isg7Cj5Ewh/
         F9ua3YiG6CXFcYclySFyaghmrHI2VOkQ/OPwJCgkG/ydNVzCb0a185OEzIUKM3f86GP4
         Bt/A==
X-Forwarded-Encrypted: i=1; AJvYcCW8ZRmOLxErI5/y5n+pJw3/WhfkdfHGHdPJNg4cxsIWnImasXrWv1W8B1AuyNmHn08/diphJpU5NizfKN8NoSUE+HJCWyEqvRsVrQU=
X-Gm-Message-State: AOJu0YyYr3HQhKUTXlZyy92n09mBjZVUgyfLiElI27co9FpiS4p5iKiV
	CwargCUBvwxpflKZStBH+Ce3/9RcPwWd1YplG3jdcHV0QEfqyzonP785WOycuTk=
X-Google-Smtp-Source: AGHT+IFQDhA6L9B70v4e6G80Nc6QL8RMeX1jv/kC5wcXSX1xgpnIA6zLuA7OULi82c0Ut96o3OIgbQ==
X-Received: by 2002:a50:a6ca:0:b0:579:e7c5:1001 with SMTP id 4fb4d7f45d1cf-57cbd68ffe3mr1913077a12.23.1718382915504;
        Fri, 14 Jun 2024 09:35:15 -0700 (PDT)
Received: from localhost.localdomain ([91.216.213.152])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-57cb72da156sm2462893a12.22.2024.06.14.09.35.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Jun 2024 09:35:15 -0700 (PDT)
From: Piotr Wojtaszczyk <piotr.wojtaszczyk@timesys.com>
To: 
Cc: Piotr Wojtaszczyk <piotr.wojtaszczyk@timesys.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Vladimir Zapolskiy <vz@mleia.com>,
	Russell King <linux@armlinux.org.uk>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	"J.M.B. Downing" <jonathan.downing@nautel.com>,
	Chancel Liu <chancel.liu@nxp.com>,
	Arnd Bergmann <arnd@arndb.de>,
	Michael Ellerman <mpe@ellerman.id.au>,
	linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	alsa-devel@alsa-project.org,
	linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v3 0/4] Add audio support for LPC32XX CPUs
Date: Fri, 14 Jun 2024 18:34:48 +0200
Message-Id: <20240614163500.386747-1-piotr.wojtaszczyk@timesys.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240611094810.27475-1-piotr.wojtaszczyk@timesys.com>
References: <20240611094810.27475-1-piotr.wojtaszczyk@timesys.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This pach set is to bring back audio to machines with a LPC32XX CPU.
The legacy LPC32XX SoC used to have audio spport in linux 2.6.27.
The support was dropped due to lack of interest from mainaeners.

Piotr Wojtaszczyk (4):
  ASoC: dt-bindings: lpc32xx: Add lpc32xx i2s DT binding
  ARM: dts: lpc32xx: Add missing properties for the i2s interfaces
  ARM: lpc32xx: Add pl08x virtual dma channels for spi and i2s
  ASoC: fsl: Add i2s and pcm drivers for LPC32xx CPUs

 .../bindings/sound/nxp,lpc3220-i2s.yaml       |  69 +++
 MAINTAINERS                                   |   8 +
 arch/arm/boot/dts/nxp/lpc/lpc32xx.dtsi        |   8 +
 arch/arm/mach-lpc32xx/phy3250.c               | 111 ++++-
 sound/soc/fsl/Kconfig                         |   7 +
 sound/soc/fsl/Makefile                        |   2 +
 sound/soc/fsl/lpc3xxx-i2s.c                   | 393 ++++++++++++++++++
 sound/soc/fsl/lpc3xxx-i2s.h                   |  79 ++++
 sound/soc/fsl/lpc3xxx-pcm.c                   |  74 ++++
 9 files changed, 750 insertions(+), 1 deletion(-)
 create mode 100644 Documentation/devicetree/bindings/sound/nxp,lpc3220-i2s.yaml
 create mode 100644 sound/soc/fsl/lpc3xxx-i2s.c
 create mode 100644 sound/soc/fsl/lpc3xxx-i2s.h
 create mode 100644 sound/soc/fsl/lpc3xxx-pcm.c

-- 
2.25.1

