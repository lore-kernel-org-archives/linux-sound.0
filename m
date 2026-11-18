Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=85.128.243.59
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795028626;
	b=iGJMI8aAK7hgXeu4fjtSwI1eQyrSGobRCHqx1PUXwlMn9u1Mo4jPm/em9QRP8u7dVWk4
	 vVipkdmRmUiVL3jbHoH7WWE5G4fZQU5EOj0Q0SigLg2Ad6UcbfrKstxXnMNE+xCF//ctg
	 2+GobiZtcLdrasldprHptX5/8NXqdZAF218G6P2sXs8eWWiagTcDK9r2q2J2O4eY7wssh
	 vaE0ERmdu7nOm8ySwfVkbDtK7yaT+TnD5Dx/x0+NktB0Sz8XFk46zjbVOtsi0aCY1bBQo
	 HuXNhkTzV/NwAbrnJC/j5rAsjY5SFoRSbeBx+JIZ4eSPJB2vRjPrC8kIItHsKMK0zhQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795028626;
	h=DMARC-Filter:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:DKIM-Signature:Received:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=szreWOQosWXeeWd9Ov/lmJAJFLJWcJzalnMxaiC8sJw=;
	b=nuKSXdPl8oF68Owc8eKeeTWAs4A9ViT5wS068j5aFzuws5NJOKjCANOuC+tEbVv3MXG8
	 plZbXqS6VHY65oAEFF9UJveiwLod4aN0Wz+QqcLk75utNMt3lNhF6PCWYJTQba0L6kJtN
	 6nLmZFj6ep8seSG5Lq6EOXOgr0FGI/cbapUg4DNYzEcG0TaPKcaiW9FlfATh5EjPfhmgW
	 BhziWtuIjqogRTsRWytjb6EPO/HP2ZNf0EDhwMM1GHAq7IbDwGaP23F6nqklJJvYNsPmH
	 EryaoiaCaW8XZaMNYMeEAM8RU0jJAsqDECvT5Dv8ulfxwWnykWoxk5ii3CfgP6wimBQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=asmblr.net;
	spf=pass smtp.mailfrom=asmblr.net;
	dkim=pass header.d=asmblr.net header.i=@asmblr.net header.a=rsa-sha256 header.s=1706450368.internal header.b=iW4auioZ;
	arc=none smtp.remote-ip=85.128.243.59
Received: from shared-aoh59.rev.nazwa.pl (shared-aoh59.rev.nazwa.pl [85.128.243.59])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 353EB606A32A
	for <linux-sound@vger.kernel.org>; Wed, 18 Nov 2026 19:03:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 353EB606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=asmblr.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=asmblr.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=asmblr.net header.i=@asmblr.net header.a=rsa-sha256 header.s=1706450368.internal header.b=iW4auioZ
X-Virus-Scanned: by amavisd-new using ClamAV (12)
X-Spam-Flag: NO
X-Spam-Score: -0.625
X-Spam-Level: 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=asmblr.net;
	s=1706450368.internal; t=1795028624;
	bh=szreWOQosWXeeWd9Ov/lmJAJFLJWcJzalnMxaiC8sJw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=iW4auioZI+UkAQmiooODo0vFjQUfYvhFwLRqhkMxvAL3DrXhQf8RMhRAh6OYUjP7J
	 IwZn1+nywID7QUUFY2ugSOmWyBSbkH+pQFg1ZTNPS8YwNnYfUCU1xkaL/JcfF5L7OM
	 B/c1k1MK76rCrbczBMIP6p/0kv6awYy8/w3znNbgnGxdJvAS8vt+S0VRlLLWvzT9ZX
	 iH9xWBfuieuVc3ZdyIqgdzAPGi0AL6GUdcrLqV0lvX/yX8Xil7RmZI1vdFZsd1HRcb
	 hKmtBowFY1w0Q2/h4VF4ehnCmxT3TPDIo6IqNNkSyZVnjMLVQ8FxUksZ0GrUMm88Ib
	 H0vQ8pF7sT8GQ==
Received: from milkyway (91-150-220-230.dynamic.play.pl [91.150.220.230])
	by server753313.nazwa.pl (Postfix) with ESMTP id 5705B1BE6BA;
	Wed, 18 Nov 2026 20:03:44 +0100 (CET)
From: =?UTF-8?q?Amadeusz=20S=C5=82awi=C5=84ski?= <amade@asmblr.net>
To: linux-sound@vger.kernel.org
Cc: Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	=?UTF-8?q?Amadeusz=20S=C5=82awi=C5=84ski?= <amade@asmblr.net>
Subject: [PATCH 13/22] ASoC: SOF: Remove orphaned function prototypes from sof-audio.h
Date: Wed, 18 Nov 2026 20:02:10 +0100
Message-ID: <20261118190219.316811-14-amade@asmblr.net>
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

snd_sof_control_notify(), snd_sof_ipc_stream_posn() and
sof_pcm_dsp_pcm_free() were removed during IPC3 refactoring in commit
10f461d79c2d ("ASoC: SOF: Add IPC3 topology control ops"), commit
2f1f5a438899 ("ASoC: SOF: ipc: Switch over to use the rx_msg ops") and
commit 4123c24bd13c ("ASoC: SOF: Introduce IPC3 PCM hw_free op"),
leaving their prototypes behind in sof-audio.h. Remove them.

Signed-off-by: Amadeusz Sławiński <amade@asmblr.net>
---
 sound/soc/sof/sof-audio.h | 11 -----------
 1 file changed, 11 deletions(-)

diff --git a/sound/soc/sof/sof-audio.h b/sound/soc/sof/sof-audio.h
index 672879371d14..ba0a17f14012 100644
--- a/sound/soc/sof/sof-audio.h
+++ b/sound/soc/sof/sof-audio.h
@@ -595,8 +595,6 @@ int snd_sof_bytes_ext_get(struct snd_kcontrol *kcontrol,
 			  unsigned int size);
 int snd_sof_bytes_ext_volatile_get(struct snd_kcontrol *kcontrol, unsigned int __user *binary_data,
 				   unsigned int size);
-void snd_sof_control_notify(struct snd_sof_dev *sdev,
-			    struct sof_ipc_ctrl_data *cdata);
 
 /*
  * Topology.
@@ -605,13 +603,6 @@ void snd_sof_control_notify(struct snd_sof_dev *sdev,
  */
 int snd_sof_load_topology(struct snd_soc_component *scomp, const char *file);
 
-/*
- * Stream IPC
- */
-int snd_sof_ipc_stream_posn(struct snd_soc_component *scomp,
-			    struct snd_sof_pcm *spcm, int direction,
-			    struct sof_ipc_stream_posn *posn);
-
 struct snd_sof_widget *snd_sof_find_swidget(struct snd_soc_component *scomp,
 					    const char *name);
 struct snd_sof_widget *
@@ -708,8 +699,6 @@ int sof_widget_list_prepare(struct snd_sof_dev *sdev, struct snd_sof_pcm *spcm,
 			    int dir);
 void sof_widget_list_unprepare(struct snd_sof_dev *sdev, struct snd_sof_pcm *spcm, int dir);
 int sof_widget_list_free(struct snd_sof_dev *sdev, struct snd_sof_pcm *spcm, int dir);
-int sof_pcm_dsp_pcm_free(struct snd_pcm_substream *substream, struct snd_sof_dev *sdev,
-			 struct snd_sof_pcm *spcm);
 int sof_pcm_free_all_streams(struct snd_sof_dev *sdev);
 int get_token_u32(void *elem, void *object, u32 offset);
 int get_token_u16(void *elem, void *object, u32 offset);
-- 
2.56.1

