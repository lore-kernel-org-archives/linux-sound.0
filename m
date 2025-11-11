Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7328C2765D3
	for <linux-sound@vger.kernel.org>; Tue, 11 Nov 2025 05:38:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762839514; cv=none; b=kHjhEihnFGhzOWRzLa3iK2Qr3UmTKPS8L4FBgii+0pqQVYsmzIutTlNOSAUdDZbtSGLA18z1U+LypNIcYb85XehWFVFukA1ijM/zW6bLUIZ8guLnZ/rEtFU2PTkkK7QmPfEkWtDHx+M36OZQN2MuATHbE+ljRb8BUv30a3xciw4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762839514; c=relaxed/simple;
	bh=bl8ormw/0G47BcA133p1sT+0poex0ZwxwrNZQ1PZfYs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=M60PyqJaLl6fuvk/B8yllB2yWYA7fh9ej1km44aQA9La08LxKokpMKI1ERoF7MU7uCC6eSI1HTct7LRUwmjFmGdiuLLvTwgeXjC+WUEekHv/spPznu1z/a11HH1ZRFo+9alG/RXmM/dR7Oj6viYsI+k70/DFmkANd2WjIgNPexw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ui9fB2gX; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ui9fB2gX"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4775638d819so21360895e9.1
        for <linux-sound@vger.kernel.org>; Mon, 10 Nov 2025 21:38:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762839511; x=1763444311; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Yb+qXNML2Zug0mRs+ShkI2kLcvT3TeWhztfdHoVJFl4=;
        b=Ui9fB2gXZH+wqM8H2Xp9y3xbAo4OCtWNMETe353PNsf57twuu/HOFFSBF2ugabV3k6
         z911M/C3wCCUAdthH998yGDdEI/yHpfKMG+2RcE/7nbURZ6Kjojpl8VIhiNertLObn4m
         7H6x3D/1JpQCF11GtvXIYeoCFboCLUudRVGFLf9ikTnjUH+nybEwIHCyTkgMGbEIIuIM
         +NKUcJqLdXx2ZBHEXwTAGUqhbA5Zps21MQOJVX2NpdJYXWX6I9sdM4MqlYWIpcgb/kU3
         3D95dkrq1Te6+M6qAm1tFrQmZaBAYGgRm9WU6O8fA/nQBZJlPof4AYmIp0Rjlb+TRpTo
         CHGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762839511; x=1763444311;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Yb+qXNML2Zug0mRs+ShkI2kLcvT3TeWhztfdHoVJFl4=;
        b=NfLM1j7pQ9oDdwXByg9z/7MJEAZS15ZZ/BWc1AHmxFYahyGrdWaNUKauXyfsdXi7gd
         1ag7XQCzwAa1GqEbrNlnk7bfLL/rk+O4J18ONdIMZbtPfsb0mCHTQtp+M409rVnqL8Ra
         cOlN1D/NKanOjyooz4SlQZd13leAVvsDDqsc6lqCdLed4gH6R237W4unTSJWhOCaoqhM
         QL0eWReMxx96wWTXTLsKdJOyquyIGO/Xx2jgHbtBC44S8m3C56FcpXy/cl3U9QMB28qP
         nNhudcVoRkR4L4A+GETE+1uDYl4ida0ad8VWsODRl0ewtX24ALn7sX4wOKDkjyw4eSPo
         NKHQ==
X-Forwarded-Encrypted: i=1; AJvYcCVyC7SPPkRHrO0uT3bXiSDf2+AgKbxskJXzoRWGag1SzijuBnMlHvuMFMqckED4aM0OpRW5SFY03W0dNw==@vger.kernel.org
X-Gm-Message-State: AOJu0YyZhfABmNFoWqplrYN1TzYQ9NwWqtISDCjAW9FZlcTCBPbQQ8gX
	sSwgfQ2ZRFZSW29ymG/seCVsNhyPBV235wh0cWyTB/aiyMYuGfy93X2D
