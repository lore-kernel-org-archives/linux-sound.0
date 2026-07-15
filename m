Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08B5C2931C2
	for <linux-sound@vger.kernel.org>; Wed, 15 Jul 2026 09:55:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784109349; cv=none; b=ellZS1ffbmpTCjIq2BT74fjXvtkecGlzGSK3dO/hy5rGGtrJeEd52BUYAcuBi6RYZMCLgmRfiSecyGnIIKkbipH8P9Ehqjco++j329UAtDUZbi3j6erVmz+FEAGRfs8lVNDg39AZlShVCu+sY7DRC64tKrYrxCcsKEgRmzx5VZU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784109349; c=relaxed/simple;
	bh=Io36xFabltKlmTksRgpXo1iJElDnjnzy2Dkrbjit5bM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Fw2jwdk/s8j7+cV7jZNS5ZCR2DhCkDjQFLlT4gORYDnSB/TGI/FlYk0YykMTlIXFPSIkoQYVFJxXr7LwsmMCNDvEvblTkrFVhm9yKJQAZmTz/dsD2sHt7KfyYb/PPHube56ttueiCv9GdfWY6WUpohcIlJiQTvMx8omtPIrRQnA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Fft+fcw3; arc=none smtp.client-ip=209.85.210.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Fft+fcw3"
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-8487214ad2bso2746411b3a.1
        for <linux-sound@vger.kernel.org>; Wed, 15 Jul 2026 02:55:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784109347; x=1784714147; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=9OVTt/KuhBx802gK1GpNosauIrh3LIrN95gUsSLZetI=;
        b=Fft+fcw3WgfDEBtvXxJjUyGo+xJrYHm4BgP+aye2dYBOa5no6rzVVIGeeBkAguWUbA
         y1ZTcZiHKYsECXiKM6z6z0AOaIn+3NTsqAyP/obcDVr3dV8Ch2VfPRTq/lGMvGSXSAmO
         1unak6dpznKca9PDgfxK8OKZqHj2JPvT6BvDnXmPSK8uaX9Qv/V3yMaiRr6s8O1Sy4+f
         YgA1y2EmwPF987jWOxBVnNwI8PhsCApEC1s94DVfCgF4sEoly94SejIxw4wfrKVNv6Y5
         MXWP88ouXJlxIJ2xhmSwliaSJ9lf0I00YPwz446QDlbU+L19AfT9bh703pn1FG8n2h5e
         73Iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784109347; x=1784714147;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9OVTt/KuhBx802gK1GpNosauIrh3LIrN95gUsSLZetI=;
        b=euZWbBtVBeRzWCoSWjLGrcTJd9DFIhuiYT6B32IDoWqpV5LpiFhypRgnE4Y/gdpEvH
         kuw0UbQPBsTnvuqE9pD7kB4GY3QQxabK5F6QnDa8mYUVpTYD5wXTerI50rw9H3n8T39X
         f4+FbrO/eMzQyeSbPik4LjIEOubfXTxRSS+WLz4k8q8X7zUtVsOYsiYV0op1CKTKdqZ1
         qttaq3JHvaqCEIaX6T70jn7WLhwlHNpi+RZc71oXOMpOBxGV14q/uhQ4Q3CSBAML8Ca8
         AQ2MkoUXVatSYfQkJq5NLIZ7MvO2XbPsK3oPTl2yBMaBNVe0VxobRa2vkGqd3MhFquHA
         9sQw==
X-Forwarded-Encrypted: i=1; AHgh+Ro5tTYfD4UGvtcoKNbMQOOU5v7x91NgCBOWUPufoW8Yw/u46Iai5PAJ/QzBXti1M2hqIO9kxIp4H5qBSw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw283RvFuKaEmx4RHJo46hycZ67x+ND/9Q1MyNXZglFJm8WIPWp
	Pz6MDFo+xQJwmhlHtWDsys25f68VV/KDkyAC0X2k/i7haXp6dKXS8YGm
X-Gm-Gg: AfdE7clRjO6NNdGMuY84oBlSmoac2fB/5Q8Jb03Ph00urQhNSQFoNiyZOfDxN8cfvUa
	jKz7nV+qs/P/naOyeYgHDpVV2lKFaehSJn1Qph5vYNwZx17oO+gUILM5GMO/vgnpESBeZZBzbWB
	e1t2KhD7HuSePghn3BIlYuSj8sNeggw11S2TqsoNBIR4EGIbOiHOzf6mP26EncOJP7hWFE5evsq
	zzH3dctvAoJybs7Jc+WlYbwvc6mWJrUC+ZXuSVVvAsqJKjrsna8+ND4WKNMSvmAY03ZW5prpcmq
	fjCvfTFp8n60pzTp0/mNRjnKFC2GQ84xPWW7UxrQy49uFj1d+43u5FRwvkbr0dazy3toLFIfCyZ
	rF85jP2+SqsBi35JQL86Uth6O/DJqiYSDqtcUgFW6q5lEp044j+RV6ygVYmY3CFbNa+k3F4zCl4
	Vfi87J/4cko8zyMrFHpxMfif9rLx+SNlMjciuH+vYQetZABao=
X-Received: by 2002:a05:6a00:b50:b0:848:80ec:5d2 with SMTP id d2e1a72fcca58-84889738aa8mr15665520b3a.51.1784109347404;
        Wed, 15 Jul 2026 02:55:47 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-ca5b3643399sm11628908a12.22.2026.07.15.02.55.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jul 2026 02:55:46 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Mark Brown <broonie@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Chen-Yu Tsai <wens@kernel.org>
Cc: Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Charles Keepax <ckeepax@opensource.cirrus.com>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	Chen Ni <nichen@iscas.ac.cn>,
	Marcus Cooper <codekipper@gmail.com>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Danilo Krummrich <dakr@kernel.org>,
	u.kleine-koenig@baylibre.com,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sound@vger.kernel.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH 0/6] ASoC: sunxi: Simplify error handling 
Date: Wed, 15 Jul 2026 16:55:19 +0700
Message-ID: <20260715095525.40668-1-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: bui duc phuc <phucduc.bui@gmail.com>

Hi all,

This series improves probe error handling in the sunxi ASoC drivers.
It replaces suitable probe error paths with dev_err_probe() to
simplify the code and handle deferred probe errors consistently.
It also removes redundant error messages where the called helpers
already report failures, avoiding duplicate log messages.

Build tested only.

Besst regards,
Phuc

bui duc phuc (6):
  ASoC: sunxi: sun4i-codec: Use dev_err_probe() for probe error handling
  ASoC: sunxi: sun4i-codec: Drop redundant error messages
  ASoC: sunxi: sun4i-i2s: Use dev_err_probe() for probe error handling
  ASoC: sunxi: sun4i-spdif: Use dev_err_probe() for probe error handling
  ASoC: sunxi: sun50i-codec-analog: Improve probe error handling
  ASoC: sunxi: sun8i-codec-analog: Improve probe error handling

 sound/soc/sunxi/sun4i-codec.c         | 89 ++++++++++-----------------
 sound/soc/sunxi/sun4i-i2s.c           | 28 ++++-----
 sound/soc/sunxi/sun4i-spdif.c         | 23 +++----
 sound/soc/sunxi/sun50i-codec-analog.c | 11 ++--
 sound/soc/sunxi/sun8i-codec-analog.c  | 11 ++--
 5 files changed, 63 insertions(+), 99 deletions(-)

-- 
2.43.0

