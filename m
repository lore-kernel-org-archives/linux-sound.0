Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7605C2750ED;
	Thu,  5 Mar 2026 03:28:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.31.2
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772681299; cv=none; b=sYUyYTdFmnr4OKew7e0rq/OBCBnvRZT6vgIw2zdfHKqK68ERJWXq2BUStykLVGKQHOomnavfgReLphyrwRKu2QIXnroJFP9AP15EX7GEg4kezVL3+v0H6GYFBf3uDQa+MnAn3FPT1zF32eTmPYWUmNiyUCsTq3neEqJXOQgn9j0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772681299; c=relaxed/simple;
	bh=0kwR3Y+faBgjuTCk96xlSef8D2ceDrvv5v+SnF1mnPY=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=rQSu41ladOqOKVsNWk/4sWZY13Qeb8aXzr51UwarEm697Q+9WbczXCAwAkau1fYnK6WT2NgBjylcKVBJ+LRayug/KL89aAUmB9emg987EwnjmyNijvTWd3M6koGtoIaKIIWU4dCFopSIK1LhKprlwSEC8uFsvtW6EPrqpufLBlk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=fH/VRJGC; arc=none smtp.client-ip=220.197.31.2
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="fH/VRJGC"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version; bh=7K
	1OiXSfuK6+xPIXkQ8bHs0jwCPe7+dmxKCKxddCH5U=; b=fH/VRJGCieSu/yGJXY
	gbs0+qA4GIEcGlMX+qJmgdv3bPq7in8Ac/DCkuhkNtPLGKKPN9ybLPzQnftxtA4v
	gW1B1rxi7eUGuUnlecX3x4qbmAG8w0FT9pNonTX6h3CXfQrkGVZM/SMcx+y40uvy
	AhD2im5dNFtjoTWS5hfmY3ShE=
Received: from localhost.localdomain (unknown [])
	by gzga-smtp-mtada-g1-4 (Coremail) with SMTP id _____wCHbq09+KhpCjh5Ow--.1630S2;
	Thu, 05 Mar 2026 11:27:58 +0800 (CST)
From: wangdich9700@163.com
To: bo.liu@senarytech.com,
	perex@perex.cz,
	tiwai@suse.com
Cc: linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	wangdicheng <wangdicheng@kylinos.cn>
Subject: [PATCH 4/4] ALSA: hda/senary: Fix microphone boost stability
Date: Thu,  5 Mar 2026 11:27:56 +0800
Message-Id: <20260305032756.236440-1-wangdich9700@163.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:_____wCHbq09+KhpCjh5Ow--.1630S2
X-Coremail-Antispam: 1Uf129KBjvJXoWxAF4rKw48KFyDJw45tF43Wrg_yoW5XFy8pF
	13ta43GFsxtF40kw4rGw4rZ3WFgas5WF43Gw4ay3W5Jrn5JryDXay0g340gF45AF9F9a43
	ZFW29rWIkwsxArUanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07jOAwsUUUUU=
X-CM-SenderInfo: pzdqwv5lfkmliqq6il2tof0z/xtbCwB7RIWmo+D7r-wAA39

From: wangdicheng <wangdicheng@kylinos.cn>

Some SN6186 platforms experience microphone gain fluctuation.
This patch adds a capture sync hook to lock the microphone boost
to a default value read during initialization, ensuring stable
recording levels.

Signed-off-by: wangdicheng <wangdicheng@kylinos.cn>
---
 sound/hda/codecs/senarytech.c | 33 +++++++++++++++++++++++++++++++++
 1 file changed, 33 insertions(+)

diff --git a/sound/hda/codecs/senarytech.c b/sound/hda/codecs/senarytech.c
index c589b3b01171..9c6bad6e3866 100644
--- a/sound/hda/codecs/senarytech.c
+++ b/sound/hda/codecs/senarytech.c
@@ -31,6 +31,7 @@ struct senary_spec {
 	unsigned int parse_flags; /* flag for snd_hda_parse_pin_defcfg() */
 
 	int mute_led_polarity;
+	unsigned char default_mic_boost[0x25];
 	unsigned int gpio_led;
 	unsigned int gpio_mute_led_mask;
 	unsigned int gpio_mic_led_mask;
@@ -162,6 +163,30 @@ static void senary_playback_hook(struct hda_pcm_stream *hinfo,
 	}
 }
 
+static void senary_fixed_mic_boost(struct hda_codec *codec, hda_nid_t nid)
+{
+	unsigned char value;
+	struct senary_spec *spec = codec->spec;
+
+	if (!spec->default_mic_boost[nid])
+		return;
+
+	value = snd_hda_codec_read(codec, nid, 0, AC_VERB_GET_AMP_GAIN_MUTE, 0);
+	if (value != spec->default_mic_boost[nid])
+		snd_hda_codec_amp_stereo(codec, nid, HDA_INPUT, 0,
+				HDA_AMP_VOLMASK, spec->default_mic_boost[nid]);
+}
+
+static void senary_cap_sync_hook(struct hda_codec *codec,
+		struct snd_kcontrol *kcontrol,
+		struct snd_ctl_elem_value *ucontrol)
+{
+	struct senary_spec *spec = codec->spec;
+	hda_nid_t nid = spec->gen.imux_pins[spec->gen.cur_mux[0]];
+
+	senary_fixed_mic_boost(codec, nid);
+}
+
 static void senary_auto_turn_eapd(struct hda_codec *codec, int num_pins,
 			      const hda_nid_t *pins, bool on)
 {
@@ -251,6 +276,7 @@ static int senary_probe(struct hda_codec *codec, const struct hda_device_id *id)
 {
 	struct senary_spec *spec;
 	int err;
+	int i;
 
 	codec_info(codec, "%s: BIOS auto-probing.\n", codec->core.chip_name);
 
@@ -307,6 +333,13 @@ static int senary_probe(struct hda_codec *codec, const struct hda_device_id *id)
 	if (codec->core.vendor_id == 0x1fa86186)
 		spec->gen.pcm_playback_hook = senary_playback_hook;
 
+	/* Initialize and fix mic boost */
+	for (i = 0; i < ARRAY_SIZE(spec->default_mic_boost); i++) {
+		spec->default_mic_boost[i] = snd_hda_codec_read(codec, i, 0,
+				AC_VERB_GET_AMP_GAIN_MUTE, 0);
+	}
+	spec->gen.cap_sync_hook = senary_cap_sync_hook;
+
 	/* Some laptops with Senary chips show stalls in S3 resume,
 	 * which falls into the single-cmd mode.
 	 * Better to make reset, then.
-- 
2.25.1

