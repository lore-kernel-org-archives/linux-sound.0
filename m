Received: from out203-205-221-149.mail.qq.com (out203-205-221-149.mail.qq.com [203.205.221.149])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4A2D3CC30F
	for <linux-sound@vger.kernel.org>; Wed, 27 May 2026 12:09:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.205.221.149
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779883764; cv=none; b=U1ck9Bo+B5IdBw5mZcZer13UfGS0Fd27nO7DluTErukFXYd6ZQMaeMS3kv17ph3m18pLX79XUx8yYwQKNpGOL8gm/mqBoJ3Kh0qqfd9NfYZekXbi2zulbyKaAT8T2A67RkS8rUL84zkjZOOHMuDjCjoF0oy4VohGCRA7sP3FAWI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779883764; c=relaxed/simple;
	bh=kDh0yL/bwnjkLPRs5Myb//2zGu3cpQQEqQAImup9XPI=;
	h=Message-ID:From:To:Cc:Subject:Date:MIME-Version; b=sUH5mfT38AWJGejwMHs5GzoSAqFPQF5DdEx2QIoIY6ZRgcZix1aNnf0gBTjV/62MEEApEsU93tevIkgkjaH04UNRHw6YOI4H3sRYwz2M8952rS35cY3p51pu+gYZeP3VSAe++6HDPrtN9URG5kmQ7/Dj5Dx1274OGgKKlNm3SXQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foxmail.com; spf=pass smtp.mailfrom=foxmail.com; dkim=pass (1024-bit key) header.d=foxmail.com header.i=@foxmail.com header.b=sV+tjoW9; arc=none smtp.client-ip=203.205.221.149
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foxmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foxmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=foxmail.com header.i=@foxmail.com header.b="sV+tjoW9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foxmail.com;
	s=s201512; t=1779883759;
	bh=xwXSiD680tG+qJUsP1svnObAGfrQTcr3HGP6k4wZkm0=;
	h=From:To:Cc:Subject:Date;
	b=sV+tjoW9uXDIKmYz09HjNv3PvupbbEeqriVX5HTlVIrHrRSbLamXAHRnBE8qM/4RO
	 0LDSvg4zD4Ixg8OdLiyZND78Ucluvf6jZL0UyGyObNoSoM040nWRsKI4EbNjjZ/VVv
	 6jlYFLnUnmf12PMM4s6XG1djRLOOzL0gKeZ9DnFU=
Received: from localhost.localdomain ([116.128.244.169])
	by newxmesmtplogicsvrszc43-0.qq.com (NewEsmtp) with SMTP
	id 2518B808; Wed, 27 May 2026 20:09:17 +0800
X-QQ-mid: xmsmtpt1779883757tssq68u5i
Message-ID: <tencent_355874CF7D3723CAA5BEBDF10EAD78E86605@qq.com>
X-QQ-XMAILINFO: MllZffuBkEb5k11QWKrk7iVIA9t8t8pEfTK4U2ORQO751xmADCs0PZtCtNrl0p
	 L6ji79k0JoflJNP5ccmkd/4wuunMGmJ0jIcoKTM+2Vo2OiZHKGxl7AaOo93ojjHc+xdKdTeSN18t
	 1yIibnZGY0gI68BKUDu/e8IiObo+kS67t4GaOHkT6kJjJiTvWq2iV2r7U/vXRsNV+4/k/s9HE8OF
	 42j5brUNQ4IcG2CbdiJqgEtR8sA4eUJ7Jxs7Ly4Q12o82BZmIATVf2r/6h7J9ymrbev7mQjokpyZ
	 DTVU6MXxxXSEV75epi+0DCaeOX/QduILO3u60R4O7oxUOUhgcW9cEtjcskwiO1EPWTM94xMtGSdv
	 JqX5RO0/RDPVM6P+KPTTXTPECBFt20IWkzR8WM/mbLi3uUmqpJ8eQufF/ui6mJjJCWmJCwEG/2Iv
	 WxUKbHsGo1+2sApycWWyuEIfIg3OohOfUCyh9jbrDXFoAsaMKX7lHfQrO53X7m6k0TMnXCuYMMfA
	 kkKWSj0zpJnDfQktfrnFMDZMH1k1uw8qCJmCMaQROywZP6cDdfWm1vya2m9SA1wNmZADFA8lcnZU
	 Eaouel9yPnG7QrTDdrGY3N209gA1on0G3968HhAGUIFhvQdWc0uX1wQo23M9eYADZr27RQEzR00M
	 GY57SAxC0kr1puoa/g93AqplTnUWreVyr2fZ0n75nEuAPOY77Xm7s7ROtqYg4XvgIssIN+WliWRE
	 QoNmvWIFfQZS2B4Cs8tRmUwXmm4jTgjLW7nlI9Xb0vVeA4OozbarSkLwcoyGuUj7oqxwxj0+fB7s
	 ItdiZZKln0OmaXkc7J0kttBjOuhRNrnjiA59fONkh22hED/rBQLxaXzma2+WA8183ru6NOwyAb18
	 zJlCgKAtpo9Q6zLSB2M63fYSpIT5UzxD0J/VbXFJ4X58guw3zA+03uIMK8kFm4hLnCqWcs9XO1jl
	 zSB6ZFoD58anXk/pLXMuRiqHUm7spEMOSKb17cabOAGpXzsOtMBZX/FwaJogVd2ngcyhzUrJYApD
	 kgGm1G6jWv9gcq3WXwl0Eii7m2YDbD9iYlnh41r5CRO6LclZZY1shAlrWlEaFWjoOdSI6N5ROz3V
	 Fg9widSHJo+RqwNR49aTJRnwitzrqRB9XNcf1e
X-QQ-XMRINFO: M/715EihBoGS47X28/vv4NpnfpeBLnr4Qg==
From: Zhao Dongdong <winter91@foxmail.com>
To: perex@perex.cz,
	tiwai@suse.com
Cc: linux-sound@vger.kernel.org,
	Zhao Dongdong <zhaodongdong@kylinos.cn>
Subject: [PATCH v3 0/6] ALSA: check snd_ctl_new1() return value in multiple drivers
Date: Wed, 27 May 2026 20:09:08 +0800
X-OQ-MSGID: <20260527120914.515037-1-winter91@foxmail.com>
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

