Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793712362;
	b=J4QdJx9iUJ5Xp1SN2kvuvPDSSk3IknaOV8GBjj0mCwq1Y2VoUHkh3XBSD3TalcXf69HL
	 Sg9Siy47eud+zd4SoZrEIoPmBSq9JRW4fbtlBJ882S4NrxgXc/JCz8MHD5jmUaIcAzS7x
	 69iuWTYvnrx4V4QRpzvAeGFs8r7NfhU29qPVubdwcwIkIRMrKTGGWGtjl4g0UG9IZD3Zf
	 oYDmMG2hdopObWIKDigbAFWMgtyMrXxSm0Fp8rPGdr3pmQ59KNmfYkRr5QSEmkKIAPER+
	 17gtUdziNwdmpEor3hoa8UqSwZ/hbuX9Huh8QWBQqgbVKkNV5T324Smqwwn1AT6SUZQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793712362;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=4tPenR+/9h0LCzZJprU/jbaqrKPBMlOXgrDY4zMH4eg=;
	b=tFeh/9NMVRAGQ1ejKXpQZsGUgOYyqPda79wrWLpM1VJYuJW7COom/Yb6kscNPJdmLGbU
	 s+uRSDFuqmtOMxT7d2xo2dBQaX4TjFvIZ5D6e7j0+OtriPrTlnYHNZprOmYnppNhixPJ+
	 Pjeyy0NtZoXeWsdXwtnZ6xS1ukeELFAyyFbIwgfaSnK4PVDrQ+t3MTHyYAo6AfAi6McT+
	 3hQ+rPykSwVX4SXoA3u5B/YU5lFpGTY31n0elaRaDBQiAuMmjl9OdRKdstmv5u13M0/b6
	 qgrAvmL/L2ML2rOvP5DHCOtyN4BAGpgE15D/8cZHNj1dTiuvNwREqGLjFyRiC0novdw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=pr1e8+U0;
	arc=none smtp.remote-ip=209.85.128.54
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2AECE606A32F
	for <linux-sound@vger.kernel.org>; Tue,  3 Nov 2026 13:26:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2AECE606A32F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=pr1e8+U0
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4a2153c8525so28376355e9.3
        for <linux-sound@vger.kernel.org>; Tue, 03 Nov 2026 05:26:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793712360; x=1794317160; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=4tPenR+/9h0LCzZJprU/jbaqrKPBMlOXgrDY4zMH4eg=;
        b=pr1e8+U0b60Vg86WqF9hISWy2VhHBhTPV0Top3duFznVviKPcsIIhKmqTzXK9c1uKj
         C/gOOQzQRh/x8B4O/fDbE8jDc4kYFoMhZYTXVModQ30qRCIhC6fWbSWuGB9tIrtPeYyT
         Tx5FUpZjxtOJVGi8gM3AHX5FLlDIfEBGYLAoNAioAafqXk6Hx14g4AdKi9joV8+IUm4o
         arn6+HqerXCfP7AZnZSPxGnPptQD+5MvOdPUhomBG7Pr3xiB9D+TfYD/pGnHlPiCRPg2
         kkD0Isa4fk5+6P7Yir/CUgPAzbWq2loBsnDAxbkpKZIZyDJnO9uXwB9HgDTFjD3dyLQW
         9tfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793712360; x=1794317160;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4tPenR+/9h0LCzZJprU/jbaqrKPBMlOXgrDY4zMH4eg=;
        b=Kq9RRu8f3KsdQPeewYLEdku/MQqu2/1VUzSphl0hzC02Jro1+n4BlYxd/A7fiV9+se
         WFqo2EOBVLAW5moi/Bu/WMmf+CwRI03wKuvDMscUooUOsrl6bfpiJ7DHSvdgQ6gme4c6
         dGQFb5t748Z+UUCG5mAmefMAcqnHCFeIVCH0a/EEF/sOOJA/PudmZDXA7Tu9i9Zl1OLx
         91TfZNOfPrftHyledhBDrWh5kHa2t8YR+cpvOnK2BGUb++dP8TzF2hVudCSUXOlUSivt
         /tNLvWyFQsLxNZl43Hj1o1b3ok34/uXCRuHfdFlPn+K/ZNYTd4/vj+ZjBPitB7CoY0V8
         DUNA==
