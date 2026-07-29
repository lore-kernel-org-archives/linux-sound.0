Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA388382F28;
	Wed, 29 Jul 2026 07:10:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.31.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785309012; cv=none; b=dlR7JvFfKrHtye3Tka5oDmcVjx0SptGUuMp5nNTXVf2ifGSiu5O/HGfJlulTqwKYgSyCSRkxVqhwtRSLGr/nFkHXDUmsGCqtcGdAvPdVNiqDLJ6g/dxr/TV+KLdzaUWuzQmbgDMy39GMrcgy8L/iIFJL5NEKL0djVW6guXmmMZ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785309012; c=relaxed/simple;
	bh=vn8Nh87G8dMyaAt1GTAsHiUvMcqp8aD8qj0jHFx1EXI=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=tbe8cfymzISuZOei0+F0wE7anpomPUlH61z4bi4tihPv1Rr8VE7Xkaverm3JexhaL5BPwkPYTcdEqoAKqzb6pK6V+Qx/JdvCfBtfkRIQNkr47mwY8wb16vnF+1giRdUNq3eTGQ1nzQvujX9SirO4dXEdK8wWq62fa/NUbLsNslU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=MJTqRePo; arc=none smtp.client-ip=220.197.31.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="MJTqRePo"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version; bh=EI
	cmRFi4KuhhdrVFu7uYmucCsjif1JOWezuUBi8c+Ts=; b=MJTqRePoTPDfAW9gg6
	v/6Ncm9AyPjJNYk/a65skPEP7pX2CCXZeZOCaW4QjxI3PFwlsmr2UlINVvNMgKOU
	aHJ6uA2KcwO8VARyvZTiLR/fi8TsnpH3kbD4oUefXW0ufQJ9rscj61KTHcm0yKKM
	0Q+XQXRv0M6SNSePx9aqnrrtM=
Received: from localhost.localdomain (unknown [])
	by gzga-smtp-mtada-g1-4 (Coremail) with SMTP id _____wDnBgwwp2lqxlafMg--.58197S3;
	Wed, 29 Jul 2026 15:09:40 +0800 (CST)
From: wangdich9700@163.com
To: tiwai@suse.com,
	broonie@kernel.org,
	wangdich9700@163.com
Cc: linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	wangdicheng@kylinos.cn
Subject: [PATCH 2/2] ALSA: hda/conexant: Add NULL check for dc_mode_path
Date: Wed, 29 Jul 2026 15:09:35 +0800
Message-Id: <20260729070935.548050-2-wangdich9700@163.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20260729070935.548050-1-wangdich9700@163.com>
References: <20260729070935.548050-1-wangdich9700@163.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:_____wDnBgwwp2lqxlafMg--.58197S3
X-Coremail-Antispam: 1Uf129KBjvJXoW7Cr1DZFyfCF1Dtw4kCr1kuFg_yoW8Wr45pF
	18C3Z3Cw1DJFWIyF4kGay3G34F9aykJF13K3y5ta1UJrsxtw4xX3Wjk392gFWxJFWYgF9I
	qa1xtr4DAw4rCF7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0piPfQJUUUUU=
X-CM-SenderInfo: pzdqwv5lfkmliqq6il2tof0z/xtbC5xTrO2pppzQtigAA3U

From: wangdicheng <wangdicheng@kylinos.cn>

snd_hda_add_new_path() returns NULL when no path exists between the
given NIDs, but olpc_xo_update_mic_pins() passes dc_mode_path
straight to snd_hda_activate_path() which dereferences it without
checking. Add the missing NULL guards, same as the local path
variable already has in the same function.

Signed-off-by: wangdicheng <wangdicheng@kylinos.cn>
---
 sound/hda/codecs/conexant.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/sound/hda/codecs/conexant.c b/sound/hda/codecs/conexant.c
index e7a2a073d22c..880fbbe5b643 100644
--- a/sound/hda/codecs/conexant.c
+++ b/sound/hda/codecs/conexant.c
@@ -451,7 +451,8 @@ static void olpc_xo_update_mic_pins(struct hda_codec *codec)
 	if (!spec->dc_enable) {
 		/* disable DC bias path and pin for port F */
 		update_mic_pin(codec, 0x1e, 0);
-		snd_hda_activate_path(codec, spec->dc_mode_path, false, false);
+		if (spec->dc_mode_path)
+			snd_hda_activate_path(codec, spec->dc_mode_path, false, false);
 
 		/* update port B (ext mic) and C (int mic) */
 		/* OLPC defers mic widget control until when capture is
@@ -487,7 +488,8 @@ static void olpc_xo_update_mic_pins(struct hda_codec *codec)
 		update_mic_pin(codec, 0x1b, 0);
 		/* enable DC bias path and pin */
 		update_mic_pin(codec, 0x1e, spec->recording ? PIN_IN : 0);
-		snd_hda_activate_path(codec, spec->dc_mode_path, true, false);
+		if (spec->dc_mode_path)
+			snd_hda_activate_path(codec, spec->dc_mode_path, true, false);
 	}
 }
 
-- 
2.25.1

