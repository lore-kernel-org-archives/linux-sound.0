Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8408344D02D
	for <linux-sound@vger.kernel.org>; Tue, 20 Jan 2026 15:04:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768921481; cv=none; b=Npt0PuX4OT9zxPXgQK86PwGJJcXAi4rT5px0gF5Z+Bd2zsCjenvMqrTZgUHkbatfFzHxcvOeIli3Ptbyq7UQB2Lgiic5TsW/XzawG/rWPXarXhilL/qD9x/+7hj4uyXJS4h6Cdf7kyefNsfXIQo0fuVDLO5vDzQzgp5vLzwLklM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768921481; c=relaxed/simple;
	bh=2MTdzL38FwzqI2w7zArkHtNA26SHQ3+uWzPtljqdIUM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=RWbA4sH3Rpd5/PJB81Q3YQB0KhZZ8qTj0leWDzNmSXE/ZNlAB0e//hEmO4oFqLwQpeqR7cPITiLwIrgY4M/2qMuwlXYUshQ3qP4FRHzzImZ/9W2NVr5+4uF9eA2d+Hd67NK9CKGplJ3GhhWMALpz5AH4+J8kFZGJjOxB4nJj/yQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EFSsws17; arc=none smtp.client-ip=209.85.218.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EFSsws17"
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-b874c00a3fcso867096066b.1
        for <linux-sound@vger.kernel.org>; Tue, 20 Jan 2026 07:04:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768921478; x=1769526278; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=79xLShts+sn9/YB5KF2cuQey91jFfbfmfoohIEeLjDY=;
        b=EFSsws17h1fhvc4sTRhMtvBYBqTLshblfTiK5w3phackD+YYyg+ARxBEmdoCxwWBNY
         2lbbDQoejt+z/UYiK+HEq9grC+56/QmGPkOIkDoZO2T2qJVt6vM/NWbrBepgyeu9ao40
         FD7+w7CitO2KmRYsMvXNT6dFQXQwD+ffbec3AiTqFX6UE+3UvDhEZdD9LYC1JeCrD/Mc
         WmrKifQ+cpz1HstiWxbrBHi0UFHDW9MXJIIhI2dqYzizKcFi+4MXLOj5HqRz+5sT2rxI
         WkQ+5gW2H0Qz2l2WIejoBN8bq4myTacISXeJ4vmOY+KJboAqOpNAhkckIbLTNoo3iU+Z
         2/mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768921478; x=1769526278;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=79xLShts+sn9/YB5KF2cuQey91jFfbfmfoohIEeLjDY=;
        b=JHV5mQm1aeUI7BKIZE7aPOod0CakFng1GduqyIV3Yl9/QWpbrE9yVmUlb3xSF/f9k1
         4dKkMh4pq/F4ov0wsStBjk62One3RPbNQF/ez4W4md7hmU5F1VoDrU2gIT65rstwb9q+
         fdPH2MWiE6RspYCzIhEPXvIodnhfCZXKHdD/5Y0t/nSo9PuKU9nbOhfHBECc9KPoEeUz
         QPqtmyekEDUfkQsZNdF89eQHHjSlmdvZeecFKnXj8c6uZrxN4JyH4RAPWH7A3xiJuIM8
         tgctHOJLYGHD0AJC6gwjbZxDdX4xisxilcBRWwO1jVIirkuSB21z4d8rd8di1hX3mFzc
         NQpA==
X-Gm-Message-State: AOJu0YzAOIhSKtuwlr/7Dcun+IWmGBxpgxIt/b7EOuQAz9uwJK1milZY
	Bl8CUgMZ+pzSam6ukNYBZtf59leW+VgECnIbIVV9oLD+AepFj+C1BTk3
X-Gm-Gg: AZuq6aJ1nrhJtP7YU+QMqQ2SVnrVgidyf0tIiO8r+lOo0xzXorI9DLao9EnxDX6akXe
	DjpbRSj3kbY+v8cIsBA6tdC6EpCFhJdl/wubEYQGyCq+fnxfK9mrvYgKgPMwrEihP1B+CIs/no2
	k06AVu3PZSmgJVU+LbdhBDgJ8FELfnvfVJj5k2eOviCqld5Q0tTim/pwAw8R922Z/YquDjwcGhJ
	HSAP2w3mq5NAos+ynqP5NQ8gSxDHzsOJ3t/4ZHPThgWOeW0xV9i4jxhZg9DXagp4UtwnQdx/3ZA
	aARF5U8WcXrTgB38yu8kGiIYvbe/feSMnw59JyEiWOMEtenMlif3KpWeek7X7PP5szmbe57VnJY
	3tJnFNOAagWjaHQiL2p8oEVjtum+dUKIPUnfotpRf0b9VjsCDxhWkD3ph9p0u0wbiJP8HM45Hpk
	num9Os6wmGvhvsh6lKqC1xASUqiJM1+V/QBw3d
X-Received: by 2002:a17:907:3f23:b0:b87:206a:a234 with SMTP id a640c23a62f3a-b88003426b0mr227202366b.31.1768921477456;
        Tue, 20 Jan 2026 07:04:37 -0800 (PST)
Received: from SMW024614.wbi.nxp.com ([128.77.115.157])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8795a214e8sm1427045966b.60.2026.01.20.07.04.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Jan 2026 07:04:36 -0800 (PST)
From: Laurentiu Mihalcea <laurentiumihalcea111@gmail.com>
To: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Shengjiu Wang <shengjiu.wang@nxp.com>,
	Chancel Liu <chancel.liu@nxp.com>
Cc: linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	Pengutronix Kernel Team <kernel@pengutronix.de>
Subject: [PATCH 0/2] Enable AONMIX MQS for IMX95-15x15-FRDM board
Date: Tue, 20 Jan 2026 07:03:27 -0800
Message-ID: <20260120150329.1486-1-laurentiumihalcea111@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>

This series enables AONMIX MQS (i.e. MQS1) for the IMX95-15x15-FRDM board.

Laurentiu Mihalcea (2):
  ASoC: dt-bindings: fsl,mqs: make gpr optional for SM-based SoCs
  arm64: dts: imx95-15x15-frdm: support AONMIX MQS

 .../devicetree/bindings/sound/fsl,mqs.yaml    | 12 ++-
 .../boot/dts/freescale/imx95-15x15-frdm.dts   | 73 +++++++++++++++++++
 arch/arm64/boot/dts/freescale/imx95.dtsi      |  5 ++
 3 files changed, 88 insertions(+), 2 deletions(-)

-- 
2.43.0

