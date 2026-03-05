Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41C0D27AC45;
	Thu,  5 Mar 2026 03:27:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.31.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772681279; cv=none; b=Kkw/fZA+Spgn2zGH3Tj5GhHuqz25cLw2WAqy1qlnvnZfdcpiPg+Z20RK9ke+K/Mny2CxfKenQNt2BMDjICz1q00wqAnk9aKl0C5uhO8TjOqv51kvneSXSh0Cu3XFQmo7j4p8GV1gYYQmlX0rltGTi4BS5/PY7LLsDQLRAHfdGdg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772681279; c=relaxed/simple;
	bh=6iz+31sKnI9/uHau4WZGXwKLAJHOclQD2RVyaWNwHbk=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=pD3Mgds7tn/irRgB54hInx5llx25Br/KXLr4u7k0Ed/b4a5YlNOHQpKUl5flqvhAI+gHSimEWKMMca9ZSI9dlm0gMn0GJYlIjpgkrvmzcACqY/s2zDHU/ammXv3ij0ha1gauy6wvWeMbBa1/18I9QJTG+NUcmfRXi2MZDQGlRzY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=dNG+O4Jk; arc=none smtp.client-ip=220.197.31.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="dNG+O4Jk"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version; bh=tg
	5qLINnaj6HmZI/tZ8PfCC8mV5TjsPLIHhyvU9g5gE=; b=dNG+O4Jkx6o3f49Kz2
	G+k+IG2n02LzMsjT82G4CxgQzpGmKxa3/TAHN/VAtMYVmkgW9JDm88LBtFYqL/nN
	vUvTCuTFbxrcfMFUv5UlFcC0DX7DQcU9Wn18S92XqE/OIrpjThkhx4/lNx43CdXK
	MEkxqTx4WnMnz110mGUAF51IQ=
Received: from localhost.localdomain (unknown [])
	by gzsmtp1 (Coremail) with SMTP id PCgvCgCH7+Yh+KhpZ7J6QQ--.537S2;
	Thu, 05 Mar 2026 11:27:31 +0800 (CST)
From: wangdich9700@163.com
To: bo.liu@senarytech.com,
	perex@perex.cz,
	tiwai@suse.com
Cc: linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	wangdicheng <wangdicheng@kylinos.cn>
Subject: [PATCH 2/4] ALSA: hda/senary: Implement proper resume callback
Date: Thu,  5 Mar 2026 11:27:28 +0800
Message-Id: <20260305032728.235630-1-wangdich9700@163.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:PCgvCgCH7+Yh+KhpZ7J6QQ--.537S2
X-Coremail-Antispam: 1Uf129KBjvJXoW7ur1ktrW5Ar15Zr18GF4kZwb_yoW8WryDpF
	4kAryrKF43tF42yr48Gw48C3WFga4ruFW5J345t3W3CFn0krykA3W0qFyUZay5CrWfC3W2
	qF4jv34UJa9FyF7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07jO2-nUUUUU=
X-CM-SenderInfo: pzdqwv5lfkmliqq6il2tof0z/xtbC6APKGmmo+COM0QAA38

From: wangdicheng <wangdicheng@kylinos.cn>

The SN6186 codec requires register re-synchronization after resume from
S3 state. The current driver lacks a resume callback, which may lead to
loss of hardware state or audio malfunction after system resume.

This patch adds a resume callback that:
1. Syncs the regcache to restore register values.
2. Re-applies the vendor-specific hardware init verbs.
3. Reports jack status to update the audio path.

Signed-off-by: wangdicheng <wangdicheng@kylinos.cn>
---
 sound/hda/codecs/senarytech.c | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/sound/hda/codecs/senarytech.c b/sound/hda/codecs/senarytech.c
index f9a389df3a17..8ebd974817ac 100644
--- a/sound/hda/codecs/senarytech.c
+++ b/sound/hda/codecs/senarytech.c
@@ -205,6 +205,18 @@ static int senary_suspend(struct hda_codec *codec)
 	return 0;
 }
 
+static int senary_resume(struct hda_codec *codec)
+{
+	/* Re-sync registers */
+	regcache_sync(codec->core.regmap);
+
+	/* Re-run init verbs to restore hardware state */
+	senary_init_verb(codec);
+
+	snd_hda_jack_report_sync(codec);
+	return 0;
+}
+
 static int senary_probe(struct hda_codec *codec, const struct hda_device_id *id)
 {
 	struct senary_spec *spec;
@@ -286,6 +298,7 @@ static const struct hda_codec_ops senary_codec_ops = {
 	.init = senary_init,
 	.unsol_event = snd_hda_jack_unsol_event,
 	.suspend = senary_suspend,
+	.resume = senary_resume,
 	.check_power_status = snd_hda_gen_check_power_status,
 	.stream_pm = snd_hda_gen_stream_pm,
 };
-- 
2.25.1

