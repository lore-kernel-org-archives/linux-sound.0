Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.171
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795147205;
	b=U4ul/BtwX2GPJyiyIpajTfN1J7rCI7fFSQhg5hM0GivGnPpR5j2lsdyJxdJec66YkzPi
	 qRXHtZfQHSC4l8YjV+Bt9etNDYE+9iJBU2JHAXAKeeGqsjc8rCwwAIaaBlJMc9jZxG9Gq
	 mlw8nuSxkNRGmdrotKGsLhEjLpBDIgEmBb6pEzyLV+AZU23MB9ufE3APNe9IeLYDS/MYE
	 oh2bixdi2dIw0pYyETL47HnsP1TqX1Yv2tSLkSnQoLrCAopozlZRfKCx1zrq5Cfzsu43i
	 Zax3BOrCSvazQmIuYqXqRpzr/iK+sgPxIkmN5/WkMVdqKRc+zaz9nssgdiwYP4CLlzQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795147205;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=3o8lIoxd/J68fTCxNjKUOwU7KIWlfdsl4McX0KjPG74=;
	b=OMEFO2MJziB9G7WwlJFVTi4mGt9Ejg+oujSiqWyzxIcsh5yAcxSUD1xOFaHM5nyl6OpD
	 RJgCIARpkD+AFanBHazdkBEremTtdyBMpIjscqWJcXhoimdigYqBrM6rOwN40aZrjTyoF
	 E7L2wm6whDe/W1kHWQP+Vam+P/AX8QLbRSP2fHDiJeFRCLVtuub2h/G9cObrQ1M2I7lZt
	 d9ClFt5ZR2V5TBZpwNfMrlYWcEMpojk3BZrIT0AaG7N9J2UNyyXMbiL5Ks0x2Bcb8wDak
	 m9nhGVCuekasM/sCt71i1qTvyszHhRd1wbsNi1ZmacglpkZeaw7jA0smB5hm9nM8bvQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=MIk7AYxl;
	arc=none smtp.remote-ip=209.85.214.171
Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0B35606A335
	for <linux-sound@vger.kernel.org>; Fri, 20 Nov 2026 04:00:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F0B35606A335
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=MIk7AYxl
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-2f037bc348dso3808825ad.0
        for <linux-sound@vger.kernel.org>; Thu, 19 Nov 2026 20:00:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795147204; x=1795752004; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3o8lIoxd/J68fTCxNjKUOwU7KIWlfdsl4McX0KjPG74=;
        b=MIk7AYxlubAGO5iF6xq1gJSK8bb6mnscfLO44jNUU+Pphz1Xnz/cCtER7nlvxICf/J
         4sCMYbD7Qh5UgNzCoryZYhxnpCzBmo/w+HNg+LAGmsdfFTPj+Jyn0DjVQnx9RYEvorOa
         vUEdGPUURLAcQqngaNteUwcy4L/i2i7IdLaW64hcPhIVG0rR1Dy4M3Nbl6ZnLUSyeDBw
         /mcdjp/4ow8cJr0aHRyuQ9qY+kpCFQOC88V0n180NhH/+gEEd/wkpikG3G3UmoCMOZ6m
         apAcSttUCPPmTH+64TmEh/THTTPya2LtUs/8xDxIEVF1j0DEeCl3ictl37Vq1+dInU6m
         8bvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795147204; x=1795752004;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=3o8lIoxd/J68fTCxNjKUOwU7KIWlfdsl4McX0KjPG74=;
        b=s6VS7YF9gnR7dsRfrdvPvEJ0UsE8OdvWkXkYsJgIlkCo/0k4YKCfvLxehVcVO6lb7D
         hAXnDl+aFjCFHCxQr/gbHn4TJEtJ0Ft4zucKHXBD8TdBcWrF6e8m4si+XH1+SoXlmI+w
         B1Y9Nr/2efPjqQm57MKbHxcF/JIuKvBKS8mHAkFsyKmDdLIkp8tqqxean8fCDWkh4R0U
         vL8IkzYKnvLfhGBMOHOrKY0ZneVscNtf0kmqblITH0dXA32gjRjkZb8ETARp8QKGikJ1
         I3HYdPjySW0lw3y6KHuPD1BnBkdpA44dz7Od2OCeeP9qj+kYvq5cS3DbtG1slnfRZTg4
         OVqg==
