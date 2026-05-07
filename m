Received: from smtpbgbr1.qq.com (smtpbgbr1.qq.com [54.207.19.206])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9347C3E9583;
	Thu,  7 May 2026 10:33:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=54.207.19.206
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778150006; cv=none; b=AKKH48Gm4C1fuWsunAz0lWIZxudH4rRowtUeKicQDs9h+kRuuWOJ9a0uNS6MgOHaYIv/JK3y4EH3XYlPbMMT14ZU4W0LDW0A9wXCW5bWkJvlV+jDL67FCLiMekjkUva+pV7KcPQYLCNcyrPqeMto6TH0vlJ8F6mVXdoTc5aPRTI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778150006; c=relaxed/simple;
	bh=vQLn7waS5YQShQIUWXO/tsFA0LGDPoWmjlUPJzVL2Q4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=AE0rCOG62alPKi2dOnBARzninn0rFB1imxTusAUr6faRgs8ppfvbXCccqQ+sYbG0DLsNybpvuOMkaRpNvu4vS4+/ZH4ZD8GVdM9kNDHvvT9SPkzRzJTg4QIzhyxjm2hf/gfXjx8vxh8SXp1OZLBo/La1lzEyIqKH1q9bcLJkqBE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.spacemit.com; spf=none smtp.mailfrom=linux.spacemit.com; dkim=pass (1024-bit key) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.b=DQ67tMfQ; arc=none smtp.client-ip=54.207.19.206
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.spacemit.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.spacemit.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.b="DQ67tMfQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1778149930;
	bh=pQljPH2SNh4kcf10v3g04g5z8vj9T67tuB4m1YPTOcs=;
	h=From:Date:Subject:MIME-Version:Message-Id:To;
	b=DQ67tMfQt2nVkeUtu7pkqzs7/BxVYCAyMg83E+UpleKwW+u2zR/3aU01u2SgBT2Qj
	 UbhCz7DfpklbK2eF7PKwNSyQw232o51Cbn9J0caYR3xsT8ZH1Ssho3+2UZ94ReVKbu
	 D07fYvKYpiMq5CS9J6cH45q8417XY9FgaShrlthc=
X-QQ-mid: esmtpgz16t1778149922t616fb49f
X-QQ-Originating-IP: ZoX3Gp77KHWkLJluBCp8gr3bverPKMUZMDDEvbhk92Y=
Received: from = ( [120.237.158.181])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Thu, 07 May 2026 18:31:59 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 6853165117422555071
EX-QQ-RecipientCnt: 11
From: Troy Mitchell <troy.mitchell@linux.spacemit.com>
Date: Thu, 07 May 2026 18:31:44 +0800
Subject: [PATCH v2 3/3] ASoC: spacemit: declare shared BCLK for cross-DAI
 rate constraint
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260507-i2s-same-blk-v2-3-ede05a22f732@linux.spacemit.com>
References: <20260507-i2s-same-blk-v2-0-ede05a22f732@linux.spacemit.com>
In-Reply-To: <20260507-i2s-same-blk-v2-0-ede05a22f732@linux.spacemit.com>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 Yixun Lan <dlan@kernel.org>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-riscv@lists.infradead.org, spacemit@lists.linux.dev, 
 jinmei.wei@spacemit.com, Troy Mitchell <troy.mitchell@linux.spacemit.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1778149908; l=881;
 i=troy.mitchell@linux.spacemit.com; s=20250710; h=from:subject:message-id;
 bh=vQLn7waS5YQShQIUWXO/tsFA0LGDPoWmjlUPJzVL2Q4=;
 b=qO7xJTfmls5rv+Sej0SDVlp+b2NxV9JkJtCl9/EnoSmwclNgtLsf/45QPqg2kv69zoCKugnwc
 DNE0dq3veanAeExZctoW1h2bLmlJnk4VJVeAbXZsk/C+9i3rncerE9M
X-Developer-Key: i=troy.mitchell@linux.spacemit.com; a=ed25519;
 pk=lQa7BzLrq8DfZnChqmwJ5qQk8fP2USmY/4xZ2/MSsXc=
X-QQ-SENDSIZE: 520
Feedback-ID: esmtpgz:linux.spacemit.com:qybglogicsvrgz:qybglogicsvrgz3a-0
X-QQ-XMAILINFO: M+Qa/yP3m2vGxZObmf0tSQ5IXLs5+bu4O2BJ+MtKHN+oC0mV7HhcBw3X
	RbifP3pK8/eyhXqktSACiSyGOCKVjBuopawxmAbXSUFuTjnFbym/3+b0zPyomBgdE59rm6a
	OuijhJWL+t+VHcoXENVMWYiFkv1nZLMScH+SKHwxfjNm7vd09x1TxomQERY6SHdYKQItpKT
	/nh1rmeqnk0Qpp49wwZd6hse1vPFLSnFeMw3wWN+bS6lbnZwnQ+AfzfVgWaxcLi5SSwFQFl
	w5wiPUlb61mfV9JVhsoxbG3BA5QazLpt1w0alpDDxBKxGbqrr0eeiADumtMvj/aEgVdPMwC
	fGCNWfyzQI+ZCAY1ROG14Yb9wEBE2xPE+mTZgtWIdFaMnruWXhcl5ZLb9f6rHMqUt/DqglR
	mtrepvnhoPCzxyAF3Phl8aLoVRoKN4i1gyVYY6MqvaVe7dmxLn4EnjkVN0zqtaxmawysRsO
	nWbiGcfxE03RZAZznf0or19aYp7g6yFN2ZhY5n0lMEtZmmz1ww5LNVlkz606Jg327nlEUKU
	5nczLfwrHcjAAOsscnTdqEkQ1NGjPNM2ygxhNlkcOupOAmp9zlVePRncDzNRfWN1sVNPQhv
	5JIXphuIi8h/0wrKgJNlPvbpl/6VU+bw+h0Nt2ps93gwam+D3lXiztCs8xU1B+boXzxt77T
	gAJH/TFDb13MGhkOR/guPm+saJ4CxdbYsv7IHfnjVBJXGnRJVNVuwjSHx8VSx4yFM2eBHh0
	LL3Oh9JHe9tPGk5odLG4eyN/Dwhcsrnh4UOVCJMyc36NOBrHMqKaNXLAMi2g5SJBndyl/X1
	cX9dugw7YdVL0MwsiSTc3OEEgkkFGIhn1P2nAf7GeAHgJFALdglb4hBe/q46vZsTM+c3ozP
	F22lIexSPRJzPmRjHehI3HymQEgnOnkzaD27FU7TcAtiyBv97XIZxdLV10Hpw15HXGIBpWI
	bf3o+hOH50Kesg2xvljrqnPM0mphdtsdIVJLIVdXVTrjjbrSgIwLSY9s2wHtwHFYdUeqXjI
	qWFjckjtuzEfx/M0amqhUd9rnM3wY6AxGV1V/wvW1xMErKuN4gOEVjz6o62fLYUytw56UQG
	v+unoVHOP5jfAiqLFxyROIix/mCoqOo1ltEpPbVw+P2NNO89hOYMKzxceYDwU08Mrgpos9l
	1/GD
X-QQ-XMRINFO: NyFYKkN4Ny6FuXrnB5Ye7Aabb3ujjtK+gg==
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

