Received: from smtpbgsg1.qq.com (smtpbgsg1.qq.com [54.254.200.92])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A889F5227
	for <linux-sound@vger.kernel.org>; Tue, 28 Oct 2025 01:32:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=54.254.200.92
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761615157; cv=none; b=IrSjCrPtV3+a/YUsTh/buXj0tPRcazaAdkavrYBRnw7DzZObwYV69cEpEUhnVfBnL+jJL7SYk5ISsHkNbxb4Ajh1ZSpnGqKdU2NVfUxIgb61kQ1WFuvb8NCCYkxy9Mj3SjcMlCJ30s+ANeDDtT0eGPWVSUUrFpjR6kx5KsYQvqw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761615157; c=relaxed/simple;
	bh=qOmd380iXlJDWlWR9Xlc5Z0tovU3eJ4ZmmZbJEfhhLs=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=tQRBGzgABPOlEDVYuK4welrNbZ3n5Ij9kT53xpRv3yZuRRudHlmR35datwoExZyeXMgWZ/ZNzCq0knFFHzjEiYFT0JKAjXDFHOzH9I70CLi/NaWy9tDa6D9XxU7UvxXjFjEzZfvqdlCxxqdWA4RXtIXd0r6i9dL63RF0LkFD0g8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.spacemit.com; spf=none smtp.mailfrom=linux.spacemit.com; dkim=pass (1024-bit key) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.b=UkkZXy8h; arc=none smtp.client-ip=54.254.200.92
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.spacemit.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.spacemit.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.b="UkkZXy8h"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1761615149;
	bh=JV2sw478GwgVmAvh9ZYNj7weQN2ACESG19aqgi3tUF0=;
	h=From:Subject:Date:Message-Id:MIME-Version:To;
	b=UkkZXy8hXVM6qvkcnLOn2Icp8OOgFIoGrJSPUrSU9lWDatdZUCBh/AMPdiIUkE/VW
	 AYkd523+7u61iDV+tx/ZZcQSE6+NmvteaXI2W3tBBqP8KWBd02X/6ULb1Ljy0C3bx5
	 E4VkkgsMGQ+sxybdXqOt66TLKobVJ9AXUYK/MHQs=
X-QQ-mid: esmtpgz12t1761615147ta74469fb
X-QQ-Originating-IP: 8wCQ6xC5UakYb8SmmwWGhNtmwz8bc9zXXh/aSm36HwU=
Received: from = ( [183.48.246.218])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Tue, 28 Oct 2025 09:32:25 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 9672489745579195001
EX-QQ-RecipientCnt: 13
From: Troy Mitchell <troy.mitchell@linux.spacemit.com>
Subject: [PATCH v2 0/2] ASoC: spacemit: fix build warning and error
Date: Tue, 28 Oct 2025 09:32:08 +0800
Message-Id: <20251028-fix-k1-i2s-v2-0-a547c15ed5c3@linux.spacemit.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIABgdAGkC/02MywqDMBBFf0Vm3REzGl+r/kfpIsRJHdqoJFYE8
 d8bupK7OlzOOSByEI7QZwcE3iTKPCWgWwZ2NNOLUYbEQAVpVVCLTnZ8KxSKWJIuqald23Q1JGE
 JnN5/7PFM7MLscR0Dm2uiuiYGI+jZ46YwTTvtFFvqKnP/yPTd87gYy17W3M4ezvMHD08po68AA
 AA=
X-Change-ID: 20251028-fix-k1-i2s-3253276f8796
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 Yixun Lan <dlan@gentoo.org>, Jinmei Wei <weijinmei@linux.spacemit.com>
Cc: linux-sound@vger.kernel.org, linux-riscv@lists.infradead.org, 
 spacemit@lists.linux.dev, linux-kernel@vger.kernel.org, 
 Troy Mitchell <troy.mitchell@linux.spacemit.com>, 
 Dan Carpenter <dan.carpenter@linaro.org>, 
 Stephen Rothwell <sfr@canb.auug.org.au>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1761615145; l=983;
 i=troy.mitchell@linux.spacemit.com; s=20250710; h=from:subject:message-id;
 bh=qOmd380iXlJDWlWR9Xlc5Z0tovU3eJ4ZmmZbJEfhhLs=;
 b=9G3DYpc2xt8cUtQdYiNu+NtFBEk+OlPqTrDLNxrZ3ciGpOv7smxp+5koz2bO0eHJpkmLFgtHp
 xHqPLE03bt1CT18jTzuBBLkaIamdcgfTR+wtiGPtwQentODahg8K++b
