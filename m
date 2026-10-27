Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793102444;
	b=b61L7fr7YHXeFRayNlwCajieYvUYZie95zUSG9R9QbSNFlDH/4wd03W6jQ6pjlv94xpI
	 Wkaar1PebU+X/YTVCkzKbiciIHz9H3qy8js86dW+U5X/2ahhPZCIoKXNj4tq+fPp2mG9J
	 4bHnvRrbApD/ahDI4n4er99wq3tnqhpAzcXGnsx5NVWMjpp1kJDwZ1foH847/96ce2G36
	 lWTCloRO5pmI7IDYfIe50FPOAO+qQ33DGQI/liOj5pyLDLfQgiqCrqb0vFj2U3RWWh7IY
	 aGElBO1N1XeSWpslUE0D6okGIxRw8M/bKJcXqnYC6sBSb9TzavwPqClvuZhYnDqFPhg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793102444;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=4KBnKZ2ldhWTCS/0yCI6Y+UH0y9EQUDr5Imq5+wRBAk=;
	b=GyDsDdWaMAALNEsNRfiSyEMNlFMv/1PTP3lvX3nGp+pIu6k6rt7vhDUKhVVxrg+qPr75
	 +lHhRASTLxx/UdV0JndY3dBgnrqwRqyBqWH0fintrhsWR45bQATmxnasK/JOVnAuCtDfC
	 k6MCkKK8RqSTmtNeQE0bTQevtr67slA2nS7kKAq9V7TtJTC4BG9uSibILP/8mQTOVZWRo
	 O11Bg2NbWbrrj5kFwXN2QQsiGO9nHDokHfzTdYNrvnsZpVCueRqkjl9Hdu4+g4v/Ta6Sc
	 BlDEfV9kPPyaGuoOiZ544lJPMtqLjc11HbWkPIsGc9/gPStO8QpBJrNcbGUxYgAQfUA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=UBMmomfb;
	arc=none smtp.remote-ip=209.85.208.46
Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26E2E606A31E
	for <linux-sound@vger.kernel.org>; Tue, 27 Oct 2026 12:00:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 26E2E606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=UBMmomfb
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-6b1f4d8e09aso6064082a12.1
        for <linux-sound@vger.kernel.org>; Tue, 27 Oct 2026 05:00:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793102442; x=1793707242; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=4KBnKZ2ldhWTCS/0yCI6Y+UH0y9EQUDr5Imq5+wRBAk=;
        b=UBMmomfbj2Z/DjSKvnujnL23eqaP+gUcQIKIHuZb2TRimkcNNzFUtX4uedUvg7v/UD
         XE/n06vqJED+aa4VxKMc9zLcxSqlgFmpYhl7WWHaarYZpQIYo55qJ5WpZP4vRXubHNn6
         +VIA1vOgufoGjryjPWh2UHMWrCMPZNgMOY6T9Q9b6QJ2LbBSdC0yHPAa36W9QD4MUFsF
         fcjj++1d1mBqdo4lLIQVHrdb9YrVjJP6rjtRmydlhgaD4n4h6Itk3zBVtUjzBfGIWlRs
         Uel4I0aabouVD9+O6DmFg8uWJW71hea87Y9SuQQvToogunsgIs0+POC08uZOoJDciL3p
         PEHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793102442; x=1793707242;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4KBnKZ2ldhWTCS/0yCI6Y+UH0y9EQUDr5Imq5+wRBAk=;
        b=AOK0x2lvjY3zjRYaCpiF0B9iBetGZx7EbGARmFd9xC+rTpri+wUvzFy8SBLwmNdCAg
         xJbZpqi7DFdLUPmGcjjBlhTWnhBW+GvsOHVrRiN0vqNpyO1xek0CBJ3afEdlherNDX62
         TCVCJlW8sLtLxebkA5TqUm3P8CsL2mjxufsM49VXZTZQmAFnL22YyND7k/e0kx/cBkZf
         CJd9ws6QoQjnvvggvICXRBqRhu6S9S1EKnhgxqXTY4fkNtk7BJhahXAS7c+InJTWeIjE
         yjH8VdKXKM1bmsSXHnEkWthtQXWkpvc5TI6izU2tFUAJwYuiiH0rsen4HpjD4ivGPDVF
         fsQQ==
X-Forwarded-Encrypted: i=1; AKwUvBwjRBbMdv7Jt4Q9PCc1SRJ6/PnASCWaSHkS3PoGQqcmaco9duTBiGezD2l+6/nTMjkRFjaq2txwHydcVw==@vger.kernel.org
X-Gm-Message-State: AFq9FYIOW6VPClchXV7uDpXzjOxLKJ2p742EprVD62mDqq0tkc+zXZex
	wlJ1yLDoPKGNlJSAQsBWYNzJBkdTfg0a8vqwYVM1nbV+yY7WjvGQO0lm
