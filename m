Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793646261;
	b=YZLWPAM8J8+9pOLkf79y/fPdjP9/d1epMLm/h4V2DoimqweijYUPWoqsryVY6mS9X8ZS
	 o+LdIVgrfWBbQnFhmAQk4BjMteucsg5ssrvqFJHcyqar9nv2SCqL/IUnizBj0YCydxYqx
	 oPtwwSO06SfQcAkVzZFFh6KU9YsDqAW+ETJkcPoLnShwCaj/DEPuuyLbvdrzrV1B8uKah
	 8VFMP7Jo+hkWvlPkoZTlUuYiLCA6wJz8WYSKDWC614bibw4GR8D87ET7k298q3aG96/Pa
	 yoif854L4AlZBnI/oEptH5FzVs/MiyNX4BPgrHpKWwjxZHZJD+hBCqfgPRNubVIaY0g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793646261;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=M+QwIPWbbdAjBaKNUwmjBRmTqatLvbp8j/bjo+78+cQ=;
	b=p61PplgPo+/mV7xyrhiAPrqKvV5ojW344Uxne5g4N+NHSy6JF+Ilg1+B+1XB61PfxY8N
	 7RHKQ2l3Vsgx87d9hkEGYSgjGBS36vCprdcA/YU36bvOuGEUsBhoS8qBF/ctzvwV5d4ge
	 6BvVTrwUeW11ErPMjXlhEsWAk2D8NLKMLT+Y8VrVOXwp6nZx/hb/kLk2rAOQCEVDW/TBP
	 Ab6yleu6JA5/r+GFz8jPfhrMzxyIaY5AtmIqiANb850aS2sxmWIg/RlJQElB+G0PwpxIu
	 xVkFBGHtOHkf2QUnqWaJD3ErgYaXsT4aiwaaU3ccEk0G1SQ2CWcNaf/krcKyL+PLXVQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=DwF3Ax3c;
	arc=none smtp.remote-ip=209.85.128.53
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E38F606A326
	for <linux-sound@vger.kernel.org>; Mon,  2 Nov 2026 19:04:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5E38F606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=DwF3Ax3c
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4a215e64962so30235265e9.1
        for <linux-sound@vger.kernel.org>; Mon, 02 Nov 2026 11:04:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793646260; x=1794251060; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=M+QwIPWbbdAjBaKNUwmjBRmTqatLvbp8j/bjo+78+cQ=;
        b=DwF3Ax3cXHIpP2vUuVn13JpsnNcBLJ8Le9rotXxtnsFh8M7nnLoOL5L30kkwv0YRyA
         QYjdwxX0YhO514qFqoFacNj3ENZ/yV3mpbSrakDBANGo4Q8slHJ3BYG09eMwqCcfrMPp
         q4BYyPneuWGovUUIPdJYpbxxl3/mKQhaDGlnIU9DK4NE6+ferRpWGQXSuCKlin7bpjYK
         4OZ9Xz6TkkBBIZoxmP6ylRDDF3NQB347IqhaiAnPPRFm20ip2DCtEYfbWnrLj7McJ2/O
         TrO5BRjofUc6fTc6buHf5P9wgVDuZAazSmmyW8/633Larn9FnIk00cgfa9DJTO/WRU42
         Z+BA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793646260; x=1794251060;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=M+QwIPWbbdAjBaKNUwmjBRmTqatLvbp8j/bjo+78+cQ=;
        b=ckpGJR9TMVlIpSnf4KexaNYPtihPABGqCNDHt5v7pS2ceS6nsS9ek8yu1XSmjlQepg
         MntNp1sTq5yR2ZCas/dQnE9Hc7CzOfgAqC2FwRVZBbYuXMs2mNkbmDWTr0ptRimTTil+
         K/Loat+d4AjLJMKf4aGJsSl16MmHazkiG0/0sSqndp9vKc57l0FRMNl3JXCgKqsMFSbf
         PGCTga4ImvHjhBUQtCdDrObJxh05JBa1QUWWjACucxVYujBM+3d23lYbdGWKbAo8pK/G
         qNHs2ggxGhf5fnmCJ63XmgnBgo0RDBXXqN8+mGJ3yMa8fJK7iNbyTxyGcRqZbwtO0p5b
         nM/A==
