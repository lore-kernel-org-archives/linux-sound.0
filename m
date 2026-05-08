Received: from mail-qk1-f170.google.com (mail-qk1-f170.google.com [209.85.222.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A64438E135
	for <linux-sound@vger.kernel.org>; Fri,  8 May 2026 22:55:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778280916; cv=none; b=GlMtYwLclgE4eIa1XOqhZLUG0dM5nHhagPAjvAHV3INUGHEblfB0f+VGB+Z6il8kkqpRxRJ6M8NOb6Y/n8POih4mzcC940CKCM+c7eAoERWKvEml8dzw27jGTE4Q2574yGKMmkvm1CAm7rKZvmRCpsg4YhIBNX/bV11t+y91Xhs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778280916; c=relaxed/simple;
	bh=QSX7YN2Kkqt0mJt8UgVJ6i9GbnwZDdxdNDd4zHflDnU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=je+d9Vv36tH1bhmEogB5Jxwmkme78CmMzLnq/evBGpAWFB7bmzqmrUsGGfEO+7em/womf56f5RO0gjpol/egj7TQCC7PgPbE+enHbq1I0nyV3D8br1rSmTut7gQrScOkhE+zwpaJ0OLAGwt9pf0OBiaXs7ytvKiS1Z6PBPyJtyc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kzTOJtdf; arc=none smtp.client-ip=209.85.222.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kzTOJtdf"
Received: by mail-qk1-f170.google.com with SMTP id af79cd13be357-8c70b5594f4so283360185a.1
        for <linux-sound@vger.kernel.org>; Fri, 08 May 2026 15:55:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778280914; x=1778885714; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=vtE+YuXWqKSidY4VGGV6JauwPm/5vzq7+5m3m3uoYkQ=;
        b=kzTOJtdfvfqHvy60iKa1A12p74a8OEsPBEgXlM8KdhaRikkZgaf5IHbPCXS8XIhr0m
         O4DDQVs4/RwvZfdtIoGzcREUO4CuR8Ky8o8I2eJpkTXf4KZcbZvwjZsF8SOl48DQpLPx
         AfnZEiBuLMPkCMn4aXXc72v4w4bd2Ll0xn0LYcf7RiQuxWMSqHi+1M3bMUO/U4VqSgQp
         wUXnvZEZ1Pl3tJ8sSkWILdtrAKe4BqW2HKifk/jNsKs6qz+L0BSpkLUCRZ6SARFung1J
         5x/zmfY2lwh8bmFjIQnvE5efUDE5fdec+21LZxE2tFMqnUmfpk1m5Z55/Aelw+Ecw9km
         cfEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778280914; x=1778885714;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vtE+YuXWqKSidY4VGGV6JauwPm/5vzq7+5m3m3uoYkQ=;
        b=EObwfYhJRo4XEeENIdryO+WOvP6MSTH0e+MTFlBWLnwW9jJd+cNp9/p3hK4rH/PeIt
         oLkCxKiEUVwA93eKYuWaKuBVSPmjjbc1jG0kArpdiKb9W7NnMNFtafvGBRvUBboKippN
         t5B5N32NNVLUVKQLMrgor7IzTbjedDgpCqN3yhqfu92d3LvC5k1QdLuSu3Nnl8zevrNc
         dJiaDKTPZhpHtSATFUvM9COK7SZVOQ9K+WJt79lPsRsnoevgRouYNym6to254HfUkoLV
         csVz9+ezqpQ0cOg+7pfqV6Me4Dpnzwx5nSp2q8WOsEho4yHy5Mc1KkEE71G8ph+2Cofa
         2zjw==
X-Gm-Message-State: AOJu0YzMItZQz4hRW+hRc8aWg/xEaBp5c3fAdSpuoqGTh2J2X8IbznY+
	k72aeYY7kHCWLH/xb5AVP6b9k/8NoBJMnvB8qYyO3khYlQEVrWgcGzic
X-Gm-Gg: AeBDietrCmJiAOlYyl+Ld6GdNI3Qz3IcyWxt5lHXbSf6wu94IlAAVC9cyRUmX/4HtNL
	8z8iiY0NXyiruT/STKuqIBNPP7m//Ier9gEeTOkeywIQ20l6QQimElF/+aVeNjhLkbFN+p2JIvy
	plOHlEOcktrd7HR+KGdQVGg2RzMJHOSFsJqIai5YdKFEHmnsYqxp2KgQ9TdejRXaBzc7zqHW8c9
	F9UKVlHnSydt562G2xgbGxsLuiQCl4D4eo3Swc7tNlMjkZYhdZ8WPnOGBkpPr+Mh7PaWcfCZ5mo
	hYiu9kD7te2jvH9xlsB+/f4rgc+XONELkAVdTiBxXAtYm8zxCsYNSbYTKY7GbI7bUo+PwzQCXD6
	jmKk/yM2wyDIELpiO7OEVyLtyc+WulRMsnsoWnEc66SfaPQfUrOvpjF7JEn1m8l3eQGVJiRPuBd
	f9WQNO1kQRolbv/ZzVFDxKaZO1OuFdcx8v3h61+XL+ua3HXc7MyFc792zJAxHuK6MYvsyMSXZ6v
	C5oM+IbGY/RT4MBxwmdCreXxyaA
X-Received: by 2002:a05:620a:472c:b0:8ca:3715:eea5 with SMTP id af79cd13be357-9065091a471mr1294812185a.14.1778280914383;
        Fri, 08 May 2026 15:55:14 -0700 (PDT)
Received: from nick-lenovolegion-16ithg6.tailf3aaf.ts.net (dyn-pppoe-142-51-228-191.vianet.ca. [142.51.228.191])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-907b8bae450sm332652985a.21.2026.05.08.15.55.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 May 2026 15:55:13 -0700 (PDT)
From: Nicholas Bonello <hadobedo@gmail.com>
To: perex@perex.cz,
	tiwai@suse.com
Cc: linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Nicholas Bonello <hadobedo@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH] ALSA: hda/realtek: Fix Legion 7 16ITHG6 speaker amp binding
Date: Fri,  8 May 2026 18:55:07 -0400
Message-ID: <20260508225507.47667-1-hadobedo@gmail.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The Lenovo Legion 7 16ITHG6 uses codec SSID 17aa:3855, but its PCI
SSID is 17aa:3811.  The latter is now also used by the Legion S7 15IMH05
quirk, which is matched before codec SSID fallback and incorrectly
routes Legion 7 16ITHG6 machines to ALC287_FIXUP_LEGION_15IMHG05_SPEAKERS.

That fixup does not bind the CLSA0101 CS35L41 companion amplifiers,
making the built-in speakers silent even though playback appears to be
active.

Add a codec SSID quirk for 17aa:3855 before the conflicting PCI SSID
quirk so that the Legion 7 16ITHG6 uses ALC287_FIXUP_LEGION_16ITHG6.
This restores CS35L41 firmware loading and binds both speaker
amplifiers.

Fixes: 67f4c61a73e9 ("ALSA: hda/realtek: Add quirk for Legion S7 15IMH")
Cc: stable@vger.kernel.org
Tested-by: Nicholas Bonello <hadobedo@gmail.com>
Assisted-by: Codex:GPT-5
Signed-off-by: Nicholas Bonello <hadobedo@gmail.com>
---
 sound/hda/codecs/realtek/alc269.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/sound/hda/codecs/realtek/alc269.c b/sound/hda/codecs/realtek/alc269.c
index 11d0ea8ed859..16993f8cf978 100644
--- a/sound/hda/codecs/realtek/alc269.c
+++ b/sound/hda/codecs/realtek/alc269.c
@@ -7675,10 +7675,11 @@ static const struct hda_quirk alc269_fixup_tbl[] = {
 	SND_PCI_QUIRK(0x17aa, 0x3801, "Lenovo Yoga9 14IAP7", ALC287_FIXUP_YOGA9_14IAP7_BASS_SPK_PIN),
 	HDA_CODEC_QUIRK(0x17aa, 0x3802, "DuetITL 2021", ALC287_FIXUP_YOGA7_14ITL_SPEAKERS),
 	SND_PCI_QUIRK(0x17aa, 0x3802, "Lenovo Yoga Pro 9 14IRP8", ALC287_FIXUP_TAS2781_I2C),
-	/* Yoga Pro 9 16IMH9 shares PCI SSID 17aa:3811 with Legion S7 15IMH05;
-	 * use codec SSID to distinguish them
+	/* Yoga Pro 9 16IMH9 and Legion 7 16ITHG6 share PCI SSID 17aa:3811
+	 * with Legion S7 15IMH05; use codec SSID to distinguish them
 	 */
 	HDA_CODEC_QUIRK(0x17aa, 0x38d6, "Lenovo Yoga Pro 9 16IMH9", ALC287_FIXUP_TAS2781_I2C),
+	HDA_CODEC_QUIRK(0x17aa, 0x3855, "Legion 7 16ITHG6", ALC287_FIXUP_LEGION_16ITHG6),
 	SND_PCI_QUIRK(0x17aa, 0x3811, "Legion S7 15IMH05", ALC287_FIXUP_LEGION_15IMHG05_SPEAKERS),
 	SND_PCI_QUIRK(0x17aa, 0x3813, "Legion 7i 15IMHG05", ALC287_FIXUP_LEGION_15IMHG05_SPEAKERS),
 	SND_PCI_QUIRK(0x17aa, 0x3818, "Lenovo C940 / Yoga Duet 7", ALC298_FIXUP_LENOVO_C940_DUET7),
-- 
2.54.0

