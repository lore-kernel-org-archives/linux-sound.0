Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A131F22759C;
	Mon, 30 Mar 2026 12:54:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.31.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774875248; cv=none; b=DUI0qsRCZhLqn65mXO9VVHdvIAOcFYszzxS38RxLL1r3RzECE5vxavEbVW1DRHH3UhpO6BX5g8xZaF2IGcKR/OqFoiJMyjOQqkU3xsPSzevkAi7NLLBRk1ocw0MXJ1SHTqscXNXuRozbaD9PGEEvxN8detIZGZOgrMIQGugnJY8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774875248; c=relaxed/simple;
	bh=ooQGV2v4QfvU2kdGcsmbHpVeza6OmkQR0VI1W2DpHsI=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=W4U24ZAYhxgBh4vs83VtywF5dnHr4/7CbBoghICflvuDfbPMCbrzFljjC243e2dcSMNLsyDQO0Fdg8twhOj2HE7R8ZZ9N/gZ2lYXkYASxv6p3d+fr2lHFsJh3j354qt+P08kNCsd6Tp6EU2kPqacs6ow6LJk0rnHhoUfX0rKg9M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=c/TjGwkr; arc=none smtp.client-ip=220.197.31.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="c/TjGwkr"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version; bh=mr
	4bkrM9n4m+cBOtlEDSZzlR5iPHoq71r6UbI2WxFcM=; b=c/TjGwkrdpbh5v4xqS
	Hs+SD6N2h5Oko5XTaSUnVTi7l0KQiLjSojPT7LLcIoITtZQ3TDR6oRWM7XpYZ2U7
	GL+Bm9/HxInN2VXB9u/taMvaLKK7zbdy1TOB55jJG3VaHbK472Of9eljc+VmoWMo
	CezRlMJ8G2dlR5PNXgkrW9Mls=
Received: from localhost.localdomain (unknown [])
	by gzga-smtp-mtada-g0-3 (Coremail) with SMTP id _____wBXK85PcsppPbAqCQ--.26842S2;
	Mon, 30 Mar 2026 20:53:35 +0800 (CST)
From: Lei Huang <huanglei814@163.com>
To: perex@perex.cz,
	tiwai@suse.com
Cc: linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Lei Huang <huanglei@kylinos.cn>
Subject: [PATCH] ALSA: hda/realtek: fix bad indentation for alc269
Date: Mon, 30 Mar 2026 20:53:33 +0800
Message-Id: <20260330125333.86012-1-huanglei814@163.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:_____wBXK85PcsppPbAqCQ--.26842S2
X-Coremail-Antispam: 1Uf129KBjvdXoWrKw4rXr4xWFW3Xw1rWryDJrb_yoWktwc_W3
	yjgw4fCFy5JF47KrWDKrnIyw409rs7CrWUuryDtFyqkr4fGw45Zr9rWF93Ar98JFWkZFWY
	qayFvwnYkFW3XjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUvcSsGvfC2KfnxnUUI43ZEXa7IUbgdb7UUUUU==
X-CM-SenderInfo: xkxd0wxohlmiqu6rljoofrz/xtbC9A+8s2nKck+aeQAA3J

From: Lei Huang <huanglei@kylinos.cn>

Mention complains about this coding style:

  ERROR: code indent should use tabs where possible
  #6640: FILE: sound/hda/codecs/realtek/alc269.c:6640:
  +        [ALC233_FIXUP_LENOVO_GPIO2_MIC_HOTKEY] = {$

fix it up.

Signed-off-by: Lei Huang <huanglei@kylinos.cn>
---
 sound/hda/codecs/realtek/alc269.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/sound/hda/codecs/realtek/alc269.c b/sound/hda/codecs/realtek/alc269.c
index b6a58852752a..09af4d378b30 100644
--- a/sound/hda/codecs/realtek/alc269.c
+++ b/sound/hda/codecs/realtek/alc269.c
@@ -6637,10 +6637,10 @@ static const struct hda_fixup alc269_fixups[] = {
 		.type = HDA_FIXUP_FUNC,
 		.v.func = alc288_fixup_surface_swap_dacs,
 	},
-        [ALC233_FIXUP_LENOVO_GPIO2_MIC_HOTKEY] = {
-                .type = HDA_FIXUP_FUNC,
-                .v.func = alc233_fixup_lenovo_gpio2_mic_hotkey,
-        },
+	[ALC233_FIXUP_LENOVO_GPIO2_MIC_HOTKEY] = {
+		.type = HDA_FIXUP_FUNC,
+		.v.func = alc233_fixup_lenovo_gpio2_mic_hotkey,
+	},
 	[ALC245_FIXUP_BASS_HP_DAC] = {
 		.type = HDA_FIXUP_FUNC,
 		/* Borrow the DAC routing selected for those Thinkpads */
-- 
2.25.1

