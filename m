Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCA4C392C23;
	Tue, 10 Mar 2026 02:37:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=117.135.210.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773110245; cv=none; b=WRTP0lsgo9gQOR+lQZbb8qWZUupe7kvBa0axQe/XJbBIPb5I8ciNU719T2Z1qxukgCH6Ibys7FT3bpL6t6cI4gyktDBL6atCZh310x1xktqmIl7nTV558Hw3D9YRD8tt9r1K4rcDDHv82XPLXVLF51gzYpzh0IjUVyn31JrU2Xc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773110245; c=relaxed/simple;
	bh=DIA3YWVidP03/0RxJHHWW8GMkMV/yTdZ6P5PdvWazp4=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=JO6ynBASSGp1qooMiJZ2/8S+LLlVFi71b8EzrNaTv87I4SgdC/09rQUT+0aLgIudCSDAgl75fj1V5DarxSnCSVA1L5e99wsAnWJaWKBOdP+TxkN64Uv0gxjmR6UWowI1CN77vNr4SnbRVks3O0PTxzEof/4bqVfkvcVT2hVvBNQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=eHokHIX0; arc=none smtp.client-ip=117.135.210.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="eHokHIX0"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version; bh=Xz
	GfF9uTO7/BdJLhrIT1lGfOoSlPLTyCgNfRzjWqUeU=; b=eHokHIX0EAo0y20GIs
	g11JOpWBpt37eSiqQaPxvJ3vbac3pEGQ4KU8Kjqf4o2pjavmsAZUKEJhVVCQzlSx
	aAGZHkWWMfLSniuFuHwyYZQpH5n20ISBwGA+Nz/hpbZtwnQoHDsOvfFE+R2q0pUt
	EHEv/EKdDMBdVHW61jAsjVeAk=
Received: from localhost.localdomain (unknown [])
	by gzsmtp4 (Coremail) with SMTP id PygvCgCnBavCg69pFb_4Rg--.151S2;
	Tue, 10 Mar 2026 10:36:53 +0800 (CST)
From: wangdich9700@163.com
To: bo.liu@senarytech.com,
	perex@perex.cz,
	tiwai@suse.com
Cc: linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	wangdicheng <wangdicheng@kylinos.cn>
Subject: [PATCH] ALSA: hda/senary: Fix beep error handling and optimize EAPD  switching
Date: Tue, 10 Mar 2026 10:36:49 +0800
Message-Id: <20260310023649.155858-1-wangdich9700@163.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:PygvCgCnBavCg69pFb_4Rg--.151S2
X-Coremail-Antispam: 1Uf129KBjvJXoW7tF48JFW8XrWfXrWxGw4fAFb_yoW8ZFyrpF
	4DCryrKF93JF4Fyr1rJw4ku3W3WayrWFW3C3y5K34IyFs0yrW8Xa4UK342qa1jgFWI93W2
	vFy2vFWxA3Z8AaDanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07jOtxhUUUUU=
X-CM-SenderInfo: pzdqwv5lfkmliqq6il2tof0z/xtbC6AVYp2mvg8UIxgAA3c

From: wangdicheng <wangdicheng@kylinos.cn>

This patch addresses a potential state inconsistency bug and optimizes
runtime performance:

1. Fix error handling in set_beep_amp():
   Previously, beep_nid was assigned before adding kcontrols. If
   kcontrol creation failed, the function returned error but left
   beep_nid set, causing inconsistent driver state. Moved the
   assignment to the end of the function.

2. Optimize senary_auto_turn_eapd():
   Removed the redundant snd_hda_query_pin_caps() check inside the
   loop. The target pins are sourced from spec->eapds, which is
   strictly filtered during the initial parse phase. Checking
   capabilities again during every mute/unmute hook is unnecessary
   overhead.

Signed-off-by: wangdicheng <wangdicheng@kylinos.cn>
---
 sound/hda/codecs/senarytech.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/sound/hda/codecs/senarytech.c b/sound/hda/codecs/senarytech.c
index 6239a25bb8f3..61b0dcf76305 100644
--- a/sound/hda/codecs/senarytech.c
+++ b/sound/hda/codecs/senarytech.c
@@ -50,7 +50,6 @@ static int set_beep_amp(struct senary_spec *spec, hda_nid_t nid,
 	unsigned int beep_amp = HDA_COMPOSE_AMP_VAL(nid, 1, idx, dir);
 	int i;
 
-	spec->gen.beep_nid = nid;
 	for (i = 0; i < ARRAY_SIZE(senary_beep_mixer); i++) {
 		knew = snd_hda_gen_add_kctl(&spec->gen, NULL,
 					    &senary_beep_mixer[i]);
@@ -58,6 +57,8 @@ static int set_beep_amp(struct senary_spec *spec, hda_nid_t nid,
 			return -ENOMEM;
 		knew->private_value = beep_amp;
 	}
+
+	spec->gen.beep_nid = nid;
 	return 0;
 }
 
@@ -99,10 +100,9 @@ static void senary_auto_turn_eapd(struct hda_codec *codec, int num_pins,
 	int i;
 
 	for (i = 0; i < num_pins; i++) {
-		if (snd_hda_query_pin_caps(codec, pins[i]) & AC_PINCAP_EAPD)
-			snd_hda_codec_write(codec, pins[i], 0,
-					    AC_VERB_SET_EAPD_BTLENABLE,
-					    on ? 0x02 : 0);
+		snd_hda_codec_write(codec, pins[i], 0,
+				    AC_VERB_SET_EAPD_BTLENABLE,
+				    on ? 0x02 : 0);
 	}
 }
 
-- 
2.25.1

