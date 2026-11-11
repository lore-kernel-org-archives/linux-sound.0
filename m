Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.173
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794387879;
	b=P6wmD1SWMaKUdzxkgO69TIAFuqITYLi+gZRnyICTqLbup5ZmLxsTkip55i1JfHetGPJj
	 tIeOJAHYX4C86z/LkojcmqU4Uomp7UWpHiBUtaiTA/sQSmWFkoPMymQzcl/RcWMHGaj61
	 a6jHkWWEUfNKJOBYmBxdDCtyDPDy5RVD2jDz92bMMo7LpbGYVuIJEKftRk/EiyDnj97EZ
	 eKqj/VfCp6LWhh67VkZJcnEMD6uic9LCBwU9tmQGyz/W/6yvf+AU5RwsQBvqauCA1anXY
	 ZqYV+2HmIhQsNiTFGj4NCPy57YN8QzSycCjay3KcvWE4+n90X0bVqmHPnFSNWBnM10w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794387879;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=4NSXIHHAlrlnWpquuqYJcuGA/ysXonzJiU11gCiOoV0=;
	b=apiVIjM4FL4DZt5zBpleAcIaswFAeqTbv+Nm9v/HiyvTIlxjPNRUzP7jtSV55wu1le3T
	 KSNvox2P6hsbg3HsDDbTHKnEesn3FpnqsaPBFGi3ouy6SlQpZWxZTKhVNQmUoNv6bJuhl
	 BGCe07JmI+LEnkvptC48bJMhE/jnLGajvuUQiEKUctQe2AxBnsH9jZ/Y0NXX3qm0oidDI
	 LHBmUzb8eKfShIjgGergIhdp8FsgvkfX/feA5JwroL0mdDlrxbTlnke6hfjc7KCITboCO
	 Hot/yDu5UADdOTNV2rod4MaWGKJtVnaQXOuLgix+xfBM6UohDDM4/hcD3oOMNpwrLnw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=IkIseqOq;
	arc=none smtp.remote-ip=209.85.215.173
Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com [209.85.215.173])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4758060A260E
	for <linux-sound@vger.kernel.org>; Wed, 11 Nov 2026 09:04:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4758060A260E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=IkIseqOq
Received: by mail-pg1-f173.google.com with SMTP id 41be03b00d2f7-cc4aa18f9afso1231502a12.3
        for <linux-sound@vger.kernel.org>; Wed, 11 Nov 2026 01:04:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794387878; x=1794992678; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=4NSXIHHAlrlnWpquuqYJcuGA/ysXonzJiU11gCiOoV0=;
        b=IkIseqOqTOh3WorZtKvcSXdkAWviUdNa/2w+WVJ0aaVWd47QTEgB69MkdRXndYImEz
         66vLSOnif29aFvOTWsBI/c34lf9PalGndEq+FGKEM+L4gDWHtZmmbi0nusuxLCW4yEHx
         P7/Xr9C1xxZyA2lxn3408YkpQOdglt3kQsgM1Zoi640LX2YSYJAQePy1PQaP2G7j5JU3
         gRC4z16EpzgTMbFtwOOcEXB92pyJo9yhcx2O5WOLDCYCncOn9nBrgLySkc/RkZ9SedUk
         Ia2Y5KWTIx+du+gNz03ZnEewCpoAIt5F3N5xqf5CI6WTo+QJs+d7OUrp2ODn9v1Zu9Ax
         nzKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794387878; x=1794992678;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4NSXIHHAlrlnWpquuqYJcuGA/ysXonzJiU11gCiOoV0=;
        b=mcl7+2ZlFmY+yZdD/ypNGMkJeIw1TKF2r1cCcBWrp2RA14ann7D2HohemcQJTSmQEh
         oYJ62fUQXy7Gb7jlbAGU5yYkKurADSJ6CvJntLIu22fphO/q4OB2iS1mQli88IO0Vpw8
         BbIZfXmmadWwT7bruZs/ETVlh18zBQnHITavAZBNj7o7dn7NfDR5MtaiJcQ0trhC6k5h
         93ODt/DCk4IyfI+0zgs5X4qbA12Glo0lEJnguji2Ig2tbyj8ekdMGvYtKrspx2QWuJ2+
         mVJMwDNIzLvnPEE2hXgn7cQO34StBuF28fOb0A2e6Z9PGzox/9CPoBpwR7toWJBavFuR
         eR4g==
