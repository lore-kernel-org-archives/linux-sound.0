Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.182
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793875446;
	b=CAwzTwqPrGYorRrYyCJ1VDdFbvg1AuVZYGvtYrjzjvW41yqXyG7e5xuySYZntcY6xQpv
	 kepW6bLeL5vQHvAnB2BPiytT7d2ok7joUin3xLroozk5qLFQWe4ceMZzpweLVmAwM/GCf
	 1sekFVRy/+teYUXzriysbCRRncawb2hKQPfqcRcXx/Og4GpqwiwtVb8hWaGwM+MAA/rFy
	 aN5lOzKc06z/2I1FGql0Xw91dIIYTVAwXDC1ImvShm8TlILyNvbXK3kHtXuEwvPc5gqR1
	 BjWsLvrlRkTv9ujUNID7hKcXovsR2GvztE9xkf+z9h1fIJXGG9LOiqyBVO+eBgbFd6g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793875446;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=plnEW8+Hp4dXa8Lp3EAtMLPmG1hUTIPGT+05VPB/oMQ=;
	b=YqQV4x+RqJKJFkL+z0OF/9x8kj1jSQAguGxNsLorn7Smb7qrpEyQ1m2maGMEGv5d5Lhd
	 l459TazxY3H54VaPIAokepae56BvRCuHf1l/6fCnPduupSuSceYOgorX9Oe2JUmu/IG7E
	 jAiqLZp/WxrOnd5nw+u5vBPZ2YIFeKs/ETB0MqneVbuTt3e3AyYdFGhwVOUbFaUu4HNyv
	 qPuV7LkIbLdmbY/EGzWEYs27d02qOHJIRo1J1U76oTmhGzATpmVVLv4FMHlkidhoqgS+Q
	 BzVbp8NwsXqDAvQSjYx2U0RNBWhqTM9cFD7T1ddzAjmgkt9hojM/CKhjaGto/UnNy6g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=JC5CDN9D;
	arc=none smtp.remote-ip=74.125.82.182
