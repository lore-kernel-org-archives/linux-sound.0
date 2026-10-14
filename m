Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C09851EDEE
	for <linux-sound@vger.kernel.org>; Wed, 14 Oct 2026 16:27:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791995237; cv=none; b=dOWfn1ifOwk4wO38+3aBNwjdvdHkvDpJP5tE1JOlTlMnlM89OLyzoAXzpR84da0ljsKpiMVlNbJQIDiWGU7tGgWxVp1NFkFODzrmqkIAOwrwHey91BbSJO/6uNnQibSbGDd3sgNZPZLEW9sI+Gh1xR3BVvU1yJOH++rIhj49Uf0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791995237; c=relaxed/simple;
	bh=c0yy33joFZEmbfuIHCPnHt1VOe6qCnqOzWFCVZq4LCs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=UCCvoG9nqM7zcz4FOSeqUq4SK9lVslHDQE1v4/KzwNh94lquZJU1F/vfY//TI3gYtotfNXdGA1ZmfoldGBm58X70+ymonGDbX/PyyBObSte0h9vxbGKOyVnoi1Qq3aTlFgsswIgCtilRlMTSaxfD6KuZbpsMzGE4VN096bSvQA4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fIP6YiS5; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fIP6YiS5"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4a16c399641so42629565e9.2
        for <linux-sound@vger.kernel.org>; Wed, 14 Oct 2026 09:27:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791995234; x=1792600034; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=yniGqF21dTRj7u5IQTGNCDiFri0/FKhl7euVY4lavmk=;
        b=fIP6YiS5uBOn9iL0/HAZVL2wLYrKAifvwzGM+6us1I/ZjA504WxZgauawr3Pty8zuX
         aKY+wARShGpyIOsRDKxDCbZ1srN7xXo5DXt/DBDwD4Tf/DpkkLti+Cj282L6+Jh1Eszz
         zaP6tersBa1u8KftitQZjTLfUNKexurjBwnvEPNxd1Cv9Hxdf9axwsE9SiMTg0QDtWum
         8gom47fmpbg/Ail2PaN5l1VTNrHLGtz53kh8a1ni7k8i8X51Qtq8PR9ql5RlRSF7QyVd
         9TYbng32CdWBQIj8pH5LGOc7lZJ2lBAX0AfJmJrxk+Mc6MGhCIHCcwCZojJuJnGvggxY
         zMnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791995234; x=1792600034;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yniGqF21dTRj7u5IQTGNCDiFri0/FKhl7euVY4lavmk=;
        b=T4fd56GIubm4lC6F57bW63Ua36Psc1nRDy3Km0rfwVEy03+QXRz8uXCMS1VOKX1wg3
         3+4vmC3aYY/0RI+OUh77YOo+FNaTRY8RZ0Ou33Xud3QgJB4NkPLAq+CCVuopLGDK+zOX
         BxiE+j2GU4lXkz0iLpCjKJOSTInfmH+lKInyRzQ8KQ9vkdyE/padW+ylx0YHCsNYltgG
         ozYpS3IfN/SVuF2TzCnY4mfr5PzbY+i0deHmRhefvfMGH2wAw4NFsVY09XO6gRt/mfiv
         mYt2951RBP0OEvH3dnkFdINT4wQqqKnoJuZ+n2asTlkpdjEvaDgssYfJDTQXiKpeImmj
         bntg==
X-Forwarded-Encrypted: i=1; AKwUvBzpjmANvOInFO5fxDkWCLkb7W9uTCgPCBTl9lvdy+IgMkL34dkgdlJK+bzO2GcmUn8fgkg9QjHeU9XudQ==@vger.kernel.org
X-Gm-Message-State: AFq9FYLPQaEuLe56oyP10bCMw7rbvK6dAcR8CW9wv81pROzDtq53MUef
	uElOzSvPThWdq6yRlOVra0sUXHbkjhI9jLmL65iUR5hXOUmtBJrNJH0O
