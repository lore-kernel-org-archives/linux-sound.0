Received: from mail-wr1-f67.google.com (mail-wr1-f67.google.com [209.85.221.67])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B39B2328B62
	for <linux-sound@vger.kernel.org>; Tue, 27 Jan 2026 18:48:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.67
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769539720; cv=none; b=E5IsO4Wlii3tCZgEpY7XpcJj3FGc3BuyvylrJwFnKMsZ9jeKwH/o+sglE0/SXiFmxJJ9OkpU/G/iPZ0qxK/4tCOp09btNnXHUHhwQ3ub/6IklHhzQ8LsDwRjArwmz4Aza9J3qxHuVIchmrr0TY5dVeghNVTKGJJwgkbafII9uvM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769539720; c=relaxed/simple;
	bh=nzQYk89pkPHGP6R9yMxHj/NHVae7UpktsR44AHN8qy4=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=I46xct8oEWWtHP1i4B/kpP0YbRi+BOs1ZX/3zULZLmhmzHjJy5sbS/wn7Mpb+W/6efafEKCv9ScreQ+Ww8LykoKeuxIiissHDu8wL11W7741I1EY8mqBb+x/FV/U3cp2tzrshdG85cQNvCbNPUEaFDuMMJr6R4IMoWHWkc8YztE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=epzsbAsv; arc=none smtp.client-ip=209.85.221.67
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="epzsbAsv"
Received: by mail-wr1-f67.google.com with SMTP id ffacd0b85a97d-43284ed32a0so3617763f8f.3
        for <linux-sound@vger.kernel.org>; Tue, 27 Jan 2026 10:48:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769539717; x=1770144517; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=KIPiKXcszSKqC5Pe05TjPejSszZASfo0tqdtxtTf+sk=;
        b=epzsbAsvIL55VNst4EVV0B8A6Pj6Ad9utKHW3U5Qaz4oZWtEjMc1adQg2ZV3hg5RlV
         btB6VhRTtBxzjWLK1Xm7uB4vxyToe6k0ynlmSZUtvhQJSAcvtSvrR5hZIS0QhtYpX0KL
         Ci7JtBy09t31O8z+aoe04L2A+Z4whwu3kYKtg252SO+7ZGeS1fR96ROGY7jcm/XlcuUu
         ulENLSgkMzCGozi7CTClBGNdLU1XhYOEL69QwsrCdIhJeBWrCqhRsrp3+2/f4yZifjEV
         tW5ipoUEB0qsU9zxP2OVyzPAvLDo3yEc51mZ/7esl5GmPMfKqZJW/bXSXa2yIsLvmYGn
         KW0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769539717; x=1770144517;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KIPiKXcszSKqC5Pe05TjPejSszZASfo0tqdtxtTf+sk=;
        b=fjbsxtJy8KEnjLvtcOnDvmINMmDSFPtb1Hbo/rZKSuWa03S2s0eOigC2pa1XvHLJr7
         HDuHZLPTURtcohw80+D49TBTcwK5qxZPL11V0FLDL9oHUSddmzPbIqISBROafX0VtPPk
         tRXIX9U6dDg2KiqQgslaCpGqhd+ZkkS1FgUNNebYM0QjWfxT90z8zF9pPCBqugW8Jt8F
         7Ic9U2JZxYAA6t7FlxjCF0AL/OqzfL6PUSg0rxetavD7CjOY2Dr0uFG4oTLfGTrXPH+s
         0/4vMeaOV2eaAj+NA/jVHXPNQXTvxGrrhFi5cpslJ5/ZEB1Qzm/cxqKSqfJ9eJTqKbCt
         LTgQ==
X-Gm-Message-State: AOJu0Yxs0D2EEfRUYm8GHstcPQ71vV67XwUM5R1LkyJOKvYeNZPxzGI/
	pRZi2F1d1M8a+OZBWCQkOTcQhjna/M3VAfgzuA3msFVqF+LFZyO+YeSP
