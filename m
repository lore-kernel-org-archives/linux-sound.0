Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=85.128.243.59
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795028569;
	b=ZsQCZDWvjB+UL05juXmeD3h4eJcY20SC+Y8D7ZkQmq8Jf7MQOOjHRw+2X/kT5y8vfAb/
	 v/kzSlynlK2MPO7Mf7YP6uvyUleSHbSYa3oH+acS27XFvPErB3Sqk+T52Qcxt6TeKg1LZ
	 Xw4yCiPYb9b0bPw31TwZz6WWweGuMkOUDvdjmAipjOwwtX5GzEXUuoldMe5V10kEXv/Ab
	 wVs8h3LE7RwObQiqzgg7ZcGV+MdVcrdonSGhbhQrVEfN9/lyaSVmLzNTJy8gAha/qJfu5
	 l7dl49hbsGxVaENRW6xJb/2mpmzIAhozfdGCcW3M1H5MpGffw9RuWgZPrNTHY3GDV0w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795028569;
	h=DMARC-Filter:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:DKIM-Signature:Received:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=/IfJNz3D4+04kR0v59+cW6R3JGM4xygiYqwCX7SBwqU=;
	b=SVHztIvf6JksOCkvXi1iAk8vu7zDnVbL8Ld/cKff3PrPBSB1aGvs3ydi4wDYUW+IGUCz
	 2Cqh+yOSDvqAwOHTcV3Td8hzLtrturADty2ep7d3MENEd+I3zCKPcB+jhwDKrNpPK61xh
	 l4V+YxEvJ0WM+Sh9WYElF+3CfDI1D2jGl7o6ABZzEGhiEf0pHQyYvAuC0a01HzHGkHSF9
	 12njWcAj6VR6A+6lUtlIxCffD1v5QmUUa9m7Rns5ilp57N4bs7HCgOLQTC6rzK6gO+6d4
	 /MCFxP+GgJGjNTXRy8++Lx5yOGJL3lYdSE7BdV9PtB4b5DOJGrVxMhJL4DRVXW5Pr3g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=asmblr.net;
	spf=pass smtp.mailfrom=asmblr.net;
	dkim=pass header.d=asmblr.net header.i=@asmblr.net header.a=rsa-sha256 header.s=1706450368.internal header.b=rTHh3t1C;
	arc=none smtp.remote-ip=85.128.243.59
Received: from shared-aoh59.rev.nazwa.pl (shared-aoh59.rev.nazwa.pl [85.128.243.59])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BEF0606A32F
	for <linux-sound@vger.kernel.org>; Wed, 18 Nov 2026 19:02:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5BEF0606A32F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=asmblr.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=asmblr.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=asmblr.net header.i=@asmblr.net header.a=rsa-sha256 header.s=1706450368.internal header.b=rTHh3t1C
X-Virus-Scanned: by amavisd-new using ClamAV (2)
X-Spam-Flag: NO
X-Spam-Score: -0.625
X-Spam-Level: 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=asmblr.net;
	s=1706450368.internal; t=1795028567;
	bh=/IfJNz3D4+04kR0v59+cW6R3JGM4xygiYqwCX7SBwqU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=rTHh3t1CZqiyFtGH+j88ktDkE+QVKvAFe/tXpPH25iq0iTCreE0p4JptZioQqra68
	 MPvsaFppjKrS8EHT2Hn+FPAdvhj21RPdDEGI28uZPYv+f7ohGXENaRCGXAh6r3wygz
	 /Hd/1s6ZGHcZVNWCfRXl3Hs818DYo96H+vM5Cs9deT7kID8ZiYQqmN6dcNA18FFw5h
	 Ql7gFVx1YXfLW6LKNpa1iYujU0yQzg4XP3wouv6neCJivUmL/1FE8rx4rziLLOJ/w4
	 7yaEgh9XzmEbu2isnSs00b+h2DIA1gqNupHx84+CgrFAA9j8q4p3Zf9ObX0aTx6GaN
	 SZXk6S6H166Ow==
Received: from milkyway (91-150-220-230.dynamic.play.pl [91.150.220.230])
	by server753313.nazwa.pl (Postfix) with ESMTP id 766261BE52C;
	Wed, 18 Nov 2026 20:02:47 +0100 (CET)
From: =?UTF-8?q?Amadeusz=20S=C5=82awi=C5=84ski?= <amade@asmblr.net>
To: linux-sound@vger.kernel.org
Cc: Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	=?UTF-8?q?Amadeusz=20S=C5=82awi=C5=84ski?= <amade@asmblr.net>
Subject: [PATCH 03/22] ASoC: pcm3060: Remove orphaned pcm3060_remove() prototype
Date: Wed, 18 Nov 2026 20:02:00 +0100
Message-ID: <20261118190219.316811-4-amade@asmblr.net>
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

pcm3060_remove() was never implemented in the driver. Remove its
orphaned function prototype from pcm3060.h.

Signed-off-by: Amadeusz Sławiński <amade@asmblr.net>
---
 sound/soc/codecs/pcm3060.h | 1 -
 1 file changed, 1 deletion(-)

diff --git a/sound/soc/codecs/pcm3060.h b/sound/soc/codecs/pcm3060.h
index 1b96835600b4..0d7b677837b7 100644
--- a/sound/soc/codecs/pcm3060.h
+++ b/sound/soc/codecs/pcm3060.h
@@ -34,7 +34,6 @@ struct pcm3060_priv {
 };
 
 int pcm3060_probe(struct device *dev);
-int pcm3060_remove(struct device *dev);
 
 /* registers */
 
-- 
2.56.1

