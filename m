Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.174
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794803214;
	b=zzcctz32kR4BAc59JZL0sTOs7UUe6wJCgnPyedIoOguKSrIXHs+Bkab+0on/GODjKpBa
	 wtdtAwVVhTR45WtflUC/2HP2VhuYvFJHvYZQk91XzhxF2KFTfByfvTSlsHYkQKzTVe2Lb
	 SVY/mIdFaLBjUxZZ935t2zu2aRumxKYannmAZaFYygebdzr4s9r8HZQvjOc+A4q2Puvw7
	 uMjKB9pdl0QqCGVz1m1elOqmXdoJ4L6NeBO2dZOVLo2uaQd/AJ9cqJnL0IK1TkheM3nBz
	 n/QvNfOChRKEhhtTlUyOmPXIPZ+Ld71rEXPil4t2mZ+M2oKRXbp58kz0byrP0bof7pg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794803214;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=Ncn3Uh93DO1XOndirHgHGxexD/qxamHF0C1Hl9kfn8k=;
	b=5eNB1Elvt1gSyrlNHCnH5OZDIzZpt2L/QS1z0M8p9ZeR6Ok/ofGSSxL8yLebc7Fhgetn
	 dvuzZCamM6/wBq3euayacn0wVBtDjHqJMd59zPxa4teSLQUidBczB3+ghydKRLKYiJH10
	 vqpfFO98eYzfqIAAeSuZaG/f97WM3M+ewkQSVH6h0uTMF8jfN/TiSIUBl0R6pWHie5Tlj
	 KBznTTHxGG2pFPxH2s55MtQv4U0SdeFMilkj3Z64RdMjg8ZAWI1f9pvEMspifIDBVK47+
	 zoEkdBP9E2Ip8MUjv7l6YuyxP5KYUPFjBZxbDpaTuRhivQCAVe3dHcOlkUr+Kj9VyGw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=aP3Ww7e5;
	arc=none smtp.remote-ip=74.125.82.174
