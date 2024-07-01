Received: from 6.mo581.mail-out.ovh.net (6.mo581.mail-out.ovh.net [188.165.39.218])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0436D1494C4
	for <linux-sound@vger.kernel.org>; Mon,  1 Jul 2024 12:29:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=188.165.39.218
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719836963; cv=none; b=Sb8a0TaCmf28ETiCYGGtsnvy6ufamkyTWEBa0Owi4g1x+wFADAaizYL6I00D4osgzLuKT9J1uJ1LFezaWYJ8VzuJWqObHvVokfZXA+EW2jCbliE7GuaHN2ylhUmZZXUIU6c+pDmgTzumO2S44k4DDVYNgZyRLt/83WfVUKKWkSY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719836963; c=relaxed/simple;
	bh=Y1Lbxow5DGcwKr4TKz4jkilfNjUfVXsgGE8Q9bp4sXI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=kuIOxMSw3KTYuUpPCSOI9jRhDgQgykRFVDYPvbKzewEu/KOufE6xdL/pVW+KPHTbW8P28UvFrcASdNVBQZyZfaUDmLkiON0QavCtvoNo35qATWZFakO112cTnelmH+4KaLi4+fLjnGp9rPFyPmQwU2uYG3y2zbZUbw3OuLhnTiQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=3mdeb.com; spf=pass smtp.mailfrom=3mdeb.com; arc=none smtp.client-ip=188.165.39.218
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=3mdeb.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=3mdeb.com
Received: from director11.ghost.mail-out.ovh.net (unknown [10.108.25.134])
	by mo581.mail-out.ovh.net (Postfix) with ESMTP id 4WCNcP2sHRz1Jds
	for <linux-sound@vger.kernel.org>; Mon,  1 Jul 2024 11:10:13 +0000 (UTC)
Received: from ghost-submission-6684bf9d7b-psqtj (unknown [10.111.182.10])
	by director11.ghost.mail-out.ovh.net (Postfix) with ESMTPS id EE09D1FEAC;
	Mon,  1 Jul 2024 11:10:12 +0000 (UTC)
Received: from 3mdeb.com ([37.59.142.96])
	by ghost-submission-6684bf9d7b-psqtj with ESMTPSA
	id wy/kM5SOgmbdfgAA/q4WOw
	(envelope-from <michal.kopec@3mdeb.com>); Mon, 01 Jul 2024 11:10:12 +0000
Authentication-Results:garm.ovh; auth=pass (GARM-96R001e11d691c-aa74-473c-8a54-9fd50d88abe0,
                    BB55505EF0EFF3762938E559D9A2D7366EA7DFBD) smtp.auth=michal.kopec@3mdeb.com
X-OVh-ClientIp:213.192.77.249
From: =?UTF-8?q?Micha=C5=82=20Kope=C4=87?= <michal.kopec@3mdeb.com>
To: tiwai@suse.com
Cc: linux-sound@vger.kernel.org
Subject: [PATCH] ALSA: hda/realtek: add quirk for Clevo V5[46]0TU
Date: Mon,  1 Jul 2024 13:10:09 +0200
Message-ID: <20240701111010.1496569-1-michal.kopec@3mdeb.com>
X-Mailer: git-send-email 2.45.1
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Ovh-Tracer-Id: 10274118126681918967
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: 0
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgeeftddrudefgdefhecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecunecujfgurhephffvvefufffkofggtgfgsehtkeertdertdejnecuhfhrohhmpefoihgthhgrlhcumfhophgvtgcuoehmihgthhgrlhdrkhhophgvtgesfehmuggvsgdrtghomheqnecuggftrfgrthhtvghrnhepudeltdffgfeuuefgffeiiedvhfefuedthfffieegtddtfeehkeetvdeggfeuuefgnecukfhppeduvdejrddtrddtrddupddvudefrdduledvrdejjedrvdegledpfeejrdehledrudegvddrleeinecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepuddvjedrtddrtddruddpmhgrihhlfhhrohhmpehmihgthhgrlhdrkhhophgvtgesfehmuggvsgdrtghomhdpnhgspghrtghpthhtohepuddprhgtphhtthhopehlihhnuhigqdhsohhunhgusehvghgvrhdrkhgvrhhnvghlrdhorhhgpdfovfetjfhoshhtpehmohehkedupdhmohguvgepshhmthhpohhuth

Apply quirk to fix combo jack detection on a new Clevo model: V5[46]0TU

Signed-off-by: Michał Kopeć <michal.kopec@3mdeb.com>
---
 sound/pci/hda/patch_realtek.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/pci/hda/patch_realtek.c b/sound/pci/hda/patch_realtek.c
index a696943aec0d..47a019598767 100644
--- a/sound/pci/hda/patch_realtek.c
+++ b/sound/pci/hda/patch_realtek.c
@@ -10426,6 +10426,7 @@ static const struct snd_pci_quirk alc269_fixup_tbl[] = {
 	SND_PCI_QUIRK(0x1558, 0xa600, "Clevo NL50NU", ALC293_FIXUP_SYSTEM76_MIC_NO_PRESENCE),
 	SND_PCI_QUIRK(0x1558, 0xa650, "Clevo NP[567]0SN[CD]", ALC256_FIXUP_SYSTEM76_MIC_NO_PRESENCE),
 	SND_PCI_QUIRK(0x1558, 0xa671, "Clevo NP70SN[CDE]", ALC256_FIXUP_SYSTEM76_MIC_NO_PRESENCE),
+	SND_PCI_QUIRK(0x1558, 0xa763, "Clevo V54x_6x_TU", ALC256_FIXUP_SYSTEM76_MIC_NO_PRESENCE),
 	SND_PCI_QUIRK(0x1558, 0xb018, "Clevo NP50D[BE]", ALC293_FIXUP_SYSTEM76_MIC_NO_PRESENCE),
 	SND_PCI_QUIRK(0x1558, 0xb019, "Clevo NH77D[BE]Q", ALC293_FIXUP_SYSTEM76_MIC_NO_PRESENCE),
 	SND_PCI_QUIRK(0x1558, 0xb022, "Clevo NH77D[DC][QW]", ALC293_FIXUP_SYSTEM76_MIC_NO_PRESENCE),
-- 
2.45.1

