Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794391598;
	b=xuAYmSlaUMGnYKNXat1TB0T/p1oBY5otJ+oAYDD/uh2VqRhtAAubDwTrGmDFI2iEZizU
	 pmhvTkg9LaCzX7gowtduOFzW/Y+70dLNYGbyiCdgZs0O+sbjiIDD3x9IwtK8Rcg7YLVkq
	 xlTXvb1ZsmgAlLXjZCSQpQMX8i6MJt0XAli3YUqZD1ORAOzWKk40Mp4UOoHrnt24YEVlX
	 5uZzM3Qxx7tFEJWXWjvgZapVVVi/S8nKF/23t3/oK1e4UtZwUf0zMOK0X39vtksaxSAdm
	 01po54D3RtlMYeoA0n7PAFaFo3WDFeSRvsMnTR/chdXRKv63E0YsnWRP+fdmcd4e97g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794391598;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=wDTNKmKcvG/TVcEJQQhWa3Cr1cP+VoAZc+pn91JcdUM=;
	b=lgQjOWap2alg8ytZkIhSGdCxMPYEgIx4QSK10z+PTH4DzGmFnqGnqHOfSCT3/SKvJWzx
	 yur0Wceuq0JfTppf+qn26XJqxV1Uji04ebhKO1rhbR4L/TGsYZ9Lzcr5KT3srG8f97+t+
	 MG6CqQznu68XWdX69SR0rpn+TnYhUpm/lkZ0G/DfbCeBS4XPsbf9H1GvmZ2hDF/2C/PFQ
	 13z1Jho+/bmCH2MJjlm2m5l6PVHCMqannOrFPJZ96fqTMW2vuF97cvHqMwW2aBfvauh40
	 s99+HC8+WS4VFGlNyAxkBGBBn37OIWq+Mjc/AqYMbQeiXTCYtQ4hq+XnqdlkapIbDhQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=vXlp5xsN;
	arc=none smtp.remote-ip=74.125.82.48
