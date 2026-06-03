Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.3])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BA2E379996;
	Wed,  3 Jun 2026 09:11:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.31.3
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780477909; cv=none; b=p8b5Ep2MuZHKZgTQ7fHcrvNI6e7w4lBVuuRdJu5Id/alffHzR5A802b71JCUvF5w3t2XGV+q0d2000TvV0+0osL6N7l56MV58374TyLGjYyUwHNTzF+PRyScgwzskWeobYxH/Fq00UGUd2na5DoEgN541B8LBkPmBES5Xr24+9w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780477909; c=relaxed/simple;
	bh=Eh5E1dOJumrVYeEXf9FBRSgay1EJ6/XnHn6aRPahXi4=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=BXNwOfpcZedVwgamGJsQJfA1BlcqBUnHZOste17/c0URjQ8mu5bAQVxnLANwAjP70kGiCV6Lrci4HE2B1hquKzecjHI8fdN7v0BezioI8hHCZgdDtKUnJ2MV+SaUNR3+Q27eV1CpUPgQ5heQ1l3Uhy0jJGP2JEm/QomjOzmR2/M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=YXnHMfQr; arc=none smtp.client-ip=220.197.31.3
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="YXnHMfQr"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version; bh=MA
	Qo6QybRnFomAvVrMjLe9f3/lAXrA7W7Sgy27z9nAU=; b=YXnHMfQr5ZBAGSKvI7
	zUlNnjvzDtADcwu/owtfaUW/ijlPKPY1hySKeecD3zfm7NSoGKJXePdoPTgDVhl3
	cQJfk8R/kII4c9rMwbN/Qe/HrWIXPA9u5wE6ia9OlVC3L/lQ+kw+1Y6G9sRidR19
	GrOR2HnVRLSd7rGx0GN8b+nP4=
Received: from localhost.localdomain (unknown [])
	by gzga-smtp-mtada-g0-4 (Coremail) with SMTP id _____wB3Vqao7x9qFpvVBA--.45986S3;
	Wed, 03 Jun 2026 17:11:13 +0800 (CST)
From: wangdich9700@163.com
To: tiwai@suse.com,
	perex@perex.cz,
	wangdicheng@kylinos.cn,
	wangdich9700@163.com
Cc: linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 2/4] ALSA: usb-audio: qcom: Use snprintf for mixer control name formatting
Date: Wed,  3 Jun 2026 17:11:00 +0800
Message-Id: <20260603091102.231370-2-wangdich9700@163.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20260603091102.231370-1-wangdich9700@163.com>
References: <20260603091102.231370-1-wangdich9700@163.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:_____wB3Vqao7x9qFpvVBA--.45986S3
X-Coremail-Antispam: 1Uf129KBjvJXoW7tr1fAryxWryxXr43Kw1DGFg_yoW8AF1fpa
	y3K3yvkrn7Jr40vr1UXw4kurn5tws7JF4Fkw4Fk343CrsxJa4Ig3WDu34YgrWakw40kry3
	ZFWqqryft3W5Kr7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0z_4SrDUUUUU=
X-CM-SenderInfo: pzdqwv5lfkmliqq6il2tof0z/xtbCwBGK2Wof77GvqAAA3u

From: wangdicheng <wangdicheng@kylinos.cn>

The current code uses sprintf() to format control names without bounds
checking, which could lead to buffer overflow if PCM index is large.
Replace sprintf with snprintf to ensure buffer safety.

The ctl_name buffer is 48 bytes, and the formatted string could exceed
this with large PCM index values. Using snprintf with sizeof(ctl_name)
prevents potential buffer overflow.

Signed-off-by: wangdicheng <wangdicheng@kylinos.cn>
---
 sound/usb/qcom/mixer_usb_offload.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/usb/qcom/mixer_usb_offload.c b/sound/usb/qcom/mixer_usb_offload.c
index 2adeb64f4d33..48e55d5872d5 100644
--- a/sound/usb/qcom/mixer_usb_offload.c
+++ b/sound/usb/qcom/mixer_usb_offload.c
@@ -128,7 +128,7 @@ int snd_usb_offload_create_ctl(struct snd_usb_audio *chip, struct device *bedev)
 		 */
 		chip_kctl->private_value = as->pcm_index |
 					  chip->card->number << 16;
-		sprintf(ctl_name, "USB Offload Playback Card Route PCM#%d",
+		snprintf(ctl_name, sizeof(ctl_name), "USB Offload Playback Card Route PCM#%d",
 			as->pcm_index);
 		chip_kctl->name = ctl_name;
 		ret = snd_ctl_add(chip->card, snd_ctl_new1(chip_kctl, bedev));
@@ -143,7 +143,7 @@ int snd_usb_offload_create_ctl(struct snd_usb_audio *chip, struct device *bedev)
 		 */
 		chip_kctl->private_value = as->pcm_index |
 					  chip->card->number << 16;
-		sprintf(ctl_name, "USB Offload Playback PCM Route PCM#%d",
+		snprintf(ctl_name, sizeof(ctl_name), "USB Offload Playback PCM Route PCM#%d",
 			as->pcm_index);
 		chip_kctl->name = ctl_name;
 		ret = snd_ctl_add(chip->card, snd_ctl_new1(chip_kctl, bedev));
-- 
2.25.1