X-Gm-Message-State: AFq9FYKu0JdzPhSsJ4HBr2nBGNGwXdJO1GtLZJr+GtWA4rCqYYuCqKEj
	OZMydAttOStMX24JeTmXYwKjO2J/WoOxQ7cKXtopjo1x5BNFZ2TsC5jALuFI
X-Gm-Gg: AYBFou1b9/WBodEtU/Mev3mq0B09g9gvPPamfefOv2p7YskeXBNduacMXYrPNlb4WSj
	RJyL2LqPuQ8sjIqjUeuQjwkWQPpmu2QCcOETGAWCnOqej8qV3LyyG5QBZiWcdxCm3iJWkWHjcKq
	7xNrBJjVXXvtdTKbVkPUqzkq2r8NPcO3i7emOLhEDtleN0vK+3RE/RYAcOIhwGqD2vY+aJabCwf
	AFJSahaSGME3EtQGOEg5V0p0yPl5eKAY7mcV4lTGS6O9MlU8OVYQpyq+ZUBXv8oHRU1aOUCdtVV
	6qhoTphNB+YWpSqXWdrQwHyFk+Po570C5XIeTkzJozMZOCT9UDUtnFycNQJMnpkIMdtb7sIt9of
	rk78OaHSD2gw90jUCXkl+gAPYSfEbTBWlEaBRJygL6PeWfEOHYrOD5T+RSKqR87WIn3axDd+m7d
	ePOOPZeS7iIgm4nSriixCy4IKARpnOCJpAago3985rkygx2Wkl/b/OHxSpdYmIs/emMIPsWHqwj
	mN8tpShY8yU3Sz7+0HEAQp3o0Fw0yVmOUcdVdIPvQTTd4RDH3EKVbhacG4ibo11mJNMmh3aBypZ
	Utx5nQarlJ5EKVT1d85zAkG96XV+N9Rr/zn7n42At+oLftR8oLhmucGyKtSIlM6iz3O1B1nkYGL
	zRKwvgaJCJjbFJokNOLweGu1CC1AknW2XFl+Kql6Rr3U6JLuZwDw0kQ78mDS2h6vsFs9SJGFUzR
	Wz5VBefZYR6cI+UCpsaYLLrMYA59eQVnLo+LYF4/NNoWI6Kn2OOIEj836NdW6M
X-Received: by 2002:a05:600c:3b18:b0:4a1:c5eb:b445 with SMTP id 5b1f17b1804b1-4ac1932b542mr260406925e9.35.1793646259405;
        Mon, 02 Nov 2026 11:04:19 -0800 (PST)
Received: from cachyos-x8664 ([2a02:2f0f:9208:cf00:b848:3801:1bc:d8d1])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b2a5372d8bsm8277235e9.0.2026.11.02.11.04.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 11:04:18 -0800 (PST)
From: Razvan Dinculescu <razvandinculescu@gmail.com>
To: Takashi Iwai <tiwai@suse.com>,
	Jaroslav Kysela <perex@perex.cz>
Cc: linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2] ALSA: hda/hdmi: Don't share an assigned converter on NVIDIA codecs
Date: Mon,  2 Nov 2026 21:04:17 +0200
Message-ID: <20261102190417.2661176-1-razvandinculescu@gmail.com>
X-Mailer: git-send-email 2.56.0
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Post: <mailto:linux-sound@vger.kernel.org>
List-Help: <mailto:linux-sound+help@vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-sound+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

