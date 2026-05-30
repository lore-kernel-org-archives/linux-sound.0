Received: from sender4-op-o15.zoho.com (sender4-op-o15.zoho.com [136.143.188.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E32632C0296;
	Sat, 30 May 2026 19:53:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.15
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780170793; cv=pass; b=aR3qO0WmP3bb1qeRKTYOtgDO32U7nTUn+ICzCfoL5xwH0zx76QefkSU8hu3MRepjz4pjAUGQJy8H6F9GnAMLr4CH66ZZmIUKZ0UulKuuJP8UHzE8tI8tm7eibY6Jo6pqoi8eNsQ9+BKok2SeTz5GcKMyNqgQ1c+jH6SY8nlh/JY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780170793; c=relaxed/simple;
	bh=IjKr6EosmF4pSEqTAHfWCwUmGTDLjJ8JdOTUNdwnlPE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=MjqDl1CL6et9vZfrzu1M6VlKOK1dSVCJZxTvzFibMcmucsbd2/ptl5Ax8CqtnVfhxpRGkvQg1r9mdDLRTXZeRLHGlb8u3ZvBsuvHdDLEoVsgmt59+qkABlanLG6tD0hxcg4hj6clJ7EuLU8CWKOsycIYFVcJKR3UBOjaoVHVRDE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rong.moe; spf=pass smtp.mailfrom=rong.moe; dkim=pass (2048-bit key) header.d=rong.moe header.i=i@rong.moe header.b=bVX4ALvd; arc=pass smtp.client-ip=136.143.188.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rong.moe
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rong.moe
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rong.moe header.i=i@rong.moe header.b="bVX4ALvd"
ARC-Seal: i=1; a=rsa-sha256; t=1780170785; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=kc4qYyP8Y31hGcDixCuBer59xiO41SaQ5mQmEmFaO7TnGSU0KbBDIBhkif/GcvlKK5hxGswKx2xHLcuHerzE6DDTfP3kB9PSRdtMyz7K1DjK+41Gb97qcatTFJheikHb4nKUhxfwqKkkUT2WOnWMkZXUhJv9LhPjdjtMN1bZEiY=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1780170785; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=R3WGf7iVpz56P5YsLxxpqu8MUfB6omve+BUwwMhq6VA=; 
	b=kK6GdPOiECOfIHrR0qZdqUpTesBrk0MKYWABCLwHv0UP3Wph4mAh6hsrWujZEtzTHmJTKOIdaxDu0ieKjTea/J/05iot+VYJRhByH5qiOEZu3c6JsgOeWjZJ/GR7b8NkXuxGLF/uGjDRKScjVXBZo5hzTPHECPms5HO+CPGnelo=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=rong.moe;
	spf=pass  smtp.mailfrom=i@rong.moe;
	dmarc=pass header.from=<i@rong.moe>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1780170785;
	s=zmail2048; d=rong.moe; i=i@rong.moe;
	h=From:From:Date:Date:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Message-Id:To:To:Cc:Cc:Reply-To;
	bh=R3WGf7iVpz56P5YsLxxpqu8MUfB6omve+BUwwMhq6VA=;
	b=bVX4ALvdpesk06TAOtxAK+ZqnoxayCBM5mdfzsNZY8bhuNc85arRF13QfUDlgNY3
	VbFz+Gjbcpa+NTNTqF3FCR3+TJMFIKT2Z+bFNvNUxE0fAlAT05a0wsBnMurI4UrDBDs
	kaq6TiGrGZZkZqOIyoXjgee61pUk+SBFAijogII155B9/XrVvBiHWnUV3aIDcFIbMg4
	yccFvCunve4aUM6VX067Qnrl7HrRPzNjIG84FqBqygUk+vILZtiC+ZLh2+5gXz/N0TM
	xQvhDFhtPxe75wY4z8kVR3dUMAf8opVe1EWuaSq1ptoLoFzn+YRu2SGyS7VwcSh9pWb
	de3moJhBgg==
Received: by mx.zohomail.com with SMTPS id 1780170784038917.2648688819877;
	Sat, 30 May 2026 12:53:04 -0700 (PDT)
From: Rong Zhang <i@rong.moe>
Date: Sun, 31 May 2026 03:52:49 +0800
Subject: [PATCH] ALSA: usb-audio: Set the value of potential sticky mixers
 to maximum
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260531-uac-sticky-error-path-v1-1-12c2329d17ef@rong.moe>
X-B4-Tracking: v=1; b=H4sIABBAG2oC/yXMQQqDQAxA0atI1g1MyyDUq0gXMWZqFFSSUVrEu
 3faLt/i/wNcTMWhqQ4w2dV1mQuulwp4oPkpqH0x3Ehi3YUeN2L0rDy9UcwWw5XygPFeS0yBiUK
 C0q4mSV+/b/v427duFM7fGZznB95HIhV5AAAA
X-Change-ID: 2ae46b0d-uac-sticky-error-path-496e4f0caa0f
To: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Cc: Takashi Iwai <tiwai@suse.de>, Steve Smith <tarkasteve@gmail.com>, 
 linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Rong Zhang <i@rong.moe>
X-Mailer: b4 0.16-dev-d5d98
X-ZohoMailClient: External

It makes no sense to restore the saved value for a sticky mixer, since
setting any value is a no-op.

However, in some rare cases, SET_CUR is effective despite GET_CUR always
returns a constant value. These mixers are not sticky, but there's no
way to distinguish them. Without any additional information, the best
thing we can do is to set the mixer value to the maximum before bailing
out, so that a soft mixer can still reach the maximum hardware volume if
the mixer turns out to be non-sticky. Meanwhile, all channels must be
synchronized to prevent imbalance volume.

Fixes: 86aa1ea1f15c ("ALSA: usb-audio: Do not expose sticky mixers")
Signed-off-by: Rong Zhang <i@rong.moe>
---
 sound/usb/mixer.c | 33 +++++++++++++++++++++++++++++----
 1 file changed, 29 insertions(+), 4 deletions(-)

diff --git a/sound/usb/mixer.c b/sound/usb/mixer.c
index 5fba456eb4a9..fb37bb8ad9a9 100644
--- a/sound/usb/mixer.c
+++ b/sound/usb/mixer.c
@@ -1371,10 +1371,8 @@ static int get_min_max_with_quirks(struct usb_mixer_elem_info *cval,
 				goto no_checks;
 
 			ret = check_sticky_volume_control(cval, minchn, saved);
-			if (ret < 0) {
-				snd_usb_set_cur_mix_value(cval, minchn, 0, saved);
-				return ret;
-			}
+			if (ret < 0)
+				goto sticky;
 
 			if (cval->min + cval->res < cval->max)
 				check_volume_control_res(cval, minchn, saved);
@@ -1431,6 +1429,33 @@ static int get_min_max_with_quirks(struct usb_mixer_elem_info *cval,
 	}
 
 	return 0;
+
+sticky:
+	/*
+	 * It makes no sense to restore the saved value for a sticky mixer,
+	 * since setting any value is a no-op.
+	 *
+	 * However, in some rare cases, SET_CUR is effective despite GET_CUR
+	 * always returns a constant value. These mixers are not sticky, but
+	 * there's no way to distinguish them. Without any additional
+	 * information, the best thing we can do is to set the mixer value to
+	 * the maximum before bailing out, so that a soft mixer can still reach
+	 * the maximum hardware volume if the mixer turns out to be non-sticky.
+	 * Meanwhile, all channels must be synchronized to prevent imbalance
+	 * volume.
+	 */
+	if (!cval->cmask) {
+		snd_usb_set_cur_mix_value(cval, 0, 0, cval->max);
+	} else {
+		for (i = 0; i < MAX_CHANNELS; i++) {
+			idx = 0;
+			if (cval->cmask & BIT(i)) {
+				snd_usb_set_cur_mix_value(cval, i + 1, idx, cval->max);
+				idx++;
+			}
+		}
+	}
+	return ret;
 }
 
 #define get_min_max(cval, def)	get_min_max_with_quirks(cval, def, NULL)

---
base-commit: 2c142b63c8ee982cdfdba49a616027c266294838
change-id: 2ae46b0d-uac-sticky-error-path-496e4f0caa0f

Thanks,
Rong