X-Gm-Gg: ASbGncvi2zwRPq02aaLWC6oYvFFEmpuVT9qLBvEjPcnKN00/kKVx+JAyl7JCoH3CyNR
	HLcHSmHR9LdqTeQubZfT+PYRH8Mwq14MNOfzKTEoM/u8QQNrAlioUcgozDmkSmUdgj6h/SUA/W8
	XU0LsH+PIAZKoETFROYSMguIPIhTGqesAIG+uEIJ6wTRrQF2QgT8f+aQCH+rR4h39JXn+fyZ4uo
	qKlei9xyv+4qt6zvd3kRpTVPPNKPW/gLUjKgGBYCBlB8yfvnFeRJ8ZkV5VfCke56jGgNxnpBmJ1
	NutfsjIV5EV2HhQ5ELtLiDRfzNdxE9y3ywNkQGSuw7mwXZF6gRPFL1wuhqeYnDb7VuV23Spxw5i
	/QsnOPtv4JlaShkMyVgcBlH9WRXgnGh7qA9RjcB82rczoLueR+Rvh2A8Z62ys5lrwNuT8NDN6np
	knd1s=
X-Google-Smtp-Source: AGHT+IEv5JnCqFKP1Mph4p8AIKA/3nXc5QfvNqGpBizR/xRbU8dBBYCYd3u61pCiDSVO4Cy/pD0Gaw==
X-Received: by 2002:a05:600c:41d4:b0:477:7479:f081 with SMTP id 5b1f17b1804b1-4777479f19fmr59167825e9.12.1762839510290;
        Mon, 10 Nov 2025 21:38:30 -0800 (PST)
Received: from gmail.com ([136.226.168.208])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4777a96e7f8sm109459225e9.13.2025.11.10.21.38.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Nov 2025 21:38:29 -0800 (PST)
From: hariconscious@gmail.com
To: lgirdwood@gmail.com,
	peter.ujfalusi@linux.intel.com,
	yung-chuan.liao@linux.intel.com,
	ranjani.sridharan@linux.intel.com,
	daniel.baluta@nxp.com,
	kai.vehmanen@linux.intel.com,
	pierre-louis.bossart@linux.dev,
	broonie@kernel.org
Cc: perex@perex.cz,
	tiwai@suse.com,
	khalid@kernel.org,
	shuah@kernel.org,
	david.hunter.linux@gmail.com,
	sound-open-firmware@alsa-project.org,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	HariKrishna Sagala <hariconscious@gmail.com>
Subject: [PATCH] ASoC: SOF: sof-client-probes: Replace snprintf() with scnprintf()
Date: Tue, 11 Nov 2025 10:59:21 +0530
Message-ID: <20251111052920.56459-2-hariconscious@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: HariKrishna Sagala <hariconscious@gmail.com>

As per the C99 standard snprintf() returns the length of the data
that *would have been* written if there were enough space for it.
It's generally considered safer to use the scnprintf() variant.

Link: https://github.com/KSPP/linux/issues/105
Signed-off-by: HariKrishna Sagala <hariconscious@gmail.com>
---
This patch replaces snprintf() varaint with scnprintf() in
scenario to know the actual length of the data rather than *would
have been* written data of snprintf().
No functional changes intended.
Reference Links:
https://lwn.net/Articles/69419/
https://www.kernel.org/doc/html/latest/core-api/kernel-api.html#c.snprintf

Note:
*Compile & boot* tested.(CONFIG_SND_SOC_SOF_IPC4=y)

Thank you.

 sound/soc/sof/sof-client-probes-ipc4.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/sof/sof-client-probes-ipc4.c b/sound/soc/sof/sof-client-probes-ipc4.c
index 758a56d271d7..d3fa37106b64 100644
--- a/sound/soc/sof/sof-client-probes-ipc4.c
+++ b/sound/soc/sof/sof-client-probes-ipc4.c
@@ -289,7 +289,7 @@ static int ipc4_probes_point_print(struct sof_client_dev *cdev, char *buf, size_
 			__func__, SOF_IPC4_MOD_ID_GET(desc->buffer_id),
 			SOF_IPC4_MOD_INSTANCE_GET(desc->buffer_id));
 
-	ret = snprintf(buf, size, "%#x,%#x,%#x\t%s %s buf idx %lu %s\n",
+	ret = scnprintf(buf, size, "%#x,%#x,%#x\t%s %s buf idx %lu %s\n",
 		       desc->buffer_id, desc->purpose, desc->stream_tag,
 		       swidget ? swidget->widget->name : "<unknown>",
 		       sof_probe_ipc4_type_string(SOF_IPC4_PROBE_TYPE_GET(desc->buffer_id)),

base-commit: 4427259cc7f7571a157fbc9b5011e1ef6fe0a4a8
-- 
2.43.0

