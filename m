Received: from out203-205-221-236.mail.qq.com (out203-205-221-236.mail.qq.com [203.205.221.236])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9788F3E6392
	for <linux-sound@vger.kernel.org>; Wed, 27 May 2026 09:12:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.205.221.236
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779873174; cv=none; b=jnQcTQx0MBuACnfHT/dwzckxcNo6sz6HZI0VkFEtZVZhu4Njvplopwtm9jsuglhKo+QQ3B1cZhg/CF1M7ZVZQduzkcXU5c+ybbje2826TGxePjAav8DbikIQd2dg3igLud1tMahizWB8OOqL56Cjd61ff4d/O3ppv9bOqdbFgnQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779873174; c=relaxed/simple;
	bh=paym5dqAn4exqwIUt7W1Hut0HPmviYsEgW+SIetfYIs=;
	h=Message-ID:From:To:Cc:Subject:Date:MIME-Version; b=iDOzU7DiENLoSxTVeMEJ30ZmvjXzeXrUoHAoAs7u0RvAg9ZgVIpcjnIextf5GMyudYG4tfUVmo6EknRrwJwXanlDbxhu89d0W+MixW1ays8TrZYrq/HoQESXd9OdaFCNLJJzT7lwBp4uQRe+E9t6w6Fzvvev+XYod9gIw9grniM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foxmail.com; spf=pass smtp.mailfrom=foxmail.com; dkim=pass (1024-bit key) header.d=foxmail.com header.i=@foxmail.com header.b=ByiK9034; arc=none smtp.client-ip=203.205.221.236
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foxmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foxmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=foxmail.com header.i=@foxmail.com header.b="ByiK9034"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foxmail.com;
	s=s201512; t=1779873160;
	bh=xW5RYqWhnhmmLXdMvoq21ERHuGDE7SoMb0NuQ7QKgbo=;
	h=From:To:Cc:Subject:Date;
	b=ByiK90342naIsCanMSCZKQWDsUsrTHHM1FPsthm45j+YB/27BYbYnJCDI0ykCMlli
	 ACrTkI53PPwAgH2aCr6ogqytI0PjnqL/gKn8qDBvMIPka7fzHJJLNovQjQEUW53120
	 iSLTEuGu1WpP+AZ27yaSMGZMy/wIDd3edNxdAWmY=
Received: from localhost.localdomain ([116.128.244.169])
	by newxmesmtplogicsvrszc56-0.qq.com (NewEsmtp) with SMTP
	id 2DA2524B; Wed, 27 May 2026 17:11:26 +0800
X-QQ-mid: xmsmtpt1779873086tybk5433r
Message-ID: <tencent_4D2E7DEDD7773BC54C37A4A210EE3E194E08@qq.com>
X-QQ-XMAILINFO: NnYhxYSyuBnL3kFUXqTCLxCUhcIWR04HV+1apDPP61wgkP5zmK4JE0/2lvNU4L
	 vzzHlXC90QaoSXvEaIyE/98KTm1xpXv2nzQVksjjPzE99pWnTp37Ef2bSA6UX5NUzzDyNEYnLH6y
	 qjNdZVcYv9ficPgNqFA5Qf7Ygw08tN/OscvFOAMa3K2/ZNtoAMqe31a6ezARQONwgysc5fVQhrH9
	 XiVGgT3YpXcopWopP4rWxrMjNwAYChCSRVElVXzGBNFv1jjrnZkjj0ujPLj/RL66/wKwNlNBuK+h
	 d6V0imaUYhpU0A+xWGZ3D+TNtGtdITxR3ottY+gDpWt54cZ4B0ab68mUfpl4dvU+3Kvwo6gxt+R4
	 ZKk+B/x5veR+qH1+8wFNWFdL+RfJ0m/jUvX+q/ujXMVYAkRTYF+BgeMTo8ZYHwv/dK8U2IS2V4t1
	 dtT4xDkPoiJU6E0FXFXK8Lpct0X526LiVXM1Zb5NS721MCbHDPzmcDXv/BogxJ0eBJ/4RJ0U9VdH
	 yaJVrK8CJ1xXCWPxQk7qKNcpYpxT/NPM19ZCKfRJ2/lfsh34uWSa+QAjyOJh7af74+szbNLGYRAQ
	 87PgnxARgLIJoyNGlEgOXKbhFwC/c5SdN0T6c7kTuPVnb5c3/WEm46SeIQ0ZEt0BiMafgIG1DIJq
	 5Xdb/Aax2Pq/KK4zQXCe3Df8XFLzYyWQAWLdZA++KUTRA+Fv5OiI6VQyy9Mxqrg+Hhl25H+FyVc0
	 lVLX043KylC9BlaEiKObf8qOplsmy/BQjCndhq4wiYMvGmNJjootNQL4hRofpGnotEFW7a9XHdCY
	 PAYvgSUPKzges/WHNveLAsbvbiUuGs4m9sAq+WBRow+JKIaVi1seQwJ2w69KfLEPlDeWzXa/eefG
	 qbag31o8MMQD+fUs/0M4n+p9sQpkP1NiyhU9TVm10PQHfvpLR8G/IDQ+JlmOIU6hK0s1DooRjgyL
	 wTU+m/7a2k8tDx2lgj0Qq56jhbf+8aVLat7gUv0qbsdcEvXDHaYrFljuQvSsTwsD7RlU+glC2BA+
	 sAVIYAjAiq3ihijdqmGyHSoN5YieYUvjO6CSeUbjMK79PMF/n/QyNg0SVRzZNjvy0YjHbgUIDu70
	 SPPBPg8mOMeSLBavM=
