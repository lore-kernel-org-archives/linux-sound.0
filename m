Received: from mail.tuxedocomputers.com (mail.tuxedocomputers.com [157.90.84.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3597369212;
	Thu, 22 Jan 2026 17:18:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=157.90.84.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769102306; cv=none; b=P0nFuI9A/rHQnFvYDIUBOIBb1GS7jj/SqiG8Z6PjGCKAJe3xvXvNHBN6VBhb2tmtlmGFJWOeiSinmmjO6+oAueggyAky31k0/EdxxHsuOMLN5zs2c0Kz3XnRvh9QyYW8+Px6iddbsNwujBOgBM9S7coLInt1Lt7uo/rp4mpYbU4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769102306; c=relaxed/simple;
	bh=UnTFN6X9/vaYbLp8IDmRoK2HpmPu/XZdOHP4WGxBFGk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=C5Oh9fG5Eop+8G6LsOaFFzXOWa+k1rqj+rCqmbhgqjoruu9cR4bavod4jCdNCozJ/SR3GHi4Oh+Hsq6z+xsbheGGT4EfSnNXZCkdPozhEPeCeuw/1h6dSxMMs+aBpOo4S3Dny0XTdUDDdkUvl985o/8kR+dlcAGF+K7Pkw2T0nw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tuxedocomputers.com; spf=pass smtp.mailfrom=tuxedocomputers.com; dkim=pass (1024-bit key) header.d=tuxedocomputers.com header.i=@tuxedocomputers.com header.b=nwPkspIy; arc=none smtp.client-ip=157.90.84.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tuxedocomputers.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxedocomputers.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=tuxedocomputers.com header.i=@tuxedocomputers.com header.b="nwPkspIy"
Received: from wse-pc.. (unknown [61.8.159.47])
	(Authenticated sender: wse@tuxedocomputers.com)
	by mail.tuxedocomputers.com (Postfix) with ESMTPA id 9D9EB2FC0055;
	Thu, 22 Jan 2026 18:18:07 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=tuxedocomputers.com;
	s=default; t=1769102288;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=EzQ1QOqDVpJKSrokEdy9Uwz5rx0sIMsq3Jvg07vtDXU=;
	b=nwPkspIy9TDSk40N5WO47MzWDstagw39FbK1546/IDeY0BL16w+lwAnU7lNwP6C7mpcryi
	ayGfJoQhC8+s9dRU+nk11W+aAw++IJNPnOefAzameQ1b4hWlfhoA/Oe9yYvO73aWUdwQnL
	1KscvAuJirVFmdxR+hL6tmfAD2WiPIk=
Authentication-Results: mail.tuxedocomputers.com;
	auth=pass smtp.auth=wse@tuxedocomputers.com smtp.mailfrom=wse@tuxedocomputers.com
From: Werner Sembach <wse@tuxedocomputers.com>
To: Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>
Cc: Werner Sembach <wse@tuxedocomputers.com>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/2] Revert "ALSA: hda/realtek: Fix headset mic for TongFang  X6AR55xU"
Date: Thu, 22 Jan 2026 18:13:43 +0100
Message-ID: <20260122171543.19958-3-wse@tuxedocomputers.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260122171543.19958-2-wse@tuxedocomputers.com>
References: <20260122171543.19958-2-wse@tuxedocomputers.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This reverts commit 89f135b774c71ab603a5da66d0c1449e76750389.

Signed-off-by: Werner Sembach <wse@tuxedocomputers.com>
---
 sound/hda/codecs/realtek/alc269.c | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/sound/hda/codecs/realtek/alc269.c b/sound/hda/codecs/realtek/alc269.c
index 24d534f6d3d3a..eb6197d19078c 100644
--- a/sound/hda/codecs/realtek/alc269.c
+++ b/sound/hda/codecs/realtek/alc269.c
@@ -7674,10 +7674,6 @@ static const struct snd_hda_pin_quirk alc269_pin_fixup_tbl[] = {
 		{0x12, 0x90a60140},
 		{0x19, 0x04a11030},
 		{0x21, 0x04211020}),
-	SND_HDA_PIN_QUIRK(0x10ec0274, 0x1d05, "TongFang", ALC274_FIXUP_HP_HEADSET_MIC,
-		{0x17, 0x90170110},
-		{0x19, 0x03a11030},
-		{0x21, 0x03211020}),
 	SND_HDA_PIN_QUIRK(0x10ec0282, 0x1025, "Acer", ALC282_FIXUP_ACER_DISABLE_LINEOUT,
 		ALC282_STANDARD_PINS,
 		{0x12, 0x90a609c0},
-- 
2.43.0

