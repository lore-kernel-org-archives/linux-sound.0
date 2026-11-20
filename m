Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.182
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795147195;
	b=b3pKlUz04Q+Jx/IN+fFlGu4M13EZddc60b5KqR0MUUSh2nqEbYQukUNBIk1jVj0Y/Bns
	 G+Wu7srYbx3OdLg6/nWixoiuZ/ajVUjAAAZxI3flr2EW1THdKWuSZ/MvxAkgk6JR+z341
	 7hTCkbhjLVs4/S0uOGm233hFKDgBtVie7xf+f81JV3ZwE8a4JZFnulLrziA14NCcNl6CS
	 Eqk+4nFsBpqajExEhJXKRSDp2usHKikuF/uPKlAwbpduzrjaj66UxLmkeySdaH4fBswBN
	 CkwYsfTYvcHvwz4vwrfmdAgYXPXPsNXe4QFmVI5k7KPnOoMYYOcRLIAJip9UoIUWvXw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795147195;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=0m0WrqZYBcRighyEzQXIZqHlbBArN5NZqU2y6idkHc4=;
	b=AEIvMVOIF/hZkbTjws5zqt+Mf0pz8mSKwDWk2ORJqGQoe07wDOaxynCvYRqZBq2zP1JR
	 r1KL7gJqT0ALe457pKNZkpOIPkcrTWyCGQxFbW2fIG3W/4x7kz6yhF0ZfVx8U3sJ0rUQo
	 94JK31+mFUqZ0Jln/AESRP9YZH6IeCLN3/5sY4xGODXydFBvJb8zuTgl8MlwnDinrL5bZ
	 wafpdatLOw2HMbvjkH6z5PQVF8UiX3env0jucoeCrVZFhGK7hga/scRweZkwiJ0KlOz8O
	 efTo2um2HLbjzfYi6hMXYkeAVCqmnvvWkg8QMVYgtf1BmBhj7mZrT2rp7BfPYBpVvhA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=xBVnolz0;
	arc=none smtp.remote-ip=209.85.214.182
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A62C4606A333
	for <linux-sound@vger.kernel.org>; Fri, 20 Nov 2026 03:59:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A62C4606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=xBVnolz0
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-2f02f04a426so3497025ad.1
        for <linux-sound@vger.kernel.org>; Thu, 19 Nov 2026 19:59:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795147194; x=1795751994; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=0m0WrqZYBcRighyEzQXIZqHlbBArN5NZqU2y6idkHc4=;
        b=xBVnolz0bv5d4/cGi+uBX4eAA/DCXf0AhdVOAQFaKejy7TuVmtSsCA2qnKUsyt6GGc
         zts501lTFAqMo5fZhIE+l8jEqqR3IarsNowOFwVzwUiddS2MIstUzED9v9iUUnoK7cDp
         LFiksuFjw0O/ROLEa0M8bX+4dD5JyLnqNbkO5xe8hCtAD1hMj816+0cpik4n1vq1mT/O
         j8Y+vZ+D3V1wM0AJviDBC/8a0LRpJH4E/82RNkz6Zoh1uradxrNsQp1/4P/6ArF72DH2
         rEjnG7oC7H3pS1RsKilIGON9eKUDG1V6x7hnbSrjWugOP28uVPiGE5M4XYsQWdqE/5sj
         +FTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795147194; x=1795751994;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0m0WrqZYBcRighyEzQXIZqHlbBArN5NZqU2y6idkHc4=;
        b=E1KIGp8d4sl2kfitknn5pRefqMqfxEnnZ3ceQFOBUmNVZEyThqmw3dyjiu00U1Dun7
         +oYYJmkS2bEMKLwBzSovnWd94i91hrnpJEIularyDuvqmG4gcIcVi6fiNh87vsWVmVwn
         A44vqMfVuLPtC2+eMu+nqaOs+ytHjbEaOey4Y6oh8n7cR3u/Bq8A36RN7yh/wpsCD/H7
         p7hrHWj7Mh8CDIW/bxH/UL0x5sat6Aem57/PYfUp8yV9f2eBL8w3pdvRqXqaMuhsVCLp
         HbfFgR7ANbkKYR7T+Lg7gFwfn71HUsw6ub7v+xbeY1NXKaj5aEFECJ4VARLxQnd+d/5o
         j6zA==
