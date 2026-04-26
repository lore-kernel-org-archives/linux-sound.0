Received: from mout-p-202.mailbox.org (mout-p-202.mailbox.org [80.241.56.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24EE421ABD7;
	Sun, 26 Apr 2026 02:55:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777172161; cv=none; b=YpktQIBa6cvhZpcGqUPJ4W7Xv/hjGoyQIxh1WbKGqwIhYeoRqGjivdXT3aUAf2R9H2MA6jIOQSNoDgnOsv6Mo3WrlyJBnQkmk7gFXV/2K+Xv5uBz8p1dr3lIGha2H2dxm5VIwHPfqq2R5O9swIywG5Ca+3+HaimysDj7Q+kcNnA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777172161; c=relaxed/simple;
	bh=rOOmQhIdzJ1IZFxfVhh+J+Ct5w/NGBQYqPIm0fcg0rs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=JxzM4jcobqqFOYL9QjbXVFvE/I1zJuvp9kdsIhtIQ7wPMTKqnuxl0CfDD+8AcW951RgImLHwZro8C5yxxTngIzbw1m8ZMSmswzLqiBoh0XbDAcG/OhXCDke+tXtva+ycQ1bhDsZLn/u1HsqimaXGV5YXNHZkD1gv+B62x/ukaJk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=mdOwSJeN; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=SWIIrLOV; arc=none smtp.client-ip=80.241.56.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="mdOwSJeN";
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="SWIIrLOV"
Received: from smtp2.mailbox.org (smtp2.mailbox.org [10.196.197.2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-202.mailbox.org (Postfix) with ESMTPS id 4g3BCW3sf1z9tlc;
	Sun, 26 Apr 2026 04:55:51 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1777172151;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=GeyGjrCyUFdASnIAyc58FFuUZfCbZkgysHho/cPW4Mk=;
	b=mdOwSJeNFSAPN5krBceUBlGBiD5+Pw+muKXL2N9zlYtjGVGn2A8D1ZK2NBRPyWObPiRC5K
	deYLkQSATOUlpan+gcJHw6n+VM79MAZ2dNLI7VjB5DopBblkL+pvtOIhvVBLLkQ+ibJx65
	ZBkz9ePWNK85XIdbh7zrvARZJCLbj23MmNNnOSwaLKSoJILSg8FXXwbEhybe/lWxvxcmcO
	v9WKv/f/Q0ZG7dZ5qbNs+KxGGdDlcJzwkLEgKxtOkBX62syvm63Wi2Kbeom4MQG+N6fuDW
	IxtJ/JdBZCUyphlN9iL2Gx9xeWZw3tWkleBZNqMybSpU1tHOaY6BsVkelqlhng==
From: Rosalie Wanders <rosalie@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1777172149;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=GeyGjrCyUFdASnIAyc58FFuUZfCbZkgysHho/cPW4Mk=;
	b=SWIIrLOV2z7ceMqAMiA3ScZT70d19Cr8UPK9KmKCFWBcTBi08ZHG/cK28mD3/xXYG/JOJW
	KmDQDhJlpmej9ByJ8rWZdDbEpMfheyd9m+F9Jm8ISj/DO4C40/ee2rBS9yLykLj8gcoc9j
	yqiDS5CwiFAo3Pf3i6B01i3XuWRiP5AD20cCMOuprV1osvh/tFqGutckBAeTeQhMlkbk43
	3hNvf/Ao7LbI/BHF8HUR2GW+CYxZ8Dhy2fUTEVHx268tzvG2Wcf+UV/tgirsNzBzYDWTeN
	SFBNaDw49P92Vloe1bzEpFuvb5xz4zOJlfo2NxVKc9+Ra+9K5YN7cuQkrO6ryg==
To: Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>
Cc: Rosalie Wanders <rosalie@mailbox.org>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] ALSA: usb-audio: apply quirk for Playstation PDP Riffmaster
Date: Sun, 26 Apr 2026 04:55:19 +0200
Message-ID: <20260426025520.3985-2-rosalie@mailbox.org>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MBO-RS-META: cxrytfid7zxzcsa34tbkirttng566rny
X-MBO-RS-ID: 3921e6cb5fd993de8bc

This device, just like the Playstation 5's DualSense, has a volume
that's too low, hid-playstation solves this by raising the minimum
volume on the device itself by sending an output report, third party PS5
controllers/accessories do not support this output report format, so we
apply a quirk to raise the minimum volume by 6dB.

Signed-off-by: Rosalie Wanders <rosalie@mailbox.org>
---
 sound/usb/mixer.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/sound/usb/mixer.c b/sound/usb/mixer.c
index 85653112e7f3..5fba456eb4a9 100644
--- a/sound/usb/mixer.c
+++ b/sound/usb/mixer.c
@@ -1190,6 +1190,16 @@ static void volume_control_quirks(struct usb_mixer_elem_info *cval,
 			cval->res = 1;
 		}
 		break;
+
+	case USB_ID(0x0e6f, 0x024a): /* PDP Riffmaster for PS4 */
+	case USB_ID(0x0e6f, 0x0249): /* PDP Riffmaster for PS5 */
+		if (!strcmp(kctl->id.name, "PCM Playback Volume")) {
+			usb_audio_info(chip,
+				"set volume quirk for PDP Riffmaster for PS4/PS5\n");
+			cval->min = -2560; /* Mute under it */
+		}
+		break;
+
 	case USB_ID(0x3302, 0x12db): /* MOONDROP Quark2 */
 		if (!strcmp(kctl->id.name, "PCM Playback Volume")) {
 			usb_audio_info(chip,
-- 
2.53.0

