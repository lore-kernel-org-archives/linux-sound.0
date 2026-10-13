Received: from mail-dy1-f179.google.com (mail-dy1-f179.google.com [74.125.82.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A77F4A49A3
	for <linux-sound@vger.kernel.org>; Tue, 13 Oct 2026 18:37:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791916672; cv=none; b=iQZAFnwoFCdJflZID2tKnPmK+olegDl2ceB6Gm+JUo6w4mAO1yH6kticfEn7/15YG0uYTdVTMK1CX2wbqgUpWWYATE5+vkpWm6D26HVlOI1ZsK3rq+YjAHFwQIRkhdXyj+HQeq38BGBgxSj0sQ1egDjf7NR3ksBvpdUrYxyt1vA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791916672; c=relaxed/simple;
	bh=nsvTE3QLhDG95L1RNwMmRqY9UdhpjfL++63DMaG025I=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=UByWJ+YpS5Zx4Y0JadiNW7N93jD1SOmLKZqH/0064EAoTYmcF78JymLgJIaDdDPn/n+mUkz8XKOd5TOwTZjaJm90ZHp/wz6g/vAt4jjbrZ9l9h+c6bxb2Zd5/6P7I1hshRt+VSh7akzNU0upTdOakaCvg70I2jX5jCdS7c0ZVOg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZXvb8iSL; arc=none smtp.client-ip=74.125.82.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZXvb8iSL"
Received: by mail-dy1-f179.google.com with SMTP id 5a478bee46e88-35b2c599f43so3093038eec.0
        for <linux-sound@vger.kernel.org>; Tue, 13 Oct 2026 11:37:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791916670; x=1792521470; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=QLO9xbCj4qAudpwqZJ8vbAOb01A4NikIR3400ncUVOw=;
        b=ZXvb8iSLKHoRJiX3ImqrUHiaOwWilcc+AqCoJMZmUGsK65bVJiT0rr1nddFeGfQr68
         6vNimC/nUM83GAoyyptg17f3G3QLzAZAxEzu0nX+mmbg1BpcXdfnPeBzbUP+Om9CkjHj
         rdJyTyh0laiSmgTiGo3nj0H+kJ7XBPSop+i4MmP/EpXF8+W337zxayVyXhSEZF0GR55N
         b+JD52CvzwXEcAk+OkaGGgKA0amPYyOgeIG/PKvateslOIiya3m5gtGGaRXtd5B3iWGf
         kwJxTR2VqH6GhLQKF8uASnh6NVS/mn25Pn//8pqgFWb17wSdPcU6rSX9xQk15fHBW7vd
         hE4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791916670; x=1792521470;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=QLO9xbCj4qAudpwqZJ8vbAOb01A4NikIR3400ncUVOw=;
        b=1qfR2ZewiomFdwOFvswqbtH5x1RmiUlxKcSlSeItp0AbRYy1MXB/RmKqHFSl+86PfN
         mwTb3uUzML5VqekpXv8n9yiki8EdsiJAKzqymW9P/Kc6Ap3c9WM60jZjl3lE4mR5TM6O
         cD+0CpKUi8zIv/up8b/nCZd2dguWrTN8Ajt39eqbfXP4/q4WLduAFuCAJma3vo7k7k/V
         KRuKvs7DR5F2G+EtX9jmgX6D1zhSu4sVDf864CJijH6BdrBF03f3MKE6ZSTK6m2zOuBZ
         at0fAI51n2jf4f7GKa1osM+gBp+EIhWTEtIsi/JV0qe05+YWy4QB+D57uZkAlgMcOyZV
         Dfng==
X-Gm-Message-State: AFq9FYJVTyGWZU1PpbWLuMKJJnHetZadV6/CBUX3qdkGX7PRNXD5j8nN
	4+A2W5qLTuRUKQ5QrQ2PR5lPEeeq6Ebg8uXNumFas9Ot1kJx3/Gi8Vxu
X-Gm-Gg: AYBFou1Q0CTi7AEhSgZDBhpr1da+Xr9DtA3oOYBBcMajFHo70XoBlk1OJwK+8yNYeyk
	MygyFS1o7gPI19J8urOb2Calqhbpw1vF/6SMzWAFqU78l9O58im2dKSDcuzpbo1UTUpMxZ6B78Y
	COqZuhHrZh+4ZF3n9u0wzxaF6odVdWwBqMilyM4TMw08YmwcgB3NKgNcws7z8jd/RTBTSUeORDf
	JiIdRZqlXyhpJeleZ7cmbspil6hgjgTPlyvTqjmVhd0ZsZNOR5dKaHxCRQOaIsL9FZkjYs54Btm
	f0XgOu5M1CZLnYLEppI0Md7NJF8Gh/A8WTS+AkNBqELGuLaxgS5/1w6B6n/IpjA7/niaqnZSD8N
	Ramup4Px9OFkQPLLhi8EwxHt0WCpK0S9adxvks/3KIMA9tMVbfflO2Prm/n3oBw1mgCvnMMPZSG
	vGd+9THjGLcVAaiKJQ4kqQSA3io6Trmm0knzbUS5Wr5nJR4cG9RBjlfhAhzYszPh/D+536mvb7i
	A==
X-Received: by 2002:a05:7300:ea83:b0:359:8540:19d1 with SMTP id 5a478bee46e88-35985401c49mr9955558eec.15.1791916670286;
        Tue, 13 Oct 2026 11:37:50 -0700 (PDT)
Received: from linmach ([182.156.30.23])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3537cab27d5sm50404070eec.17.2026.10.13.11.37.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Oct 2026 11:37:49 -0700 (PDT)
From: Aayush Kumar <aayushkmx@gmail.com>
To: perex@perex.cz,
	tiwai@suse.com
Cc: linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Aayush Kumar <aayushkmx@gmail.com>
Subject: [PATCH] ALSA: hda/realtek: Fix speaker and mic mute LEDs on IdeaPad Pro 5 14IAH10
Date: Wed, 14 Oct 2026 00:07:42 +0530
Message-ID: <20261013183742.56071-1-aayushkmx@gmail.com>
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
 sound/hda/codecs/realtek/alc269.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/sound/hda/codecs/realtek/alc269.c b/sound/hda/codecs/realtek/alc269.c
index be5482530..44652fc43 100644
--- a/sound/hda/codecs/realtek/alc269.c
+++ b/sound/hda/codecs/realtek/alc269.c
@@ -4285,6 +4285,7 @@ enum {
 	ALC295_FIXUP_HP_OMEN,
 	ALC285_FIXUP_HP_SPECTRE_X360,
 	ALC287_FIXUP_IDEAPAD_BASS_SPK_AMP,
+	ALC287_FIXUP_IDEAPAD_BASS_SPK_AMP_LED,
 	ALC623_FIXUP_LENOVO_THINKSTATION_P340,
 	ALC255_FIXUP_ACER_HEADPHONE_AND_MIC,
 	ALC236_FIXUP_HP_LIMIT_INT_MIC_BOOST,
@@ -6435,6 +6436,12 @@ static const struct hda_fixup alc269_fixups[] = {
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
@@ -8215,6 +8222,8 @@ static const struct hda_quirk alc269_fixup_tbl[] = {
 	SND_PCI_QUIRK(0x17aa, 0x3827, "Ideapad S740", ALC285_FIXUP_IDEAPAD_S740_COEF),
 	SND_PCI_QUIRK(0x17aa, 0x3834, "Lenovo IdeaPad Slim 9i 14ITL5", ALC287_FIXUP_YOGA7_14ITL_SPEAKERS),
 	SND_PCI_QUIRK(0x17aa, 0x383d, "Legion Y9000X 2019", ALC285_FIXUP_LEGION_Y9000X_SPEAKERS),
+	HDA_CODEC_QUIRK(0x17aa, 0x3914, "Lenovo IdeaPad Pro 5 14IAH10",
+			ALC287_FIXUP_IDEAPAD_BASS_SPK_AMP_LED),
 	SND_PCI_QUIRK(0x17aa, 0x3843, "Lenovo Yoga 9i / Yoga Book 9i", ALC287_FIXUP_LENOVO_YOGA_BOOK_9I),
 	/* Yoga Pro 7 14IMH9 shares PCI SSID 17aa:3847 with Legion 7 16ACHG6;
 	 * use codec SSID to distinguish them
-- 
2.56.0

