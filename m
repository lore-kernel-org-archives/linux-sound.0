Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D019B20A5C4;
	Thu,  5 Mar 2026 03:28:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=117.135.210.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772681287; cv=none; b=HRiBCRAzyAPRqVs9JrhfZ3GXbkkUCIlvzaOsgaN6jPSJJgAeJbUaroK6u0dILETIi3QFvUBlPiKm8zKYAzn6FTv8KUs4DTXViBn03BuQks605151i8tku+sNsUOVQbrtywf+AEph1V/5zGhpDxDXNc0BSLxiPIa1eDdUMILFIdY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772681287; c=relaxed/simple;
	bh=Y3JQojRhnTMufX7PcZ43HrlyAzhXECd/28w2+2P7enk=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=mFn79QkFQziZF2qBX1bHCpbYYvso9aaowkFzHeU7ZXnFFpjNYmgfA3bkolNYhFFPRRcXudXDuFP1bjOSAbMMGa/xpXNueDxJYkLL7FBwRqSkQMk+gDVMvX5Wkdl6L5Ik9aNDtqUAgUoXQsixW52P7dU034BhYU+VzVcxNg+YZt8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=mfVXkyMl; arc=none smtp.client-ip=117.135.210.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="mfVXkyMl"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version; bh=AU
	fbSAxfaQl7VFN5Lm12j0LZS6RJJTwepQJIlCvd5JY=; b=mfVXkyMl98mFr1Pct0
	VjvULSMKiVyETmri1mbMYr4QbVNN4KoLSGkPTLQZO+aMsZamJnCp8afXnEJTsEOf
	Mrv9pw5TfI/2r1FXO2fOg3ONE6CKNvUJF1cljW/01ZNN9rNa5SU1fUNNtJGfnTq5
	+82jEa+4k/KyiWzMzvU/xJMJQ=
Received: from localhost.localdomain (unknown [])
	by gzsmtp3 (Coremail) with SMTP id PigvCgBnP+ov+KhpKrvFRQ--.160S2;
	Thu, 05 Mar 2026 11:27:45 +0800 (CST)
From: wangdich9700@163.com
To: bo.liu@senarytech.com,
	perex@perex.cz,
	tiwai@suse.com
Cc: linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	wangdicheng <wangdicheng@kylinos.cn>
Subject: [PATCH 3/4] ALSA: hda/senary: Add dynamic EAPD control via playback hook
Date: Thu,  5 Mar 2026 11:27:41 +0800
Message-Id: <20260305032741.236048-1-wangdich9700@163.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:PigvCgBnP+ov+KhpKrvFRQ--.160S2
X-Coremail-Antispam: 1Uf129KBjvJXoWxJrWkXrWrZF47CF4xAFy8Grg_yoW8KFykpF
	15Ga45tFZxJFyIkr4fGw15A3WYga4rWF43t34aya43uF4DtrykXa10q34I9FyrAryIg3Wa
	vF42qFy8G3yDArUanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07jOAwsUUUUU=
X-CM-SenderInfo: pzdqwv5lfkmliqq6il2tof0z/xtbC5xHOHmmo+DGPwwAA3i

From: wangdicheng <wangdicheng@kylinos.cn>

To reduce power consumption and eliminate static noise during idle,
this patch introduces dynamic EAPD switching. It hooks into the PCM
playback stream to turn EAPD on only when audio is playing and off
when the stream stops.

Signed-off-by: wangdicheng <wangdicheng@kylinos.cn>
---
 sound/hda/codecs/senarytech.c | 37 +++++++++++++++++++++++++++++++++++
 1 file changed, 37 insertions(+)

diff --git a/sound/hda/codecs/senarytech.c b/sound/hda/codecs/senarytech.c
index 8ebd974817ac..c589b3b01171 100644
--- a/sound/hda/codecs/senarytech.c
+++ b/sound/hda/codecs/senarytech.c
@@ -132,6 +132,36 @@ static void senary_init_verb(struct hda_codec *codec)
 	snd_hda_override_pin_caps(codec, 0x19, 0x2124);
 }
 
+static void senary_set_port_eapd(struct hda_codec *codec, hda_nid_t nid, bool enable)
+{
+	unsigned char port_eapd = 0, eapd_value = enable << 1;
+
+	port_eapd = snd_hda_codec_read(codec, nid, 0, 0xf0c, 0x0);
+	if (port_eapd != eapd_value)
+		snd_hda_codec_write(codec, nid, 0, 0x70c, eapd_value);
+}
+
+static void senary_playback_hook(struct hda_pcm_stream *hinfo,
+		struct hda_codec *codec,
+		struct snd_pcm_substream *substream,
+		int action)
+{
+	struct senary_spec *spec = codec->spec;
+	struct auto_pin_cfg *cfg = &spec->gen.autocfg;
+	int i;
+
+	switch (action) {
+	case HDA_GEN_PCM_ACT_PREPARE:
+		for (i = 0; i < cfg->speaker_outs; i++)
+			senary_set_port_eapd(codec, cfg->speaker_pins[i], true);
+		break;
+	case HDA_GEN_PCM_ACT_CLEANUP:
+		for (i = 0; i < cfg->speaker_outs; i++)
+			senary_set_port_eapd(codec, cfg->speaker_pins[i], false);
+		break;
+	}
+}
+
 static void senary_auto_turn_eapd(struct hda_codec *codec, int num_pins,
 			      const hda_nid_t *pins, bool on)
 {
@@ -270,6 +300,13 @@ static int senary_probe(struct hda_codec *codec, const struct hda_device_id *id)
 	if (err < 0)
 		goto error;
 
+	/* Register playback hook for dynamic EAPD control.
+	 * Vendor driver applies this specifically for subsystem 0x14f10101,
+	 * but we apply it broadly for SN6186 to fix noise issues.
+	 */
+	if (codec->core.vendor_id == 0x1fa86186)
+		spec->gen.pcm_playback_hook = senary_playback_hook;
+
 	/* Some laptops with Senary chips show stalls in S3 resume,
 	 * which falls into the single-cmd mode.
 	 * Better to make reset, then.
-- 
2.25.1

