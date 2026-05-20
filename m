Received: from mail-dy1-f181.google.com (mail-dy1-f181.google.com [74.125.82.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF36E3E1CF8
	for <linux-sound@vger.kernel.org>; Wed, 20 May 2026 12:48:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779281305; cv=none; b=RvFv8KvzNswI4co3S7Zu00RY9qzc1lJy/h23Dw8B+t7zAm9bgV9TINLzGlnT3u46hRJPFnEtLThHTXkUsopok7ZWVw7O7OjbSp+VPSxh02PvPyb7B48u0amxGqJlVIowS5qj1/T6poDjYjxwYdKSEpThm8WE2aa1y9I8en9o7No=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779281305; c=relaxed/simple;
	bh=3gHsCzYbLDcxVrXk4h8bH/q8GSKvp/BnBAcEsrn5pRE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Vjxj18bWXAj51FiU+iDrXMx2US7+NQR0fk+Oe0oWeSh2EMmvTOkitP5/w+0d02jgQftVwgESJGK7kkbO/Vz9nRaF1kHgDrB+jaGBLlx9hHxJtoYFIHFbYPTwT2JKdaHkTGS5at6WM9CxWvxKyuGbuDyb4r8GmqT97JzG2V8FqOk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ryfSzWcu; arc=none smtp.client-ip=74.125.82.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ryfSzWcu"
Received: by mail-dy1-f181.google.com with SMTP id 5a478bee46e88-303dbfbec77so4765958eec.0
        for <linux-sound@vger.kernel.org>; Wed, 20 May 2026 05:48:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779281302; x=1779886102; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=r2SIImlwAi8rmeAJzWSI7l3QGyNAkdGsuYsQTlZWh/c=;
        b=ryfSzWcuyA+aNFqCr0Lrl34ylilg1+ndFsR9iTG/AAcX/W/tyeUJxl3y0Wsbgh4kKd
         amVvm0Wcai3tXC5eKMj/uUmhActY7nytphdwnw6v6abCivof+Nj19aZtl7zKspudsy2t
         //0lrXE7LWPlhTGr+JsKiaRjJ/PirVS/d9Rc4L9bneoZUwDNLmQWOAcu5pafEufILt1z
         toadKmGdANI3P5lrbT2qVlzVwfIJ/W5suL0RySqmUM3ZQb0aAFYfzGq4n6PtMB58O+eE
         idRpbIl7v+34fu7sBjxYyQR86BZajm7gvQlMpb84bReo9KWOPLYluljZhwjHOCkiQGmV
         fq7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779281302; x=1779886102;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=r2SIImlwAi8rmeAJzWSI7l3QGyNAkdGsuYsQTlZWh/c=;
        b=scqzrROsB2aEmrjX9f1h8hMMJ70NEl7gWHectEMC6h3BCzeYr7TM+Xeusne/jZ5h01
         5+JUbhqsTayCt/tADAUJh+LsVWzq3hhNafegctBV/zqq85m46FuqY4WVY9WO4OfvIhqJ
         RmlUGZhAZmg4K1Dk+09aC+nCCOmjp5geks06QqLaqJprOtf5Ah7lSS2KoHl2c4puC37b
         +Lr5Z1BYRxGktZp3y0uOiAnoTBYG9CTeO+fW8aeTwz+1hfIW2gVu6UcoxH++EqsENqR1
         p5xRKAsxkkSYK1mdXX7GlG0JuP1VvvnNrOqEDlPlaSl2RLzSsovYpCK3nxHnUaKw6NNL
         2UsQ==
X-Gm-Message-State: AOJu0YzZmaPXJyC1ii4/s9q0ROekWC7HntZx45UKWrnwjGMLuvNL3dum
	PoKhZUVguVo6RVZMZ4mWFk6b7O4iVTGrSMJGPzsX99txKW4qcWu9lwCC
X-Gm-Gg: Acq92OFgBbs/6e5h5ZYBDy4feDSoNlufneGiW+e9+StreEb8FmvUwHF9qHBLkp+zz4F
	TjHRcVyx22+ue7wdYzgFXNtTdNySTTBdMt/ztTLN9jsZ1XpiVQUDVCmNoQznStU4sgbbPKw8O1j
	CpEO/DBadN/M79kZ0OueK1um0wfueJt+RwDPOHy+sD77Gxr0ncdvcZMsGXrgwv7ILPwt5eJNThQ
	ig+w+My8VEVL8unUXY4xTb0O5UEEUjKo/HdzCdBET54rJYFLnbDnkyvGexYqtwxMhDDHKaIuotH
	7siDS7cvaqNJUvj0+UvhWwmTCYowvSoKUOcmqsfEepTnUTvgTBdpjiQoxNXwutzh4hYB21tKbku
	I/SCi0eq1Hi3oXWr7Sv+ZMBTQ7VOroRpc8n/9iyXIv091byyV5Y5miIMfeRLiN1ScilO24tSQvv
	ayLqIRC1gCTyJvGsgekBVZby9Yvy60l6G30f91ugARnonk4jkP5tBX0g6w2Pbgo4YNS0Ehu3owy
	Q==
X-Received: by 2002:a05:7300:641b:b0:2ef:83d4:647f with SMTP id 5a478bee46e88-3039865213amr10495042eec.25.1779281301890;
        Wed, 20 May 2026 05:48:21 -0700 (PDT)
Received: from [192.168.1.18] (177-4-162-74.user3p.v-tal.net.br. [177.4.162.74])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-302944ffb85sm19114045eec.7.2026.05.20.05.48.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 May 2026 05:48:21 -0700 (PDT)
From: =?utf-8?q?C=C3=A1ssio_Gabriel?= <cassiogabrielcontato@gmail.com>
Date: Wed, 20 May 2026 09:48:01 -0300
Subject: [PATCH 2/2] ALSA: hda: cs35l56: Free system name on probe errors
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260520-alsa-cs35l56-system-name-leak-v1-2-d13b54423198@gmail.com>
References: <20260520-alsa-cs35l56-system-name-leak-v1-0-d13b54423198@gmail.com>
In-Reply-To: <20260520-alsa-cs35l56-system-name-leak-v1-0-d13b54423198@gmail.com>
To: David Rhodes <david.rhodes@cirrus.com>, 
 Richard Fitzgerald <rf@opensource.cirrus.com>, 
 Takashi Iwai <tiwai@suse.com>, Jaroslav Kysela <perex@perex.cz>, 
 Simon Trimmer <simont@opensource.cirrus.com>, 
 Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org, patches@opensource.cirrus.com, 
 linux-kernel@vger.kernel.org, 
 =?utf-8?q?C=C3=A1ssio_Gabriel?= <cassiogabrielcontato@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1100;
 i=cassiogabrielcontato@gmail.com; h=from:subject:message-id;
 bh=3gHsCzYbLDcxVrXk4h8bH/q8GSKvp/BnBAcEsrn5pRE=;
 b=owGbwMvMwCV2IdZeKur/u2bG02pJDFm8a7s3d+axv0/IzZG4MGk5j62o7Qfd13OcqpwfXP4pl
 /S69bV5RykLgxgXg6yYIsvqpEWWe7oeXK2PW+EBM4eVCWQIAxenAExkWw/Df2fZmy5L5df0tofr
 91+cK6xi/Tzs3cqpcwU272cNeHRJ+Q0jw5QlSwWT3Zin8bBMjhbUMebPOnh7wnu/8415oUtcD2m
 WsAIA
X-Developer-Key: i=cassiogabrielcontato@gmail.com; a=openpgp;
 fpr=AB62A239BC8AE0D57F5EA848D05D3F1A5AFFEE83

cs35l56_hda_read_acpi() stores an allocated firmware system name in
cs35l56->system_name. The normal remove path frees it, but remove is
not called if cs35l56_hda_common_probe() fails after read_acpi() has
succeeded.

Free cs35l56->system_name from the common probe error path and clear
the pointer.

Fixes: 73cfbfa9caea ("ALSA: hda/cs35l56: Add driver for Cirrus Logic CS35L56 amplifier")
Signed-off-by: Cássio Gabriel <cassiogabrielcontato@gmail.com>
---
 sound/hda/codecs/side-codecs/cs35l56_hda.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/sound/hda/codecs/side-codecs/cs35l56_hda.c b/sound/hda/codecs/side-codecs/cs35l56_hda.c
index 7b5fc63eeaa8..950241701eae 100644
--- a/sound/hda/codecs/side-codecs/cs35l56_hda.c
+++ b/sound/hda/codecs/side-codecs/cs35l56_hda.c
@@ -1250,6 +1250,8 @@ int cs35l56_hda_common_probe(struct cs35l56_hda *cs35l56, int hid, int id)
 	cs_dsp_remove(&cs35l56->cs_dsp);
 err:
 	gpiod_set_value_cansleep(cs35l56->base.reset_gpio, 0);
+	kfree(cs35l56->system_name);
+	cs35l56->system_name = NULL;
 
 	return ret;
 }

-- 
2.54.0