X-QQ-XMRINFO: OWPUhxQsoeAVwkVaQIEGSKwwgKCxK/fD5g==
From: Zhao Dongdong <winter91@foxmail.com>
To: perex@perex.cz,
	tiwai@suse.com
Cc: linux-sound@vger.kernel.org,
	Zhao Dongdong <zhaodongdong@kylinos.cn>
Subject: [PATCH] ALSA: check snd_ctl_new1() return value in multiple drivers
Date: Wed, 27 May 2026 17:09:23 +0800
X-OQ-MSGID: <20260527090923.379460-1-winter91@foxmail.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Zhao Dongdong <zhaodongdong@kylinos.cn>

Check snd_ctl_new1() return value before dereferencing in:
  - es1938
  - cmipci
  - ymfpci
  - ice1712 (aureon, ice1712, ice1724)
  - gus
  - aoa (layout)

snd_ctl_new1() can return NULL when memory allocation fails.
Add a NULL check and return -ENOMEM on failure.

Assisted-by: Opencode:DeepSeek-V4-Flash
Signed-off-by: Zhao Dongdong <zhaodongdong@kylinos.cn>
---
 sound/aoa/fabrics/layout.c     | 6 ++++++
 sound/isa/gus/gus_pcm.c        | 2 ++
 sound/pci/cmipci.c             | 6 ++++++
 sound/pci/es1938.c             | 2 ++
 sound/pci/ice1712/aureon.c     | 2 ++
 sound/pci/ice1712/ice1712.c    | 8 ++++++++
 sound/pci/ice1712/ice1724.c    | 6 ++++++
 sound/pci/ymfpci/ymfpci_main.c | 6 ++++++
 8 files changed, 38 insertions(+)

diff --git a/sound/aoa/fabrics/layout.c b/sound/aoa/fabrics/layout.c
index c3ebb6de4789..7bb541577a26 100644
--- a/sound/aoa/fabrics/layout.c
+++ b/sound/aoa/fabrics/layout.c
@@ -948,6 +948,8 @@ static void layout_attached_codec(struct aoa_codec *codec)
 			if (lineout == 1)
 				ldev->gpio.methods->set_lineout(codec->gpio, 1);
 			ctl = snd_ctl_new1(&lineout_ctl, codec->gpio);
+			if (!ctl)
+				return;
 			if (cc->connected & CC_LINEOUT_LABELLED_HEADPHONE)
 				strscpy(ctl->id.name, "Headphone Switch");
 			ldev->lineout_ctrl = ctl;
