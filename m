Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=85.128.243.59
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795028637;
	b=X5pHhV2A28vpJ4TKuPONRuX/mqOP2kM3PwBuM42xUmd9EABoEPrx7CXc+9R/M0/gQweq
	 fOwewO7vNi1dKhyB7gdwiYUpBXGcU9GeJsQpwjF4FaOjzDkPsm5zQjd29GjjNiXYQy1jO
	 rh+XLk551f0c4fwLJYbqN2lMrZGm2tIeSvsZbjN5v0T71S1SJtmvoCr8jLsPutyd6Vfz/
	 0t7j6q4bRpyOayVSpT/llB6wvs5ZLUXPsBqKmqfQtCVI8IRLhmuUC78aA4xt2GNe9S+m7
	 elgGrp7k7mcJkybKffvMVEtzBWmuLjOpUXYOINss2WRrcE9dLT4EdKmzqMaYo5474WA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795028637;
	h=DMARC-Filter:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:DKIM-Signature:Received:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=nKtSE7D0n360/bXPfvV0/zCzED7g8zj9bCTfDQBopc8=;
	b=OyoHOdbXMcv/+OLAbhW5FR6R3jVYnxVZLZ5mzlj9pyGBpxX7NG3IqxXuNsXrOAm695o6
	 1j5Vr9sx0wXH5eSKx4oXYTK0sLSx53evv5Ahi0Xa2PeZpcJ/ETZ+4TZjuCxVTywQHN4X/
	 zx1W1PEPwKmgBXrJjeXgXP/vZ66Plg9bfZMyv9aFlzLHiu6A305RFHHpCGcQsuSstIuFB
	 q3DdZ4iXfBJsd6C7MW3BMwIOZYQcrlnYXznsDde8odfeMuSTbRiV0vOM8qaSpWOsV9h3F
	 B/u+xCHudexZEH893KmZjVJhuf553KD/hRZt0+btMP/id25fG7iBgXqtpXTKb3S9DvQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=asmblr.net;
	spf=pass smtp.mailfrom=asmblr.net;
	dkim=pass header.d=asmblr.net header.i=@asmblr.net header.a=rsa-sha256 header.s=1706450368.internal header.b=BfZxdtmm;
	arc=none smtp.remote-ip=85.128.243.59
Received: from shared-aoh59.rev.nazwa.pl (shared-aoh59.rev.nazwa.pl [85.128.243.59])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66A52606A320
	for <linux-sound@vger.kernel.org>; Wed, 18 Nov 2026 19:03:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 66A52606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=asmblr.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=asmblr.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=asmblr.net header.i=@asmblr.net header.a=rsa-sha256 header.s=1706450368.internal header.b=BfZxdtmm
X-Virus-Scanned: by amavisd-new using ClamAV (10)
X-Spam-Flag: NO
X-Spam-Score: -0.625
X-Spam-Level: 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=asmblr.net;
	s=1706450368.internal; t=1795028635;
	bh=nKtSE7D0n360/bXPfvV0/zCzED7g8zj9bCTfDQBopc8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=BfZxdtmmJYdImfbVW6m/u3o8YkRWR2otJbQMLQNbg1SbMXHTLhGqRakidpplKSuyn
	 l6moHvRFRBZmy+EP9lz1G2MVtDj1A596/8d7uAOLJF4IfzYMdVeArFB5lj+Qh+Wj7a
	 xNkplxKifVQgQVKfUe2HMgjMo/tTmaXKRFUv/LDNSW7FLU5e6ov6tyPGSZYMbE5GcZ
	 St2ybhMh1fz+XGED+/yOhYI4CkaA2VJkWEs7SfQGhrJzACBh/INs9YZCicPHMmm+gT
	 yMcMBzMpVE742VPRu8OyZjHBIhHb/pI8U2xgR5G27UY++0HbWuLoukDcGKLiX4Oj6I
	 cx/48PUFDStxQ==
Received: from milkyway (91-150-220-230.dynamic.play.pl [91.150.220.230])
	by server753313.nazwa.pl (Postfix) with ESMTP id 81C0F1BE2F1;
	Wed, 18 Nov 2026 20:03:55 +0100 (CET)
From: =?UTF-8?q?Amadeusz=20S=C5=82awi=C5=84ski?= <amade@asmblr.net>
To: linux-sound@vger.kernel.org
Cc: Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	=?UTF-8?q?Amadeusz=20S=C5=82awi=C5=84ski?= <amade@asmblr.net>
Subject: [PATCH 15/22] ASoC: Intel: avs: Remove orphaned avs_parse_sched_cfg() prototype
Date: Wed, 18 Nov 2026 20:02:12 +0100
Message-ID: <20261118190219.316811-16-amade@asmblr.net>
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

avs_parse_sched_cfg() was added to avs.h in commit 62dc545be11d ("ASoC:
Intel: avs: Separate debug symbols") without an implementation. Remove
the orphaned prototype.

Signed-off-by: Amadeusz Sławiński <amade@asmblr.net>
---
 sound/soc/intel/avs/avs.h | 2 --
 1 file changed, 2 deletions(-)

diff --git a/sound/soc/intel/avs/avs.h b/sound/soc/intel/avs/avs.h
index b4f9d66d55ad..9bec903acbfd 100644
--- a/sound/soc/intel/avs/avs.h
+++ b/sound/soc/intel/avs/avs.h
@@ -357,8 +357,6 @@ int avs_register_component(struct device *dev, const char *name,
 int avs_register_all_boards(struct avs_dev *adev);
 void avs_unregister_all_boards(struct avs_dev *adev);
 
-int avs_parse_sched_cfg(struct avs_dev *adev, const char *buf, size_t len);
-
 /* Filesystems integration */
 
 extern const struct attribute_group *avs_attr_groups[];
-- 
2.56.1

