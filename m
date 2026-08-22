Received: from sender4-op-o12.zoho.com (sender4-op-o12.zoho.com [136.143.188.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE26232B10A;
	Sat, 22 Aug 2026 18:54:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.12
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787424879; cv=pass; b=fUffg8RwW/+SPXfQp2GwNLgFEXkiKGB/BbbVvXGa7G4SsqLmyI54n82Hsg1wHtO2OimniizdlGnkg2RIENJrnVIOJO/Ri8fLWwao8Mtw0k+t8fHsbqv3R7Te4R+L3TXMs4/kH0t2rZpz2awKlDdIGc+b8iwtGmjbaqnJP8vru+E=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787424879; c=relaxed/simple;
	bh=cIdsi16KYfmArbHlwos2XlaIozotTu1XUWVT5/kBi2Y=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Va+KOB+Akudm5YtK31txtD5dN2D+2AqnPp4eTu8G44BPjDBNxsCKM+j61dTOWAZYD8hDbqDH8KK/giSo0f/6MM9Ql5l4Jcouz+b93c89qNPxxqlF+AmjeHXqZYiTdMgqYJ8gyCHZEy2+optvQ3vkeC6T6aPodPDrhcqpmRUnLK4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=rong.moe; spf=pass smtp.mailfrom=rong.moe; dkim=pass (2048-bit key) header.d=rong.moe header.i=i@rong.moe header.b=Le+9owVn; arc=pass smtp.client-ip=136.143.188.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=rong.moe
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rong.moe
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rong.moe header.i=i@rong.moe header.b="Le+9owVn"
ARC-Seal: i=1; a=rsa-sha256; t=1787424780; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=keNiYFhLF5qhKOlE3TT2LPr0jBEoZ6LWBujWXWZ4ULVYXJpnEpqSF5G/PuoRWXihQ42LxxMkN6ExN9Q4hzWO1A3NSTVMyXg4sorAY+XQUEojLucVfLZgaI9j0BeW2KSNVwqEs8hcUQUqXSb2RzaOqHTnWHsXLK9VIsQG89dAv34=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1787424780; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=n4skxt1W9Q/KTVkKzt52x0YjIHLTwff6q1FoVcG/OaA=; 
	b=D80KQODLl8S3YP2zUscFnIRKKhk284lU7PNuhHb8VdjC8AsVtyj5XGQkVS3+yZJYKoLvK4fWs/oUsQ5GHLGDlEO22zrCED9hRjV7O0aWrKq26+N6B+w4ZDzZvWGqCACmx04z6wgg5a1Oic5/+XsCzuaz5fg2xO6544vbmQfb458=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=rong.moe;
	spf=pass  smtp.mailfrom=i@rong.moe;
	dmarc=pass header.from=<i@rong.moe>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1787424780;
	s=zmail2048; d=rong.moe; i=i@rong.moe;
	h=From:From:Date:Date:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Message-Id:In-Reply-To:To:To:Cc:Cc:Reply-To;
	bh=n4skxt1W9Q/KTVkKzt52x0YjIHLTwff6q1FoVcG/OaA=;
	b=Le+9owVnOBO+FHUI9TkDTJW7L/XFLwQEgTsCPFcaRdouAb3QPLdhl1gxhFLTfQzF
	5h2snmuCaVcFIC7EZdbhJAXGpjg+G4qFM6Sh0eDxRvU2shRjSZY4fSwzCumDRWqesGs
	jETG2ppc52ja/gxrEFl1d033tGlfugMmKmalCUroALRsLtjjmVj1rK67v+wCvh2RLsQ
	yzMglK6CylhKEoQesKHbJLs8ALL97BDkLm8wgFVFeIX3ksrAv3PQY66hl294/Yn9ytC
	ELlWsL+Hh9JyMrwjUjyJRPFCD+VZbRQeeXDlrzCkbWdqVqM+fDq5ehdcgKYchB+UAp8
	HdKFJu+XsQ==
Received: by mx.zohomail.com with SMTPS id 1787424779688245.1587139544588;
	Sat, 22 Aug 2026 11:52:59 -0700 (PDT)
From: Rong Zhang <i@rong.moe>
Date: Sun, 23 Aug 2026 02:52:29 +0800
Subject: [PATCH 2/4] ALSA: usb-audio: Demote the severity of sticky GET_CUR
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260823-uac-demote-sticky-check-v1-2-a8cbe572edff@rong.moe>
References: <20260823-uac-demote-sticky-check-v1-0-a8cbe572edff@rong.moe>
In-Reply-To: <20260823-uac-demote-sticky-check-v1-0-a8cbe572edff@rong.moe>
To: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
 Randy Dunlap <rdunlap@infradead.org>
Cc: Takashi Iwai <tiwai@suse.de>, linux-sound@vger.kernel.org, 
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Alexander Niemeyer <adventureFAN@gmx.de>, Rong Zhang <i@rong.moe>
X-Mailer: b4 0.17-dev-1f2f7
X-ZohoMailClient: External

Currently, a mixer is disabled when its GET_CUR is sticky, causing
userspace to fall back to soft mixers, unless
QUIRK_FLAG_MIXER_GET_CUR_BROKEN is set. This leads to issues on some
wireless headphones with broken GET_CUR but effective SET_CUR, which use
poorly-performed lossy codecs and are prone to audible distortion at low
volume. They have to set the quirk flag to reeanble the mixer.

Considering that users can always opt into soft mixers if they need it,
i.e., when SET_CUR is stubbed, demote the severity of sticky GET_CUR by
marking GET_CUR as broken and only provide mixer values from the cache.
The mixer itself is still registered.

Signed-off-by: Rong Zhang <i@rong.moe>
---
 sound/usb/mixer.c | 76 +++++++++++++++----------------------------------------
 1 file changed, 21 insertions(+), 55 deletions(-)

diff --git a/sound/usb/mixer.c b/sound/usb/mixer.c
index 5de182181ede..3aa9a9c12557 100644
--- a/sound/usb/mixer.c
+++ b/sound/usb/mixer.c
@@ -1237,21 +1237,27 @@ static void init_cur_mix_raw(struct usb_mixer_elem_info *cval, int ch, int idx)
 }
 
 /*
- * Additional checks for sticky mixers
+ * Additional checks for sticky GET_CUR
  *
- * Some devices' volume control mixers are sticky, which accept SET_CUR but
- * do absolutely nothing.
+ * Some devices' volume control mixers have sticky GET_CUR, which implies either
+ * stubbed SET_CUR or broken GET_CUR. For the former case, the mixer accepts
+ * SET_CUR but do absolutely nothing, so falling back to soft mixer is the only
+ * way to control the volume. For the latter case, the mixer has effective
+ * SET_CUR despite GET_CUR being constant, and the mixer is usable as long as we
+ * always provide mixer value from the ceche.
  *
  * Check the return values of GET_CUR with different SET_CUR values. Consider
- * the mixer as sticky if GET_CUR always returns a constant value.
+ * GET_CUR as sticky if GET_CUR always returns a constant value.
  *
- * Some devices have effective SET_CUR despite GET_CUR being constant. Do not
- * consider the mixer as sticky if a quirk flag indicates that.
+ * Unfortunately, we can't distinguish between stubbed SET_CUR and broken
+ * GET_CUR with simple read-back tests. Disabling the mixer regardless and
+ * forcing userspace to use soft mixer instead can lead to audible distortion at
+ * low volume on some wireless headphones, probably due to their poorly-
+ * performed lossy codec.
  *
- * Gate the registration of sticky mixers to prevent confusing userspace, so
- * that they won't cause ineffective volume control. However, for mixers with
- * effective SET_CUR but broken GET_CUR, the registration can continue normally
- * but further GET_CUR requests will be gated.
+ * Instead, mark GET_CUR as broken regardless and only provide mixer value from
+ * the cache. Users may opt into soft mixer in userspace audio stack if they
+ * need it.
  */
 static int check_sticky_volume_control(struct usb_mixer_elem_info *cval,
 				       int channel, int saved)
@@ -1271,24 +1277,13 @@ static int check_sticky_volume_control(struct usb_mixer_elem_info *cval,
 			return 0;
 	}
 
-	if (cval->head.mixer->chip->quirk_flags & QUIRK_FLAG_MIXER_GET_CUR_BROKEN) {
-		usb_audio_info(cval->head.mixer->chip,
-			       "%d:%d: broken mixer GET_CUR (%d/%d/%d => %d)\n",
-			       cval->head.id, mixer_ctrl_intf(cval->head.mixer),
-			       cval->min, cval->max, cval->res, saved);
-
-		cval->get_cur_broken = 1;
-		return -ENXIO;
-	}
-
-	usb_audio_err(cval->head.mixer->chip,
-		      "%d:%d: sticky mixer values (%d/%d/%d => %d), disabling\n",
-		      cval->head.id, mixer_ctrl_intf(cval->head.mixer),
-		      cval->min, cval->max, cval->res, saved);
 	usb_audio_info(cval->head.mixer->chip,
-		       "check MIXER_GET_CUR_BROKEN if you believe the mixer is non-sticky");
+		       "%d:%d: broken mixer GET_CUR (%d/%d/%d => %d)\n",
+		       cval->head.id, mixer_ctrl_intf(cval->head.mixer),
+		       cval->min, cval->max, cval->res, saved);
 