@@ -961,12 +963,16 @@ static void layout_attached_codec(struct aoa_codec *codec)
 			if (ldev->have_lineout_detect) {
 				ctl = snd_ctl_new1(&lineout_detect_choice,
 						   ldev);
+				if (!ctl)
+					return;
 				if (cc->connected & CC_LINEOUT_LABELLED_HEADPHONE)
 					strscpy(ctl->id.name,
 						"Headphone Detect Autoswitch");
 				aoa_snd_ctl_add(ctl);
 				ctl = snd_ctl_new1(&lineout_detected,
 						   ldev);
+				if (!ctl)
+					return;
 				if (cc->connected & CC_LINEOUT_LABELLED_HEADPHONE)
 					strscpy(ctl->id.name,
 						"Headphone Detected");
diff --git a/sound/isa/gus/gus_pcm.c b/sound/isa/gus/gus_pcm.c
index a0757e1ede46..08ccb4d80ade 100644
--- a/sound/isa/gus/gus_pcm.c
+++ b/sound/isa/gus/gus_pcm.c
@@ -851,6 +851,8 @@ int snd_gf1_pcm_new(struct snd_gus_card *gus, int pcm_dev, int control_index)
 		kctl = snd_ctl_new1(&snd_gf1_pcm_volume_control1, gus);
 	else
 		kctl = snd_ctl_new1(&snd_gf1_pcm_volume_control, gus);
+	if (!kctl)
+		return -ENOMEM;
 	kctl->id.index = control_index;
 	err = snd_ctl_add(card, kctl);
 	if (err < 0)
diff --git a/sound/pci/cmipci.c b/sound/pci/cmipci.c
index cd73b6833639..ff4bfbf94b81 100644
--- a/sound/pci/cmipci.c
+++ b/sound/pci/cmipci.c
@@ -2637,16 +2637,22 @@ static int snd_cmipci_mixer_new(struct cmipci *cm, int pcm_spdif_device)
 		}
 		if (cm->can_ac3_hw) {
 			kctl = snd_ctl_new1(&snd_cmipci_spdif_default, cm);
+			if (!kctl)
+				return -ENOMEM;
 			kctl->id.device = pcm_spdif_device;
 			err = snd_ctl_add(card, kctl);
 			if (err < 0)
 				return err;
 			kctl = snd_ctl_new1(&snd_cmipci_spdif_mask, cm);
+			if (!kctl)
+				return -ENOMEM;
 			kctl->id.device = pcm_spdif_device;
 			err = snd_ctl_add(card, kctl);
 			if (err < 0)
 				return err;
 			kctl = snd_ctl_new1(&snd_cmipci_spdif_stream, cm);
+			if (!kctl)
+				return -ENOMEM;
 			kctl->id.device = pcm_spdif_device;
 			err = snd_ctl_add(card, kctl);
 			if (err < 0)
diff --git a/sound/pci/es1938.c b/sound/pci/es1938.c
index 280125eff362..b6dcb721fffc 100644
--- a/sound/pci/es1938.c
+++ b/sound/pci/es1938.c
@@ -1655,6 +1655,8 @@ static int snd_es1938_mixer(struct es1938 *chip)
 	for (idx = 0; idx < ARRAY_SIZE(snd_es1938_controls); idx++) {
 		struct snd_kcontrol *kctl;
 		kctl = snd_ctl_new1(&snd_es1938_controls[idx], chip);
+		if (!kctl)
+			return -ENOMEM;
 		switch (idx) {
 			case 0:
 				chip->master_volume = kctl;
diff --git a/sound/pci/ice1712/aureon.c b/sound/pci/ice1712/aureon.c
index 1191a2686dfd..d6abff2978f3 100644
--- a/sound/pci/ice1712/aureon.c
+++ b/sound/pci/ice1712/aureon.c
@@ -1891,6 +1891,8 @@ static int aureon_add_controls(struct snd_ice1712 *ice)
 			for (i = 0; i < ARRAY_SIZE(cs8415_controls); i++) {
 				struct snd_kcontrol *kctl;
 				kctl = snd_ctl_new1(&cs8415_controls[i], ice);
+				if (!kctl)
+					return -ENOMEM;
 				if (i > 1)
 					kctl->id.device = ice->pcm->device;
 				err = snd_ctl_add(ice->card, kctl);
diff --git a/sound/pci/ice1712/ice1712.c b/sound/pci/ice1712/ice1712.c
index 1e39b985bef2..4cec56769c0f 100644
--- a/sound/pci/ice1712/ice1712.c
+++ b/sound/pci/ice1712/ice1712.c
@@ -2346,21 +2346,29 @@ int snd_ice1712_spdif_build_controls(struct snd_ice1712 *ice)
 	if (snd_BUG_ON(!ice->pcm_pro))
 		return -EIO;
 	kctl = snd_ctl_new1(&snd_ice1712_spdif_default, ice);
+	if (!kctl)
+		return -ENOMEM;
 	kctl->id.device = ice->pcm_pro->device;
 	err = snd_ctl_add(ice->card, kctl);
 	if (err < 0)
 		return err;
 	kctl = snd_ctl_new1(&snd_ice1712_spdif_maskc, ice);
+	if (!kctl)
+		return -ENOMEM;
 	kctl->id.device = ice->pcm_pro->device;
 	err = snd_ctl_add(ice->card, kctl);
 	if (err < 0)
 		return err;
 	kctl = snd_ctl_new1(&snd_ice1712_spdif_maskp, ice);
+	if (!kctl)
+		return -ENOMEM;
 	kctl->id.device = ice->pcm_pro->device;
 	err = snd_ctl_add(ice->card, kctl);
 	if (err < 0)
 		return err;
 	kctl = snd_ctl_new1(&snd_ice1712_spdif_stream, ice);
+	if (!kctl)
+		return -ENOMEM;
 	kctl->id.device = ice->pcm_pro->device;
 	err = snd_ctl_add(ice->card, kctl);
 	if (err < 0)
diff --git a/sound/pci/ice1712/ice1724.c b/sound/pci/ice1712/ice1724.c
index 65bf48647d08..b16c84983b81 100644
--- a/sound/pci/ice1712/ice1724.c
+++ b/sound/pci/ice1712/ice1724.c
@@ -2379,16 +2379,22 @@ static int snd_vt1724_spdif_build_controls(struct snd_ice1712 *ice)
 		return err;
 
 	kctl = snd_ctl_new1(&snd_vt1724_spdif_default, ice);
+	if (!kctl)
+		return -ENOMEM;
 	kctl->id.device = ice->pcm->device;
 	err = snd_ctl_add(ice->card, kctl);
 	if (err < 0)
 		return err;
 	kctl = snd_ctl_new1(&snd_vt1724_spdif_maskc, ice);
+	if (!kctl)
+		return -ENOMEM;
 	kctl->id.device = ice->pcm->device;
 	err = snd_ctl_add(ice->card, kctl);
 	if (err < 0)
 		return err;
 	kctl = snd_ctl_new1(&snd_vt1724_spdif_maskp, ice);
+	if (!kctl)
+		return -ENOMEM;
 	kctl->id.device = ice->pcm->device;
 	err = snd_ctl_add(ice->card, kctl);
 	if (err < 0)
diff --git a/sound/pci/ymfpci/ymfpci_main.c b/sound/pci/ymfpci/ymfpci_main.c
index b9a09568afc9..2ccb976e68e0 100644
--- a/sound/pci/ymfpci/ymfpci_main.c
+++ b/sound/pci/ymfpci/ymfpci_main.c
@@ -1781,16 +1781,22 @@ int snd_ymfpci_mixer(struct snd_ymfpci *chip, int rear_switch)
 	if (snd_BUG_ON(!chip->pcm_spdif))
 		return -ENXIO;
 	kctl = snd_ctl_new1(&snd_ymfpci_spdif_default, chip);
+	if (!kctl)
+		return -ENOMEM;
 	kctl->id.device = chip->pcm_spdif->device;
 	err = snd_ctl_add(chip->card, kctl);
 	if (err < 0)
 		return err;
 	kctl = snd_ctl_new1(&snd_ymfpci_spdif_mask, chip);
+	if (!kctl)
+		return -ENOMEM;
 	kctl->id.device = chip->pcm_spdif->device;
 	err = snd_ctl_add(chip->card, kctl);
 	if (err < 0)
 		return err;
 	kctl = snd_ctl_new1(&snd_ymfpci_spdif_stream, chip);
+	if (!kctl)
+		return -ENOMEM;
 	kctl->id.device = chip->pcm_spdif->device;
 	err = snd_ctl_add(chip->card, kctl);
 	if (err < 0)
-- 
2.25.1

