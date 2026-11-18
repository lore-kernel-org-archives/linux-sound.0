Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=85.128.243.59
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795028632;
	b=fN//W1xohSIJ/2mG4dgjU5qConBcQd2x6QcCzUfVQ07M3wG9MenZ7arYxTl/3WelJ9Rr
	 hTc7Hl1rkFzwnYpX9RB2DwqZXBr2PyhFbebF1k40JFr+oy+E9XgPFNLQHSHFdAfTFmahz
	 ApMfRZ3hn7MFaMDJ22wDchdO5RIRNAJN/FieO2cE7ihzKIT13xMpNTMiGYRsUtr3HJSLD
	 lrmgoCec7/QfT/x9ewTu/Mise18dDdPWpyfY5/J98yNl8d6zJQCiy6dlkfJhDKc0iJIS3
	 STvPAUuPcJK1GTV6t98ojdgu41ee3jKx2DarLxcN9nOIxdJJPcoJQ3UxdfD5xDMU/rg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795028632;
	h=DMARC-Filter:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:DKIM-Signature:Received:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=+5JuYV9xJVGC+ot6CkQSZkpECBsJGlpgYel8k/ZUrck=;
	b=T3jKxAyXzpWK3jef4+iKZJTbGdJzywVVG9NujpFDCJ/tDlIPlMnJrD7i+6JX6T+4WkUf
	 PgxBA+vjx5PwNVDRu0AeZRJtV1XrprODL3MjV/0yhTwf2NOlHxjZ1yeU04lhH6WUlp2ps
	 P+8LAR04Dp2N7K2Wd42p9uH7kTph0F1v8apAeVulN0eyRKhNuZqDM2O1Ior41G59Empto
	 RDx4Hx971xxHPD1iPVmxMn+oOGqDbJ/usGpOYbb1x5pUEs4ST9Qm7sampXha9O9Jz0K1P
	 HSzYfc+AcG8aH6RYSt3bK75EX9na0dFvxLg+epMSteE8yypvQl6zleLcR6Q9sQ1hAKQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=asmblr.net;
	spf=pass smtp.mailfrom=asmblr.net;
	dkim=pass header.d=asmblr.net header.i=@asmblr.net header.a=rsa-sha256 header.s=1706450368.internal header.b=Jb6V3OxN;
	arc=none smtp.remote-ip=85.128.243.59
Received: from shared-aoh59.rev.nazwa.pl (shared-aoh59.rev.nazwa.pl [85.128.243.59])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2985606A31C
	for <linux-sound@vger.kernel.org>; Wed, 18 Nov 2026 19:03:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A2985606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=asmblr.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=asmblr.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=asmblr.net header.i=@asmblr.net header.a=rsa-sha256 header.s=1706450368.internal header.b=Jb6V3OxN
X-Virus-Scanned: by amavisd-new using ClamAV (2)
X-Spam-Flag: NO
X-Spam-Score: -0.625
X-Spam-Level: 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=asmblr.net;
	s=1706450368.internal; t=1795028630;
	bh=+5JuYV9xJVGC+ot6CkQSZkpECBsJGlpgYel8k/ZUrck=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=Jb6V3OxNXA8GWEuirwqelOC4QNbPScqxIaoUBXPhfFuhmV0Lc6jWNQQIISMoz/pcI
	 FCSdaHgs4mcpxPitq8Km+HcI61d+beaoImbWkjpQu0EKd5mPvUrllEfq1h6FbnzPgH
	 YFOKyPKkmXPCjfF7blUw7fBi7HYsIgymqll/2R+H1v5rFTyyqpQx5cKY0O2EVgWHw2
	 VZHRmTQ+zNcMX465TvKGZhmPfDgNd74+zbQOz8sZt9+oMJKzwSUaeY3a5/+aOq/CE3
	 lf3woL03OG5Dd0BLio2hChnSTw57gJ5odsusDrKDj1hZFjs2RCHatCtisklLUCiC18
	 u/qTf60hITriQ==
Received: from milkyway (91-150-220-230.dynamic.play.pl [91.150.220.230])
	by server753313.nazwa.pl (Postfix) with ESMTP id EAB451BBF29;
	Wed, 18 Nov 2026 20:03:49 +0100 (CET)
From: =?UTF-8?q?Amadeusz=20S=C5=82awi=C5=84ski?= <amade@asmblr.net>
To: linux-sound@vger.kernel.org
Cc: Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	=?UTF-8?q?Amadeusz=20S=C5=82awi=C5=84ski?= <amade@asmblr.net>
Subject: [PATCH 14/22] ASoC: SOF: Intel: hda: Remove orphaned hda_dsp_ipc_cmd_done() prototype
Date: Wed, 18 Nov 2026 20:02:11 +0100
Message-ID: <20261118190219.316811-15-amade@asmblr.net>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261118190219.316811-1-amade@asmblr.net>
References: <20261118190219.316811-1-amade@asmblr.net>
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Post: <mailto:linux-sound@vger.kernel.org>
List-Help: <mailto:linux-sound+help@vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-sound+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

hda_dsp_ipc_cmd_done() is not defined anywhere in the tree. Remove its
orphaned function prototype from sound/soc/sof/intel/hda.h.

Signed-off-by: Amadeusz Sławiński <amade@asmblr.net>
---
 sound/soc/sof/intel/hda.h | 1 -
 1 file changed, 1 deletion(-)

diff --git a/sound/soc/sof/intel/hda.h b/sound/soc/sof/intel/hda.h
index 701578ec35cf..43fb11b24774 100644
--- a/sound/soc/sof/intel/hda.h
+++ b/sound/soc/sof/intel/hda.h
@@ -757,7 +757,6 @@ int hda_dsp_ipc_get_mailbox_offset(struct snd_sof_dev *sdev);
 int hda_dsp_ipc_get_window_offset(struct snd_sof_dev *sdev, u32 id);
 
 irqreturn_t hda_dsp_ipc_irq_thread(int irq, void *context);
-int hda_dsp_ipc_cmd_done(struct snd_sof_dev *sdev, int dir);
 
 void hda_dsp_get_state(struct snd_sof_dev *sdev, const char *level);
 void hda_dsp_dump_ext_rom_status(struct snd_sof_dev *sdev, const char *level,
-- 
2.56.1

