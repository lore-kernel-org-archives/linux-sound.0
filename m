Received: from e3i314.smtp2go.com (e3i314.smtp2go.com [158.120.85.58])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC9841C700D
	for <linux-sound@vger.kernel.org>; Fri, 25 Jul 2025 15:17:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=158.120.85.58
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753456675; cv=none; b=C+ybecLg07gs2QSesuGuCAN9ayoIjRbNOfSRGMgz5zoKMsDPBfj2A3fF5aNRA95ZEW6LXaDMuf+PE2V8edZofPxrgtpBn8KbMjBPjsaxCmkcnAdpZYHJu3ILu1dwwnGn2OyEqGNBDGbSYgxXOk2GrwF0p8PGdYUu91kM+OpV/hA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753456675; c=relaxed/simple;
	bh=woIP6dtlEzDY0l3M0VQ4FGnewBR2yOUwHMm735zXzLE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Ut9deuB8wnWa6c/8Hh2+82x4bXR6xJW9IjCASGn0y0jeiqcaLwWFWhZjDOG5hqy9Q2OYpl2MBEvU8gK2xl2L/BqHi7W42dO+xM6E+gMZotosC2UvMSg1mo64ubmeN1olWr87/DCzcz2CDA/XvDkgwPK0iwfumZkxc9NvZxXyjpg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=medip.dev; spf=pass smtp.mailfrom=em1255854.medip.dev; dkim=pass (2048-bit key) header.d=smtpservice.net header.i=@smtpservice.net header.b=bzqhLI/3; dkim=pass (2048-bit key) header.d=medip.dev header.i=@medip.dev header.b=Xg1owPYJ; arc=none smtp.client-ip=158.120.85.58
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=medip.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=em1255854.medip.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=smtpservice.net header.i=@smtpservice.net header.b="bzqhLI/3";
	dkim=pass (2048-bit key) header.d=medip.dev header.i=@medip.dev header.b="Xg1owPYJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=smtpservice.net;
 i=@smtpservice.net; q=dns/txt; s=a1-4; t=1753456671; h=feedback-id :
 x-smtpcorp-track : date : message-id : to : subject : from : reply-to
 : sender : list-unsubscribe : list-unsubscribe-post;
 bh=1GYi97gw+l8m43s+LjoRWyK8qB47vHIEsv3nJylYdBM=;
 b=bzqhLI/3CTX4Xjd+TCnKEvNe2KrkkXR10hLBAVhLwZPQOaLgdY5en5Rdq+lSGoGR8/ikZ
 VOC0xL0ka77XW5OgrSoBsDIN81zVw5qkVh+YuGvBbtBYwT/BdLyg3acJlVNaUjBoxukoHsi
 itpSqVWUP9//RdhkJ9K/fJ34ntR5UyJpLhJbCpGCa4QtzBTH7J8nrvrqPgauAYxAA8qQt81
 gaDlfNud91JJLzNHwFPcB5EIlO5SnMcuPWr5tbHO6Dz93O/2l8cO8+Ugd0BCs3jkuWiZbZK
 orx7hjrMAgUjc++QoVgI8RE+zHxPGuE4fx7WQxrndLayjpIZOpQIsD0gEiBw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=medip.dev;
 i=@medip.dev; q=dns/txt; s=s1255854; t=1753456671; h=from : subject :
 to : message-id : date;
 bh=1GYi97gw+l8m43s+LjoRWyK8qB47vHIEsv3nJylYdBM=;
 b=Xg1owPYJV30yWQdBpXy59nYQdk4bl3XdvZbrKmmUQpExrGu7dD72mgFud7/AqdvHwYvlv
 C0CoHt/XbVkIEbSdSrQDn1mO9o2NStm1C4+qpQi/ApHr2sd5wkM5GiSombUOgT9XEa8MPQi
 Ztm5YkKkeWgr3tHFz/jhduHXDyrq4bGcI6A/ZHetZVF8dDSmWL/giSA9Jg8qmeK9teS3icT
 a+GdW83tQCe+jCdc9O6hH9a/M+CiTlErZ0hOs1FtFXvn5PgrUFNq36+ZdJo0SJZemA3EAh5
 dzBTcTQ7qepVQp6dq9Jun7gtyRSkXz9hZ0mkheVXEVcGfwJ7c45RlltN7gsg==
Received: from [10.152.250.198] (helo=vilez)
	by smtpcorp.com with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	(Exim 4.98.1-S2G)
	(envelope-from <edip@medip.dev>)
	id 1ufKB7-FnQW0hPr5lr-h1v1;
	Fri, 25 Jul 2025 15:17:46 +0000
From: edip@medip.dev
To: perex@perex.cz,
	tiwai@suse.com
Cc: linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Edip Hazuri <edip@medip.dev>,
	stable@vger.kernel.org
Subject: [PATCH v2] ALSA: hda/realtek - Fix mute LED for HP Victus 16-r1xxx
Date: Fri, 25 Jul 2025 18:14:37 +0300
Message-ID: <20250725151436.51543-2-edip@medip.dev>
X-Mailer: git-send-email 2.50.1
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Report-Abuse: Please forward a copy of this message, including all headers, to <abuse-report@smtp2go.com>
Feedback-ID: 1255854m:1255854ay30w_v:1255854s7LIr8FS_w
X-smtpcorp-track: VIEx4yskT9TE.6QxtTrHyMukk.tfbveAM5o0A

From: Edip Hazuri <edip@medip.dev>

The mute led on this laptop is using ALC245 but requires a quirk to work
This patch enables the existing quirk for the device.

Tested on Victus 16-r1xxx Laptop. The LED behaviour works
as intended.

v2:
- adapt the HD-audio code changes and rebase on for-next branch of tiwai/sound.git
- link to v1: https://lore.kernel.org/linux-sound/20250724210756.61453-2-edip@medip.dev/

Cc: <stable@vger.kernel.org>
Signed-off-by: Edip Hazuri <edip@medip.dev>
---
 sound/hda/codecs/realtek/alc269.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/hda/codecs/realtek/alc269.c b/sound/hda/codecs/realtek/alc269.c
index 05019fa73..33ef08d25 100644
--- a/sound/hda/codecs/realtek/alc269.c
+++ b/sound/hda/codecs/realtek/alc269.c
@@ -6580,6 +6580,7 @@ static const struct hda_quirk alc269_fixup_tbl[] = {
 	SND_PCI_QUIRK(0x103c, 0x8c91, "HP EliteBook 660", ALC236_FIXUP_HP_GPIO_LED),
 	SND_PCI_QUIRK(0x103c, 0x8c96, "HP", ALC236_FIXUP_HP_MUTE_LED_MICMUTE_VREF),
 	SND_PCI_QUIRK(0x103c, 0x8c97, "HP ZBook", ALC236_FIXUP_HP_MUTE_LED_MICMUTE_VREF),
+	SND_PCI_QUIRK(0x103c, 0x8c99, "HP Victus 16-r1xxx (MB 8C99)", ALC245_FIXUP_HP_MUTE_LED_COEFBIT),
 	SND_PCI_QUIRK(0x103c, 0x8c9c, "HP Victus 16-s1xxx (MB 8C9C)", ALC245_FIXUP_HP_MUTE_LED_COEFBIT),
 	SND_PCI_QUIRK(0x103c, 0x8ca1, "HP ZBook Power", ALC236_FIXUP_HP_GPIO_LED),
 	SND_PCI_QUIRK(0x103c, 0x8ca2, "HP ZBook Power", ALC236_FIXUP_HP_GPIO_LED),
-- 
2.50.1

