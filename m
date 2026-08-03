Received: from mail.ptr1337.dev (mail.ptr1337.dev [202.61.224.105])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FDE3280CFB;
	Mon,  3 Aug 2026 09:11:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.61.224.105
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785748300; cv=none; b=okw6PFFAwtCwClI2T2h1PgtooGzRa7rboblEOdwZrxm/fYUM2uBB4MT5SUQfgIZNSSCU46Tvm00HHXLC7r7NBm7sBvLT4V7W0+wRz+SQELgGodCYOHyrkwUvBuiMwgntz6sVvZSfpdPFmpO0Sk/Ip3QLRwVO5iuq4JdZB5cil2U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785748300; c=relaxed/simple;
	bh=uIVxtpdifdY+AymwHPO9rpyL05Z1J5PLCrgYPby35+4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=hOuYl5pgt7cRR9iEon8dun8hepZozDiihKFV9Ls/3/SSk/F8zNMw3DKqUrqYY0Is9IexrTW5B2q82xFWwehL/wdMF+jJ1sUPZlfEVH/R12mEaLXeamE2YUhwrj+LRk61j6fvk9akWVr8gd775yT4X0GSwbzWb777f07wjm7AFMo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=cachyos.org; spf=pass smtp.mailfrom=cachyos.org; dkim=pass (2048-bit key) header.d=cachyos.org header.i=@cachyos.org header.b=pzMIv/6U; arc=none smtp.client-ip=202.61.224.105
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=cachyos.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cachyos.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cachyos.org header.i=@cachyos.org header.b="pzMIv/6U"
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 51DBB281793;
	Mon,  3 Aug 2026 11:11:33 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cachyos.org; s=dkim;
	t=1785748297; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=ymwnTommJ8cg0ch7sGPNv+C9JXfv1nDq7FBGJORj7MY=;
	b=pzMIv/6Ufr8l1GSlBql+XcilNZ+X8y2wwMq+rfMwO4ZjtF1IIKL+WHz6ybPpzvUGAeSVtA
	nPdC2BvHKjRJji12JD9GqArfeFVyccY3SFxlc9zAezpproEVql+VKTfCAJVjvBU+arfcRc
	decFtuGI5lkyDCEjpbiSRl8SKGNFniqULXMVnn5nk+uCXjd+/BMplBtMYeeL9pIZ0wqBUM
	WaKGlL2VWnCrert31En0clTL1S6Ip/WOubYXjnPFvZPoIwF0KQ25St+uKs4IMz6+fTwOkC
	nutzG1WP36489UppmYVfhyt0YC78O8/FVV9Q8m8/eut+VSx6lpYB8vQ2ZMIZ2w==
From: Eric Naim <dnaim@cachyos.org>
To: Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>
Cc: Eric Naim <dnaim@cachyos.org>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 4/9] ALSA: hda/realtek: Remove ALC233_FIXUP_INTEL_NUC8_BOOST
Date: Mon,  3 Aug 2026 16:10:53 +0700
Message-ID: <20260803091102.107570-5-dnaim@cachyos.org>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260803091102.107570-1-dnaim@cachyos.org>
References: <20260803091102.107570-1-dnaim@cachyos.org>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3

Now that ALC269_FIXUP_LIMIT_INT_MIC_BOOST is no longer chained to
ALC269_FIXUP_THINKPAD_ACPI, ALC233_FIXUP_INTEL_NUC8_BOOST and
ALC269_FIXUP_LIMIT_INT_MIC_BOOST are both identical. Remove the former
and replace it with the latter to avoid redundancy.

Signed-off-by: Eric Naim <dnaim@cachyos.org>
---
 sound/hda/codecs/realtek/alc269.c | 7 +------
 1 file changed, 1 insertion(+), 6 deletions(-)

diff --git a/sound/hda/codecs/realtek/alc269.c b/sound/hda/codecs/realtek/alc269.c
index c457ee9f61a2..addea99b3bce 100644
--- a/sound/hda/codecs/realtek/alc269.c
+++ b/sound/hda/codecs/realtek/alc269.c
@@ -4157,7 +4157,6 @@ enum {
 	ALC269_FIXUP_LEMOTE_A190X,
 	ALC256_FIXUP_INTEL_NUC8_RUGGED,
 	ALC233_FIXUP_INTEL_NUC8_DMIC,
-	ALC233_FIXUP_INTEL_NUC8_BOOST,
 	ALC256_FIXUP_INTEL_NUC10,
 	ALC255_FIXUP_XIAOMI_HEADSET_MIC,
 	ALC274_FIXUP_HP_MIC,
@@ -5149,11 +5148,7 @@ static const struct hda_fixup alc269_fixups[] = {
 		.type = HDA_FIXUP_FUNC,
 		.v.func = alc_fixup_inv_dmic,
 		.chained = true,
-		.chain_id = ALC233_FIXUP_INTEL_NUC8_BOOST,
-	},
-	[ALC233_FIXUP_INTEL_NUC8_BOOST] = {
-		.type = HDA_FIXUP_FUNC,
-		.v.func = alc269_fixup_limit_int_mic_boost
+		.chain_id = ALC269_FIXUP_LIMIT_INT_MIC_BOOST,
 	},
 	[ALC255_FIXUP_DELL_SPK_NOISE] = {
 		.type = HDA_FIXUP_FUNC,
-- 
2.55.0

