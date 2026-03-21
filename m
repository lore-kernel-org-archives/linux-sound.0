Received: from smtpbguseast2.qq.com (smtpbguseast2.qq.com [54.204.34.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F6FA38B140
	for <linux-sound@vger.kernel.org>; Sat, 21 Mar 2026 11:50:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=54.204.34.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774093843; cv=none; b=YMhZOXi3drZQJlugC7hEIe5f0vtUdXF+jMvkILP5V9L3QtPTOOus81d/MnkHYyrypHwcrKCfJqzIQjTC9SlmvESWUrspcm1idL6K1Qr/afBp2Lc1NWtKpNed38ltBZWXufEajXi7PchPs9zM86UaAyiF+vdXkodG/EnYjFhUIx8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774093843; c=relaxed/simple;
	bh=Vtu2DNfitLFzivTINpsik5ybslFgCDsiv7/5NxjLZI4=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=lZ5ACqXOaS68jkQPcJJlot8RKkisPlXq+3ZSYNUyxSoBpU8NuLBkDgVZSVlH/SUFZMta5jCQqlE5MDsMplstbjpCe6+QULZzSqR9WVTC6JLTRmCw84Fsm6julqYUFFjQmn1JYgg858DIM7ILiZfsOX/U5oq8R79JifL6wgD6yvU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=smail.nju.edu.cn; spf=pass smtp.mailfrom=smail.nju.edu.cn; dkim=pass (1024-bit key) header.d=smail.nju.edu.cn header.i=@smail.nju.edu.cn header.b=e+41e8fa; arc=none smtp.client-ip=54.204.34.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=smail.nju.edu.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=smail.nju.edu.cn
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=smail.nju.edu.cn header.i=@smail.nju.edu.cn header.b="e+41e8fa"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=smail.nju.edu.cn;
	s=iohv2404; t=1774093832;
	bh=0aqsDGzmuA+tXHRFK+FeoXIY/hlXJXRbIFc2fdsLbIU=;
	h=From:To:Subject:Date:Message-Id:MIME-Version;
	b=e+41e8faueQjitqOLgnMDHFLeomlzXRqJSsceLZ0qKoaBG+RsiPj1Dj5v43V2/WOO
	 mt+bzxEJ20krFRs7hWb0VAOYvvymakNWxSsvWu4axzFp69bLESiR+BZjVcaAa6Wbae
	 j/D29tf6NygRcttnZwAqZ5WX4ENiA3EQqjTY+xg0=
X-QQ-mid: esmtpsz11t1774093821t2c67d0ef
X-QQ-Originating-IP: sbvdrixWWNU6AkV0XK5pYe39XO+I5X1a6B6Mlc5rY9k=
Received: from localhost.localdomain ( [116.172.93.199])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Sat, 21 Mar 2026 19:50:18 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 1
X-BIZMAIL-ID: 16335402017420971560
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
Subject: [PATCH v2] ASoC: generic: update outdated comment for removed soc_bind_dai_link()
Date: Sat, 21 Mar 2026 19:50:18 +0800
Message-Id: <20260321115018.9481-1-kexinsun@smail.nju.edu.cn>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QQ-SENDSIZE: 520
Feedback-ID: esmtpsz:smail.nju.edu.cn:qybglogicsvrgz:qybglogicsvrgz5b-0
X-QQ-XMAILINFO: NfJkUnPhMXV93yYQOIFhEGq8jCe0f46Sf4mHQR5K0b7vE7+jobhBvrFR
	Vi7S2KYbaYdqZXRaaPuCB1GWOmJV+7ueAKohzJ2v8PDyO0OLXbKhleYN0I4UIARu4z1Nnr5
	kWLVwl9iZF2PvbUcJhsqaocMV/t/dcQRgqhX7Vlx00/sQLqyuutQbqlG+7jy+zTuXxYQ66g
	0qElK43F3VlI4F+tArSIu9QsJ+bj2yWAE4PuMFfuJLcV6pQKbGqppHsON4oJWrLY75aXLAR
	kxqelpMDPANCzbEVNRia211ra29u6AmYaTf90FUt89DNuxjkMJZyi7FhloZzXLRICTnBEW0
	qUtudqMGAJukU3DE5vxDSchlmvuZ9V3mJvrOfvYuzGFuNEO58XdSbC2jP6qD6FzNVDm9MI4
	MwnQX+eQMM7R7Id1hOEp2ZihpjgZ+E/32pHaPJZ0Qc6vp3Oauc82G6CKduHlZ/0uvjeOqE9
	Q2C0yEqt7T1WACzeN0VWfxvil7A+4anxX2+9DtyeVO3k4ZNVS+PSxCfi9jH9Wh+om4QEJwp
	ZWOBT4PcqPXLOZWLli8h8GigTiTQZn10PEDOuo90fZfdhvMa7TrEySpFHgtFwOv1FllODtG
	x1rt4NNbXlBQkCq3/mpHePrMyW+PUS2BG8mJ6ATlGbt3iBLtPptNBCxP077KANRJYBPZgq6
	au52zTIkz0APyuoMMJGZ3urxCbEotyXgh7ONdL+MGbcKwNvS/sVCmOmhboIVZq79Z2VTtLA
	CROY48Yg6P4FZB48/9/pacYA7JaycclQREX/K9jngyhFnMt5NtfM8ypPs3HwqB511XM1f6i
	nwqSh0WwG9popGQU4INT5AVSUTEoABNRCJEIQRUk/9YRDW/XlkMfp4/EwPE6W1kzESoT5zw
	CWIrbOXD4dQrETp/uwypPTpnwiv3a9rqiBCBD9ACvcIqEjcgtns3Ww9Cb1UHwAdlk3OBQow
	P36ekSoKthuq9G8L8unzv8ejpZiBIR51WupmEfccj3y8ffXpik4n4zapnBqShF7cqJlenqx
	RAU21YKrTO5BV6XIfqsPcWPOO57SKYQ1RfWv2u4PcGj8wLdB7cHAq7vWx+ELUNYnuTmmsnx
	GTaehwqKT+tQy/TdaiZD4V4IOzL6kAiAUkCTD0DyhND9P2z+cfh7VOdyusukZ8DMA==
X-QQ-XMRINFO: NS+P29fieYNwqS3WCnRCOn9D1NpZuCnCRA==
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
 sound/soc/generic/simple-card-utils.c | 2 +-
 sound/soc/generic/simple-card.c       | 6 ++++--
 2 files changed, 5 insertions(+), 3 deletions(-)

diff --git a/sound/soc/generic/simple-card-utils.c b/sound/soc/generic/simple-card-utils.c
index bdc02e85b089..4e0c6d207a4e 100644
--- a/sound/soc/generic/simple-card-utils.c
+++ b/sound/soc/generic/simple-card-utils.c
@@ -699,7 +699,7 @@ void simple_util_canonicalize_cpu(struct snd_soc_dai_link_component *cpus,
 				  int is_single_links)
 {
 	/*
-	 * In soc_bind_dai_link() will check cpu name after
+	 * In snd_soc_add_pcm_runtime() will check cpu name after
 	 * of_node matching if dai_link has cpu_dai_name.
 	 * but, it will never match if name was created by
 	 * fmt_single_name() remove cpu_dai_name if cpu_args
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


