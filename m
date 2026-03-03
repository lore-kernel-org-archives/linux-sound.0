Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED1B4375ADF;
	Tue,  3 Mar 2026 07:48:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.31.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772524139; cv=none; b=SDbjDqfZwXh0jMeVhbl8X6KtbTFIprROUE4MGv0mZF82N/OLXBudwDlZIvRUg//Jkt5Ncx9YGs2Nw2I84P9zU9iaacwMGfsKBI3fRz69kJGVWCpdyimukdtQOAyfxC4NrjYWGIGk9lhhrlFfnjb2ROieoOfKnev9oWO909xeRqs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772524139; c=relaxed/simple;
	bh=Jp9j25/H4MUTGSiN86C2tDJhyGB41RVkH6KUK5OVBAc=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=XVzwNuNJX1HjeWeOLb0MIk2Cfdm1z+mktkw9Mm9srA4NN61qWtXU5l3rWQii3VaWpEhzkAeWpD2YZ5jywSnnjWUiksAW2fSYD2f8L+n24RZ3l3j28EGw8JKG6P+6OOuHR9auHOAffj+Vbo9/Zf5nLqoedKsTD4i16f3JBs7/5Ks=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=RO032r9A; arc=none smtp.client-ip=220.197.31.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="RO032r9A"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version; bh=4C
	KV2W4wpvjS/LkcbQwknAYg1qk2zbtdHLJ8s/Fmp3Y=; b=RO032r9Av6jEmG8236
	zenVMm+ij2fjw0UdrIxAQIjP3831WbJy0zvPuY8gOI5y4ceisZ9xQnZ4oLGnbYbt
	ns/gCzHl4SI5aRjrMq5JqdZmitKiluFTAlUOCVZyzNwnSs/rZgd09vRJn31+bKtA
	0GeldPYe55nQAP8kF+PrOHnb8=
Received: from localhost.localdomain (unknown [])
	by gzsmtp2 (Coremail) with SMTP id PSgvCgDHz+hQkqZp+hzOTw--.26972S2;
	Tue, 03 Mar 2026 15:48:32 +0800 (CST)
From: wangdich9700@163.com
To: bo.liu@senarytech.com,
	perex@perex.cz,
	tiwai@suse.com
Cc: linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	wangdicheng <wangdich9700@163.com>,
	wangdicheng <wangdicheng@kylinos.cn>
Subject: [PATCH] ALSA: hda/senary: Ensure EAPD is enabled during init
Date: Tue,  3 Mar 2026 15:48:30 +0800
Message-Id: <20260303074830.546856-1-wangdich9700@163.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:PSgvCgDHz+hQkqZp+hzOTw--.26972S2
X-Coremail-Antispam: 1Uf129KBjvJXoW7Kw48XryrGw1Duw47WF4xXrb_yoW8XFWrpF
	n7Ca45KF9xJF4vyr4rGw18ua45uas5WF43Ja45Kw15JFs0kryrJ3W8K3srt3W5ArZ0k3Wa
	vF1IqFZrt3s5AF7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0zNjgsUUUUUU=
X-CM-SenderInfo: pzdqwv5lfkmliqq6il2tof0z/xtbCvxC8DGmmklCaDgAA3G

From: wangdicheng <wangdich9700@163.com>

The driver sets spec->gen.own_eapd_ctl to take manual control of the
EAPD (External Amplifier). However, senary_init does not turn on the
EAPD, while senary_shutdown turns it off.

Since the generic driver skips EAPD handling when own_eapd_ctl is set,
the EAPD remains off after initialization (e.g., after resume), leaving
the codec in a non-functional state.

Explicitly call senary_auto_turn_eapd in senary_init to ensure the EAPD
is enabled and the codec is functional.

Signed-off-by: wangdicheng <wangdicheng@kylinos.cn>
---
 sound/hda/codecs/senarytech.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/sound/hda/codecs/senarytech.c b/sound/hda/codecs/senarytech.c
index 8822d4dc5e36..6239a25bb8f3 100644
--- a/sound/hda/codecs/senarytech.c
+++ b/sound/hda/codecs/senarytech.c
@@ -25,6 +25,7 @@ struct senary_spec {
 	/* extra EAPD pins */
 	unsigned int num_eapds;
 	hda_nid_t eapds[4];
+	bool dynamic_eapd;
 	hda_nid_t mute_led_eapd;
 
 	unsigned int parse_flags; /* flag for snd_hda_parse_pin_defcfg() */
@@ -131,8 +132,12 @@ static void senary_init_gpio_led(struct hda_codec *codec)
 
 static int senary_init(struct hda_codec *codec)
 {
+	struct senary_spec *spec = codec->spec;
+
 	snd_hda_gen_init(codec);
 	senary_init_gpio_led(codec);
+	if (!spec->dynamic_eapd)
+		senary_auto_turn_eapd(codec, spec->num_eapds, spec->eapds, true);
 	snd_hda_apply_fixup(codec, HDA_FIXUP_ACT_INIT);
 
 	return 0;
-- 
2.25.1

