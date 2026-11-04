Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.182
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793814815;
	b=W8T5WoA8EOAcsiuiWQVg6xsx3UgZbCV/dyGEIOvtyIFKUitDeyjmu7gHwMpMsEEpryyz
	 fEixS8XjvJiY+1tImNZ2VLy9INYJGtDFlVIiCf4Htg1WNaeLVK8sJPe+Vvo9CADNJy0E/
	 GowUQcNphcRwEqjgUY3DeosmzMyn4a92QHYgfZyjfHAFCi9/S60y1VwnP39VxRFdDBaCz
	 BUFAUfrx9jwH6c3FeShl4zP2S/ZtYGPmfXibg3VrNtePBj/upbe/p+7SLjaWECkxoZZpw
	 H9GLnpsZqPWYZT/yW7L8iWaeWNeZFcfusF5FleJjYOADMl6H8xqeI2CD2ZNkN50IFWQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793814815;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=nzrMeoX+0unzTNhRa/szxB/nypWquuAzb94RbOq3TGY=;
	b=pj5Wy2FKvHK5S9ieYdqcbuOzDouGrH8jl/iuFNlWCgcNiUp66KFPqTjG14S7ZrNctaK6
	 Hdt7ZYI54Rh1baxSi3iaB//b3L9IKoLM1aYn2TJTxoIZ8ZEuSIMO/RkdNxVGT8Gl9tuZP
	 aOTuvGXFmsPOuj+PGQOE3kwvoCYTw1FbzDOjPc/L6j9nyfkf7LO7XD6D9DTdRZ+6mGAXq
	 qzjeoWGkg3Zk6P8BsREptQxEzoR6GO+F7RIPEbsMdig89Zs9MdQsyUERuS9TPwRGAwhvg
	 v6YJ2FsC9n6Sq4NQUt5aZuD8woAHoV2+SWyWpSWDYV0vkzkFHGNHO8GMiPXCqZbX6JA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=0Vz9cMfK;
	arc=none smtp.remote-ip=74.125.82.182
