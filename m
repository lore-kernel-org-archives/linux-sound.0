Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AED2319D072;
	Mon, 20 Jan 2025 09:01:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737363710; cv=none; b=d+0cng+yBrr/5Df3zhQS97Ant9+8VmD8EC6uqVjax6ZURcyEEKnMSbFCkOAvH/NSFTLN+ehPY2CFcx+ioB/4DGpn2XHyNUuUwb/odcbs+su818fQQ68D/YhxiH+qFkY85+Ks9jSoRdEeoRAhAFPQnNnOUBXTNBCDztZWfg0YLwQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737363710; c=relaxed/simple;
	bh=0UIZlgWex73jxVR1tlQ/o16QXenxVxrtW++QxW4H4JQ=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=ou7680/iKPBjXI+y2nS3Xg4JZ4/usyEyS44rcA7uuTD5N5Z2LdYz2LzI7DVJ/XX2MO8s3NnjUbpq+oUB+et3HXbaYzSvXB773rVZjjYfKikBVc1szMCXXBLvFZQ30SCjKU9N2KiWaaM1jgVlEpIg5GKCrB/WypBsXlrkIEeOtVI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Phn5HP14; arc=none smtp.client-ip=209.85.167.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Phn5HP14"
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-5401e6efffcso4649191e87.3;
        Mon, 20 Jan 2025 01:01:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1737363707; x=1737968507; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=NVZnILB4Vkk467mbrC4jxwkM2t+tY+d6ia6Hx4P0S48=;
        b=Phn5HP14Ceq7LqIC0yss1e3CdLkq88UCsD93NXaOwlETRtIju7d4XUeuFNY7P4D3An
         9S0/neG9N2NN0Mq3Ec46pX53Ug8KV0tO0n7EeMGJ45baPGkgfAgh/uVToEpyuEVXaqLF
         ArwS+fcjZ989sInsKWe79zQEYO7as9sVahnWVlOELs5J9/P6+IS+VSAofEnNaReVHdCk
         0XZkOwEX2s1+P2eJR+K4DNzSLlIpqafOEUsENO6loHOhs46SN3snzVGrQf7QP9O/O8yA
         rY1Nt5XzP+il4NkVYDCcqgvwMQNL7m7Ui1y489qx0+V5k9hRHQa5+MpaV7g0VHT4utc1
         CB+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737363707; x=1737968507;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NVZnILB4Vkk467mbrC4jxwkM2t+tY+d6ia6Hx4P0S48=;
        b=nVLIbgJmwO2qgQmsjOsOZ3K0J7og/BUxxOtQ8ppWX7W19rCdngEjr2w3mnVSGHyzoM
         /mgUFySimn89jzL6cuW3627+47iC5rSg1I0RDwMKawbsiiUbAj/u9nDZMzVghQTWHGf3
         BkKBGUaqaeGIqyRtmGdnLfbdEj0pmgjT8l9UXHQyUQavZV+8vxadeU7tWdVimyMRT954
         Gx/u7WKwwJkFpR9YRi+OwuYq29Er828dJDQQMCSaQi4dBSAuRRxMkRKzsFCJEYwcu4rj
         FySXmLRo5uGI5+FiCylhUCa5s4a2Fqp46qDZYCapJOF9mwrtdxWmL3lFIDLCIW5HFNUH
         bSww==
X-Forwarded-Encrypted: i=1; AJvYcCWJ3oz2/zYhgV2SOkgpWBZ6ykh7WymyImuUd/kvGoiFWbd/5xda2VSZtLuquLkXHTXfD/sLwRAFLgjOvnNY@vger.kernel.org, AJvYcCXzAlNuyjHTE6rJp0OUZDXVCJEoPPEMY81YGCIIXble4vf5SHvxDRs/08+lOT+wfjyjf0g5ffmBt5wy@vger.kernel.org
X-Gm-Message-State: AOJu0YxH4xJ9t47wYK3+5yxS8265y2doofDEvFR+EPY5at2QR659NV+X
	vOUb7tkgXcGDPOOuHrzMvp09KazrvY5bKyHzPMJ5r0oeCKiXsi4P
