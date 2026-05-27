Received: from out203-205-221-153.mail.qq.com (out203-205-221-153.mail.qq.com [203.205.221.153])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 705C83F9272;
	Wed, 27 May 2026 11:48:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.205.221.153
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779882524; cv=none; b=BGAmccesQ8Oe4Puo/+SpMoeMam423A9kd7sqpkO9BzeXXZhc9fu89emWaLPxYyJfYaA4NPQ+DKRFX8+VdomCGiuFZtVkXhCoGu5cYG5J1FMpZxgPHMPv0WlPemnJRpUYFc4b8+ZxNliUS7TqiKMXqzOqo1cOdBiqqg2t+BtzjZ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779882524; c=relaxed/simple;
	bh=r0n7d1Bcsc0alHsrhLbFcLGm85covkSuzIU9L3FGe+g=;
	h=Message-ID:From:To:Cc:Subject:Date:In-Reply-To:References:
	 MIME-Version; b=ZxhqxiXmZUl0mR5Y6h8IkWQnAs/gRvicHB3GaGZWAP+Irb4NZpXgKQCRqSAqImuVT2Zd/GiSn1ZVfJS6AnbGEtR//SWRt+Mmgyfty88vyutBWcOLq0+AlCKpD1uufvBrqcazGfqFYfY+eBC9+aOw01kZdFZFa52XapNaWPFJnCQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foxmail.com; spf=pass smtp.mailfrom=foxmail.com; dkim=pass (1024-bit key) header.d=foxmail.com header.i=@foxmail.com header.b=FcFEMKxz; arc=none smtp.client-ip=203.205.221.153
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foxmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foxmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=foxmail.com header.i=@foxmail.com header.b="FcFEMKxz"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foxmail.com;
	s=s201512; t=1779882520;
	bh=kjON2f8ksSbC80HG6AKEqmQr7HZRNy2fIOTGwuqpHi4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=FcFEMKxzWNfoSqSNn8zSlNB7jXTqQiJo5nJnMxfTCBq5qXl+uQvVbu4Nhx0rx+CKl
	 GcZR/ayhjxPw7Zq/1OiglKVPrjwlCjTYYY4Wp1dgWmMrck2Dw1QNJk6/9NHlof632a
	 qwtxQv8XYk/vfsKak0nIAJ6lE3N2z+WfmA+MaS+U=
Received: from localhost.localdomain ([116.128.244.169])
	by newxmesmtplogicsvrszc43-0.qq.com (NewEsmtp) with SMTP
	id C15A3CA3; Wed, 27 May 2026 19:48:21 +0800
X-QQ-mid: xmsmtpt1779882503t5h9mh8u9
Message-ID: <tencent_DB4B978CF6863BD862F99B12D14577CE0C07@qq.com>
X-QQ-XMAILINFO: OATpkVjS499u10MRtJyDpkXZp5BEDTINSO62M9PM89Y8zBMzlpd/6xXLI8TH6X
	 SkCNvtmS8LaSciQ0SjIXnjrCdU3py3QKiw0oC95sJSB9+cVOjvAL3WNRZqIoq07JS048ndrdX+N+
	 SDmI8ySryBVdnFbNbZAlD/LWgFQTOFyLN5fETVYXGdXQ6+qMVo1DlrVDIIFdbske7YZSiqF2tbwg
	 Zl5dLowSP2bbJsxpurwc0QAF++6tp5eBpj2fNWht7Ga15BDPAU1+93xFNo9u4zQMzlDdryAo6E2f
	 g323gGURw+VaqhZjj/UF7eXJvXFawqjPwtU/Jiv0JdvY6yEkWSHBJ7F2GIjyqGPEb+f6YXrKXdH8
	 6UsJr+r6PPEryaIPpi1IT0h3b2c40flaAhid4+9h0K5y+E5rZJzmE40sZDxBVkxS0OiEVymBw22C
	 yoawN7i3F38GY2fvsOs6UgDYlC5cLnE0Yp/WYLZUkhSV/MrvKMx5nkzQIYReTBkEwYf7sgmRYg+f
	 boM6L3+Km+CpzsnwoFO85BCeERWPIsL2DQ5sY43zFlQbR8hs7n21hLzdvgSpyJw9/iVa2L3zwx9X
	 8i7GfTAyuR1ru65d4rV/Xnh8OrvehjOjb3b/Yl8fG97uRdGmEqULx63IoZYBa57GUAGNS46MkpM9
	 +ygSfk/x93sBkYdbzv6sTK7i3iDmrbBU2HIuuSUpJjxO+LRvHmVLXfPkqwB+/H98sENYLZnKPjHN
	 bsydypsBdoNP+UZJOCPElM71gbw+fJ20TxVkdtzIbZYZI0h5lCJ2ER+CAgHwbENDMk4dIGoMLXNx
	 el3rHK0zvvM8mPN2fbGIVxktykVSCURJ0FcnibXwqrtoqMgaSRLzFJs+KPPeshsd2SvVflClERW8
	 1FZsYbi51amoam1ymzga/up8FHMEDZYKcI7+fAKh46ZTgGzrjwdXwhP/s2DsrQZxU1ndFFXDIfAf
	 8I8F2k3wHtK6v6Lmus5Tp3mGTmA1OVD38INkhblzTKeoKdF6SUg6xdJAC+nM6PFQeVqrQLD0/NR1
	 Z/kOPEcFB+BKPBQGLL1ev+a0BMchb0qFPqplQ5lnCyoPzhB+v8
X-QQ-XMRINFO: OWPUhxQsoeAVwkVaQIEGSKwwgKCxK/fD5g==
From: Zhao Dongdong <winter91@foxmail.com>
To: perex@perex.cz,
	tiwai@suse.com
Cc: linux-sound@vger.kernel.org,
	Zhao Dongdong <zhaodongdong@kylinos.cn>,
	stable@vger.kernel.org
Subject: [PATCH v2 1/6] ALSA: es1938: check snd_ctl_new1() return value
Date: Wed, 27 May 2026 19:48:14 +0800
X-OQ-MSGID: <20260527114819.498119-2-winter91@foxmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20260527114819.498119-1-winter91@foxmail.com>
References: <20260527114819.498119-1-winter91@foxmail.com>
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