All pins of the NVIDIA HDMI/DP codecs share one connection list, so a
converter can be selected by several pins at once. Unlike the Intel
codecs (intel_not_share_assigned_cvt()), the NVIDIA ones never move an
idle pin off the converter that another pin streams on, and the display
that should play stays silent.

Seen on an RTX 5090 (codec 0x10de00aa) with a DP monitor on pin 0x04
and an HDMI TV on pin 0x05. PipeWire probes every PCM at start-up: the
monitor's PCM got converter 0x08 and kept it selected after closing,
then the TV's PCM got 0x08 as well when it was opened. With both pins
on 0x08 the TV played nothing, although its PCM was running and its
ELD was valid. Opening the monitor's PCM while the TV's was running
moved the monitor to 0x09 and the TV played at once. Restarting
PipeWire put both pins back on 0x08.

Implement pin_cvt_fixup for the generic NVIDIA model as Intel does:
restore the pin's own converter selection, which
snd_hda_hdmi_generic_pcm_prepare() relies on after the hardware drops
it, then move every other connected pin that selects the assigned
converter to an unassigned one. Look the converter up in each pin's
own connection list instead of assuming the same order on every pin.

Tested on that system with the TV's PCM on 0x08 and the monitor's on
0x09, both pins then forced onto 0x08 with hda-verb: a prepare on the
TV's PCM moved the monitor off 0x08, and a prepare on the monitor's
PCM put it back on 0x09.

Signed-off-by: Razvan Dinculescu <razvandinculescu@gmail.com>
---
v2:
- Restore the pin's own converter selection before moving the other
  pins, as i915_pin_cvt_fixup() does; without it a pin moved to another
  converter while its own PCM was open stayed there at its next prepare
  (reported by the Sashiko review of v1). The PipeWire restart test of
  v1 was not repeated; the code that moves the other pins is unchanged.

v1: https://lore.kernel.org/linux-sound/20261102182213.2154560-1-razvandinculescu@gmail.com/

 sound/hda/codecs/hdmi/nvhdmi.c | 97 ++++++++++++++++++++++++++++++++++
 1 file changed, 97 insertions(+)

diff --git a/sound/hda/codecs/hdmi/nvhdmi.c b/sound/hda/codecs/hdmi/nvhdmi.c
index 94671ad24b5e..e61ad1624dfb 100644
--- a/sound/hda/codecs/hdmi/nvhdmi.c
+++ b/sound/hda/codecs/hdmi/nvhdmi.c
@@ -66,6 +66,102 @@ static const struct drm_audio_component_audio_ops nvhdmi_audio_ops = {
 	.master_unbind = snd_hda_hdmi_acomp_master_unbind,
 };
 
