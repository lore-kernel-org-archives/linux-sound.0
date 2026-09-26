Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.3])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4289738CFED
	for <linux-sound@vger.kernel.org>; Sat, 26 Sep 2026 14:04:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.31.3
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790431456; cv=none; b=NclVqHFq7+VwgdTeQgO0JiLbbesqZx4A5XkDHiDfNYmwAir/zCPpPAHGfarHWjQvSI0JRfTPdeE8XzTBLfr1AdpdqgqAnGoalxEUCo+JkWRBjYEmHMbKhWy8STgr6qph+Wmypn8FiPtOMqTaA4MEOs7Lz2L1OuAHGVjG2zhvO00=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790431456; c=relaxed/simple;
	bh=sJiMHeN/tOpoqA4LehMacgNNmxNdHSFKWMtZmwxX3Q8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=OkU12Rw+6MaycD83pmGWNqBntzEfNrWudnFEfWthrO0kBMIHpYZrwFbV/p8y/mQin2JPiZvQscm9GXXayiykuUX6495n+wonCtGFochgyLZuoOjnW6sW21o64ARW5yVZVHcyfxMxzvfm4duxGOmv+Hc9ZzAlVvOxSEFWYO3S7R8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=JZB9OuI5; arc=none smtp.client-ip=220.197.31.3
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="JZB9OuI5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version; bh=Zm
	pUxSHoF7rMfTQzYotMsMnyUuhQTmpvyCnXgcX4hSw=; b=JZB9OuI5O3feWGZ9Ch
	Kpj/EbtpyzWZo7B4QRpXvFQ/hSHZMRp3kgD3FsBmZQpDPEctlsXjuVJgehXiv9LO
	FXu+9XdNpLhILBd5s9iNy0a1qsG1O5aDsinKoOYvd7xhkYcIfi3AkDTVg6OLwIQ7
	ujppWruK6u9dUU7s3vtz4/Of8=
Received: from zeyuli-Adol-14-M5451GADOL (unknown [])
	by gzsmtp2 (Coremail) with SMTP id PSgvCgCnYbO90LdqJqWIBQ--.50375S2;
	Sat, 26 Sep 2026 22:03:50 +0800 (CST)
From: Zeyu Li <13776528859@163.com>
To: linux-sound@vger.kernel.org
Cc: Takashi Iwai <tiwai@suse.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Zeyu Li <13776528859@163.com>
Subject: [PATCH] ALSA: hda/realtek: Add ALC235 support for headset mode
Date: Sat, 26 Sep 2026 22:03:36 +0800
Message-ID: <20260926140336.27896-1-13776528859@163.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:PSgvCgCnYbO90LdqJqWIBQ--.50375S2
X-Coremail-Antispam: 1Uf129KBjvJXoW7ZrW5GF18Ar18Cr4kZr4rAFb_yoW8Kry7pw
	15Kw4rGF4xAF1qyay8JFWSq3W8KFy0gF1UZw4ak34fZF4jq3y8JFyUtFyDKF45CF9Fka47
	urySqr4UGa43XFJanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0piWE__UUUUU=
X-CM-SenderInfo: zprtllawvsmmivz6il2tof0z/xtbC3gftomq30MdSUQAA3f

The ALC235 (0x10ec0235) is registered as the ALC255 codec variant in
patch_alc269(), but the headset mode functions were missing a case
for it, so the CTIA/OMTP jack type detection and routing never ran
on this codec. As a result, a plugged-in headset is detected (jack
presence works) but the microphone signal is never routed, leaving
the capture stream permanently silent.

Verified on an ASUS M5451GA laptop (HDA:10ec0235,10431814): with the
ALC255 coef sequence applied, the headset microphone works correctly.

Signed-off-by: Zeyu Li <13776528859@163.com>
---
 sound/hda/codecs/realtek/realtek.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/sound/hda/codecs/realtek/realtek.c b/sound/hda/codecs/realtek/realtek.c
index db365a746..bc5226fad 100644
--- a/sound/hda/codecs/realtek/realtek.c
+++ b/sound/hda/codecs/realtek/realtek.c
@@ -1292,6 +1292,7 @@ static void alc_headset_mode_unplugged(struct hda_codec *codec)
 	}
 
 	switch (codec->core.vendor_id) {
+	case 0x10ec0235:
 	case 0x10ec0255:
 		alc_process_coef_fw(codec, coef0255);
 		break;
@@ -1407,6 +1408,7 @@ static void alc_headset_mode_mic_in(struct hda_codec *codec, hda_nid_t hp_pin,
 	};
 
 	switch (codec->core.vendor_id) {
+	case 0x10ec0235:
 	case 0x10ec0255:
 		alc_write_coef_idx(codec, 0x45, 0xc489);
 		snd_hda_set_pin_ctl_cache(codec, hp_pin, 0);
@@ -1562,6 +1564,7 @@ static void alc_headset_mode_default(struct hda_codec *codec)
 		alc_process_coef_fw(codec, coef0225);
 		alc_hp_enable_unmute(codec, 75);
 		break;
+	case 0x10ec0235:
 	case 0x10ec0255:
 		alc_process_coef_fw(codec, coef0255);
 		break;
@@ -1663,6 +1666,7 @@ static void alc_headset_mode_ctia(struct hda_codec *codec)
 	};
 
 	switch (codec->core.vendor_id) {
+	case 0x10ec0235:
 	case 0x10ec0255:
 		alc_process_coef_fw(codec, coef0255);
 		break;
@@ -1780,6 +1784,7 @@ static void alc_headset_mode_omtp(struct hda_codec *codec)
 	};
 
 	switch (codec->core.vendor_id) {
+	case 0x10ec0235:
 	case 0x10ec0255:
 		alc_process_coef_fw(codec, coef0255);
 		break;
@@ -1881,6 +1886,7 @@ static void alc_determine_headset_type(struct hda_codec *codec)
 	}
 
 	switch (codec->core.vendor_id) {
+	case 0x10ec0235:
 	case 0x10ec0255:
 		alc_process_coef_fw(codec, coef0255);
 		msleep(300);
-- 
2.53.0

