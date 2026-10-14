Received: from mail-dl1-f46.google.com (mail-dl1-f46.google.com [74.125.82.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0EE62FE05C
	for <linux-sound@vger.kernel.org>; Wed, 14 Oct 2026 07:25:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791962757; cv=none; b=lKL6+OxghN477DNX9Ld471Q3nikiMid2ovEcpKnzk6GhscOQN8i8F1BVFvgoslKPD+7CprWpTwgN8oKf+Co/NYDwlrCMi28x22pmo1YsPaDmP1yXrmGXpTtXb/wDdyRP88K4v1aFji0uBmzrEwpR68iYcbeIpxRlanzPL4fVAZc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791962757; c=relaxed/simple;
	bh=l4SPsE6hUZzdH+Qt8qaHUjdFoBe0vV50Kvu0KI2diGg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=VoX7q0dVAR9ITkJbt25lNoTmxDaJnR+5PuP9mVgYTxa0WWtLd/QkHfqznZvHjC04kqso81sMOhK+PukxRnFKjMB/4zNeeFXkeMlGMXB6gEO/v27R8GTXxtNvW6TzuTOGMYZOC0lFzdEzJ1ei5hcXiIpV3D3nOMo75ZgCSWhyRFc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iI/OzBJX; arc=none smtp.client-ip=74.125.82.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iI/OzBJX"
Received: by mail-dl1-f46.google.com with SMTP id a92af1059eb24-15dd124bbe7so7174736c88.1
        for <linux-sound@vger.kernel.org>; Wed, 14 Oct 2026 00:25:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791962756; x=1792567556; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Etm6ClrcBWm5fy49QND/rngwEsT/VESg8/v5EOMf2FQ=;
        b=iI/OzBJXVcavSV/zWUVW3/C/IDY3buP0Zj45+aRbnOhZBv5eAIC2ZdOAb/WapgdXRB
         motrNKy22C7nIt3GhM0EZMfyuNrihkuW0y5jEHsDkUnTqHC/pHYsCqM+NR6DDtZSSNiq
         VcYBMNFDBf0iUTHf7SH73aIjn9MoKVBEupIStonZFTPPSBBo6+fc+I6C3Js6HfxFqTxL
         YE1Cv8plDUo+EvTv9jiak98uHpn6QN/8Dj5jVztuqNGdDyVV3BNYO6zYbn5GMl9jR68J
         9wbf5vwWmYqbfort5+AgHTe1JDvj7OSlVYKeHVmDBpSa4L/Wkowyh4/NozC6TwnxTqpX
         1KMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791962756; x=1792567556;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Etm6ClrcBWm5fy49QND/rngwEsT/VESg8/v5EOMf2FQ=;
        b=t9JNLm6MIudkejE1Rlwx+U1l9kgzqbEIK6gH/zrz+/A/E6ahM+ey2IAWBn5l4tcsGz
         b64+IIb0zl3Kcni3cQBrs8iHw+5pCUiuHyjVIgvZD9gPSseJ2es7QlBGEgRk2/wp9hG/
         0pdzeCl0OEKyfyCUBbYj+rgmIOoHeZQmJzciwllmT2lnIvpv7w/gPfxd/ZydhG4wXbZW
         K7bFcBqLCtLVo8V7741LxBS4wPE8LXWsFTzN+qPwAWlxuzw7zI52kCsHVJn/ZRB0baOw
         wgsNPyshB2CbmE4pGEiTwRy2kkEJjowin4YW65BLEY5salMk5+js/V2qn1SYPyVou7VS
         Q+kA==
X-Gm-Message-State: AFq9FYKfYdfNLiXLrvjTjfby+nkAbyjWupH84QarToKF7HSOBJOMadZe
	VHYUWcclNbjsjfbRv3WNrEFt48KeJptSGnK69FG07nBaet4Ac4YbK65p
X-Gm-Gg: AYBFou1etRZhC7SkKz9GO42Q5tyG1NkiMlH7CkA5rRijPmO2UAh/zt5bY1gjLYe+QDP
	ybci0ImGPgGCrDU0/vDKJ4ivOMZZYljfTT8Qcfqp9JjNFIy349Rc0vhwSVDTKhdcRmBG8yNFkSJ
	Rn+MXB1NOjWRxHWFduCovMmVvBUZ+X/TnyA7qvMdhYAjJAe9Jvjay3R6o1ql6ENdgmuj1oU9Tf8
	uQfKKSESTLW1q2gt/nMKMp1gxjY7AIGx/DbsXZN2a3EknXWrGx+oK2EaJeyt6cMZQfQcrozRYty
	zda0rrNBiKV6JmOG2k+5hegPQZYHfRto8p8hiLKfpIs/0IQwJyt699w2RI/gE/QCG+D7HoU66rg
	mYmKV6HzG9tYjL5OMVKpBn7n8Xlp0I+h7h/lzScGFL7+ZCnPVrY3okva7dxGFaSqze2ZlXAhVS+
	RP0+HcXO7rRGmk2vI96SC7bKpiTJGbzWEa8XDlV2vb1iXNDNoVPFBqaKi0Sb01xXY=
X-Received: by 2002:a05:7022:290:b0:151:2e62:fe5b with SMTP id a92af1059eb24-16a5dbfd567mr23448651c88.22.1791962755498;
        Wed, 14 Oct 2026 00:25:55 -0700 (PDT)
Received: from linmach ([182.156.30.23])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-169a42407e7sm44461526c88.15.2026.10.14.00.25.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 00:25:55 -0700 (PDT)
From: Aayush Kumar <aayushkmx@gmail.com>
To: perex@perex.cz,
	tiwai@suse.com
Cc: linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Aayush Kumar <aayushkmx@gmail.com>
Subject: [PATCH v2] ALSA: hda/realtek: Fix speaker and mic mute LEDs on IdeaPad Pro 5 14IAH10
Date: Wed, 14 Oct 2026 12:55:05 +0530
Message-ID: <20261014072505.60358-1-aayushkmx@gmail.com>
X-Mailer: git-send-email 2.56.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The speaker and microphone mute LEDs on the IdeaPad Pro 5 14IAH10
do not follow the ALSA mute state. This machine has an ALC287 codec
with SSID 17aa:3914, but shares PCI SSID 17aa:3843 with the Yoga
Book 9i and currently gets its fixup.

Add a codec SSID quirk that runs the IdeaPad ACPI LED fixup. Chain
the existing bass speaker amp fixup so the audio setup is retained.

Tested on the IdeaPad Pro 5 14IAH10: muting and unmuting the
headphone sink toggled the physical speaker mute LED. Muting both
microphone controls changed the ALSA mic LED state from 0 to 1.

Signed-off-by: Aayush Kumar <aayushkmx@gmail.com>
---
Changes in v2:
- Add a comment about the conflicting PCI SSID.
- Rebase onto sound.git for-next.

 sound/hda/codecs/realtek/alc269.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/sound/hda/codecs/realtek/alc269.c b/sound/hda/codecs/realtek/alc269.c
index 542245156..aff1a1e40 100644
--- a/sound/hda/codecs/realtek/alc269.c
+++ b/sound/hda/codecs/realtek/alc269.c
@@ -4386,6 +4386,7 @@ enum {
 	ALC295_FIXUP_HP_OMEN,
 	ALC285_FIXUP_HP_SPECTRE_X360,
 	ALC287_FIXUP_IDEAPAD_BASS_SPK_AMP,
+	ALC287_FIXUP_IDEAPAD_BASS_SPK_AMP_LED,
 	ALC623_FIXUP_LENOVO_THINKSTATION_P340,
 	ALC255_FIXUP_ACER_HEADPHONE_AND_MIC,
 	ALC236_FIXUP_HP_LIMIT_INT_MIC_BOOST,
@@ -6611,6 +6612,12 @@ static const struct hda_fixup alc269_fixups[] = {
 		.chained = true,
 		.chain_id = ALC285_FIXUP_THINKPAD_HEADSET_JACK,
 	},
+	[ALC287_FIXUP_IDEAPAD_BASS_SPK_AMP_LED] = {
+		.type = HDA_FIXUP_FUNC,
+		.v.func = alc_fixup_ideapad_acpi,
+		.chained = true,
+		.chain_id = ALC287_FIXUP_IDEAPAD_BASS_SPK_AMP,
+	},
 	[ALC287_FIXUP_LENOVO_YOGA_PRO7] = {
 		.type = HDA_FIXUP_FUNC,
 		.v.func = alc_fixup_yoga_pro7_audio,
@@ -8427,6 +8434,11 @@ static const struct hda_quirk alc269_fixup_tbl[] = {
 	SND_PCI_QUIRK(0x17aa, 0x3834, "Lenovo IdeaPad Slim 9i 14ITL5", ALC287_FIXUP_YOGA7_14ITL_SPEAKERS),
 	SND_PCI_QUIRK(0x17aa, 0x383d, "Legion Y9000X 2019", ALC285_FIXUP_LEGION_Y9000X_SPEAKERS),
 	SND_PCI_QUIRK(0x17aa, 0x3842, "ThinkBook X G2 IAH", ALC287_FIXUP_MG_RTKC_CSAMP_CS35L41_I2C_4_THINKPAD),
+	/* IdeaPad Pro 5 14IAH10 shares PCI SSID 17aa:3843 with Yoga Book 9i;
+	 * use codec SSID to distinguish them
+	 */
+	HDA_CODEC_QUIRK(0x17aa, 0x3914, "Lenovo IdeaPad Pro 5 14IAH10",
+			ALC287_FIXUP_IDEAPAD_BASS_SPK_AMP_LED),
 	SND_PCI_QUIRK(0x17aa, 0x3843, "Lenovo Yoga 9i / Yoga Book 9i", ALC287_FIXUP_LENOVO_YOGA_BOOK_9I),
 	/* Yoga Pro 7 14IMH9 shares PCI SSID 17aa:3847 with Legion 7 16ACHG6;
 	 * use codec SSID to distinguish them
-- 
2.56.0