Received: from mail-dl1-f48.google.com (mail-dl1-f48.google.com [74.125.82.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94A4D606A31C
	for <linux-sound@vger.kernel.org>; Wed, 11 Nov 2026 10:06:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 94A4D606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=vXlp5xsN
Received: by mail-dl1-f48.google.com with SMTP id a92af1059eb24-1a2af4c8d00so2457336c88.0
        for <linux-sound@vger.kernel.org>; Wed, 11 Nov 2026 02:06:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794391597; x=1794996397; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=wDTNKmKcvG/TVcEJQQhWa3Cr1cP+VoAZc+pn91JcdUM=;
        b=vXlp5xsNRdR8tPKdKKNdWuHv2jGGCRjKuH6kH1nBvg2JP6WTYOt3s7fxGTSxDzXiAQ
         JuEEHggsmdujIxcw6gAmWAV6lZfarMgEyTcZ97I6XtlPvAcU7E6IlO+vx44zdzrpLQqT
         Zsguo3GgrKZeKoj3/ZpybO29gKYHhApF6EgjT3ftwURpjRtVF4RLdNfkGjeGsLbE013L
         7Wxe1/CHkSckY21xf530W++WFItUaPng6k+/efueB+8iAHYLPX0geS1jSlY3+sUmqcm5
         E+TD9rmt3fIfQb40MRVJ/S2txEtZjjNkjWhuc4HrcxhISPxLOn28Nj0Vleuz9JZmLzrw
         rwew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794391597; x=1794996397;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wDTNKmKcvG/TVcEJQQhWa3Cr1cP+VoAZc+pn91JcdUM=;
        b=MqMZx47WDwaJA4SrTZYSTZ1cF3ZiuedwSMJOOJ/sNqYLKwc95jzf5/BQ398Z6ZOnQW
         NswFsIsSYksgz0icijYkbMVkmSEhNoDJ+Y9p8e5jFmwydLITFITDG6N3JfWSWgxMGIWH
         9TVBNUn6n6mNhXN3wLNQ2wYf52MrHD21/9YXNbqVLMB0sDRJZHVQSwPcpKJGC5ETmp/e
         7Y+IaA2z+jq5ZJPU/MZh9PrAGa88qLTdcWm6FC6RKo4SNVIDuFkePm13nFuQD6xe/ONY
         Qc+kYeo0ftSdelhFEIr75D7oPDax3EdG4GJIDbuDTmOGbHiIPHLDD1oeDRHugk/TrRqh
         TR7g==
X-Forwarded-Encrypted: i=1; AL+hErHNj+WpeMR0JpDRtm4PN/NxII79O1JoPkiktVmKkS2HeNkUQ9oeqIFv3ADsLOE1Bvxo6/lvDGmBkrTfDw==@vger.kernel.org
X-Gm-Message-State: APuU4Z+VkchiFyej2uBnPAdJeUzrhfGLMt9xX6MBJ0JbltIhfk2inQ9M
	qB+r8ZS6/9u9a4Sga2rgRlPE6Aa22b7YYhP3tm6nlS0cPRppwAmZUoTW
X-Gm-Gg: AYBFou1gf8ronhEVoYGbvSFs0UXzsgR0HwfWBWyhOo4lZUAjOg4+p3Ni/JACtni/TBl
	OFo76ebdIj9hnCbHTezTpX/Ko2G0gq149aDdpXOn+1I6zcutfQ4YU3xaiPNtq/LR0e1xS3t2aw2
	qcakIK6+v5dR2sa2EqDdDnX+1DKFKPahMjrFNbtM5xYwyTneA9Mxcihs0asxGR2W+l7eAECS2iI
	xZu+WYlPR6UNArrE2fwWiLbJILn0xtUDzC0rA1cfdDgi0G/KXxLov4c/g61vzvFdJr8p5fvTr/k
	Zwy9HJ4N+NPZsIL+E51nKIz7IHLIkx0cchwOICt8mRmNQfumzVzj9HV9Nje37b1OwfpNOeElxTn
	h11XE/opNZ9Y9wqQktU2yDQyJBFhA6ivHR1WZPkdNTko7uWKJwR7SU38go7bGx2JA/IgfwEG0se
	XXBAR2onpaOF51FEOZaOD+xnoFsrzDwEGPKS0lODNPt9UdwS6FwdpFIL7rNPXWgLNAWWrKcpI2W
	TaQKhzay1JYp/FhMIFA2VEsEg+8y4e8dQrSRgcmFnKp4cAQ64tZnHhvZQ2iFDpxpf3aqgmKEomV
	SEbgTwZda5AEvGqR+fB5gYQG+pwe2KDWtQHjHHZ/mn0U/bSk50XAV87e7YqiNvjVaztBrHY3Xc3
	5km/LAD6HRLCFfgdTHpf3wkmw8OlyxGdd7+fiW7E0EQt3
X-Received: by 2002:a05:7022:107:b0:1af:2ba7:e44b with SMTP id a92af1059eb24-1b3c024be7cmr2489625c88.3.1794391596498;
        Wed, 11 Nov 2026 02:06:36 -0800 (PST)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b3b5890584sm15778025c88.3.2026.11.11.02.06.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 02:06:36 -0800 (PST)
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
Subject: [PATCH v2 0/2] ASoC: atmel-i2s: Fix clock and slot width handling
Date: Wed, 11 Nov 2026 17:06:14 +0700
Message-ID: <20261111100616.31211-1-phucduc.bui@gmail.com>
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

This series simplifies peripheral clock handling and fixes the
I2SC_WS slot width configuration in the Atmel I2S driver.

Link v1: 
https://lore.kernel.org/all/20261111042746.14714-1-phucduc.bui@gmail.com/

Changes in v2:
 - Move the devm_request_irq() call below clock initialization and
   dev->regmap setup, as suggested by Sashiko.
 - Add a patch to fix I2SC_WS slot width configuration, based on
   the SAMA5D2 Series datasheet (Inter-IC Sound Controller).
https://ww1.microchip.com/downloads/en/DeviceDoc/DS60001476B.pdf

Compile-tested only.

Best regards,
Phuc

bui duc phuc (2):
  ASoC: atmel-i2s: Use devm_clk_get_enabled() for pclk
  ASoC: atmel-i2s: Fix I2SC_WS slot width configuration

 sound/soc/atmel/atmel-i2s.c | 45 +++++++++++++------------------------
 1 file changed, 16 insertions(+), 29 deletions(-)

-- 
2.43.0

