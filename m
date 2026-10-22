Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792658457;
	b=qtvBPtbqea0xCdTreR7ZXNMzAI4xSyZzdd+6ea0AgUVXZTwqw07kA1MIcDilX98+gfJW
	 5gcjF0G8iUU+VCfksJBbfD+RO8TuUbkFUO36frwBl16hAzMzDXcGMasGdaLbb4/OZWzEU
	 ggcigsX9W8bE0kgLohTJsEAFFjAQRtx87jwJwrHScY6snPhKeUTlEAOYPheP++cQ676QN
	 AgB2MYrtyY1rJvzjBl6XaDiEfFJYKI3Vw9+pNOwW9DWifydSMtnwByR2Hk/QGE8ipzTTl
	 mfuh472KVqyo1sXayCC+7Kd3eluaTUTj4xZGS1oiT2oWb5THGwS53YTibGk2sq+IzaA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792658457;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=vZJR8BniHZC6210HXXytWLIaZ0maMiLYh83E0jmYRSE=;
	b=MrV/wjaLmU/eiiz/2AnlMVrZIOIFJ1NlpiuGNUKi9Uz0SjKHdSZEW2vm57B3qzMpMkRv
	 3RmDKW2sfBJpmO1cshbKIKeZq00v+YNbr3d2NSqNE3RA2UXan3BjeeFHtKjwzzYO71sV3
	 mjvNrZTwSM3zumRWnKjpmDTw5+Qm19m8Q9/+zDi4kJkjM1GeyQwjAipzlbJclwViEp+Fz
	 wgbeT0gue4itzbXRa62y20rrCCwdt9NijmQ40AZjr8DlzWJkItvGupJ8tmFzUO+OOzf2z
	 nQGVtalDwyQsCxRAWFMzGilJc6I8qCftJG5MTW5A6jBjv2n++SgoL/sLW+QG6BP0nFg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=JgYsV813;
	arc=none smtp.remote-ip=209.85.216.42
Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5282A606A31A
	for <linux-sound@vger.kernel.org>; Thu, 22 Oct 2026 08:40:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5282A606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=JgYsV813
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-3ac7842c17dso938770a91.3
        for <linux-sound@vger.kernel.org>; Thu, 22 Oct 2026 01:40:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792658456; x=1793263256; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=vZJR8BniHZC6210HXXytWLIaZ0maMiLYh83E0jmYRSE=;
        b=JgYsV813C5SSPUbmcv0Vcd/D8Uudwin5r7gCakzyly3uZ7qoNvV7XPcT0mmH8EFZKO
         0lvtSkJqldaT3HqnkkoLXCoZTNuw90ulSkXpsnrJACmbRoRsfGdQux9ED80yNL8q4RB1
         tvN4wDFjlDbXwvq318GF0Tuvrbwj/9RNmWr6BZ0DVw9zl1r7VCI7uMVLGFOlajsrdZ0y
         eEgJ9PhaOqcH/6/ajNP90VnXmMVRlsmQq6up96Gd+87v0UbpgyU+T7pHo0aJ/tC+xH3c
         JNLk4/sR4qpNBBW5CrVCwJFpWZXorgScMbniNwTdTDttWlwi11nSBo4lTOhwEQ49+O8Z
         nsag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792658456; x=1793263256;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vZJR8BniHZC6210HXXytWLIaZ0maMiLYh83E0jmYRSE=;
        b=zt5o2XI5rgir/0+/oZWur8gSurFrHYUeeUqCSoONCpDTaLy/o6//5LmKeq4MTbE4wo
         NIamRb1dW+IwOMJ/nrExXaxdUmtSoz/vYf6s9yv0kuXUtoBD4MK5IBZbZhRclPdFUkU7
         sTy8NJDPTzg+XyJfe7PM4oiAHssPDhMrmHM37JoO/AbJFpLfzMxBIsohZjdCBu73SXmq
         5uElinqCESemXzqU2BiWkcWfomIPNZdt2KSmobNwpY3k+ilZdl4Wp5EBkJhFggw46Jky
         JbEYiyPbjDOaDJX+Pfg8oNq7maeGDG2OxHbLIAN+yHInGskmk1fh9YKG9DwCXKDp+IMh
         dWNw==
