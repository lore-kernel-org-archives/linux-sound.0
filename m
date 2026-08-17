Received: from smtpbguseast3.qq.com (smtpbguseast3.qq.com [54.243.244.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35A083C0628;
	Mon, 17 Aug 2026 08:55:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=54.243.244.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786956947; cv=none; b=BE6H7PS7isAeTj8yNf3DoUdadMpT9sDekQkWC25CCmUvoaTY6QTt3/p2mjzrwaCqLoUyHehftrsLYeR1Eo5DdDqf8xE5BuxQ+VSTd3Dvxdh0rGxgMG5MYWbAiCtt+kTYsRY2MY6PlXinus7UxOJCfSHwaEUrYJKdtFRhHsVnNkg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786956947; c=relaxed/simple;
	bh=szG/J2Rt4Nt7ZAQkAplejX4gkk1GykOw1bj+uzNqJp0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=KzNLpvuOLU3ZJtuHLKUsKYVCbK2Z1rxZbD3ONgy5L2PgzWYMdIF8mnwYVkW9jIS0XAQ383LQssGcqWCWiTgZuHf4QiIR0vJVE2l4WmbzjCbqernR5bePlpO5vwOrqj76N1PBdhv0Z9BrD75q/HIeEFBA1z3nNOnDo9o27TnOqo8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=uniontech.com; spf=pass smtp.mailfrom=uniontech.com; dkim=pass (1024-bit key) header.d=uniontech.com header.i=@uniontech.com header.b=RrVVIv8W; arc=none smtp.client-ip=54.243.244.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=uniontech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=uniontech.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=uniontech.com header.i=@uniontech.com header.b="RrVVIv8W"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=uniontech.com;
	s=onoh2408; t=1786956939;
	bh=25OjxAIFIM+GtUvd49SWvZU4PJDP/gNKFhP5YfdVlDc=;
	h=From:To:Subject:Date:Message-ID:MIME-Version;
	b=RrVVIv8W/2rb8uZuyHGoc9T9tR/5PymAdUTM+1WZjn7jl8xH9VMvJAEEyYOa8MHC5
	 4a1qJtPW1g1YJmxYN/QaBmY8pErq8wLP5nzpIeYXa37yVWcAZHp9MOPhFXKKM+TmiS
	 8DT0Fcr32KTTeEgo2qLkvCnmqupPaVDZVZMu683A=
X-QQ-mid: zesmtpsz9t1786956934t3957497b
X-QQ-Originating-IP: r/MCgBi1oj4WzTY6U6Womc3WvMOvR/YtIRPaN0key+k=
Received: from PEN202512010004 ( [113.57.152.160])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Mon, 17 Aug 2026 16:55:32 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 1
X-BIZMAIL-ID: 16976205930758977186
EX-QQ-RecipientCnt: 13
From: raoxu <raoxu@uniontech.com>
To: perex@perex.cz
Cc: tiwai@suse.com,
	peter.ujfalusi@linux.intel.com,
	kai.vehmanen@linux.intel.com,
	tglx@kernel.org,
	broonie@kernel.org,
	stuart.a.hayhurst@gmail.com,
	wangruikang@iscas.ac.cn,
	zhangheng@kylinos.cn,
	cassiogabrielcontato@gmail.com,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	raoxu@uniontech.com
Subject: [PATCH] ALSA: hda: Add Lisuan HDMI controller and codec support
Date: Mon, 17 Aug 2026 16:55:31 +0800
Message-ID: <DE1B62191D573D37+20260817085531.992573-1-raoxu@uniontech.com>
X-Mailer: git-send-email 2.50.1
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpsz:uniontech.com:qybglogicsvrgz:qybglogicsvrgz6b-0
X-QQ-XMAILINFO: MjkRqJZlUFDQgHlaTxcN76ZcpQCT6Ll2M5C4NW4XRnHXJtjTL+clATBO
	aMsmcEXo+dGsPA/8Oof7/803l132/HoCEOaXQxUPYFDWRzckfcqm3gsLvUU7Sq0PsAG5g15
	A/E+52xCkBPcrvxTm/R2RtY/DpqYWvvpKYP4aHx7A2M+hXbmz4M6VoacpEfSc3JnQwZ2VkP
	JK6RiA2uQZ6NzSr07RmIIJXcMMCLCi5wSaEdJRMHJEz/8O+CctxIbcHxYceOY/pDcvOkUG0
	+So27HIjfs0vMrx7ZtMJ05EgasurjFnnMT7VNTu7SVN7WjO3+s+cQZzI8dbXrLcWMmoEDwd
	5I9DjAd7eLxWBqH00u+rQ/IJmegNQ3rBxeIskA0jzIpNJojcdZMcRd6sj0CwDRFLjUbM8CJ
	FZdqSujOxHWz/uawxaUL+pgEU9yw/6TwfZCedmLotsWOruptUge/70PDuxt6tlds/DrgkhJ
	UwAqMvBO5m+ekeaW615ZfYp+U/tbHk0d9YopEBUNBSsPITdYPrMrcW03I2D9Yrf0sfk0TRP
	ThpOUcQlwHfATVQiCdnwtoAmHeIFaNoRE3ahbsq3N25KAv8VUsypLsKcOMauUYRhVbpiy0Z
	7oaufaJ40vrXY1i50bHf6RbEmAxYS+6ECZsuG56VnTU2n97tfE80SoIqnmy4KUWdRaz4RyF
	BoNF7c4gs8NJ5eVdPgoL8BfqLTSwFenYyh6Vatele9lXYvOlRMZriS4+lV+4kGpkW90Oxxk
	uNrqw9acMePmfrgarXOsPL66gkeKhw0U0Q+5aFACzx/jbZCF3zwntuOunpCG6QLOPaxRtp2
	sbnb+ETn18PITrIs2oi+mJE5cZ1JE2J4R31l9AkcTIFD6593M1Qndw68w2BA95TscKzpQrT
	mmSz3lKMFNFEl1rn6Q7p+P1HJSrAaR1ZL9hreM+jMiqBvqNtwJyZSJl49w21FkAMJE335zP
	iuXTgMAaDPTuSqArzutEIm2WFElPOz2x9o2MrJgpYT7cdg8etMnuqLGnZg1gXJEn8wSr4k/
	XZZcFPmQUCwS1qDmOwYK3fv/q4gExhjXxomp6lKA==
X-QQ-XMRINFO: MPJ6Tf5t3I/ylTmHUqvI8+Wpn+Gzalws3A==
X-QQ-RECHKSPAM: 0

From: Xu Rao <raoxu@uniontech.com>

Lisuan GPUs expose an HD-audio controller at PCI ID 4c54:5010 and an
HDMI/DP codec with codec ID 0x4c545020.  Neither ID is currently matched
by the HDA stack, leaving HDMI/DP audio unavailable on these devices.

The existing downstream support uses the generic HDMI codec path and
attaches no Lisuan-specific capability flags to the controller.  Its
dedicated AZX driver type only changes the short driver name.

Use the corresponding generic upstream paths instead: bind 4c54:5010 to
AZX_DRIVER_GENERIC, register 0x4c545020 as MODEL_GENERIC, and add the
Lisuan codec vendor name.  This keeps the enablement minimal and avoids
a vendor-only AZX driver type with no vendor-specific behavior.

Signed-off-by: Xu Rao <raoxu@uniontech.com>
---
 sound/hda/codecs/hdmi/hdmi.c  | 1 +
 sound/hda/controllers/intel.c | 2 ++
 sound/hda/core/device.c       | 1 +
 3 files changed, 4 insertions(+)

diff --git a/sound/hda/codecs/hdmi/hdmi.c b/sound/hda/codecs/hdmi/hdmi.c
index a4a2f2f0540c..1be12dfaf52d 100644
--- a/sound/hda/codecs/hdmi/hdmi.c
+++ b/sound/hda/codecs/hdmi/hdmi.c
@@ -2346,6 +2346,7 @@ static const struct hda_device_id snd_hda_id_generichdmi[] = {
 	HDA_CODEC_ID_MODEL(0x1d179f8e, "KX-7000 HDMI/DP",	MODEL_GF),
 	HDA_CODEC_ID_MODEL(0x1d179f8f, "KX-7000 HDMI/DP",	MODEL_GF),
 	HDA_CODEC_ID_MODEL(0x1d179f90, "KX-7000 HDMI/DP",	MODEL_GF),
+	HDA_CODEC_ID_MODEL(0x4c545020, "Lisuan HDMI/DP",	MODEL_GENERIC),
 	HDA_CODEC_ID_MODEL(0x67663d82, "Arise 82 HDMI/DP",	MODEL_GF),
 	HDA_CODEC_ID_MODEL(0x67663d83, "Arise 83 HDMI/DP",	MODEL_GF),
 	HDA_CODEC_ID_MODEL(0x67663d84, "Arise 84 HDMI/DP",	MODEL_GF),
diff --git a/sound/hda/controllers/intel.c b/sound/hda/controllers/intel.c
index 28c55c5a2d2e..eb3a5b28e9f5 100644
--- a/sound/hda/controllers/intel.c
+++ b/sound/hda/controllers/intel.c
@@ -2838,6 +2838,8 @@ static const struct pci_device_id azx_ids[] = {
 	  .driver_data = AZX_DRIVER_LOONGSON | AZX_DCAPS_NO_TCSEL },
 	{ PCI_VDEVICE(LOONGSON, PCI_DEVICE_ID_LOONGSON_HDMI),
 	  .driver_data = AZX_DRIVER_LOONGSON | AZX_DCAPS_NO_TCSEL },
+	/* Lisuan HD-audio */
+	{ PCI_DEVICE(0x4c54, 0x5010), .driver_data = AZX_DRIVER_GENERIC },
 	{ 0, }
 };
 MODULE_DEVICE_TABLE(pci, azx_ids);
diff --git a/sound/hda/core/device.c b/sound/hda/core/device.c
index 160c8d0453b0..44bd74133479 100644
--- a/sound/hda/core/device.c
+++ b/sound/hda/core/device.c
@@ -663,6 +663,7 @@ static const struct hda_vendor_id hda_vendor_ids[] = {
 	{ 0x1af4, "QEMU" },
 	{ 0x1fa8, "Senarytech" },
 	{ 0x434d, "C-Media" },
+	{ 0x4c54, "Lisuan" },
 	{ 0x8086, "Intel" },
 	{ 0x8384, "SigmaTel" },
 	{} /* terminator */
--
2.50.1

