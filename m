Received: from m16.mail.126.com (m16.mail.126.com [220.197.31.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FF2B299927;
	Wed,  1 Jul 2026 06:55:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.31.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782888956; cv=none; b=uYAeJvSz004/BqEIgAPNlIg5Waf/SYjURVVRQppHaSkNQhVmF12UOnNxwkSHyREZ95z9UZ277ToZWlmdKk6mMb//65o6xgSvEWpOj6feFHow9gJSFpoop9weQb0XpgeyxJeWVdQ4Jq9vUhcAGn1zS4RpxnV/VMYZNkIu9zvCZuo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782888956; c=relaxed/simple;
	bh=AHrJOtRyPTXsqpOxlarEIZTkBKD9UtEKgNRiKhOiQQg=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=E1rWYENlK0o4q7+2kCJNYpEFQeW0tzlgCGxOw7OaAaUG8km70ZYbEFW2BFHfNDBITnYAwwPQwD/ATylsf5pQEsVC1r+b/rr01y9c+CzzZ6lArHhjD/ZNY+OrU8ZWQY/kEIpWHZN5Bn3PY0Eo9VVoXHpt3m0NGyTUWL3Pn+L/2Qg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=126.com; spf=pass smtp.mailfrom=126.com; dkim=pass (1024-bit key) header.d=126.com header.i=@126.com header.b=lOfpweoY; arc=none smtp.client-ip=220.197.31.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=126.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=126.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=126.com header.i=@126.com header.b="lOfpweoY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=126.com;
	s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version; bh=so
	nrMvJLK/amL5eQ+ccEO4MK0O5mP8xkijg2XDChhWc=; b=lOfpweoY33x5Hamxl5
	C0Npn5aSLEC/wvrlDu/FdAgXTM8k0Zv7MzlIGYQmxEdKg5XmFJJkfcTBvx9tc4RF
	ol1pCE+1XQq62yLHlvoF7jS12gLZx6tlXkDJlXRv2lQPDFQgExyF7pXSsJ3pjeGP
	u4Oidpu9HnvruPOnRraP9tJEU=
Received: from localhost.localdomain (unknown [])
	by gzsmtp3 (Coremail) with SMTP id PikvCgD3v5znuURqgJOrCA--.16176S2;
	Wed, 01 Jul 2026 14:55:36 +0800 (CST)
From: dengxiang <os_dengxiang82@126.com>
To: tiwai@suse.com,
	bo.liu@senarytech.com
Cc: linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	alsa-devel@alsa-project.org,
	dengxiang <os_dengxiang82@126.com>
Subject: [PATCH] ALSA: hda/conexant: Fix microphone mute after power-on reboot
Date: Wed,  1 Jul 2026 14:55:33 +0800
Message-Id: <20260701065533.72517-1-os_dengxiang82@126.com>
X-Mailer: git-send-email 2.39.5
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:PikvCgD3v5znuURqgJOrCA--.16176S2
X-Coremail-Antispam: 1Uf129KBjvJXoW7WF4DWFy8Ar15JF4rAr4kCrg_yoW8CFy5pF
	1aga4rKrs3t3WIk3yft3y8A3WrKryruFs3tw1xt3WSgr4Sqry7W3WxZFy8ZFyrCFZF9ry7
	XF42gry8G3y7A3JanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07UROJOUUUUU=
X-CM-SenderInfo: xrvbvv5qj0xtdqjyjqqrswhudrp/xtbBoQhUDGpEuehinQAA3x

Some devices have mute settings in their firmware set by the factory.
This is to stop popping noise when the devices turn on. But this setting
makes the microphones unable to record sound properly. This patch
solves this problem and is compatible with conexant chips.

Signed-off-by: dengxiang <os_dengxiang82@126.com>
---
 sound/hda/codecs/conexant.c | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/sound/hda/codecs/conexant.c b/sound/hda/codecs/conexant.c
index 3d92262763f6..3229f9ef5969 100644
--- a/sound/hda/codecs/conexant.c
+++ b/sound/hda/codecs/conexant.c
@@ -1184,6 +1184,24 @@ static void add_cx5051_fake_mutes(struct hda_codec *codec)
 	spec->gen.dac_min_mute = true;
 }
 
+static void cxt_fixed_mic_boost(struct hda_codec *codec, hda_nid_t node_id)
+{
+	struct conexant_spec *spec = codec->spec;
+	unsigned int value = 0;
+
+	value = snd_hda_codec_read(codec, node_id, 0, AC_VERB_GET_AMP_GAIN_MUTE, 0);
+	snd_hda_codec_amp_stereo(codec, node_id, HDA_INPUT, 0, HDA_AMP_VOLMASK, value);
+}
+
+static void cxt_capture_hook(struct hda_pcm_stream *hinfo,  struct hda_codec *codec,
+			       struct snd_pcm_substream *substream, int action)
+{
+	struct conexant_spec *spec = codec->spec;
+	hda_nid_t mux_pin = spec->gen.imux_pins[spec->gen.cur_mux[0]];
+
+	cxt_fixed_mic_boost(codec, mux_pin);
+}
+
 static int cx_probe(struct hda_codec *codec, const struct hda_device_id *id)
 {
 	struct conexant_spec *spec;
@@ -1271,6 +1289,9 @@ static int cx_probe(struct hda_codec *codec, const struct hda_device_id *id)
 	if (err < 0)
 		goto error;
 
+	if (spec->gen.pcm_capture_hook == NULL)
+		spec->gen.pcm_capture_hook = cxt_capture_hook;
+
 	/* Some laptops with Conexant chips show stalls in S3 resume,
 	 * which falls into the single-cmd mode.
 	 * Better to make reset, then.
-- 
2.39.5

