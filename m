Received: from mail-pj2-f12.google.com (mail-pj2-f12.google.com [74.125.227.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9486F35FF5B
	for <linux-sound@vger.kernel.org>; Wed, 23 Sep 2026 14:15:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790172935; cv=none; b=kYuEuOuMnrjmyG/8V+O+qTyk0ktRXJ6UQNSbhOyplfkhgwZrEUtdqh4NeHTAwG3b9q5u51kD3BWbb4GGPsyF3UGp3x7qlcaO9Rwj0I/3SkKym9pKiB4h+Du9hH0/cq4H1fIut1ibUNDcWg58ePL8BuVkV/eKhyM4WEQPpak58Ts=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790172935; c=relaxed/simple;
	bh=Q2MaBMkLXe7IHCBb+bOGm9M3KkOZC8IP6HD0YDMfm1A=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=O6pRAc8RY0VfL6q7J3CXT8iJ1n3tyyG/N6piO+kM6lWfnUZkYGM4xfkWzSD9SEgofm5wmkTjK7isRbMrpvCU+gh8Noqnybo8xfRrTm1vCGU5l3hq6+mOnZEfsP+ADu/2aMljq3PdX5SFq66l4jMkjUkBlBLrLtl6O+D5prnGcZU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Vi8TK+Sp; arc=none smtp.client-ip=74.125.227.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Vi8TK+Sp"
Received: by mail-pj2-f12.google.com with SMTP id d9443c01a7336-2d747ee1f38so4782795ad.2
        for <linux-sound@vger.kernel.org>; Wed, 23 Sep 2026 07:15:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790172934; x=1790777734; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=iU/15OPk5yvrTv0LgeRqLrS6cUkjBijLp/PMVZ1MHgo=;
        b=Vi8TK+SpV/XMrY1Es2tdsX61VJqXawViBwJEkMQw/0gNwDf3KIfDW8DwbDXbGOH8Bf
         289UKmcdNaBclQm6MtF3e2nFgUOGo1Ivy76spXJzylZPbjZT13eojMFxoq8UMxuIyzAJ
         awSKaKUmGdD0gh7Sufj7iC25cf4x/U+G/2jJuPxIbGq4XmI4cV0Xj1+W1APkz54T3bS6
         PR9EK/dqTmKLGggdD9f4wKd1D2eg5HYi6Q7F4ocmlm+Xrb4xPwbshsYFGi1cQnU/2x1s
         2XF9NlmetIvZueq2Hls2L4Ootca2aVWFbuwAUiM2FIf4p38gVDJJNew7y+ATutWozNKC
         fyUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790172934; x=1790777734;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=iU/15OPk5yvrTv0LgeRqLrS6cUkjBijLp/PMVZ1MHgo=;
        b=PJ/pFihSkiYkTIye+bT4ZQ7aDgugC22a/B8i0pKudMtRxI3LyhUSP5aZPOjDThmxYd
         SVqFAqhEJGdRfNqtIfu+Ip6fMqI0L1ZB5onwk7s8E8wtQxvbxYqFbEfKWDgHz8rkGXS6
         nE8ufLDmMyRQtZ0ZJbMxdNIEieglBB0CmM8eWPO95vIsw2kaP+VAW7GF/a0xmG4pzBcB
         74ppuzM4i4P140h/b6/ffGrt6d/9uTf1QfVZtTgv1T/u8l6dGZhGVf5zpV0Blt0AF4B/
         K4V+wHYrYItkpkUsiRYg0iYR9khaPtuvt3dKutWrT/jbxXynNhDkjbs9mVA+iBKTc/Jk
         DBvA==
X-Gm-Message-State: AFuF++mGi5UWxpEP2oL7f9uxM7beCUnFF3I6A04mauK4gwiypECjqZnh
	XxKcuI1CkSyDlqyNISsiXuPJVvlw28M5WQiOn+BMrdoD0EcBxjQSsvkgVwZi4adf
X-Gm-Gg: AYBFou3ektyHAnfcBRJ5DX2YDFl0YHNt4WQI4Ii6cyZh7GP1w8w21YSGOLsHTGmMnFD
	HyLZbsxu24RMi3fJCaEr50bMQ3/+kiNtEa52lwRWUamobHMG0c0OO3CbCtPKOOik0c23aYWoYxb
	zyuhrlfcMnrAZBdDuN+o9zS61rO3kZ8Ri+custfVxSiyClgNVyZZBhq2dXLoVW+Ojm/86ZvSmbO
	V7l6d7klhm7lasAYyebUdZ5XGiboZdOikrsNnzAE0PZTrgdsK4nPxSbU3QIdwV+DM2bmNrmUnKK
	Dhlfxoo6S+VbTbqfoaW0UQTffckoEfoLHXjddmkHKCcBdt33u/yfPMlx00SkCTbTegM7DjGiC5n
	JuJmKM/mBH1T0wRcx/jk5tpjQNBmewslkP52TIrgb+ZzOy0nM+loqoEpeb8qlrCo5Who2Xks9rS
	iL8gOCR9kzuLZf48iWFDLXXjWhcJvrZxc7m722tiNBIhd51gNx4kzNiF7cpy0dmlnVYxuQ0Ns7m
	5ppYTFA7MSxiEpUtVSIEg8lc868H/B8TJSAiIN+Lw==
X-Received: by 2002:a17:903:1103:b0:2dd:c100:7cbb with SMTP id d9443c01a7336-2df69de9d56mr24712725ad.55.1790172933687;
        Wed, 23 Sep 2026 07:15:33 -0700 (PDT)
Received: from lenovo.localdomain (211-23-53-87.hinet-ip.hinet.net. [211.23.53.87])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2df6a517069sm11911435ad.3.2026.09.23.07.15.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Sep 2026 07:15:32 -0700 (PDT)
From: Yu-Hsiang Tseng <asas1asas200@gmail.com>
To: linux-sound@vger.kernel.org
Cc: tiwai@suse.com,
	perex@perex.cz,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH] ALSA: hda/realtek: Fix silent speaker on Higole F9B
Date: Wed, 23 Sep 2026 22:13:44 +0800
Message-ID: <20260923141344.1543158-1-asas1asas200@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The Higole F9B is an Alder Lake-N mini PC with a 7" touchscreen and an
ALC269VC codec (subsystem ID 0x10ec111e). Its DMI strings are all
"Default string", so the SSID is the only way to identify it.

The internal speaker is silent out of the box. The generic parser
assigns DAC 0x03 to the speaker pin 0x14 and DAC 0x02 to the headphone
pin 0x15, but the speaker only reproduces what DAC 0x02 plays, whatever
its connection selection says. Checked one path at a time, only the
gain of DAC 0x02 and the mute of pin 0x14 change what comes out of the
speaker. User space only knows the path it was told the speaker uses,
so selecting the speaker turns the path that actually reaches it all
the way down.

Route both 0x14 and 0x15 through mixer 0x0c (DAC 0x02), which is what
ALC290_FIXUP_MONO_SPEAKERS already does. Tested on the device: the
speaker plays.

Cc: <stable@vger.kernel.org>
Assisted-by: LLM
Signed-off-by: Yu-Hsiang Tseng <asas1asas200@gmail.com>
---
The quirk line and this changelog were drafted with an LLM (Claude Code);
the path-by-path analysis and the test were done by hand on the device.

 sound/hda/codecs/realtek/alc269.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/hda/codecs/realtek/alc269.c b/sound/hda/codecs/realtek/alc269.c
index 5127a111c..72d681fe7 100644
--- a/sound/hda/codecs/realtek/alc269.c
+++ b/sound/hda/codecs/realtek/alc269.c
@@ -7939,6 +7939,7 @@ static const struct hda_quirk alc269_fixup_tbl[] = {
 	SND_PCI_QUIRK(0x10cf, 0x1757, "Lifebook E752", ALC269_FIXUP_LIFEBOOK_HP_PIN),
 	SND_PCI_QUIRK(0x10cf, 0x1845, "Lifebook U904", ALC269_FIXUP_LIFEBOOK_EXTMIC),
 	SND_PCI_QUIRK(0x10ec, 0x10f2, "Intel Reference board", ALC700_FIXUP_INTEL_REFERENCE),
+	SND_PCI_QUIRK(0x10ec, 0x111e, "Higole F9B", ALC290_FIXUP_MONO_SPEAKERS),
 	SND_PCI_QUIRK(0x10ec, 0x118c, "Medion EE4254 MD62100", ALC256_FIXUP_MEDION_HEADSET_NO_PRESENCE),
 	SND_PCI_QUIRK(0x10ec, 0x119e, "Positivo SU C1400", ALC269_FIXUP_ASPIRE_HEADSET_MIC),
 	SND_PCI_QUIRK(0x10ec, 0x11bc, "VAIO VJFE-IL", ALC269_FIXUP_LIMIT_INT_MIC_BOOST),
-- 
2.55.0

