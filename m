Received: from smtpbg151.qq.com (smtpbg151.qq.com [18.169.211.239])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B5FE3D6CCF;
	Thu, 18 Jun 2026 07:55:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=18.169.211.239
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781769322; cv=none; b=uH/J2EVcPb6Q4olYChaDLO547l2SP4dgvTvqp49XUikcnfgYpA9OuPLVOcjYp0IcB+2s0l+DenojfPB/ChKLTt0eAbF6DAAFFNeNNmvhpdzGTSOzHUwsX4XXq8ydKXAQ40g8PnbMgfZ6a9XIp21fuTkQc+MMid/DjvKkaChOpKQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781769322; c=relaxed/simple;
	bh=m0pK1KXOJPegyGjF6Wrkx6caj/tTJ1MbtkI0gFIs8VI=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=fTFdhVsKaQ91VrFj02sUG6Ej/EMwAs4jbzxS/+0OLL8U0CDqU/Lq8aGuNLj1RqmYSObvziWZSHSEH9WeYtAZ4c+i0qrfnlJd7UHT3od6A9QaX01jYYdk4MQ+18sI2IXRuudOJSsfxcvSSLFHKIZtPDymXzNQZCeoARg+Q6lnX/o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=uniontech.com; spf=pass smtp.mailfrom=uniontech.com; dkim=pass (1024-bit key) header.d=uniontech.com header.i=@uniontech.com header.b=lhUYtkN0; arc=none smtp.client-ip=18.169.211.239
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=uniontech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=uniontech.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=uniontech.com header.i=@uniontech.com header.b="lhUYtkN0"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=uniontech.com;
	s=onoh2408; t=1781769282;
	bh=m0CU916+2Bph03fyGBAlD50k+u/I8R8ASitREfMBhqI=;
	h=From:To:Subject:Date:Message-Id:MIME-Version;
	b=lhUYtkN0V7jBkVyXDBMpXZi98jpuUHsNSZtpp4SkdcbyUceKDHXNMVbQDk19sYV5a
	 qy482zn/hGiZ/vXcpDn4e7qf3Lrb7PTU9awOM7snYJXEmfIOJUUKWKo1am1LG32IQv
	 RSRtkJKgsOesSMRdR6m6CGo1drr9Gce7QtysEJNQ=
X-QQ-mid: zesmtpgz7t1781769275t31355c9d
X-QQ-Originating-IP: Nw2AYMTYCdn6GpcAzKvO1USBYgffTJqGy+AXWBs2iTs=
Received: from localhost.localdomain ( [113.57.152.160])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Thu, 18 Jun 2026 15:54:33 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 1
X-BIZMAIL-ID: 5642517515570691910
EX-QQ-RecipientCnt: 9
From: Haowen Tu <tuhaowen@uniontech.com>
To: perex@perex.cz,
	tiwai@suse.com
Cc: zhangheng@kylinos.cn,
	sbinding@opensource.cirrus.com,
	kailang@realtek.com,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	kernel@uniontech.com,
	Haowen Tu <tuhaowen@uniontech.com>
