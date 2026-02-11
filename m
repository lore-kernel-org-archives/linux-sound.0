Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D8B7227EB9
	for <linux-sound@vger.kernel.org>; Wed, 11 Feb 2026 10:27:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770805670; cv=none; b=uCmL81EWl9dt8jKJUL4vd/hyz5RaiG/1L8NShk0iwo2KxlrB8OhqD7Am25Ttu2WX+NsncSYIe2VbPA1rwq+xFM627K5vLV+a0lI42a25puAP50I7LGA/ZFdC3VdLN2Q5f9g/8M0fXIy5zqW/2OzX3mii7xKAA7l9FAWLxZD7zv0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770805670; c=relaxed/simple;
	bh=lrAhY6+QpfzhR3CUKyt42tW2guO/yHYDHCPWvOuysKA=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=ug+G1bcyIMmP/TkHgReALli62i5MDCCFLgqlbHAFN/BT0KhYNvOwTmM4oaM21CoUNeR49zvlSWghkaymtdw3wc7XMKxmfhtI8PdXEji6iKf9spAzjV8ClHF3aqK5BcOoq/IKB5J9AmzNU4DLzSZuYMg2hFXOrSiT7YjlgD8BanQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=lPsbcQDc; arc=none smtp.client-ip=209.85.208.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="lPsbcQDc"
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-65a25c3a86eso1888634a12.2
        for <linux-sound@vger.kernel.org>; Wed, 11 Feb 2026 02:27:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1770805667; x=1771410467; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=cFvWbdBwgEcUXjI4yzNcU+BV58r6gnRAccKEixMkUnA=;
        b=lPsbcQDcxLpMLtIOHckzfG+LFwrmehFFFmt8BWQsBqx2gV8XNm4b/7AklOEPMfwhAR
         Zkov3bKyIC4OgVQBLq259A9jJDaaHf1aRDhMFrQ2oKapRvREFlice7OOlFZbbBjtpWkQ
         dSHw+pr7LHVlnPwoxLtwo5RIRHV/NHqQL+b4C8k35wpZcg112o3BmzrHxNcn/QWDWtVW
         EcK5qDbh5dLk0kji3jjSWUTr+NDHdJu0CArbt4ckmtVGr4nAXYWcSjaVMcpv2GDgTFc5
         CxCir7JOJcE6hVu1K8wCwmGCxODrTM7sAemFrwC/RsVBpQKD9gKXNE6Zj044ZwqMdPmV
         OTcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770805667; x=1771410467;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cFvWbdBwgEcUXjI4yzNcU+BV58r6gnRAccKEixMkUnA=;
        b=n2H0KdqlMc/gcY8B8DXlst7fIb4CMxEMR2HOEq8N46VoWA/ya5dFMfmpaiwc0MWFrR
         CwqJjJxjA62T8t/DLKICjiRpj2iGO1BvVJ2IASC5nlVSOKB2SNzliOzrN3zNjryqr7sS
         CGcmNUzlA8V7+qFS7f+51d3behS5E+HNyuuFOyjsnJpIogzoP9kYdzbr8vvvWWtzEnm6
         vDdMwGCWeCaYYEu8TMUrh+NXOIeN8HE8nikvmkVthy1xWIvbqve/qVkQyC7vLaa95JTw
         VVM2FrAIJJF0/LDGTMnJNo60M8/nHMGOI/PhD6BGQDagpuiBmw1LXrZrVwkYobZTFm+P
         BQ7g==
X-Forwarded-Encrypted: i=1; AJvYcCXfsV6QCTH/xu2b4j6/GGWCTCZj9VGmNYQ7HcIjxgG7TPykz8ogoy75j4QkA9xsDdPI2EIKOfOqERIVKA==@vger.kernel.org
X-Gm-Message-State: AOJu0YyaqLcy0SyzC50teMFRN4j3HdPL/K6y0wF8AsY8WIysUhcSJ5En
	wRVv4+BowSwFAS/XPUyiWaWyCUjKQIEfMQKTwJXcQA9XMO6uNDN8RnGDR/p2hhS3EAU=
