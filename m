Received: from smtpbguseast3.qq.com (smtpbguseast3.qq.com [54.243.244.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 391463F9F21;
	Thu, 30 Apr 2026 07:47:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=54.243.244.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777535260; cv=none; b=tVGrZY0GlwfpmR5BVJ6Rqv4RnSpydz1M/Af8UM25iEQ+ok2jzgpAVpxD4nLVzYOomA9ujLNxDm8OYNmYfTaI/PXyCnQxn2OvSO+feM3JYQ2/ABgSJ0WIrO2SKXumRZr3okUCUqEuwz0UfOXmjVGrWOGT2cz/VVmXCuNH9XB+A5g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777535260; c=relaxed/simple;
	bh=vQLn7waS5YQShQIUWXO/tsFA0LGDPoWmjlUPJzVL2Q4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=RGSqLnndCJDWzyC1bt0KCc6np7P9rJ90siN1gAI4GRReGgN3UPCiZm7LxORzumpVMi0EpAiF1I4/s4uo2cpol7BqB0w+sr501Id9BrHtgngHUWagMI8l0NFpChcgm+HUCKMPZ1OiXb/B+NP0w48qeR2OTN+rvbfK4hy7YEYgSGU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.spacemit.com; spf=none smtp.mailfrom=linux.spacemit.com; dkim=pass (1024-bit key) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.b=RLgDfFYl; arc=none smtp.client-ip=54.243.244.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.spacemit.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.spacemit.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.b="RLgDfFYl"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1777535188;
	bh=pQljPH2SNh4kcf10v3g04g5z8vj9T67tuB4m1YPTOcs=;
	h=From:Date:Subject:MIME-Version:Message-Id:To;
	b=RLgDfFYl/2VpgLtXxQJx478KKe9Y9VPXSD/5XJcaMBcbfqyumj2DHk15AkEQhkHMK
	 qTUEH448eCLH/ybgi+Tuntqkr6xg/4BGcCZsOKRxWedIqfuS7AtQZIsi0jrCQcrZDg
	 LMomBqgkqYSQH+EeCesvmIHtsJ6td7i7fMwgpdrk=
X-QQ-mid: esmtpsz19t1777535181t92e52bfc
X-QQ-Originating-IP: 7OAe0mkFB44vmQ8DOvvTaLnmrByD7FsjUpNK5FjTSLA=
Received: from = ( [120.237.158.181])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Thu, 30 Apr 2026 15:46:18 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 1439335265353734578
EX-QQ-RecipientCnt: 11
From: Troy Mitchell <troy.mitchell@linux.spacemit.com>
Date: Thu, 30 Apr 2026 15:46:03 +0800
Subject: [PATCH 3/3] ASoC: spacemit: declare shared BCLK for cross-DAI rate
 constraint
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260430-i2s-same-blk-v1-3-3a1f04eb6159@linux.spacemit.com>
References: <20260430-i2s-same-blk-v1-0-3a1f04eb6159@linux.spacemit.com>
In-Reply-To: <20260430-i2s-same-blk-v1-0-3a1f04eb6159@linux.spacemit.com>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 Yixun Lan <dlan@kernel.org>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-riscv@lists.infradead.org, spacemit@lists.linux.dev, 
 jinmei.wei@spacemit.com, Troy Mitchell <troy.mitchell@linux.spacemit.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1777535165; l=881;
 i=troy.mitchell@linux.spacemit.com; s=20250710; h=from:subject:message-id;
 bh=vQLn7waS5YQShQIUWXO/tsFA0LGDPoWmjlUPJzVL2Q4=;
 b=kLPsA+QDzUkEMJmdxppe+VFcrW+OIvcKAANTPsSB+B2p5Qf7gTwvTp51uMXsJHOw3LxykH4HX
 E3Ee1JEgW3gCjbrPjjNBTsSjRtXzmTGUL6mkn+Ww1Vk7h5pr8Te2H2q
X-Developer-Key: i=troy.mitchell@linux.spacemit.com; a=ed25519;
 pk=lQa7BzLrq8DfZnChqmwJ5qQk8fP2USmY/4xZ2/MSsXc=
X-QQ-SENDSIZE: 520
Feedback-ID: esmtpsz:linux.spacemit.com:qybglogicsvrgz:qybglogicsvrgz3a-0
X-QQ-XMAILINFO: Mt4DvdI4E/CnOMCI4jfJ11bEuXM8Do6zRIHOcoZvJRdqlr4eWjC6JeqX
	s0Bg/tzQf756nPrC84ww9wa6bWloVjtdLc68wdo27gJtbMtjYTEoPUxQf4CZaDHG3eniUCv
	iYswp2zdIAkdWYtEZc0riL7/zQ2SyLXq+8E1nGScQvoLSlaOv62Oux33J3rP9ehgGOTfB/8
	Q3ZzdXsxmkabmu6x7fQ+hdO9cSr+BovMTemYYlQfcBghYaAYC8FTYQFav2wVEBLQzfBgTvX
	f+YPMvlaH/foShmMdSsdP9TIINp5jbvR5gKUca/tYpExOk8zFO1DeeXTzZZI/gEidz8knCJ
	VqmPOyJ+PbWX+1hwJzkFsLM1lx4lxpsWiD/ZV47QAAWRdma3lrXbvcFZ1bytLl3wEU5MjQH
	FJelZ5EecaOZSp10IqgI/rTwxbNVseTd3YvW96cCS+iuywVQLAhh6evgCZVIEABr8/qkNon
	3DDo2h2mEYWThrSGj/dp7RE7ipoCvX1O1/sI0kLRbo4cXRiVKWcLkTHCwoCbFoyvk4c4PBK
	DKRVGBXeYj09sDeBDveXEb/wLx3qt15PF4OkHYLLSePOQWA3Iz1PbWGdgkSqWfbQk+nwEQy
	1CIK7WNFhBuqzGXGWVnPkX0VG17cci6S/8+oGSZXf9Jyuvu4pbrTkCMVE8yCp+M13HDmPGa
	DHaarnjUE7hK6jQr6kKjKasMBn/qeneclpwMm9uLo+3M2xICQcrz7fScfc2i9RiGveOyRnr
	eLrlXOdBzN9f0VOFtxedq+IiPKmKiNRjbgHRhOnp4re4fAOhqMROrlJodJBaoB0TguP8avx
	R4fI8XxzpLaaYK6DSgPUUUCTPYtK45XTFvmrDTJTOc7flSzqynldZDTs/gurIZ4/5wjF32O
	YFKbvnDzdMg/tTuLkvxKfRXp9ydGHkW6KhQhp/AKYZ6tZfZsc6faVfQ8rNjUeb6Fc85rKvu
	mv/IswPpWQ/ZXEHNG3qDSwnSAgkELp3hGLxX9l0Iy7rBm7M9UwmZzZ/iqJs/zwiSrZC7cI7
	uKRUFg9DdBei0X429xvTe/QqdzsEHvllop1HgzlBD0u9+CYedPcBq0IQym2BuoRZJ3T/nQQ
	5jdwlpZTiJ9idMnFwnzttsfvaNnL4ibvWzLVnLdYyq/ZaLvrmLXnHLKe7eTH7RE374ti/aH
	a//H6HyzceGb7DPv4YmrxjySO1NXzUEflFrb
X-QQ-XMRINFO: MSVp+SPm3vtSI1QTLgDHQqIV1w2oNKDqfg==
X-QQ-RECHKSPAM: 0

On SpacemiT K3, multiple I2S controllers share the same physical BCLK
(c_bclk). Declare this clock via snd_soc_dai_set_bclk_clk() so the
ASoC core can automatically constrain hw_params when one controller is
already streaming.

For K1, c_bclk is NULL (obtained via devm_clk_get_optional_enabled),
so this call is a no-op and behavior is unchanged.

Signed-off-by: Troy Mitchell <troy.mitchell@linux.spacemit.com>
---
 sound/soc/spacemit/k1_i2s.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/sound/soc/spacemit/k1_i2s.c b/sound/soc/spacemit/k1_i2s.c
index 4e655d714623..989e82b3c5b4 100644
--- a/sound/soc/spacemit/k1_i2s.c
+++ b/sound/soc/spacemit/k1_i2s.c
@@ -306,6 +306,8 @@ static int spacemit_i2s_dai_probe(struct snd_soc_dai *dai)
 
 	spacemit_i2s_init(i2s);
 
+	snd_soc_dai_set_bclk_clk(dai, i2s->c_bclk);
+
 	return 0;
 }
 

-- 
2.54.0

