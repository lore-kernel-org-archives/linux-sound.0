Received: from mail-vk1-f181.google.com (mail-vk1-f181.google.com [209.85.221.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 881553FBA7
	for <linux-sound@vger.kernel.org>; Mon, 22 Jun 2026 17:23:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782148993; cv=none; b=OL5VaosnkgwVavNSeoiTJnLyU0wmRGMEzbK9mFX+bS1dNppwHrhno6ruWZYArtLKzLoGlpP7YtL5edJZOuh5m5lhfesNmTHFYRVeb4AdigAQwOHIGHcHrXzAbJ2yxZb3zeQEGGO1NMXgXXUchsmZPo0tXrXpy/tlxnDOZOdkIiY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782148993; c=relaxed/simple;
	bh=s3DCk2nSPhGdamywHJj/0QOpHawEGOE2CuHvZeIfXwM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Lp8FOm5JtjaG9kjUfn7U2wIUrbtQ6o8yIGpGIQ8tnFv7msPvD3LqfLQE5MVKS+HA5TJI2jFjngDBxpqZgYD3hVzVOWXNZCQ9n5m/3vaDmrcC7sdnuOM/tYeUnaZzfQqgxrnzjdLTM9Veq+8AKYjO28lpFIPb/qcV0NZpjm1oAdE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cgCiq594; arc=none smtp.client-ip=209.85.221.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cgCiq594"
Received: by mail-vk1-f181.google.com with SMTP id 71dfb90a1353d-59e8ededf4dso3380484e0c.2
        for <linux-sound@vger.kernel.org>; Mon, 22 Jun 2026 10:23:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782148991; x=1782753791; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ilyD2/lntc7caZ4LBcZRMcbmWrmeEmT3T4R7C1iL+dg=;
        b=cgCiq594P1XR/Lr+Bz67tq14BQiKAAaIi6diplMthkiZzwy2lQXNJBQ1G3+Vw7uXoJ
         1hH/kAdm7qn0abg+/pm/nP18XGl2EGPQKK4LqSLYYQ0SJf0FK4xdpLyPbrqYYzPUgtjT
         /U2BU/cp3WO5v/1XuB076eLAvw+jZkNFkBqqkrl9AKQZFsEVOsbIW2PEHhaa2AtiFvso
         C8awdsyiwIaM6hZOJCSepXfYtNxk9qdiw/+ov/e54PwOydqQPXNFVJf3mpyV7UM1buDi
         D23JS48xr84XTixs5x3sU+EDhcVeA5OL2GvcEstbozaocudybB/mfHgfl/iUF1gMfzeI
         xlRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782148991; x=1782753791;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ilyD2/lntc7caZ4LBcZRMcbmWrmeEmT3T4R7C1iL+dg=;
        b=Y24JnxUIv6zPKg4u++bAFqTEF7qq4DKwGdsskTJ2XZwQr185rzer0Xoht/6QdNBUFT
         i/n7Y9SymJSizg1Vha5W1LQobAykHE+5DIIAsCZQtnojW6P+3kFJWFSVy8KCymzZqr8U
         dE2J/WoGkW7Yi5jF8XZI2Ld3r2v5C+mJxvvlsYA4WHdQWKcItjqfrDf0OZ87DTIy+WFC
         Q8/y1LvUu6ajZuNa9cubWOxH31d8XYy2NiU4ukj2MOONhGR1rFKyhliLh372R5Kubeu+
         evuNBXx6RqUBChstmYHmNmAriiJSN6RZdq1Hh3Ljhn4NUw0Pp2/Z36TYvsBIZa4Ia8IV
         SzyA==
X-Gm-Message-State: AOJu0Yzl0HxHpHDezmuEyD1RSgAFojYaZSRjuxyKP14R2gqbK7oiljl6
	b97p9BGydv56dxPrxEYjhQVlEnZ7rQM+7KRi5HXUJvoXqq7u8ytRMagt
X-Gm-Gg: AfdE7cm+c4uv3Qvul0rP2ISYu6sJ4nlwvCWWoZZSZwhqKpIEMqRToCc6ErGwhrmm0xi
	AzuEH9DQiGx2IVJpqp77MQ+Gvp0eEP6dDBWNE6fZeCeKNXPSsXnFzdcQufNu3R3oZBNR1eZI0qA
	G/x3njnZL4E/QN+1BI6gOh/WUbtdY2KW7OMi/48or4sYAnrhPpD+ZheruIjgOe/m5tpMpvHn9ER
	p5YOmCNFVY7ulB8pK6U22cySER66pMauaN/BGdaxrIGL65Tzbi3UmhTlead43PRmU5suSFW3rJT
	Ymgeag2Abcytkb3yB/yXk0sdN+gBKBaFFTbwFs0Ed8Dx/XY1yR0v4cisHYSkgGyVzYMc8l6tgXL
	bI+KzMM15C4gPe7MTHnoESyeYWmdp6JkFssBecFZrgqSMlF0/elmDj/DVyf7QeFsgOOZGE4dcrm
	DWlqJycxhFBt1X0TgW1LBzecjBXPZecCsBeoNtyxJGDMMyTRul7/X5yX703RVVgevB5lL2BHLNe
	QjXtT9QZa0mMKBJJVzLuZ4OxdOI0Am8Xmi+KtUkFg==
X-Received: by 2002:a05:6122:3784:b0:5a0:5805:c88e with SMTP id 71dfb90a1353d-5bbee4b8fe6mr8458654e0c.2.1782148991312;
        Mon, 22 Jun 2026 10:23:11 -0700 (PDT)
Received: from kamlesh-Legion-7-16IAX7.fios-router.home (pool-108-20-78-245.bstnma.fios.verizon.net. [108.20.78.245])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8df81cde303sm101506076d6.25.2026.06.22.10.23.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Jun 2026 10:23:10 -0700 (PDT)
From: Kamlesh Chhetty <kamleshkc2002@gmail.com>
To: Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	David Rhodes <david.rhodes@cirrus.com>,
	Richard Fitzgerald <rf@opensource.cirrus.com>
Cc: linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	patches@opensource.cirrus.com,
	Kamlesh Chhetty <kamleshkc2002@gmail.com>
Subject: [PATCH] ALSA: hda: Add Lenovo Legion 7i 16IAX7 17AA3874 quirk
Date: Mon, 22 Jun 2026 13:22:47 -0400
Message-ID: <20260622172247.19301-1-kamleshkc2002@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Lenovo Legion 7i 16IAX7 systems with Realtek ALC287 codec SSID
17aa:3874 and CSC3551/CS35L41 speaker amps do not provide the
required CS35L41 _DSD properties in ACPI.

Without a quirk, cs35l41-hda fails probing the amps with missing
cirrus,dev-index / Platform not supported errors, leaving the built-in
speakers silent.

This model is similar to the already-supported 17AA386F Legion 7i
16IAX7 variant. Add the Realtek ALC287 quirk to select
ALC287_FIXUP_CS35L41_I2C_2 and add 17AA3874 to the CS35L41 property
table using the same two-amp external-boost configuration.

Tested on a Lenovo Legion 7 16IAX7 with Ubuntu 7.0.0-22-generic. Both
CSC3551 CS35L41 amps probe and bind, firmware loads, calibration
applies, built-in speaker playback works, and the cirrus,dev-index
failure is gone.

Closes: https://bugzilla.kernel.org/show_bug.cgi?id=221663
Link: https://bugs.launchpad.net/ubuntu/+source/linux/+bug/2157060
Signed-off-by: Kamlesh Chhetty <kamleshkc2002@gmail.com>
---
 sound/hda/codecs/realtek/alc269.c                   | 1 +
 sound/hda/codecs/side-codecs/cs35l41_hda_property.c | 2 ++
 2 files changed, 3 insertions(+)

diff --git a/sound/hda/codecs/realtek/alc269.c b/sound/hda/codecs/realtek/alc269.c
index 45f9d64..2a27b72 100644
--- a/sound/hda/codecs/realtek/alc269.c
+++ b/sound/hda/codecs/realtek/alc269.c
@@ -7632,6 +7632,7 @@ static const struct hda_quirk alc269_fixup_tbl[] = {
 	HDA_CODEC_QUIRK(0x17aa, 0x38a8, "Legion Pro 7 16ARX8H", ALC287_FIXUP_TAS2781_I2C), /* this must match before PCI SSID 17aa:386f below */
 	SND_PCI_QUIRK(0x17aa, 0x386f, "Legion Pro 7i 16IAX7", ALC287_FIXUP_CS35L41_I2C_2),
 	SND_PCI_QUIRK(0x17aa, 0x3870, "Lenovo Yoga 7 14ARB7", ALC287_FIXUP_YOGA7_14ARB7_I2C),
+	SND_PCI_QUIRK(0x17aa, 0x3874, "Legion 7i 16IAX7", ALC287_FIXUP_CS35L41_I2C_2),
 	SND_PCI_QUIRK(0x17aa, 0x3877, "Lenovo Legion 7 Slim 16ARHA7", ALC287_FIXUP_CS35L41_I2C_2),
 	SND_PCI_QUIRK(0x17aa, 0x3878, "Lenovo Legion 7 Slim 16ARHA7", ALC287_FIXUP_CS35L41_I2C_2),
 	SND_PCI_QUIRK(0x17aa, 0x387d, "Yoga S780-16 pro Quad AAC", ALC287_FIXUP_TAS2781_I2C),
diff --git a/sound/hda/codecs/side-codecs/cs35l41_hda_property.c b/sound/hda/codecs/side-codecs/cs35l41_hda_property.c
index 16d5ea7..dd8875b 100644
--- a/sound/hda/codecs/side-codecs/cs35l41_hda_property.c
+++ b/sound/hda/codecs/side-codecs/cs35l41_hda_property.c
@@ -123,6 +123,7 @@ static const struct cs35l41_config cs35l41_config_table[] = {
 	{ "17AA3866", 2, EXTERNAL, { CS35L41_LEFT, CS35L41_RIGHT, 0, 0 }, 0, -1, -1, 0, 0, 0 },
 	{ "17AA386E", 2, EXTERNAL, { CS35L41_LEFT, CS35L41_RIGHT, 0, 0 }, 0, 2, -1, 0, 0, 0 },
 	{ "17AA386F", 2, EXTERNAL, { CS35L41_LEFT, CS35L41_RIGHT, 0, 0 }, 0, -1, -1, 0, 0, 0 },
+	{ "17AA3874", 2, EXTERNAL, { CS35L41_LEFT, CS35L41_RIGHT, 0, 0 }, 0, -1, -1, 0, 0, 0 },
 	{ "17AA3877", 2, EXTERNAL, { CS35L41_LEFT, CS35L41_RIGHT, 0, 0 }, 0, -1, -1, 0, 0, 0 },
 	{ "17AA3878", 2, EXTERNAL, { CS35L41_LEFT, CS35L41_RIGHT, 0, 0 }, 0, -1, -1, 0, 0, 0 },
 	{ "17AA38A9", 2, EXTERNAL, { CS35L41_LEFT, CS35L41_RIGHT, 0, 0 }, 0, 2, -1, 0, 0, 0 },
@@ -548,6 +549,7 @@ static const struct cs35l41_prop_model cs35l41_prop_model_table[] = {
 	{ "CSC3551", "17AA3866", generic_dsd_config },
 	{ "CSC3551", "17AA386E", generic_dsd_config },
 	{ "CSC3551", "17AA386F", generic_dsd_config },
+	{ "CSC3551", "17AA3874", generic_dsd_config },
 	{ "CSC3551", "17AA3877", generic_dsd_config },
 	{ "CSC3551", "17AA3878", generic_dsd_config },
 	{ "CSC3551", "17AA38A9", generic_dsd_config },
-- 
2.53.0

