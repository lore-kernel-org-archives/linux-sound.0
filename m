Received: from sipsolutions.net (s3.sipsolutions.net [168.119.38.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B519424D46
	for <linux-sound@vger.kernel.org>; Mon,  7 Sep 2026 08:06:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=168.119.38.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788768392; cv=none; b=Q5kEToSsGKaHbnWtC+M69I1FNExBtUoVrEWOiLBPfIXlWVbgsUNhk6rAp2qtDr4Grux6p4SX22xgmLkfoMYjU60vS9w3XokmQRYuhtzKkfU2EH8rRSe0PLUmd6RgoJLAMgef/t36wdu8mmgJoqAhMVUfmSKhLU3A8XN4pdHrrno=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788768392; c=relaxed/simple;
	bh=ziKA3WmhNy5nafX9Txuwt3PS2W+smP/dpTn9Hzay+OA=;
	h=From:To:Subject:Date:Message-ID:MIME-Version; b=neAfjXD8sHUKjikPEOnnuQdZoBSQnG8EbVsB6qfYydYM2rCtJZ41b0RCI8cia6yvTG0ZupI/ajv3sXtBT5JMv+ybfJMdx5rwq8NJOkPO6/ha5VuoYIAq2j+C+kKXy7G/yOAKoAsJbsfkqsLgZ2IFSKbhYU1u3cSfBvRgsqbhCTo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=permerror header.from=sipsolutions.net; spf=pass smtp.mailfrom=sipsolutions.net; dkim=pass (2048-bit key) header.d=sipsolutions.net header.i=@sipsolutions.net header.b=cF2FU9pk; arc=none smtp.client-ip=168.119.38.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=permerror header.from=sipsolutions.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sipsolutions.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sipsolutions.net header.i=@sipsolutions.net header.b="cF2FU9pk"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=sipsolutions.net; s=mail; h=Content-Transfer-Encoding:MIME-Version:
	Message-ID:Date:Subject:To:From:Content-Type:Sender:Reply-To:Cc:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-To:Resent-Cc:
	Resent-Message-ID:In-Reply-To:References;
	bh=d9VEK/kU3fIQRYr2jpIFPyCJ3d/Spavdn7z1egpVtY4=; t=1788768390; x=1789977990; 
	b=cF2FU9pkoXT+Q/Ye8FavyqtLn4B2ojV2GOERfFxATPwDkoeNMvy4va8Z2WzGrbNo/+HZSJZWdRp
	hBAwq23eU5i1kKN8Gf7Jol2qyZ7pW63JzqOYhvTYE3i5Sko0skvcSFLohAh5nSs/etq0yrmh99ymx
	VVEKYQGGUWO4lQSAKDCh6fMJTHMn5pkqjmFUzntKIVJu+dpRgfvrDlkRaAoU2RZxdtnF0Vi4CDpaK
	ANA7bFKFzXUmQrezbF/zyEewWnErtVavw4VTklzqzY4onzogASn0zQyDV6hrO2z37VQLMd1gc7C84
	Mq+ORuyblEGCSF7fZfsc7um62dO5hO1MGoAg==;
Received: by sipsolutions.net with esmtpsa (TLS1.3:ECDHE_X25519__ECDSA_SECP256R1_SHA256__AES_256_GCM:256)
	(Exim 4.98.2)
	(envelope-from <johannes@sipsolutions.net>)
	id 1x3UN1-00000004Niy-0rks
	for linux-sound@vger.kernel.org;
	Mon, 07 Sep 2026 10:06:27 +0200
From: Johannes Berg <johannes@sipsolutions.net>
To: linux-sound@vger.kernel.org
Subject: [PATCH] ALSA: aoa: orphan the drivers
Date: Mon,  7 Sep 2026 10:06:26 +0200
Message-ID: <20260907080625.105190-2-johannes@sipsolutions.net>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This has been a lie for probably at least decade, I've not had
a machine (at least booted up, I technically still own one)
with an aoa device in ages. Mark the driver accordingly.

Signed-off-by: Johannes Berg <johannes@sipsolutions.net>
---
Alternatively, we could remove the entire entry and just have
it fall back to the SOUND one?
---
 MAINTAINERS | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index fc320b373656..2681a68c0bbc 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -2011,10 +2011,9 @@ S:	Supported
 F:	drivers/rtc/rtc-goldfish.c
 
 AOA (Apple Onboard Audio) ALSA DRIVER
-M:	Johannes Berg <johannes@sipsolutions.net>
 L:	linuxppc-dev@lists.ozlabs.org
 L:	linux-sound@vger.kernel.org
-S:	Maintained
+S:	Orphan
 F:	sound/aoa/
 
 APEX EMBEDDED SYSTEMS STX104 IIO DRIVER
-- 
2.55.0

