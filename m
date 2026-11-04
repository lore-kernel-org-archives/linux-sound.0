Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793800217;
	b=MFCKHlk/xQikPrd0i8ztglVukrvuwEbFAn4Izl5fnj9dfs6X/+W/+P+zICQM84sMdvBo
	 Lu+3BB1/uhdm1VxJzbis41sFzyVP0ugBeCPE29HtqbLEZl5wUeKpC+5TJPPfu2Zn1yFEz
	 0a/usMdUHFk2SMA8QVoueo0tIc31aKd7YrjT0O7xqAxT3zL7Cf+RTUU7h4Z4sERuUpCBA
	 Eq7ZIMHwzCuydudemMoIyHpGxxI83bZLOSgL2GSt9AHWmUin178q0RQXHzs5a+AkfL5Mb
	 qJPOI45Ryxt4gvdRwSC+0ttcOSAXFqIYqRswZdn84GGISOL6ZpGGG7UzloleA36wUyw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793800217;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=gEk6xorPw5gb8yxYwLwtpa5jgaqjVwNrEmfQm53gGBI=;
	b=0pX79Za0F5VQJEnglt/UWxiDEWzpr2ft5Idl7jg+7zQOUq4YI0ciwmn5pB3LeqXhv5lP
	 JLjCwCKz0RZkNchFiTXaAzKDDAMVsT9m1joZMlgokBAyJRBqssUsZ/aQe+FUV+c76yC6S
	 Qpb/74XyNrZrKX/214omk4ByDUpItLxk70waulUCDqPJH5H5YWoQXhiVTwLRSP8ikmHGn
	 g6vT75VsoP5luDKyKlhXY/Qa0R06KUJjsrhN8BXlw2oTlMNte5CUqPKGEFKpRylw1MPFE
	 UvipOyjptI2c2jg8PqwOInBZon4F3xrBl5hUjJPtPdDlQzE/O2uqXyaZMjCLLgUAHKQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=b1Ptw56y;
	arc=none smtp.remote-ip=209.85.221.54
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8364C606A31B
	for <linux-sound@vger.kernel.org>; Wed,  4 Nov 2026 13:50:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8364C606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=b1Ptw56y
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-48e4831c028so707306f8f.0
        for <linux-sound@vger.kernel.org>; Wed, 04 Nov 2026 05:50:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793800216; x=1794405016; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=gEk6xorPw5gb8yxYwLwtpa5jgaqjVwNrEmfQm53gGBI=;
        b=b1Ptw56yq0D5+pQfQTThcCmHYYF9buugspKazy0mbiF/W3Fi23hz06QhEMiy21AhU/
         k1G+CdPi3T3usJmq7eCeSSaJlr98g0TwaWyUJQNSd9nVZrsQ5CAE7YVoewrQ18a7JYnR
         cl9vEXV4K6+G84jlMOQE7o5HQKVAYjq9060+F9OLU/3J4Nn6NwIjXAJ43mvtTGZVH/Q3
         R3/U5mR5fSibifiDXDh83i4HlxM3skcMDrCCia18F2KcK73cb5AgJ2jVIrE78yS0AfVK
         1liLqOe22ipgbYV4I47jnqM9xm/ALXWPcjHTROy6RRIUSZsxnhvLxW3wez1YD315kCdZ
         YcRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793800216; x=1794405016;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gEk6xorPw5gb8yxYwLwtpa5jgaqjVwNrEmfQm53gGBI=;
        b=njOZLi5XO+bKUIKr4jG9Qso3itXp6VV0Osl3dh7T9k4mDmRlgfP0Gph70/inJf8rfk
         jF8xAw7w2dTT1XQJBKT4vyDct7CaCfqKBzPICPRvD9v5ZoC3+eEZ9382UPiB0U/b1KNQ
         GdCyjcscAjLbRFKwRiPSF/usu35SblqXx84mqSJTjYET1PWMs2W8aphuPgiyDI8Y33T8
         xUxOoNbPKeTuyhqcmKF68RJUdrycRMyDpTzn3qxDBf7xqMiLmZXrZII4Bwwk5Ry0FoPe
         TXaytEmjKocn9+A/9h5U83jcnomGzCRU3zvjsT97A9zo3pIroigO7yblc5cRYWa8qgyS
         Bo1g==
