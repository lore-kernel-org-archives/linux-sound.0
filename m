Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794093786;
	b=OYjYmJqUeKOQ00Py+4Ybn9iUZEmbjf7P3rYgVTv0wCpzL+A5iMBgFg9o65wCIhE6dRkG
	 IMbV/1iS5rEkk6whIRWgKkeWKBczDzwAMool7LrvAytU1Yt4LYmavYZq8gLJx+qOOBD3+
	 e+Fm/Z1lM7l6qfz1vNx+MnzV3IPrmBVENVcbzlLCECFHu4beu9zIxeYScDV5PZJZVuwpg
	 6Gx3grWag72ve4MYJh1Zk/XpVvS8P6UZ0aHTozCflftWrQgT7uoua+o8AOGZPcb4GTuqW
	 Q30ZgH+L02GTsnJy22vsMi2ST1TwsaV1n9rA015JzorNsAZHvpBR0lzzvIrlSeeg8QQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794093786;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=wjc637b5mR1rWcFoGPlClV34pmy3lLIZ+mkAlzih90I=;
	b=QEJJJC+IB2fD0eb8nYrAoB2QIVf8bCsEKIz1XR7mlTVPsRXIs4hg8aXzztVohUBAk2oU
	 6yJMK2BzRaV/76rl3POYd0M0E6EAPqYjCvOoqDm8g3qxivguT8BrONnOjbCjSi2jXwmzw
	 xlh6v+2wm/XssHNdoDsjqnjx88vz4gXIhzrAibfnIF/VDwD5NVjfhLhYhR2HHpzF0FczZ
	 C2mAw80e2ys0iUo0IyKf09etKDRE5YKOJyA4qPc+ybsJSXaqY3aPOTdXKoil+J6TRSbKD
	 Oc+AE8OAaU8iaDzeG+8fSyL1J9EWsb1XOvy8z8TyYq3mn5lY9xwgeHcyl/11+qtybOQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=efvkRhXd;
	arc=none smtp.remote-ip=209.85.210.46
