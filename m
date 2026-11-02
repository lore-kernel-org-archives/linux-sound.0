Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793643736;
	b=W7glIRn8NPDTPzi9x6ZTG0Sp6ggsvfMBXsuGT81LseYnI0//4KViqT3kcQQLad7xKS0D
	 5Ri/HFtJN3nP5mgj78JadIBmb7713jJGBGjBC6lvGgf9vEzruPr9IB2zb05OPAv/IvGls
	 yylUCMdpY0rG5viaoR1K8Pb4UfmWLnS5G8fhuGinWlnKH3kRpcwrB05N9sLAyKE4bHyCB
	 mp98O0uJOwIoUodSzdjxpAU9gwfDHQoURUCpSh0E8d2Y2sMcdDxjKnHMQohovmNtDGhiq
	 xHT0zUXAwgimzUhi7nEJL1cfZlXScvOWp84LsTdRNKpfSl/APC9l9HvU1IAFDVuCMUw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793643736;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=tyG+KrBGnuPWnNF/+fOUZY6fmOkYDusAbsJroxJ3bGI=;
	b=tzdyn9hcf+RVcieiU0QWMpSljH3Hx2BJUsXm27N7cfN5ID5KPhck1r1FK67XZTUSf0Bk
	 xn53anbJO63hmI9xfcQ4whsy/v0JfRsK1N+4RCXyhNryTEXabo19v7pz6M95FkKEFM6Pp
	 ffNWzEuO4W1RabkwxH/e5E3o5lpru1ZvwnPqsghK7aMIxSdr8iiRilk67GNqQIvLgjtbH
	 dRaoLM8sEDV2mSR7rkfh+94+Jo7udVO0xgn/adFVrSoQEpWVqY9tOl7ur6FrfKI0EQDId
	 Z1XPZFiV3NNTqQP2+QCcZOO33KUEpedHrzDhsM5lnbnV1sDlqgFk8zc1J7kSvxTTq8w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=hqkAYYvH;
	arc=none smtp.remote-ip=209.85.128.49
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CD6B606A324
	for <linux-sound@vger.kernel.org>; Mon,  2 Nov 2026 18:22:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6CD6B606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=hqkAYYvH
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4a214af2076so25557745e9.0
        for <linux-sound@vger.kernel.org>; Mon, 02 Nov 2026 10:22:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793643735; x=1794248535; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=tyG+KrBGnuPWnNF/+fOUZY6fmOkYDusAbsJroxJ3bGI=;
        b=hqkAYYvHWlrHi8VJJivANXVITPxtd/zXbc1eoojhPOiDbEV5mijfP4A1IW04AWHKM2
         RqCEWLjn8ZT3SZqVVU1PR9lpd/BPMrHL/1aqz04RFdlLaJf3HCOOE3qY1hL0WZGte+3W
         9wx+8v1zoSHpblnkweFr78mCvjEGC8zs5LUIJzJjWSajvL3ptxxXbzXHgkc6v9dtd0pz
         X9SvrTfqfBzGFM+KcTXqiIfnnjzycx231WEqm3DLMOfiJxLdhnykQGhNAuOGBT81i6vz
         QL8A3W7kaRFFOhvSCtOsHsvs40pEhO2d/zaT55cZVwyb+wfFiXOP1nGYzFmUEH3VOSHg
         kkPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793643735; x=1794248535;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tyG+KrBGnuPWnNF/+fOUZY6fmOkYDusAbsJroxJ3bGI=;
        b=jCe4GAfgQLwI2brKTcXhTzijtlS7BTCmp+Fj0PQ3OPfgHXpDhLC79QN+a0BB+gMpn7
         AeyZHm6oknR8SVAWe+qwaQvsPHMzIoAlMniZEHfPmYulBRRYHbb/0m+xDKC5J6+ETfI8
         GQaFDpmoQZLa3w8yIXabOYViu+FA1Ha1AdRNsWgz7eVxgOqOSZOKUTUseCTxKlq7rwt9
         +iL5YLc6Pb3BHNrwWUz2MQxFVxqDq0iNQ5Y1oubEB+PCeXEx/OXTxU9bjcsmaZT2HF+B
         YSUH60AE+StZcSA1cLnfTmQazUI7BlA6cKgL/ANlfCf1F5YwSXgZOfCPPqcOLGwTcR5a
         f1TQ==
X-Gm-Message-State: AFq9FYLWI2qnkyqkbrxa5EK4EnKQellyVsyA9irEgH8Ww/e2mL4H0/0L
	if6pAVw91JWeppvSN/gGRi8D5Py2uMt9nfEQkoO9aYFyAYWwMecyUyTfCYY9
