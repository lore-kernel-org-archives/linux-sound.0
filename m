Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88CF55921F0
	for <linux-sound@vger.kernel.org>; Tue,  8 Sep 2026 17:07:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788887268; cv=none; b=NaPQDyEou+cDLZoZvFRt/fqZBXaXNwWfB3HhA79qtwoN+1CHEEz9+gsTK4nJlsWAYyksfOcqz+H8xfjR7BVLhgqaQFSCZJN7mHT+CuNDrAMcLBtmLpOiqQFDb8zWSNYUB6WWCD6xmYRKxchaxB7bSOis2EvOEq/srpSaLFr04as=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788887268; c=relaxed/simple;
	bh=dVKIiNAEgVbAcUmEZV6u+JTcPDwaNXloRQ0M0HcerBs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=NIn1l92YsjgEiplCVmnpH8fAuMjMKtIifBMCtrqILPNpzkXs1Z92XqDUsYrtgk5avkkDJzDNZIFw/WfJAuqatM5HIaMWIFAxafcmLvkZjEy4cl/CDoT9vSA5jVlQGqTZf8S26l8Zgstjj0VrXQqhw7R9j+4Mn6ESKxDa1A2iB8M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KE5+0h/x; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KE5+0h/x"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49cd38e0f79so586875e9.3
        for <linux-sound@vger.kernel.org>; Tue, 08 Sep 2026 10:07:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788887265; x=1789492065; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=BMGCVsS43Or0QvhvusoStvupM2eWy3k0/84tq8T1pu0=;
        b=KE5+0h/xg2nIeR0racTO0uBPAclzV6M5seTz+/krE9UjKk6jtj+OEbBBn09mQcWpW9
         9Kzq2IDufE+2fEGmJ1nLeRA6Ea9co4nkz2+/j/0VK00tvWNaxPv47TAwAjL1YcxIsvgb
         4fU/JTNWv485v+qYrOj94l4MiQNmVXrLrc3pneUvFY+WqUw0tiTlwXP2+2dPREIPRNQI
         3vn9ULVI7XN+TTJqAj9tg5mqFZWPRchVxp2pbDVndlcEgcpPjPrqimIu3rddODNEbHlw
         TX4ncPcVssjn5Z+XIdSCYoU3v8xbZ3rjEpGBse6ikpe5tJJZRHFKHuPN6b1WE34w6DZu
         3jiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788887265; x=1789492065;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=BMGCVsS43Or0QvhvusoStvupM2eWy3k0/84tq8T1pu0=;
        b=gxOquyl+/aMElsK+sZBcvtUCrG/a4po4woUk2UNG721dpyD4/lV0MEwNHqwVBAVPST
         1JwHj71vPfOFzTnPF3t2XkW+yayfnmIiGSbQwykhbMSJ7u31CcHWWMRO8kOJ5sNQdPR5
         CAvMyTPBPXu/SjTve5iKfXFkKT2cgyPiC5q2AB0kRK8DmTvD6K7uttK/iuqOkKEwG8Es
         w5aFXuTONS9eOY8EvDNV6hsMs7iq1xSXadrJRhlkDhSqy+KMtlkkppTO83XEuzsvQ6DC
         b11wuaediSk3tZ7ZjoZtUVKbuRrvrMxQLrX3yO4DhvJzCtQBKwf9xWU9dJAUPXVbQ5Gk
         RT2w==
X-Forwarded-Encrypted: i=1; AKwUvBy2yyG/m4Whunl3Xzi1+y/qF8gSY2dA5fOp2j70KUyuIMcP9EBFotxDkl56e00HhHWrDirJtQVqfSr9Yg==@vger.kernel.org
X-Gm-Message-State: AFuF++nKKQYCleW//dCSk3Fng2MybKPAMxamIMzf99dy8htKG23oL1fr
	o8WMFtUYhueC/mOCWrMowrt6edgl3y0NmNql4TMRc/SZhwyIsvU+ECQ5
