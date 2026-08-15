Received: from sender4-op-o15.zoho.com (sender4-op-o15.zoho.com [136.143.188.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13FD8222590;
	Sat, 15 Aug 2026 21:48:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.15
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786830505; cv=pass; b=sAaiC1Yi54MmVHCXaTybhLCROVZ0wEFPB4Gy4kehVmPt0h2y75wMQbkWw9LZwfVC443C45+Mx5+c//BGCavkLxKQHIAtKmESwsGLxqd4d07xw2fnIsEHbrGo3IKyyCXLsI4ktMr+NLCPPpZe5B6EuNNjZbVFFbDhB9fVjrlfaXE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786830505; c=relaxed/simple;
	bh=DByIr6W6QEgppFonwMkpxo4ClpGqEkheFKXCxSN3s/Q=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=FRKQk2jhS5clzTcnUNzS2qHti5iR8dO0kzk/J9bOjZI5/dFwYUQyUpbswNBzZRXHzl+MNJnsPYZtK4xna080CjmhT/UfENNqWsOLut/ea5DFavwkVGOlYR/hn9bHDtBjq/ONI8zdRmN+PPW0CkAvwE0hqnnV8ubmXYbPN5IRXpI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=rong.moe; spf=pass smtp.mailfrom=rong.moe; dkim=pass (2048-bit key) header.d=rong.moe header.i=i@rong.moe header.b=Mxt0VjDo; arc=pass smtp.client-ip=136.143.188.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=rong.moe
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rong.moe
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rong.moe header.i=i@rong.moe header.b="Mxt0VjDo"
ARC-Seal: i=1; a=rsa-sha256; t=1786830489; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=cl82LvIWAIpDMUOFrajKjJ8oonXnpzlBf44wTaFHzsbGz+QrtMOQQcNO9MWD+HE8P6Vatrkc81ucEVe5C5VOYLygokkxOdQIM5M0FYGDNa6m/p446DVWFHThFuJDmy0qevMSKR9dvK9ZoFccYUqhn1qfN2s+9JzDkxk7FXCLjJM=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1786830489; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=xzY01G0ZFrwKksy5cokibRlMEReACnjsO60wglbmiKk=; 
	b=VC/hRkNhym4SfIVPhKshKiFPy3qH93E/HrQh2K9KKYZY7XAmK7KKyF2tctdiDGidj7AWtIuJyz1FuB/hWlCJavIl3+io/z4PL/Qn1w4ypmEfDUw+753rzz8buGAX9mJ+Yx5S3Rzr8/gIOyrTLt9HY4Podn57H6UE+6S7VRl6a74=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=rong.moe;
	spf=pass  smtp.mailfrom=i@rong.moe;
	dmarc=pass header.from=<i@rong.moe>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1786830488;
	s=zmail2048; d=rong.moe; i=i@rong.moe;
	h=From:From:Date:Date:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Message-Id:To:To:Cc:Cc:Reply-To;
	bh=xzY01G0ZFrwKksy5cokibRlMEReACnjsO60wglbmiKk=;
	b=Mxt0VjDoBPVqOLUe16Fh71bqCIm375ZbMQFx290VKGm73LHz0175Yl5m7ilckD5G
	t3DJJ0Yk4hMcMZuKSJM11StyMBbDiOQrrpeIQG3Foy4Gxsn07OLl7EjsO123n6nLFBt
	68XffSeJgy47KnUGVxtqcxyeubJo09GpQ3VopefkXzgureEPtnfYtvA5Ld0BnyQCibW
	rw28QT17PjkR/H4muLCkhBt18ju2apP2AkB8n3CeTJ5fuxDyd+mOZ5VwdQq1YAxoltl
	VEzHqukS42oNLqhBMFWyxHsSomjwgON2c/hygi/rR8FEklZV3IZ++vbm/Ap+e3s4RzP
	64PIrVlCWw==
Received: by mx.zohomail.com with SMTPS id 1786830485285562.7465483374432;
	Sat, 15 Aug 2026 14:48:05 -0700 (PDT)
From: Rong Zhang <i@rong.moe>
Date: Sun, 16 Aug 2026 05:47:28 +0800
Subject: [PATCH] ALSA: usb-audio: Check sticky mixers precisely
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260816-uac-precise-sticky-check-v1-1-00798373dc3c@rong.moe>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXMwQqDMBCE4VeRPbuHSmpoX6V4SNaxbgVbsioW8
 d1N7fGDmX8jQ1IY3YuNEhY1fY8Zl7Ig6cP4BGubTd7Vvu4EPAfhT4KogW1SGb4sPWTgm3Pehaq
 KV99SvudRp+uZfjR/2xxfkOnXo30/ANAvUHZ8AAAA
X-Change-ID: 74676fce-uac-precise-sticky-check-94474a22b57d
To: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Cc: Takashi Iwai <tiwai@suse.de>, linux-sound@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Alexander Niemeyer <adventureFAN@gmx.de>, 
 Rong Zhang <i@rong.moe>
X-Mailer: b4 0.16-dev-2f6f2
X-ZohoMailClient: External

Some mixers are asynchronous, and some have broken min/max. They are
mistakenly considered sticky due to how the check is implemented.

Check sticky mixers more precisely by checking approximately 16 values
and adding a msleep(10) between each check, so that asynchronous mixers
have enough time to change the value and mixers with broken min/max are
checked properly. Additionally, mark GET_CUR as broken when
get_cur_mix_raw() fails, instead of returning successfully.

Reported-by: Alexander Niemeyer <adventureFAN@gmx.de>
Closes: https://lore.kernel.org/r/6262cbbd-d1f2-4c9d-a1c7-9c5d12636f4b@gmx.de
Signed-off-by: Rong Zhang <i@rong.moe>
---
 sound/usb/mixer.c | 51 ++++++++++++++++++++++++++++++++++++++++++++-------
 1 file changed, 44 insertions(+), 7 deletions(-)

diff --git a/sound/usb/mixer.c b/sound/usb/mixer.c
index 703c118f9d4e..3d0f97730a06 100644
--- a/sound/usb/mixer.c
+++ b/sound/usb/mixer.c
@@ -1256,22 +1256,59 @@ static void init_cur_mix_raw(struct usb_mixer_elem_info *cval, int ch, int idx)
 static int check_sticky_volume_control(struct usb_mixer_elem_info *cval,
 				       int channel, int saved)
 {
-	int sticky_test_values[] = { cval->min, cval->max };
-	int test, check, i;
+	int test, check, res;
+
+	/*
+	 * Check approximately 16 values (15 intervals).
+	 * If the resolution is not fine enough, check fewer values.
+	 */
+	res = DIV_ROUND_UP(cval->max - cval->min, 15);
+	res = res ? roundup(res, cval->res) : cval->res;
+
+	/*
+	 * If (cval->max - cval->min) is not a multiple of cval->res, we still
+	 * want to test cval->max anyway.
+	 */
+	for (test = cval->min; test < cval->max + res; test += res) {
+		if (test > cval->max)
+			test = cval->max;
 
-	for (i = 0; i < ARRAY_SIZE(sticky_test_values); i++) {
-		test = sticky_test_values[i];
 		if (test == saved)
 			continue;
 
 		/* Assume non-sticky on failure. */
-		if (snd_usb_set_cur_mix_value(cval, channel, 0, test) ||
-		    get_cur_mix_raw(cval, channel, &check) ||
-		    check != saved) /* SET_CUR effective, non-sticky. */
+		if (snd_usb_set_cur_mix_value(cval, channel, 0, test))
+			return 0;
+
+		if (get_cur_mix_raw(cval, channel, &check))
+			goto get_cur_broken;
+		if (check != saved) /* SET_CUR effective, non-sticky. */
 			return 0;
+
+		/*
+		 * Leave some time for asynchronous mixers to change the value.
+		 *
+		 * Note that there is no need to wait between SET_CUR and
+		 * GET_CUR, as we don't care whether the GET_CUR value matches
+		 * the SET_CUR one. IOW, what we expect is just a GET_CUR value
+		 * differing from the saved one.
+		 *
+		 * Mixers of most devices are synchronous. The should have
+		 * returned early without extra sleep. Asynchronous mixers will
+		 * return once the accumulated time is enough for them to change
+		 * the value.
+		 */
+		msleep(10);
 	}
 
+	/* Check again after the last msleep(). */
+	if (get_cur_mix_raw(cval, channel, &check))
+		goto get_cur_broken;
+	if (check != saved)
+		return 0;
+
 	if (cval->head.mixer->chip->quirk_flags & QUIRK_FLAG_MIXER_GET_CUR_BROKEN) {
+get_cur_broken:
 		usb_audio_info(cval->head.mixer->chip,
 			       "%d:%d: broken mixer GET_CUR (%d/%d/%d => %d)\n",
 			       cval->head.id, mixer_ctrl_intf(cval->head.mixer),

---
base-commit: 3eb40771c00a8488fa6ed2cc1fe203477908bf38
change-id: 74676fce-uac-precise-sticky-check-94474a22b57d

Thanks,
Rong

