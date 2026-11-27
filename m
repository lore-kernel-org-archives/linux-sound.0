Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.182
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795771445;
	b=PVzJPyEBE0Q2MhQVlircHPmLDRlA/PMgoG1AGCln35HsWCkI0WUe5du6YsqycPZnAClL
	 LhPuud+gRlGrvq7gcDfCgMS6nyctQP/DkXTNImyfGJAHfEOu6drKzU2ved0yXPFMppK4l
	 Q1ZidRuVwSChvC+r1c2VrNbKgl/jiUSZWF595/e2ybR6EK7UUoB67GF8Bz/D23xPnQ6t3
	 5nOXQBGj4QPYjnf/eP4mwl5sj8NF0Yv7zCd1L+q5IV1lLdmSe2MH5gED/1tgBdXEuHbsd
	 Jxkv/CPPJFyudaF40p/cH5JjIBpGcuidLqfFGPhOLldFjgddXmROFjg+/rEcggMbLww==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795771445;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=q1Uuv3s1OBKaJBzE3G5+r1JPdIOySBnabwRbvvXOjkU=;
	b=mxdgph7d7z4rD/jDblW94rkmWeNLuwpuHZWvzU7R3BCWSQLMz1u5yBBOHxBYpXorZLC3
	 FNBnlj+8GTCQsiNoe7qz3RST8nDVgUsXsnEMen18NVeV+2fXjsLeFuvfgft7Tc5lT7vlD
	 IYiun95U3PH+J/5v/vF0Rlc7vri4PthbJiTYMtrz+CQmzeADmdrfZKwdbOdNwHHcDD4LH
	 AVyiteltgT7vhQ1TXu5eo6q3f3FQs6VshhVvleDP2BOZJ0sOShgbwmqzkBxA7CwclTa0O
	 t94JMQAtYfCwtNs1orkY2Z3SbWFIIqd/+2M/8TSnEt4SQSQWLU5WQyopQ/MrObiYdpw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=nx5xe6UA;
	arc=none smtp.remote-ip=209.85.215.182
Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com [209.85.215.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DAFCA606A339
	for <linux-sound@vger.kernel.org>; Fri, 27 Nov 2026 09:24:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DAFCA606A339
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=nx5xe6UA
Received: by mail-pg1-f182.google.com with SMTP id 41be03b00d2f7-cd60c5da24cso4530539a12.0
        for <linux-sound@vger.kernel.org>; Fri, 27 Nov 2026 01:24:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795771444; x=1796376244; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=q1Uuv3s1OBKaJBzE3G5+r1JPdIOySBnabwRbvvXOjkU=;
        b=nx5xe6UAeTeMxVAyOoQtyhZ2he7JkDm/MJ8VuN0CTwLfOj3Kq9s8HM9PBYQiG9sLvF
         DxBMNjacBgW51PdfS65EKkpjwI8uRH1nQo70q98MPEAK/an/hyMXnqdvjF99VifjqQeZ
         kiPrveJZnkj/gAoCmvgGO4IDvVs3q/zMR5HXsSSaN+c7G+37Jt6T4ayn7Sp6cenIWr2p
         oRT9GQa2KpV2nD31988ej8xjounJNHAX2Ic9GL/eCPtDoVePFd7iDaiF5Mg3TaQXKnX0
         bPtc/UUfEei7WDQKVPSUJj8Lvu/oqav5FlzD2tIpk/jfbQOY3oi0Yzh7XEdhBZDNzPZj
         KiCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795771444; x=1796376244;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=q1Uuv3s1OBKaJBzE3G5+r1JPdIOySBnabwRbvvXOjkU=;
        b=VLTf7vsds2Xetdwj9MB5AAHZJkJxOIelKgyXaf2u/C2/TPxmopsexoSqm34kDoy2zU
         7rLDI0ejuwuax2/+d2Oe2uhpXmAOwYJL4uxjcl4DQndR1I1Y+/nhjpfUqRH0mUveUjGo
         5GsrmK1W6+C5BRl3bXULBjsogGaByYEa+aLkoMy40eijP4pvRRxNc2asXPbDhLacI9zh
         UPoG5uWMfrhc1ZcAcnwOXNV7xWbBtG4pH7LbFZf1DSHfzWQ/RTLBRHqdgQWrmeustaD1
         riMrfSUu9w+Mu/T5NYGOZOak74UFra3yvpscYD9E3aW90hl8zlENgWplomanqWA4HEtE
         qJCw==
X-Forwarded-Encrypted: i=1; AL+hErHDK9SQQ7jt93TuhZZ0TiqMKnW+5bugmdh8gvK0fy0gXI0PUfZbIPd7IwKhKTuk5gVMKjvyoXU6kKuzwQ==@vger.kernel.org
X-Gm-Message-State: APuU4Z/AqVd+yruEathNW8pN0dNuBJwmJjA9VkrUd8rml6duSSYsAxRF
	IB1KtMiqrIklDxIh87+ixRhfFXaACC0YFy1nYU0Ih7wcJTllFs7yl767
X-Gm-Gg: AZFdTZc3sySgQbnPkgBH0QjjYInPXNtNxxRXMYHc3ivgejpmmoW0y0hEWLAKvYqP+Nb
	eZs/PeCjloKjDHxOK6eilYlzG8dgTiz0h7uSksIm0MdtuslYHZMjcor5DV9f2U3/toXgsUt+3Ue
	+NS703YFRY1iTFPegBgBbYkLjuCbpJbm2J95oSu0TaTSLGP0mNSsUskC+T+helMrlSonTxJ1epX
	7aL+6LM8okEb85Xf9hE2QxEYDOPUh6QKHMHwf4LW8PKeN7/pfeDDEzwSzdoseQOznUjM8H/l+ZI
	15XI5mCM6sZSuaWLtZlpwZPpfdYr+yGu4Fqmv3tQWmKkQvTLmXzfr4pIxB47itTwAkSiBAoMHrS
	qcOjfTEV+2P0cj+qV4E0kiE9cS/Go83ZP2g9CrTyBYXe+3/NX78A0ZXLFke4ae75jQO2ZlYhj9P
	LBUVRvUbsIM2uU/GjLWtVXyO37yP9c+fvtb8tq6hAdz9PoPptI9YzIroX9/Q/Pw9yytBZOhTFi/
	MNdF8BxY1sZEnpqsXkytduhwCos8TwB/WFfVOT81cRvebTEWbbqR0zHyByZZeQcyoE5yN0JtWTQ
	mEzBltnFLq/my4llZWy5giwL80BqizB15upf6x47Xak/6N5nvrOWlMl4qWW2jgv3QOjG/I0PoMd
	5J8Fb+87nTrvn+yB+kCKEUkYqn13LKd22nRn5X50YcIOX+9n2wcUHqbh5uN4g/32jHw==
X-Received: by 2002:a17:90b:4ec4:b0:3b0:9a0d:b825 with SMTP id 98e67ed59e1d1-3b41cafdb88mr22056327a91.45.1795771444055;
        Fri, 27 Nov 2026 01:24:04 -0800 (PST)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b41ad0a33fsm37942052a91.6.2026.11.27.01.24.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 01:24:03 -0800 (PST)
From: phucduc.bui@gmail.com
To: Mark Brown <broonie@kernel.org>,
	Olivier Moysan <olivier.moysan@foss.st.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	linux-sound@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH 0/3]  ASoC: stm32: spdifrx: Fix resource handling and startup
Date: Fri, 27 Nov 2026 16:23:42 +0700
Message-ID: <20261127092345.12383-1-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
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

Hi all, 

This series improves resource management and error handling in the
STM32 SPDIFRX driver.
It also fixes the refcount handling on synchronization failure and
ensures the clock is enabled before setting the substream pointer.

Compile-tested only.

Best regards,
Phuc

bui duc phuc (3):
  ASoC: stm32: spdifrx: Use devm helpers and drop remove callback
  ASoC: stm32: spdifrx: Fix refcount on sync failure
  ASoC: stm32: spdifrx: Enable clock before setting substream

 sound/soc/stm/stm32_spdifrx.c | 87 ++++++++++++-----------------------
 1 file changed, 30 insertions(+), 57 deletions(-)

-- 
2.43.0