X-Gm-Gg: AYBFou10+QLrffWWGVkXXBoHn4HG58gQbzmYul3dV2dEYheUx8QpD2+MOQhQYHGIw2D
	iu6w+BvkFvi64saCRE4Hbhnc8HmABv3dbisL8PLjT391cxwwPKD13p4BBrV1wteJPuka+4Wb54m
	spKyT8X0mRW9ObGpv0SFiDLdku3KlOF9NB/ERooFcJr3elsUf8NNdBfIc6XAY9lHbCWwmJaKAj3
	+a2v590jMTFZZV3V2ihR/bZKmb4lUIJCsh33gjS3fy8ELUdpiwHQzlijit8r6WPz01BlWIDETWL
	yX7KrLx+zCJHf0Y5fq0bv/epYpt5bC/Awy2R9gHhbqOKCXiCky3SJ7eJth4hj5BIo7M2aBdQq06
	eLmGW8bexMMtS9MhEeXYbfnDhUxQScOwNn33pEbiEYftVKVigQfU9QYvqzOsJ24suE34iAz52mb
	0AWbnZyuXU0t1mq6Cs1ze3FQuLZXmRqhywTxWGld9R1ItkKC1wgeAkfTjo6Md5Nwf+T4MsmCFWY
	cJ4F4ZF8E+peSQF1BK+xRl/K9IBv2bm0ssi4WM+Z/AkCq6eqR+PwSINMU/Vpnxfrz6TQ6EfdwVD
	lCaSkhnfjjT0FY+7BJFz1mAjp4+INZFOYNfczHT++SO5+ZeUD6bTY3qdsSgLnS2gOuQ1u3VJATO
	Sl5/oEg==
X-Received: by 2002:a05:600c:3f05:b0:49c:e1f1:3dd5 with SMTP id 5b1f17b1804b1-49d1f223e83mr13800115e9.4.1788887264353;
        Tue, 08 Sep 2026 10:07:44 -0700 (PDT)
Received: from workstation ([85.186.165.159])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49cfd3f815bsm304804615e9.4.2026.09.08.10.07.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Sep 2026 10:07:44 -0700 (PDT)
From: =?UTF-8?q?=C8=98tefan=20Ghe=C8=9Bu?= <stefanghetu9@gmail.com>
To: Liam Girdwood <lgirdwood@gmail.com>,
	Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	Daniel Baluta <daniel.baluta@nxp.com>,
	Mark Brown <broonie@kernel.org>
Cc: Kai Vehmanen <kai.vehmanen@linux.intel.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
	Vijendar Mukunda <Vijendar.Mukunda@amd.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	sound-open-firmware@alsa-project.org,
	linux-sound@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	=?UTF-8?q?=C8=98tefan=20Ghe=C8=9Bu?= <stefanghetu9@gmail.com>
Subject: [PATCH] ASoC: SOF: imx: Prevent stack OOB read in DSP panic dump
Date: Tue,  8 Sep 2026 20:07:40 +0300
Message-ID: <20260908170740.276800-1-stefanghetu9@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Commit 58bb5081cba1 ("ASoC: SOF: Xtensa: dump ar registers to restore
call stack") added a shared Xtensa helper that iterates over a flexible
array of AR registers (`ar[]`) controlled by `plat_hdr.numaregs`.

While Intel IPC4 allocates dynamic storage for the AR block, the i.MX
IPC3 path reads the oops message into a stack-allocated struct without
backing storage for `ar[]`, while leaving `numaregs` unvalidated. This
causes a stack out-of-bounds read when printing a DSP panic.

Clear `numaregs` to 0 on i.MX since the AR block is not fetched or
supported on this platform, preventing unsafe out-of-bounds memory
accesses in the shared Xtensa helper.

Fixes: 58bb5081cba1 ("ASoC: SOF: Xtensa: dump ar registers to restore call stack")
Signed-off-by: Ștefan Ghețu <stefanghetu9@gmail.com>
---
 sound/soc/sof/imx/imx-common.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/soc/sof/imx/imx-common.c b/sound/soc/sof/imx/imx-common.c
index 7a03c8cc5dd4..436fe49246ba 100644
--- a/sound/soc/sof/imx/imx-common.c
+++ b/sound/soc/sof/imx/imx-common.c
@@ -34,6 +34,7 @@ void imx8_get_registers(struct snd_sof_dev *sdev,
 
 	/* first read registers */
 	sof_mailbox_read(sdev, offset, xoops, sizeof(*xoops));
+	xoops->plat_hdr.numaregs = 0;
 
 	/* then get panic info */
 	if (xoops->arch_hdr.totalsize > EXCEPT_MAX_HDR_SIZE) {
-- 
2.53.0

