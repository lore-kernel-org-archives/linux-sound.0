Received: from mailgw.kylinos.cn (mailgw.kylinos.cn [124.126.103.232])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9D4D3A1E7E;
	Mon, 29 Dec 2025 09:31:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=124.126.103.232
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767000710; cv=none; b=YuIc/kS382HESCE0J9g1wUoEPvXNQqmyAG2bkWHpYgeesMWwQzzb34SZRKVe8F0HZiZIF96z7FlmNl0d2yL9tnJ5FdzVyZhXmLdBPE7jOqeHZuISLKSSLKHqEiiApcPpl+5UXhJPJ9Swv+mKTIeR+2qmRoxorY5SwnqU+SsfFGQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767000710; c=relaxed/simple;
	bh=h+3fKZApeCVS2+MGs/WDFwBWzx5n5K+4wGb0TtNFovk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=IekzFi8a23fXUMWAoqHzp8fhmUjyh1KwT2E8JOrUDQlTtlLBXopOB9q5upNIxtFG11jllRYxpr/JP3Sr8opp1vcUySAcCiYOJkl0jyPpKMEMGF/OB6sdG5QNd6yfVqjrha1zr3ajG6RftkF0RPpAHDtPhZUJwr6td2RFe9Ahn/o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn; spf=pass smtp.mailfrom=kylinos.cn; arc=none smtp.client-ip=124.126.103.232
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kylinos.cn
X-UUID: 2b78a38ee49911f0a38c85956e01ac42-20251229
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.6,REQID:8c630c37-521e-4e1a-b03c-3b5cde9f9884,IP:0,UR
	L:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:r
	elease,TS:0
X-CID-META: VersionHash:a9d874c,CLOUDID:5a0add8778399c13c88858b61b8d3ab5,BulkI
	D:nil,BulkQuantity:0,Recheck:0,SF:102|898,TC:nil,Content:0|15|50,EDM:-3,IP
	:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,
	LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 2b78a38ee49911f0a38c85956e01ac42-20251229
X-User: zhangheng@kylinos.cn
Received: from kylin-pc.. [(10.44.16.150)] by mailgw.kylinos.cn
	(envelope-from <zhangheng@kylinos.cn>)
	(Generic MTA with TLSv1.3 TLS_AES_256_GCM_SHA384 256/256)
	with ESMTP id 182758152; Mon, 29 Dec 2025 17:31:35 +0800
From: Zhang Heng <zhangheng@kylinos.cn>
To: perex@perex.cz,
	tiwai@suse.com,
	cryolitia.pukngae@linux.dev,
	kuninori.morimoto.gx@renesas.com,
	lhi0729@kaist.ac.kr,
	pav@iki.fi,
	rene@exactco.de
Cc: linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Zhang Heng <zhangheng@kylinos.cn>
Subject: [PATCH] ALSA: usb-audio: Add Line Out to iterm_names
Date: Mon, 29 Dec 2025 17:31:29 +0800
Message-ID: <20251229093130.3202058-1-zhangheng@kylinos.cn>
X-Mailer: git-send-email 2.47.1
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

There are three jack events for a sound card on a desktop computer,
namely Speaker, Headphone, and Desktop Speaker. When both audio
devices are available, users cannot distinguish which audio device
is being used. Can we consider adding Line Out? similar to the HDA
sound card. This can change one of them and reduce the complexity
of the upper layer adaptation of the sound card.

Signed-off-by: Zhang Heng <zhangheng@kylinos.cn>
---
 sound/usb/mixer.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/usb/mixer.c b/sound/usb/mixer.c
index 3af71d42b9b9..bdde4261d994 100644
--- a/sound/usb/mixer.c
+++ b/sound/usb/mixer.c
@@ -615,6 +615,7 @@ static struct iterm_name_combo {
 	{ 0x0305, "Room Speaker" },
 	{ 0x0306, "Com Speaker" },
 	{ 0x0307, "LFE" },
+	{ 0x0308, "Line Out" },
 	{ 0x0600, "External In" },
 	{ 0x0601, "Analog In" },
 	{ 0x0602, "Digital In" },
-- 
2.47.1

