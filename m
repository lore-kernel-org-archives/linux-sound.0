Received: from posta.frantovo.cz (czf.frantovo.cz [91.219.244.97])
	(using TLSv1.1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 922962222A3
	for <linux-sound@vger.kernel.org>; Thu, 15 May 2025 12:24:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.219.244.97
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747311891; cv=none; b=emvzD9MdkmJ3VIRQSRnpxmT/lA1fYMSXtcMOMy18ZbbZtcSdaZxLMBQZfxmiYZyfB8eGLzUiSmnD6UQUvXwxDfp3FZgzervJoStsgGS9XWuMl1e5JmEduZM5Vo5d0+QU3jwWjdBvpfA9AucHI6nDM/mqJL6n6JmCHK5IJPZAKWY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747311891; c=relaxed/simple;
	bh=N0CRk/rkn6Nl9YiHIQNnbwXi8vXcDK+jGDvxPn2pvFU=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type; b=OFWxxlVyCjvgRgJEPv7hOPf3bvcJmrCbpCjfucXkXgPzLGhgGV2ot1rJ+WWeni/dXyQtjEQ+M2a0wGorazcxxSVbpTKSSVNv1reRZRJNZ0oosOnG5JjkM10n2DF1HbeAbKc6LPSqOlWDXl4Ys8QGbuFmi+K2X0WkGG+jxYCRYW8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=frantovo.cz; spf=none smtp.helo=posta.frantovo.cz; dkim=pass (1024-bit key) header.d=frantovo.cz header.i=@frantovo.cz header.b=agXo0iWV; arc=none smtp.client-ip=91.219.244.97
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=frantovo.cz
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.helo=posta.frantovo.cz
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=frantovo.cz header.i=@frantovo.cz header.b="agXo0iWV"
Received: from expert.. (localhost [127.0.0.1])
	by posta.frantovo.cz (Postfix) with ESMTP id AB33A12FE46;
	Thu, 15 May 2025 14:09:45 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=frantovo.cz;
	s=default; t=1747310985;
	bh=N0CRk/rkn6Nl9YiHIQNnbwXi8vXcDK+jGDvxPn2pvFU=;
	h=From:To:Subject:Date;
	b=agXo0iWVWJBeV2TLqLf8COeH6LpGK//z+D/IuBcih/YsmQJJdhhaB9qYaF8VDx33v
	 OPHPIOpNHDf50su6l5XdjM9o17cOmFttRtRrt9FxojrAqrx0fREKAp/KOZXGJAzDGP
	 Nmz9K7a+ofkFNGNNfwWX7QEc/qcNux+EhRcByZUQ=
From: =?UTF-8?q?Franti=C5=A1ek=20Ku=C4=8Dera?= <franta-linux@frantovo.cz>
To: linux-sound@vger.kernel.org,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.de>,
	=?UTF-8?q?Franti=C5=A1ek=20Ku=C4=8Dera?= <franta-linux@frantovo.cz>
Subject: [PATCH v2] ALSA: usb-audio: Rename Pioneer mixer channel controls
Date: Thu, 15 May 2025 14:23:46 +0200
Message-ID: <20250515122345.3911-2-franta-linux@frantovo.cz>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Virus-Scanned: clamav-milter 0.98.1 at posta
X-Virus-Status: Clean

so alsamixer can show the controls in correct categories: capture/playback

Fixes: 171bb5123fbc ("ALSA: usb-audio: Add Pioneer DJ DJM-V10 support")
Signed-off-by: František Kučera <franta-linux@frantovo.cz>
---
 sound/usb/mixer_quirks.c | 104 +++++++++++++++++++--------------------
 1 file changed, 52 insertions(+), 52 deletions(-)

diff --git a/sound/usb/mixer_quirks.c b/sound/usb/mixer_quirks.c
index 01091c3a83fc..e0327f0eb1fd 100644
--- a/sound/usb/mixer_quirks.c
+++ b/sound/usb/mixer_quirks.c
@@ -3713,13 +3713,13 @@ static const u16 snd_djm_opts_250mk2_pb2[] = { 0x0200, 0x0201, 0x0204 };
 static const u16 snd_djm_opts_250mk2_pb3[] = { 0x0300, 0x0301, 0x0304 };
 
 static const struct snd_djm_ctl snd_djm_ctls_250mk2[] = {
-	SND_DJM_CTL("Capture Level", cap_level, 0, SND_DJM_WINDEX_CAPLVL),
-	SND_DJM_CTL("Ch1 Input",   250mk2_cap1, 2, SND_DJM_WINDEX_CAP),
-	SND_DJM_CTL("Ch2 Input",   250mk2_cap2, 2, SND_DJM_WINDEX_CAP),
-	SND_DJM_CTL("Ch3 Input",   250mk2_cap3, 0, SND_DJM_WINDEX_CAP),
-	SND_DJM_CTL("Ch1 Output",   250mk2_pb1, 0, SND_DJM_WINDEX_PB),
-	SND_DJM_CTL("Ch2 Output",   250mk2_pb2, 1, SND_DJM_WINDEX_PB),
-	SND_DJM_CTL("Ch3 Output",   250mk2_pb3, 2, SND_DJM_WINDEX_PB)
+	SND_DJM_CTL("Master Input Level Capture Switch", cap_level, 0, SND_DJM_WINDEX_CAPLVL),
+	SND_DJM_CTL("Input 1 Capture Switch",  250mk2_cap1, 2, SND_DJM_WINDEX_CAP),
+	SND_DJM_CTL("Input 2 Capture Switch",  250mk2_cap2, 2, SND_DJM_WINDEX_CAP),
+	SND_DJM_CTL("Input 3 Capture Switch",  250mk2_cap3, 0, SND_DJM_WINDEX_CAP),
+	SND_DJM_CTL("Output 1 Playback Switch", 250mk2_pb1, 0, SND_DJM_WINDEX_PB),
+	SND_DJM_CTL("Output 2 Playback Switch", 250mk2_pb2, 1, SND_DJM_WINDEX_PB),
+	SND_DJM_CTL("Output 3 Playback Switch", 250mk2_pb3, 2, SND_DJM_WINDEX_PB)
 };
 
 
@@ -3738,13 +3738,13 @@ static const u16 snd_djm_opts_450_pb2[] = { 0x0200, 0x0201, 0x0204 };
 static const u16 snd_djm_opts_450_pb3[] = { 0x0300, 0x0301, 0x0304 };
 
 static const struct snd_djm_ctl snd_djm_ctls_450[] = {
-	SND_DJM_CTL("Capture Level", cap_level, 0, SND_DJM_WINDEX_CAPLVL),
-	SND_DJM_CTL("Ch1 Input",   450_cap1, 2, SND_DJM_WINDEX_CAP),
-	SND_DJM_CTL("Ch2 Input",   450_cap2, 2, SND_DJM_WINDEX_CAP),
-	SND_DJM_CTL("Ch3 Input",   450_cap3, 0, SND_DJM_WINDEX_CAP),
-	SND_DJM_CTL("Ch1 Output",   450_pb1, 0, SND_DJM_WINDEX_PB),
-	SND_DJM_CTL("Ch2 Output",   450_pb2, 1, SND_DJM_WINDEX_PB),
-	SND_DJM_CTL("Ch3 Output",   450_pb3, 2, SND_DJM_WINDEX_PB)
+	SND_DJM_CTL("Master Input Level Capture Switch", cap_level, 0, SND_DJM_WINDEX_CAPLVL),
+	SND_DJM_CTL("Input 1 Capture Switch",  450_cap1, 2, SND_DJM_WINDEX_CAP),
+	SND_DJM_CTL("Input 2 Capture Switch",  450_cap2, 2, SND_DJM_WINDEX_CAP),
+	SND_DJM_CTL("Input 3 Capture Switch",  450_cap3, 0, SND_DJM_WINDEX_CAP),
+	SND_DJM_CTL("Output 1 Playback Switch", 450_pb1, 0, SND_DJM_WINDEX_PB),
+	SND_DJM_CTL("Output 2 Playback Switch", 450_pb2, 1, SND_DJM_WINDEX_PB),
+	SND_DJM_CTL("Output 3 Playback Switch", 450_pb3, 2, SND_DJM_WINDEX_PB)
 };
 
 
@@ -3759,11 +3759,11 @@ static const u16 snd_djm_opts_750_cap4[] = {
 	0x0401, 0x0403, 0x0406, 0x0407, 0x0408, 0x0409, 0x040a, 0x040f };
 
 static const struct snd_djm_ctl snd_djm_ctls_750[] = {
-	SND_DJM_CTL("Capture Level", cap_level, 0, SND_DJM_WINDEX_CAPLVL),
-	SND_DJM_CTL("Ch1 Input",   750_cap1, 2, SND_DJM_WINDEX_CAP),
-	SND_DJM_CTL("Ch2 Input",   750_cap2, 2, SND_DJM_WINDEX_CAP),
-	SND_DJM_CTL("Ch3 Input",   750_cap3, 0, SND_DJM_WINDEX_CAP),
-	SND_DJM_CTL("Ch4 Input",   750_cap4, 0, SND_DJM_WINDEX_CAP)
+	SND_DJM_CTL("Master Input Level Capture Switch", cap_level, 0, SND_DJM_WINDEX_CAPLVL),
+	SND_DJM_CTL("Input 1 Capture Switch", 750_cap1, 2, SND_DJM_WINDEX_CAP),
+	SND_DJM_CTL("Input 2 Capture Switch", 750_cap2, 2, SND_DJM_WINDEX_CAP),
+	SND_DJM_CTL("Input 3 Capture Switch", 750_cap3, 0, SND_DJM_WINDEX_CAP),
+	SND_DJM_CTL("Input 4 Capture Switch", 750_cap4, 0, SND_DJM_WINDEX_CAP)
 };
 
 
@@ -3778,11 +3778,11 @@ static const u16 snd_djm_opts_850_cap4[] = {
 	0x0400, 0x0403, 0x0406, 0x0407, 0x0408, 0x0409, 0x040a, 0x040f };
 
 static const struct snd_djm_ctl snd_djm_ctls_850[] = {
-	SND_DJM_CTL("Capture Level", cap_level, 0, SND_DJM_WINDEX_CAPLVL),
-	SND_DJM_CTL("Ch1 Input",   850_cap1, 1, SND_DJM_WINDEX_CAP),
-	SND_DJM_CTL("Ch2 Input",   850_cap2, 0, SND_DJM_WINDEX_CAP),
-	SND_DJM_CTL("Ch3 Input",   850_cap3, 0, SND_DJM_WINDEX_CAP),
-	SND_DJM_CTL("Ch4 Input",   850_cap4, 1, SND_DJM_WINDEX_CAP)
+	SND_DJM_CTL("Master Input Level Capture Switch", cap_level, 0, SND_DJM_WINDEX_CAPLVL),
+	SND_DJM_CTL("Input 1 Capture Switch", 850_cap1, 1, SND_DJM_WINDEX_CAP),
+	SND_DJM_CTL("Input 2 Capture Switch", 850_cap2, 0, SND_DJM_WINDEX_CAP),
+	SND_DJM_CTL("Input 3 Capture Switch", 850_cap3, 0, SND_DJM_WINDEX_CAP),
+	SND_DJM_CTL("Input 4 Capture Switch", 850_cap4, 1, SND_DJM_WINDEX_CAP)
 };
 
 
@@ -3799,12 +3799,12 @@ static const u16 snd_djm_opts_900nxs2_cap5[] = {
 	0x0507, 0x0508, 0x0509, 0x050a, 0x0511, 0x0512, 0x0513, 0x0514 };
 
 static const struct snd_djm_ctl snd_djm_ctls_900nxs2[] = {
-	SND_DJM_CTL("Capture Level", cap_level, 0, SND_DJM_WINDEX_CAPLVL),
-	SND_DJM_CTL("Ch1 Input",   900nxs2_cap1, 2, SND_DJM_WINDEX_CAP),
-	SND_DJM_CTL("Ch2 Input",   900nxs2_cap2, 2, SND_DJM_WINDEX_CAP),
-	SND_DJM_CTL("Ch3 Input",   900nxs2_cap3, 2, SND_DJM_WINDEX_CAP),
-	SND_DJM_CTL("Ch4 Input",   900nxs2_cap4, 2, SND_DJM_WINDEX_CAP),
-	SND_DJM_CTL("Ch5 Input",   900nxs2_cap5, 3, SND_DJM_WINDEX_CAP)
+	SND_DJM_CTL("Master Input Level Capture Switch", cap_level, 0, SND_DJM_WINDEX_CAPLVL),
+	SND_DJM_CTL("Input 1 Capture Switch", 900nxs2_cap1, 2, SND_DJM_WINDEX_CAP),
+	SND_DJM_CTL("Input 2 Capture Switch", 900nxs2_cap2, 2, SND_DJM_WINDEX_CAP),
+	SND_DJM_CTL("Input 3 Capture Switch", 900nxs2_cap3, 2, SND_DJM_WINDEX_CAP),
+	SND_DJM_CTL("Input 4 Capture Switch", 900nxs2_cap4, 2, SND_DJM_WINDEX_CAP),
+	SND_DJM_CTL("Input 5 Capture Switch", 900nxs2_cap5, 3, SND_DJM_WINDEX_CAP)
 };
 
 // DJM-750MK2
@@ -3825,15 +3825,15 @@ static const u16 snd_djm_opts_750mk2_pb3[] = { 0x0300, 0x0301, 0x0304 };
 
 
 static const struct snd_djm_ctl snd_djm_ctls_750mk2[] = {
-	SND_DJM_CTL("Capture Level", cap_level, 0, SND_DJM_WINDEX_CAPLVL),
-	SND_DJM_CTL("Ch1 Input",   750mk2_cap1, 2, SND_DJM_WINDEX_CAP),
-	SND_DJM_CTL("Ch2 Input",   750mk2_cap2, 2, SND_DJM_WINDEX_CAP),
-	SND_DJM_CTL("Ch3 Input",   750mk2_cap3, 2, SND_DJM_WINDEX_CAP),
-	SND_DJM_CTL("Ch4 Input",   750mk2_cap4, 2, SND_DJM_WINDEX_CAP),
-	SND_DJM_CTL("Ch5 Input",   750mk2_cap5, 3, SND_DJM_WINDEX_CAP),
-	SND_DJM_CTL("Ch1 Output",   750mk2_pb1, 0, SND_DJM_WINDEX_PB),
-	SND_DJM_CTL("Ch2 Output",   750mk2_pb2, 1, SND_DJM_WINDEX_PB),
-	SND_DJM_CTL("Ch3 Output",   750mk2_pb3, 2, SND_DJM_WINDEX_PB)
+	SND_DJM_CTL("Master Input Level Capture Switch", cap_level, 0, SND_DJM_WINDEX_CAPLVL),
+	SND_DJM_CTL("Input 1 Capture Switch",   750mk2_cap1, 2, SND_DJM_WINDEX_CAP),
+	SND_DJM_CTL("Input 2 Capture Switch",   750mk2_cap2, 2, SND_DJM_WINDEX_CAP),
+	SND_DJM_CTL("Input 3 Capture Switch",   750mk2_cap3, 2, SND_DJM_WINDEX_CAP),
+	SND_DJM_CTL("Input 4 Capture Switch",   750mk2_cap4, 2, SND_DJM_WINDEX_CAP),
+	SND_DJM_CTL("Input 5 Capture Switch",   750mk2_cap5, 3, SND_DJM_WINDEX_CAP),
+	SND_DJM_CTL("Output 1 Playback Switch", 750mk2_pb1, 0, SND_DJM_WINDEX_PB),
+	SND_DJM_CTL("Output 2 Playback Switch", 750mk2_pb2, 1, SND_DJM_WINDEX_PB),
+	SND_DJM_CTL("Output 3 Playback Switch", 750mk2_pb3, 2, SND_DJM_WINDEX_PB)
 };
 
 
@@ -3853,12 +3853,12 @@ static const u16 snd_djm_opts_a9_cap5[] = {
 	0x0501, 0x0502, 0x0503, 0x0505, 0x0506, 0x0507, 0x0508, 0x0509, 0x050a, 0x050e };
 
 static const struct snd_djm_ctl snd_djm_ctls_a9[] = {
-	SND_DJM_CTL("Capture Level", a9_cap_level, 0, SND_DJM_WINDEX_CAPLVL),
-	SND_DJM_CTL("Master Input",  a9_cap1, 3, SND_DJM_WINDEX_CAP),
-	SND_DJM_CTL("Ch1 Input",     a9_cap2, 2, SND_DJM_WINDEX_CAP),
-	SND_DJM_CTL("Ch2 Input",     a9_cap3, 2, SND_DJM_WINDEX_CAP),
-	SND_DJM_CTL("Ch3 Input",     a9_cap4, 2, SND_DJM_WINDEX_CAP),
-	SND_DJM_CTL("Ch4 Input",     a9_cap5, 2, SND_DJM_WINDEX_CAP)
+	SND_DJM_CTL("Master Input Level Capture Switch", a9_cap_level, 0, SND_DJM_WINDEX_CAPLVL),
+	SND_DJM_CTL("Master Input Capture Switch", a9_cap1, 3, SND_DJM_WINDEX_CAP),
+	SND_DJM_CTL("Input 1 Capture Switch",  a9_cap2, 2, SND_DJM_WINDEX_CAP),
+	SND_DJM_CTL("Input 2 Capture Switch",  a9_cap3, 2, SND_DJM_WINDEX_CAP),
+	SND_DJM_CTL("Input 3 Capture Switch",  a9_cap4, 2, SND_DJM_WINDEX_CAP),
+	SND_DJM_CTL("Input 4 Capture Switch",  a9_cap5, 2, SND_DJM_WINDEX_CAP)
 };
 
 // DJM-V10
@@ -3895,13 +3895,13 @@ static const u16 snd_djm_opts_v10_cap6[] = {
 };
 
 static const struct snd_djm_ctl snd_djm_ctls_v10[] = {
-	SND_DJM_CTL("Master Capture Level Capture Switch", v10_cap_level, 0, SND_DJM_WINDEX_CAPLVL),
-	SND_DJM_CTL("Capture Ch1 Capture Switch", v10_cap1, 2, SND_DJM_WINDEX_CAP),
-	SND_DJM_CTL("Capture Ch2 Capture Switch", v10_cap2, 2, SND_DJM_WINDEX_CAP),
-	SND_DJM_CTL("Capture Ch3 Capture Switch", v10_cap3, 0, SND_DJM_WINDEX_CAP),
-	SND_DJM_CTL("Capture Ch4 Capture Switch", v10_cap4, 0, SND_DJM_WINDEX_CAP),
-	SND_DJM_CTL("Capture Ch5 Capture Switch", v10_cap5, 0, SND_DJM_WINDEX_CAP),
-	SND_DJM_CTL("Capture Ch6 Capture Switch", v10_cap6, 0, SND_DJM_WINDEX_CAP)
+	SND_DJM_CTL("Master Input Level Capture Switch", v10_cap_level, 0, SND_DJM_WINDEX_CAPLVL),
+	SND_DJM_CTL("Input 1 Capture Switch", v10_cap1, 2, SND_DJM_WINDEX_CAP),
+	SND_DJM_CTL("Input 2 Capture Switch", v10_cap2, 2, SND_DJM_WINDEX_CAP),
+	SND_DJM_CTL("Input 3 Capture Switch", v10_cap3, 0, SND_DJM_WINDEX_CAP),
+	SND_DJM_CTL("Input 4 Capture Switch", v10_cap4, 0, SND_DJM_WINDEX_CAP),
+	SND_DJM_CTL("Input 5 Capture Switch", v10_cap5, 0, SND_DJM_WINDEX_CAP),
+	SND_DJM_CTL("Input 6 Capture Switch", v10_cap6, 0, SND_DJM_WINDEX_CAP)
 	// playback channels are fixed and controlled by hardware knobs on the mixer
 };
 
-- 
2.43.0

