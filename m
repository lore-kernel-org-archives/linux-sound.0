Received: from bg5.exmail.qq.com (bg5.exmail.qq.com [43.154.197.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B088515E5BB
	for <linux-sound@vger.kernel.org>; Sat,  7 Sep 2024 14:30:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=43.154.197.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725719407; cv=none; b=RViKjPY7AfBA2l9XqHZYl9l+BrMBjWzwDnrmcSct65FZUxbhbzfC0O/5kY/JrIfASYe4/36BlI9bOMdRA2bpRxOe3DOhfojcxu7PV2iSExcqzYj1Jx4dJ+UEjXOZ+BRAlquFNENeQmypih3/UuMjDbmjfD3uR++0sQ+0+yqBaR8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725719407; c=relaxed/simple;
	bh=qmSlZ6E5i1MMOgrexZ/Ddep3dt2UITq5xOhrA/RGZ6k=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ffJlcVe/C0jsGU/+C67gt9/ONrGjXJexpwfElSqxgHwemGX8kfMFJUeFkWxF5dfW3ZZIIg/nqxKOTWYc7Psqab375fPsLJizTgbDYAGe64m2+aSrzVLgOpXy47VzTOvp7s5QHX6vYGeYT8kFUscYXlSG2ojWgsF5JUibUjQu9ws=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=uniontech.com; spf=pass smtp.mailfrom=uniontech.com; dkim=pass (1024-bit key) header.d=uniontech.com header.i=@uniontech.com header.b=ZXkpm942; arc=none smtp.client-ip=43.154.197.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=uniontech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=uniontech.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=uniontech.com header.i=@uniontech.com header.b="ZXkpm942"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=uniontech.com;
	s=onoh2408; t=1725719345;
	bh=Y+IVqKJEFLEmDD0kEBdMuKRvFRO9aBuxF/d7786m3sE=;
	h=From:To:Subject:Date:Message-ID:MIME-Version;
	b=ZXkpm942aqhUByzSS0IDU4zvvVDX89L5frkJVdsFFTkSLZhGCxLYmkdg4v9LXAPYy
	 HN0Vo2Cy4erqLhUZMG5a9g5xknU91m2D1g5a5cqImONhF3YtQw1+at3R/xxu8wzimn
	 C9pxUjqFKB9JXCcREGACrY31pHT5RAb06bW3ZA/w=
X-QQ-mid: bizesmtp80t1725719341tpwozw0q
X-QQ-Originating-IP: MYjS+aL1T699ORHnAaqPRlrEf5x3Q5kJaTJSjpQFvIk=
Received: from localhost.localdomain ( [221.226.144.218])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Sat, 07 Sep 2024 22:28:56 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 1
X-BIZMAIL-ID: 111964524495199217
From: He Lugang <helugang@uniontech.com>
To: perex@perex.cz,
	tiwai@suse.com,
	kuninori.morimoto.gx@renesas.com
Cc: linux-sound@vger.kernel.org,
	He Lugang <helugang@uniontech.com>
Subject: [PATCH] ALSA:rme9652:remove unused parameter in macro
Date: Sat,  7 Sep 2024 22:28:54 +0800
Message-ID: <F53E9F10DA24705D+20240907142854.17627-1-helugang@uniontech.com>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtp:uniontech.com:qybglogicsvrgz:qybglogicsvrgz7a-0

Parameter xindex is not used in macro HDSPM_TCO_LTC_FRAMES and
HDSPM_TCO_VIDEO_INPUT_FORMAT,so just remove it to simplify the code.

Signed-off-by: He Lugang <helugang@uniontech.com>
---
 sound/pci/rme9652/hdspm.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/sound/pci/rme9652/hdspm.c b/sound/pci/rme9652/hdspm.c
index c3f930a8f78d..e5b050c9e756 100644
--- a/sound/pci/rme9652/hdspm.c
+++ b/sound/pci/rme9652/hdspm.c
@@ -3083,7 +3083,7 @@ static int snd_hdspm_get_autosync_ref(struct snd_kcontrol *kcontrol,
 
 
 
-#define HDSPM_TCO_VIDEO_INPUT_FORMAT(xname, xindex) \
+#define HDSPM_TCO_VIDEO_INPUT_FORMAT(xname) \
 {	.iface = SNDRV_CTL_ELEM_IFACE_MIXER, \
 	.name = xname, \
 	.access = SNDRV_CTL_ELEM_ACCESS_READ |\
@@ -3129,7 +3129,7 @@ static int snd_hdspm_get_tco_video_input_format(struct snd_kcontrol *kcontrol,
 
 
 
-#define HDSPM_TCO_LTC_FRAMES(xname, xindex) \
+#define HDSPM_TCO_LTC_FRAMES(xname) \
 {	.iface = SNDRV_CTL_ELEM_IFACE_MIXER, \
 	.name = xname, \
 	.access = SNDRV_CTL_ELEM_ACCESS_READ |\
@@ -4630,8 +4630,8 @@ static const struct snd_kcontrol_new snd_hdspm_controls_tco[] = {
 	HDSPM_TCO_WORD_TERM("TCO Word Term", 0),
 	HDSPM_TCO_LOCK_CHECK("TCO Input Check", 11),
 	HDSPM_TCO_LOCK_CHECK("TCO LTC Valid", 12),
-	HDSPM_TCO_LTC_FRAMES("TCO Detected Frame Rate", 0),
-	HDSPM_TCO_VIDEO_INPUT_FORMAT("Video Input Format", 0)
+	HDSPM_TCO_LTC_FRAMES("TCO Detected Frame Rate"),
+	HDSPM_TCO_VIDEO_INPUT_FORMAT("Video Input Format")
 };
 
 
-- 
2.45.2

