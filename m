Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794364103;
	b=zw0/CM7jQV//hTBLYeO0/bDcm2GrgGqPewf89HbGqbolU+OvNlZO1E0Cx09GdM9yB3w4
	 HEj4nV0o1OkmPspkoj3z/xfxSPq3AICrDyxSphPpPs3tVHjBbiSr26mhbrKulIRCvnlOT
	 cIik1de8cTl1YXsopEpDP+i/R996T1vDyq/tLnL3ewP7QEgnJ2pJY1x66gJPpmCG57UKP
	 +Qzx9Ai3p8WZ345IaCThfAwSyaomwuh8QS5vBbnRUbudrGq721pHWtzCxuMyAL1nOdn4J
	 imQZ0dZfcFU1HPl4c5YJYWcNuUM3RhDEOD7bym2wgpxJjs5bBruW3C5XXaPBylnZibw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794364103;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=LIw999DKhGL9raQZizUEhyS0NYOakQkyAsor8Jedtw4=;
	b=AMOhj9LwbWIOspa4Zs4G0+wSx2fg2+09Vz8rn57Ypqi4wbTyOM6Cnmb3fiddX6r/MT1V
	 3QqLOD36BO5QnGwUMTBOO1hHb9SrTZC0AwkCwa/OEWiiKy/WeCuCoG+YEpNzzIPn0SeZn
	 xYniRdFTM4PXt5dXHgv5A+g3+umNv69mWW45vzGCOwkNNpr9K0qPnI9ZOofwQhbNQZuQp
	 k53BG8/L0+IDhHW20Gvd+5f+fFccbbhprH1OJqRW+EPDF6iUtF3ePvOv5Y4icw7Vod/So
	 K9ZsL9HZOy3cuvNiZStR+mY2FtfNnJBGx22HX+siKyYBfT7eXHclYZFeOQEPvzqB3sA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=rGuks6vy;
	arc=none smtp.remote-ip=74.125.82.42
