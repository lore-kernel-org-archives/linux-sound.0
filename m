Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75F9630597F;
	Wed, 19 Nov 2025 08:55:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.31.2
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763542503; cv=none; b=SH1Py/rimY3bLKxWecnCG0TpRtYDEyT+JYAJiU9HepBBDbzkBe/78diJ/zKYO8A4a+WIqpj38ajWMjaNu8lxFJtz1ywphEOw4NkSzI75NIXYL3FVz78TjQGz+Mimw4klYS/s764GDOgZjP8j9QwrEh7h1Q9yaNCo6LewFTIrjpU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763542503; c=relaxed/simple;
	bh=sLaOyY4IvkBK+FYgn0+IQ82cV55N6hWmuMIZtR/Zxo0=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=ununf3Jr8IBQm3ZMwVOgMO1056ZxduANAMqIFnKRZdJGTsvPp/qhwx+Baoj1EmC6pJK2RKJ9v2Lniq6Vng5tB2vcxLiaLEKd8H7kwfe008hwv7wJPwNk9ZihEU5hTBsHlo+RMm6aSJ07HeIHz3KTj4n2kevZKD0F8GbZV9vzou8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=PxjAUinl; arc=none smtp.client-ip=220.197.31.2
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="PxjAUinl"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version; bh=xT
	ZUfdXiXDB7PJUy11HvFsp18IC0StlAD3bOi0um3Ok=; b=PxjAUinlp5n/581X00
	+zMeGZwd6VqqvriZ7UKrBsaK3ANxAwal/ylQObWKZDvKpQV9uttnnWrTyGXjjCtS
	EgYTHpr6n4KtD/bD59ERJMpaPrNxDsc5au8Amo4InSem8NG6m7jdAdZo9GLvRhYt
	SJ928i5Zkrr52x4Ks0Pk2caPw=
Received: from localhost.localdomain (unknown [])
	by gzga-smtp-mtada-g1-4 (Coremail) with SMTP id _____wAXbmybhR1pNONgBA--.31S2;
	Wed, 19 Nov 2025 16:53:49 +0800 (CST)
From: wangdich9700@163.com
To: lgirdwood@gmail.com,
	broonie@kernel.org,
	perex@perex.cz,
	tiwai@suse.com,
	cezary.rojewski@intel.com
Cc: linux-kernel@vger.kernel.org,
	linux-sound@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	wangdicheng <wangdicheng@kylinos.cn>
Subject: [PATCH V2] ALSA: hda/conexant: Implement resume function
Date: Wed, 19 Nov 2025 16:53:45 +0800
Message-Id: <20251119085345.141850-1-wangdich9700@163.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:_____wAXbmybhR1pNONgBA--.31S2
X-Coremail-Antispam: 1Uf129KBjvJXoW7CF1kAry7WFy7Jr4xZw4UXFb_yoW8Gr4xpr
	1vka4rG3Z7ta1IyF4xKw4Yg3Z8CayrCFW3J3y5K34ayan0gr1vg3WSqry7Xa48KrZ0kF1a
	qFy2v3yDAFW5AaDanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07UBxRgUUUUU=
X-CM-SenderInfo: pzdqwv5lfkmliqq6il2tof0z/xtbCwB0qeWkdhZ1T2gAA3r

From: wangdicheng <wangdicheng@kylinos.cn>

During S3 sleep state, if headphones are unplugged, we need to re-report
their status during the wake phase to ensure proper headphone presence
detection after system resume.

Signed-off-by: wangdicheng <wangdicheng@kylinos.cn>
---

v1->v2:
Problem: No audio output device after S3.
Cause: The audio driver misses re-initialization upon resume,
resulting in stale jack status (remaining in the pre-sleep state),
which prevents the system from finding the correct output device.

 sound/hda/codecs/conexant.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/sound/hda/codecs/conexant.c b/sound/hda/codecs/conexant.c
index 5fcbc1312c69..146ff65ccc30 100644
--- a/sound/hda/codecs/conexant.c
+++ b/sound/hda/codecs/conexant.c
@@ -264,6 +264,13 @@ static int cx_suspend(struct hda_codec *codec)
 	return 0;
 }
 
+static int cx_resume(struct hda_codec *codec)
+{
+	cx_init(codec);
+	snd_hda_jack_report_sync(codec);
+	return 0;
+}
+
 /*
  * pin fix-up
  */
@@ -1277,6 +1284,7 @@ static const struct hda_codec_ops cx_codec_ops = {
 	.init = cx_init,
 	.unsol_event = snd_hda_jack_unsol_event,
 	.suspend = cx_suspend,
+	.resume = cx_resume,
 	.check_power_status = snd_hda_gen_check_power_status,
 	.stream_pm = snd_hda_gen_stream_pm,
 };
-- 
2.25.1