X-Gm-Gg: AZuq6aI2jtXu/fIZolQz3jfgfPKXcT82mAiO0ncHtCx4pCaEPZXg9QofNm+6XIpvw1e
	OPMN4Ge6Y4YbExZOnuvYfbxfxcnIqYGL3LicWGok1K5uPvK7vOh6AlC0Ni7jSrUbzPUvYGuWGCJ
	MFfU8LT56xpOguSg1QoXxqWtPAGbdfQNWA92vRid8ZljQjkl5ZxcuyD0ed8O7Bc1or5XhRtJST8
	QvFJRUbDm0a4V9Z0RAepqz7CKj5H9DMfvC8axswlDBPuNbbygqMjqSnN7STeJoCEYb1IApkCLDi
	yLEttKSdTUv9HeEjMfFZ65aaecsQa9pFCoAomGBpvokjgNQDS1m9OZXo5Es3UH9emzKdYeeodSI
	DFhwma/7LYm6jJEYg7QlvkJ1GYqjzs8Mit7uWXqXvVRlgJB16iu5ehsD4/qvkku8/gQ4WyKfdIg
	jlIUVnbDNSkP+3MLWXjadlGUG8SGibuCBc026pXETteJxEFIan+g2UKSM=
X-Received: by 2002:a05:6000:1a86:b0:431:1d4:3a8a with SMTP id ffacd0b85a97d-435dd02c1cbmr3380605f8f.7.1769539716838;
        Tue, 27 Jan 2026 10:48:36 -0800 (PST)
Received: from [127.0.1.1] (bba-94-59-215-181.alshamil.net.ae. [94.59.215.181])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-435e10ee057sm903100f8f.15.2026.01.27.10.48.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Jan 2026 10:48:36 -0800 (PST)
From: "Anton D. Stavinskii" <stavinsky@gmail.com>
Subject: [PATCH 0/2] ASoC: sophgo: cv1800b: document DAC overwrite handling
Date: Tue, 27 Jan 2026 22:48:06 +0400
Message-Id: <20260127-incremental-for-i2s-dvier-v1-0-431b809c632d@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAGYIeWkC/x3MQQqDQAxG4atI1g3ELJT2KtLFdOZXA+0omSKCe
 HcHl9/ivYMK3FDo1Rzk2KzYkivaR0NxDnkCW6omFe2k1Z4tR8cP+R++PC7OpoXTZnB+InYSRPS
 TEtV+dYy23+/hfZ4X9B0UuGsAAAA=
X-Change-ID: 20260127-incremental-for-i2s-dvier-9ec60a002bdd
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>, Paul Walmsley <pjw@kernel.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>, Chen Wang <unicorn_wang@outlook.com>, 
 Inochi Amaoto <inochiama@gmail.com>
Cc: linux-sound@vger.kernel.org, sophgo@lists.linux.dev, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-riscv@lists.infradead.org, 
 "Anton D. Stavinskii" <stavinsky@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1769539713; l=880;
 i=stavinsky@gmail.com; s=20260115; h=from:subject:message-id;
 bh=nzQYk89pkPHGP6R9yMxHj/NHVae7UpktsR44AHN8qy4=;
 b=TJUZT6XopIns2Aq1PkC0y8MR1LmYdMKUSI/PbXI4JnKpP2YxaJmJzDyKFryrDuINikpNhjQxd
 iDhtmZXTcl1BljB5y3BIqfBw/HkpuDVmV3Ugvi5lxIm5dhKFwA/yPv1
X-Developer-Key: i=stavinsky@gmail.com; a=ed25519;
 pk=2WxGZ1zd1vQwSPFCSks6zrADqUDBUdtq39lElk4ZE7Q=

An incremental patch on top of 
"[PATCH v4 5/6] ASoC: sophgo: add CV1800B internal DAC" 
adding the explanatory comments as requested.
https://lore.kernel.org/all/20260120-cv1800b-i2s-driver-v4-0-6ef787dc6426@gmail.com/

changes: 
 - added description for cv1800b_dac_mute function
 - fixed "extra change" from previos commit

Thanks

Signed-off-by: Anton D. Stavinskii <stavinsky@gmail.com>
---
Anton D. Stavinskii (2):
      ASoC: sophgo: cv1800b: document DAC overwrite handling
      ASoC: sophgo: cv1800b: tidy Kconfig spacing

 sound/soc/sophgo/Kconfig             | 1 +
 sound/soc/sophgo/cv1800b-sound-dac.c | 6 +++++-
 2 files changed, 6 insertions(+), 1 deletion(-)
---
base-commit: bdc79da6c6206a12c9a13ed5e4eb1360d62b321e
change-id: 20260127-incremental-for-i2s-dvier-9ec60a002bdd

Best regards,
-- 
Anton D. Stavinskii <stavinsky@gmail.com>

