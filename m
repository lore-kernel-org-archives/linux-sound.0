Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.227.133
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793981318;
	b=pITuVnAS7CWwhs75C5XQVQXQrDZqsZk2IFjL4kD8Ld09iBl8EL8DTCuP97uZVxmvEsE+
	 D55+AQIpEMkiDAbSNq8ZEZZA75zfeptL0WZ8VvFpnYEXp7BLwapOayHy3QqpWnzZNMLlJ
	 5nd6eWnyoSSjubqE0Z7oRuBoWwXNUI1hSHgEbFv+jQ06RIIOwOPdksARTmDzWsMuwzqy3
	 OO/1Yuf+kyEQl7Ppc5Y6FELa0YeZc23cbV72580ypQi2maAX6aEzPr99bxKPoYm43/iN9
	 KnRuKgP3S9Dm/reAgIQooNDTamttLdiVNJdsNUAdWecNmMwCjyuJawDQGd14IsJCSAg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793981318;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=dWh0XMf9k6yFz83SsziFJO048g4LltGyZPKzw7SLuWE=;
	b=xM5J4IgBfKkDZ/uYXseFpowyruCRzanwdHT1HC9s1Rdr5YFEfOgdHG7u0AYvn7UUBqXE
	 Wld65Knt/dfICl9WMqyTKjA3KhF3T7NWWcqSh7GapL/T3QSLW8RiZ1dTNDn7MxRlY5qWp
	 t+Gs4qViMD2EI7tO+kL0m4OYukrXIosYlqQyeKo29E/Y7QThFSwlwiYL/+C78NRyiP4hW
	 w6cvkHYrac5MqDXSd/W5RTFG5pbQxeIA04d0EQCT0hUzy8ynvuDXL5eepcDsnJ1JD6QZu
	 X7KYRcGcY1oJobcTXBf4CrdQSemgWuvE8RZl9gjpJzGd5dJz4DuYpSjHiVx0ACxnl3w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="P0B95/WK";
	arc=none smtp.remote-ip=74.125.227.133
Received: from mail-pj2-f5.google.com (mail-pj2-f5.google.com [74.125.227.133])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 511B2606A326
	for <linux-sound@vger.kernel.org>; Fri,  6 Nov 2026 16:08:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 511B2606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=P0B95/WK
Received: by mail-pj2-f5.google.com with SMTP id 98e67ed59e1d1-3ae81127346so59008a91.0
        for <linux-sound@vger.kernel.org>; Fri, 06 Nov 2026 08:08:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793981317; x=1794586117; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=dWh0XMf9k6yFz83SsziFJO048g4LltGyZPKzw7SLuWE=;
        b=P0B95/WK6KgUc8zcdraPUeyt3lHazWhe+gmIYj0zkMorlQgpHIVi7z5a1gJ+rK/DjN
         hiAXzwqzOpzsAEsPRKu24G63DhEgvvcBN/Aigxl+bvlwFw7hWobGqGGGeLRQ46LMAXQt
         DT1KGv0YYS9Dpua4bLTTqT60b1FYOMqc7eFsoB0EmAk2zqo9OaLm6qauY1MXWfq0J4ul
         +B1TEl8FxUbM6Qh4zig3HbQNZoCUqRa2v+QzKPCGbpv2CjpC5QhCxUTL//SllgzeMJvu
         szQyH/65HwyYwe/Rs52JdXPP7rLzkjAAiyu+BGznDyBUCBnjioqApw8xYZXgHqNdF9vu
         FHRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793981317; x=1794586117;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=dWh0XMf9k6yFz83SsziFJO048g4LltGyZPKzw7SLuWE=;
        b=yy6DElH2ALzOVZHGWcJkCvnqq2Nfvd2Sr6Cf74huPZlx0pb/nx8o84YS/DEHFrrlAA
         PXuWh23JbOLcIbFwng0PK9wQVXpTLJCq75mR55eN4LQklwML94n3geRhKYF4jdqaJsc4
         zQgxgaYSVGLE35wphXbhawJgST2aXpSSTVcPrQyfb1dfjCFap0ZKiOc+EAHFjNt8/um+
         uKrxuA38NgwHHmn6A12S2rZXqxnj3CHirwpmn8J/YLd8G9nTD97JxiT2Pt/bWXQFvgmJ
         RJ45OtjENjktXnLwTq6yJ+FXFMGU2odGeMWeQZz4fU0JkbIgzsOu5KuEdKk9IFdN/o/1
         ZLqA==
X-Gm-Message-State: APuU4Z8STq7L5hcrSS4v+V0F1Cqc9v2OTElHKbRwhEfTRMWHdoHMJgZV
	AgJpfKTEBiFNOQz6qsEEITJesq11oTBuyRGesGuBhmxlqqGOZeAaU8k0