Received: from mail-ot1-f46.google.com (mail-ot1-f46.google.com [209.85.210.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CDF1606A326
	for <linux-sound@vger.kernel.org>; Sat,  7 Nov 2026 23:23:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1CDF1606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=efvkRhXd
Received: by mail-ot1-f46.google.com with SMTP id 46e09a7af769-843b6f8e2c7so95436a34.1
        for <linux-sound@vger.kernel.org>; Sat, 07 Nov 2026 15:23:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794093785; x=1794698585; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=wjc637b5mR1rWcFoGPlClV34pmy3lLIZ+mkAlzih90I=;
        b=efvkRhXdSfSqtBZv5C8xbgRbpRTnG3wxY9qzpi1f3lBED9RyKEGdkFbfMOff+5MyDT
         FEkUhpDVD5hVAaS/fNU2jleG4/NQ4Jgc2pCg0tvIbW4FR3wDrTbnJd2NaGxwVK1Tz234
         ikdtMWMDoblClxpb6TR3JeSKJU2DnvkJUH/T/ZpnvQwDlyz6jk3kPaYOmILXg5s8PvDD
         h09jwIhTg1oGXp0Dc1pUn2292fOeSsAeNE3E9J1CqHa4PKprF0vOEjYd+7WEVICylEV4
         zqfGHIOjX+o/iBpMuXv9ntd2FpfrVqQbVXr/1LUzqWDz+itMV7aUZnvgUlfLoddcz1Kl
         ezkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794093785; x=1794698585;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wjc637b5mR1rWcFoGPlClV34pmy3lLIZ+mkAlzih90I=;
        b=qgzGSIeFh8aMVGGbFBJfggITLJunbSOZXAMEUK3Pr3h2zHX5aDG9LA3VB9AXSwJhp/
         2V7ULRrCLVIfraEy/RV+Fi/eAD/e7JqT3wr+557kXklSchIvNVij9niyEVLewKucZpK9
         hwaSDSvSQsy/oKiDSoqM2Kdz2o83bvNSw3amfciOILxuKBoo1kSd7g+AvbUGHcyeNbJD
         w4nQqWTibmnryJOXdp4yKSo5By6u4I1sD3YF6dg9HXG9ZpyZYSysFke+3/sC3NK4XZ5/
         rvIt2X8TK6GBXG+fwFI9HXkl/IPrHGx+S/9dXqga7yezmqmGN2cTNgQNcAjWjai8z3Ph
         C1Yg==
X-Forwarded-Encrypted: i=1; AKwUvBxtZ1bx+kEbW/vFMmol2uAnEpQAwYxssoayuqMZMmgSqPCYwYdRm8qHhU7rdGEl8FLYyk5EHpbb/OtgCQ==@vger.kernel.org
X-Gm-Message-State: APuU4Z+txR/pBo3rB7BWZo6QKvf48Rk5mxL/jtmmYKGcKx8VyGphPIXk
	IjShdbu4mgNz6H+dulrVGvze1Gj2gl1RUeObEx3Z7qwZJAY6aB5DH7Gh
X-Gm-Gg: AYBFou1mglqHZAtQ+95gIG11zwAs1ELWYUr1BUN3sOk6fFwXwUpNA9dSe9OfGWj12Xj
	s9zoRqICsLgHLUNexeSpSPZ5wr/jxL5Iom3Fe81PyMoDKUp2AU03XpeMTbSYbx09ykyT2FCo15K
	s7r1r4UR40G1lYukHF6u5dlzuvHhkHNIsKEehKqw9/JYtEtBh+TU1S8aCQ1CAjSeXCgrtTGAmqi
	3sqGnl9M1AQT8rf2xGLN0d01qGwN7IhnCNuwUR1iWHpfOKy+R6p4ZfG0azdo7r/vGdAP8RwaTlt
	+AktMVi1jbde8l/d06KEegah74Ti2MVlBy/0mpexRqfhO3W/kFwWuGV8lU13wAT3V5eURXR7RpZ
	fDPIDT5pFPMauMLir/rTnE705R+FDNOLTU4btBjX+ljRGF7XCgUWQIHEZ1AcvnMBrCUd5bTcTjQ
	OpGng1I16WuYhXhcK/EkvmW/0/jYg2AcZnko5OWl51waI/XcQwv3YO8uKd1slqPHFwu88Dqb0SA
	9oNMlX1hQVMpKDTjuNiZ3Uikojl0uRf8ZUXSHiVx88DdD8oFgVTUuJyIyIHA6o7/hZpZsmPfN6p
	+bnvYQSa2W1P
X-Received: by 2002:a05:6830:4494:b0:81c:a8c5:633c with SMTP id 46e09a7af769-85f50724927mr150239a34.17.1794093785105;
        Sat, 07 Nov 2026 15:23:05 -0800 (PST)
Received: from huawei-d14 ([2806:104e:25:7de8::2])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-85f4f2df8dfsm329315a34.0.2026.11.07.15.23.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Nov 2026 15:23:04 -0800 (PST)
From: Samuel Leyva <samuelslg03idk@gmail.com>
To: broonie@kernel.org
Cc: Vijendar.Mukunda@amd.com,
	venkataprasad.potturu@amd.com,
	lgirdwood@gmail.com,
	perex@perex.cz,
	tiwai@suse.com,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Samuel Leyva <samuelslg03idk@gmail.com>
Subject: [PATCH v2 0/2] ASoC: amd: acp: Support Huawei MateBook D 14 (NBM-WXX9)
Date: Sat,  7 Nov 2026 17:22:23 -0600
Message-ID: <20261107232225.3838-1-samuelslg03idk@gmail.com>
X-Mailer: git-send-email 2.56.0
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

The Huawei MateBook D 14 AMD (NBM-WXX9) has the same ES8336 + ACP3x
audio layout as the already supported BOM-WXX9, but is missing from
the DMI tables, so only the DMIC-only driver binds and the speakers
do not work.

Patch 1 adds the DMI quirk.

Patch 2 greatly reduces a pop heard every time the speaker output powers
up (a faint one is still audible on this machine):
the speaker amplifier GPIO was driven from a SUPPLY widget, which DAPM
enables before the codec output. It is independent of patch 1.

Both were tested as an out-of-tree DKMS module on the NBM-WXX9.

Changes in v2:
- Patch 2: only move the speaker amplifier to the endpoint widget.
  The Headphone widget shares its power-up rank with the ES8316 output
  drivers, so the reordering did not hold for headphones (Sashiko).
- Patch 2: use braces on both if/else branches (Sashiko).
- Patch 2: add Fixes tag (Sashiko).
- Patch 1: unchanged.

Samuel Leyva (2):
  ASoC: amd: acp: Add DMI quirk for Huawei MateBook D 14 (NBM-WXX9)
  ASoC: amd: acp: es83xx: Enable speaker amplifier after the codec
    output

 sound/soc/amd/acp-config.c                    | 14 +++++++++++
 sound/soc/amd/acp/acp3x-es83xx/acp3x-es83xx.c | 24 +++++++++++++------
 2 files changed, 31 insertions(+), 7 deletions(-)

-- 
2.56.0

