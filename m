Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6308A340A59;
	Tue, 28 Apr 2026 08:05:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.31.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777363551; cv=none; b=fD1+iDSD17jOLg81PPjvQyTJk6oTqIxoMwgqHYiUXlRX86NFO4fvi7h1sRAPXImH6n21J6G9zWKV2RQu96V1skGk28YxBzMTqQxoN+8M+RhrBle68RlqMMqqqByp04uHSFceyGlH36GWWbaZ/tINvY56PEivm7lrk5rv3yekKk0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777363551; c=relaxed/simple;
	bh=MSNGniOg8caUHapSWb6qVKePj1Pttht3yNcd8qlt9wU=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=MdTwmdaDUDSK0cuC1NB3OEijzxCsYkOxrj/HJhM/+rZWAFyMX2VxL7sGN7gmn7V5c2BPpgjpQD4RRoM6cX9TOn9d5Pf2Ab7TOWDMb4Z8TaFsl76zrr6n0bOwzfwEPCsiMHkGh3i6IXojR9OleBLFE6NLJayV0bDAXTAiZYF8LrU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=frNPXHu1; arc=none smtp.client-ip=220.197.31.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="frNPXHu1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version; bh=Ih
	AwFagRcfWmN4mKHyd4J+Yp6aQiKbMSFvFpZToE6Sc=; b=frNPXHu1dCvw0p7i0S
	IY4t4O2MH5AgHlBUKoniDj0kGLvWeIyfFPyQQP5r4Mm7tFN6wNfcq7d5Xls4DPPR
	febADlyEP+2KKAor6jqG60tqWFtk6IwLm0OzZ7C0PHQnth1SmcD8PPXhGzuxp0i1
	nU7pwH+PVB9GZAym8ROqvcEDE=
Received: from localhost.localdomain (unknown [])
	by gzga-smtp-mtada-g0-3 (Coremail) with SMTP id _____wCHTwYkavBpamoNCQ--.34861S2;
	Tue, 28 Apr 2026 16:04:53 +0800 (CST)
From: wangdich9700@163.com
To: tiwai@suse.com,
	wangdich9700@163.com,
	bo.liu@senarytech.com
Cc: linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	alsa-devel@alsa-project.org,
	wangdicheng <wangdicheng@kylinos.cn>
Subject: [PATCH v2] ALSA: hda/conexant: Fix missing error check for jack detection
Date: Tue, 28 Apr 2026 16:04:50 +0800
Message-Id: <20260428080450.108801-1-wangdich9700@163.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:_____wCHTwYkavBpamoNCQ--.34861S2
X-Coremail-Antispam: 1Uf129KBjvJXoW7CFyUJFykKw4fJr47WF18Grg_yoW8Zrykpr
	yUua4rK39xKayI9F4xKr1xC3WFkFWruFW5C3ykK3WYvr45JF18Wa4qq34UtayfC39YkF17
	ZF42q34UJFW5ZFJanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0ztYLJbUUUUU=
X-CM-SenderInfo: pzdqwv5lfkmliqq6il2tof0z/xtbCvwU6iWnwaiX5wgAA3k

From: wangdicheng <wangdicheng@kylinos.cn>

In cx_probe(), the return value of snd_hda_jack_detect_enable_callback()
is ignored. This function returns a pointer, and if it fails (e.g., due
to memory allocation failure), it returns an error pointer which must
be checked using IS_ERR().

If the registration fails, the driver continues to probe, but the jack
detection callback will not be registered. This can lead to a kernel
crash later when the driver attempts to handle jack events or accesses
the uninitialized structure.

Check the return value using IS_ERR() and propagate the error via
PTR_ERR() to the probe caller.

Fixes: 7aeb25908648 ("ALSA: hda/conexant: Fix headset auto detect fail in cx8070 and SN6140")
Signed-off-by: wangdicheng <wangdicheng@kylinos.cn>
---
v1 -> v2:
Use IS_ERR() and PTR_ERR() to handle pointer return value.
Add Fixes tag.

 sound/hda/codecs/conexant.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/sound/hda/codecs/conexant.c b/sound/hda/codecs/conexant.c
index 3a9717df39b4..e3b6aaabe3a9 100644
--- a/sound/hda/codecs/conexant.c
+++ b/sound/hda/codecs/conexant.c
@@ -1175,6 +1175,7 @@ static void add_cx5051_fake_mutes(struct hda_codec *codec)
 static int cx_probe(struct hda_codec *codec, const struct hda_device_id *id)
 {
 	struct conexant_spec *spec;
+	struct hda_jack_callback *callback;
 	int err;
 
 	codec_info(codec, "%s: BIOS auto-probing.\n", codec->core.chip_name);
@@ -1190,7 +1191,12 @@ static int cx_probe(struct hda_codec *codec, const struct hda_device_id *id)
 	case 0x14f11f86:
 	case 0x14f11f87:
 		spec->is_cx11880_sn6140 = true;
-		snd_hda_jack_detect_enable_callback(codec, 0x19, cx_update_headset_mic_vref);
+		callback = snd_hda_jack_detect_enable_callback(codec, 0x19,
+				cx_update_headset_mic_vref);
+		if (IS_ERR(callback)) {
+			err = PTR_ERR(callback);
+			goto error;
+		}
 		break;
 	}
 
-- 
2.25.1

