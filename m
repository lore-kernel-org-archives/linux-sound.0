Received: from mail-dl1-f48.google.com (mail-dl1-f48.google.com [74.125.82.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EAF933033C6
	for <linux-sound@vger.kernel.org>; Wed, 20 May 2026 14:51:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779288665; cv=none; b=mLL+NVnky3yOydCUFTqU5vJ4VXQFzPpa13OEDqyLI3dcj1al/c3qONYhVROfcTc4ApsjQ0C9fJJ3t/2f5418rgKfRC+eKx9QXhxjQ3i0rG6O6WAoqcKqNDT0FZG3AwG78/JCJeEKlAgtyMNt5g+FXWU/jsQH6fWfeSsGy/8g1w4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779288665; c=relaxed/simple;
	bh=qat9PkBcrbY8prcgndKgZC13dso+54mnSw5Fj27uq/I=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=fA7h7RxM2jDAY7NYn13PS8guQsqrgJtaNC0HepZsnG1cK48trVIXMJmmKXIc9O3Vh7OvWCrCY5ghRV2A97x++I206+DTzqnpCzmK3aI8qQZSxZpdQRyreyqL4dtnuFDEBADznh2qV3atIUGm2jsCFOnAuLmq6ksWFf52nXNkyoA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lZjnOEJT; arc=none smtp.client-ip=74.125.82.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lZjnOEJT"
Received: by mail-dl1-f48.google.com with SMTP id a92af1059eb24-132830d8281so2672756c88.1
        for <linux-sound@vger.kernel.org>; Wed, 20 May 2026 07:51:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779288662; x=1779893462; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=bEoCqLzqLEnuOZc7fTDf50Ur/BN8CyPw/oIx6TWyOvs=;
        b=lZjnOEJTSUzsvPkDZRX9N6dV2Kn81t2kIu2POPxpyTv8//Ncl4tFy4b59YuFSR9gQQ
         O9lvJtOaipTKmoR5jbyI5bEorYrS12cE+JdZL0cfCso879rryrjNwERI0tmGB9P/+vxR
         Q+O/IotZp3KNL6va8C+PrXHIwpsunuKVGhX9Fc5hAeZa+iWzKfmztPZdMMbkLosFmYzp
         J9eW05gKTUr19xtiJfyJ8LSwADnrMhs7E/ToKmA2CMsMKLlhjOUufF+awFPIv3bi8OsW
         FJZxNS49tlLyRWAaw+scKYJT+15kDwlyMO5Pid9+yDySnQsYqAmn5O+dBWa9hydzxHhj
         +Hmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779288662; x=1779893462;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bEoCqLzqLEnuOZc7fTDf50Ur/BN8CyPw/oIx6TWyOvs=;
        b=L4ZlIIS3qUYfp/frrWj2gkYmOZ7Wt4WC6Dr7wf8D9YghtcNqzyQvCJhOpX8sQA7tdh
         WeX4hVZoCPnoiXJgU+crOdbrMUajejzeXFj6ekG+1GZ0CFpTU3SAPX8EJdCJTvAGBjiB
         vPJdVHy7MggiYxDkUtEtFIRURXcho+WEAu9uUb/0RnOj30Amb4uJqGjiGgwUwvUthTD0
         I00cLGuYW93Ql8wtaXCZRwK2DajIXhv6o+hwUPYlPGSd/BIDyL0nf+1J8qQuRRWlSJpE
         2ANhiBPcqmYa7FbDK7SQkR+AW1Vc2ZEmj0E+Y5NpFAxiSJuJzR6v858o1tfwHVLEI9U0
         njPQ==
X-Gm-Message-State: AOJu0Yw3nhAfJLjJ/qxr48mFgdOAwGR2FrOTV6/BJGjEI2yUVP9bI/HF
	rOjZk5cS/pAWwcFGpWmfgigcuWgycPV4FFcWkt2ci46wDsMuUokNmUDf
X-Gm-Gg: Acq92OEpDC+8bK32xVc0+P952lICh+3uW+FZgVo+O3PTXUxTWnMXadMTXOooxQ5NsHV
	c2WMQq28d8Q5jCF5pb6z1AVZQYNc4JRBTm4qgo0emmVVEpdpVc3c/LJWhJlbChDVVrzFG7Swav7
	Uq08H+59Vb4LzKRC+yW+wtHfT0sUPQ005bxenegu8DAQZ3CjwZi4NIvI8s8faOcR281UzDWkuk6
	tOQTj2ka9Wlj6MJx9gV1HjY/0V8vGDF0GTG3f3GFzMgPnTBG+UfxMmL+Ltb9/R0AlQ26TTtFpAM
	LpY/T6R71Vgm+AX2G94ARXO204timJW/V4wT8uvXZG6fHPYEq0MgVjmd9Mek3RcppfIxc1Mm2yA
	WAbU0qShAwvxp2+mDXYzl/9csMUm2V9AgWhLkY/yI79fjQD2vTCmx9WzTCdlK5slSt5KlDPhfGc
	QYihw1WHXoL/b12k/Y+UMBR83iKYupDQgas69k+L56bjHuv5BS9Vv1A3p3fUA/QLxvFAfIA6ZeJ
	A==
X-Received: by 2002:a05:7023:b11:b0:12a:6ab7:3f73 with SMTP id a92af1059eb24-1350463608fmr11482634c88.0.1779288661463;
        Wed, 20 May 2026 07:51:01 -0700 (PDT)
Received: from [192.168.1.18] (177-4-162-74.user3p.v-tal.net.br. [177.4.162.74])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-134cbcb93f3sm27334864c88.3.2026.05.20.07.50.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 May 2026 07:51:01 -0700 (PDT)
From: =?utf-8?q?C=C3=A1ssio_Gabriel?= <cassiogabrielcontato@gmail.com>
Subject: [PATCH v2 0/2] ALSA: hda: cs35l56: fix system name leaks
Date: Wed, 20 May 2026 11:50:54 -0300
Message-Id: <20260520-alsa-cs35l56-system-name-leak-v2-0-60f26c159023@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/4WOyw6CMBBFf8V07Zg+KIgr/8OwKGWAagumg0RC+
 HcB3bs8yc05d2aE0SGxy2FmEUdHru9WkMcDs63pGgRXrcwklynXXIDxZMCS0l6nQBMNGKAzAcG
 jeUBWV1mWo7EqF2x1PCPW7r37b8WX6VXe0Q6bdFu0joY+TvuBUWy7X0vyP61RAIdKqFIniVQiP
 1+bYJw/2T6wYlmWD5XmXV/cAAAA
X-Change-ID: 20260501-alsa-cs35l56-system-name-leak-7fd779eac391
To: David Rhodes <david.rhodes@cirrus.com>, 
 Richard Fitzgerald <rf@opensource.cirrus.com>, 
 Takashi Iwai <tiwai@suse.com>, Jaroslav Kysela <perex@perex.cz>, 
 Simon Trimmer <simont@opensource.cirrus.com>, 
 Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org, patches@opensource.cirrus.com, 
 linux-kernel@vger.kernel.org, 
 =?utf-8?q?C=C3=A1ssio_Gabriel?= <cassiogabrielcontato@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1223;
 i=cassiogabrielcontato@gmail.com; h=from:subject:message-id;
 bh=qat9PkBcrbY8prcgndKgZC13dso+54mnSw5Fj27uq/I=;
 b=owGbwMvMwCV2IdZeKur/u2bG02pJDFm8pwIfTiqy9l+zYtKciQv2NxbxzXA0OLfBtCtfN4Ihf
 M72rsPyHaUsDGJcDLJiiiyrkxZZ7ul6cLU+boUHzBxWJpAhDFycAjARpWmMDDMU1Mu4vnWcqna5
 fUw3u+r9fW9BlsPaq1dO7pHe9ubU3kuMDFvrf1pX7PKccqKj747+2Uvc+9z2tH/a1yfJv9Vmq3r
 XOz4A
X-Developer-Key: i=cassiogabrielcontato@gmail.com; a=openpgp;
 fpr=AB62A239BC8AE0D57F5EA848D05D3F1A5AFFEE83

cs35l56_hda_read_acpi() reads an allocated ACPI _SUB string to build
the firmware system name. Current error paths can return after _SUB has
been allocated, or after it has been transferred to cs35l56->system_name,
without releasing that memory.

Fix the local read_acpi() unwind paths first, then release the stored
system name from the common probe error path.

Signed-off-by: Cássio Gabriel <cassiogabrielcontato@gmail.com>
---
Changes in v2:
- Use __free(kfree) for the temporary ACPI _SUB string.
- Keep the derived system name local until read_acpi() succeeds.
- Transfer ownership with no_free_ptr() only on successful paths.
- Link to v1: https://patch.msgid.link/20260520-alsa-cs35l56-system-name-leak-v1-0-d13b54423198@gmail.com

---
Cássio Gabriel (2):
      ALSA: hda: cs35l56: Free ACPI _SUB string on errors
      ALSA: hda: cs35l56: Free system name on probe errors

 sound/hda/codecs/side-codecs/cs35l56_hda.c | 19 ++++++++++++-------
 1 file changed, 12 insertions(+), 7 deletions(-)
---
base-commit: 38c607c673155d6335591cdbd9c785fb2b7550e5
change-id: 20260501-alsa-cs35l56-system-name-leak-7fd779eac391

Best regards,
--  
Cássio Gabriel <cassiogabrielcontato@gmail.com>