Received: from mail-dy1-f174.google.com (mail-dy1-f174.google.com [74.125.82.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31AAB606A31F
	for <linux-sound@vger.kernel.org>; Mon, 16 Nov 2026 04:26:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 31AAB606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=aP3Ww7e5
Received: by mail-dy1-f174.google.com with SMTP id 5a478bee46e88-37198ed3727so4573135eec.0
        for <linux-sound@vger.kernel.org>; Sun, 15 Nov 2026 20:26:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794803212; x=1795408012; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Ncn3Uh93DO1XOndirHgHGxexD/qxamHF0C1Hl9kfn8k=;
        b=aP3Ww7e50cv3jnIO7KWkHTl6lutK2933t8INJUv7OZZum7NzMaO/TWusjU69vIFEAu
         yi/42o98IDYPrCmV0UJq29ozY99J+hGkHMUzX8PJSuAuzMpBBFHv/Nb3o08UMP/TcKll
         WWGQFnoFi6iB80+ExcM9KFnRs3VUfRiZZKdRbc7uPaDnbw4JZhjOUtUiVzMuvjHo+YSO
         MQzJ+8FRl9/acM8Mp2G3xcokg76/kjgxl0ckrWQfIMTYbotnCONzlONoeIefhFt8xMeP
         DwW+Pm8fYWpVaSmpVX3QvU86JXOTV/TyTRrrv59KXVoxOSMg31TIql4uWIDNcw2jh1af
         oVGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794803212; x=1795408012;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Ncn3Uh93DO1XOndirHgHGxexD/qxamHF0C1Hl9kfn8k=;
        b=jjE12eF8V3LSSyaIH2uK8WdxJNtuaiHvsh1Hj5TX9mZjhzLVe0qnHUOsP55bLG3isX
         FLf10qEXxb3CjPQG/kIkrhYoIZpBQzDwtXJEnQO0pHiD5hww1U3JrjDAqzvd7VtJD5wl
         J3vfvwhbFPlRagK0N75NqpHwF2c9JK/lX16w4LpMNsktjsCP9v+dBmYpVtMRwKO53jl2
         zBbzMQeapcSgNI47r5AVRR7cD+SIwU75zaykLQJX0727aDMxMupSqi42tCBQNUHNDXP2
         Q87A7vnq35ACW82iRNWllgwjwagrW+9GoCTLoWgychC/X2zDajNSQ/CcsalMgxZm8Gto
         ZCRg==
X-Forwarded-Encrypted: i=1; AL+hErGlGz0CBMq3iMl8z+nI6EVKorH2QmpgdalMv9dByX4LXNW6pJkb0HBNxTjNi41A4+qWMHpeZ9zHwgYNrQ==@vger.kernel.org
X-Gm-Message-State: APuU4Z86Egl64cjCfZyxn6N7ZhUalbPTVPiJrsOWBGQtTMdD+yhmoaZB
	TPenL1n/nAvSRZ76dDGOSDS/thCNU2SKrNMbxJ0IjBSyRQPB7qx6cYnp
X-Gm-Gg: AYBFou2aSzJcp4ySKcDEHbuAgExaWBJbkF6U2v9N4bQ1vF4VitsGV7VZp7iRA2Pp/UF
	SZOzWuykuDcY4/8ag/oEskrhxZtTgzKAyi2n4Ci/HMwhmb+Ul74BCVKoT+6vZYp+DPwxPPyFojx
	24zQIxz3vAsPhZxr1nSc1DjKdOgF10t/EBXci1UpX6uvQdUBcotT2thc5nf15N7k1V9W8OhY3Ah
	dGkKVjZXjQu3fRXnnhyZU0g4M0lGeS8p14aAjxQMQdsQFxVsf/xV2MmQ9ORUbVddjupO/1hImo3
	AmX6bCzUX7v6Jrve82xak6f7tVvs61SeCyT5Av65y7Olivt82lFNs/89lxF1HCX2jurtuGWkIO5
	UUSBgtqHg6tDpMIVrBrHW/RQQ2kxg23frreXdRAp9bOYhpBM01skjlG0WlxY8TyvnFGu0uGfVQ2
	Uto74/dHNJHzpmgMYStjWEzP8GRhkVVDc5N6iHKU+0FIDgMPooCSUC1/WOOljmF3+zHyoyRorsD
	+dxMyTJzvkTau2NNDoi2fBdUg4NDCWCoPifdtw6xFixIuo7AxREM3kxQA+Bm748Y3PlTzt672AD
	9NzSuXniNuRIwVMcjShytjAB0iHkL6XJ8AmtgNwSKXAy5JYc8tb0ScTDi15it/jrCYosh7si0rc
	EqTkTm0eveNFFQMjYAzLSED5HJhnuRJdsK1qkcnJ2stQx
X-Received: by 2002:a05:693c:63cd:b0:36d:be15:2dd6 with SMTP id 5a478bee46e88-379668667ccmr8906944eec.11.1794803212184;
        Sun, 15 Nov 2026 20:26:52 -0800 (PST)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3795591f4f8sm30053500eec.13.2026.11.15.20.26.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Nov 2026 20:26:51 -0800 (PST)
From: phucduc.bui@gmail.com
To: Mark Brown <broonie@kernel.org>,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>,
	Andrei Simion <andrei.simion@microchip.com>,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	linux-sound@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH v2 0/2] ASoC: atmel-classd: Improve clock and probe handling
Date: Mon, 16 Nov 2026 11:26:31 +0700
Message-ID: <20261116042633.497423-1-phucduc.bui@gmail.com>
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

This series simplifies probe error handling and fixes the 
peripheral clock lifecycle management in the Atmel CLASSD driver.

Link v1 : 
https://lore.kernel.org/all/20261113103727.30449-1-phucduc.bui@gmail.com/

Change in v2:

 - Rebase the patches on the latest for-next branch after checking the 
   Sashiko review page and discovering that the patches could not be 
   applied cleanly.
 - Use dev_err_probe() for devm_regmap_init_mmio() error handling.

Compile-tested only.

Best regards,
Phuc

bui duc phuc (2):
  ASoC: atmel-classd: Simplify probe error handling
  ASoC: atmel-classd: Enable pclk during probe

 sound/soc/atmel/atmel-classd.c | 50 ++++++++++------------------------
 1 file changed, 15 insertions(+), 35 deletions(-)

-- 
2.43.0