Subject: [PATCH] ALSA: hda/realtek: Add headset mic quirk for Acer S40-54
Date: Thu, 18 Jun 2026 15:54:31 +0800
Message-Id: <20260618075431.1116988-1-tuhaowen@uniontech.com>
X-Mailer: git-send-email 2.20.1
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpgz:uniontech.com:qybglogicsvrsz:qybglogicsvrsz3b-0
X-QQ-XMAILINFO: MpvVxjO9l39x7M961+Wl8MA3hdXiGBeQpnWq2lvhOJNQfzwHBVXKhcQd
	UmofJ3mvISQ7jkjVBhuJdbQtP0P2ZO1SX5v2Zdc87gQQa1H4ZPn5+VACiMXOnCN2jLZnEtB
	deiQaUVHc9+dtrx9JqJy6jVjtNLohurZfP5lQACYGEJsyIDGZQF62uf35NhC2vFCHznOqw8
	GdwucLh8DOVQB9m+Auht3RfSOnqlIbBEno0PQmPr0UC3TLujCq3svpJAM62sFib7bsR0+YL
	acKwkEy7vSgcV+t5reW+m/vGn0/jdlGXn9rZ/TN6tnzo67+ZSg+7mDEvlY6ZaLh6Ictx06v
	/3jg1iqO+voZibrmsjIixU91Bw2cKdnnpymBYYUVcJexGM7yWk2sXjpuYdep0/fdSjGfmXb
	1sb/krLYzAenwtDKK+0VdR5/Ltqf1yNq0cYP8ofh8s6qEyL0Lz1K2plg8+C9R5PmKWX3rJH
	5XPy6GdVP2ckp9AOH/vDS4vQCU+Anh3Y7aX2k/uoHlezNHA1F5tsV3c6qXuV2w4s1iGgHB9
	GlLWbyL/qQRF7YZs4BiyY85IbQRhQAyFvoIIl9V+gkSXxLkXW5OAGhU+03PXOwyKtM743s+
	EPYf0DD2gE1W2KIskUA4SByMAjeEOwo5+kroUBS2PbQG7Zs/l2LPPvjXYHHpHXPaoE89RgR
	ti9NuEwVvP2TuyufAw89XuDmImmFonk4K6bAyuKVL6dTIaPImiH02IC1kDRfHq3nZ6AxL45
	71rA7tYLdDHgH3AR4XG52unWD9o49DB0oWfz6HqsuIcX3RtqfRM+sou9IZVl8SOFYOj/O8E
	CJY5egEj49i2tU/gJz1U8h5t3UP+LBDDJ5EIfHJHbK7Hj87jmLP72uygpoUsI5h8HFzPEFM
	2b9MK7RZBS6eAguZKJUeFrAw9uMO9qNEqX5WntS0/O+oDaON2CYAZL7quAXH4gsghVFR/vg
	+zsGNtUKVOotMK/5JuVp1/nWAfINvDJGHQFp8GmH2GAFkYnquxNn8OhQNAjcxyRhLNTfIoW
	g24mXlu6q2VpukUIN9wCqDBOXtzj0K0axiM7QDosRBcGGCdTPy
X-QQ-XMRINFO: NS+P29fieYNwqS3WCnRCOn9D1NpZuCnCRA==
X-QQ-RECHKSPAM: 0

Acer S40-54 with ALC256 does not restore headset mic detection properly
after S4 resume. After resume, headset plug events may no longer update
the headset mic state, leaving the headset microphone unavailable.

The system uses subsystem ID 1025:161f. Applying the existing
ALC256_FIXUP_ACER_MIC_NO_PRESENCE fixup restores headset mic detection
on this machine.

Add a machine-specific quirk for this system.

Signed-off-by: Haowen Tu <tuhaowen@uniontech.com>
---
 sound/hda/codecs/realtek/alc269.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/hda/codecs/realtek/alc269.c b/sound/hda/codecs/realtek/alc269.c
index f180d6a72021..fcb6633ba522 100644
--- a/sound/hda/codecs/realtek/alc269.c
+++ b/sound/hda/codecs/realtek/alc269.c
@@ -6780,6 +6780,7 @@ static const struct hda_quirk alc269_fixup_tbl[] = {
 	SND_PCI_QUIRK(0x1025, 0x159c, "Acer Nitro 5 AN515-58", ALC2XX_FIXUP_HEADSET_MIC),
 	SND_PCI_QUIRK(0x1025, 0x1597, "Acer Nitro 5 AN517-55", ALC2XX_FIXUP_HEADSET_MIC),
 	SND_PCI_QUIRK(0x1025, 0x160e, "Acer PT316-51S", ALC2XX_FIXUP_HEADSET_MIC),
+	SND_PCI_QUIRK(0x1025, 0x161f, "Acer S40-54", ALC256_FIXUP_ACER_MIC_NO_PRESENCE),
 	SND_PCI_QUIRK(0x1025, 0x1640, "Acer Aspire A315-44P", ALC256_FIXUP_ACER_SFG16_MICMUTE_LED),
 	SND_PCI_QUIRK(0x1025, 0x1679, "Acer Nitro 16 AN16-41", ALC2XX_FIXUP_HEADSET_MIC),
 	SND_PCI_QUIRK(0x1025, 0x169a, "Acer Swift SFG16", ALC256_FIXUP_ACER_SFG16_MICMUTE_LED),
-- 
2.20.1

