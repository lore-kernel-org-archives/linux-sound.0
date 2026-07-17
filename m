Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9B803D47A1;
	Fri, 17 Jul 2026 07:03:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.31.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784271810; cv=none; b=r4z9TBAJwCdOrh6xBp10LpLid6XAngN8qDbRknwL2HaSXlds5gZ4Yan6yPbEDveziF/rVmqKpL8/acwWyCLbeOZHsTl8zOuvyMOJtP1XS+ddE93f4+61QfFjES5aiCcG/knU3qnCPUU6ztq+k9QlqwLvy1tfY9NxZlgl02kCCUw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784271810; c=relaxed/simple;
	bh=5Q4vRwWhPOwRkxEl8lb3JZt6k2AKjQx0nhe+ubsSLbk=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=kZQf0UyYKiTP76VkcdBnxTWvtjJMliJjjM0J00Cv6tuB5pWL5ajAN2Odb7RWtAixtsyNphgvRqtrehGWYLgyAgeJ2FgtDZ4x9tBDlcFmV6d6ddsdBlfVClKGeIBhaEy9vMs07po5VsGbx7RNHZPGuhQxtMOe3rWBkoUZnCciJr8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=p29TSl17; arc=none smtp.client-ip=220.197.31.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="p29TSl17"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version; bh=3T
	3ZHP/jOuM9+e2ZAxe+UHDc7sogoXEidyAerc/LAEk=; b=p29TSl17HNEKmohUss
	oKS2vIRfWKk+g+Vd4F2u0VgTiMYl0gK3rHWID0R1OJSD3U5DpYKLyFAh7YA00uqq
	RHJUKXStNhgIxK1jn9uI3zG5Mi5QRhhQ9LuSPPjXV+1iYPnelaj6Hz5CcD5k0Ej7
	jaV2TYK77AmyOieio+o9Dn3UM=
Received: from localhost.localdomain (unknown [])
	by gzga-smtp-mtada-g1-4 (Coremail) with SMTP id _____wA3tYmk01lq70RfKQ--.38418S2;
	Fri, 17 Jul 2026 15:03:02 +0800 (CST)
From: wangdich9700@163.com
To: tiwai@suse.de,
	wangdich9700@163.com,
	broonie@kernel.org
Cc: wangdicheng@kylinos.cn,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 0/4] ALSA: Fix compiler warnings in sound subsystem
Date: Fri, 17 Jul 2026 15:02:48 +0800
Message-Id: <20260717070252.525545-1-wangdich9700@163.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:_____wA3tYmk01lq70RfKQ--.38418S2
X-Coremail-Antispam: 1Uf129KBjvJXoW7Gr4rtry7XrykCw1rGF15Arb_yoW8Jr1DpF
	Z3Ga98ArZ8Aws8AayxZF4xtF1kAF93C397X3Wjg34UArW5Z3WktF4xtw4xZFZ2yrZ2kF1r
	uryvgw17JF1Yv3JanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0pE-txnUUUUU=
X-CM-SenderInfo: pzdqwv5lfkmliqq6il2tof0z/xtbCwAYPXmpZ06ZIgQAA3Y

From: wangdicheng <wangdicheng@kylinos.cn>

This series fixes four compiler warnings in the sound subsystem,
covering both logical redundancies and potential runtime bugs.

Two categories of warnings are addressed:

1. "possible condition with no effect (if == else)" -- redundant
   conditional branches that produce identical code. These are
   cosmetic issues but should be cleaned up.

2. "do_div() does a 64-by-32 division" -- use of do_div() with
   a 64-bit divisor, which silently truncates the upper 32 bits.
   These are potential runtime bugs on 64-bit platforms where the
   divisor may exceed the 32-bit range.

Patches 1-2 fix the if==else warnings.
Patches 3-4 fix the do_div() warnings.

wangdicheng (4):
  ASoC: mediatek: mt8189: Remove redundant else-if branch with identical
    body
  ALSA: sparc/dbri: Fix "possible condition with no effect" warning
  ASoC: fsl_easrc: Use div64_u64 for 64-by-64 division
  ASoC: tlv320aic32x4: Use div64_ul for division by unsigned long

 sound/soc/codecs/tlv320aic32x4-clk.c        | 2 +-
 sound/soc/fsl/fsl_easrc.c                   | 2 +-
 sound/soc/mediatek/mt8189/mt8189-dai-adda.c | 2 --
 sound/sparc/dbri.c                          | 2 ++
 4 files changed, 4 insertions(+), 4 deletions(-)

-- 
2.25.1

