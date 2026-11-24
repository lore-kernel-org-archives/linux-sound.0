Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795512915;
	b=byxmvCc19SY1fmtLxNM3Lukdl0cv9AhjXkSnYeHqpLYPP9nantN9E7sLyWj8UqhqtqBR
	 Lr0UkfERLpuWrLY14XXwjqkJT9IKQRKcO4SZ0bS9xMlAqMxO1QD30KqpsohisRVYHDqrc
	 7eI1dTXBNca3bKjb5mU4A08Fb+Bvre1RP7N9jFMhMoXHDgOAfaYI/GO9VVXagyhDHe9eQ
	 1t+E8WTQ5pw9kDZ6dlGR0JFmc6dUrN7pC/3nFVacSuJ4pIGOTSEUHGsnU68uiaImeiAx+
	 80V1IamHKN9czi4mDCYrVZnpEugYg/Ij/IjOhGFaaR5GX/HwsjLKtGdXCgeAtO5/efA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795512915;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=MFYErt+f8apL0/dZiUcjmXkXTRzMF14cryJY/TdSjQ4=;
	b=byUHZaWKduhKSagdCY49rJ+r0dMzhIx9rIZqEQkINnQdElp39cqSjxGC491aaW1crah3
	 T2+5pxyCAWsfkBif6a9GWPlJVFSbc3hnbPRRsZm+TVKHyBlRfq/KAsEYHGwBU9Wo6O0IP
	 vnNfhh8WHhAIKt4lcBnsUjNKIBfly92Qtiw1MyaN52ULIlp4G3GTo1pvm/fMV1ZdgXuMl
	 +J/0XkLQl69W9soK6pbvV9j0DyIKED6DJ3sAiD1Byw40SxtcPLUC5TTWFDtvQZmXaUOe1
	 R2qvHp8h4oEpJ/+N4vUUXZv/Ns8E6hUpvdHJ8lNdC0HT/K5YC3svlaM9ZkzxSpADBEQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=lBzHtFdA;
	arc=none smtp.remote-ip=209.85.216.45
Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8B5E606A31E
	for <linux-sound@vger.kernel.org>; Tue, 24 Nov 2026 09:35:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D8B5E606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=lBzHtFdA
Received: by mail-pj1-f45.google.com with SMTP id 98e67ed59e1d1-3b413997581so3518232a91.2
        for <linux-sound@vger.kernel.org>; Tue, 24 Nov 2026 01:35:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795512914; x=1796117714; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=MFYErt+f8apL0/dZiUcjmXkXTRzMF14cryJY/TdSjQ4=;
        b=lBzHtFdA0E9vVkQchzq1iuLl/lzdOokJM9eR1VhE0vzeSAOeYj3efb/0dG0IYUbQYC
         Dm4UtwJaX8kijsWjmQyIM99etgWoIoeeXvJV4nnGTkq3o2HcUOd98VfM9D49fWBUsuM7
         Dq/NrtlFCDwVbhEnYQTMsNlcWy9bWnEgLFDqzXym7A+UCSeyTd81e6VI1wLSsppLjgV4
         NuqfRU8isZLlsMlaG8us9UV9iObEbLgRoPYN5IGYDntFRu3IDSNyfKNVKLrlHyJKlv8F
         iEboTd81GF/OzxuS4PkqBwfa9OUBmuJuEooNYkSED3Dr/Mwoi6BhCsZca/1PwQWxDosy
         wSMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795512914; x=1796117714;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=MFYErt+f8apL0/dZiUcjmXkXTRzMF14cryJY/TdSjQ4=;
        b=eGYUnoqqrjnQUR9UsropM7GW2UK1ZyH9ns56hv/tzon+TNmAGXRw350Dni4VRZOUaA
         0V7vqBId8e4A8Dvj4OzIjAv2K5nMKga8ILsisGsT4pM4ZfBiVIYYj3wZxk6Gpty3ZNgu
         aTpIySeIEWQmoauxKlHcxkKlLqf43fuz7JE8ivuETisquomsJAoSjwPiAdR9zt5ViU0p
         WitIeVDpm0aFDdTDwp5WwrlhGobPjTIECVj6Kv2QaU15uGNRYpXMtXFjUCtQdM3pxt+Y
         bRt12juCP+5Lpcyh1wnzXsOwRdBPtDtjg3jIGi/HfbFqwFIxBaH5lQ4WtaNCjgE7c8jc
         WlWw==
X-Gm-Message-State: APuU4Z8Gf41pWiH/Th+3J763H3zZKApli8lisg+A4OH+pho2eL+1TH+x
	tu+AfC5HLxUtDOazBJZG/Ynk4bfC3Z0KB4IsVHk+0l2koxavXXF2jXgegd1dFw==