X-Developer-Key: i=troy.mitchell@linux.spacemit.com; a=ed25519;
 pk=lQa7BzLrq8DfZnChqmwJ5qQk8fP2USmY/4xZ2/MSsXc=
X-QQ-SENDSIZE: 520
Feedback-ID: esmtpgz:linux.spacemit.com:qybglogicsvrgz:qybglogicsvrgz3a-0
X-QQ-XMAILINFO: MCk7GSmjSGXyko7IypzIlZB/rFxSff8Sy1xHi3TJ+KhEWginf3yF90sg
	rl3EsxGER7MNdeXXTLpMGknnEvgFEWsIdauMIVcNrAzNZ2NPjdFj46Z2YAKEk1PlV2mI3XF
	IBsP7SikAzvj8k83decgfzeZNxTlRbj0hWi3AS3TJpgsBME8GfHS7+6/MuYEpsIyhI+jzsb
	1OK05Sf0FIcNMYOWB2tzvwbOPO/1AcrTLFXEIbg1hi4Af43HV2RLjv/k94+bi/HZRfnd7Kn
	PhtJj8WFu1PeXVnfuFgvrueE0ZWiOqs3YMcrktGW526Mr/7GzxqdncjFeKxTy4e8u23CpFp
	98e165sLZ6aw8ABlAyK32m897usYcnje2ujSAzBo8khswY+IU26lCXVrhJ5WbV5rZgTbfPt
	VC2fiuOK1QQzoMcnxNgmdl4J9tTMMtJbs1cgsh2SVd5+CXywEKrxiXem+vmIMAW62q7bGQ4
	ZxTtcumbzJyVyD3YD5JQmSTIsjEhCY6rfCqp1bOzgNHiN7seBXZGi4lecYOyuxjyYgZiePi
	aa5c56R2FSlQWiLXLzTJD3EyH4r1pIw45+oX2LVoTBCTR/frBXq90oVCKZzPKF1iXFj77ju
	a6xopIzyh4zQiEGDVaLDIdOz7+LP22kF7xLD4B2d3jO2Ip+9NRqNQLNk0Jnebuq7ulkIaah
	FeAiMwYD6fmf7MPiQy46cZg9qK5OoW3ZFDavFPI+KoR5T7QGfC5AdIDrrxT+4hgVJEOBU69
	BLFDCFEUjiPsdoJngX9J3r/mvQmIyRjygPdooi+RCjUJ7nyYR5pM4swYuDpNvob3R5HK1pp
	T0+9lWxNzzhG1dhWz/QnCiMYaxSHj04QkqQcH+nXxvSrFJgOec6XMMP+HeU/bBv5JjJdMmz
	TKNIifSMR0S2cHMQhHk9y/Kz/dufMVgyNDfiTcSh0UJPkasOSuGWsJDVgtVbkd0rZZQnaUj
	x/0F4qDtNgcJy6/6wwPs0LwBzKwLRWaHewS8oz+FiLKe0CycYegEwMOnlkg8QMNbpaExmF3
	nEXqaJS5GFNA4cmBFQbxPNjq1j/SoW/5ZtfeZ4MzGPbCoaKgaVAcEPGryY3qtns2cvr7pDu
	A//qwbHugdWhxwiiQ0aTG4dKg6jPs5CBV1yjLlnNP3DAWTa4juMqa/BCBQECatMPA==
X-QQ-XMRINFO: NyFYKkN4Ny6FSmKK/uo/jdU=
X-QQ-RECHKSPAM: 0

After the i2s patch for K1 was merged, two issues were identified:
- Missing error handling for the init_dai() function [1],
  which is required since the function allocates memory internally.
- The Kconfig entry ignored the dependency chain of DMA_CMA [2].

This series fixes both issues.

Link: https://lore.kernel.org/all/aPtiNCZ_KBezL2Dr@stanley.mountain/#t [1]
Link: https://lore.kernel.org/all/20251022141705.714b19b5@canb.auug.org.au/ [2]

Signed-off-by: Troy Mitchell <troy.mitchell@linux.spacemit.com>
---
Troy Mitchell (2):
      ASoC: spacemit: add failure check for spacemit_i2s_init_dai()
      ASoC: spacemit: use `depends on` instead of `select`

 sound/soc/spacemit/Kconfig  | 3 +--
 sound/soc/spacemit/k1_i2s.c | 4 +++-
 2 files changed, 4 insertions(+), 3 deletions(-)
---
base-commit: 507d05188939fd47c9a11c3ab647f7db1bbef58c
change-id: 20251028-fix-k1-i2s-3253276f8796

Best regards,
-- 
Troy Mitchell <troy.mitchell@linux.spacemit.com>

