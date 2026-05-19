Received: from mail-qk1-f175.google.com (mail-qk1-f175.google.com [209.85.222.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03CEF3AC00
	for <linux-sound@vger.kernel.org>; Tue, 19 May 2026 00:48:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779151691; cv=none; b=adPwwqgDUT3QeeW/bii/M0ngwZxXCYgwog6e3oHL8MqK4WmggXDwhVSugPu+2Jd8pdZPN5JJE91MtMCrXH6ia7C1GSEKLLaRU35NlzWOx1+ElywAg3pcvxcn7Jg9ZtplVS1EuZ8upMEfi+pQUR2QLlgc9w4uTKAWZoeWr3mrsTg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779151691; c=relaxed/simple;
	bh=4e3Ezfdf+RD04rbftjwBhZVIO+1SQ/EGEAk62cAphhU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=J71Tmx8FZN0ju/LYqoqUULiUNNtjGOu5PzrEgUnG+y3KIeT12I1sHuwaieBB7PNVMCi/EqOktqjb7ZU6DvoEbSJhBqJrPAkVtp8hEoaTsWPhgPobPUBroi+Gp0/P4xQVwHt2zRbY5GSmYo6dMtv/NTkl5V/SMHcJJCPMXZCrZwM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=M8GD3Vfu; arc=none smtp.client-ip=209.85.222.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="M8GD3Vfu"
Received: by mail-qk1-f175.google.com with SMTP id af79cd13be357-910f734b477so351398285a.0
        for <linux-sound@vger.kernel.org>; Mon, 18 May 2026 17:48:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779151688; x=1779756488; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=8AmlmXFn8Usyb6ez/6xBhDBphIjUsjGq7jgSWzfB3dQ=;
        b=M8GD3VfuQwbkOHs2Ou/DUlN3w7a5PYFJe7519t98mLLrRlm1erjn0ujk4VcCRIy3Iv
         jvqhrCtTgXGROARROuvcScWdTkIqEek6Pder0Ktguct5rfm/DKQh0csjSuy+uqHppiAe
         6HFMHzH8A/9Mul5s+YW6U1sGU9+kTdN94dn26yNnFM/sqJ4JswTfaovM8LyKUmmOoHsW
         Z2evTb6rX+jZ9kVkU03Vi398wubAT2dzFg/aKeAYBFG55X5l5H+u7fapss35C2gLYJz8
         ARjXSKwv6y66W+5twp05GbWh5lCg7pBzARDRjNM9zGw1BRDW4JOVBXimLb9saV5g9qTW
         RtPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779151688; x=1779756488;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8AmlmXFn8Usyb6ez/6xBhDBphIjUsjGq7jgSWzfB3dQ=;
        b=KKUgobFOAE8s3Es6X9UKFBJg2DDGCsUWvZW0J/PSMSEFDJkKJx3aEeCWEOyfKrl6Vm
         c62So5YyLrhnCRGUCVHT2R2U/CS+9PhOFGGImDAW0uWdiZIcym5LkEw4iuoyBKeZ7cdh
         eSBMdBwGOw2VVx+7w0UbiYEV89MoCwQnbnUeq8TMEP6uP8XxcKeAyorUcVPg1hZTg+v2
         d+CxY7e+mKhumdv6JQjnMeFXa4EaFGDwlS4u4zNJvNFmQeCOHVd/3T+RuALvO0GrAv2D
         QY18A/lNc44hQkyAZi08Dx0mOpTAVNM/LIWnA00tdMOHg48hEr818VBOln5QcvfC6AbD
         h2tA==
X-Gm-Message-State: AOJu0YyUjlRMzwc0Qyq56VaFUw+Fuo7zc3IMsv8cu++ryyr9Y68Vz6EC
	hOLk2ZAUxMvdkDz1mX336ftM9m5TcWj2tBr3iY2km2qPaUg2o2lGmBu0ErMAEiGk
X-Gm-Gg: Acq92OFlSaiTDSczSQxONXTr65ZhQkcZYaqO2RKQgRUqdM/Xbs5UJbIfUnL6K/6iqDp
	BJTrQmrREGX3rLDbhMVcCGq8HrBG+iert9/aUlyft7rb9LL4G5xg29wAHYqmi+Ap+mLQ9JnuVod
	solz5eJXDFtBqVG3yOZp3mE+5zQhHo+xt2tVSpIYW90ImbPErryzSEqxzXbciqQwUXtC2OYIkj9
	glXGtj3fRy9LgEhALpTzUpFCTWmXTUVEZANBWM3btzUx3NqxzErIxdMsz6r3UAiS7NUHYZB7kR+
	PU+C5ZWppNGz7Zf8mLKQsmKwmbnJpSfeipaarhUeobKkAd+E2XmY7aFAUWoU6BCDhRMQkR9pWrv
	qD2I+xvc0RT/ynguObTJzwIMAmkami2L5UNvH4JU3igJZG6ezl5KqWXhij6fCZqjXZ4wxj4utCB
	FeDQw2jMlmyiOku9qIKzPw5SPlUFZfLDQXddPp79KSQixOEOUcEwLyXPuOVAzDPesEVLnf3jHBu
	lw3Rs9S9gOXfY7b0Dp2fNvyWjdKWaT+qJWmFzMTpeEfFg==
X-Received: by 2002:a05:620a:3705:b0:90d:3af3:2a61 with SMTP id af79cd13be357-911d05941e7mr2741939585a.47.1779151688279;
        Mon, 18 May 2026 17:48:08 -0700 (PDT)
Received: from ryzen ([2601:644:8000:5b5d:7285:c2ff:fe45:8a32])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-910bcf3584esm1640093085a.34.2026.05.18.17.48.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 May 2026 17:48:07 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: linux-sound@vger.kernel.org
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
	Daniel Baluta <daniel.baluta@nxp.com>,
	Kai Vehmanen <kai.vehmanen@linux.intel.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	sound-open-firmware@alsa-project.org (moderated list:SOUND - SOUND OPEN FIRMWARE (SOF) DRIVERS),
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH] ASoC: SOF: Use flexible allocation for control data
Date: Mon, 18 May 2026 17:47:49 -0700
Message-ID: <20260519004749.627581-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Allocate IPC3 and IPC4 channel control data with kzalloc_flex()
for the trailing channel-value arrays instead of open-coding the
struct_size() allocation.

The existing scontrol size field continues to record the payload size
used by the control paths.

Assisted-by: Codex:GPT-5.5
Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 sound/soc/sof/ipc3-topology.c | 6 ++++--
 sound/soc/sof/ipc4-topology.c | 6 ++++--
 2 files changed, 8 insertions(+), 4 deletions(-)

diff --git a/sound/soc/sof/ipc3-topology.c b/sound/soc/sof/ipc3-topology.c
index 8c37c0657315..9597f619fbe4 100644
--- a/sound/soc/sof/ipc3-topology.c
+++ b/sound/soc/sof/ipc3-topology.c
@@ -1826,7 +1826,8 @@ static int sof_ipc3_control_load_volume(struct snd_sof_dev *sdev, struct snd_sof
 	/* init the volume get/put data */
 	scontrol->size = struct_size(cdata, chanv, scontrol->num_channels);
 
-	scontrol->ipc_control_data = kzalloc(scontrol->size, GFP_KERNEL);
+	scontrol->ipc_control_data = kzalloc_flex(*cdata, chanv,
+						  scontrol->num_channels);
 	if (!scontrol->ipc_control_data)
 		return -ENOMEM;
 
@@ -1857,7 +1858,8 @@ static int sof_ipc3_control_load_enum(struct snd_sof_dev *sdev, struct snd_sof_c
 	/* init the enum get/put data */
 	scontrol->size = struct_size(cdata, chanv, scontrol->num_channels);
 
-	scontrol->ipc_control_data = kzalloc(scontrol->size, GFP_KERNEL);
+	scontrol->ipc_control_data = kzalloc_flex(*cdata, chanv,
+						  scontrol->num_channels);
 	if (!scontrol->ipc_control_data)
 		return -ENOMEM;
 
diff --git a/sound/soc/sof/ipc4-topology.c b/sound/soc/sof/ipc4-topology.c
index 76812d8fb567..9fd04a7857f6 100644
--- a/sound/soc/sof/ipc4-topology.c
+++ b/sound/soc/sof/ipc4-topology.c
@@ -2863,7 +2863,8 @@ static int sof_ipc4_control_load_volume(struct snd_sof_dev *sdev, struct snd_sof
 	scontrol->size = struct_size(control_data, chanv, scontrol->num_channels);
 
 	/* scontrol->ipc_control_data will be freed in sof_control_unload */
-	scontrol->ipc_control_data = kzalloc(scontrol->size, GFP_KERNEL);
+	scontrol->ipc_control_data = kzalloc_flex(*control_data, chanv,
+						  scontrol->num_channels);
 	if (!scontrol->ipc_control_data)
 		return -ENOMEM;
 
@@ -2905,7 +2906,8 @@ static int sof_ipc4_control_load_enum(struct snd_sof_dev *sdev, struct snd_sof_c
 	scontrol->size = struct_size(control_data, chanv, scontrol->num_channels);
 
 	/* scontrol->ipc_control_data will be freed in sof_control_unload */
-	scontrol->ipc_control_data = kzalloc(scontrol->size, GFP_KERNEL);
+	scontrol->ipc_control_data = kzalloc_flex(*control_data, chanv,
+						  scontrol->num_channels);
 	if (!scontrol->ipc_control_data)
 		return -ENOMEM;
 
-- 
2.54.0