X-Gm-Message-State: APuU4Z8g9qq+leh7Xwcx+r3Dw/EXuiRZuScgpPeI/qqxFnjuokkgm8eO
	GzeOFTHjLZSsP30f7jiRF88yryLbCOB7mXk2LnWQ0scUSJhJ7yqhXOC8
X-Gm-Gg: AYBFou1uWvcVHGv1mEMCaF4oCQF8quVlKvVRowXhuDaq92KR1KMf2vbiEG4RaB4c7bV
	l2zc2AADgV9qtWnzkdDH29O5f8hQynz6q3kLRhbZ/HJHvYIbTa0Uk0C6fpgDLKmzbIA7/j7C1RH
	Jgjgav5o9ppJ+kGk38IZCIEXLAHbgSM1lLy/m8x9ME4yHMWnPiaTErS1CUIL11JvAE753+elj+1
	oo084YFXqKFLrWGjk9/48PXr6sK3Nf5g7S2FyS1zvOA5UZYn4oidG80GvjTzg1e9KcUbv3zB3E1
	1XMBJo6uUyLWU5c2JgiuJfSbbfdQmCyM9nkHc1TvS1MSKseb053OI37/iuMufmVwsh3dYpaSGJL
	WfwV4CJVuvrCzWD2SejHIYQty3//Hijk3Vd7aRKvTocvwFDOa9fHuVHurKeplEbijj1vJg8xBuY
	3TNcqSUHipjfeIsyYyp1qY5PB8TMdXvk48DkH3BSukxshE9XlwfAUcOYPheoowkIWn65/HladuO
	PIayR5jd4LrhtCtgNu5Fhwstx/xoCx9L/v0ZBSZlg0Yfso8uNIG7KHdqWLjiyHoqMELCs8Rislv
	72zHWcqa+PZvHJ9qlS99YpbqkACZ3oCG6J2bgDucl7Oo62DEXeQk+o3N7tltGnc08OCB0ScMDka
	i8kc0G8FwdIPjore1Pm8CUMw=
X-Received: by 2002:a05:600c:a00b:b0:4a7:b304:253e with SMTP id 5b1f17b1804b1-4ac1765d8abmr303491105e9.22.1793712360411;
        Tue, 03 Nov 2026 05:26:00 -0800 (PST)
Received: from kreach.multipass (nat44-21-238.net.ruhr-uni-bochum.de. [134.147.21.238])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b2a82cebc1sm84725725e9.1.2026.11.03.05.25.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 05:25:59 -0800 (PST)
From: Jude Gyimah <jude.gyimah87@gmail.com>
To: lgirdwood@gmail.com,
	broonie@kernel.org,
	perex@perex.cz,
	tiwai@suse.com,
	heiko@sntech.de
Cc: linux-sound@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Jude Gyimah <jude.gyimah87@gmail.com>
Subject: [PATCH 0/5] ASoC: rockchip: fix missing REGMAP_MMIO dependencies
Date: Tue,  3 Nov 2026 14:25:32 +0100
Message-ID: <20261103132537.3717496-1-jude.gyimah87@gmail.com>
X-Mailer: git-send-email 2.43.0
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

Each of these drivers can be built into vmlinux while the code
providing a symbol it calls is a module, which fails to link.  The
same shape in 5 drivers, so they are here as one series.

Affected: rockchip_i2s, rockchip_i2s_tdm, rockchip_pdm, rockchip_sai,
rockchip_spdif.

The fix is a select rather than a depends on: the providers have no
prompt of their own and are only ever enabled by a select, so a
depends on would leave these drivers unselectable.

Each was reproduced on v7.3, x86_64, by a vmlinux link that failed on
the named symbol, and each links once the select is added.

Found with kreach, a static check that compares what Kconfig allows
against the symbols the compiled objects actually reference.

The checker is at https://github.com/JGyimah/kreach, and the
reproducer configuration for each finding is published with it
under results/.

Jude Gyimah (5):
  ASoC: rockchip_i2s: select REGMAP_MMIO
  ASoC: rockchip_i2s_tdm: select REGMAP_MMIO
  ASoC: rockchip_pdm: select REGMAP_MMIO
  ASoC: rockchip_sai: select REGMAP_MMIO
  ASoC: rockchip_spdif: select REGMAP_MMIO

 sound/soc/rockchip/Kconfig | 5 +++++
 1 file changed, 5 insertions(+)

-- 
2.43.0

