Received: from out203-205-221-205.mail.qq.com (out203-205-221-205.mail.qq.com [203.205.221.205])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7AE413F8EC6
	for <linux-sound@vger.kernel.org>; Wed, 27 May 2026 11:48:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.205.221.205
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779882510; cv=none; b=mEz2QPU1wIeUB3CiLUxRrJy9RzxEJP3s73n84LAhRo9lmagvB208beSyqc+F2jAVp+inRufZeSHzvaOG76gQV9cGFmRRtV75+K0gWXucJO98qEJiigQPKyVu9FjjNliyvVqzAoNQ8TFsbvB2UwQAdiWBWIDYFOKsveRdMeBZVBc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779882510; c=relaxed/simple;
	bh=kDh0yL/bwnjkLPRs5Myb//2zGu3cpQQEqQAImup9XPI=;
	h=Message-ID:From:To:Cc:Subject:Date:MIME-Version; b=QSclEjdSZ3jYApKx1XZOjqNCUpjpRvy8BzHjw4NlrDs1hjiLGOu2G8HWD+hp1MzoXnMn5ft2/XxbCzJOE2h+KJd4ykj7SEOMoUQ5zJ1g3WbxEa0L0Wy6X13dBESKJ3pFy3O3MayQp/uqE/rwAo+wTMmqEqYp3uQTzxQhOGrY6OE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foxmail.com; spf=pass smtp.mailfrom=foxmail.com; dkim=pass (1024-bit key) header.d=foxmail.com header.i=@foxmail.com header.b=iTQE5BZp; arc=none smtp.client-ip=203.205.221.205
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foxmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foxmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=foxmail.com header.i=@foxmail.com header.b="iTQE5BZp"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foxmail.com;
	s=s201512; t=1779882503;
	bh=xwXSiD680tG+qJUsP1svnObAGfrQTcr3HGP6k4wZkm0=;
	h=From:To:Cc:Subject:Date;
	b=iTQE5BZpKVzReb76sGwa7yDhf5vivjl0eHOz8d8sRpwjjdnxD1mDr/RsOFjDYLTsr
	 5Orx7GOD6VYcA4h6owpIWT6MwtOvye/uqMBaeq5uITMuQU8qxCP1TdEsvwtgU2Pb8E
	 b4MuYiQSZHCkvNRxuffT6fpi/Nmr/rDYMX0ee4cI=
Received: from localhost.localdomain ([116.128.244.169])
	by newxmesmtplogicsvrszc43-0.qq.com (NewEsmtp) with SMTP
	id C15A3CA3; Wed, 27 May 2026 19:48:21 +0800
