Received: from mailgw.kylinos.cn (mailgw.kylinos.cn [124.126.103.232])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FBEA224FA;
	Sun,  3 May 2026 11:45:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=124.126.103.232
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777808727; cv=none; b=IvHqaHlPg10r6iIJUBMPW5ivcfS0RP0dST3AjscHk5eE+8eGHXJjf7knSCrQQKYoIvsdBRs9u4IV9wcc2vxSHCmUhdzIFDf5dmZfkJJsJ34Yy4Rml5iRsLcyib+fvhzgPA2w2ElWbTegyxQll8vmEozLwskLWr1xtHSIqLCqs7k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777808727; c=relaxed/simple;
	bh=R/qs9x1dlxGfGeLXOX8O/xGN+7PU4NEaZnNz++R/JqA=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=bd3RQ1Xx01IdaNhOinkxHnAum/BEOCDVF+fcH2PcgEdlKHvC/dLVm8iBIoxD+Xi+Pn5MVHaBgE+sEnXFx87BamzRuYWFr4dV9hUzxxKkQaOQZU+wQuu6cwIJRXcgrgNacN9zCRdh20DR0jOgwaAbq5cdfX46s3YU6ekgNV2FUak=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn; spf=pass smtp.mailfrom=kylinos.cn; arc=none smtp.client-ip=124.126.103.232
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kylinos.cn
X-UUID: 8e00387446e511f1aa26b74ffac11d73-20260503
X-CTIC-Tags:
	HR_CC_COUNT, HR_CC_DOMAIN_COUNT, HR_CC_NAME, HR_CC_NO_NAME, HR_CTE_8B
	HR_CTT_MISS, HR_DATE_H, HR_DATE_WKD, HR_DATE_ZONE, HR_FROM_NAME
	HR_SJ_LANG, HR_SJ_LEN, HR_SJ_LETTER, HR_SJ_NOR_SYM, HR_SJ_PHRASE
	HR_SJ_PHRASE_LEN, HR_SJ_WS, HR_TO_COUNT, HR_TO_DOMAIN_COUNT, HR_TO_NO_NAME
	IP_TRUSTED, SRC_TRUSTED, DN_TRUSTED, SA_TRUSTED, SA_EXISTED
	SN_TRUSTED, SN_EXISTED, SPF_NOPASS, DKIM_NOPASS, DMARC_NOPASS
	CIE_BAD, CIE_GOOD, CIE_GOOD_SPF, GTI_FG_BS, GTI_RG_INFO
	GTI_C_BU, AMN_GOOD, ABX_MISS_RDNS
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.12,REQID:c001ec8b-39ae-4adb-9ef7-b36f6b9552d4,IP:10,
	URL:0,TC:0,Content:0,EDM:25,RT:0,SF:-30,FILE:0,BULK:0,RULE:Release_Ham,ACT
	ION:release,TS:5
X-CID-INFO: VERSION:1.3.12,REQID:c001ec8b-39ae-4adb-9ef7-b36f6b9552d4,IP:10,UR
	L:0,TC:0,Content:0,EDM:25,RT:0,SF:-30,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
	N:release,TS:5
X-CID-META: VersionHash:e7bac3a,CLOUDID:3fc6b555ed18bcb7fa8cbc071e42152a,BulkI
	D:260503194518RMFPDQ64,BulkQuantity:0,Recheck:0,SF:10|38|66|78|102|127|850
	|898,TC:nil,Content:0|15|50,EDM:5,IP:-2,URL:0,File:nil,RT:nil,Bulk:nil,QS:
	nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,AR
	C:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 8e00387446e511f1aa26b74ffac11d73-20260503
X-User: zhangheng@kylinos.cn
Received: from localhost.localdomain [(112.64.161.44)] by mailgw.kylinos.cn
	(envelope-from <zhangheng@kylinos.cn>)
	(Generic MTA with TLSv1.3 TLS_AES_256_GCM_SHA384 256/256)
	with ESMTP id 1136972284; Sun, 03 May 2026 19:45:16 +0800