X-Forwarded-Encrypted: i=1; AKwUvBwrphmKoaxF5gvvRySVqGk694JuM+1LcIwP0WkEF0PP20LRe125EyHWxNyiL+V/fe0eaI42hj9owrX+OQ==@vger.kernel.org
X-Gm-Message-State: APuU4Z+tcN/yfL4n8kIqrb4UrBEpEhp6Oko5x3Gbd6hp3J2K1T0kEVit
	TxOxbd4lvic1/ju94QLkjy0umVU2fY5P8YIMTFie8RH5efRyQ9BgJIo2
X-Gm-Gg: AYBFou3pMkrzPvVjpiEIMAwPUhsLf7Cahgnxxjwf+RLCuvUxmY13xPGB+Xgo4cBiRmU
	W0r8r2ck+nU/QhoHyctdzMKca+54cPqnXLgD/ClrS4GK1Q2FUNcf7LHES3LR8AJCs/TZc/Xsqv1
	rHzPHivzKdsAsIbj7V+b2XNj7cc/oYifAY34vQJ8T/ka9NTG6W6nCbQTnNWATMiBeLOgOydTcry
	BOfsn7Uzek9NAsec74YbtXRynmL13pat8Fs93karSASIQH7rsEWCXVTaYMRqUua6sXblwiqlTwk
	Jwh0pNvxYqU4+2KzcUeDAKFl/ox2RLB80c2TEWJWxnoD9YJhX17d0wtqsWfJodIunzDtV9ILeiQ
	BEfqW07ctpSXAkoYNs7OZ6Qjnxy6yY7/3eCcT3W1gsS6H5JffNRCdUUzRPN6sb/xFJppP/EZtWu
	pxSXw1sCVRow01SfwMSWGMfDsd6TzNUs7ppahKFE28qppAUguqSHeIgaX5bf6hVQVkcQDsHykT8
	Bvw/CuNMs6CmfY73ZVU1G3uXyo6/nFmeV9CWYtyd6S0JvN3HPpC6Sp91NKywWXYFVvME9Lq4x64
	+kIAhIWRBlScbDcJblGzxvCUKBcGBIusWyTw7tr+Yj4/sEes+Bwmq5kzO3KA3V34euqZmySrac6
	6ww==
X-Received: by 2002:adf:edcd:0:b0:48b:f08:8159 with SMTP id ffacd0b85a97d-48e6e502fa8mr27675362f8f.40.1793800215622;
        Wed, 04 Nov 2026 05:50:15 -0800 (PST)
Received: from kreach.multipass (nat44-21-238.net.ruhr-uni-bochum.de. [134.147.21.238])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48feeb5196esm3701024f8f.58.2026.11.04.05.50.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 05:50:14 -0800 (PST)
From: Jude Gyimah <jude.gyimah87@gmail.com>
To: lgirdwood@gmail.com,
	broonie@kernel.org,
	perex@perex.cz,
	tiwai@suse.com
Cc: chancel.liu@nxp.com,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Jude Gyimah <jude.gyimah87@gmail.com>
Subject: [PATCH 0/3] ASoC: fsl: fix missing GENERIC_BITREVERSE and REGMAP_MMIO dependencies
Date: Wed,  4 Nov 2026 14:49:57 +0100
Message-ID: <20261104135000.3723017-1-jude.gyimah87@gmail.com>
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
same shape in 3 drivers, so they are here as one series.

Affected: fsl_aud2htx, fsl_xcvr, lpc3xxx-i2s.

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

Jude Gyimah (3):
  ASoC: fsl_aud2htx: select missing dependencies
  ASoC: fsl: lpc3xxx-i2s: select REGMAP_MMIO
  ASoC: fsl_xcvr: select BITREVERSE

 sound/soc/fsl/Kconfig | 4 ++++
 1 file changed, 4 insertions(+)

-- 
2.43.0

