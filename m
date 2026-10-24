Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792878282;
	b=IMo3zF+tg46L1P3TWQBIPIro9pvN/L7gyyIUSSi0JMBEMopXyZ3v87Bjh2mHQI9C24yC
	 QUNJl5PjrapVbKmWrhvaq4HBMSd03l93yNAuQhD2YCH8pkje74LQ2nyw6wt80NtApIM+d
	 akr2LexdlID/tO7Lis+nPJNHUnDkSS4/91h/UThy97PRoK/d3H5z64UlGjwcI7OU97/TC
	 8Gl/otqFMcsFVjEjuPZXwwNL/sZFOZiZA4lLUPHLXE8RWgWsc9EFI4AUrZy2/aHlIjaG9
	 MV1eSnjodEmEWy9KLJqndSdwkbBYpCk4BvBN21mZf1i5RUFmlV+LKIratYAw/wGgisQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792878282;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=+1qrwGO4vUyqJglxRfagf9rA3ylSrmZ6wtpakT3V5ZA=;
	b=aV0gvykAJF4prYKx3682DiO1eGv4fCpFcOTMRllfv8VSFWZozpavFRojeY+LPzUoO6Yt
	 bakAXA1FvdWsMowyueJEIqEHi/1b1CTP7jJ7ORLDewC5AOkF9YuiZ/+VY3iGv45yaffqG
	 sML6nwi699oGpsP3H7Ql1iK/Y91jYqh0sM2WEU4wwkiGUBZaWIn5ttf4m7+HJ9Mx/nIlU
	 JRkVns4dwdK398W/sWbkVn2okJJeX6vuF6pvYhduEjYxdFyUTWRdCU+mq+6Vqa7e9YmoX
	 CLvH35ppL2j6HBbB5uEK1enYX41oHGKtteD68jueOq3AlC9W0p2tfSNn+7JIytmdaYA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=mgcrea.io;
	spf=pass smtp.mailfrom=mg-crea.com;
	dkim=pass header.d=mg-crea-com.20251104.gappssmtp.com header.i=@mg-crea-com.20251104.gappssmtp.com header.a=rsa-sha256 header.s=20251104 header.b=kg6wz1St;
	arc=none smtp.remote-ip=209.85.128.41
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2BE3606A31B
	for <linux-sound@vger.kernel.org>; Sat, 24 Oct 2026 21:44:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B2BE3606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=mgcrea.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mg-crea.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=mg-crea-com.20251104.gappssmtp.com header.i=@mg-crea-com.20251104.gappssmtp.com header.a=rsa-sha256 header.s=20251104 header.b=kg6wz1St
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4a1df4c0966so11494785e9.1
        for <linux-sound@vger.kernel.org>; Sat, 24 Oct 2026 14:44:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mg-crea-com.20251104.gappssmtp.com; s=20251104; t=1792878280; x=1793483080; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=+1qrwGO4vUyqJglxRfagf9rA3ylSrmZ6wtpakT3V5ZA=;
        b=kg6wz1StvZeFIZRvDNOu3iwpYO76N+zpDAAteho38xZvyhz5w6MXvb7zNdhj0z/11w
         xyPfY6wkx4vKHDbuiYSPSyuzAPNkaHMP2qhe81rw5Ln6fS3jzBmC5GeNPf3xFyu9gfMn
         Di49GIpvUgeajEW309DN7g1NOgm30kYyX6mBWdG/GiS2XzsaOTHQqYTkS5z2rTd8kk7W
         JEW08VSARkuBEhU0usof+UI8/++JARTisdBCmFLy76Zb1PhzPtA7KbK2m1HcfT6vJTW9
         zdmJG9jSbVhE2Zv0zHFKSqzg3CAgn1mFpHc9YgPODgjmlmG8DMTzX4WH4ybyffYWc7xz
         iZxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792878280; x=1793483080;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+1qrwGO4vUyqJglxRfagf9rA3ylSrmZ6wtpakT3V5ZA=;
        b=g1IxXFNq0SVSnftTl3Ks9XBEFZITY1lLqFK/ojgJVcKRi4pSNxPGGeeC4hPKhPG2x9
         5VLPiQ6jdrYBP14KBp53peSDlqQtxKZyugF3rz60i4jlQkkm3P/lhhCIreSWmacYah+g
         Tuo7GrCKzbCrqwadgsdEpMWvbKrJuH0oARVx+pWE2kt6Biq8HAxguW/YMRfdyCt8yx2L
         OhhcBZkjCRWgyb9o2y8AxwD4G1AsdCTX/h3c1LAS5gpdWXYXzO93gIRD0bvEBl4Bkzp/
         uFnkRZF3voDOfBxBfaRXK5em+v7x2xtrYpisL+Ehz7wlbZsQC0eUHUEMQnG1iwj0XToG
         ko2Q==
