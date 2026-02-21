Received: from mout02.posteo.de (mout02.posteo.de [185.67.36.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9595D1DFF7
	for <linux-sound@vger.kernel.org>; Sat, 21 Feb 2026 19:41:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.67.36.66
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771702867; cv=none; b=Dtopb1t3zXNUvrw5EpdC0cjLD9sljKoAbK7lnNMXTyuE+qoWAoJTFFQ9IHYV30DL3slOgYxOpT86jwcQMQs2MOXXVyMQPWfA8UTQx1cT7FAcB4cbJeQVH1gnw7FnR467VjQhq2yFq72ojDsiVNh+lGwv08CO6gQ6B0oF0lIrDO8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771702867; c=relaxed/simple;
	bh=v+W8xbtamI2htlpziFFed/w0p3/rkOGsxT7dpGrab8M=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=OAupVaBsD3FDpsZ6qbl3PUUzxJdXxTS4n7i8dEsghkN5RtxLA2QrVP4o3JpSrVfACzkVKJ/dYpujtIiMEzM+CDbvM/0igwAPr66fv1SpJ4nuAns7gOQy7uMEAvDfbY7ozBcBk5IAlzkqUt9ZSGEP6pk82HedIQYQWQJ5cf9St9E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=posteo.net; spf=pass smtp.mailfrom=posteo.net; dkim=pass (2048-bit key) header.d=posteo.net header.i=@posteo.net header.b=mbysv6h1; arc=none smtp.client-ip=185.67.36.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=posteo.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=posteo.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=posteo.net header.i=@posteo.net header.b="mbysv6h1"
Received: from submission (posteo.de [185.67.36.169]) 
	by mout02.posteo.de (Postfix) with ESMTPS id 4CFD2240104
	for <linux-sound@vger.kernel.org>; Sat, 21 Feb 2026 20:40:58 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=posteo.net; s=2017;
	t=1771702858; bh=gmsbcqCAwI9cOm8W07FOuYrIANdFs2WUVKTI4eQiIm0=;
	h=From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:To:Cc:From;
	b=mbysv6h11OtsgG2oqVSSPkWulBThrQWnW9Ng3WS1opHkG5jX5eCL+a2qeTbRRMQWJ
	 yzT6eTJiY1w0EcMVvBTiEqo9j2h1OvrL2Cg1s7wVQfQVQvV7iP/Rp1epDzFxZcGY6C
	 poFuI+SE2n64FvsasptTYn/L3FOwQxdBy5NDVjDkxT17SAgWumX1+NhpttEDnfv4NH
	 bx9fHepE5e+CvA2dtvzQiJYy3xTdDx5ZnYuRIatdwsxdsdKzWN98+LOADKKbC469u+
	 vtAvnEF7JO09E6ofXfg3+2wn/tRC8YDddwu+B4gXhNRh3XTrVVeBO4VfTRlBNChKRb
	 VQhN4zuQ2uKnA==
Received: from customer (localhost [127.0.0.1])
	by submission (posteo.de) with ESMTPSA id 4fJHXn2sMfz9rxG;
	Sat, 21 Feb 2026 20:40:57 +0100 (CET)
From: Panagiotis Foliadis <pfoliadis@posteo.net>
Date: Sat, 21 Feb 2026 19:40:58 +0000
Subject: [PATCH] ALSA: hda/realtek: Add quirk for Acer Aspire V3-572G
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260221-fix-detect-mic-v1-1-b6e427b5275d@posteo.net>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/x2MQQqAIBAAvyJ7bkGthPpKdChdaw9ZqEQg/T3pO
 DAzBRJFpgSjKBDp5sRnqKAaAXZfwkbIrjJoqY3UWqHnBx1lshkPtuil7QfTkjPdCjW6IlXjH07
 z+37P1pLOYAAAAA==
X-Change-ID: 20260221-fix-detect-mic-f0c5963ed64b
To: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org, 
 stable@vger.kernel.org, Charalampos Mitrodimas <charmitro@posteo.net>, 
 Panagiotis Foliadis <pfoliadis@posteo.net>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1771702857; l=1655;
 i=pfoliadis@posteo.net; s=20260221; h=from:subject:message-id;
 bh=v+W8xbtamI2htlpziFFed/w0p3/rkOGsxT7dpGrab8M=;
 b=mUGTMjRO+PqVoN3wSnXZXYM1mLc0YKTNjLUvlBeBCh0Pt6rUSi0tsmggr8YBQA4cETTyM6whb
 mOHgKimxKASB+RR7gLXb5wNSchj6g1WwIyqDvQQcfL9evDE7X5HWqZd
X-Developer-Key: i=pfoliadis@posteo.net; a=ed25519;
 pk=qQknvoFAg4AxPHIZdU7+befQmFNi/JfQaur0XrbY00I=

The Acer Aspire V3-572G has a combo jack (ALC283) but the BIOS
sets pin 0x19 to 0x411111f0 (not connected), so the headset mic
is not detected.

Add a quirk to override pin 0x19 as a headset mic and enable
headset mode.

Cc: stable@vger.kernel.org
Closes: https://bugzilla.kernel.org/show_bug.cgi?id=221075
Suggested-by: Charalampos Mitrodimas <charmitro@posteo.net>
Signed-off-by: Panagiotis Foliadis <pfoliadis@posteo.net>
---
 sound/hda/codecs/realtek/alc269.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/hda/codecs/realtek/alc269.c b/sound/hda/codecs/realtek/alc269.c
index 80f0be13b69f5a14e32d7d5ca4bdb848914c241c..1022886e2fa2fd13aca00273979f102cd11a079e 100644
--- a/sound/hda/codecs/realtek/alc269.c
+++ b/sound/hda/codecs/realtek/alc269.c
@@ -6581,6 +6581,7 @@ static const struct hda_quirk alc269_fixup_tbl[] = {
 	SND_PCI_QUIRK(0x1025, 0x079b, "Acer Aspire V5-573G", ALC282_FIXUP_ASPIRE_V5_PINS),
 	SND_PCI_QUIRK(0x1025, 0x080d, "Acer Aspire V5-122P", ALC269_FIXUP_ASPIRE_HEADSET_MIC),
 	SND_PCI_QUIRK(0x1025, 0x0840, "Acer Aspire E1", ALC269VB_FIXUP_ASPIRE_E1_COEF),
+	SND_PCI_QUIRK(0x1025, 0x0943, "Acer Aspire V3-572G", ALC269_FIXUP_ASPIRE_HEADSET_MIC),
 	SND_PCI_QUIRK(0x1025, 0x100c, "Acer Aspire E5-574G", ALC255_FIXUP_ACER_LIMIT_INT_MIC_BOOST),
 	SND_PCI_QUIRK(0x1025, 0x101c, "Acer Veriton N2510G", ALC269_FIXUP_LIFEBOOK),
 	SND_PCI_QUIRK(0x1025, 0x102b, "Acer Aspire C24-860", ALC286_FIXUP_ACER_AIO_MIC_NO_PRESENCE),

---
base-commit: 8bf22c33e7a172fbc72464f4cc484d23a6b412ba
change-id: 20260221-fix-detect-mic-f0c5963ed64b

Best regards,
-- 
Panagiotis Foliadis <pfoliadis@posteo.net>

