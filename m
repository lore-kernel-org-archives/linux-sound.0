Received: from smtpbgbr2.qq.com (smtpbgbr2.qq.com [54.207.22.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1544F63B9
	for <linux-sound@vger.kernel.org>; Sat, 21 Mar 2026 08:41:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=54.207.22.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774082503; cv=none; b=f3FJNj9SbsAt2345xIQRNS52fVhY2RVTWvL9LPsuKE7itwY4enAw2ZAfObpxCRJdKrzUNkdGsLf/FZ1y4NDmDp0fDYDUeWhiMr427Snb8pieQuBK7A9bqBwiL0JGbRGxucEEYIrmhwZgYtzEM0Rv2F2GytuwYAbXCW+Rsze0blc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774082503; c=relaxed/simple;
	bh=3oDBpxBTzWS4os6KZc55laIKcakNcUkjMzC4qCxsXb0=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=eBEjl4xvcl+iHLIfjqT97EbIrm7FAZqc4qbG5AqtAJepy6ZVZEP/pwf+J9uHrheTmA2GGwdiasQ2odJkMMbkk4Rgb1fYY2caDUIlPpCqRqu6TsSYXysBzXAP3nXLuTJGEjX0mwH6EtUnHiU/v9hHAlgyIKBiYyulTRABYg8b9mA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=smail.nju.edu.cn; spf=pass smtp.mailfrom=smail.nju.edu.cn; dkim=pass (1024-bit key) header.d=smail.nju.edu.cn header.i=@smail.nju.edu.cn header.b=R6OFoN6L; arc=none smtp.client-ip=54.207.22.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=smail.nju.edu.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=smail.nju.edu.cn
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=smail.nju.edu.cn header.i=@smail.nju.edu.cn header.b="R6OFoN6L"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=smail.nju.edu.cn;
	s=iohv2404; t=1774082492;
	bh=e+/UdVtyi6xXuqf1kuosXZl7soxokZrFJ1+EPVvuyP0=;
	h=From:To:Subject:Date:Message-Id:MIME-Version;
	b=R6OFoN6LZl/37O/DsAlEAxmxLcoRYgDg172owK3GxKx8A4kIZg49KqEjE5dcqezT/
	 Tgby45hnBKp0TFnV9hCSOf78+u8gsScksxxxvoedD83aFr/eqsp/05j+LKyqB3V1tt
	 szU2hocWvYw6XZVcpLsQPkPlIM0Ig/Dm+DuY92KA=
X-QQ-mid: esmtpgz16t1774082480tb2d89821
X-QQ-Originating-IP: h6oK3bPYrHtIWhtmRPSICfZhpJUZFYuiHIPv8HGqalo=
Received: from localhost.localdomain ( [116.172.93.199])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Sat, 21 Mar 2026 16:41:18 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 1
X-BIZMAIL-ID: 15817444756943154924
EX-QQ-RecipientCnt: 12
From: Kexin Sun <kexinsun@smail.nju.edu.cn>
To: broonie@kernel.org,
	kuninori.morimoto.gx@renesas.com,
	lgirdwood@gmail.com,
	perex@perex.cz,
	tiwai@suse.com,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: julia.lawall@inria.fr,
	xutong.ma@inria.fr,
	kexinsun@smail.nju.edu.cn,
	yunbolyu@smu.edu.sg,
	ratnadiraw@smu.edu.sg
Subject: [PATCH] ASoC: generic: update outdated comment for removed soc_bind_dai_link()
Date: Sat, 21 Mar 2026 16:41:18 +0800
Message-Id: <20260321084118.2431-1-kexinsun@smail.nju.edu.cn>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QQ-SENDSIZE: 520
Feedback-ID: esmtpgz:smail.nju.edu.cn:qybglogicsvrgz:qybglogicsvrgz5b-0
X-QQ-XMAILINFO: MIYVF5Pddf3w4lyP2liglDgoG/M+CDRUacc2rfjTdP8mglBkM7bipS4g
	l6sIlZbWWR34oxv8BzCwaC58iIXgtQIT9FddzJR/FCkoz+PE5Oym776sSI3TzB7WQzB1vL9
	DCAlYsBCb1CTe0t5fPR7j081VjuRmYgMvDhHzN2shyzQInR/0Y6CUPxvGnvkP+MufYMcdon
	2Z3uQCHhxgjRpUqffOp/hX566i0C0M0Wi7waJHrF3M3pClj2piQR3sYz1Q4i/Nba7icjqyP
	Dv4+5mEC98CFPxcjOtqd3YqC1jYI4hhv1ZAxfREFqaWa2UX+i026ky3hXIVvXrrOW8AVtAl
	0DHFY56k2JLT/WqUIoXnxaS4uWleb2H5gHSINtneKJ7im+E0yJRNR1YSy8h2SJj5HozWgwP
	x/OvEAkrpFcZtfd7jQUwHdQLVmsmLIYTi6wWWcT/3oqBRcwql59iCgXGG90y24C3If4kdkD
	LAmYqietl1vMNvyaaQkUz89Jtwtt61BuTbas0slxkWETXcMgFqbF2qExqnexDYO0c7MPwuN
	T3ZaJc/JGU42j/Fd+xOrzOf6l6GgZDKXk/JO+SRzqZx5A5QUsrf1LC9YGnlzcO2DOkd2pnz
	+K0iMKuh93MrLXTQuBs/VpJ8vCJPH/jJ1tJ/vneNr6pLMLyEXVCvtLr9Yf0aldCCIhA06w8
	oKEAT9H5ro/J003HCwbBu5qmz6HciKWCi4yGyr4m8BCDvNb5BlMrocOz4Bg64vSgRwEsT8l
	HpXym3OKkNSZsUwEIE6BDbcYifsNj3Riip9bRyR0EWRPRmjw35YmAb6SX33uY8B1RSSXAsu
	xMqntMYasgj3c/5rV/7KctTvpeF6P3X3cATxkc22SMuIlcIXh8WT6EedJUshBhevPhyx8QW
	6iNWlqajpFBadfmCB1NUXpZXMnH8lVWpCrX9L3Htptr85kiqbHVNiFEy2D9Iwl9XagToNiY
	30N8tolXhQ7+Jka/KPyVkrnxtiBXwkMgfmcb5O5ILxJU7tdkmh/r+7KXNo+7i86nNCy7Q3c
	ePmqvtBfQ4uYGmaVWi1k5ipBOqz7u85N5Aec4m3DrGQobnnu+U
X-QQ-XMRINFO: OWPUhxQsoeAVwkVaQIEGSKwwgKCxK/fD5g==
X-QQ-RECHKSPAM: 0

The function soc_bind_dai_link() was first merged into
snd_soc_add_dai_link() by commit 63dc47da1f39 ("ASoC: soc-core: merge
snd_soc_add_dai_link() and soc_bind_dai_link()"), and later renamed to
snd_soc_add_pcm_runtime() by commit 0c04800424c4 ("ASoC: soc-core:
rename snd_soc_add_dai_link() to snd_soc_add_pcm_runtime()").

In simple-card.c, also adjust the wording since snd_soc_add_pcm_runtime()
no longer uses "xxx_of_node" fields but matches components by of_node
through snd_soc_find_dai() and snd_soc_is_matching_component().

In simple-card-utils.c, simply update the function name to its
successor snd_soc_add_pcm_runtime().

Assisted-by: unnamed:deepseek-v3.2 coccinelle
Signed-off-by: Kexin Sun <kexinsun@smail.nju.edu.cn>
---
 sound/soc/generic/simple-card.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/sound/soc/generic/simple-card.c b/sound/soc/generic/simple-card.c
index 06638f9a74b8..9937a991846e 100644
--- a/sound/soc/generic/simple-card.c
+++ b/sound/soc/generic/simple-card.c
@@ -48,7 +48,8 @@ static int simple_parse_platform(struct simple_util_priv *priv,
 
 	/*
 	 * Get node via "sound-dai = <&phandle port>"
-	 * it will be used as xxx_of_node on soc_bind_dai_link()
+	 * It will be used as the of_node for component matching during
+	 * snd_soc_add_pcm_runtime().
 	 */
 	ret = of_parse_phandle_with_args(node, DAI, CELL, 0, &args);
 	if (ret)
@@ -76,7 +77,8 @@ static int simple_parse_dai(struct simple_util_priv *priv,
 
 	/*
 	 * Get node via "sound-dai = <&phandle port>"
-	 * it will be used as xxx_of_node on soc_bind_dai_link()
+	 * It will be used as the of_node for component matching during
+	 * snd_soc_add_pcm_runtime().
 	 */
 	ret = of_parse_phandle_with_args(node, DAI, CELL, 0, &args);
 	if (ret)
-- 
2.25.1