X-Forwarded-Encrypted: i=1; AKwUvByzdg1AwI0vJnRo0Ww/lLZtQJnvspdJf97gDYu21HfvJGV7gtWnabKuQSyfXjKsur3/iAKSDyCGBOOwAw==@vger.kernel.org
X-Gm-Message-State: AFq9FYJJG7gEWdQ2ma5p1hLLUBEezDYdwnX4ss9F476FbEM17sAE6CWP
	DYhwAPddPifb5pWJiYD5wbeYskFsUJI5MTJ0Gb3wg+vFBdQUx8KQHlWaGrKM3lJvXcM=
X-Gm-Gg: AYBFou1Qz/UUmhJQQtPoNSSGmUumM0YB1WQaGqsL5sKe0CQNIa4LXus0unH31WKGrwz
	7XI1d1MmC7/V/ulcoR9n6fxrh1saQ6qzSJTgkFUoCnyZ+9aC+E5tnmfUzL7v8eVoMuXGEgYQZZm
	gPpksBO+xF4YmNKkFwRuu5R/GBXyYw4/NOVyd1KBV3uSmYM9YHgOW8JkgtlTLC5uV9ySFZ4vpha
	RreubfdaEe4/5LvFA+ytD2bSnmCBXUJARyQjRqNgRmYDVOzJonLkgA0xe4PQTUs96D/cs1vXOor
	lF6sH5iBfHoEGAwqotcm1IwIsDlJ6SLm+9e9HpGEdSmj1dsEn4vp7m98qf+aU4FpN+17NU1ZqH3
	bdWFYpJ2LXgmvZjRLNgbfAPQJmNo0AWWREnAja1tD3CAWu2ipfgJdmfhxXY8qXqRvZqgy/TyuvD
	wOSMvOVrm4VJQkai4cGSlRBE5TpFyR9qPgBVDvY5enzw20+G9qdy2IrBLObTRvMO2YR6/K5+r9e
	GckzSNXRtClvTucU8CAsFDfkQ65MoG52EsIXPBSZV5kHwpemc9Yl7TGmnHBpqnOkbFLcAEZbOxC
	ixdDRMi2DcjT/jYTed2LME1KtT29aR1JoSiq7ZkdDYzAUBJV3z/rgG7XrCgy+zTujEkF6x3jxQ=
	=
X-Received: by 2002:a05:600c:c490:b0:4a1:c6f5:2450 with SMTP id 5b1f17b1804b1-4a35aeb0eedmr49803455e9.17.1792878280151;
        Sat, 24 Oct 2026 14:44:40 -0700 (PDT)
Received: from localhost.localdomain (2a01cb060184ad00bcfbae5efa3e0f0b.ipv6.abo.wanadoo.fr. [2a01:cb06:184:ad00:bcfb:ae5e:fa3e:f0b])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a35a2ed5a2sm80447905e9.15.2026.10.24.14.44.39
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sat, 24 Oct 2026 14:44:39 -0700 (PDT)
From: Olivier Louvignes <olivier@mgcrea.io>
To: Mark Brown <broonie@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	Paul Cercueil <paul@crapouillou.net>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	"H . Nikolaus Schaller" <hns@goldelico.com>,
	linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-mips@vger.kernel.org,
	Olivier Louvignes <olivier@mgcrea.io>
Subject: [PATCH v3 0/2] ASoC: jz4740-i2s: Add the X1600
Date: Sat, 24 Oct 2026 23:44:36 +0200
Message-ID: <20261024214438.33342-1-olivier@mgcrea.io>
X-Mailer: git-send-email 2.54.0
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

The X1600's AIC differs from the X1000's in its bit clock divider (the
divider itself, even values only) and in how it plays mono (a channel
count in AICCR, no MONO_TO_STEREO). Tested on a HiBy R1.

Changes since v2:
- The channel field is bits 26:24, not 27:24 (bit 27 is reserved), as
  Nikolaus pointed out from the X1600 programming manual.
- Don't set MONO_TO_STEREO on the X1600: bit 11 is reserved there.
  Listened to on the R1, a mono stream sounds the same with it set or
  clear, held clear from before the stream starts included.
- Commit messages say what the manual says, and the X1000 is left as
  it is.
- Rebased on broonie/for-next.

v2: https://lore.kernel.org/all/20261023152011.85407-1-olivier@mgcrea.io/

Olivier Louvignes (2):
  ASoC: dt-bindings: ingenic,aic: Add the X1600
  ASoC: jz4740-i2s: Add support for the X1600

 .../bindings/sound/ingenic,aic.yaml           |  1 +
 sound/soc/jz4740/jz4740-i2s.c                 | 48 +++++++++++++++----
 2 files changed, 40 insertions(+), 9 deletions(-)


base-commit: cc3fc99f1bce93c3ae3771ef98cb91a566da857e
--
2.39.5

