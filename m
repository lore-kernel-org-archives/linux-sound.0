Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0BAB206F33;
	Fri, 10 Jan 2025 21:07:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736543265; cv=none; b=S/2w8sngcDiQCoLCnIF7wezlFi/BnHixHdbhPJnOF+WeG2dB5DEchQFcLHMkPCpQGIOboyvTCd3gqFT/ZPD/IN8wIBhcMizvdhsB4MpdQm1a4CW22XVuY4cf3JXfLY4zy7MDMMelzGx3rXEuXXZigvRShtaykOPEREa4bubgxNg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736543265; c=relaxed/simple;
	bh=4ZOwjUZYLXi186PoSwj2jNpgbPdhvmKs0l5F8yGOYX0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=XbwQIPBVMVUVQ3/6Wor58Em37sGKGcs3wmiH4YQZJhBcTMjjCk/a4c7FRZ151Oy6df8zCJi6m0EY+I8PQ5P7q75DXI3eVTkU9e3+X1Gf5+WXNF0xtkFXa5ckiLhSIR1hdqWK94kW40hyKlSKhVx1V5j3cGILylFPdsmibWmzSEM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=googlemail.com; spf=pass smtp.mailfrom=googlemail.com; dkim=pass (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b=nUaAKbty; arc=none smtp.client-ip=209.85.208.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=googlemail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b="nUaAKbty"
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-5d3f65844deso3820586a12.0;
        Fri, 10 Jan 2025 13:07:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20230601; t=1736543262; x=1737148062; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=G+2E4XF4R2L7U4jDZMfpOUeLdApfDnqjbzX1VGK6SNk=;
        b=nUaAKbtyF2W2gxHPmHqx/+IaFcnh23GxCdlfwP0hGZxGykX31L1octSKoPiz4+G1NF
         yJCxpsC/WKAlMyRwGUmMVG1zxrlEsUTBtmpR7iUY1ouTolCN8a9LvjLlCFM1Ed/eKm42
         6ETExsUJ3+/VcYPXQT0Cmj7fd7bc1JM2zkOZvugVdAJRLIu8+2KfcD2SR95CoKn9jWMh
         F6gMtQPF9Bfj7ts21mg8x9KEdKHW2uqhn52G/Q1aGIwnRdDITj3biSENPfFhjufZVTcb
         5oOPYvDVWdmcjb535Y0w+iXIRmEnuQJbpbKP1z6I48fYQAJfGyqLpFF8V+GfxqX35h3m
         bfSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736543262; x=1737148062;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=G+2E4XF4R2L7U4jDZMfpOUeLdApfDnqjbzX1VGK6SNk=;
        b=kG8PdLgkrz8TQVLhI8J5VXLMJwxHbGdvqfBywnjUAKODv8PgtoGP3PbUZ9ek5h+A/Y
         BukbLvF8TLy7iik4VE8oEMBko2ChBDL86ioP+F/RvkvaEY+OlH9q3kQAZbd61IOOWVZ6
         V3XgnidmPNRKtzmNmNaAw+E6eGnTWuDREEH+9BZ0OUaNoaWqCWb3l/7VaCPfnhNJq8qU
         dARY4gGiapPR7WkWeMKsMWksvlJYJUSxwRd+OtuvMNlnt0VW4u0ObPwvLyn4HvpbNw/E
         dHxFqBGd9SZvIVpcoPWihY0rrq8HvmmKZ0uc2Ucowlg3aNHi2e5uTB6jOVAFbGSwi4l7
         JEsA==
X-Forwarded-Encrypted: i=1; AJvYcCW+J+Y82OKauNcubcLlnBMZIxxHgQYWmyI5PC1sj7S99KrdX/HIYw1cgX4YU6qkwRXyK5laRvst2poyoUY=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxxb9iqVo9WiBxAMcRiZHRANw6SHzzIkoxnTAhgGDJzr6GKALDI
	0McUoEIlBZtGGyHkvP2oUMNkO84PRKvbiCd6NKnmjszFTk3Emb1H01l7uVfe
X-Gm-Gg: ASbGncttpgQD0EiukzwxRExrvg0Hrom6zGP/aw2caHUy3pyuAyQYFzsoraz5BQ5OP+X
	wv3IOf/ABW1l0g5XmmAkIKOuzegXRoSXviEz+sA71HEJwmGZHMR9sptu7UX21+umDF5jcqSJXT9
	om6BY4eLpF2sqSTyZ3wZ91Gi1GKP8FNdmvVcyYTbxQSM7948jQ77qcvyCISrQT1iUCGeJqVip61
	aoEyh7mJ0UxmizL8zEBlyHW5ljs90icMy6Wpmptr5gdpqbHND4tUYWE43TgTVarqMo6gtdlDqmf
	EsBhjmK3vIQa+xmxzcrM33czQ05KYi1/JNA1/pl2CTn6zmMDEcbIohWkijBz6DNa0k20pKFptM1
	gf3y0tpAE4rNUGxX6VkaWr3OF
X-Google-Smtp-Source: AGHT+IHyUhpuKiJImObkWg/lNo1hgMitMJ7DYUlKMmVG3Hzv/f6Npg00kC5fb9KJ8mLKeTnMZthLuA==
X-Received: by 2002:a17:907:72d0:b0:aa6:aa8a:9088 with SMTP id a640c23a62f3a-ab2abc789bbmr1170872866b.41.1736543261408;
        Fri, 10 Jan 2025 13:07:41 -0800 (PST)
Received: from localhost.localdomain (dynamic-2a02-3100-a97f-2b00-1e86-0bff-fe2f-57b7.310.pool.telefonica.de. [2a02:3100:a97f:2b00:1e86:bff:fe2f:57b7])
        by smtp.googlemail.com with ESMTPSA id a640c23a62f3a-ab2c905e2ebsm207172966b.10.2025.01.10.13.07.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Jan 2025 13:07:39 -0800 (PST)
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
To: linux-sound@vger.kernel.org,
	linux-amlogic@lists.infradead.org
Cc: s.nawrocki@samsung.com,
	lgirdwood@gmail.com,
	broonie@kernel.org,
	linux-kernel@vger.kernel.org,
	jbrunet@baylibre.com,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Subject: [RFC v2 0/2] ASoC: prepare streams on codec-to-codec links
Date: Fri, 10 Jan 2025 22:07:28 +0100
Message-ID: <20250110210730.705613-1-martin.blumenstingl@googlemail.com>
X-Mailer: git-send-email 2.47.1
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hello,

the DRM subsystem has recently gained a HDMI audio codec framework [0].
This is already queued for Linux 6.14.

I want to implement a HDMI controller driver for the Amlogic
Meson8/8b/8m2 SoCs using the DRM HDMI audio codec framework. Internally
the DRM HDMI audio codec framework relies on hdmi-codec's .prepare
callback to be called. This unfortunately is not happening on Amlogic
Meson8/8b/8m2 platforms [1].

Jerome suggested that this may be because of the codec-to-codec link on
our Amlogic AIU audio driver [2]. He encouraged me to send this series
to allow hdmi-codec's .prepare() callback to be called - even on
platforms that connect it via a codec-to-codec link.

The reason why this series is marked as RFC is that I'm not familiar
with the ASoC subsystem and lot of the functionality and terminology
is new to me.

Also I Cc'ed Sylwester Nawrocki (Samsung maintainer) as codec-to-codec
links seem to be most heavily used on Samsung and Amlogic platforms.

Changes since v1 at [3]:
- updated patch #2 to also prepare the source side of the link for
  consistency reasons (as suggested by Jerome and Mark)


[0] https://lore.kernel.org/dri-devel/20241224-drm-bridge-hdmi-connector-v10-0-dc89577cd438@linaro.org/
[1] https://lore.kernel.org/linux-amlogic/CAFBinCDdiJ3UNVUcShjq=7U2=oUwT3ciYdKSuZ5TdcrikxFBpg@mail.gmail.com/
[2] https://lore.kernel.org/linux-amlogic/1ja5c4b4rt.fsf@starbuckisacylon.baylibre.com/
[3] https://lore.kernel.org/linux-sound/20250106141316.375984-1-martin.blumenstingl@googlemail.com/


Martin Blumenstingl (2):
  ASoC: soc-dai: add snd_soc_dai_prepare() and use it internally
  ASoC: dapm: add support for preparing streams

 include/sound/soc-dai.h |  3 +++
 sound/soc/soc-dai.c     | 27 +++++++++++++++++++--------
 sound/soc/soc-dapm.c    | 12 ++++++++++++
 3 files changed, 34 insertions(+), 8 deletions(-)

-- 
2.47.1

