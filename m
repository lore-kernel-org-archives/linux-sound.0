Received: from out203-205-221-153.mail.qq.com (out203-205-221-153.mail.qq.com [203.205.221.153])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 848AA3CAA3A;
	Wed, 27 May 2026 12:09:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.205.221.153
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779883768; cv=none; b=NDTa1zX7+MagxjkIRZZ/uVxulBDc3+/ijUfpEDCsWakjfpO+W9xA/8OTAh3F84j1Af0631gb/Ud3Y0VisORYWdMQg9/o8sTnqhPcMEzhHBawGdy+I0fCUTNVUol3bHXylSMHXudX01akUflPw0DJZyleMqVpmkrSC5CfprtATrk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779883768; c=relaxed/simple;
	bh=r0n7d1Bcsc0alHsrhLbFcLGm85covkSuzIU9L3FGe+g=;
	h=Message-ID:From:To:Cc:Subject:Date:In-Reply-To:References:
	 MIME-Version; b=jXorwW6kWXPdip4sGrpLml9JId0H4R5cqHetUC2ZeRAwXgCrX2kw6bTa0RYdhzUQf7fKuwUbHuC7fXtgrCf+R1f10rOG0+IBIftmREKKB5clYGAAtZb2vaUHATrbXygdrKlbJyN1eL3o8hUxC8dtOCRxWomcZO4G6oXZRJXaIN8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foxmail.com; spf=pass smtp.mailfrom=foxmail.com; dkim=pass (1024-bit key) header.d=foxmail.com header.i=@foxmail.com header.b=qbaZgXo4; arc=none smtp.client-ip=203.205.221.153
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foxmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foxmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=foxmail.com header.i=@foxmail.com header.b="qbaZgXo4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foxmail.com;
	s=s201512; t=1779883762;
	bh=kjON2f8ksSbC80HG6AKEqmQr7HZRNy2fIOTGwuqpHi4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=qbaZgXo434sS/OaOc/o/r2BzhLmSnXO+DDAvScu/yEbxZlNrKakprTvZKmKRcGhLt
	 6yjcSDFmr5jc4KzNLdu44Vw5PmktLCW/yQ0ofKOxkR6yatibLRn+dOIi1nx95nr+Cn
	 wLisNR/d5rtBEYdJEO3GjduPtDJEt7lwFnx3h/bc=
Received: from localhost.localdomain ([116.128.244.169])
	by newxmesmtplogicsvrszc43-0.qq.com (NewEsmtp) with SMTP
	id 2518B808; Wed, 27 May 2026 20:09:17 +0800
X-QQ-mid: xmsmtpt1779883758te30isdi5
Message-ID: <tencent_E0DC65165FDF2C8982BAFB6794B854B53B0A@qq.com>
X-QQ-XMAILINFO: ON4JYNczNu10JAWg0ygzwrfLfJ7neDVxGgqVSaS3ayNCJuvcOm3srJsGRrOoEz
	 sHCmqTj5Q7PtjUmvuO585M3gKmE0dwvA8SYkFdeopINHBXPqTzlkEyxZfBtFIElTd3+7DYIJXYwc
	 mu+8vMvYrJc/DfGJpbE2++kIqU+sZA5lY3cH4gkn+aabHTYgxCm8tZIfzfUZWr/GMQJ/E4WfgART
	 paT1oNmsJc+x6RAgRalWBvmMEDDorUJG75sp/dhobivdjbOwDmhc69Qu1K2osnQJkOfxaX7QiZzG
	 9GNqzvMLNiYIHbKvegi1bqqhbunIrhE1AyC3jYhItgyfL4Y3Y1AW9PtpQuExMVdeSNShXOxkJvAs
	 YR6zlbhTmXNsiyrWoHVQATJ5/rh4AsO0BhJxxE1waCw4goby6mrsIY08yghVubVh/qrwEPYz4RXR
	 TiWySWsdteTSdo+vjoI+gXQnarXrEGSibCAAcMVtlH3ehhN9dBpKq8eqZBe1CdXLg8y3k1NmU78W
	 6x1ztT39NC0qOH/9UXmUOaN927YKbtCiAVufWmepxWO3a3frommcQMR3TJjD0Js42e+ifFsy8xKR
	 hONkreml07UZaz0wzl5ldu78u5P9K48hmUyp9PPY0S0OFaz9Y7dK2WhgONl+C99RgAjVBh9aP3Js
	 5HUuGAi5oKm1aZt4G79TwIPcbFqkK7iUHwBzK/hEmXt+wT+ZnIKcXxYUi5Q/eqmWKIPXDo5PSsxA
	 cxUKYX0405/dV5fqgpjgvEXUHljvcUXR8eRdJb0CsG9FTSqekZvoX7TXCvNwBPnxx/Ep5HcC5k+d
	 mXQER6GPWMQNTX2dGNqFIrc478QKgkzA1nkFG9aZ2b6Ug6haHUmITUMchBjquQ4Uv6Usi3GG2UeF
	 U70k4WP86tXyjerSvB1r4YreqkxlT1+uPf40pFfzcUINm1IQ+zqSkwDty0JQLfYVDYFYRHMpapoz
	 ugCuaMB4q6lAbtTEbvcNVNk1lXVo6eloHJXYUZ7g9B+VCqmAWaL10KHl7DglTqCtmp91Ga0uqjXM
	 gjOeQD2grWvuMK4VdKZnU5H/WLUWK7xC/pj31ZJkMYptMImg4oVmtwCWVyrzgqrQOd5uoHfhmVFg
	 goEJiSigZEsQFxgtI=
X-QQ-XMRINFO: MSVp+SPm3vtSI1QTLgDHQqIV1w2oNKDqfg==
From: Zhao Dongdong <winter91@foxmail.com>
To: perex@perex.cz,
	tiwai@suse.com
Cc: linux-sound@vger.kernel.org,
	Zhao Dongdong <zhaodongdong@kylinos.cn>,
	stable@vger.kernel.org
Subject: [PATCH v3 1/6] ALSA: es1938: check snd_ctl_new1() return value
Date: Wed, 27 May 2026 20:09:09 +0800
X-OQ-MSGID: <20260527120914.515037-2-winter91@foxmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20260527120914.515037-1-winter91@foxmail.com>
References: <20260527120914.515037-1-winter91@foxmail.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Zhao Dongdong <zhaodongdong@kylinos.cn>

snd_ctl_new1() can return NULL when memory allocation fails.
snd_es1938_mixer() does not check the return value before dereferencing
the pointer, which can lead to a NULL pointer dereference.

Add a NULL check after snd_ctl_new1() and return -ENOMEM if it fails.

Assisted-by: Opencode:DeepSeek-V4-Flash
Cc: stable@vger.kernel.org
Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2")
Signed-off-by: Zhao Dongdong <zhaodongdong@kylinos.cn>
---
 sound/pci/es1938.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/sound/pci/es1938.c b/sound/pci/es1938.c
index 280125eff362..b6dcb721fffc 100644
--- a/sound/pci/es1938.c
+++ b/sound/pci/es1938.c
@@ -1655,6 +1655,8 @@ static int snd_es1938_mixer(struct es1938 *chip)
 	for (idx = 0; idx < ARRAY_SIZE(snd_es1938_controls); idx++) {
 		struct snd_kcontrol *kctl;
 		kctl = snd_ctl_new1(&snd_es1938_controls[idx], chip);
+		if (!kctl)
+			return -ENOMEM;
 		switch (idx) {
 			case 0:
 				chip->master_volume = kctl;
-- 
2.25.1

