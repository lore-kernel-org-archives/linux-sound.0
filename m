Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.181
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794821067;
	b=RZtto6ZJGkwk/egAWNQSahYt9pgy3Ugyt71VBiD57ilgefYcNyPV6vxo6P/pjpCHTwPA
	 2DAl7uYkVEuc0Vs8ywONFscnLaXxbM2P33OXEsE+WVF0oi3iN4zXntw28jWIskKn799c8
	 TJSjh3tp1D6iTX9jgQSlHf/NE532RhjwkqknHgIgxBHDkWekaytP+/ZwRnTVcq3QvVWVL
	 tZ/hXFVa7u5VGpsVuQ0Nqa5qS4YinciaCMwJiKNhT1L732FgywQSWqZJDszUgbgLBI2Ka
	 EYndLAUxfPqvHHD6fqvyVG4mUKIEysDBwwvNo/PX91ortS0Jn1SB2nic87XK5ceqLAQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794821067;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=cucuRiAtyyJedRw49cmsQXrkLhK0VoK8rf13ct59K5U=;
	b=ofZrQ8TJV6HSFSpntppCPqscysDqnL1xEfNL/uJj9ZenAPH92U1BWeeQPmZDb6jMtRsR
	 rVqT3vdtbPt2wYe0Vnkjs3p3+DjkhD22jsr1ur0WWopNrACb7qx9qbjHRH3Nc5i8RcY2z
	 FLIwwq+qcii2mtLUlGZrlGndsOEgmn7DxQVpm9msKvhaUgD/0L8DJg+TPAxuZlf1z9Rbt
	 EQZb4j9SdCMV6CYP9fgJQxliaI6V290gLZkQskjLxJZRyvDt0X+3qPAMY0Z7PEHg+vkgr
	 pqvVdCq1F8yJPlRvAOrlYNy6IusT5W+56YRgty9lAdBaE/EKULLL2TBRBzB/bCwQJ8w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=CkuKJxjR;
	arc=none smtp.remote-ip=209.85.215.181
Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com [209.85.215.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5D82606A31C
	for <linux-sound@vger.kernel.org>; Mon, 16 Nov 2026 09:24:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D5D82606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=CkuKJxjR
Received: by mail-pg1-f181.google.com with SMTP id 41be03b00d2f7-cc751eddf25so2576038a12.3
        for <linux-sound@vger.kernel.org>; Mon, 16 Nov 2026 01:24:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794821066; x=1795425866; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=cucuRiAtyyJedRw49cmsQXrkLhK0VoK8rf13ct59K5U=;
        b=CkuKJxjRDvsygZgd+aU9GZgl95fYcdfhBJvAGAKqyxvJaXrARgzSJYh8vG1obxOYj6
         Hiq8QBBTu/FBed1FFeE6pzSA2rjI4msRNQYZWbfN6pZ2aGioVQPhZ8k8pz6bMcXzMeC1
         KbSWr9EefxOFm59PXzFvms9ZImD51K8iWrPSOGfbl1G4zxjUBMpMdNR17CmqweJIlfpa
         NAgXhjQgW1O2fap99pGikhVU5jE1gSyJLECQ10l1slmhJ54h0FY1IKxDigvfe4jKexRf
         ibKbEx92bhobUUTRrJaWc1YTGHAJgp/HWTXY+yie45acO8jIoK2SkNcmd4jywIIcSMzx
         ranw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794821066; x=1795425866;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=cucuRiAtyyJedRw49cmsQXrkLhK0VoK8rf13ct59K5U=;
        b=BX3HP+kvqhya6tC/QlDvQw+72jp9sZh1D3k1tsPo6WBwC3G/xxcDkR/r6qgqyswufo
         hNMLyBv5lJD0mbcBBUQtwfZZ0MhenyxuUZ19iqGLPhOIHPBG6GCz9UV9MPshng2Ltjtl
         5nS6Q7XXlpSjZnyiIxrb8R23ZaaqrpxrMUF4F+VDmRhVRG/nqzb2h8TFo0cHB73SpLW3
         ogrkRoQdW8N8dRcvUWEqbBUgp2cnUwgvr8JFdLStVIGQth9RirAKWCTDFpFco3XA4Uul
         OdNl17qKYD54EcjFG73/2KaaYe9l3rx8JizCvlhCrO0yIQk89e931IebfqDgCJjrcSQI
         4c9Q==
X-Forwarded-Encrypted: i=1; AL+hErEz/S8RtF50ieH3aIAZMpXVlIZmtlE4h5b4nMBeT36wCqlfrtRcq0p7vxBo50W09PR+UNx15ECh0RMBGw==@vger.kernel.org
X-Gm-Message-State: APuU4Z967tIJlf8p5kVDrcGGeO8xoM+f8He7ehJKMf4u9ytH+nOsreYx
	hJmPVPE7g4vvNNOj1aEaRpLox6jQQZa3wLE0EdIyUas+VYqvyQsXrToa
X-Gm-Gg: AZFdTZfdgKFyvpZr1PmgjCo4Sunq+O9C/I56Bhyy5nIl213zJjvQBNtDWxBYhChW09b
	Ih+FGb3mD+R8tKhxKoS0Z3a/D3PpDRzyKCQSN9Oi24qzohx4MUJJwxaIWmuFPYKWf65ZGHngR3Z
	DBB7o4NKGZezWE+buuO/1JRohXjXXTnak6hSderyIrsj6TjCM3RHwAkotQ4lJnyfyZriEVUuKw7
	GaNTRc4iB7m6rNgundyKLBfi27JRlFTazGsIcVcmkZ3vP8YxoUINpQLd2+zj6hOIPVWVGuX+R6m
	i6JHxF0tr26rEZZp7oglmOQY7ucMT8r7xPrP8DBZtS695UsQnRPhMAt3O41Wi+kYNCEyBqFx6zI
	XE1Lk3U1t2jaNBRQMiwYtKVlJnzPHWOulBR49Lt7TTj/h63cXeDolpog2Co26OZVjvVZ7TcsEiW
	M4Ub2vxV/tY1z4TtpfIe/ALgUwz5psJuzvD9hP14W5Aq8UYgoRZWdq/CuklTKiK9x9ZofLy9+ch
	6ugugIhzfuSzlVz3rk9Hyh2/IwKHpBF2k6rwmjyfN20q1zH/qgREVt///ha6jbdQTNbC1rFEk/X
	6rSSPgjVCaHf+5u5Ya2vJlM+L6HUSKQkUajBP/l4Kg1m6ERS3fZP9bqZcFFHmSXzT0RmqWzi6W+
	T8Gxo0/U2iw0f8a9s/Jo/ieKabHVFEnjbupGHZ0tTq5w0XAhzyQAGaq3A0+nXS/H9Rg==
X-Received: by 2002:a17:90b:4d06:b0:3ab:884b:65b7 with SMTP id 98e67ed59e1d1-3b1b0ba1321mr8970677a91.25.1794821066118;
        Mon, 16 Nov 2026 01:24:26 -0800 (PST)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b1aec43699sm15661189a91.10.2026.11.16.01.24.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 01:24:25 -0800 (PST)
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
Subject: [PATCH 0/3] ASoC: atmel: mchp-i2s-mcc: Improve clock and IRQ handling
Date: Mon, 16 Nov 2026 16:24:03 +0700
Message-ID: <20261116092407.514998-1-phucduc.bui@gmail.com>
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

This series simplifies clock management using devm APIs and ensures
the peripheral clock is enabled before requesting the IRQ.

Compile-tested only.

Best regards,
Phuc

bui duc phuc (3):
  ASoC: atmel: mchp-i2s-mcc: Use devm_clk_get_optional() for gclk
  ASoC: atmel: mchp-i2s-mcc: Use devm_clk_get_enabled() for pclk
  ASoC: atmel: mchp-i2s-mcc: Request IRQ after enabling pclk

 sound/soc/atmel/mchp-i2s-mcc.c | 46 ++++++++--------------------------
 1 file changed, 11 insertions(+), 35 deletions(-)

-- 
2.43.0

