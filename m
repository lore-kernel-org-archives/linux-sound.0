Received: from mail-pz2-f42.google.com (mail-pz2-f42.google.com [74.125.228.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98E953DEAC8
	for <linux-sound@vger.kernel.org>; Tue, 29 Sep 2026 06:11:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790662305; cv=none; b=Xz+7hjibK1lM8qLNeowbvorHNRyJsNr/UbOUO1HS+94BWoqCWr4SpxwKKqI23o+q6EhnATYpnfoN2luYUanwxzMbaZk2ZjA2fFWVVTXU6LEtqHdv2cP2qKrOHtGimGmSMmDF2PzXZzP5qBsX0n4x2MaCtqTe7Pt5kOAyLr89CEo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790662305; c=relaxed/simple;
	bh=RGYHV4Zn+Dn9B6A5MIGzROsX1KFS/3JS0nwwmfoW1QU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=qGLYXFSmiY2Ji4+EGBKxnBAlKHh+4DAn4snn8sAmfC8Xu10JAFkMcXLPwKxkb9d4YcD/oJIp7Nw8tO0flC9pDjwlk+4CAJilfTXxWLp/OIK2ogaqTjrinuThkJInpqCQmXb8P4txn0/ZF0UdMlmlapUmlh6RJI1uxV3fABImCSM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=T563v5G/; arc=none smtp.client-ip=74.125.228.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="T563v5G/"
Received: by mail-pz2-f42.google.com with SMTP id 41be03b00d2f7-cc4aa0f1a94so1246630a12.2
        for <linux-sound@vger.kernel.org>; Mon, 28 Sep 2026 23:11:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790662304; x=1791267104; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=lCOnM4BG9opzc/4UWmCexloGpdYaWaFpKWwedqDPapw=;
        b=T563v5G/+tAaVEfGh2VX/G9105H9pOYX0V82dmVdyagksFWtz2gSfWAxetGcMXU3kJ
         QaoBVom/gGl1pNDBSNa/YArshE9r6rODvOm6pb9DxNG6o/CVBB1LTXkeUmbRYf0yT7j7
         abID53wwP5UG15AzswoufaBt2/c3t6kGHsaA0R583ODi7lKM/IhXZMS+6p3A55s1VrfG
         IgdzyF+wkruRmblWXGF2yrV7wmqySdinMV1noPUAAPQRODfnCk2tOIjt4SFrY0gR173g
         5+EfWaf9EM2MB8h9X5GR1XMfiVunlhIS6FSmXYDYWR6OfrLyCBJhCxRykJbOqWe93N/a
         BAdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790662304; x=1791267104;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=lCOnM4BG9opzc/4UWmCexloGpdYaWaFpKWwedqDPapw=;
        b=KWzuOAFLlVGFgAl6bhiD9tt8eAelRvfxOzp+t9wfWU+HLQO/8M9vnrc9m2bUC63Vi1
         MCDWrU3K1nXEHumlZo0qPtmC7gbOrDdSZlPnzUpH2MR5RAs8UL7wjVaKzbaoXf35srvb
         vKpdvKDDmh6RI45H0MwY1XEeSarxKXe+A81R0oPHvgEgN0ppJ5+PLpZ3aO/uwCKqP/Xe
         iETTZ/ET3l6B3bGAMtCNjGncNrrmf7PDB69fne7F70nAbn+d7gOii+BhcBri3rnhVkta
         yw2/m/OEH3xGYrIePTDbHh+CanaM8EmZ/7cTpLWJgD2LI8Q3Vx8dxJM0CVZkPAjyCn7T
         KAoQ==
X-Forwarded-Encrypted: i=1; AKwUvBwiiAcURqEAu/2aZRx3/5vzcjJtSwSJnPQ7WWo+SNANQNFGeht2zzdQlIluhU3nFu5UlqaghyQM/jMIrw==@vger.kernel.org
X-Gm-Message-State: AFq9FYLhL65U03yGRr696SgPzRjho76vMnXQ8yO5DcYt8rd+IQ4EyTIk
	FP/pHwImDOoB+vrOhuZ8j2Gq61s9V+PypxaKcwKrNhJCL/DV+WWyWNXy
X-Gm-Gg: AYBFou1F/bXvG7Me5NEMV9rEVGzNUGPbxK/YhNNYS1bJt23Zfc88QgdF6phsd1ktVhM
	6Z0TVZgv/fkTisrSXzFYI1iBPxgyZ2WLgHks4PN/+xrAShF7N7a7R3bUR4FXK44n7xxIy4gVM5S
	oZP2Fq4JyuwRYA0/lm3YztPXXEDZn9cre4hCDKTNePiQMrivFV4iS1uUZXd2ol2ktXgN68ayxuA
	7jVlMohWw99VnPBbvERd4WonnbKWHe76iutRiyLT+Qd2dRiORJhwFxVjCjqUNvmxS17wUe8sYQI
	qifcUlAtn88tCQTTVjrsFdRZo2bUBdVHE4NCHj1qq1VWwVX85SQRzjeER8vKl3ipTnQyuf2q4gh
	5+mELuBrPhF6UFvbDsJligLNBfbx6zY7xohb3DFoNt4bwidSULZZJyE83yFiBE2/KZJTggioZD1
	RhmvmODVJQZBW1PwLAlg/EgDI92k98Nq537+scjTDB7glObr0TtpeWk543mFePlSR6/HbJ2aLNo
	ERk0t8p7TruP8HGoquHbfVLx339vWcr4VEEOuBwDwePKndr2dJiJPPLclg+ZBwwmhVKs4Pq6hjV
	6PuDXT542sQ5ng==
X-Received: by 2002:a17:90b:4c4f:b0:3a0:bf0a:c9da with SMTP id 98e67ed59e1d1-3a0bf0ad1cbmr11373686a91.47.1790662303866;
        Mon, 28 Sep 2026 23:11:43 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a498726d63sm3280965a91.17.2026.09.28.23.11.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Sep 2026 23:11:42 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Mark Brown <broonie@kernel.org>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Darren Ye <darren.ye@mediatek.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	cassiogabrielcontato@gmail.com,
	Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
	Liviu Dudau <liviu.dudau@arm.com>,
	Cyril Chao <Cyril.Chao@mediatek.com>,
	linux-sound@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH 00/10] ASoC: mediatek: mt8196: Fix clock error handling
Date: Tue, 29 Sep 2026 13:11:11 +0700
Message-ID: <20260929061121.124001-1-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: bui duc phuc <phucduc.bui@gmail.com>

Hi all,

This series improves error handling in the MT8196 ASoC driver,
mainly by checking and propagating errors from clock operations.

Compile-tested only.

Best regards,
Phuc

bui duc phuc (10):
  ASoC: mediatek: mt8196: fix APLL mux error handling
  ASoC: mediatek: mt8196: fix APLL enable error handling
  ASoC: mediatek: mt8196: fix MCK error handling
  ASoC: mediatek: mt8196: fix register access clock error handling
  ASoC: mediatek: mt8196: propagate main clock errors
  ASoC: mediatek: mt8196: use dev_err_probe() in mt8196_init_clock()
  ASoC: mediatek: mt8196: fix runtime resume error handling
  ASoC: mediatek: mt8196: remove redundant error message
  ASoC: mediatek: mt8196: propagate I2S clock errors
  ASoC: mediatek: mt8196: propagate TDM clock errors

 sound/soc/mediatek/mt8196/mt8196-afe-clk.c | 145 ++++++++++++++-------
 sound/soc/mediatek/mt8196/mt8196-afe-pcm.c |  28 ++--
 sound/soc/mediatek/mt8196/mt8196-dai-i2s.c |  17 ++-
 sound/soc/mediatek/mt8196/mt8196-dai-tdm.c |  16 ++-
 4 files changed, 136 insertions(+), 70 deletions(-)

-- 
2.43.0

