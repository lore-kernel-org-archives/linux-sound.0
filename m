Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.180
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795171620;
	b=OXFXL4bKSoEyXtARjf26f6Xmt/YiHUmgfQtm+GwT8godT+4yB47gl7u7UXgnRDM9+/3V
	 Q61HSMGzOOYP8ZMjFK/Pip10aMR6hIGDH0LjDP5xFN/1p7BpvvxI6qHGJFd8mPowcimtI
	 2+Wa9Mv15Hoco9fBtoh+naGBqm9u6WK8OIy4Tj6da+IT/r64N+FX1tetXJQymebywNK2t
	 3QL9CoTmAWc4IWVfwTLxyIegn+k03sNpt02Hq558x607PR9YiSdNpaBSqfX9bBIuSSK7m
	 8aMabptiEDYdvbeVIaUWUAvxhVg2YgNlE01/tDEOYS1SZgCXnM7OyKkgugpb+MTcuBQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795171620;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=FlPQk0xkrEmQkTap0k2QUV6qXixy3ELzOIiL8b3426k=;
	b=b0UlvpShVJOSBhnWpk15LXmffgCc7hBKSPjxqDdsDzDZGC7UwK3e0pPOXAlPbLIWzxsk
	 cTpuvIo0hU0r5KFeJQ/0jRb8P5l7+qRS/A+8Ddyx34b/glAjtSFf1RDUwqJaeFgb3RTNJ
	 OIPqIHk5i3BOHZt+siU4MFLUlDowq8yI1dNKZb969UttTAZY6wkn7HPIgaST0yH/p51ZG
	 MC/H8pN816GEKt7r26Dc1OxLq4Y0RUh/9jBu9XIk8/PBHlKdEiuuV16Gs2/s9U9WHbJ9p
	 qhGfVHjvGOk/Lhp7QvWPnvL7lVjMcDTq/z6pDqeSGWrUVkiD5rvb+VfMnThmDFXJgLw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=zoLiwRLM;
	arc=none smtp.remote-ip=74.125.82.180