+/*
+ * All pins of these codecs share one connection list, as on Intel.  An idle
+ * pin left selecting the converter that another pin streams on takes that
+ * stream: the display that plays stays silent and the audio goes to the
+ * other display instead.  Seen on GB202 (0x10de00aa) with an HDMI TV and a
+ * DP monitor: whenever the monitor's PCM was opened first (PipeWire probes
+ * every PCM at start-up), its pin kept the converter the TV got next.
+ *
+ * Move every other connected pin off the converter just assigned, to a
+ * converter nobody uses.
+ */
+static void nvhdmi_not_share_assigned_cvt(struct hda_codec *codec,
+					  hda_nid_t pin_nid, int dev_id,
+					  hda_nid_t cvt_nid)
+{
+	struct hdmi_spec *spec = codec->spec;
+	struct hdmi_spec_per_pin *per_pin;
+	struct hdmi_spec_per_cvt *per_cvt;
+	int pin_idx, cvt_idx, mux_idx, curr, dev_id_saved;
+
+	if (!cvt_nid)
+		return;
+
+	for (pin_idx = 0; pin_idx < spec->num_pins; pin_idx++) {
+		per_pin = get_pin(spec, pin_idx);
+		/* no display on this pin */
+		if (!per_pin->pcm)
+			continue;
+		if (per_pin->pin_nid == pin_nid && per_pin->dev_id == dev_id)
+			continue;
+		if (per_pin->dev_id >=
+		    snd_hda_get_num_devices(codec, per_pin->pin_nid) + 1)
+			continue;
+
+		dev_id_saved = snd_hda_get_dev_select(codec, per_pin->pin_nid);
+		snd_hda_set_dev_select(codec, per_pin->pin_nid, per_pin->dev_id);
+		curr = snd_hda_codec_read(codec, per_pin->pin_nid, 0,
+					  AC_VERB_GET_CONNECT_SEL, 0);
+		if (curr < 0 || curr >= per_pin->num_mux_nids ||
+		    per_pin->mux_nids[curr] != cvt_nid)
+			goto restore;
+
+		for (cvt_idx = 0; cvt_idx < spec->num_cvts; cvt_idx++) {
+			per_cvt = get_cvt(spec, cvt_idx);
+			if (per_cvt->assigned || per_cvt->cvt_nid == cvt_nid)
+				continue;
+			for (mux_idx = 0; mux_idx < per_pin->num_mux_nids; mux_idx++)
+				if (per_pin->mux_nids[mux_idx] == per_cvt->cvt_nid)
+					break;
+			if (mux_idx == per_pin->num_mux_nids)
+				continue;
+			codec_dbg(codec,
+				  "hdmi: move pin 0x%x off cvt 0x%x to cvt 0x%x\n",
+				  per_pin->pin_nid, cvt_nid, per_cvt->cvt_nid);
+			snd_hda_codec_write_cache(codec, per_pin->pin_nid, 0,
+						  AC_VERB_SET_CONNECT_SEL,
+						  mux_idx);
+			break;
+		}
+restore:
+		snd_hda_set_dev_select(codec, per_pin->pin_nid, dev_id_saved);
+	}
+}
+
+/*
+ * The hardware can drop a pin's converter selection, e.g. on a display
+ * reset.  snd_hda_hdmi_generic_pcm_prepare() relies on pin_cvt_fixup() to
+ * restore it, as i915_pin_cvt_fixup() does on Intel.
+ */
+static void nvhdmi_verify_pin_cvt_connect(struct hda_codec *codec,
+					  struct hdmi_spec_per_pin *per_pin)
+{
+	int curr;
+
+	curr = snd_hda_codec_read(codec, per_pin->pin_nid, 0,
+				  AC_VERB_GET_CONNECT_SEL, 0);
+	if (curr != per_pin->mux_idx)
+		snd_hda_codec_write_cache(codec, per_pin->pin_nid, 0,
+					  AC_VERB_SET_CONNECT_SEL,
+					  per_pin->mux_idx);
+}
+
+static void nvhdmi_pin_cvt_fixup(struct hda_codec *codec,
+				 struct hdmi_spec_per_pin *per_pin,
+				 hda_nid_t cvt_nid)
+{
+	if (per_pin) {
+		snd_hda_set_dev_select(codec, per_pin->pin_nid, per_pin->dev_id);
+		nvhdmi_verify_pin_cvt_connect(codec, per_pin);
+		nvhdmi_not_share_assigned_cvt(codec, per_pin->pin_nid,
+					      per_pin->dev_id, per_pin->cvt_nid);
+	} else {
+		nvhdmi_not_share_assigned_cvt(codec, 0, 0, cvt_nid);
+	}
+}
+
 static int probe_generic(struct hda_codec *codec)
 {
 	struct hdmi_spec *spec;
@@ -77,6 +173,7 @@ static int probe_generic(struct hda_codec *codec)
 	codec->dp_mst = true;
 
 	spec = codec->spec;
+	spec->ops.pin_cvt_fixup = nvhdmi_pin_cvt_fixup;
 
 	err = snd_hda_hdmi_parse_codec(codec);
 	if (err < 0) {
-- 
2.56.0

