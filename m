Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.3])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BF1536681B;
	Tue, 31 Mar 2026 02:41:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=117.135.210.3
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774924877; cv=none; b=s8l4eTTUpp947FOY6r3q8JzkFxXbP87g6arUwlZ0hRIPVRpn61P3IlHGFtAxcz40MISxexMRNB7axRgsGvEsvxFoicvDWPh5q4qz3HZoiuJ03l3rqJNUBPv1xyv2wRVQrxhNOvdWgPT+pt/NNyoO3g81S0nS+XhMPfLkZ75Jx5Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774924877; c=relaxed/simple;
	bh=xjg4qpDC/6+1XW1zOw7DzaLT0THVsJtIYi7MpMBq2LU=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=TW4dTNaz5QzSHFgBLLMUbWusZGhTha+VLt+wvOPp1WYe1euX+V0ppub4bZ7FcyHPrFUeSjg45tlO1yfnmAeRIgbhgTN0L+X9WobhyFygfhfAAicmXXsoxHDrpEK9NjQuUeEGIQJcxX34dYOoXiTK7zkS+/AqHvsIUI2ixCXNHyc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=BuseYf9t; arc=none smtp.client-ip=117.135.210.3
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="BuseYf9t"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version; bh=8W
	JawSfQefpFsXrnZrM7UQ+bw2Y/lI+RoVNEkX1AO/M=; b=BuseYf9tN0YEk054Sb
	snII2uNbmnf4yZYkT9sZ2EEfYWspMRNdwTyZMp8Vbjt5sRHaFABgGxnyKKnZKyox
	D7SFY9iLz5jLsZ7EYoAqbZ/Al8jQZNZrgzuSPYaWZ/zKE7YU2cjTJo9OGTFWfJOf
	0Zyb7jBXI3MOIzYK+33jMGSPY=
Received: from localhost.localdomain (unknown [])
	by gzsmtp5 (Coremail) with SMTP id QCgvCgCn304mNMtpz+SUUg--.158S2;
	Tue, 31 Mar 2026 10:40:42 +0800 (CST)
From: Lei Huang <huanglei814@163.com>
To: perex@perex.cz,
	tiwai@suse.com
Cc: linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Lei Huang <huanglei@kylinos.cn>
Subject: [PATCH v2] ALSA: hda/realtek: fix bad indentation for alc269
Date: Tue, 31 Mar 2026 10:40:36 +0800
Message-Id: <20260331024036.30782-1-huanglei814@163.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:QCgvCgCn304mNMtpz+SUUg--.158S2
X-Coremail-Antispam: 1Uf129KBjvJXoW7tFWDKr48AF15tw4ftryUGFg_yoW8JF4Dpr
	Z5J395uF43Xr4Iyw1rtw4jv3WkGay0kF1rJF45Kw13ta18ur4kJa4Yk3yY9F15tr1IgFyf
	X3s3Wayqga1fZrDanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07UPpnLUUUUU=
X-CM-SenderInfo: xkxd0wxohlmiqu6rljoofrz/xtbC8wpkW2nLNCqPGAAA3t

From: Lei Huang <huanglei@kylinos.cn>

Mention complains about this coding style:

  ERROR: code indent should use tabs where possible
  #6640: FILE: sound/hda/codecs/realtek/alc269.c:6640:
  +        [ALC233_FIXUP_LENOVO_GPIO2_MIC_HOTKEY] = {$

fix it up.

Fixes: 5de5db35350d ("ALSA: hda/realtek - Enable Mute LED for Lenovo platform")
Signed-off-by: Lei Huang <huanglei@kylinos.cn>
---
 sound/hda/codecs/realtek/alc269.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/sound/hda/codecs/realtek/alc269.c b/sound/hda/codecs/realtek/alc269.c
index b6a58852752a..09af4d378b30 100644
--- a/sound/hda/codecs/realtek/alc269.c
+++ b/sound/hda/codecs/realtek/alc269.c
@@ -6637,10 +6637,10 @@ static const struct hda_fixup alc269_fixups[] = {
 		.type = HDA_FIXUP_FUNC,
 		.v.func = alc288_fixup_surface_swap_dacs,
 	},
-        [ALC233_FIXUP_LENOVO_GPIO2_MIC_HOTKEY] = {
-                .type = HDA_FIXUP_FUNC,
-                .v.func = alc233_fixup_lenovo_gpio2_mic_hotkey,
-        },
+	[ALC233_FIXUP_LENOVO_GPIO2_MIC_HOTKEY] = {
+		.type = HDA_FIXUP_FUNC,
+		.v.func = alc233_fixup_lenovo_gpio2_mic_hotkey,
+	},
 	[ALC245_FIXUP_BASS_HP_DAC] = {
 		.type = HDA_FIXUP_FUNC,
 		/* Borrow the DAC routing selected for those Thinkpads */
-- 
2.25.1

