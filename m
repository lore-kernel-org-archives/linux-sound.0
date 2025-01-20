Received: from mout-p-103.mailbox.org (mout-p-103.mailbox.org [80.241.56.161])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4A2D383;
	Mon, 20 Jan 2025 01:10:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.161
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737335442; cv=none; b=JP04gU7GhcGoq2aAgXsHoKcOAEq1sjTgHc4MuPxEhx1A3tZhHbE/5Ow70MSn/XvWZmfRZ0lSG9Lhhgl+fh0BDac0ax6nAqH/Zd/UNbWfoo2Jo+tbdxDCXBMCWdFQWN4uDjY/MlqPle8L/vwESAXeuGHX0S2eInK5Iw/G9peXufY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737335442; c=relaxed/simple;
	bh=/bpPCspOvkPhySt5OSL5XEhorcN2ISyMUpPvmdUboz0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=F29R0h1O2E2RsVnIbZSS/KGTjxKikjiChkn/kFZawBOg1vJcXr3PxN3LJqIWJ822+o5a6MgDBxYEqvxLlCNX+/adOxkMHQhifRoU18JWwjNN/DAxPOzVSMqlN7YbuIQNQn8Usoe+6Q+YbPozSmopRYHAJI8E3ZUJuNtbysjmJm8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ethancedwards.com; spf=pass smtp.mailfrom=ethancedwards.com; dkim=pass (2048-bit key) header.d=ethancedwards.com header.i=@ethancedwards.com header.b=FZ0ng7iJ; arc=none smtp.client-ip=80.241.56.161
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ethancedwards.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ethancedwards.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ethancedwards.com header.i=@ethancedwards.com header.b="FZ0ng7iJ"
Received: from smtp202.mailbox.org (smtp202.mailbox.org [10.196.197.202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-103.mailbox.org (Postfix) with ESMTPS id 4Ybshq2V1qz9shX;
	Mon, 20 Jan 2025 02:10:35 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ethancedwards.com;
	s=MBO0001; t=1737335435;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type;
	bh=RcNOZ1AyszfruTlUBQa7gdtLqq7/VNQwGRJlXap0c7Y=;
	b=FZ0ng7iJ62E9O4LM/iTdz9N1lHGCO4BH2gQ141CJdJQSNTi3PiVtuMXnQjP4dQLtixUsKW
	SerWHbjY4x1D5I2L5JZws80OgmOMdThUFT8hHleBbhiveehzZkGckj+GFDLRSyJYcFxs0A
	lXQMTtxPSYWhGEAcsN2bbMQlqTJZiRj9U7xL4KDWeZaDAdii6DPDrKo9lUaxU6LfU7uCX/
	2XHwdRPhY8Hu+dnJBwHJd+1OgGTumW+MdfeGdpULT05jxIr/xLYgUEqy10RfhEe+EK9Ttz
	sw/xnvileFkitj+RotbdrQQ1ZmUJM4ZISGAGWC66EWOK19TbysXkgrxl4y/kIA==
Date: Sun, 19 Jan 2025 20:10:30 -0500
From: Ethan Carter Edwards <ethan@ethancedwards.com>
To: David Laight <david.laight.linux@gmail.com>
Cc: tiwai@suse.com, perex@perex.cz, arnd@arndb.de, 
	linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org, ryan_richards@creativelabs.com, 
	wychay@ctl.creative.com, Kuan-Wei Chiu <visitorckw@gmail.com>
Subject: [PATCH v3] ALSA: ctxfi: Simplify dao_clear_{left,right}_input()
 functions
Message-ID: <x3glr6fetk7d7hlqimkv6g5krz2oibe7yusms3d7zk4ofrhlrx@75avihssncc5>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

There was a lote of code duplication in the dao_clear_left_input() and
dao_clear_right_input() functions. A new function, dao_clear_input(),
was created and now the left and right functions call it instead of
repeating themselves.

Link: https://lore.kernel.org/lkml/NyKCr2VHK_xCQDwNxFKKx2LVd2d_AC2f2j4eAvnD9uRPtb50i2AruCLOp6mHxsGiyYJ0Tgd3Z50Oy1JTi5gPhjd2WQM2skrv7asp3fLl8HU=@ethancedwards.com/
Signed-off-by: Ethan Carter Edwards <ethan@ethancedwards.com>
---
 v3: remove temp variables
 v2: email client woes
 sound/pci/ctxfi/ctdaio.c | 48 +++++++++++-----------------------------
 1 file changed, 13 insertions(+), 35 deletions(-)

diff --git a/sound/pci/ctxfi/ctdaio.c b/sound/pci/ctxfi/ctdaio.c
index 83aaf9441ef3..9993b02d2968 100644
--- a/sound/pci/ctxfi/ctdaio.c
+++ b/sound/pci/ctxfi/ctdaio.c
@@ -211,52 +211,30 @@ static int dao_set_right_input(struct dao *dao, struct rsc *input)
 	return 0;
 }
 
-static int dao_clear_left_input(struct dao *dao)
+static int dao_clear_input(struct dao *dao, unsigned int start, unsigned int end)
 {
-	struct imapper *entry;
-	struct daio *daio = &dao->daio;
-	int i;
+	unsigned int i;
 
-	if (!dao->imappers[0])
+	if (!dao->imappers[start])
 		return 0;
-
-	entry = dao->imappers[0];
-	dao->mgr->imap_delete(dao->mgr, entry);
-	/* Program conjugate resources */
-	for (i = 1; i < daio->rscl.msr; i++) {
-		entry = dao->imappers[i];
-		dao->mgr->imap_delete(dao->mgr, entry);
+	for (i = start; i < end; i++) {
+		dao->mgr->imap_delete(dao->mgr, dao->imappers[i]);
 		dao->imappers[i] = NULL;
 	}
 
-	kfree(dao->imappers[0]);
-	dao->imappers[0] = NULL;
-
 	return 0;
 }
 
-static int dao_clear_right_input(struct dao *dao)
-{
-	struct imapper *entry;
-	struct daio *daio = &dao->daio;
-	int i;
 
-	if (!dao->imappers[daio->rscl.msr])
-		return 0;
-
-	entry = dao->imappers[daio->rscl.msr];
-	dao->mgr->imap_delete(dao->mgr, entry);
-	/* Program conjugate resources */
-	for (i = 1; i < daio->rscr.msr; i++) {
-		entry = dao->imappers[daio->rscl.msr + i];
-		dao->mgr->imap_delete(dao->mgr, entry);
-		dao->imappers[daio->rscl.msr + i] = NULL;
-	}
-
-	kfree(dao->imappers[daio->rscl.msr]);
-	dao->imappers[daio->rscl.msr] = NULL;
+static int dao_clear_left_input(struct dao *dao)
+{
+	return dao_clear_input(dao, 0, dao->daio.rscl.msr);
+}
 
-	return 0;
+static int dao_clear_right_input(struct dao *dao)
+{
+	return dao_clear_input(dao, dao->daio.rscl.msr,
+			dao->daio.rscl.msr + dao->daio.rscr.msr);
 }
 
 static const struct dao_rsc_ops dao_ops = {
-- 
2.48.0