X-Gm-Gg: AYBFou3fw1bvNxOS+TOSR03/2nnnrdPEMuHwSeeG90jNEt3KvOAMG1tfZ1ZONXwBMR5
	rQ4i8EHWwZ5xPjKoXD5m23zUaa7D/jT0SBCC7QNX2vhPlq8Mw7C9ytGiFP+7Bv/xf+MFYCZcvVQ
	PoaeBykPkPD2WZCHdpkh5rRt+HwSfsN2mWHLqqWbs4Bv6oEAFOFhG8c2pM1smecGxQEVPFyE4wL
	v1XpDpeSv5ZltrT1x/t8v4ZOdqi2om26W3jX1mlSlUlPiFf6RMHYmp+v23RxlPJ/gIBDcrwLeox
	CMRNRS7elM/oWRh2m5gkxi2Lh9u1GLi8CHxoemx1e4FRJt+8hAdeheInWol7GAtGpPCjfci8N2F
	iZ6l0ilKiV8YU9P6UN+8bn4bCjqLSRARroOWTRLit4VghrqUUFYqz6Essizl8TYcTEUslINae3A
	+Z9pXNginfRcl7lZuyaGqb8AxamJOIkkoA7aCisqDQcz33gRo6P+L2O2jjorjVDe9mx0rj7JtT9
	JvkXs7gLPB9HCYxUgKunSjVXQrSEgvGLz7L1ari+JfkEIslO2IggxMmzp+2qjf3C6N9zxOwMhfN
	rIwv4JZ2a9TVniC+gGaVmcyTV0bfpJ5vodazP0nX
X-Received: by 2002:a17:90b:534d:b0:3a7:a3c8:8f4a with SMTP id 98e67ed59e1d1-3b0db6d1d1emr1764776a91.18.1793981317447;
        Fri, 06 Nov 2026 08:08:37 -0800 (PST)
Received: from [10.255.241.47] ([223.104.86.34])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b0d7c8a3d9sm5214571a91.10.2026.11.06.08.08.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 08:08:36 -0800 (PST)
From: Zachary Huang <zuzhenhuang365@gmail.com>
To: Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Cc: linux-sound@vger.kernel.org, Mario Limonciello <mario.limonciello@amd.com>, Vijendar Mukunda <Vijendar.Mukunda@amd.com>, zhangyi@everest-semi.com, Charles Keepax <ckeepax@opensource.cirrus.com>
Subject: [PATCH v2] ASoC: es9356: fix the capture gain dB scale
Date: Sat, 07 Nov 2026 00:08:17 +0800
Message-ID: <179398129782.44051.2897523393297405157@gmail.com>
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Post: <mailto:linux-sound@vger.kernel.org>
List-Help: <mailto:linux-sound+help@vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-sound+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The two capture gain controls are declared with a TLV step of 3 (FU33,
analog mic) and 6 (FU11, DMIC).  The TLV step is expressed in 0.01 dB
units, so this advertises 0.03 dB and 0.06 dB per step: with a value
range of 0..10 and 0..3 the whole controls appear to span only 0.30 dB
and 0.18 dB.

The hardware steps are 3 dB and 6 dB, i.e. 0..30 dB and 0..18 dB.
Measured on a MECHREVO WUJIE 14SAH (ES9356 on SoundWire link 0) by
recording the same signal at all four FU11 settings:

    FU11=0   rms  523  (-35.9 dBFS)
    FU11=1   rms 1007  (-30.3 dBFS)
    FU11=2   rms 2011  (-24.2 dBFS)
    FU11=3   rms 3794  (-18.7 dBFS)

That is about +6 dB per step, matching the hardware definition rather
than the advertised 0.06 dB.

Because userspace (alsamixer, PipeWire/WirePlumber) derives the volume
from this TLV, the capture gain currently looks like a control without
any usable range, which is also why the default setting seems impossible
to raise from the desktop.

Fixes: 5d9cb740cd38 ("ASoC: es9356-sdca: Add ES9356 SDCA driver")
Assisted-by: LLM
Signed-off-by: Zachary Huang <zuzhenhuang365@gmail.com>
---

v2: add the Fixes: tag pointing at the commit that introduced the wrong
    TLV step units (suggested by the Sashiko review).  No code change.
 sound/soc/codecs/es9356.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/soc/codecs/es9356.c b/sound/soc/codecs/es9356.c
index c54bf05..ce48b1e 100644
--- a/sound/soc/codecs/es9356.c
+++ b/sound/soc/codecs/es9356.c
@@ -74,8 +74,8 @@ static int es9356_sdw_component_probe(struct snd_soc_component *component)
 }
 
 static const DECLARE_TLV_DB_SCALE(out_vol_tlv, -9600, 12, 0);
-static const DECLARE_TLV_DB_SCALE(amic_gain_tlv, 0, 3, 0);
-static const DECLARE_TLV_DB_SCALE(dmic_gain_tlv, 0, 6, 0);
+static const DECLARE_TLV_DB_SCALE(amic_gain_tlv, 0, 300, 0);
+static const DECLARE_TLV_DB_SCALE(dmic_gain_tlv, 0, 600, 0);
 
 static const struct snd_kcontrol_new es9356_sdca_controls[] = {
 	SDCA_SINGLE_Q78_TLV("FU41 Left Playback Volume",
-- 
2.53.0



