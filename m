Received: from sender4-op-o15.zoho.com (sender4-op-o15.zoho.com [136.143.188.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2A0D3E3DAB;
	Fri, 10 Apr 2026 17:49:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.15
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775843373; cv=pass; b=U+vZ0SLsZRKlJqPvTIYHIgz1WQMbiCypm6RDzZj8GqDmO5cCW0s15ijWbTlbEJ7MNl+y30A1RiZESCWCd/0qTOxU9gl2k3sBiGSKfCt+3qYOotLIRF8olGWGmHlwUmLSHYxfC8/9YhXWb0UTsvKuNO9eX9zUvn/KGx2YbzG+UaE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775843373; c=relaxed/simple;
	bh=Md3rkaq4+nr/5QW5uyDPDn7eKL5WVj8e6Y/eolmq3gg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=UKCQVMOprnYbQBv15dqZaE8B0W3I/NmmfzDE9Xi970D/WbM4qnVnkMwXK6EY9JUacGAtTPzxyREIDOSyJTEeymhe2d9PUlpjC4/Lfl1eNWirscqm6yq5xye7NCKzfl7Pyy+p+HgTKcchB7gfQmbdzjtDA5mNf6ywUrHCBc9C/5U=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rong.moe; spf=pass smtp.mailfrom=rong.moe; dkim=pass (2048-bit key) header.d=rong.moe header.i=i@rong.moe header.b=ahVGZDZh; arc=pass smtp.client-ip=136.143.188.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rong.moe
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rong.moe
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rong.moe header.i=i@rong.moe header.b="ahVGZDZh"
ARC-Seal: i=1; a=rsa-sha256; t=1775843369; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=amnSQTAQ/J/uV8G5J5WzlVqs5Yokw98u0HR+xGiBSLewiRcUjEmm/EPjQHbIxgAFGiYklO/7W58GyTHVgt9z37g0wAwnfvZjKf55S8EeQVcj0zm2h7mP3HteDbvg07/BAV7z+/2I1EVwayX8+gmh8HzKcvvUb/h5ELreRdJRzRE=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1775843369; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=QZ5K7I8Iu+fbtU8fbuh0FjkoXoLXYGZc3GXmfvioo2E=; 
	b=FoFlnvQJD6gbkrsxIWcOVOa+oshYHkk1fFsafdWUvjjDL0epBMSKkVorZKKshx/xTuvlV4h9LmO6wZtXW3TSx2pduvXR/VXoBEUvVLdNpjbKhQ7bVZSK6T6VKlrifV8qZeD6W83LnSTNcYnLN0LuEcDTAG3oAUh/t/tw8YRD/I8=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=rong.moe;
	spf=pass  smtp.mailfrom=i@rong.moe;
	dmarc=pass header.from=<i@rong.moe>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1775843369;
	s=zmail2048; d=rong.moe; i=i@rong.moe;
	h=From:From:Date:Date:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Message-Id:References:In-Reply-To:To:To:Cc:Cc:Reply-To;
	bh=QZ5K7I8Iu+fbtU8fbuh0FjkoXoLXYGZc3GXmfvioo2E=;
	b=ahVGZDZhSKaQ8JsOD40yxg/i78L+u/+oxs1WJMGiY0MWjsJztzdT8IxDed0lqq2X
	33B1y9K2gCT8M6wqJ8wA4Xknd5zDHGyync4+PYBeOjw2Vdu4OxeoawH+tSwsajWFp2J
	jyPHYL2LvdqF9I8SAM172SBeqahr5MPh23lfsnGyQloPXmKUzYyjpMVP+gYEsBc2ADo
	37BjLibHrgjBs8el4N9LImtoi7jH9vxHMICXNHFGFCe3k1x1o76epOFpSiiycsjazPV
	zAGPfgkLDr9hv33Ey4E3FTCqcDP3A8fht/aN6F3gsYwSt2dnSuihvuYACMwYI9u82mj
	JxGn8SvQVA==
Received: by mx.zohomail.com with SMTPS id 1775843366861958.5126226545515;
	Fri, 10 Apr 2026 10:49:26 -0700 (PDT)
From: Rong Zhang <i@rong.moe>
Date: Sat, 11 Apr 2026 01:49:04 +0800
Subject: [PATCH 3/3] ALSA: usb-audio: Do not expose sticky mixers
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260411-uac-sticky-mixer-v1-3-29d62717befd@rong.moe>
References: <20260411-uac-sticky-mixer-v1-0-29d62717befd@rong.moe>
In-Reply-To: <20260411-uac-sticky-mixer-v1-0-29d62717befd@rong.moe>
To: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Cc: Icenowy Zheng <uwu@icenowy.me>, linux-sound@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Rong Zhang <i@rong.moe>
X-Mailer: b4 0.16-dev-7777e
X-ZohoMailClient: External

Some devices' mixers are sticky, which accept SET_CUR but do absolutely
nothing. Registering these mixers confuses userspace and results in
ineffective volume control.

Check if a mixer is sticky by setting the volume to the maximum or
minimum value and checking for effectiveness afterward. Prevent the
mixer from being registered if it turns out to be sticky.

Quirky device sample:

  usb 7-1: New USB device found, idVendor=0e0b, idProduct=fa01, bcdDevice= 1.00
  usb 7-1: New USB device strings: Mfr=1, Product=2, SerialNumber=3
  usb 7-1: Product: Feaulle Rainbow
  usb 7-1: Manufacturer: Generic
  usb 7-1: SerialNumber: 20210726905926
  (Mic Capture Volume)

Signed-off-by: Rong Zhang <i@rong.moe>
---
 sound/usb/mixer.c | 48 +++++++++++++++++++++++++++++++++++++++++++++---
 1 file changed, 45 insertions(+), 3 deletions(-)

diff --git a/sound/usb/mixer.c b/sound/usb/mixer.c
index e77c2d78a782..d4ef45bf53d7 100644
--- a/sound/usb/mixer.c
+++ b/sound/usb/mixer.c
@@ -1232,6 +1232,41 @@ static void init_cur_mix_raw(struct usb_mixer_elem_info *cval, int ch, int idx)
 	snd_usb_set_cur_mix_value(cval, ch, idx, cval->min);
 }
 
+/*
+ * Additional checks for sticky mixers
+ *
+ * Some devices' volume control mixers are sticky, which accept SET_CUR but
+ * do absolutely nothing.
+ *
+ * Prevent sticky mixers from being registered, otherwise they confuses
+ * userspace and results in ineffective volume control.
+ */
+static int check_sticky_volume_control(struct usb_mixer_elem_info *cval,
+				       int channel, int saved)
+{
+	int sticky_test_values[] = { cval->min, cval->max };
+	int test, check, i;
+
+	for (i = 0; i < ARRAY_SIZE(sticky_test_values); i++) {
+		test = sticky_test_values[i];
+		if (test == saved)
+			continue;
+
+		/* Assume non-sticky on failure. */
+		if (snd_usb_set_cur_mix_value(cval, channel, 0, test) ||
+		    get_cur_mix_raw(cval, channel, &check) ||
+		    check != saved) /* SET_CUR effective, non-sticky. */
+			return 0;
+	}
+
+	usb_audio_err(cval->head.mixer->chip,
+		      "%d:%d: sticky mixer values (%d/%d/%d => %d), disabling\n",
+		      cval->head.id, mixer_ctrl_intf(cval->head.mixer),
+		      cval->min, cval->max, cval->res, saved);
+
+	return -ENODEV;
+}
+
 /*
  * Additional checks for the proper resolution
  *
@@ -1270,7 +1305,7 @@ static void check_volume_control_res(struct usb_mixer_elem_info *cval,
 static int get_min_max_with_quirks(struct usb_mixer_elem_info *cval,
 				   int default_min, struct snd_kcontrol *kctl)
 {
-	int i, idx;
+	int i, idx, ret;
 
 	/* for failsafe */
 	cval->min = default_min;
@@ -1319,13 +1354,20 @@ static int get_min_max_with_quirks(struct usb_mixer_elem_info *cval,
 		if (cval->res == 0)
 			cval->res = 1;
 
-		if (cval->min + cval->res < cval->max) {
+		if (cval->min < cval->max) {
 			int saved;
 
 			if (get_cur_mix_raw(cval, minchn, &saved) < 0)
 				goto no_checks;
 
-			check_volume_control_res(cval, minchn, saved);
+			ret = check_sticky_volume_control(cval, minchn, saved);
+			if (ret < 0) {
+				snd_usb_set_cur_mix_value(cval, minchn, 0, saved);
+				return ret;
+			}
+
+			if (cval->min + cval->res < cval->max)
+				check_volume_control_res(cval, minchn, saved);
 
 			snd_usb_set_cur_mix_value(cval, minchn, 0, saved);
 		}

-- 
2.53.0

