Received: from mout02.posteo.de (mout02.posteo.de [185.67.36.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99C83286D53
	for <linux-sound@vger.kernel.org>; Wed, 25 Feb 2026 14:53:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.67.36.66
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772031234; cv=none; b=fDr8EnOc25lEjjI7HvKftPNpCRzaR6f6D4L4oGTB3LRHKGCrTAcHFcr0bysN8qzJHFTqexrI64OEjQgXvFf26IqB/dMLioOkQeXd7CLL4bdXYB1QccZtnnBy8Wwr4+sgxK0g37pB8IDQEpDDlEp40QyQ56WQKWcFU0rjZIFW3JE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772031234; c=relaxed/simple;
	bh=f9gtquX/pXI0BghwN1uwO3/gwwWphET7BCJKcJhI4fY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=JX+0FhxJHM1gprI7Y6R3izGxOwM/lfkEGXJ7xwlffzw7vb7roqIx/Vr8/0UTcrjsGjg9IrQp807+Ech+FYQ9oIlElZOrLkOQ/2Ft4MjYGKGOk41dfJhZQHpvVxf2m1ur26Uvjx5QAGn8Z6MbQkATYjFe4M9TFHK6KZYLtyKi+kg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=posteo.net; spf=pass smtp.mailfrom=posteo.net; dkim=pass (2048-bit key) header.d=posteo.net header.i=@posteo.net header.b=BurMvEHW; arc=none smtp.client-ip=185.67.36.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=posteo.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=posteo.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=posteo.net header.i=@posteo.net header.b="BurMvEHW"
Received: from submission (posteo.de [185.67.36.169]) 
	by mout02.posteo.de (Postfix) with ESMTPS id A6239240101
	for <linux-sound@vger.kernel.org>; Wed, 25 Feb 2026 15:53:43 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=posteo.net; s=2017;
	t=1772031223; bh=WRtsRDO/gsyHidTTtsMDAqc6db+YRswhAYjQbcM80Jw=;
	h=From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:To:Cc:From;
	b=BurMvEHWR3lOnETlJ0aJJTaDag8mLkHxg10t/ipL0nKHbylCfXH68TnkS4hZkWagY
	 dbTo8aCU0Yfn7Q5+mmYHjPau/LZnoQGTJsztu8hUVsdkd/MTq2ewezFQwiOXUmP6kJ
	 6oBd8uJMNlEOs9FI+WI+iVDU0/I7MA0WNeJtL2gkLjojWKIOBQull3xXwDxVzI+lmZ
	 Q+xMPLAg2TLJq/VqG8oN9czTq+J/YWLVE40tKETusmTLjitNy/TjFB0pkFWVAkeUYQ
	 cJe/9t51s/U+Z8TOQyr/FoN5eIqwQpkpB/Kw1lOrHTqlTg4voALDWvFT4HGeQUUVPb
	 gwTrHRRAKpx/Q==
Received: from customer (localhost [127.0.0.1])
	by submission (posteo.de) with ESMTPSA id 4fLczV2CVTz6twx;
	Wed, 25 Feb 2026 15:53:42 +0100 (CET)
From: Panagiotis Foliadis <pfoliadis@posteo.net>
Date: Wed, 25 Feb 2026 14:53:43 +0000
Subject: [PATCH] ALSA: hda/intel: increase default bdl_pos_adj for Nvidia
 controllers
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260225-nvidia-audio-fix-v1-1-b1383c37ec49@posteo.net>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/x2MywqAIBAAf0X23IJtD6FfiQ6ma+3FQimC8N+Tj
 jMw80LmJJxhUi8kviXLESu0jQK327gxiq8MpGnURB3GW7xYtJeXA4M8aMZgBr/2bBxBzc7EVf/
 LeSnlA06RLd5iAAAA
X-Change-ID: 20260223-nvidia-audio-fix-76f75db4e7c2
To: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org, 
 stable@vger.kernel.org, Charalampos Mitrodimas <charmitro@posteo.net>, 
 Panagiotis Foliadis <pfoliadis@posteo.net>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1772031222; l=1440;
 i=pfoliadis@posteo.net; s=20260221; h=from:subject:message-id;
 bh=f9gtquX/pXI0BghwN1uwO3/gwwWphET7BCJKcJhI4fY=;
 b=Alti5cjpXFhS5G//sXE8RJro4PVJ1FZ1rA05z2qwnbXA4M+F1FTrs6v2oJ3VWdJv0KKZ5bwSA
 0I4oqcMK60aDKv22ijxX29c54fYCddrlRlBSsqUaImi7KfWYLI3kEnv
X-Developer-Key: i=pfoliadis@posteo.net; a=ed25519;
 pk=qQknvoFAg4AxPHIZdU7+befQmFNi/JfQaur0XrbY00I=

The default bdl_pos_adj of 32 for Nvidia HDA controllers is
insufficient on GA102 (and likely other recent Nvidia GPUs) after S3
suspend/resume. The controller's DMA timing degrades after resume,
causing premature IRQ detection in azx_position_ok() which results in
silent HDMI/DP audio output despite userspace reporting a valid
playback state and correct ELD data.

Increase bdl_pos_adj to 64 for AZX_DRIVER_NVIDIA, matching the value
already used by Intel Apollo Lake for the same class of timing issue.

Cc: stable@vger.kernel.org
Closes: https://bugzilla.kernel.org/show_bug.cgi?id=221069
Suggested-by: Charalampos Mitrodimas <charmitro@posteo.net>
Signed-off-by: Panagiotis Foliadis <pfoliadis@posteo.net>
---
 sound/hda/controllers/intel.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/sound/hda/controllers/intel.c b/sound/hda/controllers/intel.c
index 6fddf400c4a3d67042e421b81ac3a13607a24bcd..3f434994c18db64019d3b4cfff8a7cc8764b5f26 100644
--- a/sound/hda/controllers/intel.c
+++ b/sound/hda/controllers/intel.c
@@ -1751,6 +1751,8 @@ static int default_bdl_pos_adj(struct azx *chip)
 		return 1;
 	case AZX_DRIVER_ZHAOXINHDMI:
 		return 128;
+	case AZX_DRIVER_NVIDIA:
+		return 64;
 	default:
 		return 32;
 	}

---
base-commit: 6de23f81a5e08be8fbf5e8d7e9febc72a5b5f27f
change-id: 20260223-nvidia-audio-fix-76f75db4e7c2

Best regards,
-- 
Panagiotis Foliadis <pfoliadis@posteo.net>

