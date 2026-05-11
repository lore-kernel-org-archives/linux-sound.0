Received: from mail-dl1-f46.google.com (mail-dl1-f46.google.com [74.125.82.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DD67401A01
	for <linux-sound@vger.kernel.org>; Mon, 11 May 2026 18:16:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778523382; cv=none; b=PLpKah0FEqSXaYt4/wVH0NKdYQRS0Y6TXdgeT7OCAFI1V9trOYC3xyI1Pqbxz3VcYhblg73w5GyLtzN4S9dr2ovORUYmVF+QqPq/ZRlC8k4/JgW9qokt02A0aajj156WG9szyZhw67JGnQvWjYyXBE/nfhyQztUVPKuXBU1qON8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778523382; c=relaxed/simple;
	bh=saF/ztnF3I0uu6WLuZsCpySX/zmFGeLWwFVFO/stZ/I=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=MZN2B9UpzbeGCErmt1+x8GG2H694LSq9tRVP/1xAuBdDqH2e8hOGGOROE6s0nI5eIL+7CUCqI8HLP9g0wvttX9MVOzk90Fp1qt72q8zLApW0vtQPrYKGnJoSd2RLsoYfUjpHHTda6NA5ohp/Ln9LjP06nssxm83Re1CbGgjGIGY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XLmBJJZh; arc=none smtp.client-ip=74.125.82.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XLmBJJZh"
Received: by mail-dl1-f46.google.com with SMTP id a92af1059eb24-1330d6bb78dso1064553c88.1
        for <linux-sound@vger.kernel.org>; Mon, 11 May 2026 11:16:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778523381; x=1779128181; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=qEHErrfp8JXn90qUsedQ6RU7H/9pFO+b1+Lx8BQlQz0=;
        b=XLmBJJZh/FPYtuDUNrnhzxXv1ves0++yIDC3LNuk1vCIs5HJ2/7GI3arwEPiJ6W/YT
         RVZuKS40skZYZLwvDFvdAvVLLpUukP86F+8kvTmWAj25k/bnSyb8S0TjLao3ZVyI368u
         C1kgRTJK2aG5/iRGm/GoCWs2nQOtqE8W0wImh5K/ve4LiJL2pDvHU5r9YGGAp66dUmhl
         wCkN4IpZ4TsD2CzvX8ks0KNka3bgPLkbWqzDChDHvXUj+98y/LzKCtf/lgqa18K/7gVe
         p4bm5gox41Eh9R4P0dxdgAPjzWFDcUZIf0solWBZl20q0twE/ETfEoAf9Kup4WFnXsCP
         tEDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778523381; x=1779128181;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qEHErrfp8JXn90qUsedQ6RU7H/9pFO+b1+Lx8BQlQz0=;
        b=k4EibuHE9Gnv4NWc9phVnsNNlzJRQYxTkps70bpKWA+UTaZC91djcZT50S8pCYdr+v
         K5L6NN/9i0YoTKYpQGW5ZL8JbZNd9lIXVvEKx5EhmwE8hh7crKFjgTSe3LUu64GgUIip
         jzJuwCO4ekj5QgvWNa6V1hou1g9h8GjsR5vmIjVH9TUynxGNv/mHPsV1myJj4QdXNjRo
         DaM3ae1ZQiveik+MX3fKoK9biEQwXmMrDtfhKj1HJrFGZR8XLR2+7bbQu9bVPfus9Khk
         1yj9mQUbM8Cr4u/8Sh4fIcasWYLjNNlT2XWBFwsD2ukQD1oLFqPw6Vt2sxDecVTIB3KZ
         y47w==
X-Forwarded-Encrypted: i=1; AFNElJ8cqEQL9bRu6yUngt7p27HIjNna6zUKgr6GV9iSzcxAX0rETOUgTExXLMyZjGxcqAxeWia0JGCJp9FIcQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YyDtpxctY3WINRBUar58BgZYfO/cQ/PiaNYHZgRa/g2+pZoS7ue
	zXEvvLchgXMYmGnYEU0TFR2T+auRDlsIccUq/ifotgURHANq5Ew84u0Us68kD5tN
X-Gm-Gg: Acq92OHC7wlrmgQIb9F0sBdz2aGo9supM7id44NKLAVr2gxyvH231gfiNBJq8p4wsnf
	ffxznbhNGjgRea0TLVQSVxUPAakJrifqTkMx2pv1xRxrRLXLKxA5JYk8MV8YdufIbKyTkUnxTsz
	LG9ECe94Xbv/W25iW1xmfwlXspdMVvqpNCWA+wxGkpNGLxIAYlAL9TTStdKhYwrwnp51FEsA3Jn
	ZsPc27uPkcYV0/fbb/kilblBI3KjPcZW3FeLIa0Tweea0TOV0cssJMeY2+WNEvNtUtmRkGm3tpF
	753dQa1kfL32rVwT4tvHs8HnTigmETIhMSa3++jknyLHEkUdbezhyI4aULowmG/9+rmrVE37I9y
	KmhFgr7yD610kSUThc38/xP11qYzlrV4brJ2k7CO1mjB7N+pDgLNITv6D4XH0BXGiyDw9MeoGJY
	Z448f1ymsT4WrDkrf0cf1CsQqKsSxui5tDEDtmLUI=
X-Received: by 2002:a05:7022:699d:b0:133:39a6:2b8b with SMTP id a92af1059eb24-13339a62ddamr618346c88.44.1778523380710;
        Mon, 11 May 2026 11:16:20 -0700 (PDT)
Received: from localhost.localdomain ([187.17.229.4])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1327810ff4dsm15249265c88.3.2026.05.11.11.16.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 May 2026 11:16:20 -0700 (PDT)
From: Edson Juliano Drosdeck <edson.drosdeck@gmail.com>
To: tiwai@suse.com
Cc: perex@perex.cz,
	zhangheng@kylinos.cn,
	sbinding@opensource.cirrus.com,
	kailang@realtek.com,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	edson.drosdeck@gmail.com
Subject: [PATCH] ALSA: hda/realtek: Limit mic boost on Positivo DN50E
Date: Mon, 11 May 2026 15:15:58 -0300
Message-ID: <20260511181558.670563-1-edson.drosdeck@gmail.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The internal mic boost on the Positivo DN50E is too high.
Fix this by applying the ALC269_FIXUP_LIMIT_INT_MIC_BOOST fixup to the machine
to limit the gain.

Signed-off-by: Edson Juliano Drosdeck <edson.drosdeck@gmail.com>
---
 sound/hda/codecs/realtek/alc269.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/hda/codecs/realtek/alc269.c b/sound/hda/codecs/realtek/alc269.c
index 11d0ea8ed859..4810d8ba43d3 100644
--- a/sound/hda/codecs/realtek/alc269.c
+++ b/sound/hda/codecs/realtek/alc269.c
@@ -7828,6 +7828,7 @@ static const struct hda_quirk alc269_fixup_tbl[] = {
 	SND_PCI_QUIRK(0x1d72, 0x1945, "Redmi G", ALC256_FIXUP_ASUS_HEADSET_MIC),
 	SND_PCI_QUIRK(0x1d72, 0x1947, "RedmiBook Air", ALC255_FIXUP_XIAOMI_HEADSET_MIC),
 	SND_PCI_QUIRK(0x1e39, 0xca14, "MEDION NM14LNL", ALC233_FIXUP_MEDION_MTL_SPK),
+	SND_PCI_QUIRK(0x1e50, 0x7007, "Positivo DN50E", ALC269_FIXUP_LIMIT_INT_MIC_BOOST),
 	SND_PCI_QUIRK(0x1ee7, 0x2078, "HONOR BRB-X M1010", ALC2XX_FIXUP_HEADSET_MIC),
 	SND_PCI_QUIRK(0x1ee7, 0x2081, "HONOR MRB-XXX M1020", ALC256_FIXUP_HONOR_MRB_XXX_M1020_AUDIO),
 	SND_PCI_QUIRK(0x1f4c, 0xe001, "Minisforum V3 (SE)", ALC245_FIXUP_BASS_HP_DAC),
-- 
2.47.3