X-Forwarded-Encrypted: i=1; AKwUvBy+niPUSxoIl4ZnL88sPlv2Shd0NUVUj+ilx57pYQVJyWu1dyLehG8hnsv7m5vsBKnpcFfzYEJoyYNxjQ==@vger.kernel.org
X-Gm-Message-State: AFq9FYJ0+grpxmW86cm0PWkasqJmsN5IKWipqv4upLr+JtWVFVWWWU64
	iBPvsTk/etvpSj2JAO+BzQIvbI4rr7GE1SNBBxO1d24S9KKfyWQexxEx
X-Gm-Gg: AYBFou1YLE4Z3fhjLCu5bOyhrKuyQFgnk6NPYhMJEYZugQ4kDWvn8Go1L3g09/fxNj6
	kaSVKSA3+VO/CXozPzvfQANZ+1d1vBoZ0wbc2qcnq2RdG41xZnvqt1D4cjaME5wLLPBXuCmtZqC
	pvSRypEnf5TzP3YtPHnNJkbNOA6dxuDU+Vf1Zj1+8NZqRJBtMH2g5qygC6nMPKsQC9XGRRoHfDm
	JTaZZIddduGQ5EmJxmrytEVDiNg3JA5XpwY9hpwV+t8nQMPeVBLMJ4JdDiVPATnUMmjKKtxk1G3
	PmPJUVdn48CkMZDryPgwW0HXul24F84bj6pRMhyTX0XCNy84MoaJHfSjPpo/PFCq3sDyKN76S3Z
	T+24KafSwyicOGlRZHnPHvDS4ElLcCiicoMkUoz81hXW8Dk9GsZeuAwKSDNZSLAHM9S9jXiyhfJ
	86PGAXlLBt3i4EV1lTj6vr5RxewoycZGMPh+zrdQEnaJE6vK95cFzOS7vSQ3sMhNVTvpml00PdH
	Um0M9DUfWfFr0HisKs+r/7eSkBBAgr8sR9aznPNLerLdOQEnB3ORZNb0IyoOgk36dggjr0ljkZH
	fHNsVkiZ3D6j9AEz5m7vae3Aqn9AN1gtCFg2X9T9JmuOwRn6sfl1SA/ToG0i7lTvMdaGNN0=
X-Received: by 2002:a17:90a:cf10:b0:3ad:8963:344a with SMTP id 98e67ed59e1d1-3ad896335dcmr2485793a91.66.1792658456409;
        Thu, 22 Oct 2026 01:40:56 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ada48a573fsm3340992a91.10.2026.10.22.01.40.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 01:40:55 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Binbin Zhou <zhoubinbin@loongson.cn>,
	Mark Brown <broonie@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Yingkun Meng <mengyingkun@loongson.cn>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [RFC PATCH 0/2] ASoC: loongson: Fix configuration and clock error handling
Date: Thu, 22 Oct 2026 15:40:38 +0700
Message-ID: <20261022084040.31181-1-phucduc.bui@gmail.com>
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

While reviewing the driver code, I noticed two potential issues and
looked into the Loongson I2S documentation to investigate them.
This RFC series proposes fixes for these issues.

I don't have the hardware to test these changes, so I'd appreciate
your review and feedback.

Compile-tested only.

Best regards,
Phuc

bui duc phuc (2):
  ASoC: loongson: Fix IISConfig0 update in hw_params for rev 1
  ASoC: loongson: Handle clock enable errors in set_fmt

 sound/soc/loongson/loongson_i2s.c | 44 +++++++++++++++++++++++--------
 1 file changed, 33 insertions(+), 11 deletions(-)

-- 
2.43.0

