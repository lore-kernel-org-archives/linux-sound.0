Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 843D658598B
	for <linux-sound@vger.kernel.org>; Wed,  9 Sep 2026 20:40:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788986461; cv=none; b=K0mUv0BHzRYV4McJPu/Yp9ioZ6M2whm+Qj7nd4ZRF2xa1sZfEOjNkH5FLesHuNy9TsJCa5ukyZM3i8Xp9B66nj+nU6t9YbZlRRgYDwfOa8iPVNMqUEUt/eOIJA66q5JT9u1n7paSHyXHDrRIVJWFbSfCOqIm0dRc2/DXefFteB8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788986461; c=relaxed/simple;
	bh=dVKIiNAEgVbAcUmEZV6u+JTcPDwaNXloRQ0M0HcerBs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=F118ogKfArGe19w1/ZARClTsTuz+pEUuPcuvGVWNyV+7i3h+SSwpHiwXH6dF2TXPPXZfj5dS4WEaP6Oz6nVJAVeYHcGu+cMfDrqHyDpl/Jdgd4Yd2RXXMGHJwe4apckh7YUF90qvad5ZMOTLYhBhUgrbAAI/eY/1BKwxuR58yKc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=n8xP1iDM; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="n8xP1iDM"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49b912d37b6so8620165e9.0
        for <linux-sound@vger.kernel.org>; Wed, 09 Sep 2026 13:40:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788986451; x=1789591251; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=BMGCVsS43Or0QvhvusoStvupM2eWy3k0/84tq8T1pu0=;
        b=n8xP1iDMRj8LCqfLe/W0QVzRI9T+A4T+YmnXRgi5ny6Dzmw3A7a7BXPiPR/0A5kdIl
         94nlY+hOTZNyDZKaCvSwOvU9nwOWMnBvq9ZmU3N7dObmEyqtx2F7+DjAGsT9OEUhABke
         tntIxCRQw8RaYh/n+qqVNqEImKb59naDYccPCvdSjsNJuc4+TqAgpWZQU3Nc/WMLJ/mc
         27g7Y9TV61N5g/k1oHEWKDmvcCivR2hWJzfTA75jzHZOzu52CdgNpzLmSp0QKiTpQsRd
         rls4qbFNTkL0nv834NeMhaEUOhZOSlOFgcg6515/YfzYJHICBZ57hnCNhhoYQrK/l7u6
         RazQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788986451; x=1789591251;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=BMGCVsS43Or0QvhvusoStvupM2eWy3k0/84tq8T1pu0=;
        b=RoJ4NOIQ2xi9yBf2j/hvSbopRbgoVkMQIHJOao/85kAsK3ThOsH/LITgevQyqqrEOP
         vKXXRvM9wSb+xRddA4KhLbfU16p/Vsvam5jOL6cC8W2iZprjRZDMt2DPakggWYKpdOcB
         wQCKvhgTHVfmjs65RiSs731W6n+4g1iUr27hFlqaEJhJlVfzBGxA1rd26o171Jr8ytUY
         Yvk3LZDFVR/dvJ4Uh33R7jPjyxGR5h/x7k7yBKh1b7jpJ+GS6KxudN7CxlPcwBx/dQPI
         Ic26aiom+IEoa2LcRrUU+2DM0oBPQX75uZ+OyU4aGn3zcwY1T/KzWQlB8d71rl9ECWdm
         GEKA==
X-Forwarded-Encrypted: i=1; AKwUvBxVU7jMSi8yYktKFVdqp00vtzzoJVEGU5CaRLuvMnR2YTFTqUYeCFYkjDUOYqfSJa7uAqD7DltX2kKRog==@vger.kernel.org
X-Gm-Message-State: AFuF++l8Iwwf0OADL5z5WNWt2sYb5T6+b6ttdXj2vrE6EUzwXpS0IYHg
	lBq8JlU8iY74kLNnro7waRN0R1pF7yPDOU2QCpbmxNGdXY5t236ljyPc
X-Gm-Gg: AYBFou1657zD6AxY37fLXyYq/RxZNmf3stcLJih6iapX9awDVU7iX3GHY9Xwsn+nNOJ
	KktmfSAdyEgnNUEPht5vN1b7pFuh0ynhuQ4qBvgrA+OYDX+eMmyQVJ5toweKUb7dyA0Ngqbtf3/
	jeZKkWh/J1HXqLOb3rhPBBgDdvnSQYeOIyMzxRnSLqZZytIdUsbI8VGFxqq3jTb175+iQ+EQL/s
	BtK9Xquehy29ybqGoqbwkupIAhQJ/xX1LinOnzPdvFsZ+J8Ktk+vp5YjqEukey2/P610IJo3Pck
	iHqZzs1uCDmquBhCjqa07o71sflDV6FX4jcrGf3UmG1xAS0J+CRz4b5ne23pPEZZVJkPi7k6JVx
	AQeF3VgZb/TXemMP0QNZxxSFYIuay8d5OowNWrPmW6QT9CjRPfrCLPK9ogDfosMLeJSO3utiyfm
	fVkSnvURWT1qd+GFMdMJtvHYSSX5vSQPheaotVveSjKjzjO8MnDOrbRqOVhFthzg6c0rlnOtdYy
	yjC6gf5k0bXtDbh4mIc0BaA50D+0ppQkBDWgPJz5YRQLN7z0+eR8rrBmrn39sjUaUnbWtmVz/UF
	3ACdXQrpez42NjpHOCGtImx/W0tgokLaEY83LC/a7i/u3do5+OaCta2FF6tuL3n8Vxuhi7sLHkM
	a8B7GjabmL1spnSHK
X-Received: by 2002:a05:600c:34c9:b0:49d:1deb:a629 with SMTP id 5b1f17b1804b1-49d1f21ae8dmr155804825e9.2.1788986450686;
        Wed, 09 Sep 2026 13:40:50 -0700 (PDT)
Received: from workstation ([85.186.165.159])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49d26c437besm17171315e9.11.2026.09.09.13.40.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Sep 2026 13:40:50 -0700 (PDT)
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
	Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
	sound-open-firmware@alsa-project.org,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	=?UTF-8?q?=C8=98tefan=20Ghe=C8=9Bu?= <stefanghetu9@gmail.com>
Subject: [PATCH] ASoC: SOF: imx: Prevent stack OOB read in DSP panic dump
Date: Wed,  9 Sep 2026 23:40:42 +0300
Message-ID: <20260909204042.46656-2-stefanghetu9@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260909204042.46656-1-stefanghetu9@gmail.com>
References: <20260909204042.46656-1-stefanghetu9@gmail.com>
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