X-Gm-Gg: AZFdTZerr39179idddylM7jrDO2GygOYKyQwKDLBvqEaL2NTaOx6J95REByaksyNFv1
	x6bYDtKEjq0NuvqBQ3RqR/qpkQ1tE0mou6ebYFURYXPcOqX+MHEkzHFPZe74zGV2sFiFVRMspOn
	U/mVXtw25nJRKTN9qs7L2Qw7Gqq+uEKS3+3gneyqbS73tkTSChooZFPlwyVw4fwiemyBn+LV6cv
	7WSWf0EqLMS/vFBRZr2QCugNhMfxOldXjP8cAByphpnVER+HB6osGs9fp/asBlkz7QhHInxT3Gz
	D2JIUoSau+otuTd5bXBGTSbwDxgOkkCAPBLbfa+LUK74ij5CGNCbkuMeNKqQlBnFWZmbBJv3fgf
	M5ee1vZRRtUUiyfYehX8kR/aWJzglfCA41zfoQZO/0IXg2iDKlXlzuNs4uEYLu+n3sycgyM9yQQ
	F3C59V1sKReCG+qjOLyLw4Hq8cTQyaEIqow4Dh1wYnL3UhnGiOZGkhffmrmGBiQPsPBuYrKW+sz
	Td9dWL3/mQHL7HAdyYysiYP04ap7KOPAEJtHfJ8undPOkSg8AU4kf3pG1rDjdS7aQc0eoJ86MTo
	PxoidNBpTmbj4TYQAf2js4wF4wuMW+JlwP4=
X-Received: by 2002:a17:90b:2ecb:b0:3b0:accf:5c66 with SMTP id 98e67ed59e1d1-3b41c989fecmr11866072a91.49.1795512914153;
        Tue, 24 Nov 2026 01:35:14 -0800 (PST)
Received: from neo16.Davolink ([2406:5900:7035:910e:b075:7756:fdfb:facc])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b4afeaaa84sm6487233a91.10.2026.11.24.01.35.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 01:35:13 -0800 (PST)
From: SungHwan Jung <onenowy@gmail.com>
To: perex@perex.cz,
	tiwai@suse.com
Cc: linux-sound@vger.kernel.org
Subject: [PATCH] ALSA: hda/realtek: Fix mic mute LED on Acer Predator PHN16-71
Date: Tue, 24 Nov 2026 18:35:06 +0900
Message-ID: <20261124093506.32807-1-onenowy@gmail.com>
X-Mailer: git-send-email 2.56.1
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

The mic mute LED on the Acer Predator PHN16-71 does not work and
remains off regardless of the microphone mute state.

Switch the existing quirk to ALC245_FIXUP_ACER_MICMUTE_LED, which
includes the existing headset mic fixup and also fixes the mic mute
LED.

Signed-off-by: SungHwan Jung <onenowy@gmail.com>
---
 sound/hda/codecs/realtek/alc269.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/hda/codecs/realtek/alc269.c b/sound/hda/codecs/realtek/alc269.c
index d38be4d50..0c2442d98 100644
--- a/sound/hda/codecs/realtek/alc269.c
+++ b/sound/hda/codecs/realtek/alc269.c
@@ -7576,7 +7576,7 @@ static const struct hda_quirk alc269_fixup_tbl[] = {
 	SND_PCI_QUIRK(0x1025, 0x166c, "Acer Predator PH16-71", ALC2XX_FIXUP_HEADSET_MIC),
 	SND_PCI_QUIRK(0x1025, 0x1679, "Acer Nitro 16 AN16-41", ALC2XX_FIXUP_HEADSET_MIC),
 	SND_PCI_QUIRK(0x1025, 0x169a, "Acer Swift SFG16", ALC256_FIXUP_ACER_SFG16_MICMUTE_LED),
-	SND_PCI_QUIRK(0x1025, 0x170f, "Acer Predator PHN16-71", ALC2XX_FIXUP_HEADSET_MIC),
+	SND_PCI_QUIRK(0x1025, 0x170f, "Acer Predator PHN16-71", ALC245_FIXUP_ACER_MICMUTE_LED),
 	SND_PCI_QUIRK(0x1025, 0x171e, "Acer Nitro ANV15-51", ALC245_FIXUP_ACER_MICMUTE_LED),
 	SND_PCI_QUIRK(0x1025, 0x172c, "Acer Nitro ANV16-41", ALC2XX_FIXUP_HEADSET_MIC),
 	SND_PCI_QUIRK(0x1025, 0x1731, "Acer Predator PHN16-72", ALC245_FIXUP_ACER_MICMUTE_LED),

base-commit: 8d7fe9885c62fc9a95bf55d9db244d9672a8aadc
-- 
2.56.1