Received: from mail-dy1-f182.google.com (mail-dy1-f182.google.com [74.125.82.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97564606D808
	for <linux-sound@vger.kernel.org>; Thu,  5 Nov 2026 10:44:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 97564606D808
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=JC5CDN9D
Received: by mail-dy1-f182.google.com with SMTP id 5a478bee46e88-36a1947498bso4824990eec.1
        for <linux-sound@vger.kernel.org>; Thu, 05 Nov 2026 02:44:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793875445; x=1794480245; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=plnEW8+Hp4dXa8Lp3EAtMLPmG1hUTIPGT+05VPB/oMQ=;
        b=JC5CDN9DXHiCMeoR6FtKIZGtf4E+dJKETsas03Cr8U4qVAMjzRKZfQv3Q3Cfjbfwno
         bDwNGLNODFJb4vXa3NXdm45qm2D+W9L1CTN4m4f0jLZhL0Q3CvcCqPjTPbTs+k6ZM9o0
         EBndUPFMB+3kZZQJiG7nT1fjWAJVSbNTID45A47FPNQg2JkeLM2tOzzomrJa/ec89VO3
         uspmNrHZrdQaOGUD+y3ziCG+Mi0zX48D6kT7pJWPMGksEXzM0s9NdQ1OAyFFrgTmeSIV
         7pPbaDpXGPbVvM7TtE87/2nlSgJPXkc4YUo6alzZ+iNi8ZbNNma8YmOgwYCQj729RSXU
         llbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793875445; x=1794480245;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=plnEW8+Hp4dXa8Lp3EAtMLPmG1hUTIPGT+05VPB/oMQ=;
        b=peJuiQecBgMS2s7oPb7RzBiFKJ/e1pEQKY/Maf75TyXG85NxYT8g6dEecnjfCuS3nd
         ESEueWmQF5RMmEc9cpUO204Tvm88ZgwI2S1dQlI99fRCitLjw+o/DO9o+3+YtuQSRvi0
         6u0qrH0wv4VMwSoGokB+9iRYgEnzFg52DBwTfcOVmZQoaIRw98A01B2Dp3KI9mQCk0bg
         sx5YfQhG3w/Uwgj0rB5jzmPpCSL+/EtBpKnXG2G8IbwZRJtX9idMgHJ+X37IeGIdPxR+
         a1ZPf6yPr9a8lD3YL0LTTt26jIni/4P/y1v2kEpLSfvDLL13koUdbP1P7kA0v+4jm6tO
         iUew==
X-Forwarded-Encrypted: i=1; AKwUvByg0P++ogurr1BlxITtVr5/0WZAAe4oruZI227TxjM9sqCwD6YJNhcliS/STn3CCwXL6mEqkMIaNsVY7A==@vger.kernel.org
X-Gm-Message-State: APuU4Z9phWzdiJtL0KdpV+W7qo844R1XhLRVaTK9T8gR3FxNEZub6Xx/
	ltbJYuV3v4oAsX6HAgGAKBHo1/4KUyBJZbuI4L/MJJwsCsF+Qr3/AYN4
X-Gm-Gg: AYBFou1F2PotqMXYGqy6yW+2vJ8QjXkphx+fbYUadIsA4Z87bag/UvNLf/KyacgpZJt
	6vDkp7CICRxGXKoyYc+4OI866uq/oyLQlJv8uZJAc8Pc88ayDVAZ8FMBwy1srqxh6V8Nqbnv5tK
	v5jH/pmy5nZIQX7w3bAwHaSn01TVen3ijbTXFNKxwXeDz2DFXFCp9R3+KdtDGgPS0nizyLv4RIo
	XJnjR54TDe1TGvi08Hujwyp9l43YYdZSn8K+vHLmeYLevpRp4OviCsERuxJ2EJK3hGQINkJuDvr
	ZOQbV0PxwRZtFN5Q5DTv9NaA38ffXp3jyUPPUI6EJ2Lo6S0PUuYwH9BoQA7aXg5E207Tmlq0SEP
	7cD/Ae82XQqnAo1wyizxcKQhdUbVMlgIfVBSvmlcWlRBVP8adP0GJhMKKZp+9KqIFZ/+0Be3Tn8
	nFjItjuxEvsqAocXgXyWAJ3aNFC3T9whNybNNw5Ag2f0aG2OsXxzqffjyl0V3mRQ6AQJEkeyBSl
	uT12q+cWmexDaqZfz7v1lS8kKMFOyEqbu01l+yO3dkRHChOTK2M13UpdFESdlWl6flW02lAa1rF
	kh8c1r001tyRx5LAQQoN/DqEgm/vpB0ZCmrjYAD02GQvgQ9mBSQ96rS9mFLcC5f/gvBDVAZJ+k5
	3PCRoOW2mtk0vOFgxRi/odu2WPmX7Wss95gEdveD7Ut1r
X-Received: by 2002:a05:7022:3a05:b0:1b2:4da6:bccf with SMTP id a92af1059eb24-1b24da6bf79mr4455241c88.31.1793875444532;
        Thu, 05 Nov 2026 02:44:04 -0800 (PST)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b245c1c272sm15595215c88.8.2026.11.05.02.44.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 02:44:04 -0800 (PST)
From: phucduc.bui@gmail.com
To: Shengjiu Wang <shengjiu.wang@gmail.com>,
	Shengjiu Wang <shengjiu.wang@nxp.com>,
	Xiubo Li <Xiubo.Lee@gmail.com>,
	Fabio Estevam <festevam@gmail.com>,
	Nicolin Chen <nicoleotsuka@gmail.com>,
	Mark Brown <broonie@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	linuxppc-dev@lists.ozlabs.org,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH v2 10/10] ASoC: fsl_sai: Don't write CHMOD to the other direction's xCR4
Date: Thu,  5 Nov 2026 17:42:37 +0700
Message-ID: <20261105104237.38542-11-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261105104237.38542-1-phucduc.bui@gmail.com>
References: <20261105104237.38542-1-phucduc.bui@gmail.com>
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Post: <mailto:linux-sound@vger.kernel.org>
List-Help: <mailto:linux-sound+help@vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-sound+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: bui duc phuc <phucduc.bui@gmail.com>

When the current direction is synced to the other one, hw_params()
also writes the frame configuration to the other direction's xCR4.
The mask includes CHMOD, whose value is set by the current direction
(Tx only) but written to the other one, so it is wrong:
- TCR4[CHMOD] is cleared, while Tx needs it set (output mode).
- RCR4 bit 5 is set, while it is reserved and must be written as 0.

CHMOD is not part of the frame configuration, so drop it from the mask.

Fixes: f4c4b1bb2f5a ("ASoC: fsl_sai: Set SAI Channel Mode to Output Mode")
Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/fsl/fsl_sai.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/sound/soc/fsl/fsl_sai.c b/sound/soc/fsl/fsl_sai.c
index c61703ddb6f8..430e896d064e 100644
--- a/sound/soc/fsl/fsl_sai.c
+++ b/sound/soc/fsl/fsl_sai.c
@@ -720,8 +720,7 @@ static int fsl_sai_hw_params(struct snd_pcm_substream *substream,
 
 	if (fsl_sai_dir_is_synced(sai, adir)) {
 		regmap_update_bits(sai->regmap, FSL_SAI_xCR4(!tx, ofs),
-				   FSL_SAI_CR4_SYWD_MASK | FSL_SAI_CR4_FRSZ_MASK |
-				   FSL_SAI_CR4_CHMOD_MASK,
+				   FSL_SAI_CR4_SYWD_MASK | FSL_SAI_CR4_FRSZ_MASK,
 				   val_cr4);
 		regmap_update_bits(sai->regmap, FSL_SAI_xCR5(!tx, ofs),
 				   FSL_SAI_CR5_WNW_MASK | FSL_SAI_CR5_W0W_MASK |
-- 
2.43.0