X-Gm-Gg: AZuq6aLYEqrGy5FNPH88Y17quisEj0bnObO/ftDuUP+fhO6MfhBzXvsF+3k/FiSV4Nl
	LkIXL3RmAVMkr8EDDOoOyGpcnBr137AXknHqIcDs4h5ENA7B02o7LuKcsOGlVVe900r8QMaZ6zZ
	crwEpv2Bh2tuvYcVr2SnhlHCPtE5Wvwi9pWh48KsHC4iym1jAWVt/ffUpxpArELUvvKyrCQ8+f8
	UMWQ1PJc1YMfwrtXyetpYC7x7Ez6BRGjCi3mSlsVUwuj0xq/BHnFiW605uBWlbNLsdfZE6SPITt
	nBChNgqCf6gSSQsjkgcFeHCgjrjzVLmM0Ih1FquPL5gXxqmFeeD4iRtn67vurASF6nBPHwEXGE8
	lmOa9w0fflCRWq7si5tCu3iA2mRRKv74LDp1od7GU2tUN3uXwHuLLZsSsn3vVlggIOBDVks7ETd
	cfU3THIh4HMm2cRfCx2DXcHyld9yvBV8Tgw4XXPWO6ba6cNf/rxSEvqtSnJhkIujgJSwOWwZNCb
	Ny+
X-Received: by 2002:a17:907:9289:b0:b73:210a:44e with SMTP id a640c23a62f3a-b8f717080ddmr71193766b.30.1770805667335;
        Wed, 11 Feb 2026 02:27:47 -0800 (PST)
Received: from [172.16.240.99] (144-178-202-138.static.ef-service.nl. [144.178.202.138])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8f6ec54925sm44296266b.53.2026.02.11.02.27.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Feb 2026 02:27:47 -0800 (PST)
From: Luca Weiss <luca.weiss@fairphone.com>
Subject: [PATCH 0/3] Bitmask logic fix and firmware-name support for
 AW88261 amplifier driver
Date: Wed, 11 Feb 2026 11:27:31 +0100
Message-Id: <20260211-aw88261-fwname-v1-0-e24e833a019d@fairphone.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/x3MQQqAIBBA0avErBOcIcy6SrQQHWsWWShUEN09a
 fkW/z9QOAsXGJsHMp9SZE8V2DbgV5cWVhKqgTQZTYjKXdaSQRWv5DZWdvCEwfih6w3U6Mgc5f6
 H0/y+H00BSDpgAAAA
X-Change-ID: 20260211-aw88261-fwname-89c21d6c9476
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 Weidong Wang <wangweidong.a@awinic.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Alexandre Ferrieux <alexandre.ferrieux@orange.com>, 
 Bhushan Shah <bhushan.shah@machinesoul.in>, 
 Bharadwaj Raju <bharadwaj.raju@machinesoul.in>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, Luca Weiss <luca.weiss@fairphone.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1770805666; l=862;
 i=luca.weiss@fairphone.com; s=20250611; h=from:subject:message-id;
 bh=lrAhY6+QpfzhR3CUKyt42tW2guO/yHYDHCPWvOuysKA=;
 b=QZwG9Mo9pYOwFUON1wrF/HQ3xQNMAkT59lgRa+SNZsrXpKDqJbYbyB73rVA+fz8cdpPvU1Mnv
 K95/u6alG3BAx9fakuVcXvkqbrUU0WmB1bKzHtYfoye7OuBD++7u8of
X-Developer-Key: i=luca.weiss@fairphone.com; a=ed25519;
 pk=O1aw+AAust5lEmgrNJ1Bs7PTY0fEsJm+mdkjExA69q8=

First a patch which fixes a logic error in the aw88261 driver. And then
we add "firmware-name" support for that driver to support loading
the device-specific firmware properly.

Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
Alexandre Ferrieux (1):
      ASoC: codecs: aw88261: Fix erroneous bitmask logic in Awinic init

Luca Weiss (2):
      ASoC: dt-bindings: awinic,aw88395: Document firmware-name property
      ASoC: codecs: aw88261: Add firmware-name support

 .../devicetree/bindings/sound/awinic,aw88395.yaml        |  4 ++++
 sound/soc/codecs/aw88261.c                               | 16 +++++++++++-----
 2 files changed, 15 insertions(+), 5 deletions(-)
---
base-commit: 6ca87498ba32522a6c10914add7beb2d9a2eb558
change-id: 20260211-aw88261-fwname-89c21d6c9476

Best regards,
-- 
Luca Weiss <luca.weiss@fairphone.com>