From: Zhang Heng <zhangheng@kylinos.cn>
To: perex@perex.cz,
	tiwai@suse.com
Cc: linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Zhang Heng <zhangheng@kylinos.cn>
Subject: [PATCH] ALSA: hda/generic: Add mic autoswitch support for dyn_adc_switch mode
Date: Sun,  3 May 2026 19:45:12 +0800
Message-Id: <20260503114512.331805-1-zhangheng@kylinos.cn>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

When auto_mic is not available but dyn_adc_switch mode is enabled
(e.g., on laptops with both front and rear mic jacks), this patch
enables automatic microphone switching based on jack detection.

The patch includes three changes:

1. In check_dyn_adc_switch(): Register jack detect callbacks for
   all input pins when dyn_adc_switch is enabled and auto_mic is
   not available.

2. In call_mic_autoswitch(): Add handling for dyn_adc_switch mode
   to check imux_pins[] for jack presence, searching from back to
   front (last inserted wins).

3. In mux_select(): Notify Capture Source controls after switching
   to sync with user-space (PulseAudio/PipeWire).

Problem description:
On Ubuntu 20.04 (with older PulseAudio/PipeWire):
- Front mic is unplugged
- Plug in rear mic
- Jack event is reported correctly
- Volume control (PulseAudio/PipeWire) recognizes the rear mic
- But alsamixer does NOT switch to rear mic
- Codec also does NOT perform the switch

The root cause is that in dyn_adc_switch mode without auto_mic,
the jack detect callback was not properly set up to trigger the
mic autoswitch. The call_mic_autoswitch() function only calls
mic_autoswitch_hook or snd_hda_gen_mic_autoswitch(), which rely
on auto_mic being enabled.

Additionally, after mux_select() performs the switch, user-space
(PulseAudio/PipeWire) may not be aware of the path change,
causing Capture Switch to show 'off'.

This patch fixes both issues by:
1. Registering jack detect callbacks for all input pins in
   dyn_adc_switch mode
2. Notifying Capture Source controls after switching

Tested on SN6186 codec with Ubuntu 20.04 and 25.10.

Question to the community: Is this approach correct? Should additional
changes be made to handle mute state preservation, or is this purely
a user-space issue that requires updating PulseAudio/PipeWire?

Testing and feedback are welcome.

Signed-off-by: Zhang Heng <zhangheng@kylinos.cn>
---
 sound/hda/codecs/generic.c | 82 ++++++++++++++++++++++++++++++++++++--
 1 file changed, 79 insertions(+), 3 deletions(-)

diff --git a/sound/hda/codecs/generic.c b/sound/hda/codecs/generic.c
index 660a9f2c0ded..c536de10d8b8 100644
--- a/sound/hda/codecs/generic.c
+++ b/sound/hda/codecs/generic.c
@@ -27,6 +27,10 @@
 #include "hda_beep.h"
 #include "generic.h"
 
+/* Forward declaration */
+static void call_mic_autoswitch(struct hda_codec *codec,
+				struct hda_jack_callback *jack);
+
 
 /**
  * snd_hda_gen_spec_init - initialize hda_gen_spec struct
@@ -3238,6 +3242,19 @@ static int check_dyn_adc_switch(struct hda_codec *codec)
 	if (!spec->dyn_adc_switch && spec->multi_cap_vol)
 		spec->num_adc_nids = 1;
 
+	/* Enable mic autoswitch for dyn_adc_switch mode when auto_mic is not available */
+	if (!spec->auto_mic && imux->num_items > 1) {
+		int i;
+		for (i = 0; i < imux->num_items; i++) {
+			hda_nid_t pin = spec->imux_pins[i];
+			if (!is_jack_detectable(codec, pin))
+				continue;
+			snd_hda_jack_detect_enable_callback(codec, pin,
+							    call_mic_autoswitch);
+		}
+		codec_dbg(codec, "Enable mic autoswitch for input sources\n");
+	}
+
 	return 0;
 }
 
