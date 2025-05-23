Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6EF27226CE5
	for <linux-sound@vger.kernel.org>; Fri, 23 May 2025 19:29:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748028583; cv=none; b=YvzquO2wG4JDySDhr6VFuwpDxQVnFf3o3MjNeHZf6cEXPtlnp5QMCv3fvrfsO987HKirmp4rf53Sif1l0sPKpt2I9sSlTJzked2lSFAdUFOQZkOagwfGnTvSu7z3WHK9ESgtOm2s34IOZlZzTlBmyJq0k1WLiqVxrmIxfQWMqJc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748028583; c=relaxed/simple;
	bh=1sOM1enptDvCdQPsjLYA9+Og7rJ4ZM/js1OekIVnrHY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=O7JEUEIdiTBe19z0ABoDGrQ4y3J9vLEdXGdF24BFvlDU6Es0qWCGEZtCHuYpnPv07nySw91vsy5Pb82anxkD4AsY0pm/Kw5VMy95SqaFctcUhk44dWsYpaULZkBjV+DuzEtNFSLQpGqA8jAawG75aC5wBFA4ml1kI+PvaCKaP3g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OuW5HtfN; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OuW5HtfN"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4E522C4CEEF;
	Fri, 23 May 2025 19:29:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748028581;
	bh=1sOM1enptDvCdQPsjLYA9+Og7rJ4ZM/js1OekIVnrHY=;
	h=From:To:Cc:Subject:Date:From;
	b=OuW5HtfNexm92V4cwSXCZ0Wodx7U4Y2ryPf592Ymr93Sz/hkFx6jFtqzlN8N79lDN
	 NUSLn/sCXvCmdBuQiJszpVM0zagC0SG2CMzdoiC20uTr75Lu+utSewong4smKpStUi
	 AENOw685TsZETfD2Dhgzy1JIdDQ0TNhqrBEV2jP/zOtZ/wZoKVtXd3brA3s4IUYcrc
	 gzsJp5H3kxEtkP8AjbQ6vmCm/D7anmbRjm73B6ruvnlW+ZRqR+higRoLlKMm6LLGYl
	 MbKD7UaJF2/c3jQc//LYClfLkPgKf1tpziboGxdp8vMV0IpnjlUuuVz2yuCkRxgKDC
	 ccAChNoAHGjwg==
From: Mario Limonciello <superm1@kernel.org>
To: mario.limonciello@amd.com,
	perex@perex.cz,
	tiwai@suse.com
Cc: Takashi Iwai <tiwai@suse.de>,
	linux-sound@vger.kernel.org
Subject: [PATCH v2] ALSA: usb-audio: Add a quirk for Lenovo Thinkpad Thunderbolt 3 dock
Date: Fri, 23 May 2025 14:29:31 -0500
Message-ID: <20250523192934.1412153-1-superm1@kernel.org>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Mario Limonciello <mario.limonciello@amd.com>

The audio controller in the Lenovo Thinkpad Thunderbolt 3 dock doesn't
support reading the sampling rate.

Add a quirk for it.

Suggested-by: Takashi Iwai <tiwai@suse.de>
Signed-off-by: Mario Limonciello <mario.limonciello@amd.com>
---
 sound/usb/quirks.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/sound/usb/quirks.c b/sound/usb/quirks.c
index dbbc9eb935a4b..c29607091fb1c 100644
--- a/sound/usb/quirks.c
+++ b/sound/usb/quirks.c
@@ -2360,6 +2360,8 @@ static const struct usb_audio_quirk_flags_table quirk_flags_table[] = {
 		   QUIRK_FLAG_ALIGN_TRANSFER),
 	DEVICE_FLG(0x534d, 0x2109, /* MacroSilicon MS2109 */
 		   QUIRK_FLAG_ALIGN_TRANSFER),
+	DEVICE_FLG(0x17ef, 0x3083, /* Lenovo TBT3 dock */
+		   QUIRK_FLAG_GET_SAMPLE_RATE),
 
 	/* Vendor matches */
 	VENDOR_FLG(0x045e, /* MS Lifecam */
-- 
2.43.0

