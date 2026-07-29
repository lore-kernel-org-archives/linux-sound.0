Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19EFC224AF9;
	Wed, 29 Jul 2026 07:10:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=117.135.210.2
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785309011; cv=none; b=i00o73TGELPN/Qa87PCuvmcBzcjS1UK6NXvE9aRvPp70PGDfDY4X0m9d7kuVhEe17U0AEWM883kv7U7mvAsgNKkI+uMKIDHqjZkCSQqovZAVdKqq6TJNfIl9vwHOmlsjj2tXGVTV+MuFIeoIcQmj/CiRaupjuXF2JbSC+hKGEok=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785309011; c=relaxed/simple;
	bh=9YSh4j3lm7QyGRndiBX50EApTZia3XIe6nWz9ALZ5Nw=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=r3adzz3Sa0zaRA5Y4UOU2ZSud25tBfqgDWC02DDw31NLDjeQPy/hlc3+pCuLry8wkPXXYjp9wOZyzyH1J6IUYDVxsah2pAW+L45rABGmjjDgvH/f+SWXJajqsgi1Ul9NgZx7Tv2B7RubfRlJWnEwp/TQGmP/7okF+bAncBrN2B4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=NfWbYznD; arc=none smtp.client-ip=117.135.210.2
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="NfWbYznD"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version; bh=eY
	anbGYSKKEmdj/9bCAne7Gd5RrBq7noI9PupdRMynU=; b=NfWbYznD3zSb9evRDf
	e9rGE0yxdZ4urACcSCIH2VFAG7JRaZiw6WYNJazQSaHNJv0ji1r729wJu+tL24wU
	Hlo7Dtpi9Fkg9nWedWOkDKNDgpkaqrrcmwlKe4t1SRNwpu0YAx+wGs9HkCIOh6dW
	pWN4WXijUlJnNJb6/7Ki047Xk=
Received: from localhost.localdomain (unknown [])
	by gzga-smtp-mtada-g1-4 (Coremail) with SMTP id _____wDnBgwwp2lqxlafMg--.58197S2;
	Wed, 29 Jul 2026 15:09:38 +0800 (CST)
From: wangdich9700@163.com
To: tiwai@suse.com,
	broonie@kernel.org,
	wangdich9700@163.com
Cc: linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	wangdicheng@kylinos.cn
Subject: [PATCH 1/2] ALSA: hda/conexant: Fix EAPD pin array overflow
Date: Wed, 29 Jul 2026 15:09:34 +0800
Message-Id: <20260729070935.548050-1-wangdich9700@163.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:_____wDnBgwwp2lqxlafMg--.58197S2
X-Coremail-Antispam: 1Uf129KBjvdXoW7Gr4rCF1kWry3XF1kXFW5Wrg_yoWDZrc_Gw
	s2vw40v3Wjyr4xCrWkKF4Yy3yxZrWrCFW09ryvyrZrGasrGF4YyryI9Fn8ZFn8K3s7XF9x
	X3Zaga47uFy7ZjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUvcSsGvfC2KfnxnUUI43ZEXa7sREk9KtUUUUU==
X-CM-SenderInfo: pzdqwv5lfkmliqq6il2tof0z/xtbC6BLqOmpppzJF9AAA3N

From: wangdicheng <wangdicheng@kylinos.cn>

The bounds check in cx_auto_parse_eapd() happens after the write,
so when a codec has more than 4 EAPD pins the 5th one gets written
to eapds[4] which is past the end of the array and clobbers the
adjacent dynamic_eapd field.

Swap the check and the write.

Signed-off-by: wangdicheng <wangdicheng@kylinos.cn>
---
 sound/hda/codecs/conexant.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/hda/codecs/conexant.c b/sound/hda/codecs/conexant.c
index 40da2832ba66..e7a2a073d22c 100644
--- a/sound/hda/codecs/conexant.c
+++ b/sound/hda/codecs/conexant.c
@@ -100,9 +100,9 @@ static void cx_auto_parse_eapd(struct hda_codec *codec)
 			continue;
 		if (!(snd_hda_query_pin_caps(codec, nid) & AC_PINCAP_EAPD))
 			continue;
-		spec->eapds[spec->num_eapds++] = nid;
 		if (spec->num_eapds >= ARRAY_SIZE(spec->eapds))
 			break;
+		spec->eapds[spec->num_eapds++] = nid;
 	}
 
 	/* NOTE: below is a wild guess; if we have more than two EAPDs,
-- 
2.25.1

