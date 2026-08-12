Received: from mailgw.kylinos.cn (mailgw.kylinos.cn [124.126.103.232])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B40BF2931DE;
	Wed, 12 Aug 2026 03:30:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=124.126.103.232
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786505442; cv=none; b=ujBx8YR922cYHwrUKR0xvKpsbcpF8efkTe/atTNUUGTWlLckXG98uxpxC2lItwjIaHo/eCQyar+XMYJeOiNLKW7vR7oFGkkZ+jYx1FmgntLpNe4sQ863uJ8KjmH8ZNvf3v+E9ef0F01SWCsdnRT8vSjlcmVQsGJIp4O+KTe5IzM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786505442; c=relaxed/simple;
	bh=PD3CEy9sF5BDGKX9Dn/aeu7A9lRqKujQH/3vbjYKx3M=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=gtLGp3WMVKOss9cblZpB352qZQvCDTWWTXnvTcM2tRYkZy96yZ6wqKlGMUfjzusg8oU3J0C6RqQFf/EqK64KvhyYOMRGvDnyXk6hUdoVZrxRLoXZKc71aT4CDSdpnBKRV+WpGUs1GukrHWPD8d6lBzwrTw0wN0Wg3YJCNb2E/qo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn; spf=pass smtp.mailfrom=kylinos.cn; arc=none smtp.client-ip=124.126.103.232
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kylinos.cn
X-UUID: 2d82dd8695fe11f1aa26b74ffac11d73-20260812
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.12,REQID:396fcd80-789c-4b30-9bd0-022c9f75041b,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:e7bac3a,CLOUDID:0a3a8cf501a59e9873c97aff31651a6d,BulkI
	D:nil,BulkQuantity:0,Recheck:0,SF:102|850|865|898,TC:nil,Content:0|15|50,E
	DM:-3,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA
	:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 2d82dd8695fe11f1aa26b74ffac11d73-20260812
X-User: songxiebing@kylinos.cn
Received: from localhost.localdomain [(10.44.16.150)] by mailgw.kylinos.cn
	(envelope-from <songxiebing@kylinos.cn>)
	(Generic MTA with TLSv1.3 TLS_AES_256_GCM_SHA384 256/256)
	with ESMTP id 620367136; Wed, 12 Aug 2026 11:30:34 +0800
From: songxiebing <songxiebing@kylinos.cn>
To: tiwai@suse.com,
	perex@perex.cz
Cc: linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	songxiebing@kylinos.cn
Subject: [PATCH 2/2] ALSA: hda/ca0132: replace sprintf() with snprintf()
Date: Wed, 12 Aug 2026 11:30:30 +0800
Message-Id: <20260812033030.635417-1-songxiebing@kylinos.cn>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Bob Song <songxiebing@kylinos.cn>

Replace six sprintf() calls that write to
SNDRV_CTL_ELEM_ID_NAME_MAXLEN-sized buffers with snprintf() to avoid
potential buffer overflows.

Signed-off-by: Bob Song <songxiebing@kylinos.cn>
---
 sound/hda/codecs/ca0132.c | 19 ++++++++++---------
 1 file changed, 10 insertions(+), 9 deletions(-)

diff --git a/sound/hda/codecs/ca0132.c b/sound/hda/codecs/ca0132.c
index 424224ef4621..d3ac29fd5780 100644
--- a/sound/hda/codecs/ca0132.c
+++ b/sound/hda/codecs/ca0132.c
@@ -5788,7 +5788,8 @@ static int ca0132_alt_mic_boost_info(struct snd_kcontrol *kcontrol,
 	uinfo->value.enumerated.items = MIC_BOOST_NUM_OF_STEPS;
 	if (uinfo->value.enumerated.item >= MIC_BOOST_NUM_OF_STEPS)
 		uinfo->value.enumerated.item = MIC_BOOST_NUM_OF_STEPS - 1;
-	sprintf(namestr, "%d %s", (uinfo->value.enumerated.item * 10), sfx);
+	snprintf(namestr, sizeof(namestr), "%d %s",
+		 (uinfo->value.enumerated.item * 10), sfx);
 	strscpy(uinfo->value.enumerated.name, namestr);
 	return 0;
 }
@@ -5840,9 +5841,9 @@ static int ae5_headphone_gain_info(struct snd_kcontrol *kcontrol,
 	uinfo->value.enumerated.items = AE5_HEADPHONE_GAIN_MAX;
 	if (uinfo->value.enumerated.item >= AE5_HEADPHONE_GAIN_MAX)
 		uinfo->value.enumerated.item = AE5_HEADPHONE_GAIN_MAX - 1;
-	sprintf(namestr, "%s %s",
-		ae5_headphone_gain_presets[uinfo->value.enumerated.item].name,
-		sfx);
+	snprintf(namestr, sizeof(namestr), "%s %s",
+		 ae5_headphone_gain_presets[uinfo->value.enumerated.item].name,
+		 sfx);
 	strscpy(uinfo->value.enumerated.name, namestr);
 	return 0;
 }
@@ -5894,8 +5895,8 @@ static int ae5_sound_filter_info(struct snd_kcontrol *kcontrol,
 	uinfo->value.enumerated.items = AE5_SOUND_FILTER_MAX;
 	if (uinfo->value.enumerated.item >= AE5_SOUND_FILTER_MAX)
 		uinfo->value.enumerated.item = AE5_SOUND_FILTER_MAX - 1;
-	sprintf(namestr, "%s",
-			ae5_filter_presets[uinfo->value.enumerated.item].name);
+	snprintf(namestr, sizeof(namestr), "%s",
+		 ae5_filter_presets[uinfo->value.enumerated.item].name);
 	strscpy(uinfo->value.enumerated.name, namestr);
 	return 0;
 }
@@ -6632,7 +6633,7 @@ static int ca0132_alt_add_effect_slider(struct hda_codec *codec, hda_nid_t nid,
 	struct snd_kcontrol_new knew =
 		HDA_CODEC_VOLUME_MONO(namestr, nid, 1, 0, type);
 
-	sprintf(namestr, "FX: %s %s Volume", pfx, dirstr[dir]);
+	snprintf(namestr, sizeof(namestr), "FX: %s %s Volume", pfx, dirstr[dir]);
 
 	knew.tlv.c = NULL;
 
@@ -6671,9 +6672,9 @@ static int add_fx_switch(struct hda_codec *codec, hda_nid_t nid,
 	 * prefix to OutFX or InFX enable controls.
 	 */
 	if (ca0132_use_alt_controls(spec) && (nid <= IN_EFFECT_END_NID))
-		sprintf(namestr, "FX: %s %s Switch", pfx, dirstr[dir]);
+		snprintf(namestr, sizeof(namestr), "FX: %s %s Switch", pfx, dirstr[dir]);
 	else
-		sprintf(namestr, "%s %s Switch", pfx, dirstr[dir]);
+		snprintf(namestr, sizeof(namestr), "%s %s Switch", pfx, dirstr[dir]);
 
 	return snd_hda_ctl_add(codec, nid, snd_ctl_new1(&knew, codec));
 }
-- 
2.25.1