Received: from mail-dl1-f42.google.com (mail-dl1-f42.google.com [74.125.82.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08260606A321
	for <linux-sound@vger.kernel.org>; Wed, 11 Nov 2026 02:28:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 08260606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=rGuks6vy
Received: by mail-dl1-f42.google.com with SMTP id a92af1059eb24-14394530ec6so3562700c88.1
        for <linux-sound@vger.kernel.org>; Tue, 10 Nov 2026 18:28:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794364102; x=1794968902; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=LIw999DKhGL9raQZizUEhyS0NYOakQkyAsor8Jedtw4=;
        b=rGuks6vy1k5Lhfnv9gV7fP1lIdzcKOY8yl5G0SxHFWwUJuuQHoqQNu7JSW5ZGM+64+
         xEB9K+Pp3Fvh6BJMg6dZeg48zvI/VTdCT7eBpP6LAMQwJkMhJ7PeTQ16RylX0dsJMKAJ
         87Gwds21qOCgQtGEolJmxrwa0JG4YZiXQbL0YvmJNOJB7fFT+sgcK/kW/paTig3LrdzQ
         b0ZbJwhQfX4+NG7L1NXi+E5CYJHGLRNda90in+4QdkDZVaYid2St1tpO7dIPZZE2Jyqs
         yfJvDbEFoN+oe4+p4B9LKyH5XaU2LPD+28PGLs5MSLlp34Ua3wlgjaVIMu0Xvd1lkOZ/
         zRcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794364102; x=1794968902;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=LIw999DKhGL9raQZizUEhyS0NYOakQkyAsor8Jedtw4=;
        b=er7uvKIIePh65F6aAspt6yITyxavmJqD05lZ/uvzEFivP36m3AuAQIu9kyL1VMRXtX
         PzafNZeCHxia48sJP/CoC7pMvAAeXhVMfNgYbe0tcX0Rw7x5Q66tcCIAn1F7tkXGNqt4
         QC/Jcbq5hT8lB2zcGpJCkN+m1aQ+cpWmACnx9RqumoooX1X8LsLrg6yZIM3koTL4HNMG
         rEjNjNi19zyj2FmRCOW6MzPgHFh37MPNwgDUTClIOpKR/cpppnefcRuVXvrPa79Q6UpT
         JhfYpYKsU1vNsWJQu8a+gjkTLIYaNyuNvIpSHWi6rP25rWxGU/LcI8jJaMaHkgaJhSVA
         sVrg==
X-Forwarded-Encrypted: i=1; AL+hErGUq9xBo0Ky4Y9JFJj2hKlvAwf53ub4BsGFW/qyaHe1tk28skwz6PXtwgVB6GDfK5uSkXPvjlwlnBGBRg==@vger.kernel.org
X-Gm-Message-State: APuU4Z9vcQZihNAFuIkZrQ3w5KeIXUldTNW8p2GH4rByT4ExnR1HUag/
	gvPL27Nnykwe6kg7SIclcPTkUK15+X8DDFMsCvLnhukfNa3fw5WkpjJj
X-Gm-Gg: AYBFou3kIC0n6S+49asaJoJufmtBBqqjQKi5JqyRZYWdX2P508y38Wv3xjEVasIOnEu
	Y0ruzPCUb0jqshwwxev+e5vpRtfWLHOi961AyxlNC9h0T5zjEmVVeaSqwu05N5AY5T3BSvyEUvN
	5cElYZzRR5owk5dv0GOAeoI6J1OLCjxFa47HBDk2a/976TsUcGFKcZwLHeXmXf9j0A0xwh1umQP
	LT49HEk9+9RUJn/28T+JsHzTibqe4GhdLD0EUvxHtL9cHj9JpYc4U/6CLiUwVbv5QEZYyLWMXdL
	ZyaR+9xUo3kujnglycXSLoAp4M9ShXS/7Jnm8VIFm993oRJX4jCNQEFep9PbBd0RhyfXAv7Xm7D
	SW4atdF067vWyo7e3j0uxMfJ8QIZyN4VG+xDG5qHV1dazkhF6N94XKfZFpMA6UNBPyka7D/m5B/
	SqrFpdIEqSQkjkcWYn2JPgpoG0sFCLlO6IqGsfetHdYpVOlFtJvkpRiMAkmWWwDYRiENAu6Ij6o
	sSx7U8ZoVLx0JTddX5fikBQmRN0hq9/g2ZpCLtps+Alue4vwiIreVrxQHCxw+TrYJLkSMsjdVEI
	QfMBXb01Uu/3af7/VI/v73u0h7GXCIk5TzAONAzHb31//5ffFKjS3eVRzTpRmEWuv99wTWlnx5l
	r/0TBJ9VWH8l22BoDTe6agvPd50pFZNzm1IIwSDaUdicm
X-Received: by 2002:a05:7022:f50a:b0:1b2:6855:99ac with SMTP id a92af1059eb24-1b3c03affbemr924246c88.46.1794364101997;
        Tue, 10 Nov 2026 18:28:21 -0800 (PST)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b3b5b4b90csm10054285c88.14.2026.11.10.18.28.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 18:28:21 -0800 (PST)
From: phucduc.bui@gmail.com
To: Maxim Kochetkov <fido_max@inbox.ru>,
	Andrew Jackson <Andrew.Jackson@arm.com>,
	Mark Brown <broonie@kernel.org>,
	Xingyu Wu <xingyu.wu@starfivetech.com>
Cc: Tim Bird <tim.bird@sony.com>,
	Yuri Zaporozhets <yuriz@vodafonemail.de>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH v3 0/6] ASoC: dwc: Fix several issues in the I2S driver
Date: Wed, 11 Nov 2026 09:27:25 +0700
Message-ID: <20261111022731.8243-1-phucduc.bui@gmail.com>
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

This series addresses several issues in the DesignWare I2S driver,
including clock rate calculation, DAI configuration, channel limits,
DMA FIFO sizing, and error handling.

Changes in v2:
 - Move the indentation and typo fixes into a separate commit.
 - Add a separate patch to propagate optional IRQ lookup errors.
 - Add Maxim Kochetkov's Reviewed-by tag.

Changes in v3:
 - Add a Fixes tag to "ASoC: dwc: Fix DMA fifo_size calculation",
   as suggested by Sashiko.
 - Ensure the reset is asserted when IRQ lookup fails,
   as suggested by Sashiko.

Link v1: 
https://lore.kernel.org/all/20261106112940.53550-1-phucduc.bui@gmail.com/

Link v2:
https://lore.kernel.org/all/20261110095525.504660-1-phucduc.bui@gmail.com/

Compile-tested only.

Best regards,
Phuc

bui duc phuc (6):
  ASoC: dwc: Fix bit clock rate in TDM mode
  ASoC: dwc: Fix error handling in dw_i2s_set_fmt()
  ASoC: dwc: Fix channels_max derived from COMP_PARAM_1
  ASoC: dwc: Fix DMA fifo_size calculation
  ASoC: dwc: Propagate optional IRQ lookup errors
  ASoC: dwc: Remove redundant error messages

 sound/soc/dwc/dwc-i2s.c | 59 +++++++++++++++++------------------------
 1 file changed, 25 insertions(+), 34 deletions(-)

-- 
2.43.0