X-Gm-Gg: AYBFou29HHbX0iGFErLozkIQ1dx3GTD1KeYpRo8ZccNasxCx9dHBVfLoMOT6vmNLylp
	KiRK46ulIzco1Ws8u1qohN+qqHMX8jHJoaO/Od9/iB4DcOIFVwhu+tzk4PjJQKCpqtYlyOC3oPK
	1bxPJ+IpMJk2QZVPSu/qf4Zv8Vcci83BsKBFwJCP+Bj/4DuWwENQ2dBdkst/hEORVdDIBoKhwvD
	BHSOlgItX5hIGJiyvUPAZoVdhC2KuqA1cCn+QQhSRNrtziFvTE12qU+IANS97gnP46wndPN4058
	bmpC+b3RVeLsEWO+WCwclTAqRMvJfFS2xJZsMXIPau+9tkqc1azGAROoKEOJi1vK5Kcptomn3Tz
	0UoDc08MYF4tK4a6PvQFu+ORTfqDPNODmo5gVdywl3oYjhk5kOPfl2jY57h8+ujfIjDPtAzpspl
	Njyuih6gOGIIRjPmVCPDdyihlgjqVFtjPCDFQEB7VjxLGr/fi09xQA/56elashyViFX07pm8P2B
	wxuszJZuq76ianf5nti0/+YDn9Z3xknLsp+N+6ax3kjxrsXtxlVeJfv5Mu+KrrPaNp0Uw7uaHZU
	yfyibx4hOYNS1TyVjed1VoyS+2zN0YZ7ws/Ehb1SzwRKAEeG43DK10K2MdjexZXf8WdyEkQGReu
	GR4UpEG6ftfZdYMvLrRDzgYd7B4Trz/6prUjRwRU7fJc+Uk4c+Q13PAKVs7zQ43ocxCuC7OqyLA
	MwBBxSrg3WscriPTZHmQWosJSYdQfZTL4GzZKGFilvsvbu0fLf6ArEJF2cATd9
X-Received: by 2002:a05:600d:a:b0:4ac:aae6:6400 with SMTP id 5b1f17b1804b1-4acaae665a6mr184831455e9.13.1793643734734;
        Mon, 02 Nov 2026 10:22:14 -0800 (PST)
Received: from cachyos-x8664 ([2a02:2f0f:9208:cf00:b848:3801:1bc:d8d1])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e71a4d3e9sm23878903f8f.6.2026.11.02.10.22.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 10:22:14 -0800 (PST)
From: Razvan Dinculescu <razvandinculescu@gmail.com>
To: Takashi Iwai <tiwai@suse.com>,
	Jaroslav Kysela <perex@perex.cz>
Cc: linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] ALSA: hda/hdmi: Don't share an assigned converter on NVIDIA codecs
Date: Mon,  2 Nov 2026 20:22:13 +0200
Message-ID: <20261102182213.2154560-1-razvandinculescu@gmail.com>
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
when a converter is assigned to a pin, move every other connected pin
that selects it to an unassigned converter. Look the converter up in
each pin's own connection list instead of assuming the same order on
every pin.

With this change, three PipeWire restarts in a row left the monitor on
0x09 and the TV on 0x08, and the monitor pin forced back onto 0x08 with
hda-verb was moved off it at the next prepare.

Signed-off-by: Razvan Dinculescu <razvandinculescu@gmail.com>
---
 sound/hda/codecs/hdmi/nvhdmi.c | 76 ++++++++++++++++++++++++++++++++++
 1 file changed, 76 insertions(+)

diff --git a/sound/hda/codecs/hdmi/nvhdmi.c b/sound/hda/codecs/hdmi/nvhdmi.c
index 94671ad..95ae773 100644
--- a/sound/hda/codecs/hdmi/nvhdmi.c
+++ b/sound/hda/codecs/hdmi/nvhdmi.c
@@ -66,6 +66,81 @@ static const struct drm_audio_component_audio_ops nvhdmi_audio_ops = {
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
+static void nvhdmi_pin_cvt_fixup(struct hda_codec *codec,
+				 struct hdmi_spec_per_pin *per_pin,
+				 hda_nid_t cvt_nid)
+{
+	if (per_pin)
+		nvhdmi_not_share_assigned_cvt(codec, per_pin->pin_nid,
+					      per_pin->dev_id, per_pin->cvt_nid);
+	else
+		nvhdmi_not_share_assigned_cvt(codec, 0, 0, cvt_nid);
+}
+
 static int probe_generic(struct hda_codec *codec)
 {
 	struct hdmi_spec *spec;
@@ -77,6 +152,7 @@ static int probe_generic(struct hda_codec *codec)
 	codec->dp_mst = true;
 
 	spec = codec->spec;
+	spec->ops.pin_cvt_fixup = nvhdmi_pin_cvt_fixup;
 
 	err = snd_hda_hdmi_parse_codec(codec);
 	if (err < 0) {
-- 
2.56.0