X-Forwarded-Encrypted: i=1; AL+hErFV3l+wlby1Ui0Rm8I14ivML9znZ0nJ5TYw7HS0cuhDMztpMzSylKFKiCgEMQynKNqSQFBrbqODJGl0ng==@vger.kernel.org
X-Gm-Message-State: APuU4Z/trqhEz9rOWfzfL8PRJ0Ea8YjuADPRo9Dw+ncrIZEJNG2DqdNf
	5uyZxrz5QXDnWAuqoQ3GGz+hwdnrAB2S7aQOvqt7XPMTCmL7iBHqVDhX
X-Gm-Gg: AZFdTZenahvi+R61pnevcyL7fCvrRvNxkmZ1haLoTclueB6qX12001O6h4BWBnU28XS
	FeXo5Q3Wjy4BkLJGNAhRz+WFgNLAsK11EGOMMKCShRDTn4jd1IM/ujLIp7KKRlAcj/OB1BraTzi
	6Js233pGvzquOR3qQi1HGyI7j7sZlfN6+ef1xnEzfBric+9bOTTaSXJMWw+f3GoiWM14pHvofV1
	2+UrmeXT3GheR9YekEuaSHBXwZYQFp5sOMWrj2fuRY03dBaq4qJeiyjmCp1KIH579pgIbmC7Jdq
	2pnFmxpjoutvCcHJaFZtfOM1Mr6NGMa6ISp9nMTBh0FunMlVqh86vp+DeGoUNk+1677hS6wCnPA
	xyuFN/BJSQaywoUzCg5y4gFwsl8/Ka03cC9/6xooMk79Ld0q4KyOZI/ZaleCazccfr2Hg9HSLTz
	bmd8BNT1Nzhb48fsZkR43wzsUIQjEXjHeFjrhPgsV1b9n22ufN8GiKihuR9/KaXX0t0NZznctg/
	omy7Ym67Yo5KKbWbBSRp/PIcWo15Y8+uacmaaNkhEBFMJwI1zhR+qV+B5JUz1WW6PhFI6IGpOLg
	arr5I3hFvapBhuS2EbXeNI9EQTh21HOwAXr7eOQ7xgow8kDSvzyKDrJC9zhy5lHJc2NCeYDJQqS
	G9ixbwkFOLdzJ5Sul3B+zLcE/ubZ5LIiE/GLg2RAiUxof
X-Received: by 2002:a17:902:ecc2:b0:2ef:ee39:5dbb with SMTP id d9443c01a7336-2f03f2b52f4mr19751355ad.61.1795147193940;
        Thu, 19 Nov 2026 19:59:53 -0800 (PST)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2f03f1215e2sm7801115ad.63.2026.11.19.19.59.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 19:59:53 -0800 (PST)
From: phucduc.bui@gmail.com
To: Mark Brown <broonie@kernel.org>,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>,
	Andrei Simion <andrei.simion@microchip.com>,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	linux-sound@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [RFC PATCH 0/2] ASoC: atmel: mchp-spdifrx: Fix format handling and MR configuration
Date: Fri, 20 Nov 2026 10:59:37 +0700
Message-ID: <20261120035939.12774-1-phucduc.bui@gmail.com>
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

From: bui duc phuc <phucduc.bui@gmail.com>

Hi all,

This series addresses two issues in the mchp-spdifrx driver: inconsistent 
handling of the 16-bit big-endian format and MR register updates 
in hw_params().

This series was developed on top of the previous series:
https://lore.kernel.org/all/20261119103413.31729-1-phucduc.bui@gmail.com/

Since this is an RFC series, I have kept it separate rather than including 
these changes in the previous series. The previous series should be 
applied first to avoid conflicts when applying these patches.

The changes are not hardware-tested, and I would appreciate feedback from 
someone with access to the hardware.

In particular, the MR register change needs verification. If the current 
code works as expected, the existing full-register write in hw_params() 
may be intentional, and the actual issue could instead be the default 
configuration in dai_probe().

For the 16-bit big-endian format, the current format check is clearly 
inconsistent with MCHP_SPDIF_FORMATS. However, it is also possible that 
the advertised format should be corrected instead of changing the check 
in hw_params(). Furthermore, I could not find datasheet documentation 
confirming support for big-endian 16-bit and 20-bit formats.

Therefore, hardware testing is needed to determine whether these changes 
are correct.

Compile-tested only.

Best regards,
Phuc

bui duc phuc (2):
  ASoC: atmel: mchp-spdifrx: Fix 16-bit big-endian format check
  ASoC: atmel: mchp-spdifrx: Preserve MR defaults in hw_params

 sound/soc/atmel/mchp-spdifrx.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

-- 
2.43.0

