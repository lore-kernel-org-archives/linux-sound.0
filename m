Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 904742DCBEC;
	Tue,  3 Mar 2026 08:15:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.31.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772525749; cv=none; b=KoXDmQLzZ3Q/sfH/kzomeV1LgV9GPztY2TTIvUH83PHFLjZyGryEq8gUS3Xpdyp/9V69TCCDZst77ea2P/t8MJHJdkze7/8+j4FijNzzx9roMDZb+7X2TsFH/Dlfs3tRxOmeFz0/2POJf73bnAnSlU6p5D3IA7mavbTvQz/2hz0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772525749; c=relaxed/simple;
	bh=ThugDXz9ZHKfz5xjoh8rHYY/sh1nRkAOKe3iP/ThHIY=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=QrcjqgvjcWtj5xSejmR6lIXDxScaqnjJ9sE9mt1e9Fyg7a3UxTfgHbFZmx9rDWzuWqw8uLEtQ0821bVINOhSR02M9HFqBB151v3xqOD1QjWSvSAzJvkoaUFrpSMzuFQCfBdB4k5lTuppv5di8t6cZJpqBYNrSGb1uCTwdM+zJeo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=CRVcBIRV; arc=none smtp.client-ip=220.197.31.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="CRVcBIRV"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version; bh=OH
	4o5a/EeVRDLqkgqfdJqAntx2LdCdqZPQWIXhcL4dQ=; b=CRVcBIRVbJsV5PZ1HK
	AoGLssEocrJhuqLPgYdOG9l6CFMwsOBQB/f3VctGaL05UwGqgAmhUaE5aDvCeFpg
	pbUUxBVXtzHm584qYNqJ+hhNqcrUECHZdHfBjASBgcUqqP2oBF0R/QA9yiTgQJJg
	4mjZPD30qGhKruz04fs81+RPo=
Received: from localhost.localdomain (unknown [])
	by gzga-smtp-mtada-g0-1 (Coremail) with SMTP id _____wCnzByWmKZp_JI3Ng--.28869S2;
	Tue, 03 Mar 2026 16:15:19 +0800 (CST)
From: wangdich9700@163.com
To: bo.liu@senarytech.com,
	perex@perex.cz,
	tiwai@suse.com
Cc: linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	wangdicheng <wangdicheng@kylinos.cn>
Subject: [PATCH v2] ALSA: hda/senary: Ensure EAPD is enabled during init
Date: Tue,  3 Mar 2026 16:15:16 +0800
Message-Id: <20260303081516.583438-1-wangdich9700@163.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:_____wCnzByWmKZp_JI3Ng--.28869S2
X-Coremail-Antispam: 1Uf129KBjvJXoW7Kw48XryrGw1Duw48XrykAFb_yoW8WF15pF
	n7Cay5KF98JF4vyr4rGw18ua45uas5WF43Jay5Kw15JFs0yryrt3W8K3srt3W5JrZ0k3Wa
	vF1IvFZrt3s8AF7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07jOZ2-UUUUU=
X-CM-SenderInfo: pzdqwv5lfkmliqq6il2tof0z/xtbCwBdPnmmmmJcu4QAA3J

From: wangdicheng <wangdicheng@kylinos.cn>

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

v1->v2:
Change the email address to be consistent with the Signed-off-by line.

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