X-QQ-mid: xmsmtpt1779882501tk3walhdi
Message-ID: <tencent_0F3DE20EB478EBC64534C9FD3183C865B605@qq.com>
X-QQ-XMAILINFO: M+5cKLn0wXDtKLMO8Dwo5+NIlh3darWu7UnJn/hkLnyTblm3KLNbwvzmlAuBRi
	 EfQqVdJXfAgX8QmyBXXf4AWiy4+SHSeTrK4iYZr+B7mCznJJJTX7H03xqnO6Fa1uGboKBr2sQbPX
	 HU5Mvq2M5wdqIfrC0oUjzl53ch8TGOjfmJpe1l6HMm7IHDKJQ/itn1AfNAQCUpCSSMQjg/940pcf
	 AJcLENOzTIY4til+ERUJPdql/968tEXmC9eZrONCwio5dEPj27Q3gQhLlZyhmB+ec8C0cNyyhSmM
	 acPLDVtuWdfKY2lQpXSnjzkKWgGJMWzB873hCXE+hjrqARNbYqEjDrGVrjv4SGFSOoh/YGzuViJR
	 d64jQ5LaFABY/qM4z2qMoOBl5jhs4VOg4PVXAdAl70IoPULEJgemzuh5+hA1OZQ9YTOHB7Gz00q/
	 MprZ/U24UHZNePIL4Ly06MX1fjyL3FOnCqF2Lr012rJib23EW6tl3Ij2/88ptbg252kWO+9MDiHR
	 bl4P/PsTcSHX4OKdO7SYl8mA229aCR3vtaY0SLaH8hfs9NcRytUj37JB6M5w2/C8eKv+Vel43ZwR
	 /FB2jRtbsyLxuVx7kgDvVxQp4gXNizPPlLcM8esVKYr+MiGXYRbPo/7dSkGzAYv4NUA+Gz3Lhyi7
	 AWWUAC/oqTINGOm0oR5m9IiOsypUUbzveWwfvTUDU/OU0ZFwLLK4cFJm0RfHwOG66O70STz1Vkru
	 IwNrFdZUCVNudwl5d8iPWxuKtNnTM1/dR5FTmYmVR1jmWRYc18sMY7vMC8bzR/nwtI33Ok2M/6dD
	 JmMlOxoftJrSMBqA9SvVM0N9y5LHy+ZdC2Ho0MdevWT3IGRcWypg3wkG5i4OhRBdg/kQXh6FfzW7
	 VBFGI9kynwUtsjnm+JS8Y32OdLryywGzarwHED1zTAMo1msIS0BCClSzoUBCJFoF9QZh6s2DXO8M
	 ELtp5MDuIAlViC7+xgAik6Lw99ZTStRzDP5H+z7Yu60y4Cc5mL2AWwMF8oYL39Cwk0NradA3lyGV
	 1tettvvAtp0zXGibXcFSyQTMDSDXc7IOnFl5xHquzNcwZhJJUYEV/FLUMLqbzxMrZ8nQHggw==
X-QQ-XMRINFO: OD9hHCdaPRBwH5bRRRw8tsiH4UAatJqXfg==
From: Zhao Dongdong <winter91@foxmail.com>
To: perex@perex.cz,
	tiwai@suse.com
Cc: linux-sound@vger.kernel.org,
	Zhao Dongdong <zhaodongdong@kylinos.cn>
Subject: [PATCH v2 0/6] ALSA: check snd_ctl_new1() return value in multiple drivers
Date: Wed, 27 May 2026 19:48:13 +0800
X-OQ-MSGID: <20260527114819.498119-1-winter91@foxmail.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Zhao Dongdong <zhaodongdong@kylinos.cn>

Check snd_ctl_new1() return value before dereferencing in:
  - es1938
  - cmipci
  - ymfpci
  - ice1712 (aureon, ice1712, ice1724)
  - gus
  - aoa (layout)

snd_ctl_new1() can return NULL when memory allocation fails.
Add a NULL check and return -ENOMEM on failure.

Assisted-by: Opencode:DeepSeek-V4-Flash
Signed-off-by: Zhao Dongdong <zhaodongdong@kylinos.cn>
---
v1: https://lore.kernel.org/linux-sound/875x49w1i0.wl-tiwai@suse.de/

---
Zhao Dongdong (6):
  ALSA: es1938: check snd_ctl_new1() return value
  ALSA: gus: check snd_ctl_new1() return value
  ALSA: ice1712: check snd_ctl_new1() return value
  ALSA: ymfpci: check snd_ctl_new1() return value
  ALSA: cmipci: check snd_ctl_new1() return value
  ALSA: aoa: check snd_ctl_new1() return value

 sound/aoa/fabrics/layout.c     | 6 ++++++
 sound/isa/gus/gus_pcm.c        | 2 ++
 sound/pci/cmipci.c             | 6 ++++++
 sound/pci/es1938.c             | 2 ++
 sound/pci/ice1712/aureon.c     | 2 ++
 sound/pci/ice1712/ice1712.c    | 8 ++++++++
 sound/pci/ice1712/ice1724.c    | 6 ++++++
 sound/pci/ymfpci/ymfpci_main.c | 6 ++++++
 8 files changed, 38 insertions(+)

-- 
2.25.1

