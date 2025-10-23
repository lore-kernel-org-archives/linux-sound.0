Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93A61279784
	for <linux-sound@vger.kernel.org>; Thu, 23 Oct 2025 06:13:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761199985; cv=none; b=LSGajNYjm9N/2iI/qrZglEqXGu6SsY2Y+xljXHT+5zdZlvaRnOUJb2LDfQ/QrfB0qpuBa77jEGhmvlpGCKAn1vM1gSBEFCxNpHkrboN+ngreNy3gDS1ISd+spkgr3bNdaTS/9p+IslrVmuXz4SVQCt60rJx5/GZ1VSNfuKSrHJc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761199985; c=relaxed/simple;
	bh=yK/y50RG0cqg3DIEhXB2FdIgP0CqmybxyY6OaVPU4P8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=lSoQ+vGkfgT2ugkfVHShw8oX46ZEXnM0MrzORtZP1PrggiKdkBp1D6as2KqtUmdCqUzXeu5TAtyn7n/0S+gjjPCXvjwbgIX5rsfSA0dgOGwvLlCOioy9JVCZiIMXYzzbUQmWcXfhtW1VRMo4/5b4zxMIr3fw332xW5B+iBB8w/U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=iVOn6FW1; arc=none smtp.client-ip=209.85.210.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="iVOn6FW1"
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-76e2ea933b7so431622b3a.1
        for <linux-sound@vger.kernel.org>; Wed, 22 Oct 2025 23:13:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1761199983; x=1761804783; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=cfYLHJECru5yKWiwVRB/EPZo/QvW+dt1xe/Pn9UG9Mc=;
        b=iVOn6FW1U8M61EZb539NNGCtcyRKL4cWDAqm8zznqtxUICgsDgD07RseXabR2Ndweu
         pq+lmuuzN4VEiu3srN7vCBoNC9JgYk9F3MGljLflrWQOB2kNrO62IChesJJMzKd+wrUB
         Nf8z7jGSdBBOuNe7oUj1Ovm19uKfC0BJ0M6Xo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761199983; x=1761804783;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cfYLHJECru5yKWiwVRB/EPZo/QvW+dt1xe/Pn9UG9Mc=;
        b=nIxPjmHd3et5MwHtJjD4hB+SOFeZc6TeJFEloO5mrEwgLKSpQAOSUyMNY850t2Bim+
         4satZIt9taV6//X1E5bkbEjL6zMn+mkeEQZmeJQnZbJWhT7IjhVIvBzG1WdSEze7Etqr
         b7u03HBaLJ6O127BfMNtWCK7O47+bLDZvC4V4qnLfCU9CbZihY59tuxkb5qz2GGYTmz1
         onn9VqtY2uVjBKIqL4TgbyKhF8Tme8OD+cHM63WPDtDriJSE+I+2307ZE+ZxVYqRE/iG
         E4aJCRKirV5PNCszWEIvfqGUjo+H/No907W9pLgsrsc2oVIbcD2lG/k3XDl0WAO/4bS3
         ZqDA==
X-Forwarded-Encrypted: i=1; AJvYcCW4HwjKCpnS8RHF2ndyry5n4l1/Q7jyoDXHxvoxyi/X38pQn2WsArFJthsFHfiZXBO2OFylalqDZpk48A==@vger.kernel.org
X-Gm-Message-State: AOJu0Ywq9WE7L1h9iFgFLjbGjsy3lIRloo8iwTZJymEuwRhvk8dnl5ig
	uJlnmv2ZllKRsGit5QjbYRigZ3uCewf/YC1odmNPE47SGQ0qzzSUStRjquPLxd5z1w==
X-Gm-Gg: ASbGnctBBr6m3hfkhGAcoRlVhwNPxuQ7Rhptkry1esdWiTm+CKnijwhX+sYXo0IyAVn
	USSY+D/SCw9yhJFuYJoLaslhKzpOSNQEBacXAoVfelYay809OAt0aFHNBSbPAs/buVSkQCTmfwY
	zT3I++ntZW3KP1xx5KP0n1DBqxT1wnjWV16dhlejjcA+6Kud6Xlmzj3Ravs8v1wa/ZQW+FD8Y7k
	ApkBu0PfwkMgiVFFsmKxs2V79YrStQ3rcDngLX+GRLzLwzf2elqXbY7i6k8bE0xJQ+qCUUz8IXt
	q86xhyIZSuP5M131M1hNWu21/9XuIyjPv4TnzWDTBbmmAV79X2oYX1yC+Ys3LoPi4WUJS5jJrRF
	Q4DQrtFfRLXIdvxzIj4+PumVsjBLPoXFd86n6K+JNVGU7xlq8mAau/hkVCVQqrL/Z+EtFYVlXUL
	pYKUthMjgmKUC/gKcCT0V5SPgy3P723neGS8ofLjEBfP/ROW28Kd1nbO0=