X-Forwarded-Encrypted: i=1; AL+hErHVJOj7L7ab223Swd5nPAI9PA2XjENO3cgkGoy5lnaEUwbbabJqjZX4IvBZea+Y9usBVsIBoxo4gYeFlQ==@vger.kernel.org
X-Gm-Message-State: APuU4Z8qhiF0THrmEzPP/5iRi1R9aSZhZUoVOShy26esHRpftwhvJJLl
	KsU/fB9Jugp9oEjIDmQK6h290x2aBCxCpEU3S9eHl2nSqhW129iC2yrE
X-Gm-Gg: AYBFou0WTDXJziQ0YQSJxOhWKWNo2+N6Wmh3rO5+ResjmBB/5V2rfqI45151xTFAyWx
	Lvq7MPvFjIArQPfMlpQHGvrcb1P5BGiDTpnYAbdckep9hccbE4ohiXRjDgYtlhZxCo6ZmkbXEKP
	r1yzrVWUrCC03XLGvhox0NQIflRRA3yAcHB7ziqgCeWvDUwTJoTHSTX7k3pmx0EZeGjvMZY6Q5L
	gMeRFt6kdFnvYo8VQ/AxYSN+7MEq9va8nXW8Nc4Wm2UM5DfK51e+uJWvE4GgGR/gPq8ci7Z3Bi6
	X11cb62aexM6QDzsCp6bQC5IyaQiSLjrR9tgKenStqCtedXfcmHULtXMQ2CJWKyqqHPKJ5p5Mvb
	UZjaqStsW6S0iiCku1L2q2vszyMBOYSQ3luFbxgEonzOCyzalywF88kkntbfiZPi4qLWj+7Ap7t
	DDf2q/HgPuzgSMcDdoQ1gdut0UUpKOE5BaGPW6l1fg+ji5K7MYyBIyVA13JVqOj6N9zMotHcNod
	h8UCXXCmFkbPmwEMJmAlk4B/e9/a59SWwNStPfpHCin8q7HrdVD2N2M+BEJ8vjteNwTWPB3ml0f
	Id58ezlUGz8h61bgqrNl1NJai15UdRI8qWwVAY8XoCYn2u2dY4rM1btqZfuAHDM8YWIHFZSNOee
	bC/h955fst34OZBij55a58saHjAHjL2AopawW6mHAu/0=
X-Received: by 2002:a05:6a20:a106:b0:3d4:52bd:b89d with SMTP id adf61e73a8af0-3f2fc99fc04mr2159073637.23.1794387878436;
        Wed, 11 Nov 2026 01:04:38 -0800 (PST)
Received: from nugod-NUC15CRHU5.tail9f095a.ts.net ([218.237.104.87])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8baa7cede06sm1929924b3a.7.2026.11.11.01.04.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 01:04:37 -0800 (PST)
From: HyeongJun An <sammiee5311@gmail.com>
To: tiwai@suse.com
Cc: perex@perex.cz,
	ivan.orlov0322@gmail.com,
	broonie@kernel.org,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	HyeongJun An <sammiee5311@gmail.com>
Subject: [PATCH v2 0/2] ALSA: pcmtest: Add a volume control with event fault injection
Date: Wed, 11 Nov 2026 18:04:27 +0900
Message-ID: <cover.1794386073.git.sammiee5311@gmail.com>
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

Hello Takashi,

This is the non-RFC version of [1], which Mark found reasonable [2].

Patch 1 fixes the places where pcmtest.rst does not match the driver.
Patch 2 adds the volume control and its two fault parameters, and
documents them.

mixer-test results on the new control, under qemu on sound/for-next:

  no fault                    all 8 checks pass
  inject_ctl_no_event=1       only event_missing fails
  inject_ctl_spurious_event=1 only event_spurious fails

The pcmtest selftest still passes all 10 tests.

Changes since the RFC:
- document the new parameters
- rename the control to "Test Playback Volume", which the OSS mixer
  emulation does not map
- add the documentation fix as patch 1

[1] https://lore.kernel.org/all/20261103011000.1012035-1-sammiee5311@gmail.com/
[2] https://lore.kernel.org/all/61df01a7-10ee-407e-879f-d9c1085a5d43@sirena.org.uk/

Prepared with Claude Code (Claude Opus 5.5). Tested on x86_64 under qemu.

Best regards,
HyeongJun An

HyeongJun An (2):
  ALSA: doc: pcmtest: Update to match the driver
  ALSA: pcmtest: Add a volume control with event fault injection

 Documentation/sound/cards/pcmtest.rst | 25 ++++++++--
 sound/drivers/pcmtest.c               | 68 +++++++++++++++++++++++++++
 2 files changed, 89 insertions(+), 4 deletions(-)

-- 
2.43.0

