Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1692526D4F9;
	Sun,  1 Mar 2026 01:55:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772330125; cv=none; b=Ldw6vgeXp9/a4nFDayjU121Wk+3KeTUqmh5Jz3WcP+eDI0aZ8+KDqTdhypZcxaGKVHZikn+T8CQ29qdqk6FMidxl+daa4Jp9cax9q436Jn8dPq5ygMoBzvrK9ghpBV5PzkaIWfsJby1DJqj0WxAGyOcsbKBei3G0YJ1i3SOu3Tk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772330125; c=relaxed/simple;
	bh=gOP4/8Vbosly5WI24qoazmXFe+Yn+LH7D4uumY/A4gw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=M9qddgZz++5l8nWwQID+QPI7yh1zLjc21KOXdB5GrrX7tQVVBLuv9jUMqe6Cfssx4IeFA8EEw3BRfkecyEumzUGxzVFzlS/k4hKUuShVXdbyW1ngjCWCNJGC95Sr3VmW6lXE1YT5ZU63kd8GE2aQ/kyurKUOMQgFORm+DtE3xrI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=isy8K2vr; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="isy8K2vr"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 648F7C19421;
	Sun,  1 Mar 2026 01:55:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772330125;
	bh=gOP4/8Vbosly5WI24qoazmXFe+Yn+LH7D4uumY/A4gw=;
	h=From:To:Cc:Subject:Date:From;
	b=isy8K2vrNcxAp6utOAB1Ly/UNVTsmGY3KPNt9c4K/woCWK5ZvHsb2v2DxwDQbLyQE
	 6XvQQUL++/teCIrApzHg6Z38TOJZ2DGIcC/daXyDmysR2Ji56GMpBEykC98DJ12Kca
	 KL+V3j+DQ34OkNSZisvyqpoXCpnOp8BmszCTL3j5cEpTJ9uYXVrCaEFztR3nR8EW0w
	 fssNkC1i2Pae2zso2m5Mmtf5f9NiXl4FDhG+igD956APv88RFr/zJ751hA2EOcrpEt
	 gavrIquvW5IFVvyKQgYsKAMQHGTAxIAjkX+dmilSZXaNzqWZxkKFaw1XmyJgYT08Aw
	 aK3QtMK1Dg0zQ==
From: Sasha Levin <sashal@kernel.org>
To: stable@vger.kernel.org,
	mason8110@gmail.com
Cc: Lewis Mason <lewis@ocuru.co.uk>,
	Takashi Iwai <tiwai@suse.de>,
	linux-sound@vger.kernel.org
Subject: FAILED: Patch "ALSA: hda/realtek: Add quirk for Samsung Galaxy Book3 Pro 360 (NP965QFG)" failed to apply to 5.15-stable tree
Date: Sat, 28 Feb 2026 20:55:23 -0500
Message-ID: <20260301015523.1722588-1-sashal@kernel.org>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Patchwork-Hint: ignore
X-stable: review
Content-Transfer-Encoding: 8bit

The patch below does not apply to the 5.15-stable tree.
If someone wants it applied there, or to any other stable or longterm
tree, then please email the backport, including the original git commit
id to <stable@vger.kernel.org>.

Thanks,
Sasha

------------------ original commit in Linus's tree ------------------

From 3a6b7dc431aab90744e973254604855e654294ae Mon Sep 17 00:00:00 2001
From: Lewis Mason <mason8110@gmail.com>
Date: Tue, 10 Feb 2026 23:13:37 +0000
Subject: [PATCH] ALSA: hda/realtek: Add quirk for Samsung Galaxy Book3 Pro 360
 (NP965QFG)

The Samsung Galaxy Book3 Pro 360 NP965QFG (subsystem ID 0x144d:0xc1cb)
uses the same Realtek ALC298 codec and amplifier configuration as the
NP960QFG (0x144d:0xc1ca). Apply the same ALC298_FIXUP_SAMSUNG_AMP_V2_4_AMPS
fixup to enable the internal speakers.

Cc: stable@vger.kernel.org
Signed-off-by: Lewis Mason <lewis@ocuru.co.uk>
Link: https://patch.msgid.link/20260210231337.7265-1-lewis@ocuru.co.uk
Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/hda/codecs/realtek/alc269.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/hda/codecs/realtek/alc269.c b/sound/hda/codecs/realtek/alc269.c
index 8664446648096..c11312aa5ca76 100644
--- a/sound/hda/codecs/realtek/alc269.c
+++ b/sound/hda/codecs/realtek/alc269.c
@@ -7318,6 +7318,7 @@ static const struct hda_quirk alc269_fixup_tbl[] = {
 	SND_PCI_QUIRK(0x144d, 0xc872, "Samsung Galaxy Book2 Pro (NP950XEE)", ALC298_FIXUP_SAMSUNG_AMP_V2_2_AMPS),
 	SND_PCI_QUIRK(0x144d, 0xc886, "Samsung Galaxy Book3 Pro (NP964XFG)", ALC298_FIXUP_SAMSUNG_AMP_V2_4_AMPS),
 	SND_PCI_QUIRK(0x144d, 0xc1ca, "Samsung Galaxy Book3 Pro 360 (NP960QFG)", ALC298_FIXUP_SAMSUNG_AMP_V2_4_AMPS),
+	SND_PCI_QUIRK(0x144d, 0xc1cb, "Samsung Galaxy Book3 Pro 360 (NP965QFG)", ALC298_FIXUP_SAMSUNG_AMP_V2_4_AMPS),
 	SND_PCI_QUIRK(0x144d, 0xc1cc, "Samsung Galaxy Book3 Ultra (NT960XFH)", ALC298_FIXUP_SAMSUNG_AMP_V2_4_AMPS),
 	SND_PCI_QUIRK(0x1458, 0x900e, "Gigabyte G5 KF5 (2023)", ALC2XX_FIXUP_HEADSET_MIC),
 	SND_PCI_QUIRK(0x1458, 0xfa53, "Gigabyte BXBT-2807", ALC283_FIXUP_HEADSET_MIC),
-- 
2.51.0




