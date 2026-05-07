Received: from smtpbguseast2.qq.com (smtpbguseast2.qq.com [54.204.34.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CE3135B644;
	Thu,  7 May 2026 07:33:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=54.204.34.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778139221; cv=none; b=TWSfGfGU2GcJku0FBXmj1GBWilzWSIh2TlpuioVfM8+oTAQNdL3yKQxfc7zSqxEs8EZph0W/7BCPE+fUmpvDQEA9mrFm7ShDfiXixQubtWx3jWjQD5gyfwgDYSREJHZ78iFiYNpu6SMlDoTh3hNgXgq8sBdzIQfR0bF49yushr4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778139221; c=relaxed/simple;
	bh=gaZkV3ycFARSrKwMTq79k40MPy9fuqRXNEp63djnpig=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=Nj6s0jhM+gK60751JpbEXSBtmi1o5F+g276OzC+QqsaN4BAWdIMWVbwxrI/RcKCdFivhteGzGoiij4FSWwzvkMfFYxsLiZjMgmOw1/XMmyLBVzKVnkNqSCrMHK7VmOPUiL0TbUDoTc996MNyjDMmVi2ZzyB7iz551d9sCfTDFR4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.spacemit.com; spf=none smtp.mailfrom=linux.spacemit.com; dkim=pass (1024-bit key) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.b=Yep99Z8A; arc=none smtp.client-ip=54.204.34.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.spacemit.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.spacemit.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.b="Yep99Z8A"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1778139199;
	bh=/z8CCUOGvHpoH70t6B2KPfC0Ot+ROjJINhi1y6OoEtU=;
	h=From:Subject:Date:Message-Id:MIME-Version:To;
	b=Yep99Z8A3palxggJQSkxgQ9gavQtJE9wCCba/Y4lvYsWLTjGagvv09ApbIjaR6ohu
	 eFg4kaRAmyq/5imB9+MEEdyIohA7PE34AvFcjeyC0dqCMREufjcRpP7sbqdCyfVX6Y
	 xe47jFdDtMEzwUwyNgGbn5jPMCAxxvyW0Uu6cNsE=
X-QQ-mid: zesmtpsz8t1778139194t8a4b4886
X-QQ-Originating-IP: fwNzxLjSkQR/NKe20e7jVejxzRqkcOcXghif0Al22BQ=
Received: from = ( [120.237.158.181])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Thu, 07 May 2026 15:33:11 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 18142673450067718002
EX-QQ-RecipientCnt: 15
From: Troy Mitchell <troy.mitchell@linux.spacemit.com>
Subject: [PATCH v2 0/2] ASoC: spacemit: add K3 SoC support
Date: Thu, 07 May 2026 15:33:08 +0800
Message-Id: <20260507-k3-i2s-v2-0-9cdbf95b7533@linux.spacemit.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/zWNQQ6CMBBFr0JmbUk7Iogr72FYQBlkVArpAMEQ7
 i5gWL7k/fdnEPJMArdgBk8jC7duBTwFYOvcPUlxuTKgxlhHmKj3WTGKumBOaK46ieIYVrnzVPG
 0hx7Zn2UoXmT7bb0ZNUvf+u/+NJrNO6LpER2N0gorStOyMIZscf+wG6ZQutxSw31o2wayZVl+b
 Veg6rcAAAA=
X-Change-ID: 20260427-k3-i2s-52ae21807466
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 Yixun Lan <dlan@kernel.org>, Jinmei Wei <weijinmei@linux.spacemit.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-sound@vger.kernel.org, linux-riscv@lists.infradead.org, 
 spacemit@lists.linux.dev, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, 
 Troy Mitchell <troy.mitchell@linux.spacemit.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1778139191; l=1882;
 i=troy.mitchell@linux.spacemit.com; s=20250710; h=from:subject:message-id;
 bh=gaZkV3ycFARSrKwMTq79k40MPy9fuqRXNEp63djnpig=;
 b=RMN4TqCjAj/qHKBOyiM3CT2YI3t71uSVDl2c8KSTGZIcgTj7zJUVROQagnDLypbe485vsjhAQ
 u6pHPyo3UVdArpF+udPa+i/CTg7VDU53shKWgnjR3FVGa3JJ+xsX6eO
X-Developer-Key: i=troy.mitchell@linux.spacemit.com; a=ed25519;
 pk=lQa7BzLrq8DfZnChqmwJ5qQk8fP2USmY/4xZ2/MSsXc=
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpsz:linux.spacemit.com:qybglogicsvrgz:qybglogicsvrgz3a-0
X-QQ-XMAILINFO: OaEjz/uFifOelsMweOseJ6e2f0/fMaYsNqivnHlJzCTjXrjWZXbT16uy
	f1fRnSk7nUA8ZLLTWhTQI+oxMT01d1Xp2C++nk6vaaIyZNSB3Vb4zDNbmk+ek3JEsGcz9zV
	alLsC0qZbBt9dPoAcFBuXJeIoNLkrNSE1s2KlOfQM8CMLM44vpPTC+GQ1wTFoPl/N2PAjiN
	/h7i/1ompwFlFjXd2rL9AgU67G1BenVkWk9SikwO5WJu+fG7zFnurwRcSvIIqTHwzHZKZ/R
	mLH/2ibCwQ3xTI2dL1R6N3nvoYDaxzlRJPNeXpp87g3UiuiDqavk5BDV5IZxDrv5y2fr1Uu
	mwnkofMPRyX9wRPpv/MV4m1qSz4TO75xqBqkA9Ef3wS3I38euoyfi2EPLntFG3yVYK3ehP8
	8/lxHvS+m9NSqW5H1N2NSnk9XIfwoqhtExIJwHbvh7DFMTf3sMaKGm2DJKGcZoV+xClnXQB
	UH+AHdXF3SDOTVWh2S9WmkXR28RmEUemQqOJfF/6d/FUAQI+Ebv2iEfKDrwcQ4Muam6ceTM
	kUjrbME7tOf8wb33cEIudYtn8xeyP9d7r5waXm8PD5eNSRhD0S/jYpy0zipETw4xFzV/Ery
	xSTIYV8lgcVPB6I9Zk54tQCiqNhn0GNlLTnsS7P5qA2/uIzjz4U2+p+fPff9KHUmGLDjmWW
	FvA1ir7U+5Dcd9xCuy4U6kt/W0Ew5Dz1xJ69vXftOjKqSH4QgBX+Cw47cjfuLhEanwJqrEv
	nnnMNKHrcjaER6Emtiu0gPLDkdE91eR6h0y4sSHro0PtgukjiL9S2+J6nqH9SfTcRgyG4hy
	ePTFpmcdvXtYW0QTyCUVOO4oWgpxxYPRYTEwgY83wqsdnXrPcpsyL8U92careIoUGTK5Gx9
	ipZ7I8v3jCG1O2aKbIre2s/6Aq79tcjskMhZlMlqvJgtLq2ojEnJV/gEaMElVu5xpw3UsoU
	uQ74GkAwGcIJ3kCik+njDygUlwwyFmLS2bhlV8gPQXhHzfQ5myWbgEa9pTalatfVrxlQYpb
	W7LiBHPuGv8dcM+JMkLjoM1XiedMujAAvKw/Jek/CvhT/SSkHAfQ8gd7Ez/5dFmZZbwIda2
	DlbAroBNK6dl843qDC62V9ec9M0dsTdi8LsiSKN2dZw6y0eNtrVdTpGb3nOra/gbqlea5lt
	WT8C5mOm+olCR9OVwd6cyH9RrbKYWDi+Dy7g
X-QQ-XMRINFO: OD9hHCdaPRBwH5bRRRw8tsiH4UAatJqXfg==
X-QQ-RECHKSPAM: 0

This series adds K3 SoC support for the SpacemiT I2S controller driver.

Patch 1 adds the dt-bindings for the spacemit,k3-i2s compatible. The K3
SoC uses the same I2S IP as K1 but requires additional clocks
(sysclk_div, c_sysclk, c_bclk) that are shared across multiple I2S
controllers.

Patch 2 adds driver support for K3 SoC with additional clocks.

Signed-off-by: Troy Mitchell <troy.mitchell@linux.spacemit.com>
---
Changes in v2:
- Drop bug fix patches (1-3/7) — patches 2-3 already merged, patch 1
  split into a standalone series
- Drop fixed-sample-rate patches (5-6/7) — will address shared BCLK
  constraint at the ASoC core level in a separate series
- update commit msg (1/7)
- Add rob's tag
- Link to v1: https://patch.msgid.link/20260429-k3-i2s-v1-0-2fe99db11ecb@linux.spacemit.com

To: Liam Girdwood <lgirdwood@gmail.com>
To: Mark Brown <broonie@kernel.org>
To: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzk+dt@kernel.org>
To: Conor Dooley <conor+dt@kernel.org>
To: Yixun Lan <dlan@kernel.org>
To: Troy Mitchell <troy.mitchell@linux.spacemit.com>
To: Jaroslav Kysela <perex@perex.cz>
To: Takashi Iwai <tiwai@suse.com>
Cc: linux-sound@vger.kernel.org
Cc: devicetree@vger.kernel.org
Cc: linux-riscv@lists.infradead.org
Cc: spacemit@lists.linux.dev
Cc: linux-kernel@vger.kernel.org

---
Troy Mitchell (2):
      ASoC: dt-bindings: add SpacemiT K3 SoC compatible
      ASoC: spacemit: add K3 SoC support with additional clocks

 .../devicetree/bindings/sound/spacemit,k1-i2s.yaml | 31 +++++++++++++++++--
 sound/soc/spacemit/k1_i2s.c                        | 36 +++++++++++++++++++++-
 2 files changed, 64 insertions(+), 3 deletions(-)
---
base-commit: f58f2e0137c2132a08a1ab42720a9540cf0093a8
change-id: 20260427-k3-i2s-52ae21807466

Best regards,
--  
Troy Mitchell <troy.mitchell@linux.spacemit.com>

