Received: from mail-wr2-f12.google.com (mail-wr2-f12.google.com [74.125.225.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A8305A0AC1
	for <linux-sound@vger.kernel.org>; Wed,  9 Sep 2026 21:24:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788989050; cv=none; b=syF+NvuMhYxgO8MoBzvsvMa6RmklkPuPwmd3vJoOKc4aCsCfcmF/wbNHZjhX6ZBVM1q4wAWpN62+wdYfrfUi1/1wv749T8Jlmoavrk7UbzySMFtoWJg51pynmjve4omC/nuEiV+tK2vVuyhuNmNCxHf4C5dY11ggnkxS3M/OwvA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788989050; c=relaxed/simple;
	bh=FW5whXPmaXHA5LR2dz0E+orKk8rccpIOS+ct8eSwStQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=gVFBXZMu5IiuNtKcdUx4pQarE9/WgLNZkPbx3gtrXnsoC8NdDPZ4pjDcLZOsiE6ybRvHPfICAR6B3e3AEwvr91YxXaNvBrxYppW0Obyb7s94uqnmJS/jdjbI2txfLtyAsIQEfftiJGooB5H4heWGDfheWNUZZ0sGFpM+SfCzQcw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dDwPXaaU; arc=none smtp.client-ip=74.125.225.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dDwPXaaU"
Received: by mail-wr2-f12.google.com with SMTP id ffacd0b85a97d-485933b2522so605389f8f.0
        for <linux-sound@vger.kernel.org>; Wed, 09 Sep 2026 14:24:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788989040; x=1789593840; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gVfR3lqxcmlEuRpdPzCYb7K9yNG7tXcy09eud1ICyVY=;
        b=dDwPXaaUK7kfUnq1x8ECKYYkdLWmGFUJcX4ulACHuXStbxTYgvB2vAhBjCvdCITKjG
         fuKGb7YqE6UXJxWY/zTRkR07lmCuX+GPfBqMkpLYaaU6nrBD0i/XSCxSVkWS5FivUSxj
         pTwbPXkPCHjw9joA3Yo3DqWm+64zBbPBz8TG9ZD2ETDq17cWn8Jvq9497kltuUutH8k0
         F15Paw6RbRjZZVdwvjQxe3lzp711x2ThykTLfjkG6GQORNg+WMYVR9BLEJQoUUKv4NzQ
         +b9+VJ4wqd9Llm27NOgk+nW8I5U57E84CQhg1EBjjoblCcpHi7qK4FOz5b+qJntnolbl
         I+gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788989040; x=1789593840;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=gVfR3lqxcmlEuRpdPzCYb7K9yNG7tXcy09eud1ICyVY=;
        b=Ut8NvCwS4nutpqVdcqfRlUBmmmdRDtjpJZ2sWu0/eJYmHkKini/Fa4Vza518aANyDu
         wz4ud9fN0Q1MF5Z0aLVZa0+1A2hUIHdsqC2/4LBUFdOmPChwI6jwcYwblsUT6v4asPWG
         eYh4Wj6OxxX7gAombHgHPfoUnXHT7cPj/D/mTzjYJB3LDx5smwRrnf/ZH25WwCSKAMcP
         AJKVJiHzgg+8F9QaZEIIgOjsNqWVTv+/y0kz7USehkGvXnlMbPoay8nl8+MUYbnGWIu3
         mQDk+nHzoC7GJ11snUgembXL7WY3v6XwevKbQbJrbEftG+AzY9o/rI3yXy855iTSmpeC
         tk4w==
X-Forwarded-Encrypted: i=1; AKwUvBw30EwXQSGex3oN4rFOvPWWRTY32M9rWDXjTvamavWmf8okgd8Qu60v+yH6iyw48xaCdwqxZs4vwggO4A==@vger.kernel.org
X-Gm-Message-State: AFuF++kZbLrvOAVOCBmL80rf/zvPO/BdmYlT48CgQbVIslIXiAwWDKGP
	YqYWqGQpRG+HDRsZNiPVmFxy66df8UeeFoBYFdVyBxogokgt4ht2pm94
X-Gm-Gg: AYBFou3GpK0aM2PS+7U1NXhpu8rydyQSRQHhpi993VUL3pleDMrKIzFZin7jIDUiJjo
	t5DU9+IvwCTQAMy5w2Z+h8HrGl26yzwplfLhT5zyb2l04C0B2nprSQIVMHmnHGiT1UdVQE9uTp4
	4lZVxwxtlQZOl5Pz+8JbNR66CiEDAw2jOcv0HlV+dpeKS3FBeyx5gH8qc2FTZmk0SG5t6a6DYLi
	hVovyuB5F6wA4LUFKOualJhbftbb2MZ1xVQjf6A4GsHuuJbRGuhDxz2qWW3upFgjLezK0IkTSOv
	sI+KZ5XFDA+DPJ5kg0hwdEfsGgIcKGUBVPV+w3xfNPrMeBtLIyWkHY1jL01/HGCwiHrEk0r8Qsn
	YvyWcQeu6PooVGr7QGtM11aytiIla5P5njeGfQH2lLKFN33GDOXjhAaSTOIhDXey+SPZ6ivdMqF
	lZ+tKsIxOKApCITlaZhf1SHx25a3sctq5F48ppr2sPg3v3ePWebUoBl4BJzzzqow3ElGnIRjSs2
	Sa1Fo+DEUQI3EC5tmHHIbyjNdO/pnShm9kqAg1oQowFjXW9K/XUO5dNfM2z8Xx8p6EeDPZkYArh
	+fcPhD1k8wvfDqzHFIsoihKlubzZ4SaFN4M/UV2tjPXUrY7XO05gcu1qEFJcOlrv56JMrxdIekJ
	LhWTCkbplPRM4P8f1
X-Received: by 2002:a05:6000:40dc:b0:485:ac96:7251 with SMTP id ffacd0b85a97d-485c23e5bbfmr7228249f8f.21.1788989039805;
        Wed, 09 Sep 2026 14:23:59 -0700 (PDT)
Received: from workstation ([85.186.165.159])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-485885bfdf6sm46967470f8f.34.2026.09.09.14.23.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Sep 2026 14:23:59 -0700 (PDT)
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
	sound-open-firmware@alsa-project.org,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	=?UTF-8?q?=C8=98tefan=20Ghe=C8=9Bu?= <stefanghetu9@gmail.com>
Subject: [PATCH] ASoC: SOF: ipc3: bound firmware-supplied ext header size
Date: Thu, 10 Sep 2026 00:23:53 +0300
Message-ID: <20260909212353.69599-1-stefanghetu9@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

ext_hdr->hdr.size comes straight from firmware and is used unchecked
as a read length: too large overflows the PAGE_SIZE heap allocation
in ext_data, too small underflows the size_t subtraction (hdr.size -
sizeof(*ext_hdr)), producing a read length near SIZE_MAX.

Bound hdr.size to [sizeof(*ext_hdr), PAGE_SIZE] before using it.

Signed-off-by: Ștefan Ghețu <stefanghetu9@gmail.com>
---
 sound/soc/sof/ipc3.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/sound/soc/sof/ipc3.c b/sound/soc/sof/ipc3.c
index 85bb22bbe18d..6188e43726e2 100644
--- a/sound/soc/sof/ipc3.c
+++ b/sound/soc/sof/ipc3.c
@@ -598,6 +598,14 @@ static int ipc3_fw_parse_ext_data(struct snd_sof_dev *sdev, u32 offset)
 	ext_hdr = ext_data;
 
 	while (ext_hdr->hdr.cmd == SOF_IPC_FW_READY) {
+		/* bound hdr.size to avoid heap overflow/underflow */
+		if (ext_hdr->hdr.size < sizeof(*ext_hdr) ||
+		   ext_hdr->hdr.size > PAGE_SIZE) {
+			dev_err(sdev->dev, "invalid ext data size 0x%x\n",
+				ext_hdr->hdr.size);
+			ret = -EINVAL;
+			break;
+		}
 		/* read in ext structure */
 		snd_sof_dsp_block_read(sdev, SOF_FW_BLK_TYPE_SRAM,
 				       offset + sizeof(*ext_hdr),
-- 
2.53.0

