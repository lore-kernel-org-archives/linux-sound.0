Received: from smtpbgeu1.qq.com (smtpbgeu1.qq.com [52.59.177.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC38539989D;
	Fri, 22 May 2026 13:12:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=52.59.177.22
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779455555; cv=none; b=FI/jbm4ij9tcSasnfmCJMT6wYyEilwLeAtREaYge5vC0Ok/KMHkp4B/vn38jCcyU+8+ZKHHwXv45C9TY1ABtTbTvy995hYpCeY1gznToilLCU2GVwR9X2acLvr5hw4/GSgBj+EGT5qqVGelka2fayGTyDkDJxxv1lXofwojNnd8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779455555; c=relaxed/simple;
	bh=PtpF+cuIJUZq/GMFnyapf2U8HG58qtqnHkvpxeqSh3c=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=pcHnFwPGGsw4JhJfdmNdI2MNiImvicHifOBaYScsUs5IdV/zqap2CSXHLNmDCBlrPJ6oAvLuIwCTiHdzczmKBQo2g/Fh+RkMeZlARC5DoJ6vieUiMKC/JOGd49gaJT/mzOX3zbS9oTvhU1Zb2K7UNiMpj6jNkeiS5PqY0l1YnVA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.spacemit.com; spf=none smtp.mailfrom=linux.spacemit.com; dkim=pass (1024-bit key) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.b=XLH0VabN; arc=none smtp.client-ip=52.59.177.22
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.spacemit.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.spacemit.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.b="XLH0VabN"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1779455542;
	bh=Yh/ET9BIE0+DfHxutKWeEWc5++1D8UEwlk+vOWotn00=;
	h=From:Subject:Date:Message-Id:MIME-Version:To;
	b=XLH0VabNqqSaQ1iNDR1emeqoYit3zD/iIttqpLQXCTfum3sah/IAa0EgnQhLk/tNt
	 ZGRIfFEn2bRFITO0Tr6lB4dBw8hPu1KFcn4JO24APpl7j/0mRvuYzYofZeuzFuBuOq
	 jaAIuzj4a/VWCKDdjjufni9vggEYFJxC9gSoHVo8=
X-QQ-mid: zesmtpgz3t1779455537t7d74ee71
X-QQ-Originating-IP: IxTqUQlS3b6S7BGCxY9uBCCoeQZJ4+tCFShJs25qSqQ=
Received: from = ( [61.145.255.150])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Fri, 22 May 2026 21:12:15 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 8814191299974206583
EX-QQ-RecipientCnt: 15
From: Troy Mitchell <troy.mitchell@linux.spacemit.com>
Subject: [PATCH v3 0/2] ASoC: spacemit: add K3 SoC support
Date: Fri, 22 May 2026 21:12:13 +0800
Message-Id: <20260522-k3-i2s-v3-0-08e3eb811d93@linux.spacemit.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/22Oyw6CMBBFf4V0bUk7vKwr/8O4oGWQUXmEQoMh/
 LsUg25c3uScMzMziz2hZadgZj06stQ264gOATNV3tyQU7FuBgJSEUPGHxEnsDyBHEEeRRanKVv
 hrseSpi10uX62HfUdzeBtT1Rkh7Z/bZec9NweVXvUSS44lKhUoaVEo89PasYptF1usKYhNG3Nf
 N3Bz0/E9ykHq69MoUuV6CyJor/+sixv2a6YYfcAAAA=
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1779455534; l=2050;
 i=troy.mitchell@linux.spacemit.com; s=20250710; h=from:subject:message-id;
 bh=PtpF+cuIJUZq/GMFnyapf2U8HG58qtqnHkvpxeqSh3c=;
 b=lTteNfa6oOcdvZ49tS0OQzaY1PQEqdcFR/zGqzJDm+azeZdn0b1eUdD+QeiGs6e28rC2Juh0q
 LWCxiRIuQTOCrqijofRYzVLD6Y3xZgPyV6KDe7OTgPAkotf+1/o5gDd
X-Developer-Key: i=troy.mitchell@linux.spacemit.com; a=ed25519;
 pk=lQa7BzLrq8DfZnChqmwJ5qQk8fP2USmY/4xZ2/MSsXc=
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpgz:linux.spacemit.com:qybglogicsvrgz:qybglogicsvrgz3a-0
X-QQ-XMAILINFO: MCkyKwm7j5PFCJQRCKH0ABYqCP4gOK0HQSY7KSALSUDX/rc+vB+qIWyI
	WjqUGl6vISveEXexNbDJ1amdsJ1DtbJGR6sagS8HVHBZBVxMOidxmHw3sbQZPrAxBeQg0Ch
	YFQpLxO8pMhNVrE+ZDTl74heG7mLPFQUvQn8kv+ePtyJ451NdwveVw+AmOrm3ij3msdgfbE
	L3VEGebS7zl8+E/H1TmqKg/HvbZifpyPk7XM2qE8mLTCrXi2yB1yTWJMTx77QCCkwlD5+4z
	mWToSpwHM6fb4jndAUXhEEvWRuEfVz6uhO6XI9uNeCR2NU8F31ueSvGMW1OUTKzm1HODb6n
	l6mTR46IZfttkuSkz2EbtWUsed6aXPwoSE3stbA+XqlAtKeVIIsIYki0MscByrNAHY8L8HK
	A/YKMfuvHtxMyYG17mk2QcNdnZ5KjIEhk/XnzbuEfM/fvZvbv8UR9TQmQPyJzM9rOXA+4iD
	omSaFX8GEsQi9kvkqkkaAQo8HfaorEChGB9OQHPjWGr1NAXxT4MahtZ+qfjKAqcleogJa/S
	O+5/fh2/ip4hXE5U/0tC1aLkKMZOlBjVzdUN6aa3vKgQW1h1PRvzpK4MWsWP3Kix94gXQk1
	jgvXbqg81VjMf60xzRAmc9wRamf/q1aM0QBy/nvSQuL+SDCQNIxiwXN9f4UKWCJmxfi3JOE
	KuLaJ32BcTSm5uPEMUkk96HOd+5IcpGS7F1u54KMUF5kE6JPgqgppNZAGi3mAUIOSafCis5
	vZTfbiHUeO8XwVbx25KtTKDYq476Vik6RD9nCVXA7IpoaHF7eI+zVT22rKqch62rBIF3fs1
	YnYo1IvW0G1R1RNj4UDKnQ5PDqqd0V9V4e51jOeAhZgVjNF35134zSXCfgnHykrdE+mD4qP
	zR8jpctJ4cpoOGrXwXMN86ZQMfGjDzXIucawvUWlrZw+c+6Rz0WMxvERLIDUTDLI5onezzc
	xn++PFhQ/hlka+vKbkm5MZcMycgw7RCzNUMwvHPL3O2eqm+ebzyRlpRN+bhGYeMxM5jP0Xm
	eCKw+93dDWFgGxhtlkH/AQKDWtH/GU/5/vAFCz/J7SRK9G9rmKBcLzDa+Uc/3KupZbRpdPv
	stDejR4b4f/YS4eEeNTIwP5zj/EaBh2SfxXpL4lkUQJi6+42xraaW2ASRRjSnOct+du1HE4
	+pgnmgsD2m7ISP3IsSEC0oxpnuVK0ounCzOhLsm9YcO2nMM=
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
Changes in v3:
- remove patch 3/3, send it as a standalone patch later
- Link to v2: https://patch.msgid.link/20260507-k3-i2s-v2-0-9cdbf95b7533@linux.spacemit.com

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