X-Gm-Gg: ASbGnctWomKxp4szTnodHAgQzjWSBJKGakgJeZv+nihuT1NJ5ProEUBtuaDdlISV7Uj
	NC4EjnbQRy56OgwtktcHHNKjNqdMtoMdFmMe/NAsiXOjwL2dPy81IkO3VD6IqjeqP03NtpM6CsO
	t9gWKl7PgETp+RIAMeL5/aN4csd7uN6dOmO+GplYqWNUmcovyXdYziuRA5CNIMP1oo7e59q3SFc
	7LWXdsZbZSN0tffl3Qe0INBVZQLhl+8nZKTkHOZBqt/YFhipo1kjzp8iVU5ONHwkyAzFzs=
X-Google-Smtp-Source: AGHT+IE49mdXuZ4W9oyw8fCP0j+zJjn4S6ovHhbMcoQ8sBN6fLRXzFYYLyByIU0EJlkdsJJ0sgn8iA==
X-Received: by 2002:ac2:485c:0:b0:542:8c87:3a8e with SMTP id 2adb3069b0e04-5439c247dddmr3375767e87.20.1737363706360;
        Mon, 20 Jan 2025 01:01:46 -0800 (PST)
Received: from [172.30.32.150] ([185.204.1.212])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5439af0e90asm1224768e87.76.2025.01.20.01.01.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jan 2025 01:01:44 -0800 (PST)
From: Alexey Charkov <alchark@gmail.com>
Subject: [PATCH 0/3] arm64: dts: rockchip: Add SPDIF on RK3588
Date: Mon, 20 Jan 2025 13:01:26 +0400
Message-Id: <20250120-rk3588-spdif-v1-0-1415f5871dc7@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAOYQjmcC/x3MQQqAIBBA0avIrBM0FbSrRAvJsYbARCEC8e5Jy
 7f4v0HFQlhhYQ0KPlTpTgNyYrCfPh3IKQzDLGYjpHC8XMpYy2sOFDlq5712UpugYCS5YKT3361
 b7x83JTf/XgAAAA==
X-Change-ID: 20250109-rk3588-spdif-e49aa49145d3
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>
Cc: linux-sound@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Alexey Charkov <alchark@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1737363699; l=1418;
 i=alchark@gmail.com; s=20240125; h=from:subject:message-id;
 bh=0UIZlgWex73jxVR1tlQ/o16QXenxVxrtW++QxW4H4JQ=;
 b=kqpSvQ85E1iSmXlguVpOyE38qZuWMCl8jTEezNIyFDgMqeBZ9ncoesuhxOh5lKBPL/WUGT36k
 dtZBwA9jvu9BKlc4xb4aEZ5EkUNaq8T+Fjn42ssVUU/EX6C7MdYALq/
X-Developer-Key: i=alchark@gmail.com; a=ed25519;
 pk=xRO8VeD3J5jhwe0za0aHt2LDumQr8cm0Ls7Jz3YGimk=

RK3588(s) uses a several SPDIF transmitters which are software
compatible with those found in RK3568. This series adds the required
device tree nodes in SoC .dtsi and enables the dedicated optical
SPDIF output on the H96 Max V58.

Note that only SPDIF 0/1 are meant as externally connected outputs,
while SPDIF 2/3/4/5 are internally routed to the various display
encoders inside the SoC. Thus, using SPDIF 0/1 only requires their
device tree nodes to be enabled (provided that the signal is routed
somewhere usable on the board itself), while the rest rely on driver
support on the display connector side and are therefore not touched
here.

Signed-off-by: Alexey Charkov <alchark@gmail.com>
---
Alexey Charkov (3):
      dt-bindings: ASoC: rockchip: Add compatible for RK3588 SPDIF
      arm64: dts: rockchip: Add SPDIF nodes to RK3588(s) device trees
      arm64: dts: rockchip: Enable SPDIF output on H96 Max V58

 .../devicetree/bindings/sound/rockchip-spdif.yaml  |  4 ++
 arch/arm64/boot/dts/rockchip/rk3588-base.dtsi      | 64 ++++++++++++++++++++++
 arch/arm64/boot/dts/rockchip/rk3588-extra.dtsi     | 30 ++++++++++
 .../arm64/boot/dts/rockchip/rk3588-h96-max-v58.dts | 24 ++++++++
 4 files changed, 122 insertions(+)
---
base-commit: 4ec376748558ba132a2a49513acd3b08774384e3
change-id: 20250109-rk3588-spdif-e49aa49145d3

Best regards,
-- 
Alexey Charkov <alchark@gmail.com>