X-Gm-Gg: AYBFou2tQ6/aBbRSh6mYGbbSx72bi/lfKw/AAsj3nwFBPkvDvMDqd7WXE6jKOlJ6Kw8
	U2iMRsda4dHACp3NEfwduY/MDdzU3LO0zEStCrFL5crN0hSpYYEg9xUO5QichtswzJT01SP+X6+
	F+OOtDzTvPurVDzuFi1VU+lU1hvrnAk/adU6L5ctHj3/tywDU8nG+i1NcUTDldJdg4kfBjVxKaG
	DBM+ykBK9/UiaYPo/UbZbVJYVEIQOG6soBJ4RhOZOiOC/qb8oaPmhIdOhux99EmMwKJaEnMUzzA
	FTtYcB9MKY72rN7+PfGFoHA8jPsI7duXfDU7+BTGz3H6gSqs2nOd69tOkzdmUoLVza5JjKfpVJ4
	ikZSQX2B4jCpRbxKn28myeP9isBgrqsF+LoqkAmcCk9W1z/RIvdu3gCbAf4MgWRtXLp7Sf2rKBw
	AUrhI9Zdb+o6lfGXbAmfg0kY9IZ3h9Pys0y9K9s0ku9j3tM195PPa1B9joxWXvu0lfqjI4Gf9Hb
	EDZdDpLppOB2vcCsBo2H75H5A==
X-Received: by 2002:a05:600c:820d:b0:4a1:65d2:7912 with SMTP id 5b1f17b1804b1-4a18e47b302mr298262975e9.8.1791995234315;
        Wed, 14 Oct 2026 09:27:14 -0700 (PDT)
Received: from localhost.localdomain ([188.190.249.216])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48de0aaabc3sm13076890f8f.16.2026.10.14.09.27.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 09:27:14 -0700 (PDT)
From: Vladyslav Tymoshchuk <tvlad744@gmail.com>
To: Srinivas Kandagatla <srini@kernel.org>,
	Mark Brown <broonie@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Zhang Jiaxi <Z1529105815@outlook.com>,
	Johan Hovold <johan@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
	linux-sound@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Vladyslav Tymoshchuk <tvlad744@gmail.com>
Subject: [PATCH 0/3] ASoC: qcom: qdsp6: report the position of a drained buffer
Date: Wed, 14 Oct 2026 19:26:59 +0300
Message-ID: <20261014162703.10172-1-tvlad744@gmail.com>
X-Mailer: git-send-email 2.45.1.windows.1
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Since commit a93dad6f4e6a ("ASoC: q6apm-dai: make use of
q6apm_get_hw_pointer") q6apm-dai reports one frame less than the
position of the last buffer the DSP returned, and commit 44432315444c
("ASoC: qcom: q6asm-dai: use q6asm_get_hw_pointer") did the same in
q6asm-dai. When the application stops feeding a playback stream, the
position never reaches appl_ptr: ALSA never sees the underrun, the
stream stays RUNNING without period interrupts, and drain ends on its
timeout with -EIO. On a OnePlus Pad 3 (SM8750) this left PipeWire's
PCM stuck for hours after a stall.

Patch 1 wraps the q6apm position to 0 at the end of the ring, as before
a93dad6f4e6a. Patch 2 resets the q6apm hw pointer on prepare, which
a93dad6f4e6a also stopped doing. Patch 3 is patch 1 for q6asm-dai.

Patches 1 and 2 are tested on SM8750 (numbers in patch 1). Patch 3 is
compile-tested only; a test on a Q6ASM board (RB3, RB5) and on x1e or
sc8280xp for patches 1 and 2 would be very welcome.

The RFC "ASoC: qcom: q6apm: correct PCM formats and error handling" by
Zhang Jiaxi [1] touches the same hw pointer, in graph_callback() (4/4
"recover PCM from failed data receipts"). The two do not conflict:
that series changes when the hw pointer is published, this one how it
is turned into a position and when it is reset, and that series
applies on top of this one on sound/for-next without conflicts.

The analysis, the patches and this text were drafted with an AI
assistant (Claude, see Assisted-by); I reviewed them and ran the tests
described in the patches.

[1] https://lore.kernel.org/r/SY5PR01MB10600B2BE812BAA1B0FA501B4A1932@SY5PR01MB10600.ausprd01.prod.outlook.com

Vladyslav Tymoshchuk (3):
  ASoC: qcom: q6apm-dai: wrap the position of a full ring to 0
  ASoC: qcom: q6apm: reset the hw pointer with the fragment queue
  ASoC: qcom: q6asm-dai: wrap the position of a full ring to 0

 sound/soc/qcom/qdsp6/q6apm-dai.c | 12 ++++++++----
 sound/soc/qcom/qdsp6/q6apm.c     |  1 +
 sound/soc/qcom/qdsp6/q6asm-dai.c |  7 +++----
 3 files changed, 12 insertions(+), 8 deletions(-)


base-commit: 8ef28aef33f2d5da6959ad6b579ec3cfccc009f6
-- 
2.43.0

