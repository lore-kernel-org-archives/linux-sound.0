Received: from m.b4.vu (m.b4.vu [203.16.231.148])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E04C2D8375
	for <linux-sound@vger.kernel.org>; Fri, 20 Feb 2026 11:38:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.16.231.148
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771587499; cv=none; b=vEvX38H31wPmoU2vd7iW6jQZuewsrvacjvD+6MkHjQwl8Wyb/yzbfQcSnkaDEUXeRNvEHotitWS331yUq4QVHeiSrAMAZvAK+o9LpOgCfuyYNlYqBUc8e5xHPfqcOB/rtDxrrvCQB2rczYAMWdq5DvKQMqOTSKBqb2MGhyaqTUk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771587499; c=relaxed/simple;
	bh=Y59pc+acYYh8R20U2alBnkubmdJyM8Jd4iPy9daue18=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ApIqNArg12WUDU/K3HxpaOQ1DjU4ddiqqI3IVjkiinBlNmB7gTYinSEHOGSaWnqlPmRD/icLpnyUec3lL3PkGybKlLMP+TE07Pz0FzAdECp+gSS9invA2vDywJAxCtCWI6gt/2QIaIPan9d9vZQKIXxjvKcaa0q1Clcvglh7r28=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=b4.vu; spf=pass smtp.mailfrom=b4.vu; dkim=pass (2048-bit key) header.d=b4.vu header.i=@b4.vu header.b=iHTdRULX; arc=none smtp.client-ip=203.16.231.148
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=b4.vu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=b4.vu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=b4.vu header.i=@b4.vu header.b="iHTdRULX"
Received: by m.b4.vu (Postfix, from userid 1000)
	id CE00F6756E24; Fri, 20 Feb 2026 21:58:48 +1030 (ACDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 m.b4.vu CE00F6756E24
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=b4.vu; s=m1;
	t=1771586928; bh=96kJo1h0MUmtAKC2ozfnbmP98DgNPEDQIlpzbGFTcRU=;
	h=Date:From:To:Cc:Subject:From;
	b=iHTdRULXMkQzgsUfc1nYqzZ+7Chy5dxStPOIhLvHORO6yRQZb7496fvuUA/yFjtgi
	 7MtXBrh21kK694OkR7BYDXtZTXIf2dw7oXcVPn3YMY0nGHRixK8DOcylBUxfycsYnI
	 9jHtEKh+Y0Pj4vuXMdOnQS0C+kGRbJpvHtX+auFzVZylGG2S75zUh6xNYX1DJ3yxgX
	 2ke6bB7pdCjSp6+E6XWQ+meo95feB3DhCCTnHoJAIqcOw2LXDXn2BaACTgb+jtrY/S
	 K60A2evrCpI+psOqfBFE2RMBSYPA63eUBi1OO3NGTmOUYTpdE3jK46RlVEJ/d+V0Hg
	 O07p7zETI67gw==
Date: Fri, 20 Feb 2026 21:58:48 +1030
From: "Geoffrey D. Bennett" <g@b4.vu>
To: Takashi Iwai <tiwai@suse.de>
Cc: Takashi Iwai <tiwai@suse.com>, linux-sound@vger.kernel.org
Subject: [PATCH] ALSA: scarlett2: Fix DSP filter control array handling
Message-ID: <86497b71db060677d97c38a6ce5f89bb3b25361b.1771581197.git.g@b4.vu>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

scarlett2_add_dsp_ctls() was incorrectly storing the precomp and PEQ
filter coefficient control pointers into the precomp_flt_switch_ctls
and peq_flt_switch_ctls arrays instead of the intended targets
precomp_flt_ctls and peq_flt_ctls. Pass NULL instead, as the filter
coefficient control pointers are not used, and remove the unused
precomp_flt_ctls and peq_flt_ctls arrays from struct scarlett2_data.

Additionally, scarlett2_update_filter_values() was reading
dsp_input_count * peq_flt_count values for
SCARLETT2_CONFIG_PEQ_FLT_SWITCH, but the peq_flt_switch array is
indexed only by dsp_input_count (one switch per DSP input, not per
filter). Fix the read count.

Fixes: b64678eb4e70 ("ALSA: scarlett2: Add DSP controls")
Signed-off-by: Geoffrey D. Bennett <g@b4.vu>
---
 sound/usb/mixer_scarlett2.c | 10 +++-------
 1 file changed, 3 insertions(+), 7 deletions(-)

diff --git a/sound/usb/mixer_scarlett2.c b/sound/usb/mixer_scarlett2.c
index 88b7e42d159e..7b31504c5f24 100644
--- a/sound/usb/mixer_scarlett2.c
+++ b/sound/usb/mixer_scarlett2.c
@@ -1328,8 +1328,6 @@ struct scarlett2_data {
 	struct snd_kcontrol *mux_ctls[SCARLETT2_MUX_MAX];
 	struct snd_kcontrol *mix_ctls[SCARLETT2_MIX_MAX];
 	struct snd_kcontrol *compressor_ctls[SCARLETT2_COMPRESSOR_CTLS_MAX];
-	struct snd_kcontrol *precomp_flt_ctls[SCARLETT2_PRECOMP_FLT_CTLS_MAX];
-	struct snd_kcontrol *peq_flt_ctls[SCARLETT2_PEQ_FLT_CTLS_MAX];
 	struct snd_kcontrol *precomp_flt_switch_ctls[SCARLETT2_DSP_SWITCH_MAX];
 	struct snd_kcontrol *peq_flt_switch_ctls[SCARLETT2_DSP_SWITCH_MAX];
 	struct snd_kcontrol *direct_monitor_ctl;
@@ -3447,7 +3445,6 @@ static int scarlett2_update_autogain(struct usb_mixer_interface *mixer)
 			private->autogain_status[i] =
 				private->num_autogain_status_texts - 1;
 
-
 	for (i = 0; i < SCARLETT2_AG_TARGET_COUNT; i++)
 		if (scarlett2_has_config_item(private,
 					      scarlett2_ag_target_configs[i])) {
@@ -5372,8 +5369,7 @@ static int scarlett2_update_filter_values(struct usb_mixer_interface *mixer)
 
 	err = scarlett2_usb_get_config(
 		mixer, SCARLETT2_CONFIG_PEQ_FLT_SWITCH,
-		info->dsp_input_count * info->peq_flt_count,
-		private->peq_flt_switch);
+		info->dsp_input_count, private->peq_flt_switch);
 	if (err < 0)
 		return err;
 
@@ -6546,7 +6542,7 @@ static int scarlett2_add_dsp_ctls(struct usb_mixer_interface *mixer, int i)
 		err = scarlett2_add_new_ctl(
 			mixer, &scarlett2_precomp_flt_ctl,
 			i * info->precomp_flt_count + j,
-			1, s, &private->precomp_flt_switch_ctls[j]);
+			1, s, NULL);
 		if (err < 0)
 			return err;
 	}
@@ -6556,7 +6552,7 @@ static int scarlett2_add_dsp_ctls(struct usb_mixer_interface *mixer, int i)
 		err = scarlett2_add_new_ctl(
 			mixer, &scarlett2_peq_flt_ctl,
 			i * info->peq_flt_count + j,
-			1, s, &private->peq_flt_switch_ctls[j]);
+			1, s, NULL);
 		if (err < 0)
 			return err;
 	}
-- 
2.53.0

