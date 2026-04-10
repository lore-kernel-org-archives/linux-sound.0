Received: from sender4-op-o15.zoho.com (sender4-op-o15.zoho.com [136.143.188.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FCBA3E3D9B;
	Fri, 10 Apr 2026 17:49:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.15
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775843372; cv=pass; b=c3CuLc6WUJgXCld8qjobPehJnWp+MHMSUj5sASAbYqcfpEfKvYAIV2GkxQnZDkTt/eGjR6XzkD+Ny6Z3bfPDkC0FWL7/Pdb7JVLWfq/vfjSgzucqyGTkp5Gb99OWCpMzAC+qu7UQU7hWkzCt8/b2pGDtOxTS4v7sydZYQEpDO7o=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775843372; c=relaxed/simple;
	bh=mETUt9k6JDPxxneKHhEm35pjoJWyMubho1yhlw9vQPw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=SVciZ7KOrz8W+LnPtPzdkbxKd0nJ1gZTOuei7bf4ygJ4h7vCrJVJaAbdw3hV6KabnC3JWcVxTo/do4bgitPDmalyp6NMc4pIO42MRSJYT9qwb9arN0QgxeKqze9a3zng6/rHAxsCPxxSsaY/y/odUhipuh21VcHM9G4dcrXxHjs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rong.moe; spf=pass smtp.mailfrom=rong.moe; dkim=pass (2048-bit key) header.d=rong.moe header.i=i@rong.moe header.b=BLUQV3Ld; arc=pass smtp.client-ip=136.143.188.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rong.moe
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rong.moe
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rong.moe header.i=i@rong.moe header.b="BLUQV3Ld"
ARC-Seal: i=1; a=rsa-sha256; t=1775843365; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=iSssBFesKdar1NZm8MOGY3LHN5yLscCsfY12G6IosmdwJ7To/nxiFdcNkEQ7G5ZFZuoE1KUGYfo/9PW11qRq0Q31O5Vu1mVA7tF2jmJbF7SAg6oi/dqkvEiR9ExorV5ulgnSrcwcjwilGmCui1rpDWLAGy58VfH/+N8zVl8jZyo=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1775843365; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=CBLpvIFklAKcz1OZtU2w+GwIgrjo7+BQ/Bq7bLzCADI=; 
	b=IrXb1cmJNvDVadF2cXydZORaLGGbgkps7ZAKaHOLmZA3+7TXIAb1PzPNeWBan4A/BTHFxeVNf1bH/NVeBlTFqiwG4Jws+CtcgfRrjSPm5m4iumduDE3wytxkSxZgvXLZwm2kjND3nnWnORE3gC2cu8ciPB3xYFF/+tLhusKJEow=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=rong.moe;
	spf=pass  smtp.mailfrom=i@rong.moe;
	dmarc=pass header.from=<i@rong.moe>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1775843365;
	s=zmail2048; d=rong.moe; i=i@rong.moe;
	h=From:From:Date:Date:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Message-Id:References:In-Reply-To:To:To:Cc:Cc:Reply-To;
	bh=CBLpvIFklAKcz1OZtU2w+GwIgrjo7+BQ/Bq7bLzCADI=;
	b=BLUQV3LdeT6Wp5ILVq36Poz7ID+VP1U/7zPs76hdVWg0Q/2Jx1JAJPbgPX4h4ep3
	35gOqLaSkp+1361obF6Xl9O3WdGyePgWeQY+JcgCUQZWqWfLUepgIED84tGMOEo+pA9
	kVnwUSVU6JPcsjqQuK3DOdIlovtG2vp+T+54kGj8P6vonBcLAq2mPypiU+xhsRV+rEr
	tA5r7jdy+0vxwi3cHlSah3iynYERYChaK49CpQtJAwWwixcSUyWtwW9+6eeRCQ5beex
	s/tU/hpqb1g3jEOLfeq0heY5m9eO8fmDljxDh+A26N0A/z64q2K0uH01fA38cRLbjax
	rTePQdmCRg==
Received: by mx.zohomail.com with SMTPS id 1775843364741333.1102189571038;
	Fri, 10 Apr 2026 10:49:24 -0700 (PDT)
From: Rong Zhang <i@rong.moe>
Date: Sat, 11 Apr 2026 01:49:03 +0800
Subject: [PATCH 2/3] ALSA: usb-audio: Move volume control resolution check
 into a function
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260411-uac-sticky-mixer-v1-2-29d62717befd@rong.moe>
References: <20260411-uac-sticky-mixer-v1-0-29d62717befd@rong.moe>
In-Reply-To: <20260411-uac-sticky-mixer-v1-0-29d62717befd@rong.moe>
To: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Cc: Icenowy Zheng <uwu@icenowy.me>, linux-sound@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Rong Zhang <i@rong.moe>, 
 Takashi Iwai <tiwai@suse.de>
X-Mailer: b4 0.16-dev-7777e
X-ZohoMailClient: External

get_min_max_with_quirks() is too lengthy and hard to read.

Move the volume control resolution check code into a function as it's
relatively self-contained.

Suggested-by: Takashi Iwai <tiwai@suse.de>
Link: https://lore.kernel.org/r/87o6jsk3vs.wl-tiwai@suse.de
Signed-off-by: Rong Zhang <i@rong.moe>
---
 sound/usb/mixer.c | 65 +++++++++++++++++++++++++++++++++----------------------
 1 file changed, 39 insertions(+), 26 deletions(-)

diff --git a/sound/usb/mixer.c b/sound/usb/mixer.c
index e5993364c825..e77c2d78a782 100644
--- a/sound/usb/mixer.c
+++ b/sound/usb/mixer.c
@@ -1232,6 +1232,38 @@ static void init_cur_mix_raw(struct usb_mixer_elem_info *cval, int ch, int idx)
 	snd_usb_set_cur_mix_value(cval, ch, idx, cval->min);
 }
 
+/*
+ * Additional checks for the proper resolution
+ *
+ * Some devices report smaller resolutions than actually reacting.
+ * They don't return errors but simply clip to the lower aligned value.
+ */
+static void check_volume_control_res(struct usb_mixer_elem_info *cval,
+				     int channel, int saved)
+{
+	int last_valid_res = cval->res;
+	int test, check;
+
+	for (;;) {
+		test = saved;
+		if (test < cval->max)
+			test += cval->res;
+		else
+			test -= cval->res;
+
+		if (test < cval->min || test > cval->max ||
+		    snd_usb_set_cur_mix_value(cval, channel, 0, test) ||
+		    get_cur_mix_raw(cval, channel, &check)) {
+			cval->res = last_valid_res;
+			break;
+		}
+		if (test == check)
+			break;
+
+		cval->res *= 2;
+	}
+}
+
 /*
  * retrieve the minimum and maximum values for the specified control
  */
@@ -1287,37 +1319,18 @@ static int get_min_max_with_quirks(struct usb_mixer_elem_info *cval,
 		if (cval->res == 0)
 			cval->res = 1;
 
-		/* Additional checks for the proper resolution
-		 *
-		 * Some devices report smaller resolutions than actually
-		 * reacting.  They don't return errors but simply clip
-		 * to the lower aligned value.
-		 */
 		if (cval->min + cval->res < cval->max) {
-			int last_valid_res = cval->res;
-			int saved, test, check;
+			int saved;
+
 			if (get_cur_mix_raw(cval, minchn, &saved) < 0)
-				goto no_res_check;
-			for (;;) {
-				test = saved;
-				if (test < cval->max)
-					test += cval->res;
-				else
-					test -= cval->res;
-				if (test < cval->min || test > cval->max ||
-				    snd_usb_set_cur_mix_value(cval, minchn, 0, test) ||
-				    get_cur_mix_raw(cval, minchn, &check)) {
-					cval->res = last_valid_res;
-					break;
-				}
-				if (test == check)
-					break;
-				cval->res *= 2;
-			}
+				goto no_checks;
+
+			check_volume_control_res(cval, minchn, saved);
+
 			snd_usb_set_cur_mix_value(cval, minchn, 0, saved);
 		}
 
-no_res_check:
+no_checks:
 		cval->initialized = 1;
 	}
 

-- 
2.53.0

