Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793796070;
	b=a93a+KwI4Q91jXopVjxW6IMqu+7/MMoYrXpnLcR2+Te1kYnqpjF4WIK45vk2HQPld7tM
	 7JSiqHbUrtAS0HX2pkEl/cdXW7ysm3WhNP+DlGgwfBglt7fmwVBcCsFKAK66wwc2iOauu
	 2CRmuApGdvpGkdXiMyviR+9krcRJGL/sJ3PtDpURmZ58ZWP3jhWx6ymyS8/yGP/VFxP+B
	 BJmimmW5jB1d0KPiq2F7Fo3GaQTm3H75UPXpHu6Hrcx96sjXe80BnGZHmqEsffKt7qWZq
	 FVhQn2luvk73yeI1WkIMJVJOTr8R8eaKf2xSENXQEt+avJ8SwUYl9NGINsu6c8v/htQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793796070;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=JFSSkNgtw9qZg2rx70HlBlm2wqAAOtu/7zBcOSJ/emI=;
	b=WvWVL8JdEZAhrP0nUNqF1NKLq1F7VG9IKLkLiFWmsZrJc7L01PvfB6JZWMUCt3CgTdJD
	 xr9xj0jbQ/iBDvLRWzAAiJQ06Qt/sp/2ii1mwC7Vx1BayPAALlLiYmYcWEEo9R9+m1yUE
	 Dev2P30zDT3Um0ZIgv72YIZ6yNHESfSlit79pmR5+k/WteQffU6y1a/p6HDlovGULccBw
	 DlqPsh/6VUJ5m/2CTmsmFpvSYJWuUJ93t0xtrp5GxkjLbFNWhFbBE+OsI7R/Jte5Y8ycF
	 1AAH8YmlzjyNG0BT3r2IF3Xvpm2vE7RIZqTCWnW5KzaWHMekCTDvdqEWdEjGnspsKOg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="nPrA/j3h";
	arc=none smtp.remote-ip=209.85.128.47
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E18A3606A31B
	for <linux-sound@vger.kernel.org>; Wed,  4 Nov 2026 12:41:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E18A3606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=nPrA/j3h
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4a2167bd087so5260415e9.3
        for <linux-sound@vger.kernel.org>; Wed, 04 Nov 2026 04:41:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793796068; x=1794400868; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=JFSSkNgtw9qZg2rx70HlBlm2wqAAOtu/7zBcOSJ/emI=;
        b=nPrA/j3hW/O99kGx7s7SfheqzoTdHcd7g8W0JNdsUl00HXqTn8wSNxBLgNloX3FIyX
         YO7/f3D5E18Qlkt79cbst05LdOHDR1AS7pXXPq35ksVs9SsYj8NXcmqHvvlOAleTHGTu
         UC8fEr2kVQZS96YagjQZxneYbBb+do3+oaK1SEufyUS6kp0xBIFmLzNOEDZGwyHx91xR
         Lwq5mYGeo66/wTMaofcA4vh3sHp3wRFyQI25eoefUO1zLsJ7YjYDQrMLR289PvmRvLIq
         u/lgVyiFQb4CPuwsnhFgppKQLDDoRdfZZZ8teZ5djHsGe5TPjk34aWGZCNdLTF8QEomL
         6ecw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793796068; x=1794400868;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=JFSSkNgtw9qZg2rx70HlBlm2wqAAOtu/7zBcOSJ/emI=;
        b=O/ZrKFiyPh/4saZg2d1BqGMSRfWdliBfbwKmU+7zWT6u3l/oxYKTchtq+Rhafvx0Rl
         +VnKIdzBPJdZaDxVOOloCa2JBKo/x7UA6foWSbVVcQ0tJKvqXuf5jNWKMm7J00b2fGGW
         oZTMEns5tJCdlD2QYUxMXS7IlQsgOnpruKHpZivb3CGLb0GCvNwVjqS2r1g6RRzydOSa
         aLQYzCSJ1v4Ce+wR3hoPrK2ZIQnSeMG/U22buiQYUkPQcBv9kTLiE+9rL0Eu7dJlr5o7
         rhv3E2BLyihQuUY9flP+mVyHt/Yb3/dblyMzeTfJjz1UWst3CIRC7GERznOzhlv8YRG1
         WOIg==
X-Forwarded-Encrypted: i=1; AKwUvBx1j1Bz61dvNFw3JqcD4YXwXsD7GIUNsigi25vP+gnvF93qNJFM+Vj5ioub2wFyfMC2GtImSXTT5724bQ==@vger.kernel.org
X-Gm-Message-State: APuU4Z8n7rh3Wbo6t11IzDEikJL1Ut1rltaipoV1OpqeBPwgk+xjkkKx
	m9GTcDop625Sm6ZgripKd9ffv9Qp0vRvFuQn+cxA1HaAVHQljz2X3xbO
X-Gm-Gg: AYBFou3p05OyEP31he2xMYaGjDlrx7uFF/hGWyMxRCNI9VOFjYmHe2BA0En+cktwHPr
	UvDg6bi5LAPjOfMi515wbVZ43lw8MoRFcoLfRUWIw17LVlEmXdEYut7bI9Ao9I8EeLQChMCXiqA
	jxRWtdeBminnwYsWpGE5htgd56H25T4OfhQMMXbFlFRgDeDimYT4Ks6xGZy+QcaM0919c4EMu+5
	QiEIgXoYVk9tNd/29rkwuk7vQpqcOZsdi9ge908gr93Dl8DPOM+uPpfF0tY60EHUVJgxwPx4nXF
	DlgwYXVZkkJuKt7It/lLzhnN50rfbAQk9yYycnJEjgP/ps7e0t5/QvG044xxCwvHeXKDqn24v5r
	FScuUtZTCSFI6teP46Jea0GSa3vVBcDeEbQkdRidaWiNqr2b5576TAb0PmtiGORDTXf2oiN7LJF
	SOhkBYt4UkYdstFjovJsz3B9cbOUWbbROsuZozS2tWGPo8PhhwlMjgdMjUJfdou2k5X9EBptAMM
	7XXIhuBGft+hGPYThv4ZC1lcRFDSss8JUN3FFLAHRq45guVMErvWe/1z0IEF7H9GIBz0awj6Q+1
	dF9mXjSfIS3WuyABEDtcT1ibw5UnG8fVGS6wilJtLcNamkkk6nU=
X-Received: by 2002:a05:600c:3ba5:b0:4a2:a6e:80f5 with SMTP id 5b1f17b1804b1-4ac16fa356cmr437727975e9.11.1793796068291;
        Wed, 04 Nov 2026 04:41:08 -0800 (PST)
Received: from xeon ([188.163.112.62])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b433ebd278sm46347145e9.3.2026.11.04.04.41.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 04:41:07 -0800 (PST)
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
Subject: [PATCH v2 0/7] ASoC: dt-bindings: Add/Update #sound-dai-cells to Tegra related codecs
Date: Wed,  4 Nov 2026 14:40:50 +0200
Message-ID: <20261104124057.240288-1-clamor95@gmail.com>
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

---
- fix dai cells in wlf,wm8994
- fix commit message in maxim,max98088
---

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