Received: from mail-dy1-f182.google.com (mail-dy1-f182.google.com [74.125.82.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4099F606B23A
	for <linux-sound@vger.kernel.org>; Wed,  4 Nov 2026 17:53:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4099F606B23A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=0Vz9cMfK
Received: by mail-dy1-f182.google.com with SMTP id 5a478bee46e88-3282db206d3so1884428eec.0
        for <linux-sound@vger.kernel.org>; Wed, 04 Nov 2026 09:53:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793814814; x=1794419614; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=nzrMeoX+0unzTNhRa/szxB/nypWquuAzb94RbOq3TGY=;
        b=0Vz9cMfK8u6moTgXlMIY5a/rImfB5jFn6ckY0QBHKq8XwbZej4c/T1mgzge41Uib4f
         n3bPRZs9GHvRA1B4MslwpX2y0hCqjtJkWz5ayBYoaJkmksPtzkSVGhyxAkiZS/tlpQyq
         QGuRflrCsD175W927B+wa0jWsXdX7GHKG5QzqrWr9US4+WJW9EYc5cgxfw1h5/Nfx0rj
         vTxwtuf0QFWVP+6DQFqjn4EEasQfVj6a4n0lKI/MfgNuntckkAJ6fkSD9kIRE4SUwrkZ
         DuJ52cCsEJ/xy04/xMzdCkRUcPV9Wc3GwqmW4pnpUPDQXE2VaM+pVvUMa3ETZ5YMr6KM
         F+hQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793814814; x=1794419614;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=nzrMeoX+0unzTNhRa/szxB/nypWquuAzb94RbOq3TGY=;
        b=ujvsXucFemml/x4HKOI5jVoYHbm5Sh1DZ3S/c/HcxLgxVp5QaJ3HJ11MJlljQi3cst
         EZq3MDa3cCiQ8D2I1WsBEvzy/z5/EQRtmo5uLcTMAEmmx1UlYw38H5/U3RGBDsky443c
         OlaSimV4TSrxv9KivBnZKNWcAQ2g8ysbl7x7BxxvSQR/Hhwsdp2cEo2zx/HQOKmTKkCd
         sadLNatIEPMmH2xbPXYwCtHOmwyKRQD1kUIc6ZMc3AzpjrM9NyyqPfkMAOK/TZRoiadl
         5HW0tOfbji6N35u4cYYsPUo7Cyu6OQ+3mIfXiOeDjNrTxApmXfuuubsnEhComRFNIcd2
         0KVQ==
X-Gm-Message-State: APuU4Z8U+78jb3Dewpam5opTxYlANIPDFXLSfZkY6pFTPqwMWdIzlGVz
	KO5JarIaE8J2n9T/gOmIEidVqm/Gm6nPGVXP0AAUAPqMpSPghyG+SmVWHkaOsxY=
X-Gm-Gg: AYBFou2AJhZyBllikryMlMYypzlGlTDl9dacVmpHhjMu3gWib3nCGYUsy1mM7Gt3eIk
	7Ke8XPR4rC/pIHOZKNOI0/3vME8X2LBt4aGDgC+l+x5+xJySDrX25n23cof1LUkrcDcjdGPeZdW
	8bLJUvOol7zSEVOfcLyNp10PQ7haqgx3U75UBFvWj6JeeOzsDlpGWBPhwkF3dO2afDCSpzXD6xv
	KxbMQydSzVDl3gdJlnYMyUUSO9QAtKs8f2gSwbdwPqWkyGp6j8KJr7L6NZI2YG7ntzlPFvA5Gg7
	giLfBDJvAzzOAcA8M2UBCirvzpRW0eHwTxpmE58KcJNjWKvSdodAuY3eCRJX3RVndDyeKP10cIn
	A15U4NjuYb1tH1JH6NmJu5s/kfTgatcN0JH4dvyzfhPEevE4lFJC9MbhkhQo5ZpNe/pCGMsyqlu
	JmWotT6ckSht8mEHEfvEdG/QiBA8L/3PousF9Z0XD4KCMpMAbX+jdO9GfH3lGBRj8uB1JgE80jl
	+i9XsYQr6VkmMPo87Xeu9kveVVqaTav3ztd89L6vSm2nGB/And8RNK2PQp8X44r+w1mhDbWAr5T
	MnsOultJ9bxD0aabgfMRGpo3C27EoUB/X6Ka904Bbk8xKZV32KpZmPBO1MCX8/vTj6Zzpw==
X-Received: by 2002:a05:7300:fa17:b0:36c:3b8a:8089 with SMTP id 5a478bee46e88-36c3b8a8474mr7678595eec.36.1793814813579;
        Wed, 04 Nov 2026 09:53:33 -0800 (PST)
Received: from localhost.localdomain ([2406:3003:2002:639c:a599:d119:deec:193f])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36ca394f297sm10458939eec.21.2026.11.04.09.53.31
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 04 Nov 2026 09:53:33 -0800 (PST)
From: Yige Jiang <yigejiang86@gmail.com>
To: linux-sound@vger.kernel.org
Cc: Yige Jiang <yigejiang86@gmail.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	linux-kernel@vger.kernel.org,
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Subject: [PATCH] ASoC: cpcap: use the platform OF node setter
Date: Thu,  5 Nov 2026 01:53:26 +0800
Message-ID: <rc-review-20261103-28-afc55c614a25@gmail.com>
X-Mailer: git-send-email 2.50.1
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

cpcap_codec_probe() gets the audio-codec child node and assigns it
only to dev.of_node. Platform device release now puts dev.fwnode,
so the acquired node reference is never returned.

Use platform_device_set_of_node() to synchronize both fields and
give the device its own reference, then put the local lookup
reference. The device keeps the node until it is replaced or the
platform device is released; a probe retry also drops the old
device-owned reference.

Fixes: 7b5b51b2b05c ("driver core: platform: count references to all kinds of firmware nodes")
Assisted-by: LLM
Signed-off-by: Yige Jiang <yigejiang86@gmail.com>
---
Based on linux-next next-20261102 (2637bdec0535).
Compile-tested: arm64, GCC 14.2.0, W=1, CONFIG_OF_DYNAMIC=y.
COMPILE_TEST=y.
Baseline and patched target objects built from this exact base.
No full kernel/module-link, hardware or runtime test was performed.
AI assistance: Codex (LLM) for ownership analysis, code and changelog.

 sound/soc/codecs/cpcap.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/sound/soc/codecs/cpcap.c b/sound/soc/codecs/cpcap.c
index eaaf141dea57..eda72fe830ae 100644
--- a/sound/soc/codecs/cpcap.c
+++ b/sound/soc/codecs/cpcap.c
@@ -1761,7 +1761,8 @@ static int cpcap_codec_probe(struct platform_device *pdev)
 	if (!codec_node)
 		return -ENODEV;
 
-	pdev->dev.of_node = codec_node;
+	platform_device_set_of_node(pdev, codec_node);
+	of_node_put(codec_node);
 
 	cpcap = devm_kzalloc(&pdev->dev, sizeof(*cpcap), GFP_KERNEL);
 	if (!cpcap)

base-commit: 2637bdec0535a2044cd830eba9a79363651d9043