Received: from mail-dy1-f180.google.com (mail-dy1-f180.google.com [74.125.82.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12A4B606A32A
	for <linux-sound@vger.kernel.org>; Fri, 20 Nov 2026 10:46:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 12A4B606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=zoLiwRLM
Received: by mail-dy1-f180.google.com with SMTP id 5a478bee46e88-382f4710a17so1188452eec.0
        for <linux-sound@vger.kernel.org>; Fri, 20 Nov 2026 02:46:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795171619; x=1795776419; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=FlPQk0xkrEmQkTap0k2QUV6qXixy3ELzOIiL8b3426k=;
        b=zoLiwRLMkiqlNdHkj2K7Py9ghW/D78MwNVU5V74TY5eMc0TeqysbubI5az/qQ4xvE7
         CO3rZtDdQUSuYXXPw3q8sbRBJzKmDTW7ynaCIg9yevdi2oHz1JJhtowyuUtL4hBGTKMb
         qMHeYnSoAgOxhsmnWFR8n9kO6zY2+wDpqNHMjPlnpNozYqngIQO80EPxv3V168QjPI0H
         Tcv6MMlAS/P+z2UATsPKttopAr0IamWtyYnaR+rKWMmyEZ9sKvCTO6Aps7y1kEpdoq2w
         PmcirYkYPX3RISBmTxnOasVDor6mZ/cbyvnWeF39IiwXKafZvxe19vDE4OlezW3mrRzd
         TUaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795171619; x=1795776419;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FlPQk0xkrEmQkTap0k2QUV6qXixy3ELzOIiL8b3426k=;
        b=jd5zfd/8cbnjIrCjztQiqfJ/JC5+EqsEnwKgdmE3wzvCQbV+RfLzb7ixb32Tk9xyAl
         beTv1wtnXYsp5JoQB7tQZZ//w74tJ66NZtLfnQMNTcJUJcRBWIck+VN5GLbheahhS/l5
         9J/hIJ2OCAQlyMx2S7qYSiYzjvIlczYnP6jOZebPgMuJlFkMI4bcKIlFZhpzIO/d4QMc
         lMcPQa1I2M0tYUJGlqs2IZkp29Mzr2W75jcKG6wMzEx8ORw2rGJyhFbEvcw+fRwz0E7X
         qeZzGCiOPF5SCr9J0p6p7fvSV8Qlnxpg4Gys1U5xhWuQp4OBqqtGRXoz7XKqSRivP6wY
         oFYw==
X-Forwarded-Encrypted: i=1; AL+hErF8OCjIdKvC6WQnDOHlo0zvtIuJLVSEauAdW4z8eQuJoyMj1bO6AognBYNUs+ktNFiwoltJGknptklsaA==@vger.kernel.org
X-Gm-Message-State: APuU4Z/c5wS+yNCt8p3zwRy+dPKin00pu6w1GR7Ga52rwUbGTtz3Ul7p
	v1V2PBqsd0p97HLUeQsSnrTEiRJIKWfUV/tam8FWisqx8NClJSSOoyCf
X-Gm-Gg: AZFdTZfId4gJ/HEaeORMuBNdFF+hK0co4xLON3Wv5/vLIUr80EmBA31j06XrSGmukMb
	S3e0B46HQaOguwYepkVQOAVYkCvo/LHWCpqp/Gbc4UgP+YUHeT/Z6mAr7xWplr2ObTCAk3mWVQw
	ReTrgA0kGglPbrGNXIkBNObZJJVTeNy8E+zE09AZdTfTQWMp+3Rgq13SHYTrjmv/kgwY07VUuKp
	xD9lAup4kGGM+LDGqm7w0GYDXUActgsQDAy75fROsdTANxAr0Cwmj4jDBh3VlBMaf5EJXiNliSi
	Le2TJB7o3CZeZBG2/AWZ/Pk/x9o34eNHv2mwgIHUukYuPxlaPrIrXS2+52hRtOCPUuLZuReALst
	bvZwTOLEZ2thiXVQmx1PWmK4FuvJ3/PX+E/YFSK2uFluVqWYCLhxoGfLqdq9Mhq1AeToWW5kV73
	05lBkM6/EPvVKWPxRzRB/xAM5kTfbEeetqcEXYknrnPpy7ltQIoIy1SOOgUDRP3znN2uG/+AU8k
	o19Nq7c2dGg2DwAZuXWrcdgsaJI1y5mmuKejIsSkNDAMaljTw321tRG5oQY11f5LwfbtcyjtP4o
	t0S9uitda611j6/brHVOoPEayk58AMGavsWWXJZS5LVdjDL/hvos+C2muk0RhJ265VxEI6EPOUn
	m0EBedyMb/BH9J5n8s/rvBClbiyncRNFA9yn+qkBER6OF
X-Received: by 2002:a05:7300:ac82:b0:385:4b9:18f2 with SMTP id 5a478bee46e88-3857093f077mr3506558eec.21.1795171619119;
        Fri, 20 Nov 2026 02:46:59 -0800 (PST)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-38566cd4efesm7326292eec.12.2026.11.20.02.46.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 02:46:58 -0800 (PST)
From: phucduc.bui@gmail.com
To: Mark Brown <broonie@kernel.org>,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>,
	Andrei Simion <andrei.simion@microchip.com>,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Codrin Ciubotariu <codrin.ciubotariu@microchip.com>,
	linux-sound@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH v2 0/2] ASoC: atmel: Mark interrupt registers as volatile
Date: Fri, 20 Nov 2026 17:46:28 +0700
Message-ID: <20261120104630.10240-1-phucduc.bui@gmail.com>
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

This series marks the interrupt mask and status registers as volatile 
in the PDMC and SPDIFTX drivers to ensure they are read from hardware.

Link v1: 
https://lore.kernel.org/all/20261120100408.8053-1-phucduc.bui@gmail.com/

Change in v2:
 - Update the Fixes tag based on Sashiko's review.

Compile-tested only.

Best regards,
Phuc

bui duc phuc (2):
  ASoC: atmel: mchp-pdmc: Mark IMR as volatile
  ASoC: atmel: mchp-spdiftx: Mark interrupt registers as volatile

 sound/soc/atmel/mchp-pdmc.c    |  1 +
 sound/soc/atmel/mchp-spdiftx.c | 12 ++++++++++++
 2 files changed, 13 insertions(+)

-- 
2.43.0

