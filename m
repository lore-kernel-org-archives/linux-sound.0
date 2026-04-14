Received: from sender4-op-o15.zoho.com (sender4-op-o15.zoho.com [136.143.188.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19FBC3AE71E;
	Tue, 14 Apr 2026 13:29:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.15
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776173378; cv=pass; b=tCReeQTTAcswtZrONb1lc4CVVLiY3FCQ7vyM5WQryl/AebwVbdyXW94uZoA+0uWSQbDoWbj/KduyqMhqeduERaLycx4N64bAeMNJOHd9a0K26YSBQdlGrq5y+ygbIqiadk8t5qFHlmZcPzv3zNVVSe/ZxheQTjoi6+8Pjpkkthk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776173378; c=relaxed/simple;
	bh=2ApvXG77ARqNCxWZVZYlywYlHFKaVoX+vE8W4TkFD94=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=NsmmwB2Lim+qi+0rdTzYsDmp5K+Fe/DqWT+LuV7QggFMsfOhgiZSyWYaZ9PD9eYKoojleG4sBzHY1tULuP1PjXMQNhRxyeQmDjeSjd1AOQMT8lL8IEKv+4hHguar0BitHyhvYdKTMD2SX+8jymZlCb5iFoteiq+njI2qh+AMaFY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rong.moe; spf=pass smtp.mailfrom=rong.moe; dkim=pass (2048-bit key) header.d=rong.moe header.i=i@rong.moe header.b=JGEsaugE; arc=pass smtp.client-ip=136.143.188.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rong.moe
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rong.moe
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rong.moe header.i=i@rong.moe header.b="JGEsaugE"
ARC-Seal: i=1; a=rsa-sha256; t=1776173363; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=C4HEY/Jlb5TEbSad8jlCB2ECJ2deMXR7kFPiwiLoCA6SpEgyDDd1yrmwf+lHf11//GsiTEeTLOQcK1tJcdBqYKlAKduZh4vzY6H+nOoQvKNcrY3N748LuyoKsW/BUl+WomFGtX6fuedQ1JrT5MZ4oZ1HQ4lE1OeudA6usjKzN8U=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1776173363; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=4/8tEt1B1KRVKhwNSbHbYVc2o1+Z19OxbOW8WaLdo9Q=; 
	b=PMS9g1ZqffrwD7F2cKavzqSYpynSW4gXCpVFvL1aCYGfB0j1QqLGbvbHZY9/lvwS0Emrky0rSPRw3/uDE+RlI8S+lRCWnz5TjQK9g+/V3RBgO7QSSKlk8kHEhZcpDW369HqZGrGIsvD6wf+fjKo/nP96lvNPXCnDeJk4AjmNeWo=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=rong.moe;
	spf=pass  smtp.mailfrom=i@rong.moe;
	dmarc=pass header.from=<i@rong.moe>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1776173363;
	s=zmail2048; d=rong.moe; i=i@rong.moe;
	h=From:From:Date:Date:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Message-Id:To:To:Cc:Cc:Reply-To;
	bh=4/8tEt1B1KRVKhwNSbHbYVc2o1+Z19OxbOW8WaLdo9Q=;
	b=JGEsaugEkjIYJUhjAGlXBcyugc2YHuwIQ9sHOYamMYzGnu5Otey2qVyZFKt8nzU2
	WmUHE0STz8npwuDi/4gOxKcGoAvjPWVzZaX/crJNIRtmNzF/SIQXs7GOkUFKaE3m7BQ
	TsGstqALNscEqf1BoNAfAmCvRZAkxScjh3EdQcgrOJ+hAVVu/ashsHjH/6duPZBiQHn
	RvlOUu98U5IUl2jDcizOtaUxkJjYVdEhx0j/RtGLcMBifpCIAS8e9Hobm24HQihPLiV
	eaYR7IOXHALzA2YXwQ087W4N/PC8tlB54WkowEYcHCf+7I5znRWsDejmlOkXZe5TYmM
	UQhbVbyeLg==
Received: by mx.zohomail.com with SMTPS id 177617336045211.622708870614247;
	Tue, 14 Apr 2026 06:29:20 -0700 (PDT)
From: Rong Zhang <i@rong.moe>
Date: Tue, 14 Apr 2026 21:29:01 +0800
Subject: [PATCH] ALSA: usb-audio: Tidy up error check for processing unit
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260414-uac-build_auto_procunit-refactor-v1-1-afeb7efa6518@rong.moe>
X-B4-Tracking: v=1; b=H4sIABxB3mkC/yXNWwrCMBCF4a2UeXYgqbGIWxEpyWSqI5KUXIpQu
 vem+vhx4D8rZE7CGW7dCokXyRJDgz51QC8bnozim6FX/aCMNlgtoavy8aOtJY5zilSDFEw8WSo
 xoVZXYydP5+HioGXmtsj3d3F//J2rezOVowvbtgPIRu8IhAAAAA==
X-Change-ID: 20260414-uac-build_auto_procunit-refactor-1084afdc365b
To: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Cc: Dan Carpenter <error27@gmail.com>, linux-sound@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Rong Zhang <i@rong.moe>
X-Mailer: b4 0.16-dev-7777e
X-ZohoMailClient: External

There are two duplicated code paths calling get_min_max() with the same
arguments in build_audio_procunit(). This once led to a failure to
notice a code path that caused the `err' variable uninitialized when
adding error checks for callers of get_min_max*() [1].

Move cases in the switch-case statement to tidy up the error check by
merging the duplicated code paths together with a fallthrough attribute.
This also eliminates the `err = 0' lines and aggregates the error check
along with the corresponding call together, so that the intent of these
code paths is clearer.

The refactor also has an interesting effect that shrinks the .text size
by 16 bytes (GCC 15 amd64). It seems that the compiler was unable to
perform dead code elimination for the `err = 0' paths before.

Link: https://lore.kernel.org/r/ad36dGpCBTGsyFr_@stanley.mountain/ [1]
Signed-off-by: Rong Zhang <i@rong.moe>
---
 sound/usb/mixer.c | 34 +++++++++++++++-------------------
 1 file changed, 15 insertions(+), 19 deletions(-)

diff --git a/sound/usb/mixer.c b/sound/usb/mixer.c
index aa6ea3be100a..85653112e7f3 100644
--- a/sound/usb/mixer.c
+++ b/sound/usb/mixer.c
@@ -2664,6 +2664,16 @@ static int build_audio_procunit(struct mixer_build *state, int unitid,
 
 		/* get min/max values */
 		switch (type) {
+		case USB_XU_CLOCK_RATE:
+			/*
+			 * E-Mu USB 0404/0202/TrackerPre/0204
+			 * samplerate control quirk
+			 */
+			cval->min = 0;
+			cval->max = 5;
+			cval->res = 1;
+			cval->initialized = 1;
+			break;
 		case UAC_PROCESS_UP_DOWNMIX: {
 			bool mode_sel = false;
 
@@ -2687,31 +2697,17 @@ static int build_audio_procunit(struct mixer_build *state, int unitid,
 				cval->max = control_spec[0];
 				cval->res = 1;
 				cval->initialized = 1;
-				err = 0;
 				break;
 			}
 
-			err = get_min_max(cval, valinfo->min_value);
-			break;
+			fallthrough;
 		}
-		case USB_XU_CLOCK_RATE:
-			/*
-			 * E-Mu USB 0404/0202/TrackerPre/0204
-			 * samplerate control quirk
-			 */
-			cval->min = 0;
-			cval->max = 5;
-			cval->res = 1;
-			cval->initialized = 1;
-			err = 0;
-			break;
 		default:
 			err = get_min_max(cval, valinfo->min_value);
-			break;
-		}
-		if (err < 0 && err != -EAGAIN) {
-			usb_mixer_elem_info_free(cval);
-			return err;
+			if (err < 0 && err != -EAGAIN) {
+				usb_mixer_elem_info_free(cval);
+				return err;
+			}
 		}
 
 		err = get_cur_ctl_value(cval, cval->control << 8, &val);

---
base-commit: a1ed2ec1c5458b4a99765439cb595dd0e026a352
change-id: 20260414-uac-build_auto_procunit-refactor-1084afdc365b

Thanks,
Rong