@@ -4107,9 +4124,38 @@ static int mux_select(struct hda_codec *codec, unsigned int adc_idx,
 	path = get_input_path(codec, adc_idx, idx);
 	if (!path)
 		return 0;
-	if (path->active)
-		return 0;
-	snd_hda_activate_path(codec, path, true, false);
+	if (path->active) {
+		codec_err(codec, "[MUX] mux_select: path already active, skip activate but still notify\n");
+	} else {
+		snd_hda_activate_path(codec, path, true, false);
+	}
+
+	/* Notify Input Source / Capture Source controls that the path has changed */
+	if (!spec->auto_mic && spec->input_mux.num_items > 1) {
+		struct snd_card *card = codec->card;
+		struct snd_kcontrol *kctl;
+		struct snd_ctl_elem_id id;
+		int notified = 0;
+
+		codec_err(codec, "[MUX] mux_select: notifying controls, num_items=%d\n", spec->input_mux.num_items);
+
+		if (card) {
+			list_for_each_entry(kctl, &card->controls, list) {
+				if (kctl->id.iface != SNDRV_CTL_ELEM_IFACE_MIXER)
+					continue;
+				codec_err(codec, "[MUX] mux_select: found control '%s'\n", kctl->id.name);
+				if (strncmp(kctl->id.name, "Capture Source", 14) == 0) {
+					id = kctl->id;
+					snd_ctl_notify(card, SNDRV_CTL_EVENT_MASK_VALUE, &id);
+					codec_err(codec, "[MUX] mux_select: notified '%s'\n", kctl->id.name);
+					notified = 1;
+				}
+			}
+		}
+		if (!notified)
+			codec_err(codec, "[MUX] mux_select: no Input/Capture Source control found!\n");
+	}
+
 	if (spec->cap_sync_hook)
 		spec->cap_sync_hook(codec, NULL, NULL);
 	path_power_down_sync(codec, old_path);
@@ -4602,6 +4648,36 @@ static void call_mic_autoswitch(struct hda_codec *codec,
 				struct hda_jack_callback *jack)
 {
 	struct hda_gen_spec *spec = codec->spec;
+	const struct hda_input_mux *imux;
+	int i;
+
+	/* Handle dyn_adc_switch mode - use imux_pins[] */
+	if (!spec->auto_mic && spec->dyn_adc_switch) {
+		imux = &spec->input_mux;
+		if (imux->num_items <= 1)
+			goto fallback;
+
+		codec_err(codec, "[AUTO_MIC] call_mic_autoswitch: dyn_adc_switch mode, checking %d inputs\n", imux->num_items);
+
+		/* Search from back to front (last inserted wins) */
+		for (i = imux->num_items - 1; i >= 0; i--) {
+			hda_nid_t pin = spec->imux_pins[i];
+			int det = is_jack_detectable(codec, pin);
+			int state = snd_hda_jack_detect_state(codec, pin);
+			codec_err(codec, "[AUTO_MIC] call_mic_autoswitch:   imux[%d] pin=0x%02x, det=%d, state=%s\n",
+				  i, pin, det, state == HDA_JACK_PRESENT ? "PRESENT" : "ABSENT");
+			if (det && state == HDA_JACK_PRESENT) {
+				codec_err(codec, "[AUTO_MIC] call_mic_autoswitch: switching to imux %d\n", i);
+				mux_select(codec, 0, i);
+				return;
+			}
+		}
+		/* No jack present, keep current selection (don't switch to imux 0) */
+		codec_err(codec, "[AUTO_MIC] call_mic_autoswitch: no jack present, keeping current\n");
+		return;
+	}
+
+fallback:
 	if (spec->mic_autoswitch_hook)
 		spec->mic_autoswitch_hook(codec, jack);
 	else
-- 
2.25.1