X-Gm-Gg: AYBFou2X/JQaPPAf45s4yusSA1Q79/6eN0HaurU8tNPEZKS8F2kfZ9t90c2nTAknUKL
	T+MAub6RoYvgf5cieiSiQRnhLqZunZTAAQM0fCPTpspxEwkYNtCZZxwCmA5SQVti5J+G9yXE6ER
	vvu2TDEROKzmoUk3Tx8L+20hVk6zw0LLW5ov5HsvKp4T/GKMJ2ocbmxrbGOk9CHMbdfaV5HCB2d
	2CiM3R5CEw/pF29q7FVmoidvicExWIRjE73oUHW69hNQVdlaePLmkty57ikGFGTcaWEkU8MTTYH
	H0tlhGWs7mvokluw5Wo8X8u7KKhaMS+Hi3SvUxLmoThpE/+htu5wIVO6j7uxDqBUhySLgykTeGe
	xFLyJ+VkzHMKJB+BYf4mBWylWmZXRvfdG1QKzBwBcHao5XELA6jaDp/JsQV8JfI76nxMjJWOBdj
	QQNYbqExKaFfkn1QH6W9qdjZ2OfoilrAP8DvvCyOc9nmgbhAFAdXna59Ius8n7UDkwYmcWCv2wq
	zuwyIQkEz1NtJb36ITq0iMir/niChCSczQ5DO7m/iMBsJ8LxRPW3ovNzHb+j0b4rIINF0m0ENYs
	NsYgyWmlgEwZQ9GPyzQvhQ==
X-Received: by 2002:a05:6402:c14b:b0:6b4:2d6:cbea with SMTP id 4fb4d7f45d1cf-6b442fcab59mr6665292a12.9.1793102442085;
        Tue, 27 Oct 2026 05:00:42 -0700 (PDT)
Received: from xeon ([188.163.112.62])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b44598480dsm4717844a12.24.2026.10.27.05.00.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 05:00:32 -0700 (PDT)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Thierry Reding <thierry.reding@kernel.org>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Svyatoslav Ryhel <clamor95@gmail.com>,
	Mikko Perttunen <mperttunen@nvidia.com>,
	Abdulrasaq Lawani <abdulrasaqolawani@gmail.com>,
	Leon Romanovsky <leon@kernel.org>,
	Animesh Agarwal <animeshagarwal28@gmail.com>
Cc: patches@opensource.cirrus.com,
	linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-tegra@vger.kernel.org
Subject: [PATCH v1 0/7] ASoC: dt-bindings: Add/Update #sound-dai-cells to Tegra related codecs
Date: Tue, 27 Oct 2026 14:00:12 +0200
Message-ID: <20261027120019.93611-1-clamor95@gmail.com>
X-Mailer: git-send-email 2.53.0
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

Add/Update #sound-dai-cells to some codecs often used by Tegra devices.
Document #sound-dai-cells property for i2s and ac97 nodes of Tegra20
and Tegra30 devices since they all provide a single dai cell. Add these
properties to SoC level Tegra audio-related nodes. This is required for
creating more complex audio paths.

Svyatoslav Ryhel (7):
  ASoC: dt-bindings: maxim,max98088: Document #sound-dai-cells property
  ASoC: dt-bindings: realtek,alc5632: Document #sound-dai-cells property
  ASoC: dt-bindings: realtek,rt5631: Document #sound-dai-cells property
  ASoC: dt-bindings: wlf,wm8903: Document #sound-dai-cells property
  ASoC: dt-bindings: wlf,wm8994: Update #sound-dai-cells property
  ASoC: dt-bindings: nvidia,tegra20/tegra30: Document #sound-dai-cells
    property
  ARM: tegra: Add '#sound-dai-cells' property for audio-related nodes

 .../devicetree/bindings/sound/maxim,max98088.yaml      |  8 +++++++-
 .../devicetree/bindings/sound/nvidia,tegra20-ac97.yaml |  8 +++++++-
 .../devicetree/bindings/sound/nvidia,tegra20-i2s.yaml  |  8 +++++++-
 .../devicetree/bindings/sound/nvidia,tegra30-i2s.yaml  |  8 +++++++-
 .../devicetree/bindings/sound/realtek,alc5632.yaml     |  8 +++++++-
 .../devicetree/bindings/sound/realtek,rt5631.yaml      |  8 +++++++-
 .../devicetree/bindings/sound/wlf,wm8903.yaml          |  8 +++++++-
 .../devicetree/bindings/sound/wlf,wm8994.yaml          |  2 +-
 arch/arm/boot/dts/nvidia/tegra114.dtsi                 | 10 ++++++++++
 arch/arm/boot/dts/nvidia/tegra124.dtsi                 | 10 ++++++++++
 arch/arm/boot/dts/nvidia/tegra20.dtsi                  |  7 +++++++
 arch/arm/boot/dts/nvidia/tegra30.dtsi                  | 10 ++++++++++
 12 files changed, 87 insertions(+), 8 deletions(-)

-- 
2.53.0

