Received: from mail-oa1-f52.google.com (mail-oa1-f52.google.com [209.85.160.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D63EC3596E;
	Tue, 14 Jan 2025 17:06:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736874399; cv=none; b=noN3c6mr9R8pVTsDqDTnJVUlwYTU+f0Ly1odBP2Zim+7+6uoRwJAAmggOwQfp5PMLl+sIRjMXsoP1DY/ePA5eA+PBzYD2nC+yV3OI6jddeWtrseuS/zmQXWZveleg2bx0aDRS7SKZzfdBh2PW7SBH4BzMQhur8Y3vNch/duvXAQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736874399; c=relaxed/simple;
	bh=pArq6x99HQfMQIhDDRpqjVkt+aSZWxwebvxXk+W7mKY=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=QWO1vGlSq6ZjSfi2tpmAB2708MTqaI/XZYutdlPLBkPNZrIYjMmDVly9YK66NGHUgrishG+UpI5R30mO0iI2+clnJgnu3WM6GgMuNX6y46w7yy66eEsOErfcpUJPL4ehKtcsDM1Dj/gP8mWeiIH4nVi5BegtyvkoLn7xqcNYZuI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=B9MbT6Ag; arc=none smtp.client-ip=209.85.160.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="B9MbT6Ag"
Received: by mail-oa1-f52.google.com with SMTP id 586e51a60fabf-27d0e994ae3so2487650fac.3;
        Tue, 14 Jan 2025 09:06:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736874397; x=1737479197; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=St+zk6jCiYKILJc4L1dtjGb/dSkeZ/qtoSJtqkuYVyc=;
        b=B9MbT6AgAV9yHwlvPtspK3bAbheYUDg+IZFr815aiwJoq+1/VIDaM+hp1hgpzwr8rn
         WME+9mFQYrgcaH9bH12h0C/3aSDg5yOehFk0lAhHbIh9xIRU2nr1hHRi8Az+kGaa/bUl
         +LnZa7zEA6wsUPXLgWh9rlhlxLrEhEtaqw1mo/kwUa9uT3NZrwPQ03W/AEwyw9+COvvR
         4mnL1lWCVLLhxyp0tI3VnEWeDtIT4L9UcBLVzoLuVb6oZ30zm34kmTJTX0IHaruRUt3E
         mHsEs/NG+ZnHCPDgDPoMs466VdfTTWgnuzjlmvUT0jvGBaQeVTVLj29f5kfXN1GGFEOf
         VAJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736874397; x=1737479197;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=St+zk6jCiYKILJc4L1dtjGb/dSkeZ/qtoSJtqkuYVyc=;
        b=tQyR2Zm8mwHNlQlY3VWAJFtWaFZsJzF47wA8bBRYjHc27OxIf6BS8L/iFrD/i3U7gm
         Naf+zo+SgHb8zU5dENPVc62qHJLX8ohRrQf1lH+nxjyz+PQd8LspnR3QQQjeYH/TltF+
         KuAXTKKkuqXn5/M94BTue85mrLUD4EVhS8FE9zygPFlchIVpQTCxvFnYlPQGAvSCtyEK
         EFDBi8uRiXp3JU4KueFsuTkywp6c3rxQ8JNkDeccExPKWi0wrk3ysjOG5cmhrqouW6/j
         TSAgZNM+wS43UOcPFVhdNzcKLm0/952LnxDgWlYvMAPhdfLsdHhYE2h3jfs1vQeF28iS
         XBfQ==
X-Forwarded-Encrypted: i=1; AJvYcCX5RUiQAF3ibAc2QFZ2jTQVlu5Iyp/IGpL33CJwklirhaXzwZje7U4RXvlqK42pAXkICVLShv4zzGrGCYg=@vger.kernel.org, AJvYcCXHVd1SA8Bhtv1DxCqJ1HxgA6mbgrHuEsOuZpRh5FNXhk4WRQKOmX3hhPDFn7fIkF7MM7N+l+OSLxnGpHg=@vger.kernel.org
X-Gm-Message-State: AOJu0YyVUHiCHBgQPsop1czyetz7VEcTipD5zw/Lvt1D+tCxCiF5kWM/
	+W3NubZf7rXn8v1kTNMJKv2aCRNcQbE9De/2d3sLkNoO6o70Uz0J
X-Gm-Gg: ASbGncuSr8YfPbTs9/EXSttsQw2KWLEs2JjkDbRO+sE5yKN0ty7/hp03xetaVpDWw2w
	on4j92vIJpQMHejcXqAyZJIes1/899/6Cf8uIIDCzYITc3pHb+oo4dpI5qYrjdQqhcUBKyxqg9i
	nmXvGihUq39CGBJIHpHV1ABaVkh7gAKtQ0BVqvQNVOm94yALfz6IzOMMnEKksYXWCbIuqKl7AA8
	EnJHe+si1UrttgwzUclTEO3H/5gVZl2o7L0Zr2HIPtgn51xQL0yd95FFOlLJHPYYdYSgA0GoywL
X-Google-Smtp-Source: AGHT+IE03O/l2mhtRHTXbbC6LBkkBTbj3jkDhhbI0WMipb8+eDyePl/QyCIX33/3C+e2MbQRJfAMxw==
X-Received: by 2002:a05:6871:4108:b0:29e:6211:1262 with SMTP id 586e51a60fabf-2aa0609f198mr14317644fac.0.1736874396902;
        Tue, 14 Jan 2025 09:06:36 -0800 (PST)
Received: from localhost.localdomain ([187.17.229.111])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-2ad805a43dcsm5292969fac.32.2025.01.14.09.06.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Jan 2025 09:06:36 -0800 (PST)
From: Edson Juliano Drosdeck <edson.drosdeck@gmail.com>
To: tiwai@suse.com
Cc: perex@perex.cz,
	kailang@realtek.com,
	sbinding@opensource.cirrus.com,
	simont@opensource.cirrus.com,
	josh@joshuagrisham.com,
	rf@opensource.cirrus.com,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	edson.drosdeck@gmail.com
Subject: [PATCH] ALSA: hda/realtek: Enable headset mic on Positivo C6400
Date: Tue, 14 Jan 2025 14:06:19 -0300
Message-Id: <20250114170619.11510-1-edson.drosdeck@gmail.com>
X-Mailer: git-send-email 2.39.5
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Positivo C6400 is equipped with ALC269VB, and it needs
ALC269VB_FIXUP_ASUS_ZENBOOK quirk to make its headset mic work.
Also must to limits the microphone boost.

Signed-off-by: Edson Juliano Drosdeck <edson.drosdeck@gmail.com>
---
 sound/pci/hda/patch_realtek.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/pci/hda/patch_realtek.c b/sound/pci/hda/patch_realtek.c
index b74b566f675e..91976dea49fb 100644
--- a/sound/pci/hda/patch_realtek.c
+++ b/sound/pci/hda/patch_realtek.c
@@ -10961,6 +10961,7 @@ static const struct hda_quirk alc269_fixup_tbl[] = {
 	SND_PCI_QUIRK(0x17aa, 0x511f, "Thinkpad", ALC298_FIXUP_TPT470_DOCK),
 	SND_PCI_QUIRK(0x17aa, 0x9e54, "LENOVO NB", ALC269_FIXUP_LENOVO_EAPD),
 	SND_PCI_QUIRK(0x17aa, 0x9e56, "Lenovo ZhaoYang CF4620Z", ALC286_FIXUP_SONY_MIC_NO_PRESENCE),
+	SND_PCI_QUIRK(0x1849, 0x0269, "Positivo Master C6400", ALC269VB_FIXUP_ASUS_ZENBOOK),
 	SND_PCI_QUIRK(0x1849, 0x1233, "ASRock NUC Box 1100", ALC233_FIXUP_NO_AUDIO_JACK),
 	SND_PCI_QUIRK(0x1849, 0xa233, "Positivo Master C6300", ALC269_FIXUP_HEADSET_MIC),
 	SND_PCI_QUIRK(0x1854, 0x0440, "LG CQ6", ALC256_FIXUP_HEADPHONE_AMP_VOL),
-- 
2.39.5