X-Google-Smtp-Source: AGHT+IFzzK4Jax0Ss6/pV/yJrywiuEK8413jdinEbd3nP6IJYuh1YVPYCUBIwSddX/cP8cDYcweEog==
X-Received: by 2002:a05:6a20:e713:b0:33b:5563:d6e with SMTP id adf61e73a8af0-33b684d0c51mr5253718637.5.1761199982790;
        Wed, 22 Oct 2025 23:13:02 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2a00:79e0:201d:8:adb:6017:6b6b:ea1a])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b6cf4e2d81dsm1021648a12.30.2025.10.22.23.12.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Oct 2025 23:13:02 -0700 (PDT)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Liam Girdwood <lgirdwood@gmail.com>,
	Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
	Daniel Baluta <daniel.baluta@nxp.com>,
	Kai Vehmanen <kai.vehmanen@linux.intel.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
	sound-open-firmware@alsa-project.org,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-mediatek@lists.infradead.org
Subject: [PATCH] ASoC: SOF: Fix function topology name check in profile info output
Date: Thu, 23 Oct 2025 14:12:24 +0800
Message-ID: <20251023061226.1127345-1-wenst@chromium.org>
X-Mailer: git-send-email 2.51.1.814.gb8fa24458f-goog
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The function topology feature, and the plat_data->machine field that
specifies this feature, is ACPI specific. The check didn't take this
into consideration, which causes a NULL pointer dereference splat on
OF platforms:

    BUG: KASAN: null-ptr-deref in sof_create_ipc_file_profile (sound/soc/sof/fw-file-profile.c:291 sound/soc/sof/fw-file-profile.c:340) snd_sof
    Read of size 8 at addr 00000000000000c8 by task (udev-worker)/247

    CPU: 7 UID: 0 PID: 247 Comm: (udev-worker) Not tainted 6.18.0-rc2-next-20251023-03804-g93b191bc0c26-dirty #747 PREEMPT  ba3c303a11d89508de4087cb5b4f8985b6d87b6f
    Hardware name: Google Ciri sku2 board (DT)
    Call trace:
    [KASAN stuff]
    sof_create_ipc_file_profile (sound/soc/sof/fw-file-profile.c:291 sound/soc/sof/fw-file-profile.c:340) snd_sof
    snd_sof_device_probe (sound/soc/sof/core.c:304 sound/soc/sof/core.c:388 sound/soc/sof/core.c:460 sound/soc/sof/core.c:719) snd_sof
    sof_of_probe (sound/soc/sof/sof-of-dev.c:84) snd_sof_of
     platform_probe (drivers/base/platform.c:1405)
    [...]

Check that the ACPI specific field is actually valid before accessing
it.

This was seen on a MediaTek based Chromebook.

Fixes: 2b92b98cc476 ("ASoC: SOF: Don't print the monolithic topology name if function topology may be used")
Cc: Bard Liao <yung-chuan.liao@linux.intel.com>
Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
 sound/soc/sof/fw-file-profile.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/sound/soc/sof/fw-file-profile.c b/sound/soc/sof/fw-file-profile.c
index 4a2afc04f338..76bde2e0be1d 100644
--- a/sound/soc/sof/fw-file-profile.c
+++ b/sound/soc/sof/fw-file-profile.c
@@ -288,7 +288,8 @@ static void sof_print_profile_info(struct snd_sof_dev *sdev,
 	if (profile->fw_lib_path)
 		dev_info(dev, " Firmware lib path: %s\n", profile->fw_lib_path);
 
-	if (plat_data->machine->get_function_tplg_files && !plat_data->disable_function_topology)
+	if (plat_data->machine && plat_data->machine->get_function_tplg_files &&
+	    !plat_data->disable_function_topology)
 		dev_info(dev, " Topology file:     function topologies\n");
 	else
 		dev_info(dev, " Topology file:     %s/%s\n",
-- 
2.51.1.814.gb8fa24458f-goog

