Received: from mailout12.inleed.net (mailout12.inleed.net [185.189.50.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 301CB386576;
	Sun, 29 Mar 2026 18:12:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.189.50.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774807964; cv=none; b=BUpJIKPEwx15qiFJBR7La90mMxWhJxRR6Qad/C6I115NxV0T9HbboM4x6q0SF/KzacNUedBYmE9kf/QSLcWiprTIJKU7Ey9nj+0JiDHBTNtOcFg2Zg8uKiukKX6LQ4L+CkNxR/64l4NWELM60VAkupxOJViHL3aQm5izbRUrgPA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774807964; c=relaxed/simple;
	bh=Mg/ND+twwuQC1v2Pn3gA5t8iunJdJIDnkylOLuLkBl8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=jPVZpMVdLNZDxbhcrGbRMpiM16i/y7vCiZaAs68llns7FUsC6fjHpbzxv5mtKT2GWGgsJHou+Yxez08VBWNLIi6Wyk80Ho6DuyiyusRWCI9UiEO2sFOwG6/2DsikO96XAAT4Zi6gGuDVFUMKbhK2e/sZvsgc7W1hfjZboKw5I0k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=dsmedberg.se; spf=fail smtp.mailfrom=dsmedberg.se; dkim=pass (2048-bit key) header.d=dsmedberg.se header.i=@dsmedberg.se header.b=CrW82bf/; arc=none smtp.client-ip=185.189.50.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=dsmedberg.se
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=dsmedberg.se
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=dsmedberg.se header.i=@dsmedberg.se header.b="CrW82bf/"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=dsmedberg.se; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date
	:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=yQ4F9qzdcxJrezgHDJ+X93dkyPOJ2Qy8aHboOym6pw8=; b=CrW82bf/YAu/xv84upHQIlZFOd
	vO/0weIVSFYKlGEm0rA6314BS1sbUnGDJxjr/mUHQsUnflmI8S7Gcf87/lIVVYL044fljSFqdmP7Z
	gef0h8KhKwIwebwjECokD/3UQ1+CTOv464dygPejpqffBdj5x+TyA+9STU1AceZbJc19EB9cUxzRa
	rTQcpCzBoRQJe6ZVN9tJIrAECY1WgqeqxpIKx3ZwBQE2Lzy5HXTVQVtB6CUdgSzrst+822ZIdybjR
	Td7/CgaVsWun4eUYs83F8nnmvJB+HDqn3lGQ4WYvrENZ7tDAki+upmhyplEHeoNzS1yW83GI1ahaf
	1+N+3vnw==;
Received: from mail.inleed.com ([86.107.103.84])
	by ns12.inleed.net with esmtpa (Exim 4.99.1)
	(envelope-from <dag@dsmedberg.se>)
	id 1w6tZZ-0000000AJdK-0HWg;
	Sun, 29 Mar 2026 19:05:13 +0200
From: Dag Smedberg <dag@dsmedberg.se>
To: tiwai@suse.com
Cc: perex@perex.cz,
	g@b4.vu,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Dag Smedberg <dag@dsmedberg.se>
Subject: [PATCH] ALSA: usb-audio: Exclude Scarlett Solo 1st Gen from SKIP_IFACE_SETUP
Date: Sun, 29 Mar 2026 19:04:20 +0200
Message-ID: <20260329170420.4122-1-dag@dsmedberg.se>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authenticated-Id: dag@dsmedberg.se

Same issue that the Scarlett 2i2 1st Gen had:
QUIRK_FLAG_SKIP_IFACE_SETUP causes distorted audio on the
Scarlett Solo 1st Gen (1235:801c).

Fixes: 38c322068a26 ("ALSA: usb-audio: Add QUIRK_FLAG_SKIP_IFACE_SETUP")
Reported-by: Dag Smedberg <dag@dsmedberg.se>
Tested-by: Dag Smedberg <dag@dsmedberg.se>
Signed-off-by: Dag Smedberg <dag@dsmedberg.se>
---
 sound/usb/quirks.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/usb/quirks.c b/sound/usb/quirks.c
index 1f82e9e02d4b..df9c18dd6c30 100644
--- a/sound/usb/quirks.c
+++ b/sound/usb/quirks.c
@@ -2433,6 +2433,7 @@ static const struct usb_audio_quirk_flags_table quirk_flags_table[] = {
 		   QUIRK_FLAG_VALIDATE_RATES),
 	DEVICE_FLG(0x1235, 0x8006, 0), /* Focusrite Scarlett 2i2 1st Gen */
 	DEVICE_FLG(0x1235, 0x800a, 0), /* Focusrite Scarlett 2i4 1st Gen */
+	DEVICE_FLG(0x1235, 0x801c, 0), /* Focusrite Scarlett Solo 1st Gen */
 	VENDOR_FLG(0x1235, /* Focusrite Novation */
 		   QUIRK_FLAG_SKIP_CLOCK_SELECTOR |
 		   QUIRK_FLAG_SKIP_IFACE_SETUP),
-- 
2.53.0