-	return -ENODEV;
+	cval->get_cur_broken = 1;
+	return -ENXIO;
 }
 
 /*
@@ -1385,8 +1380,6 @@ static int get_min_max_with_quirks(struct usb_mixer_elem_info *cval,
 				goto no_checks;
 
 			ret = check_sticky_volume_control(cval, minchn, saved);
-			if (ret == -ENODEV)
-				goto sticky;
 			if (ret)
 				goto no_checks;
 
@@ -1455,33 +1448,6 @@ static int get_min_max_with_quirks(struct usb_mixer_elem_info *cval,
 	}
 
 	return 0;
-
-sticky:
-	/*
-	 * It makes no sense to restore the saved value for a sticky mixer,
-	 * since setting any value is a no-op.
-	 *
-	 * However, in some rare cases, SET_CUR is effective despite GET_CUR
-	 * always returns a constant value. These mixers are not sticky, but
-	 * there's no way to distinguish them. Without any additional
-	 * information, the best thing we can do is to set the mixer value to
-	 * the maximum before bailing out, so that a soft mixer can still reach
-	 * the maximum hardware volume if the mixer turns out to be non-sticky.
-	 * Meanwhile, all channels must be synchronized to prevent imbalance
-	 * volume.
-	 */
-	if (!cval->cmask) {
-		snd_usb_set_cur_mix_value(cval, 0, 0, cval->max);
-	} else {
-		idx = 0;
-		for (i = 0; i < MAX_CHANNELS; i++) {
-			if (cval->cmask & BIT(i)) {
-				snd_usb_set_cur_mix_value(cval, i + 1, idx, cval->max);
-				idx++;
-			}
-		}
-	}
-	return ret;
 }
 
 #define get_min_max(cval, def)	get_min_max_with_quirks(cval, def, NULL)

-- 
2.55.0

