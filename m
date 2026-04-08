Received: from sender4-op-o15.zoho.com (sender4-op-o15.zoho.com [136.143.188.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE07228C87C;
	Wed,  8 Apr 2026 18:33:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.15
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775673204; cv=pass; b=em7AmARuPvyg9pYP8WxCNr0GWhe1ldmdzLOJK47j84FgKEudTyd6n3V/BIQPiUqJWIdYvhmS/aFyFmQW+vjXdXJ6GGK/3T+5zc9LzKVbtnvJUVqV2CRUbPNKAYwVZe0hYonZAoPDAU5PJNfDd+wshrOfyYkboUwQIj/kj8MoXKI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775673204; c=relaxed/simple;
	bh=xxNFhyT7IqOzBtMkW0QGHNOtyIrF1vPhEYVEZyOy/QQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=D5vpFHZ4/EvnY+kQ6nT8FRfVS/FJdlqri02K9sa6eO9GWzGDOdI0Udj0FfUcFijw1OUwwUHon6L0IlSgdXYdf6ytFCRxC3W5mmtggZnpotA2l6JwcEI7MIBcXX9XHF8qgPC161DNYaJB+Ly/J6qV8crbjAoAFGpwOsqyfKivT8o=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rong.moe; spf=pass smtp.mailfrom=rong.moe; dkim=pass (2048-bit key) header.d=rong.moe header.i=i@rong.moe header.b=Os8U1POi; arc=pass smtp.client-ip=136.143.188.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rong.moe
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rong.moe
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rong.moe header.i=i@rong.moe header.b="Os8U1POi"
ARC-Seal: i=1; a=rsa-sha256; t=1775673199; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=dvwBCTQKjPmCe+V782a7RTPAsmCLV1GXL4JvANDzykBDnGqWxWZSiZTdsyXKnWQWXngR4R47oX2ltpyuzXmr4Nh05uyKs/nnTCgsMs9elJTUB5ySbTAURbcKEP+z5GudfXBAf1hRVfsjQgHtlVVPJbJ81q+URXZqjUsKJ0kYrRA=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1775673199; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=RFy27SApvqF3icQnyxWXdS+v7DCve4qkFZw7zq5B/XA=; 
	b=ejUI8h5Z2SeDixVuCjaIj7/9+wlKw+2a0uQgrIaYf068fSDG2kxLQLTbO4dEmOiQ8flASBgX58xxj0WmFDpXldQ9iHYIakCuTvaFOCc51bKj4Y5s/PrOgUJ77Nk728xkUTbcYFCziYMDANkQlqR+qtCDAlflRcMl++NraFyzMOo=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=rong.moe;
	spf=pass  smtp.mailfrom=i@rong.moe;
	dmarc=pass header.from=<i@rong.moe>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1775673199;
	s=zmail2048; d=rong.moe; i=i@rong.moe;
	h=From:From:Date:Date:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Message-Id:References:In-Reply-To:To:To:Cc:Cc:Reply-To;
	bh=RFy27SApvqF3icQnyxWXdS+v7DCve4qkFZw7zq5B/XA=;
	b=Os8U1POiV65p8fSW9JRMWp0km8wWmn2jYTNlRD2FfiaodWX7HPB1CXONWCxWt5K+
	B8nnV8HOG70zfykLU5otIKM9KNkas0lFoUHn4JoBI1LL8lWealPWbgkZUo6T5R831lU
	sCgtJlWwrwXjqlKgsDdJweKUcwuS36g2w8OrLMFRcyvXVMq5Y9+AHYvENUJnFQFJk44
	IwUS3yheaOovsZ3TsP1VKteXnLIU7kbieO8Im/KR9jmfCP6gGkNPx5A0w3vxMXK2RHT
	mVliWoEpfRoAZSPTholhWk42O1EUXBdl9N8jZBEErxtXIa36uUcC4M50mWT7qCTP1Fw
	bF8QWg9Rew==
Received: by mx.zohomail.com with SMTPS id 1775673198829885.1559668373858;
	Wed, 8 Apr 2026 11:33:18 -0700 (PDT)
From: Rong Zhang <i@rong.moe>
Date: Thu, 09 Apr 2026 02:33:06 +0800
Subject: [PATCH 2/2] ALSA: usb-audio: Do not expose sticky volume control
 mixers
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260409-feaulle-rainbow-v1-2-09179e09000d@rong.moe>
References: <20260409-feaulle-rainbow-v1-0-09179e09000d@rong.moe>
In-Reply-To: <20260409-feaulle-rainbow-v1-0-09179e09000d@rong.moe>
To: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Icenowy Zheng <uwu@icenowy.me>, Rong Zhang <i@rong.moe>
X-Mailer: b4 0.16-dev-7777e
X-ZohoMailClient: External

Some devices expose sticky mixers that accept SET_CUR but do absolutely
nothing. Registering mixers for them confuses userspace and results in
ineffective volume control.

Check if the volume control is sticky by setting the volume to the
maximum or minimum value, and prevent the mixer from being registered
accordingly.

Quirky device sample:

  usb 7-1: New USB device found, idVendor=0e0b, idProduct=fa01, bcdDevice= 1.00
  usb 7-1: New USB device strings: Mfr=1, Product=2, SerialNumber=3
  usb 7-1: Product: Feaulle Rainbow
  usb 7-1: Manufacturer: Generic
  usb 7-1: SerialNumber: 20210726905926
  (Mic Capture Volume)

Signed-off-by: Rong Zhang <i@rong.moe>
---
 sound/usb/mixer.c | 37 +++++++++++++++++++++++++++++++++++--
 1 file changed, 35 insertions(+), 2 deletions(-)

diff --git a/sound/usb/mixer.c b/sound/usb/mixer.c
index a25e8145af67..9f0aed36e27d 100644
--- a/sound/usb/mixer.c
+++ b/sound/usb/mixer.c
@@ -27,6 +27,7 @@
  *  	- parse available sample rates again when clock sources changed
  */
 
+#include <linux/array_size.h>
 #include <linux/bitops.h>
 #include <linux/init.h>
 #include <linux/list.h>
@@ -1287,17 +1288,49 @@ static int get_min_max_with_quirks(struct usb_mixer_elem_info *cval,
 		if (cval->res == 0)
 			cval->res = 1;
 
-		/* Additional checks for the proper resolution
+		/* Additional checks
+		 *
+		 * Some devices expose sticky mixers that accept SET_CUR
+		 * but do absolutely nothing.
 		 *
 		 * Some devices report smaller resolutions than actually
 		 * reacting.  They don't return errors but simply clip
 		 * to the lower aligned value.
 		 */
-		if (cval->min + cval->res < cval->max) {
+		if (cval->min < cval->max) {
+			int sticky_test_values[] = { cval->min, cval->max };
 			int last_valid_res = cval->res;
 			int saved, test, check;
+			bool effective = false;
+
 			if (get_cur_mix_raw(cval, minchn, &saved) < 0)
 				goto no_res_check;
+
+			for (i = 0; i < ARRAY_SIZE(sticky_test_values); i++) {
+				test = sticky_test_values[i];
+				if (test == saved)
+					continue;
+				/* Assume non-sticky on failure. */
+				if (snd_usb_set_cur_mix_value(cval, minchn, 0, test) ||
+				    get_cur_mix_raw(cval, minchn, &check) ||
+				    check != saved) { /* SET_CUR effective, non-sticky. */
+					effective = true;
+					break;
+				}
+			}
+			if (!effective) {
+				usb_audio_warn(cval->head.mixer->chip,
+					"%d:%d: sticky mixer values (%d/%d/%d => %d), disabling\n",
+					cval->head.id, mixer_ctrl_intf(cval->head.mixer),
+					cval->min, cval->max, cval->res, saved);
+
+				cval->initialized = 1;
+				cval->min = cval->max = cval->res = 0;
+				return -ENODEV;
+			}
+
+			if (cval->min + cval->res >= cval->max)
+				goto no_res_check;
 			for (;;) {
 				test = saved;
 				if (test < cval->max)

-- 
2.53.0

