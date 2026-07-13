Received: from mail-yw1-f179.google.com (mail-yw1-f179.google.com [209.85.128.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3AE9B29ACC5
	for <linux-sound@vger.kernel.org>; Mon, 13 Jul 2026 21:21:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783977714; cv=none; b=o7JaBcVQzKBNsymTY/ynsQ+qqfOMlxOMc28a/QzSRbHqQs9Z87hUI/EmYxVH2mwDD/gRHKPTQQktI92VL+47ylQ9+IfJZNMqDWR8I6t2k8B+S8eLySfVfAG6sWv84qbcY5rKJMr1A2jNOs7c4dSt0601qjaADXS3auxFPqu0tkg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783977714; c=relaxed/simple;
	bh=7uj7EbwyL2wBmOF1OYYDW4WfGY4SXoQRdpO12dF+O2Y=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=TvJwfD2KhNso59rDTjJEABlDeAKozPLm7HFIU6YpATRZyaADuubMie4QwbcD1sOArjjD8JEt+21DWuTTM8dJaJphjhTyhkmJY0OloAOnystCi8yJoH7dW9sXDreK4Al4+nJy8q1mv/c/xvXS+wY8z0+iH5P/GWmBPfNmW42/ZiI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=W3bbSXu5; arc=none smtp.client-ip=209.85.128.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="W3bbSXu5"
Received: by mail-yw1-f179.google.com with SMTP id 00721157ae682-81e8e83ff89so30422117b3.0
        for <linux-sound@vger.kernel.org>; Mon, 13 Jul 2026 14:21:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1783977711; x=1784582511; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=2Ss/hoKisOIZ0hdb5KRCghJHfPatt8rPwofgtoTmP3Y=;
        b=W3bbSXu55nR9FITDPPaJZFnOyKM7TvYkrk3C2S+I7jF60M/A/8Z2rFyOLBo8d+HBFY
         PPtDFRuYRoDqXsu8pm3zG2w4e7BheJ/0b/qbjbrpsZBwquuLFVfYZ3T6wXsexyJ0Rm1u
         0RkhhTYh2Hjtr3YQddBlKnF1W8WxWUcIba+Zw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783977711; x=1784582511;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=2Ss/hoKisOIZ0hdb5KRCghJHfPatt8rPwofgtoTmP3Y=;
        b=Q4Nw3uiHnQYiaqaP+Su1wl89CSU/RaukSVlg0zIxFSkRUMRNhFApGS+BGYyXDCqg+I
         qsCbIVmLEhE12L12cN5RtX98Kq/HNPKcX7hPWPpmf+Hh31MXUbNyi3tW6mtTsTnEpbWP
         kZSr3VifEExbMhOkdUsEkoCjTED8i25r7gDTx75rg8gzGiW9dn7dApTPURytc89J2O4q
         DDGSg20bpFe9hh74WLPiXw6sQdYO05/M0fedGsHYVBVl2yvrMku2D4rC5Q5AE3iUmAIO
         GG6Zk5NBpzPAe0nDDRdkHueqoxbDuO2jRowI1FVuWBWZ0ghIt04xGAqsBsP27OZdi4Hy
         JoUA==
X-Gm-Message-State: AOJu0YzJ2cih/OdCGpuMjqQtWYHmhttiJ1OK43mvpXYkfK7332g17Mos
	4VT5biPL64wngziFh6sxOdmhai8aCyzKL6Tnh4ABMjH0Milz1Xa/VWVRM60pPtLpEtsDqmQPsaW
	2W+I=
X-Gm-Gg: AfdE7cmV9HHKoKW6WS1c7PC15VFO5D3QjFIgqOHKtdP0DjnnBDkzoRKUiSOny92ezec
	7U1DkOJa7agR1z3k1r7ZGlufKbwjDVOcDgVknx7/hBv00fpI6Vbucy02x8WHV5baPe6CHjJhRgw
	0HqwqvajF2UWNMUyOzzp4wrTYZhkNgzDnnAvoWypZOsmi9zCyxrdi/lzWYPTLRrbxuISQtJZ8+8
	Rs4BpSCpi/Oj3F43TpGRc8ISx0aa3sLfT49xg98J+lYxEPZD7CoCD4deC1mnS8ijb98o1wkJ1n2
	YjmNhgtmIISiUYfGn8zM+2AuoESzGNZm8SpGrfrW9LbKzH39WfvDfCAaf/noynDoi1zMBoJHeEH
	iUDAmDBHw/d/gYc0AG9XSmzOh1eRH6QM8qwRDhy4pQyHKU26vx+a/7swVS3F3J2LhnMj3/DRDdx
	319IP/IJ+u/wI/uKZ8s2ZW6gtUcmxdgKhWUYSL9SPLmw5/5OyoHCSnY+g7ypNxDugBxfUleUuI0
	uSULxzAjg==
X-Received: by 2002:a05:690c:e685:b0:81e:ba51:909b with SMTP id 00721157ae682-81eba519148mr7629307b3.70.1783977711262;
        Mon, 13 Jul 2026 14:21:51 -0700 (PDT)
Received: from ripwilburliny.c.googlers.com (188.63.48.34.bc.googleusercontent.com. [34.48.63.188])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-81e6bf82412sm126631447b3.21.2026.07.13.14.21.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jul 2026 14:21:50 -0700 (PDT)
From: Steven 'Steve' Kendall <skend@chromium.org>
Date: Mon, 13 Jul 2026 21:21:41 +0000
Subject: [PATCH] ALSA: hda/cs8409: Fix for Dell Cirrus audio jack detect
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260713-fix-headphone-plug-cirrus-dell-v1-1-3c5157cd45cd@chromium.org>
X-B4-Tracking: v=1; b=H4sIAORWVWoC/x2NwQqDMBAFf0X27EJMjaX9FekhNU+zEGLYYCmI/
 97Q4xxm5qQKFVR6dicpPlJlzw2GvqMl+ryBJTQma+xk7oPhVb4c4UOJewaXdGy8iOpROSAldri
 9x0fwbnWWWqQomvEfzK/r+gG1mQ+wcAAAAA==
X-Change-ID: 20260710-fix-headphone-plug-cirrus-dell-5e3b49da5f52
To: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Steven 'Steve' Kendall <skend@chromium.org>
X-Mailer: b4 0.14.3

On some models like the Dell Inspiron 15 3520, jack
detection does not work. This patch switches to polling
and more regularly queries the lower values rather
than cached values for the headphone and mic jacks.
It also includes some logic to prevent the polling
while headphones are already plugged so no
audible "tick" can be heard.

---
This patch switches to a polling method for a
specific Dell machine (Inspiron 15 3520). This fixes
jack detection for this model. It's possible the gate
on manufacturer and model are unnecessary and this problem
is common to a wider set of machines, but I've only tested
on one machine thus far. I left the other logic ungated
as it seemed likely the cache was not providing up-to-date
information broadly. But I'm open to gating more or less
of the content or changing the approach entirely.

Signed-off-by: Steven 'Steve' Kendall <skend@chromium.org>
---
 sound/hda/codecs/cirrus/cs8409.c | 17 ++++++++++++++++-
 1 file changed, 16 insertions(+), 1 deletion(-)

diff --git a/sound/hda/codecs/cirrus/cs8409.c b/sound/hda/codecs/cirrus/cs8409.c
index c43ff3ef75b6e..733234844e7df 100644
--- a/sound/hda/codecs/cirrus/cs8409.c
+++ b/sound/hda/codecs/cirrus/cs8409.c
@@ -766,6 +766,9 @@ static int cs42l42_handle_tip_sense(struct sub_codec *cs42l42, unsigned int reg_
 	/* TIP_SENSE INSERT/REMOVE */
 	switch (reg_ts_status) {
 	case CS42L42_TS_PLUG:
+		// if jack is already plugged, ignore plug event
+		if (cs42l42->hp_jack_in)
+			break;
 		if (cs42l42->no_type_dect) {
 			status_changed = 1;
 			cs42l42->hp_jack_in = 1;
@@ -776,6 +779,9 @@ static int cs42l42_handle_tip_sense(struct sub_codec *cs42l42, unsigned int reg_
 		break;
 
 	case CS42L42_TS_UNPLUG:
+		// if jack is already unplugged, ignore unplug event
+		if (!cs42l42->hp_jack_in && !cs42l42->mic_jack_in)
+			break;
 		status_changed = 1;
 		cs42l42->hp_jack_in = 0;
 		cs42l42->mic_jack_in = 0;
@@ -1092,12 +1098,14 @@ static int cs8409_cs42l42_exec_verb(struct hdac_device *dev, unsigned int cmd, u
 	switch (nid) {
 	case CS8409_CS42L42_HP_PIN_NID:
 		if (verb == AC_VERB_GET_PIN_SENSE) {
+			cs42l42_jack_unsol_event(cs42l42);
 			*res = (cs42l42->hp_jack_in) ? AC_PINSENSE_PRESENCE : 0;
 			return 0;
 		}
 		break;
 	case CS8409_CS42L42_AMIC_PIN_NID:
 		if (verb == AC_VERB_GET_PIN_SENSE) {
+			cs42l42_jack_unsol_event(cs42l42);
 			*res = (cs42l42->mic_jack_in) ? AC_PINSENSE_PRESENCE : 0;
 			return 0;
 		}
@@ -1157,6 +1165,11 @@ void cs8409_cs42l42_fixups(struct hda_codec *codec, const struct hda_fixup *fix,
 		case CS8409_WARLOCK_MLK_DUAL_MIC:
 			spec->scodecs[CS8409_CODEC0]->full_scale_vol = CS42L42_FULL_SCALE_VOL_0DB;
 			spec->speaker_pdn_gpio = CS8409_WARLOCK_SPEAKER_PDN;
+			// if Dell Inspiron 15 3520, poll jack at 250ms
+			if (codec->bus->pci->subsystem_vendor == 0x1028 &&
+			    codec->bus->pci->subsystem_device == 0x0bb2) {
+				codec->jackpoll_interval = msecs_to_jiffies(250);
+			}
 			break;
 		default:
 			spec->scodecs[CS8409_CODEC0]->full_scale_vol =
@@ -1208,8 +1221,10 @@ void cs8409_cs42l42_fixups(struct hda_codec *codec, const struct hda_fixup *fix,
 		 * Run immediately after init.
 		 */
 		if (spec->init_done && spec->build_ctrl_done
-			&& !spec->scodecs[CS8409_CODEC0]->hp_jack_in)
+			&& !spec->scodecs[CS8409_CODEC0]->hp_jack_in) {
 			cs42l42_run_jack_detect(spec->scodecs[CS8409_CODEC0]);
+			cs42l42_enable_jack_detect(spec->scodecs[CS8409_CODEC0]);
+		}
 		break;
 	default:
 		break;

---
base-commit: d96fcfe1b7f94ac742984ae7986b94a116abff1b
change-id: 20260710-fix-headphone-plug-cirrus-dell-5e3b49da5f52

Best regards,
-- 
Steven 'Steve' Kendall <skend@chromium.org>