X-Forwarded-Encrypted: i=1; AL+hErGnzgFy3gE7t9XDlUxXxsTVb8CpetC1olD3Fkkbos9uMP0t4UZY37KkuEbFioqVQHkSRtYYGrmlXOap7w==@vger.kernel.org
X-Gm-Message-State: APuU4Z9t7lstRbqj0cUCvr2YQr3LiRQLqSEKtMJG64e3SqsWTnqngXJ3
	ouLEFBFqRg4bOgVtdqea5y/7jnmoy0rhXV5S02YLex06oo1msGQlPu9M
X-Gm-Gg: AZFdTZcs1cpM06hdSVuPWSnX+ZQPjTYLt1E4q0AIthkwZlzBWj3ue+VJhqzhJAnqpuG
	q7VCye5CUIz5DV2b0ALfiowaFaiwVMs06UlzPjoQb7w01Uh5/gzRj1HluU9SfhzIlvDrF6pI8ex
	JFAQuwclX0QkNMU6nHQJ0LhcKligeM6dV5Ojy1ymuf/grnniDykb5nwLa1wF+/mjuari/PvFxDt
	i9+HMXK2NU/XzvAVvDdZxjRP5BSvyAFzT9X+u6sxLPuTNomgqpkyTwgvEZUXp40EuvbIznit1SS
	wGLIc28VTMq1KOsB1TQ5uXUXyNJYfw0OOAbnRr4tWCf8XJkI+VoElDZUmasPPels5vZ8S1NUIQc
	wTCozsDFNfnvxNq7ewKowYvme1X6iH78khMK/C7KtP6CZ+acc94HMuSeg6LHpXd3TeC6pEYpPne
	oRpZdpHv6RliTxHeQ7bSrROyV6KtQu7zr0j9qjWOGN5SEnEDfOBTcholbGdkgmMtC8jetykYVek
	6jMQzhlGB8ynzEuq1efY9D2fzOGDsK+xQTF7vfwtYikoLsZO9utdfu/HJblvNsTw80SloODhycE
	Ve/g6abDp2D9Szz9BAZVYQ5LHrwwAERJ7HW+yMQEGKTZvZ56FwEAXye7lBjPXbIKekRdJasN15o
	B0s1QlBwPdDXWUGeCsR6iM3HTvpymJngmQvvPfnd24gcJ
X-Received: by 2002:a17:903:22c8:b0:2ef:dc24:c71f with SMTP id d9443c01a7336-2f03f2980f4mr21004545ad.56.1795147204267;
        Thu, 19 Nov 2026 20:00:04 -0800 (PST)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2f03f1215e2sm7801115ad.63.2026.11.19.20.00.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 20:00:03 -0800 (PST)
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
Subject: [RFC PATCH 2/2] ASoC: atmel: mchp-spdifrx: Preserve MR defaults in hw_params
Date: Fri, 20 Nov 2026 10:59:39 +0700
Message-ID: <20261120035939.12774-3-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261120035939.12774-1-phucduc.bui@gmail.com>
References: <20261120035939.12774-1-phucduc.bui@gmail.com>
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

hw_params() overwrites the entire MR register, clearing the
VBMODE and SBMODE bits configured in dai_probe().

Use regmap_update_bits() to update only the ENDIAN and DATAWIDTH
fields, preserving the other MR bits.

Fixes: fa09fa60385a ("ASoC: mchp-spdifrx: fix controls which rely on rsr register")
Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---

Note: 
Hardware testing on SAMA7G5 is needed to verify this change.
If the current full-register write is intentional, the issue
may instead be in the default MR configuration in dai_probe().

 sound/soc/atmel/mchp-spdifrx.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/sound/soc/atmel/mchp-spdifrx.c b/sound/soc/atmel/mchp-spdifrx.c
index 06a2a5a90a63..e37470165717 100644
--- a/sound/soc/atmel/mchp-spdifrx.c
+++ b/sound/soc/atmel/mchp-spdifrx.c
@@ -502,7 +502,9 @@ static int mchp_spdifrx_hw_params(struct snd_pcm_substream *substream,
 	dev_dbg(dev->dev, "GCLK range min set to %d\n",
 		params_rate(params) * SPDIFRX_GCLK_RATIO_MIN + 1);
 
-	ret = regmap_write(dev->regmap, SPDIFRX_MR, mr);
+	ret = regmap_update_bits(dev->regmap, SPDIFRX_MR,
+				 SPDIFRX_MR_ENDIAN_MASK | SPDIFRX_MR_DATAWIDTH_MASK,
+				 mr);
 
 unlock:
 	mutex_unlock(&dev->mlock);
-- 
2.43.0

